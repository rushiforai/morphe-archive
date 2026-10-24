package app.morphe.extension.chmate;
import android.content.Context;
import android.content.SharedPreferences;
import java.lang.reflect.*;
import java.util.*;

/** Native row, synthetic values only: no native history/read-position writes. */
public final class HiddenNgUnreadNativeRowTest {
 public static String run(Context context)throws Exception{
  if(!context.getPackageName().matches(".*\\.haiagaru\\.(settingsfix191|resumefix226|resumefix242)"))throw new AssertionError("Test package only");
  String version=context.getPackageManager().getPackageInfo(context.getPackageName(),0).versionName;
  boolean old=version.contains("191"),middle=version.contains("226");
  Class<?> rowType=Class.forName(old?"o.onAdDisplayed$setIcon":middle?"o.Yy2$open":"o.getAvailabilityStatus$r8lambdawJ5MHcSJed_CjC7r4OWD0UxyJsQ");
  Object row=DroppedThreadsAndroidTest.row(rowType,DroppedThreadsAndroidTest.board(context),1792155688L,0,old);
  Field total=DroppedThreadsAndroidTest.field(row,old?"k":middle?"m":"o"),read=DroppedThreadsAndroidTest.field(row,old?"l":middle?"i":"g");
  total.setInt(row,23);read.setInt(row,20);
  String url=(String)DroppedThreadsAndroidTest.call(context,"DroppedThreadStatus","rowUrl",new Class<?>[]{Object.class,Context.class},row,context);
  String key=(String)DroppedThreadsAndroidTest.call(context,"HiddenNgUnread","key",new Class<?>[]{String.class},url);
  if(key==null)throw new AssertionError("Native row URL not available");
  Class<?> hook=Class.forName("app.morphe.extension.chmate.HiddenNgUnread");Field f=hook.getDeclaredField("HIDDEN");f.setAccessible(true);
  Map map=(Map)f.get(null);Object previous;boolean existed;
  Method invalidate=hook.getDeclaredMethod("invalidate",String.class);invalidate.setAccessible(true);
  synchronized(map){existed=map.containsKey(key);previous=map.get(key);map.put(key,new HashSet<>(Arrays.asList(1,21,22,23)));invalidate.invoke(null,key);}
  SharedPreferences p=context.getSharedPreferences("io.github.areteruhiro.chmate.haiagaru.ui-config",0);String option="excludeHiddenNgUnread";boolean had=p.contains(option),before=p.getBoolean(option,false);
  int checks=0;long repeatMillis=-1;
  try{
   p.edit().putBoolean(option,true).commit();
   int adjusted=(Integer)DroppedThreadsAndroidTest.call(context,"HiddenNgUnread","total",new Class<?>[]{Object.class,int.class},row,20);
   if(adjusted!=20)throw new AssertionError("NG-only unread remains: "+adjusted);checks++;
   if((Integer)DroppedThreadsAndroidTest.call(context,"HiddenNgUnread","totalFromStoredRead",new Class<?>[]{Object.class},row)!=20)throw new AssertionError("Stored-read boundary");checks++;
   if((Integer)DroppedThreadsAndroidTest.call(context,"HiddenNgUnread","total",new Class<?>[]{Object.class,int.class},row,22)!=22)throw new AssertionError("Read override");checks++;
   long started=System.nanoTime();
   for(int i=0;i<1000;i++)if((Integer)DroppedThreadsAndroidTest.call(context,"HiddenNgUnread","total",new Class<?>[]{Object.class,int.class},row,20)!=20)throw new AssertionError("Repeated count");
   repeatMillis=(System.nanoTime()-started)/1000000;
   checks++;
   // Native HOME rows can be reused. A cached thread key must not leak into
   // a different thread, even if read/total and the board stay unchanged.
   Field thread=DroppedThreadsAndroidTest.field(row,old?"h":middle?"g":"b");long originalThread=thread.getLong(row);
   try{thread.setLong(row,1999999999L);
    if((Integer)DroppedThreadsAndroidTest.call(context,"HiddenNgUnread","total",new Class<?>[]{Object.class,int.class},row,20)!=23)throw new AssertionError("Reused row kept previous thread key");checks++;
    Field keysField=hook.getDeclaredField("ROW_KEYS");keysField.setAccessible(true);Map keys=(Map)keysField.get(null);
    Object cached=keys.get(System.identityHashCode(row));started=System.nanoTime();
    for(int i=0;i<1000;i++){thread.setLong(row,1999999000L+i);
     if((Integer)DroppedThreadsAndroidTest.call(context,"HiddenNgUnread","total",new Class<?>[]{Object.class,int.class},row,20)!=23)throw new AssertionError("Unrelated row changed");}
    long unrelatedMs=(System.nanoTime()-started)/1000000;
    if(keys.get(System.identityHashCode(row))!=cached)throw new AssertionError("Unrelated rows regenerated URL keys");checks++;
    System.out.println("UNREAD_UNRELATED_1000_MS="+unrelatedMs);
   }finally{thread.setLong(row,originalThread);}
   p.edit().putBoolean(option,false).commit();
   if((Integer)DroppedThreadsAndroidTest.call(context,"HiddenNgUnread","total",new Class<?>[]{Object.class,int.class},row,20)!=23)throw new AssertionError("OFF native value");checks++;
   if(total.getInt(row)!=23||read.getInt(row)!=20)throw new AssertionError("Native fields changed");checks++;
  }finally{
   synchronized(map){if(existed)map.put(key,previous);else map.remove(key);invalidate.invoke(null,key);}
   SharedPreferences.Editor e=p.edit();if(had)e.putBoolean(option,before);else e.remove(option);e.commit();
  }
  return "PASS "+checks+" native-row unread ON/OFF checks; native read/total unchanged; repeated1000Ms="+repeatMillis;
 }
}
