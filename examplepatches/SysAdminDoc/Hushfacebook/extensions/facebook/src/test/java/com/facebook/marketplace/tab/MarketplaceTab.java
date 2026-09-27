package com.facebook.marketplace.tab;

import com.facebook.navigation.tabbar.state.model.TabTag;

import app.morphe.extension.facebook.navigation.FacebookTabs;

/** Stands in for Facebook's Marketplace tab, whose name Redex keeps. */
public final class MarketplaceTab extends TabTag {
    public MarketplaceTab() {
        super(FacebookTabs.MARKETPLACE_ID);
    }
}
