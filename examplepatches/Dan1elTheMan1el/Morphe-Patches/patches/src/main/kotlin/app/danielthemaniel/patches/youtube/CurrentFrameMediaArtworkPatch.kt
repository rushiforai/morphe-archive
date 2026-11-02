package app.danielthemaniel.patches.youtube

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION_CLASS =
    "Lapp/danielthemaniel/patches/youtube/extension/CurrentFrameMediaArtwork;"

// ---------------------------------------------------------------------------------------------
// Required hooks. These match on stable names (the Android framework and Morphe's add-on API),
// so a YouTube update cannot rename them away.
// ---------------------------------------------------------------------------------------------

/**
 * The call that publishes media metadata to the system. This bundle's own extension also calls
 * setMetadata (and so might Morphe's), so only YouTube's own code may match.
 */
private object MediaSessionSetMetadataFingerprint : Fingerprint(
    filters = listOf(
        methodCall(
            definingClass = "Landroid/media/session/MediaSession;",
            name = "setMetadata",
            parameters = listOf("Landroid/media/MediaMetadata;"),
        ),
    ),
    custom = { _, classDef ->
        !classDef.type.startsWith("Lapp/danielthemaniel/") &&
            !classDef.type.startsWith("Lapp/morphe/extension/")
    },
)

/**
 * Morphe's add-on entry point. Morphe's patches declare this method and never modify it;
 * add-on bundles insert a call to their own static registration method at its start.
 * The method lives in Morphe's YouTube extension, so it only exists when this bundle
 * is applied together with Morphe's YouTube patches.
 */
private object AddOnRegisterFingerprint : Fingerprint(
    definingClass = "Lapp/morphe/extension/youtube/addon/AddOnManager;",
    name = "registerAddOns",
    returnType = "V",
    parameters = listOf(),
)

// ---------------------------------------------------------------------------------------------
// Background-frame hooks. These target YouTube's obfuscated code, whose class, method and
// register names change on every release. So they are matched by SHAPE (signature, instruction
// pattern, and calls on stable framework types) rather than by name, and they are optional:
// they are applied all-or-nothing, and if any cannot be matched the rest of the patch still works.
//
// Keep these in step with verify_fingerprints.py, which checks the same shapes against a
// decompiled APK before you trust them on a new YouTube version.
// ---------------------------------------------------------------------------------------------

private fun Instruction.isNoArgInterfaceCall(returnType: String): Boolean {
    if (opcode != Opcode.INVOKE_INTERFACE) return false
    val reference = (this as? ReferenceInstruction)?.reference as? MethodReference ?: return false
    return reference.returnType == returnType && reference.parameterTypes.isEmpty()
}

/**
 * The player's "which Surface do I render into" method: returns a boxed Boolean, takes one object,
 * and asks the video view for its Surface through a no-argument interface call. When the view has
 * no surface (app hidden, screen off) it picks null, which drops the video output.
 */
private object VideoSurfaceSelectionFingerprint : Fingerprint(
    returnType = "Ljava/lang/Boolean;",
    parameters = listOf("L"),
    custom = custom@{ method, _ ->
        val instructions = method.implementation?.instructions ?: return@custom false
        instructions.any { it.isNoArgInterfaceCall("Landroid/view/Surface;") }
    },
)

/**
 * The input to YouTube's track selector: a small value class whose public constructor takes
 * "a video view exists" and ANDs it with a no-argument boolean interface call before delegating to
 * a private constructor of the same class. Without a view the selector builds no video selection,
 * which disables the video renderer.
 */
private object TrackSelectionInputFingerprint : Fingerprint(
    name = "<init>",
    returnType = "V",
    parameters = listOf("L", "L", "L", "Z"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    custom = custom@{ method, classDef ->
        if (classDef.fields.count() != 5 || classDef.fields.count { it.type == "Z" } != 1) {
            return@custom false
        }
        val instructions = method.implementation?.instructions ?: return@custom false
        val callsBooleanGetter = instructions.any { it.isNoArgInterfaceCall("Z") }
        val delegatesToSiblingConstructor = instructions.any {
            if (it.opcode != Opcode.INVOKE_DIRECT_RANGE) return@any false
            val reference = (it as? ReferenceInstruction)?.reference as? MethodReference
                ?: return@any false
            reference.definingClass == classDef.type && reference.name == "<init>"
        }
        callsBooleanGetter && delegatesToSiblingConstructor
    },
)

/**
 * The player engine's "app foreground state changed" handler: returns void, takes (boolean, object),
 * and reads a server-side flag. The flag id is a config key, which survives renaming. This hook is
 * the least proven of the three, so it is applied only alongside the other two and only if found.
 */
private object EngineForegroundFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Z", "L"),
    filters = listOf(literal(0x2b87e50L)),
)

