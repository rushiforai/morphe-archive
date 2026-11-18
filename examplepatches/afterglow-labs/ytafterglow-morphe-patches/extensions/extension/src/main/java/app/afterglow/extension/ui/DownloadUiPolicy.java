package app.afterglow.extension.ui;

import app.afterglow.extension.downloads.DownloadCatalog;
import app.afterglow.extension.downloads.DownloadRequest;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/** Pure presentation decisions shared by the download sheet and viewer. */
final class DownloadUiPolicy {
    private DownloadUiPolicy() {}
    static List<DownloadCatalog.Option> audioTracks(DownloadCatalog catalog,DownloadRequest video){
        Map<String,DownloadCatalog.Option> tracks=new LinkedHashMap<>();
        for(DownloadCatalog.Option option:catalog.audio){DownloadRequest audio=option.request;
            if(audio.kind!=DownloadRequest.Kind.AUDIO)continue;
            if(video!=null&&!compatibleAudio(video,audio))continue;
            // The resolver orders each track by the selected audio quality preference.
            tracks.putIfAbsent(audio.audioTrackId+"|"+audio.audioLanguageCode,option);
        }
        return new ArrayList<>(tracks.values());
    }
    static boolean compatibleAudio(DownloadRequest video,DownloadRequest audio){return "webm".equals(video.container)=="webm".equals(audio.container);}
    static DownloadRequest withAudio(DownloadRequest video,DownloadRequest audio){
        if(video.kind!=DownloadRequest.Kind.VIDEO||audio.kind!=DownloadRequest.Kind.AUDIO||video.audioItag==0||!compatibleAudio(video,audio))throw new IllegalArgumentException("This audio track is incompatible with the selected video.");
        DownloadRequest result=video.copy();result.audioItag=audio.audioItag;result.audioTrackId=audio.audioTrackId;result.audioLanguageCode=audio.audioLanguageCode;result.audioDrc=audio.audioDrc;return result;
    }
    static float pickerScale(int mode){return mode==2?1.10f:mode==1?1f:0.88f;}
    static String pickerFamily(int mode){return mode==1?"sans-serif-rounded":mode==2?"serif":mode==3?"monospace":"sans-serif";}
    static String exportLabel(DownloadRequest.Kind kind){return kind==DownloadRequest.Kind.AUDIO||kind==DownloadRequest.Kind.CAPTIONS?"Save a Copy":"Save to Gallery";}
    static String duration(long ms){long s=Math.max(0,ms/1000);return s>=3600?String.format(Locale.US,"%d:%02d:%02d",s/3600,s/60%60,s%60):String.format(Locale.US,"%d:%02d",s/60,s%60);}
    static String details(DownloadCatalog catalog,DownloadRequest seed){
        String title=catalog==null?seed.title:value(catalog.title,seed.title),channel=catalog==null?seed.channelName:value(catalog.channelName,seed.channelName);
        long ms=catalog==null||catalog.durationMs<=0?seed.durationMs:catalog.durationMs;
        String description=catalog==null?seed.description:value(catalog.description,seed.description);
        StringBuilder text=new StringBuilder();if(title!=null&&!title.isEmpty())text.append(title).append('\n');if(channel!=null&&!channel.isEmpty())text.append("Channel: ").append(channel).append('\n');
        text.append("URL: https://youtu.be/").append(seed.videoId);if(ms>0)text.append("\nDuration: ").append(duration(ms));
        if(description!=null&&!description.isEmpty())text.append("\n\n").append(description.length()>500?description.substring(0,500)+"…":description);
        return text.toString();
    }
    private static String value(String value,String fallback){return value==null||value.isEmpty()?fallback:value;}
}
