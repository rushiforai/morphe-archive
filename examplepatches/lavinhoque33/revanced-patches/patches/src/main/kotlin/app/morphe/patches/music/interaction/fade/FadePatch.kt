/*
 * Copyright (C) 2026 lavinhoque33
 *
 * This program is free software: you can redistribute it and/or modify it under the terms of the
 * GNU General Public License as published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 *
 * Written by lavinhoque33, 2026-10-24
 */

package app.morphe.patches.music.interaction.fade

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.music.utils.compatibility.Constants.COMPATIBILITY_YOUTUBE_MUSIC
import app.morphe.patches.music.utils.extension.Constants.PATCHES_PATH
import app.morphe.patches.music.utils.extension.sharedExtensionPatch
import app.morphe.patches.music.utils.settings.CategoryType
import app.morphe.patches.music.utils.settings.ResourceUtils
import app.morphe.patches.music.utils.settings.ResourceUtils.addPreferenceCategory
import app.morphe.patches.music.utils.settings.ResourceUtils.editPreferenceCategory
import app.morphe.patches.music.utils.settings.settingsPatch
import app.morphe.patches.music.video.playback.MusicPlaybackParametersToStringFingerprint
import app.morphe.patches.music.video.playback.getMusicExoPlayerImplFingerprint
import app.morphe.patches.music.video.playback.getMusicPlaybackParametersSetterFingerprint
import app.morphe.util.Utils.printWarn
import app.morphe.util.adoptChild
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.w3c.dom.Element

private const val EXTENSION_CLASS = "$PATCHES_PATH/FadeManager;"
private const val EXTENSION_PLAYER_INTERFACE = "$PATCHES_PATH/FadePlayer;"

private const val SLIDER_PREFERENCE_TAG = "app.morphe.extension.shared.settings.preference.SliderPreference"

/** The value of androidx.media3.common.C.TIME_UNSET, which getDuration returns when the duration is unknown. */
private const val TIME_UNSET = -9223372036854775807L

/** The methods of the ExoPlayer implementation that the fade needs. */
private class PlayerMethods(
    val setVolume: MutableMethod,
    val getDurationName: String,
    val getPositionName: String,
)

@Suppress("unused")
val fadePatch = bytecodePatch(
    name = "Fade in and fade out",
    description = "Adds optional fade-in and fade-out of the volume at the start and end of tracks."
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC)

    dependsOn(
        sharedExtensionPatch,
        settingsPatch,
    )

    execute {
        val playbackParametersType = runCatching { MusicPlaybackParametersToStringFingerprint.classDef.type }
            .getOrNull() ?: return@execute printWarn(
            "Fade in and fade out: could not find the ExoPlayer playback parameters. Skipping."
        )
        val playerClass = runCatching { getMusicPlaybackParametersSetterFingerprint(playbackParametersType).classDef }
            .getOrNull() ?: return@execute printWarn(
            "Fade in and fade out: could not find the ExoPlayer implementation. Skipping."
        )

        val methods = findPlayerMethods(playerClass) ?: return@execute printWarn(
            "Fade in and fade out: could not find the volume, duration and position methods of ExoPlayer. Skipping."
        )

        addPlayerHelperMethods(playerClass, methods)

        // The volume the app sets is multiplied with the fade gain.
        methods.setVolume.addInstructions(
            0,
            """
                invoke-static/range { p0 .. p1 }, $EXTENSION_CLASS->onSetVolume(${EXTENSION_PLAYER_INTERFACE}F)F
                move-result p1
            """
        )

        // Capture each ExoPlayer instance at its constructor.
        getMusicExoPlayerImplFingerprint(playbackParametersType).matchAll().forEach {
            val firstMatch = it.instructionMatches.first()
            val register = (firstMatch.instruction as FiveRegisterInstruction).registerC

            it.method.addInstruction(
                firstMatch.index + 1,
                "invoke-static { v$register }, $EXTENSION_CLASS->initializeExoPlayer($EXTENSION_PLAYER_INTERFACE)V"
            )
        }

        addFadeSettings()
    }
}

context(ctx: BytecodePatchContext)
private fun classAndSuperclasses(playerClass: ClassDef): List<ClassDef> = buildList {
    var current: ClassDef? = playerClass
    while (current != null && current.type != "Ljava/lang/Object;") {
        add(current)
        val superclass = current.superclass
        current = superclass?.let { runCatching { ctx.classDefBy(it) }.getOrNull() }
    }
}

/**
 * The playback info holds the state of the player: a class without interfaces that has int and long fields.
 * It is a field of the player and the argument of the method that computes the playback position.
 */
