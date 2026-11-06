/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package com.tumblr.rumblr.model.link;

/**
 * Stands in for Tumblr's LinkImpl, the public base class its links share. ActionLink inherits
 * getLink from it, so the filter has to find the method on the base class.
 */
public abstract class LinkImpl implements Link {
    @Override
    public String getLink() {
        return href();
    }

    protected abstract String href();
}
