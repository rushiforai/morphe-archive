package app.matthew.chrome.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val MODE_ROUTING = "Lapp/matthew/chrome/extension/ModeRouting;"

val rememberModePatch = bytecodePatch(
    description = "Reopens Chrome and full-browser links in the last-used browsing mode. Custom Tabs remain unchanged.",
    default = false,
) {
    compatibleWith(chromeCompatibility)
    dependsOn(modeTogglePatch)
    execute {
        requireTarget(packageMetadata)
        mutableClassDefBy(BRIDGE).methods.single { it.name == "rememberModeFeatureEnabled" }
            .addInstructions(0, "const/4 v0, 0x1\nreturn v0")
        val activity = mutableClassDefBy(ACTIVITY)
        val launcher = activity.methods.single { it.hasString("MobileStartup.MainIntentReceived") }
        check(launcher.parameterTypes.isEmpty() && launcher.returnType == "V")
        launcher.addInstructions(0, "invoke-static/range {p0 .. p0}, $MODE_ROUTING->onLauncher(Landroid/app/Activity;)V")

        val initial = activity.methods.single { it.hasString("#createInitialTab executed.") }
        // Rewrite the value before homepage/profile selection, rather than moving a regular tab later.
        val initialCode = initial.implementation!!.instructions
        val homepage = initialCode.withIndex().single { (_, ins) ->
            val ref = (ins as? ReferenceInstruction)?.reference as? MethodReference
            ins.opcode == Opcode.INVOKE_VIRTUAL && ref?.parameterTypes == listOf("Z", "Z") && ref.returnType == "Lorg/chromium/url/GURL;"
        }
        val homeCall = homepage.value as FiveRegisterInstruction
        val modelRegister = homeCall.registerD
        val thisRegister = initial.implementation!!.registerCount - 1
        check(thisRegister < 16 && modelRegister < 16)
        initial.addInstructions(homepage.index, """
            invoke-static {v$thisRegister, v$modelRegister}, $MODE_ROUTING->initialIncognito(Landroid/app/Activity;Z)Z
            move-result v$modelRegister
        """.trimIndent())

        val external = activity.methods.single { it.hasString("com.google.android.apps.chrome.unknown_app") }
        check(external.parameterTypes.last() == "Landroid/content/Intent;")
        val creatorCalls = external.implementation!!.instructions.withIndex().filter { (_, ins) ->
            val ref = (ins as? ReferenceInstruction)?.reference as? MethodReference
            ins.opcode == Opcode.INVOKE_SUPER && ref?.parameterTypes == listOf("Z") && ref.name == "q"
        }
        check(creatorCalls.size == 2) { "Trusted and external tab-creator branches changed" }
        val externalCall = creatorCalls.last()
        val registers = externalCall.value as FiveRegisterInstruction
        val intentRegister = external.implementation!!.registerCount - 1
        check(intentRegister < 16)
        // Only the external branch is changed. Native intent validation and explicit internal mode choices survive.
        val creator = (externalCall.value as ReferenceInstruction).reference
        // Replace the branch target itself so jumps to this creator cannot skip our hook.
        external.replaceInstruction(externalCall.index,
            "invoke-static {v${registers.registerC}, v${registers.registerD}, v$intentRegister}, $MODE_ROUTING->externalIncognito(Landroid/app/Activity;ZLandroid/content/Intent;)Z")
        external.addInstructions(externalCall.index + 1, """
            move-result v${registers.registerD}
            invoke-super {v${registers.registerC}, v${registers.registerD}}, $creator
        """.trimIndent())
        println("Remember mode hooks: launcher ${launcher.name}, initial ${initial.name}, external ${external.name}")
    }
}
