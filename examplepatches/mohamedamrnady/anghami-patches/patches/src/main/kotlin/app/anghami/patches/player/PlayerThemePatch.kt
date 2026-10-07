package app.anghami.patches.player

import app.anghami.patches.shared.Constants.COMPATIBILITY_ANGHAMI_8_0_28
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.resourcePatch

/**
 * Player theme background: makes the player follow the app's day/night
 * theme instead of staying white-on-dark.
 *
 * Night mode carries the theme (dark window background, light text, accent
 * buttons). Day mode is deliberately stock: the same layouts resolve to
 * the original dark-player values (gray_dark background, white text/icons,
 * stock scrims) and the cover-art tint is back (see the "Player theme"
 * bytecode patch, which only removes the tint at night) — the original
 * player experience in light mode.
 *
 * The player's chrome is hardcoded white in every qualifier, so it only
 * ever read correctly on a dark background. Two new roles are introduced:
 *
 *   player_bg -> the app window background (day: white, night: #0c0d0d)
 *   player_fg -> the inverse (day: #000000, night: #ffffff)
 *   player_fg_NN -> the same foreground at the stock alpha (10/20/40/60%)
 *   player_accent -> @color/app_color in both modes (Anghami primary
 *     accent stock: pink day / lime night; Monet dynamic on v31+ with the
 *     Monet patch, which remaps branding_pink/yellow to system_primary).
 *     Every player BUTTON uses it in both modes; text stays on player_fg.
 *   player_on_accent -> inverse text on the accent (day: white on pink,
 *     night: black on lime). Used for pressed/selected pill fills.
 *
 * `player_fg_NN` are single-state ColorStateLists that REFERENCE
 * `@color/player_fg`, so one file covers both modes: a `<color>` tag
 * cannot combine a reference with alpha, so the day/night split has to
 * live in the referenced color rather than in the alpha slot.
 *
 * Layouts touched: the player shell (portrait + landscape), top bar,
 * controls (portrait / landscape / land), secondary state controls (both
 * orientations), the song page, the karaoke upsell label and the queue
 * feed (`fragment_player_feed`: the "In the queue" header; the pills keep
 * their style-driven grey with now-dark text). `textColor` / `tint` /
 * `borderColor` / `backgroundTint` slots that pointed at `@color/white`,
 * `@color/light_10`, `@color/white_60_percent_opacity` and
 * `@color/color_white_selector_becomes_black` are re-pointed at the
 * pill text selector (theme text idle like the audio pill, inverse
 * on-accent text when pressed, user call), and the
 * monochrome chrome icons get an `android:tint` — they are white vector
 * drawables, so a color-slot swap alone would not move them. Queue/lyrics
 * toggle icons use the state-aware `player_pill_icon_selector` (accent
 * idle, on-accent selected, matching the text) and their pills use
 * `player_pill_bg_selector` (transparent idle, accent fill selected).
 * Repeat + the three-dot menu use the plain `player_fg` tint.
 *
 * The split scrims (`iv_gradient` fullscreen + `bg_color` below the
 * seekbar) are re-pointed at a new `player_scrim` role: transparent in
 * day mode, stock 20% black at night. Day mode used to stack two black
 * scrims over the white theme background and read as a dirty grey wash;
 * now the top is clean theme background with one 20% band below the
 * seekbar. Night mode is pixel-identical to stock.
 *
 * WHAT IS DELIBERATELY PRESERVED
 * - The two-tone split at the progress bar (see above): it is now white
 *   vs one 20% band in day mode instead of grey vs double-grey, and
 *   untouched at night.
 * - `layout_player_banner.xml` (promoted-song card) keeps its own
 *   `black_80_transparent` CardView and light-on-dark text.
 * - The promoted-ad countdown ring and its drawables keep stock white
 *   (they are also used by `item_player_ad`, whose root is forced black).
 * - Branded badges (`ic_exclusive_badge`, `ic_claimed_song_badge`) are
 *   never tinted.
 * - `progress_player` / `player_seekbar_thumb` are left alone; the player
 *   gets its own `player_seekbar_progress` / `player_seekbar_thumb_theme`
 *   copies so the TV player, car mode and the volume slider keep stock
 *   white.
 * - Lyric line colors (`model_epoxy_lyrics_line` /
 *   `lyrics_line_large_layout`) are re-pointed at `@color/primaryText`,
 *   the same theme text every other screen uses (dark day / light night).
 *   The third lyric layout (`lyrics_line_layout`) already uses the
 *   grey/white selector and stays.
 *
 * Requires the companion bytecode patch "Player theme" for the night
 * side: without it the runtime cover color would overwrite `player_bg` on
 * every song change. The tint removal is night-only (day keeps the
 * per-song cover tint — the original light-mode experience).
 *
 * Buttons reached through view attributes (no bytecode needed): the
 * `PlayButton` disc (generic `color` styleable attr, `@id/play_btn`
 * only — the ad `@id/btn_play` keeps stock white), the `AnghamiTimeBar`
 * paints (`played/scrubber_color` accent, `unplayed` theme-grey; it
 * ignores `progressDrawable`/`thumb`, which is why the player-only
 * copies never took effect), the shuffle/enhance/save pills (plain theme
 * text + border like every other button, user call:
 * `AnghamiButton.d()` overwrites `android:textColor`, so the custom
 * `app:textColor`/`app:borderColor` attrs are set explicitly — plus the
 * "Player theme" bytecode patch for the `m0` runtime
 * overwrite, which now targets `primaryText`), the like/save/download
 * lotties (`app:lottie_colorFilter`, the ctor-supported KeyPath tint —
 * `app:tint`/`setColorFilter` are no-ops on LottieDrawable; all three
 * assets are pure-white fills so the filter recolors them in both modes),
 * the download progress overlay glyph (`backgroundTint`, same white
 * asset problem), and the lyric line layouts (hardcoded
 * white → `primaryText`).
 *
 * Evidence: `gray_dark` is `@color/dark_10` = `#ffa1a5ac` in BOTH
 * qualifiers (`values/colors.xml:238,369`; no `values-night` override), so
 * the stock player background is a fixed light grey — which is exactly
 * why the player looked "always dark" and unrelated to the app theme.
 */
