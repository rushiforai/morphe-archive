/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.actions;

import android.app.DownloadManager;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.net.Uri;
import android.os.Build;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.atomic.AtomicReference;
import java.util.function.Consumer;

import app.hushpinterest.extension.pinterest.settings.FamilyNames;
import app.hushpinterest.extension.pinterest.settings.PatchFamily;
import app.hushpinterest.extension.shared.L10n;
import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;

/** Observes native requests created by HushPinterest without canceling or deleting their files. */
public final class DownloadLedger {
    static final int LIMIT = 32;
    static final String STORE = "hushpinterest_download_history";
    static final String RECORDS = "requests_v1";
    static final String SENDER_PERMISSION = "android.permission.SEND_DOWNLOAD_COMPLETED_INTENTS";
    private static final Object LOCK = new Object();
    private static final Object RECEIVER_LOCK = new Object();
    private static Context receiverContext;
    private static volatile Context cachedContext;
    private static volatile List<Job> cached = Collections.emptyList();

    private final Context app;
    private final SharedPreferences preferences;

    DownloadLedger(Context context) {
        app = application(context);
        preferences = app.getSharedPreferences(STORE, Context.MODE_PRIVATE);
    }

    public enum State { QUEUED, RUNNING, PAUSED, FAILED, COMPLETED, MISSING, UNAVAILABLE, SAVED, SKIPPED, UNSUPPORTED }

    public static final class Job {
        // Negative keys identify local outcomes, never DownloadManager requests.
        public final long id;
        public final String pinId;
        public final long createdAt;
        public final State state;
        private final int reason;
        // Read only from Android's current failed request. Never persisted or shown in history.
        private final PinMedia.Source source;
        // The image type of a request Android finished. Read from Android, never persisted.
        private final String image;

        private Job(long id, String pinId, long createdAt, State state, int reason, PinMedia.Source source) {
            this(id, pinId, createdAt, state, reason, source, null);
        }

        private Job(long id, String pinId, long createdAt, State state, int reason, PinMedia.Source source, String image) {
            this.id = id;
            this.pinId = pinId;
            this.createdAt = createdAt;
            this.state = state;
            this.reason = reason;
            this.source = source;
            this.image = image;
        }

        private Job with(State state, int reason, PinMedia.Source source) {
            return with(state, reason, source, null);
        }

        private Job with(State state, int reason, PinMedia.Source source, String image) {
            return new Job(id, pinId, createdAt, state, reason, source, image);
        }

        public boolean canRetry() { return state == State.FAILED && source != null; }

        /** A finished image download Android's Set as options can take. */
        public boolean canSetAs() { return state == State.COMPLETED && image != null; }

        public String pinUrl() { return "https://www.pinterest.com/pin/" + pinId + "/"; }

        public String statusText() {
            switch (state) {
                case QUEUED: return L10n.t("Queued");
                case RUNNING: return L10n.t("Downloading");
                case PAUSED: return L10n.t("Paused");
                case FAILED: return L10n.t("Failed");
                case COMPLETED: return L10n.t("Completed");
                case MISSING: return L10n.t("Missing");
                case SAVED: return L10n.t("Saved");
                case SKIPPED: return L10n.t("Skipped");
                case UNSUPPORTED: return L10n.t("Unsupported");
                default: return L10n.t("Unavailable");
            }
        }

