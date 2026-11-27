package local.privacy;

import android.view.View;

/** Keeps the original binding path while hiding page separators. */
public final class PageIndicator {
    private PageIndicator() { }

    public static void hide(View view, int originalVisibility) {
        if (view == null) return;
        view.setVisibility(SettingsState.get("hide_page_indicator") ? View.GONE : originalVisibility);
    }

    /** Applies the option to the complete Page N row on the 5.3.27 adapter. */
    public static void applyToPageItem(Object holder) {
        if (holder == null) return;
        try {
            Object itemView = holder.getClass().getField("itemView").get(holder);
            if (itemView instanceof View) {
                ((View) itemView).setVisibility(
                        SettingsState.get("hide_page_indicator") ? View.GONE : View.VISIBLE);
            }
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            // A changed view holder remains visible rather than breaking the list.
        }
    }
}
