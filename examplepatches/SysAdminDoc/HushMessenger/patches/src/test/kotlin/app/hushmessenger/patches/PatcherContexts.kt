package app.hushmessenger.patches

import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.PatcherContext
import app.morphe.patcher.PatcherProgress
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.resource.ResourceMode
import com.android.tools.smali.dexlib2.iface.ClassDef
import java.io.File
import java.nio.file.Files
import java.nio.file.Path

/**
 * Runs [action] with a patcher context current for [apk], which is what the blocks of patches built with `patch()` reach
 * through the patcher's global functions. [temporary] is the patcher's work folder. The resources are the APK decoded
 * raw, plus an empty manifest when [emptyManifest] is set. The bytecode has no classes until [useClasses] gives it some.
 *
 * The context is built without a Patcher, since closing one resets Fingerprint's global matching settings.
 */
internal fun withPatcherContext(apk: File, temporary: Path, emptyManifest: Boolean = false,
    action: (ResourcePatchContext, BytecodePatchContext) -> Unit) {
    val context = PatcherContext::class.java.getDeclaredConstructor(PatcherConfig::class.java)
        .newInstance(PatcherConfig(apk, temporary.toFile()))
    context.use {
        val resources = PatcherContext::class.java.getMethod("getResourceContext\$morphe_patcher").invoke(context) as ResourcePatchContext
        val bytecode = PatcherContext::class.java.getMethod("getBytecodeContext\$morphe_patcher").invoke(context) as BytecodePatchContext
        ResourcePatchContext::class.java.getMethod("decodeResources\$morphe_patcher", ResourceMode::class.java)
            .invoke(resources, ResourceMode.RAW_ONLY)
        if (emptyManifest) {
            // The extension's resource APK is framework-only, with no application resource package to decode.
            Files.writeString(temporary.resolve("apk/AndroidManifest.xml"),
                """<manifest xmlns:android="http://schemas.android.com/apk/res/android"><application /></manifest>""")
        }
        action(resources, bytecode)
    }
}

/** Makes [classes] the whole of the app's bytecode, in place of decoding the APK's DEX files. */
internal fun BytecodePatchContext.useClasses(classes: Set<ClassDef>) {
    val patchClasses = Class.forName("app.morphe.patcher.util.PatchClasses")
    BytecodePatchContext::class.java.getMethod("setPatchClasses\$morphe_patcher", patchClasses)
        .invoke(this, patchClasses.getConstructor(Set::class.java, PatcherProgress::class.java).newInstance(classes, null))
}
