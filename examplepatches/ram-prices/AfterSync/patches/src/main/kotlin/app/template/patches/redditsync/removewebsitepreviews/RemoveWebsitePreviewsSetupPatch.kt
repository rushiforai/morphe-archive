package app.template.patches.redditsync.removewebsitepreviews

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.redditsync.removerestorepurchases.fingerprints.preferencesUltraFragmentFingerprint
import app.template.patches.redditsync.removewebsitepreviews.fingerprints.websitePreviewHelperFingerprint
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * Target app: Sync for Reddit (com.laurencedawson.reddit_sync), v23.06.30-13:39.
 *
 * Two edits, per explicit request that "Website previews" doesn't work well:
 *
 * 1. PreferencesUltraFragment's setup method (Lpa/l1;->s4, already patched elsewhere
 *    in this project for the Restore-purchases removal) looks up the "ultra_enhancements"
 *    category by key and force-sets its visibility, with no null check. Confirmed by
 *    hand via apktool: this 4-instruction block ("ultra_enhancements" const-string,
 *    findPreference, move-result-object, setVisible call) is the only reference to
 *    that key in this fragment. Removed the same way as the earlier UltraRestore/
 *    UltraReset fix in this same method.
 * 2. Lwc/q;->a(Ljava/lang/String;)Z (WebsitePreviewHelper's eligibility gate) is
 *    forced to always return false — matching this project's proven "prepend early
 *    return, leave dead code after it" pattern — so the feature is fully disabled
 *    regardless of any previously-stored preference value, not just hidden from the UI.
 *
 * Depends on removeWebsitePreviewsResourcesPatch (the XML deletion) so selecting
 * either one in Morphe Manager applies both together.
 */
val removeWebsitePreviewsSetupPatch = bytecodePatch(
    name = "Remove Website previews",
    description = "Removes the \"Website previews\" toggle from Sync for Reddit's Sync " +
        "Ultra screen and disables the underlying feature. This is the bytecode fix " +
        "\"Remove Website previews (resources)\" needs to avoid a crash — select that " +
        "patch too (or select this one, which pulls it in automatically).",
    default = true,
) {
    dependsOn(removeWebsitePreviewsResourcesPatch)

    compatibleWith("com.laurencedawson.reddit_sync"("v23.06.30-13:39"))

    execute {
        val ultraMethod = preferencesUltraFragmentFingerprint.method
        val ultraImpl = ultraMethod.implementation!!

        val enhancementsIndex = ultraImpl.instructions.indexOfFirst { instruction ->
            instruction.opcode == Opcode.CONST_STRING &&
                ((instruction as? ReferenceInstruction)?.reference as? StringReference)
                    ?.string == "ultra_enhancements"
        }

        if (enhancementsIndex == -1) {
            error(
                "Could not find the \"ultra_enhancements\" force-visibility setup code " +
                    "in the Ultra preferences fragment. This build's method structure " +
                    "may differ from what was inspected — re-check with apktool.",
            )
        }

        // 4 instructions: the "ultra_enhancements" lookup, its findPreference call,
        // and the setVisible(...) call using the (now null once the category is
        // deleted) result.
        repeat(4) { ultraImpl.removeInstruction(enhancementsIndex) }

        websitePreviewHelperFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )
    }
}
