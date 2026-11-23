package patches.maps.gearslip;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import java.lang.ref.WeakReference;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Maps' own recents and search-result models, offered as rows of the host keyboard's search
 * template. Maps draws everything else itself; only text input is bridged to the host.
 */
public final class NativeCarContent {
    enum Kind { RECENTS, SEARCH }
    static final class Action {
        final Object model;
        final String title,method;
        final int consumer;
        final boolean enabled;
        Action(Object model,String title,String method,int consumer,boolean enabled){this.model=model;this.title=title;this.method=method;this.consumer=consumer;this.enabled=enabled;}
        boolean same(Action other){return other!=null&&model==other.model&&method.equals(other.method)&&consumer==other.consumer&&enabled==other.enabled&&title.equals(other.title);}
        /** Runs the row's original native callback: a poe consumer for search results, else its model method. */
        void run()throws Exception{
            if(!enabled)throw new SecurityException("Native action is unavailable");
            if(consumer>=0){
                ClassLoader loader=model.getClass().getClassLoader();
                // Maps renames this consumer every release: 26.43/26.44 "poe", 26.47 "pqg".
                Class<?> type=null;
                for(String name:new String[]{"poe","pqg"}){
                    try{type=loader.loadClass(name);break;}catch(ClassNotFoundException next){/* try the next build's name */}
                }
                if(type==null)throw new ClassNotFoundException("Maps' native search consumer");
                Constructor<?> constructor=type.getDeclaredConstructor(int.class);constructor.setAccessible(true);
                Object handler=constructor.newInstance(consumer);call(handler,"accept",new Class<?>[]{Object.class},model);
            }else call(model,method);
        }
    }
    static final class Row {
        final String title;
        final List<String> texts;
        final Action action;
        Row(String title,List<String> texts,Action action){this.title=title;this.texts=Collections.unmodifiableList(new ArrayList<>(texts));this.action=action;}
    }
    static final class Page {
        final Kind kind;
        final String title;
        final List<Row> rows;
        Page(Kind kind,String title,List<Row> rows){this.kind=kind;this.title=title;this.rows=Collections.unmodifiableList(new ArrayList<>(rows));}
        boolean contains(Action candidate){
            for(Row row:rows)if(row.action!=null&&row.action.same(candidate))return true;
            return false;
        }
        String signature(){
            StringBuilder out=new StringBuilder(kind.name()).append('|').append(title);
            for(Row row:rows){out.append('|').append(row.title).append(row.texts);if(row.action!=null)out.append(System.identityHashCode(row.action.model)).append(row.action.enabled);}
            return out.toString();
        }
    }

    private static final Map<Object,WeakReference<NativeCarContent>> OWNERS=new WeakHashMap<>();
    private static final Map<Object,WeakReference<Object>> SOURCES=new WeakHashMap<>();
    private final Context context;
    private final Runnable changed;
    private final Handler main=new Handler(Looper.getMainLooper());
    private WeakReference<Object> recents=new WeakReference<>(null),search=new WeakReference<>(null);
    private boolean closed;
    private final Map<String,String> capturedSignatures=new java.util.HashMap<>();
    private boolean notificationQueued;
    private final Runnable notifyChange;
    private void notifyChanged(){if(!notificationQueued){notificationQueued=true;main.post(notifyChange);}}

    NativeCarContent(Object owner,Context context,Runnable changed){this.context=context;this.changed=changed;notifyChange=()->{notificationQueued=false;if(!closed)this.changed.run();};synchronized(OWNERS){OWNERS.put(owner,new WeakReference<>(this));}}
    private static NativeCarContent forOwner(Object owner){if(owner==null||LocalCarUiSession.owner()!=owner)return null;synchronized(OWNERS){WeakReference<NativeCarContent> value=OWNERS.get(owner);return value==null?null:value.get();}}
    /** The car window that produced a recents (qdf) or search (qbn) model; never the time it arrived. */
    private static Object ownerFor(Object source){
        synchronized(SOURCES){
            WeakReference<Object> known=SOURCES.get(source);
            if(known!=null)return known.get();
            Object owner=NativeCarScopes.producerOwner(source);
            if(owner==null)try{
                String type=source.getClass().getName();
                // 26.43/26.44 "qdf" (Context c) and "qbn"; 26.47 "qfp" (Context d) and "qdu".
                if("qdf".equals(type)||"qfp".equals(type))owner=NativeCarScopes.owner((Context)field(source,"qfp".equals(type)?"d":"c"),field(source,"b"));
                else if("qbn".equals(type)||"qdu".equals(type))owner=NativeCarScopes.owner((Context)field(source,"p"),field(source,"b"));
            }catch(Exception unavailable){return null;}
            if(owner!=null)SOURCES.put(source,new WeakReference<>(owner));return owner;
        }
    }

