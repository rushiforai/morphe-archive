/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package com.tumblr.rumblr.model;

import com.tumblr.rumblr.model.link.Link;

/** Stands in for Tumblr's Option, one choice in a dismiss menu and the link it calls. */
public final class Option {
    private final Link link;

    public Option(Link link) {
        this.link = link;
    }

    public Link getLink() {
        return link;
    }
}
