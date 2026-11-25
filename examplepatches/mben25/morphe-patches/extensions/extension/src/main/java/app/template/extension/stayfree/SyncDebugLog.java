package app.template.extension.stayfree;

import android.content.Context;
import android.util.Log;

import java.io.File;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/**
 * Appends every local-sync HTTP request to a plain-text file so a failing device pairing can be
 * diagnosed on-device without adb/logcat. Each line records the method, target (path + query, so
 * {@code install_id} and {@code code} are visible), whether it came over loopback (the app) or the
 * LAN (the browser extension), the response status, and the full stack trace of any failure.
 * <p>
 * The file lives in the app's external files dir when that is writable, so it can be pulled with
 * {@code adb pull} or read with a file manager:
 * <pre>
 * /sdcard/Android/data/com.burockgames.timeclocker/files/stayfree-sync.log
 * </pre>
 * On a patched build that dir is often never provisioned, so it falls back to the private files
 * dir, readable on a debuggable build with:
 * <pre>
 * adb shell run-as com.burockgames.timeclocker cat files/stayfree-sync.log
 * </pre>
 * It is best-effort: any I/O problem is swallowed so logging never breaks the server. The file is
 * capped at {@link #MAX_BYTES} and rotated once to keep it pullable.
 */
final class SyncDebugLog {
    private static final long MAX_BYTES = 512 * 1024;
    private static final int MAX_BODY_CHARS = 2048;

    private final File file;
    private final SimpleDateFormat timestamp = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS", Locale.US);
    /** The server logs every request, so a broken destination would otherwise spam logcat
     * several times a second and bury the very evidence this log exists to capture. */
    private boolean reportedFailure;

    SyncDebugLog(Context context) {
        // The external files dir is only usable once Android has provisioned it; on a patched
        // build with no storage permission it may never exist, and FileWriter then throws ENOENT
        // (or EACCES if the dir is created by hand) on *every* request. The private files dir
        // always exists and is readable with `adb run-as` on a debuggable build, so prefer it and
        // keep the external dir only when it is genuinely writable.
        File external = context.getExternalFilesDir(null);
        File dir = external != null && external.isDirectory() && external.canWrite()
                ? external
                : context.getFilesDir();
        this.file = new File(dir, "stayfree-sync.log");
    }

    synchronized void request(String method, String target, boolean loopback, String remote,
                              byte[] body, int status, Throwable failure) {
        try {
            ensureParent();
            rotateIfNeeded();
            try (PrintWriter out = new PrintWriter(new FileWriter(file, true))) {
                out.print(timestamp.format(new Date()));
                out.print("  ");
                out.print(loopback ? "APP " : "EXT ");
                out.print('[');
                out.print(remote == null ? "?" : remote);
                out.print("]  ");
                out.print(method);
                out.print(' ');
                out.print(target);
                out.print("  -> ");
                out.print(status);
                if (body != null && body.length > 0 && isPairingOrConfig(target)) {
                    String text = new String(body, StandardCharsets.UTF_8);
                    if (text.length() > MAX_BODY_CHARS) text = text.substring(0, MAX_BODY_CHARS) + "…";
                    out.print("  body=");
                    out.print(text.replace('\n', ' ').replace('\r', ' '));
                }
                out.println();
                if (failure != null) failure.printStackTrace(out);
            }
        } catch (Throwable t) {
            reportFailure(t);
        }
    }

    /** Every Retrofit base URL StayFree builds, and what it was rewritten to. */
    synchronized void baseUrl(String original, String rewritten) {
        try {
            ensureParent();
            rotateIfNeeded();
            try (PrintWriter out = new PrintWriter(new FileWriter(file, true))) {
                out.print(timestamp.format(new Date()));
                out.print("  BASEURL  ");
                out.print(original);
                if (rewritten != null && !rewritten.equals(original)) {
                    out.print("  -> ");
                    out.print(rewritten);
                }
                out.println();
            }
        } catch (Throwable t) {
            reportFailure(t);
        }
    }

    /**
     * A checkpoint in StayFree's own pairing path, with the two values that gate it. The code is
     * recorded as present/absent rather than verbatim: it is a live pairing secret, and whether
     * the stash survived is the only thing the diagnosis needs.
     */
    synchronized void probe(String tag, String code, boolean flag) {
        try {
            ensureParent();
            rotateIfNeeded();
            try (PrintWriter out = new PrintWriter(new FileWriter(file, true))) {
                out.print(timestamp.format(new Date()));
                out.print("  PROBE  ");
                out.print(tag);
                out.print("  code=");
                out.print(code == null ? "null" : "set(" + code.length() + ")");
                out.print("  flag=");
                out.println(flag);
            }
        } catch (Throwable t) {
            reportFailure(t);
        }
    }

    /**
     * A checkpoint carrying one arbitrary value — an enum constant, a status object, a null. Used
     * where the question is "what was this when execution got here", rather than the fixed
     * code/flag pair {@link #probe} records.
     *
     * <p>The value is rendered with {@code String.valueOf}, so an enum prints as its constant name
     * and a null prints as {@code null}. Nothing here is a secret: the pairing code is never passed
     * to this method, only to {@link #probe}, which redacts it.
     */
    synchronized void checkpoint(String tag, Object value) {
        try {
            ensureParent();
            rotateIfNeeded();
            try (PrintWriter out = new PrintWriter(new FileWriter(file, true))) {
                out.print(timestamp.format(new Date()));
                out.print("  PROBE  ");
                out.print(tag);
                out.print("  value=");
                out.println(String.valueOf(value));
            }
        } catch (Throwable t) {
            reportFailure(t);
        }
    }

    /** Reports the first write failure with its stack trace, then stays quiet. */
    private void reportFailure(Throwable t) {
        if (reportedFailure) return;
        reportedFailure = true;
        Log.w(LocalSync.TAG, "Could not write sync debug log to " + file
                + "; further write failures will not be logged", t);
    }

    private static boolean isPairingOrConfig(String target) {
        return target != null && (target.contains("pairing") || target.contains("sync/config")
                || target.contains("web/upload") || target.contains("devices"));
    }

    /** {@code FileWriter} will not create missing parent directories; the app's external files dir
     * often does not exist until something writes to it, so create it first. */
    private void ensureParent() {
        File dir = file.getParentFile();
        if (dir != null && !dir.isDirectory()) {
            //noinspection ResultOfMethodCallIgnored
            dir.mkdirs();
        }
    }

    private void rotateIfNeeded() {
        if (file.length() < MAX_BYTES) return;
        File old = new File(file.getPath() + ".1");
        //noinspection ResultOfMethodCallIgnored
        old.delete();
        //noinspection ResultOfMethodCallIgnored
        file.renameTo(old);
    }
}
