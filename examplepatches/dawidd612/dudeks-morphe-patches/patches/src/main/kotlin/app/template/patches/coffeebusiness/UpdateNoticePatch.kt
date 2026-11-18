package app.template.patches.coffeebusiness

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import com.android.tools.smali.dexlib2.Opcode

private val coffeeUpdateNoticeNative = rawResourcePatch {
    finalize {
        val profile = CoffeeProfiles.forPackage(packageMetadata)
        val library = get("lib/arm64-v8a/libil2cpp.so")
        val output = profile.resource(requireNotNull(profile.updateNoticeDelta)).use {
            CoffeeBootstrap.restoreNative(library.readBytes(), it)
        }
        library.writeBytes(output)
    }
}

@Suppress("unused")
val coffeeUpdateNoticePatch = bytecodePatch(
    name = "Non-blocking update notice",
    description = "Replaces Coffee's blocking update/install notice with one short toast and continues loading the game.",
    default = true,
) {
    compatibleWith(Compatibility(
        name = "Good Coffee, Great Coffee", packageName = "com.tapblaze.coffeebusiness",
        apkFileType = CoffeeProfiles.compatibility.apkFileType,
        appIconColor = 0x98704C,
        targets = CoffeeProfiles.profiles.filter { it.updateNoticeDelta != null }.map { it.target },
    ))
    dependsOn(coffeeStartupSupport, coffeeUpdateNoticeNative)
    execute {
        val create = coffeeMethod("Lcom/tapblaze/coffeebusiness/MyUnityActivity;", "onCreate",
            listOf("Landroid/os/Bundle;"), "V", static = false)
        val returns = create.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }
        checkCoffee(returns.size == 1, "update notice Activity startup changed")
        create.addInstructions(returns.single().index,
            "invoke-static {p0}, Lpl/dudek/extension/coffeebusiness/CoffeeUpdateNotice;->initialize(Landroid/content/Context;)V")
    }
}
