package app.afterglow.extension.downloads;

/** URL-free selection. The manager copies this object at every public boundary. */
public final class DownloadRequest {
    public enum Kind { VIDEO, AUDIO, CAPTIONS, THUMBNAIL }
    public enum PostAction { KEEP, SHARE, ASK, SAVE_TO_GALLERY }
    public String videoId = "", title = "", channelName = "", thumbnailUrl = "", description = "";
    public Kind kind = Kind.VIDEO;
    public int videoItag, audioItag, height;
    public String audioTrackId = "", audioLanguageCode = "";
    public boolean audioDrc;
    public String captionTrackId = "", captionLanguageCode = "";
    public String container = "mp4", formatSummary = "", qualityLabel = "", collectionName = "";
    public long durationMs;
    /** Set by enqueueReplacement; existing media is retained until the new index commit succeeds. */
    public String replacesItemId = "";
    public PostAction postAction = PostAction.ASK;

    public DownloadRequest() {}
    public DownloadRequest(String videoId) { this.videoId = videoId; }
    public DownloadRequest copy() {
        DownloadRequest r = new DownloadRequest();
        r.videoId=videoId; r.title=title; r.channelName=channelName; r.thumbnailUrl=thumbnailUrl; r.description=description;
        r.kind=kind; r.videoItag=videoItag; r.audioItag=audioItag; r.height=height;
        r.audioTrackId=audioTrackId; r.audioLanguageCode=audioLanguageCode; r.audioDrc=audioDrc;
        r.captionTrackId=captionTrackId; r.captionLanguageCode=captionLanguageCode;
        r.container=container; r.formatSummary=formatSummary; r.qualityLabel=qualityLabel;
        r.collectionName=collectionName; r.durationMs=durationMs; r.postAction=postAction;
        r.replacesItemId=replacesItemId;
        return r;
    }
}
