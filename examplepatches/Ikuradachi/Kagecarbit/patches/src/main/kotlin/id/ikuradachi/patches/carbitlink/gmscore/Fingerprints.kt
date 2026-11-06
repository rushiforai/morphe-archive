package id.ikuradachi.patches.carbitlink.gmscore

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

object SignInModeFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL, AccessFlags.DECLARED_SYNCHRONIZED),
    parameters = emptyList(),
    returnType = "I",
    filters = listOf(
        methodCall(smali = "Lcom/google/android/gms/common/GoogleApiAvailability;->isGooglePlayServicesAvailable(Landroid/content/Context;I)I"),
        string("com.google.android.gms.auth.api.fallback"),
    ),
)

object SignInHubDispatchFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/auth/api/signin/internal/SignInHubActivity;",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
    parameters = listOf("Ljava/lang/String;"),
    returnType = "V",
    filters = listOf(
        string("com.google.android.gms.auth.GOOGLE_SIGN_IN"),
        string("com.google.android.gms"),
        methodCall(smali = "Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;"),
        string("config"),
        methodCall(smali = "Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;"),
        literal(40962),
    ),
)

object SignInServiceFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PROTECTED, AccessFlags.FINAL),
    parameters = emptyList(),
    returnType = "Ljava/lang/String;",
    filters = listOf(string("com.google.android.gms.auth.api.signin.service.START")),
)

object ServicePackageFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PROTECTED),
    parameters = emptyList(),
    returnType = "Ljava/lang/String;",
    filters = listOf(string("com.google.android.gms")),
)

object AvailabilityCacheFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Landroid/content/Context;", "L"),
    returnType = "I",
    filters = listOf(
        methodCall(smali = "Landroid/util/SparseIntArray;->size()I"),
        methodCall(smali = "Landroid/util/SparseIntArray;->keyAt(I)I"),
        methodCall(
            name = "isGooglePlayServicesAvailable",
            parameters = listOf("Landroid/content/Context;", "I"),
            returnType = "I",
        ),
        methodCall(smali = "Landroid/util/SparseIntArray;->put(II)V"),
    ),
)

object SignOutFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf("L", "Landroid/content/Context;", "Z"),
    returnType = "L",
    filters = listOf(string("Signing out")),
)
