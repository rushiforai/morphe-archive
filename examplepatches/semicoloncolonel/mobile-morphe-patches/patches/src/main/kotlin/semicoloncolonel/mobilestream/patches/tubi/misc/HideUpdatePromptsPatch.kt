package semicoloncolonel.mobilestream.patches.tubi.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.tubi.shared.Constants

// ─────────────────────────────────────────────────────────────────────────────
// Hide update prompts.
//
// Tubi asks you to update when its server marks your version as old (a "soft"
// or "hard" upgrade range in its Statsig config) or when Google Play reports
// a newer version. A patched copy cannot be updated through Play, and the
// Android TV build 10.44.5001 asks even when it is current.
//
// The update handler (R8-renamed; gzj in 10.44.x) decides in one method what
// the launch screen does next: it takes the hard-update action, the
// soft-update action, and the "no update" action, and runs one. It now always
// runs "no update". The method that opens the update dialog returns at once,
// for the reminders shown later in the session.
// ─────────────────────────────────────────────────────────────────────────────

private const val TUBI_ACTION = "Lcom/tubitv/core/app/TubiAction;"

internal object UpdateRouteFingerprint : Fingerprint(
    parameters = listOf(TUBI_ACTION, "Lcom/tubitv/core/app/TubiConsumer;", TUBI_ACTION),
    returnType = "V",
    custom = { _, classDef ->
        classDef.interfaces.contains("Lcom/google/android/play/core/install/InstallStateUpdatedListener;")
    },
)

@Suppress("unused")
val hideUpdatePromptsPatch = bytecodePatch(
    name = "Hide update prompts",
    description = "Stops the app from asking you to update. A patched app cannot be updated through Google Play.",
) {
    category("Interface")
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        // route(hard p1, soft p2, none p3): run "none".
        UpdateRouteFingerprint.method.addInstructions(
            0,
            """
                invoke-interface { p3 }, $TUBI_ACTION->run()V
                return-void
            """,
        )

        // The dialog method: no parameters, returns void, and is the only
        // one in the handler that puts the dialog's "arguments".
        val handler = UpdateRouteFingerprint.classDef
        val dialog = handler.methods.firstOrNull { method ->
            method.parameterTypes.isEmpty() && method.returnType == "V" &&
                method.implementation?.instructions?.any {
                    (it as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)
                        ?.reference?.toString() == "arguments"
                } == true
        } ?: throw PatchException("No update dialog method in ${handler.type}")
        mutableClassDefBy(handler.type).methods.first { it.name == dialog.name && it.parameterTypes.isEmpty() }
            .addInstructions(0, "return-void")
    }
}
