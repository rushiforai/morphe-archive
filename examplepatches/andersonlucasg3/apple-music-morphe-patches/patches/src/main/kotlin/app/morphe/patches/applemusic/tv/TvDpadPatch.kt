package app.morphe.patches.applemusic.tv

import app.morphe.patcher.patch.resourceFile
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.applemusic.shared.Constants.APPLE_MUSIC_DILINK
import org.w3c.dom.Element

private const val MATERIAL_CARD_VIEW = "com.google.android.material.card.MaterialCardView"
private const val DEFAULT_FOCUS_HIGHLIGHT = "android:defaultFocusHighlightEnabled"
private const val FOREGROUND = "android:foreground"
private const val RIPPLE = "?attr/selectableItemBackground"
private const val FOCUSABLE = "android:focusable"
private const val FOCUSABLE_IN_TOUCH_MODE = "android:focusableInTouchMode"
private const val STATE_LIST_ANIMATOR = "android:stateListAnimator"
private const val ADD_STATES_FROM_CHILDREN = "android:addStatesFromChildren"
private const val FOCUS_ANIMATOR = "@anim/tv_focus_scale"
private const val FOCUS_ANIMATOR_PATH = "res/anim/tv_focus_scale.xml"

/**
 * Grows the focused card by 6% and lifts it 8dp, so the D-pad target stands out on a TV.
 * The scale is on the View itself, not on a `foreground`, so it does not need a drawable
 * and Android keeps the card's own background and content.
 */
private val FOCUS_ANIMATOR_XML = """
    <?xml version="1.0" encoding="utf-8"?>
    <selector xmlns:android="http://schemas.android.com/apk/res/android">
        <item android:state_focused="true">
            <set>
                <objectAnimator android:duration="120" android:propertyName="scaleX" android:valueTo="1.06" android:valueType="floatType" />
                <objectAnimator android:duration="120" android:propertyName="scaleY" android:valueTo="1.06" android:valueType="floatType" />
                <objectAnimator android:duration="120" android:propertyName="translationZ" android:valueTo="8dp" android:valueType="floatType" />
            </set>
        </item>
        <item>
            <set>
                <objectAnimator android:duration="120" android:propertyName="scaleX" android:valueTo="1.0" android:valueType="floatType" />
                <objectAnimator android:duration="120" android:propertyName="scaleY" android:valueTo="1.0" android:valueType="floatType" />
                <objectAnimator android:duration="120" android:propertyName="translationZ" android:valueTo="0dp" android:valueType="floatType" />
            </set>
        </item>
    </selector>
""".trimIndent()


/**
 * A layout and the View inside it that takes the D-pad focus. The app already makes the clickable
 * View focusable at runtime, so the highlight has to go on that View: the layout root for the
 * swiping grids, the `card_content` child for the MaterialCardView cards.
 *
 * `forceForeground` adds the ripple even when the View has a background of its own (the player
 * controls use `selectableItemBackgroundBorderless` backgrounds).
 */
private class FocusTarget(
    val path: String,
    val id: String? = null,
    val forceForeground: Boolean = false,
    val focusable: Boolean = false,
)

/** Listen Now and Search cards: they get the scale animator instead of a grey ripple. */
private val FOCUS_TARGETS = listOf(
    // Listen Now, swiping grids: the click is bound to the ConstraintLayout root.
    FocusTarget("res/layout/swiping_grid_a_standard.xml"),
    FocusTarget("res/layout/swiping_grid_a_catalog_only.xml"),
    FocusTarget("res/layout/swiping_grid_b_standard.xml"),
    // Listen Now, MaterialCardView cards: the click is bound to the `card_content` child.
    FocusTarget("res/layout/power_swoosh_container_a.xml", "card_content"),
    FocusTarget("res/layout/power_swoosh_container_b.xml", "card_content"),
    FocusTarget("res/layout/super_hero_container_a.xml", "card_content"),
    // Search: result row and landing row.
    FocusTarget("res/layout/search_list_a.xml"),
    FocusTarget("res/layout/search_landing_row.xml"),
    FocusTarget("res/layout/small_list_d_item.xml"),
    FocusTarget("res/layout-w600dp-v13/small_list_d_item.xml"),
)

