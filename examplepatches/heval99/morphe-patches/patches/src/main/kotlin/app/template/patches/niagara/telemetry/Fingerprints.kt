package app.template.patches.niagara.telemetry

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

internal const val CRASHLYTICS_USER_ID_KEY = "bitpit.launcher.key.CRASHLYTICS_USER_ID"
private const val CRASHLYTICS_MISSING = "FirebaseCrashlytics component is not present."

// androidx.work's ListenableWorker.Result.Success is R8-renamed; its toString keeps the library's
// "Success {mOutputData=" text. Its superclass (Result) holds the static no-arg success().
internal object WorkResultSuccessToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("Success {mOutputData="),
)

// kotlin.Unit is R8-renamed too; its toString still returns "kotlin.Unit".
internal object KotlinUnitToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("kotlin.Unit"),
)

// The app's Singular request sender (1.16.33: WV8W08ktKKuN.WqxyQgVmx7), a suspend
// (String, request, KSerializer, continuation) method that builds the "attribution" URL path,
// adds the consent context and posts the request. Every Singular session and event goes through it.
internal object SingularRequestFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/String;", "L", "Lkotlinx/serialization/KSerializer;", "L"),
    strings = listOf("attribution"),
)

// The app's Crashlytics switch (1.16.33: qUrXJfX1mDiai1zbQPW3Mo, whose constructor fails with
// "FirebaseCrashlytics component is not present."). Its enable method turns collection on, then
// stores a fresh UUID as the Crashlytics user id; the disable twin removes the key instead.
internal object CrashlyticsEnableFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        methodCall(definingClass = "Ljava/util/UUID;", name = "randomUUID"),
        string(CRASHLYTICS_USER_ID_KEY),
        methodCall(definingClass = "Landroid/content/SharedPreferences\$Editor;", name = "putString"),
    ),
    custom = { _, classDef ->
        classDef.methods.any { method ->
            method.name == "<init>" && method.implementation?.instructions?.any {
                ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == CRASHLYTICS_MISSING
            } == true
        }
    },
)
