package app.yydarlinker.deepseekcaptions;

/**
 * What the native player currently has selected: the caption model's track and the official CC
 * control's state.
 *
 * <p>It is a read-only projection. It exists so the UI can show the native state and so the session
 * intent can be materialised onto a real track; it is never an authority. Nothing here can turn AI
 * captions on or off, and no observation recorded here can write {@link CaptionSessionIntent}.
 */
final class CaptionNativeProjection {
    static final int UNKNOWN = CaptionIntentPolicy.UNKNOWN;
    static final int OFF = CaptionIntentPolicy.OFF;
    static final int ON = CaptionIntentPolicy.ON;

    private static final Object LOCK = new Object();

    private static String video = "";
    private static String language = "";
    private static String url = "";
    private static boolean observed, off, translated, explicit;
    private static int ccState = UNKNOWN;
    private static long epoch;

    private CaptionNativeProjection() {}

    /** The caption model selected [track] for [video]; [off] means it selected Off. */
    static void selection(
            String videoId,
            String selectedLanguage,
            String selectedUrl,
            boolean off,
            boolean translated,
            boolean explicit,
            long epoch) {
        synchronized (LOCK) {
            video = videoId == null ? "" : videoId;
            language = selectedLanguage == null ? "" : selectedLanguage;
            url = selectedUrl == null ? "" : selectedUrl;
            CaptionNativeProjection.observed = true;
            CaptionNativeProjection.off = off;
            CaptionNativeProjection.translated = translated;
            CaptionNativeProjection.explicit = explicit;
            CaptionNativeProjection.epoch = epoch;
        }
    }

    /** The official CC control's checkable state; an observation, never a command. */
    static void ccState(int state) {
        synchronized (LOCK) {
            ccState = state;
        }
    }

    static int ccState() {
        synchronized (LOCK) {
            return ccState;
        }
    }

    static Snapshot snapshot() {
        synchronized (LOCK) {
            return new Snapshot(
                    video, language, url, observed, off, translated, explicit, ccState, epoch);
        }
    }

    static void resetForTests() {
        synchronized (LOCK) {
            video = language = url = "";
            observed = off = translated = explicit = false;
            ccState = UNKNOWN;
            epoch = 0L;
        }
    }

    /** One immutable reading; see the class comment for why it must not drive a decision. */
    static final class Snapshot {
        final String video;
        final String language;
        final String url;
        final boolean observed, off, translated, explicit;
        final int ccState;
        final long epoch;

        Snapshot(
                String video,
                String language,
                String url,
                boolean observed,
                boolean off,
                boolean translated,
                boolean explicit,
                int ccState,
                long epoch) {
            this.video = video;
            this.language = language;
            this.url = url;
            this.observed = observed;
            this.off = off;
            this.translated = translated;
            this.explicit = explicit;
            this.ccState = ccState;
            this.epoch = epoch;
        }

        /** A real track is selected for the foreground video. */
        boolean hasTarget() {
            return observed && !off && !language.isEmpty();
        }

        String summary() {
            return "video="
                    + (video.isEmpty() ? "none" : video)
                    + ";observed="
                    + observed
                    + ";off="
                    + off
                    + ";language="
                    + (language.isEmpty() ? "none" : language)
                    + ";translated="
                    + translated
                    + ";explicit="
                    + explicit
                    + ";cc="
                    + ccState;
        }
    }
}
