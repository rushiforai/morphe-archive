package app.fakhradio.patches

import app.fakhradio.patches.shared.Constants.COMPATIBILITY_RADIO_ID
import app.fakhradio.patches.shared.setElementAttributes
import app.fakhradio.patches.shared.setResourceValues
import app.fakhradio.patches.shared.setStyleItem
import app.fakhradio.patches.shared.setStyleItems
import app.fakhradio.patches.shared.writeColors
import app.fakhradio.patches.shared.writeResourceFile
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable

/** Light colors on Android 14+, as Material 3 surface roles. The app's own colors are the fallback. */
private val LIGHT_SURFACES_V34 = mapOf(
    "bg_light" to "system_surface_container_light",
    "bg_dark" to "system_surface_light",
    "bg" to "system_surface_container_light",
    "neutral_10" to "system_surface_container_high_light",
    "neutral_20" to "system_surface_container_highest_light",
)

/** [LIGHT_SURFACES_V34] as the neutral tones closest to them, for Android 12 and 13. */
private val LIGHT_SURFACES_V31 = mapOf(
    "bg_light" to "system_neutral2_100",
    "bg_dark" to "system_neutral2_50",
    "bg" to "system_neutral2_100",
    "neutral_10" to "system_neutral2_100",
    "neutral_20" to "system_neutral2_200",
)

/** Dark surfaces: the canvas is the darkest, cards one step up. neutral_20 is the card color in dark mode. */
private val DARK_SURFACES_V34 = mapOf(
    "bg_light" to "system_surface_dark",
    "bg_dark" to "system_surface_container_dark",
    "bg" to "system_surface_container_dark",
    "neutral_10" to "system_surface_container_high_dark",
    "neutral_20" to "system_surface_container_high_dark",
)

/** [DARK_SURFACES_V34] as the neutral tones closest to them, for Android 12 and 13. */
private val DARK_SURFACES_V31 = mapOf(
    "bg_light" to "system_neutral1_1000",
    "bg_dark" to "system_neutral1_900",
    "bg" to "system_neutral1_900",
    "neutral_10" to "system_neutral2_800",
    "neutral_20" to "system_neutral2_800",
)

/** The app's blues to the accent tone of the same lightness. The mini player is the strongest accent surface. */
private val LIGHT_ACCENTS = mapOf(
    "highlight_100" to "system_accent1_600",
    "highlight_100_inverted" to "system_accent2_100",
    "mini_player_background" to "system_accent1_700",
    "red_70" to "system_accent1_700",
    "neutral_90" to "system_neutral1_900",
    "highlight_100_day_only" to "system_accent1_600",
)

/** [LIGHT_ACCENTS] for dark mode, where the accent is a step lighter. */
private val DARK_ACCENTS = mapOf(
    "highlight_100" to "system_accent1_200",
    "highlight_100_inverted" to "system_accent2_700",
    "mini_player_background" to "system_accent1_600",
    "red_70" to "system_accent1_200",
    "neutral_90" to "system_neutral1_100",
    "highlight_100_day_only" to "system_accent1_600",
)

/** Corner radii and spacing between items, in values/dimens.xml. */
private val SHAPE_DIMENS = mapOf(
    "common_item_radius" to "16.0dp",
    "item_corner_radius" to "16.0dp",
    "mini_player_corners_radius" to "16.0dp",
    "common_item_margin_decoration" to "2.0dp",
    "playable_adapter_title_padding" to "6.0dp",
    "main_activity_bottom_bar_height" to "60.0dp",
    // The pages run under the whole floating now playing bar (88dp tall with its margin), not only its top part, and
    // their lists pad for it so the last row can scroll clear of it.
    "nav_host_container_content_padding_inv" to "-88.0dp",
    "nav_host_container_content_padding" to "96.0dp",
    "design_bottom_navigation_margin" to "4.0dp",
    "design_bottom_navigation_label_padding" to "2.0dp",
)

/** The bottom bar as Material 3 draws it: 24dp icons and the pill indicator behind the selected tab. */
private val NAVIGATION_BAR_ATTRIBUTES = mapOf(
    "app:itemIconSize" to "28.0dp",
    "app:itemBackground" to "@null",
    "app:itemActiveIndicatorStyle" to "@style/Widget.Material3.BottomNavigationView.ActiveIndicator",
)

