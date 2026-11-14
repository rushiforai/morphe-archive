package app.morphe.extension.mapsautomotive.patches;

import android.app.Activity;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageInstaller;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.content.pm.Signature;
import android.net.Uri;
import android.os.Build;
import android.os.Process;
import android.os.SystemClock;
import android.provider.Settings;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.ref.WeakReference;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.MessageDigest;
import java.util.Locale;
import java.util.UUID;

import app.morphe.extension.BuildConfig;
import app.morphe.extension.shared.Utils;

/**
 * In-app update (0.1.8): downloads the APK that the report server offers (UpdateCheck.Offer), checks that it is
 * this app signed with the key in BuildConfig.MAPS_CAR_APK_SIGNER and not an older build, and hands it to Android's
 * installer, which asks the user to confirm. Android installs it over this app, so the data stays, and closes the
 * app. Android also refuses an update signed with another key, whatever the server says.
 * <ul>
 * <li>Without the permission to install apps it opens Android's screen for it, or gives the ADB command when the
 * car has no such screen.</li>
 * <li>Before downloading it asks the server again, so an APK the owner withdrew is not installed.</li>
 * <li>One install at a time per process; each download has its own file, so the main process and the report
 * screen's process do not share one. Closing the dialog stops a download. A later dialog shows the running job.</li>
 * <li>Android's answer comes as a broadcast that carries a random token of the job, so another app cannot fake it
 * (the receiver is exported below Android 13). An install that waits for the user over 10 minutes, or whose
 * session is gone, is given up.</li>
 * </ul>
 */
final class ApkInstaller {
    private static final String TAG = UpdateCheck.TAG;
    private static final String DIR = "morphe_update_apk";
    private static final String ACTION_STATUS = "app.morphe.extension.mapsautomotive.INSTALL_STATUS";
    private static final String EXTRA_TOKEN = "app.morphe.extension.mapsautomotive.INSTALL_TOKEN";
    /** A Maps Car APK is about 80 MB; the server refuses files above this too. */
    static final long MAX_BYTES = 400L * 1024 * 1024;
    private static final int CONNECT_TIMEOUT_MS = 15_000, READ_TIMEOUT_MS = 30_000;
    private static final long PROGRESS_MS = 500;
    /** An install waiting longer for the user's answer is given up. */
    private static final long CONFIRM_WAIT_MS = 10 * 60_000L;
    /** A download file older than this belongs to no running job (a process that died). */
    private static final long LEFT_OVER_MS = 60 * 60_000L;

    /** Called on the main thread with the text for the dialog's status line; [busy] while it cannot be tapped. */
    interface Listener {
        void show(String text, boolean busy);
    }

    private static final class Job {
        final String token = UUID.randomUUID().toString();
        final WeakReference<Activity> host;
        final boolean thai;
        volatile Listener listener;
        volatile boolean cancelled;
        /** Handed to Android: closing the dialog no longer stops it. */
        volatile boolean committed;
        volatile long committedAt;
        volatile int sessionId = -1;
        /** Android's confirm screen, opened again on a tap while it waits. */
        volatile Intent confirm;
        volatile BroadcastReceiver receiver;
        volatile File file;
        /** The last status, for a dialog that opens while the job runs. */
        volatile String text;
        volatile boolean busy = true;

        Job(Activity host, Listener listener, boolean thai) {
            this.host = new WeakReference<>(host);
            this.listener = listener;
            this.thai = thai;
        }
    }

    private static volatile Job current;

    private ApkInstaller() {
    }

    /** "82.4 MB". */
    static String megabytes(long bytes) {
        return String.format(Locale.ROOT, "%.1f MB", bytes / (1024.0 * 1024.0));
    }

    /** The ADB command that lets this app install apps, for a car without Android's screen for it. */
    static String adbCommand(String packageName) {
        return "adb shell appops set " + packageName + " REQUEST_INSTALL_PACKAGES allow";
    }

