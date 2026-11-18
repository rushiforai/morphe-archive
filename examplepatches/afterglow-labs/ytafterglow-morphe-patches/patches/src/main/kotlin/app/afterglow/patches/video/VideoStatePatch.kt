/*
 * YTAfterglow for Android.
 *
 * Adapted from the video information, video id, player type and player response
 * patches of Morphe patches v2.2.0 (https://github.com/MorpheApp/morphe-patches,
 * GPLv3), which were forked from ReVanced patches
 * (https://github.com/ReVanced/revanced-patches, GPLv3). Modified for YTAfterglow:
 * rewritten for patcher 2.1.0 and YouTube 21.43.523, observe-only hooks, the video id
 * and speed read from the director itself. Not an official Morphe or ReVanced file.
 *
 * Portions of this software are provided "AS IS" by the Morphe software project.
 * Any express or implied warranties, including the implied warranties of
 * merchantability and fitness for a particular purpose, are disclaimed.
 */

package app.afterglow.patches.video

import app.afterglow.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import app.afterglow.patches.shared.Constants.EXTENSION_PACKAGE
import app.afterglow.patches.shared.afterglowExtensionPatch
import app.afterglow.patches.shared.invokeRegisters
import app.afterglow.patches.shared.smali
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

internal const val VIDEO_STATE_CLASS = "$EXTENSION_PACKAGE/video/VideoState;"
internal const val PLAYER_CONTROLLER_INTERFACE = "$EXTENSION_PACKAGE/video/PlayerController;"

/** Prints what a fingerprint resolved to when the patcher runs with `-Dafterglow.debug=true`. */
internal fun debugMatch(label: String, method: Method) {
    if (System.getProperty("afterglow.debug") != null) {
        println("afterglow-debug $label: ${method.definingClass}->${method.name}(${method.parameterTypes.joinToString("")})${method.returnType}")
    }
}

/**
 * Inserts `invoke-static {}, <classDescriptor>->install()V` at the start of YouTube's main
 * activity onCreate, so an extension feature can register its [VideoState] listener before any
 * video plays. The call takes no registers, so it fits any method.
 */
internal fun BytecodePatchContext.installAtStartup(classDescriptor: String) {
    app.afterglow.patches.shared.MainActivityOnCreateFingerprint.method.addInstruction(
        0,
        "invoke-static { }, $classDescriptor->install()V",
    )
}

/** Adds `public final returnType name(parameters)` with the given smali body to the class. */
internal fun MutableClass.addPublicMethod(
    name: String,
    parameters: List<String>,
    returnType: String,
    registerCount: Int,
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
            MutableMethodImplementation(registerCount),
        ).toMutable().apply {
            addInstructions(0, smali)
        },
    )
}

/**
 * Register of `this` after the super constructor call of a constructor, and the index after
 * that call. Other objects can be constructed before the super call (21.43.523's casting
 * director builds two first).
 */
private fun MutableMethod.afterSuperConstructor(superclass: String?): Pair<Int, Int> {
    val instructions = implementation!!.instructions.toList()
    // `this` may have been copied to a low register first (21.43.523's casting director passes
    // v0), so the super call is found by its class and `this` is its first register.
    val index = instructions.indexOfFirst { instruction ->
        (instruction.opcode == Opcode.INVOKE_DIRECT || instruction.opcode == Opcode.INVOKE_DIRECT_RANGE) &&
            ((instruction as ReferenceInstruction).reference as MethodReference).let { ref ->
                ref.name == "<init>" && ref.definingClass == superclass
            }
    }
    if (index < 0) throw PatchException("No super constructor call in $this")
    val thisRegister = instructions[index].invokeRegisters.firstOrNull()
        ?: throw PatchException("No receiver for the super constructor call in $this")
    return thisRegister to index + 1
}

