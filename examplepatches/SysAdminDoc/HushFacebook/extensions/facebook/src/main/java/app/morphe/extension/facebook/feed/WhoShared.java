/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.feed;

import android.content.Context;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;

import app.morphe.extension.facebook.download.PostDetails;
import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.L10n;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * A See who shared row in a post's three-dot menu (issue #283). Facebook has its own list of the
 * people who shared a post, but in the feed only a server-side test opens it from the share count.
 * The row opens that same list through Facebook's own launcher, which the patch puts in
 * {@link #openList}, so what the list shows (public shares, as Facebook decides) is Facebook's.
 *
 * <p>The row goes below Facebook's rows, through the same hook as Download any video's item, and
 * only on a post: an attachment's menu, and a post whose share count reads zero, get none. A
 * count the post doesn't carry still gets the row.
 *
 * <p>Off, paused, before the settings are ready, or when anything here fails, the menu is
 * Facebook's own.
 */
public final class WhoShared {
    private WhoShared() {}

    /** The member the report names once a post's menu has been through the hook. */
    static final String MENU_ROW = "post menu See who shared";

    /** The member the report names once a tap reached Facebook's list. */
    static final String LIST = "reshares list";

    /** Counted under the patch's name each time a tap opens Facebook's list. */
    static final String OPENED = "shares list opened";

    private static final String FAMILY = FamilyNames.WHO_SHARED;
    private static final String GRAPHQL_STORY = "com.facebook.graphql.model.GraphQLStory";

    /** The GraphQL fields a post's share count sits under: the post's feedback, its reshares, their count. */
    static final int FEEDBACK = "feedback".hashCode();
    static final int RESHARES = "reshares".hashCode();
    static final int COUNT = "count".hashCode();

    /**
     * Adds the row to [menu] when [item], what Facebook filled it for, is a post. [icon] is
     * Download any video's icon, which the shared helper hands every item, and isn't used here.
     * Never throws: this runs inside Facebook's menu code.
     */
    public static void add(Menu menu, View anchor, Object item, int icon) {
        try {
            if (!enabled() || menu == null) return;
            HookStatus.invoked(FAMILY);
            HookStatus.bound(FAMILY, MENU_ROW);
            if (!isPost(item) || sharesOf(item) == 0) return;

            MenuItem entry = menu.add(L10n.t("See who shared"));
            if (entry == null) return;
            Context context = anchor == null ? null : anchor.getContext();
            entry.setOnMenuItemClickListener(tapped -> {
                tap(context, item);
                return true;
            });
        } catch (Throwable t) {
            HookStatus.threw(FAMILY, MENU_ROW, t);
        }
    }

    /** The switch on, Hushfacebook running and its settings ready. */
    static boolean enabled() {
        return Utils.settingsReady() && Settings.SEE_WHO_SHARED.get();
    }

    /**
     * A tap on the row: Facebook's list of who shared [story], or a message saying it didn't open.
     * Answers whether the list opened.
     */
    static boolean tap(Context context, Object story) {
        try {
            // A menu can stay open while the switch goes off. The tap then does nothing.
            if (!enabled() || context == null) return false;
            if (!openList(context, story, null)) {
                HookStatus.missingMember(FAMILY, "method", "reshares list launcher", "openList");
                Utils.showToastShort(L10n.t("Couldn't open the list of shares."));
                return false;
            }
            HookStatus.bound(FAMILY, LIST);
            HookStatus.counted(FAMILY, OPENED);
            Logger.printDebug(() -> "Who shared: opened Facebook's list of shares");
            return true;
        } catch (Throwable t) {
            // It runs inside Facebook's click dispatch, on the thread that draws the app.
            HookStatus.threw(FAMILY, LIST, t);
            Utils.showToastShort(L10n.t("Couldn't open the list of shares."));
            return false;
        }
    }

    /**
     * Opens Facebook's list of the people who shared [story], from the activity [context] belongs
     * to. [session] is the share session Facebook's own callers pass, which may be null. The patch
     * replaces this body with the call to Facebook's launcher and an answer of true; unpatched it
     * answers false.
     */
    public static boolean openList(Context context, Object story, String session) {
        return false;
    }

    /** How many times [story] was shared, or -1 when it doesn't say. */
    static long sharesOf(Object story) {
        return PostDetails.count(PostDetails.tree(PostDetails.tree(story, FEEDBACK), RESHARES), COUNT);
    }

    private static boolean isPost(Object item) {
        if (item == null) return false;
        for (Class<?> type = item.getClass(); type != null; type = type.getSuperclass()) {
            if (type.getName().equals(GRAPHQL_STORY)) return true;
        }
        return false;
    }
}