    /** Whether an install runs in this process; one that waited too long or whose session is gone is given up here. */
    static boolean busy(Context context) {
        Job job = current;
        if (job == null) return false;
        if (job.committed && gone(context, job)) {
            done(context, job, job.thai ? "การติดตั้งไม่เสร็จ แตะ \"โหลดและติดตั้ง\" เพื่อลองใหม่"
                    : "The install did not finish. Tap Download and install to try again.", "given up (no answer from Android)", true);
            return false;
        }
        return true;
    }

    private static boolean gone(Context context, Job job) {
        if (SystemClock.elapsedRealtime() - job.committedAt > CONFIRM_WAIT_MS) return true;
        try {
            return context.getPackageManager().getPackageInstaller().getSessionInfo(job.sessionId) == null;
        } catch (RuntimeException error) {
            return false;
        }
    }

    /** A dialog that opens while a job runs: it gets the job's status and later updates. */
    static void attach(Context context, Listener listener) {
        Job job = current;
        if (job == null || !busy(context)) return;
        job.listener = listener;
        if (job.text != null) listener.show(job.text, job.busy);
    }

    /** The dialog closed: a download stops; an install Android already has goes on. */
    static void cancel() {
        Job job = current;
        if (job != null && !job.committed) job.cancelled = true;
    }

    /** From the app's start: download files of a process that died (a finished install deleted its own). */
    static void cleanUp(Context context) {
        try {
            Utils.runOnBackgroundThread(() -> {
                File[] files = new File(context.getCacheDir(), DIR).listFiles();
                if (files == null) return;
                long now = System.currentTimeMillis();
                for (File file : files) {
                    if (now - file.lastModified() > LEFT_OVER_MS && file.delete()) {
                        ReportLog.i(TAG, "Update install: removed a left-over " + file.getName());
                    }
                }
            });
        } catch (RuntimeException error) {
            ReportLog.w(TAG, "update file not cleaned up", error);
        }
    }

    /** The dialog's "Download and install"; while Android waits for the user, a tap opens its screen again. */
    static void start(Activity host, UpdateCheck.Offer offer, boolean thai, Listener listener) {
        Context app = host.getApplicationContext();
        Job running = current;
        if (running != null && busy(app)) {
            running.listener = listener;
            Intent confirm = running.confirm;
            if (confirm != null) open(app, running, confirm);
            else if (running.text != null) listener.show(running.text, running.busy);
            return;
        }
        if (!app.getPackageManager().canRequestPackageInstalls()) {
            askPermission(host, app, thai, listener);
            return;
        }
        Job job = new Job(host, listener, thai);
        current = job;
        status(job, thai ? "กำลังตรวจอัปเดตกับเซิร์ฟเวอร์…" : "Asking the server…", true);
        ReportLog.i(TAG, "Update install: " + offer.version + " (" + megabytes(offer.size) + ") requested");
        try {
            Utils.runOnBackgroundThread(() -> run(app, job, offer));
        } catch (RuntimeException error) {
            done(app, job, thai ? "เริ่มไม่ได้ ลองใหม่อีกครั้ง" : "Could not start. Try again.", "not started: " + error, false);
        }
    }

    private static void askPermission(Activity host, Context app, boolean thai, Listener listener) {
        Intent settings = new Intent(Settings.ACTION_MANAGE_UNKNOWN_APP_SOURCES, Uri.parse("package:" + app.getPackageName()));
        boolean screen = settings.resolveActivity(app.getPackageManager()) != null;
        ReportLog.i(TAG, "Update install: no permission to install apps; " + (screen ? "opening Android's screen" : "no screen for it"));
        if (screen) {
            try {
                host.startActivity(settings);
                listener.show(thai ? "อนุญาตให้ Maps ติดตั้งแอปในหน้าที่เปิดขึ้น แล้วกลับมาแตะ \"โหลดและติดตั้ง\" อีกครั้ง"
                        : "Allow Maps to install apps on the screen that opened, then come back and tap Download and install again.", false);
                return;
            } catch (RuntimeException error) {
                ReportLog.w(TAG, "install permission screen not opened", error);
            }
        }
        listener.show((thai ? "Maps ยังไม่มีสิทธิ์ติดตั้งแอป และรถคันนี้ไม่มีหน้าให้อนุญาต รันครั้งเดียวผ่าน ADB:\n"
                : "Maps has no permission to install apps, and this car has no screen to grant it. Run once over ADB:\n")
                + adbCommand(app.getPackageName()), false);
    }

