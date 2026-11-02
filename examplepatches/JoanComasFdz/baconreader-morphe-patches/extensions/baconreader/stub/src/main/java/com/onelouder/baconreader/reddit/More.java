// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package com.onelouder.baconreader.reddit;

import java.util.List;

/** A "load more comments": the ids of the comments it hides, how many they are with their replies, and their parent. */
public class More extends ThingData {
    public List<String> children;
    public int count;
    public String parent_id;
}
