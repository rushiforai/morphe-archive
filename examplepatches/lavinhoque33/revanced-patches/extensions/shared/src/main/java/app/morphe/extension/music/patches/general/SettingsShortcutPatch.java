/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Written by lavinhoque33, 2026-11-14.
 */

package app.morphe.extension.music.patches.general;

import android.content.Context;
import android.content.Intent;
import android.content.res.TypedArray;
import android.net.Uri;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;

import app.morphe.extension.music.settings.Settings;
import app.morphe.extension.shared.utils.ResourceUtils;

@SuppressWarnings("unused")
public final class SettingsShortcutPatch {
    private SettingsShortcutPatch() {
    }

    /** Wrap only the avatar action view, leaving native menu items, listeners and ordering intact. */
    public static View addShortcut(View avatar) {
        if (!Settings.SETTINGS_SHORTCUT.get()) return avatar;

        Context context = avatar.getContext();
        LinearLayout actions = new LinearLayout(context);
        actions.setOrientation(LinearLayout.HORIZONTAL);
        actions.setGravity(Gravity.CENTER_VERTICAL);
        actions.setLayoutParams(new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        actions.addView(createButton(context));
        actions.addView(avatar);
        return actions;
    }

    private static ImageButton createButton(Context context) {
        ImageButton button = new ImageButton(context);
        int touchSize = Math.round(48 * context.getResources().getDisplayMetrics().density);
        button.setLayoutParams(new LinearLayout.LayoutParams(touchSize, touchSize));
        button.setScaleType(ImageView.ScaleType.CENTER);
        button.setImageDrawable(context.getDrawable(ResourceUtils.getDrawableIdentifier("yt_outline_gear_vd_theme_24")));
        button.setContentDescription(context.getString(ResourceUtils.getStringIdentifier("settings")));
        button.setTooltipText(context.getString(ResourceUtils.getStringIdentifier("revanced_settings_shortcut_summary")));

        applyTheme(context, button);
        button.setOnClickListener(view -> openSettings(context, false));
        button.setOnLongClickListener(view -> {
            openSettings(context, true);
            return true;
        });
        button.setAccessibilityDelegate(new View.AccessibilityDelegate() {
            @Override
            public void onInitializeAccessibilityNodeInfo(View host, AccessibilityNodeInfo info) {
                super.onInitializeAccessibilityNodeInfo(host, info);
                info.addAction(new AccessibilityNodeInfo.AccessibilityAction(
                        AccessibilityNodeInfo.ACTION_LONG_CLICK,
                        context.getString(ResourceUtils.getStringIdentifier("revanced_settings_shortcut_long_click"))));
            }
        });
        return button;
    }

    private static void applyTheme(Context context, ImageButton button) {
        int[] attributes = {
                ResourceUtils.getAttrIdentifier("selectableItemBackgroundBorderless"),
                ResourceUtils.getAttrIdentifier("ytTextPrimary")
        };
        TypedArray theme = context.obtainStyledAttributes(attributes);
        try {
            button.setBackground(theme.getDrawable(0));
            button.setImageTintList(theme.getColorStateList(1));
        } finally {
            theme.recycle();
        }
    }

    private static void openSettings(Context context, boolean rvx) {
        Intent intent = new Intent().setClassName(context.getPackageName(), rvx
                ? "com.google.android.gms.common.api.GoogleApiActivity"
                : "com.google.android.apps.youtube.music.settings.SettingsCompatActivity");
        if (rvx) intent.setData(Uri.parse("revanced_settings_intent"));
        context.startActivity(intent);
    }
}
