package android.content;
import java.util.*;
public class Context {
 public static final int MODE_PRIVATE=0; private final Map<String,Pref> prefs=new HashMap<>();public Context getApplicationContext(){return this;} public synchronized SharedPreferences getSharedPreferences(String name,int mode){return prefs.computeIfAbsent(name,k->new Pref());}
 static final class Pref implements SharedPreferences,SharedPreferences.Editor {
  final Map<String,Object> m=new HashMap<>();public boolean getBoolean(String k,boolean f){return (Boolean)m.getOrDefault(k,f);}public String getString(String k,String f){return (String)m.getOrDefault(k,f);}public Map<String,?> getAll(){return new HashMap<>(m);}public Editor edit(){return this;}public Editor putString(String k,String v){m.put(k,v);return this;}public Editor putBoolean(String k,boolean v){m.put(k,v);return this;}public Editor remove(String k){m.remove(k);return this;}public void apply(){}public boolean commit(){return true;}
 }
}
