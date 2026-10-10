package com.facebook.feed.feedstab.tab;

import com.facebook.navigation.tabbar.state.model.TabTag;

import app.morphe.extension.facebook.navigation.FacebookTabs;

/** Stands in for Facebook's Feeds tab, whose name Redex keeps. */
public final class FeedsTab extends TabTag {
    public FeedsTab() {
        super(FacebookTabs.FEEDS_ID);
    }
}