@Suppress("unused")
val playerThemePatch = resourcePatch(
    name = "Player theme background",
    description = "Makes the player background, text, icons and seekbar follow the app's day/night theme. Keeps the darker split below the progress bar. Pair with 'Player theme'.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_ANGHAMI_8_0_28)
    category("Experimental")

    execute {
        // ------------------------------------------------------------------
        // 1. Day/night roles.
        // ------------------------------------------------------------------
        // NOTE: these must be appended to the EXISTING colors.xml files.
        // The resource encoder derives the entry type from the values file
        // name (trailing "s" stripped), so a `player_colors.xml` would
        // land in a bogus `player_color` type and fail with "Undefined
        // entry name" (see MonetColorsPatch for the full story).
        appendColors("res/values/colors.xml", colorsXmlEntriesDay)
        appendColors("res/values-night/colors.xml", colorsXmlEntriesNight)

        // NOTE: the alpha roles are PLAIN <color> entries, not
        // ColorStateLists. A <color> cannot combine a reference with alpha,
        // so a CSL would be the natural fit — but AnghamiTimeBar reads the
        // custom `app:buffered_color` attr in its constructor and a CSL
        // reference there blows up with
        // `NumberFormatException: For input string: "res/color/....xml"`
        // (verified on device, 2026-09-28), taking the whole player down.
        // Literal day/night values sidestep the whole class of problem and
        // are exactly the stock alphas the player already used.
        // Plain theme-text selector kept for compatibility (no longer
        // referenced by the queue pills, which use the accent-fill pair).
        writeNew(
            "res/color/player_fg_selector.xml",
            """<?xml version="1.0" encoding="utf-8"?>
<selector xmlns:android="http://schemas.android.com/apk/res/android">
    <item android:state_selected="true" android:color="@color/player_fg_60" />
    <item android:state_selected="false" android:color="@color/player_fg" />
</selector>
""",
        )

        // Queue/lyrics toggle pills, accent-fill + inverse on press (user
        // call): idle = transparent bg + accent icon + theme text
        // (audio-button style), selected = accent bg + on-accent icon +
        // on-accent text. Replaces the stock white fill that hid white
        // text in night mode and only faded text in day mode.
        writeNew(
            "res/color/player_pill_text_selector.xml",
            """<?xml version="1.0" encoding="utf-8"?>
<selector xmlns:android="http://schemas.android.com/apk/res/android">
    <item android:state_selected="true" android:color="@color/player_on_accent" />
    <item android:color="@color/player_fg" />
</selector>
""",
        )
        writeNew(
            "res/color/player_pill_icon_selector.xml",
            """<?xml version="1.0" encoding="utf-8"?>
<selector xmlns:android="http://schemas.android.com/apk/res/android">
    <item android:state_selected="true" android:color="@color/player_on_accent" />
    <item android:color="@color/player_accent" />
</selector>
""",
        )
        writeNew(
            "res/drawable/player_pill_bg_selected.xml",
            """<?xml version="1.0" encoding="utf-8"?>
<shape xmlns:android="http://schemas.android.com/apk/res/android" android:shape="rectangle">
    <solid android:color="@color/player_accent" />
    <corners android:radius="12.0dip" />
</shape>
""",
        )
        writeNew(
            "res/drawable/player_pill_bg_selector.xml",
            """<?xml version="1.0" encoding="utf-8"?>
<selector xmlns:android="http://schemas.android.com/apk/res/android">
    <item android:state_selected="true" android:drawable="@drawable/player_pill_bg_selected" />
    <item android:drawable="@android:color/transparent" />
</selector>
""",
        )

        // ------------------------------------------------------------------
        // 2. Player chrome layouts.
        // ------------------------------------------------------------------
        for (path in playerLayouts) {
            rewriteLayout(path)
        }

        // Download progress overlay: a translucent-white glyph View sitting
        // in the same slot as the download lottie (white-on-white in day
        // mode). Tint its background with the accent; SRC_IN keeps the
        // glyph shape and alpha. The element spans several lines, so the
        // attr goes on its closing line (same one-attr-per-line decode).
        run {
            val path = "res/layout/player_download_progress_view.xml"
            val file = get(path)
            val text = file.readText()
            check("@drawable/progress_download_layer_list" in text) {
                "expected progress_download_layer_list bg in $path"
            }
            if (!text.contains("android:backgroundTint=")) {
                var inTarget = false
                file.writeText(
                    text.lineSequence().joinToString("\n") { line ->
                        val trimmed = line.trim()
                        if (trimmed.startsWith("<") && !trimmed.startsWith("</") &&
                            !trimmed.startsWith("<!--") && !trimmed.startsWith("<?")
                        ) {
                            inTarget = false
                        }
                        if (trimmed.contains("@drawable/progress_download_layer_list")) {
                            inTarget = true
                        }
                        if (inTarget && trimmed.endsWith("/>")) {
                            inTarget = false
                            line.trimEnd().removeSuffix("/>") +
                                " android:backgroundTint=\"@color/player_accent\"/>"
                        } else {
                            line
                        }
                    },
                )
            }
        }

        // ------------------------------------------------------------------
        // 3. White-based scrims / fills: REVERTED to stock (round 4). The
        //    player_fg_20 repoint read as dirty-grey circles/pills in day
        //    mode (repeat/share backgrounds, selected pills); stock white
        //    is what the user wants there.
        // ------------------------------------------------------------------

        // ------------------------------------------------------------------
        // 4. Seekbar: new player-only drawables so the TV player, the car
        //    mode player and the volume slider keep their stock white.
        // ------------------------------------------------------------------
        writeNew("res/drawable/player_seekbar_progress.xml", seekbarProgress(theme = true))
        writeNew("res/drawable-night/player_seekbar_progress.xml", seekbarProgress(theme = false))
        writeNew("res/drawable/player_seekbar_thumb_theme.xml", seekbarThumbSelector)
        writeNew("res/drawable/player_seekbar_thumb_normal_theme.xml", seekbarThumbNormal(theme = true))
        writeNew("res/drawable/player_seekbar_thumb_pressed_theme.xml", seekbarThumbPressed(theme = true))
        writeNew("res/drawable-night/player_seekbar_thumb_normal_theme.xml", seekbarThumbNormal(theme = false))
        writeNew("res/drawable-night/player_seekbar_thumb_pressed_theme.xml", seekbarThumbPressed(theme = false))

        // ------------------------------------------------------------------
        // 5. Lyrics: the line layouts paint hardcoded white. In night mode
        //    the player background is dark, so white is correct there; in
        //    day mode the cover tint is back (see the "Player theme"
        //    bytecode patch), so white is correct there too — stock
        //    behavior in both modes. Repoint at player_fg (white day and
        //    night) instead of the theme text, which would go dark in day
        //    mode and vanish on the tint. The grey-state selector lines
        //    (selector_gray_white) already read fine and stay.
        // ------------------------------------------------------------------
        for (path in lyricLineLayouts) {
            val file = get(path)
            val text = file.readText()
            check(text.split("@color/white").size == 2) { "expected exactly 1 white ref in $path" }
            file.writeText(text.replace("@color/white", "@color/player_fg"))
        }
    }
}

