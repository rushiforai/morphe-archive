// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader.settings;

import static app.morphe.extension.shared.StringRef.str;

import android.content.Context;
import android.graphics.Color;
import android.util.TypedValue;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;

import java.lang.reflect.Field;

import app.morphe.extension.shared.ResourceType;
import app.morphe.extension.shared.ResourceUtils;
import app.morphe.extension.shared.Utils;
import io.github.joancomasfdz.extension.baconreader.errors.ErrorDialog;

/**
 * Shows the version of the patches at the bottom of the drawer, to tell which build is installed.
 */
@SuppressWarnings("unused")
public final class DrawerVersionFooter {
    /** Marks the footer, which each drawer gets once. */
    private static final String FOOTER_TAG = "baconreader_patches_version";

    private DrawerVersionFooter() {
    }

    /**
     * Injection point. Called at the start of DrawerHandler.updateDrawer, which runs when the drawer is made and
     * again on each change.
     */
    public static void addVersionFooter(Object drawerHandler) {
        try {
            Field listField = drawerHandler.getClass().getDeclaredField("listView");
            listField.setAccessible(true);
            ListView list = (ListView) listField.get(drawerHandler);
            if (list == null || !(list.getParent() instanceof LinearLayout)) return;
            LinearLayout drawer = (LinearLayout) list.getParent();
            if (drawer.findViewWithTag(FOOTER_TAG) != null) return;

            Context context = list.getContext();
            int color = Color.GRAY;
            int textColor = ResourceUtils.getIdentifier(ResourceType.ATTR, "textColor");
            TypedValue value = new TypedValue();
            if (textColor != 0 && context.getTheme().resolveAttribute(textColor, value, true)) color = value.data;
            float density = context.getResources().getDisplayMetrics().density;

            LinearLayout footer = new LinearLayout(context);
            footer.setOrientation(LinearLayout.VERTICAL);
            footer.setTag(FOOTER_TAG);

            View divider = new View(context);
            divider.setBackgroundColor(withAlpha(color, 0x1F));
            footer.addView(divider, new LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.MATCH_PARENT, Math.max(1, dp(1, density) / 2)));

            TextView text = new TextView(context);
            text.setText(str("baconreader_patches_drawer_version", Utils.getPatchesReleaseVersion()));
            text.setTextColor(withAlpha(color, 0x99));
            text.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
            text.setPadding(dp(16, density), dp(12, density), dp(16, density), dp(12, density));
            footer.addView(text, new LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT));

            // The list takes the height the footer leaves.
            list.setLayoutParams(new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, 0, 1f));
            drawer.addView(footer);
        } catch (Exception ex) {
            ErrorDialog.printException(() -> "Could not show the version of the patches", ex);
        }
    }

    private static int dp(int value, float density) {
        return (int) (value * density);
    }

    private static int withAlpha(int color, int alpha) {
        return (color & 0x00FFFFFF) | (alpha << 24);
    }
}