    /** A reason for the log, and the dialog's text. */
    private static final class Failure extends Exception {
        final String text;

        Failure(String log, String text) {
            super(log);
            this.text = text;
        }
    }

    private static String tryAgain(boolean thai) {
        return thai ? " แตะ \"โหลดและติดตั้ง\" เพื่อลองใหม่" : " Tap Download and install to try again.";
    }

    private static void run(Context app, Job job, UpdateCheck.Offer offer) {
        boolean thai = job.thai;
        int priority = Process.getThreadPriority(Process.myTid());
        try {
            // Below Maps' own threads: the download, the signature check and the copy are long.
            Process.setThreadPriority(Process.THREAD_PRIORITY_BACKGROUND);
            confirmOffer(app, offer, thai);
            File dir = new File(app.getCacheDir(), DIR);
            if (!dir.isDirectory() && !dir.mkdirs()) throw new Failure("no folder " + dir, thai ? "เก็บไฟล์ไม่ได้" : "Could not store the file.");
            File file = File.createTempFile("update-", ".apk", dir);
            job.file = file;
            long started = SystemClock.elapsedRealtime();
            long size = download(offer, file, job);
            if (job.cancelled) {
                done(app, job, null, "stopped (the dialog closed)", false);
                return;
            }
            ReportLog.i(TAG, "Update install: downloaded " + megabytes(size) + " in " + (SystemClock.elapsedRealtime() - started) / 1000 + " s");
            status(job, thai ? "กำลังตรวจไฟล์…" : "Checking the file…", true);
            verify(app, file, thai);
            if (job.cancelled) {
                done(app, job, null, "stopped (the dialog closed)", false);
                return;
            }
            commit(app, job, file);
        } catch (Failure failure) {
            done(app, job, failure.text, failure.getMessage(), true);
        } catch (Throwable error) {
            done(app, job, (thai ? "อัปเดตไม่สำเร็จ (" + error.getClass().getSimpleName() + ")" : "The update failed (" + error.getClass().getSimpleName() + ").")
                    + tryAgain(thai), "failed: " + error, true);
        } finally {
            try {
                Process.setThreadPriority(priority);
            } catch (RuntimeException ignored) {
                // The pool thread keeps the lower priority.
            }
        }
    }

    /** The server must still offer this APK; when it cannot be asked, the stored offer is used. */
    private static void confirmOffer(Context app, UpdateCheck.Offer offer, boolean thai) throws Failure {
        UpdateCheck.OfferResponse response = UpdateCheck.fetchOffer(ReportPatch.URL, ReportPatch.KEY, "MapsCar/" + UpdateCheck.installedVersion());
        if (response.status == 204) {
            UpdateCheck.update(app, state -> UpdateCheck.applyOffer(state, response));
            throw new Failure("withdrawn", thai ? "ตอนนี้ไม่มีอัปเดตให้โหลดแล้ว" : "No update is offered now.");
        }
        if (response.status != 200) {
            ReportLog.i(TAG, "Update install: the server was not asked again (" + (response.status > 0 ? "HTTP " + response.status : response.failure)
                    + "); the stored offer is used");
            return;
        }
        UpdateCheck.State now = new UpdateCheck.State();
        UpdateCheck.applyOffer(now, response);
        if (now.apkVersion != null && (!offer.version.equals(now.apkVersion) || !offer.url.equals(now.apkUrl))) {
            UpdateCheck.update(app, state -> UpdateCheck.applyOffer(state, response));
            throw new Failure("changed to " + now.apkVersion, thai ? "อัปเดตที่มีให้เปลี่ยนเป็น " + now.apkVersion + " แล้ว แตะ \"ตรวจตอนนี้\" แล้วลองใหม่"
                    : "The update on offer changed to " + now.apkVersion + ". Tap Check now, then try again.");
        }
    }

