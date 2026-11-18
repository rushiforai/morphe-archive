package app.template.patches.pizzabusiness

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import java.io.DataInputStream
import java.security.MessageDigest
import java.util.zip.GZIPInputStream

private val pizzaUpdateNoticeNative = rawResourcePatch {
    finalize {
        val profile = PizzaProfiles.forPackage(packageMetadata)
        val library = get("lib/arm64-v8a/libcocos2dcpp.so")
        val original = library.readBytes()
        val hash = MessageDigest.getInstance("SHA-256").digest(original)
        // Exact variants cover the original and optional paid-offer visibility inputs.
        val delta = profile.updateNoticeDeltas.singleOrNull { name ->
            profile.resource(name).use { stream ->
                DataInputStream(GZIPInputStream(stream)).use { input ->
                    require(input.readInt() == 0x505a4232) { "Invalid Pizza notice delta" }
                    ByteArray(32).also(input::readFully).contentEquals(hash)
                }
            }
        } ?: throw PatchException("Pizza update notice requires this profile's exact native library.")
        library.writeBytes(profile.resource(delta).use { PizzaBootstrap.restoreNative(original, it) })
    }
}

@Suppress("unused")
val pizzaUpdateNoticePatch = bytecodePatch(
    name = "Non-blocking update notice",
    description = "Replaces Pizza's blocking game-update notice with one short toast and continues loading.",
    default = true,
) {
    compatibleWith(Compatibility(
        name = "Good Pizza, Great Pizza", packageName = "com.tapblaze.pizzabusiness",
        apkFileType = PizzaProfiles.compatibility.apkFileType, appIconColor = 0xB47454,
        targets = PizzaProfiles.profiles.filter { it.updateNoticeDeltas.isNotEmpty() }.map { it.target },
    ))
    dependsOn(pizzaStartupSupport, pizzaUpdateNoticeNative)
    extendWith("extensions/pizzabusiness.mpe")
    execute {
        val create = pizzaMethod("Lcom/tapblaze/pizzabusiness/BaseAppActivity;", "onCreate",
            listOf("Landroid/os/Bundle;"), "V", static = false)
        // Pizza rejects duplicate windows with an early return. Initialize only
        // the Activity accepted by its existing root check, before SDK startup.
        val accepted = create.instructions.withIndex().filter {
            val field = (it.value as? ReferenceInstruction)?.reference as? FieldReference
            it.value.opcode == Opcode.SPUT_OBJECT &&
                field?.definingClass == "Lcom/tapblaze/pizzabusiness/BaseAppActivity;" &&
                field.name == "activity" && field.type == "Landroid/app/Activity;"
        }
        requirePizza(accepted.size == 1 && create.calls("Landroid/app/Activity;", "isTaskRoot") &&
            create.calls("Lorg/cocos2dx/lib/Cocos2dxActivity;", "onCreate"), "update notice Activity startup changed")
        create.addInstructions(accepted.single().index + 1,
            "invoke-static {p0}, Lpl/dudek/extension/pizzabusiness/PizzaUpdateNotice;->initialize(Landroid/content/Context;)V")
    }
}
