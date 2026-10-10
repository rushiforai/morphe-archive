/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches
 *
 * Original hard forked code:
 * https://github.com/ReVanced/revanced-patches/commit/724e6d61b2ecd868c1a9a37d465a688e83a74799
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to TADa contributions.
 */

package app.morphe.extension.shared.patches.components;

import app.morphe.extension.shared.StringTrieSearch;

public class StringFilterGroupList extends FilterGroupList<CharSequence, StringFilterGroup> {
    protected StringTrieSearch createSearchGraph() {
        return new StringTrieSearch();
    }
}
