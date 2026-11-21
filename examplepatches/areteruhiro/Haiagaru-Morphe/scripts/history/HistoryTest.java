package app.morphe.extension.chmate;

import android.content.Context;
import java.lang.reflect.*;
import java.util.*;

/** Synthetic records only: no database updates or real browsing-history deletion. */
public final class HistoryTest {
    static int checks;
    static void check(boolean value, String label) { if (!value) throw new AssertionError(label); checks++; }
    static Field field(Object o,String n)throws Exception { Field f=o.getClass().getDeclaredField(n); f.setAccessible(true); return f; }
    static Object row(Class<?> type, Object board, String title, long visited)throws Exception {
        for(Constructor<?> c:type.getDeclaredConstructors()) {
            Class<?>[] types=c.getParameterTypes();
            if(types.length<12 || types[0]!=long.class || types[1]!=String.class || types[types.length-1].getName().startsWith("o.zz"))continue;
            Object[] values=new Object[types.length];
            for(int i=0;i<types.length;i++) {
                if(types[i]==long.class)values[i]=Long.valueOf(i==7?visited:1);
                else if(types[i]==int.class)values[i]=Integer.valueOf(0);
                else if(types[i]==byte.class)values[i]=Byte.valueOf((byte)0);
                else if(types[i]==boolean.class)values[i]=Boolean.FALSE;
            }
            values[1]=title;values[2]=board;c.setAccessible(true);return c.newInstance(values);
        }
        throw new AssertionError("Native row constructor missing");
    }
    static void threadId(Object row,long id)throws Exception { field(row,"h").setLong(row,id); }
    static boolean containsKey(List<?> rows,String key){for(Object row:rows)if(key.equals(HomeThreadOrder.key(row)))return true;return false;}
    static Object board(Class<?> type,String value)throws Exception {
        for(Method m:type.getDeclaredMethods()) {
            if(Modifier.isStatic(m.getModifiers()) && m.getReturnType()==type && Arrays.equals(m.getParameterTypes(),new Class<?>[]{String.class})) {
                m.setAccessible(true);return m.invoke(null,value);
            }
        }
        try {
            Constructor<?> one=type.getDeclaredConstructor(String.class);one.setAccessible(true);return one.newInstance(value);
        } catch(NoSuchMethodException ignored) { }
        int slash=value.indexOf('/');
        return type.getConstructor(String.class,String.class,String.class,String.class)
                .newInstance(value.substring(0,slash),value.substring(slash+1),value,value);
    }
    public static String run(Context context)throws Exception {
        checks=0;
        String version=context.getPackageManager().getPackageInfo(context.getPackageName(),0).versionName;
        boolean v191=version.contains("191"),v226=version.contains("226");
        String rowType=v191?"o.onAdDisplayed$setIcon":v226?"o.Yy2$open":"o.getAvailabilityStatus$r8lambdawJ5MHcSJed_CjC7r4OWD0UxyJsQ";
        ClassLoader loader=context.getClassLoader();
        Class<?> boardType=Class.forName(v191?"jp.syoboi.a2chMate.client.BBSUrlInfo$BoardID":"jp.syoboi.a2chMate.client.BoardID",true,loader);
        Class<?> type=Class.forName(rowType,true,loader);
        Object a=board(boardType,"egg.5ch.io/android"),b=board(boardType,"greta.5ch.io/poverty"),other=board(boardType,"other.example/android");
        check(!a.toString().equals(other.toString()),"Native BoardID keeps hosts");
        long now=System.currentTimeMillis();
        Object a1=row(type,a,"a-new",now),a2=row(type,a,"a-old",now-5000),b1=row(type,b,"b-new",now-1000),c1=row(type,other,"other",now-2000);
        Object old=row(type,b,"old",now-8L*86400000),never=row(type,a,"never",0);
        List<Object> source=Arrays.asList(a2,b1,c1,a1,old,never);
        android.content.SharedPreferences prefs=context.getSharedPreferences("io.github.areteruhiro.chmate.haiagaru.ui-config",0);
        Map<String,?> before=prefs.getAll();
        try {
            prefs.edit().putBoolean("groupBrowsingHistoryByBoard",true).putInt("browsingHistoryDays",2).commit();
            BrowsingHistory.initialize(context);
            List<?> result=BrowsingHistory.transform(source,103);
            check(result.equals(Arrays.asList(a1,a2,b1,c1)),"Native row fields: recency grouping, date filtering");
            check(source.size()==6 && source.get(0)==a2,"Native input untouched");
            int historyMode=(v191||v226)?100:103;
            if(v191||v226)check(BrowsingHistory.transform(source,102).equals(source),"Non-history thread screen content unchanged");
            else check(BrowsingHistory.transform(source,100).equals(source),"All/favorite screen content unchanged");
            check(BrowsingHistory.transform(source,101).equals(source),"Unread screen unchanged");
            check(BrowsingHistory.transform(source,-101).equals(source),"Reverse unread screen unchanged");
            check(BrowsingHistory.transform(source,102).equals(source),"Thread screen unchanged");
            check(BrowsingHistory.transform(source,104).equals(source),"Posting history unchanged");
            check(BrowsingHistory.transform(source,107).equals(source),"Board screen unchanged");
            long archivedId=8_765_432_103L;
            String archiveIdField=v191?"h":v226?"g":"b";
            String archiveKey=a+"\n"+archivedId;
            Object archived=row(type,a,"archived",now-1000);
            Object sameIdOnOtherBoard=row(type,b,"other board",now-1000);
            field(archived,archiveIdField).setLong(archived,archivedId);
            field(sameIdOnOtherBoard,archiveIdField).setLong(sameIdOnOtherBoard,archivedId);
            List<Object> archiveSource=Arrays.asList(archived,sameIdOnOtherBoard);
            List<?> homeThreads=BrowsingHistory.transform(archiveSource,102);
            BrowsingHistory.markArchived(a.toString(),archivedId);
            BrowsingHistory.refreshVisible(null);
            check(homeThreads.equals(List.of(sameIdOnOtherBoard)),"Successful archive removes only its thread from visible HOME threads");
            check(BrowsingHistory.transform(archiveSource,102).equals(List.of(sameIdOnOtherBoard)),
                    "Stale HOME source cannot restore an archived thread");
            check(containsKey(BrowsingHistory.transform(archiveSource,104),archiveKey),"Archive keeps posting history");
            Object reopenedArchive=row(type,a,"reopened archived thread",System.currentTimeMillis()+10_000);
            field(reopenedArchive,archiveIdField).setLong(reopenedArchive,archivedId);
            check(containsKey(BrowsingHistory.transform(List.of(reopenedArchive),102),archiveKey),
                    "Reopened archived thread returns to HOME");
            if(v191){
                long deletedId=8_765_432_101L;
                Object deleted=row(type,a,"deleted",now),sameIdOtherBoard=row(type,b,"same id on another board",now-1000);
                threadId(deleted,deletedId);threadId(sameIdOtherBoard,deletedId);
                List<Object> cachedSource=new ArrayList<>(Arrays.asList(deleted,sameIdOtherBoard,b1));
                List<?> live=BrowsingHistory.transform(cachedSource,historyMode);
                List<?> otherScreen=BrowsingHistory.transform(cachedSource,102);
                BrowsingHistory.removeDeletedHistoryThread(a.toString(),deletedId,now);
                check(live.equals(Arrays.asList(sameIdOtherBoard,b1)),"Deleting a history entry updates its live displayed list");
                check(otherScreen.contains(deleted),"Deleting history does not remove the row from another HOME screen");
                check(BrowsingHistory.transform(cachedSource,historyMode).equals(Arrays.asList(sameIdOtherBoard,b1)),
                        "A later refresh cannot restore the deleted entry from a stale source copy");
                Object reopened=row(type,a,"reopened",now+10_000);threadId(reopened,deletedId);
                List<Object> reopenedSource=new ArrayList<>(Arrays.asList(reopened,sameIdOtherBoard,b1));
                check(BrowsingHistory.transform(reopenedSource,historyMode).contains(reopened),
                        "Reopening the thread adds its newer history entry again");
            }
            check(BrowsingHistory.transform(source,-103).equals(result),"Signed history sort");
            prefs.edit().putInt("browsingHistoryDays",0).commit();
            check(BrowsingHistory.transform(source,103).equals(Arrays.asList(a1,a2,never,b1,old,c1)),"All-period grouping retains zero-timestamp legacy rows");
            prefs.edit().putBoolean("groupBrowsingHistoryByBoard",false).commit();
            check(BrowsingHistory.transform(source,103).equals(source),"Feature off retains native content");
            prefs.edit().putBoolean("groupBrowsingHistoryByBoard",true).putInt("browsingHistoryDays",2).commit();
            if(v191 || v226) {
                String listType=v191?"o.onAdDisplayed$setBackgroundResource":"o.Yy2$CheckResult";
                Class<?> listClass=Class.forName(listType,true,loader);
                Object input=listClass.getConstructor(List.class).newInstance(source);
                String adapterType=v191?"o.r8lambdaXZREaGE4vvLAA2ZOtsKBd3knAPA":"o.bea1";
                Object adapter=Class.forName(adapterType,true,loader).getConstructor(Context.class).newInstance(context);
                field(adapter,v191?"i":"g").set(adapter,input);
                field(adapter,v191?"g":"d").set(adapter,input);
                Object fragment=Class.forName(v191?"o.r8lambdaTb_p0z6z2AqSZIga1YhmAVmiTPk":"jp.syoboi.a2chMate.fragment.HomeFragment",true,loader).getConstructor().newInstance();
                field(fragment,v191?"e":"i").set(fragment,adapter);
                if(v191){
                    long callbackId=8_765_432_102L;
                    Object callbackTarget=row(type,a,"native swipe target",now),callbackOther=row(type,b,"same ID on another board",now-1000);
                    threadId(callbackTarget,callbackId);threadId(callbackOther,callbackId);
                    Object rememberedHistoryWrapper=new Object(),rememberedOtherWrapper=new Object();
                    List<Object> rememberedHistory=new ArrayList<>(Arrays.asList(callbackTarget,callbackOther,b1));
                    List<Object> rememberedOther=new ArrayList<>(Arrays.asList(callbackTarget,callbackOther,b1));
                    HiddenDroppedThreads.remember(rememberedHistoryWrapper,rememberedHistory,historyMode);
                    HiddenDroppedThreads.remember(rememberedOtherWrapper,rememberedOther,102);
                    List<Object> staleSource=new ArrayList<>(Arrays.asList(callbackTarget,callbackOther,b1));
                    List<?> liveDisplay=BrowsingHistory.transform(staleSource,historyMode);
                    Object nativeRows=listClass.getConstructor(List.class).newInstance(new ArrayList<>(staleSource));
                    Object nativeList=listClass.getConstructor(List.class).newInstance(new ArrayList<>(staleSource));
                    Object deleteAdapter=Class.forName(adapterType,true,loader).getConstructor(Context.class).newInstance(context);
                    field(deleteAdapter,"i").set(deleteAdapter,nativeList);
                    field(deleteAdapter,"g").set(deleteAdapter,nativeList);
                    field(deleteAdapter,"j").set(deleteAdapter,nativeRows);
                    Object deleteFragment=Class.forName("o.r8lambdaTb_p0z6z2AqSZIga1YhmAVmiTPk",true,loader).getConstructor().newInstance();
                    field(deleteFragment,"e").set(deleteFragment,deleteAdapter);
                    HomeThreadOrder.selected(deleteFragment,historyMode);
                    BrowsingHistory.prepareLegacy(deleteFragment,historyMode);
                    check(deleteAdapter instanceof android.widget.BaseAdapter,"Synthetic legacy adapter matches native adapter base class");
                    check(HomeThreadOrder.mode(deleteFragment)==historyMode,"Synthetic legacy HOME mode is selected");
                    BrowsingHistory.nativeHistoryDeleteStart(deleteFragment,0,callbackId);
                    ((List<?>)nativeRows).remove(0); // Simulate ChMate completing its native swipe removal.
                    BrowsingHistory.nativeHistoryDeleteResult(deleteFragment,0,callbackId,true);
                    List<?> expectedAfterDelete=Arrays.asList(callbackOther,b1);
                    check(liveDisplay.equals(expectedAfterDelete),"Native 191 deletion immediately updates the visible history copy");
                    check(BrowsingHistory.transform(staleSource,historyMode).equals(expectedAfterDelete),
                            "Native 191 deletion stays removed from stale refresh input");
                    List<?> rememberedHistoryAfter=HiddenDroppedThreads.source(rememberedHistoryWrapper,rememberedHistory);
                    List<?> rememberedOtherAfter=HiddenDroppedThreads.source(rememberedOtherWrapper,rememberedOther);
                    check(!rememberedHistoryAfter.contains(callbackTarget)&&rememberedHistoryAfter.contains(callbackOther),
                            "Native deletion updates the remembered history source");
                    check(rememberedOtherAfter.contains(callbackTarget),"Native history deletion preserves other HOME source caches");
                    BrowsingHistory.applyLegacy(deleteFragment,historyMode);
                    List<?> adapterRows=(List<?>)field(deleteAdapter,"i").get(deleteAdapter);
                    List<?> refreshedAdapter=BrowsingHistory.transform(adapterRows,historyMode);
                    check(!containsKey(refreshedAdapter,a+"\n"+callbackId)&&containsKey(refreshedAdapter,b+"\n"+callbackId),
                            "Refreshing a native 191 adapter removes only the matching board row");
                }
                BrowsingHistory.applyLegacy(fragment,101);
                check(((List<?>)field(adapter,v191?"g":"d").get(adapter)).equals(source),"Legacy unread list and native sort retained");
                List<?> legacyHistoryResult=BrowsingHistory.transform(source,historyMode);
                BrowsingHistory.applyLegacy(fragment,historyMode);
                check(((List<?>)field(adapter,v191?"i":"g").get(adapter)).equals(legacyHistoryResult),"Legacy filter-source native subclass updated");
                check(((List<?>)field(adapter,v191?"g":"d").get(adapter)).equals(legacyHistoryResult),"Legacy display native subclass updated");
                check(((List<?>)input).size()==6,"Legacy original model retained");
            } else {
                Class<?> data=Class.forName("o.SafeParcelableClass",true,loader);
                Class<?> options=Class.forName("o.ApiApiOptionsHasAccountOptions",true,loader);
                Object opt=options.getConstructors()[0].newInstance(1f,0,false,false,false,false,false,false);
                Constructor<?> ctor=data.getConstructor(List.class,int.class,boolean.class,options,int.class,int.class);
                Object state=ctor.newInstance(source,2,false,opt,103,0);
                check(((List<?>)field(state,"a").get(state)).equals(result),"242 native AdapterData constructor connected");
                check(((Integer)field(state,"b").get(state))==103,"242 mode retained");
                for(int mode:new int[]{101,-101,102,104,105,106,107}) {
                    for(int sort=0;sort<5;sort++) {
                        List<Object> ordered=new ArrayList<>(source);
                        if((sort&1)!=0)Collections.reverse(ordered);
                        Collections.rotate(ordered,sort);
                        Object unread=ctor.newInstance(ordered,2,sort==0,opt,mode,sort);
                        List<?> nativeRows=(List<?>)field(unread,"a").get(unread);
                        check(nativeRows.size()==ordered.size()&&new HashSet<>(nativeRows).equals(new HashSet<>(ordered)),"242 non-history native rows retained: "+mode+"/"+sort);
                    }
                }
                Object favorites=ctor.newInstance(source,2,false,opt,100,0);
                List<?> favoriteRows=(List<?>)field(favorites,"a").get(favorites);
                check(favoriteRows.size()==source.size()&&new HashSet<>(favoriteRows).equals(new HashSet<>(source)),"242 other screen rows retained at native constructor");
            }
        } finally {
            android.content.SharedPreferences.Editor restore=prefs.edit();
            for(String key:new String[]{"groupBrowsingHistoryByBoard","browsingHistoryDays"}) {
                if(!before.containsKey(key))restore.remove(key);
                else if(before.get(key) instanceof Boolean)restore.putBoolean(key,(Boolean)before.get(key));
                else restore.putInt(key,(Integer)before.get(key));
            }
            restore.commit();
        }
        return "PASS "+version+" "+checks+" native history tests";
    }
}