    /** Guarded product hooks preserve the original native method results and policy. */
    public static void capture(Object model){
        if(model==null)return;NativeCarContent current=forOwner(ownerFor(model));if(current==null||current.closed)return;
        try{
            String key;List<Row> rows;
            if(instance(model,"qcq")||instance(model,"qfa")){current.recents=new WeakReference<>(model);key="recents";rows=readRecents(model);}
            else if(instance(model,"qbh")||instance(model,"qdo")){current.search=new WeakReference<>(model);key="search";rows=current.readSearch(model);}
            else return;
            current.captured(key,model,rows);
        }catch(Exception error){Log.w("MapsNativeCar","Native search model unavailable",error);}
    }
    private void captured(String key,Object source,List<Row> rows){
        String signature=System.identityHashCode(source)+new Page(Kind.RECENTS,"",rows).signature();
        if(!signature.equals(capturedSignatures.put(key,signature)))notifyChanged();
    }

    /** The rows under the host keyboard: Maps' recents for an empty query, its search results otherwise. */
    Page read(String query)throws Exception{
        if(closed||query==null)return null;
        boolean results=!query.trim().isEmpty();Object source=(results?search:recents).get();
        Kind kind=results?Kind.SEARCH:Kind.RECENTS;
        if(source==null)return new Page(kind,query,Collections.emptyList());
        return new Page(kind,query,results?readSearch(source):readRecents(source));
    }
    /** Runs a row only while Maps still offers it for the same query; no exporter sits in between. */
    void invoke(Action action,String query)throws Exception{
        Page current=read(query);
        if(current==null||!current.contains(action))throw new SecurityException("Native search row was replaced");
        action.run();
        notifyChanged();
    }

    static List<Row> readRecents(Object source)throws Exception{
        List<Row> rows=new ArrayList<>();
        // 26.47 moved the list getter one slot: d -> e on the "qfp" window.
        String listGetter="qfp".equals(source.getClass().getName())?"e":"d";
        for(Object model:list(call(source,listGetter))){
            String title=text(call(model,"h"));if(title.isEmpty())continue;
            rows.add(new Row(title,texts(call(model,"i"),call(model,"g")),new Action(model,title,"j",-1,true)));
        }
        return rows;
    }
    List<Row> readSearch(Object source)throws Exception{
        List<Row> rows=new ArrayList<>();
        for(Object model:list(call(source,"c"))){
            Object place=field(model,"a");String title=text(call(place,"e"));if(title.isEmpty())continue;
            rows.add(new Row(title,texts(call(place,"d")),new Action(model,title,"accept",18,true)));
        }
        Object footer=call(source,"b");
        if(footer!=null&&("qbo".equals(footer.getClass().getName())||"qdv".equals(footer.getClass().getName()))){
            String title=text(field(footer,"a"));if(!title.isEmpty())rows.add(new Row(title,Collections.emptyList(),null));
        }else if(footer!=null&&hasMethod(footer,"accept")){
            String title=label("OFFLINE_TOUCH_TO_RETRY","Offline. Tap to retry");
            rows.add(new Row(title,Collections.emptyList(),new Action(footer,title,"accept",19,true)));
        }
        return rows;
    }
    private String label(String name,String fallback){
        for(String pkg:new String[]{context.getPackageName(),"com.google.android.apps.maps"}){
            int id=context.getResources().getIdentifier(name,"string",pkg);if(id!=0)return context.getString(id);
        }
        return fallback;
    }
    private static String text(Object value){return value instanceof CharSequence?value.toString().trim():"";}
    private static List<String> texts(Object... values){List<String> result=new ArrayList<>();for(Object value:values){String text=text(value);if(!text.isEmpty()&&!result.contains(text))result.add(text);}return result;}
    private static List<?> list(Object value){if(!(value instanceof List))throw new IllegalStateException("Native search list changed");return (List<?>)value;}
    private static boolean instance(Object value,String type){try{return value.getClass().getClassLoader().loadClass(type).isInstance(value);}catch(ClassNotFoundException absent){return false;}}
    private static Object field(Object value,String name)throws Exception{
        for(Class<?> type=value.getClass();type!=null;type=type.getSuperclass())try{Field field=type.getDeclaredField(name);field.setAccessible(true);return field.get(value);}catch(NoSuchFieldException absent){}
        throw new NoSuchFieldException(name);
    }
    /** True when the object exposes a public one-argument accept(Object) (the retry footer). */
    private static boolean hasMethod(Object value,String name){
        for(Class<?> type=value.getClass();type!=null;type=type.getSuperclass()){
            try{type.getDeclaredMethod(name,Object.class);return true;}catch(NoSuchMethodException absent){}
        }
        return false;
    }
    private static Object call(Object value,String name)throws Exception{return call(value,name,new Class<?>[0]);}
    private static Object call(Object value,String name,Class<?>[] types,Object...args)throws Exception{
        Method method=null;try{method=value.getClass().getMethod(name,types);}catch(NoSuchMethodException absent){
            for(Class<?> type=value.getClass();type!=null;type=type.getSuperclass())try{method=type.getDeclaredMethod(name,types);break;}catch(NoSuchMethodException inherited){}
        }
        if(method==null)throw new NoSuchMethodException(name);method.setAccessible(true);return method.invoke(value,args);
    }
    void close(Object owner){closed=true;synchronized(OWNERS){OWNERS.remove(owner);}main.removeCallbacksAndMessages(null);}
}
