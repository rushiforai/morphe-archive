package local.wazemaps

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.*
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import java.security.MessageDigest

private object AndroidAutoResources

private val androidAutoAssets = rawResourcePatch {
    dependsOn(refreshWazeSkins)
    execute {
        val companion = AndroidAutoResources::class.java.getResourceAsStream("/installer/waze-aa-installer.apk")
            ?.use { it.readBytes() } ?: throw PatchException("Missing bundled Android Auto installer")
        val hash = MessageDigest.getInstance("SHA-256").digest(companion).joinToString("") { "%02x".format(it) }
        if (hash != "e5d442454418efd4ff438b3ed3f6bfa5a3aee78f52616625cb25ce0ec8855b48")
            throw PatchException("Bundled Android Auto installer checksum mismatch")
        get("assets/morphe/installer/waze-aa-installer.apk").apply { parentFile.mkdirs(); writeBytes(companion) }
        get("assets").resolveSibling("AndroidManifest.xml").apply { writeBytes(companionManifest(readBytes())) }
    }
}

@Suppress("unused")
val androidAutoPatch = bytecodePatch(
    name = "Android Auto setup",
    description = "Bundle Waze AA Installer and add setup to Map display, with an offer after login. Requires Shizuku for the visibility repair.",
    default = true
) {
    compatibleWith(Compatibility(
        packageName = "com.waze", name = "Waze", apkFileType = ApkFileType.XAPK,
        signatures = setOf("03637f6c5d8f604e6fdb79a6ffbfa578de4e318f8da22fc6106665247f8807d7"),
        targets = TESTED_WAZE_VERSIONS.map { AppTarget(it) }
    ))
    dependsOn(androidAutoAssets)
    extendWith("extensions/aa-installer.dex")
    execute {
        bindExtension("Llocal/wazemaps/themes/AndroidAutoSettings;", context = false, rows = true)
        val launch = mutableClassDefBy("Lcom/waze/MainActivity;").methods.single {
            it.name == "onCreate" && it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/os/Bundle;") && it.returnType == "V"
        }
        // MainActivity reuses p0 as a String later in onCreate. At entry it is
        // guaranteed to be the Activity; never read p0 at a return instruction.
        // Remove our older hook if this input already contains it.
        launch.implementation!!.instructions.toList().forEachIndexed { index, instruction ->
            val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            if (ref?.definingClass == "Llocal/wazemaps/themes/CompanionInstaller;" &&
                ref.name == "attach" && ref.parameterTypes.map(CharSequence::toString) == listOf("Landroid/app/Activity;"))
                launch.replaceInstruction(index, "nop")
        }
        launch.addInstructions(0, "invoke-static/range {p0 .. p0}, Llocal/wazemaps/themes/CompanionInstaller;->attach(Landroid/app/Activity;)V")
        val render = settingsRenderer()
        val exits = render.implementation!!.instructions.mapIndexedNotNull { i, instruction ->
            if (instruction.opcode == Opcode.RETURN_OBJECT) i to (instruction as OneRegisterInstruction).registerA else null
        }
        if (exits.isEmpty()) throw PatchException("Settings renderer exit missing")
        exits.reversed().forEach { (i, register) ->
            render.addInstructions(i, """
                invoke-static/range {v$register .. v$register}, Llocal/wazemaps/themes/AndroidAutoSettings;->decorate(Landroid/view/View;)Landroid/view/View;
                move-result-object v$register
            """)
        }
    }
}
