/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/3014
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 *
 * Modified by lavinhoque33, 2026-10-24: ported to the RVX fork (fork settings screen, extension,
 * main activity and video information patches; skipped with a warning before YouTube Music 9.00,
 * whose queue manager does not exist on 8.x).
 */

package app.morphe.patches.music.interaction.jam

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.music.utils.compatibility.Constants.COMPATIBILITY_YOUTUBE_MUSIC
import app.morphe.patches.music.utils.extension.sharedExtensionPatch
import app.morphe.patches.music.utils.mainactivity.mainActivityResolvePatch
import app.morphe.patches.music.utils.playservice.is_9_00_or_greater
import app.morphe.patches.music.utils.playservice.versionCheckPatch
import app.morphe.patches.music.utils.settings.CategoryType
import app.morphe.patches.music.utils.settings.ResourceUtils
import app.morphe.patches.music.utils.settings.ResourceUtils.addPreferenceCategory
import app.morphe.patches.music.utils.settings.ResourceUtils.editPreferenceCategory
import app.morphe.patches.music.utils.settings.settingsPatch
import app.morphe.patches.music.video.information.videoInformationPatch
import app.morphe.patches.shared.mainactivity.injectOnCreateMethodCall
import app.morphe.patches.shared.mapping.resourceMappingPatch
import app.morphe.util.Utils.printWarn
import app.morphe.util.adoptChild
import app.morphe.util.findElementByAttributeValueOrThrow
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import org.w3c.dom.Element

private const val EXTENSION_CLASS = "Lapp/morphe/extension/music/patches/jam/JamUI;"
private const val EXTENSION_BAR_CLASS = "Lapp/morphe/extension/music/patches/jam/JamBar;"
private const val EXTENSION_PACKAGE = "app.morphe.extension.music.patches.jam"

private const val VERSION_WARNING = "Jam queue sharing requires YouTube Music 9.00 or newer. Skipping."

private val jamResources = resourcePatch {
    dependsOn(versionCheckPatch)

    execute {
        // The 8.x queue manager has no matching operations manager, see the bytecode patch.
        if (!is_9_00_or_greater) return@execute

        document("AndroidManifest.xml").use { doc ->
            val permissions = doc.getElementsByTagName("uses-permission")
            if (
                (0 until permissions.length).none {
                    (permissions.item(it) as Element).getAttribute("android:name") ==
                        "android.permission.ACCESS_WIFI_STATE"
                }
            ) {
                doc.documentElement.appendChild(
                    doc.createElement("uses-permission").apply {
                        setAttribute("android:name", "android.permission.ACCESS_WIFI_STATE")
                    }
                )
            }

            val service = doc.createElement("service")
            service.setAttribute("android:name", "$EXTENSION_PACKAGE.JamBridgeService")
            service.setAttribute("android:exported", "true")
            doc.getElementsByTagName("application").item(0).appendChild(service)

            val queries =
                doc.getElementsByTagName("queries").item(0)
                    ?: doc.createElement("queries").also { doc.documentElement.appendChild(it) }
            queries.appendChild(
                doc.createElement("package").apply {
                    setAttribute("android:name", "app.morphe.jam.companion")
                }
            )
        }

        document("res/layout/player_bottom_sheet.xml").use { doc ->
            val root = doc.documentElement
            val tabs =
                root.childNodes.findElementByAttributeValueOrThrow(
                    "android:id",
                    "@id/bottom_sheet_tabbed_view",
                )
            root.insertBefore(
                doc.createElement("$EXTENSION_PACKAGE.JamBar").apply {
                    setAttribute("android:layout_width", "match_parent")
                    setAttribute("android:layout_height", "48dp")
                },
                tabs,
            )
        }
    }
}

/**
 * Connects semantic YouTube Music anchors to the stable Jam extension API. Native discovery is kept
 * in [JamQueueAbi] and [JamUiAbi]; generated methods are small access or interception bridges.
 */
@Suppress("unused")
val jamQueueSharingPatch = bytecodePatch(
    name = "Jam queue sharing",
    description = "Shares the host queue and playback controls through an authenticated Jam bridge. "
            + "Root installation is not supported."
) {
    dependsOn(
        sharedExtensionPatch,
        settingsPatch,
        jamResources,
        mainActivityResolvePatch,
        resourceMappingPatch,
        videoInformationPatch,
        versionCheckPatch,
    )

    compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC)

    execute {
        if (!is_9_00_or_greater) {
            printWarn(VERSION_WARNING)
            return@execute
        }

        val baseQueue = resolveJamQueueAbi()
        val ui = resolveJamUiAbi(baseQueue)
        val queue = baseQueue.copy(item = baseQueue.item.copy(menuPayload = ui.queueRow.menuPayload))

        installJamQueueBridges(queue)
        installJamUiBridges(ui, queue)

        injectOnCreateMethodCall(EXTENSION_CLASS, "install")

        BottomSheetPeekHeightFingerprint.let {
            it.method.apply {
                val index = it.instructionMatches.last().index
                val register = getInstruction<OneRegisterInstruction>(index).registerA

                addInstructions(
                    index + 1,
                    """
                        invoke-static { p0, v$register }, $EXTENSION_BAR_CLASS->getBottomSheetPeekHeight(Landroid/view/View;I)I
                        move-result v$register
                    """
                )
            }
        }

        addJamPreferences()
    }
}

/** Morphe's Jam sub-screen, rebuilt in the Player screen like the fork's Track crossfade screen. */
private fun addJamPreferences() {
    fun Element.addJamPreference(key: String, tag: String) =
        adoptChild("$EXTENSION_PACKAGE.$tag") {
            setAttribute("android:key", key)
            setAttribute("android:title", "@string/${key}_title")
            setAttribute("android:summary", "@string/${key}_summary")
            setAttribute("android:selectable", "true")
        }

    addPreferenceCategory(CategoryType.PLAYER.value)
    editPreferenceCategory(CategoryType.PLAYER.value) {
        adoptChild(ResourceUtils.PREFERENCE_SCREEN_TAG_NAME) {
            setAttribute("android:key", "morphe_music_jam_probe")
            setAttribute("android:title", "@string/morphe_music_jam_probe_title")
            setAttribute("android:summary", "@string/morphe_music_jam_probe_summary")

            adoptChild(ResourceUtils.SWITCH_PREFERENCE_TAG_NAME) {
                setAttribute("android:key", "morphe_music_jam_enabled")
                setAttribute("android:title", "@string/morphe_music_jam_enabled_title")
                setAttribute("android:summary", "@string/morphe_music_jam_enabled_summary")
                setAttribute("android:defaultValue", "false")
            }
            addJamPreference("morphe_music_jam_download", "JamDownloadPreference")
            addJamPreference("morphe_music_jam_controls", "JamProbePreference")
            addJamPreference("morphe_music_jam_companion_package", "JamCompanionPackagePreference")
        }
    }
}