/** What the surface hook edits, derived from the instructions instead of hardcoded registers. */
private class SurfaceEdits(
    val view: Int,
    val surface: Int,
    val nullRegister: Int,
    val renderer: Int,
    val altResult: Int,
    val noSurfaceIndexes: List<Int>,
    val rendererMoveIndex: Int,
    val altBranchIndex: Int,
)

/**
 * Works out which instructions of the surface-selection method to edit, or returns null if the
 * method no longer has the expected structure. R8 renumbers registers between builds, so nothing
 * here assumes a register number.
 *
 * The method reads roughly:
 *
 *     surface = view.getSurface()            // invoke-interface {view}, ->f()Surface
 *     ...
 *     surface = null                         // "move-object surface, null": view has no surface
 *     ...
 *     surface = null; renderer = surface     // second "move-object": view detached entirely
 *     ...
 *     if (altSurface.isActive()) view.getType()...   // dereferences the view
 */
private fun planSurfaceEdits(instructions: List<Instruction>): SurfaceEdits? {
    val surfaceCallIndex = instructions.indexOfFirst { it.isNoArgInterfaceCall("Landroid/view/Surface;") }
    if (surfaceCallIndex < 0) return null
    val surfaceCall = instructions[surfaceCallIndex] as? FiveRegisterInstruction ?: return null
    if (surfaceCall.registerCount != 1) return null
    val view = surfaceCall.registerC

    val moveResult = instructions.getOrNull(surfaceCallIndex + 1) ?: return null
    if (moveResult.opcode != Opcode.MOVE_RESULT_OBJECT) return null
    val surface = (moveResult as OneRegisterInstruction).registerA

    // Exactly two "move-object surface, N" assignments, both from the same null constant N.
    val nullMoves = instructions.withIndex().filter { (_, instruction) ->
        instruction.opcode == Opcode.MOVE_OBJECT &&
            (instruction as TwoRegisterInstruction).registerA == surface
    }
    if (nullMoves.size != 2) return null
    val nullRegister = (nullMoves[0].value as TwoRegisterInstruction).registerB
    if ((nullMoves[1].value as TwoRegisterInstruction).registerB != nullRegister) return null
    val nullIsConstant = instructions.any {
        (it.opcode == Opcode.CONST_4 || it.opcode == Opcode.CONST_16) &&
            (it as OneRegisterInstruction).registerA == nullRegister &&
            (it as NarrowLiteralInstruction).narrowLiteral == 0
    }
    if (!nullIsConstant) return null

    // The GL renderer register is copied from the surface right after the second assignment.
    val rendererMoveIndex = nullMoves[1].index + 1
    val rendererMove = instructions.getOrNull(rendererMoveIndex) ?: return null
    if (rendererMove.opcode != Opcode.MOVE_OBJECT) return null
    rendererMove as TwoRegisterInstruction
    if (rendererMove.registerB != surface) return null
    val renderer = rendererMove.registerA

    // The alternate-surface block: "ok = iface.f(); if (!ok) goto skip; view.getType()...".
    // It dereferences the view, which is null in the detached case.
    for (i in (nullMoves[1].index + 2) until (instructions.size - 3)) {
        val call = instructions[i]
        if (!call.isNoArgInterfaceCall("Z")) continue
        val callRegisters = call as? FiveRegisterInstruction ?: continue
        if (callRegisters.registerCount != 1 || callRegisters.registerC == view) continue

        val result = instructions[i + 1]
        val branch = instructions[i + 2]
        val dereference = instructions[i + 3]
        if (result.opcode != Opcode.MOVE_RESULT || branch.opcode != Opcode.IF_EQZ ||
            dereference.opcode != Opcode.INVOKE_INTERFACE
        ) continue

        val resultRegister = (result as OneRegisterInstruction).registerA
        if ((branch as OneRegisterInstruction).registerA != resultRegister) continue
        if ((dereference as? FiveRegisterInstruction)?.registerC != view) continue

        return SurfaceEdits(
            view = view,
            surface = surface,
            nullRegister = nullRegister,
            renderer = renderer,
            altResult = resultRegister,
            noSurfaceIndexes = nullMoves.map { it.index },
            rendererMoveIndex = rendererMoveIndex,
            altBranchIndex = i + 2,
        )
    }
    return null
}