// ---------------------------------------------------------------------------
// Day/night role definitions
// ---------------------------------------------------------------------------

private const val colorsXmlEntriesDay = """    <color name="player_bg">@color/gray_dark</color>
    <color name="player_fg">@color/white</color>
    <color name="player_accent">@color/white</color>
    <color name="player_on_accent">@color/black</color>
    <color name="player_fg_10">#1affffff</color>
    <color name="player_fg_20">#33ffffff</color>
    <color name="player_fg_40">#66ffffff</color>
    <color name="player_fg_60">#99ffffff</color>
    <color name="player_scrim">@color/black_20_transparent</color>
"""

private const val colorsXmlEntriesNight = """    <color name="player_bg">@color/window_background_color</color>
    <color name="player_fg">@color/light_10</color>
    <color name="player_accent">@color/app_color</color>
    <color name="player_on_accent">@color/black</color>
    <color name="player_fg_10">#1affffff</color>
    <color name="player_fg_20">#33ffffff</color>
    <color name="player_fg_40">#66ffffff</color>
    <color name="player_fg_60">#99ffffff</color>
    <color name="player_scrim">@color/black_20_transparent</color>
"""

// Monochrome white chrome icons. Tinted via android:tint because they are
// white vector drawables, not color resources. Branded badges (gold
// EXCLUSIVE, trophy CLAIMED SONG) are intentionally absent. Queue/lyrics
// toggle icons are NOT here: they are state-aware (see pillTintIcons).
private val tintedIcons = setOf(
    "ic_close_player_white_34dp",
    "ic_explicit_white_24dp",
    "ic_previous",
    "ic_next",
    "ic_backward_15s",
    "ic_forward_30s",
    "ic_speed_1_0",
    "ic_sleep_timer",
    "ic_settings_filled",
    "ic_music_video_bold",
    "ic_bsd_rbt",
    "ic_dolbyatmos",
)

