/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.content.Context;
import android.content.SharedPreferences;

import java.lang.reflect.Field;
import java.util.List;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Keeps Telegram's usage reports on the phone.
 *
 * <p>When the server's app config turns on {@code collectDeviceStats}, the messages controller's
 * {@code logDeviceStats()} classifies the selected root as emulated storage and reports that boolean as a
 * {@code help.saveAppLog} event. While you scroll a channel, Telegram also times how long each post
 * stays on screen and sends the batch as {@code messages.reportReadMetrics}. Both ask this class
 * first, and while the switch is on neither is read nor sent. Messages, calls, view counts and
 * everything else Telegram needs go on as before. Four verified Premium screen interactions also
 * ask before their telemetry send. Their payload construction and billing cleanup stay intact.
 *
 * <p>Telegram Beta also carries Firebase Crashlytics and Sessions. Those are stopped through the
 * switches the SDKs themselves read: Crashlytics' saved collection switch and Sessions' local
 * override. Firebase app init, Installations, Messaging and DataTransport aren't touched, so push
 * registration stays as it is.
 */
public final class Analytics {
    private Analytics() {}

    /**
     * Injected at the start of {@code logDeviceStats()}, with its messages controller. Counts a
     * skipped report only when the server requested one and Telegram hasn't already handled it.
     * True means return at once. A state lookup failure leaves Telegram's own path intact.
     */
    public static boolean skipDeviceStats(Object controller) {
        HookStatus.invoked(FamilyNames.DISABLE_ANALYTICS);
        try {
            if (!Utils.settingsReady() || !Settings.DISABLE_ANALYTICS.get()) return false;
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.DISABLE_ANALYTICS, "switch read", t);
            return false;
        }
        try {
            Field requested = controller.getClass().getField("collectDeviceStats");
            if (!requested.getBoolean(controller)) {
                HookStatus.counted(FamilyNames.DISABLE_ANALYTICS, "device stats report not requested");
                return false;
            }
            Field reported = requested.getDeclaringClass().getDeclaredField("loggedDeviceStats");
            reported.setAccessible(true);
            if (reported.getBoolean(controller)) {
                HookStatus.counted(FamilyNames.DISABLE_ANALYTICS, "device stats report already handled");
                return false;
            }
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.DISABLE_ANALYTICS, "device stats state read", t);
            return false;
        }
        HookStatus.counted(FamilyNames.DISABLE_ANALYTICS, "device stats report skipped");
        return true;
    }

    /**
     * Injected where a channel's read metrics are about to go out, with the batch waiting to be
     * sent. True means return without sending; the batch is emptied first, as Telegram empties it
     * after a send, so it doesn't pile up while you stay in the channel. Never throws.
     */
    public static boolean skipReadMetrics(List<?> pending) {
        if (!skip("read metrics report skipped")) return false;
        try {
            if (pending != null) pending.clear();
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.DISABLE_ANALYTICS, "read metrics clear", t);
        }
        return true;
    }

    /** Only verified Premium screen interactions are eligible; unknown and diagnostic types stay stock. */
    public static boolean skipPremiumAppLog(String type) {
        if (type == null) return false;
        switch (type) {
            case "premium.promo_screen_show": return skip("premium promo show report skipped");
            case "premium.promo_screen_tap": return skip("premium promo tap report skipped");
            case "premium.promo_screen_accept": return skip("premium promo accept report skipped");
            case "premium.promo_screen_fail": return skip("premium promo fail report skipped");
            default: return false;
        }
    }

    /** The preferences file Crashlytics keeps its collection switch in, and the switch. */
    static final String CRASHLYTICS_PREFS = "com.google.firebase.crashlytics";
    static final String CRASHLYTICS_COLLECTION = "firebase_crashlytics_collection_enabled";

    /** How long a Sessions read on a worker thread waits for the switch while the app starts. */
    static volatile long startupWaitMillis = 2_000L;

    /**
     * Injected at the start of Telegram Beta's {@code startAppCenterInternal}, which LaunchActivity
     * runs on every create. Stock, it hands Crashlytics your user ID, username and device details,
     * then turns its collection on, which the SDK saves. True skips all of that and saves collection
     * off in its place, the value {@code setCrashlyticsCollectionEnabled(false)} would save.
     *
     * <p>Crashlytics decides once per process, before the application's onCreate, from that saved
     * value first. So the start after the switch goes on, or after a fresh install, can still send,
     * and every start after it doesn't. With the switch off or HushTelegram paused, Telegram's own
     * start saves collection on again at the next launch, so stock behavior returns there; reports
     * Crashlytics kept on the phone meanwhile go out then, as they would have.
     */
    public static boolean skipCrashReporterStart() {
        if (!skip("crash reporter start skipped")) return false;
        keepCrashlyticsOff();
        return true;
    }

    /** Injected at the start of {@code appCenterLogInternal}, which hands a caught error to Crashlytics. True drops it. */
    public static boolean skipErrorReport() {
        return skip("error report skipped");
    }

    /**
     * Injected at each return of Firebase Sessions' local override reader, with the value it found
     * in the app's manifest metadata, or null when there's none. Sessions takes a non-null answer
     * over its remote settings, so false keeps it from collecting or sending session events in this
     * process too. It reads on a worker thread, possibly before the application's onCreate, so this
     * waits briefly for the switch there; anything else gives Telegram's own answer back.
     */
    public static Boolean sessionsEnabled(Boolean manifest) {
        HookStatus.invoked(FamilyNames.DISABLE_ANALYTICS);
        try {
            if (!Utils.awaitSettingsReady(startupWaitMillis)) {
                HookStatus.counted(FamilyNames.DISABLE_ANALYTICS, "session reports decided before app start");
                return manifest;
            }
            if (!Settings.DISABLE_ANALYTICS.get()) return manifest;
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.DISABLE_ANALYTICS, "switch read", t);
            return manifest;
        }
        HookStatus.counted(FamilyNames.DISABLE_ANALYTICS, "session reports turned off");
        return Boolean.FALSE;
    }

    /** Saves Crashlytics' own collection switch off, unless it already is. Never throws. */
    static void keepCrashlyticsOff() {
        try {
            Context context = Utils.getContext();
            if (context == null) return;
            SharedPreferences saved = context.getSharedPreferences(CRASHLYTICS_PREFS, Context.MODE_PRIVATE);
            if (saved.contains(CRASHLYTICS_COLLECTION) && !saved.getBoolean(CRASHLYTICS_COLLECTION, true)) return;
            saved.edit().putBoolean(CRASHLYTICS_COLLECTION, false).apply();
            HookStatus.counted(FamilyNames.DISABLE_ANALYTICS, "crash reports off from the next start");
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.DISABLE_ANALYTICS, "crash report switch", t);
        }
    }

    private static boolean skip(String what) {
        HookStatus.invoked(FamilyNames.DISABLE_ANALYTICS);
        try {
            if (!Utils.settingsReady() || !Settings.DISABLE_ANALYTICS.get()) return false;
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.DISABLE_ANALYTICS, "switch read", t);
            return false;
        }
        HookStatus.counted(FamilyNames.DISABLE_ANALYTICS, what);
        return true;
    }
}
