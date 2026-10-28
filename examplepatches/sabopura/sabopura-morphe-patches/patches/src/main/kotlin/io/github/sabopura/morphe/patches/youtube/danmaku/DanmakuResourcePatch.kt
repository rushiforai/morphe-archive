package io.github.sabopura.morphe.patches.youtube.danmaku

import app.morphe.patcher.patch.resourcePatch
import io.github.sabopura.morphe.patches.youtube.Constants.YOUTUBE
import io.github.sabopura.morphe.patches.youtube.shared.addSettingsEntry
import io.github.sabopura.morphe.patches.youtube.shared.addStringArray
import io.github.sabopura.morphe.patches.youtube.shared.addStrings
import io.github.sabopura.morphe.patches.youtube.shared.registerSettingsActivity
import io.github.sabopura.morphe.patches.youtube.shared.sharedSettingsResourcePatch
import io.github.sabopura.morphe.patches.youtube.shared.writeSettingsLayout

private const val SETTINGS_ACTIVITY =
    "io.github.sabopura.morphe.extension.youtube.danmaku.DanmakuSettingsActivity"
private const val SETTINGS_ACTION = "io.github.sabopura.morphe.action.OPEN_DANMAKU_SETTINGS_V2"

private val englishStrings = linkedMapOf(
    "danmaku_settings_title" to "Danmaku",
    "danmaku_settings_summary" to "Comments that flow across the video",
    "danmaku_enabled_title" to "Show danmaku",
    "danmaku_enabled_summary" to "Master switch for comments over the video",
    "danmaku_video_types_title" to "Where to show",
    "danmaku_regular_enabled_title" to "Regular videos",
    "danmaku_regular_enabled_summary" to "Show comments on uploaded videos",
    "danmaku_live_enabled_title" to "Live streams",
    "danmaku_live_enabled_summary" to "Show live chat and live chat replay messages",
    "danmaku_premiere_enabled_title" to "Premieres",
    "danmaku_premiere_enabled_summary" to "Show Premiere chat and chat replay messages",
    "danmaku_small_player_title" to "Show in the regular player",
    "danmaku_small_player_summary" to "Off shows danmaku only in fullscreen. Always hidden in the miniplayer",
    "danmaku_small_player_scale_title" to "Text size in the regular player",
    "danmaku_stream_comments_title" to "Live and Premiere comments",
    "danmaku_stream_comment_mode_title" to "Comment source",
    "danmaku_highlight_paid_title" to "Colour Super Chats and memberships",
    "danmaku_highlight_paid_summary" to "Use the Super Chat colour and keep them in front",
    "danmaku_regular_comments_title" to "Regular video comments",
    "danmaku_regular_mode_title" to "Comments to show",
    "danmaku_exclude_long_title" to "Exclude long comments",
    "danmaku_exclude_long_summary" to "Hide comments longer than the selected limit",
    "danmaku_max_length_title" to "Maximum characters",
    "danmaku_filter_title" to "Filter",
    "danmaku_ng_words_title" to "NG words",
    "danmaku_ng_words_summary" to "Hide comments containing these words. One per line or comma separated; /regex/ is supported",
    "danmaku_ng_words_dialog" to "Matching ignores case, full/half width, and hiragana/katakana.",
    "danmaku_merge_duplicates_title" to "Merge repeated comments",
    "danmaku_merge_duplicates_summary" to "Show spam such as “www” once with a ×count",
    "danmaku_separate_layer_title" to "Draw on a separate layer",
    "danmaku_separate_layer_summary" to "Keeps comments smooth without redrawing YouTube's screen every frame. Player controls and captions appear above the comments",
    "danmaku_show_stats_title" to "Show frame statistics",
    "danmaku_show_stats_summary" to "Diagnostics: shows the comment frame rate, display refresh rate and clock interval over the video",
    "danmaku_smooth_motion_title" to "Smooth motion",
    "danmaku_smooth_motion_summary" to "Keep the display at its highest refresh rate while comments move. Uses a little more battery",
    "danmaku_max_fps_title" to "Frame rate limit",
    "danmaku_appearance_title" to "Appearance",
    "danmaku_font_size_title" to "Text size",
    "danmaku_bold_title" to "Bold text",
    "danmaku_text_style_title" to "Text edge",
    "danmaku_opacity_title" to "Opacity",
    "danmaku_motion_title" to "Motion and layout",
    "danmaku_speed_mode_title" to "Scrolling speed",
    "danmaku_duration_title" to "Scroll duration",
    "danmaku_coverage_title" to "Vertical coverage",
    "danmaku_crowd_mode_title" to "When the screen is crowded",
    "danmaku_performance_title" to "Performance",
    "danmaku_max_comments_title" to "Comments retained",
    "danmaku_reset_title" to "Reset to defaults",
    "danmaku_reset_summary" to "Restore every danmaku setting",
    "danmaku_quick_toggle_on" to "Danmaku: On",
    "danmaku_quick_toggle_off" to "Danmaku: Off",
    "danmaku_player_settings_title" to "Danmaku settings",
)

