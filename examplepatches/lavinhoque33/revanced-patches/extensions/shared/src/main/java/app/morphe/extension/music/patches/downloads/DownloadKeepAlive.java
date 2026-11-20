/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-19.
 */
package app.morphe.extension.music.patches.downloads;

import static app.morphe.extension.shared.utils.StringRef.str;

import android.annotation.SuppressLint;
import android.app.Notification;
import android.app.NotificationManager;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ServiceInfo;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.os.PowerManager;

import androidx.annotation.Nullable;

import java.util.LinkedHashSet;
import java.util.Set;

import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;

/** Borrows the stock dataSync service, including on root mounts with an unchanged manifest. */
@SuppressWarnings("unused") // Lifecycle calls and supported() are installed by the downloads patch.
public final class DownloadKeepAlive {
    private static final String SERVICE =
            "com.google.android.libraries.youtube.offline.transfer.service.OfflineKeepAliveService";
    private static final String START = "app.morphe.music.downloads.KEEP_ALIVE";
    private static final int NOTIFICATION_ID = 0x5256584d;
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final Set<Hold> HOLDS = new LinkedHashSet<>();
    private static final Runnable UPDATE = DownloadKeepAlive::update;

    // Only the main thread touches the service, the holders and their notification state.
    private static Service instance;
    private static PowerManager.WakeLock wakeLock;
    private static boolean requested;
    private static boolean stockAttached;
    private static boolean stockStarted;
    private static boolean foreground;
    private static boolean stopping;
    private static boolean updateScheduled;
    private static boolean shown;
    private static int startId;

    private DownloadKeepAlive() {}

    static boolean supported() {
        return false;
    }

    static Hold acquire(String key, @Nullable String title) {
        Hold hold = new Hold(key, title);
        if (supported()) Utils.runOnMainThreadNowOrLater(() -> add(hold));
        return hold;
    }

    static final class Hold implements AutoCloseable {
        private final String key;
        private volatile String title;
        private String text;
        private String waiting;
        private int progress = -1;
        private volatile boolean timedOut;
        private boolean finished;
        private boolean closed;

        Hold(String key, @Nullable String title) {
            this.key = key;
            this.title = title;
            text = str("morphe_music_downloads_starting");
        }

        @Nullable
        String title() {
            return title;
        }

        String key() {
            return key;
        }

        void progress(@Nullable String title, int progress, String text) {
            this.title = title;
            if (!supported()) {
                LocalDownloadManager.showDownloadNotification(key, title, progress, true, text);
                return;
            }
            MAIN.post(() -> {
                if (!HOLDS.contains(this)) return;

                this.progress = progress;
                this.text = text;
                if (current() == this) scheduleUpdate();
            });
        }

        void waiting(@Nullable String text) {
            if (!supported()) {
                if (text != null) LocalDownloadManager.showDownloadNotification(key, title, -1, true, text);
                return;
            }
            MAIN.post(() -> {
                if (!HOLDS.contains(this)) return;

                waiting = text;
                if (current() == this) scheduleUpdate();
            });
        }

        boolean timedOut() {
            return timedOut;
        }

        synchronized boolean finish() {
            if (timedOut) return false;

            finished = true;
            return true;
        }

        synchronized void timeOut() {
            if (!finished) timedOut = true;
        }

        @Override public void close() {
            synchronized (this) {
                if (closed) return;
                closed = true;
            }
            if (supported()) Utils.runOnMainThread(() -> remove(this));
        }
    }

    @Nullable
    private static Hold current() {
        return HOLDS.isEmpty() ? null : HOLDS.iterator().next();
    }

    private static void add(Hold hold) {
        boolean first = HOLDS.isEmpty();
        HOLDS.add(hold);
        if (!first) return;

        if (instance == null && !requested) start();
        if (!requested) scheduleUpdate();
    }

    private static void remove(Hold hold) {
        boolean current = hold == current();
        if (!HOLDS.remove(hold) || !current) return;

        if (HOLDS.isEmpty()) {
            clearUpdate();
            stopIfIdle();
        } else {
            scheduleUpdate();
        }
    }

    private static void start() {
        requested = true;
        try {
            Context context = Utils.getContext();
            Intent intent = new Intent(START).setClassName(context, SERVICE);
            if (context.startForegroundService(intent) == null) {
                requested = false;
                Logger.printWarn(() -> "DownloadKeepAlive: stock service is unavailable");
            }
        } catch (RuntimeException failure) {
            requested = false;
            Logger.printWarn(() -> "DownloadKeepAlive: service start refused; continuing transfer", failure);
        }
    }

    private static void scheduleUpdate() {
        if (updateScheduled) return;

        updateScheduled = true;
        MAIN.postDelayed(UPDATE, 500);
    }

    private static void clearUpdate() {
        MAIN.removeCallbacks(UPDATE);
        updateScheduled = false;
    }

    private static Notification notification(Context context, @Nullable Hold hold) {
        return LocalDownloadManager.buildDownloadNotification(context,
                hold == null ? null : hold.title, hold == null || hold.waiting != null ? -1 : hold.progress, true,
                hold == null ? str("morphe_music_downloads_starting")
                        : hold.waiting == null ? hold.text : hold.waiting);
    }

    @SuppressLint("NotificationPermission")
    private static void update() {
        updateScheduled = false;
        Hold hold = current();
        if (hold == null) return;

        Context context = Utils.getContext();
        NotificationManager manager = LocalDownloadManager.notificationManager(context);
        if (manager == null || !manager.areNotificationsEnabled()) return;

        try {
            manager.notify(NOTIFICATION_ID, notification(context, hold));
            shown = true;
        } catch (RuntimeException failure) {
            Logger.printWarn(() -> "DownloadKeepAlive: progress notification unavailable", failure);
        }
    }

