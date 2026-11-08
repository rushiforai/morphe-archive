
package android.app;
import android.service.notification.StatusBarNotification;
public class NotificationManager {
  public java.util.List<StatusBarNotification> entries=new java.util.ArrayList<>();
  public int posts; public boolean fail;
  public StatusBarNotification[] getActiveNotifications(){return entries.toArray(new StatusBarNotification[0]);}
  public void notify(String tag,int id,Notification n){
    if(fail)throw new SecurityException("denied");
    posts++;
    for(StatusBarNotification e:entries)if(java.util.Objects.equals(e.tag,tag)&&e.id==id){e.n=n;return;}
    throw new AssertionError("must reuse existing notification identity");
  }
}
