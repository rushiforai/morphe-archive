/*
 * NothingX Morphe patches.
 * Licensed under CC0 1.0 Universal.
 */

package app.morphe.patches.nothingx.misc.logk1token

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * The application entry point of the Nothing X app.
 *
 * The K1 authentication token only exists in the app's own database and log files,
 * and the app writes those while it starts, so the token scan runs from here.
 *
 * Equivalent smali (verified against 3.8.0):
 *
 *     .method public onCreate()V
 */
internal object ApplicationOnCreateMethodFingerprint : Fingerprint(
    definingClass = "Lcom/nothing/base/view/BaseApplication;",
    name = "onCreate",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = emptyList(),
)

/**
 * The Android side of the flutter_secure_storage plugin, which writes a keychain value.
 *
 * On Nothing X 3.8.0 the K1 token lives in EncryptedSharedPreferences, so the file and
 * database scans find nothing. The plugin receives the plaintext value here, before it
 * encrypts and stores it.
 *
 * Equivalent smali (verified against 3.8.0):
 *
 *     .method public write(Ljava/lang/String;Ljava/lang/String;)V
 */
internal object FlutterSecureStorageWriteMethodFingerprint : Fingerprint(
    definingClass = "Lcom/it_nomads/fluttersecurestorage/FlutterSecureStorage;",
    name = "write",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;"),
)

/**
 * The Android side of the flutter_secure_storage plugin, which reads a keychain value.
 *
 * The plugin returns the decrypted value here, after it reads and decrypts the value
 * from EncryptedSharedPreferences.
 *
 * Equivalent smali (verified against 3.8.0):
 *
 *     .method public read(Ljava/lang/String;)Ljava/lang/String;
 */
internal object FlutterSecureStorageReadMethodFingerprint : Fingerprint(
    definingClass = "Lcom/it_nomads/fluttersecurestorage/FlutterSecureStorage;",
    name = "read",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Ljava/lang/String;",
    parameters = listOf("Ljava/lang/String;"),
)
