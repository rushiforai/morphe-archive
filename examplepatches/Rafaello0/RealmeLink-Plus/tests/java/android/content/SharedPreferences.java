package android.content;
public interface SharedPreferences {
 java.util.Map<String, ?> getAll();
 int getInt(String key,int fallback);
 String getString(String key,String fallback);
 boolean getBoolean(String key,boolean fallback);
 Editor edit();
 interface Editor {
  Editor putInt(String key,int value);
  Editor putString(String key,String value);
  Editor putBoolean(String key,boolean value);
  boolean commit();
  void apply();
 }
}
