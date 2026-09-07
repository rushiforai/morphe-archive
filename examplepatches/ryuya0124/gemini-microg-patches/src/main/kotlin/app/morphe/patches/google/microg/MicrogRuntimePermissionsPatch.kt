package app.morphe.patches.google.microg

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.google.common.HookId
import app.morphe.patches.google.common.VersionHookRegistry
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

/** Request microG account access when installed outside the ADB helper. */
val microgRuntimePermissionsPatch = bytecodePatch(
    name = "MicroG Account Permissions",
    description = "Requests account access and microG extended access on Gemini startup.",
    default = true
) {
    compatibleWith("com.google.android.googlequicksearchbox")
    dependsOn(googleAppManifestPatch)
    execute {
        val spec = VersionHookRegistry.target(HookId.MICROG_RUNTIME_PERMISSIONS, packageMetadata)
        val activity = mutableClassDefBy(classDefByOrNull(
            requireNotNull(spec.className)
        ) ?: error("Gemini MainActivity not found"))
        val method = activity.methods.single {
            spec.matches(it)
        }
        val registers = method.implementation?.registerCount ?: error("Missing onCreate body")
        // Three local registers, and p0 must fit an invoke-virtual register operand.
        check(registers in spec.int("minRegisters")..spec.int("maxRegisters")) { "Unsupported onCreate register layout: $registers" }
        val exits = method.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }
        check(exits.size == spec.expectedMatches) { "Expected one onCreate exit, found ${exits.size}" }
        val insertion = method.instructions.indexOfLast { instruction ->
            instruction.opcode == Opcode.IPUT_BOOLEAN &&
                (instruction as? ReferenceInstruction)?.reference.toString() == "${activity.type}->${spec.fieldName}:${spec.fieldType}" &&
                (instruction as TwoRegisterInstruction).registerB == registers - spec.int("thisParameterOffset")
        } + 1
        check(insertion > 0 && insertion < exits.single()) { "Missing onCreate completion flag" }
        val arrayRegister = spec.int("scratchArray")
        val indexRegister = spec.int("scratchIndex")
        val stringRegister = spec.int("scratchString")
        method.addInstructionsWithLabels(insertion, """
            const-string v$arrayRegister, "app.revanced.gms.EXTENDED_ACCESS"
            invoke-virtual {p0, v$arrayRegister}, Landroid/content/Context;->checkSelfPermission(Ljava/lang/String;)I
            move-result v$arrayRegister
            if-nez v$arrayRegister, :request_microg_accounts
            const-string v$arrayRegister, "android.permission.GET_ACCOUNTS"
            invoke-virtual {p0, v$arrayRegister}, Landroid/content/Context;->checkSelfPermission(Ljava/lang/String;)I
            move-result v$arrayRegister
            if-eqz v$arrayRegister, :microg_permissions_done
            :request_microg_accounts
            const/4 v$arrayRegister, 0x2
            new-array v$arrayRegister, v$arrayRegister, [Ljava/lang/String;
            const/4 v$indexRegister, 0x0
            const-string v$stringRegister, "android.permission.GET_ACCOUNTS"
            aput-object v$stringRegister, v$arrayRegister, v$indexRegister
            const/4 v$indexRegister, 0x1
            const-string v$stringRegister, "app.revanced.gms.EXTENDED_ACCESS"
            aput-object v$stringRegister, v$arrayRegister, v$indexRegister
            const/16 v$indexRegister, 0x6d47
            invoke-virtual {p0, v$arrayRegister, v$indexRegister}, Landroid/app/Activity;->requestPermissions([Ljava/lang/String;I)V
            :microg_permissions_done
            nop
        """)
        println("[MicroG Account Permissions] Added startup permission request")
    }
}
