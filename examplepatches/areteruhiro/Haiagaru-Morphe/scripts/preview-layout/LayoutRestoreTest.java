package app.morphe.extension.chmate;

import android.content.*;
import android.os.Looper;
import android.text.SpannableStringBuilder;
import android.view.*;
import android.widget.TextView;
import java.lang.reflect.*;
import java.util.*;

/** Detached native-style measurement used by position restoration. No real requests or app preference writes. */
public final class LayoutRestoreTest {
 static int checks;
 public static final java.util.ArrayList<String> messages=new java.util.ArrayList<>();
 static void note(String message){messages.add(message);System.out.println(message);}
 static void check(boolean value,String message){if(!value)throw new AssertionError(message);checks++;note("PASS "+message);}
 static Field field(Class<?> c,String n)throws Exception{Field f=c.getDeclaredField(n);f.setAccessible(true);return f;}
 static final class Body extends TextView {
  boolean ready,shown;int writes;
  Body(Context c,boolean shown){super(c);this.shown=shown;setLayoutParams(new ViewGroup.LayoutParams(700,ViewGroup.LayoutParams.WRAP_CONTENT));setTextSize(16);setPadding(8,8,8,8);ready=true;}
  @Override public boolean isShown(){return shown;}
  @Override public void setText(CharSequence source,BufferType type){super.setText(source,type);if(ready){writes++;XPostPreview.onBound(this);}}
 }
 static Body bind(Context c,String source,boolean shown){Body v=new Body(c,shown);v.setText(new SpannableStringBuilder(source),TextView.BufferType.SPANNABLE);return v;}
 static int height(TextView v){v.forceLayout();v.measure(View.MeasureSpec.makeMeasureSpec(700,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED));v.layout(0,0,700,v.getMeasuredHeight());return v.getMeasuredHeight();}
 static Context context(Context base){
  SharedPreferences prefs=(SharedPreferences)Proxy.newProxyInstance(SharedPreferences.class.getClassLoader(),new Class<?>[]{SharedPreferences.class},(p,m,a)->{
   if(m.getName().equals("getBoolean"))return a[1];if(m.getName().equals("contains"))return false;throw new UnsupportedOperationException(m.getName());
  });
  return new ContextWrapper(base){@Override public SharedPreferences getSharedPreferences(String n,int mode){return prefs;}};
 }
 @SuppressWarnings("unchecked") static void run(Context c,boolean baseline)throws Exception{
  String source="元の本文\nhttps://x.com/fixture/status/123";
  Class<?> entryClass=Class.forName("app.morphe.extension.chmate.XPostPreview$Entry");Constructor<?> ctor=entryClass.getDeclaredConstructor();ctor.setAccessible(true);
  Object entry=ctor.newInstance();field(entryClass,"data").set(entry,new XPostPreview.Data("123","fixture","fixture","X本文\n".repeat(12),"2026-10-27"));
  field(entryClass,"expires").setLong(entry,android.os.SystemClock.elapsedRealtime()+900000);
  Map<String,Object> cache=(Map<String,Object>)field(XPostPreview.class,"CACHE").get(null);cache.put("123",entry);
  for(boolean card:new boolean[]{false,true}){
   Haiagaru.card=card;Haiagaru.collapsible=false;
   int shown=height(bind(c,source,true)),hidden=height(bind(c,source,false));
   check(shown==hidden,"fresh X preview has identical visible/detached height, card="+card);
  }
  Haiagaru.card=true;Haiagaru.collapsible=false;
  int fresh=height(bind(c,source,true));field(entryClass,"expires").setLong(entry,android.os.SystemClock.elapsedRealtime()-1);
  // New implementations bound stale retention separately from the refresh deadline.
  try{field(entryClass,"staleUntil").setLong(entry,android.os.SystemClock.elapsedRealtime()+900000);}catch(NoSuchFieldException ignored){}
  int expired=height(bind(c,source,false));note("X_EXPIRY_HEIGHT fresh="+fresh+" expired="+expired);
  check(baseline?expired<fresh:expired==fresh,baseline?"REPRODUCED X preview disappears during refresh deadline":"expired X data retains its measured layout while refreshing");
  field(entryClass,"expires").setLong(entry,android.os.SystemClock.elapsedRealtime()+900000);
  Haiagaru.collapsible=true;Body expanded=bind(c,source,true);XPostPreview.toggle(expanded,"123");
  int open=height(expanded),rebound=height(bind(c,source,false));note("X_EXPANDED_HEIGHT shown="+open+" restored="+rebound);
  check(baseline?rebound<open:rebound==open,baseline?"REPRODUCED expanded X view differs from restoration row":"expanded state has identical detached/native restoration height");
  Haiagaru.enabled=false;Haiagaru.sites=true;
  Class<?> siteEntry=Class.forName("app.morphe.extension.chmate.SiteCards$Entry");Constructor<?> siteCtor=siteEntry.getDeclaredConstructor();siteCtor.setAccessible(true);Object site=siteCtor.newInstance();
  String url="https://example.invalid/article";field(siteEntry,"data").set(site,new SiteCardMetadata.Data(url,"Fixture URL","Native card height test","","fixture"));field(siteEntry,"expiry").setLong(site,System.currentTimeMillis()+60000);
  ((Map<String,Object>)field(SiteCards.class,"CACHE").get(null)).put(url,site);
  String siteSource="URL本文\n"+url;int siteFresh=height(bind(c,siteSource,true));field(siteEntry,"expiry").setLong(site,System.currentTimeMillis()-1);
  Object siteData=field(siteEntry,"data").get(site);field(SiteCardMetadata.Data.class,"savedAt").setLong(siteData,System.currentTimeMillis()-Haiagaru.siteCardCacheDurationMillis()-1);
  int siteStale=height(bind(c,siteSource,false));note("SITE_EXPIRY_HEIGHT fresh="+siteFresh+" expired="+siteStale);
  check(baseline?siteStale<siteFresh:siteStale==siteFresh,baseline?"REPRODUCED URL card disappears during refresh deadline":"URL card measurement remains stable while refreshing");
  check(XPostPreview.originalText(expanded.getText()).equals(source),"original response text unchanged");
  if(!baseline){
   Haiagaru.sites=false;Haiagaru.enabled=true;Haiagaru.collapsible=false;
   field(entryClass,"expires").setLong(entry,android.os.SystemClock.elapsedRealtime()-1);
   field(entryClass,"staleUntil").setLong(entry,android.os.SystemClock.elapsedRealtime()+900000);
   XPostMetadata.fail=true;Method resolve=XPostPreview.class.getDeclaredMethod("resolve",String.class,entryClass);resolve.setAccessible(true);resolve.invoke(null,"123",entry);
   Body failed=bind(c,source,true);check(height(failed)==fresh,"transient metadata failure retains X preview layout");
   int writes=failed.writes;for(int i=0;i<100;i++)XPostPreview.onBound(failed);
   check(failed.writes==writes,"100 unchanged stale binds during retry delay do not rewrite the row");
   field(entryClass,"staleUntil").setLong(entry,android.os.SystemClock.elapsedRealtime()-1);
   check(height(bind(c,source,false))<fresh,"stale preview retention has a deadline");
   field(entryClass,"expires").setLong(entry,android.os.SystemClock.elapsedRealtime()+900000);
   Haiagaru.collapsible=true;XPostPreview.toggle(expanded,"123");
   check(height(bind(c,source,false))<open,"closing an expanded card updates detached measurement");
   cache.remove("123");Haiagaru.collapsible=false;
   check(height(bind(c,source,false))<fresh,"clearing metadata removes the retained preview");
   Haiagaru.enabled=false;Haiagaru.sites=true;
   field(SiteCardMetadata.Data.class,"savedAt").setLong(siteData,System.currentTimeMillis()-Haiagaru.siteCardCacheDurationMillis()-600001);
   check(height(bind(c,siteSource,false))<siteFresh,"URL card stale layout has a bounded grace period");
   ((Map<String,Object>)field(SiteCards.class,"CACHE").get(null)).clear();
   check(height(bind(c,siteSource,false))<siteFresh,"URL card cache clearing takes effect");
  }
  note("LAYOUT_RESTORE_COMPLETE "+checks);
 }
 public static void main(String[] args)throws Exception{
  if(Looper.getMainLooper()==null)Looper.prepareMainLooper();
  Class<?> thread=Class.forName("android.app.ActivityThread");Object instance=thread.getMethod("systemMain").invoke(null);
  run(context((Context)thread.getMethod("getSystemContext").invoke(instance)),args.length>0&&args[0].equals("baseline"));System.exit(0);
 }
}
