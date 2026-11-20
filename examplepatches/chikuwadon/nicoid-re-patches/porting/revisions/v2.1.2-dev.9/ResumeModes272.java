package e.e.a;

import android.app.Activity;
import android.app.Service;
import android.content.Context;
import android.content.SharedPreferences;
import android.preference.ListPreference;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.preference.PreferenceGroup;
import android.preference.PreferenceManager;
import android.util.Log;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Locale;

/** Separate resume preferences for the actual live background and popup presentation. */
public final class ResumeModes272 {
    public static final String LEGACY = "nicoid_app_resume_playback";
    public static final String BG = "nicoid_app_resume_background";
    public static final String POP = "nicoid_app_resume_popup";
    private static final String MIGRATED = "nicoid_app_resume_split_272";
    private static final String KEEP = "background", NORMAL = "normal", FULL = "nicoid_fullscreen262";
    private static final String TAG = "nicoid-resume-modes";
    private ResumeModes272() {}

    private static String tr(Context c, String ja, String en, String zh) {
        try {
            Object value=Class.forName("e.e.a.PanelUi").getMethod("tr",Context.class,String.class,String.class,String.class)
                    .invoke(null,c,ja,en,zh);
            if(value instanceof String)return (String)value;
        } catch (Exception ignored) { }
        try {
            String lang=PreferenceManager.getDefaultSharedPreferences(c).getString("app_lang","-1");
            if("1".equals(lang)||"en".equals(lang))return en;
            if("2".equals(lang)||"zh".equals(lang))return zh;
            if("0".equals(lang)||"ja".equals(lang))return ja;
        } catch (RuntimeException ignored) { }
        String language=Locale.getDefault().getLanguage();
        return "zh".equals(language)?zh:"en".equals(language)?en:ja;
    }
    private static String valid(String choice) {
        if(FULL.equals(choice)||NORMAL.equals(choice))return choice;
        return KEEP;
    }
    private static String oldChoice(SharedPreferences p) {
        String value=valid(p.getString(LEGACY,KEEP));
        if(NORMAL.equals(value)&&p.getBoolean("nicoid_fullscreen_resume262",false))return FULL;
        return value;
    }
    private static String initial(SharedPreferences p,String key) {
        String current=p.getString(key,null);
        if(current!=null)return valid(current);
        String switchMode=p.getString("app_switch_playback","none");
        String old=oldChoice(p);
        if(POP.equals(key))return "popup".equals(switchMode)?old:KEEP;
        return "popup".equals(switchMode)?KEEP:old;
    }
    private static void migrate(SharedPreferences p) {
        if(p.getBoolean(MIGRATED,false))return;
        String background=initial(p,BG),popup=initial(p,POP);
        SharedPreferences.Editor e=p.edit();
        if(!p.contains(BG))e.putString(BG,background);
        if(!p.contains(POP))e.putString(POP,popup);
        e.putBoolean(MIGRATED,true).apply();
    }
    private static PreferenceGroup owner(PreferenceGroup group,Preference child) {
        if(group==null)return null;
        for(int i=0;i<group.getPreferenceCount();i++) {
            Preference p=group.getPreference(i);
            if(p==child)return group;
            if(p instanceof PreferenceGroup) {
                PreferenceGroup result=owner((PreferenceGroup)p,child);
                if(result!=null)return result;
            }
        }
        return null;
    }
    private static boolean validActivity(Activity a) {
        return a!=null&&!a.isFinishing()&&!a.isDestroyed();
    }
    /** Always place the popup setting alongside the background setting after the
     *  settings categorizer has reparented the original preferences. */
    public static void reparent(PreferenceActivity activity) {
        if (!validActivity(activity) || activity.getPreferenceScreen()==null) return;
        Preference background=activity.findPreference(LEGACY);
        Preference popup=activity.findPreference(POP);
        if (background==null || popup==null || background==popup) return;
        PreferenceGroup root=activity.getPreferenceScreen();
        PreferenceGroup destination=owner(root,background);
        PreferenceGroup source=owner(root,popup);
        if (destination==null || source==null) return;
        int order=background.getOrder();
        if (order<Integer.MAX_VALUE-1) popup.setOrder(order+1);
        if (source!=destination) {
            if (!source.removePreference(popup)) return;
            destination.addPreference(popup);
            Log.i(TAG,"Popup return setting reparented beside background return setting");
        } else {
            // PreferenceGroup sorts on insertion, not when setOrder() changes.
            source.removePreference(popup);
            destination.addPreference(popup);
        }
    }
    public static void refresh(PreferenceActivity a) {
        if(!validActivity(a))return;
        Preference found=a.findPreference(LEGACY);
        if(!(found instanceof ListPreference))return;
        SharedPreferences p=PreferenceManager.getDefaultSharedPreferences(a);
        migrate(p);
        ListPreference background=(ListPreference)found;
        Preference foundPopup=a.findPreference(POP);
        ListPreference popup;
        if(foundPopup instanceof ListPreference)popup=(ListPreference)foundPopup;
        else {
            PreferenceGroup parent=owner(a.getPreferenceScreen(),background);
            if(parent==null)return;
            popup=new ListPreference(a);
            popup.setKey(POP);
            // Keep every existing item in place, add only the second resume policy.
            if(background.getOrder()<Integer.MAX_VALUE-1)popup.setOrder(background.getOrder()+1);
            parent.addPreference(popup);
        }
        configure(a,p,background,BG,
            tr(a,"バックグラウンド再生からの復帰時の動作","When returning from background playback","從背景播放返回時的行為"),
            tr(a,"バックグラウンド再生を維持","Keep background playback","維持背景播放"),
            tr(a,"バックグラウンド再生中にアプリへ戻った場合の動作","Choose what happens when returning to the app from background playback","從背景播放返回應用程式時的動作"));
        configure(a,p,popup,POP,
            tr(a,"ポップアップ再生からの復帰時の動作","When returning from popup playback","從彈出視窗播放返回時的行為"),
            tr(a,"ポップアップ再生を維持","Keep popup playback","維持彈出視窗播放"),
            tr(a,"ポップアップ再生中にアプリへ戻った場合の動作","Choose what happens when returning to the app from popup playback","從彈出視窗播放返回應用程式時的動作"));
        reparent(a);
    }
    private static void configure(PreferenceActivity activity,SharedPreferences prefs,ListPreference list,
                                   String key,String title,String keep,String explanation) {
        final String normal=tr(activity,"通常再生に戻る","Return to normal playback","返回一般播放");
        final String full=tr(activity,"全画面再生に戻る","Return to fullscreen playback","返回全螢幕播放");
        list.setTitle(title);
        list.setEnabled(true);
        list.setEntries(new CharSequence[]{keep,normal,full});
        list.setEntryValues(new CharSequence[]{KEEP,NORMAL,FULL});
        list.setPersistent(false);
        list.setValue(valid(prefs.getString(key,KEEP)));
        setSummary(activity,list,explanation);
        list.setOnPreferenceChangeListener((preference,newValue)->{
            String value=valid(String.valueOf(newValue));
            if(list.findIndexOfValue(value)<0)return false;
            SharedPreferences.Editor e=prefs.edit().putString(key,value);
            // Keep the old native preference value usable for older app exports.
            if(BG.equals(key)) {
                e.putString(LEGACY,FULL.equals(value)?NORMAL:value);
                e.putBoolean("nicoid_fullscreen_resume262",FULL.equals(value));
            }
            e.apply();
            list.setValue(value);
            setSummary(activity,list,explanation);
            return false;
        });
    }
    private static void setSummary(Context c,ListPreference list,String explanation) {
        CharSequence entry=list.getEntry();
        list.setSummary(String.valueOf(entry)+tr(c,"：",": ","：")+explanation);
    }
    private static Field field(Class<?> cls,String name)throws Exception{
        for(Class<?> c=cls;c!=null;c=c.getSuperclass())try{
            Field f=c.getDeclaredField(name);f.setAccessible(true);return f;
        }catch(NoSuchFieldException ignored){}
        throw new NoSuchFieldException(name);
    }
    private static Service currentService() {
        try{
            Class<?> type=Class.forName("e.e.a.AppResume253");
            Method m=type.getDeclaredMethod("service");m.setAccessible(true);
            Object service=m.invoke(null);return service instanceof Service?(Service)service:null;
        }catch(Exception ignored){return null;}
    }
    private static boolean directMini() {
        try {return field(Class.forName("e.e.a.DirectBackground235"),"active").get(null)!=null;}
        catch(Exception ignored){return false;}
    }
    private static boolean inAppMini() {
        try {
            Object value=Class.forName("e.e.a.MiniSession225").getMethod("showing").invoke(null);
            return Boolean.TRUE.equals(value);
        }catch(Exception ignored){return false;}
    }
    /** An actual retained session counts regardless of the switch-time preference. */
    public static boolean shouldArm(String switchMode) {
        return "background".equals(switchMode)||"popup".equals(switchMode)
                ||currentService()!=null||directMini()||inAppMini();
    }
    /** A background service has its isBackgroundPlay flag; popup is independent. */
    private static boolean popupService(Service service) {
        if(service==null)return false;
        if(directMini())return false;
        try {return !service.getClass().getField("p0").getBoolean(null);}
        catch(Exception error){Log.w(TAG,"Cannot classify playback service; preserving background policy",error);return false;}
    }
    public static String selection(SharedPreferences prefs) {
        Service service=currentService();
        String key=popupService(service)?POP:BG;
        return initial(prefs,key);
    }
}
