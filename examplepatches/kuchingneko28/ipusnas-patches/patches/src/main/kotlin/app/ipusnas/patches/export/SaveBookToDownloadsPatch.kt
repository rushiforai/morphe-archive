package app.ipusnas.patches.export

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.ipusnas.patches.shared.Constants.COMPATIBILITY_IPUSNAS

private const val EXTENSION_CLASS = "Lapp/ipusnas/extension/patches/BookExporter;"

/**
 * Adds a "Simpan ke Unduhan" (Save to Downloads) entry to the book detail
 * overflow menu and exports the book to the public Downloads folder.
 *
 * How it works:
 *  1. {@code BookDetailAct.onCreateOptionsMenu} is patched to call
 *     {@code BookExporter.addExportMenuItem(activity, menu)}, which registers a
 *     menu item that requests an export and then triggers the app's own
 *     download flow ({@code BookDetailAct.O()}) for the currently shown book.
 *  2. {@code Liq.a} (the reader-intent builder) is patched to call
 *     {@code BookExporter.maybeExport(context, file, password, title)} right
 *     before the PDF/EPUB reader is launched. At that point BookLoadingAct has
 *     already downloaded and decrypted the book, so this hook has everything:
 *     the readable file, the decrypted book password (PDF only) used to unlock
 *     the PDF, and the book title for the filename.
 *
 * The file is written through MediaStore.Downloads so it works on scoped
 * storage (Android 10+) without any storage permissions. PDF files are
 * re-saved without the DRM password using the app's own Radaee PDF engine.
 */
@Suppress("unused")
val saveBookToDownloadsPatch = bytecodePatch(
    name = "Save book to Downloads",
    description = "Adds a menu option that downloads, decrypts, and saves the book as a readable PDF or EPUB in the public Downloads folder.",
) {
    compatibleWith(COMPATIBILITY_IPUSNAS)

    extendWith("extensions/extension.mpe")

    execute {
        // Add the menu item when the overflow menu is created.
        BookDetailActOnCreateOptionsMenuFingerprint.method.addInstruction(
            0,
            "invoke-static {p0, p1}, $EXTENSION_CLASS->addExportMenuItem(Landroid/app/Activity;Landroid/view/Menu;)V"
        )

        // Export the book right before the reader opens it. The reader-intent
        // builder receives the readable file, the password byte array (PDF),
        // and the BookModel; pass the title (from getBookTitle) to the extension.
        BookReaderIntentFingerprint.method.addInstructions(
            0,
            """
                invoke-virtual {p3}, Lcom/aksaramaya/ilibrarycore/model/BookModel;->getBookTitle()Ljava/lang/String;
                move-result-object v0
                invoke-static {p0, p1, p2, v0}, $EXTENSION_CLASS->maybeExport(Ljava/lang/Object;Ljava/io/File;[BLjava/lang/String;)V
            """
        )
    }
}