/** The SEEK_SOURCE_UNKNOWN constant of the seek source enum, named in its static initializer. */
private fun BytecodePatchContext.seekSourceUnknownField(seekSourceType: String): FieldReference {
    val clinit = classDefBy(seekSourceType).methods.firstOrNull { it.name == "<clinit>" }
        ?: throw PatchException("$seekSourceType has no static initializer")
    val instructions = clinit.implementation!!.instructions.toList()
    val nameIndex = instructions.indexOfFirst { instruction ->
        ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string == "SEEK_SOURCE_UNKNOWN"
    }
    if (nameIndex < 0) throw PatchException("$seekSourceType has no SEEK_SOURCE_UNKNOWN")
    val store = (nameIndex until instructions.size).firstOrNull { instructions[it].opcode == Opcode.SPUT_OBJECT }
        ?: throw PatchException("SEEK_SOURCE_UNKNOWN of $seekSourceType is never stored")
    return (instructions[store] as ReferenceInstruction).reference as FieldReference
}

/** The one public method of the class with this signature. */
private fun MutableClass.singleMethod(returnType: String, parameters: List<String>, what: String): Method {
    val matches = methods.filter { method ->
        AccessFlags.PUBLIC.isSet(method.accessFlags) && !AccessFlags.STATIC.isSet(method.accessFlags) &&
            method.returnType == returnType && method.parameterTypes.map { it.toString() } == parameters
    }
    return matches.singleOrNull()
        ?: throw PatchException("Expected one $what method in $type, found ${matches.size}")
}

/**
 * The video YouTube plays, for the extension's `VideoState` (package
 * `app.afterglow.extension.video`). Observe-only: every hook passes values to the extension and
 * lets YouTube's code continue unchanged.
 *
 * - Both player directors (local and casting) get the extension's `PlayerController`
 *   interface: seek, relative seek, time, speed and video id, each calling the director's own
 *   method. The local director reports itself when created and on every status change, so the
 *   extension knows which one is playing.
 * - The player request of every video tells the extension which videos are Shorts.
 * - The playback progress (about once a second), the seek bar's video length, the watch page
 *   player type, the Shorts player view and the play/pause state are passed on as they change.
 */
