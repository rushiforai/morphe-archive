package app.yydarlinker.deepseekcaptions;

/**
 * What the native player currently has selected: the caption model's track and the official CC
 * control's state.
 *
 * <p>The official CC state is the display authority. The committed selection for the foreground
 * video is the language authority, including Morphe's automatic/default selection. It never
 * changes the persistent AI rendering switch in {@link CaptionSessionIntent}.
 */
final class CaptionNativeProjection {
    static final int UNKNOWN = CaptionIntentPolicy.UNKNOWN;
    static final int OFF = CaptionIntentPolicy.OFF;
    static final int ON = CaptionIntentPolicy.ON;

    private static final Object LOCK = new Object();

    private static String video = "";
    private static String language = "";
    private static String url = "";
    private static boolean observed, off, translated, explicit, committed;
    private static int ccState = UNKNOWN;
    private static long epoch;
    private static long revision;

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
        selection(videoId, selectedLanguage, selectedUrl, off, translated, explicit, epoch, false);
    }

    /** Only the post-filter native dispatcher can provide committed CC initialization evidence. */
    static void selection(String videoId, String selectedLanguage, String selectedUrl,
            boolean off, boolean translated, boolean explicit, long epoch, boolean committed) {
        synchronized (LOCK) {
            if (!java.util.Objects.equals(video, videoId)
                    || !java.util.Objects.equals(language, selectedLanguage)
                    || !java.util.Objects.equals(url, selectedUrl)
                    || !observed || CaptionNativeProjection.off != off
                    || CaptionNativeProjection.translated != translated) revision++;
            video = videoId == null ? "" : videoId;
            language = selectedLanguage == null ? "" : selectedLanguage;
            url = selectedUrl == null ? "" : selectedUrl;
            CaptionNativeProjection.observed = true;
            CaptionNativeProjection.off = off;
            CaptionNativeProjection.translated = translated;
            CaptionNativeProjection.explicit = explicit;
            CaptionNativeProjection.committed = committed;
            CaptionNativeProjection.epoch = epoch;
        }
    }

    /** A new visit cannot inherit a previous video's or previous visit's language. */
    static void beginVideo(String videoId) {
        synchronized (LOCK) {
            video = videoId == null ? "" : videoId;
            language = url = "";
            observed = off = translated = explicit = committed = false;
            revision++;
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
                    video, language, url, observed, off, translated, explicit, committed, ccState, epoch, revision);
        }
    }

    static void resetForTests() {
        synchronized (LOCK) {
            video = language = url = "";
            observed = off = translated = explicit = committed = false;
            ccState = UNKNOWN;
            epoch = 0L;
            revision = 0L;
        }
    }

    /** One immutable reading of display permission and the native track observation. */
    static final class Snapshot {
        final String video;
        final String language;
        final String url;
        final boolean observed, off, translated, explicit, committed;
        final int ccState;
        final long epoch;
        final long revision;

        Snapshot(
                String video,
                String language,
                String url,
                boolean observed,
                boolean off,
                boolean translated,
                boolean explicit,
                boolean committed,
                int ccState,
                long epoch,
                long revision) {
            this.video = video;
            this.language = language;
            this.url = url;
            this.observed = observed;
            this.off = off;
            this.translated = translated;
            this.explicit = explicit;
            this.committed = committed;
            this.ccState = ccState;
            this.epoch = epoch;
            this.revision = revision;
        }

        /** A real track is selected for the foreground video. */
        boolean hasTarget() {
            return observed && !off && !target().isEmpty()
                    && DeepSeekCaptionHook.isYouTubeTimedTextUrl(url);
        }

        String target() {
            TargetLanguage target = translated ? TargetLanguage.fromUrl(url) : TargetLanguage.fromCode(language);
            return target == null ? "" : target.code;
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
                    + ccState
                    + ";selection=" + revision;
        }
    }
}
