package app.morphe.extension.chmate;
import android.app.Activity;
import android.widget.LinearLayout;
import android.widget.Switch;
import android.widget.TextView;
/** Display-only options, independent of native filter states. */
final class QuickFilterOptions {
    static boolean counts(){return FeatureSwitches.enabled("quickFilterCounts",false);}
    static boolean extras(){return FeatureSwitches.enabled("quickFilterExtras",true);}
    static boolean bottom(){return FeatureSwitches.enabled("bottomQuickFilterPanel",false);}
    static boolean pinned(){return FeatureSwitches.enabled("persistentBottomQuickFilters",false);}
    static boolean visible(int index){return index>=0&&index<7&&(index<4 || extras()&&FeatureSwitches.enabled(new String[]{"quickFilterAA","quickFilterMine","quickFilterReplies"}[index-4],true));}
    static void addSettings(LinearLayout root,Activity activity){
        add(root,activity,"quickFilterCounts","フィルターに件数を表示",false);
        add(root,activity,"quickFilterExtras","フィルターにAA・自分・返信を追加",true);
        add(root,activity,"quickFilterAA","AAフィルターを追加",true);
        add(root,activity,"quickFilterMine","自分フィルターを追加",true);
        add(root,activity,"quickFilterReplies","返信フィルターを追加",true);
        add(root,activity,"bottomQuickFilterPanel","下部フィルターパネルを使う（外側タップで閉じる）",false);
        add(root,activity,"persistentBottomQuickFilters","下部フィルターを常に表示",false);
        TextView pinnedHelp=new TextView(activity);pinnedHelp.setText("スレ本文の下端にフィルターを固定します。外側をタップしても閉じず、上部フィルターとも併用できます。オフにすると固定表示を解除します。");root.addView(pinnedHelp);
        add(root,activity,"floatingQuickFilterButton","フィルターのフローティングボタンを表示",false);
        TextView help=new TextView(activity);help.setText("上部フィルターと下部パネルは個別に表示できます。下部パネルは上部フィルターを隠しません。長押ししてドラッグすると位置を変更できます。必死チェッカーの表示領域は「同じIDの投稿を調べる」設定で上部タイトルを省略して広げられます。");root.addView(help);
    }
    static void showToolbarSettings(Activity activity){
        LinearLayout panel=new LinearLayout(activity);panel.setOrientation(1);addSettings(panel,activity);
        new HaiagaruDialog.Builder(activity).setTitle("フィルターの設定").setView(panel).setPositiveButton("閉じる",null).show();
    }
    static void addToolbarEntry(LinearLayout root,Activity activity){android.widget.Button button=new android.widget.Button(activity);button.setText("ツールバーとフィルターの設定");button.setOnClickListener(v->showToolbarSettings(activity));root.addView(button);
        android.widget.TextView help=new android.widget.TextView(activity);help.setText("件数は読み込み済みの全レスです。AA・自分・返信は既存のフィルターに重ねて絞り込みます。画像の長押しで画像一覧を開きます。");root.addView(help);}
    private static void add(LinearLayout root,Activity activity,String key,String label,boolean initial){
        Switch toggle=new Switch(activity);toggle.setText(label);
        android.content.SharedPreferences prefs=activity.getSharedPreferences(WacchoiSearchOptions.PREFS,0);
        toggle.setChecked(prefs.getBoolean(key,initial));root.addView(toggle);
        toggle.setOnCheckedChangeListener((button,on)->{prefs.edit().putBoolean(key,on).apply();ExtraQuickFilters.updateOptions(activity);});
    }
    private QuickFilterOptions(){}
}
