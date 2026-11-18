package app.afterglow.extension.downloads;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/** Inspect result contains selections only; signed URLs stay inside the resolver. */
public final class DownloadCatalog {
    public final String videoId, title, channelName, thumbnailUrl, description;
    public final long durationMs;
    public final List<Option> videos, audio, captions, thumbnails;
    public DownloadCatalog(String videoId, String title, String channelName, String thumbnailUrl,
                           long durationMs, List<Option> videos, List<Option> audio,
                           List<Option> captions, List<Option> thumbnails) {
        this(videoId,title,channelName,thumbnailUrl,durationMs,videos,audio,captions,thumbnails,"");
    }
    public DownloadCatalog(String videoId, String title, String channelName, String thumbnailUrl,
                           long durationMs, List<Option> videos, List<Option> audio,
                           List<Option> captions, List<Option> thumbnails, String description) {
        this.videoId=videoId; this.title=title; this.channelName=channelName;
        this.thumbnailUrl=thumbnailUrl; this.durationMs=durationMs;
        this.description=description == null ? "" : description;
        this.videos=options(videos); this.audio=options(audio);
        this.captions=options(captions); this.thumbnails=options(thumbnails);
    }
    private static List<Option> options(List<Option> list) {
        return Collections.unmodifiableList(new ArrayList<>(list == null ? Collections.emptyList() : list));
    }
    public static final class Option {
        public final String label, detail;
        public final DownloadRequest request;
        public final long estimatedBytes;
        public Option(String label, String detail, DownloadRequest request) {
            this(label,detail,request,0);
        }
        public Option(String label, String detail, DownloadRequest request,long estimatedBytes) {
            this.label=label; this.detail=detail; this.request=request.copy();
            this.estimatedBytes=Math.max(0,estimatedBytes);
        }
    }
}