// Queue/lyrics toggle icons (white/black dual-drawble selectors stock).
// Idle uses the accent like every other button; selected follows the
// (un-tinted) text so icon and text always match on the accent fill.
private val pillTintIcons = setOf(
    "ic_player_queue_selector",
    "ic_player_lyrics_selector",
)

// Chrome icons that follow the normal text color (black day / white
// night) instead of the accent, per user call.
private val fgTintIcons = setOf(
    "ic_context_white_34dp",
    "selector_repeat_queue",
)

// White lottie buttons, recolored via the ctor-supported
// app:lottie_colorFilter (karaoke lottie deliberately absent).
private val lottieButtons = setOf("like_btn", "save_btn", "download_btn")

// Pill buttons whose text/border come from AnghamiButton's own attrs
// (android:textColor is overwritten in d(), so only app: attrs work).
private val pillButtons = setOf("btn_shuffle", "btn_more_like_this", "btn_save")

// Lyric line layouts with hardcoded white text. Re-pointed at the app's
// standard theme text (primaryText: dark day / light night) like every
// other screen, per user call.
private val lyricLineLayouts = listOf(
    "res/layout/model_epoxy_lyrics_line.xml",
    "res/layout/lyrics_line_large_layout.xml",
)

private val playerLayouts = listOf(
    "res/layout/layout_player.xml",
    "res/layout-land/layout_player.xml",
    "res/layout/layout_player_controls.xml",
    "res/layout-land/layout_player_controls.xml",
    "res/layout/layout_player_controls_landscape.xml",
    "res/layout/layout_player_top_bar.xml",
    "res/layout/layout_player_state_controls.xml",
    "res/layout/layout_player_state_controls_vertical.xml",
    "res/layout/player_song_layout.xml",
    "res/layout-land/player_song_layout.xml",
    "res/layout/fragment_player_feed.xml",
)

