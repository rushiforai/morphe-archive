package app.afterglow.extension.downloads;

import java.util.Locale;

/** MediaMuxer-supported container/codec combinations; no transcoding or silent remux failures. */
final class DownloadFormatPolicy {
    static boolean supported(String mime,int sdk) {
        if(mime==null)return false;
        String value=mime.toLowerCase(Locale.ROOT);
        if(value.startsWith("audio/mp4"))return value.contains("mp4a");
        if(value.startsWith("audio/webm"))return value.contains("vorbis")||sdk>=29&&value.contains("opus");
        if(value.startsWith("video/webm"))return value.contains("vp8")||value.contains("vp9")||value.contains("vp09");
        if(value.startsWith("video/mp4"))return value.contains("avc1")||value.contains("avc3")
                ||value.contains("hvc1")||value.contains("hev1")||sdk>=34&&value.contains("av01");
        return false;
    }
}
