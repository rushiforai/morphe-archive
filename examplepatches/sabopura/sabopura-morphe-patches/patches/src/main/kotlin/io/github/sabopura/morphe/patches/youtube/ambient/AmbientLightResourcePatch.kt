package io.github.sabopura.morphe.patches.youtube.ambient

import app.morphe.patcher.patch.resourcePatch
import io.github.sabopura.morphe.patches.youtube.Constants.YOUTUBE
import io.github.sabopura.morphe.patches.youtube.shared.addSettingsEntry
import io.github.sabopura.morphe.patches.youtube.shared.addStringArray
import io.github.sabopura.morphe.patches.youtube.shared.addStrings
import io.github.sabopura.morphe.patches.youtube.shared.firstExistingDrawable
import io.github.sabopura.morphe.patches.youtube.shared.registerSettingsActivity
import io.github.sabopura.morphe.patches.youtube.shared.sharedSettingsResourcePatch
import io.github.sabopura.morphe.patches.youtube.shared.writeSettingsLayout

private const val SETTINGS_ACTIVITY =
    "io.github.sabopura.morphe.extension.youtube.ambient.AmbientLightSettingsActivity"
private const val SETTINGS_ACTION = "io.github.sabopura.morphe.action.OPEN_AMBIENT_LIGHT_SETTINGS"
private const val ADVANCED_ACTIVITY =
    "io.github.sabopura.morphe.extension.youtube.ambient.AmbientLightAdvancedSettingsActivity"
private const val ADVANCED_ACTION = "io.github.sabopura.morphe.action.OPEN_AMBIENT_LIGHT_ADVANCED_SETTINGS"

private val englishStrings = linkedMapOf(
    "ambient_light_settings_title" to "Ambient light",
    "ambient_light_settings_summary" to "Light the area around videos with the picture’s glow",
    "ambient_enabled_title" to "Ambient light",
    "ambient_enabled_summary" to "The watch page turns see-through and the video's light fills the screen. The light calms down while you scroll or touch the page",
    "ambient_level_title" to "Immersion",
    "ambient_interaction_dim_title" to "Calmer while scrolling",
    "ambient_interaction_dim_summary" to "Tone the light down while you scroll or touch the page and bring it back after a few seconds without input",
    "ambient_status_title" to "Status (tap for details)",
    "ambient_advanced_title" to "Advanced settings",
    "ambient_advanced_summary" to "Where to show, light shape, colours, black bars, and performance",
    "ambient_where_title" to "Where to show",
    "ambient_fullscreen_title" to "Fullscreen",
    "ambient_fullscreen_summary" to "Pillarbox and letterbox bars in fullscreen",
    "ambient_small_player_title" to "Bars in the regular player",
    "ambient_small_player_summary" to "Bars around vertical and non-16:9 videos in the regular player",
    "ambient_custom_title" to "Custom immersion",
    "ambient_custom_summary" to "Used when Immersion is set to Custom",
    "ambient_page_strength_title" to "Strength",
    "ambient_page_size_title" to "Reach",
    "ambient_page_cover_title" to "Colour veil over the page",
    "ambient_idle_delay_title" to "Return to full light after",
    "ambient_light_title" to "Light",
    "ambient_blur_title" to "Blur",
    "ambient_spread_title" to "Spread",
    "ambient_edge_fade_title" to "Fade towards the screen edge (fullscreen)",
    "ambient_brightness_title" to "Brightness",
    "ambient_saturation_title" to "Colour saturation",
    "ambient_bars_title" to "Black bars inside the video",
    "ambient_bar_detection_title" to "Ignore black bars when picking colours",
    "ambient_bar_detection_summary" to "Use the picture inside letterboxed movies, not the black bars",
    "ambient_fill_bars_title" to "Light black bars inside the video",
    "ambient_fill_bars_summary" to "Also paint burned-in letterbox bars (e.g. cinema-scope movies)",
    "ambient_performance_title" to "Quality and battery",
    "ambient_frame_rate_title" to "Frame rate",
    "ambient_quality_title" to "Colour detail",
    "ambient_smoothing_title" to "Smoothing (flicker reduction)",
    "ambient_energy_saver_title" to "Save energy",
    "ambient_energy_saver_summary" to "Stop updating while paused or buffering and on still pictures",
    "ambient_effects_title" to "How the light looks",
    "ambient_soft_light_title" to "Blur the light strongly",
    "ambient_soft_light_summary" to "Only the video's colours spread out as a soft glow, blurred so far that shapes disappear. Very bright light is toned down a little so text stays readable",
    "ambient_hide_time_bar_title" to "Hide the progress bar under the video",
    "ambient_hide_time_bar_summary" to "While the player buttons are hidden, the thin progress bar along the bottom of the video is not shown, so the video blends into its light. It appears again when you tap the video",
    "ambient_picture_backdrop_title" to "Show the video behind the page",
    "ambient_picture_backdrop_summary" to "Instead of a soft coloured glow, the page background shows the video itself, blurred as if seen through frosted glass",
    "ambient_falloff_title" to "Darker towards the bottom",
    "ambient_falloff_summary" to "The light is brightest just below the player and gets darker towards the bottom of the screen, as if it spilled out of the video",
    "ambient_scene_wave_title" to "Spread the light on scene changes",
    "ambient_scene_wave_summary" to "When the scene in the video changes, the new colours spread out from the player across the screen like a wave",
    "ambient_breathe_title" to "Pulse slowly while paused",
    "ambient_breathe_summary" to "While the video is paused, the light slowly gets brighter and dimmer. Uses a little more battery",
    "ambient_reset_title" to "Reset to defaults",
    "ambient_reset_summary" to "Restore every ambient light setting",
)

