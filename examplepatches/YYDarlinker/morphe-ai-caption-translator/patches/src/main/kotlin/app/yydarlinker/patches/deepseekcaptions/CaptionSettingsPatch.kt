package app.yydarlinker.patches.deepseekcaptions

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val PACKAGE = "app.yydarlinker.deepseekcaptions."
private const val KEY = "android:key"

/**
 * Where the screen goes: the video page of Morphe's settings. The page is a group that Morphe sorts by key, with the
 * app language's collator. The key of the screen is the key of "Voice over translation" plus a suffix, so the
 * collator puts it right after that row, in every language.
 */
private const val VIDEO_PAGE_KEY = "morphe_settings_screen_12_video"
private const val NARRATION_KEY = "morphe_vot_screen"
private const val SCREEN_KEY = "${NARRATION_KEY}__ai_captions"

/** A row of the screen: the class of its preference, its key, and its title and summary (the Chinese source text). */
private class Row(val type: String, val key: String, val title: String, val summary: String? = null)

private class Section(val title: String, val rows: List<Row>)

private val ENABLED = Row("DeepSeekEnabledPreference", "deepseek_caption_enabled", "启用 AI 字幕翻译")
private const val FLYOUT_SUMMARY = "在播放器弹出菜单中显示快捷开关；隐藏不关闭 AI 字幕，下次打开菜单生效"
private val FLYOUT = Row(
    "CaptionFlyoutPreference", "deepseek_caption_flyout_menu", "普通视频弹出菜单中的 AI 字幕开关", FLYOUT_SUMMARY,
)
private val SHORTS_FLYOUT = Row(
    "CaptionShortsFlyoutPreference", "deepseek_caption_shorts_flyout_menu", "Shorts 弹出菜单中的 AI 字幕开关", FLYOUT_SUMMARY,
)

private val SECTIONS = listOf(
    Section(
        "API 配置",
        listOf(
            Row("ApiProfilesPreference", "deepseek_caption_profiles", "API 配置方案"),
            Row("DeepSeekTextPreference", "deepseek_caption_base_url", "API 地址", "填写兼容接口地址，停止输入后自动保存"),
            Row("ApiKeyPreference", "deepseek_caption_api_key", "API Key"),
            Row("DeepSeekModelPreference", "deepseek_caption_model", "模型", "自动获取可用模型，也支持手动输入"),
            Row("DeepSeekActionPreference", "deepseek_caption_test_api", "测试 API", "使用当前已自动保存的配置测试连接"),
            Row("DeepSeekActionPreference", "deepseek_caption_delete_key", "清除本方案的 API Key"),
        ),
    ),
    Section(
        "字幕样式",
        listOf(
            Row("SubtitleStylePreview", "deepseek_caption_style_preview", "字幕预览"),
            Row(
                "DeepSeekSliderPreference", "deepseek_caption_text_size", "字幕大小",
                "相对字号 8–15；13sp 为舒适基准，随画面比例缩放",
            ),
            Row(
                "DeepSeekSliderPreference", "deepseek_caption_background_opacity", "背景不透明度",
                "0% 为透明，100% 为不透明；松手保存",
            ),
            Row(
                "DeepSeekActionPreference", "deepseek_caption_reset_position", "恢复字幕默认位置",
                "恢复竖直位置，保留字号和背景设置",
            ),
        ),
    ),
    Section(
        "缓存与诊断",
        listOf(
            Row("DeepSeekActionPreference", "deepseek_caption_clear_cache", "清除字幕缓存"),
            Row(
                "DeepSeekDisplayTextDebugPreference", "deepseek_caption_display_text_debug", "显示文本调试",
                "排查时记录字幕原文与译文，默认关闭",
            ),
            Row("DeepSeekDiagnosticsPreference", "deepseek_caption_diagnostics", "字幕诊断", "展开查看，可手动刷新或复制"),
        ),
    ),
)

/**
 * The resource keys of the text that a row shows: the add-on's strings are generated from the Chinese source text,
 * and `source-keys.tsv` lists which string belongs to which text. A text without an entry is shown as it is.
 */
