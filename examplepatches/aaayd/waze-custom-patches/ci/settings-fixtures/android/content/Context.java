package android.content;
import java.lang.reflect.Proxy;
import java.util.*;
public class Context {
 public final android.content.res.Resources resources=new android.content.res.Resources();
 public final android.content.res.AssetManager assets=new android.content.res.AssetManager();
 public java.io.File filesDir;
 public android.content.res.AssetManager getAssets(){return assets;}
 public Context getApplicationContext(){return this;}
 public java.io.File getFilesDir(){return filesDir;}
 public android.content.res.Resources getResources() { return resources; }
 public String getPackageName() { return "com.waze"; }
 public android.graphics.drawable.Drawable getDrawable(int id) { return new android.graphics.drawable.Drawable(id); }
 public String saved;
 public boolean failNextCommit;
 public final Map<String,Map<String,Object>> stores=new HashMap<>();
 public SharedPreferences getSharedPreferences(String name,int mode) {
  Map<String,Object> values=stores.computeIfAbsent(name,key->new HashMap<>());
  return (SharedPreferences) Proxy.newProxyInstance(getClass().getClassLoader(), new Class<?>[]{SharedPreferences.class}, (proxy,method,args)-> {
   String action=method.getName();
   if(action.equals("getString") && "icon_pack".equals(args[0]) && saved!=null)return saved;
   if(action.startsWith("get") && args!=null && args.length==2)return values.getOrDefault(args[0],args[1]);
   if(action.equals("contains"))return values.containsKey(args[0]);
   if(action.equals("edit")){
    Map<String,Object> pending=new HashMap<>();
    return Proxy.newProxyInstance(getClass().getClassLoader(),new Class<?>[]{SharedPreferences.Editor.class},(editor,edit,items)->{
     if(edit.getName().startsWith("put")){pending.put((String)items[0],items[1]);return editor;}
     if(edit.getName().equals("commit")){values.putAll(pending);boolean success=!failNextCommit;failNextCommit=false;return success;}
     if(edit.getName().equals("apply")){values.putAll(pending);return null;}
     throw new AssertionError(edit.getName());
    });
   }
   throw new AssertionError(action);
  });
 }
}
