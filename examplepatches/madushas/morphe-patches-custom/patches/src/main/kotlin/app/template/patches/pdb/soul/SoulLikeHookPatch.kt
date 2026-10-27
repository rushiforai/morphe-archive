package app.template.patches.pdb.soul

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.template.patches.shared.Constants.PDB_COMPATIBILITY

/**
 * The app's soul-feed like path: the ViewModel method that queues the vote for
 * a card. Two code literals pin it uniquely (a Compose lambda `w76.i` also
 * contains `"vote"`, so a single-literal match is ambiguous): the daily
 * like-counter read `irlTotalLiked` appears just before the
 * `new qq("vote", ...)` call, and only in this method. Ordered string filters
 * survive R8 renames; if a future release reorders them, drop to a `custom`
 * parameter-count check.
 *
 * Injecting `PdbUi.recordSoulLike(card)` at its entry lets the extension's
 * local Soul history mark that profile as liked, independent of what the
 * server accepts — likes beyond the server's short feed window are still
 * recorded locally.
 */
private val SoulLikeFingerprint = Fingerprint(
    returnType = "V",
    filters = listOf(
        string("irlTotalLiked"),
        string("vote"),
    ),
)

@Suppress("unused")
val pdbSoulLikeHookPatch = bytecodePatch(
    name = "Soul history",
    description = "Records every Soul profile you see or like into a local, " +
        "on-device history (Pdb Extras / power button → 'Soul history'), so " +
        "swipes survive the server's short feed window.",
    default = true,
) {
    compatibleWith(PDB_COMPATIBILITY)

    execute {
        val like = SoulLikeFingerprint.method
            ?: throw IllegalStateException("soul like path (method with \"vote\") not found")
        // p0 = view model, p1 = the story card. p1 sits above v15 in this
        // method (registerCount ~31), so plain invoke-static can't address it —
        // the /range form takes a 16-bit register and assembles cleanly.
        like.addInstructions(
            0,
            """
            invoke-static/range {p1 .. p1}, Lapp/template/extension/pdb/PdbUi;->recordSoulLike(Ljava/lang/Object;)V
            """.trimIndent(),
        )
    }
}
