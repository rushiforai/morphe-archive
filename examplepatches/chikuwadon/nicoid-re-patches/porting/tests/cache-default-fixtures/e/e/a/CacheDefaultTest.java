package e.e.a;
import java.io.*;import java.lang.reflect.*;import java.util.*;import android.content.*;import android.preference.PreferenceManager;
public class CacheDefaultTest{
 static void check(boolean b,String m){if(!b)throw new AssertionError(m);}
 static final Map<String,String> values=new HashMap<>();
 static Object preferences(Class<?> type){return Proxy.newProxyInstance(type.getClassLoader(),new Class[]{type},(p,m,a)->{String n=m.getName();if(n.equals("getString"))return values.containsKey(a[0])?values.get(a[0]):a[1];if(n.equals("edit"))return preferences(SharedPreferences.Editor.class);if(n.equals("putString")){values.put((String)a[0],(String)a[1]);return p;}if(n.equals("remove")){values.remove(a[0]);return p;}if(n.equals("commit"))return true;if(n.equals("apply"))return null;throw new AssertionError(n);});}
 public static void main(String[] args)throws Exception{
  PreferenceManager.prefs=(SharedPreferences)preferences(SharedPreferences.class);File base=new File(args[0]).getAbsoluteFile();File external=new File(base,"external"),internal=new File(base,"internal");external.mkdirs();internal.mkdirs();Context c=new Context(external,internal);
  check(CacheFolders.root(c).equals(external.getAbsolutePath()),"default preserves existing app-private location");
  ComponentName worker=new ComponentName("com.sauzask.nicoid.NicoidDownloadCache");Intent download=new Intent(worker);
  check(CacheFolders.startService(c,download)==worker&&c.starts==1,"unset folder starts cache service without picker");
  File folder=new File(CacheFolders.root(c),"nicoid/nicoid_cache");check(folder.isDirectory(),"cache directory prepared before worker starts");
  File video=new CacheFile(folder,"sm1.json");try(OutputStream out=new CacheOutputStream(video)){out.write("metadata".getBytes("UTF-8"));}
  try(InputStream in=new FileInputStream(video)){check(in.read()=='m',"private cache is writable and readable");}
  File nested=new CacheFile(folder,"new/sm2.bin");try(OutputStream out=new CacheOutputStream(nested)){out.write(42);}check(nested.exists(),"missing parents created safely");
  File history=new CacheFile("/@nicoid-cache/abc/nicoid/history.json");check(history.getParentFile().equals(new File(external,"nicoid")),"history remains private");
  values.put("cache_tree_uri","content://test/tree/chosen");String saf=CacheFolders.root(c);check(saf.startsWith("/@nicoid-cache/"),"explicit folder stays selected");check(values.containsKey("cache_tree_"+saf.substring("/@nicoid-cache/".length())),"old SAF mapping persisted");
  values.remove("cache_tree_uri");check(CacheFolders.root(c).equals(external.getAbsolutePath())&&video.exists(),"return to default retains private cache");check(values.size()==1,"return to default retains previous SAF mapping");
  Context fallback=new Context(null,internal);check(CacheFolders.root(fallback).equals(internal.getAbsolutePath()),"unavailable external private storage falls back internally");check(CacheFolders.startForegroundService(fallback,download)==worker&&fallback.starts==1,"default supports foreground cache service");
  try(OutputStream out=new CacheOutputStream(new CacheFile(CacheFolders.root(fallback)+"/nicoid/nicoid_cache/sm3.json"))){out.write(7);}
  check(new File(internal,"nicoid/nicoid_cache/sm3.json").exists(),"internal fallback is writable");
  System.out.println("Default cache: 13 storage/service/compatibility checks passed");
 }
}
