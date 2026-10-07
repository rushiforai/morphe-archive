#!/usr/bin/env python3
"""Verify feed ownership, stable ordering, scroll sync and closed-session isolation.

Small native API fixtures supplement runtime tests in the authenticated emulator.
"""
from pathlib import Path
import subprocess
import tempfile

repo = Path(__file__).resolve().parents[1]
fixtures = {
 'android/content/Context.java': 'package android.content; public class Context {}',
 'android/app/Activity.java': '''package android.app; public class Activity extends android.content.Context {
 public android.content.Intent intent = new android.content.Intent();
 public boolean isChangingConfigurations() { return false; }
 public android.content.Intent getIntent() { return intent; }
 public void startActivity(android.content.Intent value) { intent=value; }
 }''',
 'android/content/Intent.java': '''package android.content; public class Intent {
 public android.os.Parcelable value; public Intent() {} public Intent(Context context, Class<?> type) {}
 public Intent putExtra(String key, android.os.Parcelable value) { this.value=value; return this; }
 public android.os.Parcelable getParcelableExtra(String key) { return value; }
 }''',
 'android/os/Parcelable.java': 'package android.os; public interface Parcelable {}',
 'android/os/Bundle.java': 'package android.os; public class Bundle { public String getString(String key) { return null; } }',
 'android/os/Looper.java': 'package android.os; public class Looper { public static Looper getMainLooper() { return new Looper(); } }',
 'android/os/Handler.java': '''package android.os; public class Handler {
 public static final java.util.List<Runnable> tasks=new java.util.ArrayList<>();
 public Handler(Looper looper) {} public boolean post(Runnable task) { tasks.add(task); return true; }
 public boolean postDelayed(Runnable task,long delay) { tasks.add(task); return true; }
 public static void drain() { while (!tasks.isEmpty()) tasks.remove(0).run(); }
 }''',
 'android/os/SystemClock.java': 'package android.os; public class SystemClock { public static long uptimeMillis() { return 1000; } }',
 'android/widget/Toast.java': '''package android.widget; public class Toast {
 public static final int LENGTH_SHORT=0,LENGTH_LONG=1;
 public static Toast makeText(android.content.Context context,CharSequence text,int length) { return new Toast(); }
 public void show() {}
 }''',
 'android/util/Log.java': '''package android.util; public class Log {
 public static int i(String tag,String text) { return 0; }
 public static int w(String tag,String text,Throwable error) { throw new AssertionError(text,error); }
 public static int e(String tag,String text,Throwable error) { throw new AssertionError(text,error); }
 }''',
 'yn1/a.java': 'package yn1; public class a {}',
 'com/reddit/feeds/ui/events/OnScrollToId.java': '''package com.reddit.feeds.ui.events;
 public class OnScrollToId extends yn1.a { public final String a; public OnScrollToId(String key) { a=key; } }''',
 'com/reddit/domain/model/Link.java': '''package com.reddit.domain.model; public class Link {
 public String kindWithId; public boolean supported=true,promoted=false;
 public Link(String id) { kindWithId=id; }
 public String getId() { return kindWithId.substring(3); }
 public String getUniqueId() { return kindWithId; }
 public boolean getPromoted() { return promoted; } public boolean isBlankAd() { return false; }
 }''',
 'com/reddit/domain/model/listing/PostTypesKt.java': '''package com.reddit.domain.model.listing;
 public class PostTypesKt {
 public static boolean isImageLinkType(com.reddit.domain.model.Link link) { return link.supported; }
 public static boolean isValidFBPVideo(com.reddit.domain.model.Link link) { return false; }
 public static boolean isGalleryPost(com.reddit.domain.model.Link link) { return false; }
 }''',
 'com/reddit/domain/model/listing/Listing.java': '''package com.reddit.domain.model.listing;
 public class Listing { public java.util.List<?> children; public String after;
 public Listing(java.util.List<?> children,String after,String before,String dist,String modhash,boolean partial,java.util.List<?> metadata) {
 this.children=children; this.after=after;
 } }''',
 'TestVertical.java': r'''import local.reddit.extension.VerticalHomeFeed;
import android.app.Activity; import android.os.Handler; import java.util.*; import java.lang.reflect.*;
import com.reddit.domain.model.Link;
public class TestVertical {
 static int tests;
 static void check(boolean value,String label) { if(!value) throw new AssertionError(label); tests++; }
 static Object call(String name,Class<?>[] types,Object... values)throws Exception {
  Method method=VerticalHomeFeed.class.getDeclaredMethod(name,types);method.setAccessible(true);return method.invoke(null,values);
 }
 static Map sessions()throws Exception { Field field=VerticalHomeFeed.class.getDeclaredField("SESSIONS");field.setAccessible(true);return (Map)field.get(null); }
 static Object session(Model model,List<Link> posts)throws Exception {
  Class<?> cls=Class.forName("local.reddit.extension.VerticalHomeFeed$Session");
  Constructor<?> ctor=cls.getDeclaredConstructors()[0];ctor.setAccessible(true);
  Object s=ctor.newInstance(model,model.x,posts,0);
  Field token=cls.getDeclaredField("token");token.setAccessible(true);sessions().put(token.get(s),s);return s;
 }
 static String token(Object s)throws Exception {Field f=s.getClass().getDeclaredField("token");f.setAccessible(true);return (String)f.get(s);}
 public static class Flow { public Object value; public Flow(Object value){this.value=value;} public Object getValue(){return value;} }
 public static class Section {String key;Section(String key){this.key=key;}public String a(){return key;} }
 public static class FeedState {public List<Section> b=new ArrayList<>();public Object c=new Object();}
 public static class Pager { public FeedState state=new FeedState();int loads,lastVisible=-1;public void h(int index){lastVisible=index;}public Flow getState(){return new Flow(state);}public void a(){loads++;} }
 public static class Screen {public Activity activity;public Object parent;Screen(Activity activity){this.activity=activity;}public Activity H3(){return activity;}public Object X4(){return parent;}}
 public static class Model {public Screen U; public Pager x=new Pager();public Flow n0=new Flow("ON_SCREEN");int scrolls;String key;Model(Activity a){U=new Screen(a);}public void a0(yn1.a event){scrolls++;key=((com.reddit.feeds.ui.events.OnScrollToId)event).a;} }
 public static class Rendered {public List<Section> a;Rendered(List<Section> a){this.a=a;} }
 public static class ScrollOwner {public Object a;ScrollOwner(Object a){this.a=a;} }
 public static class ScrollEvent {public Integer a,b;ScrollEvent(int a){this(a,a);}ScrollEvent(int a,int b){this.a=a;this.b=b;} }
 public static class Direct {Model model;Direct(Model m){model=m;}public Object F1(){return model;} }
 public static class Home {Object child;Home(Object s){child=s;}public Object O5(){return child;} }
 public static class Data {public String a;Data(String a){this.a=a;} }
 public static class Params {public Data d;Params(String token){d=new Data(token);} }
 public static class Source {public Params g;Source(String token){g=new Params(token);} }
 public static class ProviderParams {public String B;ProviderParams(String token){B=token;} }
 public static class Provider {public ProviderParams a;Provider(String token){a=new ProviderParams(token);} }
 public static class InputParams implements android.os.Parcelable {public Data data;InputParams(String token){data=new Data(token);}public Object h(){return data;} }
 public static void main(String[] args)throws Exception {
  Activity activity=new Activity(),otherActivity=new Activity(); Model home=new Model(activity),profile=new Model(activity),foreign=new Model(otherActivity);
  Object profileRoot=new Object();profile.U.parent=profileRoot;
  VerticalHomeFeed.rememberFeed(home);VerticalHomeFeed.rememberFeed(profile);VerticalHomeFeed.rememberFeed(foreign);
  check(call("visibleFeed",new Class[]{Activity.class,Object.class},activity,profileRoot)==profile,"profile owns its pager even while Home visibility is stale");
  check(call("visibleFeed",new Class[]{Activity.class,Object.class},activity,new Home(new Direct(home)))==home,"Home resolves selected child");
  profile.n0.value="OFF_SCREEN";
  check(call("visibleFeed",new Class[]{Activity.class,Object.class},activity,profileRoot)==null,"foreign activity and hidden feed cannot be selected");
  List<Link> links=new ArrayList<>();for(String id:new String[]{"t3_a","t3_b","t3_c"})links.add(new Link(id));
  Link text=new Link("t3_text");text.supported=false;Link ad=new Link("t3_ad");ad.promoted=true;
  List<Link> all=Arrays.asList(links.get(0),text,links.get(1),ad,new Link("t3_a"),links.get(2));
  for(Link link:all){VerticalHomeFeed.rememberLink(link);profile.x.state.b.add(new Section("feed_post_section_"+link.kindWithId));}
  List posts=(List)call("feedPosts",new Class[]{Object.class},profile.x);
  check(posts.size()==3&&((Link)posts.get(1)).kindWithId.equals("t3_b"),"media keeps feed order and excludes text ads duplicates");
  List<Section> displayed=List.of(new Section("feed_post_section_t3_a"),new Section("feed_post_section_t3_c"));
  VerticalHomeFeed.rememberRendered(profile,new Rendered(displayed));
  VerticalHomeFeed.rememberPosition(new ScrollOwner(profile.x),new ScrollEvent(1));
  check(call("focusedPost",new Class[]{Object.class,List.class},profile.x,posts)==links.get(2),"focus follows displayed rows after filters change indices");
  VerticalHomeFeed.rememberPosition(new ScrollOwner(profile.x),new ScrollEvent(0,1));
  check(call("focusedPost",new Class[]{Object.class,List.class},profile.x,posts)==links.get(2),"sticky header cannot replace selected visible media with previous row");
  VerticalHomeFeed.rememberPosition(new ScrollOwner(profile.x),new ScrollEvent(0,0));
  check(((Link)call("focusedPost",new Class[]{Object.class,List.class},profile.x,posts)).kindWithId.equals("t3_a"),"scrolling selected media out of view changes focus");
  // The same post may also appear in Home. Its remembered position cannot seed a new profile.
  for(Link link:links)home.x.state.b.add(new Section("feed_post_section_"+link.kindWithId));
  VerticalHomeFeed.rememberRendered(home,new Rendered(home.x.state.b));
  VerticalHomeFeed.rememberPosition(new ScrollOwner(home.x),new ScrollEvent(2));
  Model freshProfile=new Model(activity);freshProfile.x.state.b.addAll(home.x.state.b);
  check(((Link)call("focusedPost",new Class[]{Object.class,List.class},freshProfile.x,posts)).kindWithId.equals("t3_a"),"uninitialized profile focus cannot inherit Home position even for shared posts");
  List fresh=(List)call("unseenPosts",new Class[]{List.class,List.class},Arrays.asList(new Link("t3_a"),new Link("t3_c"),new Link("t3_d")),links);
  check(fresh.size()==1&&((Link)fresh.get(0)).kindWithId.equals("t3_d"),"updated old posts cannot loop during pagination");
  Object hs=session(home,List.of(new Link("t3_home"))),ps=session(profile,links);
  com.reddit.domain.model.listing.Listing page=(com.reddit.domain.model.listing.Listing)VerticalHomeFeed.page(new Provider(token(ps)),null);
  check(page.children.size()==3&&page.children.get(0)==links.get(0),"profile snapshot isolated from Home session");
  call("syncPosition",new Class[]{ps.getClass(),String.class},ps,"t3_c");
  check(profile.key.equals("t3_c")&&profile.scrolls==1&&home.scrolls==0,"native scroll event targets only source feed");
  check(profile.x.lastVisible==1,"source cache viewport advances using rendered index while viewer is open");
  call("syncPosition",new Class[]{ps.getClass(),String.class},ps,"b");
  check(profile.key.equals("t3_b")&&profile.scrolls==2,"raw media ID resolves to full feed section ID");
  VerticalHomeFeed.loadMore(new Source(token(ps)));sessions().remove(token(ps));Handler.drain();
  check(profile.x.loads==0,"queued pagination ignored once viewer closes");
  activity.intent.value=new InputParams(token(hs));VerticalHomeFeed.closeViewer(activity);
  check(!sessions().containsKey(token(hs)),"closing viewer releases snapshot");
  System.out.println("Vertical regression checks passed: "+tests);
 }
}''',
}
with tempfile.TemporaryDirectory(prefix='reddit-vertical-test-') as d:
    root=Path(d)
    for name,source in fixtures.items():
        p=root/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(source)
    source=root/'local/reddit/extension/VerticalHomeFeed.java';source.parent.mkdir(parents=True)
    source.write_text((repo/'extensions/extension/src/main/java/local/reddit/extension/VerticalHomeFeed.java').read_text())
    library=repo/'.local-tools/morphe-desktop.jar'
    subprocess.run(['javac','-cp',str(library),'-d',str(root/'classes'),*[str(p) for p in root.rglob('*.java')]],check=True)
    subprocess.run(['java','-cp',f'{root / "classes"}:{library}','TestVertical'],check=True)
