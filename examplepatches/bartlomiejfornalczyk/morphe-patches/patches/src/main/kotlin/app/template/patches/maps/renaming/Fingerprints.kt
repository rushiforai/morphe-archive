package app.template.patches.maps.renaming

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

internal object IdentityHeadersFingerprint : Fingerprint(
    name = "<init>",
    parameters = listOf("Landroid/app/Application;", "Ljava/util/concurrent/Executor;", "L", "L"),
    filters = listOf(
        string("X-Android-Package"),
        methodCall(opcode = Opcode.INVOKE_VIRTUAL, returnType = "Ljava/lang/String;", location = MatchAfterWithin(5)),
        string("X-Android-Cert"),
        methodCall(opcode = Opcode.INVOKE_VIRTUAL, returnType = "Ljava/lang/String;", location = MatchAfterWithin(5)),
    ),
)

internal object GetRemoteServiceFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("L", "Ljava/util/Set;"),
    filters = listOf(string("com.google.android.gms.common.internal.IGmsServiceBroker")),
)

internal object PlayServicesSignatureCheckFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("Landroid/content/pm/PackageInfo;", "Z"),
    filters = listOf(string("Unable to obtain package certificate history.")),
)

internal object PlayServicesAvailabilityFingerprint : Fingerprint(
    returnType = "I",
    parameters = listOf("Landroid/content/Context;", "I"),
    filters = listOf(string("com.google.android.gms.version")),
)

internal object ViewPropertyBinderFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        methodCall(definingClass = "Ljava/lang/Throwable;", name = "getCause"),
        string("property"),
        string("viewModel"),
    ),
    custom = { method, _ -> method.parameterTypes.size == 4 && method.parameterTypes[3] == "I" },
)

internal object ApiKeyReaderFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;"),
    filters = listOf(string("API key not found.  Check that <meta-data android:name=\"")),
)
