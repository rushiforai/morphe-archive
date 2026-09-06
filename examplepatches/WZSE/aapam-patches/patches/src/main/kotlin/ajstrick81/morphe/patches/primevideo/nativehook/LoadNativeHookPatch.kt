package ajstrick81.morphe.patches.primevideo.nativehook

import ajstrick81.morphe.patches.primevideo.misc.extension.primeVideoExtensionPatch
import ajstrick81.morphe.patches.primevideo.shared.Constants
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch

private fun BytecodePatchContext.injectNativeHookLoader() {
    ApplicationOnCreateFingerprint.method.addInstructions(
        0,
        """
            invoke-static {}, Lajstrick81/morphe/extension/primevideo/nativehook/NativeHookLoader;->load()V
        """,
    )
}

@Suppress("unused")
val loadNativeHookPatchV6_23 = bytecodePatch(
    name = "Load native ad-strip hook",
    description = "Loads libpvhook.so at startup before Prime Video constructs its media pipeline.",
) {
    compatibleWith(Constants.COMPATIBILITY_6_23)
    dependsOn(bundleNativeHookPatchV6_23, primeVideoExtensionPatch)
    execute { injectNativeHookLoader() }
}

@Suppress("unused")
val loadNativeHookPatchV6_24 = bytecodePatch(
    name = "Load native ad-strip hook",
    description = "Loads libpvhook.so at startup before Prime Video constructs its media pipeline.",
) {
    compatibleWith(Constants.COMPATIBILITY_6_24)
    dependsOn(bundleNativeHookPatchV6_24, primeVideoExtensionPatch)
    execute { injectNativeHookLoader() }
}
