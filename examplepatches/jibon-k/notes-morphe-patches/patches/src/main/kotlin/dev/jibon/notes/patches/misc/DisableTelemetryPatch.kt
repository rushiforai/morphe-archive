package dev.jibon.notes.patches.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.jibon.notes.patches.compat.elements
import dev.jibon.notes.patches.compat.frameworkCompatPatch
import dev.jibon.notes.patches.shared.Constants.COMPATIBILITY_NOTES
import dev.jibon.notes.patches.shared.hideDiagnosticsAgent
import dev.jibon.notes.patches.shared.muteFeatureSurveys

// Google Sign-In's screen and revocation service; Notes doesn't use them.
private val GOOGLE_COMPONENTS = setOf(
    "com.google.android.gms.auth.api.signin.internal.SignInHubActivity",
    "com.google.android.gms.auth.api.signin.RevocationBoundService",
)

private const val GOOGLE = "Lsamsungcompat/GoogleServices;"

// Telemetry and Google parts adapted from bearinmindcat/morphe-patches (GPLv3).

/** Samsung Analytics' "may the tracker send?" check, read before it starts and before every log. */
private object AnalyticsTrackerReadyFingerprint : Fingerprint(
    returnType = "Z",
    filters = listOf(string("Tracker is not initialized, status : ")),
)

/** Samsung Marketing Platform's upload of device, per-screen usage and marketing data. */
private object SmpClientsUploadFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    filters = listOf(string("device does not upload clients data")),
)

/** Notes' early sync start-up, which starts Firebase at every launch. */
private object SyncQuickInitFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    filters = listOf(string("[PUSH] fail to initialize the firebase : ")),
)

/** Samsung sync setting up its pushes (SMP over FCM) after sign-in. */
private object SmpInitFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    filters = listOf(string("[PUSH] initializeSmp() start")),
)

/** The Play Store review prompt after some launches. */
private object InAppReviewFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    filters = listOf(string("requestInAppReview# not enough conditions")),
)

/** Google Meet live sharing, checked when the notes list and the editor open. */
private object LiveSharingSupportedFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    custom = { method, classDef ->
        method.name == "isSupported" && classDef.type.endsWith("/livesharing/LiveSharingClientWrapper;")
    },
)

private val telemetryManifestPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            var disabled = 0
            (manifest.elements("service") + manifest.elements("activity")).forEach {
                if (it.getAttribute("android:name") in GOOGLE_COMPONENTS) {
                    it.setAttribute("android:enabled", "false")
                    disabled++
                }
            }
            if (disabled == 0) throw PatchException("No Google Sign-In components found in the manifest")
            // FCM no longer hands notifications to Play services.
            val application = manifest.elements("application").first()
            application.appendChild(document.createElement("meta-data").apply {
                setAttribute("android:name", "firebase_messaging_notification_delegation_enabled")
                setAttribute("android:value", "false")
            })
        }
    }
}

@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Turn off telemetry",
    description = "Turns off Samsung Analytics, crash reports, usage surveys and marketing uploads, the Play review " +
        "prompt, Google Meet sharing and Google Sign-In, and starts Firebase only if Samsung sync uses it.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_NOTES)
    dependsOn(frameworkCompatPatch, telemetryManifestPatch)

    execute {
        // Samsung Analytics: the tracker is never ready, so it neither starts nor sends.
        AnalyticsTrackerReadyFingerprint.method.addInstructions(0, "const/4 v0, 0x0\nreturn v0")

        // DiagMon crash, ANR and performance reports (3 lookups in 4.4.48.15).
        val lookups = hideDiagnosticsAgent()
        if (lookups < 2) throw PatchException("Only $lookups diagnostics agent lookups found")

        // Feature-usage surveys from handwriting, S Pen SDK and multi-window (7 senders in 4.4.48.15).
        val surveys = muteFeatureSurveys()
        if (surveys < 3) throw PatchException("Only $surveys feature survey senders found")

        // SMP runs as plain push, as on non-Samsung phones: nothing is uploaded, no marketing.
        val upload = SmpClientsUploadFingerprint.method
        val check = upload.implementation!!.instructions.firstNotNullOfOrNull { insn ->
            ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.takeIf {
                insn.opcode == Opcode.INVOKE_STATIC && it.returnType == "Z" &&
                    it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Context;")
            }
        } ?: throw PatchException("SMP's plain push check not found")
        mutableClassDefBy(check.definingClass).methods.single {
            it.name == check.name && it.returnType == "Z" &&
                it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Context;")
        }.addInstructions(0, "const/4 v0, 0x1\nreturn v0")

        // Firebase at start-up only once Samsung sync uses it ...
        SyncQuickInitFingerprint.method.apply {
            val instructions = implementation!!.instructions
            val index = instructions.indexOfFirst {
                it.opcode == Opcode.INVOKE_STATIC && ((it as ReferenceInstruction).reference as MethodReference).let { r ->
                    r.definingClass == "Lcom/google/firebase/FirebaseApp;" && r.name == "initializeApp" &&
                        r.parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Context;")
                }
            }
            if (index < 0) throw PatchException("Firebase start-up not found")
            if (instructions[index + 1].opcode == Opcode.MOVE_RESULT_OBJECT) {
                throw PatchException("Firebase start-up result is used")
            }
            val context = (instructions[index] as FiveRegisterInstruction).registerC
            replaceInstruction(index, "invoke-static { v$context }, $GOOGLE->firebaseAtStart(Landroid/content/Context;)V")
        }
        // ... and when sync sets up its pushes.
        SmpInitFingerprint.method.addInstructions(0, "invoke-static { p1 }, $GOOGLE->firebase(Landroid/content/Context;)V")

        InAppReviewFingerprint.method.addInstructions(0, "return-void")
        LiveSharingSupportedFingerprint.method.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
    }
}