        public String reasonText() {
            if (state == State.SAVED) return L10n.t("Saved to the location you chose.");
            if (state == State.SKIPPED) return L10n.t("No download was queued. The selection was stopped, canceled or unavailable.");
            if (state == State.UNSUPPORTED) return L10n.t("Pinterest didn't supply supported media for this pin.");
            if (state == State.PAUSED) {
                switch (reason) {
                    case DownloadManager.PAUSED_WAITING_TO_RETRY: return L10n.t("Android will retry the download.");
                    case DownloadManager.PAUSED_WAITING_FOR_NETWORK: return L10n.t("Waiting for a network connection.");
                    case DownloadManager.PAUSED_QUEUED_FOR_WIFI: return L10n.t("Waiting for Wi-Fi.");
                    default: return L10n.t("Paused by Android.");
                }
            }
            if (state == State.FAILED) {
                switch (reason) {
                    case DownloadManager.ERROR_INSUFFICIENT_SPACE: return L10n.t("Not enough storage.");
                    case DownloadManager.ERROR_DEVICE_NOT_FOUND: return L10n.t("Download storage is unavailable.");
                    case DownloadManager.ERROR_FILE_ALREADY_EXISTS: return L10n.t("The file already exists.");
                    case DownloadManager.ERROR_CANNOT_RESUME: return L10n.t("Android couldn't resume the download.");
                    case DownloadManager.ERROR_FILE_ERROR: return L10n.t("Android couldn't save the file.");
                    case DownloadManager.ERROR_HTTP_DATA_ERROR:
                    case DownloadManager.ERROR_UNHANDLED_HTTP_CODE:
                    case DownloadManager.ERROR_TOO_MANY_REDIRECTS:
                        return L10n.t("The download server couldn't complete the request.");
                    default:
                        return reason >= 400 && reason <= 599
                                ? L10n.t("The download server couldn't complete the request.")
                                : L10n.t("Download failed.");
                }
            }
            if (state == State.COMPLETED) return L10n.t("Check Downloads for the saved file.");
            if (state == State.MISSING) return L10n.t("Android no longer has this request. Check Downloads before saving again.");
            if (state == State.UNAVAILABLE) return L10n.t("Couldn't check Downloads. Try again.");
            return "";
        }
    }

    /** Call after native enqueue on its worker. Only the returned ID is an ownership claim. */
    public static boolean record(Context context, long id, String pinId) {
        if (context == null || Build.VERSION.SDK_INT < 29 || !Utils.isMainProcess() ||
                id < 0 || pinId == null || !pinId.matches("[0-9]{1,30}")) return false;
        try {
            DownloadLedger ledger = new DownloadLedger(context);
            synchronized (LOCK) {
                ledger.insert(id, pinId, -1);
            }
            return true;
        } catch (RuntimeException failure) {
            HookStatus.threw(FamilyNames.DOWNLOAD_PINS, "record native download", failure);
            return false;
        }
    }

    /** Records a terminal batch outcome without inventing a native download ID or retaining its URL. */
    static boolean recordResult(Context context, String pinId, State state) {
        if (context == null || !Utils.isMainProcess() || pinId == null || !pinId.matches("[0-9]{1,30}") ||
                !(state == State.SAVED || state == State.SKIPPED || state == State.UNSUPPORTED || state == State.FAILED)) return false;
        try {
            DownloadLedger ledger = new DownloadLedger(context);
            synchronized (LOCK) {
                List<Job> jobs = ledger.load();
                long key = -Math.max(2, System.currentTimeMillis());
                for (Job job : jobs) if (job.id <= key) key = job.id - 1;
                if (key >= -1) throw new IllegalStateException("Local history keys exhausted");
                jobs.add(0, new Job(key, pinId, System.currentTimeMillis(), state, 0, null));
                if (jobs.size() > LIMIT) jobs.subList(LIMIT, jobs.size()).clear();
                ledger.store(jobs);
                ledger.publish(jobs);
            }
            return true;
        } catch (RuntimeException failure) {
            HookStatus.threw(FamilyNames.DOWNLOAD_PINS, "record batch outcome", failure);
            return false;
        }
    }

    /**
     * The pins whose saved history holds a request handed to Android's Downloads or a file saved
     * through the picker. Skipped, unsupported and failed results don't count, and neither does a
     * request Android reports failed or missing, so those pins can be tried again. A request Android
     * can't be asked about still counts, so a pin isn't saved twice. Asks Android's Downloads about
     * this app's own requests only, so call it off the main thread.
     */
    static Set<String> downloadedPinIds(Context context) {
        Set<String> ids = new HashSet<>();
        if (context == null || !Utils.isMainProcess()) return ids;
        try {
            DownloadLedger ledger = new DownloadLedger(context);
            synchronized (LOCK) {
                for (Job job : ledger.query(ledger.load())) {
                    boolean requested = job.id >= 0 && job.state != State.FAILED && job.state != State.MISSING;
                    if (requested || job.state == State.SAVED) ids.add(job.pinId);
                }
            }
        } catch (RuntimeException failure) {
            HookStatus.threw(FamilyNames.DOWNLOAD_PINS, "read download history", failure);
        }
        return ids;
    }

