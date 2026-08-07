package hoodles.morphe.patches.shared.misc.pairip.resources

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.util.inputStreamFromBundledResource
import java.io.File
import java.util.function.Supplier
import kotlin.io.copyTo
import kotlin.io.path.deleteIfExists

internal val mergeDexPatch = bytecodePatch {
    dependsOn(extractDexPatch)

    extendWithAll { extractedDexStreams.map { Supplier { it } } }
}

internal fun getPairipResourcesPatch(useStub: Boolean) = rawResourcePatch {
    // extract then merge embedded DEX files from assets
    dependsOn(mergeDexPatch)

    execute {
        // delete all pairip libs so theres no fallback
        get("lib").listFiles { it.isDirectory }?.forEach { archDir ->
            archDir.listFiles()?.first { it.name == "libpairipcore.so" }?.delete()
        }

        // delete bytecode assets
        for (asset in pairipAssets)
            asset.toPath().deleteIfExists()

        if (useStub) {
            // add pairipcore stub
            val pairipLib = get("lib/arm64-v8a/libpairipcore.so", true)
            val stubStream = inputStreamFromBundledResource("libs", "libpairipcore_stub.so")!!
            stubStream.use { input ->
                pairipLib.outputStream().use { output ->
                    input.copyTo(output)
                }
            }
        }
    }
}