package app.morphe.patches.google.microg

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
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
    description = "Explains microG account permissions before requesting them and respects Not now.",
    default = true
) {
    compatibleWith("com.google.android.googlequicksearchbox")
    dependsOn(googleAppManifestPatch)
    extendWith(java.util.function.Supplier {
        checkNotNull(VersionHookRegistry::class.java.classLoader.getResourceAsStream("extensions/microg-permissions.bin")) {
            "Missing microG permission runtime extension"
        }
    })
    execute {
        val spec = VersionHookRegistry.target(HookId.MICROG_RUNTIME_PERMISSIONS, packageMetadata)
        val activity = mutableClassDefBy(classDefByOrNull(
            requireNotNull(spec.className)
        ) ?: error("Gemini MainActivity not found"))
        val method = activity.methods.single {
            spec.matches(it)
        }
        val registers = method.implementation?.registerCount ?: error("Missing onCreate body")
        // Keep the version-checked Activity alias before onCreate reuses its registers.
        check(registers in spec.int("minRegisters")..spec.int("maxRegisters")) { "Unsupported onCreate register layout: $registers" }
        val exits = method.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }
        check(exits.size == spec.expectedMatches) { "Expected one onCreate exit, found ${exits.size}" }
        val receiver = spec.integers["activityAlias"]?.let { "v$it" } ?: "p0"
        val receiverRegister = spec.integers["activityAlias"] ?: (registers - spec.int("thisParameterOffset"))
        val insertion = method.instructions.indexOfLast { instruction ->
            instruction.opcode == Opcode.IPUT_BOOLEAN &&
                (instruction as? ReferenceInstruction)?.reference.toString() == "${activity.type}->${spec.fieldName}:${spec.fieldType}" &&
                (instruction as TwoRegisterInstruction).registerB == receiverRegister
        } + 1
        check(insertion > 0 && insertion < exits.single()) { "Missing onCreate completion flag" }
        check(receiverRegister <= 15)
        method.addInstructions(insertion,
            "invoke-static {$receiver}, Lapp/geminipatch/extension/MicrogPermissions;->onCreate(Landroid/app/Activity;)V")
        println("[MicroG Account Permissions] Added account-permission explanation")
    }
}
