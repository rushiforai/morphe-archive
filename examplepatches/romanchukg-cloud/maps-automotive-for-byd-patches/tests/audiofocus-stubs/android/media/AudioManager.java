package android.media;
public final class AudioManager {
 public static final int AUDIOFOCUS_GAIN=1,AUDIOFOCUS_GAIN_TRANSIENT_MAY_DUCK=3,AUDIOFOCUS_LOSS=-1,AUDIOFOCUS_LOSS_TRANSIENT=-2,AUDIOFOCUS_LOSS_TRANSIENT_CAN_DUCK=-3,AUDIOFOCUS_REQUEST_GRANTED=1;
 public interface OnAudioFocusChangeListener {void onAudioFocusChange(int change);}
 public int requests,abandons,result=1;public boolean failRequest,failAbandon;public AudioFocusRequest lastRequest,lastAbandoned;
 public int requestAudioFocus(AudioFocusRequest request){requests++;lastRequest=request;if(failRequest)throw new IllegalStateException();return result;}
 public int abandonAudioFocusRequest(AudioFocusRequest request){abandons++;lastAbandoned=request;if(failAbandon)throw new IllegalStateException();return 1;}
}
