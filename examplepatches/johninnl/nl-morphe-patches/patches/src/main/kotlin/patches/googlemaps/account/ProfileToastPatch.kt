package org.ungoogled.patches.maps.account

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import org.ungoogled.patches.maps.ui.SHAPES
import org.ungoogled.patches.maps.ui.sharedExtensionPatch
import org.ungoogled.patches.shared.Constants.COMPATIBILITY_MAPS
import org.ungoogled.patches.shared.replaceBlockAtLabel
import org.ungoogled.patches.maps.microg.MicrogSelection

private const val TOAST_TEXT = "Can't sign in"

/**
 * Both fingerprints above match a WHOLE method that is a shared dispatcher for
 * several unrelated menu actions, not a method dedicated to this one row. Every
 * filter in each fingerprint is part of one contiguous span pinning this row's
 * case from its own first instruction to its own last, so only that span -
 * `instructionMatches.first().index` through `.last().index`, inclusive - may
 * be touched. Removing and inserting at index 0, or using any API that
 * replaces "as many old instructions as the new list is long" rather than the
 * span's real length, would corrupt every sibling case sharing the method.
 *
 * Nothing is removed, either: removing the old case body merges its labels --
 * the case label itself among them -- into whatever follows, which is the NEXT
 * case. An earlier version of this patch did exactly that, and the tap ran the
 * neighbouring row's code instead of the toast. The new body is placed AT the
 * case label and returns; the old one is left behind it, unreachable.
 */
internal val profileToastPatch = bytecodePatch(
    description = "Tapping \"Your profile\" shows a \"Can't sign in\" toast instead of opening nothing.",
) {
    compatibleWith(COMPATIBILITY_MAPS)
    // Shapes.SKIP_DISMISS: with Keep account sheet open, the sheet stays up behind the toast.
    dependsOn(sharedExtensionPatch)

    execute {
        if (MicrogSelection.replaces(this, "Remove sign-in prompts")) return@execute
        // Modern builder: 10 real instructions, this row's whole case.
        ProfileClickModernFingerprint.let { fp ->
            val matches = fp.instructionMatches
            val start = matches.first().index
            val end = matches.last().index
            val count = end - start + 1
            if (count != 10) throw PatchException("modern profile-click case is $count instructions, expected 10")

            fp.method.apply {
                replaceBlockAtLabel(
                    start,
                    """
                        move-object/from16 v0, p0
                        iget-object v0, v0, Lmrh;->a:Ljava/lang/Object;
                        check-cast v0, Lvte;
                        iget-object v0, v0, Lvte;->a:Ljava/lang/Object;
                        check-cast v0, Landroid/content/Context;
                        const/4 v1, 0x1
                        sput-boolean v1, $SHAPES->SKIP_DISMISS:Z
                        const-string v1, "$TOAST_TEXT"
                        const/4 v2, 0x0
                        invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
                        move-result-object v0
                        invoke-virtual {v0}, Landroid/widget/Toast;->show()V
                        sget-object v0, Lcttz;->a:Lcttz;
                        return-object v0
                    """,
                )
            }
        }

        // Legacy builder: the 14-instruction trace/open/close span pins this row.
        // Keep the original shared return and exception handlers behind our return.
        // The upstream classes4.dex sits at the 65,536
        // method_id cap, so only method refs it already contains may be used:
        // Toast.makeText and Toast.show are both already called elsewhere in
        // this dex, and Lolm;->a is an existing field ref.
        ProfileClickLegacyFingerprint.let { fp ->
            val matches = fp.instructionMatches
            val start = matches.first().index
            val end = matches.last().index
            val count = end - start + 1
            if (count != 14) throw PatchException("legacy profile-click case is $count instructions, expected 14")

            fp.method.apply {
                replaceBlockAtLabel(
                    start,
                    """
                        move-object/from16 v0, p0
                        iget-object v0, v0, Loll;->a:Ljava/lang/Object;
                        check-cast v0, Lolm;
                        iget-object v0, v0, Lolm;->a:Lnwm;
                        const-string v1, "$TOAST_TEXT"
                        const/4 v2, 0x0
                        invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
                        move-result-object v0
                        invoke-virtual {v0}, Landroid/widget/Toast;->show()V
                        return-void
                    """,
                )
            }
        }
    }
}
