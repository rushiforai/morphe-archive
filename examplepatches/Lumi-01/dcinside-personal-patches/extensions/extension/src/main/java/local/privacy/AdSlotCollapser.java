package local.privacy;

import android.view.View;
import java.lang.reflect.Method;

/** Removes reserved height from reviewed native ad-only containers. */
public final class AdSlotCollapser {
    private AdSlotCollapser() { }

    public static void collapseGalleryAds(Object fragment) {
        if (!SettingsState.get("block_app_ad_loaders") || fragment == null) return;
        try {
            Method getView = fragment.getClass().getMethod("getView");
            Object root = getView.invoke(fragment);
            if (!(root instanceof View)) return;
            View view = (View) root;
            collapse(view, "ad_container_view");
            collapse(view, "list_quick_ad_wrap");
            collapse(view, "list_quick_ad_wrap_bg");
            collapse(view, "list_quick_ad_wrap_divider");
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            // Fail open if the app changes its fragment layout.
        }
    }

    public static void collapseReadFooterAds(View root) {
        if (!SettingsState.get("block_app_ad_loaders") || root == null) return;
        collapse(root, "read_footer_ad_container");
        collapse(root, "read_footer_banner_container");
    }

    public static void collapsePageAd(Object holder) {
        if (!SettingsState.get("block_app_ad_loaders") || holder == null) return;
        try {
            Object itemView = holder.getClass().getField("itemView").get(holder);
            if (itemView instanceof View) collapse((View) itemView, "post_list_item_page_ad_container");
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            // Keep a changed ad row intact rather than risking a list failure.
        }
    }

    private static void collapse(View root, String resourceName) {
        int id = root.getResources().getIdentifier(resourceName, "id", root.getContext().getPackageName());
        if (id == 0) return;
        View view = root.findViewById(id);
        if (view == null) return;
        view.setVisibility(View.GONE);
        view.setMinimumHeight(0);
    }
}
