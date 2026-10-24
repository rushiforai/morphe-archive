package app.morphe.extension.chmate;
import android.content.Context;
import java.lang.reflect.*;
import java.util.*;
public class HiddenNgUnreadAndroidTest {
 static int checks;
 static void check(boolean ok,String label){if(!ok)throw new AssertionError(label);checks++;}
 static Object call(String name,Class<?>[] args,Object... values)throws Exception{Method m=HiddenNgUnread.class.getDeclaredMethod(name,args);m.setAccessible(true);return m.invoke(null,values);}
 public static String run(Context c)throws Exception{
  checks=0;
  Set<Integer> hidden=new HashSet<>(Arrays.asList(1,10,11,12,99));
  check((Integer)call("subtract",new Class[]{int.class,int.class,Set.class},12,9,hidden)==9,"three unread hidden");
  check((Integer)call("subtract",new Class[]{int.class,int.class,Set.class},12,10,hidden)==10,"only unread hidden excluded");
  check((Integer)call("subtract",new Class[]{int.class,int.class,Set.class},12,15,hidden)==12,"never increases total");
  check((Integer)call("subtract",new Class[]{int.class,int.class,Set.class},12,9,Collections.emptySet())==12,"unknown remains unread");
  Method unread=HiddenNgUnread.class.getDeclaredMethod("unreadHidden",String.class,int.class,int.class,Set.class);unread.setAccessible(true);
  Method invalidate=HiddenNgUnread.class.getDeclaredMethod("invalidate",String.class);invalidate.setAccessible(true);
  String cacheKey="synthetic-board/thread";Set<Integer> cachedRows=new HashSet<>(Arrays.asList(1,10,11,12,99));
  check((Integer)unread.invoke(null,cacheKey,9,12,cachedRows)==3,"cached count includes only hidden unread rows up to total");
  check((Integer)unread.invoke(null,cacheKey,10,12,cachedRows)==2,"cached count honors updated read position");
  cachedRows.add(13);invalidate.invoke(null,cacheKey);
  check((Integer)unread.invoke(null,cacheKey,9,13,cachedRows)==4,"membership change invalidates sorted unread cache");
  Class<?>[] text={String.class};
  check(call("key",text,"https://egg.5ch.net/test/read.cgi/android/1792102288/21").equals(call("key",text,"https://egg.5ch.io/test/read.cgi/android/1792102288/")),"domain alias and response URL");
  check(!call("key",text,"https://egg.5ch.io/test/read.cgi/android/1792102288/").equals(call("key",text,"https://egg.5ch.io/test/read.cgi/software/1792102288/")),"board isolation");
  check(call("key",text,"file:///archive/123.dat")==null,"invalid origins ignored");
  if(c.getPackageManager().getPackageInfo(c.getPackageName(),0).versionName.contains("242")){
   Class<?> response=Class.forName("o.KeJ11",true,c.getClassLoader());
   Object first=PopularModesAndroidTest.alloc(response),second=PopularModesAndroidTest.alloc(response);
   PopularModesAndroidTest.field(response,"o").setInt(first,1);PopularModesAndroidTest.field(response,"o").setInt(second,2);
   List<Object> source=Arrays.asList(first,second);Map<Integer,Integer> flags=new HashMap<>();flags.put(1,0x1000);flags.put(2,0);flags.put(999,0x1000);
   Field mf=HiddenNgUnread.class.getDeclaredField("MODERN"),hf=HiddenNgUnread.class.getDeclaredField("HIDDEN"),sf=HiddenNgUnread.class.getDeclaredField("SORTED");mf.setAccessible(true);hf.setAccessible(true);sf.setAccessible(true);
   Map modern=(Map)mf.get(null),all=(Map)hf.get(null),sorted=(Map)sf.get(null);String k="synthetic-modern/thread";modern.put(first,k);
   android.content.SharedPreferences prefs=c.getSharedPreferences("io.github.areteruhiro.chmate.haiagaru.ui-config",0);boolean had=prefs.contains(HiddenNgUnread.KEY),before=prefs.getBoolean(HiddenNgUnread.KEY,false);
   try{
    prefs.edit().putBoolean(HiddenNgUnread.KEY,true).commit();
    check(call("modern",new Class[]{Object.class,Map.class},source,flags)==flags,"modern NG map is never changed");
    Set<Integer> membership=(Set<Integer>)all.get(k);check(membership.equals(Collections.singleton(1)),"ignore flags outside the loaded source");
    unread.invoke(null,k,0,2,membership);Object cached=sorted.get(k);
    call("modern",new Class[]{Object.class,Map.class},source,flags);check(sorted.get(k)==cached,"unchanged modern NG flags preserve the sorted cache");
    call("modern",new Class[]{Object.class,Map.class},source,Collections.emptyMap());check(((Set<?>)all.get(k)).isEmpty(),"removing all hidden flags clears old membership");
    check(!sorted.containsKey(k),"changed hidden membership invalidates the sorted cache");
   }finally{modern.remove(first);synchronized(all){all.remove(k);sorted.remove(k);}android.content.SharedPreferences.Editor edit=prefs.edit();if(had)edit.putBoolean(HiddenNgUnread.KEY,before);else edit.remove(HiddenNgUnread.KEY);edit.commit();}
  }
  return "PASS "+checks+" hidden-NG unread value checks (no read-position writes)";
 }
}
