package semicoloncolonel.mobilestream.patches.appletv.tv

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import java.io.ByteArrayOutputStream
import java.util.zip.ZipEntry
import java.util.zip.ZipInputStream
import java.util.zip.ZipOutputStream

// Apple TV Android TV 17.0.2. The app is JavaScript run by Apple's native
// engine (libluna), shipped as assets/app.zip. The Java side copies app.zip
// into the app's data folder each time the APK is installed or updated, with
// no signature check, so the patches below change the JavaScript in it.

private const val APP_ZIP = "assets/app.zip"

/**
 * One text replacement in a file of app.zip. [all] allows several matches.
 * An edit whose replacement is already there (another patch made it) is
 * skipped.
 */
internal class AppZipEdit(val file: String, val from: String, val to: String, val all: Boolean = false)

/**
 * Over-the-air updates: the app downloads a diff of its JavaScript from
 * atve.tv.apple.com at every launch and mounts it over the shipped files,
 * which would undo the edits. The diff's URL is now empty, which the updater
 * treats as "no update". New versions of the JavaScript arrive with app
 * updates from the Play Store instead.
 */
internal val DISABLE_OTA = AppZipEdit(
    "main.js",
    "/production/diff.jetpack\";",
    "/production/diff.jetpack\".slice(0, 0);",
)

/** Applies [edits] to app.zip. Returns false when the APK has no app.zip (the phone app). */
internal fun ResourcePatchContext.editAppZip(edits: List<AppZipEdit>): Boolean {
    val zip = get(APP_ZIP)
    if (!zip.exists()) return false

    val pending = edits.groupBy { it.file }.toMutableMap()
    val out = ByteArrayOutputStream()
    ZipInputStream(zip.inputStream()).use { input ->
        ZipOutputStream(out).use { output ->
            while (true) {
                val entry = input.nextEntry ?: break
                var bytes = input.readBytes()
                val name = entry.name.substringAfterLast('/')
                pending.remove(name)?.let { fileEdits ->
                    var text = bytes.toString(Charsets.UTF_8)
                    fileEdits.forEach { edit ->
                        if (text.contains(edit.to)) return@forEach
                        val count = text.split(edit.from).size - 1
                        if (count == 0 || (count > 1 && !edit.all)) {
                            throw PatchException("Apple TV $name: expected code not found (${edit.from.take(40)})")
                        }
                        text = text.replace(edit.from, edit.to)
                    }
                    bytes = text.toByteArray(Charsets.UTF_8)
                }
                output.putNextEntry(ZipEntry(entry.name))
                output.write(bytes)
                output.closeEntry()
            }
        }
    }
    if (pending.isNotEmpty()) throw PatchException("Apple TV app.zip is missing ${pending.keys.joinToString()}")
    zip.writeBytes(out.toByteArray())
    return true
}
