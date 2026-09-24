package app.yydarlinker.patches.deepseekcaptions

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element
import java.io.File

private const val LEGACY_PREF_KEY = "morphe_deepseek_caption_translator"
private const val LEGACY_PREF_CLASS = "app.yydarlinker.deepseekcaptions.DeepSeekCaptionPreference"
private const val PREF_KEY = "morphe_settings_screen_13_ai_captions"
private const val ENABLED_PREF_CLASS =
    "app.yydarlinker.deepseekcaptions.DeepSeekEnabledPreference"
private const val CORE_PREF_CLASS =
    "app.yydarlinker.deepseekcaptions.DeepSeekCorePreference"
private const val TEXT_PREF_CLASS =
    "app.yydarlinker.deepseekcaptions.DeepSeekTextPreference"
private const val MODEL_PREF_CLASS =
    "app.yydarlinker.deepseekcaptions.DeepSeekModelPreference"
private const val DEFAULT_LANGUAGE_PREF_CLASS =
    "app.yydarlinker.deepseekcaptions.DeepSeekDefaultLanguagePreference"
private const val SLIDER_PREF_CLASS =
    "app.yydarlinker.deepseekcaptions.DeepSeekSliderPreference"
private const val ACTION_PREF_CLASS =
    "app.yydarlinker.deepseekcaptions.DeepSeekActionPreference"
