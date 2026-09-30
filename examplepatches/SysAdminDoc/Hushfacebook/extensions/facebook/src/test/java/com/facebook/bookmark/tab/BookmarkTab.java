/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package com.facebook.bookmark.tab;

import com.facebook.navigation.tabbar.state.model.TabTag;

import app.morphe.extension.facebook.navigation.FacebookTabs;

/** Stands in for the Menu tab, under the class name Facebook keeps. */
public final class BookmarkTab extends TabTag {
    public BookmarkTab() {
        super(FacebookTabs.MENU_ID);
    }
}
