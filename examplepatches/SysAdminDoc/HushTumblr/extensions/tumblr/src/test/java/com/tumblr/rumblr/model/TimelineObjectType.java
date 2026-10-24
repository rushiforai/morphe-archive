/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package com.tumblr.rumblr.model;

/**
 * Stands in for Tumblr's item kinds. The filter reads a kind by its constant's name, so a constant
 * here named like one of Tumblr's is that kind to it.
 */
public enum TimelineObjectType {
    UNKNOWN,
    POST,
    TITLE,
    GEMINI_AD,
    FACEBOOK_BIDDAABLE,
    NIMBUS_AD,
    DISPLAY_IO_INTERSCROLLER_S2S_ADS,
    VUNGLE_AD,
    CLIENT_SIDE_AD,
    CLIENT_SIDE_MEDIATION,
    DISPLAY_IO_INTERSCROLLER_AD,
    GOOGLE_NATIVE,
    BLAZED_POST,
    BLOG_CARD,
    COMPACT_BLOG_CARD,
    BLOG_ROW,
    TINY_BLOG_CAROUSEL_CARD,
    BLOG_FOLLOW_CTA,
    BLOG_SUBSCRIPTION_CTA,
    BUTTON,
    COMMUNITY_CARD,
    COMMUNITY_ROW,
    COMMUNITY_HUB_HEADER_CARD,
    TAG_CAROUSEL_CARD,
    FOLLOWED_TAG_CAROUSEL_CARD,
    TAG_CARDS_COLLECTION,
    SIGNPOST,
    VIDEO_HUB_CARD,
    VIDEO_HUB_FEATURED,
    VIDEO_HUB_FEATURED_BORDERED,
    VIDEO_HUBS_CONTAINER,
    VIDEO_HUBS_ROW,
    CAROUSEL,
    AVATAR_CAROUSEL,
}
