package app.morphe.patches.tv360

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

private const val TV360_HUAWEI16_TRUE_BLACK = "#FF000000"

/**
 * Original colors confirmed in the user's local aapt2 resource dump for
 * com.bitel.tv360 version 1.6 (161). Several are referenced explicitly as
 * android:background in activity_home.xml and film-detail layout resources.
 *
 * Only app-owned opaque UI surfaces are selected. Do not recolor artwork,
 * text, red accents, seek controls, semi-transparent overlays or ExoPlayer.
 */
private val tv360Huawei16AmoledSurfaces = linkedMapOf(
    // Verified home/film-layout background references.
    "colorPrimary" to "#ff121212",
    "colorPrimaryDark" to "#ff121212",
    "colorItemPrimary" to "#ff282828",
    "color34" to "#ff222222",

    // Independently identified app-owned surface resources.
    "bg_menu" to "#ff222222",
    "bg_detail_notification" to "#ff303032",
    "fragment_background" to "#ff242424",
    "playlist_black" to "#ff111111",
    "bottom_item_package" to "#ff353535",
    "account_group" to "#ff28282a",
    "donate_bar_background" to "#ff28282a",
    "package_bg_color" to "#ff313131",
    "package_group" to "#ff252525",
    "user_comment_background" to "#ff262626",
    "grey_live_background" to "#ff222222",
    "blackThree" to "#ff121212",
)

private fun tv360Huawei16NormalizeOpaqueColor(raw: String): String {
    val value = raw.trim().lowercase()
    return when {
        Regex("^#[0-9a-f]{8}$").matches(value) -> value
        Regex("^#[0-9a-f]{6}$").matches(value) -> "#ff" + value.substring(1)
        else -> value
    }
}

/**
 * Pure black for the Huawei TV360 1.6 UI. No bytecode changes.
 *
 * Fail closed if any audited resource is missing, duplicated or has an
 * unexpected value, rather than silently recoloring another APK variant.
 * Validation happens before changing any DOM node.
 */
@Suppress("unused")
val tv360Huawei16PureAmoledPatch = resourcePatch(
    name = "TV360 Bitel 1.6 - Pure AMOLED Black",
    description = "Makes verified dark TV360 interface surfaces #000000 while retaining text, red accents, posters and video.",
    default = false,
) {
    compatibleWith("com.bitel.tv360"("1.6"))

    execute {
        document("res/values/colors.xml").use { document ->
            val found = mutableMapOf<String, Element>()
            val colors = document.getElementsByTagName("color")
            for (index in 0 until colors.length) {
                val color = colors.item(index) as? Element ?: continue
                val name = color.getAttribute("name")
                if (name !in tv360Huawei16AmoledSurfaces) continue
                if (found.put(name, color) != null) {
                    throw PatchException("TV360 AMOLED: duplicate color '$name'")
                }
            }

            val missing = tv360Huawei16AmoledSurfaces.keys - found.keys
            if (missing.isNotEmpty()) {
                throw PatchException("TV360 AMOLED: missing audited colors: $missing")
            }

            // Check all originals first: the patch must not partially recolor
            // a different 1.6 build when one target has drifted.
            for ((name, original) in tv360Huawei16AmoledSurfaces) {
                val actual = tv360Huawei16NormalizeOpaqueColor(found.getValue(name).textContent)
                val expected = tv360Huawei16NormalizeOpaqueColor(original)
                if (actual != expected) {
                    throw PatchException(
                        "TV360 AMOLED: unexpected '$name' value '$actual' (expected '$expected')"
                    )
                }
            }

            for (name in tv360Huawei16AmoledSurfaces.keys) {
                found.getValue(name).textContent = TV360_HUAWEI16_TRUE_BLACK
            }
        }
    }
}