private val japaneseStrings = linkedMapOf(
    "danmaku_settings_title" to "弾幕",
    "danmaku_settings_summary" to "コメントを動画上に流します",
    "danmaku_enabled_title" to "弾幕を表示",
    "danmaku_enabled_summary" to "動画上のコメント表示をまとめて切り替えます",
    "danmaku_video_types_title" to "表示する場所",
    "danmaku_regular_enabled_title" to "通常動画",
    "danmaku_regular_enabled_summary" to "投稿済み動画のコメントを表示します",
    "danmaku_live_enabled_title" to "ライブ",
    "danmaku_live_enabled_summary" to "ライブチャットとチャットリプレイを表示します",
    "danmaku_premiere_enabled_title" to "プレミア公開",
    "danmaku_premiere_enabled_summary" to "プレミア公開のチャットとリプレイを表示します",
    "danmaku_small_player_title" to "通常のプレーヤーでも表示",
    "danmaku_small_player_summary" to "オフにすると全画面のときだけ表示します。ミニプレーヤーでは常に非表示です",
    "danmaku_small_player_scale_title" to "通常のプレーヤーでの文字サイズ",
    "danmaku_stream_comments_title" to "ライブ・プレミア公開のコメント",
    "danmaku_stream_comment_mode_title" to "コメントの取得元",
    "danmaku_highlight_paid_title" to "スーパーチャットとメンバー加入に色を付ける",
    "danmaku_highlight_paid_summary" to "スーパーチャットの色で表示し、優先して流します",
    "danmaku_regular_comments_title" to "通常動画のコメント",
    "danmaku_regular_mode_title" to "表示するコメント",
    "danmaku_exclude_long_title" to "長いコメントを除外",
    "danmaku_exclude_long_summary" to "設定した文字数を超えるコメントを表示しません",
    "danmaku_max_length_title" to "最大文字数",
    "danmaku_filter_title" to "フィルター",
    "danmaku_ng_words_title" to "NGワード",
    "danmaku_ng_words_summary" to "この語句を含むコメントを表示しません。改行またはカンマ区切り、/正規表現/ にも対応",
    "danmaku_ng_words_dialog" to "大文字小文字・全角半角・ひらがなカタカナの違いは区別しません。",
    "danmaku_merge_duplicates_title" to "連投コメントをまとめる",
    "danmaku_merge_duplicates_summary" to "「www」などの同じコメントを「×回数」付きで1つにまとめます",
    "danmaku_separate_layer_title" to "専用レイヤーに描画",
    "danmaku_separate_layer_summary" to "YouTubeの画面を毎フレーム描き直さずに、コメントをなめらかに流します。操作ボタンや字幕はコメントの上に表示されます",
    "danmaku_show_stats_title" to "フレームレートを表示",
    "danmaku_show_stats_summary" to "診断用：コメントの描画fps・画面のリフレッシュレート・時刻更新の間隔を動画の上に表示します",
    "danmaku_smooth_motion_title" to "なめらかに流す",
    "danmaku_smooth_motion_summary" to "コメントが流れている間、画面を最高リフレッシュレートに保ちます。バッテリー消費が少し増えます",
    "danmaku_max_fps_title" to "最大フレームレート",
    "danmaku_appearance_title" to "見た目",
    "danmaku_font_size_title" to "文字サイズ",
    "danmaku_bold_title" to "太字",
    "danmaku_text_style_title" to "文字の縁取り",
    "danmaku_opacity_title" to "不透明度",
    "danmaku_motion_title" to "動きと配置",
    "danmaku_speed_mode_title" to "流れる速さ",
    "danmaku_duration_title" to "画面を横切る時間",
    "danmaku_coverage_title" to "縦方向の表示範囲",
    "danmaku_crowd_mode_title" to "画面が混雑したとき",
    "danmaku_performance_title" to "パフォーマンス",
    "danmaku_max_comments_title" to "保持するコメント数",
    "danmaku_reset_title" to "初期設定に戻す",
    "danmaku_reset_summary" to "弾幕の設定をすべて初期値に戻します",
    "danmaku_quick_toggle_on" to "弾幕：オン",
    "danmaku_quick_toggle_off" to "弾幕：オフ",
    "danmaku_player_settings_title" to "弾幕の設定",
)

