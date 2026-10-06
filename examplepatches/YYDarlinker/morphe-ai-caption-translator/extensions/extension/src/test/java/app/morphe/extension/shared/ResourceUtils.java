package app.morphe.extension.shared;
import android.content.Context;
/** Matches official lookup semantics, including the locale argument not being applied by getStringByLocale. */
public final class ResourceUtils {
    public static Context activity;
    public static int getStringIdentifier(String name){return activity==null?0:activity.getResources().getIdentifier(name,"string",activity.getPackageName());}
    public static String getString(String name){int id=getStringIdentifier(name);return id==0?name:activity.getString(id);}
    public static String getStringByLocale(String name,java.util.Locale ignored){return getString(name);}
}
