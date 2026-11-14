package app.morphe.extension.shared.patches;

import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.music.patches.CrossfadeTrace;

@SuppressWarnings("unused")
public class DrcAudioPatch {
    private static final boolean DISABLE_DRC_AUDIO =
            BaseSettings.DISABLE_DRC_AUDIO.get();

    public static boolean shouldTraceLoudness() {
        return CrossfadeTrace.isTransitionObserved();
    }

    /** The existing format-model constructor already knows this value; no new format fingerprint. */
    public static void traceLoudness(Object format, float loudnessDb) {
        if (!CrossfadeTrace.isTransitionObserved()) return;
        CrossfadeTrace.event("FORMAT_LOUDNESS", null, () -> "format=" + CrossfadeTrace.id(format)
                + " selection=model loudnessDb=" + loudnessDb + " disableDrc=" + DISABLE_DRC_AUDIO
                + " resultingLoudnessDb=" + (DISABLE_DRC_AUDIO ? 0.0f : loudnessDb));
    }

    public static boolean disableDrcAudio() {
        return DISABLE_DRC_AUDIO;
    }

    public static boolean disableDrcAudioFeatureFlag(boolean original) {
        return !DISABLE_DRC_AUDIO && original;
    }
}
