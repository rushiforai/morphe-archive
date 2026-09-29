/**
 * Copyright 2026 Hoo-dles
 * https://github.com/hoo-dles/morphe-patches
 */

package hoodles.morphe.patches.windy.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.all.misc.extension.activityOnCreateExtensionHook
import app.morphe.patches.all.misc.extension.sharedExtensionPatch
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import hoodles.morphe.compatibility.Compat

internal val extensionPatch = sharedExtensionPatch(
    "windy",
    activityOnCreateExtensionHook("/MainActivity;")
)

val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Enables some app features locked behind the subscription paywall. Not all premium functionality is available."
) {
    compatibleWith(Compat.WINDY)

    dependsOn(extensionPatch)

    execute {
        IsPremiumForWidgetFingerprint.method.returnEarly(true)

        ShouldInterceptRequestFingerprint.method.apply {
            val returnObjReg = getInstruction<OneRegisterInstruction>(instructions.size - 1).registerA

            addInstructions(instructions.size - 1, """
                invoke-static { p2, v$returnObjReg }, Lhoodles/morphe/extension/windy/premium/EnablePremiumPatch;->patchAppJavascript(Landroid/webkit/WebResourceRequest;Landroid/webkit/WebResourceResponse;)V
            """.trimIndent())
        }
    }
}