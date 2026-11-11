/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.ConnectivityManager;
import android.net.Network;
import android.net.NetworkCapabilities;
import android.os.Build;
import android.os.SystemClock;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.Executor;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.function.Consumer;

import app.hushtelegram.extension.shared.Logger;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Holds Telegram's automatic media downloads while Android's Data Saver restricts Telegram on a
 * metered network.
 *
 * <p>DownloadController answers whether a photo, video, file, voice message, song or story starts
 * downloading on its own: when a chat shows it, when a new message is put in the download queue,
 * and when that queue is read back to start. The patch asks {@link #hold} at the start of each
 * answer and answers no on yes, the way Telegram answers when automatic downloads are off for the
 * network. The network's download mask asks {@link #holdMask} and comes back with no media types,
 * so everything that reads it decides the same way. When the answer changes, Telegram's own check
 * from a network change runs again on each controller: it cancels the automatic loads its queue
 * started when the hold begins, and loads the queue again when it lifts. Loads a chat started as it
 * showed a message, and songs or stories loaded ahead, finish. What you tap still downloads, since
 * a tap doesn't ask.
 *
 * <p>The hold needs the switch on, HushTelegram not paused, Android reporting Data Saver on for
 * Telegram and the active network metered. Data Saver off or allowing Telegram, an unmetered
 * network, no network, or anything Android won't say leaves Telegram's own rules. Telegram's
 * network type, its data statistics and calls aren't touched.
 */
public final class DataSaverDownloads {
    private DataSaverDownloads() {}

    /** How long one answer from Android is used. Chat cells ask while they lay out, so it isn't asked each time. */
    static final long FRESH_MS = 1000;

    /** What Android says about Data Saver for Telegram. */
    public enum DataSaver { ON, OFF, ALLOWED, UNKNOWN }

    /** Android's two facts, as the settings row shows them. */
    public static final class Status {
        public final DataSaver dataSaver;
        /** Whether the active network is metered, or null when Android won't say or there's no network. */
        @Nullable public final Boolean metered;

        Status(DataSaver dataSaver, @Nullable Boolean metered) {
            this.dataSaver = dataSaver;
            this.metered = metered;
        }

        /** Whether these facts hold automatic downloads, the switch aside. */
        public boolean restricts() {
            return dataSaver == DataSaver.ON && Boolean.TRUE.equals(metered);
        }
    }

    /**
     * The last answer, when it was read, and how many changes Android had reported before it was
     * asked, kept together so a reader never mixes two readings.
     */
    private static final class Reading {
        final long at;
        final boolean restricts;
        final int changes;

        Reading(long at, boolean restricts, int changes) {
            this.at = at;
            this.restricts = restricts;
            this.changes = changes;
        }
    }

    @Nullable private static volatile Reading last;
    /** Changes Android reported. A reading asked before the latest one is never used. */
    private static final AtomicInteger changes = new AtomicInteger();

    /** Each DownloadController whose mask asked, one per account, kept no longer than Telegram keeps it. */
    private static final Map<Object, Boolean> controllers = Collections.synchronizedMap(new WeakHashMap<>());
    /** What the mask was last told, or null before it first asked. */
    @Nullable private static volatile Boolean lastMask;
    private static final AtomicBoolean watching = new AtomicBoolean();
    /** Tries at listening: the first, and one more after a refusal. */
    private static final AtomicInteger watchTries = new AtomicInteger(2);

    /** Where Telegram's check runs: the main thread, where its own runs after a network change. */
    static volatile Executor later = Utils::runOnMainThread;
    /** Telegram's check on one controller. */
    static volatile Consumer<Object> checker = DataSaverDownloads::checkAgain;

    /**
     * Injected at the start of DownloadController's answers about automatic downloads.
     *
     * @return true to answer no, so nothing starts downloading on its own
     */
    public static boolean hold() {
        HookStatus.invoked(FamilyNames.FASTER_DOWNLOADS);
        try {
            if (!Utils.settingsReady() || !Settings.DATA_SAVER_DOWNLOADS.get()) return false;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.FASTER_DOWNLOADS, "Data Saver switch", failure);
            return false;
        }
        watch();
        if (!restricted()) return false;
        HookStatus.counted(FamilyNames.FASTER_DOWNLOADS, "automatic download held for Data Saver");
        return true;
    }

    /**
     * Injected at the start of DownloadController.getCurrentDownloadMask, with the controller.
     * When the answer differs from the last one, Telegram's check runs again on every controller.
     *
     * @return true to answer no media types
     */
    public static boolean holdMask(@Nullable Object controller) {
        if (controller != null) controllers.put(controller, Boolean.TRUE);
        boolean held = hold();
        Boolean before = lastMask;
        lastMask = held;
        if (before != null && before != held) checkAllAgain();
        return held;
    }

    /**
     * Runs Telegram's download check on a DownloadController, the one it runs when the network
     * changes. The patch writes its body; unpatched, it does nothing.
     */
    public static void checkAgain(Object controller) {}

    /** Runs Telegram's check on each controller, later on the main thread, so its queue follows the new answer. */
    static void checkAllAgain() {
        List<Object> each;
        synchronized (controllers) {
            each = new ArrayList<>(controllers.keySet());
        }
        if (each.isEmpty()) return;
        later.execute(() -> {
            for (Object controller : each) {
                try {
                    checker.accept(controller);
                } catch (Throwable failure) {
                    HookStatus.threw(FamilyNames.FASTER_DOWNLOADS, "Data Saver download check", failure);
                }
            }
        });
    }

    /** Android changed Data Saver or the network: ask it again and let Telegram check its queue. */
    static void changed() {
        forget();
        checkAllAgain();
    }

    /**
     * Listens, from the first time the switch is found on, for Data Saver and the network's metering to change.
     * A refusal (an app already holding Android's 100 network callbacks gets one) is reported, and the next
     * switch read tries once more; after that, {@link #restricted()} re-reading Android every second still holds.
     */
    private static void watch() {
        if (watching.get()) return;
        Context context = Utils.getContext();
        if (context == null || !watching.compareAndSet(false, true)) return;
        BroadcastReceiver registered = null;
        try {
            BroadcastReceiver receiver = new BroadcastReceiver() {
                @Override public void onReceive(Context ignored, Intent intent) {
                    changed();
                }
            };
            IntentFilter filter = new IntentFilter(ConnectivityManager.ACTION_RESTRICT_BACKGROUND_CHANGED);
            if (Build.VERSION.SDK_INT >= 33) {
                context.registerReceiver(receiver, filter, Context.RECEIVER_NOT_EXPORTED);
            } else {
                context.registerReceiver(receiver, filter);
            }
            registered = receiver;
            ConnectivityManager connectivity = context.getSystemService(ConnectivityManager.class);
            if (connectivity != null) connectivity.registerDefaultNetworkCallback(new Metering());
        } catch (RuntimeException failure) {
            HookStatus.threw(FamilyNames.FASTER_DOWNLOADS, "Data Saver watch", failure);
            // The retry registers the receiver again, so this one goes.
            if (registered != null) {
                try {
                    context.unregisterReceiver(registered);
                } catch (IllegalArgumentException notRegistered) {
                    Logger.printDebug(() -> "Data Saver: receiver already gone: " + notRegistered);
                }
            }
            if (watchTries.decrementAndGet() > 0) watching.set(false);
        }
    }

    /** Says when the default network's metering changes or the network goes. */
    private static final class Metering extends ConnectivityManager.NetworkCallback {
        /** The last metering seen, or -1 with no network. Only Android's callback thread touches it. */
        private int seen = -1;

        @Override public void onCapabilitiesChanged(@NonNull Network network, @NonNull NetworkCapabilities capabilities) {
            int now = (capabilities.hasCapability(NetworkCapabilities.NET_CAPABILITY_NOT_METERED) ? 1 : 0)
                    | (Build.VERSION.SDK_INT >= 30
                        && capabilities.hasCapability(NetworkCapabilities.NET_CAPABILITY_TEMPORARILY_NOT_METERED) ? 2 : 0);
            if (now == seen) return;
            seen = now;
            changed();
        }

        @Override public void onLost(@NonNull Network network) {
            seen = -1;
            changed();
        }
    }

    /** Whether Android restricts Telegram now, asked at most once every {@link #FRESH_MS}. */
    private static boolean restricted() {
        long now = SystemClock.elapsedRealtime();
        int heard = changes.get();
        Reading reading = last;
        if (reading != null && reading.changes == heard && now - reading.at >= 0 && now - reading.at < FRESH_MS) {
            return reading.restricts;
        }
        boolean restricts = status(Utils.getContext()).restricts();
        // A change heard while Android was asked makes this reading old; the next question asks again.
        last = new Reading(now, restricts, heard);
        return restricts;
    }

    /** Drops the last answer, so the next question asks Android again. */
    static void forget() {
        changes.incrementAndGet();
        last = null;
    }

    /**
     * The settings switch was flipped and saved: Telegram checks its queue against the new answer,
     * as it does after a network change.
     */
    public static void switched() {
        changed();
    }

    /** Forgets the controllers, the mask's last answer and the watch, for tests, where each gets a new app. */
    static void reset() {
        controllers.clear();
        lastMask = null;
        watching.set(false);
        watchTries.set(2);
        last = null;
        later = Utils::runOnMainThread;
        checker = DataSaverDownloads::checkAgain;
    }

    /** What Android says now. Each fact it won't give is unknown, which never holds anything. */
    public static Status status(@Nullable Context context) {
        DataSaver dataSaver = DataSaver.UNKNOWN;
        Boolean metered = null;
        ConnectivityManager connectivity = null;
        try {
            if (context != null) connectivity = context.getSystemService(ConnectivityManager.class);
        } catch (RuntimeException failure) {
            Logger.printDebug(() -> "Data Saver: no connectivity service: " + failure);
        }
        if (connectivity == null) return new Status(dataSaver, null);
        try {
            switch (connectivity.getRestrictBackgroundStatus()) {
                case ConnectivityManager.RESTRICT_BACKGROUND_STATUS_ENABLED:
                    dataSaver = DataSaver.ON;
                    break;
                case ConnectivityManager.RESTRICT_BACKGROUND_STATUS_WHITELISTED:
                    dataSaver = DataSaver.ALLOWED;
                    break;
                case ConnectivityManager.RESTRICT_BACKGROUND_STATUS_DISABLED:
                    dataSaver = DataSaver.OFF;
                    break;
                default:
                    break;
            }
        } catch (RuntimeException failure) {
            Logger.printDebug(() -> "Data Saver: status unreadable: " + failure);
        }
        try {
            // With no network Android calls it metered, which would hold the first downloads on Wi-Fi.
            if (connectivity.getActiveNetwork() != null) metered = connectivity.isActiveNetworkMetered();
        } catch (RuntimeException failure) {
            Logger.printDebug(() -> "Data Saver: metered unreadable: " + failure);
        }
        return new Status(dataSaver, metered);
    }
}