private val japaneseStrings = linkedMapOf(
    "ambient_light_settings_title" to "アンビエントライト",
    "ambient_light_settings_summary" to "動画のまわりを映像の色の光で照らします",
    "ambient_enabled_title" to "アンビエントライト",
    "ambient_enabled_summary" to "視聴ページが透けて、動画の光が画面全体を包みます。スクロールや操作中は光が控えめになります",
    "ambient_level_title" to "没入感",
    "ambient_interaction_dim_title" to "操作中は控えめにする",
    "ambient_interaction_dim_summary" to "スクロールや画面に触れている間は光を弱め、数秒操作しないと元の強さに戻します",
    "ambient_status_title" to "状態（タップで詳細）",
    "ambient_advanced_title" to "詳細設定",
    "ambient_advanced_summary" to "表示する場所・光の形・色・黒帯・パフォーマンス",
    "ambient_where_title" to "表示する場所",
    "ambient_fullscreen_title" to "全画面",
    "ambient_fullscreen_summary" to "全画面表示の左右・上下の黒帯",
    "ambient_small_player_title" to "通常プレーヤー内の黒帯",
    "ambient_small_player_summary" to "縦長動画や16:9以外の動画の黒帯",
    "ambient_custom_title" to "カスタムの没入感",
    "ambient_custom_summary" to "「没入感」を「カスタム」にしたときに使います",
    "ambient_page_strength_title" to "強さ",
    "ambient_page_size_title" to "光が届く範囲",
    "ambient_page_cover_title" to "ページにかける色のベール",
    "ambient_idle_delay_title" to "元の強さに戻るまでの時間",
    "ambient_light_title" to "光",
    "ambient_blur_title" to "ぼかし",
    "ambient_spread_title" to "広がり",
    "ambient_edge_fade_title" to "画面端に向けて暗くする（全画面）",
    "ambient_brightness_title" to "明るさ",
    "ambient_saturation_title" to "彩度",
    "ambient_bars_title" to "映像内の黒帯",
    "ambient_bar_detection_title" to "色を取るときに黒帯を無視",
    "ambient_bar_detection_summary" to "映画などの黒帯ではなく、映像部分から色を取ります",
    "ambient_fill_bars_title" to "映像内の黒帯も照らす",
    "ambient_fill_bars_summary" to "シネスコ映画など、映像に焼き込まれた黒帯にも光を描きます",
    "ambient_performance_title" to "画質とバッテリー",
    "ambient_frame_rate_title" to "フレームレート",
    "ambient_quality_title" to "色の細かさ",
    "ambient_smoothing_title" to "なめらかさ（ちらつき軽減）",
    "ambient_energy_saver_title" to "省電力",
    "ambient_energy_saver_summary" to "一時停止・読み込み中や静止画では更新を止めます",
    "ambient_effects_title" to "光の見せ方",
    "ambient_soft_light_title" to "光を強くぼかす",
    "ambient_soft_light_summary" to "形が分からなくなるくらい光をぼかし、動画の色だけがふんわり広がるようにします。光がとても明るいときは、文字が読みやすいよう少し抑えます",
    "ambient_hide_time_bar_title" to "動画の下の再生バーを隠す",
    "ambient_hide_time_bar_summary" to "プレーヤーのボタンが消えている間は、動画の下の端にある細い再生バーを表示しません。動画と光の境目が目立たなくなります。動画をタップすると再生バーも表示されます",
    "ambient_picture_backdrop_title" to "背景に動画の映像を映す",
    "ambient_picture_backdrop_summary" to "背景を、ぼんやりした色の光ではなく、動画の映像そのものをすりガラス越しに見たような表示にします",
    "ambient_falloff_title" to "画面の下に行くほど暗くする",
    "ambient_falloff_summary" to "プレーヤーのすぐ下がいちばん明るく、画面の下に向かってだんだん暗くなります。動画から光がこぼれているように見えます",
    "ambient_scene_wave_title" to "場面が変わったら光を広げる",
    "ambient_scene_wave_summary" to "動画の場面が切り替わったとき、新しい色の光がプレーヤーから波のように画面全体へ広がります",
    "ambient_breathe_title" to "一時停止中は光をゆっくり明滅させる",
    "ambient_breathe_summary" to "動画を止めている間、光がゆっくり明るくなったり暗くなったりします。電池を少し多く使います",
    "ambient_reset_title" to "初期設定に戻す",
    "ambient_reset_summary" to "アンビエントライトの設定をすべて初期値に戻します",
)

