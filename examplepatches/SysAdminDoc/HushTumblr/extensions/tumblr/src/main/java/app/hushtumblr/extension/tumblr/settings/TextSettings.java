/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.settings;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import app.hushtumblr.extension.shared.settings.StringSetting;

/**
 * The settings that hold text rather than on or off. They live apart from {@link Settings}, whose
 * every setting is a switch a settings file carries in its switch section. A file carries these in
 * a text section of their own since version 2 ({@link SettingsBackup#TEXT_ALLOWLIST}), each checked
 * on import by the rule its row saves by. While HushTumblr is paused each answers its default,
 * which leaves Tumblr as it is, or for the long post length goes unread with its switch off.
 */
public final class TextSettings {
    private TextSettings() {}

    /**
     * The words and phrases Hide posts with these words looks for, one a line or split by commas
     * ({@link app.hushtumblr.extension.tumblr.timeline.PostRules}). Read as each page loads.
     */
    public static final StringSetting HIDDEN_WORDS = new StringSetting("hushtumblr_hidden_words", "");
    /** Exceptions use the same whole-word policy and affect only the word filter. */
    public static final StringSetting ALLOWED_WORDS = new StringSetting("hushtumblr_allowed_words", "");

    /**
     * The bottom bar's tabs by their names in Tumblr's tab enum, comma separated, first tab first
     * ({@link app.hushtumblr.extension.tumblr.ui.BottomBarTabs}). Empty keeps Tumblr's order. Read
     * once a run, when Tumblr builds its tab list.
     */
    public static final StringSetting TAB_ORDER = new StringSetting("hushtumblr_tab_order", "", true);

    /**
     * How much of a long post {@link Settings#COLLAPSE_LONG_POSTS} keeps, in lines of post text as
     * {@link app.hushtumblr.extension.tumblr.timeline.LongPosts} estimates them: one of
     * {@link #LONG_POST_SIZES}. Read wherever the switch is.
     */
    public static final StringSetting LONG_POST_SIZE = new StringSetting("hushtumblr_long_post_size", "40");
    /** The lengths its row offers, shortest first: about half a screen, a screen and two screens. */
    public static final List<String> LONG_POST_SIZES = Collections.unmodifiableList(Arrays.asList("20", "40", "80"));

    /**
     * The font file chosen for {@link Settings#APP_FONT}, as {@link app.hushtumblr.extension.tumblr.ui.AppFont#install}
     * answered it. Empty means the phone's font. It stays out of a settings file, since the font
     * itself can't travel in one, and an imported switch on the next phone means the phone's font.
     */
    public static final StringSetting APP_FONT_FILE = new StringSetting("hushtumblr_app_font_file", "", true);
}
