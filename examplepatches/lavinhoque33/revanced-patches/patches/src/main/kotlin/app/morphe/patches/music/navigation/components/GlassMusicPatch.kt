/*
 * Copyright 2026 Morphe.
 * Copyright (C) 2026 lavinhoque33
 * https://github.com/MorpheApp/morphe-patches/pull/4542
 * https://github.com/MorpheApp/morphe-patches/pull/4621
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-13.
 */

package app.morphe.patches.music.navigation.components

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.string
import app.morphe.patches.music.player.components.playerComponentsPatch
import app.morphe.patches.music.utils.compatibility.Constants.COMPATIBILITY_YOUTUBE_MUSIC
import app.morphe.patches.music.utils.playservice.is_8_51_or_greater
import app.morphe.patches.music.utils.playservice.is_9_39_or_greater
import app.morphe.patches.music.utils.playservice.versionCheckPatch
import app.morphe.patches.music.utils.settings.CategoryType
import app.morphe.patches.music.utils.settings.addCustomPreference
import app.morphe.patches.music.utils.settings.addSwitchPreference
import app.morphe.patches.shared.misc.media.MediaSessionSetPlaybackStateFingerprint
import app.morphe.patches.shared.misc.media.hookMediaSessionArgument
import app.morphe.util.indexOfFirstInstructionOrThrow
import app.morphe.util.indexOfFirstLiteralInstructionOrThrow
import app.morphe.util.Utils.printWarn
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val GLASS = "Lapp/morphe/extension/music/patches/MusicGlassNavigationBar;"
private const val MINIPLAYER = "Lapp/morphe/extension/music/patches/MusicGlassMiniplayer;"
private const val FLOATING_FLAG = 45823962L

private object GlassWatchWhileMeasureFingerprint : Fingerprint(
    definingClass = "WatchWhileLayout;",
    name = "onMeasure",
    returnType = "V",
    parameters = listOf("I", "I"),
    filters = listOf(
        string("visiblePivotBarHeight is 0"),
        methodCall(
            opcode = Opcode.INVOKE_STATIC,
            returnType = "V",
            parameters = listOf("Landroid/view/View;", "I", "I")
        )
    )
)

private val glassMusicResourcePatch = resourcePatch {
    dependsOn(versionCheckPatch)

    execute {
        if (!is_9_39_or_greater) return@execute

        // The deferred player has a separate layout on the fork's supported Music versions.
        listOf("watch_while_layout.xml", "watch_while_layout_player.xml").forEach { name ->
            val path = "res/layout/$name"
            if (!get(path).exists()) return@forEach

            document(path).use { document ->
                val root = document.documentElement
                val names = List(root.attributes.length) { root.attributes.item(it).nodeName }
                names.filter { it.endsWith(":floatingMiniPlayerHorizontalMargin") }.forEach {
                    root.setAttribute(it, "@dimen/item_large_spacing")
                }
            }
        }
    }
}

@Suppress("unused")
val glassMusicPatch = bytecodePatch(
    name = "Glass player and navigation bar",
    description = "Adds independent glass styles for the miniplayer and navigation bar, with live previews."
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC)

    dependsOn(navigationBarComponentsPatch, playerComponentsPatch, glassMusicResourcePatch)

    execute {
        if (!is_8_51_or_greater) {
            printWarn("Music glass UI requires the navigation tab callback from Music 8.51+. Skipping.")
            return@execute
        }

        // Resolve all required integrations before changing any native method or adding settings.
        TabLayoutTextFingerprint.clearMatch()
        val tabMatch = runCatching { TabLayoutTextFingerprint.match() }.getOrNull()
        val measureMatch = runCatching { GlassWatchWhileMeasureFingerprint.match() }.getOrNull()
        val timeBar = runCatching {
            classDefBy("Lcom/google/android/apps/youtube/music/watchpage/MusicPlaybackControlsTimeBar;")
                .superclass
        }.getOrNull()
        if (tabMatch == null || measureMatch == null || timeBar == null) {
            printWarn("Music glass UI: navigation, page measurement or time-bar hook is unavailable. Skipping.")
            return@execute
        }

        tabMatch.method.apply {
            val index = tabMatch.instructionMatches.last().index
            val register = getInstruction<FiveRegisterInstruction>(index).registerC
            addInstructions(index, "invoke-static {v$register}, $GLASS->navigationTabCreated(Landroid/view/View;)V")
        }

        measureMatch.method.apply {
            val index = measureMatch.instructionMatches.last().index
            val call = getInstruction<FiveRegisterInstruction>(index)
            val hook = "$GLASS->getContentHeight(Landroid/view/View;I)I"
            addInstructions(
                index,
                """
                    invoke-static {v${call.registerC}, v${call.registerE}}, $hook
                    move-result v${call.registerE}
                """
            )
        }

        mutableClassDefBy(timeBar).interfaces.add("${MINIPLAYER.dropLast(1)}\$TimeBar;")
        MediaSessionSetPlaybackStateFingerprint.hookMediaSessionArgument(
            "$MINIPLAYER->onSetPlaybackState(Landroid/media/session/PlaybackState;)V"
        )

        if (is_9_39_or_greater) {
            val flags = Fingerprint(filters = listOf(app.morphe.patcher.literal(FLOATING_FLAG)))
            flags.matchAll().forEach { match ->
                match.method.apply {
                    val index = indexOfFirstInstructionOrThrow(
                        indexOfFirstLiteralInstructionOrThrow(FLOATING_FLAG), Opcode.MOVE_RESULT
                    )
                    val register = getInstruction<OneRegisterInstruction>(index).registerA
                    addInstructions(
                        index + 1,
                        """
                            invoke-static/range {v$register .. v$register}, $GLASS->useFloatingMiniplayer(Z)Z
                            move-result v$register
                        """
                    )
                }
            }
        }

        fun glassPreferences(category: CategoryType, component: String) {
            val key = "morphe_music_${component}_glass"
            addSwitchPreference(category, key, "false")

            val miniplayer = component == "miniplayer"
            addCustomPreference(
                category,
                key + if (miniplayer) "_corner_radius" else "_height",
                "app.morphe.extension.music.settings.preference.MusicGlass" +
                    if (miniplayer) "MiniplayerPreference" else "NavigationBarPreference",
                dependencyKey = key,
                setSummary = false,
                titleKey = key + if (miniplayer) "_style_title" else "_size_title"
            )
            addCustomPreference(
                category, "${key}_blur",
                "app.morphe.extension.shared.settings.preference.SeekBarPreference", key, setSummary = false
            )
            val switches = if (miniplayer) {
                listOf("light", "album_tint", "spinning_artwork", "hide_progress_bar")
            } else {
                listOf("light", "album_tint", "hide_indicator")
            }
            switches.forEach { suffix ->
                val defaultValue = if (miniplayer && suffix == "album_tint") "true" else "false"
                addSwitchPreference(category, "${key}_$suffix", defaultValue, key)
            }
        }

        // Keep the fork's established Navigation and Player screens and existing miniplayer keys.
        glassPreferences(CategoryType.NAVIGATION, "navigation_bar")
        glassPreferences(CategoryType.PLAYER, "miniplayer")
    }
}