val videoStatePatch = bytecodePatch(
    description = "Tells Afterglow which video plays, its time, length, speed and state.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(afterglowExtensionPatch)

    execute {
        // Resolve everything before changing any method.
        val directorClass = PlayerInitFingerprint.classDef
        val playerResponseType = PlayerInitFingerprint.method.parameterTypes.single().toString()
        val seek = SeekFingerprint.method
        val seekRelative = SeekRelativeFingerprint.method
        val getVideoTime = GetVideoTimeFingerprint.instructionMatches.first().methodReference
        val setSpeed = directorClass.singleMethod("V", listOf("F"), "set playback rate")
        val getSpeed = directorClass.singleMethod("F", listOf(), "get playback rate")
        val getVideoId = directorClass.methods.filter { method ->
            method.returnType == "Ljava/lang/String;" && method.parameterTypes.isEmpty() &&
                method.implementation?.instructions?.any { instruction ->
                    val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    reference?.definingClass == playerResponseType && reference.returnType == "Ljava/lang/String;" &&
                        reference.parameterTypes.isEmpty()
                } == true
        }.singleOrNull() ?: throw PatchException("Expected one video id getter in ${directorClass.type}")
        val seekSourceType = seek.parameterTypes[1].toString()
        val seekSourceUnknown = seekSourceUnknownField(seekSourceType)
        val progressConstructor = PlayerProgressFingerprint.instructionMatches.first().getMethodCalled()
        val statusEnumType = PlayerStatusEnumFingerprint.originalClassDef.type
        val statusSetter = playerStatusFingerprint(statusEnumType).method
        val mdxClass = MdxPlayerDirectorSetVideoStageFingerprint.classDef
        val playerResponseMethod = PlayerParameterBuilderFingerprint.method
        val playerTypeSetter = playerTypeFingerprint(PlayerTypeEnumFingerprint.originalClassDef.type).method
        val shortsPlayer = ReelWatchPagerFingerprint.method
        val shortsPlayerViewIndex = ReelWatchPagerFingerprint.instructionMatches.last().index
        val controlsStateType = ControlsStateToStringFingerprint.originalClassDef.type
        val controlsVideoStateType = ControlsVideoStateEnumFingerprint.originalClassDef.type
        val playPause = playPauseButtonFingerprint(controlsStateType, controlsVideoStateType)
        val playPauseMethod = playPause.method
        val controlsVideoStateField = playPause.instructionMatches.first().fieldReference
        val videoLength = VideoLengthFingerprint.method
        val videoLengthIndex = VideoLengthFingerprint.instructionMatches.last().index

        if (seekRelative.parameterTypes[1].toString() != seekSourceType) {
            throw PatchException("Seek methods take different seek sources: $seek, $seekRelative")
        }
        if (mdxClass.interfaces.none { it in directorClass.interfaces }) {
            throw PatchException("${mdxClass.type} shares no director interface with ${directorClass.type}")
        }
        if (getVideoTime.definingClass != directorClass.type) {
            throw PatchException("Unexpected video time getter $getVideoTime")
        }

        listOf(
            "director" to PlayerInitFingerprint.method,
            "seek" to seek,
            "seekRelative" to seekRelative,
            "setSpeed" to setSpeed,
            "getSpeed" to getSpeed,
            "videoId" to getVideoId,
            "progress" to progressConstructor,
            "status" to statusSetter,
            "playerResponse" to playerResponseMethod,
            "playerType" to playerTypeSetter,
            "shortsPlayer" to shortsPlayer,
            "playPause" to playPauseMethod,
            "videoLength" to videoLength,
        ).forEach { (label, method) -> debugMatch(label, method) }
        debugMatch("mdx", mdxClass.methods.first { it.name == "<init>" })

        // The PlayerController interface on both directors. The casting director implements the
        // same director interface, so its methods have the same names and signatures.
        fun MutableClass.addPlayerController() {
            listOf(seek, seekRelative, setSpeed, getSpeed, getVideoId).forEach { method ->
                val present = methods.any { own ->
                    own.name == method.name && own.returnType == method.returnType &&
                        own.parameterTypes.map { it.toString() } == method.parameterTypes.map { it.toString() }
                }
                if (!present) throw PatchException("$type has no ${method.name} like ${method.definingClass}")
            }
            if (methods.none { it.name == getVideoTime.name && it.returnType == "J" && it.parameterTypes.isEmpty() }) {
                throw PatchException("$type has no time getter ${getVideoTime.name}")
            }

            interfaces.add(PLAYER_CONTROLLER_INTERFACE)
            addPublicMethod(
                "afterglow_seekTo", listOf("J"), "Z", 4,
                """
                    sget-object v0, ${seekSourceUnknown.smali}
                    invoke-virtual { p0, p1, p2, v0 }, $type->${seek.name}(J$seekSourceType)Z
                    move-result v0
                    return v0
                """,
            )
            addPublicMethod(
                "afterglow_seekToRelative", listOf("J"), "Z", 4,
                """
                    sget-object v0, ${seekSourceUnknown.smali}
                    invoke-virtual { p0, p1, p2, v0 }, $type->${seekRelative.name}(J$seekSourceType)Z
                    move-result v0
                    return v0
                """,
            )
            addPublicMethod(
                "afterglow_getVideoTime", listOf(), "J", 3,
                """
                    invoke-virtual { p0 }, $type->${getVideoTime.name}()J
                    move-result-wide v0
                    return-wide v0
                """,
            )
            addPublicMethod(
                "afterglow_getPlaybackSpeed", listOf(), "F", 2,
                """
                    invoke-virtual { p0 }, $type->${getSpeed.name}()F
                    move-result v0
                    return v0
                """,
            )
            addPublicMethod(
                "afterglow_setPlaybackSpeed", listOf("F"), "V", 2,
                """
                    invoke-virtual { p0, p1 }, $type->${setSpeed.name}(F)V
                    return-void
                """,
            )
            addPublicMethod(
                "afterglow_getVideoId", listOf(), "Ljava/lang/String;", 2,
                """
                    invoke-virtual { p0 }, $type->${getVideoId.name}()Ljava/lang/String;
                    move-result-object v0
                    return-object v0
                """,
            )
        }

        directorClass.addPlayerController()
        mdxClass.addPlayerController()

        // Each new director reports itself.
        directorClass.methods.single { it.name == "<init>" }.apply {
            val (thisRegister, index) = afterSuperConstructor(directorClass.superclass)
            addInstruction(
                index,
                "invoke-static/range { v$thisRegister .. v$thisRegister }, $VIDEO_STATE_CLASS->onPlayerCreated($PLAYER_CONTROLLER_INTERFACE)V",
            )
        }
        mdxClass.methods.single { it.name == "<init>" }.apply {
            val (thisRegister, index) = afterSuperConstructor(mdxClass.superclass)
            addInstruction(
                index,
                "invoke-static/range { v$thisRegister .. v$thisRegister }, $VIDEO_STATE_CLASS->onCastingPlayerCreated($PLAYER_CONTROLLER_INTERFACE)V",
            )
        }

        // The status of a director, with the director, before it acts on it. p0 and p1 are
        // consecutive, so a range call reaches them above v15.
        statusSetter.addInstruction(
            0,
            "invoke-static/range { p0 .. p1 }, $VIDEO_STATE_CLASS->onPlayerStatus($PLAYER_CONTROLLER_INTERFACE${"Ljava/lang/Enum;"})V",
        )

        // The progress: the first long of the progress object is the current time.
        progressConstructor.apply {
            if (parameterTypes.firstOrNull()?.toString() != "J") throw PatchException("Unexpected progress object $this")
            addInstruction(
                afterSuperConstructor(classDefBy(definingClass).superclass).second,
                "invoke-static/range { p1 .. p2 }, $VIDEO_STATE_CLASS->onVideoTime(J)V",
            )
        }

        // The player request: video id (p1), player parameters (p3), Short opening or playing
        // (p13), copied to the free locals below p0 first.
        playerResponseMethod.apply {
            val parameterRegisters = parameterTypes.size + 1 // No wide parameters.
            val locals = implementation!!.registerCount - parameterRegisters
            if (locals < 3 || parameterTypes.any { it.toString() == "J" || it.toString() == "D" }) {
                throw PatchException("Unexpected registers in player request builder $this")
            }
            addInstructions(
                0,
                """
                    move-object/from16 v0, p1
                    move-object/from16 v1, p3
                    move/from16 v2, p13
                    invoke-static { v0, v1, v2 }, $VIDEO_STATE_CLASS->onPlayerResponse(Ljava/lang/String;Ljava/lang/String;Z)V
                """,
            )
        }

        // The watch page player type.
        playerTypeSetter.addInstruction(
            0,
            "invoke-static/range { p1 .. p1 }, $VIDEO_STATE_CLASS->onPlayerType(Ljava/lang/Enum;)V",
        )

        // The Shorts player view, right after it is inflated.
        shortsPlayer.apply {
            val register = getInstruction<com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction>(
                shortsPlayerViewIndex,
            ).registerA
            addInstruction(
                shortsPlayerViewIndex + 1,
                "invoke-static/range { v$register .. v$register }, $VIDEO_STATE_CLASS->onShortsPlayerView(Landroid/view/View;)V",
            )
        }

        // The play/pause state, read from the controls state before the button updates.
        playPauseMethod.apply {
            val free = if (implementation!!.registerCount - (parameterTypes.size + 1) >= 1) 0 else -1
            if (free < 0) throw PatchException("No free register in $this")
            addInstructions(
                0,
                """
                    move-object/from16 v0, p1
                    iget-object v0, v0, ${controlsVideoStateField.smali}
                    invoke-static { v0 }, $VIDEO_STATE_CLASS->onPlaybackState(Ljava/lang/Enum;)V
                """,
            )
        }

        // The video length the seek bar lays out, before it is compared with 0.
        videoLength.apply {
            val register = getInstruction<ThreeRegisterInstruction>(videoLengthIndex).registerB
            if (register > 14) throw PatchException("Video length register v$register is too high in $this")
            addInstructionsAtControlFlowLabel(
                videoLengthIndex,
                "invoke-static { v$register, v${register + 1} }, $VIDEO_STATE_CLASS->onVideoLength(J)V",
            )
        }
    }
}