/** Unselected card outlines are invisible; the selected card keeps its accent ring. */
private val CARD_BORDER_COLOR = """
    <?xml version="1.0" encoding="utf-8"?>
    <selector xmlns:android="http://schemas.android.com/apk/res/android">
        <item android:state_selected="true" android:color="@color/highlight_100" />
        <item android:color="@android:color/transparent" />
    </selector>
""".trimIndent()

private val CARD_BORDER_DRAWABLE = """
    <?xml version="1.0" encoding="utf-8"?>
    <selector xmlns:android="http://schemas.android.com/apk/res/android">
        <item android:state_selected="true">
            <shape android:shape="rectangle">
                <solid android:color="@android:color/transparent" />
                <stroke android:width="1.0dp" android:color="@color/highlight_100" />
                <corners android:radius="@dimen/common_item_radius" />
            </shape>
        </item>
        <item>
            <shape android:shape="rectangle">
                <solid android:color="@android:color/transparent" />
                <corners android:radius="@dimen/common_item_radius" />
            </shape>
        </item>
    </selector>
""".trimIndent()

/** Outline star for the favorite button, and the filled one for a favorited station. */
private fun starIcon(fill: String, stroke: String) = """
    <?xml version="1.0" encoding="utf-8"?>
    <vector xmlns:android="http://schemas.android.com/apk/res/android"
        android:width="36dp" android:height="36dp" android:viewportWidth="24" android:viewportHeight="24">
        <path android:fillColor="$fill" android:strokeColor="$stroke" android:strokeWidth="1.5"
            android:strokeLineJoin="round"
            android:pathData="M12,3.5L14.6,9L20.5,9.8L16.2,13.9L17.3,19.8L12,16.9L6.7,19.8L7.8,13.9L3.5,9.8L9.4,9Z" />
    </vector>
""".trimIndent()

/** Play and pause as a plain white glyph, like the star and equalizer next to them. */
private fun mediaIcon(glyph: String) = """
    <?xml version="1.0" encoding="utf-8"?>
    <vector xmlns:android="http://schemas.android.com/apk/res/android"
        android:width="68dp" android:height="68dp" android:viewportWidth="68" android:viewportHeight="68">
        <path android:fillColor="@color/neutral_0" android:pathData="$glyph" />
    </vector>
""".trimIndent()

/** Equalizer sliders with no background tile. */
private val EQUALIZER_ICON = """
    <?xml version="1.0" encoding="utf-8"?>
    <vector xmlns:android="http://schemas.android.com/apk/res/android"
        android:width="36dp" android:height="36dp" android:viewportWidth="24" android:viewportHeight="24">
        <path android:fillColor="@android:color/transparent" android:strokeColor="@color/neutral_0"
            android:strokeWidth="1.5" android:strokeLineCap="round"
            android:pathData="M4,6H20M4,12H20M4,18H20" />
        <path android:fillColor="@color/neutral_0" android:pathData="M9,4.5a1.5,1.5 0 1,0 0.01,0ZM15,10.5a1.5,1.5 0 1,0 0.01,0ZM7,16.5a1.5,1.5 0 1,0 0.01,0Z" />
    </vector>
""".trimIndent()

