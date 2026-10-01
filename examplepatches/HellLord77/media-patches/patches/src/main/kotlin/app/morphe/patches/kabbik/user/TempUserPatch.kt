package app.morphe.patches.kabbik.user

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.all.misc.fix.changepackageinstaller.changePackageInstallerPatch
import app.morphe.patches.kabbik.extension.sharedExtensionPatch
import app.morphe.patches.kabbik.shared.Constants.COMPATIBILITY_KABBIK
import app.morphe.util.matchSingle
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference

private const val EXTENSION_CLASS = "Lapp/morphe/extension/kabbik/patches/TempUserPatch;"

@Suppress("unused")
val tempUserPatch = bytecodePatch(
    name = "Temp user",
    description = "Log in as subscribed temp user.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_KABBIK)

    dependsOn(sharedExtensionPatch, changePackageInstallerPatch())

    execute {
        with(KabbikApplicationOnCreateFingerprint.matchSingle()) {
            method.addInstruction(
                0, BuilderInstruction35c(
                    Opcode.INVOKE_STATIC, 0, 0, 0, 0, 0, 0, ImmutableMethodReference(
                        EXTENSION_CLASS,
                        originalMethod.name,
                        originalMethod.parameters,
                        originalMethod.returnType
                    )
                )
            )
        }
    }
}