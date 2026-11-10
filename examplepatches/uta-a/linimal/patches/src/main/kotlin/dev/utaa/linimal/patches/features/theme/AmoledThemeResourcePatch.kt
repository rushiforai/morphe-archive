package dev.utaa.linimal.patches.features.theme

import app.morphe.patcher.patch.ApkArchitecture
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.resourcePatch
import dev.utaa.linimal.patches.features.preview.previewScrollPatch
import dev.utaa.linimal.patches.shared.Constants
import dev.utaa.linimal.patches.status.PatchId
import dev.utaa.linimal.patches.status.recordFeatureStatus
import dev.utaa.linimal.patches.status.recordUnsafeFeatureStatus
import org.w3c.dom.Element
import java.io.File

/**
 * AMOLED テーマで黒にする色と、LINE 26.16.0 のダークモードでの元の値（ARGB）。
 *
 * <p>runtime の `AmoledThemeColors.NAMES` と同じ名前を同じ順で並べます（`AmoledThemeResourcePatchTest`）。
 * どれも、ダークモードで画面全体の地になる背景色です。`linegray900` は夜間設定を持たないパレットの色で、
 * LINE がダークモードの下部のナビゲーションバーに直接使います。</p>
 */
internal val AMOLED_THEME_TARGETS: Map<String, Long> = linkedMapOf(
    "primaryBackground" to 0xFF111111,
    "primarySurface" to 0xFF111111,
    "secondaryAltBackground" to 0xFF111111,
    "tertiaryAltBackground" to 0xFF111111,
    "splashBackground" to 0xFF111111,
    "statusbarBackground" to 0xFF111111,
    "chatBackground" to 0xFF1A1A1A,
    "linegray900" to 0xFF111111,
)

/**
 * AMOLED テーマで不透明な部分を黒に塗り替える画像。既定の着せかえをダークモードで表示するときの
 * 下部タブの背景で、runtime の `AmoledThemeColors.DRAWABLE_NAMES` と同じ名前を同じ順で並べます。
 */
internal val AMOLED_THEME_DRAWABLES: List<String> = listOf(
    "navi_bottom_bg_dark",
)

private const val DEFAULT_COLORS_PATH = "res/values/colors.xml"
private const val NIGHT_COLORS_PATH = "res/values-night/colors.xml"
private const val RES_PATH = "res"
private const val MAX_REFERENCE_DEPTH = 8
private val BITMAP_EXTENSIONS = setOf("png", "webp", "jpg")

/**
 * AMOLED テーマの対象を確かめるだけの resource patch。APK の resource は変更しません。
 *
 * <p>黒にする処理は runtime の `AmoledThemeHooks` が、夜間設定の値だけを持つ resource table を
 * `ResourcesLoader` で重ねて行います。ここでは対象の色が夜間設定にあり想定した背景色であること、
 * 対象の drawable が画像として存在することを確かめます。対象が欠けた場合は PARTIAL /
 * TARGET_NOT_FOUND、色の値が想定と違う場合は ERROR を記録し、runtime はこの機能を無効にします。</p>
 */
val amoledThemeResourcePatch = resourcePatch(
    name = "AMOLED テーマの対象",
    description = "ダークモードの背景を黒にするため、対象の色と下部タブの背景を確認します。",
) {
    compatibleWith(Constants.LINE_COMPATIBILITY)
    availability { _, architecture ->
        if (architecture == ApkArchitecture.ARM64_V8A) PatchAvailability.REQUIRED else PatchAvailability.UNAVAILABLE
    }
    dependsOn(previewScrollPatch)

    execute {
        val defaults = try {
            document(DEFAULT_COLORS_PATH).use { colorValues(it.documentElement) }
        } catch (_: Exception) {
            null
        }
        val night = try {
            document(NIGHT_COLORS_PATH).use { colorValues(it.documentElement) }
        } catch (_: Exception) {
            null
        }
        val drawables = try {
            countAmoledThemeDrawables(get(RES_PATH, false))
        } catch (_: Exception) {
            0
        }
        val ids = listOf(PatchId.AMOLED_THEME_COLORS)
        val expected = AMOLED_THEME_TARGETS.size + AMOLED_THEME_DRAWABLES.size
        if (defaults == null || night == null) {
            recordFeatureStatus(ids, expected, drawables, "AmoledThemeColorsUnreadable")
            return@execute
        }
        val check = checkAmoledThemeTargets(defaults, night)
        val found = check.found + drawables
        if (check.mismatched.isNotEmpty()) {
            recordUnsafeFeatureStatus(ids, expected, found, "AmoledThemeColorsUnexpectedValue")
        } else {
            recordFeatureStatus(ids, expected, found, "AmoledThemeColorsVerified")
        }
    }
}

/** `<color name="...">value</color>` を名前から値への対応にします。 */
internal fun colorValues(root: Element?): Map<String, String> {
    val values = linkedMapOf<String, String>()
    val nodes = root?.getElementsByTagName("color") ?: return values
    for (index in 0 until nodes.length) {
        val element = nodes.item(index) as? Element ?: continue
        val name = element.getAttribute("name")
        if (name.isNotEmpty()) values[name] = element.textContent.trim()
    }
    return values
}

/**
 * 対象の drawable のうち、`drawable*` ディレクトリに画像ファイルがあるものの数。XML の drawable は
 * 形が変わった可能性があるため数えません。
 */
internal fun countAmoledThemeDrawables(resDirectory: File): Int {
    val directories = resDirectory.listFiles { file -> file.isDirectory && file.name.startsWith("drawable") }
        .orEmpty()
    return AMOLED_THEME_DRAWABLES.count { name ->
        directories.any { directory ->
            directory.listFiles().orEmpty().any { file ->
                file.name.removeSuffix(".${file.extension}").removeSuffix(".9") == name &&
                    file.extension in BITMAP_EXTENSIONS
            }
        }
    }
}

internal data class AmoledThemeCheck(val found: Int, val mismatched: List<String>)

/**
 * 各対象のダークモードでの値をたどり、ARGB が想定どおりかを確かめます。値と `@color/` の参照先は
 * 夜間設定、なければ既定の設定から引きます。
 */
internal fun checkAmoledThemeTargets(
    defaults: Map<String, String>,
    night: Map<String, String>,
): AmoledThemeCheck {
    var found = 0
    val mismatched = mutableListOf<String>()
    for ((name, argb) in AMOLED_THEME_TARGETS) {
        val value = night[name] ?: defaults[name] ?: continue
        found++
        if (resolveColor(value, defaults, night) != argb) mismatched += name
    }
    return AmoledThemeCheck(found, mismatched)
}

private fun resolveColor(value: String, defaults: Map<String, String>, night: Map<String, String>): Long? {
    var current = value
    repeat(MAX_REFERENCE_DEPTH) {
        if (current.startsWith("@color/")) {
            val name = current.removePrefix("@color/")
            current = night[name] ?: defaults[name] ?: return null
        } else {
            return parseArgb(current)
        }
    }
    return null
}

private fun parseArgb(value: String): Long? {
    if (!value.startsWith("#")) return null
    val hex = value.substring(1)
    val parsed = hex.toLongOrNull(16) ?: return null
    return when (hex.length) {
        6 -> 0xFF000000 or parsed
        8 -> parsed
        else -> null
    }
}