private const val MAIN_PREFERENCES_XML = """<?xml version="1.0" encoding="utf-8"?>
<PreferenceScreen xmlns:android="http://schemas.android.com/apk/res/android">
    <SwitchPreference android:key="ambient_enabled"
        android:title="@string/ambient_enabled_title"
        android:summary="@string/ambient_enabled_summary"
        android:defaultValue="true" />
    <PreferenceCategory android:title="@string/ambient_effects_title">
        <SwitchPreference android:key="ambient_soft_light"
            android:title="@string/ambient_soft_light_title"
            android:summary="@string/ambient_soft_light_summary"
            android:defaultValue="false" android:dependency="ambient_enabled" />
        <SwitchPreference android:key="ambient_hide_time_bar"
            android:title="@string/ambient_hide_time_bar_title"
            android:summary="@string/ambient_hide_time_bar_summary"
            android:defaultValue="false" android:dependency="ambient_enabled" />
        <SwitchPreference android:key="ambient_picture_backdrop"
            android:title="@string/ambient_picture_backdrop_title"
            android:summary="@string/ambient_picture_backdrop_summary"
            android:defaultValue="false" android:dependency="ambient_enabled" />
        <SwitchPreference android:key="ambient_falloff"
            android:title="@string/ambient_falloff_title"
            android:summary="@string/ambient_falloff_summary"
            android:defaultValue="false" android:dependency="ambient_enabled" />
        <SwitchPreference android:key="ambient_scene_wave"
            android:title="@string/ambient_scene_wave_title"
            android:summary="@string/ambient_scene_wave_summary"
            android:defaultValue="false" android:dependency="ambient_enabled" />
        <SwitchPreference android:key="ambient_breathe"
            android:title="@string/ambient_breathe_title"
            android:summary="@string/ambient_breathe_summary"
            android:defaultValue="true" android:dependency="ambient_enabled" />
    </PreferenceCategory>
    <Preference android:key="ambient_advanced"
        android:title="@string/ambient_advanced_title"
        android:summary="@string/ambient_advanced_summary"
        android:persistent="false" android:dependency="ambient_enabled">
        <intent android:action="$ADVANCED_ACTION" />
    </Preference>
    <Preference android:key="ambient_reset" android:title="@string/ambient_reset_title"
        android:summary="@string/ambient_reset_summary" android:persistent="false" />
    <Preference android:key="ambient_status" android:title="@string/ambient_status_title"
        android:persistent="false" />
</PreferenceScreen>
"""

