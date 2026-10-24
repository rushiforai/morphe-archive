/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package com.tumblr.rumblr.model.link;

/** Stands in for Tumblr's ActionLink, a call made where the button is, like following a blog. */
public final class ActionLink implements Link {
    @Override
    public String getLink() {
        return "/v2/user/follow";
    }
}