    /** Reconciles missed broadcasts without changing Android's retries, notifications or jobs. */
    public static void onStart(Context context) {
        if (context == null || Build.VERSION.SDK_INT < 29 || !Utils.isMainProcess()) return;
        Context app = application(context);
        try {
            synchronized (RECEIVER_LOCK) {
                if (receiverContext != app) {
                    if (receiverContext != null) {
                        try { receiverContext.unregisterReceiver(COMPLETIONS); }
                        catch (IllegalArgumentException alreadyGone) { /* No registration to release. */ }
                    }
                    IntentFilter filter = new IntentFilter(DownloadManager.ACTION_DOWNLOAD_COMPLETE);
                    // DownloadProvider has a different UID and holds this signature permission.
                    if (Build.VERSION.SDK_INT >= 33) {
                        app.registerReceiver(COMPLETIONS, filter, SENDER_PERMISSION, null, Context.RECEIVER_EXPORTED);
                    } else {
                        app.registerReceiver(COMPLETIONS, filter, SENDER_PERMISSION, null);
                    }
                    receiverContext = app;
                }
            }
        } catch (RuntimeException failure) {
            HookStatus.threw(FamilyNames.DOWNLOAD_PINS, "watch native download results", failure);
        }
        schedule(app, ledger -> ledger.reconcile(), null, null);
    }

    private static final BroadcastReceiver COMPLETIONS = new BroadcastReceiver() {
        @Override public void onReceive(Context context, Intent intent) {
            if (intent == null || !DownloadManager.ACTION_DOWNLOAD_COMPLETE.equals(intent.getAction())) return;
            long id = intent.getLongExtra(DownloadManager.EXTRA_DOWNLOAD_ID, -1);
            if (cachedContext != application(context)) return;
            boolean owned = false;
            for (Job job : cached) if (job.id == id) { owned = true; break; }
            if (!owned) return;
            // This only refreshes an in-memory view. Death before the worker runs is recovered
            // on startup; a goAsync result must not wait behind the shared worker queue.
            schedule(context, ledger -> ledger.reconcile(), null, null);
        }
    };

    /** Main-thread callback, including refusal. Null means history loading or scheduling failed. */
    public static boolean refresh(Context context, Consumer<List<Job>> after) {
        AtomicReference<List<Job>> result = new AtomicReference<>();
        return schedule(context, ledger -> result.set(ledger.reconcile()),
                after == null ? null : () -> after.accept(result.get()), L10n.t("Couldn't check Downloads. Try again."));
    }

    /** A stale history row never authorizes a retry. Requery and validate the failed source first. */
    public static boolean retry(Context context, long id, Runnable after) {
        return schedule(context, ledger -> ledger.retryNow(id), after, L10n.t("Couldn't save this pin."));
    }

    public static boolean removeHistory(Context context, long id, Runnable after) {
        return schedule(context, ledger -> {
            synchronized (LOCK) {
                List<Job> jobs = ledger.load();
                jobs.removeIf(job -> job.id == id);
                ledger.store(jobs);
                ledger.publish(jobs);
            }
            Utils.showToastLong(L10n.t("History removed. Files and active downloads were kept."));
        }, after, L10n.t("Couldn't remove this history entry. Try again."));
    }

    public static boolean openDownloads(Context context) {
        return open(context, new Intent(DownloadManager.ACTION_VIEW_DOWNLOADS), L10n.t("Couldn't open Downloads."));
    }

    private static String image(String mime) {
        return mime != null && mime.toLowerCase(Locale.ROOT).startsWith("image/") ? mime : null;
    }

