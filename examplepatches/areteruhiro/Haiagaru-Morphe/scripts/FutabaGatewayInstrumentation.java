package app.haiagaru.tests.futaba;
import android.app.Instrumentation;
import android.os.Bundle;
import android.content.*;
import java.lang.reflect.*;
import java.net.*;
import java.io.*;
import java.nio.charset.Charset;
import java.util.*;
import java.util.regex.*;

/** All site responses are fixtures; exercises native subject/DAT HTTP routing. */
public class FutabaGatewayInstrumentation extends Instrumentation {
 static int checks;
 static void check(boolean value,String label){if(!value)throw new AssertionError(label);checks++;}
 static Method method(Class<?> type,String name,Class<?>...args)throws Exception{Method m=type.getDeclaredMethod(name,args);m.setAccessible(true);return m;}
 static String get(String address)throws Exception{
  HttpURLConnection c=(HttpURLConnection)new URL(address).openConnection();
  c.setConnectTimeout(5000);c.setReadTimeout(10000);
  try{check(c.getResponseCode()==200,"route "+address);ByteArrayOutputStream bytes=new ByteArrayOutputStream();
   try(InputStream input=c.getInputStream()){byte[] data=new byte[4096];int n;while((n=input.read(data))!=-1)bytes.write(data,0,n);}
   return new String(bytes.toByteArray(),Charset.forName("windows-31j"));
  }finally{c.disconnect();}
 }
 @Override public void onCreate(Bundle b){super.onCreate(b);start();}
 @Override public void onStart(){
  Bundle out=new Bundle();Object gateway=null;SharedPreferences prefs=null;Class<?> type=null;
  try{
   Context context=getTargetContext();ClassLoader loader=context.getClassLoader();String prefix="app.morphe.extension.chmate.";
   type=loader.loadClass(prefix+"SiteBoardGateway");
   Class<?> transport=loader.loadClass(prefix+"SiteBoardGateway$Transport"),response=loader.loadClass(prefix+"SiteBoardGateway$Response");
   Constructor<?> responseConstructor=response.getDeclaredConstructor(int.class,byte[].class,String.class,String.class);responseConstructor.setAccessible(true);
   Object fake=java.lang.reflect.Proxy.newProxyInstance(loader,new Class[]{transport},(proxy,m,args)->{
    if(!m.getName().startsWith("get"))throw new AssertionError("Network POST forbidden");
    String url=(String)args[args.length-1];String html;
    if(url.contains("futapo.futakuro.com"))html="<table><tr><td class=title><a href='https://img.2chan.net/b/res/123.htm'>img fixture</a></td><td class=ikioi>999</td><td class=res>2</td></tr><tr><td class=title><a href='https://may.2chan.net/b/res/123.htm'>may fixture</a></td><td class=ikioi>888</td><td class=res>3</td></tr></table>";
    else if(url.endsWith("/res/123.htm"))html="<div class=thre data-res=123><span class=cno>No.123</span><blockquote>opening</blockquote><table><tr><td class=rtd><span class=cno>No.124</span><blockquote>https://img.2chan.net/b/src/456789.png</blockquote></td></tr></table></div>";
    else throw new AssertionError("Unexpected site request "+url);
    return responseConstructor.newInstance(200,html.getBytes("UTF-8"),"text/html; charset=UTF-8",null);
   });
   prefs=context.getSharedPreferences("haiagaru.test-futaba-gateway",0);prefs.edit().clear().commit();
   Constructor<?> ctor=type.getDeclaredConstructor(SharedPreferences.class,transport);ctor.setAccessible(true);
   gateway=ctor.newInstance(prefs,fake);
   Method register=method(type,"register",String.class,String.class),nativeUrl=method(type,"nativeUrl",String.class,String.class),registrationUrl=method(type,"registrationUrl",String.class);
   String key=(String)register.invoke(gateway,"http://die-or.work/img/b/","追加掲示板");
   String again=(String)register.invoke(gateway,"https://img.2chan.net/b/","二次元裏");
   check(key.equals(again),"official and mirror retain one key");
   Field names=type.getDeclaredField("names");names.setAccessible(true);
   check(((Map<?,?>)names.get(gateway)).get(key).equals("二次元裏 (img)"),"source board name");
   String stable=(String)registrationUrl.invoke(gateway,key);
   Class<?> menus=loader.loadClass(prefix+"SiteBoardMenuProtocol");
   List<?> choices=(List<?>)method(menus,"parse",String.class,String.class).invoke(null,"futaba","<b>ふたば</b><a href='https://img.2chan.net/b/'>二次元裏</a>");
   String menu=(String)method(type,"importCatalogue",String.class,List.class).invoke(gateway,"futaba",choices);
   check(menu.contains("勢いランキング"),"ranking included in native BBSMENU");
   String rankingKey=(String)register.invoke(gateway,"https://futapo.futakuro.com/ranking/index.html","勢いランキング");
   String rankingUrl=(String)nativeUrl.invoke(gateway,rankingKey,null);
   String subject=get(rankingUrl+"subject.txt");
   check(subject.contains("(img)")&&subject.contains("(may)"),"ranking source suffixes in native subject");
   Matcher rows=Pattern.compile("(?m)^([0-9]+)\\.dat<>").matcher(subject);
   List<String> ids=new ArrayList<>();while(rows.find())ids.add(rows.group(1));
   check(ids.size()==2&&!ids.get(0).equals(ids.get(1)),"cross-board numeric IDs cannot collide");
   String dat=get(rankingUrl+"dat/"+ids.get(0)+".dat");
   check(dat.contains("https://img.2chan.net/b/src/456789.png"),"ranked thread has second-response image");
   String copied=(String)method(type,"originalUrl",String.class).invoke(gateway,rankingUrl.replace("/"+rankingKey+"/","/test/read.cgi/"+rankingKey+"/")+ids.get(0)+"/");
   check(copied.equals("https://img.2chan.net/b/res/123.htm"),"ranked copy uses original thread");
   Class<?> idsType=loader.loadClass(prefix+"SiteThreadIds");
   String sourceId=(String)method(idsType,"source",String.class).invoke(null,ids.get(0));
   check(copied.equals(method(type,"sourceUrl",String.class,String.class).invoke(gateway,rankingKey,sourceId)),"ranked original-site action uses original ID");
   method(type,"stop").invoke(gateway);
   gateway=ctor.newInstance(prefs,fake);
   check(stable.equals(registrationUrl.invoke(gateway,key)),"registered board URL remains stable after restart");
   check(((Map<?,?>)names.get(gateway)).get(key).equals("二次元裏 (img)"),"registered name survives restart");
   check(copied.equals(method(type,"sourceUrl",String.class,String.class).invoke(gateway,rankingKey,sourceId)),"ranked source survives restart");
   out.putString("result","PASS "+checks+" Futaba gateway checks");finish(-1,out);
  }catch(Throwable error){out.putString("result",android.util.Log.getStackTraceString(error));finish(0,out);}
  finally{if(gateway!=null)try{method(type,"stop").invoke(gateway);}catch(Exception ignored){}if(prefs!=null)prefs.edit().clear().commit();}
 }
}
