package app.noam.patches.blockblast.gameplay

import app.morphe.patcher.patch.rawResourcePatch
import app.noam.patches.blockblast.mod.Mod
import app.noam.patches.blockblast.mod.modLoaderPatch
import app.noam.patches.blockblast.shared.Constants.COMPATIBILITY_BLOCK_BLAST

@Suppress("unused")
val extraFxPatch = rawResourcePatch(
    name = "Extra effects",
    description = "The iOS-based app's seven extra effects: magnet drag, particles, landing bounce, big-clear flash, score pulse, thumbs-up and touch haptics. All off by default, toggled in Mod settings.",
) {
    compatibleWith(COMPATIBILITY_BLOCK_BLAST)
    dependsOn(modLoaderPatch)

    execute {
        // the thumbs-up (dianzan) DragonBones effect, exported from the iOS game by the app
        for (file in listOf("ske.json", "tex.json", "tex.png")) {
            get("assets/fx/dianzan/$file").writeBytes(Mod.resourceBytes("fx/dianzan/$file"))
        }
        Mod.enable("extraFx", uses = listOf("color"))
    }
}
