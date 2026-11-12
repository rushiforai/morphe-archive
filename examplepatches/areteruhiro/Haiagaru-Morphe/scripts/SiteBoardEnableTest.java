package app.morphe.extension.chmate;

import android.content.SharedPreferences;
import java.lang.reflect.*;
import java.net.*;
import java.io.*;
import java.util.*;

/** Real loopback requests with isolated preferences and no external network. */
public final class SiteBoardEnableTest {
 static int checks,fetches;static void ok(boolean value,String text){if(!value)throw new AssertionError(text);checks++;}
 static SharedPreferences memory(){return memory(Runnable::run);}
 static SharedPreferences memory(java.util.function.Consumer<Runnable> dispatch){
  Map<String,Object> values=new HashMap<>();List<SharedPreferences.OnSharedPreferenceChangeListener> listeners=new ArrayList<>();SharedPreferences[] owner=new SharedPreferences[1];
  owner[0]=(SharedPreferences)java.lang.reflect.Proxy.newProxyInstance(SiteBoardEnableTest.class.getClassLoader(),new Class<?>[]{SharedPreferences.class},(p,m,a)->{
   String name=m.getName();if(name.equals("edit")){Map<String,Object> pending=new HashMap<>();boolean[] clear={false};return java.lang.reflect.Proxy.newProxyInstance(SiteBoardEnableTest.class.getClassLoader(),new Class<?>[]{SharedPreferences.Editor.class},(e,em,ea)->{
    String n=em.getName();if(n.startsWith("put")){pending.put((String)ea[0],ea[1]);return e;}if(n.equals("remove")){pending.put((String)ea[0],null);return e;}if(n.equals("clear")){clear[0]=true;return e;}if(n.equals("commit")||n.equals("apply")){if(clear[0])values.clear();List<String> changed=new ArrayList<>();for(var row:pending.entrySet()){if(!Objects.equals(values.get(row.getKey()),row.getValue()))changed.add(row.getKey());if(row.getValue()==null)values.remove(row.getKey());else values.put(row.getKey(),row.getValue());}for(String key:changed)for(var listener:new ArrayList<>(listeners))dispatch.accept(()->listener.onSharedPreferenceChanged(owner[0],key));return n.equals("commit")?true:null;}return null;});}
   if(name.equals("registerOnSharedPreferenceChangeListener")){listeners.add((SharedPreferences.OnSharedPreferenceChangeListener)a[0]);return null;}if(name.equals("unregisterOnSharedPreferenceChangeListener")){listeners.remove(a[0]);return null;}
   if(name.equals("contains"))return values.containsKey((String)a[0]);if(name.equals("getAll"))return new HashMap<>(values);if(name.startsWith("get"))return values.getOrDefault((String)a[0],a[1]);return null;
  });return owner[0];
 }
 static String get(String address)throws Exception{
  URL url=new URL(address);try(Socket socket=new Socket("127.0.0.1",url.getPort())){socket.setSoTimeout(5000);socket.getOutputStream().write(("GET "+url.getPath()+" HTTP/1.1\r\nHost: 127.0.0.1:"+url.getPort()+"\r\n\r\n").getBytes("US-ASCII"));return new String(socket.getInputStream().readAllBytes(),"windows-31j");}
 }
 public static void main(String[] args)throws Exception{
  SharedPreferences prefs=memory();SiteBoardGateway.Transport transport=new SiteBoardGateway.Transport(){public SiteBoardGateway.Response get(String u){fetches++;throw new AssertionError("settings request must not fetch upstream");}public SiteBoardGateway.Response post(SitePostProtocol.Plan p,String u){throw new AssertionError("no public posts");}};
  SiteBoardGateway gateway=new SiteBoardGateway(prefs,transport);
  try{
   ok(!gateway.enabled(),"master default OFF");String a=gateway.register("https://dat.2chan.net/t/","料理"),b=gateway.register("https://bbs.animanch.com/","あにまん");
   ok(!gateway.boardEnabled(a)&&!gateway.boardEnabled(b),"new boards OFF");gateway.boardEnabled(a,true);ok(gateway.boardEnabled(a)&&!gateway.boardEnabled(b),"enabling A leaves B OFF");String url=gateway.nativeUrl(a,null);
   ok(get(url+"SETTING.TXT").contains("BBS_TITLE=料理"),"enabled board settings");ok(gateway.register("https://dat.2chan.net/t/","料理").equals(a)&&gateway.boardEnabled(a),"duplicate registration preserves setting");
   try{gateway.nativeUrl(b,null);throw new AssertionError("OFF must reject open");}catch(IOException expected){checks++;}
   String base=url.substring(0,url.indexOf("/h"));ok(get(base+"/"+b+"/SETTING.TXT").startsWith("HTTP/1.1 403"),"disabled board denies direct native request");
   gateway.boardEnabled(b,true);String second=gateway.nativeUrl(b,null);gateway.boardEnabled(a,false);ok(!gateway.boardEnabled(a)&&gateway.boardEnabled(b)&&gateway.enabled(),"OFF A leaves B serving");ok(get(url+"SETTING.TXT").startsWith("HTTP/1.1 403"),"OFF A denies old URL");ok(get(second+"SETTING.TXT").contains("BBS_TITLE=あにまん"),"B still available");
   SiteBoardGateway restored=new SiteBoardGateway(prefs,transport);ok(!restored.boardEnabled(a)&&restored.boardEnabled(b),"individual states persist");restored.prefs.unregisterOnSharedPreferenceChangeListener((SharedPreferences.OnSharedPreferenceChangeListener)get(restored,"nativeFlags"));
   gateway.boardEnabled(b,false);ok(!gateway.enabled(),"last board OFF stops listener");gateway.boardEnabled(a,true);ok(gateway.boardEnabled(a)&&!gateway.boardEnabled(b),"restart only selected board");
   gateway.enabled(false);prefs.edit().putBoolean("boardEnabled:"+b,true).putBoolean(SiteBoardGateway.nativeFlag(b),true).putBoolean(SiteBoardGateway.siteFlag("animanch"),true).commit();ok(gateway.boardEnabled(b)&&!gateway.boardEnabled(a),"standard native toggle enables only B and starts listener");ok(get(second+"SETTING.TXT").contains("BBS_TITLE=あにまん"),"native activation serves board");prefs.edit().putBoolean(SiteBoardGateway.siteFlag("animanch"),false).commit();ok(!gateway.enabled(),"native last OFF stops listener");
   SharedPreferences legacy=memory();legacy.edit().putString("boards",prefs.getString("boards","[]")).putBoolean("enabled",true).commit();SiteBoardGateway old=new SiteBoardGateway(legacy,transport);ok(old.boardEnabled(a)&&old.boardEnabled(b),"old enabled registrations retain use without native flag keys");old.stop();
   List<Runnable> pending=new ArrayList<>();SharedPreferences delayed=memory(pending::add);SiteBoardGateway async=new SiteBoardGateway(delayed,transport);String extra=async.register("https://dat.2chan.net/t/","遅延登録");while(!pending.isEmpty())pending.remove(0).run();ok(!async.enabled()&&!async.boardEnabled(extra),"background registration callbacks cannot activate site");delayed.edit().putBoolean(SiteBoardGateway.siteFlag("futaba"),true).commit();while(!pending.isEmpty())pending.remove(0).run();ok(async.boardEnabled(extra),"delayed visible site switch activates gateway");delayed.edit().putBoolean(SiteBoardGateway.siteFlag("futaba"),false).commit();while(!pending.isEmpty())pending.remove(0).run();ok(!async.enabled(),"delayed last site switch stops gateway");async.stop();
   ok(fetches==0,"no upstream GET/POST");System.out.println("PASS "+checks+" per-board state/persistence/loopback checks; public requests=0");
  }finally{gateway.stop();}
 }
 static Object get(Object o,String name)throws Exception{var field=o.getClass().getDeclaredField(name);field.setAccessible(true);return field.get(o);}
}