/** Colors per Android version and theme, then shapes and spacing. */
private val materialYouResourcePatch = resourcePatch {
    execute {
        writeColors("values-v34", LIGHT_SURFACES_V34)
        writeColors("values-v31", LIGHT_SURFACES_V31 + LIGHT_ACCENTS)
        writeColors("values-night-v34", DARK_SURFACES_V34)
        writeColors("values-night-v31", DARK_SURFACES_V31 + DARK_ACCENTS)

        document("res/values/dimens.xml").use { setResourceValues(it, "dimen", SHAPE_DIMENS) }
        document("res/values/styles.xml").use { styles ->
            setStyleItem(styles, "GridItemImageShapeOverlay", "cornerSize", "16.0dp")
            setStyleItem(styles, "ImageViewBorder", "cornerSize", "16.0dp")
            setStyleItem(styles, "Best.Base", "android:statusBarColor", "@color/bg")
            // The full player is pale now, so its status and navigation bars get dark icons.
            setStyleItems(
                styles, "Best.Activity.Player",
                mapOf("android:windowLightStatusBar" to "true", "android:windowLightNavigationBar" to "true"),
            )
            // The pill behind the selected tab: the accent, with the white selected glyph on top.
            setStyleItem(styles, "Widget.Material3.BottomNavigationView.ActiveIndicator", "android:color", "@color/highlight_100_inverted")
        }
        writeResourceFile("color/grid_item_border_selector.xml", CARD_BORDER_COLOR)
        writeResourceFile("drawable/grid_item_border_selector.xml", CARD_BORDER_DRAWABLE)
        writeResourceFile("drawable/cr_miniplayer_star_no.xml", starIcon("#00000000", "@color/neutral_0"))
        writeResourceFile("drawable/cr_miniplayer_star_yes.xml", starIcon("@color/neutral_0", "@color/neutral_0"))
        writeResourceFile("drawable/cr_miniplayer_play.xml", mediaIcon("M28,22L48,34L28,46Z"))
        writeResourceFile("drawable/cr_miniplayer_pause.xml", mediaIcon("M26,22h6v24h-6zM38,22h6v24h-6z"))
        // The bottom bar builds each tab icon over this tile; an empty tile leaves only the glyph.
        writeResourceFile("drawable/cr_menu_icon_background_tintable.xml", TRANSPARENT_TILE)
        writeResourceFile("drawable/mini_player_background_ripple.xml", MINI_PLAYER_BACKGROUND)
        (listOf("home", "radio", "world", "podcasts", "star").map { "cr_menu_${it}_active" } +
            listOf(
                "cr_settings", "cr_items_grid", "cr_items_list", "cr_list_item_star_no", "cr_list_item_star_yes",
                "toolbar_arrow_left", "cr_toolbar_star_no", "search_gray_squared", "back_gray_squared", "drag_handle",
            ))
            .forEach { writeResourceFile("drawable/$it.xml", tileFreeDrawable(it)) }
        writeResourceFile("layout/cr_mini_player_2026.xml", MINI_PLAYER_LAYOUT)
        // The search box: a filled pill like Drive's, with no underline or magnifier. The pill is the text field, so the
        // back button sits outside it. The code toggles these views' visibility, so the hidden ones also get no size.
        val hidden = mapOf("android:visibility" to "gone", "android:layout_width" to "0.0dp", "android:layout_height" to "0.0dp")
        val searchField = mapOf(
            "android:background" to "@drawable/search_background_ripple",
            "android:paddingStart" to "16.0dp",
            "android:paddingEnd" to "16.0dp",
            "android:minHeight" to "40.0dp",
            // The field's own tint colored its underline; on the pill it would recolor the whole fill.
            "android:backgroundTint" to "@color/neutral_10",
        )
        val noBackground = mapOf("android:background" to "@null")
        val pillBackground = mapOf("android:background" to "@drawable/search_background_ripple")
        document("res/layout/cr_include_search_bar.xml").use {
            setElementAttributes(it, "RelativeLayout", noBackground, pillBackground)
            setElementAttributes(it, "EditText", searchField, mapOf("android:id" to "@id/etSearch"))
        }
        document("res/layout/cr_appmind_searchbar_view.xml").use {
            setElementAttributes(it, "RelativeLayout", noBackground, pillBackground)
            setElementAttributes(it, "EditText", searchField, mapOf("android:id" to "@id/etSearch"))
            setElementAttributes(it, "ImageView", hidden, mapOf("android:id" to "@id/ib_search"))
        }
        document("res/layout/cr_include_search_bar_placeholder.xml").use {
            setElementAttributes(it, "ImageButton", hidden, mapOf("android:id" to "@id/ib_search"))
            setElementAttributes(it, "TextView", mapOf("android:paddingStart" to "16.0dp"), mapOf("android:id" to "@id/et_search"))
        }
        writeResourceFile("drawable/search_background_ripple.xml", SEARCH_BACKGROUND)
        listOf("cr_main_header_with_favorites", "cr_main_header_without_favorites", "cr_search_header_without_logo").forEach { layout ->
            document("res/layout/$layout.xml").use {
                setElementAttributes(it, "RelativeLayout", mapOf("android:background" to "@color/bg"), mapOf("android:background" to "@color/bg_dark"))
            }
        }
        // Alarm and sleep timer: the time as big plain text, weekdays as round chips, play as a round tonal button.
        val pill = mapOf("android:background" to "@drawable/mini_player_background_ripple")
        val bigTime = mapOf(
            "android:background" to "@drawable/ripple_transparent_square",
            "android:textSize" to "40.0sp",
            "android:textColor" to "@color/neutral_100",
            "android:drawableEnd" to "@null",
            "android:paddingStart" to "0.0dp",
            "android:minWidth" to "0.0dp",
        )
        document("res/layout/preference_alarm.xml").use {
            val chip = pill + mapOf(
                "android:textColor" to "@color/alarm_time_tint",
                "android:layout_height" to "40.0dp",
                "android:minHeight" to "0.0dp",
                "android:stateListAnimator" to "@null",
                "android:layout_marginHorizontal" to "3.0dp",
            )
            setElementAttributes(it, "ToggleButton", chip)
            setElementAttributes(it, "Button", bigTime, mapOf("android:id" to "@id/alarm_time"))
        }
        document("res/layout/preference_sleep_timer.xml").use {
            setElementAttributes(it, "Button", bigTime, mapOf("android:id" to "@id/sleep_timer_duration"))
            setElementAttributes(
                it, "FrameLayout",
                pill + mapOf(
                    "android:backgroundTint" to "@color/mini_player_background",
                    "android:layout_width" to "48.0dp",
                    "android:layout_height" to "48.0dp",
                ),
                mapOf("android:id" to "@id/fl_play_container"),
            )
            setElementAttributes(
                it, "ImageButton",
                mapOf("app:tint" to "@color/neutral_0", "android:padding" to "12.0dp"),
                mapOf("android:id" to "@id/play_pause_button"),
            )
        }
        // The full player: station details on top, one rounded artwork card (the logo when no cover), a big play button,
        // plain icon actions, then volume, on a pale background.
        listOf(
            "layout/activity_sliding_player.xml",
            "layout/include_player_background_blurred.xml",
            "drawable/player_close.xml",
            "drawable/bg_fab_scroll_to_top.xml",
            "drawable/bg_sync_button.xml",
            "drawable/mytuner_vec_player_animation.xml",
            "drawable/mytuner_vec_placeholder_stations.xml",
            "drawable-nodpi/sp_volume_progress.xml",
            "drawable-nodpi/sp_volume_thumb.xml",
            "drawable-nodpi/sp_playable_progress.xml",
            "drawable-nodpi/sp_progress_thumb.xml",
        ).forEach { writeResourceFile(it, bundledResource(it)) }
        writeResourceFile("color/alarm_weekday_tint.xml", ALARM_WEEKDAY_TINT)
        writeResourceFile("color/alarm_time_tint.xml", ALARM_WEEKDAY_TEXT)
        // The tab row under the header sits on the same tinted surface as the header.
        document("res/layout/cr_fragment_podcast_episode_detail.xml").use {
            setElementAttributes(it, "ImageView", mapOf("android:layout_marginBottom" to "40.0dp"), mapOf("android:id" to "@id/fab_scroll_to_top"))
            setElementAttributes(it, "TextView", mapOf("android:layout_marginBottom" to "100.0dp"), mapOf("android:id" to "@id/fab_sync_transcript"))
        }
        document("res/layout/cr_fragment_home.xml").use {
            val surface = mapOf("android:background" to "@color/bg")
            setElementAttributes(it, "LinearLayout", surface, mapOf("android:id" to "@id/ll_header_and_tabs"))
            setElementAttributes(it, "FrameLayout", surface, mapOf("android:id" to "@id/fl_home_tabs_background"))
        }
        document("res/layout/cr_activity_main.xml").use {
            setElementAttributes(it, "com.google.android.material.bottomnavigation.BottomNavigationView", NAVIGATION_BAR_ATTRIBUTES)
            // The empty block behind the now playing bar: its drop shadow, which sits on the app background.
            setElementAttributes(it, "View", mapOf("android:visibility" to "gone"), mapOf("android:background" to "@drawable/player_drop_shadow_up"))
        }
        writeResourceFile("drawable/cr_equalizer_36.xml", EQUALIZER_ICON)
    }
}

