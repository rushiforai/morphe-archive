package app.zdrgon.patches.droidcam.misc

import java.io.InputStream
import java.util.function.Supplier

/**
 * Support declarations for the runtime-files half of
 * 'Disable PairIP protection'. There is deliberately NO patch in
 * this file: the resource patch that does this work is defined
 * inline inside that patch's dependsOn(), so PatchLoader never
 * lists it as a separate entry (see DisablePairIpPatch's KDoc).
 *
 * Stream suppliers for the runtime-only lifecycle classes dex,
 * populated by the inline runtime-files patch when it executes and
 * consumed by 'Disable PairIP protection' through extendWithAll
 * (the patcher merges those classes into the patched app as real
 * class definitions).
 */
internal val droidcamRuntimeDex = mutableListOf<Supplier<InputStream>>()

/**
 * Payload notes for the inline runtime-files patch:
 *
 * The five runtime-only lifecycle classes (DroidCamApp$c2020060317,
 * MainActivity$c2020060317-$c2020060320) are NOT installed as a file:
 * a raw dex written into the APK never reaches the output as class
 * definitions. Instead the inline patch exposes the dex through
 * [droidcamRuntimeDex], and 'Disable PairIP protection' merges it as
 * classes via extendWithAll.
 *
 * Decrypted native libraries: libmjpg.so and libmdns.so ship with
 * their code sections encrypted and are decrypted at load time by
 * the PairIP VM (their DT_INIT calls ExecuteProgram). The patch
 * replaces them with self-contained builds whose code was dumped
 * from memory after the original decrypted it, with the decrypt
 * bootstrap neutralized. Payloads are per-ABI (arm64-v8a and
 * x86_64 are included). For an ABI with no payload (armeabi-v7a,
 * x86 in the stock bundle), the two encrypted libraries are
 * removed instead: they can never run without the VM, and the app
 * stays fully functional on the ABIs that do have payloads.
 *
 * Verified live on x86_64 (experiment #10, 2026-11-04): full app and
 * service run on the re-signed build with these files in place.
 */

/**
 * Anchor for patch-bundle resource lookups. Internal (not private)
 * because its user — the inline runtime-files patch — lives in
 * DisablePairIpPatch.kt.
 */
internal object PairIpRuntimeFilesPatchAnchor
