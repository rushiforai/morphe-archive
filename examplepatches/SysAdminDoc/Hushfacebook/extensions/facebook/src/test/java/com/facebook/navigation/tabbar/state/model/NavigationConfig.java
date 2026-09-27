package com.facebook.navigation.tabbar.state.model;

import java.util.List;

/** Stands in for the tab bar's configuration, which Redex leaves named: the tabs in order. */
public final class NavigationConfig {
    public final List<Object> tabs;

    public NavigationConfig(List<Object> tabs) {
        this.tabs = tabs;
    }
}
