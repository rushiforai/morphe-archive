package app.morphe.extension.chmate;

import java.lang.reflect.*;
import java.util.*;

/** Preserve native date parsing; avoid repeating it for every scrollbar redraw. */
public final class NativeDrawDates {
    private static final int OWNERS=16, ENTRIES=2048;
    private static final Map<String,LinkedHashMap<String,Long>> CACHE=new LinkedHashMap<>();
    private static final Map<Object,String> SCOPES=new WeakHashMap<>();
    private static volatile Method parser;
    private static final java.util.regex.Pattern COMPLETE=java.util.regex.Pattern.compile(
        "^[0-9]{4}/[0-9]{2}/[0-9]{2}(?:\\([^)]*\\))? [0-9]{2}:[0-9]{2}:[0-9]{2}\\.[0-9]{1,3}(?: .*)?$");
    public static long parse(Object owner,String text){
        // Partial/invalid dates may depend on Calendar state: leave them fully native.
        if(text==null||!COMPLETE.matcher(text).matches())return nativeParse(owner,text);
        String scope=scope(owner);
        synchronized(CACHE){
            LinkedHashMap<String,Long> rows=CACHE.get(scope);
            if(rows!=null){Long value=rows.get(text);if(value!=null)return value;}
        }
        long value=nativeParse(owner,text);
        synchronized(CACHE){
            LinkedHashMap<String,Long> rows=CACHE.get(scope);
            if(rows==null){if(CACHE.size()>=OWNERS)CACHE.clear();rows=new LinkedHashMap<String,Long>(128,.75f,true){
                @Override protected boolean removeEldestEntry(Map.Entry<String,Long> e){return size()>ENTRIES;}
            };CACHE.put(scope,rows);}
            rows.put(text,value);
        }
        return value;
    }
    private static String scope(Object owner){
        synchronized(CACHE){
            String key=SCOPES.get(owner);if(key!=null)return key;
            try{
                Field field=owner.getClass().getDeclaredField("d");field.setAccessible(true);
                GregorianCalendar c=(GregorianCalendar)field.get(owner);
                key=c.getTimeZone().toString()+"/"+c.getGregorianChange().getTime()+"/"+c.isLenient()
                    +"/"+c.getFirstDayOfWeek()+"/"+c.getMinimalDaysInFirstWeek();
                SCOPES.put(owner,key);return key;
            }catch(ReflectiveOperationException e){throw new IllegalStateException("Native date calendar unavailable",e);}
        }
    }
    private static long nativeParse(Object owner,String text){
        try{
            Method method=parser;
            if(method==null||method.getDeclaringClass()!=owner.getClass()){
                method=owner.getClass().getDeclaredMethod("haiagaruNativeDrawDate",String.class);
                method.setAccessible(true);parser=method;
            }
            return ((Number)method.invoke(owner,text)).longValue();
        }catch(InvocationTargetException e){return NativeDrawDates.<RuntimeException,Long>rethrow(e.getCause());}
        catch(ReflectiveOperationException e){throw new IllegalStateException("Native draw date parser unavailable",e);}
    }
    @SuppressWarnings("unchecked") private static <E extends Throwable,T>T rethrow(Throwable e)throws E{throw(E)e;}
    private NativeDrawDates(){}
}
