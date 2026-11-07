package com.anderson.applemusic.core

/** One entry of the Apple Music browse tree. */
data class BrowseItem(
    val id: String,
    val title: String,
    val subtitle: String,
    val browsable: Boolean,
    val playable: Boolean,
    val artworkUri: String? = null,
)