private const val DANMAKU_PREFERENCES_XML = """<?xml version="1.0" encoding="utf-8"?>
<PreferenceScreen xmlns:android="http://schemas.android.com/apk/res/android">
    <SwitchPreference
        android:key="danmaku_enabled"
        android:title="@string/danmaku_enabled_title"
        android:summary="@string/danmaku_enabled_summary"
        android:defaultValue="true" />
    <PreferenceCategory android:title="@string/danmaku_video_types_title">
        <SwitchPreference android:key="danmaku_regular_enabled"
            android:title="@string/danmaku_regular_enabled_title"
            android:summary="@string/danmaku_regular_enabled_summary"
            android:defaultValue="true" android:dependency="danmaku_enabled" />
        <SwitchPreference android:key="danmaku_live_enabled"
            android:title="@string/danmaku_live_enabled_title"
            android:summary="@string/danmaku_live_enabled_summary"
            android:defaultValue="true" android:dependency="danmaku_enabled" />
        <SwitchPreference android:key="danmaku_premiere_enabled"
            android:title="@string/danmaku_premiere_enabled_title"
            android:summary="@string/danmaku_premiere_enabled_summary"
            android:defaultValue="true" android:dependency="danmaku_enabled" />
        <SwitchPreference android:key="danmaku_small_player_enabled"
            android:title="@string/danmaku_small_player_title"
            android:summary="@string/danmaku_small_player_summary"
            android:defaultValue="true" android:dependency="danmaku_enabled" />
        <ListPreference android:key="danmaku_small_player_scale"
            android:title="@string/danmaku_small_player_scale_title"
            android:entries="@array/danmaku_scale_entries" android:entryValues="@array/danmaku_scale_values"
            android:defaultValue="80" android:summary="%s" android:dependency="danmaku_small_player_enabled" />
    </PreferenceCategory>
    <PreferenceCategory android:title="@string/danmaku_stream_comments_title">
        <ListPreference android:key="danmaku_stream_comment_mode"
            android:title="@string/danmaku_stream_comment_mode_title"
            android:entries="@array/danmaku_stream_comment_mode_entries"
            android:entryValues="@array/danmaku_stream_comment_mode_values"
            android:defaultValue="0" android:summary="%s" android:dependency="danmaku_enabled" />
        <SwitchPreference android:key="danmaku_highlight_paid"
            android:title="@string/danmaku_highlight_paid_title"
            android:summary="@string/danmaku_highlight_paid_summary"
            android:defaultValue="true" android:dependency="danmaku_enabled" />
    </PreferenceCategory>
    <PreferenceCategory android:title="@string/danmaku_regular_comments_title">
        <ListPreference android:key="danmaku_regular_mode"
            android:title="@string/danmaku_regular_mode_title"
            android:entries="@array/danmaku_regular_mode_entries"
            android:entryValues="@array/danmaku_regular_mode_values"
            android:defaultValue="0" android:summary="%s" android:dependency="danmaku_regular_enabled" />
        <SwitchPreference android:key="danmaku_exclude_long"
            android:title="@string/danmaku_exclude_long_title"
            android:summary="@string/danmaku_exclude_long_summary"
            android:defaultValue="true" android:dependency="danmaku_enabled" />
        <ListPreference android:key="danmaku_max_length"
            android:title="@string/danmaku_max_length_title"
            android:entries="@array/danmaku_max_length_entries"
            android:entryValues="@array/danmaku_max_length_values"
            android:defaultValue="100" android:summary="%s" android:dependency="danmaku_exclude_long" />
    </PreferenceCategory>
    <PreferenceCategory android:title="@string/danmaku_filter_title">
        <EditTextPreference android:key="danmaku_ng_words"
            android:title="@string/danmaku_ng_words_title"
            android:summary="@string/danmaku_ng_words_summary"
            android:dialogTitle="@string/danmaku_ng_words_title"
            android:dialogMessage="@string/danmaku_ng_words_dialog"
            android:inputType="textMultiLine" android:minLines="3"
            android:defaultValue="" android:dependency="danmaku_enabled" />
        <SwitchPreference android:key="danmaku_merge_duplicates"
            android:title="@string/danmaku_merge_duplicates_title"
            android:summary="@string/danmaku_merge_duplicates_summary"
            android:defaultValue="true" android:dependency="danmaku_enabled" />
    </PreferenceCategory>
    <PreferenceCategory android:title="@string/danmaku_appearance_title">
        <ListPreference android:key="danmaku_font_size" android:title="@string/danmaku_font_size_title"
            android:entries="@array/danmaku_font_size_entries" android:entryValues="@array/danmaku_font_size_values"
            android:defaultValue="22" android:summary="%s" android:dependency="danmaku_enabled" />
        <SwitchPreference android:key="danmaku_bold" android:title="@string/danmaku_bold_title"
            android:defaultValue="true" android:dependency="danmaku_enabled" />
        <ListPreference android:key="danmaku_text_style" android:title="@string/danmaku_text_style_title"
            android:entries="@array/danmaku_text_style_entries" android:entryValues="@array/danmaku_text_style_values"
            android:defaultValue="0" android:summary="%s" android:dependency="danmaku_enabled" />
        <ListPreference android:key="danmaku_opacity" android:title="@string/danmaku_opacity_title"
            android:entries="@array/danmaku_percent_entries" android:entryValues="@array/danmaku_percent_values"
            android:defaultValue="90" android:summary="%s" android:dependency="danmaku_enabled" />
    </PreferenceCategory>
    <PreferenceCategory android:title="@string/danmaku_motion_title">
        <SwitchPreference android:key="danmaku_smooth_motion"
            android:title="@string/danmaku_smooth_motion_title"
            android:summary="@string/danmaku_smooth_motion_summary"
            android:defaultValue="true" android:dependency="danmaku_enabled" />
        <ListPreference android:key="danmaku_max_fps" android:title="@string/danmaku_max_fps_title"
            android:entries="@array/danmaku_max_fps_entries" android:entryValues="@array/danmaku_max_fps_values"
            android:defaultValue="0" android:summary="%s" android:dependency="danmaku_enabled" />
        <SwitchPreference android:key="danmaku_separate_layer"
            android:title="@string/danmaku_separate_layer_title"
            android:summary="@string/danmaku_separate_layer_summary"
            android:defaultValue="true" android:dependency="danmaku_enabled" />
        <SwitchPreference android:key="danmaku_show_stats"
            android:title="@string/danmaku_show_stats_title"
            android:summary="@string/danmaku_show_stats_summary"
            android:defaultValue="false" android:dependency="danmaku_enabled" />
        <ListPreference android:key="danmaku_speed_mode" android:title="@string/danmaku_speed_mode_title"
            android:entries="@array/danmaku_speed_mode_entries" android:entryValues="@array/danmaku_speed_mode_values"
            android:defaultValue="0" android:summary="%s" android:dependency="danmaku_enabled" />
        <ListPreference android:key="danmaku_duration" android:title="@string/danmaku_duration_title"
            android:entries="@array/danmaku_duration_entries" android:entryValues="@array/danmaku_duration_values"
            android:defaultValue="8" android:summary="%s" android:dependency="danmaku_enabled" />
        <ListPreference android:key="danmaku_coverage" android:title="@string/danmaku_coverage_title"
            android:entries="@array/danmaku_percent_entries" android:entryValues="@array/danmaku_percent_values"
            android:defaultValue="65" android:summary="%s" android:dependency="danmaku_enabled" />
        <ListPreference android:key="danmaku_crowd_mode" android:title="@string/danmaku_crowd_mode_title"
            android:entries="@array/danmaku_crowd_mode_entries" android:entryValues="@array/danmaku_crowd_mode_values"
            android:defaultValue="0" android:summary="%s" android:dependency="danmaku_enabled" />
    </PreferenceCategory>
    <PreferenceCategory android:title="@string/danmaku_performance_title">
        <ListPreference android:key="danmaku_max_comments" android:title="@string/danmaku_max_comments_title"
            android:entries="@array/danmaku_max_comments_entries" android:entryValues="@array/danmaku_max_comments_values"
            android:defaultValue="200" android:summary="%s" android:dependency="danmaku_enabled" />
        <Preference android:key="danmaku_reset" android:title="@string/danmaku_reset_title"
            android:summary="@string/danmaku_reset_summary" android:persistent="false" />
    </PreferenceCategory>
</PreferenceScreen>
"""

