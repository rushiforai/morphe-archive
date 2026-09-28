/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package com.facebook.video.videohome.tab;

import com.facebook.navigation.tabbar.state.model.TabTag;

import app.morphe.extension.facebook.navigation.FacebookTabs;

/** Stands in for the Video tab, called Reels on some accounts, under the class name Facebook keeps. */
public final class WatchTab extends TabTag {
    public WatchTab() {
        super(FacebookTabs.VIDEO_ID);
    }
}