/** Attribute-level swaps. Longest / most specific first. */
private val attributeSwaps = listOf(
    // Queue/lyrics toggle text: stock white-selected-black becomes
    // theme-idle / on-accent-selected (audio-button style idle, inverse
    // text on the accent fill when pressed).
    "textColor=\"@color/color_white_selector_becomes_black\"" to "textColor=\"@color/player_pill_text_selector\"",
    "textColor=\"@color/white_60_percent_opacity\"" to "textColor=\"@color/player_fg_60\"",
    "app:buffered_color=\"@color/white_40_percent_opacity\"" to "app:buffered_color=\"@color/player_fg_40\"",
    "app:borderColor=\"@color/white\"" to "app:borderColor=\"@color/player_fg\"",
    "app:backgroundTint=\"@color/white\"" to "app:backgroundTint=\"@color/player_fg\"",
    "app:tint=\"@color/white\"" to "app:tint=\"@color/player_fg\"",
    "android:tint=\"@color/white\"" to "android:tint=\"@color/player_fg\"",
    "textColor=\"@color/white\"" to "textColor=\"@color/player_fg\"",
    "textColor=\"@color/light_10\"" to "textColor=\"@color/player_fg\"",
    "android:background=\"@color/gray_dark\"" to "android:background=\"@color/player_bg\"",
    // Queue/lyrics/audio toggle pills: stock transparent-idle / white-fill
    // selected becomes transparent-idle / accent-fill selected.
    "android:background=\"@drawable/bg_transparent_to_rounded_white_selector\"" to "android:background=\"@drawable/player_pill_bg_selector\"",
    // The two-tone split scrims (iv_gradient fullscreen + bg_color below the
    // seekbar) are the ONLY black_20_transparent refs in these layouts, so a
    // blanket swap is safe. Day becomes transparent (no more grey wash over
    // the white theme background; the split survives as white vs one 20%
    // band below the seekbar); night keeps the stock 20% darkening.
    "android:background=\"@color/black_20_transparent\"" to "android:background=\"@color/player_scrim\"",
    "android:progressDrawable=\"@drawable/progress_player\"" to "android:progressDrawable=\"@drawable/player_seekbar_progress\"",
    "android:thumb=\"@drawable/player_seekbar_thumb\"" to "android:thumb=\"@drawable/player_seekbar_thumb_theme\"",
)

// ---------------------------------------------------------------------------
// Seekbar drawables (player-only copies; stock ones stay white for the TV
// player, car mode and the volume slider).
// ---------------------------------------------------------------------------

private fun seekbarProgress(theme: Boolean): String {
    // Fill + thumb are the primary accent in BOTH modes (app_color: pink
    // day / lime night stock, Monet dynamic); track/buffered stay
    // theme-grey via player_fg (single source for both qualifiers).
    val track = "@color/player_fg_20"
    val buffered = "@color/player_fg_40"
    val fill = "@color/player_accent"
    return """<?xml version="1.0" encoding="utf-8"?>
<layer-list
  xmlns:android="http://schemas.android.com/apk/res/android">
    <item android:id="@android:id/background">
        <shape>
            <corners android:radius="360.0dip" />
            <gradient android:startColor="$track" android:endColor="$track" android:angle="270.0" android:centerY="0.75" />
        </shape>
    </item>
    <item android:id="@android:id/secondaryProgress">
        <clip>
            <shape>
                <corners android:radius="360.0dip" />
                <gradient android:startColor="$buffered" android:endColor="$buffered" android:angle="270.0" android:centerY="0.75" />
            </shape>
        </clip>
    </item>
    <item android:id="@android:id/progress">
        <clip>
            <shape>
                <corners android:radius="360.0dip" />
                <gradient android:startColor="$fill" android:endColor="$fill" android:angle="270.0" />
            </shape>
        </clip>
    </item>
</layer-list>
"""
}

