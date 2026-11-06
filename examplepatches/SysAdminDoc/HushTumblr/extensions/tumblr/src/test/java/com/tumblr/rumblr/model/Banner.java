/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package com.tumblr.rumblr.model;

/**
 * Stands in for Tumblr's Banner, the server's takeover_banner, with the sponsor getter the filter
 * reads by name.
 */
public class Banner implements Timelineable {
    private final String sponsoredBy;

    public Banner(String sponsoredBy) {
        this.sponsoredBy = sponsoredBy;
    }

    public String getSponsoredBy() {
        return sponsoredBy;
    }

    @Override
    public String getId() {
        return "banner";
    }

    @Override
    public TimelineObjectType getTimelineObjectType() {
        return TimelineObjectType.BANNER;
    }
}
