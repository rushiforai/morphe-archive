package app.yydarlinker.patches.deepseekcaptions

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Document
import org.w3c.dom.Element
import java.io.File

private const val LEGACY_PREF_KEY = "morphe_deepseek_caption_translator"
private const val LEGACY_PREF_CLASS = "app.yydarlinker.deepseekcaptions.DeepSeekCaptionPreference"
/**
 * Navigation key of the AI caption screen. N26 moved the screen from the Morphe settings root into the
 * Morphe video page, so only this outer navigation key changed; every preference key inside the screen
 * (and therefore every stored value) is untouched and no user data is migrated.
 *
 * The `__ai_captions` suffix is what puts the entry directly under "Voice over translation": the video
 * page is a sort-by-key group, and the Morphe host orders a group's children with
 * `Collator.compare(childKeyA, childKeyB)` using the app language's collator. `morphe_vot_screen` is a
 * strict prefix of this key, so the collator places this entry immediately after it and before any
 * other key on the page, in every supported interface language.
 */
private const val PREF_KEY = "morphe_vot_screen__ai_captions"
/**
 * The pre-N26 top-level navigation key. It is kept only as a removal alias: an entry still carrying it
 * (an older build of this patch, or resources left behind by one) is deleted, so the settings tree can
 * never show the AI screen twice and no stale link survives the move.
 */
private const val LEGACY_NAV_KEY = "morphe_settings_screen_13_ai_captions"
/**
 * The verified Morphe video settings page. The Morphe host names a sort-by-key group by appending
 * `_sort_by_key` to the screen key, so this is the key to look for in the delivered resources. It is
 * matched literally rather than by title text or by any other key containing "video": binding by
 * structure is what the patch contract below relies on.
 */
private const val VIDEO_PARENT_KEY = "morphe_settings_screen_12_video_sort_by_key"
/** The verified voice-over-translation sub-screen; the AI screen is placed immediately after it. */
private const val NARRATION_KEY = "morphe_vot_screen"
private const val ANDROID_KEY_ATTRIBUTE = "android:key"
private const val ENABLED_PREF_CLASS =
    "app.yydarlinker.deepseekcaptions.DeepSeekEnabledPreference"
private const val TEXT_PREF_CLASS =
    "app.yydarlinker.deepseekcaptions.DeepSeekTextPreference"
private const val MODEL_PREF_CLASS =
    "app.yydarlinker.deepseekcaptions.DeepSeekModelPreference"
private const val SLIDER_PREF_CLASS =
    "app.yydarlinker.deepseekcaptions.DeepSeekSliderPreference"
private const val ACTION_PREF_CLASS =
    "app.yydarlinker.deepseekcaptions.DeepSeekActionPreference"
private const val DIAGNOSTICS_PREF_CLASS =
    "app.yydarlinker.deepseekcaptions.DeepSeekDiagnosticsPreference"
private const val DISPLAY_TEXT_DEBUG_PREF_CLASS =
    "app.yydarlinker.deepseekcaptions.DeepSeekDisplayTextDebugPreference"
private const val NETWORK_SECURITY_ATTRIBUTE = "android:networkSecurityConfig"
private const val LOOPBACK_CONFIG_NAME = "deepseek_caption_network_security.xml"
private const val ICON_NAME = "deepseek_caption_settings"
private const val ICON_BOLD_NAME = "deepseek_caption_settings_bold"

