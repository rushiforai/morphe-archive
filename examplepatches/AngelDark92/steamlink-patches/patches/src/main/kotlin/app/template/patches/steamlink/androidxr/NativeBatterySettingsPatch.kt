package app.template.patches.steamlink.androidxr

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference

private const val BATTERY_HELPER = "Lcom/valvesoftware/steamlink/GxrBatterySettings;"

internal val nativeBatterySettingsPatch = bytecodePatch {
    dependsOn(androidXrBatteryUiExtensionPatch)

    execute {
        if (packageMetadata.versionName != "2.0.22" || packageMetadata.versionCode != "5002322") {
            return@execute
        }

        val method = mutableClassDefBy("Lcom/valvesoftware/steamlink/SteamLink;").methods.single {
            it.name == "onCreate" && it.parameterTypes == listOf("Landroid/os/Bundle;")
        }
        val implementation = requireNotNull(method.implementation)
        val instructions = implementation.instructions
        val helperCalls = instructions.mapNotNull {
            ((it as? ReferenceInstruction)?.reference as? MethodReference)
                ?.takeIf { reference -> reference.definingClass == BATTERY_HELPER }
        }
        if (helperCalls.isNotEmpty()) {
            require(helperCalls.map { it.name } == listOf("request")) {
                "Incomplete native battery settings hook"
            }
            return@execute
        }
        val superIndex = instructions.indexOfFirst {
            val reference = (it as? ReferenceInstruction)?.reference as? MethodReference
            it.opcode == Opcode.INVOKE_SUPER &&
                reference?.definingClass == "Lorg/libsdl/app/SDLActivity;" &&
                reference.name == "onCreate"
        }
        require(superIndex >= 0) { "Unexpected native SteamLink.onCreate layout" }

        // Stock reuses both parameter registers later in onCreate. At this point
        // p0 and the saved-state Bundle are still valid; Settings opens asynchronously.
        method.addInstruction(
            superIndex + 1,
            BuilderInstruction3rc(
                Opcode.INVOKE_STATIC_RANGE, implementation.registerCount - 2, 2,
                ImmutableMethodReference(
                    BATTERY_HELPER, "request",
                    listOf("Landroid/app/Activity;", "Landroid/os/Bundle;"), "V",
                ),
            ),
        )
    }
}
