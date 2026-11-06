/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to Morphe contributions.
 *
 * Modified by lavinhoque33, 2026-10-24
 */

package app.morphe.extension.youtube.patches;

import static app.morphe.extension.shared.utils.StringRef.str;

import android.app.Activity;
import android.content.ComponentName;
import android.content.Intent;
import android.os.Parcelable;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import java.lang.ref.WeakReference;
import java.util.Objects;

import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;

/**
 * Opens videos in the player of the running activity, used by the Premium-style queue.
 */
@SuppressWarnings("unused")
public final class LoadVideoPatch {

    /**
     * Interface to use obfuscated methods.
     */
    public interface PlayerInterface {
        // Method is added during patching.
        Parcelable patch_getIntentParcelable(Intent intent);
    }

    /**
     * Interface to deliver intents to the main activity, as {@link Activity#onNewIntent(Intent)} is protected.
     */
    public interface MainActivityInterface {
        // Method is added during patching.
        void patch_onNewIntent(Intent intent);
    }

    private static final String INTERNAL_MAIN_ACTIVITY =
            "com.google.android.apps.youtube.app.watchwhile.InternalMainActivity";

    private static WeakReference<PlayerInterface> playerInterfaceRef = new WeakReference<>(null);

    /**
     * Injection point.
     */
    public static void initialize(@NonNull PlayerInterface playerInterfaceInit) {
        playerInterfaceRef = new WeakReference<>(Objects.requireNonNull(playerInterfaceInit));
    }

    public static boolean isPlayerInterfaceAvailable() {
        return playerInterfaceRef.get() != null;
    }

    /**
     * Opens a video based on hardcoded parameters found in an obfuscated class.
     * It is generally faster than the solution that uses 'Intent.FLAG_ACTIVITY_NEW_TASK'.
     */
    public static void openVideoIntentWithInternalContext(String videoIdWithParams) {
        PlayerInterface playerInterface = playerInterfaceRef.get();
        Activity activity = Utils.getActivity();
        if (playerInterface == null || activity == null) {
            Utils.showToastShort(str("revanced_dismiss_player_not_available_toast"));
            return;
        }

        activity.startActivity(createWatchIntent(activity, playerInterface, videoIdWithParams));
    }

    /**
     * Starts a video by handing the watch intent to the running activity,
     * which does not need the app to be on screen.
     */
    public static boolean deliverVideoIntentInProcess(String videoId) {
        try {
            PlayerInterface playerInterface = playerInterfaceRef.get();
            Activity activity = Utils.getActivity();
            if (playerInterface == null || !(activity instanceof MainActivityInterface mainActivity)) {
                return false;
            }

            mainActivity.patch_onNewIntent(createWatchIntent(activity, playerInterface, videoId));
            return true;
        } catch (Exception ex) {
            Logger.printException(() -> "deliverVideoIntentInProcess failure", ex);
            return false;
        }
    }

    private static Intent createWatchIntent(@Nullable Activity activity,
                                            PlayerInterface playerInterface,
                                            String videoIdWithParams) {
        // No video id is needed to put inside the Intent initialization.
        Intent intent = new Intent();
        intent.setComponent(new ComponentName(Objects.requireNonNull(activity), INTERNAL_MAIN_ACTIVITY));
        // NEW_TASK intent is not needed by this code.
        intent.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);

        // Always put 'inventory_identifier' before 'watch', to ensure the patch works correctly.
        intent.putExtra(
                "android.intent.extra.inventory_identifier",
                new String[]{"vnd.youtube://" + videoIdWithParams}
        );

        // Get the needed Parcelable object from a static method,
        // which reads inventory_identifier inside the currently built Intent.
        intent.putExtra("watch", playerInterface.patch_getIntentParcelable(intent));

        return intent;
    }
}
