/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package com.tumblr.rumblr.model.link;

/**
 * Stands in for Tumblr's ActionLink, a call made where the button is, like following a blog or
 * dismissing a post. Like Tumblr's, it gets getLink from {@link LinkImpl}.
 */
public final class ActionLink extends LinkImpl {
    private final String href;

    public ActionLink() {
        this("/v2/user/follow");
    }

    public ActionLink(String href) {
        this.href = href;
    }

    @Override
    protected String href() {
        return href;
    }
}
