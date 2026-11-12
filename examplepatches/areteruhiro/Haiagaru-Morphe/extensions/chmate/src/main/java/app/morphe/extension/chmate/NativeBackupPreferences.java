package app.morphe.extension.chmate;

import android.content.Context;
import android.content.SharedPreferences;
import java.io.File;

/** Canonical names inside the native backup; runtime preference stores stay package-local. */
public final class NativeBackupPreferences {
    static final String ORIGINAL="jp.co.airfront.android.a2chMate_preferences";
    private static String packageName(){Context context=Haiagaru.applicationContextForExtension();return context==null?"jp.co.airfront.android.a2chMate":context.getPackageName();}
    public static File exportFile(File parent,String name){
        if(parent!=null&&parent.getName().equals("shared_prefs")&&name.equals(ORIGINAL+".xml")) {
            // This is the real app data directory supplied by native backup, not a ZIP path.
            File data=parent.getParentFile();String pkg=data==null?packageName():data.getName();
            if(pkg.matches("[A-Za-z][A-Za-z0-9_]*(?:\\.[A-Za-z0-9_]+)+"))return new File(parent,pkg+"_preferences.xml");
        }
        return new File(parent,name);
    }
    public static File restoreFile(File parent,String name){return restoreFile(parent,name,packageName());}
    static File restoreFile(File parent,String name,String pkg){
        File canonical=new File(parent,name);
        if(parent!=null&&parent.getName().equals("prefs")&&name.equals(ORIGINAL+".xml")&&!canonical.exists()) {
            File legacy=new File(parent,pkg+"_preferences.xml");if(legacy.isFile())return legacy;
        }
        return canonical;
    }
    public static SharedPreferences preferences(Context context,String name,int mode){
        return context.getSharedPreferences(ORIGINAL.equals(name)?context.getPackageName()+"_preferences":name,mode);
    }
    private NativeBackupPreferences(){}
}
