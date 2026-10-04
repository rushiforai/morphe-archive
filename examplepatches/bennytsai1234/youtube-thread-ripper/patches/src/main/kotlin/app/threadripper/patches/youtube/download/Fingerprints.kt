package app.threadripper.patches.youtube.download

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * open(DataSpec) of the app's UMP media data source. It rewrites /videoplayback requests of
 * non-SABR streams to `&ump=1&range=start-end` and delegates to the media3 CronetDataSource.
 */
internal object UmpDataSourceOpenFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "J",
    parameters = listOf("L"),
    filters = listOf(
        string("/videoplayback"),
        string("ump"),
        string("range"),
    ),
)

/** read(byte[], int, int) of the same data source. */
internal object UmpDataSourceReadFingerprint : Fingerprint(
    classFingerprint = UmpDataSourceOpenFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "I",
    parameters = listOf("[B", "I", "I"),
)

/** close() of the same data source: the only no-argument void method that clears the opened flag. */
internal object UmpDataSourceCloseFingerprint : Fingerprint(
    classFingerprint = UmpDataSourceOpenFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(opcode = Opcode.IPUT_BOOLEAN, definingClass = "this"),
    ),
)