    /** Writes the APK to [file]; its size. HttpURLConnection follows redirects, but not from https to http. */
    private static long download(UpdateCheck.Offer offer, File file, Job job) throws IOException, Failure {
        boolean thai = job.thai;
        status(job, downloading(0, offer.size, thai), true);
        HttpURLConnection connection = null;
        try {
            connection = (HttpURLConnection) new URL(offer.url).openConnection();
            connection.setInstanceFollowRedirects(true);
            connection.setUseCaches(false);
            connection.setConnectTimeout(CONNECT_TIMEOUT_MS);
            connection.setReadTimeout(READ_TIMEOUT_MS);
            connection.setRequestProperty("User-Agent", "MapsCar/" + UpdateCheck.installedVersion());
            int status;
            try {
                status = connection.getResponseCode();
            } catch (IOException error) {
                throw new Failure("no connection: " + error.getClass().getSimpleName(),
                        (thai ? "โหลดไม่สำเร็จ (ต่อเซิร์ฟเวอร์ไฟล์ไม่ได้)" : "Download failed (could not reach the file's server).") + tryAgain(thai));
            }
            if (status != 200) {
                throw new Failure("HTTP " + status, thai ? "โหลดไม่สำเร็จ (เซิร์ฟเวอร์ตอบ " + status + ")" : "Download failed (the server answered " + status + ").");
            }
            if (!"https".equals(connection.getURL().getProtocol())) {
                throw new Failure("redirected off https", thai ? "โหลดไม่สำเร็จ (ลิงก์ไม่ใช่ https)" : "Download failed (the link left https).");
            }
            long length = connection.getContentLengthLong();
            long total = length > 0 ? length : offer.size;
            if (total > MAX_BYTES) throw new Failure("too large: " + total, thai ? "ไฟล์ใหญ่เกินไป" : "The file is too large.");
            // The file, then Android's copy of it while installing.
            long needed = 2 * total + 50L * 1024 * 1024;
            if (file.getParentFile().getUsableSpace() < needed) {
                throw new Failure("no space: " + file.getParentFile().getUsableSpace(), thai ? "พื้นที่ไม่พอ ต้องว่างอย่างน้อย " + megabytes(needed)
                        : "Not enough space: needs " + megabytes(needed) + " free.");
            }
            long done = 0, shownAt = 0;
            int shownPercent = -1;
            try (InputStream in = connection.getInputStream(); OutputStream out = new FileOutputStream(file)) {
                byte[] buffer = new byte[64 * 1024];
                int read;
                while ((read = in.read(buffer)) > 0) {
                    if (job.cancelled) return done;
                    done += read;
                    if (done > MAX_BYTES) throw new Failure("over " + MAX_BYTES + " bytes", thai ? "ไฟล์ใหญ่เกินไป" : "The file is too large.");
                    out.write(buffer, 0, read);
                    long now = SystemClock.elapsedRealtime();
                    int percent = total > 0 ? (int) Math.min(99, done * 100 / total) : 0;
                    if (percent != shownPercent && now - shownAt >= PROGRESS_MS) {
                        shownPercent = percent;
                        shownAt = now;
                        status(job, downloading(done, total, thai), true);
                    }
                }
            } catch (IOException error) {
                throw new Failure("cut off after " + done + " bytes: " + error.getClass().getSimpleName(),
                        (thai ? "โหลดไม่ครบ (เน็ตหลุด?)" : "The download stopped (network lost?).") + tryAgain(thai));
            }
            if (length > 0 && done != length) {
                throw new Failure("got " + done + " of " + length + " bytes", (thai ? "โหลดไม่ครบ" : "The download is incomplete.") + tryAgain(thai));
            }
            return done;
        } finally {
            if (connection != null) connection.disconnect();
        }
    }

