package app.yydarlinker.deepseekcaptions;

import android.content.Context;
import android.media.session.PlaybackState;

import org.json.JSONObject;

import java.util.Objects;

/** Platform inputs and side effects. The implementation belongs to the application, never to UI. */
final class TranslationRuntime {
    abstract static class Host {
        abstract TranslationSettings settings(Context context);

        abstract TranslationSourceAccess.Source load(
                Context context,
                String url,
                boolean translate,
                DeepSeekApiClient.RequestControl control)
                throws Exception;

        TranslationSourceAccess.Source reference(
                Context context,
                String url,
                RebuildSource primary,
                DeepSeekApiClient.RequestControl control)
                throws Exception {
            return null;
        }

        boolean selectionOn() {
            return true;
        }

        /** True when the source track is a manually authored caption track for this url. */
        boolean authoredTrack(String url) {
            return false;
        }

        String target() {
            return "";
        }

        boolean transitioning() {
            return false;
        }

        long ownerEpoch() {
            return 0;
        }

        void sessionOpened() {}

        void stopped() {}

        void suppressNative(boolean force) {}

        PlaybackState playbackState() {
            return null;
        }

        ClockSample clock(String owner) {
            return ClockSample.UNAVAILABLE;
        }

        String sourceKey(String url) {
            return RebuildCache.hash(CaptionUrls.sourceCaptionUrl(url));
        }

        boolean debugEnabled(Context c) {
            return false;
        }

        String message(Context c, String key) {
            return key;
        }

        void mark(Context c, String stage, String detail, CaptionCredentialRef credential) {}

        void record(
                Context c,
                String key,
                long id,
                JSONObject source,
                String response,
                String metadata) {}

        void clearSourceCache(Context context) {}

        /** Delivered on main only after both caches clear, or when clearing fails. */
        void cacheClearFinished(Context context, boolean success) {}

        String redact(String text, String key, int limit) {
            String safe = text == null ? "" : text;
            if (key != null && !key.isEmpty()) safe = safe.replace(key, "[redacted]");
            return safe.substring(0, Math.min(limit, safe.length()));
        }

        String errorDetail(Throwable error) {
            return error == null ? "unknown" : error.getClass().getSimpleName();
        }
    }

    static final class ClockSample {
        static final ClockSample UNAVAILABLE = new ClockSample(false, "", 0, 0, 0, 0);
        final boolean available;
        final String videoId;
        final long position, readElapsed;
        final int state;
        final float speed;

        ClockSample(
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

    static void install(Host value) {
        host = Objects.requireNonNull(value);
    }

    static boolean authoredTrack(String url) {
        Host h = host;
        return h != null && h.authoredTrack(url);
    }

    static Host host() {
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

    static boolean debugEnabled(Context c) {
        return host().debugEnabled(c);
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

    static void record(
            Context c, String key, long id, JSONObject source, String response, String metadata) {
        host().record(c, key, id, source, response, metadata);
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
