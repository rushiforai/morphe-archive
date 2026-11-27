/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.github.shared

import app.fakh.patches.shared.Feature
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_GITHUB = Compatibility(
        name = "GitHub",
        packageName = "com.github.android",
        signatures = setOf("df08c9f2d809189d9d506497c15745a7395a41536efb433e3aee1aedbe11b261"),
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x1B1F23,
        targets = listOf(AppTarget(version = "1.285.0", versionCode = 956)),
    )

    // The rows of the Fakh Patches pages, a page per section, in this order. A row is a switch, except the ones the
    // extension opens a sheet for: the navigation bar tabs, the landscape position, the tab width and the download
    // folder.
    val MATERIAL_YOU = Feature("fakh_material_you", "Material You", "Appearance")
    val PITCH_BLACK = Feature("fakh_amoled", "Pitch black", "Appearance", restart = false, default = false)
    val ICON_ONLY_BUTTONS = Feature(
        "fakh_icon_only_buttons", "Icon-only floating buttons", "Appearance",
        description = "Floating buttons such as Comment show without their text.",
    )

    val NAV_TABS = Feature("fakh_nav_tabs", "Navigation bar tabs", "Navigation bar")
    val HIDE_TAB_LABELS = Feature("fakh_hide_nav_labels", "Hide tab labels", "Navigation bar", default = false)
    val GLASS_NAVBAR = Feature("fakh_glass_navbar", "Liquid Glass navigation bar", "Navigation bar")
    val BACKGROUND_BLUR = Feature(
        "fakh_liquid_glass", "Background blur", "Navigation bar", dependsOn = GLASS_NAVBAR, default = false,
        description = "Blurs what's behind the glass. Uses more battery and might stutter.",
    )
    val NAV_RIGHT = Feature("fakh_nav_right", "Landscape navigation bar position", "Navigation bar", default = false)
    val SMALLER_NAVBAR = Feature("fakh_smaller_navbar", "Smaller navigation bar", "Navigation bar")

    val CONVENTIONAL_COMMITS = Feature(
        "fakh_conventional_commits", "Conventional commits", "Titles and lists",
        description = "Titles such as feat: add login show their type as a label.",
    )
    val EXACT_TIME = Feature(
        "fakh_exact_time", "Show exact time", "Titles and lists",
        description = "Dates and times instead of ages such as 20d.",
    )
    val HEADER_LABELS = Feature(
        "fakh_header_labels", "Labels in the header", "Titles and lists",
        description = "Labels under the title of an issue or pull request.",
    )
    val RECENTLY_UPDATED = Feature(
        "fakh_recently_updated", "Recently updated first", "Titles and lists",
        description = "Issue and pull request lists open sorted by Recently updated.",
    )
    val DIM_BOTS = Feature(
        "fakh_dim_bots", "Dim bots", "Titles and lists", description = "Fades commits, issues and pull requests by bots.",
    )
    val REPOSITORY_AGE = Feature(
        "fakh_repository_age", "Repository age", "Titles and lists",
        description = "When a repository was created, under its stars and forks.",
    )

    val COLLAPSE_BOTS = Feature(
        "fakh_collapse_bots", "Collapse bot comments", "Comments and markdown",
        description = "Comments by bots and agents start collapsed.",
    )
    val HIDE_LOW_QUALITY = Feature(
        "fakh_hide_low_quality", "Hide low-quality comments", "Comments and markdown",
        description = "Hides comments that only say +1, me too or ask for news.",
    )
    val MENTION_AVATARS = Feature(
        "fakh_mention_avatars", "Mention avatars", "Comments and markdown",
        description = "A small avatar before each @mention.",
    )
    val SHORTEN_LINKS = Feature(
        "fakh_shorten_links", "Shorten links", "Comments and markdown",
        description = "Pasted links read as short references such as owner/repo#123.",
    )
    val COLLAPSE_CODE = Feature(
        "fakh_collapse_code", "Collapse long code blocks", "Comments and markdown",
        description = "Code blocks longer than 25 lines start folded.",
    )
    val MERMAID = Feature(
        "fakh_mermaid", "Mermaid diagrams", "Comments and markdown",
        description = "Draws Mermaid code blocks as diagrams.",
    )

    val TAB_WIDTH = Feature("fakh_tab_width", "Tab width", "Code and files")
    val WHITESPACE = Feature(
        "fakh_whitespace", "Show whitespace", "Code and files",
        description = "Spaces and tabs show as dim marks in files and diffs.",
    )

    val DOWNLOAD_ASSETS = Feature(
        "fakh_download_assets", "Download assets", "Releases and downloads",
        description = "Release files download in the app instead of the browser.",
    )
    val DOWNLOAD_FOLDER = Feature("fakh_download_folder", "Download location", "Releases and downloads")
    val DOWNLOAD_COUNT = Feature(
        "fakh_download_count", "Release download count", "Releases and downloads",
        description = "How often each release file was downloaded.",
    )
}
