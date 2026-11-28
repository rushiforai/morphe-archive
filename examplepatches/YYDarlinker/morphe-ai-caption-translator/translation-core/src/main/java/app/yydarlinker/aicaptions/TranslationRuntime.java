package app.yydarlinker.aicaptions;

import android.content.Context;
import android.media.session.PlaybackState;

import java.util.Objects;

/** Platform inputs and side effects. The implementation belongs to the application, never to UI. */
public final class TranslationRuntime {
    public abstract static class Host {
        protected abstract TranslationSettings settings(Context context);

        protected abstract TranslationSourceAccess.Source load(
                Context context,
                String url,
                boolean translate,
                CaptionApiClient.RequestControl control)
                throws Exception;

        protected TranslationSourceAccess.Source reference(
                Context context,
                String url,
                RebuildSource primary,
                CaptionApiClient.RequestControl control)
                throws Exception {
            return null;
        }

        protected boolean selectionOn() {
            return true;
        }

        /** True when the source track is a manually authored caption track for this url. */
        protected boolean authoredTrack(String url) {
            return false;
        }

        protected String target() {
            return "";
        }

        protected boolean transitioning() {
            return false;
        }

        protected long ownerEpoch() {
            return 0;
        }

        protected void sessionOpened() {}

        protected void stopped() {}

        protected void suppressNative(boolean force) {}

        protected PlaybackState playbackState() {
            return null;
        }

        protected ClockSample clock(String owner) {
            return ClockSample.UNAVAILABLE;
        }

        protected String sourceKey(String url) {
            return RebuildCache.hash(CaptionUrls.sourceCaptionUrl(url));
        }

        protected String message(Context c, String key) {
            return key;
        }

        protected void mark(Context c, String stage, String detail, CaptionCredentialRef credential) {}

        protected void clearSourceCache(Context context) {}

        /** Delivered on main only after both caches clear, or when clearing fails. */
        protected void cacheClearFinished(Context context, boolean success) {}

        protected String redact(String text, String key, int limit) {
            String safe = text == null ? "" : text;
            if (key != null && !key.isEmpty()) safe = safe.replace(key, "[redacted]");
            return safe.substring(0, Math.min(limit, safe.length()));
        }

        protected String errorDetail(Throwable error) {
            return error == null ? "unknown" : error.getClass().getSimpleName();
        }
    }

    public static final class ClockSample {
        public static final ClockSample UNAVAILABLE = new ClockSample(false, "", 0, 0, 0, 0);
        public final boolean available;
        final String videoId;
        final long position, readElapsed;
        public final int state;
        final float speed;

        public ClockSample(
                boolean available,
                String videoId,
                long position,
                long readElapsed,
                int state,
                float speed) {
            this.available = available;
            this.videoId = videoId;
            this.position = position;
            this.readElapsed = readElapsed;
            this.state = state;
            this.speed = speed;
        }
    }

    private static volatile Host host;

    public static void install(Host value) {
        host = Objects.requireNonNull(value);
    }

    /** Enables the existing streamed-provider fixture on the loopback host only. */
    static void loopbackStreamingForTests(String host) {
        if (!host.isEmpty() && !host.equals("localhost") && !host.equals("127.0.0.1")
                && !host.equals("[::1]") && !host.equals("[0:0:0:0:0:0:0:1]"))
            throw new IllegalArgumentException("stream fixture requires loopback");
        RebuildStream.fixtureHost = host;
    }


    static boolean authoredTrack(String url) {
        Host h = host;
        return h != null && h.authoredTrack(url);
    }

    public static Host host() {
        Host value = host;
        if (value == null) throw new IllegalStateException("translation_host_not_installed");
        return value;
    }

    static TranslationSettings settings(Context c) {
        return host().settings(c);
    }

    static boolean selectionOn() {
        return host().selectionOn();
    }

    static String target() {
        return host().target();
    }

    static boolean transitioning() {
        return host().transitioning();
    }

    static long ownerEpoch() {
        return host == null ? 0 : host.ownerEpoch();
    }

    static void sessionOpened() {
        host().sessionOpened();
    }

    static void stopped() {
        if (host != null) host.stopped();
    }

    static void suppressNative(boolean force) {
        if (host != null) host.suppressNative(force);
    }

    static PlaybackState playbackState() {
        return host().playbackState();
    }

    static ClockSample clock(String owner) {
        return host().clock(owner);
    }

    static String sourceKey(String url) {
        return host().sourceKey(url);
    }

    static String message(Context c, String key) {
        return host().message(c, key);
    }

    static void mark(Context c, String stage, String detail) {
        mark(c, stage, detail, CaptionCredentialRef.NONE);
    }

    static void mark(Context c, String stage, String detail, CaptionCredentialRef credential) {
        if (host != null) host.mark(c, stage, detail, credential);
    }

    static String errorDetail(Throwable error) {
        return host == null
                ? (error == null ? "unknown" : error.getClass().getSimpleName())
                : host.errorDetail(error);
    }

    static String redact(String value, String key, int limit) {
        if (host != null) return host.redact(value, key, limit);
        String safe = value == null ? "" : value;
        if (key != null && !key.isEmpty()) safe = safe.replace(key, "[redacted]");
        return safe.substring(0, Math.min(limit, safe.length()));
    }
}
