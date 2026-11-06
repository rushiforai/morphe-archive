package app.pokemongo

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.rawResourcePatch

private val COMPATIBILITY_POKEMON_GO = Compatibility(
    name = "Pokémon GO",
    packageName = "com.nianticlabs.pokemongo",
    targets = listOf(
        AppTarget(
            version = "0.433.1",
        ),
        AppTarget(
            version = "0.431.0",
        ),
    ),
)

/**
 * Experimental native loader infrastructure for Pokémon GO (0.433.1, 0.431.0) arm64-v8a.
 */
val pokemonGoNativeBootstrap = rawResourcePatch(
    name = "Enhanced throw",
    description = "Installs the experimental native research loader for Pokémon GO 0.433.1 / 0.431.0 arm64-v8a.",
) {
    compatibleWith(COMPATIBILITY_POKEMON_GO)

    execute {
        val dir = get("lib/arm64-v8a")
        // In an .apkm/.xapk the native libs live in the arm64 config split;
        // this only exists if the splits were merged before patching.
        require(dir.exists()) {
            "lib/arm64-v8a not found. Patch the merged .apkm/.xapk (splits merged) " +
                "or an arm64-v8a build that contains native libraries."
        }

        val original = dir.resolve("libmain.so")
        require(original.exists()) { "lib/arm64-v8a/libmain.so not found" }

        val patchClassLoader = object {}.javaClass.classLoader
            ?: error("Unable to resolve the Pokémon GO patch bundle class loader")

        val bootstrap = patchClassLoader
            .getResourceAsStream("pgo/arm64-v8a/libmain.so")
            ?.use { it.readBytes() }
            ?: error("Missing bundled pgo/arm64-v8a/libmain.so")

        val payload = patchClassLoader
            .getResourceAsStream("pgo/arm64-v8a/libpgo_hook.so")
            ?.use { it.readBytes() }
            ?: error("Missing bundled pgo/arm64-v8a/libpgo_hook.so")

        // Double-patch guard: wrapping our own wrapper would make it load itself.
        val backup = dir.resolve("libmain_orig.so")
        require(!backup.exists()) {
            "libmain_orig.so already exists - this APK looks already patched. Patch the original APK."
        }
        require(!original.readBytes().contentEquals(bootstrap)) {
            "libmain.so is already the bundled wrapper - this APK looks already patched."
        }

        original.copyTo(backup, overwrite = false)
        original.writeBytes(bootstrap)
        dir.resolve("libpgo_hook.so").writeBytes(payload)
    }
}
