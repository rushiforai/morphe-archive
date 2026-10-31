package app.badfella.extension.ticktick;

import android.app.job.JobInfo;
import android.app.job.JobScheduler;
import android.content.ComponentName;
import android.content.Context;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.net.Uri;
import android.os.Build;
import android.os.PersistableBundle;
import android.provider.DocumentsContract;

import app.badfella.extension.ticktick.locallists.*;

import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.concurrent.atomic.AtomicBoolean;

/** Local document-tree backups. No network requests, credentials or broad storage grants. */
public final class LocalBackupManager {
    public static final int JOB_ID = 0x42464c53;
    private static final String NAMESPACE = "badfella-local-backups";
    private LocalBackupManager() { }

    static SharedPreferences prefs(Context context, String profile) {
        if (profile == null || !profile.matches("[0-9a-f]{64}")) {
            throw new IllegalArgumentException("Invalid backup account");
        }
        return context.getSharedPreferences("badfella_backup_" + profile, Context.MODE_PRIVATE);
    }

    public static State state(Context context, AccountScope account) {
        return new State(prefs(context, account.tag()));
    }

    public static void configure(Context context, AccountScope account, Uri folder, long minutes)
            throws Exception {
        BackupPolicy.validateInterval(minutes);
        TickTickBridge.create(context).verifyAccount(account);
        SharedPreferences p = prefs(context, account.tag());
        SharedPreferences.Editor edit = p.edit().putLong("minutes", minutes)
                .putLong("revision", System.currentTimeMillis()).remove("error");
        if (folder != null) {
            if (!"content".equals(folder.getScheme())
                    || !"com.android.externalstorage.documents".equals(folder.getAuthority())
                    || !DocumentsContract.isTreeUri(folder)) {
                throw new IOException("Choose a folder in Internal storage or on an SD card");
            }
            Uri document = DocumentsContract.buildDocumentUriUsingTree(folder,
                    DocumentsContract.getTreeDocumentId(folder));
            String name = "Selected local folder";
            try (Cursor cursor = context.getContentResolver().query(document,
                    new String[]{DocumentsContract.Document.COLUMN_DISPLAY_NAME,
                            DocumentsContract.Document.COLUMN_MIME_TYPE,
                            DocumentsContract.Document.COLUMN_FLAGS}, null, null, null)) {
                if (cursor == null || !cursor.moveToFirst()
                        || !DocumentsContract.Document.MIME_TYPE_DIR.equals(cursor.getString(1))
                        || (cursor.getInt(2) & DocumentsContract.Document.FLAG_DIR_SUPPORTS_CREATE) == 0) {
                    throw new IOException("This folder cannot create backups. Choose another local folder.");
                }
                name = cursor.getString(0);
            }
            edit.putString("folder", folder.toString()).putString("folderName", name);
        } else if (minutes != 0 && p.getString("folder", "").isEmpty()) {
            throw new IOException("Choose a local backup folder first");
        }
        if (!edit.commit()) throw new IOException("Could not save backup settings");
        ensureScheduled(context, account);
    }

    private static JobScheduler scheduler(Context context) {
        JobScheduler scheduler = (JobScheduler) context.getSystemService(Context.JOB_SCHEDULER_SERVICE);
        return Build.VERSION.SDK_INT >= 34 ? scheduler.forNamespace(NAMESPACE) : scheduler;
    }

    public static void ensureScheduled(Context context, AccountScope account) throws IOException {
        State state = state(context, account);
        JobScheduler scheduler = scheduler(context);
        JobInfo previous = scheduler.getPendingJob(JOB_ID);
        ComponentName service = new ComponentName(context, LocalBackupJobService.class);
        if (state.minutes == 0) { scheduler.cancel(JOB_ID); return; }
        if (state.folder == null) throw new IOException("Choose a local backup folder first");
        if (previous != null && service.equals(previous.getService())
                && account.tag().equals(previous.getExtras().getString("profile"))
                && state.revision == previous.getExtras().getLong("revision")) return;
        PersistableBundle extras = new PersistableBundle();
        extras.putString("profile", account.tag());
        extras.putLong("revision", state.revision);
        JobInfo job = new JobInfo.Builder(JOB_ID, service)
                .setExtras(extras).setPeriodic(state.minutes * 60_000L)
                .setRequiresBatteryNotLow(true).setRequiresStorageNotLow(true)
                .setPersisted(true).build();
        if (scheduler.schedule(job) != JobScheduler.RESULT_SUCCESS) {
            recordFailure(context, account.tag(), "Android could not schedule backups. Try again.");
            throw new IOException("Android could not schedule backups. Try again.");
        }
    }

