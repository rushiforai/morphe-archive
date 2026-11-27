package app.morphe.patches.music.layout.miniplayer.m3navigation

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile
import app.morphe.patcher.patch.resourceXml
import app.morphe.patcher.patch.resourceXmlOrNull
import app.morphe.patcher.xml.XmlElement
import app.morphe.patches.music.misc.playservice.is_9_39_or_greater
import app.morphe.patches.music.misc.playservice.versionCheckPatch
import app.morphe.patches.music.shared.Constants.COMPATIBILITY_YOUTUBE_MUSIC
import app.morphe.util.insertLiteralOverride
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction

private const val EXTENSION_CLASS =
    "Lapp/morphe/extension/music/patches/miniplayer/M3NavigationFilter;"

private const val ADD_ON_PREFERENCES_FILE_PATH = "morphe_addon_prefs.xml"
private const val M3_PREFERENCE_KEY = "morphe_settings_music_screen_4_player_m3_redesign"
private const val M3_PREFERENCE_TAG =
    "app.morphe.extension.music.patches.miniplayer.M3NavigationPreference"

private val COMPATIBILITY_YOUTUBE_MUSIC_ANY = Compatibility(
    name = "YouTube Music",
    packageName = "com.google.android.apps.youtube.music",
    apkFileType = ApkFileType.APK_REQUIRED,
    appIconColor = 0xFF0000,
    signatures = COMPATIBILITY_YOUTUBE_MUSIC.signatures,
    targets = listOf(
        AppTarget(
            version = null,
            minSdk = 26
        )
    )
)

@Suppress("unused")
val m3NavigationPatch = patch(
    name = "M3 Redesign addon",
    description = "Redesigns the miniplayer, navigation bar, and Now Playing screen into a customizable Material 3 Expressive layout with wave seekbar, rotating wavy search button, ambient glow, and dynamic album palette.",
    default = false
) {
    dependsOn(versionCheckPatch)
    compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC_ANY)
    extendWith("extensions/m3navigation.mpe")

    execute {
        if (is_9_39_or_greater) {
            listOf(
                "res/layout/watch_while_layout.xml",
                "res/layout/watch_while_layout_deferred.xml"
            ).forEach { path ->
                resourceXml(path).use { layout ->
                    val root = layout.root
                    root.attributeNames.filter { it.endsWith(":floatingMiniPlayerHorizontalMargin") }
                        .forEach { root.setAttribute(it, "@dimen/item_large_spacing") }
                }
            }

            M3FloatingMiniplayerFeatureFlagFingerprint.matchAll().forEach {
                it.method.insertLiteralOverride(
                    it.instructionMatches.first().index,
                    "$EXTENSION_CLASS->useFloatingMiniplayer(Z)Z"
                )
            }
        }

        val addOnFile = resourceFile(ADD_ON_PREFERENCES_FILE_PATH)
        if (!addOnFile.exists()) {
            addOnFile.writeText(
                """
                <?xml version="1.0" encoding="utf-8"?>
                <morphe-add-on-preferences xmlns:android="http://schemas.android.com/apk/res/android">
                </morphe-add-on-preferences>
                """.trimIndent()
            )
        }

        resourceXml(ADD_ON_PREFERENCES_FILE_PATH).use { xml ->
            xml.root.appendChild("screen") {
                appendChild(M3_PREFERENCE_TAG) {
                    setAttribute("android:key", M3_PREFERENCE_KEY)
                    setAttribute("android:title", "M3 Redesign addon")
                    setAttribute("android:layout", "@layout/morphe_preference_with_icon")
                    setAttribute("android:selectable", "true")
                }
            }
        }
    }

    finalize {
        val addOnFile = resourceFile(ADD_ON_PREFERENCES_FILE_PATH)
        if (addOnFile.exists()) {
            arrayOf(
                "res/xml/morphe_prefs.xml",
                "res/xml/morphe_prefs_icons.xml",
                "res/xml/morphe_prefs_icons_bold.xml"
            ).forEach { prefPath ->
                resourceXmlOrNull(prefPath)?.use { xml ->
                    val rootNode = xml.elements("PreferenceScreen").firstOrNull() ?: return@use
                    if (rootNode.findByKey(M3_PREFERENCE_KEY) == null) {
                        rootNode.appendChild(M3_PREFERENCE_TAG) {
                            setAttribute("android:key", M3_PREFERENCE_KEY)
                            setAttribute("android:title", "M3 Redesign addon")
                            if (prefPath != "res/xml/morphe_prefs.xml") {
                                setAttribute("android:layout", "@layout/morphe_preference_with_icon")
                            }
                            setAttribute("android:selectable", "true")
                        }
                    }
                }
            }
            addOnFile.delete()
        }

        M3WatchWhileLayoutOnMeasureFingerprint.let {
            it.clearMatch()
            it.method.apply {
                val index = it.instructionMatches.last().index
                val call = getInstruction<FiveRegisterInstruction>(index)
                val contentRegister = call.registerC
                val heightRegister = call.registerE

                addInstructions(
                    index,
                    """
                        invoke-static { v$contentRegister, v$heightRegister }, $EXTENSION_CLASS->getContentHeight(Landroid/view/View;I)I
                        move-result v$heightRegister
                    """
                )
            }
        }

        M3MiniPlayerConstructorFingerprint.let {
            it.clearMatch()
            it.method.apply {
                val findViewByIdIndex = it.instructionMatches[1].index
                val parentViewRegister = getInstruction<FiveRegisterInstruction>(findViewByIdIndex).registerC

                addInstruction(
                    findViewByIdIndex,
                    "invoke-static { v$parentViewRegister }, " +
                        "$EXTENSION_CLASS->onMiniPlayerCreated(Landroid/view/View;)V"
                )
            }
        }
    }
}

private fun XmlElement.findByKey(key: String): XmlElement? {
    children.forEach { element ->
        val elementKey = element.attribute("android:key").orEmpty()
        if (elementKey == key || elementKey.startsWith("${key}_sort_by")) {
            return element
        }
        element.findByKey(key)?.let { return it }
    }
    return null
}
