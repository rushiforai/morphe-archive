package android.media;
import android.os.Handler;
public final class AudioFocusRequest {
 public final int gain;public final AudioAttributes attributes;public final boolean delayed;public final AudioManager.OnAudioFocusChangeListener listener;
 private AudioFocusRequest(Builder b){gain=b.gain;attributes=b.attributes;delayed=b.delayed;listener=b.listener;}
 public static final class Builder {
  int gain;AudioAttributes attributes;boolean delayed;AudioManager.OnAudioFocusChangeListener listener;
  public Builder(int gain){this.gain=gain;}
  public Builder setAudioAttributes(AudioAttributes value){attributes=value;return this;}
  public Builder setAcceptsDelayedFocusGain(boolean value){delayed=value;return this;}
  public Builder setOnAudioFocusChangeListener(AudioManager.OnAudioFocusChangeListener value,Handler handler){listener=value;return this;}
  public AudioFocusRequest build(){return new AudioFocusRequest(this);}
 }
}