/** Mini player: the whole bar click-expands the Now Playing fragment. */
private val MINI_PLAYER_TARGETS = listOf(
    FocusTarget("res/layout/mini_player.xml", "mini_player_content", true, true),
    FocusTarget("res/layout-w830dp-v13/mini_player.xml", "mini_player_content", true, true),
)

/** Now Playing: the media controls live in a shared include, the rest in the player layout. */
private val NOW_PLAYING_TARGETS = listOf(
    FocusTarget("res/layout/constraint_player_media_controls.xml", "seek_bar_controls"),
    FocusTarget("res/layout/player_progress_seek_bar.xml", "progress", true),
    FocusTarget("res/layout/constraint_player_media_controls.xml", "play_pause", true),
    FocusTarget("res/layout/constraint_player_media_controls.xml", "previous_rewind", true),
    FocusTarget("res/layout/constraint_player_media_controls.xml", "next_fast_forward", true),
    FocusTarget("res/layout/constraint_player_media_controls.xml", "player_lyrics", true),
    FocusTarget("res/layout/constraint_player_media_controls.xml", "player_queue", true),
    FocusTarget("res/layout/constraint_player_media_controls.xml", "media_route_button", true),
    FocusTarget("res/layout/music_player.xml", "enter_full_screen", true),
    FocusTarget("res/layout/music_player.xml", "list_favorite_icon", true),
    FocusTarget("res/layout/music_player.xml", "list_left_icon", true),
    FocusTarget("res/layout-w600dp-v13/music_player.xml", "enter_full_screen", true),
    FocusTarget("res/layout-w600dp-v13/music_player.xml", "list_favorite_icon", true),
    FocusTarget("res/layout-w600dp-v13/music_player.xml", "list_left_icon", true),
)

/**
 * The media-controls container is focusable and swallows LEFT/DOWN inside the sheet; the arrows
 * have to move between its children instead.
 */
private val NON_FOCUSABLE_TARGETS = listOf(
    "res/layout/music_player.xml" to "player_controls",
    "res/layout-w600dp-v13/music_player.xml" to "player_controls",
)

/**
 * The content viewport ends below the top bar and above the mini player, so the FocusFinder can
 * leave the list in both directions without any bytecode hook. The padding goes on the fragment
 * container, not on the individual lists.
 */
private val CONTENT_HOSTS = listOf(
    "res/layout/fragment_music_content.xml",
    "res/layout-w600dp-v13/fragment_music_content.xml",
)
private const val CONTENT_HOST_ID = "tab_navigation_host"

/**
 * The settings overflow (⋮) is a Compose node inside a ComposeView the D-pad never enters: the
 * ComposeView is not focusable at View level, so the FocusFinder skips its whole subtree. Making
 * the host focusable plus `afterDescendants` lets the focus reach the Compose view instead of
 * stopping on the wrapper itself.
 */
private val APP_BAR_HOSTS = listOf(
    "res/layout/fragment_listen_now.xml",
    "res/layout/fragment_landing_search.xml",
)
private const val APP_BAR_HOST_ID = "floating_app_bar_container"
private const val DESCENDANT_FOCUSABILITY = "android:descendantFocusability"