private const val seekbarThumbSelector = """<?xml version="1.0" encoding="utf-8"?>
<selector
  xmlns:android="http://schemas.android.com/apk/res/android">
    <item android:state_pressed="true" android:drawable="@drawable/player_seekbar_thumb_pressed_theme" />
    <item android:drawable="@drawable/player_seekbar_thumb_normal_theme" />
</selector>
"""

private fun seekbarThumbNormal(theme: Boolean): String {
    val inner = if (theme) "#00000000" else "#00ffffff"
    val ring = "@color/player_accent"
    return """<?xml version="1.0" encoding="utf-8"?>
<layer-list
  xmlns:android="http://schemas.android.com/apk/res/android">
    <item>
        <shape android:shape="oval">
            <size android:height="14.0dip" android:width="14.0dip" />
            <solid android:color="$inner" />
        </shape>
    </item>
    <item>
        <shape android:shape="oval">
            <stroke android:height="7.0dip" android:width="7.0dip" android:color="@android:color/transparent" />
            <solid android:color="$ring" />
        </shape>
    </item>
</layer-list>
"""
}

private fun seekbarThumbPressed(theme: Boolean): String {
    val fill = "@color/player_accent"
    return """<?xml version="1.0" encoding="utf-8"?>
<layer-list
  xmlns:android="http://schemas.android.com/apk/res/android">
    <item>
        <shape android:shape="oval">
            <size android:height="14.0dip" android:width="14.0dip" />
            <solid android:color="$fill" />
        </shape>
    </item>
</layer-list>
"""
}

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

private fun ResourcePatchContext.writeNew(path: String, content: String) {
    get(path).also { it.parentFile?.mkdirs() }.writeText(content)
}

private fun ResourcePatchContext.appendColors(path: String, entries: String) {
    val file = get(path)
    file.writeText(file.readText().replaceFirst("</resources>", "$entries</resources>"))
}

