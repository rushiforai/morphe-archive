package com.nuvio.tv.domain.model

/** Test-only mirror of the five-field Nuvio model constructed through reflection. */
data class Subtitle(
    val id: String,
    val url: String,
    val lang: String,
    val addonName: String,
    val addonLogo: String?
)
