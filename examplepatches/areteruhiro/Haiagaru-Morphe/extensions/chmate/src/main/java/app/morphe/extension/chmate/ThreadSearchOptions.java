package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.SharedPreferences;
import android.widget.LinearLayout;
import android.widget.Switch;
import android.widget.TextView;

/** Search projection options; response data and native search UI are unchanged. */
final class ThreadSearchOptions {
    static final String ID="threadSearchIncludeId",WACCHOI="threadSearchIncludeWacchoi",NAME="threadSearchIncludeName";
    static boolean enabled(String key){
        android.content.Context c=Haiagaru.applicationContextForExtension();
        return c==null||c.getSharedPreferences(WacchoiSearchOptions.PREFS,0).getBoolean(key,true);
    }
    static void add(LinearLayout box,Activity activity){
        TextView title=new TextView(activity);title.setText("スレ内検索の対象（本文は常に対象）");box.addView(title);
        SharedPreferences prefs=activity.getSharedPreferences(WacchoiSearchOptions.PREFS,0);
        String[] keys={ID,WACCHOI,NAME},labels={"スレ内検索にIDを含める","スレ内検索にワッチョイを含める","スレ内検索に名前を含める"};
        for(int i=0;i<keys.length;i++){
            String key=keys[i];Switch toggle=new Switch(activity);toggle.setText(labels[i]);toggle.setChecked(prefs.getBoolean(key,true));box.addView(toggle);
            toggle.setOnCheckedChangeListener((v,on)->prefs.edit().putBoolean(key,on).apply());
        }
        TextView help=new TextView(activity);help.setText("変更後は検索し直してください。OFFにした項目でも、本文に書かれた文字は検索されます。空白区切り・AND検索にも同じ対象設定を使います。");box.addView(help);
    }
    private ThreadSearchOptions(){}
}
