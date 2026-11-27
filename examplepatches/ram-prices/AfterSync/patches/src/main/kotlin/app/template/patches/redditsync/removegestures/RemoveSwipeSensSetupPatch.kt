package app.template.patches.redditsync.removegestures

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.redditsync.hidegestures.hideGesturesSettingsPatch
import app.template.patches.redditsync.removegestures.fingerprints.preferencesGeneralFragmentFingerprint
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * Target app: Sync for Reddit (com.laurencedawson.reddit_sync), v23.06.30-13:39.
 *
 * Confirmed via a real device crash log and the actual smali (via apktool):
 * the General-settings fragment's onCreatePreferences method looks up the
 * "swipe_sens" preference by key, then:
 *   1. Passes it to a private helper that (among other things) calls
 *      .getValue() directly on it with no null check, to set its summary
 *      text — this is the exact call that crashed with a
 *      NullPointerException once "swipe_sens" no longer existed in the XML.
 *   2. Immediately after, looks it up again and registers an
 *      OnPreferenceChangeListener on it — also with no null check, which
 *      would crash the same way even after fixing (1).
 *
 * "swipe_hide" and "swipe_dim" (the other two Gestures preferences) are
 * never referenced anywhere in this fragment, so they need no code changes
 * — only removeGesturesSettingsPatch's XML deletion applies to them.
 *
 * This patch removes both blocks of dead code (from the single
 * const-string "swipe_sens" instruction through to just before the method's
 * final return-void — that string is loaded once and its register reused
 * for both blocks, so there's exactly one instruction to anchor on). With
 * "swipe_sens" genuinely deleted from the XML by removeGesturesSettingsPatch,
 * this code would otherwise always crash the settings screen, so removing it
 * outright — rather than just null-guarding it — is both simpler and leaves
 * no dead/pointless preference lookups behind.
 *
 * This patch depends on removeGesturesSettingsPatch (the XML deletion) so
 * that selecting either one in Morphe Manager applies both together — using
 * only one half without the other would either leave the section visible
 * (bytecode-only) or crash (resource-only).
 */
val removeSwipeSensSetupPatch = bytecodePatch(
    name = "Remove Gestures settings",
    description = "Removes the \"Gestures\" section (Swipe to return, Dim behind activity, " +
        "Swipe to return sensitivity) from Sync for Reddit's General settings screen, " +
        "including the code that would otherwise crash the settings screen once those " +
        "preferences no longer exist. This is the bytecode fix \"Remove Gestures " +
        "settings (resources)\" needs to avoid a crash — select that patch too (or " +
        "select this one, which pulls it in automatically).",
) {
    dependsOn(hideGesturesSettingsPatch)

    compatibleWith("com.laurencedawson.reddit_sync"("v23.06.30-13:39"))

    execute {
        val method = preferencesGeneralFragmentFingerprint.method
        val implementation = method.implementation!!

        val swipeSensStringIndex = implementation.instructions.indexOfFirst { instruction ->
            instruction.opcode == Opcode.CONST_STRING &&
                ((instruction as? ReferenceInstruction)?.reference as? StringReference)
                    ?.string == "swipe_sens"
        }

        if (swipeSensStringIndex == -1) {
            error(
                "Could not find the \"swipe_sens\" setup code in the preferences " +
                    "fragment. This build's method structure may differ from what was " +
                    "inspected — re-check with apktool.",
            )
        }

        // Keep the method's final return-void in place; remove every
        // instruction between the swipe_sens lookup and it, one at a time
        // (removing at a fixed index repeatedly, since the list shifts down
        // after each removal — this avoids depending on a possibly
        // version-specific bulk-remove helper).
        val removeCount = implementation.instructions.size - 1 - swipeSensStringIndex
        repeat(removeCount) {
            implementation.removeInstruction(swipeSensStringIndex)
        }
    }
}
