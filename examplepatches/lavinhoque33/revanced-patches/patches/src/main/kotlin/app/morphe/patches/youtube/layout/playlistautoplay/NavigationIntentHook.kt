/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/3582
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to Morphe contributions.
 *
 * Modified by lavinhoque33, 2026-10-24
 */

package app.morphe.patches.youtube.layout.playlistautoplay

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.util.findFreeRegister
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Hooks the methods that start navigation to another video.
 * The extension method receives the navigation intent enum and returns true to cancel the navigation.
 */
context(_: BytecodePatchContext)
internal fun navigationIntentHook(extensionClass: String, extensionMethod: String) {
    val enumType = NavigationIntentEnumFingerprint.originalClassDef.type

    val wrapperClassDef = Fingerprint(
        accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
        parameters = listOf(enumType, "L", "L")
    ).originalClassDef
    val wrapperType = wrapperClassDef.type
    val enumField = wrapperClassDef.fields.first { it.type == enumType }

    Fingerprint(
        returnType = "V",
        parameters = listOf(wrapperType),
        custom = { method, classDef ->
            method.implementation != null && classDef.methods.any { sibling ->
                sibling.implementation != null &&
                        sibling.returnType == "I" &&
                        sibling.parameterTypes.singleOrNull() == wrapperType
            }
        }
    ).matchAll().forEach { match ->
        val method = match.method

        // 21.39 adds a match that only delegates to another matched handler (p0 and p1 both live, no free register).
        // The delegate target is patched itself, so skip this one.
        val freeRegister = runCatching { method.findFreeRegister(0) }.getOrNull()
            ?: return@forEach

        method.addInstructionsWithLabels(
            0,
            """
                iget-object v$freeRegister, p1, $enumField
                invoke-static { v$freeRegister }, $extensionClass->$extensionMethod(Ljava/lang/Enum;)Z
                move-result v$freeRegister
                if-eqz v$freeRegister, :continue
                return-void
                :continue
                nop
            """
        )
    }
}