private fun ResourcePatchContext.rewriteLayout(path: String) {
    val file = get(path)
    var text = file.readText()
    for ((from, to) in attributeSwaps) {
        text = text.replace(from, to)
    }
    // Add android:tint to the monochrome chrome icons. NOTE: Morphe's
    // decode pretty-prints ONE ATTRIBUTE PER LINE (verified via a
    // diagnostic throw), so the element tag and its android:id never share
    // a line. The pass tracks the current element and applies each fix to
    // the element's CLOSING line. (The drawable-anchored tint branch works
    // regardless: it appends to the srcCompat line, still inside the
    // element.)
    //
    // Per-element fixes (tag + id anchor; constraint references never
    // contain the class name, so they can't false-positive):
    // - PlayButton disc (`play_btn` only — the ad layout uses `btn_play`
    //   and keeps its stock white disc on black): the disc tint comes from
    //   the generic `color` styleable attr (white default; precedent:
    //   mini_player_ad_item sets app:color). Accent disc in both modes.
    // - AnghamiTimeBar (`player_seekbar`): a fully custom SeekBar that
    //   ignores android:progressDrawable/thumb and paints from its own
    //   played/unplayed/scrubber color attrs (Q2/l.b styleable). The
    //   layout only set buffered/ad-marker colors, so progress ran on
    //   hardcoded white. Played/scrubber are now the accent, unplayed
    //   stays theme-grey.
    // - Like/save/download lotties: `app:lottie_colorFilter` — a REAL
    //   supported attr (LottieAnimationView ctor reads styleable index 7
    //   and registers a PorterDuff SRC_ATOP KeyPath("**") color filter,
    //   which persists across setAnimation swaps via the pending list).
    //   This is why `app:tint`/`ImageView.setColorFilter` were no-ops:
    //   LottieDrawable.setColorFilter just logs "Use addColorFilter
    //   instead." The karaoke lottie is colorful by design and is left
    //   alone.
    var currentTag = ""
    var pendingAppend: String? = null
    // AnghamiButton (shuffle / enhance / save pills) reads its OWN
    // textColor/borderColor attrs and overwrites android:textColor in
    // d(), so the generic swaps never reach it (verified: enhance kept
    // white with android:textColor=player_fg). Explicit app: attrs win
    // over the style default (precedent: item_podcast_list sets
    // app:textColor) — but note `playerfeed/c.m0` overwrites the text
    // AGAIN at runtime, so the "Player theme"
    // bytecode patch swaps that const to primaryText. The border slot is
    // left null there ("don't touch"), so this XML border is what
    // survives. All three pills get plain theme text + border (user call:
    // no accent text). Tracked per element; constraint references can't
    // false-positive because only the android:id= line counts.
    var buttonId: String? = null
    var hasAppTextColor = false
    var hasAppBorderColor = false
    text = text.lineSequence().joinToString("\n") { line ->
        val trimmed = line.trim()
        if (trimmed.startsWith("<") && !trimmed.startsWith("</") &&
            !trimmed.startsWith("<!--") && !trimmed.startsWith("<?")
        ) {
            currentTag = trimmed.substring(1).substringBefore(" ").substringBefore(">")
            // A new element cancels any unapplied fix (the id anchor sits
            // on a later attribute line; see below).
            pendingAppend = null
            buttonId = null
            hasAppTextColor = false
            hasAppBorderColor = false
        }
        if (currentTag.contains("AnghamiButton")) {
            // NOTE: substring match, not startsWith — single-line
            // elements (e.g. top-bar btn_save) carry id + attrs mid-line
            // and were silently skipped/mis-detected before (this also
            // avoids appending a duplicate app:borderColor).
            if (trimmed.contains("android:id=")) {
                buttonId = pillButtons.firstOrNull { id -> trimmed.contains(id) }
            }
            if (trimmed.contains("app:textColor=")) {
                hasAppTextColor = true
            }
            if (trimmed.contains("app:borderColor=")) {
                hasAppBorderColor = true
            }
        }
        // Id anchors may sit on any attribute line inside the element.
        if (pendingAppend == null) {
            pendingAppend = when {
                currentTag.contains("playbutton.PlayButton") &&
                    trimmed.contains("play_btn") ->
                    " app:color=\"@color/player_accent\""
                currentTag.contains("common.widgets.AnghamiTimeBar") &&
                    trimmed.contains("player_seekbar") ->
                    " app:played_color=\"@color/player_accent\"" +
                        " app:unplayed_color=\"@color/player_fg_20\"" +
                        " app:scrubber_color=\"@color/player_accent\""
                currentTag.contains("lottie.LottieAnimationView") &&
                    lottieButtons.any { id -> trimmed.contains(id) } ->
                    " app:lottie_colorFilter=\"@color/player_accent\""
                else -> null
            }
        }
        if (pendingAppend != null && trimmed.endsWith("/>")) {
            val append = pendingAppend!!
            pendingAppend = null
            line.trimEnd().removeSuffix("/>") + "$append/>"
        } else {
            val needsPillTint = trimmed.endsWith("/>") &&
                !trimmed.contains("android:tint=") &&
                pillTintIcons.any { icon ->
                    trimmed.contains("\"@drawable/$icon\"")
                }
            val needsFgTint = !needsPillTint && trimmed.endsWith("/>") &&
                !trimmed.contains("android:tint=") &&
                fgTintIcons.any { icon ->
                    trimmed.contains("\"@drawable/$icon\"")
                }
            val needsTint = !needsPillTint && !needsFgTint && trimmed.endsWith("/>") &&
                !trimmed.contains("android:tint=") &&
                tintedIcons.any { icon ->
                    trimmed.contains("\"@drawable/$icon\"")
                }
            var extra = ""
            if (buttonId != null && trimmed.endsWith("/>")) {
                // Feed pills + top-bar save: plain theme text and border
                // (user call: no accent text on shuffle/enhance/save).
                if (!hasAppTextColor) extra += " app:textColor=\"@color/player_fg\""
                if (!hasAppBorderColor) extra += " app:borderColor=\"@color/player_fg\""
                buttonId = null
            }
            if (needsTint || needsPillTint || needsFgTint || extra.isNotEmpty()) {
                line.trimEnd().removeSuffix("/>") +
                    (if (needsTint) " android:tint=\"@color/player_accent\"" else "") +
                    (if (needsPillTint) " android:tint=\"@color/player_pill_icon_selector\"" else "") +
                    (if (needsFgTint) " android:tint=\"@color/player_fg\"" else "") +
                    "$extra/>"
            } else {
                line
            }
        }
    }
    file.writeText(text)
}
