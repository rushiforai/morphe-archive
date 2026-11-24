package app.morphe.patches.kicktv.maturewarning

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.morphe.patches.kicktv.KICK_TV
import app.morphe.patches.kicktv.settings.settingsPatch

private const val EXTENSION_CLASS = "Lapp/morphe/extension/kicktv/maturewarning/"

/**
 * Mature content warning dialog composable. Its two `Function0` parameters are
 * the "Cancel" and "Start watching" callbacks; KICK renders it only while the
 * player is in the `MatureDialog` state (before playback starts).
 *
 * The patch asks the preference helper whether the dialog should be skipped
 * and, when it should, the helper posts the "Start watching" callback to the
 * main looper so playback starts without user input.
 */
private object MatureDialogFingerprint : Fingerprint(
    definingClass = "Lsz6;",
    name = "i",
    parameters = listOf(
        "Lkotlin/jvm/functions/Function0;",
        "Lkotlin/jvm/functions/Function0;",
        "Lp73;",
        "I",
    ),
    returnType = "V",
)

/**
 * SKIP 18+ WARNING tweak. Accepts the mature content warning automatically so
 * a mature stream starts right away. The toggle lives in the SEYTTINGS menu
 * provided by the base patch this patch depends on.
 */
@Suppress("unused")
val matureWarningPatch = patch(
    name = "SKIP 18+ WARNING",
    description = "Automatically accepts the 18+ mature content warning when a " +
        "stream opens, so the player starts without the extra click. Toggle it " +
        "in SEYTTINGS. Requires the SEYTTINGS patch.",
    default = true,
) {
    compatibleWith(KICK_TV)

    dependsOn(settingsPatch)

    extendWith("extensions/KickMatureWarning.mpe")

    execute {
        MatureDialogFingerprint.apply {
            method.addInstructions(
                0,
                """
                    invoke-static {p1}, ${EXTENSION_CLASS}MatureWarningPrefs;->autoAccept(Lkotlin/jvm/functions/Function0;)Z
                    move-result v0
                    if-eqz v0, :morphe_mature_continue
                    return-void
                    :morphe_mature_continue
                """,
            )
        }
    }
}
