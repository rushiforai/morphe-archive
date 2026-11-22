package app.rimixyz.patches.seventrack

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Firebase Installation Service reads the app signing certificate SHA-1 and
 * sends it as the X-Android-Cert header. After Morphe re-signs the APK, the
 * hash changes and Firebase Auth (Google Sign-In) starts failing.
 *
 * Ported from rushiranpise/morphe-patches (Universal / Fix Firebase after re-signing).
 */
internal object FirebaseFingerprintHashFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/installations/remote/FirebaseInstallationServiceClient;",
    name = "getFingerprintHashForPackage",
    returnType = "Ljava/lang/String;",
    accessFlags = listOf(AccessFlags.PRIVATE),
    parameters = listOf(),
)

internal object FirebaseOpenHttpConnectionFingerprint : Fingerprint(
    returnType = "Ljava/net/HttpURLConnection;",
    parameters = listOf("Ljava/net/URL;", "Ljava/lang/String;"),
    filters = listOf(
        string("X-Android-Cert"),
        methodCall(name = "addRequestProperty"),
    ),
)