@Suppress("unused")
val currentFrameMediaArtworkPatch = bytecodePatch(
    name = "Current Frame Media Artwork",
    description = "Adds an in-player control that updates the media artwork from the current " +
        "video frame, including while the screen is off, and can blank the media title.",
    default = true,
) {
    extendWith("extensions/current_frame_media_artwork.dex")
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        // 1. Artwork (required): hand the session and metadata to the extension before every
        //    setMetadata call.
        val fingerprint = MediaSessionSetMetadataFingerprint
        val instruction = fingerprint.instructionMatches.first()
        val registers = instruction.getInstruction<FiveRegisterInstruction>()

        fingerprint.method.addInstructions(
            instruction.index,
            "invoke-static { v${registers.registerC}, v${registers.registerD} }, " +
                "$EXTENSION_CLASS->onMetadata(" +
                "Landroid/media/session/MediaSession;Landroid/media/MediaMetadata;)V",
        )

        // 2. Background frames (optional, all-or-nothing). Resolve and validate everything before
        //    editing anything, so a YouTube version that moved the code skips this feature cleanly
        //    instead of leaving the player half-patched.
        val surfaceMethod = VideoSurfaceSelectionFingerprint.matchOrNull()?.method
        val selectionMethod = TrackSelectionInputFingerprint.matchOrNull()?.method
        val surfaceEdits = surfaceMethod?.implementation?.instructions?.let { planSurfaceEdits(it) }

        if (surfaceMethod != null && selectionMethod != null && surfaceEdits != null) {
            // Wherever the player would pick "no surface" (null), pick the extension's off-screen
            // surface instead. backgroundSurface is null unless the feature is enabled, so behavior
            // is unchanged when it is off.
            surfaceMethod.apply {
                val fallbackSurface =
                    "sget-object v${surfaceEdits.surface}, " +
                        "$EXTENSION_CLASS->backgroundSurface:Landroid/view/Surface;"

                // Same-size replacements first (indexes do not move), insertion last.
                surfaceEdits.noSurfaceIndexes.forEach { replaceInstruction(it, fallbackSurface) }
                // The renderer register must keep being null in the detached case.
                replaceInstruction(
                    surfaceEdits.rendererMoveIndex,
                    "move-object v${surfaceEdits.renderer}, v${surfaceEdits.nullRegister}",
                )

                // With no view there is nothing to dereference, so make the alternate-surface check
                // read "false" when the view register is null, and the block is skipped.
                addInstructionsWithLabels(
                    surfaceEdits.altBranchIndex,
                    """
                        if-nez v${surfaceEdits.view}, :keepAltResult
                        const/16 v${surfaceEdits.altResult}, 0x0
                    """,
                    ExternalLabel("keepAltResult", getInstruction(surfaceEdits.altBranchIndex)),
                )
            }

            // Keep video selected while hidden: report that a video view exists (p4 = hasView).
            selectionMethod.addInstructions(
                0,
                """
                    invoke-static { p4 }, $EXTENSION_CLASS->hasVideoView(Z)Z
                    move-result p4
                """,
            )

            // Keep the engine in "foreground" mode while background frames are enabled, so it does
            // not start its background handling (p1 = foreground flag). Not needed to find the
            // hooks above, so it is simply skipped if it cannot be matched.
            EngineForegroundFingerprint.matchOrNull()?.method?.addInstructions(
                0,
                """
                    invoke-static { p1 }, $EXTENSION_CLASS->engineForeground(Z)Z
                    move-result p1
                """,
            )
        }

        // 3. Overlay button (required): subscribe to Morphe's player overlay button hook.
        AddOnRegisterFingerprint.method.addInstruction(
            0,
            "invoke-static { }, $EXTENSION_CLASS->register()V",
        )
    }
}