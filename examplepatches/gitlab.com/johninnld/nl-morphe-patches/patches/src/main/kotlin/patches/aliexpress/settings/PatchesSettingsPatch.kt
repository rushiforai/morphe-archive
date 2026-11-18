/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package patches.aliexpress.settings

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.matchSingle
import patches.aliexpress.replaceStub
import patches.aliexpress.descriptor
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.returnEarly
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import app.morphe.patcher.util.findInstructionIndicesReversedOrThrow
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val SWITCH_FACTORY_REGISTERS = 3
private const val PATCH_SETTINGS_CLASS = "Lnl/johninnl/aliexpress/PatchSettings;"
private const val APPLIED_PATCHES_CLASS = "Lnl/johninnl/aliexpress/AppliedPatches;"
private const val PATCHES_MENU_CLASS = "Lnl/johninnl/aliexpress/PatchesMenu;"

private val ICON_NAMES = listOf("promotions", "splash", "sponsored", "images", "analytics", "updates", "reset", "info", "bundle", "expand", "back")

internal fun BytecodePatchContext.markPatchApplied(methodName: String, description: String) =
    mutableClassDefBy(APPLIED_PATCHES_CLASS).methods.single { it.name == methodName + "Description" }
        .returnEarly(description)

internal fun MutableMethod.returnWhenEnabled(settingMethod: String) {
    val returnInstructions = when (returnType) {
        "V" -> "return-void"
        "Z" -> "const/4 v0, 0x0\nreturn v0"
        else -> if (returnType.startsWith("L") || returnType.startsWith("[")) {
            "const/4 v0, 0x0\nreturn-object v0"
        } else {
            throw PatchException("Expected a void, boolean or object method, found $returnType")
        }
    }
    addInstructionsWithLabels(
        0,
        """
            invoke-static { }, $settingMethod
            move-result v0
            if-eqz v0, :original
            $returnInstructions
        """.trimIndent(),
        ExternalLabel("original", getInstruction(0)),
    )
}

internal val patchesSettingsPatch = bytecodePatch {
    dependsOn(
        resourcePatch {
            execute {
                ICON_NAMES.forEach { name ->
                    val fileName = "hx_aliexpress_ic_$name.xml"
                    val icon = AliExpressResources::class.java.getResourceAsStream("/aliexpress/drawable/$fileName")
                        ?: throw PatchException("Missing patch icon $fileName")
                    icon.use { get("res/drawable/$fileName").outputStream().use(it::copyTo) }
                }
            }
        },
    )
    extendWith("extensions/aliexpress.mpe")

    execute {
        val switchConstructor = SwitchConstructorFingerprint.matchSingle().method
        mutableClassDefBy("Lnl/johninnl/aliexpress/SettingsStyle;").replaceStub(
            "createSwitch",
            SWITCH_FACTORY_REGISTERS,
            """
                new-instance v0, ${switchConstructor.definingClass}
                const/4 v1, 0x0
                invoke-direct { v0, p0, v1 }, ${descriptor(switchConstructor)}
                return-object v0
            """.trimIndent(),
        )
        ApplicationOnCreateFingerprint.matchSingle().method.addInstruction(
            0,
            "invoke-static/range { p0 .. p0 }, $PATCH_SETTINGS_CLASS->initialize(Landroid/content/Context;)V",
        )
        SettingsViewFingerprint.matchSingle().method.apply {
            findInstructionIndicesReversedOrThrow(opcode(Opcode.RETURN_OBJECT)).forEach { index ->
                val viewRegister = getInstruction<OneRegisterInstruction>(index).registerA
                addInstructionsAtControlFlowLabel(
                    index,
                    "invoke-static/range { v$viewRegister .. v$viewRegister }, $PATCHES_MENU_CLASS->attach(Landroid/view/View;)V",
                )
            }
        }
    }
}

private object AliExpressResources
