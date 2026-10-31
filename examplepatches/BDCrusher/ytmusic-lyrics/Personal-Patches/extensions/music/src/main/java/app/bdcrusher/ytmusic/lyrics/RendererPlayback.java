/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.lyrics;

import android.media.session.PlaybackState;
import android.os.SystemClock;
import app.morphe.extension.music.shared.VideoInformation;

/** Personal renderer clock. Official/native lyric clocks and runtime classes are unchanged. */
public final class RendererPlayback {
    private static String video="";
    private static long position,at,lastSample,revision;
    private static float rate=1;
    private static boolean playing,initialized;
    private RendererPlayback(){}
    public static synchronized void sample(PlaybackState state){
        if(state==null||state.getPosition()<0)return;
        String id=VideoInformation.getVideoId();if(id==null||id.isEmpty())return;
        long now=SystemClock.elapsedRealtime(),stamp=state.getLastPositionUpdateTime();
        if(stamp<=0||stamp>now)stamp=now;
        if(initialized&&id.equals(video)&&stamp<lastSample)return;
        float speed=state.getPlaybackSpeed();if(!(speed>0)||Float.isInfinite(speed))speed=rate;
        boolean nextPlaying=state.getState()==PlaybackState.STATE_PLAYING;
        long next=state.getPosition()+(nextPlaying?(long)((now-stamp)*speed):0);
        long predicted=read(now);
        if(!initialized||!id.equals(video)||nextPlaying!=playing||speed!=rate||Math.abs(next-predicted)>750||!nextPlaying&&Math.abs(next-predicted)>30)revision++;
        if(initialized&&(!id.equals(video)||Math.abs(next-predicted)>750))LyricsDiagnostics.record("Clock-correction","recordingChanged="+!id.equals(video)+" driftMs="+(next-predicted)+" revision="+revision);
        video=id;position=next;at=now;lastSample=stamp;playing=nextPlaying;rate=speed;initialized=true;
    }
    private static long read(long now){return position+(playing?(long)(Math.max(0,now-at)*rate):0);}
    static synchronized long[] snapshot(String id,long fallback,boolean fallbackPlaying,float fallbackRate){
        if(!initialized||!video.equals(id))return new long[]{fallback,fallbackPlaying?1:0,Float.floatToIntBits(fallbackRate),revision};
        return new long[]{read(SystemClock.elapsedRealtime()),playing?1:0,Float.floatToIntBits(rate),revision};
    }
    static synchronized void seek(String id,long target){
        if(initialized&&video.equals(id)){LyricsDiagnostics.record("Seek","positionMs="+target+" revision="+(revision+1));position=target;at=SystemClock.elapsedRealtime();lastSample=at;revision++;}
    }
}