// No android:dependency here: the master switch lives on the main screen.
private const val ADVANCED_PREFERENCES_XML = """<?xml version="1.0" encoding="utf-8"?>
<PreferenceScreen xmlns:android="http://schemas.android.com/apk/res/android">
    <PreferenceCategory android:title="@string/ambient_where_title">
        <SwitchPreference android:key="ambient_fullscreen"
            android:title="@string/ambient_fullscreen_title"
            android:summary="@string/ambient_fullscreen_summary"
            android:defaultValue="true" />
        <SwitchPreference android:key="ambient_small_player"
            android:title="@string/ambient_small_player_title"
            android:summary="@string/ambient_small_player_summary"
            android:defaultValue="true" />
        <ListPreference android:key="ambient_idle_delay" android:title="@string/ambient_idle_delay_title"
            android:entries="@array/ambient_idle_delay_entries" android:entryValues="@array/ambient_idle_delay_values"
            android:defaultValue="3" android:summary="%s" />
    </PreferenceCategory>
    <PreferenceCategory android:title="@string/ambient_light_title">
        <ListPreference android:key="ambient_blur" android:title="@string/ambient_blur_title"
            android:entries="@array/ambient_percent_entries" android:entryValues="@array/ambient_percent_values"
            android:defaultValue="60" android:summary="%s" />
        <ListPreference android:key="ambient_spread" android:title="@string/ambient_spread_title"
            android:entries="@array/ambient_percent_entries" android:entryValues="@array/ambient_percent_values"
            android:defaultValue="30" android:summary="%s" />
        <ListPreference android:key="ambient_edge_fade" android:title="@string/ambient_edge_fade_title"
            android:entries="@array/ambient_percent_entries" android:entryValues="@array/ambient_percent_values"
            android:defaultValue="50" android:summary="%s" />
        <ListPreference android:key="ambient_brightness" android:title="@string/ambient_brightness_title"
            android:entries="@array/ambient_brightness_entries" android:entryValues="@array/ambient_brightness_values"
            android:defaultValue="100" android:summary="%s" />
        <ListPreference android:key="ambient_saturation" android:title="@string/ambient_saturation_title"
            android:entries="@array/ambient_saturation_entries" android:entryValues="@array/ambient_saturation_values"
            android:defaultValue="120" android:summary="%s" />
    </PreferenceCategory>
    <PreferenceCategory android:title="@string/ambient_bars_title">
        <SwitchPreference android:key="ambient_bar_detection"
            android:title="@string/ambient_bar_detection_title"
            android:summary="@string/ambient_bar_detection_summary"
            android:defaultValue="true" />
        <SwitchPreference android:key="ambient_fill_bars"
            android:title="@string/ambient_fill_bars_title"
            android:summary="@string/ambient_fill_bars_summary"
            android:defaultValue="false" />
    </PreferenceCategory>
    <PreferenceCategory android:title="@string/ambient_performance_title">
        <ListPreference android:key="ambient_frame_rate" android:title="@string/ambient_frame_rate_title"
            android:entries="@array/ambient_frame_rate_entries" android:entryValues="@array/ambient_frame_rate_values"
            android:defaultValue="30" android:summary="%s" />
        <ListPreference android:key="ambient_quality" android:title="@string/ambient_quality_title"
            android:entries="@array/ambient_quality_entries" android:entryValues="@array/ambient_quality_values"
            android:defaultValue="1" android:summary="%s" />
        <ListPreference android:key="ambient_smoothing" android:title="@string/ambient_smoothing_title"
            android:entries="@array/ambient_smoothing_entries" android:entryValues="@array/ambient_smoothing_values"
            android:defaultValue="50" android:summary="%s" />
        <SwitchPreference android:key="ambient_energy_saver"
            android:title="@string/ambient_energy_saver_title"
            android:summary="@string/ambient_energy_saver_summary"
            android:defaultValue="true" />
    </PreferenceCategory>
</PreferenceScreen>
"""

