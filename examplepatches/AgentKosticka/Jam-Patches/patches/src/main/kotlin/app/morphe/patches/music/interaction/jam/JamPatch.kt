package app.morphe.patches.music.interaction.jam

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.all.misc.resources.resourceMappingPatch
import app.morphe.patches.music.misc.extension.sharedExtensionPatch
import app.morphe.patches.music.misc.settings.PreferenceScreen
import app.morphe.patches.music.misc.settings.settingsPatch
import app.morphe.patches.music.shared.Constants.COMPATIBILITY_YOUTUBE_MUSIC
import app.morphe.patches.music.shared.MusicActivityOnCreateFingerprint
import app.morphe.patches.music.video.information.musicVideoInformationPatch
import app.morphe.patches.shared.misc.settings.preference.NonInteractivePreference
import app.morphe.patches.shared.misc.settings.preference.PreferenceScreenPreference
import app.morphe.patches.shared.misc.settings.preference.SwitchPreference

private val jamResources = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { doc ->
            val service = doc.createElement("service")
            service.setAttribute("android:name", "app.morphe.extension.music.jam.JamBridgeService")
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
                (0 until root.childNodes.length)
                    .map { root.childNodes.item(it) }
                    .filterIsInstance<org.w3c.dom.Element>()
                    .single { it.getAttribute("android:id") == "@id/bottom_sheet_tabbed_view" }
            root.insertBefore(
                doc.createElement("app.morphe.extension.music.jam.JamBar").apply {
                    setAttribute("android:layout_width", "match_parent")
                    setAttribute("android:layout_height", "48dp")
                },
                tabs,
            )
        }
        document("res/layout/watch_while_layout.xml").use { doc ->
            doc.documentElement.setAttribute("app:bottomSheetPeekHeight", "68dp")
        }
    }
}

/**
 * Connects semantic YouTube Music anchors to the stable Jam extension API. Native discovery is kept
 * in [JamAbi] and [JamUiAbi]; generated methods are small access or interception bridges.
 */
@Suppress("unused")
val jamQueueProbePatch =
    bytecodePatch(
        name = "Jam queue sharing",
        description =
            "Adds a native Jam queue panel and authenticated bridge. Experimental; validated on YTM 9.15.51.",
        default = true,
    ) {
        dependsOn(
            sharedExtensionPatch,
            settingsPatch,
            jamResources,
            musicVideoInformationPatch,
            resourceMappingPatch,
        )
        compatibleWith(
            Compatibility(
                name = "YouTube Music",
                packageName = "com.google.android.apps.youtube.music",
                apkFileType = COMPATIBILITY_YOUTUBE_MUSIC.apkFileType,
                signatures = COMPATIBILITY_YOUTUBE_MUSIC.signatures,
                targets = COMPATIBILITY_YOUTUBE_MUSIC.targets.filter { it.version == "9.15.51" },
            )
        )

        execute {
            val baseQueue = resolveJamQueueAbi()
            val ui = resolveJamUiAbi(baseQueue)
            val queue =
                baseQueue.copy(item = baseQueue.item.copy(menuPayload = ui.queueRow.menuPayload))

            installJamQueueBridges(queue)
            installJamUiBridges(ui, queue)

            MusicActivityOnCreateFingerprint.method.addInstructions(
                0,
                "invoke-static/range {p0 .. p0}, Lapp/morphe/extension/music/jam/JamUi;->install(Landroid/app/Activity;)V",
            )
            PreferenceScreen.PLAYER.addPreferences(
                PreferenceScreenPreference(
                    key = "morphe_music_jam_probe",
                    sorting = PreferenceScreenPreference.Sorting.UNSORTED,
                    preferences =
                        setOf(
                            SwitchPreference(key = "morphe_music_jam_enabled", summary = true),
                            NonInteractivePreference(
                                key = "morphe_music_jam_download",
                                tag = "app.morphe.extension.music.jam.JamDownloadPreference",
                                selectable = true,
                            ),
                            NonInteractivePreference(
                                key = "morphe_music_jam_controls",
                                tag = "app.morphe.extension.music.jam.JamProbePreference",
                                selectable = true,
                            ),
                            NonInteractivePreference(
                                key = "morphe_music_jam_companion_package",
                                tag =
                                    "app.morphe.extension.music.jam.JamCompanionPackagePreference",
                                selectable = true,
                            ),
                        ),
                )
            )
        }
    }
