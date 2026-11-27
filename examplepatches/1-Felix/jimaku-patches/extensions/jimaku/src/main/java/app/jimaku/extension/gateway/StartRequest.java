package app.jimaku.extension.gateway;

/** What starting a job asks for, as the extension's {@code StartRequest}. */
public final class StartRequest {
    public final String video;
    public final String title;
    public final String lang;
    /** The gateway's method: premium (also a free translation of a cached transcript) or captions (Standard). */
    public final String method;
    /** The video's length in seconds. */
    public final double duration;
    /** Standard's source language, the caption track's. */
    public final String source;
    /** Standard's caption track as the extension sends it, {@code {title, events}}. */
    public final String body;

    private StartRequest(String video, String title, String lang, String method, double duration, String source, String body) {
        this.video = video;
        this.title = title;
        this.lang = lang;
        this.method = method;
        this.duration = duration;
        this.source = source;
        this.body = body;
    }

    /** Premium, which for a video with a cached transcript is a free translation of it. */
    public static StartRequest premium(String video, String title, String lang, double duration) {
        return new StartRequest(video, title, lang, "premium", duration, null, null);
    }

    /** Standard, from YouTube's caption track in {@code source}. */
    public static StartRequest captions(String video, String title, String lang, double duration, String source, String body) {
        return new StartRequest(video, title, lang, "captions", duration, source, body);
    }
}
