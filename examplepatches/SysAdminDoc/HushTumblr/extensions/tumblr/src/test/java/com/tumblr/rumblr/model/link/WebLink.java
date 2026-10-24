/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package com.tumblr.rumblr.model.link;

/** Stands in for Tumblr's WebLink, a page a button opens. */
public final class WebLink implements Link {
    @Override
    public String getLink() {
        return "https://www.tumblr.com/explore";
    }
}
