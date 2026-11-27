package app.template.patches.redditsync.removerestorepurchases

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.redditsync.removerestorepurchases.fingerprints.preferencesNewRootFragmentFingerprint
import app.template.patches.redditsync.removerestorepurchases.fingerprints.preferencesUltraFragmentFingerprint
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

/**
 * Target app: Sync for Reddit (com.laurencedawson.reddit_sync), v23.06.30-13:39.
 *
 * Confirmed via a real device crash log and the actual smali (via apktool): the root
 * settings fragment's onCreatePreferences-equivalent method looks up the preference
 * whose key is the string form of @integer/PURCHASES (the "Restore purchases" entry)
 * and force-sets its visibility to true with no null check:
 *
 *   const p1, 0x7f0a0016                                 ; @integer/PURCHASES
 *   invoke-static {p1}, RedditApplication;->g(I)I         ; resolve to its int value
 *   move-result p1
 *   invoke-static {p1}, Integer;->toString(I)Ljava/lang/String;
 *   move-result-object p1
 *   invoke-virtual {p0, p1}, PreferenceFragmentCompat;->findPreference(...)Preference;
 *   move-result-object p1
 *   invoke-virtual {p1, v3}, Preference;->setVisible(Z)V     ; NPEs: p1 is null
 *
 * Once removeRestorePurchasesResourcesPatch deletes that entry, this crashes the
 * settings screen every time it's opened. This patch removes those 8 instructions
 * (found by their unique "const p1, 0x7f0a0016" anchor) outright, mirroring
 * removeSwipeSensSetupPatch's fix for the same pattern.
 *
 * The Sync Ultra screen has the exact same problem for the two buttons removed from
 * cat_ultra.xml: PreferencesUltraFragment's own setup method (s4()) looks up
 * UltraResetPreference and UltraRestorePreference (by their own class-simple-name
 * static field, used as an implicit key) and force-sets their visibility, with no
 * null check — confirmed via a second real crash log. Both lookups are removed the
 * same way (9 consecutive instructions: two back-to-back sget-object/findPreference/
 * setVisible blocks sharing no state with the rest of the method).
 *
 * Depends on removeRestorePurchasesResourcesPatch (the XML deletion) so selecting
 * either one in Morphe Manager applies both together.
 */
val removeRestorePurchasesPatch = bytecodePatch(
    name = "Remove Restore purchases",
    description = "Removes the \"Restore purchases\" entry from Sync for Reddit's settings, " +
        "plus the Sync Ultra screen's \"Restore subscription\" and dev-only \"Reset " +
        "subscription locally\" buttons, now that Ultra and ad removal are unlocked " +
        "unconditionally and don't depend on this state. This is the bytecode fix " +
        "\"Remove Restore purchases (resources)\" needs to avoid a crash — select " +
        "that patch too (or select this one, which pulls it in automatically).",
    default = true,
) {
    dependsOn(removeRestorePurchasesResourcesPatch)

    compatibleWith("com.laurencedawson.reddit_sync"("v23.06.30-13:39"))

    execute {
        val method = preferencesNewRootFragmentFingerprint.method
        val implementation = method.implementation!!

        val purchasesIntegerIndex = implementation.instructions.indexOfFirst { instruction ->
            instruction.opcode == Opcode.CONST &&
                (instruction as? NarrowLiteralInstruction)?.narrowLiteral == 0x7f0a0016
        }

        if (purchasesIntegerIndex == -1) {
            error(
                "Could not find the \"Restore purchases\" force-visibility setup code in " +
                    "the root preferences fragment. This build's method structure may " +
                    "differ from what was inspected — re-check with apktool.",
            )
        }

        // The block is exactly 8 instructions: load the @integer/PURCHASES id, resolve
        // it, convert to a key string, look up the preference, and call setVisible(true)
        // on the (now null) result.
        repeat(8) {
            implementation.removeInstruction(purchasesIntegerIndex)
        }

        val ultraMethod = preferencesUltraFragmentFingerprint.method
        val ultraImplementation = ultraMethod.implementation!!

        val ultraResetFieldIndex = ultraImplementation.instructions.indexOfFirst { instruction ->
            instruction.opcode == Opcode.SGET_OBJECT &&
                ((instruction as? ReferenceInstruction)?.reference as? FieldReference)?.let {
                    it.definingClass ==
                        "Lcom/laurencedawson/reddit_sync/ui/preferences/custom/ultra/UltraResetPreference;" &&
                        it.name == "d0"
                } == true
        }

        if (ultraResetFieldIndex == -1) {
            error(
                "Could not find the UltraResetPreference/UltraRestorePreference " +
                    "force-visibility setup code in the Ultra preferences fragment. This " +
                    "build's method structure may differ from what was inspected — " +
                    "re-check with apktool.",
            )
        }

        // 9 consecutive instructions: the UltraResetPreference lookup+setVisible (4
        // instructions), immediately followed by the UltraRestorePreference lookup+xor+
        // setVisible (5 instructions).
        repeat(9) {
            ultraImplementation.removeInstruction(ultraResetFieldIndex)
        }
    }
}
