package app.afterglow.extension.downloads;

import android.net.Uri;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import app.afterglow.extension.settings.AfterglowPrefs;
import app.afterglow.extension.diagnostics.DebugLog;
import app.afterglow.extension.downloads.PlayerDownloadSource.Caption;
import app.afterglow.extension.downloads.PlayerDownloadSource.Format;
import app.afterglow.extension.downloads.PlayerDownloadSource.Video;

/** Afterglow format/track policy. Only the URL-free selection enters the durable queue. */
public final class AfterglowDownloadResolver implements DownloadResolver {
    public static final AfterglowDownloadResolver INSTANCE=new AfterglowDownloadResolver();
    private final PlayerDownloadSource source=new PlayerDownloadSource();
    private final Map<String,Video> cache=new LinkedHashMap<>();
    private AfterglowDownloadResolver() {}

    private synchronized Video load(String id,Cancellation cancellation) throws Exception {
        if(id==null||!id.matches("[A-Za-z0-9_-]{11}"))
            throw new Failure(Failure.Category.UNAVAILABLE,"Open a video before downloading.");
        cancellation.throwIfCancelled();
        Video video=cache.get(id);
        if(video!=null&&System.currentTimeMillis()-video.created<90000)return video;
        try { video=source.load(id,cancellation); }
        catch(Exception ignored) {
            cancellation.throwIfCancelled();
            throw new Failure(Failure.Category.NETWORK,"Could not load this video's download choices. Check the connection and try again.");
        }
        DebugLog.write("extractor", "Resolved formats="+video.formats.size()+" captions="+video.captions.size());
        cache.put(id,video);
        while(cache.size()>4)cache.remove(cache.keySet().iterator().next());
        return video;
    }

    @Override public DownloadCatalog inspect(String id,Cancellation cancellation) throws Exception {
        Video video=load(id,cancellation);
        List<DownloadCatalog.Option> videos=new ArrayList<>(),audio=new ArrayList<>(),captions=new ArrayList<>(),thumbnails=new ArrayList<>();
        List<Format> formats=new ArrayList<>(video.formats);
        formats.sort(Comparator.comparingInt((Format f)->f.height).reversed()
                .thenComparing(Comparator.comparingInt((Format f)->f.fps).reversed())
                .thenComparing(Comparator.comparingInt((Format f)->f.bitrate).reversed()));
        for(Format f:formats) {
            if(f.audio) {
                DownloadRequest r=base(video);r.kind=DownloadRequest.Kind.AUDIO;setAudio(r,f);
                r.container=webm(f)?"webm":"m4a";
                r.qualityLabel=audioLabel(f);r.formatSummary=r.qualityLabel+" · "+r.container.toUpperCase(Locale.ROOT);
                audio.add(new DownloadCatalog.Option(r.qualityLabel,audioDetail(f),r,f.bytes));
            } else {
                Format a=f.combined?null:preferredAudio(formats,webm(f));
                if(!f.combined&&a==null)continue; // Never offer a silent video as a normal video download.
                DownloadRequest r=base(video);r.kind=DownloadRequest.Kind.VIDEO;r.videoItag=f.itag;r.height=f.height;
                if(a!=null)setAudio(r,a);r.container=webm(f)?"webm":"mp4";
                r.qualityLabel=f.quality.isEmpty()?(f.height>0?f.height+"p":"Video · "+f.itag):f.quality;
                r.formatSummary=r.qualityLabel+" · "+r.container.toUpperCase(Locale.ROOT);
                String detail=r.container.toUpperCase(Locale.ROOT)+" · "+codec(f.mime)
                        +(a==null?" · audio included":" · "+audioLabel(a))+size(f.bytes+(a==null?0:a.bytes));
                videos.add(new DownloadCatalog.Option(r.qualityLabel,detail,r,
                        f.bytes>0&&(a==null||a.bytes>0)?f.bytes+(a==null?0:a.bytes):0));
            }
        }
        audio.sort(Comparator.comparingInt((DownloadCatalog.Option option) -> {
            Format format=matchAudio(video,option.request);
            return format==null?Integer.MIN_VALUE:audioScore(format);
        }).reversed());
        for(Caption c:video.captions) {
            if(c.automatic&&!AfterglowPrefs.getBool("downloadIncludeAutoCaptions"))continue;
            captions.add(captionOption(video,c,c.language,c.label,false));
        }
        if(AfterglowPrefs.getBool("downloadOfferTranslatedCaptions")&&!video.captions.isEmpty()) {
            Caption source=video.captions.get(0);
            for(Caption c:video.captions)if(!c.automatic){source=c;break;}
            for(Map.Entry<String,String> language:video.translationLanguages.entrySet()) {
                boolean nativeTrack=false;
                for(Caption c:video.captions)if(c.language.equals(language.getKey())){nativeTrack=true;break;}
                if(!nativeTrack)captions.add(captionOption(video,source,language.getKey(),language.getValue(),true));
            }
        }
        if(!video.thumbnail.isEmpty()) {
            DownloadRequest r=base(video);r.kind=DownloadRequest.Kind.THUMBNAIL;r.container=imageContainer(video.thumbnail);
            r.formatSummary="Thumbnail";thumbnails.add(new DownloadCatalog.Option("Save thumbnail","Original image",r));
        }
        return new DownloadCatalog(video.id,video.title,video.channel,video.thumbnail,video.duration,
                videos,audio,captions,thumbnails,video.description);
    }

