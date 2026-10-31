package app.badfella.patches.ticktick.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.methodCall
import app.badfella.patches.ticktick.shared.Constants.COMPATIBILITY_TICKTICK

// TickTickApplicationBase.attachBaseContext — earliest app lifecycle hook, runs
// before Firebase initializes.
object ApplicationAttachBaseContextFingerprint : Fingerprint(
    definingClass = "Lcom/ticktick/task/TickTickApplicationBase;",
    name = "attachBaseContext",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)

private object FirebaseCertificateFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/installations/remote/FirebaseInstallationServiceClient;",
    name = "getFingerprintHashForPackage",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
    filters = listOf(
        methodCall(definingClass = "Lcom/google/android/gms/common/util/AndroidUtilsLight;", name = "getPackageCertificateHashBytes"),
    ),
)

@Suppress("unused")
val restorePushPatch = bytecodePatch(
    name = "Restore notifications",
    description = "Restores Firebase certificate metadata on re-signed apps, with an Android 17 compatible token setup. Push delivery still requires device testing."
) {
    compatibleWith(COMPATIBILITY_TICKTICK)
    extendWith("extensions/extension.mpe")

    execute {
        // Android 17 rejects the legacy PackageInfo.CREATOR write. Scope the FIS header to this SDK.
        FirebaseCertificateFingerprint.method.addInstructions(0, """
            const-string v0, "6711DE2604B48FC736CBB9E29B8EB834651605B3"
            return-object v0
        """)
        ApplicationAttachBaseContextFingerprint.method.addInstructions(0, """
            invoke-static {}, Lapp/badfella/extension/ticktick/PushSignatureSpoof;->spoof()V
        """)
    }
}
