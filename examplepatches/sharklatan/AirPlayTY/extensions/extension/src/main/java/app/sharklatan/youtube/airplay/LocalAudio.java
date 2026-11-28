package app.sharklatan.youtube.airplay;
import android.media.AudioTrack;
import java.util.*;
import android.media.session.MediaSession;
import android.media.session.PlaybackState;

/** Mutes only YouTube's AudioTracks, preserving system volume and requested gain. */
public final class LocalAudio {
    private static final Map<AudioTrack,float[]> tracks=new WeakHashMap<>();
    private static boolean muted;
    private static MediaSession currentSession;
    private static boolean remote;
    private static PlaybackState lastLocalState;
    private static final RemoteVolumeState volumeState=new RemoteVolumeState();
    private static final android.media.VolumeProvider provider=new android.media.VolumeProvider(android.media.VolumeProvider.VOLUME_CONTROL_ABSOLUTE,100,50){
        public void onAdjustVolume(int direction){
            android.util.Log.i("YouTubeAirPlay","Volume adjustment direction="+direction);
            int value=volumeState.adjust(direction);if(value<0)return;
            sendRequested(value);
        }
        public void onSetVolumeTo(int volume){sendRequested(volumeState.request(volume));}
        private void sendRequested(int value){
            AirPlayActivity owner=NativeRemote.owner;
            if(!NativeRemote.active||owner==null)return;
            // Update only from user intent. A following key press must use the pending target.
            setCurrentVolume(value);owner.nativeVolume(value/100.0);
        }
    };
    static synchronized void remoteVolume(boolean enabled){remote=enabled;route();}
    static long volumeRevision(){return volumeState.revision();}
    static void reportVolume(long revision,double ratio){
        int value=(int)Math.round(ratio*100);
        if(volumeState.report(revision,value))provider.setCurrentVolume(value);
    }
    private static void route(){if(currentSession==null)return;try{
        if(remote)currentSession.setPlaybackToRemote(provider);
        else {currentSession.setPlaybackToLocal(new android.media.AudioAttributes.Builder().setUsage(android.media.AudioAttributes.USAGE_MEDIA).setContentType(android.media.AudioAttributes.CONTENT_TYPE_MOVIE).build());if(lastLocalState!=null)currentSession.setPlaybackState(lastLocalState);}
    }catch(Exception e){android.util.Log.e("YouTubeAirPlay","Volume route",e);}}

    public static void play(AudioTrack track){track.play();}
    public static void pause(AudioTrack track){track.pause();}
    public static void stop(AudioTrack track){track.stop();}
    public static void state(MediaSession session,PlaybackState state){
        if(currentSession!=session){currentSession=session;route();}
        lastLocalState=state;
        AirPlayActivity owner=NativeRemote.owner;
        session.setPlaybackState(state!=null&&remote&&owner!=null?owner.projectedState(state):state);
        if(state==null)return;
        android.util.Log.i("YouTubeAirPlay","LocalAudio.state "+state.getState());
        if(state.getState()==PlaybackState.STATE_PLAYING)NativeRemote.rate(true);
        else if(state.getState()==PlaybackState.STATE_PAUSED)NativeRemote.rate(false);
        // YouTube emits STOPPED between autoplay items. It is not a user pause:
        // forwarding it would also make the next item inherit a paused remote rate.
        else if(state.getState()==PlaybackState.STATE_STOPPED&&!NativeRemote.active)NativeRemote.rate(false);
    }
    static void publishRemoteState(){
        AirPlayActivity owner=NativeRemote.owner;
        if(remote&&owner!=null&&currentSession!=null&&lastLocalState!=null)currentSession.setPlaybackState(owner.projectedState(lastLocalState));
    }
    public static synchronized int volume(AudioTrack track,float gain){
        tracks.put(track,new float[]{gain,gain});return track.setVolume(muted?0:gain);
    }
    @SuppressWarnings("deprecation")
    public static synchronized int stereo(AudioTrack track,float left,float right){
        tracks.put(track,new float[]{left,right});return track.setStereoVolume(muted?0:left,muted?0:right);
    }
    @SuppressWarnings("deprecation")
    public static synchronized void mute(boolean value){
        muted=value;
        for(Map.Entry<AudioTrack,float[]> entry:tracks.entrySet())try {
            float[] gain=entry.getValue();entry.getKey().setStereoVolume(value?0:gain[0],value?0:gain[1]);
        }catch(IllegalStateException ignored){}
    }
}
