package app.morphe.extension.chmate;

import android.content.Context;
import java.lang.reflect.*;
import java.util.*;

/** Synthetic native rows only. No history DB changes or network needed. */
public final class HistoryDropRegression {
    public static String run(Context context)throws Exception {
        String version=context.getPackageManager().getPackageInfo(context.getPackageName(),0).versionName;
        boolean v191=version.contains("191"),v226=version.contains("226");int historyMode=v191||v226?100:103;
        Class<?> type=Class.forName(v191?"o.onAdDisplayed$setIcon":v226?"o.Yy2$open":"o.getAvailabilityStatus$r8lambdawJ5MHcSJed_CjC7r4OWD0UxyJsQ",true,context.getClassLoader());
        Object board=DroppedThreadsAndroidTest.board(context);
        Object dropped=DroppedThreadsAndroidTest.row(type,board,1999000123L,1,v191);
        Object stale=DroppedThreadsAndroidTest.row(type,board,1999000123L,0,v191);
        Object broken=DroppedThreadsAndroidTest.row(type,board,1999000124L,0,v191);
        DroppedThreadsAndroidTest.field(broken,v191?"g":v226?"b":"e").set(broken,null);
        Class<?> filter=Class.forName("app.morphe.extension.chmate.HiddenDroppedThreads",true,context.getClassLoader());
        Field cache=filter.getDeclaredField("nativeStatus");cache.setAccessible(true);
        Map map=(Map)cache.get(null);Map saved;
        synchronized(map){saved=new LinkedHashMap(map);}
        try {
            List<?> out=(List<?>)DroppedThreadsAndroidTest.call(context,"HiddenDroppedThreads","filter",new Class<?>[]{List.class,int.class,boolean.class},Arrays.asList(dropped,broken),historyMode,true);
            if(out.contains(dropped)||!out.contains(broken))throw new AssertionError("One bad URL cancels filtering of other history rows");
            out=(List<?>)DroppedThreadsAndroidTest.call(context,"HiddenDroppedThreads","filter",new Class<?>[]{List.class,int.class,boolean.class},Arrays.asList(dropped,stale),historyMode,true);
            if(!out.isEmpty())throw new AssertionError("Stale zero-flag history copy erases positive native DAT status");
            List<Object> source=Arrays.asList(stale);
            out=(List<?>)DroppedThreadsAndroidTest.call(context,"HiddenDroppedThreads","filter",new Class<?>[]{List.class,int.class,boolean.class},source,historyMode,true);
            if(!out.isEmpty())throw new AssertionError("Positive native evidence is lost across history refresh");
            if(DroppedThreadsAndroidTest.call(context,"HiddenDroppedThreads","filter",new Class<?>[]{List.class,int.class,boolean.class},source,historyMode,false)!=source)throw new AssertionError("OFF does not restore source");
            if(DroppedThreadsAndroidTest.field(stale,v191?"o":"l").getInt(stale)!=0)throw new AssertionError("Native flags changed");
            Object edgeBoard=DroppedThreadsAndroidTest.board(context,"https://bbs.eddibb.cc/test/read.cgi/liveedge/1792587764/");
            Object edgeDrop=DroppedThreadsAndroidTest.row(type,edgeBoard,1792587764L,1,v191);
            Object edgeLive=DroppedThreadsAndroidTest.row(type,edgeBoard,1999000111L,0,v191);
            List<?> edge=Arrays.asList(edgeDrop,edgeLive);
            out=(List<?>)DroppedThreadsAndroidTest.call(context,"HiddenDroppedThreads","filter",new Class<?>[]{List.class,int.class,boolean.class},edge,historyMode,true);
            if(out.size()!=1||out.get(0)!=edgeLive)throw new AssertionError("Edge native DAT rows not hidden in HOME history");
            if(DroppedThreadsAndroidTest.call(context,"HiddenDroppedThreads","filter",new Class<?>[]{List.class,int.class,boolean.class},edge,historyMode,false)!=edge)throw new AssertionError("Edge OFF does not restore source");
            if(DroppedThreadsAndroidTest.field(edgeDrop,v191?"o":"l").getInt(edgeDrop)!=1||edge.size()!=2)throw new AssertionError("Edge source/flags modified");
            Object phpBoard=DroppedThreadsAndroidTest.board(context,"https://nova.5ch.io/test/read.cgi/livegalileo/1792582332/");
            Object footballBoard=DroppedThreadsAndroidTest.board(context,"https://nova.5ch.io/test/read.cgi/livegalileo/1792634530/");
            Object php=DroppedThreadsAndroidTest.row(type,phpBoard,1792582332L,1,v191);
            Object football=DroppedThreadsAndroidTest.row(type,footballBoard,1792634530L,1,v191);
            List<Object> reported=Arrays.asList(php,football);
            out=(List<?>)DroppedThreadsAndroidTest.call(context,"HiddenDroppedThreads","filter",new Class<?>[]{List.class,int.class,boolean.class},reported,historyMode,true);
            if(!out.isEmpty())throw new AssertionError("Reported 5ch DAT-drop history entries remain visible");
            if(DroppedThreadsAndroidTest.call(context,"HiddenDroppedThreads","filter",new Class<?>[]{List.class,int.class,boolean.class},reported,historyMode,false)!=reported)throw new AssertionError("Reported threads are not restored with setting OFF");
            if(reported.size()!=2||DroppedThreadsAndroidTest.field(php,v191?"o":"l").getInt(php)!=1||DroppedThreadsAndroidTest.field(football,v191?"o":"l").getInt(football)!=1)throw new AssertionError("Reported native entries/flags modified");
            return "PASS "+version+" 11 history regression checks including Edge and both reported threads";
        } finally { synchronized(map){map.clear();map.putAll(saved);} }
    }
}
