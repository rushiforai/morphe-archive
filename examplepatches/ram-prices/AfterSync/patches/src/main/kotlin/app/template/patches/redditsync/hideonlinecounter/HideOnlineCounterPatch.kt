package app.template.patches.redditsync.hideonlinecounter

import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.redditsync.hideonlinecounter.fingerprints.largeToolbarDescriptionSetCountsFingerprint
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * Target app: Sync for Reddit (com.laurencedawson.reddit_sync), v23.06.30-13:39.
 *
 * Hides the "number of users online" count on a subreddit's info screen, which always
 * shows 0 (a separate bug report — see project chat history for the full investigation).
 *
 * A first attempt fixed this the way similar Reddit-API field-drift bugs in this project
 * have been fixed before: reading a newer field name Reddit's API allegedly moved to
 * (`active_user_count`) with a fallback to the original (`accounts_active`). Confirmed via
 * a real-device diagnostic build (logging every key actually present in the API response)
 * that this assumption was wrong — it's not a rename. The subreddit `/about` response this
 * app's OAuth access can still reach has 91 keys and NONE of them carry any online/active/
 * visitor count in any form, confirmed exhaustively (the complete key list was logged and
 * inspected by hand, not sampled). Also confirmed via a review of PullPush (the Pushshift
 * successor, sometimes used as a Reddit data workaround) that it only offers historical
 * post/comment/topic search — no live subreddit metadata of any kind, since there's nothing
 * to archive for a value that's only ever "now". This data is not recoverable from any
 * source this project has access to, at least not without discovering and integrating an
 * entirely new, currently-unused Reddit API endpoint — a real feature addition with no
 * guarantee such an endpoint is even reachable with this app's (grandfathered, pre-2025)
 * OAuth credentials, given how aggressively Reddit locked down API access through
 * 2025–2026.
 *
 * Given that, per explicit request: rather than keep showing a permanently-wrong 0, this
 * hides the online-count portion of the display entirely, leaving only the member count —
 * honest about what data is actually available rather than displaying a number that's
 * always incorrect.
 *
 * Confirmed by hand via apktool exactly what LargeToolbarDescription.J(II)V (the method
 * that builds this text) does: it queues a "subscribers" icon span + the formatted member
 * count, then a "  " separator, then an "online" icon span + the formatted online count,
 * before finally rendering all of it via the shared SpannableTextViewStringBuilder finalize
 * call (Loc/b;->F()V — the same class/call this project's image-centering work elsewhere
 * also finalizes through). Removes exactly the "  " separator through the online count's
 * own append call — a contiguous run of existing straight-line instructions with no
 * internal branches of their own — leaving the member-count portion and the final F() call
 * completely untouched. A pure removal, not a splice: no new branch or register is
 * introduced into this existing method at all, so none of this project's past
 * branch-splicing crash history applies here.
 */
val hideOnlineCounterPatch = bytecodePatch(
    name = "Hide online user counter",
    description = "Hides the subreddit info screen's \"number of users online\" count, " +
        "which Reddit's API no longer provides to this app at all (confirmed — not a " +
        "simple field rename), instead of always showing an incorrect 0. The member " +
        "count is unaffected.",
    default = true,
) {
    compatibleWith("com.laurencedawson.reddit_sync"("v23.06.30-13:39"))

    execute {
        val setCountsMethod = largeToolbarDescriptionSetCountsFingerprint.method
        val instructions = setCountsMethod.implementation!!.instructions.toList()

        val separatorIndex = instructions.indexOfFirst { instruction ->
            instruction.opcode == Opcode.CONST_STRING &&
                ((instruction as? ReferenceInstruction)?.reference as? StringReference)
                    ?.string == "  "
        }
        if (separatorIndex == -1) {
            error(
                "Could not find the \"  \" separator between the member and online counts " +
                    "in LargeToolbarDescription.J(...). This build's method structure may " +
                    "differ from what was inspected — re-check with apktool.",
            )
        }

        val finalizeIndex = instructions.indexOfFirst { instruction ->
            (instruction as? ReferenceInstruction)?.reference?.let { ref ->
                ref is MethodReference && ref.definingClass == "Loc/b;" && ref.name == "F"
            } == true
        }
        if (finalizeIndex == -1) {
            error(
                "Could not find the Loc/b;->F() finalize call in " +
                    "LargeToolbarDescription.J(...). This build's method structure may " +
                    "differ from what was inspected — re-check with apktool.",
            )
        }
        if (finalizeIndex <= separatorIndex) {
            error(
                "Expected the Loc/b;->F() finalize call to come after the \"  \" separator " +
                    "in LargeToolbarDescription.J(...), but it doesn't. This build's method " +
                    "structure may differ from what was inspected — re-check with apktool.",
            )
        }

        setCountsMethod.removeInstructions(separatorIndex, finalizeIndex - separatorIndex)
    }
}