    @Override public ResolvedDownload resolve(DownloadRequest request,Cancellation cancellation) throws Exception {
        Video video=load(request.videoId,cancellation);
        // A retry must rebind fresh signed URLs instead of recycling a denied/expired URL.
        synchronized(this){cache.remove(request.videoId);}
        List<Track> tracks=new ArrayList<>();
        switch(request.kind) {
            case VIDEO: {
                Format v=matchVideo(video,request.videoItag);
                if(v==null)throw missing();
                if(v.combined)tracks.add(track(v,Role.COMBINED));
                else {
                    Format a=matchAudio(video,request);
                    if(a==null||webm(v)!=webm(a))throw missing();
                    tracks.add(track(v,Role.VIDEO));tracks.add(track(a,Role.AUDIO));
                }
                return new ResolvedDownload(tracks,webm(v)?"webm":"mp4");
            }
            case AUDIO: {
                Format a=matchAudio(video,request);if(a==null)throw missing();
                tracks.add(track(a,Role.AUDIO));return new ResolvedDownload(tracks,webm(a)?"webm":"m4a");
            }
            case CAPTIONS: {
                String key=request.captionTrackId;int translated=key.indexOf("|translate:");
                String original=translated<0?key:key.substring(0,translated);
                Caption caption=null;for(Caption c:video.captions)if(c.id.equals(original)){caption=c;break;}
                if(caption==null)throw missing();
                Uri.Builder url=Uri.parse(caption.url).buildUpon();url.appendQueryParameter("fmt","vtt");
                if(translated>=0)url.appendQueryParameter("tlang",request.captionLanguageCode);
                tracks.add(new Track(Role.CAPTIONS,url.build().toString(),caption.headers,"caption:"+key,"text/vtt",0));
                return new ResolvedDownload(tracks,"vtt");
            }
            case THUMBNAIL:
                if(video.thumbnail.isEmpty())throw missing();
                tracks.add(new Track(Role.THUMBNAIL,video.thumbnail,Collections.emptyMap(),"thumbnail:"+video.id,
                        "image/"+(imageContainer(video.thumbnail).equals("jpg")?"jpeg":imageContainer(video.thumbnail)),0));
                return new ResolvedDownload(tracks,imageContainer(video.thumbnail));
            default: throw missing();
        }
    }

