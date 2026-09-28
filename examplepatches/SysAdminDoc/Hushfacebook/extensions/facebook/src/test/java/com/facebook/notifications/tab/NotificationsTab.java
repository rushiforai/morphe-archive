/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package com.facebook.notifications.tab;

import com.facebook.navigation.tabbar.state.model.TabTag;

import app.morphe.extension.facebook.navigation.FacebookTabs;

/** Stands in for the Notifications tab, under the class name Facebook keeps. */
public final class NotificationsTab extends TabTag {
    public NotificationsTab() {
        super(FacebookTabs.NOTIFICATIONS_ID);
    }
}
