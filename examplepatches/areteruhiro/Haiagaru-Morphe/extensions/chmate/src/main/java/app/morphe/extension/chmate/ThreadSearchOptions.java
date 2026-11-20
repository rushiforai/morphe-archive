package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.SharedPreferences;
import android.widget.LinearLayout;
import android.widget.Switch;
import android.widget.TextView;

/** Search projection options; response data and native search UI are unchanged. */
final class ThreadSearchOptions {
    static final String ID="threadSearchIncludeId",WACCHOI="threadSearchIncludeWacchoi",NAME="threadSearchIncludeName";
    static final String MENU_SEARCH="threadOverflowSearch",MENU_SELECTION="threadOverflowResponseSelection";
    static boolean menuEnabled(String key){
        android.content.Context c=Haiagaru.applicationContextForExtension();
        boolean fallback=MENU_SEARCH.equals(key)||MENU_SELECTION.equals(key);
        return c==null?fallback:c.getSharedPreferences(WacchoiSearchOptions.PREFS,0).getBoolean(key,fallback);
    }
    static boolean enabled(String key){
        android.content.Context c=Haiagaru.applicationContextForExtension();
        return c!=null&&c.getSharedPreferences(WacchoiSearchOptions.PREFS,0).getBoolean(key,false);
    }
    static void add(LinearLayout box,Activity activity){
        TextView title=new TextView(activity);title.setText("スレ内検索の対象（本文は常に対象）");box.addView(title);
        SharedPreferences prefs=activity.getSharedPreferences(WacchoiSearchOptions.PREFS,0);
        String[] menuKeys={MENU_SEARCH,MENU_SELECTION};
        String[] menuLabels={"3点メニューに検索を表示","3点メニューにレス複数選択を表示"};
        for(int i=0;i<menuKeys.length;i++){
            String key=menuKeys[i];Switch toggle=new Switch(activity);toggle.setText(menuLabels[i]);
            toggle.setChecked(prefs.getBoolean(key,true));toggle.setTag(SettingLinkEntry.KEY_TAG,key);box.addView(toggle);
            toggle.setOnCheckedChangeListener((v,on)->{prefs.edit().putBoolean(key,on).apply();activity.invalidateOptionsMenu();});
        }
        String[] keys={ID,WACCHOI,NAME},labels={"スレ内検索にIDを含める","スレ内検索にワッチョイを含める","スレ内検索に名前を含める"};
        for(int i=0;i<keys.length;i++){
            String key=keys[i];Switch toggle=new Switch(activity);toggle.setText(labels[i]);toggle.setChecked(prefs.getBoolean(key,false));box.addView(toggle);
            toggle.setTag(SettingLinkEntry.KEY_TAG,key);
            toggle.setOnCheckedChangeListener((v,on)->prefs.edit().putBoolean(key,on).apply());
        }
        TextView help=new TextView(activity);help.setText("変更後は検索し直してください。ヘッダーの日時・曜日は検索しません。OFFにした項目でも、本文に書かれた文字は検索されます。空白区切り・AND検索にも同じ対象設定を使います。");box.addView(help);
    }
    private ThreadSearchOptions(){}
}
