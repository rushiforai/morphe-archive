package com.anderson.applemusic.core

import androidx.compose.runtime.Immutable

/** A horizontal shelf of a browse tab root, or a single "play" shortcut. */
// @Immutable: `items` is a plain List, which the compiler cannot prove immutable, so
// without the annotation Section (and every SectionRow param) is unstable. The list is
// only ever replaced by a copy, never mutated in place.
@Immutable
data class Section(
    val id: String,
    val title: String,
    val items: List<BrowseItem> = emptyList(),
    val loading: Boolean = true,
    val direct: Boolean = false,
)
