package app.morphe.patches.kabbik.user

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.all.misc.fix.changepackageinstaller.changePackageInstallerPatch
import app.morphe.patches.kabbik.extension.sharedExtensionPatch
import app.morphe.patches.kabbik.shared.Constants.COMPATIBILITY_KABBIK
import app.morphe.util.matchSingle

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
        KabbikApplicationOnCreateFingerprint.matchSingle().method.addInstructions(
            0,
            "invoke-static {}, $EXTENSION_CLASS->onCreate()V"
        )
    }
}