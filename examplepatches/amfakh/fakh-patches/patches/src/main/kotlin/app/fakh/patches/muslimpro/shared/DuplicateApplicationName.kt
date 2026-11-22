package app.fakh.patches.muslimpro.shared

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.decode
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile

private val APP_CLASS = Regex("""android:name="\.core\.MPApplication"\s+""")

/**
 * The manifest declares `android:name` twice on `<application>` (the app's own class and the Pairip wrapper that
 * extends it). The binary format allows it, the XML parser behind `document()` does not. Keeps the wrapper, which
 * runs the app's class anyway. Patches that edit the manifest depend on this one.
 */
internal val duplicateApplicationNamePatch = patch {
    execute {
        decode("AndroidManifest.xml")
        val manifest = resourceFile("AndroidManifest.xml")
        val text = manifest.readText()
        if (!APP_CLASS.containsMatchIn(text)) throw PatchException("Muslim Pro: duplicate application name not found.")
        manifest.writeText(APP_CLASS.replaceFirst(text, ""))
    }
}
