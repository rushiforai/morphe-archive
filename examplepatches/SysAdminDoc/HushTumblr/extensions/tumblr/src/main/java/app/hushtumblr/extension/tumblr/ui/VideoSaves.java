/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.ui;

import android.Manifest;
import android.app.Activity;
import android.app.Application;
import android.app.DownloadManager;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Environment;

import java.util.HashSet;
import java.util.Locale;
import java.util.Set;

import app.hushtumblr.extension.shared.L10n;
import app.hushtumblr.extension.shared.Utils;
import app.hushtumblr.extension.shared.diagnostics.HookStatus;
import app.hushtumblr.extension.tumblr.settings.FamilyNames;

/**
 * Save video, the third choice in Share video links' menu. Android's DownloadManager fetches the
 * video into Download itself, so Android 10 and newer ask for no storage permission. Android 8 and
 * 9 need Tumblr's own storage permission, which Tumblr asks for when it saves a photo, so a save
 * there without it asks first and goes ahead once it's allowed. A toast says when the file is in,
 * or that it failed.
 */
final class VideoSaves {
    /** Only Android's download service can send this, so no other app can fake a finished save. */
    static final String SENDER_PERMISSION = "android.permission.SEND_DOWNLOAD_COMPLETED_INTENTS";
    static final int PERMISSION_REQUEST = 0x4855;

    /** Saves still downloading, by DownloadManager id. Touched on the main thread only. */
    private static final Set<Long> PENDING = new HashSet<>();
    private static Context listening;
    /** The save waiting on Android 8 and 9's storage prompt, if one is. */
    private static AfterPrompt asking;

    private VideoSaves() {}

    /** Whether [address] is a web address DownloadManager can fetch. */
    static boolean savable(String address) {
        if (address == null) return false;
        String scheme = Uri.parse(address).getScheme();
        return "https".equalsIgnoreCase(scheme) || "http".equalsIgnoreCase(scheme);
    }

