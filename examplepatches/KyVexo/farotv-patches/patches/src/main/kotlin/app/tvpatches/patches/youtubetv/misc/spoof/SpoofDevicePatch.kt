package app.tvpatches.patches.youtubetv.misc.spoof

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.returnEarly
import app.tvpatches.patches.youtubetv.misc.gms.CobaltActivityOnCreateFingerprint
import app.tvpatches.patches.youtubetv.misc.gms.youtubeTvExtensionPatch
import app.tvpatches.patches.youtubetv.shared.Constants.COMPATIBILITY_YOUTUBE_TV

private const val EXTENSION_CLASS = "Lapp/tvpatches/extension/youtubetv/SpoofDevicePatch;"
private const val ABI = "armeabi-v7a"
private const val ENGINE = "lib/$ABI/libchrobalt.so"
private const val SHIM = "lib/$ABI/libytvshim.so"

internal object PatchedValuesFingerprint : Fingerprint(
    definingClass = EXTENSION_CLASS,
    name = "getPatchedValues",
)

/**
 * Makes libchrobalt.so load libytvshim.so (instead of libandroid.so, which the shim loads in
 * turn) and read system properties through it. See native/ytvshim/ytvshim.c.
 */
private val nativeShimPatch = resourcePatch {
    execute {
        val engine = get(ENGINE)
        if (!engine.exists()) throw IllegalStateException("$ENGINE not found in the APK")

        val elf = Elf32(engine.readBytes())
        elf.renameNeeded("libandroid.so", "libytvshim.so")
        elf.renameImport("__system_property_get", "ytvshim_property_get_")
        elf.renameImport("__system_property_find", "ytvshim_property_find_")
        elf.renameImport("__system_property_read_callback", "ytvshim_property_read_callback_")
        engine.writeBytes(elf.bytes)

        val shim = get(SHIM)
        shim.parentFile.mkdirs()
        val bundled = object {}.javaClass.classLoader.getResourceAsStream("youtubetv/native/$ABI/libytvshim.so")
            ?: throw IllegalStateException("bundled libytvshim.so missing")
        bundled.use { input -> shim.outputStream().use { input.copyTo(it) } }
    }
}

/**
 * YouTube refuses to run on TVs that are not on its list of supported devices ("YouTube no es
 * compatible con este dispositivo"). The server decides from the device identity the native
 * engine builds from ro.product.brand / model / manufacturer and ro.board.platform.
 */
@Suppress("unused")
val spoofDevicePatch = bytecodePatch(
    name = "Spoof device",
    description = "Reports another TV model to YouTube, so it runs on TVs it calls \"not compatible\". " +
        "Default: Google Chromecast.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_TV)
    dependsOn(youtubeTvExtensionPatch, nativeShimPatch)

    val brand by stringOption(key = "brand", default = "google", title = "Brand", required = true)
    val model by stringOption(key = "model", default = "Chromecast", title = "Model", required = true)
    val manufacturer by stringOption(key = "manufacturer", default = "Google", title = "Manufacturer", required = true)
    val chipset by stringOption(key = "chipset", default = "sm1", title = "Chipset", required = true)

    execute {
        val values = listOf(brand, model, manufacturer, chipset).map { (it ?: "").replace("|", "") }
        PatchedValuesFingerprint.method.returnEarly(values.joinToString("|"))
        CobaltActivityOnCreateFingerprint.method.addInstruction(
            0,
            "invoke-static { }, $EXTENSION_CLASS->setEnvironment()V",
        )
    }
}
