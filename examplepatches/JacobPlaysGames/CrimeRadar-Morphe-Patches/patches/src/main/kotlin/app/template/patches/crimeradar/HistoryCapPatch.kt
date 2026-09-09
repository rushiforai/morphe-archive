package app.template.patches.crimeradar

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_CRIMERADAR

/**
 * Removes the 200-item local reading history cap.
 *
 * cd.d.createQuery() returns different SQL for Room migration queries.
 * Case 3: "DELETE from history_docs where _id < (SELECT ... OFFSET 200)"
 *
 * This silently trims the history table to 200 rows on each DB open.
 *
 * Patch: when this.a == 3, return "SELECT 1" (no-op) instead of the trim query.
 * Other cases (push_docs cleanup, saved_docs deletion) remain untouched.
 */
@Suppress("unused")
val historyCapPatch = bytecodePatch(
    name = "Remove History Cap",
    description = "Removes the 200-item local reading history limit.",
    default = true
) {
    compatibleWith(COMPATIBILITY_CRIMERADAR)

    execute {
        HistoryCapFingerprint.method.addInstructions(
            0,
            """
                # Check if this.a == 3 (history trim query)
                iget v0, p0, Lcd/d;->a:I
                const/4 v1, 0x3
                if-ne v0, v1, :original
                
                # Case 3: return no-op query to skip the trim
                const-string v0, "SELECT 1"
                return-object v0
                
                :original
                # Fall through to original switch/case for other queries
            """
        )
    }
}
