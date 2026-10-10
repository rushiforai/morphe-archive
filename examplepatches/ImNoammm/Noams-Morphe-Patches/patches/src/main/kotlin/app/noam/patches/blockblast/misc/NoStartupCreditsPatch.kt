package app.noam.patches.blockblast.misc

import app.morphe.patcher.patch.rawResourcePatch
import app.noam.patches.blockblast.mod.Mod
import app.noam.patches.blockblast.mod.modLoaderPatch
import app.noam.patches.blockblast.shared.Constants.COMPATIBILITY_BLOCK_BLAST

@Suppress("unused")
val noStartupCreditsPatch = rawResourcePatch(
    name = "Remove startup credits",
    description = "Removes the Hungry Studio wordmark from the boot splash (the activity window background shown while the engine loads), leaving its plain gradient until the loading screen appears.",
) {
    compatibleWith(COMPATIBILITY_BLOCK_BLAST)
    dependsOn(modLoaderPatch)

    execute {
        // The boot window background (style/splash -> @drawable/loading_bg), rebuilt from the original's
        // edge columns without the wordmark. Where it sits depends on the pipeline mode (raw: root/res;
        // with the manifest patch: resources/package_N/res), so every copy in the working tree is replaced.
        val apkDir = get("").parentFile ?: get("")
        val targets = apkDir.walkTopDown().filter { it.isFile && it.name == "loading_bg.webp" }.toList()
        if (targets.isEmpty()) throw app.morphe.patcher.patch.PatchException("loading_bg.webp not found in ${apkDir.absolutePath}")
        val bytes = Mod.resourceBytes("splash/loading_bg.webp")
        targets.forEach { it.writeBytes(bytes) }
        Mod.enable("noSplash")
    }
}
