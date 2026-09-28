package com.facebook.friending.tab;

import com.facebook.navigation.tabbar.state.model.TabTag;

import app.morphe.extension.facebook.navigation.FacebookTabs;

/** Stands in for Facebook's Friends tab, whose name Redex keeps. */
public final class FriendRequestsTab extends TabTag {
    public FriendRequestsTab() {
        super(FacebookTabs.FRIENDS_ID);
    }
}
