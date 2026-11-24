/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Written by lavinhoque33, 2026-11-23.
 * Based on the A–B loop in Morphe PR #4685 (Copyright 2026 Morphe; see NOTICE).
 */
package app.morphe.patches.music.interaction.loop

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.music.utils.compatibility.Constants.COMPATIBILITY_YOUTUBE_MUSIC
import app.morphe.patches.music.utils.extension.sharedExtensionPatch
import app.morphe.patches.music.utils.playservice.is_8_51_or_greater
import app.morphe.patches.music.utils.settings.CategoryType
import app.morphe.patches.music.utils.settings.addSwitchPreference
import app.morphe.patches.music.utils.settings.settingsPatch
import app.morphe.patches.music.video.information.ModernVideoEndFingerprint
import app.morphe.patches.music.video.information.videoEndFingerprint
import app.morphe.patches.music.video.information.videoIdHook
import app.morphe.patches.music.video.information.videoInformationPatch
import app.morphe.util.Utils.printInfo
import app.morphe.util.Utils.printWarn
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.fingerprint.methodOrThrow
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

private const val REPEAT = "Lapp/morphe/extension/music/patches/loop/RepeatSection;"
private const val PLAYBACK = "Lapp/morphe/extension/music/patches/loop/RepeatSection\$Playback;"
private const val TIME_BAR = "Lcom/google/android/apps/youtube/music/watchpage/MusicPlaybackControlsTimeBar;"
private const val EXO_PLAYER = "Landroidx/media3/exoplayer/ExoPlayer;"

private object CoordinatorNextFingerprint : Fingerprint(
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(string("gapless.seek.next")),
)

private object MedialibLoadFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(string("MedialibPlayer.loadVideo(", StringComparisonType.STARTS_WITH)),
)

/** The Media3 getter names are obfuscated; the coordinator and its live Exo field are discovered independently. */
private data class ClockAbi(val position: String, val duration: String, val playing: String)

private val clockAbis = mapOf(
    "8.12.54" to ClockAbi("r", "s", "h"),
    "8.28.54" to ClockAbi("s", "t", "i"),
    "8.30.54" to ClockAbi("s", "t", "i"),
    "9.15.51" to ClockAbi("v", "w", "k"),
    "9.40.51" to ClockAbi("r", "s", "g"),
    "9.45.51" to ClockAbi("r", "s", "g"),
)

@Suppress("unused")
val repeatSectionPatch = bytecodePatch(
    name = "A–B repeat",
    description = "Adds optional Now Playing controls to repeat a section of a track.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC)
    dependsOn(sharedExtensionPatch, settingsPatch, videoInformationPatch)

    execute {
        val abi = clockAbis[packageMetadata.versionName]
            ?: return@execute printWarn("A–B repeat: no native playback clock for this Music version. Skipping.")
        val install = runCatching { prepareRepeatSection(abi) }.getOrElse { error ->
            return@execute printWarn("A–B repeat: ${error.message}. Skipping.")
        }

        install()
        addSwitchPreference(CategoryType.PLAYER, "morphe_music_ab_repeat", "false")
    }
}