/** A tab tile with no fill, so the bottom bar shows only the glyph. */
private val TRANSPARENT_TILE = """
    <?xml version="1.0" encoding="utf-8"?>
    <shape xmlns:android="http://schemas.android.com/apk/res/android" android:shape="rectangle">
        <solid android:color="@android:color/transparent" />
    </shape>
""".trimIndent()

/** A drawable with its tile fill removed, bundled in resources/drawables next to this patch. */
private fun tileFreeDrawable(name: String): String =
    object {}.javaClass.getResourceAsStream("/drawables/$name.xml")?.bufferedReader()?.use { it.readText() }
        ?: throw PatchException("Drawable $name not bundled")

/** The search box background: a filled pill on a surface tone, no outline. It has no ripple, which stays lit while typing. */
private val SEARCH_BACKGROUND = """
    <?xml version="1.0" encoding="utf-8"?>
    <shape xmlns:android="http://schemas.android.com/apk/res/android" android:shape="rectangle">
        <corners android:radius="@dimen/search_corner_radius" />
        <solid android:color="@color/neutral_10" />
    </shape>
""".trimIndent()

/** Alarm weekday chips: the accent when checked, a pale surface otherwise. */
private val ALARM_WEEKDAY_TINT = """
    <?xml version="1.0" encoding="utf-8"?>
    <selector xmlns:android="http://schemas.android.com/apk/res/android">
        <item android:state_enabled="true" android:state_checked="true" android:color="@color/mini_player_background" />
        <item android:color="@color/neutral_20" />
    </selector>
""".trimIndent()

