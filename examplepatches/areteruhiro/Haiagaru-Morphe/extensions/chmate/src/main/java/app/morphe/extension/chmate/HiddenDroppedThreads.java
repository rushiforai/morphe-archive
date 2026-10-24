package app.morphe.extension.chmate;

import android.content.Context;
import java.lang.reflect.Field;
import java.util.*;

/** Display copies only; native STATE_DROP or positively confirmed official archive status. */
public final class HiddenDroppedThreads {
    static final String KEY="hideDroppedHomeThreads";
    static final String DRAFTS="hideDroppedDrafts",SENT="hideDroppedSent";
    // Legacy 191/226 HOME uses mode 100 for browsing history. 242+ uses
    // 100 for the all/favorites screen and 103 for browsing history.
    private static volatile int legacyHistoryModeState;
    private static final Map<String,Boolean> nativeStatus=new LinkedHashMap<>();
    private static final List<Original> originals=new ArrayList<>();
    private static final class Original {
        final java.lang.ref.WeakReference<Object> wrapper;final List<?> source;
        Original(Object w,List<?> s){wrapper=new java.lang.ref.WeakReference<>(w);source=s;}
    }
    static boolean option(String key){Context c=Haiagaru.applicationContextForExtension();return c!=null&&c.getSharedPreferences(WacchoiSearchOptions.PREFS,0).getBoolean(key,false);}
    static boolean enabled(){return option(KEY);}
    static boolean anyEnabled(){return enabled()||option(DRAFTS)||option(SENT);}
    private static boolean legacyHistoryMode100(){
        int state=legacyHistoryModeState;if(state!=0)return state==1;
        Context context=Haiagaru.applicationContextForExtension();if(context==null)return false;
        try{
            String version=context.getPackageManager().getPackageInfo(context.getPackageName(),0).versionName;
            boolean legacy=version!=null&&(version.startsWith("0.8.10.191")||version.startsWith("0.8.10.226"));
            synchronized(HiddenDroppedThreads.class){if(legacyHistoryModeState==0)legacyHistoryModeState=legacy?1:2;return legacyHistoryModeState==1;}
        }catch(Exception ignored){return false;}
    }
    static boolean historyMode(int mode){int id=Math.abs(mode);return id==103||(id==100&&legacyHistoryMode100());}
    static boolean active(int mode){return Math.abs(mode)==104?option(DRAFTS)||option(SENT):enabled();}
    static boolean target(int mode){int id=Math.abs(mode);return id==101||id==102||id==104||historyMode(mode);}
    static Object postData(Object row)throws Exception{
        if(row==null)return null;String name=row.getClass().getName(),field;
        if(name.equals("o.onAdDisplayed$Keep"))field="b";
        else if(name.equals("o.Yy2$ActivityResult")||name.equals("o.getAvailabilityStatus$read"))field="d";
        else return null;
        Field f=row.getClass().getDeclaredField(field);f.setAccessible(true);return f.get(row);
    }
    static String postUrl(Object post)throws Exception{return (String)post.getClass().getField(post.getClass().getName().equals("o.n7a")?"g":"n").get(post);}
    static boolean sent(Object post)throws Exception{
        String name=post.getClass().getName();return post.getClass().getField(name.equals("o.n7a")?"a":name.equals("o.setBorderWidth")?"g":"j").getLong(post)>0;
    }
    private static String threadKey(String url){
        try{java.net.URI u=java.net.URI.create(url);String host=u.getHost(),path=u.getPath();
            if(host==null||path==null||!path.matches("/test/read\\.cgi/[^/]+/[0-9]{9,11}(?:/.*)?"))return null;
            host=host.toLowerCase(Locale.ROOT).replaceFirst("\\.(?:2ch\\.net|5ch\\.net)$",".5ch.io");
            return host+path.replaceFirst("(/test/read\\.cgi/[^/]+/[0-9]{9,11})(?:/.*)?$","$1");
        }catch(Exception ignored){return null;}
    }
    private static boolean knownPostDrop(Object post)throws Exception{
        String url=postUrl(post),key=threadKey(url);Boolean known;
        synchronized(nativeStatus){known=key==null?null:nativeStatus.get(key);}
        return Boolean.TRUE.equals(known)||DroppedThreadStatus.droppedUrl(url);
    }
    private static void rememberDrop(Object row,Context context) {
        try {
            if(!dropped(row))return;
            String key=threadKey(DroppedThreadStatus.rowUrl(row,context));if(key==null)return;
            synchronized(nativeStatus){
                if(nativeStatus.size()>=4096)nativeStatus.remove(nativeStatus.keySet().iterator().next());
                nativeStatus.put(key,true);
            }
        } catch(Exception ignored) { /* URL lookup must not disable native flag filtering. */ }
    }
    private static boolean knownThreadDrop(Object row) {
        try {
            String key=threadKey(DroppedThreadStatus.rowUrl(row,Haiagaru.applicationContextForExtension()));
            synchronized(nativeStatus){return Boolean.TRUE.equals(nativeStatus.get(key));}
        } catch(Exception ignored) {return false;}
    }
    private static boolean postHeading(Object row){
        if(row==null)return false;
        String name=row.getClass().getName();
        String method=name.startsWith("o.onAdDisplayed$")?"e":name.startsWith("o.Yy2$")?"d":"b";
        if(!(name.equals("o.onAdDisplayed$write")||name.equals("o.Yy2$ComponentActivity")
                ||name.equals("o.Yy2$write")||name.equals("o.getAvailabilityStatus$IconCompatParcelizer")
                ||name.equals("o.getAvailabilityStatus$RemoteActionCompatParcelizer")))return false;
        try{
            String text=(String)row.getClass().getMethod(method).invoke(row);
            return "下書き".equals(text)||"送信済み".equals(text)||"書き込んだスレ".equals(text)
                    ||"Drafts".equals(text)||"Sent".equals(text)||"Posted threads".equals(text);
        }catch(Exception ignored){return false;}
    }
    static boolean timeHeading(Object row){
        if(row==null)return false;String name=row.getClass().getName();
        return name.equals("o.onAdDisplayed$write")
                ||name.equals("o.Yy2$ComponentActivity")||name.equals("o.getAvailabilityStatus$RemoteActionCompatParcelizer");
    }
    static void removeEmptyTimeHeadings(List<?> rows){
        for(int i=rows.size()-1;i>=0;i--)if(timeHeading(rows.get(i))&&(i+1==rows.size()||timeHeading(rows.get(i+1))))rows.remove(i);
    }
    static boolean dropped(Object row)throws Exception{
        if(row==null)return false;
        String name=row.getClass().getName();String field;
        if(name.equals("o.onAdDisplayed$setIcon"))field="o";
        else if(name.equals("o.Yy2$open")||name.equals("o.getAvailabilityStatus$r8lambdawJ5MHcSJed_CjC7r4OWD0UxyJsQ"))field="l";
        else return false;
        Field state=row.getClass().getDeclaredField(field);state.setAccessible(true);
        return (state.getInt(row)&1)!=0;
    }
    static List<?> filter(List<?> source,int mode){
        return filter(source,mode,active(mode));
    }
    static List<?> filter(List<?> source,int mode,boolean active){
        if(source==null||!target(mode)||!active)return source;
        try{
            Context context=Haiagaru.applicationContextForExtension();
            // HOME history can hold an older copy with a zero flag. Zero means unknown,
            // not proof of a live thread; never erase positive native evidence with it.
            for(Object row:source)if(row!=null)rememberDrop(row,context);
            ArrayList<Object> out=new ArrayList<>();
            for(Object row:source){
                boolean hide=false;
                try {
                    Object post=Math.abs(mode)==104?postData(row):null;
                    if(post!=null)hide=option(sent(post)?SENT:DRAFTS)&&knownPostDrop(post);
                    else hide=(Math.abs(mode)!=104||option(SENT))&&(dropped(row)||knownThreadDrop(row)||DroppedThreadStatus.dropped(row));
                } catch(Exception error) {
                    // Keep only this unknown row, not every dropped row in the history.
                    android.util.Log.w("Haiagaru","DAT-drop row left unchanged",error);
                }
                if(!hide)out.add(row);
            }
            if(Math.abs(mode)==104&&out.size()!=source.size()){
                for(int i=out.size()-1;i>=0;i--)if(postHeading(out.get(i))
                        &&(i+1==out.size()||postHeading(out.get(i+1))))out.remove(i);
            }
            if(historyMode(mode)&&out.size()!=source.size())removeEmptyTimeHeadings(out);
            return out.size()==source.size()?source:out;
        }
        catch(Exception error){android.util.Log.w("Haiagaru","DAT-drop display filter left unchanged",error);return source;}
    }
    // Native legacy list wrappers are recreated during sorting. Remember their source to restore OFF.
    static List<?> source(Object wrapper,List<?> fallback){synchronized(originals){for(Original o:originals)if(o.wrapper.get()==wrapper)return o.source;return fallback;}}
    static void remember(Object wrapper,List<?> source){synchronized(originals){originals.removeIf(o->o.wrapper.get()==null||o.wrapper.get()==wrapper);if(originals.size()>=64)originals.remove(0);originals.add(new Original(wrapper,source));}}
    private HiddenDroppedThreads(){}
}
