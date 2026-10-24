package app.morphe.extension.chmate;

import java.util.*;

/** Read-only capture before native popularity filtering. Never toggles the live model. */
public final class PopularNativeRows {
    private static final List<Snapshot> snapshots=new ArrayList<>();
    private static final ThreadLocal<Integer> modernThreshold=new ThreadLocal<>();
    private static final ThreadLocal<Boolean> modernFlat=new ThreadLocal<>();
    static final class Snapshot {
        final Object first;final List<?> rows;final boolean flat;final int threshold;
        final Object[] responses;final int[] layout;
        Snapshot(List<?> rows,boolean flat,int threshold)throws Exception {
            this.rows=new ArrayList<>(rows);this.flat=flat;this.threshold=threshold;
            responses=new Object[rows.size()];layout=new int[rows.size()*2];
            for(int i=0;i<rows.size();i++){
                Object r=ExtraQuickFilters.rowResponse(rows.get(i));responses[i]=r;
                if(r!=null){layout[i*2]=depth(rows.get(i));layout[i*2+1]=references(r);}
            }
            Object found=null;for(Object row:rows){Object r=ExtraQuickFilters.rowResponse(row);if(r!=null){found=r;break;}}first=found;
        }
        boolean sameLayout(Snapshot other){
            if(flat!=other.flat||threshold!=other.threshold||responses.length!=other.responses.length)return false;
            for(int i=0;i<responses.length;i++)if(responses[i]!=other.responses[i])return false;
            return Arrays.equals(layout,other.layout);
        }
        Set<Integer> selected(int threshold)throws Exception {
            Set<Integer> result=new LinkedHashSet<>();int start=-1;
            for(int i=0;i<rows.size();i++) {
                Object r=responses[i];
                if(flat){if(r!=null&&layout[i*2+1]>=threshold)result.add(ExtraQuickFilters.number(r));continue;}
                if(r==null||layout[i*2]==0){if(start>=0&&i-start>=threshold)add(result,start,i);start=r==null?-1:i;}
            }
            if(!flat&&start>=0&&rows.size()-start>=threshold)add(result,start,rows.size());
            return result;
        }
        private void add(Set<Integer> result,int start,int end)throws Exception {
            for(int i=start;i<end;i++){Object r=ExtraQuickFilters.rowResponse(rows.get(i));if(r!=null)result.add(ExtraQuickFilters.number(r));}
        }
    }
    private static Object field(Object o,String n)throws Exception{return ResponseArchiveEntry.field(o,n);}
    static int references(Object r)throws Exception {
        String n=r.getClass().getName();return ((Number)field(r,n.equals("o.processAdDisplayErrorPostbackForUserError")?"r":n.equals("o.BouncyCastleSocketAdapterCompanion")?"p":"s")).intValue();
    }
    private static int depth(Object row)throws Exception {
        String n=row.getClass().getName();return ((Number)field(row,n.equals("o.r8lambdakfayx3RllpZib32UTPpeXfQjw")?"i":n.equals("o.setSocketokhttp")?"h":"j")).intValue();
    }
    private static void save(List<?> rows,boolean flat,int threshold) {
        try {
            Snapshot s=new Snapshot(rows,flat,threshold);if(s.first==null)return;
            synchronized(snapshots){
                // A popup starting at response 1 can use another display mode.
                // It must not replace the main thread's complete layout or mode.
                for(Snapshot previous:snapshots)if(previous.rows.size()>s.rows.size()){
                    // Repeated popups must not fill the bounded cache and evict
                    // the complete main-thread capture after only 16 replies.
                    for(Object response:previous.responses)if(response==s.first)return;
                }
                Snapshot next=s;
                // Native rebuilds recreate row wrappers. Do not schedule another rebuild
                // for an identical layout; compare captured values, not mutable responses.
                for(Snapshot previous:snapshots)if(previous.first==next.first&&previous.sameLayout(next))return;
                snapshots.removeIf(v->v.first==next.first);
                if(snapshots.size()>=16)snapshots.remove(0);
                snapshots.add(next);
            }
            // The adapter can be asked for its counts before the native renderer
            // has produced the rows. Revisit that pending count/filter once the
            // complete native layout is available.
            ExtraQuickFilters.nativeRowsReady();
        }catch(Exception error){android.util.Log.w("Haiagaru","Native popular rows unavailable",error);}
    }
    public static void captureLegacy(Object adapter,List<?> rows) {
        try {boolean old=adapter.getClass().getName().equals("o.m9ExternalSyntheticLambda1");
            save(rows,((Number)field(adapter,old?"G":"M")).intValue()!=1,((Number)field(adapter,old?"I":"D")).intValue());
        }catch(Exception error){android.util.Log.w("Haiagaru","Native popularity settings unavailable",error);}
    }
    static void config(Object config){modernFlat.remove();try{modernThreshold.set(((Number)field(config,"b")).intValue());}catch(Exception ignored){modernThreshold.remove();}}
    static void mode(Object mode){
        if(!(mode instanceof Enum)){modernFlat.remove();return;}
        String name=((Enum<?>)mode).name();
        if("Tree".equals(name))modernFlat.set(false);else if("Normal".equals(name))modernFlat.set(true);else modernFlat.remove();
    }
    public static void captureModern(List<?> rows,Object unused) {
        try {Integer threshold=modernThreshold.get();Boolean flat=modernFlat.get();if(threshold!=null&&flat!=null)save(rows,flat,threshold);}
        catch(Exception error){android.util.Log.w("Haiagaru","Modern popularity rows unavailable",error);}
        finally{modernThreshold.remove();modernFlat.remove();}
    }
    static Snapshot find(List<?> source) {
        Object first=null;for(Object row:source)if(row!=null){first=row;break;}
        // Sharing any response is not ownership: a popup for response 2 also
        // belongs to this thread, but is not its full popularity layout.
        synchronized(snapshots){for(int i=snapshots.size()-1;i>=0;i--){Snapshot s=snapshots.get(i);if(first==s.first)return s;}}
        return null;
    }
    static Set<Integer> select(List<?> source,int threshold)throws Exception {
        Snapshot s=find(source);if(s==null)throw new IllegalStateException("Native response layout not ready");return s.selected(threshold);
    }
    private PopularNativeRows(){}
}
