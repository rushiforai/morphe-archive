package app.template.patches.fotmob.misc.gms

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

// The launch activity (the target of the MAIN/LAUNCHER alias and every app-icon alias). Its class
// is declared in the manifest, so R8 keeps the name; onCreate(Bundle) is a framework override.
// Until 238 the launcher was a MainActivityWrapper class; 239 removed it and made
// .ui.MainActivityWrapper an activity-alias of MainActivity.
internal object MainActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/fotmob/android/ui/MainActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

// androidx.credentials' NoCredentialException(CharSequence) (R8-renamed): the only constructor
// that passes the framework's TYPE_NO_CREDENTIAL type string to its GetCredentialException
// superclass. That string is a library constant mirroring android.credentials.
internal object NoCredentialExceptionConstructorFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    returnType = "V",
    parameters = listOf("Ljava/lang/CharSequence;"),
    strings = listOf(
        string("android.credentials.GetCredentialException.TYPE_NO_CREDENTIAL", StringComparisonType.CONTAINS),
    ),
)

private const val AUTO_SIGN_IN_DISMISSED_LOG = "User seemingly dismissed the automatic Google sign-in prompt"

// invokeSuspend(result) of the OnboardingStartActivity coroutine that tries the automatic Google
// sign-in (GetGoogleIdOption, filterByAuthorizedAccounts = true) at first start. R8 merges it
// with other lambdas into one switch method, so it is found by its two log lines: the
// NoCredentialException handler's and the user-cancelled handler's (in any order; the prefixes
// only, so a reworded tail does not break it).
internal object OnboardingAutoSignInFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(
        string("Did not find any existing Google accounts already used for logging", StringComparisonType.STARTS_WITH),
    ),
    custom = { method, _ ->
        method.implementation?.instructions?.any { instruction ->
            ((instruction as? ReferenceInstruction)?.reference as? StringReference)
                ?.string?.startsWith(AUTO_SIGN_IN_DISMISSED_LOG) == true
        } == true
    },
)
