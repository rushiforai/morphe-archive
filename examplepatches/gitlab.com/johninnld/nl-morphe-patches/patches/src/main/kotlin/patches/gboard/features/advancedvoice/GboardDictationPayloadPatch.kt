package patches.gboard.features.advancedvoice

import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.resourcePatch
import patches.gboard.Constants.COMPATIBILITY_GBOARD

/**
 * Ships the dictation formatter library as an asset.
 *
 * `lib/<abi>` would be the natural place, but the target declares `extractNativeLibs=false` and the
 * packager deflates entries a patch adds there, so the linker cannot map it. The extension extracts
 * this asset to the app's own lib directory, loads it, and points Gboard's readiness check at the
 * loaded object; no bytecode in Gboard is modified for this.
 */
internal val gboardDictationPayloadAssetsPatch = resourcePatch(
    description = "Copy the dictation formatter library into the target APK as an asset.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        copyDictationPayload()
    }
}

context(context: ResourcePatchContext)
private fun copyDictationPayload() = with(context) {
    val loader = object {}.javaClass.classLoader ?: error("No classloader for the dictation payload")
    for (abi in listOf("arm64-v8a", "armeabi-v7a")) {
        val bytes = loader.getResourceAsStream("gboard/dictation-native/$abi/libdictation_jni.so")
            ?.use { it.readBytes() }
            ?: error("dictation payload missing for $abi")
        val target = this["assets/dictation/$abi/libdictation_jni.so", false]
        target.parentFile?.mkdirs()
        target.outputStream().use { it.write(bytes) }
    }
}
