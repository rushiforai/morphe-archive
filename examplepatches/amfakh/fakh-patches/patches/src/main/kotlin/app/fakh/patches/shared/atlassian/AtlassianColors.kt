/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.shared.atlassian

/**
 * The older Atlassian blue ramp (B*, SB*) as color resources, which Jira and Confluence both carry and read for
 * their View theme (switches, board filters, chips, legacy screens), to the accent tone of the same lightness.
 */
val ATLASSIAN_RAMP_ACCENTS = mapOf(
    "B50" to "system_accent1_50",
    "B75" to "system_accent1_100",
    "B100" to "system_accent1_200",
    "B200" to "system_accent1_500",
    "B300" to "system_accent1_600",
    "B400" to "system_accent1_600",
    "B500" to "system_accent1_700",
    "B1200" to "system_accent1_900",
    "B1300" to "system_accent1_900",
    "SB500" to "system_accent1_200",
    "SB600" to "system_accent1_500",
    "SB800" to "system_accent1_600",
)