    static String downloading(long done, long total, boolean thai) {
        if (total <= 0) return thai ? "กำลังโหลด… " + megabytes(done) : "Downloading… " + megabytes(done);
        int percent = (int) Math.min(99, done * 100 / total);
        return thai ? "กำลังโหลด… " + percent + "% จาก " + megabytes(total) : "Downloading… " + percent + "% of " + megabytes(total);
    }

    /**
     * The file must be this app (its package) signed with the expected key, and not an older build (a lower version
     * code). On Android 9 and 10 an archive's signature is read and verified only with GET_SIGNATURES, so both flags
     * are asked for.
     */
    @SuppressWarnings("deprecation")
    private static void verify(Context app, File file, boolean thai) throws Failure {
        PackageManager manager = app.getPackageManager();
        PackageInfo info = manager.getPackageArchiveInfo(file.getPath(), PackageManager.GET_SIGNATURES | PackageManager.GET_SIGNING_CERTIFICATES);
        if (info == null) throw new Failure("not a readable APK", (thai ? "ไฟล์เสียหรือไม่ใช่ APK" : "The file is damaged or not an APK.") + tryAgain(thai));
        if (!app.getPackageName().equals(info.packageName)) {
            throw new Failure("another package: " + info.packageName, thai ? "ไฟล์นี้เป็นแอปอื่น ไม่ใช่ Maps Car" : "The file is another app, not Maps Car.");
        }
        Signature[] signers = info.signingInfo != null ? info.signingInfo.getApkContentsSigners() : info.signatures;
        if (signers == null || signers.length != 1) {
            throw new Failure("signers unreadable", thai ? "อ่านลายเซ็นของไฟล์ไม่ได้" : "The file's signature is unreadable.");
        }
        String signer;
        try {
            signer = UpdateCheck.hex(MessageDigest.getInstance("SHA-256").digest(signers[0].toByteArray()));
        } catch (Exception error) {
            throw new Failure("signer unreadable: " + error, thai ? "อ่านลายเซ็นของไฟล์ไม่ได้" : "The file's signature is unreadable.");
        }
        if (!signer.equalsIgnoreCase(BuildConfig.MAPS_CAR_APK_SIGNER)) {
            throw new Failure("another signer " + signer.substring(0, 12), thai ? "APK นี้เซ็นด้วย key อื่น จึงติดตั้งทับแอปนี้ไม่ได้"
                    : "The APK is signed with another key, so it cannot install over this app.");
        }
        try {
            long installed = manager.getPackageInfo(app.getPackageName(), 0).getLongVersionCode();
            if (info.getLongVersionCode() < installed) {
                throw new Failure("older version code " + info.getLongVersionCode() + " < " + installed, thai
                        ? "APK นี้เป็น Maps เวอร์ชันเก่ากว่าที่ติดตั้งอยู่ Android จึงไม่ติดตั้งทับ" : "This APK has an older Maps than the one installed, so Android won't install it over it.");
            }
        } catch (PackageManager.NameNotFoundException error) {
            // Not reached for this app's own package.
        }
        ReportLog.i(TAG, "Update install: the file is " + info.packageName + " " + info.versionName + " with the expected signer");
    }

    /** Copies the file into an install session (then deletes it) and commits; Android answers through the receiver. */
    private static void commit(Context app, Job job, File file) throws IOException {
        PackageInstaller installer = app.getPackageManager().getPackageInstaller();
        PackageInstaller.SessionParams params = new PackageInstaller.SessionParams(PackageInstaller.SessionParams.MODE_FULL_INSTALL);
        params.setAppPackageName(app.getPackageName());
        params.setSize(file.length());
        int id = installer.createSession(params);
        job.sessionId = id;
        try (PackageInstaller.Session session = installer.openSession(id)) {
            try (InputStream in = new FileInputStream(file); OutputStream out = session.openWrite("base.apk", 0, file.length())) {
                byte[] buffer = new byte[64 * 1024];
                int read;
                while ((read = in.read(buffer)) > 0) out.write(buffer, 0, read);
                session.fsync(out);
            }
            delete(file);
            if (job.cancelled) {
                done(app, job, null, "stopped (the dialog closed)", true);
                return;
            }
            register(app, job, id);
            Intent status = new Intent(ACTION_STATUS).setPackage(app.getPackageName()).putExtra(EXTRA_TOKEN, job.token);
            // Android fills in the result, so the intent must be mutable (the default before Android 12).
            int flags = PendingIntent.FLAG_UPDATE_CURRENT | (Build.VERSION.SDK_INT >= 31 ? PendingIntent.FLAG_MUTABLE : 0);
            job.committedAt = SystemClock.elapsedRealtime();
            job.committed = true;
            session.commit(PendingIntent.getBroadcast(app, id, status, flags).getIntentSender());
            status(job, job.thai ? "ส่งให้ Android ติดตั้งแล้ว…" : "Handing it to Android…", true);
            ReportLog.i(TAG, "Update install: handed to Android (session " + id + ")");
        } catch (IOException | RuntimeException error) {
            job.committed = false;
            throw error;
        }
    }

