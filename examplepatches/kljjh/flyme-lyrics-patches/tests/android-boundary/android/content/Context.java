
package android.content;
public class Context {
  public static final String NOTIFICATION_SERVICE="notification";
  public android.app.NotificationManager manager=new android.app.NotificationManager();
  public Object getSystemService(String s){return manager;}
}
