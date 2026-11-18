// SPDX-License-Identifier: GPL-3.0-only
// Copyright (C) 2026 Kero309x

package app.keropatches.core

/**
 * The categories a patch can be filed under.
 *
 * The framework accepts a free-form category string, so the taxonomy belongs to
 * this project. Keeping it as a closed enum prevents spelling drift between
 * patches and keeps the catalogue grouped consistently in the manager UI.
 */
enum class PatchCategory(val label: String) {
    ADS("Ads and promotion"),
    PLAYBACK("Playback"),
    ENTITLEMENT("Account and entitlements"),
    PRIVACY("Privacy"),
    MEDIA("Media and lyrics"),
    STORE("Store and upsells"),
    INTERFACE("Interface"),
    SECURITY("Network and security"),
}
