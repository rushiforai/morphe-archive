package android.content;
public interface SharedPreferences {
 int getInt(String key,int fallback);
 boolean getBoolean(String key,boolean fallback);
 Editor edit();
 interface Editor {
  Editor putInt(String key,int value);
  Editor putBoolean(String key,boolean value);
  boolean commit();
 }
}
