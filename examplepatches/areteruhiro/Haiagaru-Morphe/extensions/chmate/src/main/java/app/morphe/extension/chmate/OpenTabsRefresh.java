package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.os.SystemClock;
import android.view.View;
import android.widget.Toast;
import java.lang.reflect.*;
import java.util.*;

/** One-shot native patrol scoped to a snapshot of the open tablet pages. */
public final class OpenTabsRefresh {
    public static final int ACTION=0x7e00000c;
    public static final String GESTURE="haiagaruGestureRefreshOpenTabs";
    private static final String SCOPE="haiagaruOpenTabsScope", DOWNLOAD="haiagaruOpenTabsDownload";
    private static final ThreadLocal<Scope> scheduling=new ThreadLocal<>();
    private static final ThreadLocal<Boolean> dispatching=new ThreadLocal<>();
    private static final Map<Object,Scope> workers=Collections.synchronizedMap(new WeakHashMap<>());
    private static final Map<Activity,Long> requested=new WeakHashMap<>();
    static final class Scope {
        final Set<String> keys;final boolean download;
        Scope(Collection<String> keys,boolean download){this.keys=Collections.unmodifiableSet(new LinkedHashSet<>(keys));this.download=download;}
    }
    static String identity(String board,long id){return board+"\n"+id;}
    private static Object field(Object owner,String name)throws Exception{return NativeFields.find(owner.getClass(),name).get(owner);}
    private static String version(Context context)throws Exception{return context.getPackageManager().getPackageInfo(context.getPackageName(),0).versionName;}
    static Object parseInfo(Context context,String address)throws Exception{
        String v=version(context);
        Class<?> type=Class.forName("jp.syoboi.a2chMate.client.BBSUrlInfo",false,context.getClassLoader());
        return type.getMethod(v.contains("191")?"b":v.contains("226")?"c":"d",String.class).invoke(null,address);
    }
    public static boolean gesture(View view){
        Context context=view.getContext();
        while(context instanceof android.content.ContextWrapper && !(context instanceof Activity)){
            Context next=((android.content.ContextWrapper)context).getBaseContext();if(next==context)break;context=next;
        }
        if(context instanceof Activity)refresh((Activity)context);
        return true;
    }
    public static void refresh(Activity activity){
        if(activity==null||activity.isFinishing()||activity.isDestroyed())return;
        try{
            if(!activity.getClass().getName().equals("jp.syoboi.a2chMate.activity.TabletHomeActivity")){
                Toast.makeText(activity,"タブレット表示で使用してください",Toast.LENGTH_SHORT).show();return;
            }
            long now=SystemClock.elapsedRealtime();Long last=requested.get(activity);
            if(last!=null&&now-last<3000){Toast.makeText(activity,"一括更新は開始済みです",Toast.LENGTH_SHORT).show();return;}
            List<?> pages=NativeToolTabs.openPages(activity);
            Snapshot snapshot=snapshot(activity,pages,false);
            Set<String> threads=snapshot.threads,boards=snapshot.boards;int boardCount=snapshot.boardCount;
            if(threads.isEmpty()&&boards.isEmpty()){Toast.makeText(activity,"更新するスレ・板のタブがありません",Toast.LENGTH_SHORT).show();return;}
            // WorkManager Data is bounded to 10 KiB. Validate both requests before enqueuing either.
            validate(new Scope(threads,true));validate(new Scope(boards,false));
            int threadCount=threads.size();
            refreshLivePages(activity,pages,threads,boards);
            // Only background thread work fetches subject.txt as well as DAT.
            for(String thread:threads)boards.remove(thread.substring(0,thread.lastIndexOf('\n')));
            if(!threads.isEmpty())enqueue(activity,new Scope(threads,true));
            if(!boards.isEmpty())enqueue(activity,new Scope(boards,false));
            requested.put(activity,now);
            Toast.makeText(activity,"開いているスレ"+threadCount+"件・板"+boardCount+"件の更新を開始しました",Toast.LENGTH_LONG).show();
        }catch(Exception error){android.util.Log.w("Haiagaru","Open-tab refresh unavailable",error);
            Toast.makeText(activity,"一括更新を開始できませんでした："+error.getMessage(),Toast.LENGTH_LONG).show();}
    }
    static final class Snapshot {
        final Set<String> threads,boards;final int boardCount;
        Snapshot(Set<String> threads,Set<String> boards,int count){this.threads=threads;this.boards=boards;this.boardCount=count;}
    }
    static Snapshot snapshot(Context context,List<?> pages)throws Exception{
        return snapshot(context,pages,true);
    }
    private static Snapshot snapshot(Context context,List<?> pages,boolean combineBoards)throws Exception{
        String v=version(context);boolean old=v.contains("191"),middle=v.contains("226");
        Set<String> threads=new LinkedHashSet<>(),boards=new LinkedHashSet<>();
        for(Object page:pages){
            int type=((Number)field(page,old?"i":middle?"o":"f")).intValue();
            if(type!=1&&type!=2)continue;
            Object fragment=field(page,old?"c":middle?"b":"d");
            Bundle args=fragment==null?null:(Bundle)fragment.getClass().getMethod("getArguments").invoke(fragment);
            if(args==null)args=(Bundle)field(page,old?"d":middle?"f":"i");
            if(args==null)throw new IllegalStateException("タブのURLを確認できません");
            if(type==1){
                Object board=args.get("bid");
                if(board!=null){boards.add(board.toString());continue;}
            }
            String address=args.getString("_data");Object info=parseInfo(context,address);
            if(info==null)throw new IllegalStateException("タブのURLを読み取れません");
            Object board=RefreshTargets.nativeBoard(info,v);String key=board.toString();
            if(type==1)boards.add(key);
            else {
                Object id=field(info,middle?"c":"e");
                if(!(id instanceof Long)||((Long)id)<=0)throw new IllegalStateException("スレ番号を確認できません");
                threads.add(identity(key,(Long)id));
            }
        }
        int boardCount=boards.size();
        if(combineBoards)for(String thread:threads)boards.remove(thread.substring(0,thread.lastIndexOf('\n')));
        return new Snapshot(threads,boards,boardCount);
    }
    /** Bound to each version's concrete native board/thread command dispatcher by the patch. */
    private static boolean nativeRefresh(Object fragment){return false;}
    /** Refresh the matched reader after its background DAT has had time to arrive. */
    static void refreshWatchedFragment(Object fragment){
        if(fragment==null||dispatching())return;
        dispatching.set(true);
        try{nativeRefresh(fragment);}
        catch(Exception error){android.util.Log.w("Haiagaru","Watched reader refresh unavailable",error);}
        finally{dispatching.remove();}
    }
    static boolean dispatching(){return Boolean.TRUE.equals(dispatching.get());}
    private static void refreshLivePages(Activity activity,List<?> pages,Set<String> threads,Set<String> boards)throws Exception{
        String v=version(activity);String fragmentField=v.contains("191")?"c":v.contains("226")?"b":"d";
        Set<Object> refreshed=Collections.newSetFromMap(new IdentityHashMap<>());
        for(Object page:pages)try{
            Object fragment=field(page,fragmentField);if(fragment==null||!refreshed.add(fragment))continue;
            if(fragment.getClass().getMethod("getActivity").invoke(fragment)!=activity)continue;
            View view=(View)fragment.getClass().getMethod("getView").invoke(fragment);
            if(view==null||!view.isAttachedToWindow())continue;
            Snapshot single=snapshot(activity,Collections.singletonList(page),false);
            if(single.threads.isEmpty()&&single.boards.isEmpty())continue;
            dispatching.set(true);
            try{
                if(nativeRefresh(fragment)){threads.removeAll(single.threads);boards.removeAll(single.boards);}
            }finally{dispatching.remove();}
        }catch(Exception error){
            // Retain this page in the background scope when its live dispatcher is unavailable.
            android.util.Log.w("Haiagaru","Live tab refresh unavailable; using background work",error);
        }
    }
    private static void validate(Scope scope){
        int size=512;for(String key:scope.keys)size+=key.getBytes(java.nio.charset.StandardCharsets.UTF_8).length+16;
        if(size>8500)throw new IllegalArgumentException("タブが多すぎます。一部を閉じてからお試しください");
    }
    private static void enqueue(Context context,Scope scope)throws Exception{
        String v=version(context);String owner=v.contains("191")?"o.mdExternalSyntheticLambda0":v.contains("226")?"o.settings":"o.TTRewardVideoActivity8";
        scheduling.set(scope);
        try{Class.forName(owner,false,context.getClassLoader()).getDeclaredMethod(scope.download?"haiagaruRefreshOpenThreads":"haiagaruRefreshOpenBoards",Context.class,boolean.class).invoke(null,context.getApplicationContext(),false);}
        finally{scheduling.remove();}
    }
    /** Commit monitored DAT through ChMate's own WorkManager worker. Never write its cache directly. */
    static void downloadWatched(Context context,Collection<String> urls){
        if(urls==null||urls.isEmpty())return;
        try{
            String v=version(context);boolean middle=v.contains("226");
            Set<String> keys=new LinkedHashSet<>();
            for(String url:urls){
                Object info=parseInfo(context,url);
                if(info==null)continue;
                Object board=RefreshTargets.nativeBoard(info,v);
                Object id=field(info,middle?"c":"e");
                if(board!=null&&id instanceof Long&&((Long)id)>0)
                    keys.add(identity(board.toString(),(Long)id));
            }
            if(keys.isEmpty())return;
            Scope scope=new Scope(keys,true);validate(scope);enqueue(context,scope);
        }catch(Exception error){android.util.Log.w("Haiagaru","Watched-thread native DAT refresh unavailable",error);}
    }
    public static void writeScope(Map<String,Object> map){
        Scope scope=scheduling.get();if(scope==null)throw new IllegalStateException("No open-tab snapshot");
        map.put(SCOPE,scope.keys.toArray(new String[0]));map.put(DOWNLOAD,scope.download);
    }
    // Bound directly to the supported native WorkManager Data class, no class scan.
    private static Map<?,?> input(Object data){return Collections.emptyMap();}
    public static void mark(Object worker,Object data){
        Map<?,?> map=input(data);Object stored=map.get(SCOPE);if(!(stored instanceof String[]))return;
        workers.put(worker,new Scope(Arrays.asList((String[])stored),Boolean.TRUE.equals(map.get(DOWNLOAD))));
    }
    public static boolean active(Object worker){return workers.containsKey(worker);}
    public static boolean download(Object worker,boolean original){Scope scope=workers.get(worker);return scope==null?original:scope.download;}
    public static boolean downloadGroup(Object worker,Object cache,List<?> rows,boolean original){return download(worker,original);}
    public static List<?> filter(Object worker,List<?> rows){
        Scope scope=workers.get(worker);if(scope==null)return rows;
        Context context=Haiagaru.applicationContextForExtension();ArrayList<Object> result=new ArrayList<>();
        if(context==null)return result;
        try{
            String v=version(context);boolean old=v.contains("191"),middle=v.contains("226");
            Set<String> remaining=new LinkedHashSet<>(scope.keys);
            for(Object row:rows){String board=(String)field(row,v.contains("242")?"b":"c");
                long id=((Number)field(row,old?"d":middle?"b":"c")).longValue();
                String key=scope.download?identity(board,id):board;
                if(remaining.remove(key))result.add(row);
            }
            Class<?> row=Class.forName("jp.syoboi.a2chMate.autocheck.AutoCheckWork$"+(middle?"write":"RemoteActionCompatParcelizer"),false,context.getClassLoader());
            Class<?>[] types={long.class,long.class,String.class,String.class,int.class,int.class,int.class,old||middle?byte.class:int.class,int.class,int.class};
            Constructor<?> ctor=row.getDeclaredConstructor(types);ctor.setAccessible(true);
            for(String key:remaining){int split=key.lastIndexOf('\n');String board=scope.download?key.substring(0,split):key;
                long id=scope.download?Long.parseLong(key.substring(split+1)):0;
                Object flag=old||middle?(Object)Byte.valueOf((byte)0):Integer.valueOf(0);
                // A missing history row still needs subject acquisition. Native decoding fills counts.
                result.add(ctor.newInstance(0L,id,board,"",0,0,0,flag,0,0));
            }
        }catch(Exception error){android.util.Log.w("Haiagaru","Open-tab native selection unavailable",error);result.clear();}
        return result;
    }
    /** Subject acquisition may add native candidates; DAT stays limited to the snapshotted threads. */
    public static List<?> downloadRows(Object worker,List<?> rows){
        Scope scope=workers.get(worker);if(scope==null||!scope.download)return rows;
        ArrayList<Object> result=new ArrayList<>();
        try{String v=version(Haiagaru.applicationContextForExtension());
            for(Object row:rows){String board=(String)field(row,v.contains("242")?"b":"c");long id=((Number)field(row,v.contains("191")?"d":v.contains("226")?"b":"c")).longValue();
                if(scope.keys.contains(identity(board,id)))result.add(row);}
        }catch(Exception error){android.util.Log.w("Haiagaru","Open-tab DAT selection unavailable",error);result.clear();}
        return result;
    }
    private OpenTabsRefresh(){}
}
