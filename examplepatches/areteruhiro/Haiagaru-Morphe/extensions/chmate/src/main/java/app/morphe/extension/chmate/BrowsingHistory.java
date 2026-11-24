package app.morphe.extension.chmate;

import android.content.Context;
import android.content.SharedPreferences;
import android.app.Activity;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.BaseAdapter;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

/** Exact normal-home hooks; the recent-thread popup does not enter these hooks. */
public final class BrowsingHistory {
    private static volatile Context context;
    private static final String PREFS = "io.github.areteruhiro.chmate.haiagaru.ui-config";
    private static final List<Display> displays=new ArrayList<>();
    private static final List<Legacy> legacyFragments=new ArrayList<>();
    private static final Map<Object,Map<String,List<?>>> foldSources=new java.util.WeakHashMap<>();
    private static final ThreadLocal<Boolean> folding=new ThreadLocal<>();
    private static final LinkedHashMap<String,DeletedHistory> deletedHistory=new LinkedHashMap<>();
    private static final LinkedHashMap<String,DeletedHistory> archivedThreads=new LinkedHashMap<>();
    private static final ThreadLocal<HistoryDelete> HISTORY_DELETE=new ThreadLocal<>();
    private static final class HistoryDelete {
        final Object fragment;final int mode;final long id,visited;final String board;
        HistoryDelete(Object f,int m,long i,String b,long v){fragment=f;mode=m;id=i;board=b;visited=v;}
    }
    private static final class Display {
        final WeakReference<List<Object>> output;List<?> source,expanded;final int mode;
        Display(List<Object> o,List<?> s,int m){output=new WeakReference<>(o);source=s;mode=m;expanded=HomeThreadOrder.expandedForDisplay();}
    }
    private static final class DeletedHistory {
        final long visited,expiresAt;
        DeletedHistory(long v,long expiry){visited=v;expiresAt=expiry;}
    }
    private static final class Legacy {
        final WeakReference<Object> fragment;final int mode;
        Legacy(Object f,int m){fragment=new WeakReference<>(f);mode=m;}
    }
    private BrowsingHistory() { }
    static void initialize(Context value) { context = value.getApplicationContext(); }
    static boolean enabled() { return context != null && prefs().getBoolean("groupBrowsingHistoryByBoard", true); }
    static int days() { return context == null ? 2 : Math.max(0, Math.min(36500, prefs().getInt("browsingHistoryDays", 2))); }
    private static SharedPreferences prefs() { return context.getSharedPreferences(PREFS, 0); }
    private static Field field(Object owner, String name) throws Exception {
        Field value = owner.getClass().getDeclaredField(name); value.setAccessible(true); return value;
    }
    private static int trackedLegacyMode(Object fragment){
        synchronized(legacyFragments){
            for(Legacy entry:legacyFragments)if(entry.fragment.get()==fragment)return entry.mode;
        }
        return HomeThreadOrder.mode(fragment);
    }
    /** Remove a fully deleted thread from every open HOME thread list immediately. */
    public static void nativeThreadDeleted(Object nativeBoard,long threadId){
        if(context==null||nativeBoard==null||threadId<=0)return;
        final String board=nativeBoard.toString();
        if(board.isEmpty())return;
        ArchiveOrigins.consumeHomeArchive(board,threadId);
        long visited=historyVisited(board,threadId);
        // When HOME is not open, a newly loaded stale row still needs a cutoff.
        // A later reopen receives a newer native visit timestamp and is allowed back.
        if(visited<=0)visited=System.currentTimeMillis();
        final long removedVisited=visited;
        Runnable update=()->{
            // The native delete caller still holds adapter positions until it
            // returns. Mutating its source in that stack can remove the next
            // row or leave a stale selection after the final starred row.
            try{HiddenDroppedThreads.removeRememberedHistoryThread(board,threadId);}
            catch(RuntimeException error){Log.w("Haiagaru","Deleted history source update unavailable",error);}
            try{removeDeletedHistoryThread(board,threadId,removedVisited);}
            catch(RuntimeException error){Log.w("Haiagaru","Deleted history display update unavailable",error);}
            // Favorites/unread also retain display copies. The same short-lived
            // removal guard used after archiving prevents their stale source
            // from restoring a deleted row before the next native reload.
            markArchived(board,threadId);
            Activity activity=homeActivity();
            if(activity!=null)refreshVisible(activity);
            else{
                List<Legacy> tracked;synchronized(legacyFragments){tracked=new ArrayList<>(legacyFragments);}
                for(Legacy entry:tracked){Object fragment=entry.fragment.get();if(fragment!=null)applyLegacy(fragment,entry.mode);}
            }
        };
        new android.os.Handler(android.os.Looper.getMainLooper()).post(update);
    }
    private static long historyVisited(String board,long threadId){
        String key=board+"\n"+threadId;long result=0;
        synchronized(displays){
            for(Display display:displays){
                if(!HiddenDroppedThreads.historyMode(display.mode))continue;
                result=Math.max(result,historyVisited(display.source,key));
                List<?> output=display.output.get();if(output!=null)result=Math.max(result,historyVisited(output,key));
            }
        }
        return result;
    }
    private static long historyVisited(List<?> rows,String key){
        if(rows==null)return 0;long result=0;
        for(Object row:rows)if(key.equals(HomeThreadOrder.key(row)))result=Math.max(result,historyVisited(row));
        return result;
    }
    private static Activity homeActivity(){
        try{
            Class<?> type=Class.forName("android.app.ActivityThread");
            java.lang.reflect.Method current=type.getDeclaredMethod("currentActivityThread");current.setAccessible(true);
            Object thread=current.invoke(null);Field activities=type.getDeclaredField("mActivities");activities.setAccessible(true);
            Object value=activities.get(thread);if(!(value instanceof Map))return null;
            for(Object record:((Map<?,?>)value).values())try{
                Field field=record.getClass().getDeclaredField("activity");field.setAccessible(true);
                Object candidate=field.get(record);
                if(candidate instanceof Activity){Activity activity=(Activity)candidate;
                    if(activity.getClass().getName().equals("jp.syoboi.a2chMate.activity.HomeActivity")
                            &&!activity.isFinishing()&&!activity.isDestroyed())return activity;
                }
            }catch(Exception ignored){}
        }catch(Exception error){Log.w("Haiagaru","HOME activity lookup after thread deletion failed",error);}
        return null;
    }
    /** Capture the HOME history row before ChMate runs its native swipe removal. */
    public static void nativeHistoryDeleteStart(Object fragment,int position,long threadId){
        HISTORY_DELETE.remove();
        if(fragment==null||threadId<=0||!fragment.getClass().getName().equals("o.r8lambdaTb_p0z6z2AqSZIga1YhmAVmiTPk"))return;
        int mode=trackedLegacyMode(fragment);
        if(!HiddenDroppedThreads.historyMode(mode))return;
        String board=null;long visited=0;
        try{
            Object adapter=field(fragment,"e").get(fragment);Object value=field(adapter,"j").get(adapter);
            if(value instanceof List&&position>=0&&position<((List<?>)value).size()){
                Object row=((List<?>)value).get(position);
                if(row!=null&&row.getClass().getName().equals("o.onAdDisplayed$setIcon")){
                    Object id=field(row,"h").get(row);
                    if(id instanceof Number&&((Number)id).longValue()==threadId){Object b=field(row,"g").get(row);if(b!=null)board=b.toString();visited=field(row,"c").getLong(row);}
                }
            }
        }catch(Exception error){Log.w("Haiagaru","HOME history swipe target unavailable",error);}
        if(board==null)board=HiddenDroppedThreads.uniqueHistoryBoard(fragment,threadId);
        HISTORY_DELETE.set(new HistoryDelete(fragment,mode,threadId,board,visited));
    }
    /** Keep the source copy used by refresh hooks in sync after native swipe succeeds. */
    public static void nativeHistoryDeleteResult(Object fragment,int position,long threadId,boolean removed){
        HistoryDelete pending=HISTORY_DELETE.get();HISTORY_DELETE.remove();
        if(!removed||fragment==null||threadId<=0)return;
        boolean matched=pending!=null&&pending.fragment==fragment&&pending.id==threadId;
        int mode=matched?pending.mode:trackedLegacyMode(fragment);
        if(!HiddenDroppedThreads.historyMode(mode))return;
        String board=matched?pending.board:null;
        long visited=matched?pending.visited:0;
        if(board==null)board=HiddenDroppedThreads.uniqueHistoryBoard(fragment,threadId);
        if(board==null){Log.w("Haiagaru","HOME deleted history board could not be resolved; leaving other boards unchanged",null);return;}
        try{
            HiddenDroppedThreads.removeRememberedHistoryThread(board,threadId);
        }catch(Exception error){Log.w("Haiagaru","HOME history source refresh unavailable",error);}
        try{
            HiddenDroppedThreads.removeLiveHistoryThread(fragment,board,threadId);
        }catch(Exception error){Log.w("Haiagaru","HOME history swipe refresh unavailable",error);}
        try{removeDeletedHistoryThread(board,threadId,visited);}
        catch(Exception error){Log.w("Haiagaru","HOME history display-copy refresh unavailable",error);}
        try{applyLegacy(fragment,mode);}
        catch(Exception error){Log.w("Haiagaru","HOME history adapter notification unavailable",error);}
    }
    public static List<?> transform(List<?> input, int mode) {
        mode=HomeThreadOrder.logicalMode(mode);
        List<?> result=transformValues(input,mode);
        if(input==null||Math.abs(mode)==104)return result;
        // A display-owned copy lets ON/OFF refresh without editing the native model.
        ArrayList<Object> copy=new ArrayList<>(result);
        synchronized(displays){
            displays.removeIf(d->d.output.get()==null);
            if(displays.size()>=32)displays.remove(0);
            displays.add(new Display(copy,input,mode));
        }
        return copy;
    }
    private static List<?> transformValues(List<?> input,int mode){
        boolean search = GlobalSearchHome.isModernSearchResult(input);
        input=withoutArchivedThreads(GlobalSearchHome.rows(input),mode);
        if(HiddenDroppedThreads.historyMode(mode))input=withoutRecentlyDeleted(input);
        input=HiddenDroppedThreads.filter(input,mode);
        if (search) return HomeThreadOrder.applyModernSearch(input, mode);
        // Native HOME IDs: 101 = unread, 103 = browsing history, 104 = posted.
        // Never override unread sorting (including its native board-sort option).
        if (input == null || Math.abs(mode) != 103 || !enabled()) return HomeThreadOrder.apply(input,mode);
        try {
            return HomeThreadOrder.apply(BrowsingHistoryOrder.arrange(input, new BrowsingHistoryOrder.Access<Object>() {
                @Override public String board(Object row) throws Exception {
                    if (row == null) return null;
                    String name = row.getClass().getName();
                    String board;
                    if (name.equals("o.onAdDisplayed$setIcon")) board = "g";
                    else if (name.equals("o.Yy2$open")) board = "b";
                    else if (name.equals("o.getAvailabilityStatus$r8lambdawJ5MHcSJed_CjC7r4OWD0UxyJsQ")) board = "e";
                    else return null;
                    Object id = field(row, board).get(row);
                    if (id == null) throw new IllegalStateException("Missing history BoardID");
                    return id.toString();
                }
                @Override public long visited(Object row) throws Exception {
                    String name = row.getClass().getName();
                    return field(row, name.equals("o.onAdDisplayed$setIcon") ? "c"
                            : name.equals("o.Yy2$open") ? "e" : "d").getLong(row);
                }
            }, BrowsingHistoryOrder.cutoff(System.currentTimeMillis(), days(), TimeZone.getDefault())),mode);
        } catch (Exception error) {
            Log.w("Haiagaru", "Browsing history grouping left native list unchanged", error);
            return input;
        }
    }
    /** Keep a successful native deletion out of cached display/source copies until it is re-read. */
    static void removeDeletedHistoryThread(String board,long threadId,long visited){
        if(board==null||threadId<=0)return;
        String key=board+"\n"+threadId;long now=System.currentTimeMillis();
        synchronized(deletedHistory){
            deletedHistory.put(key,new DeletedHistory(Math.max(0,visited),now+7L*24*60*60*1000));
            while(deletedHistory.size()>512)deletedHistory.remove(deletedHistory.keySet().iterator().next());
        }
        synchronized(displays){
            displays.removeIf(display->display.output.get()==null);
            for(Display display:displays){
                if(!HiddenDroppedThreads.historyMode(display.mode))continue;
                ArrayList<Object> source=new ArrayList<>(display.source);
                HiddenDroppedThreads.removeHistoryRows(source,board,threadId);
                HiddenDroppedThreads.removeEmptyTimeHeadings(source);
                display.source=source;
                List<Object> output=display.output.get();if(output==null)continue;
                HiddenDroppedThreads.removeHistoryRows(output,board,threadId);
                HiddenDroppedThreads.removeEmptyTimeHeadings(output);
            }
        }
    }
    static void markArchived(String board,long threadId){
        long now=System.currentTimeMillis();
        synchronized(archivedThreads){
            archivedThreads.put(board+"\n"+threadId,new DeletedHistory(now,now+10*60_000L));
            while(archivedThreads.size()>512)archivedThreads.remove(archivedThreads.keySet().iterator().next());
        }
    }
    static List<?> withoutArchivedThreads(List<?> rows,int mode){
        int screen=Math.abs(mode);
        if(rows==null||(screen!=100&&screen!=101&&screen!=102&&screen!=103&&screen!=108&&screen!=109))return rows;
        synchronized(archivedThreads){
            if(archivedThreads.isEmpty())return rows;
            long now=System.currentTimeMillis();
            archivedThreads.entrySet().removeIf(e->now>=e.getValue().expiresAt);
            if(archivedThreads.isEmpty())return rows;
            List<Object> kept=null;
            for(int i=0;i<rows.size();i++){
                Object row=rows.get(i);
                DeletedHistory archive=archivedThreads.get(HomeThreadOrder.key(row));
                if(archive!=null&&historyVisited(row)<=archive.visited){
                    if(kept==null)kept=new ArrayList<>(rows.subList(0,i));
                }else if(kept!=null)kept.add(row);
            }
            return kept==null?rows:kept;
        }
    }
    private static List<?> withoutRecentlyDeleted(List<?> rows){
        if(rows==null)return null;
        long now=System.currentTimeMillis();
        synchronized(deletedHistory){
            java.util.Iterator<Map.Entry<String,DeletedHistory>> iterator=deletedHistory.entrySet().iterator();
            while(iterator.hasNext())if(now>=iterator.next().getValue().expiresAt)iterator.remove();
            if(deletedHistory.isEmpty())return rows;
            java.util.HashSet<String> reopened=new java.util.HashSet<>();
            for(Object row:rows){
                String key=HomeThreadOrder.key(row);DeletedHistory deleted=key==null?null:deletedHistory.get(key);
                if(deleted!=null&&historyVisited(row)>deleted.visited)reopened.add(key);
            }
            for(String key:reopened)deletedHistory.remove(key);
            if(deletedHistory.isEmpty())return rows;
            ArrayList<Object> kept=null;
            for(int index=0;index<rows.size();index++){
                Object row=rows.get(index);String key=HomeThreadOrder.key(row);
                if(key!=null&&deletedHistory.containsKey(key)){
                    if(kept==null){kept=new ArrayList<>(rows.size());for(int i=0;i<index;i++)kept.add(rows.get(i));}
                }else if(kept!=null)kept.add(row);
            }
            return kept==null?rows:kept;
        }
    }
    private static long historyVisited(Object row){
        if(row==null)return 0;
        try{
            String name=row.getClass().getName();
            String field=name.equals("o.onAdDisplayed$setIcon")?"c":name.equals("o.Yy2$open")?"e"
                    :name.equals("o.getAvailabilityStatus$r8lambdawJ5MHcSJed_CjC7r4OWD0UxyJsQ")?"d":null;
            return field==null?0:field(row,field).getLong(row);
        }catch(Exception ignored){return 0;}
    }
    /** Run only after the exact legacy home-sort method has completed. */
    public static void applyLegacy(Object fragment, int mode) {
        if (fragment == null) return;
        int selectedMode=HomeThreadOrder.mode(fragment);
        if(selectedMode!=0)mode=selectedMode;
        prepareLegacy(fragment, mode);
        try {
            boolean legacy191 = fragment.getClass().getName().equals("o.r8lambdaTb_p0z6z2AqSZIga1YhmAVmiTPk");
            Object adapter = field(fragment, legacy191 ? "e" : "i").get(fragment);
            if (!(adapter instanceof BaseAdapter)) return;
            try{filterLegacyAdapter(adapter, mode, true);}
            catch(Exception error){Log.w("Haiagaru","Normal history rows could not be rebuilt after refresh",error);}
            finally{((BaseAdapter) adapter).notifyDataSetChanged();}
            // Legacy HOME can replace the ListView after the fragment has resumed.
            HomeBoardFoldLabels.ensureAttached(fragment);
        } catch (Exception error) {
            Log.w("Haiagaru", "Normal history adapter left unchanged", error);
        }
    }
    /** Set scope before native sorting/notifying, including leaving the target tabs. */
    public static void prepareLegacy(Object fragment, int mode) {
        if (fragment == null) return;
        synchronized(legacyFragments){
            legacyFragments.removeIf(e->e.fragment.get()==null||e.fragment.get()==fragment);
            if(legacyFragments.size()>=16)legacyFragments.remove(0);
            legacyFragments.add(new Legacy(fragment,mode));
        }
    }
    private static void filterLegacyAdapter(Object adapter,int mode,boolean group) throws Exception {
            boolean legacy191 = adapter.getClass().getName().equals("o.r8lambdaXZREaGE4vvLAA2ZOtsKBd3knAPA");
            // 191 getItem/getCount read j. Native b() and Filter.publishResults replace j later.
            String[] fields = legacy191 ? new String[]{"g", "i", "j"} : new String[]{"g", "d"};
            Object[] replacements = new Object[fields.length];
            java.util.IdentityHashMap<Object,Object> processed=new java.util.IdentityHashMap<>();
            java.util.IdentityHashMap<Object,List<?>> expandedCopies=new java.util.IdentityHashMap<>();
            for (int i = 0; i < fields.length; i++) {
                Object original = field(adapter, fields[i]).get(adapter);
                // Native lazy/search adapters may not have populated every cache yet.
                // An absent source cache must not bypass filtering of the visible list.
                if (!(original instanceof List)) {replacements[i]=original;continue;}
                if(processed.containsKey(original)){
                    replacements[i]=processed.get(original);
                    List<?> expanded=expandedCopies.get(original);
                    if(expanded!=null)foldSources.computeIfAbsent(adapter,k->new java.util.HashMap<>()).put(fields[i],expanded);
                    continue;
                }
                List<?> source=HiddenDroppedThreads.source(original,(List<?>)original);
                // Notification must preserve the native search result/order. The full sort
                // path restores from its source; the final boundary only removes dropped rows.
                List<?> ordered = group ? transformValues(source, mode)
                        : HiddenDroppedThreads.active(mode) && HiddenDroppedThreads.target(mode)
                                ? HiddenDroppedThreads.filter((List<?>)original, mode) : source;
                // transformValues already runs both passes for the full sort.
                if(!group){ordered=withoutArchivedThreads(GlobalSearchHome.rows(ordered),mode);ordered=HomeThreadOrder.apply(ordered,mode);}
                List<?> expanded=HomeThreadOrder.expandedForDisplay();
                if(expanded!=null)expandedCopies.put(original,expanded);
                if(expanded!=null)foldSources.computeIfAbsent(adapter,k->new java.util.HashMap<>()).put(fields[i],expanded);
                if(ordered==original){replacements[i]=original;processed.put(original,original);continue;}
                replacements[i] = original.getClass().getConstructor(List.class).newInstance(ordered);
                HiddenDroppedThreads.remember(replacements[i],source,mode);
                processed.put(original,replacements[i]);
            }
            for (int i = 0; i < fields.length; i++) field(adapter, fields[i]).set(adapter, replacements[i]);
    }
    /** Runs at the final adapter notification boundary; never notifies recursively. */
    public static void beforeLegacyNotify(Object adapter) {
        if(Boolean.TRUE.equals(folding.get()))return;
        List<Legacy> tracked; synchronized(legacyFragments){tracked=new ArrayList<>(legacyFragments);}
        for(Legacy entry:tracked){
            Object fragment=entry.fragment.get();if(fragment==null)continue;
            try {
                boolean v191=fragment.getClass().getName().equals("o.r8lambdaTb_p0z6z2AqSZIga1YhmAVmiTPk");
                if(field(fragment,v191?"e":"i").get(fragment)!=adapter)continue;
                filterLegacyAdapter(adapter,entry.mode,false);return;
            }catch(Exception error){Log.w("Haiagaru","HOME notification filter unavailable",error);}
        }
    }
    /** Reapply HOME copies when settings or asynchronously confirmed status change. */
    static void refreshVisible(Activity activity){
        synchronized(displays){
            for(Display display:displays){
                List<Object> output=display.output.get();if(output==null)continue;
                List<?> next=transformValues(display.source,display.mode);
                display.expanded=HomeThreadOrder.expandedForDisplay();
                if(!output.equals(next)){output.clear();output.addAll(next);}
            }
            displays.removeIf(d->d.output.get()==null);
        }
        List<Legacy> legacy;synchronized(legacyFragments){legacy=new ArrayList<>(legacyFragments);}
        for(Legacy entry:legacy){
            Object f=entry.fragment.get();if(f==null)continue;
            try{
                if(Boolean.TRUE.equals(f.getClass().getMethod("isAdded").invoke(f))
                        &&f.getClass().getMethod("getActivity").invoke(f)==activity)applyLegacy(f,entry.mode);
            }catch(Exception error){Log.w("Haiagaru","HOME display refresh unavailable",error);}
        }
        if(activity!=null&&activity.getWindow()!=null)notifyLists(activity.getWindow().getDecorView());
    }
    /** A heading tap only projects existing ordered rows; no NG/DB checks or sorting. */
    static void refreshCategory(Object fragment,Activity activity,int mode){
        try{
            boolean legacy=fragment.getClass().getName().equals("o.r8lambdaTb_p0z6z2AqSZIga1YhmAVmiTPk")
                    ||fragment.getClass().getName().equals("jp.syoboi.a2chMate.fragment.HomeFragment");
            if(legacy){
                Object adapter=field(fragment,fragment.getClass().getName().startsWith("o.")?"e":"i").get(fragment);
                Map<String,List<?>> sources=foldSources.get(adapter);
                if(sources==null){applyLegacy(fragment,mode);return;}
                for(Map.Entry<String,List<?>> entry:sources.entrySet()){
                    Field target=field(adapter,entry.getKey());Object original=target.get(adapter);
                    if(!(original instanceof List))continue;
                    List<?> rows=HomeThreadOrder.refold(entry.getValue(),mode);
                    Object replacement=original.getClass().getConstructor(List.class).newInstance(rows);
                    HiddenDroppedThreads.remember(replacement,HiddenDroppedThreads.source(original,(List<?>)original),mode);
                    target.set(adapter,replacement);
                }
                folding.set(true);
                try{((BaseAdapter)adapter).notifyDataSetChanged();}finally{folding.remove();}
            }else{
                synchronized(displays){
                    displays.removeIf(d->d.output.get()==null);
                    for(Display display:displays)if(display.mode==mode&&display.expanded!=null){
                        List<Object> output=display.output.get();if(output==null)continue;
                        List<?> rows=HomeThreadOrder.refold(display.expanded,mode);
                        output.clear();output.addAll(rows);
                    }
                }
                View root=(View)fragment.getClass().getMethod("getView").invoke(fragment);
                if(root!=null)notifyLists(root);
            }
        }catch(Exception error){Log.w("Haiagaru","HOME heading projection unavailable",error);refreshVisible(activity);}
    }
    private static void notifyLists(View view){
        try{
            Object adapter=null;
            if(view instanceof AdapterView)adapter=((AdapterView<?>)view).getAdapter();
            else for(Class<?> c=view.getClass();c!=null;c=c.getSuperclass())if(c.getName().equals("androidx.recyclerview.widget.RecyclerView")){
                adapter=view.getClass().getMethod("getAdapter").invoke(view);break;
            }
            if(adapter instanceof android.widget.WrapperListAdapter)adapter=((android.widget.WrapperListAdapter)adapter).getWrappedAdapter();
            if(adapter instanceof BaseAdapter)((BaseAdapter)adapter).notifyDataSetChanged();
            else if(adapter!=null)adapter.getClass().getMethod("notifyDataSetChanged").invoke(adapter);
        }catch(Exception error){Log.w("Haiagaru","HOME adapter notification unavailable",error);}
        if(view instanceof ViewGroup){ViewGroup group=(ViewGroup)view;for(int i=0;i<group.getChildCount();i++)notifyLists(group.getChildAt(i));}
    }
}
