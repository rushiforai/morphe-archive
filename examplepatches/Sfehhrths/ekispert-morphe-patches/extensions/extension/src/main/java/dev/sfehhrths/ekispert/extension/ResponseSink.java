package dev.sfehhrths.ekispert.extension;

import android.util.Log;

import okhttp3.HttpUrl;

/**
 * Destination for tapped responses.
 * Milestone 1: dump to logcat. Milestone 2 (TODO): Broadcast to the companion app using
 * {@link ContextHolder#get()}.
 */
final class ResponseSink {

    private static final String TAG = ResponseTapPatch.TAG;

    /** Query parameters whose values are hidden in logs (the API key is sent on every request). */
    private static final String[] REDACTED_QUERY_PARAMS = {"key"};

    /**
     * logcat drops lines over ~4 KB. Body text may be Japanese (3 bytes/char in UTF-8),
     * so chunk by a conservative number of chars.
     */
    private static final int LOG_CHUNK_CHARS = 1000;

    /**
     * Debugging aid: dump the whole body to logcat. Off for releases; flip to {@code true}
     * when investigating parse problems on the companion side (the companion owns parsing;
     * the patch side stays dumb).
     */
    private static final boolean LOG_FULL_BODY = false;

    private ResponseSink() {
    }

    static void deliver(HttpUrl url, int httpCode, String contentType, String body) {
        String safeUrl = redact(url);
        Log.i(TAG, "<<< " + httpCode + " " + (contentType != null ? contentType : "-")
                + " len=" + body.length() + " " + safeUrl);
        if (LOG_FULL_BODY) {
            logChunked(body);
        }
        Log.i(TAG, ">>> end " + url.encodedPath());
        CompanionBridge.sendHttpResponse(safeUrl, httpCode, contentType, body);
    }

    /** Single-course XML of a MyClip (お気に入り) course whose detail screen is opening. */
    static void deliverMyClipCourse(String courseXml) {
        Log.i(TAG, "<<< myclip course len=" + courseXml.length());
        if (LOG_FULL_BODY) {
            logChunked(courseXml);
        }
        CompanionBridge.sendMyClipCourse(courseXml);
    }

    /** Single-course XML captured from the transfer alarm save path. */
    static void deliverTransferAlarmCourse(String courseXml) {
        Log.i(TAG, "<<< transfer alarm course len=" + courseXml.length());
        if (LOG_FULL_BODY) {
            logChunked(courseXml);
        }
        CompanionBridge.sendTransferAlarmCourse(courseXml);
    }

    private static void logChunked(String body) {
        int total = (body.length() + LOG_CHUNK_CHARS - 1) / LOG_CHUNK_CHARS;
        for (int i = 0; i < total; i++) {
            int start = i * LOG_CHUNK_CHARS;
            int end = Math.min(start + LOG_CHUNK_CHARS, body.length());
            Log.i(TAG, "[" + (i + 1) + "/" + total + "] " + body.substring(start, end));
        }
    }

    private static String redact(HttpUrl url) {
        HttpUrl.Builder b = url.newBuilder();
        for (String name : REDACTED_QUERY_PARAMS) {
            if (url.queryParameter(name) != null) {
                b.setQueryParameter(name, "***");
            }
        }
        return b.build().toString();
    }
}
