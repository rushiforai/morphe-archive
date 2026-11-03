/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.playlists;
import java.util.*;
import app.bdcrusher.ytmusic.lyrics.ProtoWire;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.Format;

/** A persisted user choice, independent of the selected downloader application. */
public record MediaSelection(Kind kind,AudioQuality.Tier audio,int height) {
    public enum Kind { AUDIO, VIDEO }
    public MediaSelection {if(kind==null)kind=Kind.AUDIO;if(audio==null)audio=AudioQuality.Tier.HIGH;height=Math.max(144,Math.min(4320,height));}
    public static MediaSelection audio(AudioQuality.Tier tier){return new MediaSelection(Kind.AUDIO,tier,1080);}
    public static int height(Format format){return format.getHeight();}
    public static int width(Format format){return format.getWidth();}
    public static boolean video(Format f){return f.getMimeType().startsWith("video/")&&!f.getUrl().isBlank()&&height(f)>0&&width(f)>0;}
    public static List<Format> videos(List<Format> formats,java.util.function.Predicate<Format> supported){
        TreeMap<Integer,Format> byHeight=new TreeMap<>(Comparator.reverseOrder());
        for(Format f:formats)if(video(f)&&supported.test(f))byHeight.merge(height(f),f,(a,b)->a.getBitrate()<=b.getBitrate()?a:b);
        return List.copyOf(byHeight.values());
    }
    public Format chooseVideo(List<Format> formats,java.util.function.Predicate<Format> supported){
        List<Format> available=videos(formats,supported);Format chosen=null;
        for(Format f:available)if(height(f)<=height&&(chosen==null||height(f)>height(chosen)))chosen=f;
        return chosen==null&& !available.isEmpty()?available.get(available.size()-1):chosen;
    }
    public long estimateBatch(List<Format> formats,long seconds,java.util.function.Predicate<Format> supported){
        Format audioFormat=AudioQuality.select(formats,audio);long a=durationBytes(audioFormat,seconds);
        if(kind==Kind.AUDIO)return a;Format videoFormat=chooseVideo(formats,supported);if(videoFormat==null)return a;
        long v=durationBytes(videoFormat,seconds);return a<0||v<0?-1:a+v;
    }
    private static long durationBytes(Format format,long seconds){if(format==null||seconds<=0)return -1;long bitrate=format.getAverageBitrate()>0?format.getAverageBitrate():format.getBitrate();return bitrate<=0?-1:bitrate*seconds/8;}
    public long estimate(List<Format> formats,int seconds,java.util.function.Predicate<Format> supported){
        long audioBytes=AudioQuality.estimate(AudioQuality.select(formats,audio),seconds);
        if(kind==Kind.AUDIO)return audioBytes;Format video=chooseVideo(formats,supported);if(video==null)return audioBytes;
        long videoBytes=AudioQuality.estimate(video,seconds);return audioBytes<0||videoBytes<0?-1:audioBytes+videoBytes;
    }
}