    private static void register(Context app, Job job, int sessionId) {
        BroadcastReceiver receiver = new BroadcastReceiver() {
            @Override
            public void onReceive(Context context, Intent intent) {
                // Only Android's answer through this job's own PendingIntent carries its token.
                if (!job.token.equals(intent.getStringExtra(EXTRA_TOKEN))) return;
                if (intent.getIntExtra(PackageInstaller.EXTRA_SESSION_ID, -1) != sessionId) return;
                int status = intent.getIntExtra(PackageInstaller.EXTRA_STATUS, PackageInstaller.STATUS_FAILURE);
                Context app = context.getApplicationContext();
                if (status == PackageInstaller.STATUS_PENDING_USER_ACTION) {
                    confirm(app, job, intent);
                    return;
                }
                String message = intent.getStringExtra(PackageInstaller.EXTRA_STATUS_MESSAGE);
                if (status == PackageInstaller.STATUS_SUCCESS) {
                    // Rarely seen: Android usually closes the app first.
                    done(app, job, job.thai ? "ติดตั้งแล้ว เปิด Maps ใหม่ได้เลย" : "Installed. Open Maps again.", "installed", false);
                } else {
                    done(app, job, statusText(status, message, job.thai), "Android answered " + status + (message == null ? "" : " (" + message + ")"), false);
                }
            }
        };
        job.receiver = receiver;
        IntentFilter filter = new IntentFilter(ACTION_STATUS);
        if (Build.VERSION.SDK_INT >= 33) app.registerReceiver(receiver, filter, Context.RECEIVER_NOT_EXPORTED);
        else app.registerReceiver(receiver, filter);
    }

    /** Android's confirm screen: only a system app's activity, without URI grants or a selector. */
    @SuppressWarnings("deprecation")
    private static void confirm(Context app, Job job, Intent intent) {
        Intent confirm = intent.getParcelableExtra(Intent.EXTRA_INTENT);
        if (confirm != null) {
            confirm.setSelector(null);
            confirm.setFlags(confirm.getFlags() & ~(Intent.FLAG_GRANT_READ_URI_PERMISSION | Intent.FLAG_GRANT_WRITE_URI_PERMISSION
                    | Intent.FLAG_GRANT_PERSISTABLE_URI_PERMISSION | Intent.FLAG_GRANT_PREFIX_URI_PERMISSION));
            ResolveInfo target = app.getPackageManager().resolveActivity(confirm, 0);
            if (target == null || target.activityInfo == null || (target.activityInfo.applicationInfo.flags & ApplicationInfo.FLAG_SYSTEM) == 0) {
                confirm = null;
            }
        }
        if (confirm == null) {
            done(app, job, statusText(PackageInstaller.STATUS_FAILURE, null, job.thai), "no system confirm screen", true);
            return;
        }
        job.confirm = confirm;
        open(app, job, confirm);
    }

