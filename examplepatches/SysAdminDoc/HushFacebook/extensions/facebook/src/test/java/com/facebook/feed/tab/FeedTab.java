package com.facebook.feed.tab;

import com.facebook.navigation.tabbar.state.model.TabTag;

import app.morphe.extension.facebook.navigation.FacebookTabs;

/** Stands in for Facebook's Home tab, whose name Redex keeps. */
public final class FeedTab extends TabTag {
    public FeedTab() {
        super(FacebookTabs.HOME_ID);
    }
}