/** Adds the ambient light screens to YouTube settings using platform preference widgets. */
internal val ambientLightResourcePatch = resourcePatch(
    name = null,
    description = "Embeds YouTube-styled ambient light preferences.",
    default = false,
) {
    dependsOn(sharedSettingsResourcePatch)
    compatibleWith(YOUTUBE)

    execute {
        registerSettingsActivity(SETTINGS_ACTIVITY, SETTINGS_ACTION, "ambient_light_settings_title")
        registerSettingsActivity(ADVANCED_ACTIVITY, ADVANCED_ACTION, "ambient_advanced_title")

        document("res/values/strings.xml").use { it.addStrings(englishStrings) }
        document("res/values-ja/strings.xml").use { it.addStrings(japaneseStrings) }
        document("res/values/arrays.xml").use { arrays ->
            fun addPair(name: String, entries: List<String>, values: List<Int>) {
                arrays.addStringArray("${name}_entries", entries)
                arrays.addStringArray("${name}_values", values.map(Int::toString))
            }
            val percents = listOf(0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100)
            addPair("ambient_percent", percents.map { "$it%" }, percents)
            val brightness = listOf(50, 70, 85, 100, 115, 130, 150, 175, 200)
            addPair("ambient_brightness", brightness.map { "$it%" }, brightness)
            val saturation = listOf(0, 50, 80, 100, 120, 140, 160, 200, 250)
            addPair("ambient_saturation", saturation.map { "$it%" }, saturation)
            val pageStrength = listOf(20, 40, 60, 80, 100)
            addPair("ambient_page_strength", pageStrength.map { "$it%" }, pageStrength)
            val pageSize = listOf(50, 100, 150, 200, 300, 1000)
            addPair(
                "ambient_page_size",
                pageSize.map { if (it == 1000) "Whole screen" else "$it% of the player height" },
                pageSize,
            )
            val pageCover = listOf(0, 20, 40, 60, 80)
            addPair("ambient_page_cover", pageCover.map { if (it == 0) "Off" else "$it%" }, pageCover)
            val idleDelays = listOf(1, 2, 3, 5, 8, 15)
            addPair("ambient_idle_delay", idleDelays.map { "$it s" }, idleDelays)
            val frameRates = listOf(10, 15, 20, 24, 30, 45, 60)
            addPair("ambient_frame_rate", frameRates.map { "$it fps" }, frameRates)
            addPair("ambient_quality", listOf("Low (lightest)", "Medium", "High"), listOf(0, 1, 2))
            addPair(
                "ambient_smoothing",
                listOf("Off", "Low", "Medium", "High", "Maximum"),
                listOf(0, 25, 50, 70, 85),
            )
        }
        document("res/values-ja/arrays.xml").use { arrays ->
            arrays.addStringArray("ambient_quality_entries", listOf("低（最も軽い）", "中", "高"))
            arrays.addStringArray("ambient_smoothing_entries", listOf("オフ", "弱", "中", "強", "最大"))
            arrays.addStringArray(
                "ambient_page_size_entries",
                listOf(50, 100, 150, 200, 300, 1000)
                    .map { if (it == 1000) "画面全体" else "プレーヤーの高さの$it%" },
            )
            arrays.addStringArray(
                "ambient_page_cover_entries",
                listOf(0, 20, 40, 60, 80).map { if (it == 0) "なし" else "$it%" },
            )
            arrays.addStringArray(
                "ambient_idle_delay_entries",
                listOf(1, 2, 3, 5, 8, 15).map { "${it}秒" },
            )
        }
        get("res/xml").resolve("ambient_light_preferences.xml").writeText(MAIN_PREFERENCES_XML)
        get("res/xml").resolve("ambient_light_advanced_preferences.xml")
            .writeText(ADVANCED_PREFERENCES_XML)

        writeSettingsLayout("ambient_light_settings_with_toolbar", "ambient_light_settings_title")
        writeSettingsLayout("ambient_light_advanced_settings_with_toolbar", "ambient_advanced_title")

        addSettingsEntry(
            key = "ambient_light_settings",
            titleResource = "ambient_light_settings_title",
            summaryResource = "ambient_light_settings_summary",
            action = SETTINGS_ACTION,
            cairoIcon = firstExistingDrawable(
                "yt_outline_experimental_ambient_mode_vd_theme_24",
                "yt_outline_brightness_vd_theme_24",
                "yt_outline_message_bubble_left_vd_theme_24",
            ),
        )
    }
}
