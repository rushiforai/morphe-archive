package app.tadikwa.googleclockdiag;

import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.content.pm.ServiceInfo;
import android.media.MediaMetadata;
import android.media.session.PlaybackState;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Environment;
import android.provider.MediaStore;
import android.util.Log;
import android.widget.Toast;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

@SuppressWarnings({"unused", "deprecation"})
public final class DiagLogger {
    private static final String TAG = "ClockMorpheDiag";
    private static final String YTM = "app.morphe.android.apps.youtube.music";
    private static final String FILE_NAME = "ClockMorpheDiag-LAST.txt";
    private static final Object LOCK = new Object();

    private static volatile Context context;
    private static volatile BufferedWriter writer;
    private static volatile String displayPath = "(not initialized)";
    private static volatile boolean timerStarted = false;

    private DiagLogger() {}

    public static void init(Context ctx) {
        if (ctx == null) {
            Log.e(TAG, "init(Context) called with null");
            return;
        }

        synchronized (LOCK) {
            if (writer != null) return;

            context = ctx.getApplicationContext();

            try {
                if (Build.VERSION.SDK_INT >= 29) {
                    ContentResolver resolver = context.getContentResolver();

                    ContentValues values = new ContentValues();
                    values.put(MediaStore.MediaColumns.DISPLAY_NAME, FILE_NAME);
                    values.put(MediaStore.MediaColumns.MIME_TYPE, "text/plain");
                    values.put(
                        MediaStore.MediaColumns.RELATIVE_PATH,
                        Environment.DIRECTORY_DOWNLOADS
                    );

                    Uri uri = resolver.insert(
                        MediaStore.Downloads.EXTERNAL_CONTENT_URI,
                        values
                    );

                    if (uri == null) {
                        throw new IllegalStateException("MediaStore insert returned null");
                    }

                    OutputStream output = resolver.openOutputStream(uri, "wt");
                    if (output == null) {
                        throw new IllegalStateException("openOutputStream returned null");
                    }

                    writer = new BufferedWriter(
                        new OutputStreamWriter(output, StandardCharsets.UTF_8)
                    );
                    displayPath = "Download/" + FILE_NAME;
                } else {
                    File dir = context.getExternalFilesDir(
                        Environment.DIRECTORY_DOWNLOADS
                    );
                    if (dir == null) {
                        throw new IllegalStateException("getExternalFilesDir returned null");
                    }

                    File file = new File(dir, FILE_NAME);
                    writer = new BufferedWriter(new FileWriter(file, false));
                    displayPath = file.getAbsolutePath();
                }
            } catch (Throwable publicError) {
                Log.e(TAG, "Public Download log creation failed", publicError);

                try {
                    File dir = context.getExternalFilesDir(null);
                    if (dir == null) {
                        throw new IllegalStateException(
                            "fallback getExternalFilesDir returned null"
                        );
                    }

                    File file = new File(dir, FILE_NAME);
                    writer = new BufferedWriter(new FileWriter(file, false));
                    displayPath = file.getAbsolutePath();
                } catch (Throwable fallbackError) {
                    Log.e(TAG, "Fallback log creation failed", fallbackError);

                    try {
                        Toast.makeText(
                            ctx,
                            "Clock diag: impossible de créer le fichier",
                            Toast.LENGTH_LONG
                        ).show();
                    } catch (Throwable ignored) {}

                    return;
                }
            }

            raw("============================================================");
            raw("CLOCK / MORPHE / YT MUSIC DIAGNOSTIC SESSION v1.6");
            raw("Started: " + now());
            raw("Log: " + displayPath);
            raw("Android: " + Build.VERSION.RELEASE + " / API " + Build.VERSION.SDK_INT);
            raw("Device: " + Build.MANUFACTURER + " " + Build.MODEL);
            raw("Clock package: " + context.getPackageName());
            raw("============================================================");

            snapshotPackagesAndService();

            try {
                Toast.makeText(
                    ctx,
                    "Diagnostic actif : " + displayPath,
                    Toast.LENGTH_LONG
                ).show();
            } catch (Throwable ignored) {}

            startTimerOnce();
        }
    }

    public static void browserConnected() {
        event("MEDIABROWSER_ON_CONNECTED", "");
    }

    public static void browserConnectionFailed() {
        event("MEDIABROWSER_ON_CONNECTION_FAILED", "");
    }

