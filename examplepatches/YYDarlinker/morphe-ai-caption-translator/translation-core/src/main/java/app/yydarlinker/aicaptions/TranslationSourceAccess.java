package app.yydarlinker.aicaptions;

import android.content.Context;

import java.util.concurrent.TimeUnit;

/** Source bytes and timing evidence enter the engine through this cancellable port. */
public final class TranslationSourceAccess {
    public static final class Source {
        final byte[] body;
        final CaptionDocument.Parsed document;
        final String timingProfile;
        final int timingQuality;
        final RebuildSource timingEvidence;

        public Source(
                byte[] body,
                CaptionDocument.Parsed document,
                String profile,
                int quality,
                RebuildSource evidence) {
            this.body = body;
            this.document = document;
            timingProfile = profile;
            timingQuality = quality;
            timingEvidence = evidence;
        }
    }

    static Source load(
            Context c,
            String url,
            boolean translate,
            CaptionApiClient.RequestControl control)
            throws Exception {
        return TranslationRuntime.host().load(c, url, translate, control);
    }

    static Source reference(
            Context c, String url, RebuildSource primary, CaptionApiClient.RequestControl control)
            throws Exception {
        return TranslationRuntime.host().reference(c, url, primary, control);
    }

    static void checkActive(CaptionSourceControl control) throws InterruptedException {
        if (Thread.currentThread().isInterrupted() || control != null && control.isCancelled())
            throw new InterruptedException("source_cancelled");
    }

    static int remaining(long deadline) throws java.net.SocketTimeoutException {
        long value = TimeUnit.NANOSECONDS.toMillis(deadline - System.nanoTime());
        if (value <= 0) throw new java.net.SocketTimeoutException("deadline_expired");
        return (int) Math.min(Integer.MAX_VALUE, value);
    }
}
