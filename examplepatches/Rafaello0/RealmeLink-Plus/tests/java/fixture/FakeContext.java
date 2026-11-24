package fixture;
import java.util.HashMap;
import java.util.Map;
import android.content.Context;
import android.content.SharedPreferences;
public class FakeContext extends Context {
 private final Map<String, SharedPreferences> stores = new HashMap<>();
 @Override public SharedPreferences getSharedPreferences(String name,int mode) {
  return stores.computeIfAbsent(name, k -> new Store());
 }
 static final class Store implements SharedPreferences {
  private final Map<String,Object> values = new HashMap<>();
  public Map<String,?> getAll(){return new HashMap<>(values);}
  public String getString(String key,String otherwise){Object v=values.get(key);return v instanceof String?(String)v:otherwise;}
  public int getInt(String key,int otherwise){Object v=values.get(key);return v instanceof Integer?(Integer)v:otherwise;}
  public boolean getBoolean(String key,boolean otherwise){Object v=values.get(key);return v instanceof Boolean?(Boolean)v:otherwise;}
  public Editor edit() {return new Editor() {
   public Editor putString(String key,String val){values.put(key,val);return this;}
   public Editor putInt(String key,int val){values.put(key,val);return this;}
   public Editor putBoolean(String key,boolean val){values.put(key,val);return this;}
   public boolean commit(){return true;}
   public void apply(){commit();}
  };}
 }
}
