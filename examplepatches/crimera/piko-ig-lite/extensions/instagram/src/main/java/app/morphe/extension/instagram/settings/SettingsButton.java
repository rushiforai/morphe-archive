/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */
package app.morphe.extension.instagram.settings;

import static app.morphe.extension.instagram.utils.IgStr.str;

import android.app.Activity;
import android.content.Intent;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;

import com.instagram.common.session.UserSession;

import app.morphe.extension.instagram.utils.InstagramLogger;
import app.morphe.extension.instagram.utils.InstagramSheetTheme;
import app.morphe.extension.shared.ResourceType;
import app.morphe.extension.shared.ResourceUtils;

/** Adds the Piko settings icon to the action bar of the signed-in user's own profile. */
public final class SettingsButton {
    private static final String ICON_DRAWABLE = "piko_ic_settings";
    private static final int ICON_PADDING_DP = 12;

    private SettingsButton() {
    }

    /**
     * Injection point: the profile action bar builder, once it has cleared the button row and
     * before it adds Instagram's own buttons. {@code user} is the profile being shown.
     */
    public static void addToProfileActionBar(
            Activity activity,
            ViewGroup buttons,
            UserSession userSession,
            Object user
    ) {
        try {
            if (activity == null || buttons == null || userSession == null || user == null) return;
            if (!userSession.getUserId().equals(getUserId(user))) return;

            int drawableId = ResourceUtils.getIdentifier(activity, ResourceType.DRAWABLE, ICON_DRAWABLE);
            if (drawableId == 0) {
                InstagramLogger.printException(() -> "Piko settings icon is missing");
                return;
            }

            ImageView button = new ImageView(activity);
            button.setImageDrawable(activity.getDrawable(drawableId));
            button.setColorFilter(new PorterDuffColorFilter(
                    InstagramSheetTheme.iconColor(buttons.getContext()), PorterDuff.Mode.SRC_ATOP));
            button.setContentDescription(str("piko_ig_settings_title"));
            int padding = Math.round(ICON_PADDING_DP * activity.getResources().getDisplayMetrics().density);
            button.setPadding(padding, padding, padding, padding);
            button.setOnClickListener(view -> open(activity));

            // Fill the bar's height and centre the icon, so it lines up with Instagram's own buttons.
            button.setScaleType(ImageView.ScaleType.CENTER);
            buttons.addView(button, 0, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.MATCH_PARENT));
        } catch (Exception e) {
            InstagramLogger.printException(() -> "addToProfileActionBar failure", e);
        }
    }

    /** The profile user's id. The patch replaces this body with a read of the resolved model getter. */
    static String getUserId(Object user) {
        return null;
    }

    private static void open(Activity activity) {
        try {
            activity.startActivity(new Intent(activity, InstagramSettingsActivity.class));
        } catch (Exception e) {
            InstagramLogger.printException(() -> "Could not open the Piko settings", e);
        }
    }
}