/** Text on the weekday chips: white on the accent, dark on the pale surface, dim while the alarm is off. */
private val ALARM_WEEKDAY_TEXT = """
    <?xml version="1.0" encoding="utf-8"?>
    <selector xmlns:android="http://schemas.android.com/apk/res/android">
        <item android:state_enabled="true" android:state_checked="true" android:color="@color/neutral_0" />
        <item android:state_enabled="false" android:color="@color/neutral_60" />
        <item android:color="@color/neutral_100" />
    </selector>
""".trimIndent()

/** A bundled replacement for a resource of the app, at the same path under res, from resources/bundled. */
private fun bundledResource(path: String): String =
    object {}.javaClass.getResourceAsStream("/bundled/$path")?.bufferedReader()?.use { it.readText() }
        ?: throw PatchException("Resource $path not bundled")

/** The now playing bar as a floating rounded card in the accent color. */
private val MINI_PLAYER_BACKGROUND = """
    <?xml version="1.0" encoding="utf-8"?>
    <shape xmlns:android="http://schemas.android.com/apk/res/android" android:shape="rectangle">
        <solid android:color="@color/mini_player_background" />
        <corners android:radius="26.0dp" />
    </shape>
""".trimIndent()

/**
 * The now playing bar in two lines of text: artwork and title on the left, then star, equalizer and play/pause in
 * one row of equal buttons. The bars animation is hidden, and the bar floats above the bottom bar.
 */
