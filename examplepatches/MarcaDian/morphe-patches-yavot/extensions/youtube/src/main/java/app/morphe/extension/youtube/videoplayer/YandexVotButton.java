/*
 * Copyright (C) 2026 anddea
 *
 * This file is part of the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Original author(s):
 * - Jav1x (https://github.com/Jav1x)
 *
 * Ported to morphe-patches: https://github.com/MorpheApp/morphe-patches
 * Modified by: Jav1x (https://github.com/Jav1x)
 *
 * Licensed under the GNU General Public License v3.0.
 *
 * ------------------------------------------------------------------------
 * GPLv3 Section 7 – Attribution Notice
 * ------------------------------------------------------------------------
 *
 * This file contains substantial original work by the author(s) listed above.
 *
 * In accordance with Section 7 of the GNU General Public License v3.0,
 * the following additional terms apply to this file:
 *
 * 1. Attribution (Section 7(b)): This specific copyright notice and the
 *    list of original authors above must be preserved in any copy or
 *    derivative work. You may add your own copyright notice below it,
 *    but you may not remove the original one.
 *
 * 2. Origin (Section 7(c)): Modified versions must be clearly marked as
 *    such (e.g., by adding a "Modified by" line or a new copyright notice).
 *    They must not be misrepresented as the original work.
 *
 * ------------------------------------------------------------------------
 * Version Control Acknowledgement (Non-binding Request)
 * ------------------------------------------------------------------------
 *
 * While not a legal requirement of the GPLv3, the original author(s)
 * respectfully request that ports or substantial modifications retain
 * historical authorship credit in version control systems (e.g., Git),
 * listing original author(s) appropriately and modifiers as committers
 * or co-authors.
 */

package app.morphe.extension.youtube.videoplayer;

import static app.morphe.extension.youtube.patches.LegacyPlayerControlsPatch.RESTORE_OLD_PLAYER_BUTTONS;

import android.view.View;
import android.widget.ImageView;

import androidx.annotation.Nullable;

import java.lang.ref.WeakReference;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.youtube.patches.yandexvot.YandexVoiceOverTranslationBottomSheet;
import app.morphe.extension.youtube.patches.yandexvot.YandexVoiceOverTranslationPatch;
import app.morphe.extension.youtube.settings.YandexVotSettings;

@SuppressWarnings("unused")
public final class YandexVotButton {

    @Nullable
    private static LegacyPlayerControlButton legacy;

    @Nullable
    private static WeakReference<ImageView> overlayButtonRef;

    /** Injection point. */
    public static void initializeButton(View controlsView) {
        try {
            if (RESTORE_OLD_PLAYER_BUTTONS || !YandexVotSettings.YANDEX_VOT_ENABLED.get()) return;

            YandexVoiceOverTranslationPatch.setOnTranslationStateChangeCallback(
                    YandexVotButton::refreshActivatedState);

            ImageView button = PlayerOverlayButton.addButton(
                    controlsView,
                    "morphe_yt_yandex_vot",
                    view -> {
                        YandexVoiceOverTranslationPatch.toggleTranslation();
                        refreshActivatedState();
                    },
                    view -> {
                        YandexVoiceOverTranslationBottomSheet.show(view.getContext());
                        return true;
                    });
            overlayButtonRef = button != null ? new WeakReference<>(button) : null;
            refreshActivatedState();
        } catch (Exception ex) {
            Logger.printException(() -> "YandexVotButton initializeButton failure", ex);
        }
    }

    /** Injection point. */
    public static void initializeLegacyButton(View controlsView) {
        try {
            if (!RESTORE_OLD_PLAYER_BUTTONS) return;

            YandexVoiceOverTranslationPatch.setOnTranslationStateChangeCallback(
                    YandexVotButton::refreshActivatedState);

            legacy = new LegacyPlayerControlButton(
                    controlsView,
                    "morphe_yandex_vot_button",
                    null,
                    "morphe_yt_yandex_vot",
                    YandexVotSettings.YANDEX_VOT_ENABLED,
                    view -> {
                        YandexVoiceOverTranslationPatch.toggleTranslation();
                        refreshActivatedState();
                    },
                    view -> {
                        YandexVoiceOverTranslationBottomSheet.show(view.getContext());
                        return true;
                    });
            refreshActivatedState();
        } catch (Exception ex) {
            Logger.printException(() -> "YandexVotButton initializeLegacyButton failure", ex);
        }
    }

    private static void refreshActivatedState() {
        Utils.verifyOnMainThread();
        try {
            final int alpha = YandexVoiceOverTranslationPatch.isTranslationActive() ? 255 : 128;
            WeakReference<ImageView> ref = overlayButtonRef;
            ImageView overlay = ref != null ? ref.get() : null;
            if (overlay != null) {
                overlay.setImageAlpha(alpha);
            }
            LegacyPlayerControlButton leg = legacy;
            if (leg != null) {
                leg.setImageAlpha(alpha);
            }
        } catch (Exception ex) {
            Logger.printException(() -> "refreshActivatedState failure", ex);
        }
    }
}