    public static void browserConnectionSuspended() {
        event("MEDIABROWSER_ON_CONNECTION_SUSPENDED", "");
    }

    public static void controllerSessionDestroyed() {
        event("MEDIA_CONTROLLER_SESSION_DESTROYED", "");
    }

    public static void connectRequest(Object provider) {
        event("CLOCK_CONNECT_REQUEST", "provider=" + describe(provider));
    }

    public static void subscribe(String parentId, Bundle options) {
        event(
            "MEDIABROWSER_SUBSCRIBE",
            "parentId=" + safe(parentId) + " options=" + bundle(options)
        );
    }

    public static void children(String parentId, List<?> children) {
        event(
            "MEDIABROWSER_ON_CHILDREN_LOADED",
            "parentId=" + safe(parentId)
                + " count=" + (children == null ? -1 : children.size())
                + " values=" + truncate(String.valueOf(children), 7000)
        );
    }

    public static void browserError(String parentId) {
        event("MEDIABROWSER_ON_ERROR", "parentId=" + safe(parentId));
    }

    public static void playback(PlaybackState state) {
        if (state == null) {
            event("MEDIA_CONTROLLER_PLAYBACK_STATE", "null");
            return;
        }

        String detail =
            "state=" + state.getState()
            + " position=" + state.getPosition()
            + " buffered=" + state.getBufferedPosition()
            + " speed=" + state.getPlaybackSpeed()
            + " actions=0x" + Long.toHexString(state.getActions())
            + " errorMessage=" + safe(String.valueOf(state.getErrorMessage()))
            + " extras=" + bundle(state.getExtras())
            + " raw=" + truncate(String.valueOf(state), 5000);

        event("MEDIA_CONTROLLER_PLAYBACK_STATE", detail);
    }

    public static void mediaMetadata(MediaMetadata metadata) {
        event(
            "MEDIA_CONTROLLER_METADATA",
            truncate(String.valueOf(metadata), 5000)
        );
    }

    public static void mediaExtras(Bundle extras) {
        event("MEDIA_CONTROLLER_EXTRAS", bundle(extras));
    }

    public static void queue(List<?> queue) {
        event(
            "MEDIA_CONTROLLER_QUEUE",
            queue == null
                ? "null"
                : "count=" + queue.size()
                    + " values=" + truncate(String.valueOf(queue), 5000)
        );
    }

    public static void sessionEvent(String name, Bundle extras) {
        event(
            "MEDIA_CONTROLLER_SESSION_EVENT",
            "name=" + safe(name) + " extras=" + bundle(extras)
        );
    }

    public static void statusArgs(
        Object provider,
        int appState,
        int searchApi,
        int browseApi,
        int fireApi,
        int accountType
    ) {
        event(
            "MUSIC_PROVIDER_STATUS_INPUT",
            "provider=" + describe(provider)
                + " appState=" + appState
                + " searchAPI=" + searchApi
                + " browseAPI=" + browseApi
                + " fireAPI=" + fireApi
                + " accountType=" + accountType
        );
    }

    public static void statusOut(Object status) {
        event(
            "MUSIC_PROVIDER_STATUS_OUTPUT",
            truncate(String.valueOf(status), 5000)
        );
    }

    private static void snapshotPackagesAndService() {
        Context c = context;
        if (c == null) return;

        try {
            PackageManager pm = c.getPackageManager();

            try {
                android.content.pm.PackageInfo clock =
                    pm.getPackageInfo(c.getPackageName(), 0);
                raw(
                    "CLOCK_PACKAGE versionName=" + clock.versionName
                        + " versionCode="
                        + (Build.VERSION.SDK_INT >= 28
                            ? clock.getLongVersionCode()
                            : clock.versionCode)
                );
            } catch (Throwable t) {
                raw("CLOCK_PACKAGE_ERROR " + t);
            }

            try {
                android.content.pm.PackageInfo ytm =
                    pm.getPackageInfo(YTM, 0);
                raw(
                    "YTM_PACKAGE versionName=" + ytm.versionName
                        + " versionCode="
                        + (Build.VERSION.SDK_INT >= 28
                            ? ytm.getLongVersionCode()
                            : ytm.versionCode)
                );
            } catch (Throwable t) {
                raw("YTM_PACKAGE_ERROR " + t);
            }

            Intent intent = new Intent("android.media.browse.MediaBrowserService");
            intent.setPackage(YTM);

            List<ResolveInfo> services =
                pm.queryIntentServices(intent, PackageManager.MATCH_ALL);

            raw(
                "YTM_MEDIABROWSER_QUERY count="
                    + (services == null ? -1 : services.size())
            );

            if (services != null) {
                for (ResolveInfo info : services) {
                    ServiceInfo si = info.serviceInfo;
                    if (si == null) continue;

                    raw(
                        "YTM_MEDIABROWSER_SERVICE name=" + si.name
                            + " enabled=" + si.enabled
                            + " exported=" + si.exported
                            + " permission=" + safe(si.permission)
                            + " process=" + safe(si.processName)
                    );
                }
            }
        } catch (Throwable t) {
            raw("SNAPSHOT_ERROR " + throwable(t));
        }
    }

