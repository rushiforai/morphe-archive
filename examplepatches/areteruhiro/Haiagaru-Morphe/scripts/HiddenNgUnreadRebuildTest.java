package app.morphe.extension.chmate;
import android.content.Context;
import android.content.SharedPreferences;
import java.lang.reflect.*;
import java.util.*;

/** Real hook calls with synthetic thread/response data; never writes native history. */
public final class HiddenNgUnreadRebuildTest {
 public static final class Response { public int o;Response(int n){o=n;} }
 public static final class Board {
  public String e(int n){return "https://egg.5ch.io/test/read.cgi/android/1999999988/"+n;}
  public String c(int n){return e(n);}
 }
 public static final class State { public Board j=new Board(); }
 public static final class Owner { public List<Response> J=new ArrayList<>();public State E=new State(); }
 public static class Wrapped extends ArrayList<Response>{ public List<Response> mBase; }
 public static final class InheritedWrapped extends Wrapped{}
 static Object invoke(String name,Class<?>[] types,Object...args)throws Exception{
  Method m=HiddenNgUnread.class.getDeclaredMethod(name,types);m.setAccessible(true);return m.invoke(null,args);
 }
 public static String run(Context c)throws Exception{
  SharedPreferences prefs=c.getSharedPreferences("io.github.areteruhiro.chmate.haiagaru.ui-config",0);
  boolean had=prefs.contains(HiddenNgUnread.KEY),before=prefs.getBoolean(HiddenNgUnread.KEY,false);
  Field mf=HiddenNgUnread.class.getDeclaredField("MODERN"),hf=HiddenNgUnread.class.getDeclaredField("HIDDEN"),sf=HiddenNgUnread.class.getDeclaredField("SORTED");
  mf.setAccessible(true);hf.setAccessible(true);sf.setAccessible(true);
  Map modern=(Map)mf.get(null),all=(Map)hf.get(null),sorted=(Map)sf.get(null);
  Field rf=HiddenNgUnread.class.getDeclaredField("ROW_KEYS"),of=HiddenNgUnread.class.getDeclaredField("OWNERS");rf.setAccessible(true);of.setAccessible(true);
  Map rowKeys=(Map)rf.get(null),owners=(Map)of.get(null);
  String key="synthetic-rebuild/thread";
  Owner owner=new Owner();for(int i=1;i<=1000;i++)owner.J.add(new Response(i));
  String actual=(String)invoke("key",new Class[]{String.class},owner.E.j.e(1));
  modern.put(owner.J.get(0),key);int checks=0;
  Method begin=HiddenNgUnread.class.getDeclaredMethod("begin",Object.class),observe=HiddenNgUnread.class.getDeclaredMethod("observe",Object.class,Object.class,int.class),update=HiddenNgUnread.class.getDeclaredMethod("modern",Object.class,Map.class);
  begin.setAccessible(true);observe.setAccessible(true);update.setAccessible(true);
  try{
   prefs.edit().putBoolean(HiddenNgUnread.KEY,true).commit();
   Map<Integer,Integer> flags=new HashMap<>();flags.put(100,0x1000);flags.put(500,0x1000);flags.put(1000,0x1000);
   long started=System.nanoTime();
   for(int i=0;i<1000;i++)update.invoke(null,owner.J,flags);
   long modernMs=(System.nanoTime()-started)/1000000;
   if(!new HashSet<>(Arrays.asList(100,500,1000)).equals(all.get(key)))throw new AssertionError("Dense list membership");checks++;
   List<Response> sparse=Arrays.asList(owner.J.get(0),new Response(500),new Response(9000));
   Map<Integer,Integer> sparseFlags=new HashMap<>();sparseFlags.put(500,0x1000);sparseFlags.put(9000,0x1000);sparseFlags.put(777,0x1000);
   update.invoke(null,sparse,sparseFlags);
   if(!new HashSet<>(Arrays.asList(500,9000)).equals(all.get(key)))throw new AssertionError("Sparse list membership");checks++;
   update.invoke(null,new LinkedList<Response>(sparse),sparseFlags);
   if(!new HashSet<>(Arrays.asList(500,9000)).equals(all.get(key)))throw new AssertionError("Sequential list membership");checks++;
   List<Response> reordered=Arrays.asList(owner.J.get(0),new Response(9000),new Response(500));
   update.invoke(null,reordered,sparseFlags);
   if(!new HashSet<>(Arrays.asList(500,9000)).equals(all.get(key)))throw new AssertionError("Reordered list membership");checks++;
   update.invoke(null,owner.J,Collections.emptyMap());if(!((Set)all.get(key)).isEmpty())throw new AssertionError("Cleared NG");checks++;
   started=System.nanoTime();
   for(int pass=0;pass<50;pass++){begin.invoke(null,owner);for(Response r:owner.J)observe.invoke(null,owner,r,r.o%10==0?0x1000:0);}
   long legacyMs=(System.nanoTime()-started)/1000000;
   if(((Set)all.get(actual)).size()!=100)throw new AssertionError("Legacy rebuild count");checks++;
   // Remove the synthetic, nonnumeric key before checking the numeric prefilter.
   all.remove(key);
   Set<Long> candidates=(Set<Long>)invoke("candidateThreads",new Class[0]);
   if(candidates==null||!candidates.contains(1999999988L))throw new AssertionError("Active thread not indexed");checks++;
   InheritedWrapped wrapped=new InheritedWrapped();wrapped.mBase=owner.J;
   if(PopularReplies.fullList(wrapped)!=owner.J)throw new AssertionError("Inherited base list");checks++;
   wrapped.mBase=Collections.emptyList();
   if(!PopularReplies.fullList(wrapped).isEmpty())throw new AssertionError("Base field cached its old value");checks++;
   if(PopularReplies.fullList(owner.J)!=owner.J)throw new AssertionError("Plain list fallback");checks++;
   begin.invoke(null,owner);for(Response r:owner.J)observe.invoke(null,owner,r,0);
   if(!((Set)all.get(actual)).isEmpty())throw new AssertionError("Legacy NG removal");checks++;
   candidates=(Set<Long>)invoke("candidateThreads",new Class[0]);
   if(candidates!=null&&candidates.contains(1999999988L))throw new AssertionError("Removed NG retained candidate");checks++;
   // Only begin() runs while this marker is present; no HOME-row lookup is invoked.
   Object marker=new Object();
   synchronized(rowKeys){Object previous=rowKeys.put(Integer.MIN_VALUE,marker);try{
    begin.invoke(null,owner);if(rowKeys.get(Integer.MIN_VALUE)!=marker)throw new AssertionError("Rebuilding a thread discarded unrelated HOME row cache");checks++;
   }finally{if(previous==null)rowKeys.remove(Integer.MIN_VALUE);else rowKeys.put(Integer.MIN_VALUE,previous);}}
   return "PASS "+checks+" rebuild checks; modern1000Ms="+modernMs+" legacy50x1000Ms="+legacyMs;
  }finally{
   modern.remove(owner.J.get(0));owners.remove(owner);synchronized(all){all.remove(key);sorted.remove(key);all.remove(actual);sorted.remove(actual);}
   SharedPreferences.Editor edit=prefs.edit();if(had)edit.putBoolean(HiddenNgUnread.KEY,before);else edit.remove(HiddenNgUnread.KEY);edit.commit();
  }
 }
}
