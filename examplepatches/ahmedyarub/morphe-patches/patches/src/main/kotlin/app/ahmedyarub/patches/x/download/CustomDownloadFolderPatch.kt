package app.ahmedyarub.patches.x.download

import app.ahmedyarub.patches.shared.Constants.COMPATIBILITY_X
import app.ahmedyarub.patches.x.shared.EXTENSION_PACKAGE
import app.ahmedyarub.patches.x.shared.xExtensionPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.util.getReference
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val DOWNLOADS_CLASS = "$EXTENSION_PACKAGE/Downloads;"
private const val REQUEST = "Landroid/app/DownloadManager\$Request;"

/** Saves a photo into MediaStore under the relative path it is given, its last parameter. */
private object SaveToMediaStoreFingerprint : Fingerprint(
    parameters = listOf("Landroid/content/Context;", "Ljava/io/InputStream;", "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;"),
    strings = listOf("Failed to create MediaStore entry for "),
)

/** Builds the DownloadManager request videos and GIFs are downloaded with, into Download/X. */
private object VideoDownloadRequestFingerprint : Fingerprint(
    returnType = REQUEST,
    strings = listOf("X/"),
    custom = { _, classDef -> classDef.type.startsWith("Lcom/x/") },
)

private object FolderExtensionFingerprint : Fingerprint(
    definingClass = DOWNLOADS_CLASS,
    name = "folder",
)

private val STANDARD_DIRECTORIES = setOf("Download", "Pictures", "Movies", "DCIM", "Documents")

@Suppress("unused")
val customDownloadFolderPatch = bytecodePatch(
    name = "Custom download folder",
    description = "Saves downloaded photos and videos to a folder of your choice instead of Download/X.",
) {
    compatibleWith(COMPATIBILITY_X)
    dependsOn(xExtensionPatch)

    val folder by stringOption(
        key = "folder",
        default = "Download/X",
        title = "Folder",
        description = "Relative to shared storage, starting with Download, Pictures, Movies, DCIM or Documents, " +
            "e.g. Pictures/X or Download/Twitter.",
        required = true,
    )

    execute {
        val path = folder!!.trim().trim('/')
        if (path.substringBefore('/') !in STANDARD_DIRECTORIES || path.contains('"') || path.contains("..")) {
            throw PatchException("The folder must start with one of $STANDARD_DIRECTORIES: $folder")
        }
        FolderExtensionFingerprint.method.returnEarly(path)

        SaveToMediaStoreFingerprint.method.apply {
            val relativePath = "p${parameterTypes.size - 1}"
            if (parameterTypes.last() != "Ljava/lang/String;") throw PatchException("The photo saver takes no relative path last")

            addInstructions(
                0,
                """
                invoke-static/range { $relativePath .. $relativePath }, $DOWNLOADS_CLASS->remapRelativePath(Ljava/lang/String;)Ljava/lang/String;
                move-result-object $relativePath
                """,
            )
        }

        VideoDownloadRequestFingerprint.method.apply {
            val destination = instructions.firstOrNull { instruction ->
                instruction.getReference<MethodReference>()?.let {
                    it.definingClass == REQUEST && it.name == "setDestinationInExternalPublicDir"
                } == true
            } ?: throw PatchException("The video download request sets no public destination")
            val call = destination as FiveRegisterInstruction

            replaceInstruction(
                destination.location.index,
                "invoke-static { v${call.registerC}, v${call.registerD}, v${call.registerE} }, " +
                    "$DOWNLOADS_CLASS->setPublicDestination($REQUEST Ljava/lang/String;Ljava/lang/String;)$REQUEST",
            )
        }
    }
}
