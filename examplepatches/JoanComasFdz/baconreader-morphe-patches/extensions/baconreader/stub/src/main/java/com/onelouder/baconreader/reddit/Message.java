// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package com.onelouder.baconreader.reddit;

import java.util.List;

public class Message extends ThingData {
    public String author;
    public String body;
    public String parent_id;
    /** The replies, as things: comments and "more". */
    public List<Thing> replies;
    public long created_utc;
    public String subject;
}
