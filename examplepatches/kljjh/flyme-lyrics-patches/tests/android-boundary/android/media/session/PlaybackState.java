
package android.media.session;
public class PlaybackState {
  public static final int STATE_PLAYING=3;
  private int state; public PlaybackState(int s){state=s;}
  public int getState(){return state;}
}
