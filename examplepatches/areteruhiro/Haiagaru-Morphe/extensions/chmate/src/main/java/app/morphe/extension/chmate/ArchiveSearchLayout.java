package app.morphe.extension.chmate;

import android.content.Context;
import android.content.SharedPreferences;

/** Saved proportions adapt to phone, tablet and keyboard viewport sizes. */
public final class ArchiveSearchLayout {
    public static final String HEIGHT="searchPanePercent", LOCKED="searchPaneLocked";
    public static final String ORIGINAL_SITE="eddiArchiveOriginalSite";
    public static final int MIN_PERCENT=3, MAX_PERCENT=70;
    static SharedPreferences prefs(Context context){return context.getSharedPreferences("haiagaru_eddi_search",0);}
    public static int clamp(int percent){return Math.max(MIN_PERCENT,Math.min(MAX_PERCENT,percent));}
    public static int height(Context context,boolean embedded){return clamp(prefs(context).getInt(HEIGHT,embedded?30:40));}
    public static boolean locked(Context context){return prefs(context).getBoolean(LOCKED,false);}
    public static void saveHeight(Context context,int value){prefs(context).edit().putInt(HEIGHT,clamp(value)).apply();}
    /** New installs open Edge archives in viewer 1 unless the user chooses viewer 2. */
    public static boolean originalSite(Context context){return SettingsProfiles.prefs(context).getBoolean(ORIGINAL_SITE,false);}
    static void choose(android.app.Activity activity){
        new HaiagaruDialog.Builder(activity).setTitle("エッヂ過去ログの専用ビューア")
            .setSingleChoiceItems(new String[]{"専用ビューア1（従来の検索画面・標準）","専用ビューア2（元サイト表示）"},originalSite(activity)?1:0,(dialog,which)->{
                SettingsProfiles.prefs(activity).edit().putBoolean(ORIGINAL_SITE,which==1).apply();dialog.dismiss();
                android.widget.Toast.makeText(activity,"次に開く過去ログ検索から反映します",android.widget.Toast.LENGTH_SHORT).show();
            }).setNegativeButton("閉じる",null).show();
    }
    private ArchiveSearchLayout() { }
}
