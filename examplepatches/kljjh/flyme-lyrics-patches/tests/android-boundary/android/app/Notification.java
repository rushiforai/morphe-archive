
package android.app;
public class Notification implements Cloneable {
  public static int FLAG_ALWAYS_SHOW_TICKER = 0x1000000;
  public static int FLAG_ONLY_UPDATE_TICKER = 0x2000000;
  public static final int FLAG_NO_CLEAR=32, FLAG_ONLY_ALERT_ONCE=8;
  public static final String EXTRA_MEDIA_SESSION="android.mediaSession";
  public int flags; public CharSequence tickerText;
  public Object actions, icon, artwork; public String channel="media";
  public android.os.Bundle extras=new android.os.Bundle();
  public Notification clone() {
    try { Notification n=(Notification)super.clone(); n.extras=new android.os.Bundle(); n.extras.putAll(extras); return n; }
    catch(CloneNotSupportedException e) { throw new AssertionError(e); }
  }
}
