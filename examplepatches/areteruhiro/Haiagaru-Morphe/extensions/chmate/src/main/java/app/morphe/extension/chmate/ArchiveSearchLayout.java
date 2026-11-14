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
    public static boolean originalSite(Context context){return SettingsProfiles.prefs(context).getBoolean(ORIGINAL_SITE,false);}
    private ArchiveSearchLayout() { }
}
