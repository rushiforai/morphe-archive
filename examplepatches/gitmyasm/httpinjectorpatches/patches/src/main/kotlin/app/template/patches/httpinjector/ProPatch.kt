package app.template.patches.httpinjector

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch

private object PatchResources

private fun resource(name: String): ByteArray =
    PatchResources::class.java.classLoader.getResourceAsStream(name)?.readBytes()
        ?: throw PatchException("Missing HTTP Injector patch resource: $name")

/**
 * Unlocks HTTP Injector's locally enforced Pro features.
 *
 * The Pro unlock itself is a 40-byte runtime patch inside libevozi_sentinel.so.
 * The premium reference also needs libDexHelper.so to load libdexfix.so, an
 * anti-tamper helper. This patch bundles libdexfix.so with a single instruction
 * changed: the one JNI call that displays the modder's toast is replaced with a
 * NOP. All of the helper's anti-tamper logic is left fully intact, so it cannot
 * crash the app. No modded sentinel library is bundled.
 *
 * Server-side account/purchase features still depend on Evozi's servers.
 */
@Suppress("unused")
val unlockProPatch = rawResourcePatch(
    name = "Unlock Pro",
    description = "Unlocks HTTP Injector's locally enforced Pro features without modder toast.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_HTTP_INJECTOR)

    execute {
        fun applyHex(offset: Int, hex: String, bytes: ByteArray) {
            val replacement = hex.chunked(2).map { it.toInt(16).toByte() }.toByteArray()
            replacement.copyInto(bytes, offset)
        }

        val sentinelPath = "lib/arm64-v8a/libevozi_sentinel.so"
        val sentinel = get(sentinelPath, true)
        if (sentinel.length() != 298_304L) {
            throw PatchException("Unexpected HTTP Injector $sentinelPath size: ${sentinel.length()}")
        }
        val sentinelBytes = sentinel.readBytes()
        applyHex(
            295_220,
            "e903845269a0ba7228fefff009fd02b9092109b9099109b909d909b948fefff0",
            sentinelBytes,
        )
        applyHex(
            295_260,
            "096109b9c0035fd6",
            sentinelBytes,
        )
        sentinel.writeBytes(sentinelBytes)

        val dexHelper = get("lib/arm64-v8a/libDexHelper.so", true)
        if (dexHelper.length() != 1_152_426L) {
            throw PatchException("Unexpected HTTP Injector libDexHelper.so size: ${dexHelper.length()}")
        }
        dexHelper.writeBytes(resource("libDexHelper.so"))

        val libDir = sentinel.parentFile
        libDir.resolve("libdexfix.so").writeBytes(resource("libdexfix-clean.so"))
    }
}
