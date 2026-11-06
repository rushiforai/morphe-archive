package app.zdrgon.patches.droidcam.misc

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.zdrgon.patches.droidcam.shared.Constants.COMPATIBILITY_DROIDCAM
import java.io.InputStream
import java.util.function.Supplier

/**
 * Stream suppliers for the runtime-only lifecycle classes dex, populated
 * by [pairIpRuntimeFilesPatch] when it executes and consumed by
 * `Disable PairIP protection` through extendWithAll (the patcher merges
 * those classes into the patched app as real class definitions).
 */
internal val droidcamRuntimeDex = mutableListOf<Supplier<InputStream>>()

/**
 * Installs the decrypted native libraries the PairIP bypass needs,
 * harvested from the original DroidCam 9.0 (vc76).
 *
 * (The five runtime-only lifecycle classes that pair with this patch —
 * DroidCamApp$c2020060317, MainActivity$c2020060317-$c2020060320 — are
 * NOT installed as a file here: a raw dex written into the APK never
 * reaches the output as class definitions. Instead this patch exposes
 * the dex as a stream supplier, and 'Disable PairIP protection' merges
 * it as classes via extendWithAll.)
 *
 * Decrypted native libraries: libmjpg.so and libmdns.so ship with
 *    their code sections encrypted and are decrypted at load time by
 *    the PairIP VM (their DT_INIT calls ExecuteProgram). The patch
 *    replaces them with self-contained builds whose code was dumped
 *    from memory after the original decrypted it, with the decrypt
 *    bootstrap neutralized. Payloads are per-ABI (arm64-v8a and
 *    x86_64 are included). For an ABI with no payload (armeabi-v7a,
 *    x86 in the stock bundle), the two encrypted libraries are
 *    removed instead: they can never run without the VM, and the app
 *    stays fully functional on the ABIs that do have payloads.
 *
 * Verified live on x86_64 (experiment #10, 2026-11-04): full app and
 * service run on the re-signed build with these files in place.
 */
@Suppress("unused")
val pairIpRuntimeFilesPatch = resourcePatch(
    name = "Disable PairIP protection (runtime files)",
    description = "Swaps the VM-encrypted native libraries (libmjpg, libmdns) for " +
        "decrypted builds that 'Disable PairIP protection' needs. " +
        "Enable both together. DroidCam 9.0 only.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_DROIDCAM)

    execute {
        // Expose the runtime-only lifecycle classes dex to
        // 'Disable PairIP protection' (it dependsOn this patch, so this
        // runs before its extendWithAll provider is evaluated).
        if (droidcamRuntimeDex.isEmpty()) {
            droidcamRuntimeDex += Supplier {
                PairIpRuntimeFilesPatchAnchor::class.java
                    .getResourceAsStream("/droidcam/classes4.dex")
                    ?: throw PatchException(
                        "Patch payload missing from the patch bundle: /droidcam/classes4.dex"
                    )
            }
        }

        // Decrypted libraries for every ABI the merged APK carries.
        val libRoot = get("lib")
        val abiDirs = libRoot.listFiles()?.filter { it.isDirectory } ?: emptyList()
        if (abiDirs.isEmpty()) throw PatchException("No lib/<abi> directory in the merged APK")
        var replacedAny = false
        for (abiDir in abiDirs) {
            val abi = abiDir.name
            for (lib in listOf("libmjpg.so", "libmdns.so")) {
                val target = get("lib/$abi/$lib")
                if (!target.exists()) continue
                val stream = PairIpRuntimeFilesPatchAnchor::class.java
                    .getResourceAsStream("/droidcam/$abi/$lib")
                if (stream != null) {
                    target.writeBytes(stream.readBytes())
                    replacedAny = true
                } else {
                    // No payload for this ABI: the encrypted build can
                    // never run without the PairIP VM, so drop it. The
                    // app remains functional on payload ABIs.
                    target.delete()
                }
            }
        }
        if (!replacedAny) {
            throw PatchException("No ABI in the merged APK matched a decrypted-library payload")
        }
    }
}

/** Anchor for patch-bundle resource lookups. */
private object PairIpRuntimeFilesPatchAnchor