    private static Failure missing() {
        return new Failure(Failure.Category.UNAVAILABLE,"This selection is no longer available. Open the download sheet and choose a current format.");
    }
    private static Track track(Format f,Role role) {return new Track(role,f.url,f.headers,f.identity(),f.mime,f.bytes);}
    private static Format matchVideo(Video v,int itag) {for(Format f:v.formats)if(!f.audio&&f.itag==itag)return f;return null;}
    private static Format matchAudio(Video v,DownloadRequest r) {
        for(Format f:v.formats)if(f.audio&&f.itag==r.audioItag&&f.trackId.equals(r.audioTrackId)
                &&f.language.equals(r.audioLanguageCode)&&f.drc==r.audioDrc)return f;
        return null;
    }
    private static Format preferredAudio(List<Format> formats,boolean webm) {
        Format best=null;int bestScore=Integer.MIN_VALUE;
        for(Format f:formats) {
            if(!f.audio||webm(f)!=webm)continue;
            int score=audioScore(f);
            if(score>bestScore){bestScore=score;best=f;}
        }
        return best;
    }
    private static int audioScore(Format f) {
        boolean premium=AfterglowPrefs.getInt("downloadAudioQualityMode")==1;
        boolean stable=AfterglowPrefs.getBool("downloadPreferStableAudio");
        String language=Locale.getDefault().getLanguage();
        int score=(f.defaultAudio?1000000:0)+(f.language.equals(language)?500000:0)
                +(f.trackId.isEmpty()?100000:0)+(f.drc?-50000:0);
        score+=premium?Math.min(40000,f.bitrate/10):-Math.min(40000,Math.abs(f.bitrate-128000)/10);
        if(stable&&f.mime.contains("mp4a"))score+=30000;
        return score;
    }
    private static void setAudio(DownloadRequest r,Format f) {
        r.audioItag=f.itag;r.audioTrackId=f.trackId;r.audioLanguageCode=f.language;r.audioDrc=f.drc;
    }
    private static DownloadRequest base(Video v) {
        DownloadRequest r=new DownloadRequest(v.id);r.title=v.title;r.channelName=v.channel;r.thumbnailUrl=v.thumbnail;
        r.description=v.description;r.durationMs=v.duration;
        int action=AfterglowPrefs.getInt("downloadPostActionMode");
        r.postAction=action==1?DownloadRequest.PostAction.SAVE_TO_GALLERY:action==2?DownloadRequest.PostAction.SHARE:DownloadRequest.PostAction.ASK;
        return r;
    }
    private static DownloadCatalog.Option captionOption(Video v,Caption c,String lang,String label,boolean translated) {
        DownloadRequest r=base(v);r.kind=DownloadRequest.Kind.CAPTIONS;r.captionTrackId=c.id+(translated?"|translate:"+lang:"");
        r.captionLanguageCode=lang;r.container="vtt";r.qualityLabel=label.isEmpty()?lang:label;
        r.formatSummary=r.qualityLabel+" captions";
        return new DownloadCatalog.Option(r.qualityLabel,(translated?"Translated":c.automatic?"Auto-generated":"Original")+" · WebVTT",r);
    }
    private static boolean webm(Format f){return f.mime.contains("webm");}
    private static String imageContainer(String url){return url.contains(".webp")?"webp":url.contains(".png")?"png":"jpg";}
    private static String audioLabel(Format f) {
        String name=!f.trackName.isEmpty()?f.trackName:!f.language.isEmpty()?new Locale(f.language).getDisplayLanguage():"Audio";
        return name+(f.bitrate>0?" · "+Math.round(f.bitrate/1000f)+" kbps":"")+(f.drc?" · DRC":"");
    }
    private static String audioDetail(Format f){return codec(f.mime)+(f.defaultAudio?" · Default track":"")+size(f.bytes);}
    private static String codec(String mime){int start=mime.indexOf("codecs=\"");return start<0?mime.split(";")[0]:mime.substring(start+8).replace("\"","");}
    private static String size(long n){return n<=0?"":String.format(Locale.getDefault()," · %.1f MB",n/1048576d);}
}