    public static LocalListsBackup.ExportResult createArchive(TickTickBridge bridge,
            LocalListsStore store, AccountScope account) throws Exception {
        bridge.verifyAccount(account);
        final Map<String, TickTickBridge.TaskData> tasks = new HashMap<>();
        for (TickTickBridge.TaskData task : bridge.loadAllTasks(account)) tasks.put(task.getSid(), task);
        LocalListsBackup.ExportResult result = store.transaction(
                new LocalListsStore.TransactionBody<LocalListsBackup.ExportResult>() {
            @Override public LocalListsBackup.ExportResult run() throws Exception {
                List<TaskSnapshot> snapshots = new ArrayList<>();
                for (Membership member : store.memberships(account.tag())) {
                    TickTickBridge.TaskData task = tasks.get(member.getTaskSid());
                    if (task != null) snapshots.add(bridge.snapshotOf(task));
                }
                return LocalListsBackup.export(account, store, snapshots, System.currentTimeMillis());
            }
        });
        bridge.verifyAccount(account);
        return result;
    }

    /** One unique file per successful run; a canceled/failed run removes only its own partial file. */
    public static synchronized LocalListsBackup.ExportResult writeToFolder(Context context,
            AccountScope account, AtomicBoolean cancelled, boolean scheduled, long revision) throws Exception {
        State config = state(context, account);
        if (config.folder == null) throw new IOException("Choose a local backup folder first");
        TickTickBridge bridge = TickTickBridge.create(context);
        bridge.verifyAccount(account);
        LocalListsBackup.ExportResult result;
        LocalListsStore store = new LocalListsStore(new LocalListsOpenHelper(context));
        try { result = createArchive(bridge, store, account); }
        finally { store.close(); }
        checkActive(context, account, bridge, cancelled, scheduled, revision);
        Uri parent = DocumentsContract.buildDocumentUriUsingTree(config.folder,
                DocumentsContract.getTreeDocumentId(config.folder));
        String name = "badfella-" + (scheduled ? "scheduled-" : "backup-")
                + new SimpleDateFormat("yyyyMMdd-HHmmss", Locale.US).format(new Date())
                + "-" + UUID.randomUUID().toString().substring(0, 8) + ".json";
        Uri outputUri = DocumentsContract.createDocument(context.getContentResolver(), parent,
                "application/octet-stream", name + ".partial");
        if (outputUri == null) throw new IOException("Could not create a backup in this folder");
        boolean completed = false;
        try {
            byte[] bytes = result.getJson().getBytes("UTF-8");
            try (OutputStream output = context.getContentResolver().openOutputStream(outputUri, "w")) {
                if (output == null) throw new IOException("Could not open the backup file");
                for (int offset = 0; offset < bytes.length; offset += 8192) {
                    checkActive(context, account, bridge, cancelled, scheduled, revision);
                    output.write(bytes, offset, Math.min(8192, bytes.length - offset));
                }
                output.flush();
            }
            checkActive(context, account, bridge, cancelled, scheduled, revision);
            Uri published = DocumentsContract.renameDocument(context.getContentResolver(), outputUri, name);
            if (published == null) throw new IOException("Could not finalize the backup file");
            outputUri = published;
            checkActive(context, account, bridge, cancelled, scheduled, revision);
            completed = true;
            recordSuccess(context, account, result, scheduled);
            return result;
        } finally {
            if (!completed) {
                try { DocumentsContract.deleteDocument(context.getContentResolver(), outputUri); }
                catch (Exception ignored) { /* Never delete a previous successful backup. */ }
            }
        }
    }

    private static void checkActive(Context context, AccountScope account, TickTickBridge bridge,
            AtomicBoolean cancelled, boolean scheduled, long revision) throws Exception {
        if (cancelled.get() || Thread.currentThread().isInterrupted()) throw new InterruptedException();
        bridge.verifyAccount(account);
        State current = state(context, account);
        if (scheduled && (current.minutes == 0 || current.revision != revision)) {
            throw new InterruptedException("Backup settings changed");
        }
    }

    public static void recordSuccess(Context context, AccountScope account,
            LocalListsBackup.ExportResult result, boolean scheduled) throws IOException {
        int omissions = result.getOmittedFields().size() + result.getMissingSnapshotCount()
                + result.getAttachmentMetadataCount();
        long now = System.currentTimeMillis();
        SharedPreferences.Editor edit = prefs(context, account.tag()).edit().putLong("lastSuccess", now)
                .putBoolean("lastScheduled", scheduled).putInt("omissions", omissions)
                .remove("error");
        if (scheduled) edit.putLong("lastScheduledTime", now);
        if (!edit.commit()) throw new IOException("Could not save backup status");
    }

    public static void recordFailure(Context context, String profile, String message) {
        prefs(context, profile).edit().putString("error", message).commit();
    }

    public static final class State {
        public final long minutes, revision, lastSuccess, lastScheduledTime;
        public final Uri folder;
        public final String folderName, error;
        public final boolean lastScheduled;
        public final int omissions;
        State(SharedPreferences p) {
            minutes = p.getLong("minutes", 0);
            revision = p.getLong("revision", 0);
            lastSuccess = p.getLong("lastSuccess", 0);
            lastScheduledTime = p.getLong("lastScheduledTime", 0);
            String uri = p.getString("folder", "");
            folder = uri.isEmpty() ? null : Uri.parse(uri);
            folderName = p.getString("folderName", "Choose a folder on this device");
            error = p.getString("error", null);
            lastScheduled = p.getBoolean("lastScheduled", false);
            omissions = p.getInt("omissions", 0);
        }
    }
}
