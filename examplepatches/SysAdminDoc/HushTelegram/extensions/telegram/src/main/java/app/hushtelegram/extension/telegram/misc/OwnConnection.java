/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import androidx.annotation.Nullable;

import java.util.function.Function;

import app.hushtelegram.extension.shared.Logger;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Keeps messages coming over Telegram's own connection when its server refuses the push sign-up.
 * A registered API pair has no push key on Telegram's side, so account.registerDevice answers
 * APP_PUSH_APIKEY_MISSING and no push ever comes (issues #5 and #16). Telegram already falls back
 * to its own connection on phones without Google Play, through two switches under Notifications
 * and Sounds: Keep-Alive Service ({@code pushService}) and Background Connection
 * ({@code pushConnection}). Neither is on by default where Google Play is, so a refused sign-up
 * left Telegram to wake up whenever Android let it.
 *
 * <p>On a refusal this turns both on, but only when the user has never set either, and remembers
 * that it did. A sign-up Firebase later gets accepted hands them back to Telegram's defaults, if
 * they're still as this left them. Switching either one in Telegram's settings is the user's
 * call and this never touches it again. Repair Firebase push registration off or Pause leaves
 * everything alone.
 *
 * <p>UnifiedPush gets the same treatment once Telegram has its address (#50). Telegram's servers
 * accept that sign-up, but on the S22 they never called the address for a message (2026-10-13,
 * 2026-10-29), so with Keep-Alive off messages waited until Telegram was opened.
 */
public final class OwnConnection {
    /** Telegram's global notification settings (MessagesController.getGlobalNotificationsSettings). */
    static final String TELEGRAM_PREFS = "Notifications";
    static final String KEEP_ALIVE = "pushService";
    static final String BACKGROUND = "pushConnection";
    /** Ours: set while both switches are on because of a refusal, so only we turn them back. */
    static final String PREFS = "hushtelegram_own_connection";
    static final String TURNED_ON = "turned_on";
    /** Ours: set beside {@link #TURNED_ON} when UnifiedPush rather than a refusal turned them on. */
    static final String BESIDE_UNIFIED_PUSH = "beside_unified_push";

    private OwnConnection() { }

    /** Where both settings live. Tests swap in stores whose writes can fail. */
    static Function<Context, SharedPreferences> telegramStore =
            context -> context.getSharedPreferences(TELEGRAM_PREFS, Context.MODE_PRIVATE);
    static Function<Context, SharedPreferences> store =
            context -> context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);

    /** Puts the change into effect in the running process. Tests count calls instead. */
    static Runnable apply = OwnConnection::applyInTelegram;

    /**
     * Called with each answer to a Firebase account.registerDevice, after it's recorded, while the
     * account that asked is still the one signed in. UnifiedPush answers never come here.
     */
    static void answered(boolean accepted) {
        try {
            if (!Utils.settingsReady() || HushTelegramPause.isPaused() || !Settings.REPAIR_FIREBASE_PUSH.get()) return;
            Context context = Utils.getContext();
            if (context == null) return;
            if (accepted) handBack(context);
            else turnOn(context, FamilyNames.REPAIR_FIREBASE_PUSH, false);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.REPAIR_FIREBASE_PUSH, "Telegram's own connection", failure);
        }
    }

    /**
     * Called once UnifiedPush has handed Telegram its address. Only while the UnifiedPush switch is
     * on and nothing is paused. Turning UnifiedPush off later leaves them on until a Firebase
     * sign-up is accepted, the safe side for a phone that was just getting messages this way.
     */
    static void besideUnifiedPush(@Nullable Context context) {
        try {
            if (context == null || !Utils.settingsReady() || HushTelegramPause.isPaused() || !Settings.UNIFIED_PUSH.get()) return;
            turnOn(context, FamilyNames.UNIFIED_PUSH, true);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.UNIFIED_PUSH, "Telegram's own connection", failure);
        }
    }

    private static void turnOn(Context context, String family, boolean besideUnifiedPush) {
        SharedPreferences telegram = telegramStore.apply(context);
        if (telegram.contains(KEEP_ALIVE) || telegram.contains(BACKGROUND)) {
            if (!store.apply(context).getBoolean(TURNED_ON, false)) {
                HookStatus.counted(family, "own connection left as set in Telegram");
            }
            return;
        }
        // Ours first: if Telegram's write then fails, the next answer finds nothing to hand back.
        // A failed commit still changes what this process reads, so each failure takes its values back out.
        SharedPreferences.Editor ours = store.apply(context).edit().putBoolean(TURNED_ON, true);
        if (besideUnifiedPush) ours.putBoolean(BESIDE_UNIFIED_PUSH, true);
        if (!ours.commit()) {
            store.apply(context).edit().remove(TURNED_ON).remove(BESIDE_UNIFIED_PUSH).commit();
            HookStatus.counted(family, "own connection not saved");
            return;
        }
        if (!telegram.edit().putBoolean(KEEP_ALIVE, true).putBoolean(BACKGROUND, true).commit()) {
            telegram.edit().remove(KEEP_ALIVE).remove(BACKGROUND).commit();
            store.apply(context).edit().remove(TURNED_ON).remove(BESIDE_UNIFIED_PUSH).commit();
            HookStatus.counted(family, "own connection not saved");
            return;
        }
        if (besideUnifiedPush) {
            HookStatus.counted(family, "own connection kept on beside UnifiedPush");
            Logger.printInfo(() -> "UnifiedPush in use: Keep-Alive Service and Background Connection turned on beside it");
        } else {
            HookStatus.counted(family, "own connection turned on for a refused sign-up");
            Logger.printInfo(() -> "Push sign-up refused: Keep-Alive Service and Background Connection turned on");
        }
        apply.run();
    }

    private static void handBack(Context context) {
        // UnifiedPush's sign-up is accepted too, and that alone says nothing about Firebase.
        if (UnifiedPush.activeEndpoint() != null) return;
        SharedPreferences ours = store.apply(context);
        if (!ours.getBoolean(TURNED_ON, false)) return;
        SharedPreferences telegram = telegramStore.apply(context);
        if (telegram.getBoolean(KEEP_ALIVE, false) && telegram.getBoolean(BACKGROUND, false)) {
            if (!telegram.edit().remove(KEEP_ALIVE).remove(BACKGROUND).commit()) return;
            HookStatus.counted(FamilyNames.REPAIR_FIREBASE_PUSH, "own connection handed back to push");
            Logger.printInfo(() -> "Push sign-up accepted: Keep-Alive Service and Background Connection back to Telegram's defaults");
            apply.run();
        }
        ours.edit().remove(TURNED_ON).remove(BESIDE_UNIFIED_PUSH).commit();
    }

    /** Both of Telegram's switches on, or null when they can't be read. */
    @Nullable
    static Boolean bothOn(@Nullable Context context) {
        if (context == null) return null;
        try {
            SharedPreferences telegram = telegramStore.apply(context);
            return telegram.getBoolean(KEEP_ALIVE, false) && telegram.getBoolean(BACKGROUND, false);
        } catch (Throwable unreadable) {
            return null;
        }
    }

    /** Whether the switches are on because of a refusal or UnifiedPush rather than the user. */
    static boolean turnedOnHere(@Nullable Context context) {
        if (context == null) return false;
        try {
            return store.apply(context).getBoolean(TURNED_ON, false);
        } catch (Throwable unreadable) {
            return false;
        }
    }

    /** Whether UnifiedPush, not a refused sign-up, is what turned the switches on. */
    static boolean turnedOnBesideUnifiedPush(@Nullable Context context) {
        if (context == null) return false;
        try {
            SharedPreferences ours = store.apply(context);
            return ours.getBoolean(TURNED_ON, false) && ours.getBoolean(BESIDE_UNIFIED_PUSH, false);
        } catch (Throwable unreadable) {
            return false;
        }
    }

    /**
     * What Telegram's own Notifications page does when either switch is flipped, on the main thread
     * as there: restart or stop its keep-alive service and tell the current account's connection.
     * Anything missing here only waits for the next start, which reads both settings again.
     */
    private static void applyInTelegram() {
        new Handler(Looper.getMainLooper()).post(() -> {
            try {
                Class.forName("org.telegram.messenger.ApplicationLoader").getMethod("startPushService").invoke(null);
                int account = Class.forName("org.telegram.messenger.UserConfig").getField("selectedAccount").getInt(null);
                Class<?> connections = Class.forName("org.telegram.tgnet.ConnectionsManager");
                Object manager = connections.getMethod("getInstance", int.class).invoke(null, account);
                boolean enabled = (Boolean) connections.getMethod("isPushConnectionEnabled").invoke(manager);
                connections.getMethod("setPushConnectionEnabled", boolean.class).invoke(manager, enabled);
            } catch (Throwable failure) {
                HookStatus.counted(FamilyNames.REPAIR_FIREBASE_PUSH, "own connection waits for the next start");
                Logger.printException(() -> "Couldn't apply Telegram's own connection now", failure);
            }
        });
    }
}