    /**
     * Hands a finished image download to Android's own Set as options, where the system picker and
     * its cropper set it as the wallpaper. Android is asked about the request again first, and only
     * a finished image is handed over, by Android's own content address for that download with a
     * read grant. Nothing is copied and no wallpaper permission is used.
     */
    public static boolean setAs(Context context, Job job) {
        if (context == null || job == null || !job.canSetAs()) return false;
        Context app = application(context);
        String error = L10n.t("Couldn't open Set as. Check Downloads for the saved file.");
        boolean scheduled = Utils.runOnBackgroundThread(() -> {
            try {
                if (!PinDownloads.active()) {
                    Utils.showToastLong(L10n.t("Resume HushPinterest and turn on Download pins to use this."));
                    return;
                }
                DownloadManager manager = (DownloadManager) app.getSystemService(Context.DOWNLOAD_SERVICE);
                if (manager == null) throw new IllegalStateException("Download service unavailable");
                String mime = null;
                try (Cursor cursor = manager.query(new DownloadManager.Query().setFilterById(job.id))) {
                    if (cursor != null && cursor.moveToFirst() && cursor.getInt(cursor.getColumnIndexOrThrow(
                            DownloadManager.COLUMN_STATUS)) == DownloadManager.STATUS_SUCCESSFUL) {
                        int type = cursor.getColumnIndex(DownloadManager.COLUMN_MEDIA_TYPE);
                        mime = image(type < 0 ? null : cursor.getString(type));
                    }
                }
                if (mime == null) {
                    Utils.showToastLong(L10n.t("This download isn't a finished image anymore. Check Downloads."));
                    return;
                }
                Uri file = manager.getUriForDownloadedFile(job.id);
                if (file == null) throw new IllegalStateException("Finished image has no content URI");
                Intent attach = new Intent(Intent.ACTION_ATTACH_DATA).setDataAndType(file, mime).putExtra("mimeType", mime)
                        .addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
                Intent chooser = Intent.createChooser(attach, L10n.t("Set as"));
                Utils.runOnMainThread(() -> {
                    if (open(app, chooser, error)) HookStatus.counted(FamilyNames.DOWNLOAD_PINS, "finished image handed to Set as");
                });
            } catch (RuntimeException failure) {
                HookStatus.threw(FamilyNames.DOWNLOAD_PINS, "set a finished image as", failure);
                Utils.showToastLong(error);
            }
        });
        if (!scheduled) Utils.showToastLong(error);
        return scheduled;
    }

    public static boolean reopenPin(Context context, Job job) {
        if (context == null || job == null) return false;
        return open(context, new Intent(Intent.ACTION_VIEW, Uri.parse(job.pinUrl()))
                .addCategory(Intent.CATEGORY_BROWSABLE).setPackage(context.getPackageName()), L10n.t("Couldn't open this pin."));
    }

    private void retryNow(long id) {
        synchronized (LOCK) {
            if (Build.VERSION.SDK_INT < 29 || !Utils.settingsReady() || !PatchFamily.Capability.PIN_DOWNLOADS.installed()) {
                Utils.showToastLong(L10n.t("Open the pin again to get a fresh download link."));
                return;
            }
            if (!PinDownloads.active()) {
                Utils.showToastLong(L10n.t("Resume HushPinterest and turn on Download pins to retry."));
                return;
            }
            Job old = null;
            for (Job job : load()) if (job.id == id) { old = job; break; }
            if (old == null) {
                Utils.showToastLong(L10n.t("Open the pin again to get a fresh download link."));
                return;
            }
            Job current = query(Collections.singletonList(old)).get(0);
            if (current.state == State.UNAVAILABLE) {
                Utils.showToastLong(current.reasonText());
                return;
            }
            if (!current.canRetry()) {
                Utils.showToastLong(L10n.t(current.state == State.MISSING || current.state == State.FAILED
                        ? "Open the pin again to get a fresh download link."
                        : "This request can't be retried. Check Downloads or open the pin again."));
                return;
            }
            if (!PinDownloads.active()) {
                Utils.showToastLong(L10n.t("Resume HushPinterest and turn on Download pins to retry."));
                return;
            }
            String name = "Pinterest_" + current.pinId + "_" + Long.toUnsignedString(System.nanoTime()) + current.source.suffix;
            long next = manager().enqueue(PinDownloads.request(current.source, name));
            if (next < 0) throw new IllegalStateException("Download service rejected retry");
            // Enqueue and preference persistence cannot be one transaction. Never remove the
            // native request or file to undo a bookkeeping failure, and never retry automatically.
            boolean saved = false;
            try {
                insert(next, current.pinId, id);
                saved = true;
            } catch (RuntimeException failure) {
                HookStatus.threw(FamilyNames.DOWNLOAD_PINS, "record native download retry", failure);
            }
            HookStatus.counted(FamilyNames.DOWNLOAD_PINS, "native download retry queued");
            Utils.showToastLong(L10n.t(saved ? "Download started. Check Downloads."
                    : "Download started, but its history couldn't be saved. Check Downloads."));
        }
    }