private val MINI_PLAYER_LAYOUT = """
    <?xml version="1.0" encoding="utf-8"?>
    <LinearLayout android:orientation="vertical" android:background="@android:color/transparent" android:focusable="true" android:clickable="true" android:layout_width="match_parent" android:layout_height="wrap_content" android:layout_marginHorizontal="12.0dp" android:layout_marginBottom="12.0dp"
      xmlns:android="http://schemas.android.com/apk/res/android" xmlns:app="http://schemas.android.com/apk/res-auto">
        <ImageButton android:id="@id/ib_open_player" android:visibility="gone" android:layout_width="wrap_content" android:layout_height="wrap_content" android:contentDescription="@string/content_description_player_open" app:srcCompat="@drawable/cr_miniplayer_arrow_up_ripple" />
        <FrameLayout android:layout_width="match_parent" android:layout_height="wrap_content">
            <LinearLayout android:gravity="center_vertical" android:orientation="horizontal" android:id="@id/ll_normal_state" android:background="@drawable/mini_player_background_ripple" android:padding="10.0dp" android:clipChildren="false" android:clipToPadding="false" android:layout_width="match_parent" android:layout_height="wrap_content">
                <androidx.cardview.widget.CardView android:id="@id/fl_playable_icon_container" android:layout_width="56.0dp" android:layout_height="56.0dp" android:layout_marginEnd="10.0dp" app:cardBackgroundColor="@color/mini_player_icon_transparent_background" app:cardCornerRadius="16.0dp" app:cardElevation="0.0dp">
                    <com.google.android.material.imageview.ShapeableImageView android:id="@id/iv_playable_icon" android:background="@color/neutral_80" android:layout_width="match_parent" android:layout_height="match_parent" android:scaleType="centerCrop" android:src="@drawable/old_icon_stations_white" app:shapeAppearanceOverlay="@style/GridItemImageShapeOverlay" app:strokeColor="@color/neutral_10" app:strokeWidth="1.0dp" />
                </androidx.cardview.widget.CardView>
                <LinearLayout android:orientation="vertical" android:layout_width="0.0dp" android:layout_height="wrap_content" android:layout_weight="1.0">
                    <com.airbnb.lottie.LottieAnimationView android:id="@id/anim_is_playing_success" android:visibility="gone" android:layout_width="0.0dp" android:layout_height="0.0dp" app:lottie_loop="true" app:lottie_rawRes="@raw/miniplayer_bars_off" />
                    <app.fakhradio.extension.MarqueeTextView android:textSize="@dimen/font_size_sm" android:textStyle="bold" android:textColor="@color/neutral_0" android:ellipsize="marquee" android:id="@id/tv_title" android:scrollbars="none" android:layout_width="match_parent" android:layout_height="wrap_content" android:scrollHorizontally="true" android:singleLine="true" android:marqueeRepeatLimit="marquee_forever" />
                    <app.fakhradio.extension.MarqueeTextView android:textSize="@dimen/font_size_xs" android:textColor="@color/neutral_0" android:ellipsize="marquee" android:id="@id/tv_subtitle" android:scrollbars="none" android:layout_width="match_parent" android:layout_height="wrap_content" android:scrollHorizontally="true" android:singleLine="true" android:marqueeRepeatLimit="marquee_forever" android:textFontWeight="@integer/font_weight_medium" />
                </LinearLayout>
                <LinearLayout android:gravity="center_vertical" android:orientation="horizontal" android:id="@id/ll_other_actions" android:layout_width="wrap_content" android:layout_height="wrap_content">
                    <ImageButton android:id="@id/ib_icon_fav" android:background="@drawable/ripple_transparent" android:layout_width="44.0dp" android:layout_height="44.0dp" android:padding="6.0dp" android:scaleType="fitCenter" android:contentDescription="@string/content_description_player_favorite_toggle" app:srcCompat="@drawable/cr_miniplayer_star_no" />
                    <ImageButton android:id="@id/ib_equalizer" android:background="@drawable/ripple_transparent" android:visibility="gone" android:layout_width="44.0dp" android:layout_height="44.0dp" android:padding="6.0dp" android:scaleType="fitCenter" android:contentDescription="@string/TRANS_EQUALIZER" app:srcCompat="@drawable/cr_equalizer_36" />
                    <FrameLayout android:clipChildren="false" android:clipToPadding="false" android:layout_width="44.0dp" android:layout_height="44.0dp">
                        <ImageButton android:layout_gravity="center" android:id="@id/ib_icon_play" android:background="@null" android:layout_width="match_parent" android:layout_height="match_parent" android:scaleType="fitCenter" android:contentDescription="@string/content_description_player_play_pause" app:srcCompat="@drawable/cr_miniplayer_play" />
                        <com.airbnb.lottie.LottieAnimationView android:layout_gravity="center" android:id="@id/anim_play_started_once" android:visibility="gone" android:layout_width="0.0dp" android:layout_height="0.0dp" app:lottie_loop="true" app:lottie_rawRes="@raw/miniplayer_play_started_reaction" />
                    </FrameLayout>
                    <ImageButton android:id="@id/ib_no_ads" android:background="@drawable/ripple_transparent" android:visibility="gone" android:layout_width="44.0dp" android:layout_height="44.0dp" android:padding="6.0dp" android:scaleType="fitCenter" android:contentDescription="@string/TRANS_PREF_PRO" app:srcCompat="@drawable/cr_no_ads_36" />
                </LinearLayout>
            </LinearLayout>
            <FrameLayout android:id="@id/group_player_error" android:background="@drawable/mini_player_error_background_v2_ripple" android:visibility="gone" android:layout_width="match_parent" android:layout_height="match_parent" android:elevation="5.0dp">
                <ImageView android:id="@id/player_error_text_background" android:layout_width="match_parent" android:layout_height="match_parent" android:src="@drawable/mini_player_text_error_background" android:scaleType="fitXY" />
                <LinearLayout android:gravity="center_vertical" android:orientation="horizontal" android:padding="12.0dp" android:layout_width="match_parent" android:layout_height="match_parent">
                    <ImageView android:id="@id/player_error_icon" android:layout_width="56.0dp" android:layout_height="56.0dp" android:src="@drawable/icon_player_error_alert" android:importantForAccessibility="no" />
                    <TextView android:textSize="18.0sp" android:textStyle="bold" android:textColor="#fff" android:gravity="center" android:id="@id/player_error_description" android:layout_width="0.0dp" android:layout_height="wrap_content" android:text="@string/TRANS_PLAYER_ERROR" android:shadowColor="#4d3e0000" android:shadowDx="0.0" android:shadowDy="3.0" android:shadowRadius="4.0" android:layout_weight="1.0" android:lineSpacingMultiplier="1.11" android:layout_marginStart="10.0dp" android:layout_marginEnd="10.0dp" />
                </LinearLayout>
            </FrameLayout>
        </FrameLayout>
    </LinearLayout>
""".trimIndent()

