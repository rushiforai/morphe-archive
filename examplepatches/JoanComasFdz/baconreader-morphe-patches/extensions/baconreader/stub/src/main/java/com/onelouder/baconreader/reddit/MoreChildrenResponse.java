// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package com.onelouder.baconreader.reddit;

import java.util.List;

/** What api/morechildren answers: {"json": {"errors": [], "data": {"things": [...]}}}. */
public class MoreChildrenResponse {
    public MoreChildrenResponseJson json;

    public static class MoreChildrenResponseJson {
        public MoreChildrenResponseData data;
        public List<Object> errors;
    }

    public static class MoreChildrenResponseData {
        public List<Thing> things;
    }
}