/** Adds an entry to YouTube settings and uses only platform preference widgets. */
internal val danmakuResourcePatch = resourcePatch(
    name = null,
    description = "Embeds YouTube-styled danmaku preferences.",
    default = false,
) {
    dependsOn(sharedSettingsResourcePatch)
    compatibleWith(YOUTUBE)

    execute {
        registerSettingsActivity(SETTINGS_ACTIVITY, SETTINGS_ACTION, "danmaku_settings_title")

        document("res/values/strings.xml").use { it.addStrings(englishStrings) }
        document("res/values-ja/strings.xml").use { it.addStrings(japaneseStrings) }
        document("res/values/arrays.xml").use { arrays ->
            fun addPair(name: String, entries: List<String>, values: List<Int>) {
                arrays.addStringArray("${name}_entries", entries)
                arrays.addStringArray("${name}_values", values.map(Int::toString))
            }
            addPair("danmaku_regular_mode", listOf("All comments", "Timestamped comments only"), listOf(0, 1))
            addPair(
                "danmaku_stream_comment_mode",
                listOf(
                    "Live chat preferred",
                    "Regular comments only",
                    "Live chat + timestamped comments",
                ),
                listOf(0, 1, 2),
            )
            addPair("danmaku_max_length", listOf("50", "75", "100", "150", "200", "300"), listOf(50, 75, 100, 150, 200, 300))
            addPair("danmaku_font_size", listOf("12 sp", "16 sp", "20 sp", "22 sp", "24 sp", "28 sp", "32 sp", "40 sp", "48 sp"), listOf(12, 16, 20, 22, 24, 28, 32, 40, 48))
            addPair("danmaku_percent", listOf("20%", "35%", "50%", "65%", "75%", "90%", "100%"), listOf(20, 35, 50, 65, 75, 90, 100))
            addPair("danmaku_scale", listOf("50%", "60%", "70%", "80%", "90%", "100%"), listOf(50, 60, 70, 80, 90, 100))
            addPair("danmaku_duration", listOf("3 seconds", "5 seconds", "8 seconds", "10 seconds", "12 seconds", "15 seconds", "20 seconds"), listOf(3, 5, 8, 10, 12, 15, 20))
            addPair("danmaku_max_comments", listOf("20", "50", "100", "200", "300", "500"), listOf(20, 50, 100, 200, 300, 500))
            addPair("danmaku_text_style", listOf("Outline", "Drop shadow", "Outline + shadow"), listOf(0, 1, 2))
            addPair("danmaku_max_fps", listOf("Display maximum (smoothest)", "60 fps (saves battery)"), listOf(0, 60))
            addPair(
                "danmaku_speed_mode",
                listOf("Same time for every comment (NicoNico)", "Same speed for every comment (bilibili)"),
                listOf(0, 1),
            )
            addPair(
                "danmaku_crowd_mode",
                listOf("Skip comments that do not fit", "Overlap comments (NicoNico)"),
                listOf(0, 1),
            )
        }
        document("res/values-ja/arrays.xml").use { arrays ->
            arrays.addStringArray("danmaku_regular_mode_entries", listOf("すべてのコメント", "タイムスタンプ付きのみ"))
            arrays.addStringArray(
                "danmaku_stream_comment_mode_entries",
                listOf(
                    "ライブチャット優先",
                    "通常コメントのみ",
                    "ライブチャット＋タイムスタンプ付きコメント",
                ),
            )
            arrays.addStringArray("danmaku_duration_entries", listOf("3秒", "5秒", "8秒", "10秒", "12秒", "15秒", "20秒"))
            arrays.addStringArray("danmaku_text_style_entries", listOf("縁取り", "影", "縁取り＋影"))
            arrays.addStringArray("danmaku_max_fps_entries", listOf("端末の最大（いちばんなめらか）", "60fps（電池を節約）"))
            arrays.addStringArray(
                "danmaku_speed_mode_entries",
                listOf("どのコメントも同じ時間で流す（ニコニコ風）", "どのコメントも同じ速さで流す（bilibili風）"),
            )
            arrays.addStringArray(
                "danmaku_crowd_mode_entries",
                listOf("入りきらないコメントは省略", "重ねて表示（ニコニコ風）"),
            )
        }
        get("res/xml").resolve("danmaku_preferences.xml").writeText(DANMAKU_PREFERENCES_XML)

        writeSettingsLayout("danmaku_settings_with_toolbar", "danmaku_settings_title")

        addSettingsEntry(
            key = "danmaku_settings",
            titleResource = "danmaku_settings_title",
            summaryResource = "danmaku_settings_summary",
            action = SETTINGS_ACTION,
            cairoIcon = "yt_outline_message_bubble_left_vd_theme_24",
        )
    }
}
