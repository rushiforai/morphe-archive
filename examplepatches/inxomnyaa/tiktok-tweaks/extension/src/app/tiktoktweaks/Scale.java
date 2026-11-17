package app.tiktoktweaks;

import android.content.Context;
import android.content.res.Configuration;
import android.view.View;
import android.view.ViewGroup;
import androidx.lifecycle.MutableLiveData;
import com.ss.android.ugc.aweme.notice.repo.list.bean.GroupFilterStruct;
import com.ss.android.ugc.aweme.notice.repo.list.bean.InboxEntranceCell;
import com.ss.android.ugc.aweme.notice.repo.list.bean.KeyValueHolder;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/** Per-activity UI and text scaling, plus hiding the Tako feed button. */
public final class Scale {
    private Scale() {}

    /** Called from the activity base class's attachBaseContext. 100% leaves the context untouched. */
    public static Context wrap(Context base) {
        try {
            Prefs.init(base);
            int ui = Prefs.number(Prefs.UI_SCALE, 100);
            if (ui >= 100) return base;
            Configuration config = new Configuration(base.getResources().getConfiguration());
            float factor = ui / 100f;
            config.densityDpi = Math.round(config.densityDpi * factor);
            config.screenWidthDp = Math.round(config.screenWidthDp / factor);
            config.screenHeightDp = Math.round(config.screenHeightDp / factor);
            config.smallestScreenWidthDp = Math.round(config.smallestScreenWidthDp / factor);
            return base.createConfigurationContext(config);
        } catch (Throwable t) {
            return base;
        }
    }

    /** Removes hidden tabs from the home top bar's tag list, covering TikTok's server-driven rules. */
    public static ArrayList<String> filterTopTabs(ArrayList<String> tabs) {
        if (tabs == null) return null;
        ArrayList<String> kept = new ArrayList<>(tabs.size());
        for (String tab : tabs) {
            String name = tab == null ? "" : tab.toLowerCase(Locale.ROOT);
            boolean shop = name.equals("shop") || name.contains("homepage_mall");
            boolean ai = name.contains("tako") || name.contains("aidrama") || name.contains("ai_drama") || name.contains("ai_series");
            if (!(shop && Prefs.hideShop()) && !(ai && Prefs.hideTako())) kept.add(tab);
        }
        return kept;
    }

    /** Pre-selects Comments the same way tapping the dropdown option does. */
    public static void seedActivity(Object viewModel) {
        if (!Prefs.activityOnComments()) return;
        try {
            int group = Class.forName("X.0Cwe").getField("LIZLLL").getInt(null);
            MutableLiveData<Object> selected = new MutableLiveData<>();
            selected.setValue(new GroupFilterStruct(group, 2131840117, 2130772803, 2131840105, 2131840104, 2130774143));
            Field field = viewModel.getClass().getDeclaredField("LLJJIJIIJIL");
            field.setAccessible(true);
            field.set(viewModel, selected);
        } catch (Throwable ignored) {
            // Falls back to TikTok's normal All activity list.
        }
    }

    /** Removes Tako's entries from the inbox list; other items pass through untouched. */
    public static List<Object> filterInbox(List<Object> cells) {
        if (cells == null || cells.isEmpty() || !Prefs.hideTako()) return cells;
        try {
            ArrayList<Object> kept = new ArrayList<>(cells.size());
            for (Object cell : cells) {
                if (!(cell instanceof InboxEntranceCell) || !isTako((InboxEntranceCell) cell)) kept.add(cell);
            }
            return kept.size() == cells.size() ? cells : kept;
        } catch (Throwable t) {
            return cells;
        }
    }

    private static boolean isTako(InboxEntranceCell cell) {
        if (cell.entranceKey != null && cell.entranceKey.toLowerCase(Locale.ROOT).contains("tako")) return true;
        if (cell.eventTrackingExtra == null) return false;
        for (KeyValueHolder extra : cell.eventTrackingExtra) {
            if (extra != null && extra.key != null && extra.key.startsWith("tako_")) return true;
        }
        return false;
    }

    /** Collapses the view rather than using GONE, which TikTok re-sets while binding. */
    public static void hideTako(View view) {
        if (view == null || !Prefs.hideTako()) return;
        ViewGroup.LayoutParams params = view.getLayoutParams();
        if (params != null) {
            params.width = 0;
            params.height = 0;
            view.setLayoutParams(params);
        }
        view.setAlpha(0f);
        view.setClickable(false);
        view.setEnabled(false);
    }
}
