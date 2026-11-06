package app.ipusnas.patches.export

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Fingerprints for the "Save book to Downloads" feature.
 *
 * 2.1.4 (versionCode 210000020) targets were verified originally. In 2.1.6
 * (versionCode 210000027) the reader-intent builder moved from Liq; to Llq;
 * and BookModel moved to the mam.reader.ilibrary.core.model package.
 */
object BookDetailActOnCreateOptionsMenuFingerprint : Fingerprint(
    definingClass = "Lmam/reader/ilibrary/book/BookDetailAct;",
    name = "onCreateOptionsMenu",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf("Landroid/view/Menu;"),
)

/**
 * BookLoadingAct builds the reader Intent here right before launching the
 * PDF/EPUB reader. The method receives the readable book file, the decrypted
 * book password (PDF only) and the BookModel — everything the export feature
 * needs (file, password to unlock the PDF, and the title for the filename).
 *
 * Signature: static a(Object, File, byte[], BookModel, String): Intent
 */
object BookReaderIntentFingerprint : Fingerprint(
    definingClass = "Liq;",
    name = "a",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Landroid/content/Intent;",
    parameters = listOf(
        "Ljava/lang/Object;",
        "Ljava/io/File;",
        "[B",
        "Lcom/aksaramaya/ilibrarycore/model/BookModel;",
        "Ljava/lang/String;",
    ),
)

/**
 * 2.1.6: the reader-intent builder is now Llq;->a (the old Liq class was
 * reused for a RecyclerView adapter). The BookModel parameter type moved to
 * Lmam/reader/ilibrary/core/model/BookModel;. Body verified to call
 * BookModel.getBookTitle() on p3 and to build the reader Intent.
 *
 * Signature: static a(Object, File, byte[], BookModel, String): Intent
 */
object BookReaderIntentFingerprintV216 : Fingerprint(
    definingClass = "Llq;",
    name = "a",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Landroid/content/Intent;",
    parameters = listOf(
        "Ljava/lang/Object;",
        "Ljava/io/File;",
        "[B",
        "Lmam/reader/ilibrary/core/model/BookModel;",
        "Ljava/lang/String;",
    ),
)
