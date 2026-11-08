
package android.service.notification;
public class StatusBarNotification {
  public String tag; public int id; public android.app.Notification n;
  public StatusBarNotification(String t,int i,android.app.Notification v){ tag=t;id=i;n=v; }
  public android.app.Notification getNotification(){ return n; }
  public String getTag(){return tag;} public int getId(){return id;}
}
