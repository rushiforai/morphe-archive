/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package com.tumblr.rumblr.response;

import java.util.function.Supplier;

/**
 * Stands in for Moshi's adapter of Tumblr's tag page response, by name: the filter knows a tag's page
 * of posts by this class's frame on the call stack. {@link #fromJson} runs the parse it's handed inside
 * its own frame, as the real adapter runs the timeline's adapter.
 */
public final class CommunityHubResponseJsonAdapter {
    private CommunityHubResponseJsonAdapter() {}

    public static <T> T fromJson(Supplier<T> page) {
        return page.get();
    }
}