private const val DIAGNOSTICS_PREF_CLASS =
    "app.yydarlinker.deepseekcaptions.DeepSeekDiagnosticsPreference"
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
            application.setAttribute("android:usesCleartextTraffic", "true")

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
                    val baseNodes = document.getElementsByTagName("base-config")
                    val base = if (baseNodes.length > 0) {
                        baseNodes.item(0) as Element
                    } else {
                        (document.createElement("base-config") as Element).also(root::appendChild)
                    }
                    base.setAttribute("cleartextTrafficPermitted", "true")
                }
            } else {
                file.writeText(
                    """<?xml version="1.0" encoding="utf-8"?>
<network-security-config>
    <base-config cleartextTrafficPermitted="true">
        <trust-anchors>
            <certificates src="system" />
        </trust-anchors>
    </base-config>
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
        android:pathData="M19,4L5,4a3,3 0,0 0,-3 3v10a3,3 0,0 0,3 3h14a3,3 0,0 0,3 -3L22,7a3,3 0,0 0,-3 -3zM20,17a1,1 0,0 1,-1 1L5,18a1,1 0,0 1,-1 -1L4,7a1,1 0,0 1,1 -1h14a1,1 0,0 1,1 1v10zM6,9h5v2L6,11L6,9zM13,9h5v2h-5L13,9zM6,13h5v2L6,15v-2zM13,13h5v2h-5v-2z" />
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
        android:pathData="M19,3L5,3a4,4 0,0 0,-4 4v10a4,4 0,0 0,4 4h14a4,4 0,0 0,4 -4L23,7a4,4 0,0 0,-4 -4zM11,12L6,12L6,9h5v3zM18,12h-5L13,9h5v3zM11,16L6,16v-3h5v3zM18,16h-5v-3h5v3z" />
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
            preference.setAttribute("android:title", title)
            summary?.let { preference.setAttribute("android:summary", it) }
            appendChild(preference)
            return preference
        }

        fun Element.addCategory(title: String): Element {
            val category = ownerDocument.createElement("PreferenceCategory")
            category.setAttribute("android:title", title)
            appendChild(category)
            return category
        }

        fun addPreferenceScreen(path: String, icon: String? = null): Boolean {
            val file = get(path, copy = false)
            if (!file.exists()) return false

            document(path).use { document ->
                val root = document.documentElement ?: return false

                // Remove both the old all-in-one dialog entry and any earlier copy of this screen.
                val nodes = document.getElementsByTagName("*")
                for (i in nodes.length - 1 downTo 0) {
                    val node = nodes.item(i)
                    if (node is Element &&
                        (node.tagName == LEGACY_PREF_CLASS ||
                            node.getAttribute("android:key") == LEGACY_PREF_KEY ||
                            node.getAttribute("android:key") == PREF_KEY)
                    ) {
                        node.parentNode?.removeChild(node)
                    }
                }

                val screen = document.createElement("PreferenceScreen")
                screen.setAttribute("android:key", PREF_KEY)
                screen.setAttribute("android:title", "AI 字幕翻译")
                screen.setAttribute("android:summary", "跟随原生时间轴实时翻译 · 设置自动保存")
                icon?.let {
                    screen.setAttribute("android:icon", "@drawable/$it")
                    screen.setAttribute("app:iconSpaceReserved", "true")
                    screen.setAttribute("android:layout", "@layout/preference_with_icon")
                }

                screen.addPreference(
                    ENABLED_PREF_CLASS,
                    "deepseek_caption_enabled",
                    "启用 AI 字幕翻译",
                )

                screen.addCategory("API 配置").apply {
                    addPreference(
                        TEXT_PREF_CLASS,
                        "deepseek_caption_base_url",
                        "API 地址",
                        "停止输入后自动保存",
                    )
                    addPreference(
                        TEXT_PREF_CLASS,
                        "deepseek_caption_api_key",
                        "API Key",
                    )
                    addPreference(
                        MODEL_PREF_CLASS,
                        "deepseek_caption_model",
                        "模型",
                        "根据 API 地址和 Key 自动获取，也可手动输入",
                    )
                    addPreference(
                        ACTION_PREF_CLASS,
                        "deepseek_caption_test_api",
                        "测试 API",
                        "使用当前已自动保存的配置测试连接",
                    )
                }

                screen.addCategory("翻译").apply {
                    addPreference(
                        DEFAULT_LANGUAGE_PREF_CLASS,
                        "deepseek_caption_default_language",
                        "字幕按钮默认语言",
                        "默认：AI 中文（简体）",
                    )
                    addPreference(
                        CORE_PREF_CLASS,
                        "deepseek_caption_contextual_unit_core",
                        "实验翻译核心",
                        "dev.1 默认开启；关闭可回退 v2.2.0 Semantic Ledger",
                    )
                    addPreference(
                        TEXT_PREF_CLASS,
                        "deepseek_caption_prompt",
                        "翻译要求",
                        "原生字幕段逐项翻译；停止输入后自动保存",
                    )
                }

                screen.addCategory("字幕样式").apply {
                    addPreference(
                        SLIDER_PREF_CLASS,
                        "deepseek_caption_text_size",
                        "字幕大小",
                        "相对画面比例 12–36，详情页与全屏一致",
                    )
                    addPreference(
                        SLIDER_PREF_CLASS,
                        "deepseek_caption_background_opacity",
                        "背景不透明度",
                        "0–100%，松手即保存",
                    )
                    addPreference(
                        ACTION_PREF_CLASS,
                        "deepseek_caption_reset_position",
                        "恢复字幕默认位置",
                        "字幕始终水平居中，只保存竖直位置",
                    )
                }

                screen.addCategory("缓存与诊断").apply {
                    addPreference(
                        ACTION_PREF_CLASS,
                        "deepseek_caption_clear_cache",
                        "清除字幕缓存",
                    )
                    addPreference(
                        ACTION_PREF_CLASS,
                        "deepseek_caption_delete_key",
                        "删除 API Key",
                    )
                    addPreference(
                        DIAGNOSTICS_PREF_CLASS,
                        "deepseek_caption_diagnostics",
                        "字幕链路诊断（点击复制）",
                        "点击即可刷新并复制完整诊断",
                    )
                    addPreference(
                        ACTION_PREF_CLASS,
                        "deepseek_caption_clear_diagnostics",
                        "清空诊断记录",
                    )
                }
                root.appendChild(screen)
            }
            return true
        }

        var morpheSettingsFound = false
        morpheSettingsFound =
            addPreferenceScreen("res/xml/morphe_prefs.xml") || morpheSettingsFound
        morpheSettingsFound =
            addPreferenceScreen("res/xml/morphe_prefs_icons.xml", ICON_NAME) ||
                morpheSettingsFound
        morpheSettingsFound =
            addPreferenceScreen("res/xml/morphe_prefs_icons_bold.xml", ICON_BOLD_NAME) ||
                morpheSettingsFound

        if (!morpheSettingsFound) {
            var stockSettingsFound = false
            listOf(
                "res/xml/settings_fragment.xml",
                "res/xml/settings_fragment_cairo.xml",
            ).forEach { path ->
                stockSettingsFound = addPreferenceScreen(path) || stockSettingsFound
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
