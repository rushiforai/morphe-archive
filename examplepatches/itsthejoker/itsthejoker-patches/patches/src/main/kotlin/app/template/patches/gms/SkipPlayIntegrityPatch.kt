package app.template.patches.gms

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.template.patches.shared.Constants.COMPATIBILITY_ROOST
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Fixes the ~60s spin on every Firebase operation (login, leaderboard, ...) when running
 * under microG.
 *
 * Root cause: Roost gates backend calls on a Play Integrity attestation token via
 * `IntegrityManager.requestIntegrityToken(...)`:
 *  - Firebase Auth reCAPTCHA/Play Integrity ("finishing login"), and
 *  - Firebase App Check ("getAppCheckToken" before Cloud Functions / Firestore reads),
 *    which is awaited in the callable wrappers before every request.
 *
 * `IntegrityManager` binds to Google Play Services. Under microG (which has no Play
 * Integrity provider) that Task hangs until an internal ~60s timeout, then resolves to a
 * failure and the (non-enforced) call proceeds anyway.
 *
 * Fix: make every method that calls `requestIntegrityToken` return an already-failed Task
 * immediately, so attestation fails fast instead of hanging. The end-state (a failed
 * attestation token) is identical to today's post-timeout behavior — just instant.
 *
 * Keyed on the stable Play Integrity API (`IntegrityManager.requestIntegrityToken`) rather
 * than obfuscated class names, so it survives app updates.
 */
private const val INTEGRITY_MANAGER = "Lcom/google/android/play/core/integrity/IntegrityManager;"

@Suppress("unused")
val skipPlayIntegrityPatch = bytecodePatch(
    name = "Skip Play Integrity (fix microG Firebase delay)",
    description = "Makes Play Integrity attestation fail fast instead of hanging ~60s under " +
        "microG, removing the delay before Firebase logins, leaderboards, and other backend calls.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_ROOST)

    execute {
        // return Tasks.forException(new Exception("Play Integrity unavailable")) immediately.
        val failFast =
            """
                new-instance v0, Ljava/lang/Exception;
                const-string v1, "Play Integrity unavailable (microG)"
                invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V
                invoke-static {v0}, Lcom/google/android/gms/tasks/Tasks;->forException(Ljava/lang/Exception;)Lcom/google/android/gms/tasks/Task;
                move-result-object v0
                return-object v0
            """

        var patched = 0

        classDefForEach { classDef ->
            var mutableClass: MutableClass? = null

            classDef.methods.forEach classLoop@{ method ->
                val instructions = method.implementation?.instructions ?: return@classLoop

                val callsRequestIntegrityToken = instructions.any { instruction ->
                    val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    reference?.name == "requestIntegrityToken" &&
                        reference.definingClass == INTEGRITY_MANAGER
                }
                if (!callsRequestIntegrityToken) return@classLoop

                // These methods all return the requestIntegrityToken Task (return type Task/Object),
                // so returning a failed Task from the top is type-compatible.
                if (mutableClass == null) mutableClass = mutableClassDefBy(classDef)
                val mutableMethod = mutableClass!!.methods.first { candidate ->
                    candidate.name == method.name &&
                        candidate.returnType == method.returnType &&
                        candidate.parameterTypes.size == method.parameterTypes.size &&
                        candidate.parameterTypes.indices.all {
                            candidate.parameterTypes[it].toString() == method.parameterTypes[it].toString()
                        }
                }
                mutableMethod.addInstructions(0, failFast)
                patched++
            }
        }

        check(patched > 0) {
            "Skip Play Integrity: no IntegrityManager.requestIntegrityToken call sites found; " +
                "the Firebase attestation flow may have changed in this app version."
        }
    }
}
