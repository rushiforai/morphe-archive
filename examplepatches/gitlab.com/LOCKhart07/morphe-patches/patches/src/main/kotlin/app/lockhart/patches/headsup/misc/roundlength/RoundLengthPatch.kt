/*
 * SPDX-License-Identifier: GPL-3.0-only
 *
 * Heads Up! decides the round length in native code: GameplayManager.Init in libil2cpp.so
 * sets gameTime to 60s, or to the deck's customRoundLength. There is no Java to hook, so this
 * patch ships a small native bridge (source and build script in native/headsup):
 *
 * - The extension (app.lockhart.extension.headsup.RoundLengthPatch) is called at the start of
 *   MainActivity.onCreate and loads libmorphe_headsup.so before Unity loads libil2cpp.so.
 * - The bridge uses ShadowHook to hook il2cpp_init, then looks up game methods by name through
 *   the exported il2cpp_* API. It hooks GameplayManager.Init to overwrite gameTime, and the
 *   deck page (DeckDetailsPopup) open/close methods to show a chip that opens a picker.
 * - The chosen length is stored in SharedPreferences. "Game default" / "Reset" stores 0 and
 *   leaves the game's own length untouched.
 *
 * Because methods are found by name, this does not depend on byte patterns or RVAs.
 * Verified on com.wb.headsup 4.15.11 (versionCode 4151100), arm64-v8a.
 */
package app.lockhart.patches.headsup.misc.roundlength

import app.lockhart.patches.shared.Constants.COMPATIBILITY_HEADS_UP
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch

private const val EXTENSION_CLASS = "Lapp/lockhart/extension/headsup/RoundLengthPatch;"
private const val MAIN_ACTIVITY = "Lcom/swrve/unity/firebase/MainActivity;"

// libshadowhook_nothing.so is dlopen()ed by ShadowHook during init and must ship alongside it.
private val NATIVE_LIBRARIES = listOf("libmorphe_headsup.so", "libshadowhook.so", "libshadowhook_nothing.so")
private val SUPPORTED_ABIS = listOf("arm64-v8a", "armeabi-v7a")

private val nativeBridgePatch = resourcePatch {
    execute {
        val libDirectory = get("lib")
        val abis = SUPPORTED_ABIS.filter { libDirectory.resolve(it).resolve("libil2cpp.so").isFile }
        if (abis.isEmpty()) throw PatchException("Could not find libil2cpp.so for a supported ABI")

        for (abi in abis) {
            for (library in NATIVE_LIBRARIES) {
                val resource = "headsup/native/$abi/$library"
                val stream = object {}.javaClass.classLoader.getResourceAsStream(resource)
                    ?: throw PatchException("Missing patch resource $resource")

                stream.use { input ->
                    libDirectory.resolve(abi).resolve(library).outputStream().use { input.copyTo(it) }
                }
            }
        }
    }
}

@Suppress("unused")
val roundLengthPatch = bytecodePatch(
    name = "Round length",
    description = "Adds an option to change the round length from the deck page.",
) {
    compatibleWith(COMPATIBILITY_HEADS_UP)
    dependsOn(nativeBridgePatch)
    extendWith("extensions/extension.mpe")

    execute {
        val onCreate = mutableClassDefBy(MAIN_ACTIVITY).methods.firstOrNull { it.name == "onCreate" }
            ?: throw PatchException("MainActivity.onCreate not found")

        // Before the super call, so the bridge is loaded before Unity loads libil2cpp.so.
        onCreate.addInstruction(
            0,
            "invoke-static { p0 }, $EXTENSION_CLASS->onCreate(Landroid/app/Activity;)V",
        )
    }
}
