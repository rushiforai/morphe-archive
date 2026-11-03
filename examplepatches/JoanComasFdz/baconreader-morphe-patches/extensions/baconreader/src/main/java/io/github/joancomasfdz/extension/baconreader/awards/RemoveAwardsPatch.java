// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader.awards;

import android.view.Menu;
import android.view.MenuItem;
import android.view.View;

import java.lang.reflect.Field;

import app.morphe.extension.shared.ResourceType;
import app.morphe.extension.shared.ResourceUtils;
import io.github.joancomasfdz.extension.baconreader.errors.ErrorDialog;

/**
 * <p>
 * Reddit's API no longer reports awards (all_awardings is always empty since 2023), and the award endpoints
 * of the old coins system are gone.
 */
@SuppressWarnings("unused")
public final class RemoveAwardsPatch {
    private static final String ACTION_GIVE_AWARD = "Give Award";
    private static final String ACTION_VIEW_AWARDS = "View Award Details";

    private RemoveAwardsPatch() {
    }

    /** The buttons of the comment and post action bars. */
    public static boolean isAwardAction(String text) {
        return ACTION_GIVE_AWARD.equals(text) || ACTION_VIEW_AWARDS.equals(text);
    }

    /** The ⋮ menu of posts. */
    public static void hideAwardMenuItems(Object popupMenu) {
        try {
            Menu menu = (Menu) popupMenu.getClass().getMethod("getMenu").invoke(popupMenu);
            hide(menu, "action_give_gold");
            hide(menu, "action_view_awards");
        } catch (Exception ex) {
            ErrorDialog.printException(() -> "Could not hide the award menu items", ex);
        }
    }

    /**
     * Names a button of the comment and post action bars after its action ("Downvote", "Save"…), the
     * text the app's ControlBarButton holds. Its view takes the taps.
     */
    public static void describeButton(Object button) {
        if (button == null) return;
        try {
            Field text = button.getClass().getDeclaredField("text");
            text.setAccessible(true);
            Object action = text.get(button);
            View view = viewOf(button);
            if (view != null && action instanceof String && !((String) action).isEmpty()) {
                view.setContentDescription((String) action);
            }
        } catch (Exception ex) {
            ErrorDialog.printException(() -> "Could not describe an action bar button", ex);
        }
    }

    /** Names the overflow button of the comment and post action bars as the toolbar's ⋮ is named. */
    public static void describeOverflowButton(Object button) {
        View view = viewOf(button);
        if (view == null) return;
        int id = view.getResources().getIdentifier(
                "abc_action_menu_overflow_description", "string", view.getContext().getPackageName());
        if (id != 0) view.setContentDescription(view.getResources().getString(id));
    }

    private static View viewOf(Object button) {
        if (button == null) return null;
        try {
            return (View) button.getClass().getMethod("getView").invoke(button);
        } catch (Exception ex) {
            ErrorDialog.printException(() -> "Could not describe an action bar button", ex);
            return null;
        }
    }

    private static void hide(Menu menu, String name) {
        MenuItem item = menu.findItem(ResourceUtils.getIdentifier(ResourceType.ID, name));
        if (item != null) item.setVisible(false);
    }
}
