package nl.johninnl.gboard;

/**
 * Splits the microphone stream into utterances from Silero VAD's speech probability.
 *
 * <p>Each 32 ms window's probability goes in; an event comes out. An utterance starts after
 * three speech windows and ends after 0.7 s without speech, or at 20 s. An utterance with less
 * than a quarter second of speech is dropped instead of being transcribed, so clicks and
 * breaths do not turn into text. The session ends after 6 s without any speech, or 5 s after
 * the last utterance. Parakeet decodes every utterance on its own and detects its language,
 * so Dutch and English sentences can follow each other in one dictation.
 */
final class Endpointer {
    static final int WINDOW_SAMPLES = 512;

    static final int NONE = 0;
    static final int UTTERANCE_START = 1;
    static final int UTTERANCE_END = 2;
    static final int SESSION_END = 3;
    static final int NO_SPEECH = 4;
    static final int UTTERANCE_DROPPED = 5;

    static final int PREROLL_WINDOWS = 10;
    private static final int START_WINDOWS = 3;
    private static final int END_WINDOWS = 22;
    private static final int MAX_UTTERANCE_WINDOWS = 625;
    private static final int MIN_SPEECH_WINDOWS = 8;
    private static final int NO_SPEECH_WINDOWS = 188;
    private static final int TRAILING_WINDOWS = 156;

    private static final float SPEECH = 0.5f;
    private static final float QUIET = 0.35f;

    private int windows;
    private int speechRun;
    private int quietRun;
    private int utteranceWindows;
    private int utteranceSpeech;
    private int sinceLastUtterance;
    private boolean inUtterance;
    private boolean heardSpeech;
    private float lastLevel = -100f;

    /** Feeds one window's speech probability and level (dBFS); returns one of the event constants. */
    int push(float probability, float levelDb) {
        lastLevel = levelDb;
        windows++;
        if (inUtterance) {
            utteranceWindows++;
            if (probability >= SPEECH) utteranceSpeech++;
            quietRun = probability < QUIET ? quietRun + 1 : 0;
            if (quietRun >= END_WINDOWS || utteranceWindows >= MAX_UTTERANCE_WINDOWS) {
                inUtterance = false;
                speechRun = 0;
                sinceLastUtterance = 0;
                return utteranceSpeech >= MIN_SPEECH_WINDOWS ? UTTERANCE_END : UTTERANCE_DROPPED;
            }
            return NONE;
        }

        sinceLastUtterance++;
        speechRun = probability >= SPEECH ? speechRun + 1 : 0;
        if (speechRun >= START_WINDOWS) {
            inUtterance = true;
            heardSpeech = true;
            utteranceWindows = speechRun;
            utteranceSpeech = speechRun;
            quietRun = 0;
            return UTTERANCE_START;
        }
        if (!heardSpeech && windows >= NO_SPEECH_WINDOWS) return NO_SPEECH;
        if (heardSpeech && sinceLastUtterance >= TRAILING_WINDOWS) return SESSION_END;
        return NONE;
    }

    boolean inUtterance() {
        return inUtterance;
    }

    boolean heardSpeech() {
        return heardSpeech;
    }

    /** Whether the utterance in progress already holds enough speech to be worth transcribing. */
    boolean utteranceHasSpeech() {
        return inUtterance && utteranceSpeech >= MIN_SPEECH_WINDOWS;
    }

    /** 0..100 meter for Gboard's microphone animation. */
    int meter() {
        float scaled = (lastLevel + 60f) / 45f;
        return Math.round(Math.max(0f, Math.min(1f, scaled)) * 100f);
    }

    /** dBFS of 16-bit PCM samples [0, count). */
    static float levelDb(short[] samples, int count) {
        if (count <= 0) return -100f;
        double sum = 0;
        for (int i = 0; i < count; i++) {
            double s = samples[i] / 32768.0;
            sum += s * s;
        }
        double rms = Math.sqrt(sum / count);
        return rms <= 1e-5 ? -100f : (float) (20 * Math.log10(rms));
    }
}