    List<Job> reconcile() {
        synchronized (LOCK) {
            List<Job> jobs = query(load());
            publish(jobs);
            HookStatus.counted(FamilyNames.DOWNLOAD_PINS, "native download history checked");
            return jobs;
        }
    }

    private List<Job> query(List<Job> owned) {
        if (owned.isEmpty()) return Collections.emptyList();
        long[] ids = owned.stream().filter(job -> job.id >= 0).mapToLong(job -> job.id).toArray();
        Map<Long, Job> results = new LinkedHashMap<>();
        for (int i = 0; i < owned.size(); i++) {
            Job job = owned.get(i);
            results.put(job.id, job.id < 0 ? job : job.with(State.MISSING, 0, null));
        }
        if (ids.length == 0) return Collections.unmodifiableList(new ArrayList<>(results.values()));
        try (Cursor cursor = manager().query(new DownloadManager.Query().setFilterById(ids))) {
            if (cursor == null) throw new IllegalStateException("Download query unavailable");
            int idColumn = cursor.getColumnIndexOrThrow(DownloadManager.COLUMN_ID);
            int statusColumn = cursor.getColumnIndexOrThrow(DownloadManager.COLUMN_STATUS);
            int reasonColumn = cursor.getColumnIndexOrThrow(DownloadManager.COLUMN_REASON);
            int sourceColumn = cursor.getColumnIndexOrThrow(DownloadManager.COLUMN_URI);
            int mimeColumn = cursor.getColumnIndex(DownloadManager.COLUMN_MEDIA_TYPE);
            while (cursor.moveToNext()) {
                long id = cursor.getLong(idColumn);
                Job job = results.get(id);
                if (job == null || job.id < 0) continue;
                State state = state(cursor.getInt(statusColumn));
                int reason = state == State.PAUSED || state == State.FAILED ? cursor.getInt(reasonColumn) : 0;
                PinMedia.Source source = null;
                String mime = mimeColumn < 0 ? null : cursor.getString(mimeColumn);
                if (state == State.FAILED) {
                    String url = cursor.getString(sourceColumn);
                    source = PinMedia.sourceUrl(url, false);
                    if (source == null) source = PinMedia.sourceUrl(url, true);
                    // Our original request sets its MIME type. Don't reinterpret a video as
                    // an image, or guess a type when Android no longer has that contract.
                    if (source != null && !source.mime.equalsIgnoreCase(mime)) source = null;
                }
                results.put(id, job.with(state, reason, source, state == State.COMPLETED ? image(mime) : null));
            }
            return Collections.unmodifiableList(new ArrayList<>(results.values()));
        } catch (RuntimeException failure) {
            HookStatus.threw(FamilyNames.DOWNLOAD_PINS, "query native download history", failure);
            List<Job> unavailable = new ArrayList<>();
            for (Job job : owned) unavailable.add(job.id < 0 ? job : job.with(State.UNAVAILABLE, 0, null));
            return Collections.unmodifiableList(unavailable);
        }
    }

    private static State state(int status) {
        switch (status) {
            case DownloadManager.STATUS_PENDING: return State.QUEUED;
            case DownloadManager.STATUS_RUNNING: return State.RUNNING;
            case DownloadManager.STATUS_PAUSED: return State.PAUSED;
            case DownloadManager.STATUS_FAILED: return State.FAILED;
            case DownloadManager.STATUS_SUCCESSFUL: return State.COMPLETED;
            default: return State.UNAVAILABLE;
        }
    }