@Suppress("unused")
internal val tvDpadPatch = resourcePatch(
    name = "TV: D-pad focus",
    description = "Adds a visible focus highlight to the Listen Now cards, the Search rows and " +
        "the player, and reserves room for the mini player around the content viewport.",
    default = false,
) {
    compatibleWith(APPLE_MUSIC_DILINK)
    dependsOn(tvManifestPatch)

    finalize {
        // Adding a resource of a type the APK has no file of yet: `copy = false` only creates the
        // slot, then the file is written as text and compiled with the other changed resources.
        resourceFile(FOCUS_ANIMATOR_PATH, copy = false).apply {
            parentFile?.mkdirs()
            writeText(FOCUS_ANIMATOR_XML)
        }

        for (target in FOCUS_TARGETS) {
            document(target.path).use { document ->
                val root: Element = document.documentElement
                val id = target.id
                val view: Element = if (id == null) root else {
                    findById(root, id) ?: error("$id not found in ${target.path}")
                }

                view.setAttribute(DEFAULT_FOCUS_HIGHLIGHT, "true")
                // The app focuses the `card_content` child, so scaling it alone would clip the
                // artwork and captions inside the MaterialCardView. The card takes the focus
                // state of its children and scales as a whole instead.
                val card = if (view === root) null else cardAncestor(view)
                val animatorTarget = card ?: view
                animatorTarget.setAttribute(STATE_LIST_ANIMATOR, FOCUS_ANIMATOR)
                if (card != null) {
                    card.setAttribute(ADD_STATES_FROM_CHILDREN, "true")
                }
            }
        }

        for (target in MINI_PLAYER_TARGETS + NOW_PLAYING_TARGETS) {
            document(target.path).use { document ->
                val root: Element = document.documentElement
                val id = target.id
                val view: Element = if (id == null) root else {
                    findById(root, id) ?: error("$id not found in ${target.path}")
                }

                view.setAttribute(DEFAULT_FOCUS_HIGHLIGHT, "true")
                if (target.focusable) {
                    view.setAttribute(FOCUSABLE, "true")
                    view.setAttribute(FOCUSABLE_IN_TOUCH_MODE, "true")
                }
                val hasOwnBackground = view.hasAttribute("android:background") ||
                    view.hasAttribute(FOREGROUND)
                if (target.forceForeground || (!hasOwnBackground && view.tagName != MATERIAL_CARD_VIEW)) {
                    view.setAttribute(FOREGROUND, RIPPLE)
                }
            }
        }

        for ((path, id) in NON_FOCUSABLE_TARGETS) {
            document(path).use { document ->
                val view = findById(document.documentElement, id) ?: return@use
                view.setAttribute(FOCUSABLE, "false")
                view.setAttribute(FOCUSABLE_IN_TOUCH_MODE, "false")
            }
        }

        // Keep the focus on the pill bar instead of dropping it on an extra DOWN.
        for (path in listOf("res/layout/mini_player.xml", "res/layout-w830dp-v13/mini_player.xml")) {
            document(path).use { document ->
                findById(document.documentElement, "mini_player_content")?.let { content ->
                    content.setAttribute("android:nextFocusDown", "@id/mini_player_content")
                }
            }
        }
        for (path in CONTENT_HOSTS) {
            document(path).use { document ->
                val host = findById(document.documentElement, CONTENT_HOST_ID)
                    ?: error("$CONTENT_HOST_ID not found in $path")
                host.setAttribute("android:paddingTop", "?attr/actionBarSize")
                host.setAttribute("android:paddingBottom", "80dp") // miniplayer_height (64dp) + 16dp gap
                host.setAttribute("android:clipToPadding", "false")
            }
        }
        for (path in APP_BAR_HOSTS) {
            document(path).use { document ->
                val host = findById(document.documentElement, APP_BAR_HOST_ID)
                    ?: error("$APP_BAR_HOST_ID not found in $path")
                host.setAttribute(FOCUSABLE, "true")
                host.setAttribute(DESCENDANT_FOCUSABILITY, "afterDescendants")
            }
        }
    }
}

private fun findById(root: Element, id: String): Element? {
    val elements = root.getElementsByTagName("*")
    return (0 until elements.length)
        .map { index -> elements.item(index) as Element }
        .firstOrNull { element -> element.getAttribute("android:id").endsWith("/$id") }
}

/** The MaterialCardView the focused View is drawn in, if any. */
private fun cardAncestor(view: Element): Element? {
    var node = view.parentNode
    while (node is Element) {
        if (node.tagName == MATERIAL_CARD_VIEW) return node
        node = node.parentNode
    }
    return null
}










