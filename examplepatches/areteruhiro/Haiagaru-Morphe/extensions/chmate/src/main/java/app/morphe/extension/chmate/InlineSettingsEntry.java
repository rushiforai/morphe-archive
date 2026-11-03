package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.util.Log;
import java.lang.reflect.*;
import java.lang.ref.WeakReference;
import java.util.*;

/** Inserts an ordinary native row before Safe mode; never changes screen margins. */
public final class InlineSettingsEntry {
    static final String KEY="haiagaru.settings.entry";
    private static final Map<Object,WeakReference<Object>> LEGACY=new WeakHashMap<>();
    private static int title(Context context){
        int id=context.getResources().getIdentifier("haiagaru_settings_entry","string",context.getPackageName());
        if(id==0)throw new IllegalStateException("Settings entry title missing");return id;
    }
    public static void legacy(Context context,Object screen){
        if(context==null||screen==null)return;
        try{
            ClassLoader loader=context.getClassLoader();
            Class<?> preference=Class.forName("androidx.preference.Preference",false,loader);
            Class<?> group=Class.forName("androidx.preference.PreferenceGroup",false,loader);
            WeakReference<Object> old=LEGACY.get(screen);Object previous=old==null?null:old.get();
            if(previous!=null)for(Method method:preference.getMethods())
                if(method.getReturnType()==group&&method.getParameterTypes().length==0&&method.invoke(previous)==screen)return;
            Object row=preference.getConstructor(Context.class).newInstance(context);
            preference.getMethod("f",int.class).invoke(row,title(context));
            // The verified legacy header builders add all native rows after this call.
            // Intent preferences use the standard click path without selecting a native subpage.
            Intent open=new Intent(context,HaiagaruSettingsActivity.class);
            for(Method method:preference.getMethods())if(method.getReturnType()==void.class
                &&Arrays.equals(method.getParameterTypes(),new Class<?>[]{Intent.class})){method.invoke(row,open);break;}
            group.getMethod("e",preference).invoke(screen,row);
            LEGACY.put(screen,new WeakReference<>(row));
        }catch(ReflectiveOperationException|RuntimeException error){Log.w("Haiagaru","Native settings entry unavailable",error);}
    }
    public static List<?> catalog242(List<?> original){
        Context context=Haiagaru.applicationContextForExtension();
        if(context==null||original==null||original.isEmpty())return original;
        try{
            Object safe=original.get(0);Class<?> type=safe.getClass();
            if(!"safe".equals(NativeFields.find(type,"e").get(safe)))return original;
            Constructor<?> ctor=type.getDeclaredConstructor(String.class,
                Class.forName("o.zzakg$read",false,context.getClassLoader()),int.class,String.class,
                Class.forName("o.zzakg$write",false,context.getClassLoader()),Integer.class,List.class);
            ctor.setAccessible(true);
            Object row=ctor.newInstance(KEY,NativeFields.find(type,"b").get(safe),title(context),
                NativeFields.find(type,"h").get(safe),NativeFields.find(type,"d").get(safe),
                NativeFields.find(type,"j").get(safe),Collections.emptyList());
            List<Object> result=new ArrayList<>(original);result.add(0,row);return Collections.unmodifiableList(result);
        }catch(ReflectiveOperationException|RuntimeException error){Log.w("Haiagaru","Native settings catalog unavailable",error);return original;}
    }
    public static boolean selectRow(Object row){
        if(row==null)return false;
        try{return select((String)NativeFields.find(row.getClass(),"e").get(row));}
        catch(ReflectiveOperationException|RuntimeException error){return false;}
    }
    public static boolean select(String key){
        if(!KEY.equals(key))return false;
        Activity activity=Haiagaru.toolbarActivity(null);
        if(activity!=null)Haiagaru.showSettingsDialog(activity);
        return true;
    }
    private InlineSettingsEntry(){}
}