internal val deepSeekCaptionResourcePatch = resourcePatch(
    description = "Adds an icon-backed, auto-saving AI caption screen to Morphe settings."
) {
    execute {
        // YouTube may already ship a Network Security Config. On Android 7+ that makes
        // android:usesCleartextTraffic alone ineffective, so explicitly permit cleartext in the
        // effective config as well. This is needed only because the translation bridge is an
        // in-process 127.0.0.1 HTTP hop; DeepSeek and YouTube themselves remain HTTPS.
        val resXmlDirectory = get("res/xml").apply { mkdirs() }
        var networkSecurityFileName: String? = null

        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as? Element
                ?: throw PatchException("YouTube manifest has no <application>")
            // Preserve the host policy; only the loopback domain is granted cleartext below.

            val existing = application.getAttribute(NETWORK_SECURITY_ATTRIBUTE)
            if (existing.startsWith("@xml/")) {
                networkSecurityFileName = existing.removePrefix("@xml/") + ".xml"
            } else if (existing.isBlank()) {
                networkSecurityFileName = LOOPBACK_CONFIG_NAME
                application.setAttribute(
                    NETWORK_SECURITY_ATTRIBUTE,
                    "@xml/${LOOPBACK_CONFIG_NAME.removeSuffix(".xml")}",
                )
            }
        }

        networkSecurityFileName?.let { fileName ->
            val path = "res/xml/$fileName"
            val file = File(resXmlDirectory, fileName)
            if (file.exists()) {
                document(path).use { document ->
                    val root = document.documentElement
                        ?: throw PatchException("Invalid network security config: $path")
                    val domainConfig = document.createElement("domain-config") as Element
                    domainConfig.setAttribute("cleartextTrafficPermitted", "true")
                    val domain = document.createElement("domain") as Element
                    domain.textContent = "127.0.0.1"
                    domainConfig.appendChild(domain)
                    root.appendChild(domainConfig)
                }
            } else {
                file.writeText(
                    """<?xml version="1.0" encoding="utf-8"?>
<network-security-config>
    <base-config cleartextTrafficPermitted="false">
        <trust-anchors>
            <certificates src="system" />
        </trust-anchors>
    </base-config>
    <domain-config cleartextTrafficPermitted="true"><domain>127.0.0.1</domain></domain-config>
</network-security-config>
"""
                )
            }
        }

        val drawableDirectory = get("res/drawable").apply { mkdirs() }
        File(drawableDirectory, "$ICON_NAME.xml").writeText(
            """<?xml version="1.0" encoding="utf-8"?>
<vector xmlns:android="http://schemas.android.com/apk/res/android"
    android:width="24dp"
    android:height="24dp"
    android:viewportWidth="24"
    android:viewportHeight="24">
    <path
        android:fillColor="?android:attr/textColorPrimary"
        android:pathData="M3,5L17,5L17,17L8,17L4,21L4,17L3,17ZM5,7L5,15L15,15L15,7ZM6,9L14,9L14,10.5L6,10.5ZM6,12L12,12L12,13.5L6,13.5ZM20,1L21,4L24,5L21,6L20,9L19,6L16,5L19,4Z" />
</vector>
"""
        )
        File(drawableDirectory, "$ICON_BOLD_NAME.xml").writeText(
            """<?xml version="1.0" encoding="utf-8"?>
<vector xmlns:android="http://schemas.android.com/apk/res/android"
    android:width="24dp"
    android:height="24dp"
    android:viewportWidth="24"
    android:viewportHeight="24">
    <path
        android:fillColor="?android:attr/textColorPrimary"
        android:pathData="M3,5L17,5L17,17L8,17L4,21L4,17L3,17ZM5,7L5,15L15,15L15,7ZM6,9L14,9L14,10.5L6,10.5ZM6,12L12,12L12,13.5L6,13.5ZM20,1L21,4L24,5L21,6L20,9L19,6L16,5L19,4Z" />
</vector>
"""
        )
    }

    finalize {
        fun Element.addPreference(
            tag: String,
            key: String,
            title: String,
            summary: String? = null,
        ): Element {
            val preference = ownerDocument.createElement(tag)
            preference.setAttribute("android:key", key)
            preference.setAttribute("android:title", captionResourceTitle(title))
            summary?.let { preference.setAttribute("android:summary", captionResourceTitle(it)) }
            appendChild(preference)
            return preference
        }

        fun Element.addCategory(title: String): Element {
            val category = ownerDocument.createElement("app.yydarlinker.deepseekcaptions.CaptionSettingCategory")
            category.setAttribute("android:title", captionResourceTitle(title))
            appendChild(category)
            return category
        }

        /** Every element of the document, outermost first. */
        fun Document.elements(): List<Element> {
            val nodes = getElementsByTagName("*")
            return (0 until nodes.length).mapNotNull { nodes.item(it) as? Element }
        }

        fun Element.childByKey(key: String): Element? =
            (0 until childNodes.length)
                .mapNotNull { childNodes.item(it) as? Element }
                .firstOrNull { it.getAttribute(ANDROID_KEY_ATTRIBUTE) == key }

        /**
         * Delete every entry this patch owns that must not survive: the original all-in-one dialog, the
         * legacy navigation key, and any earlier copy of the current screen (which is what makes a
         * second run of the assembly idempotent).
         */
        fun Document.removeOwnEntries() {
            for (node in elements()) {
                val key = node.getAttribute(ANDROID_KEY_ATTRIBUTE)
                if (node.tagName == LEGACY_PREF_CLASS ||
                    key == LEGACY_PREF_KEY ||
                    key == LEGACY_NAV_KEY ||
                    key == PREF_KEY
                ) {
                    node.parentNode?.removeChild(node)
                }
            }
        }

        /** The AI caption screen itself, with the N25 content and its order left untouched. */
        fun buildPreferenceScreen(document: Document): Element {
            val screen = document.createElement("PreferenceScreen")
            screen.setAttribute("android:key", PREF_KEY)
            screen.setAttribute("android:title", "@string/cap_ai_title")
            screen.setAttribute("android:summary", "@string/cap_ai_summary")
            screen.setAttribute("android:singleLineTitle", "false")
            // The entry renders as an ordinary sub-screen row of the page it sits on, exactly like the
            // narration row next to it: no icon, no icon layout, and no reserved icon space. Every one of
            // the 25 nested sub-screens the host ships is attribute-free in the same way, so this matches
            // the page rather than adding a second, custom row style.

            screen.addPreference(
                ENABLED_PREF_CLASS,
                "deepseek_caption_enabled",
                "启用 AI 字幕翻译",
            )

            screen.addPreference(
                "app.yydarlinker.deepseekcaptions.CaptionLanguagesPreference",
                "deepseek_caption_languages",
                "自动翻译语言",
                "选择要加入 YouTube 自动翻译菜单的语言",
            ).setAttribute("android:order", "1")
            screen.childByKey("deepseek_caption_enabled")?.setAttribute("android:order", "0")

            screen.addPreference(
                "app.yydarlinker.deepseekcaptions.CaptionFlyoutPreference",
                "deepseek_caption_flyout_menu",
                "普通视频弹出菜单中的 AI 字幕开关",
                "在播放器弹出菜单中显示快捷开关；隐藏不关闭 AI 字幕，下次打开菜单生效",
            )

            screen.addPreference(
                "app.yydarlinker.deepseekcaptions.CaptionShortsFlyoutPreference",
                "deepseek_caption_shorts_flyout_menu",
                "Shorts 弹出菜单中的 AI 字幕开关",
                "在播放器弹出菜单中显示快捷开关；隐藏不关闭 AI 字幕，下次打开菜单生效",
            )

            screen.addCategory("API 配置").apply {
                addPreference("app.yydarlinker.deepseekcaptions.ApiProfilesPreference",
                    "deepseek_caption_profiles", "API 配置方案")
                addPreference(
                    TEXT_PREF_CLASS,
                    "deepseek_caption_base_url",
                    "API 地址",
                    "填写兼容接口地址，停止输入后自动保存",
                )
                addPreference(
                    "app.yydarlinker.deepseekcaptions.ApiKeyPreference",
                    "deepseek_caption_api_key",
                    "API Key",
                )
                addPreference(
                    MODEL_PREF_CLASS,
                    "deepseek_caption_model",
                    "模型",
                    "自动获取可用模型，也支持手动输入",
                )
                addPreference(
                    ACTION_PREF_CLASS,
                    "deepseek_caption_test_api",
                    "测试 API",
                    "使用当前已自动保存的配置测试连接",
                )
                addPreference(
                    ACTION_PREF_CLASS,
                    "deepseek_caption_delete_key",
                    "清除本方案的 API Key",
                )
            }

            screen.addCategory("翻译").apply {
                addPreference(
                    TEXT_PREF_CLASS,
                    "deepseek_caption_prompt",
                    "翻译要求",
                    "各方案独立保存；清空恢复随界面语言变化的默认要求",
                )
            }

            screen.addCategory("字幕样式").apply {
                addPreference("app.yydarlinker.deepseekcaptions.SubtitleStylePreview",
                    "deepseek_caption_style_preview", "字幕预览")
                addPreference(
                    SLIDER_PREF_CLASS,
                    "deepseek_caption_text_size",
                    "字幕大小",
                    "相对字号 8–15；13sp 为舒适基准，随画面比例缩放",
                )
                addPreference(
                    SLIDER_PREF_CLASS,
                    "deepseek_caption_background_opacity",
                    "背景不透明度",
                    "0% 为透明，100% 为不透明；松手保存",
                )
                addPreference(
                    ACTION_PREF_CLASS,
                    "deepseek_caption_reset_position",
                    "恢复字幕默认位置",
                    "恢复竖直位置，保留字号和背景设置",
                )
            }

            screen.addCategory("缓存与诊断").apply {
                addPreference(
                    ACTION_PREF_CLASS,
                    "deepseek_caption_clear_cache",
                    "清除字幕缓存",
                )
                addPreference(
                    DISPLAY_TEXT_DEBUG_PREF_CLASS,
                    "deepseek_caption_display_text_debug",
                    "显示文本调试",
                    "排查时记录字幕原文与译文，默认关闭",
                )
                addPreference(
                    DIAGNOSTICS_PREF_CLASS,
                    "deepseek_caption_diagnostics",
                    "字幕诊断",
                    "展开查看，可手动刷新或复制",
                )
            }
            var order = 0
            for (node in (0 until screen.childNodes.length).mapNotNull { screen.childNodes.item(it) as? Element }) {
                node.setAttribute("android:order", (order++).toString())
                node.setAttribute("android:iconSpaceReserved", "false")
            }
            return screen
        }

        /**
         * Assemble the entry into a Morphe settings resource, inside the video page.
         *
         * The screen is placed only after the video page has been proven to exist exactly once. A resource
         * that carries Morphe settings but no unambiguous video page is a structural binding failure, and
         * quietly falling back to a root entry (or to the stock YouTube settings list) would leave the
         * feature somewhere the user was never told to look, so that case throws instead.
         */
        fun addMorphePreferenceScreen(path: String): Boolean {
            val file = get(path, copy = false)
            if (!file.exists()) return false

            document(path).use { document ->
                val videoParents = document.elements()
                    .filter { it.getAttribute(ANDROID_KEY_ATTRIBUTE) == VIDEO_PARENT_KEY }
                if (videoParents.size != 1) {
                    throw PatchException(
                        "$path declares ${videoParents.size} '$VIDEO_PARENT_KEY' screens, expected exactly " +
                                "one. The AI caption screen belongs to the Morphe video page, so that page " +
                                "must be present and unambiguous; the entry is never moved to the settings root."
                    )
                }
                val videoParent = videoParents.single()

                // Nothing is removed until the destination is known, so a failed lookup cannot damage the
                // resource it was looking at.
                document.removeOwnEntries()

                val screen = buildPreferenceScreen(document)
                val narration = videoParent.childByKey(NARRATION_KEY)
                if (narration != null) {
                    // Immediately after "Voice over translation". The host orders this sort-by-key page with
                    // the app language's collator, and PREF_KEY is that key plus a suffix, so the two rows
                    // also stay adjacent after the host re-assigns their order.
                    videoParent.insertBefore(screen, narration.nextSibling)
                } else {
                    // The narration patch is not selected: the entry simply takes its sorted place on the
                    // page. No dependency on the narration patch is introduced and the root is not used.
                    videoParent.appendChild(screen)
                }
            }
            return true
        }

        /** Last-resort placement for a host with no Morphe settings at all: the stock YouTube list. */
        fun addStockPreferenceScreen(path: String): Boolean {
            val file = get(path, copy = false)
            if (!file.exists()) return false

            document(path).use { document ->
                val root = document.documentElement ?: return false
                document.removeOwnEntries()
                root.appendChild(buildPreferenceScreen(document))
            }
            return true
        }

        var morpheSettingsFound = false
        listOf(
            "res/xml/morphe_prefs.xml",
            "res/xml/morphe_prefs_icons.xml",
            "res/xml/morphe_prefs_icons_bold.xml",
        ).forEach { path ->
            morpheSettingsFound = addMorphePreferenceScreen(path) || morpheSettingsFound
        }

        if (!morpheSettingsFound) {
            var stockSettingsFound = false
            listOf(
                "res/xml/settings_fragment.xml",
                "res/xml/settings_fragment_cairo.xml",
            ).forEach { path ->
                stockSettingsFound = addStockPreferenceScreen(path) || stockSettingsFound
            }
            if (!stockSettingsFound) {
                throw PatchException(
                    "Could not find Morphe or YouTube settings XML. " +
                            "Select the official Morphe settings patch together with AI caption translator."
                )
            }
        }
    }
}
