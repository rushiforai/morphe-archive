/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.navigation;

import androidx.annotation.Nullable;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/**
 * The tabs Facebook can be told to open on, each with the id its tab bar knows it by
 * ({@link FacebookTabs}) and the classes Facebook keeps the names of for it.
 *
 * <p>Like {@code DownloadQuality}, this holds no Android type and reads no setting, and its
 * {@link #fileValue} is what a settings file holds. The label a person reads is the settings
 * screen's, in the phone's language.
 */
public enum StartTab {
    HOME(FacebookTabs.HOME_ID, "home", FacebookTabs.HOME_CLASS),
    FEEDS(FacebookTabs.FEEDS_ID, "feeds", FacebookTabs.FEEDS_CLASS, FacebookTabs.MOST_RECENT_CLASS),
    VIDEO(FacebookTabs.VIDEO_ID, "video", FacebookTabs.VIDEO_CLASS),
    FRIENDS(FacebookTabs.FRIENDS_ID, "friends", FacebookTabs.FRIENDS_CLASS),
    MARKETPLACE(FacebookTabs.MARKETPLACE_ID, "marketplace", FacebookTabs.MARKETPLACE_CLASS),
    NOTIFICATIONS(FacebookTabs.NOTIFICATIONS_ID, "notifications", FacebookTabs.NOTIFICATIONS_CLASS),
    MENU(FacebookTabs.MENU_ID, "menu", FacebookTabs.MENU_CLASS);

    /** The id a start asks Facebook's main screen for. */
    public final long tabId;

    /** What a settings file holds for this tab. It never changes once written. */
    public final String fileValue;

    /** The classes Facebook keeps the names of for this tab, as Java names them. */
    final List<String> tabClasses;

    StartTab(long tabId, String fileValue, String... tabClasses) {
        this.tabId = tabId;
        this.fileValue = fileValue;
        this.tabClasses = Collections.unmodifiableList(Arrays.asList(tabClasses));
    }

    /** The tab a settings file names, or null when it names none this build knows. */
    @Nullable
    public static StartTab fromFile(@Nullable Object value) {
        if (!(value instanceof String)) return null;
        for (StartTab tab : values()) {
            if (tab.fileValue.equals(value)) return tab;
        }
        return null;
    }

    /** Whether a tab of the class Java names [className] is this one. */
    boolean isTab(@Nullable String className) {
        return className != null && tabClasses.contains(className);
    }
}