    private static void open(Context app, Job job, Intent confirm) {
        Activity host = job.host.get();
        try {
            if (host != null && !host.isFinishing() && !host.isDestroyed()) host.startActivity(confirm);
            else app.startActivity(new Intent(confirm).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
            // Tappable again: a tap opens the screen again if it was closed some other way.
            status(job, job.thai ? "ยืนยันการติดตั้งในหน้าที่เปิดขึ้น Maps จะปิดระหว่างอัปเดต แล้วเปิดใหม่ได้เลย"
                    : "Confirm the install on the screen that opened. Maps closes while it updates; open it again afterwards.", false);
            ReportLog.i(TAG, "Update install: Android asks to confirm");
        } catch (RuntimeException error) {
            done(app, job, statusText(PackageInstaller.STATUS_FAILURE, null, job.thai), "confirm screen not opened: " + error, true);
        }
    }

    /** Android's answer as the dialog says it; [message] is Android's (INSTALL_FAILED_…), shown when it explains more. */
    static String statusText(int status, String message, boolean thai) {
        String detail = message == null || message.trim().isEmpty() ? "" : " (" + (message.length() > 120 ? message.substring(0, 120) + "…" : message.trim()) + ")";
        switch (status) {
            case PackageInstaller.STATUS_FAILURE_ABORTED:
                return thai ? "ยกเลิกการติดตั้งแล้ว" : "The install was cancelled.";
            case PackageInstaller.STATUS_FAILURE_CONFLICT:
            case PackageInstaller.STATUS_FAILURE_INCOMPATIBLE:
                if (message != null && (message.contains("UPDATE_INCOMPATIBLE") || message.toLowerCase(Locale.ROOT).contains("signature"))) {
                    return thai ? "Android ไม่ยอมติดตั้งทับ เพราะแอปนี้เซ็นด้วย key อื่น ให้ patch เองด้วย Morphe Desktop"
                            : "Android refused to install over this app, which has another signing key. Patch the update with Morphe Desktop.";
                }
                return (thai ? "Android ไม่ยอมติดตั้ง" : "Android refused the install") + detail + (thai ? "" : ".");
            case PackageInstaller.STATUS_FAILURE_STORAGE:
                return thai ? "พื้นที่ไม่พอสำหรับติดตั้ง" : "Not enough space to install.";
            case PackageInstaller.STATUS_FAILURE_BLOCKED:
                return thai ? "Android ไม่ให้ติดตั้ง" : "Android blocked the install.";
            case PackageInstaller.STATUS_FAILURE_INVALID:
                return (thai ? "Android บอกว่าไฟล์ใช้ไม่ได้" : "Android says the file is invalid") + detail + (thai ? "" : ".");
            default:
                return (thai ? "ติดตั้งไม่สำเร็จ" : "The install failed") + detail + (thai ? "" : ".") + tryAgain(thai);
        }
    }

    /** Every end of a job: the receiver goes, the file goes, the session is abandoned when asked, the job clears. */
    private static void done(Context app, Job job, String text, String log, boolean abandon) {
        BroadcastReceiver receiver = job.receiver;
        job.receiver = null;
        if (receiver != null) {
            try {
                app.getApplicationContext().unregisterReceiver(receiver);
            } catch (RuntimeException ignored) {
                // Already gone.
            }
        }
        if (abandon && job.sessionId >= 0) {
            try {
                app.getPackageManager().getPackageInstaller().abandonSession(job.sessionId);
            } catch (RuntimeException ignored) {
                // Finished or gone already.
            }
        }
        File file = job.file;
        if (file != null) delete(file);
        job.confirm = null;
        if (current == job) current = null;
        ReportLog.i(TAG, "Update install: " + log);
        if (text != null) status(job, text, false);
    }

    private static void status(Job job, String text, boolean busy) {
        job.text = text;
        job.busy = busy;
        try {
            Utils.runOnMainThread(() -> {
                Listener listener = job.listener;
                if (listener != null) listener.show(text, busy);
            });
        } catch (RuntimeException error) {
            ReportLog.w(TAG, "update status not shown", error);
        }
    }

    private static void delete(File file) {
        if (file.exists() && !file.delete()) ReportLog.w(TAG, "update file not deleted: " + file);
    }
}
