package app.afterglow.extension.navigation;

import android.view.View;
import java.util.List;

/** Implemented on the verified native pivot controller by NativeTabsPatch. */
public interface NativeTabHost {
    View afterglow_tabRoot();
    List<?> afterglow_tabItems();
    List<?> afterglow_tabViews();
    void afterglow_replaceTabs(List<?> items);
    void afterglow_rebuildTabs();
}
