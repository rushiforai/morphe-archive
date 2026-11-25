package dev.jason.gboardpatches.patches.gboard.features.immersive

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD
import org.w3c.dom.Element

private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"
private const val EXTENSION_CLASS = "Lapp/immersivekeyboard/extension/ThemeDarkMode;"
private const val MENU_CLASS = "Lapp/immersivekeyboard/extension/ThemePairMenu;"

private val PERMISSIONS = listOf(
    "android.permission.SET_WALLPAPER",
    // Asked for only when a wallpaper is picked in vivo Themes, to copy it.
    "android.permission.MANAGE_EXTERNAL_STORAGE",
)

private val VIVO_WALLPAPER_PACKAGES = listOf(
    "com.bbk.theme",
    "com.bbk.theme.resources",
    "com.vivo.livewallpaper.boxres",
)

/**
 * Lets Gboard set the phone's wallpaper, for the wallpaper that follows dark mode, read the
 * wallpaper picked in vivo Themes, and see the vivo packages its own wallpapers come from.
 */
internal val gboardWallpaperPermissionPatch = resourcePatch {
    compatibleWith(COMPATIBILITY_GBOARD)

    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            val permissions = manifest.getElementsByTagName("uses-permission")
            PERMISSIONS.forEach { permissionName ->
                val present = (0 until permissions.length).any { index ->
                    (permissions.item(index) as Element).getAttributeNS(ANDROID_NS, "name") == permissionName
                }
                if (!present) {
                    val permission = document.createElement("uses-permission")
                    permission.setAttributeNS(ANDROID_NS, "android:name", permissionName)
                    val application = manifest.getElementsByTagName("application").item(0)
                    manifest.insertBefore(permission, application)
                }
            }

            val application = manifest.getElementsByTagName("application").item(0)
            val queries = manifest.getElementsByTagName("queries").let { nodes ->
                if (nodes.length > 0) {
                    nodes.item(0) as Element
                } else {
                    document.createElement("queries").also { created -> manifest.insertBefore(created, application) }
                }
            }
            val packages = queries.getElementsByTagName("package")
            VIVO_WALLPAPER_PACKAGES.forEach { packageName ->
                val listed = (0 until packages.length).any { index ->
                    (packages.item(index) as Element).getAttributeNS(ANDROID_NS, "name") == packageName
                }
                if (!listed) {
                    val entry = document.createElement("package")
                    entry.setAttributeNS(ANDROID_NS, "android:name", packageName)
                    queries.appendChild(entry)
                }
            }
        }
    }
}

internal val gboardThemeFollowsDarkModePatch = bytecodePatch(
    description = "Adds a \"Light & dark pair\" menu to the top of Gboard's Themes screen. " +
        "Choose a theme for light mode and one for dark mode, and the keyboard switches " +
        "between them when the system dark mode changes. It can switch the wallpaper " +
        "between a light and a dark image too.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    extendWith(IMMERSIVE_KEYBOARD_EXTENSION)

    dependsOn(gboardWallpaperPermissionPatch)

    execute {
        // The parameter registers are reused right after the super call, so hook directly behind it.
        InputViewDispatchDrawFingerprint.let { fingerprint ->
            fingerprint.method.addInstructions(
                fingerprint.instructionMatches.first().index + 1,
                "invoke-static { p0 }, $EXTENSION_CLASS->check(Landroid/view/View;)V",
            )
        }

        // Add the pair menu to the view the Themes screen returns.
        ThemeListingCreateViewFingerprint.method.apply {
            implementation!!.instructions
                .withIndex()
                .filter { it.value.opcode == Opcode.RETURN_OBJECT }
                .map { it.index to (it.value as OneRegisterInstruction).registerA }
                .reversed()
                .forEach { (index, register) ->
                    addInstructions(
                        index,
                        "invoke-static { v$register }, $MENU_CLASS->attach(Landroid/view/View;)V",
                    )
                }
        }
    }
}