context(ctx: BytecodePatchContext)
private fun findPlaybackInfoType(hierarchy: List<ClassDef>): String? =
    hierarchy.flatMap { it.fields }.map { it.type }.distinct().firstOrNull { type ->
        val classDef = type.takeIf { it.startsWith("L") }?.let { runCatching { ctx.classDefBy(it) }.getOrNull() }
        classDef != null
                && classDef.interfaces.isEmpty()
                && classDef.fields.count { it.type == "I" } >= 3
                && classDef.fields.any { it.type == "J" }
    }

/**
 * Finds the volume setter of the ExoPlayer implementation, and its getDuration and getCurrentPosition
 * which can be defined in a superclass.
 */
context(ctx: BytecodePatchContext)
private fun findPlayerMethods(playerClass: MutableClass): PlayerMethods? {
    val setVolume = playerClass.methods.firstOrNull { method ->
        method.returnType == "V"
                && method.parameterTypes.map(CharSequence::toString) == listOf("F")
                && AccessFlags.PUBLIC.isSet(method.accessFlags)
                && method.callsMethod("Ljava/lang/Float;->valueOf(F)")
    } ?: return null

    val hierarchy = classAndSuperclasses(playerClass)
    val methods = hierarchy.flatMap { it.methods }

    val getDuration = methods.firstOrNull { method ->
        method.returnType == "J"
                && method.parameterTypes.isEmpty()
                && method.implementation?.instructions?.any {
            it is WideLiteralInstruction && it.wideLiteral == TIME_UNSET
        } == true
    } ?: return null

    val playbackInfoType = findPlaybackInfoType(hierarchy) ?: return null

    val getPosition = methods.firstOrNull { method ->
        method.returnType == "J"
                && method.parameterTypes.isEmpty()
                && method.name != getDuration.name
                && method.callsMethod("($playbackInfoType)J")
    } ?: return null

    return PlayerMethods(setVolume, getDuration.name, getPosition.name)
}

private fun Method.callsMethod(referencePart: String) = implementation?.instructions?.any {
    it is ReferenceInstruction
            && it.reference !is FieldReference
            && it.reference.toString().contains(referencePart)
} == true

private fun MutableClass.addHelperMethod(
    name: String,
    parameters: List<String>,
    returnType: String,
    registers: Int,
    smali: String,
) {
    methods.add(
        ImmutableMethod(
            type,
            name,
            parameters.map { ImmutableMethodParameter(it, null, null) },
            returnType,
            AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
            null,
            null,
            MutableMethodImplementation(registers),
        ).toMutable().apply { addInstructions(0, smali) }
    )
}

/** Adds the interface and the methods that let the extension use the obfuscated player methods. */
private fun addPlayerHelperMethods(playerClass: MutableClass, methods: PlayerMethods) {
    val playerType = playerClass.type

    playerClass.interfaces.add(EXTENSION_PLAYER_INTERFACE)

    playerClass.addHelperMethod(
        "patch_setFadeVolume", listOf("F"), "V", 2,
        """
            invoke-virtual { p0, p1 }, $playerType->${methods.setVolume.name}(F)V
            return-void
        """
    )
    playerClass.addHelperMethod(
        "patch_getDurationMs", emptyList(), "J", 3,
        """
            invoke-virtual { p0 }, $playerType->${methods.getDurationName}()J
            move-result-wide v0
            return-wide v0
        """
    )
    playerClass.addHelperMethod(
        "patch_getPositionMs", emptyList(), "J", 3,
        """
            invoke-virtual { p0 }, $playerType->${methods.getPositionName}()J
            move-result-wide v0
            return-wide v0
        """
    )
}

private fun addFadeSettings() {
    addPreferenceCategory(CategoryType.PLAYER.value)
    editPreferenceCategory(CategoryType.PLAYER.value) {
        adoptChild(ResourceUtils.PREFERENCE_SCREEN_TAG_NAME) {
            setAttribute("android:key", "morphe_music_fade_screen")
            setAttribute("android:title", "@string/morphe_music_fade_screen_title")
            setAttribute("android:summary", "@string/morphe_music_fade_screen_summary")

            addFadeSwitch("morphe_music_fade_in_enabled")
            addFadeSlider("morphe_music_fade_in_duration")
            addFadeSwitch("morphe_music_fade_out_enabled")
            addFadeSlider("morphe_music_fade_out_duration")
        }
    }
}

private fun Element.addFadeSwitch(key: String) {
    adoptChild(ResourceUtils.SWITCH_PREFERENCE_TAG_NAME) {
        setAttribute("android:key", key)
        setAttribute("android:title", "@string/${key}_title")
        setAttribute("android:summary", "@string/${key}_summary")
        setAttribute("android:defaultValue", "false")
    }
}

private fun Element.addFadeSlider(key: String) {
    adoptChild(SLIDER_PREFERENCE_TAG) {
        setAttribute("android:key", key)
        setAttribute("android:title", "@string/${key}_title")
        setAttribute("android:summary", "@string/${key}_summary")
        setAttribute("android:selectable", "true")
    }
}
