package app.template.patches.redditsync.cleanuprootmenu

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.redditsync.removerestorepurchases.fingerprints.preferencesNewRootFragmentFingerprint
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction

/**
 * Target app: Sync for Reddit (com.laurencedawson.reddit_sync), v23.06.30-13:39.
 *
 * Confirmed via a real device crash log: removing "Developer options" in
 * cleanupRootMenuResourcesPatch triggered the same crash pattern already fixed once for
 * "Restore purchases" — PreferencesNewRootFragment (Lpa/u0;->C3) has a separate,
 * earlier force-visibility block for "Developer options" that force-shows the
 * preference for a hardcoded ~9-username allowlist of testers, with no null check.
 *
 * A first attempt at this fix (v1.7.1) removed the entire 43-instruction block
 * outright — the same technique already used for @integer/PURCHASES in this method —
 * but that crashed differently: ART's verifier rejected the whole class with a
 * VerifyError ("register v2 has type Undefined but expected Boolean"), confirmed via
 * a second real device crash log, and reverted in v1.7.2.
 *
 * Root cause, confirmed by hand via apktool: this block's array-index setup contains
 * `const/4 v2, 0x0` (building index 0 of the tester-username array) — and R8 reused
 * that same register, rather than emitting a fresh constant, as the literal "false"
 * argument for THREE separate, unrelated setVisible(Z) calls later in the same
 * method: the unconditional WEB_PREFERENCES and MESSAGING force-hide calls, and the
 * conditional ULTRA one. Deleting the whole block deleted the only place v2 is ever
 * defined, leaving those three later reads of it undefined.
 *
 * This version keeps that one instruction standing alone (removing the 14
 * instructions before it and the 28 after it, rather than all 43 as one block) so
 * v2 stays defined for the later reads, while everything else about the
 * "Developer options" lookup+comparison+setVisible call is still removed.
 *
 * Depends on cleanupRootMenuResourcesPatch (the XML deletion) so selecting either one in
 * Morphe Manager applies both together.
 */
val cleanupRootMenuSetupPatch = bytecodePatch(
    name = "Clean up root settings menu",
    description = "Removes the dead \"Developer options\" visibility-check code left " +
        "behind after removing it from Sync for Reddit's settings menu. This is the " +
        "bytecode fix \"Clean up root settings menu (resources)\" needs to avoid a crash " +
        "— select that patch too (or select this one, which pulls it in automatically).",
    default = true,
) {
    dependsOn(cleanupRootMenuResourcesPatch)

    compatibleWith("com.laurencedawson.reddit_sync"("v23.06.30-13:39"))

    execute {
        val method = preferencesNewRootFragmentFingerprint.method
        val implementation = method.implementation!!

        val devOptionsIndex = implementation.instructions.indexOfFirst { instruction ->
            instruction.opcode == Opcode.CONST &&
                (instruction as? NarrowLiteralInstruction)?.narrowLiteral == 0x7f0a0009
        }

        if (devOptionsIndex == -1) {
            error(
                "Could not find the \"Developer options\" force-visibility setup code in " +
                    "the root preferences fragment. This build's method structure may " +
                    "differ from what was inspected — re-check with apktool.",
            )
        }

        // Instructions 1-14 relative to the @integer/DEVELOPER_OPTIONS load: resolve
        // the id, convert to a key string, look up the preference, and start building
        // the tester-username array up to (but not including) its first element.
        repeat(14) { implementation.removeInstruction(devOptionsIndex) }

        // Instruction 15 (now sitting at devOptionsIndex after the removal above) is
        // "const/4 v2, 0x0" — kept standing alone. See the class doc for why.

        // Instructions 16-43 (now at devOptionsIndex + 1): the rest of the array
        // build, the tester-username comparison, and the setVisible(...) call using
        // its result.
        repeat(28) { implementation.removeInstruction(devOptionsIndex + 1) }
    }
}
