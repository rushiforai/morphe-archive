package app.noam.patches.blockblast.generation

import app.morphe.patcher.patch.rawResourcePatch
import app.noam.patches.blockblast.mod.Mod
import app.noam.patches.blockblast.mod.modLoaderPatch
import app.noam.patches.blockblast.shared.Constants.COMPATIBILITY_BLOCK_BLAST

@Suppress("unused")
val iosGenerationPatch = rawResourcePatch(
    name = "iOS generation algorithm",
    description = "Classic trays are dealt by the real iOS 7.4.3 game code, which runs inside the app and plays " +
        "along with every move; Android's own algorithm is skipped. Toggleable in the Mod settings.",
) {
    compatibleWith(COMPATIBILITY_BLOCK_BLAST)
    dependsOn(modLoaderPatch)

    execute {
        // The iOS game (scripts + asset pack) and the web app's core that boots it, under assets/ios.
        get("assets/ios/env.js").writeBytes(Mod.resourceBytes("ios/env.js"))
        get("assets/ios/ios-core.js").writeBytes(Mod.resourceBytes("ios/ios-core.js"))
        Mod.resource("ios/game-files.txt").lineSequence().filter { it.isNotBlank() }.forEach { file ->
            get("assets/ios/game/$file").writeBytes(Mod.resourceBytes("ios/game/$file"))
        }
        Mod.enable("iosGeneration", mapOf("enabled" to true))
    }
}
