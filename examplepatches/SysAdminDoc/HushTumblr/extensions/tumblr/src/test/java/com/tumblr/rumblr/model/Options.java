/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package com.tumblr.rumblr.model;

import java.util.List;

/** Stands in for Tumblr's Options, the dismiss menu a timeline item can carry. */
public class Options {
    private final String title;
    private final List<Option> options;

    public Options(String title, List<Option> options) {
        this.title = title;
        this.options = options;
    }

    public String getTitle() {
        return title;
    }

    public List<Option> getOptions() {
        return options;
    }
}
