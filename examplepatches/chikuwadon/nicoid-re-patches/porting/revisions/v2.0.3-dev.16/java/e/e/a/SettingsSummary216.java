package e.e.a;

import android.app.Activity;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import android.preference.ListPreference;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.preference.PreferenceGroup;
import android.preference.PreferenceManager;
import java.lang.ref.WeakReference;
import java.util.WeakHashMap;

/** Issue #132 and unified value : description presentation of six general settings. */
public final class SettingsSummary216 {
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static final WeakHashMap<PreferenceActivity,SharedPreferences.OnSharedPreferenceChangeListener>
        LISTENERS=new WeakHashMap<>();
    private static final String[] KEYS={
        "videolist_tap","intent_type",ExternalBack216.KEY,"app_switch_playback",
        "nicoid_app_resume_playback","back_playback"
    };
    private SettingsSummary216(){}

    public static void install(PreferenceActivity a){
        if(a==null||a.isFinishing())return;
        // Dev111 finalizes order and overwrites resume summaries synchronously.
        // Run after that method returns, then follow actual preference changes.
        a.getListView().post(()->attach(a));
    }

    static PreferenceGroup parent(PreferenceGroup group,Preference p){
        if(group==null||p==null)return null;
        for(int i=0;i<group.getPreferenceCount();i++){
            Preference child=group.getPreference(i);
            if(child==p)return group;
            if(child instanceof PreferenceGroup){
                PreferenceGroup found=parent((PreferenceGroup)child,p);
                if(found!=null)return found;
            }
        }
        return null;
    }

    private static String tr(Activity a,String ja,String en,String zh){
        return PanelUi.tr(a,ja,en,zh);
    }
    static String description(PreferenceActivity a,String key){
        switch(key){
        case "videolist_tap":
            return tr(a,"動画一覧をタップしたときに実行する操作",
                "Action when tapping a video in a list","點擊影片清單時執行的操作");
        case "intent_type":
            return tr(a,"他のアプリから動画リンクを開くときの起動方法",
                "How to open video links from other apps","從其他應用程式開啟影片連結的方式");
        case ExternalBack216.KEY:
            return tr(a,"外部リンクから開いた動画で戻るときの再生・画面の動作",
                "Playback and screen behavior on Back from an external link",
                "從外部連結開啟影片時返回的播放與畫面行為");
        case "app_switch_playback":
            return tr(a,"他のアプリへ切り替えたときの再生方法",
                "Playback behavior when switching to another app","切換至其他應用程式時的播放行為");
        case "nicoid_app_resume_playback":
            return tr(a,"nicoidへ復帰したときの再生方法",
                "Playback behavior when returning to nicoid","返回nicoid時的播放行為");
        case "back_playback":
            return tr(a,"nicoid内で再生中に戻るときの動作",
                "Behavior on Back during playback inside nicoid","在nicoid內播放時返回的行為");
        default:return "";
        }
    }
    static String display(PreferenceActivity a,ListPreference p,String key){
        CharSequence entry=p.getEntry();
        if(entry==null){
            String value=PreferenceManager.getDefaultSharedPreferences(a).getString(key,"");
            int index=p.findIndexOfValue(value);
            if(index>=0&&p.getEntries()!=null)entry=p.getEntries()[index];
        }
        String value=entry==null?"":entry.toString();
        String description=description(a,key);
        return value.isEmpty()?description:value+"："+description;
    }
    static void refresh(PreferenceActivity a){
        for(String key:KEYS){
            Preference p=a.findPreference(key);
            if(p instanceof ListPreference)p.setSummary(display(a,(ListPreference)p,key));
        }
    }
    private static void attach(PreferenceActivity a){
        if(a.isFinishing()||a.isDestroyed())return;
        PreferenceGroup root=a.getPreferenceScreen();
        Preference link=root==null?null:a.findPreference("intent_type");
        PreferenceGroup group=parent(root,link);
        if(group==null){
            Preference p=a.findPreference("setting_whole");
            if(p instanceof PreferenceGroup)group=(PreferenceGroup)p;
        }
        if(group==null)return;
        if(a.findPreference(ExternalBack216.KEY)==null){
            ListPreference option=new ListPreference(a);
            option.setKey(ExternalBack216.KEY);
            option.setTitle(tr(a,"リンクから起動した場合の戻る動作",
                 "Back action when opened from a link","從外部連結開啟後的返回行為"));
            option.setEntries(new CharSequence[]{
                tr(a,"通常の設定に従う","Follow normal Back setting","沿用一般返回設定"),
                tr(a,"再生を終了して戻る","Stop playback and return","停止播放並返回"),
                tr(a,"バックグラウンド再生して戻る","Continue playback in background","背景播放並返回"),
                tr(a,"ポップアップ再生して戻る","Continue in popup","以懸浮視窗播放並返回"),
                tr(a,"nicoidの画面に戻る","Return to nicoid","返回nicoid")
            });
            option.setEntryValues(new CharSequence[]{"inherit","stop","background","popup","nicoid"});
            option.setDefaultValue("inherit");
            int order=link==null?group.getPreferenceCount()*10:link.getOrder()+1;
            option.setOrder(order);
            group.addPreference(option);
        }
        refresh(a);
        SharedPreferences p=PreferenceManager.getDefaultSharedPreferences(a);
        SharedPreferences.OnSharedPreferenceChangeListener old=LISTENERS.remove(a);
        if(old!=null)p.unregisterOnSharedPreferenceChangeListener(old);
        WeakReference<PreferenceActivity> weak=new WeakReference<>(a);
        SharedPreferences.OnSharedPreferenceChangeListener listener=(prefs,key)->{
            boolean matched=false;
            for(String expected:KEYS)if(expected.equals(key)){matched=true;break;}
            if(!matched)return;
            MAIN.post(()->{
                PreferenceActivity current=weak.get();
                if(current!=null&&!current.isFinishing()&&!current.isDestroyed())refresh(current);
            });
        };
        p.registerOnSharedPreferenceChangeListener(listener);
        LISTENERS.put(a,listener);
    }
}
