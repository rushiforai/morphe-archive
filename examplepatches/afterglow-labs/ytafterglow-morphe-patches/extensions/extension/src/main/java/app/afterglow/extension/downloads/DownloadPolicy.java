package app.afterglow.extension.downloads;

import java.net.URI;
import java.util.Locale;

/** Platform-independent port of the iOS queue identity/transition/retry policies. */
final class DownloadPolicy {
    static final int MAX_JOBS=500, MAX_ITEMS=10000;
    static final long MAX_FILE_BYTES=32L*1024*1024*1024, DISK_RESERVE=32L*1024*1024;
    private DownloadPolicy() {}
    static boolean transition(DownloadJob.State from, DownloadJob.State to) {
        if (from==to) return true;
        switch (from) {
            case QUEUED: return to==DownloadJob.State.RUNNING || to==DownloadJob.State.PAUSED || to==DownloadJob.State.CANCELLED;
            case RUNNING: return to!=DownloadJob.State.RUNNING;
            case PAUSED: return to==DownloadJob.State.QUEUED || to==DownloadJob.State.RUNNING || to==DownloadJob.State.CANCELLED;
            case WAITING_FOR_DELIVERY: return to==DownloadJob.State.QUEUED || to==DownloadJob.State.RUNNING || to==DownloadJob.State.SUCCEEDED || to==DownloadJob.State.FAILED || to==DownloadJob.State.CANCELLED;
            case FAILED: case CANCELLED: return to==DownloadJob.State.QUEUED;
            default: return false;
        }
    }
    static boolean sameSelection(DownloadRequest a, DownloadRequest b) {
        if (!a.videoId.equals(b.videoId) || a.kind!=b.kind) return false;
        switch (a.kind) {
            case VIDEO:
                if(a.videoItag!=b.videoItag) return false;
                // fall through: video/audio identity includes language and DRC.
            case AUDIO:
                return a.audioItag==b.audioItag && a.audioDrc==b.audioDrc && a.audioTrackId.equals(b.audioTrackId) && a.audioLanguageCode.equals(b.audioLanguageCode);
            case CAPTIONS: return a.captionTrackId.equals(b.captionTrackId) && a.captionLanguageCode.equals(b.captionLanguageCode);
            case THUMBNAIL: return a.qualityLabel.equals(b.qualityLabel);
            default: return false;
        }
    }
    static boolean retryHttp(int status) { return status==408 || status==425 || status==429 || status>=500 && status<=599; }
    static long retryDelay(int attempt) { return 1000L << Math.max(0,Math.min(2,attempt)); }
    static String text(String value, int max) {
        if(value==null) return "";
        String clean=value.replaceAll("[\\p{Cntrl}&&[^\\n\\t]]", "");
        return clean.length()>max ? clean.substring(0,max) : clean;
    }
    static String safeThumbnail(String value) {
        try {
            URI u=new URI(value);
            String host=u.getHost();
            if (!"https".equals(u.getScheme()) || host==null || u.getRawUserInfo()!=null) return "";
            if (!(host.equals("i.ytimg.com") || host.equals("img.youtube.com") || host.endsWith(".ytimg.com"))) return "";
            return new URI("https",host,u.getPath(),null).toASCIIString();
        } catch(Exception ignored) { return ""; }
    }
    static DownloadRequest sanitize(DownloadRequest input) {
        if(input==null || input.videoId==null || !input.videoId.matches("[A-Za-z0-9_-]{6,64}")) throw new IllegalArgumentException("Choose a valid YouTube video.");
        DownloadRequest r=input.copy();
        if(r.kind==null || r.postAction==null) throw new IllegalArgumentException("Choose a download format.");
        r.videoId=text(r.videoId,64); r.title=text(r.title,1024); if(r.title.isEmpty()) r.title=r.videoId;
        r.description=text(r.description,8192); // Inspector detail only; excluded from queue persistence.
        r.channelName=text(r.channelName,512); r.thumbnailUrl=safeThumbnail(r.thumbnailUrl);
        r.audioTrackId=selection(r.audioTrackId); r.audioLanguageCode=selection(r.audioLanguageCode);
        r.captionTrackId=selection(r.captionTrackId); r.captionLanguageCode=selection(r.captionLanguageCode);
        r.container=extension(r.container); r.formatSummary=text(r.formatSummary,512);
        r.qualityLabel=text(r.qualityLabel,128); r.collectionName=text(r.collectionName,256).trim();
        r.height=Math.max(0,Math.min(r.height,16384)); r.durationMs=Math.max(0,r.durationMs);
        if(r.replacesItemId==null)r.replacesItemId="";
        if(!r.replacesItemId.isEmpty() && !r.replacesItemId.matches("[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}")) throw new IllegalArgumentException("Invalid replacement item.");
        return r;
    }
    private static String selection(String text) {
        String value=text(text,256);
        if(value.contains("://") || value.contains("?") || value.contains("&")) throw new IllegalArgumentException("Invalid format selection.");
        return value;
    }
    static String extension(String input) {
        String value=input==null ? "" : input.toLowerCase(Locale.ROOT);
        switch(value) { case "mp4": case "m4a": case "webm": case "vtt": case "srt": case "txt": case "jpg": case "jpeg": case "png": case "webp": case "mp3": case "ogg": case "opus": case "wav": case "flac": return value; default: throw new IllegalArgumentException("Unsupported file format."); }
    }
    static String exportName(String input, String ext) {
        String suffix="."+extension(ext);
        String title=(input==null ? "" : input).replaceAll("[\\\\/:*?\"<>|\\p{Cntrl}]","_").trim();
        if(title.toLowerCase(Locale.ROOT).endsWith(suffix)) title=title.substring(0,title.length()-suffix.length());
        if(title.isEmpty()) title="Afterglow";
        if(title.length()>120) title=title.substring(0,120);
        return title+suffix;
    }
    /** A provider can identify audio in containers whose filename alone also permits video. */
    static String importMime(String ext, String declaredMime) {
        String type=declaredMime==null?"":declaredMime.trim().toLowerCase(Locale.ROOT);
        if("webm".equals(ext)&&"audio/webm".equals(type))return type;
        if("mp4".equals(ext)&&"audio/mp4".equals(type))return type;
        return mime(ext);
    }
    static String mime(String ext) {
        switch(ext) { case "mp4":return "video/mp4";case "m4a":return "audio/mp4";case "webm":return "video/webm";case "mp3":return "audio/mpeg";case "ogg":case "opus":return "audio/ogg";case "wav":return "audio/wav";case "flac":return "audio/flac";case "vtt":return "text/vtt";case "srt":return "application/x-subrip";case "txt":return "text/plain";case "png":return "image/png";case "webp":return "image/webp";default:return "image/jpeg"; }
    }
}
