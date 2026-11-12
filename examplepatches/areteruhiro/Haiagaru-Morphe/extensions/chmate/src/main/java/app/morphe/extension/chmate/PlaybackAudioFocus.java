package app.morphe.extension.chmate;

import android.content.Context;
import android.media.AudioManager;

/** VideoView prepares without focus; only an actual play action may interrupt music. */
final class PlaybackAudioFocus {
    private final AudioManager audio;
    private final AudioManager.OnAudioFocusChangeListener listener;
    private boolean held,muted;
    PlaybackAudioFocus(Context context,Runnable pause){
        audio=(AudioManager)context.getSystemService(Context.AUDIO_SERVICE);
        listener=change->{if(change<=0){held=false;if(!muted)pause.run();}};
    }
    boolean play(){
        if(muted)return true;
        if(held)return true;
        held=audio==null||audio.requestAudioFocus(listener,AudioManager.STREAM_MUSIC,AudioManager.AUDIOFOCUS_GAIN)==AudioManager.AUDIOFOCUS_REQUEST_GRANTED;
        return held;
    }
    void release(){if(held&&audio!=null)audio.abandonAudioFocus(listener);held=false;}
    void muted(boolean value){muted=value;if(value)release();}
}