    private static void cancelNotification() {
        if (!shown) return;
        shown = false;

        NotificationManager manager = LocalDownloadManager.notificationManager(Utils.getContext());
        try {
            if (manager != null) manager.cancel(NOTIFICATION_ID);
        } catch (RuntimeException failure) {
            Logger.printWarn(() -> "DownloadKeepAlive: could not clear progress notification", failure);
        }
    }

    private static void stopIfIdle() {
        if (HOLDS.isEmpty() && !requested) stop();
    }

    private static void stop() {
        releaseWakeLock();
        if (instance != null && startId != 0) {
            try {
                if (foreground && !stockAttached) instance.stopForeground(true);
                foreground = false;
                if (!stockStarted) stopping = instance.stopSelfResult(startId);
            } catch (RuntimeException failure) {
                Logger.printWarn(() -> "DownloadKeepAlive: could not stop stock service", failure);
            }
            startId = 0;
        }
        cancelNotification();
    }

    private static void keepCpuAwake(Service service) {
        if (wakeLock != null || HOLDS.isEmpty()) return;

        try {
            PowerManager power = service.getSystemService(PowerManager.class);
            if (power == null) return;

            // The stock manifest already grants WAKE_LOCK; this lock has the same lifetime as active downloads.
            PowerManager.WakeLock lock = power.newWakeLock(PowerManager.PARTIAL_WAKE_LOCK, "RVX:MusicDownload");
            lock.acquire();
            wakeLock = lock;
        } catch (RuntimeException failure) {
            Logger.printWarn(() -> "DownloadKeepAlive: could not keep CPU awake", failure);
        }
    }

    private static void releaseWakeLock() {
        if (wakeLock == null) return;

        wakeLock.release();
        wakeLock = null;
    }

    /** After stock field initialization, before its private foreground helper. */
    public static boolean onCreate(Service service) {
        instance = service;
        stockAttached = !requested;
        Logger.printInfo(() -> "DownloadKeepAlive: created " + (stockAttached ? "by Music" : "for RVX"));
        return !stockAttached;
    }

    /** If stock binds to an RVX instance, the caller runs the stock foreground helper we skipped on create. */
    public static boolean onBind(Service service) {
        if (instance != service || stockAttached) return false;

        attachStock();
        return true;
    }

    private static void attachStock() {
        stockAttached = true;
        foreground = false;
        if (!HOLDS.isEmpty()) scheduleUpdate();
        Logger.printInfo(() -> "DownloadKeepAlive: stock attached to RVX instance");
    }

    public static boolean onStart(Service service, @Nullable Intent intent, int id) {
        if (intent == null || !START.equals(intent.getAction())) {
            if (!stockAttached) attachStock();
            stockStarted = true;
            return false;
        }

        requested = false;
        startId = id;
        stopping = false;
        try {
            // A delivered foreground start must be promoted before it can be stopped, even with zero holders.
            Notification notification = notification(service, current());
            if (Build.VERSION.SDK_INT >= 29) {
                service.startForeground(NOTIFICATION_ID, notification, ServiceInfo.FOREGROUND_SERVICE_TYPE_DATA_SYNC);
            } else {
                service.startForeground(NOTIFICATION_ID, notification);
            }
            shown = true;
            foreground = !stockAttached;
            keepCpuAwake(service);
            Logger.printInfo(() -> "DownloadKeepAlive: promoted, holders=" + HOLDS.size());
            NotificationManager manager = LocalDownloadManager.notificationManager(service);
            if (manager == null || !manager.areNotificationsEnabled()) {
                Logger.printInfo(() -> "DownloadKeepAlive: notifications disabled; continuing transfer");
            }
        } catch (RuntimeException failure) {
            Logger.printWarn(() -> "DownloadKeepAlive: promotion refused; continuing transfer", failure);
            if (!stockAttached) {
                stop();
                stopping = false; // Do not loop on a policy refusal.
            }
            if (!HOLDS.isEmpty()) scheduleUpdate();
            return !stockAttached;
        }

        if (stockAttached) {
            // The stock start command restores its own foreground notification after the racing RVX start.
            MAIN.post(DownloadKeepAlive::stopIfIdle);
            if (!HOLDS.isEmpty()) scheduleUpdate();
            return false;
        }
        stopIfIdle();
        return true;
    }

    public static boolean onDestroy(Service service) {
        if (instance != service) return false;

        boolean onlyOurs = !stockAttached;
        boolean restart = (stockAttached || stopping) && !HOLDS.isEmpty() && !requested;
        Logger.printInfo(() -> "DownloadKeepAlive: destroyed, RVX only=" + onlyOurs);
        instance = null;
        stockAttached = stockStarted = foreground = stopping = false;
        startId = 0;
        releaseWakeLock();
        cancelNotification();
        if (restart) start();
        if (!HOLDS.isEmpty() && !requested) scheduleUpdate();
        return onlyOurs;
    }

    public static boolean onTimeout(Service service) {
        if (instance != service) return false;

        boolean onlyOurs = !stockAttached;
        if (!onlyOurs && HOLDS.isEmpty()) return false;

        Logger.printWarn(() -> "DownloadKeepAlive: dataSync timeout; stopping active transfers");
        for (Hold hold : HOLDS) hold.timeOut();
        HOLDS.clear();
        clearUpdate();
        if (onlyOurs) {
            stop();
        } else {
            // Let Music handle its own timeout and teardown. Only stop our transfers and notification.
            startId = 0;
            releaseWakeLock();
            cancelNotification();
        }
        DownloadNetwork.wakeWaiters();
        return onlyOurs;
    }
}
