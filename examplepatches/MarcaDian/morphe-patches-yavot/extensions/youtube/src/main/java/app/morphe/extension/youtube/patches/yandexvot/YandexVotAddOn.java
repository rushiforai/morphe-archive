/*
 * Add-on entry point of the Yandex VoT bundle.
 */

package app.morphe.extension.youtube.patches.yandexvot;

import java.util.concurrent.atomic.AtomicBoolean;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.youtube.addon.AddOnApi;
import app.morphe.extension.youtube.settings.YandexVotSettings;
import app.morphe.extension.youtube.videoplayer.YandexVotButton;

@SuppressWarnings("unused")
public final class YandexVotAddOn {

    /**
     * Identifier used to claim a legacy player button slot.
     */
    public static final String ADD_ON_ID = "yandex_vot";

    /** Guards against a second registration adding every listener twice. */
    private static final AtomicBoolean registered = new AtomicBoolean();

    /**
     * Injection point. The patch adds a call to this method
     * to {@code AddOnManager.registerAddOns()} of Morphe Patches.
     */
    public static void register() {
        if (!registered.compareAndSet(false, true)) return;

        Logger.printDebug(() -> "Registering Yandex VoT add-on");

        // Load the settings class, so the settings of this add-on are known to the
        // settings search and to import and export of the Morphe settings.
        YandexVotSettings.YANDEX_VOT_ENABLED.get();

        // Only one voice-over engine should speak at a time.
        YandexVotCoordinator.register();

        AddOnApi.addPlayerOverlayButtonsListener(YandexVotButton::initializeButton);
        AddOnApi.addLegacyPlayerControlsListener(YandexVotButton::initializeLegacyButton);
        AddOnApi.addNewVideoStartedListener(YandexVoiceOverTranslationPatch::onNewVideoStarted);
        AddOnApi.addVideoIdListener(YandexVoiceOverTranslationPatch::onVideoIdChanged);
        AddOnApi.addVideoTimeListener(YandexVoiceOverTranslationPatch::setVideoTime);
        AddOnApi.addVideoStateListener(YandexVoiceOverTranslationPatch::videoStateChanged);
    }

    private YandexVotAddOn() {
    }
}
