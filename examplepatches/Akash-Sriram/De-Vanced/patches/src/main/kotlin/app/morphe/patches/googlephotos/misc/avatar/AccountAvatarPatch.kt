package app.morphe.patches.googlephotos.misc.avatar

import app.morphe.patches.googlephotos.misc.extension.sharedExtensionPatch
import app.morphe.patches.googlephotos.misc.gms.Constants.PHOTOS_MAIN_ACTIVITY_CLASS_TYPE
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

private object HomeActivityOnCreateFingerprint : Fingerprint(
    definingClass = PHOTOS_MAIN_ACTIVITY_CLASS_TYPE,
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

@Suppress("unused")
val accountAvatarPatch = bytecodePatch(
    name = "Account avatar",
    description = "Loads and displays account profile avatars across the top toolbar, Bento menu, and account switcher.",
    default = true,
) {
    compatibleWith(AppCompatibilities.GOOGLE_PHOTOS)
    dependsOn(sharedExtensionPatch)

    execute {
        HomeActivityOnCreateFingerprint.method.addInstructions(
            0,
            """
            invoke-static/range { p0 .. p0 }, Lapp/morphe/extension/shared/patches/GooglePhotosAccountAvatar;->install(Landroid/app/Activity;)V
            invoke-static/range { p0 .. p0 }, Lapp/morphe/extension/shared/patches/GooglePhotosAccountAvatar;->restoreSelectedAccount(Landroid/app/Activity;)V
            """.trimIndent(),
        )
    }
}