private fun stringReference(text: String): String {
    val rows = CaptionFeatures.javaClass.classLoader.getResourceAsStream("captionlocales/source-keys.tsv")
        ?.bufferedReader()?.use { it.readLines() } ?: return text
    val name = rows.firstOrNull { it.substringBefore('\t') == text }?.substringAfter('\t') ?: return text
    return "@string/$name"
}

private fun Document.elements(): List<Element> {
    val nodes = getElementsByTagName("*")
    return (0 until nodes.length).mapNotNull { nodes.item(it) as? Element }
}

private fun Document.preference(tag: String, title: String, summary: String? = null, key: String? = null): Element =
    createElement(tag).also {
        key?.let { value -> it.setAttribute(KEY, value) }
        it.setAttribute("android:title", stringReference(title))
        summary?.let { value -> it.setAttribute("android:summary", stringReference(value)) }
    }

/** The AI caption screen, with the order of its rows written out because the host would sort them by key. */
private fun Document.buildScreen(): Element {
    val screen = createElement("PreferenceScreen")
    screen.setAttribute(KEY, SCREEN_KEY)
    screen.setAttribute("android:title", "@string/cap_ai_title")
    screen.setAttribute("android:summary", "@string/cap_ai_summary")
    screen.setAttribute("android:singleLineTitle", "false")

    for (row in listOf(ENABLED, FLYOUT, SHORTS_FLYOUT)) {
        screen.appendChild(preference(PACKAGE + row.type, row.title, row.summary, row.key))
    }
    for (section in SECTIONS) {
        val category = preference(PACKAGE + "CaptionSettingCategory", section.title)
        for (row in section.rows) category.appendChild(preference(PACKAGE + row.type, row.title, row.summary, row.key))
        screen.appendChild(category)
    }
    for ((order, node) in (0 until screen.childNodes.length).map { screen.childNodes.item(it) as Element }.withIndex()) {
        node.setAttribute("android:order", order.toString())
        node.setAttribute("android:iconSpaceReserved", "false")
    }
    return screen
}

/**
 * Puts the screen on the video page of Morphe's settings, or, when the app has no Morphe settings, at the end of
 * its own settings list. A Morphe page without an unambiguous video page is an error: the screen would end up
 * where nobody was told to look.
 */
private fun ResourcePatchContext.addScreen() {
    val morphePages = listOf("morphe_prefs", "morphe_prefs_icons", "morphe_prefs_icons_bold").map { "res/xml/$it.xml" }
    // Decode on request (Patcher 2.0.0): asking for the file is what decodes it.
    val found = morphePages.filter { get(it).exists() }
    for (path in found) {
        document(path).use { page ->
            val videoPages = page.elements().filter { it.getAttribute(KEY).startsWith(VIDEO_PAGE_KEY) }
            if (videoPages.size != 1) {
                throw PatchException("$path has ${videoPages.size} '$VIDEO_PAGE_KEY' screens, expected exactly one")
            }
            val video = videoPages.single()
            val narration = (0 until video.childNodes.length).map { video.childNodes.item(it) }
                .firstOrNull { (it as? Element)?.getAttribute(KEY)?.startsWith(NARRATION_KEY) == true }
            // Right after "Voice over translation", or in its sorted place when that patch was not selected.
            video.insertBefore(page.buildScreen(), narration?.nextSibling)
        }
    }
    if (found.isNotEmpty()) return

    val stockPages = listOf("settings_fragment", "settings_fragment_cairo").map { "res/xml/$it.xml" }
        .filter { get(it).exists() }
    if (stockPages.isEmpty()) {
        throw PatchException("Could not find the settings XML of Morphe or YouTube. Select the settings patch of Morphe.")
    }
    for (path in stockPages) document(path).use { page -> page.documentElement.appendChild(page.buildScreen()) }
}

/** The AI caption screen; network security policy remains owned by the host and other patches. */
internal val captionSettingsPatch = resourcePatch(
    description = "Adds the AI caption screen to the settings of Morphe.",
) {
    // The settings of Morphe are written by its own patch, so the screen is added after every patch has executed.
    finalize { addScreen() }
}
