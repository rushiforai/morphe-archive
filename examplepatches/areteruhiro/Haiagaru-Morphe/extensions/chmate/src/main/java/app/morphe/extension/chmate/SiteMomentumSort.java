package app.morphe.extension.chmate;

import java.util.*;
import java.lang.reflect.Field;

/** Keep each native sort's creation-date snapshot and clock stable across comparisons. */
public final class SiteMomentumSort {
    private static final ThreadLocal<Snapshot> CURRENT=new ThreadLocal<>();
    private static final class Snapshot {
        final Map<String,Long> dates=SiteThreadMetadata.creationSnapshot();
        final String board;
        final long now=System.currentTimeMillis()/1000;
        final Map<Object,Long> values=new IdentityHashMap<>();
        boolean external;
        Snapshot(List<?> rows){
            board=SiteThreadMetadata.sortBoard(rows);
            for(Object item:rows)try{long[] row=row(item);if(row!=null){external|=external(row[0]);values.put(item,value(row,this));}}
            catch(ReflectiveOperationException|RuntimeException unknown){/* Keep unknown row types native. */}
        }
    }
    @SuppressWarnings({"unchecked","rawtypes"})
    public static void sort(List rows,Comparator comparator){
        Snapshot before=CURRENT.get();CURRENT.set(new Snapshot(rows));
        try{Collections.sort(rows,comparator);}finally{if(before==null)CURRENT.remove();else CURRENT.set(before);}
    }
    /** MIN_VALUE asks the injected comparator to retain its complete native implementation. */
    public static int compare(Object left,Object right){
        Snapshot snapshot=CURRENT.get();if(snapshot==null)return Integer.MIN_VALUE;
        if(!snapshot.external)return Integer.MIN_VALUE;
        Long a=snapshot.values.get(left),b=snapshot.values.get(right);
        return a==null||b==null?Integer.MIN_VALUE:Long.compare(b,a);
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