    private static void startTimerOnce() {
        synchronized (LOCK) {
            if (timerStarted) return;
            timerStarted = true;
        }

        Thread timer = new Thread(() -> {
            try {
                Thread.sleep(8000);
                raw("TIMER_8S_SPINNER_SNAPSHOT");
                dumpThreads();

                Thread.sleep(12000);
                raw("TIMER_20S_SPINNER_SNAPSHOT");
                dumpThreads();
            } catch (Throwable t) {
                raw("TIMER_ERROR " + throwable(t));
            }
        }, "ClockMorpheDiagTimer");

        timer.setDaemon(true);
        timer.start();
    }

    private static void dumpThreads() {
        try {
            Map<Thread, StackTraceElement[]> all =
                Thread.getAllStackTraces();

            for (Map.Entry<Thread, StackTraceElement[]> entry : all.entrySet()) {
                Thread thread = entry.getKey();

                raw(
                    "THREAD name=" + thread.getName()
                        + " state=" + thread.getState()
                );

                StackTraceElement[] stack = entry.getValue();
                int limit = Math.min(stack.length, 60);

                for (int i = 0; i < limit; i++) {
                    raw("  at " + stack[i]);
                }
            }
        } catch (Throwable t) {
            raw("THREAD_DUMP_ERROR " + throwable(t));
        }
    }

    private static void event(String name, String detail) {
        raw(
            now()
                + " [" + Thread.currentThread().getName() + "] "
                + name
                + (detail == null || detail.isEmpty() ? "" : " | " + detail)
        );
    }

    private static String bundle(Bundle bundle) {
        if (bundle == null) return "null";

        try {
            return truncate(
                "keys=" + bundle.keySet() + " raw=" + bundle,
                5000
            );
        } catch (Throwable t) {
            return "<bundle error: " + t + ">";
        }
    }

    private static String describe(Object value) {
        if (value == null) return "null";

        try {
            return value.getClass().getName()
                + " :: "
                + truncate(String.valueOf(value), 3000);
        } catch (Throwable t) {
            return "<describe error: " + t + ">";
        }
    }

    private static String throwable(Throwable t) {
        if (t == null) return "null";

        StringBuilder sb = new StringBuilder(
            t.getClass().getName() + ": " + safe(t.getMessage())
        );

        StackTraceElement[] stack = t.getStackTrace();
        int limit = Math.min(stack == null ? 0 : stack.length, 40);

        for (int i = 0; i < limit; i++) {
            sb.append("\n  at ").append(stack[i]);
        }

        return sb.toString();
    }

    private static String truncate(String value, int max) {
        if (value == null) return "null";
        if (value.length() <= max) return value;

        return value.substring(0, max)
            + "...<truncated "
            + (value.length() - max)
            + " chars>";
    }

    private static String safe(String value) {
        return value == null ? "null" : value;
    }

    private static String now() {
        return new SimpleDateFormat(
            "yyyy-MM-dd'T'HH:mm:ss.SSSZ",
            Locale.US
        ).format(new Date());
    }

    private static void raw(String text) {
        String value = text == null ? "null" : text;

        // Always mirror everything to Logcat as a second diagnostic channel.
        Log.i(TAG, value);

        synchronized (LOCK) {
            if (writer == null) return;

            try {
                writer.write(value);
                writer.newLine();
                writer.flush();
            } catch (Throwable t) {
                Log.e(TAG, "file write failed", t);
            }
        }
    }
}
