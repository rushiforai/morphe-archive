package app.template.patches.redditsync.rebrandabout

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.redditsync.rebrandabout.fingerprints.aboutListenerFingerprint
import app.template.patches.redditsync.rebrandabout.fingerprints.backersListenerFingerprint
import app.template.patches.redditsync.rebrandabout.fingerprints.creditDevListenerFingerprint
import app.template.patches.redditsync.rebrandabout.fingerprints.licensesListenerFingerprint
import app.template.patches.redditsync.rebrandabout.fingerprints.preferencesOtherFragmentFingerprint
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * Target app: Sync for Reddit (com.laurencedawson.reddit_sync), v23.06.30-13:39.
 *
 * Bytecode half of rebrandAboutResourcesPatch. Confirmed by hand via apktool:
 * PreferencesOtherFragment's setup method (Lpa/w0;->C3) does findPreference()+setter
 * calls for every row in the About screen with no null checks — the same crash pattern
 * hit (and fixed) for the Gestures and Restore-purchases screens earlier. Three edits:
 *
 * 1. Removes the "feedback_preference" ("Help and support") and "rate_preference"
 *    ("Rate app!") lookup+click-listener blocks (6 instructions each), since both rows
 *    are deleted from cat_other.xml.
 * 2. Removes the entire mod-credits block: building a 7-entry username ArrayList,
 *    shuffling it, and looping to set "mod_0".."mod_6" (all deleted from cat_other.xml)
 *    by key. Anchored on the unique "/u/elchaghi" string and removed through to the
 *    method's final return-void (this block is the last thing the method does).
 * 3. Replaces the "about_preference" title computation (a StringBuilder concatenating
 *    "Sync for Reddit " + capitalize("free")) with a single "AfterSync" constant.
 *
 * 4. Replaces the "about_preference" summary (a hardcoded "v23.06.30-13:39 (23033)" —
 *    the ORIGINAL app's version) with a static AfterSync-patch version label, since
 *    that original-version text now lives on its own new row instead (see
 *    rebrandAboutResourcesPatch.kt). This label is a snapshot, not something computed
 *    live: this project's release version is decided by the CI release pipeline AFTER
 *    this code is written and committed, so whatever version string is hardcoded here
 *    will already be one version behind by the time it ships as that exact version.
 *    Getting this perfectly live would need the release pipeline restructured to inject
 *    the next version into source before this patch compiles — out of scope here.
 *
 * "credit_dev" and "backers" are NOT touched here — their XML entries are repurposed
 * (not deleted) by the resource patch, so their existing findPreference+listener wiring
 * in C3() stays intact and doesn't need editing. Only their listener bodies change:
 *
 * 5. Lpa/w0$f (credit_dev's listener) opens "/u/ljdawson" via Sync's general
 *    link-opening helper (Ly7/b;->b) — the URL string is swapped for the Morphe GitHub
 *    org, a single const-string replacement.
 * 6. Lpa/w0$b (about_preference's listener) opens an old dev release-notes Reddit
 *    thread — swapped for this repo's GitHub releases page.
 * 7. Lpa/w0$c (licenses_preference's listener) opened a dead/staging-looking domain
 *    that was never an actual license list — swapped for this repo's own LICENSE file.
 * 8. Lpa/w0$a (backers' listener) opened a Patreon-backers dialog — replaced with
 *    real link-opening logic (same Ly7/b;->b helper) pointing at this repo's GitHub
 *    page, mirroring credit_dev's listener shape.
 */
val rebrandAboutSetupPatch = bytecodePatch(
    name = "Rebrand About screen",
    description = "Renames \"Everything else\" to \"About\", removes \"Help and support\"" +
        "/\"Rate app!\"/the original Credits entries, adds a row for the original app's " +
        "version, and repurposes two Credits rows and their links for Morphe and this " +
        "patch repo's GitHub page in Sync for Reddit. This is the bytecode fix " +
        "\"Rebrand About screen (resources)\" needs to avoid a crash — select that " +
        "patch too (or select this one, which pulls it in automatically).",
    default = true,
) {
    dependsOn(rebrandAboutResourcesPatch)

    compatibleWith("com.laurencedawson.reddit_sync"("v23.06.30-13:39"))

    execute {
        val method = preferencesOtherFragmentFingerprint.method
        val implementation = method.implementation!!

        fun removeStringAnchoredBlock(literal: String, count: Int) {
            val index = implementation.instructions.indexOfFirst { instruction ->
                instruction.opcode == Opcode.CONST_STRING &&
                    ((instruction as? ReferenceInstruction)?.reference as? StringReference)
                        ?.string == literal
            }
            if (index == -1) {
                error(
                    "Could not find the \"$literal\" setup code in PreferencesOtherFragment. " +
                        "This build's method structure may differ from what was inspected " +
                        "— re-check with apktool.",
                )
            }
            repeat(count) { implementation.removeInstruction(index) }
        }

        // 1. "Help and support" and "Rate app!" lookup+listener blocks.
        removeStringAnchoredBlock("feedback_preference", 6)
        removeStringAnchoredBlock("rate_preference", 6)

        // 2. The entire mod-credits block, through the method's final return-void.
        val modBlockStart = implementation.instructions.indexOfFirst { instruction ->
            instruction.opcode == Opcode.CONST_STRING &&
                ((instruction as? ReferenceInstruction)?.reference as? StringReference)
                    ?.string == "/u/elchaghi"
        }
        if (modBlockStart == -1) {
            error(
                "Could not find the mod-credits setup code in PreferencesOtherFragment. " +
                    "This build's method structure may differ from what was inspected — " +
                    "re-check with apktool.",
            )
        }
        val modBlockCount = implementation.instructions.size - 1 - modBlockStart
        repeat(modBlockCount) { implementation.removeInstruction(modBlockStart) }

        // 3. Replace the "Sync for Reddit " + capitalize("free") title computation.
        val titleStringIndex = implementation.instructions.indexOfFirst { instruction ->
            instruction.opcode == Opcode.CONST_STRING &&
                ((instruction as? ReferenceInstruction)?.reference as? StringReference)
                    ?.string == "Sync for Reddit "
        }
        if (titleStringIndex == -1) {
            error(
                "Could not find the \"about_preference\" title setup code in " +
                    "PreferencesOtherFragment. This build's method structure may differ " +
                    "from what was inspected — re-check with apktool.",
            )
        }
        // 2 instructions before the string (new-instance StringBuilder, its <init>) plus
        // 7 after it (append, "free", capitalize, move-result-object, append, toString,
        // move-result-object) = 10 total, replaced with one constant.
        val titleBlockStart = titleStringIndex - 2
        repeat(10) { implementation.removeInstruction(titleBlockStart) }
        method.addInstructions(titleBlockStart, "const-string v0, \"AfterSync\"")

        // 4. Replace the about_preference summary (was the original app's version).
        fun replaceString(literal: String, replacement: String) {
            val index = implementation.instructions.indexOfFirst { instruction ->
                instruction.opcode == Opcode.CONST_STRING &&
                    ((instruction as? ReferenceInstruction)?.reference as? StringReference)
                        ?.string == literal
            }
            if (index == -1) {
                error(
                    "Could not find the \"$literal\" string in PreferencesOtherFragment. " +
                        "This build's method structure may differ from what was inspected " +
                        "— re-check with apktool.",
                )
            }
            implementation.removeInstruction(index)
            method.addInstructions(index, "const-string v0, \"$replacement\"")
        }
        replaceString("v23.06.30-13:39 (23033)", "AfterSync v1.6.0 — tap for release notes")

        // 5. credit_dev's listener: swap the linked URL.
        val creditDevMethod = creditDevListenerFingerprint.method
        val creditDevImpl = creditDevMethod.implementation!!
        val urlIndex = creditDevImpl.instructions.indexOfFirst { instruction ->
            instruction.opcode == Opcode.CONST_STRING &&
                ((instruction as? ReferenceInstruction)?.reference as? StringReference)
                    ?.string == "/u/ljdawson"
        }
        if (urlIndex == -1) {
            error("Could not find the \"/u/ljdawson\" URL in credit_dev's listener.")
        }
        creditDevImpl.removeInstruction(urlIndex)
        creditDevMethod.addInstructions(urlIndex, "const-string v0, \"https://github.com/morpheapp\"")

        // 6. about_preference's listener: swap the linked URL.
        val aboutMethod = aboutListenerFingerprint.method
        val aboutImpl = aboutMethod.implementation!!
        val releaseNotesIndex = aboutImpl.instructions.indexOfFirst { instruction ->
            instruction.opcode == Opcode.CONST_STRING &&
                ((instruction as? ReferenceInstruction)?.reference as? StringReference)
                    ?.string == "/r/redditsync/comments/11529s5"
        }
        if (releaseNotesIndex == -1) {
            error("Could not find the release-notes URL in about_preference's listener.")
        }
        aboutImpl.removeInstruction(releaseNotesIndex)
        aboutMethod.addInstructions(
            releaseNotesIndex,
            "const-string v0, \"https://github.com/ram-prices/AfterSync/releases\"",
        )

        // 7. licenses_preference's listener: swap the linked URL.
        val licensesMethod = licensesListenerFingerprint.method
        val licensesImpl = licensesMethod.implementation!!
        val licensesUrlIndex = licensesImpl.instructions.indexOfFirst { instruction ->
            instruction.opcode == Opcode.CONST_STRING &&
                ((instruction as? ReferenceInstruction)?.reference as? StringReference)
                    ?.string == "https://todo.syncforreddit.com/licenses.html"
        }
        if (licensesUrlIndex == -1) {
            error("Could not find the licenses URL in licenses_preference's listener.")
        }
        licensesImpl.removeInstruction(licensesUrlIndex)
        licensesMethod.addInstructions(
            licensesUrlIndex,
            "const-string v0, \"https://github.com/ram-prices/AfterSync/blob/main/LICENSE\"",
        )

        // 8. backers' listener: open this repo's GitHub page instead of a Patreon dialog.
        backersListenerFingerprint.method.addInstructions(
            0,
            """
                iget-object p1, p0, Lpa/w0${'$'}a;->a:Lpa/w0;
                invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->B0()Landroidx/fragment/app/FragmentActivity;
                move-result-object p1
                const-string v0, "https://github.com/ram-prices/AfterSync"
                invoke-static {p1, v0}, Ly7/b;->b(Landroid/content/Context;Ljava/lang/String;)Z
                const/4 p1, 0x1
                return p1
            """,
        )
    }
}
