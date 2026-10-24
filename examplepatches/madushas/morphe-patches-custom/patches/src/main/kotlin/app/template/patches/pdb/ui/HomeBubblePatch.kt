package app.template.patches.pdb.ui

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.PDB_COMPATIBILITY

private const val EXT_PREFIX = "Lapp/template/extension/pdb/"

/**
 * `pdb.app.HomeActivity.onCreate(Bundle)` — a kept class, so the anchor is the
 * declared type itself (no obfuscated-name lookup).
 */
val HomeActivityOnCreateFingerprint = Fingerprint(
    definingClass = "Lpdb/app/HomeActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

/**
 * `pdb.app.base.ui.BaseActivity.onCreate(Bundle)` — the kept base of almost every
 * Pdb screen. Hooking it puts the bubble on the whole app, not just Home.
 */
val BaseActivityOnCreateFingerprint = Fingerprint(
    definingClass = "Lpdb/app/base/ui/BaseActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

/**
 * "Floating power button" — injects a draggable quick-actions bubble into
 * Pdb's main window, giving one-tap access to the everyday switches (profile
 * IDs, receipts, pause), the signed-in profile id and the Extras screen from
 * anywhere in the app.
 *
 * The bubble lives in the extension ([PdbBubble.onHomeCreated]); this patch only
 * wires the call at the top of `HomeActivity.onCreate` — the bubble attaches
 * itself to the content view a moment later and removes itself entirely when
 * the `morphe_bubble` switch is off.
 */
@Suppress("unused")
val pdbHomeBubblePatch = bytecodePatch(
    name = "Floating power button",
    description = "Adds a draggable quick-actions bubble to the main screen " +
        "(profile IDs / receipts / pause toggles, copy your profile id, open " +
        "Pdb Extras). Toggle: Pdb Extras → Quick → 'Show floating power button'.",
    default = true,
) {
    compatibleWith(PDB_COMPATIBILITY)

    execute {
        val onCreate = HomeActivityOnCreateFingerprint.method
            ?: throw IllegalStateException("pdb.app.HomeActivity.onCreate not found")

        // p0 is valid in every frame (parameter registers sit at the top of the
        // locals window), so a plain invoke-static with p0 is frame-safe.
        onCreate.addInstruction(
            0,
            "invoke-static {p0}, ${EXT_PREFIX}PdbBubble;->onHomeCreated(Landroid/app/Activity;)V",
        )

        // Every other screen: BaseActivity is the shared base class. The bubble tags
        // itself, so Home (which fires both hooks) still gets exactly one.
        val baseOnCreate = BaseActivityOnCreateFingerprint.method
            ?: throw IllegalStateException("pdb.app.base.ui.BaseActivity.onCreate not found")
        baseOnCreate.addInstruction(
            0,
            "invoke-static {p0}, ${EXT_PREFIX}PdbBubble;->onActivityCreated(Landroid/app/Activity;)V",
        )
    }
}
