/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.crimera.patches.instagram.misc.hookFlags

import app.ahmedyarub.patches.shared.Constants.COMPATIBILITY_INSTAGRAM
import app.crimera.patches.instagram.utils.Constants.HOOK_FLAGS_DESCRIPTOR
import app.crimera.patches.shared.declaredParameterRegister
import app.crimera.patches.shared.parameterRegisterStart
import app.morphe.library.instagram.patches.instagramExtensionPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.literal
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/** The class holding the app's flag getters, found by the placeholder its string getter returns. */
internal object StringFlagCheckMethodFingerprint : Fingerprint(
    strings = listOf("__fbt_null__"),
    returnType = "Ljava/lang/String;",
)

/** The boolean flag getter: (config source, specifier, default) -> value. */
internal object BooleanFlagCheckMethodFingerprint : Fingerprint(
    classFingerprint = StringFlagCheckMethodFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf("L", "J", "Z"),
)

/**
 * The app's mobile config specifier -> universal id helper, the same shape the Instagram patch
 * library resolves for its own flag overrides.
 */
internal object UniversalIdFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "I",
    parameters = listOf("J"),
    filters = listOf(literal(0xFFFF), opcode(Opcode.NEW_ARRAY)),
)

/** HookFlags' stand-in for the helper above, whose body is replaced with a call to it. */
internal object UniversalIdExtensionFingerprint : Fingerprint(
    definingClass = HOOK_FLAGS_DESCRIPTOR,
    name = "universalId",
)

val hookFlagsPatch =
    bytecodePatch(
        description = "Hooks flag check to override default flag value",
    ) {
        dependsOn(instagramExtensionPatch)
        compatibleWith(COMPATIBILITY_INSTAGRAM)

        execute {
            // HookFlags matches overrides on the universal id, which only the app can compute.
            // The stand-in becomes a direct call, so a flag read costs no reflection.
            val universalId = UniversalIdFingerprint.method
            UniversalIdExtensionFingerprint.method.apply {
                // (J)I and static. The stub may have no local register, so the result goes back
                // into p0, which is free once the specifier has been passed on.
                removeInstructions(0, implementation!!.instructions.size)
                addInstructions(
                    0,
                    """
                    invoke-static { p0, p1 }, ${universalId.definingClass}->${universalId.name}(J)I
                    move-result p0
                    return p0
                    """,
                )
            }

            BooleanFlagCheckMethodFingerprint.method.apply {
                // The hook needs one register of its own. At the first instruction no local holds
                // anything yet, so v0 is free, unless the method has no locals and v0 is p0.
                if (parameterRegisterStart(this) < 1) {
                    throw PatchException("The boolean flag getter has no local register to use")
                }
                val specifier = declaredParameterRegister(this, 1)

                addInstructionsWithLabels(
                    0,
                    """
                    invoke-static/range { v$specifier .. v${specifier + 1} }, $HOOK_FLAGS_DESCRIPTOR->handleBoolFlags(J)Ljava/lang/Boolean;
                    move-result-object v0
                    if-eqz v0, :original
                    invoke-virtual { v0 }, Ljava/lang/Boolean;->booleanValue()Z
                    move-result v0
                    return v0
                    """,
                    ExternalLabel("original", getInstruction(0)),
                )
            }
        }
    }
