package app.morphe.extension.chmate;

import java.util.*;
import java.lang.reflect.Field;

/** Keep each native sort's creation-date snapshot and clock stable across comparisons. */
public final class SiteMomentumSort {
    private static final ThreadLocal<Snapshot> CURRENT=new ThreadLocal<>();
    private static final Map<String,Comparator> SORTS=Collections.synchronizedMap(new LinkedHashMap<String,Comparator>(64,.75f,true){protected boolean removeEldestEntry(Map.Entry<String,Comparator> e){return size()>128;}});
    private static final class Snapshot {
        final Map<String,Long> dates=SiteThreadMetadata.creationSnapshot();
        final String board;
        final long now=System.currentTimeMillis()/1000;
        final Map<Object,Long> values=new IdentityHashMap<>();
        boolean external,momentum;
        Snapshot(List<?> rows,String boardHint){
            board=boardHint==null?SiteThreadMetadata.sortBoard(rows):boardHint;
            for(Object item:rows)try{long[] row=row(item);if(row!=null){external|=external(row[0]);values.put(item,value(row,this));}}
            catch(ReflectiveOperationException|RuntimeException unknown){/* Keep unknown row types native. */}
        }
    }
    @SuppressWarnings({"unchecked","rawtypes"})
    public static void sort(List rows,Comparator comparator){
        sort(rows,comparator,null);
    }
    @SuppressWarnings({"unchecked","rawtypes"})
    private static void sort(List rows,Comparator comparator,String boardHint){
        Snapshot before=CURRENT.get(),snapshot=new Snapshot(rows,boardHint);CURRENT.set(snapshot);
        try{Collections.sort(rows,comparator);if(snapshot.external&&snapshot.board!=null){if(snapshot.momentum)SORTS.put(snapshot.board,comparator);else SORTS.remove(snapshot.board);}}
        finally{if(before==null)CURRENT.remove();else CURRENT.set(before);}
    }
    /** MIN_VALUE asks the injected comparator to retain its complete native implementation. */
    public static int compare(Object left,Object right){
        Snapshot snapshot=CURRENT.get();if(snapshot==null)return Integer.MIN_VALUE;
        if(!snapshot.external)return Integer.MIN_VALUE;
        Long a=snapshot.values.get(left),b=snapshot.values.get(right);
        if(a==null||b==null)return Integer.MIN_VALUE;snapshot.momentum=true;return Long.compare(b,a);
    }
    /** Rebind a new ordered list after asynchronous dates arrive, never mutate a native published list. */
    @SuppressWarnings({"unchecked","rawtypes"})
    static void refresh(Object adapter,String board)throws ReflectiveOperationException{
        Comparator comparator=SORTS.get(board);if(comparator==null)return;
        String type=adapter.getClass().getName(),member=type.equals("o.m8a")?"d":type.equals("o.getWriteBytesTotal")?"e":type.equals("o.zzavb")?"h":null;
        if(member==null)return;Field items=adapter.getClass().getDeclaredField(member);items.setAccessible(true);Object current=items.get(adapter);if(!(current instanceof List))return;
        ArrayList copy=new ArrayList((List)current);sort(copy,comparator,board);if(!copy.equals(current))items.set(adapter,copy);
    }
    private static boolean external(long id){return id>SiteThreadIds.BASE&&id<SiteThreadIds.BASE*2;}
    private static long value(long[] row,Snapshot snapshot){
        long created=row[0];
        if(external(created)){
            String source=Long.toString(created-SiteThreadIds.BASE);
            Long exact=snapshot.board==null?null:snapshot.dates.get(snapshot.board+":"+source);
            created=exact==null?SiteThreadDates.uniqueCachedDate(snapshot.dates,source,0):exact;
        }
        return SiteThreadDates.momentum((int)row[1],created,snapshot.now);
    }
    private static Object field(Object row,String key)throws ReflectiveOperationException{
        Field field=row.getClass().getDeclaredField(key);field.setAccessible(true);return field.get(row);
    }
    static long[] row(Object row)throws ReflectiveOperationException{
        if(row==null)return null;String type=row.getClass().getName(),subject,id,count;
        switch(type){
            case "o.MaxAdViewImplExternalSyntheticLambda2":subject="a";id="e";count="a";break;
            case "o.verifyHostname":subject="d";id="b";count="e";break;
            case "o.zzauw":subject="i";id="d";count="b";break;
            default:return null;
        }
        Object entry=field(row,subject);
        return new long[]{((Number)field(entry,id)).longValue(),((Number)field(entry,count)).intValue()};
    }
    private SiteMomentumSort(){}
}
