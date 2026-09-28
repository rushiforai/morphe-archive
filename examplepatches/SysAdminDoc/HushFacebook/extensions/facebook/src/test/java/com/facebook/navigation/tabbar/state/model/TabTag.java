package com.facebook.navigation.tabbar.state.model;

/**
 * Stands in for the class every Facebook tab extends, which Redex leaves named. Like the real one
 * it holds one long, the tab's id, under a name the hook doesn't read.
 */
public abstract class TabTag {
    public final long id;

    protected TabTag(long id) {
        this.id = id;
    }
}