private fun BytecodePatchContext.prepareRepeatSection(abi: ClockAbi): () -> Unit {
    val next = CoordinatorNextFingerprint.method
    val coordinator = mutableClassDefBy(next.definingClass)
    val constructor = coordinator.methods.single { it.name == "<init>" }
    val player = coordinator.fields.single { field ->
        !AccessFlags.STATIC.isSet(field.accessFlags) && field.type == EXO_PLAYER
    }
    val getters = listOf(
        Triple("rvxRepeatPosition", abi.position, "J"),
        Triple("rvxRepeatDuration", abi.duration, "J"),
        Triple("rvxRepeatPlaying", abi.playing, "Z"),
    )
    val interfaces = classDefBy(EXO_PLAYER).interfaces.map { classDefBy(it) }
    getters.forEach { (_, name, result) ->
        check(interfaces.any { type -> type.methods.any { it.name == name && it.hasSignature(emptyList(), result) } }) {
            "Media3 playback clock method $name()$result not found"
        }
    }
    check(coordinator.methods.any { method ->
        method.hasSignature(emptyList(), "J") && method.implementation?.instructions?.any {
            val call = it.getReference<MethodReference>()
            call?.definingClass == EXO_PLAYER && call.name == abi.position && call.hasSignature(emptyList(), "J")
        } == true
    }) { "Coordinator current-position delegate not found" }

    val load = MedialibLoadFingerprint.method
    val medialib = mutableClassDefBy(load.definingClass)
    val stop = medialib.methods.single { it.hasDiagnostic("MedialibPlayer.stopVideo()") }
    val skip = medialib.methods.single { it.hasDiagnostic("MedialibPlayer.playNextInQueue()") }
    val seek = if (is_8_51_or_greater) ModernVideoEndFingerprint.method else videoEndFingerprint.methodOrThrow()
    check(seek.parameterTypes.firstOrNull() == "J" && !AccessFlags.STATIC.isSet(seek.accessFlags)) {
        "Native seek signature changed"
    }

    val timeBar = mutableClassDefBy(TIME_BAR).methods.single {
        it.name == "<init>" && it.hasSignature(listOf("Landroid/content/Context;", "Landroid/util/AttributeSet;"), "V")
    }
    check(constructor.returns().isNotEmpty() && timeBar.returns().isNotEmpty()) { "Missing constructor exit" }

    return {
        coordinator.interfaces.add(PLAYBACK)
        getters.forEach { (bridge, name, result) -> coordinator.addClockBridge(bridge, name, result, player.toString()) }
        constructor.onReturn("invoke-static/range {p0 .. p0}, $REPEAT->onPlaybackCreated($PLAYBACK)V")
        timeBar.onReturn("invoke-static/range {p0 .. p0}, $REPEAT->bindTimeBar(Landroid/view/View;)V")

        listOf(load, stop, skip, next).forEach { method ->
            method.addInstruction(0, "invoke-static {}, $REPEAT->onPlaybackBoundary()V")
        }
        seek.addInstruction(0, "invoke-static/range {p1 .. p2}, $REPEAT->onSeek(J)V")
        videoIdHook("$REPEAT->onVideoId(Ljava/lang/String;)V")
        printInfo("A–B repeat: ${coordinator.type} Exo position ${abi.position}, duration ${abi.duration}; seek $seek")
    }
}

private fun MethodReference.hasSignature(parameters: List<String>, result: String) =
    parameterTypes.map(CharSequence::toString) == parameters && returnType == result

private fun Method.hasDiagnostic(prefix: String) = implementation?.instructions?.any {
    it.getReference<StringReference>()?.string?.startsWith(prefix) == true
} == true

private fun MutableMethod.returns() = implementation!!.instructions.indices.filter {
    implementation!!.instructions[it].opcode == Opcode.RETURN_VOID
}

private fun MutableMethod.onReturn(instruction: String) {
    returns().asReversed().forEach { addInstructionsAtControlFlowLabel(it, instruction) }
}

private fun MutableClass.addClockBridge(bridge: String, name: String, result: String, player: String) {
    val wide = result == "J"
    val code = if (wide) {
        """
            invoke-interface {v0}, $EXO_PLAYER->$name()J
            move-result-wide v0
            return-wide v0
            :no_player
            const-wide/16 v0, -0x1
            return-wide v0
        """
    } else {
        """
            invoke-interface {v0}, $EXO_PLAYER->$name()Z
            move-result v0
            return v0
            :no_player
            const/4 v0, 0x0
            return v0
        """
    }
    methods.add(
        ImmutableMethod(
            type, bridge, emptyList(), result, AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
            null, null, MutableMethodImplementation(if (wide) 3 else 2),
        ).toMutable().apply {
            addInstructions(0, """
                iget-object v0, p0, $player
                if-eqz v0, :no_player
                $code
            """)
        }
    )
}
