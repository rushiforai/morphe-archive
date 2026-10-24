package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.Context;

/** Shared by both the detailed settings and the feature-switch index. */
final class SettingsEffects {
    static boolean needsRestart(String key){
        // Existing native views/catalogs and process-start hooks retain these values.
        return "hideAd".equals(key)||"removeMonaKey".equals(key)
                ||"chtoio".equals(key)||"topAlignShortThreads".equals(key)
                ||"compactQuickFilters".equals(key)||"threadCommandsEnabled".equals(key)
                ||"imageViewerRotationButton".equals(key)
                // Native response filters are assembled when a thread is opened.
                // Invalidating the settings layout cannot rebuild those filters.
                ||"copipeNg2".equals(key)||"arashiNg".equals(key)||"abbrevSingleId".equals(key);
    }
    static void changed(Context context,String key,boolean on){
        if(HiddenNgUnread.KEY.equals(key)){HiddenNgUnread.clear();Haiagaru.refreshBoardListAfterReadSortChange();}
        if("forceHttps".equals(key))HttpsTransport.setEnabled(on);
        if(!on&&("wacchoiSearchEnabled".equals(key)||"wacchoiBackgroundSearch".equals(key))){
            for(WacchoiBackgroundJob job:WacchoiSearchService.jobs().values())if(job.running)job.cancel();
        }
        if("readThreadsFirst".equals(key)||HiddenDroppedThreads.KEY.equals(key)||HiddenDroppedThreads.DRAFTS.equals(key)
                ||HiddenDroppedThreads.SENT.equals(key)||"groupBrowsingHistoryByBoard".equals(key)
                ||EdgeReporterOptions.MENU.equals(key)||EdgeReporterOptions.BOARD.equals(key))
            Haiagaru.refreshBoardListAfterReadSortChange();
        if(needsRestart(key)&&context instanceof Activity)SettingsRestart.confirm((Activity)context);
    }
    private SettingsEffects(){}
}
