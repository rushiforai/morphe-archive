package e.e.a;

import android.content.SharedPreferences;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;

/** Independent placement of the NicoLive HUB action bar around bottom navigation. */
final class NicoliveAppBarPlacement {
    static final String KEY = "nicoid_live_app_bar_position";
    static final String[] LABELS = {
            "上部（従来どおり）",
            "下部：ナビゲーションの上",
            "下部：ナビゲーションの下"
    };
    private NicoliveAppBarPlacement() {}

    static int position(SharedPreferences preferences) {
        int value = preferences.getInt(KEY, 0);
        return value >= 0 && value <= 2 ? value : 0;
    }

    static void place(LinearLayout root, LinearLayout body, View bar, int position) {
        if (root == null || body == null || bar == null) return;
        if (position < 0 || position > 2) position = 0;
        ViewGroup existing = bar.getParent() instanceof ViewGroup
                ? (ViewGroup)bar.getParent() : null;
        int wantedIndex = position == 0 ? 0
                : position == 1 ? Math.max(0, body.getChildCount() - (existing == body ? 2 : 1))
                : body.getChildCount() - (existing == body ? 1 : 0);
        ViewGroup target = position == 0 ? root : body;
        if (existing == target && target.indexOfChild(bar) == wantedIndex) return;
        if (existing != null) existing.removeView(bar);
        LinearLayout.LayoutParams params =
                new LinearLayout.LayoutParams(-1, NicoliveUi.dp(body.getContext(), 48));
        if (target == root) root.addView(bar, 0, params);
        else body.addView(bar, position == 1 ? body.getChildCount() - 1 : body.getChildCount(), params);
    }
}
