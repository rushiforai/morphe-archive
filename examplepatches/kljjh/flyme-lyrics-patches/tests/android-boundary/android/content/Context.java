
package android.content;
public class Context {
  public static final int MODE_PRIVATE=0;
  public Context getApplicationContext(){return this;}
  private final SharedPreferences prefs=new SharedPreferences();
  public SharedPreferences getSharedPreferences(String name,int mode){return prefs;}
  public static final String NOTIFICATION_SERVICE="notification";
  public android.app.NotificationManager manager=new android.app.NotificationManager();
  public Object getSystemService(String s){return manager;}
}
