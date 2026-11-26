package android.content;
import java.io.File;
import java.util.*;
import java.lang.reflect.*;
public class Context {
 public static final int MODE_PRIVATE=0;
 private final Map<String,SharedPreferences> prefs=new HashMap<>();
 public File getCacheDir(){return new File("apk-inspection/v04-beta7-gate/host-cache");}
 public SharedPreferences getSharedPreferences(String name,int mode){return prefs.computeIfAbsent(name,k->make());}
 private static SharedPreferences make(){
  Map<String,Object> data=new HashMap<>();
  return (SharedPreferences)Proxy.newProxyInstance(Context.class.getClassLoader(),new Class[]{SharedPreferences.class},(o,m,a)->{
   switch(m.getName()){
    case "getInt":
    case "getBoolean":
    case "getLong":
    case "getString":return data.getOrDefault(a[0],a[1]);
    case "contains":return data.containsKey(a[0]);
    case "edit":
     Map<String,Object> staged=new HashMap<>(data);
     return Proxy.newProxyInstance(Context.class.getClassLoader(),new Class[]{SharedPreferences.Editor.class},(e,f,b)->{
      switch(f.getName()){
       case "clear":staged.clear();return e;
       case "remove":staged.remove(b[0]);return e;
       case "putInt":
       case "putBoolean":
       case "putLong":
       case "putString":staged.put((String)b[0],b[1]);return e;
       case "commit":data.clear();data.putAll(staged);return true;
       case "apply":data.clear();data.putAll(staged);return null;
       default:throw new AssertionError(f.getName());
      }
     });
    default:throw new AssertionError(m.getName());
   }
  });
 }
}
