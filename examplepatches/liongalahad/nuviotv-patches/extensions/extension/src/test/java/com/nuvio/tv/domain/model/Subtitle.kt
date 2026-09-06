package com.nuvio.tv.domain.model

/** Test-only mirror of the 0.9.0 Nuvio model constructed through reflection. */
data class Subtitle(
    val id: String,
    val url: String,
    val lang: String,
    val addonName: String,
    val addonLogo: String?,
    val isStreamProvided: Boolean = false,
    val headers: Map<String, String> = emptyMap()
)
