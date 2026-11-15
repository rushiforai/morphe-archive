/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * Adapted from https://github.com/brosssh/instagram-morphe-patches-library
 * (GPL-3.0). See META-INF/PROTEUS-NOTICE.txt for GPLv3 §7(b) terms.
 */

package app.template.patches.instagram.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.literal
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.cloneParameters
import app.template.patches.shared.indexOfFirstInstructionOrThrow
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

private const val EXTENSION_CLASS_DESCRIPTOR =
    "Lapp/template/extension/extension/InstagramOverrideMobileConfigBooleanFlagPatch;"

private object GetOverridesFingerprint : Fingerprint(
    definingClass = EXTENSION_CLASS_DESCRIPTOR,
    name = "<clinit>",
)

private object BoolFlagContainerClassFingerprint : Fingerprint(
    strings = listOf("__fbt_null__"),
    returnType = "Ljava/lang/String;",
)

private object GetBoolValueForFlagFingerprint : Fingerprint(
    classFingerprint = BoolFlagContainerClassFingerprint,
    parameters = listOf("L", "J", "Z"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
)

private object GetUniversalIdFingerprint : Fingerprint(
    parameters = listOf("J"),
    returnType = "I",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    filters = listOf(
        literal(0xffff),
        opcode(Opcode.NEW_ARRAY),
    ),
)

private val instagramOverrideMobileConfigBooleanFlagPatch = bytecodePatch {
    extendWith("extensions/extension.mpe")

    execute {
        val getUniversalIdMethod = GetUniversalIdFingerprint.method

        // cloneParameters() preserves p0..p4 and adds 5 registers so v0..v3 are free
        // before the move-* prologue at index 0. Using move-wide/from16 + invoke-static/range
        // keeps register indices safe even if parameter registers exceed v15.
        GetBoolValueForFlagFingerprint.method.cloneParameters().addInstructionsWithLabels(
            0,
            """
                move-wide/from16 v0, p2
                invoke-static {v0, v1}, ${getUniversalIdMethod.definingClass}->${getUniversalIdMethod.name}(J)I
                move-result v0
                invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
                move-result-object v2

                move-wide/from16 v0, p2
                invoke-static {v0, v1}, $EXTENSION_CLASS_DESCRIPTOR->getMobileConfigFlagId(J)J
                move-result-wide v0
                invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;
                move-result-object v3

                move-wide/from16 v0, p2
                invoke-static/range {v0 .. v3}, $EXTENSION_CLASS_DESCRIPTOR->overrideBooleanFlag(JLjava/lang/String;Ljava/lang/String;)Ljava/lang/Boolean;
                move-result-object v0

                if-eqz v0, :continue

                invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z
                move-result v1
                return v1

                :continue
                nop
            """.trimIndent(),
        )
    }
}

fun overrideInstagramMobileConfigBooleanFlag(override: Pair<String, Boolean>) = bytecodePatch {
    dependsOn(instagramOverrideMobileConfigBooleanFlagPatch)

    execute {
        GetOverridesFingerprint.method.apply {
            val returnIndex = indexOfFirstInstructionOrThrow(Opcode.RETURN_VOID)

            addInstructions(
                returnIndex,
                """
                    const-string v0, "${override.first}"
                    const/4 v1, ${if (override.second) 0x1 else 0x0}

                    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
                    move-result-object v1

                    sget-object v2, $EXTENSION_CLASS_DESCRIPTOR->OVERRIDES:Ljava/util/Map;
                    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                """.trimIndent(),
            )
        }
    }
}
