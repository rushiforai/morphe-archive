package app.lchanc3.patches.jptt.license

import app.lchanc3.patches.jptt.shared.Constants.COMPATIBILITY_JPTT
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val disableLicenseCheckPatch = bytecodePatch(
    name = "Disable Play license check",
    description = "Disables the Play Store license check, which a patched app always fails " +
        "and which closes the app on launch. Needed by every patched build.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_JPTT)

    execute {
        // The check never starts, so nothing downstream of it runs: no Play
        // binding, no repeated checks, no dialog, no System.exit(0).
        silence(InitializeLicenseCheckFingerprint)
            ?: throw PatchException(
                "$LICENSE_CLIENT_CLASS->initializeLicenseCheck() is gone. PairIP has " +
                    "changed how the license check starts and this patch needs updating.",
            )

        // What a failed check does, silenced as well. These are what the user
        // actually sees, so if PairIP ever reaches them by a route this patch does
        // not know about, the app keeps running rather than closing itself.
        silence(StartErrorDialogActivityFingerprint)
            ?: throw PatchException(
                "$LICENSE_CLIENT_CLASS->startErrorDialogActivity() is gone, so the " +
                    "\"Something went wrong\" dialog can no longer be stopped.",
            )

        // Best effort: nothing reaches these once the check does not start, and a
        // future PairIP that drops one should not fail the whole patch.
        silence(ScheduleAppShutdownFingerprint)
        silence(ScheduleRepeatedLicenseCheckFingerprint)
        silence(StartPaywallActivityFingerprint)
    }
}

/** Turns the method into a no-op, or returns null when it is not in this build. */
private fun app.morphe.patcher.patch.BytecodePatchContext.silence(fingerprint: Fingerprint): Unit? =
    fingerprint.matchOrNull()?.method?.addInstruction(0, "return-void")
