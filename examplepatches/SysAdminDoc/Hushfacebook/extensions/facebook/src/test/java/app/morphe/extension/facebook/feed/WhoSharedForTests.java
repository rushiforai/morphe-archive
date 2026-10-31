/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.feed;

import android.content.Context;
import android.view.Menu;
import android.view.View;
import android.widget.PopupMenu;

import com.facebook.graphql.model.GraphQLStory;
import com.facebook.graphservice.tree.TreeJNI;

import org.robolectric.RuntimeEnvironment;

/**
 * The See who shared hook, for a test outside this package: one post menu Facebook has filled,
 * handed to the hook the way the patch hands it over.
 */
public final class WhoSharedForTests {
    private WhoSharedForTests() {
    }

    /** The icon the shared menu helper hands every item. */
    static final int ICON = 0x7f1a02de;

    /** A post whose feedback says it was shared [shares] times. */
    static GraphQLStory sharedPost(int shares) {
        GraphQLStory post = new GraphQLStory();
        post.with("feedback", new TreeJNI().with("reshares", new TreeJNI().number("count", shares)));
        return post;
    }

    /** A menu as Facebook fills it for a post, with one row of its own. */
    static Menu facebooksMenu(Context context) {
        Menu menu = new PopupMenu(context, new View(context)).getMenu();
        menu.add(Menu.NONE, 1, Menu.NONE, "Save post");
        return menu;
    }

    /** Fills a post menu for a shared post and says whether the hook added its row. */
    public static boolean addsARow() {
        Context context = RuntimeEnvironment.getApplication();
        Menu menu = facebooksMenu(context);
        int before = menu.size();
        WhoShared.add(menu, new View(context), sharedPost(3), ICON);
        return menu.size() > before;
    }
}
