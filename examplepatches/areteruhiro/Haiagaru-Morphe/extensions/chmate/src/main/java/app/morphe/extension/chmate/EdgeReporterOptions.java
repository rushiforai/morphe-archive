package app.morphe.extension.chmate;

import android.content.Context;
import android.content.SharedPreferences;

/** Independent display scopes; acquired metadata remains available to either scope. */
final class EdgeReporterOptions {
    static final String MENU="edgeReporterId",BOARD="edgeReporterBoardList";
    static final String MENU_LABEL="エッヂ・kenmo.org記者ID：長押し/NG Threads時に追加";
    static final String BOARD_LABEL="エッヂ・kenmo.org記者ID：板のスレ一覧に追加";
    static void initialize(Context c){
        SharedPreferences p=c.getSharedPreferences(WacchoiSearchOptions.PREFS,0);
        if(!p.contains(BOARD))p.edit().putBoolean(BOARD,p.getBoolean(MENU,true)).apply();
    }
    static boolean menu(){return FeatureSwitches.enabled(MENU,true);}
    static boolean board(){return FeatureSwitches.enabled(BOARD,menu());}
    static boolean fetch(){return menu()||board();}
    private EdgeReporterOptions(){}
}
