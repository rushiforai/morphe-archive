package app.haiagaru.tests.cardexclusions;
import android.app.*;import android.content.*;import android.os.*;import android.view.accessibility.AccessibilityNodeInfo;
import java.lang.reflect.*;import java.util.*;import java.util.concurrent.*;

/** Exclusion candidates and real settings dialog on an isolated package; no card downloads. */
public final class SiteCardExclusionsInstrumentation extends Instrumentation {
 int checks;Activity host;Class<?> cards,haiagaru;SharedPreferences prefs;
 void ok(boolean v,String label){if(!v)throw new AssertionError(label);checks++;}
 Method method(Class<?> c,String name,Class<?>...p)throws Exception{Method m=c.getDeclaredMethod(name,p);m.setAccessible(true);return m;}
 Field field(Class<?> c,String name)throws Exception{Field f=c.getDeclaredField(name);f.setAccessible(true);return f;}
 <T>T main(Callable<T> c)throws Exception{FutureTask<T> t=new FutureTask<>(c);runOnMainSync(t);return t.get(15,TimeUnit.SECONDS);}
 List urls(String text)throws Exception{return (List)method(cards,"urls",CharSequence.class).invoke(null,text);}
 AccessibilityNodeInfo find(AccessibilityNodeInfo n,String text,boolean edit){if(n==null)return null;if(n.isVisibleToUser()&&(edit?n.isEditable():n.getText()!=null&&text.contentEquals(n.getText())))return n;for(int i=0;i<n.getChildCount();i++){AccessibilityNodeInfo f=find(n.getChild(i),text,edit);if(f!=null)return f;}return null;}
 AccessibilityNodeInfo waitNode(String s,boolean edit)throws Exception{for(int i=0;i<40;i++){AccessibilityNodeInfo n=find(getUiAutomation().getRootInActiveWindow(),s,edit);if(n!=null)return n;Thread.sleep(100);}throw new AssertionError("Missing "+s);}
 void tap(String text)throws Exception{AccessibilityNodeInfo n=waitNode(text,false);while(n!=null&&!n.isClickable())n=n.getParent();ok(n!=null&&n.performAction(AccessibilityNodeInfo.ACTION_CLICK),"tap "+text);Thread.sleep(300);}
 void setText(String text)throws Exception{Bundle b=new Bundle();b.putCharSequence(AccessibilityNodeInfo.ACTION_ARGUMENT_SET_TEXT_CHARSEQUENCE,text);ok(waitNode("edit",true).performAction(AccessibilityNodeInfo.ACTION_SET_TEXT,b),"edit exclusion list");Thread.sleep(200);}
 void open()throws Exception{main(()->{method(haiagaru,"showSiteCardExclusions",Activity.class).invoke(null,host);return null;});waitNode("リンクカードから除外するURL",false);}
 @Override public void onCreate(Bundle b){super.onCreate(b);start();}
 @Override public void onStart(){Bundle out=new Bundle();try{test();out.putString("result","PASS "+checks+" site-card exclusion candidate/settings checks; card downloads=0");finish(Activity.RESULT_OK,out);}catch(Throwable e){out.putString("error",android.util.Log.getStackTraceString(e));finish(Activity.RESULT_CANCELED,out);}}
 void test()throws Exception{
  Context app=getTargetContext();ok(app.getPackageName().endsWith("haiagaru.reporter242"),"isolated242 only");ClassLoader loader=app.getClassLoader();cards=loader.loadClass("app.morphe.extension.chmate.SiteCards");haiagaru=loader.loadClass("app.morphe.extension.chmate.Haiagaru");prefs=app.getSharedPreferences("io.github.areteruhiro.chmate.haiagaru.ui-config",0);Map<String,?> before=prefs.getAll();String key="siteCardExcludedUrls",max="siteCardsMaxPerResponse";
  host=startActivitySync(new Intent().setClassName(app.getPackageName(),"app.morphe.extension.chmate.ToolbarIconsActivity").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));Thread.sleep(800);
  try{
   main(()->{prefs.edit().remove(key).putInt(max,2).commit();ok(urls("https://imgur.com/a/abc https://www.imgur.com/gallery/def").isEmpty(),"default excludes root/subdomain before card lookup");ok(urls("https://imgur.com/a/a https://example.org/article https://example.net/article").equals(Arrays.asList("https://example.org/article","https://example.net/article")),"excluded URL does not consume card slots");return null;});
   open();ok(waitNode("edit",true).getText().toString().equals("https://imgur.com/"),"default is editable imgur rule");setText("imgur.com\nexample.org/news/");tap("保存");
   main(()->{ok(prefs.getString(key,"").equals("https://imgur.com/\nhttps://example.org/news"),"settings saves canonical rules");ok(urls("https://example.org/news/123 https://example.org/newsroom https://example.net/other").equals(Arrays.asList("https://example.org/newsroom","https://example.net/other")),"path rule preserves unrelated pages");return null;});
   open();setText("javascript:alert(1)");tap("保存");ok(waitNode("1行目のURLを確認してください（http/https、クエリ・#なし）",false)!=null,"validation error is visible");ok(prefs.getString(key,"").contains("example.org/news"),"invalid input does not replace saved rules");tap("キャンセル");
   open();setText("");tap("保存");main(()->{ok(urls("https://imgur.com/a/abc").size()==1,"empty list restores imgur cards");return null;});
   open();tap("初期値");for(int i=0;i<40&&!waitNode("edit",true).getText().toString().equals("https://imgur.com/");i++)Thread.sleep(100);ok(waitNode("edit",true).getText().toString().equals("https://imgur.com/"),"reset fills default rule");tap("キャンセル");ok(prefs.getString(key,"missing").isEmpty(),"cancel never commits reset");
   main(()->{
    Class<?> preview=loader.loadClass("app.morphe.extension.chmate.PreviewUrls");List original=(List)method(preview,"extract",CharSequence.class,int.class).invoke(null,"https://imgur.com/a/abc https://i.imgur.com/abc.png",8);
    prefs.edit().putString(key,"https://imgur.com/").commit();ok(original.equals(method(preview,"extract",CharSequence.class,int.class).invoke(null,"https://imgur.com/a/abc https://i.imgur.com/abc.png",8)),"shared media/link extraction unchanged");
    ok(urls("https://news.yahoo.co.jp/articles/abc").size()==1,"ordinary news cards remain eligible");return null;
   });
   main(()->{
    Map cache=(Map)field(cards,"CACHE").get(null);String image="https://imgur.com/a/haiagaru-card-exclusion-fixture",news="https://example.org/haiagaru-card-exclusion-fixture";
    Object oldImage=cache.get(image),oldNews=cache.get(news);boolean enabled=prefs.getBoolean("siteCardsEnabled",false),hadEnabled=prefs.contains("siteCardsEnabled");
    try{
     Class<?> entry=loader.loadClass("app.morphe.extension.chmate.SiteCards$Entry"),data=loader.loadClass("app.morphe.extension.chmate.SiteCardMetadata$Data"),span=loader.loadClass("app.morphe.extension.chmate.SiteCardSpan");
     Constructor<?> ec=entry.getDeclaredConstructor();ec.setAccessible(true);Constructor<?> dc=data.getDeclaredConstructor(String.class,String.class,String.class,String.class,String.class);dc.setAccessible(true);
     for(String url:new String[]{image,news}){Object e=ec.newInstance();field(entry,"data").set(e,dc.newInstance(url,"fixture title","fixture description","","fixture"));cache.put(url,e);}
     android.content.res.XmlResourceParser attributes=host.getResources().getLayout(android.R.layout.simple_list_item_1);while(attributes.next()!=org.xmlpull.v1.XmlPullParser.START_TAG){}
     android.widget.TextView body=(android.widget.TextView)loader.loadClass("o.zzbhp").getConstructor(Context.class,android.util.AttributeSet.class).newInstance(new android.view.ContextThemeWrapper(host,android.R.style.Theme_Material),android.util.Xml.asAttributeSet(attributes));
     String raw=image+" "+news;Method decorate=method(cards,"decorate",CharSequence.class,android.widget.TextView.class);
     prefs.edit().putBoolean("siteCardsEnabled",true).putString(key,"").commit();CharSequence rendered=(CharSequence)decorate.invoke(null,new android.text.SpannableString(raw),body);
     ok(((android.text.Spanned)rendered).getSpans(0,rendered.length(),span).length==2,"warm cached cards render before exclusion");
     prefs.edit().putString(key,"https://imgur.com/").commit();CharSequence filtered=(CharSequence)decorate.invoke(null,rendered,body);
     ok(((android.text.Spanned)filtered).getSpans(0,filtered.length(),span).length==1,"cached imgur card disappears while ordinary card remains");
     ok(filtered.toString().startsWith(raw),"excluded cached card retains original source links");
    }finally{if(oldImage==null)cache.remove(image);else cache.put(image,oldImage);if(oldNews==null)cache.remove(news);else cache.put(news,oldNews);if(hadEnabled)prefs.edit().putBoolean("siteCardsEnabled",enabled).commit();else prefs.edit().remove("siteCardsEnabled").commit();}
    return null;
   });
  }finally{if(host!=null)main(()->{host.finish();return null;});SharedPreferences.Editor restore=prefs.edit();if(before.containsKey(key))restore.putString(key,(String)before.get(key));else restore.remove(key);if(before.containsKey(max))restore.putInt(max,((Number)before.get(max)).intValue());else restore.remove(max);restore.commit();main(()->{method(cards,"changed").invoke(null);return null;});}
 }
}