    static void save(Context context, String address) {
        try {
            if (Build.VERSION.SDK_INT < Build.VERSION_CODES.Q && !canWrite(context)) {
                askThenSave(context, address);
                return;
            }
            Context app = context.getApplicationContext();
            DownloadManager manager = (DownloadManager) app.getSystemService(Context.DOWNLOAD_SERVICE);
            String name = fileName(address);
            DownloadManager.Request request = new DownloadManager.Request(Uri.parse(address))
                    .setMimeType(mimeType(name))
                    .setTitle(name)
                    .setNotificationVisibility(DownloadManager.Request.VISIBILITY_VISIBLE_NOTIFY_COMPLETED)
                    .setDestinationInExternalPublicDir(Environment.DIRECTORY_DOWNLOADS, name);
            if (Build.VERSION.SDK_INT < Build.VERSION_CODES.Q) letTheGallerySee(request);
            long id = manager.enqueue(request);
            listen(app, id);
            HookStatus.counted(FamilyNames.SHARE_VIDEO_LINKS, "video save started");
            Utils.showToastShort(L10n.t("Saving to Downloads"));
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SHARE_VIDEO_LINKS, "video save", failure);
            Utils.showToastLong(L10n.t("Couldn't save the video"));
        }
    }

    /**
     * Android 8 and 9 leave a download out of the media scan unless asked, so the gallery wouldn't
     * show the video. Android 10 and newer scan Download on their own and ignore this.
     */
    @SuppressWarnings("deprecation")
    private static void letTheGallerySee(DownloadManager.Request request) {
        request.allowScanningByMediaScanner();
    }

    private static boolean canWrite(Context context) {
        return context.checkSelfPermission(Manifest.permission.WRITE_EXTERNAL_STORAGE) == PackageManager.PERMISSION_GRANTED;
    }

    /**
     * Android 8 and 9 without storage access: asks for it, and once Tumblr's screen is back from
     * Android's prompt, saves if it was allowed. No second tap, so no toast has to ask for one.
     */
    private static void askThenSave(Context context, String address) {
        Activity activity = activityOf(context);
        if (activity == null) throw new IllegalStateException("no screen to ask for storage from");
        Application app = activity.getApplication();
        // A second Save before the prompt is answered replaces the first.
        if (asking != null) app.unregisterActivityLifecycleCallbacks(asking);
        asking = null;
        activity.requestPermissions(new String[] {Manifest.permission.WRITE_EXTERNAL_STORAGE}, PERMISSION_REQUEST);
        // Armed only once the prompt is on its way, so a request that throws leaves nothing waiting
        // for some later, unrelated return to the screen. The prompt shows after this returns.
        asking = new AfterPrompt(activity, address);
        app.registerActivityLifecycleCallbacks(asking);
    }

    /** Waits for the screen that asked to pause for Android's prompt and come back to it. */
    private static final class AfterPrompt implements Application.ActivityLifecycleCallbacks {
        private final Activity asked;
        private final String address;
        private boolean left;

        AfterPrompt(Activity asked, String address) {
            this.asked = asked;
            this.address = address;
        }

        @Override public void onActivityPaused(Activity activity) {
            if (activity == asked) left = true;
        }

        @Override public void onActivityResumed(Activity activity) {
            if (activity != asked || !left) return;
            try {
                done();
                if (canWrite(activity)) save(activity, address);
                else Utils.showToastLong(L10n.t("Couldn't save the video"));
            } catch (Throwable failure) {
                HookStatus.threw(FamilyNames.SHARE_VIDEO_LINKS, "video save after storage prompt", failure);
            }
        }

        @Override public void onActivityDestroyed(Activity activity) {
            if (activity == asked) done();
        }

        private void done() {
            asked.getApplication().unregisterActivityLifecycleCallbacks(this);
            if (asking == this) asking = null;
        }

        @Override public void onActivityCreated(Activity activity, Bundle state) {}
        @Override public void onActivityStarted(Activity activity) {}
        @Override public void onActivityStopped(Activity activity) {}
        @Override public void onActivitySaveInstanceState(Activity activity, Bundle state) {}
    }

    /**
     * The address's own file name, such as tumblr_abc123_720.mp4, with anything a file name can't
     * hold swapped for an underscore. DownloadManager adds a number when that name is taken.
     */
    static String fileName(String address) {
        String last = Uri.parse(address).getLastPathSegment();
        String name = last == null ? "" : last.replaceAll("[^A-Za-z0-9._-]", "_");
        if (name.length() > 100) name = name.substring(name.length() - 100);
        // After the trim, so a cut landing on a dot can't make a hidden file.
        name = name.replaceAll("^[._]+", "");
        if (name.isEmpty()) name = "tumblr_video";
        String lower = name.toLowerCase(Locale.ROOT);
        if (!lower.endsWith(".mp4") && !lower.endsWith(".webm") && !lower.endsWith(".mov")) name += ".mp4";
        return name;
    }

    static String mimeType(String name) {
        String lower = name.toLowerCase(Locale.ROOT);
        if (lower.endsWith(".webm")) return "video/webm";
        if (lower.endsWith(".mov")) return "video/quicktime";
        return "video/mp4";
    }

    private static void listen(Context app, long id) {
        Utils.runOnMainThread(() -> {
            try {
                PENDING.add(id);
                if (listening != null) return;
                IntentFilter filter = new IntentFilter(DownloadManager.ACTION_DOWNLOAD_COMPLETE);
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
                    app.registerReceiver(FINISHED, filter, SENDER_PERMISSION, null, Context.RECEIVER_EXPORTED);
                } else {
                    app.registerReceiver(FINISHED, filter, SENDER_PERMISSION, null);
                }
                listening = app;
            } catch (Throwable failure) {
                // The save still runs and Android's own notification still says when it's done.
                PENDING.remove(id);
                HookStatus.threw(FamilyNames.SHARE_VIDEO_LINKS, "video save listener", failure);
            }
        });
    }

    private static final BroadcastReceiver FINISHED = new BroadcastReceiver() {
        @Override public void onReceive(Context context, Intent intent) {
            try {
                if (intent == null || !DownloadManager.ACTION_DOWNLOAD_COMPLETE.equals(intent.getAction())) return;
                long id = intent.getLongExtra(DownloadManager.EXTRA_DOWNLOAD_ID, -1);
                if (!PENDING.remove(id)) return;
                boolean saved = succeeded(context, id);
                if (saved) HookStatus.counted(FamilyNames.SHARE_VIDEO_LINKS, "video saved");
                Utils.showToastLong(saved ? L10n.t("Video saved to Downloads") : L10n.t("Couldn't save the video"));
            } catch (Throwable failure) {
                HookStatus.threw(FamilyNames.SHARE_VIDEO_LINKS, "video save finished", failure);
            } finally {
                stopWhenIdle(this);
            }
        }
    };

    private static void stopWhenIdle(BroadcastReceiver receiver) {
        if (!PENDING.isEmpty() || listening == null) return;
        Context app = listening;
        listening = null;
        try {
            app.unregisterReceiver(receiver);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SHARE_VIDEO_LINKS, "video save listener", failure);
        }
    }

    private static boolean succeeded(Context context, long id) {
        DownloadManager manager = (DownloadManager) context.getSystemService(Context.DOWNLOAD_SERVICE);
        try (Cursor row = manager.query(new DownloadManager.Query().setFilterById(id))) {
            return row != null && row.moveToFirst()
                    && row.getInt(row.getColumnIndexOrThrow(DownloadManager.COLUMN_STATUS)) == DownloadManager.STATUS_SUCCESSFUL;
        }
    }

    /** Each Robolectric test runs in a fresh app, so the last one's listener and saves go with it. */
    static void forgetForTests() {
        PENDING.clear();
        listening = null;
        asking = null;
    }

    private static Activity activityOf(Context context) {
        for (Context at = context; at != null; at = at instanceof ContextWrapper ? ((ContextWrapper) at).getBaseContext() : null) {
            if (at instanceof Activity) return (Activity) at;
        }
        return null;
    }
}
