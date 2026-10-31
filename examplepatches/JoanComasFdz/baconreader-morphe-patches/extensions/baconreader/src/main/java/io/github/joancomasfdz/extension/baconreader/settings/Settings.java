// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader.settings;

import static java.lang.Boolean.FALSE;
import static java.lang.Boolean.TRUE;
import static app.morphe.extension.shared.settings.Setting.parent;
import static app.morphe.extension.shared.settings.Setting.parentNot;

import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.shared.settings.BooleanSetting;
import app.morphe.extension.shared.settings.IntegerSetting;
import app.morphe.extension.shared.settings.StringSetting;

/**
 * Settings of the BaconReader patches. The keys are the ones of the ReVanced version of these patches.
 */
@SuppressWarnings("unused")
public class Settings extends BaseSettings {
    // Embed comment images.
    public static final BooleanSetting SHOW_IMAGES = new BooleanSetting("revanced_baconreader_show_images", TRUE);
    public static final BooleanSetting IMAGES_FULL_WIDTH = new BooleanSetting("revanced_baconreader_images_full_width", FALSE, parent(SHOW_IMAGES));
    public static final BooleanSetting IMAGES_LONG_PRESS_DOWNLOAD = new BooleanSetting("revanced_baconreader_images_long_press_download", TRUE, parent(SHOW_IMAGES));
    public static final BooleanSetting IMAGES_WIFI_ONLY = new BooleanSetting("revanced_baconreader_images_wifi_only", FALSE, parent(SHOW_IMAGES));
    public static final BooleanSetting SHOW_VIDEOS = new BooleanSetting("revanced_baconreader_show_videos", TRUE);
    public static final BooleanSetting YOUTUBE_TITLES = new BooleanSetting("revanced_baconreader_youtube_titles", TRUE);
    public static final BooleanSetting YOUTUBE_THUMBNAILS = new BooleanSetting("revanced_baconreader_youtube_thumbnails", FALSE);
    public static final BooleanSetting X_POSTS = new BooleanSetting("revanced_baconreader_x_posts", TRUE);
    public static final BooleanSetting BLUESKY_POSTS = new BooleanSetting("revanced_baconreader_bluesky_posts", TRUE);

    // Show user avatars.
    public static final BooleanSetting USER_AVATARS = new BooleanSetting("revanced_baconreader_user_avatars", FALSE);
    public static final IntegerSetting USER_AVATAR_SIZE = new IntegerSetting("revanced_baconreader_user_avatar_size", 0, parent(USER_AVATARS));
    public static final BooleanSetting USER_AVATAR_BACKGROUND = new BooleanSetting("revanced_baconreader_user_avatar_background", TRUE, parent(USER_AVATARS));

    // Load more comments.
    public static final IntegerSetting COMMENT_LIMIT = new IntegerSetting("revanced_baconreader_comment_limit", 500);
    public static final IntegerSetting AUTO_LOAD_MORE_COMMENTS = new IntegerSetting("revanced_baconreader_auto_load_more_comments", 2);

    // Improve post media loading: JavaScript in the web view of link posts.
    public static final BooleanSetting LINK_PREVIEW_JAVASCRIPT = new BooleanSetting("revanced_baconreader_link_preview_javascript", TRUE);
    public static final StringSetting LINK_PREVIEW_JAVASCRIPT_BLOCKED = new StringSetting("revanced_baconreader_link_preview_javascript_blocked",
            "", parent(LINK_PREVIEW_JAVASCRIPT));
    /** The app's own list, without the sites that shut down, and with Bluesky and x.com. */
    public static final StringSetting LINK_PREVIEW_JAVASCRIPT_ALLOWED = new StringSetting("revanced_baconreader_link_preview_javascript_allowed",
            "bsky.app\nimgur.com\ninstagram.com\nreddit.com\nstreamable.com\ntwitch.tv\ntwitter.com\nvimeo.com\nx.com\nyoutu.be\nyoutube.com",
            parentNot(LINK_PREVIEW_JAVASCRIPT));

    // Video autoplay in detail view.
    public static final BooleanSetting AUTOPLAY_VIDEOS_IN_DETAIL_VIEW = new BooleanSetting("revanced_baconreader_autoplay_videos_in_detail_view", TRUE);

    // Prompt to open Reddit links. Not shown in the settings.
    public static final BooleanSetting OPEN_LINKS_PROMPT_SHOWN = new BooleanSetting("revanced_baconreader_open_links_prompt_shown", FALSE, false, false);

    // Reddit chat: chat messages Reddit also sends to the inbox are kept apart from it.
    public static final BooleanSetting CHECK_CHAT_MESSAGES = new BooleanSetting("revanced_baconreader_check_chat_messages", TRUE);
}