    private List<Job> load() {
        List<Job> jobs = new ArrayList<>();
        String text;
        try { text = preferences.getString(RECORDS, ""); }
        catch (ClassCastException invalid) { return jobs; }
        if (text == null || text.length() > 4096) return jobs;
        for (String line : text.split("\n")) {
            String[] fields = line.split(",", -1);
            boolean local = fields.length == 4 && fields[0].matches("-[0-9]{1,19}");
            if ((!local && (fields.length != 3 || !fields[0].matches("[0-9]{1,19}"))) ||
                    !fields[1].matches("[0-9]{1,30}") || !fields[2].matches("[0-9]{1,19}")) continue;
            try {
                long id = Long.parseLong(fields[0]);
                long time = Long.parseLong(fields[2]);
                if (time <= 0) continue;
                State state = local ? State.valueOf(fields[3]) : State.UNAVAILABLE;
                if (local && (id >= -1 || !(state == State.SAVED || state == State.SKIPPED || state == State.UNSUPPORTED || state == State.FAILED))) continue;
                boolean duplicate = false;
                for (Job job : jobs) if (job.id == id) { duplicate = true; break; }
                if (!duplicate) jobs.add(new Job(id, fields[1], time, state, 0, null));
                if (jobs.size() == LIMIT) break;
            } catch (IllegalArgumentException invalid) {
                // Invalid private metadata cannot become an ID to query.
            }
        }
        return jobs;
    }

    private void store(List<Job> jobs) {
        StringBuilder text = new StringBuilder();
        for (Job job : jobs) {
            text.append(job.id).append(',').append(job.pinId).append(',').append(job.createdAt);
            if (job.id < 0) text.append(',').append(job.state.name());
            text.append('\n');
        }
        if (!preferences.edit().putString(RECORDS, text.toString()).commit()) {
            throw new IllegalStateException("Download history write failed");
        }
    }

    private void insert(long id, String pinId, long replacedId) {
        List<Job> jobs = load();
        jobs.removeIf(job -> job.id == id || job.id == replacedId);
        jobs.add(0, new Job(id, pinId, System.currentTimeMillis(), State.QUEUED, 0, null));
        if (jobs.size() > LIMIT) jobs.subList(LIMIT, jobs.size()).clear();
        store(jobs);
        publish(jobs);
    }

    private void publish(List<Job> jobs) {
        cachedContext = app;
        cached = Collections.unmodifiableList(new ArrayList<>(jobs));
    }

    private DownloadManager manager() {
        DownloadManager manager = (DownloadManager) app.getSystemService(Context.DOWNLOAD_SERVICE);
        if (manager == null) throw new IllegalStateException("Download service unavailable");
        return manager;
    }

    private static boolean schedule(Context context, Consumer<DownloadLedger> work, Runnable after, String error) {
        if (context == null || !Utils.isMainProcess()) {
            if (after != null) Utils.runOnMainThread(after);
            return false;
        }
        boolean queued = Utils.runOnBackgroundThread(() -> {
            try { work.accept(new DownloadLedger(context)); }
            catch (RuntimeException failure) {
                HookStatus.threw(FamilyNames.DOWNLOAD_PINS, "update native download history", failure);
                if (error != null) Utils.showToastLong(error);
            } finally {
                if (after != null) Utils.runOnMainThread(after);
            }
        });
        if (!queued) {
            HookStatus.threw(FamilyNames.DOWNLOAD_PINS, "schedule native download history", new IllegalStateException("Worker unavailable"));
            if (error != null) Utils.showToastLong(error);
            if (after != null) Utils.runOnMainThread(after);
        }
        return queued;
    }

    private static Context application(Context context) {
        Context app = context.getApplicationContext();
        return app == null ? context : app;
    }

    private static boolean open(Context context, Intent intent, String error) {
        if (context == null) return false;
        try {
            context.startActivity(intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
            return true;
        } catch (RuntimeException failure) {
            HookStatus.threw(FamilyNames.DOWNLOAD_PINS, "open native download guidance", failure);
            Utils.showToastLong(error);
            return false;
        }
    }
}
