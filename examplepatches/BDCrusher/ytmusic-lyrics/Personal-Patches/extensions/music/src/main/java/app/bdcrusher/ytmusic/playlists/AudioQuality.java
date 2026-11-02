/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.playlists;

import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.Format;
import java.util.*;

/** Quality is chosen from real Opus streams. Never relabel AAC or invent an available format. */
public final class AudioQuality {
    public enum Tier {
        HIGH("High", Integer.MAX_VALUE), STANDARD("Standard", 128000), LOW("Low", 64000);
        public final String label; public final int ceiling;
        Tier(String label,int ceiling){this.label=label;this.ceiling=ceiling;}
        public static Tier parse(String value){try{return valueOf(value);}catch(Exception invalid){return HIGH;}}
    }
    private AudioQuality(){}
    public static boolean opus(Format f){return f.getMimeType().toLowerCase(Locale.ROOT).startsWith("audio/webm")
        && f.getMimeType().toLowerCase(Locale.ROOT).contains("opus") && !f.getUrl().isBlank();}
    public static Format select(List<Format> available,Tier tier){
        List<Format> formats=available.stream().filter(AudioQuality::opus).sorted(Comparator.comparingInt(Format::getBitrate)).collect(java.util.stream.Collectors.toList());
        if(formats.isEmpty())return null;
        Format selected=formats.get(0);
        for(Format f:formats)if(f.getBitrate()<=tier.ceiling)selected=f;
        return selected;
    }
    public static long estimate(Format format,int seconds){
        if(format==null)return -1;if(format.getContentLength()>0)return format.getContentLength();
        long bitrate=format.getAverageBitrate()>0?format.getAverageBitrate():format.getBitrate();
        return bitrate>0&&seconds>0?bitrate*(long)seconds/8:-1;
    }
}
