// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader.sidebar;

import android.app.Activity;
import android.view.Menu;
import android.view.MenuItem;

import app.morphe.extension.shared.ResourceType;
import app.morphe.extension.shared.ResourceUtils;
import io.github.joancomasfdz.extension.baconreader.errors.ErrorDialog;

/**
 * <p>
 * "View Sidebar" only works for a subreddit. Front Page, All, Popular, Friends, multireddits and Random before
 * it has loaded only show "This subreddit does not have a sidebar".
 */
@SuppressWarnings("unused")
public final class DisableUnavailableSidebarPatch {
    private DisableUnavailableSidebarPatch() {
    }

    /**
     * The app only prepares its menu again on rotation. Called when another feed is opened and when its posts
     * are loaded (Random is then resolved to its subreddit).
     */
    public static void refreshMenu(Activity activity) {
        if (activity != null) activity.runOnUiThread(activity::invalidateOptionsMenu);
    }

    /** Called when the overflow menu of the post list is prepared. */
    public static void updateSidebarItem(Menu menu, Object linksetKey) {
        try {
            MenuItem item = menu.findItem(ResourceUtils.getIdentifier(ResourceType.ID, "action_sidebar"));
            if (item != null) item.setEnabled(hasSidebar(linksetKey));
        } catch (Exception ex) {
            ErrorDialog.printException(() -> "Could not update the sidebar menu item", ex);
        }
    }

    private static boolean hasSidebar(Object linksetKey) throws Exception {
        if (linksetKey == null) return false;
        // Random is resolved to its subreddit once the posts are loaded, as the app's openSidebar() does.
        Object redditId = Class.forName("com.onelouder.baconreader.data.LinksetManager")
                .getMethod("getResolvedRedditId", linksetKey.getClass())
                .invoke(null, linksetKey);
        if (redditId == null) return false;
        if (!Boolean.TRUE.equals(redditId.getClass().getMethod("isPureSubreddit").invoke(redditId))) return false;
        // The app counts Popular as a subreddit, but it has no sidebar.
        Object name = redditId.getClass().getMethod("getName").invoke(redditId);
        return !"popular".equalsIgnoreCase(String.valueOf(name));
    }
}
