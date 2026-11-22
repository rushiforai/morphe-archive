package app.finni.patches.telegraph.branding

import app.finni.patches.telegraph.shared.Constants.COMPATIBILITY_TELEGRAPH_PLUS
import app.finni.patches.telegraph.shared.bundledBytes
import app.finni.patches.telegraph.signature.disableSignatureCheckPatch
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile

@Suppress("unused")
val raccoonIntroPatch = patch(
    name = "Raccoon intro",
    description = "Replaces the welcome screen logo textures: a raccoon peeks over the Telegram sphere, " +
        "signed \"by Nott\".",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TELEGRAPH_PLUS)
    dependsOn(disableSignatureCheckPatch)

    execute {
        listOf("intro_tg_sphere.png", "intro_tg_plane.webp").forEach { file ->
            val target = resourceFile("res/drawable-xxhdpi/$file", false)
            target.parentFile.mkdirs()
            target.writeBytes(bundledBytes("graff/intro/drawable-xxhdpi/$file"))
        }
    }
}
