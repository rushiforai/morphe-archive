/*
 * Mutual-exclusion glue between the Yandex VoT bundle and the built-in voice-over translation.
 */

package app.morphe.extension.youtube.patches.yandexvot;

import app.morphe.extension.youtube.patches.voiceovertranslation.VoiceOverTranslationPatch;

/**
 * Keeps the official and Yandex voice-over translation engines mutually exclusive: only one
 * translated audio track can play at a time, so starting one engine stops the other.
 * <p>
 * Each engine still owns its own video-id, video-time and playback-state wiring independently
 * through {@link app.morphe.extension.youtube.addon.AddOnApi} / its own injection points; this
 * class only adds the cross-engine stop signal on top of that.
 */
@SuppressWarnings("unused")
public final class YandexVotCoordinator {

    /** Injection point, called once from {@link YandexVotAddOn#register()}. */
    public static void register() {
        VoiceOverTranslationPatch.addOnTranslationStateChangeCallback(
                YandexVotCoordinator::onOfficialStateChanged);
    }

    /** Called by {@link YandexVoiceOverTranslationPatch#toggleTranslation()} right before it starts. */
    static void deactivateOfficialBeforeStarting() {
        VoiceOverTranslationPatch.deactivateTranslation();
    }

    private static void onOfficialStateChanged() {
        if (VoiceOverTranslationPatch.isSessionEnabled()
                && YandexVoiceOverTranslationPatch.isTranslationActive()) {
            YandexVoiceOverTranslationPatch.cancelTranslation();
        }
    }

    private YandexVotCoordinator() {
    }
}
