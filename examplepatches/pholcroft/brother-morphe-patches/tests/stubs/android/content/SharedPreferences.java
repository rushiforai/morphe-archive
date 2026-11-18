package android.content;
import java.util.Map;
public interface SharedPreferences {
 boolean getBoolean(String key,boolean fallback);String getString(String key,String fallback);Map<String,?> getAll();Editor edit();
 interface Editor {Editor putString(String key,String value);Editor putBoolean(String key,boolean value);Editor remove(String key);void apply();boolean commit();}
}
