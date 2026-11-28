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

    // The rows of the Fakh Patches pages, a page per section and a header per group, in this order. A row is a switch,
    // except the ones the extension opens a sheet for: the navigation bar tabs, the landscape position, the Home header
    // text, the recent branches, the tab width and the download folder.
    val MATERIAL_YOU = Feature("fakh_material_you", "Material You", "Appearance")
    val PITCH_BLACK = Feature("fakh_amoled", "Pitch black", "Appearance", restart = false, default = false)
    val ICON_ONLY_BUTTONS = Feature(
        "fakh_icon_only_buttons", "Icon-only floating buttons", "Appearance", restart = false,
        description = "Floating buttons such as Comment show without their text.",
    )
    val HOME_HEADER_TEXT = Feature("fakh_home_title", "Home header text", "Appearance")

    val NAV_TABS = Feature("fakh_nav_tabs", "Navigation bar tabs", "Navigation bar")
    val HIDE_NAV_BAR_LABELS = Feature(
        "fakh_hide_nav_labels", "Hide navigation bar labels", "Navigation bar", default = false,
    )
    val GLASS_NAVBAR = Feature("fakh_glass_navbar", "Liquid Glass navigation bar", "Navigation bar")
    val BACKGROUND_BLUR = Feature(
        "fakh_liquid_glass", "Background blur", "Navigation bar", dependsOn = GLASS_NAVBAR, default = false,
        description = "Blurs what's behind the glass. Uses more battery and might stutter.",
    )
    val NAV_RIGHT = Feature("fakh_nav_right", "Landscape navigation bar position", "Navigation bar", default = false)
    val SMALLER_NAVBAR = Feature("fakh_smaller_navbar", "Smaller navigation bar", "Navigation bar")

    val CONVENTIONAL_COMMITS = Feature(
        "fakh_conventional_commits", "Conventional commits", "Titles and lists",
        description = "feat, fix, chore, etc. shown as pills.",
        group = "General",
    )
    val EXACT_TIME = Feature(
        "fakh_exact_time", "Show exact time", "Titles and lists",
        description = "Instead of ages such as 20d.",
        group = "General",
    )
    val DIM_BOTS_AND_AGENTS = Feature(
        "fakh_dim_bots", "Dim bots and agents", "Titles and lists",
        description = "Commits, issues, pull requests, and events.",
        group = "General",
    )
    val SHOW_LABELS_IN_HEADER = Feature(
        "fakh_header_labels", "Show labels in the header", "Titles and lists", restart = false,
        description = "Under the title of an issue or pull request.",
        group = "Issues and pull requests",
    )
    val SORT_BY_RECENTLY_UPDATED = Feature(
        "fakh_recently_updated", "Sort by Recently updated first", "Titles and lists",
        description = "Instead of Newest.",
        group = "Issues and pull requests",
    )
    val SHOW_BASE_BRANCH = Feature(
        "fakh_pr_base_branch", "Show base branch in pull requests", "Titles and lists", restart = false,
        description = "When it isn't the default branch.",
        group = "Issues and pull requests",
    )

    val SHOW_REPOSITORY_AGE = Feature(
        "fakh_repository_age", "Show repository age", "Repositories", restart = false,
        group = "Overview",
    )
    val ICON_ONLY_LIST_BUTTON = Feature(
        "fakh_icon_only_list_button", "Icon-only Add to list button", "Repositories", restart = false,
        group = "Overview",
    )
    val PIN_IMPORTANT_BRANCHES = Feature(
        "fakh_pinned_branches", "Pin important branches", "Repositories", restart = false,
        description = "develop, main, master, and staging.",
        group = "Branches",
    )
    val PIN_RECENT_BRANCHES = Feature(
        "fakh_recent_branches", "Pin recent branches", "Repositories", restart = false, group = "Branches",
    )
    val SHOW_COMMIT_TAGS = Feature(
        "fakh_commit_tags", "Show tags on commits", "Repositories", restart = false,
        description = "Next to matching commits.",
        group = "Commits",
    )

    val SHOW_FOLLOWS_YOU = Feature(
        "fakh_follows_you", "Show if a profile follows you", "Profiles", restart = false,
    )
    val LINKIFY_LOCATION = Feature(
        "fakh_linkify_location", "Linkify user location", "Profiles", restart = false,
    )

    val COLLAPSE_BOTS_AND_AGENTS = Feature(
        "fakh_collapse_bots", "Collapse bot and agent comments", "Comments and markdown", restart = false,
        group = "Comments",
    )
    val HIDE_LOW_QUALITY = Feature(
        "fakh_hide_low_quality", "Hide low-quality comments", "Comments and markdown", restart = false,
        description = "+1, me too, or asking for news.",
        group = "Comments",
    )
    val PREVIEW_HIDDEN = Feature(
        "fakh_preview_hidden", "Preview hidden comments", "Comments and markdown", restart = false,
        group = "Comments",
    )
    val HIDE_COPILOT_DISCLAIMER = Feature(
        "fakh_hide_copilot_note", "Hide Copilot disclaimer", "Comments and markdown", restart = false,
        group = "Comments",
    )
    val ADD_COLLAPSIBLE_SECTION = Feature(
        "fakh_details_button", "Add collapsible section", "Comments and markdown", restart = false,
        description = "<details>",
        group = "Comment toolbar",
    )
    val ADD_TABLE = Feature(
        "fakh_table_button", "Add table", "Comments and markdown", restart = false,
        description = "Markdown table template.",
        group = "Comment toolbar",
    )
    val SHOW_MENTION_AVATARS = Feature(
        "fakh_mention_avatars", "Show avatar before each @mention", "Comments and markdown", restart = false,
        group = "Markdown",
    )
    val SHORTEN_GITHUB_LINKS = Feature(
        "fakh_shorten_links", "Shorten GitHub links", "Comments and markdown", restart = false,
        description = "owner/repo#123 or owner/repo/file@tag",
        group = "Markdown",
    )
    val FOLD_CODE = Feature(
        "fakh_collapse_code", "Fold long code blocks", "Comments and markdown", restart = false,
        description = "If longer than 25 lines.",
        group = "Markdown",
    )
    val DRAW_MERMAID = Feature(
        "fakh_mermaid", "Draw Mermaid diagrams", "Comments and markdown", restart = false,
        description = "Instead of code blocks.",
        group = "Markdown",
    )

    val OVERRIDE_TAB_WIDTH = Feature("fakh_tab_width", "Override tab width", "Code", restart = false)
    val WHITESPACE_MARKS = Feature(
        "fakh_whitespace", "Show whitespace marks", "Code", restart = false,
        description = "Spaces and tabs.",
    )
    val HIDE_DIFF_SIGNS = Feature(
        "fakh_hide_diff_signs", "Hide + and - diff signs", "Code", restart = false,
        description = "Since diffs are already color-coded.",
    )

    val LINKIFY_CODE = Feature(
        "fakh_linkify_code", "Linkify code", "Code", restart = false,
        description = "Makes URLs and owner/repo#123 clickable.",
    )
    val HTML_PREVIEW_MENU = Feature(
        "fakh_html_preview", "Add Preview menu to HTML files", "Files and downloads", restart = false,
        group = "Files",
    )
    val FILE_DOWNLOAD_MENU = Feature(
        "fakh_download_files", "Add download menu to every file", "Files and downloads", restart = false,
        group = "Downloads",
    )
    val DOWNLOAD_ASSETS_NATIVELY = Feature(
        "fakh_download_assets", "Download assets natively", "Files and downloads", restart = false,
        group = "Downloads",
    )
    val DOWNLOAD_LOCATION = Feature(
        "fakh_download_folder", "Download location", "Files and downloads", group = "Downloads",
    )
    val SHOW_ASSET_DOWNLOAD_COUNT = Feature(
        "fakh_download_count", "Show download count for assets", "Files and downloads", restart = false,
        group = "Download count",
    )
}