/** The blue the player tints the transcript row being played with, and a translucent gray in its place. */
private const val TRANSCRIPT_BLUE = 1711434458
private const val TRANSCRIPT_TINT = 0x40888888

/** Resource ids of neutral_0 and neutral_90, as the app's R class has them. */
private const val NEUTRAL_0_ID = 2131100641
private const val NEUTRAL_90_ID = 2131100650

@Suppress("unused")
val materialYouPatch = bytecodePatch(
    name = "Material You",
    description = "Uses your wallpaper's colors (Android 12+) for the accent and the surfaces, in light and dark mode. " +
        "Rounder corners and wider spacing between items.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_RADIO_ID)
    category("Theme")
    dependsOn(materialYouResourcePatch)
    extendWith("extensions/extension.mpe")

    execute {
        // The transcript row being played is tinted with a blue the app writes as a number. A translucent gray reads on
        // both the light and the dark theme.
        val adapter = mutableClassDefBy("Lcom/appmind/countryradios/screens/podcasts/q0;")
        var tinted = 0
        adapter.methods.forEach { method ->
            val instructions = method.implementation?.instructions?.toList() ?: return@forEach
            instructions.withIndex().filter { (_, instruction) ->
                instruction is NarrowLiteralInstruction && instruction.narrowLiteral == TRANSCRIPT_BLUE
            }.forEach { (index, instruction) ->
                method.replaceInstruction(index, "const v${(instruction as OneRegisterInstruction).registerA}, $TRANSCRIPT_TINT")
                tinted++
            }
        }
        if (tinted == 0) throw PatchException("Transcript row tint not found")

        // The full player forces white status and navigation bar icons when it starts; they get dark ones in the light
        // theme, where the player is pale.
        val bars = mutableClassDefBy("Lcom/appmind/countryradios/screens/player/SlidingPlayerActivity;")
            .methods.first { it.name == "t0" }
        val barInstructions = bars.implementation!!.instructions.toList()
        val lightFlags = barInstructions.withIndex()
            .filter { (_, instruction) -> instruction.opcode == Opcode.CONST_4 && (instruction as NarrowLiteralInstruction).narrowLiteral == 0 }
        // One register holds the false for both calls.
        if (lightFlags.size != 1) throw PatchException("Expected 1 bar icon flag in the player, found ${lightFlags.size}")
        lightFlags.reversed().forEach { (index, instruction) ->
            val register = (instruction as OneRegisterInstruction).registerA
            bars.replaceInstruction(index, "invoke-static { p0 }, Lapp/fakhradio/extension/Bars;->darkIcons(Landroid/content/Context;)Z")
            bars.addInstructions(index + 1, "move-result v$register")
        }

        // The bottom bar's selected glyph color is the default of z.d, which the app sets from neutral_0 (white).
        // Point it at neutral_90: dark in light mode, light in dark mode, so the glyph reads on the pale pill.
        // The field is a constant without a static initializer, so this adds one.
        val holder = mutableClassDefBy("Lcom/appmind/countryradios/z;")
        holder.methods.add(
            ImmutableMethod(
                holder.type,
                "<clinit>",
                emptyList(),
                "V",
                AccessFlags.STATIC.value or AccessFlags.CONSTRUCTOR.value,
                null,
                null,
                MutableMethodImplementation(1),
            ).toMutable().apply {
                addInstructions(
                    0,
                    """
                        const v0, $NEUTRAL_90_ID
                        sput v0, ${holder.type}->d:I
                        return-void
                    """,
                )
            },
        )
    }
}
