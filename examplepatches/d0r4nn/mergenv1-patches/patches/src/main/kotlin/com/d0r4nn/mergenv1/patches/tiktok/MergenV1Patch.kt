package com.d0r4nn.mergenv1.patches.tiktok

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.d0r4nn.mergenv1.patches.shared.Constants.COMPATIBILITY_TIKTOK
import com.d0r4nn.mergenv1.patches.shared.Constants.COMPATIBILITY_TIKTOK_ASIA

private const val BOOTSTRAP_CLASS = "Lcom/sarp/tiktokliquidglass/LiquidGlassBootstrap;"

@Suppress("unused")
val mergenV1Patch = patch(
    name = "MergenV1 UI Enhancer",
    description = "Modern UI & interaction enhancer for stock TikTok and TikTok You (Android 13+): 120Hz spring animations with selectable profiles, swipe gestures, radial action menu, creator peek drawer, quick control sheet, camera-notch alerts, kinetic seekbar, 1:1 scrubbed Danmaku comments, and switchable Obsidian & Liquid Glass themes.",
    default = true
) {
    compatibleWith(
        COMPATIBILITY_TIKTOK,
        COMPATIBILITY_TIKTOK_ASIA
    )

    extendWith("extensions/mergenv1.mpe")

    execute {
        val method = AwemeHostApplicationOnCreateFingerprint.method
        val superOnCreateIndices = method.implementation!!.instructions.mapIndexedNotNull { index, insn ->
            if (insn.opcode != Opcode.INVOKE_SUPER) return@mapIndexedNotNull null
            val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
                ?: return@mapIndexedNotNull null
            if (ref.definingClass == "Landroid/app/Application;" &&
                ref.name == "onCreate" &&
                ref.parameterTypes.isEmpty() &&
                ref.returnType == "V"
            ) {
                index
            } else {
                null
            }
        }

        val targetIndices = if (superOnCreateIndices.isNotEmpty()) {
            superOnCreateIndices
        } else {
            listOf(AwemeHostApplicationOnCreateFingerprint.instructionMatches.last().index)
        }

        for (index in targetIndices.asReversed()) {
            method.addInstruction(
                index + 1,
                "invoke-static/range { p0 .. p0 }, $BOOTSTRAP_CLASS->init(Landroid/app/Application;)V"
            )
        }
    }
}
