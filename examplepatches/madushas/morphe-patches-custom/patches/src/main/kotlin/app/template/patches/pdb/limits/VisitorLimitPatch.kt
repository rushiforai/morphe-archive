package app.template.patches.pdb.limits

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.template.patches.shared.Constants.PDB_COMPATIBILITY
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.Label
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11n
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction22t

private const val EXT_PREFIX = "Lapp/template/extension/pdb/"

/**
 * Pdb's visitor screen state lambda, found by the two MMKV keys only it touches.
 * `Ljjf` is R8-obfuscated and will be renamed again, so the literals are the anchor.
 */
private val VisitorLimitFingerprint = Fingerprint(
    name = "invoke",
    returnType = "Ljava/lang/Object;",
    parameters = emptyList(),
    strings = listOf("visitPopupDate", "visitPopupCount"),
)

/**
 * "No profile-visitor limit" — implements the `morphe_no_visitor_limit` switch,
 * the first entry on the `Pdb Extras → Limits` tab.
 *
 * Pdb's visitor screen (`Lnjf`, a fragment) keeps two counters in MMKV inside a
 * rolling one-hour window: `visitsViewCount` (profiles opened) and
 * `visitsCardClickCount` (visitor cards tapped). Its UI-state lambda reads both
 * and shows the "take a break" sheet as soon as **either reaches 3**, at most
 * twice a day:
 *
 * ```
 * :cond_3
 * const/4 v4, 0x3                    # the limit (kept: :cond_3 is a branch target)
 * if-ge v0, v4, :cond_4              # viewCount  >= 3 -> limit
 * if-lt v6, v4, :cond_5              # clickCount <  3 -> no limit
 * :cond_4
 * iput-boolean v3, p0, Lnjf;->t0:Z   # limit reached
 * ```
 *
 * That is a **client-side** gate — the counts live in the app's own store — so it
 * is patchable, unlike the server-side premium Soul filters. The two comparisons
 * are replaced by a call into the extension:
 *
 * ```
 * invoke-static {v0, v6}, PdbLimits->visitorLimitReached(II)Z
 * move-result v4
 * if-nez v4, :cond_5                 # not reached -> original no-limit path
 * ```
 *
 * The extension returns `false` while the switch is on and otherwise reproduces
 * the original `>= 3` rule, so the bytecode ships always-on and the toggle works
 * without rebuilding. `PdbStartup` writes the flag at app start.
 *
 * The replacement reads the register numbers off the matched instructions, so a
 * register reshuffle in a future build does not silently break it.
 */
@Suppress("unused")
val pdbVisitorLimitPatch = bytecodePatch(
    name = "No profile-visitor limit",
    description = "Lifts Pdb's client-side cap of 3 profile-visitor views per hour " +
        "(the 'slow down' sheet). Toggle: Pdb Extras → Limits → 'No profile-visitor " +
        "limit'. The bytecode ships always-on and is inert until the switch is on.",
    default = true,
) {
    compatibleWith(PDB_COMPATIBILITY)

    execute {
        val limitMethod = VisitorLimitFingerprint.method
            ?: throw IllegalStateException(
                "Pdb visitor-limit method not found (no invoke() holding " +
                    "'visitPopupDate' and 'visitPopupCount')",
            )
        val impl = limitMethod.implementation
            ?: throw IllegalStateException("visitor-limit method has no body")

        val instructions = impl.instructions.toList()
        var limitIndex = -1
        for (i in 0 until instructions.size - 2) {
            val maybeConstant = instructions[i]
            val maybeViewCheck = instructions[i + 1]
            val maybeClickCheck = instructions[i + 2]
            if (maybeConstant.opcode == Opcode.CONST_4 &&
                (maybeConstant as? BuilderInstruction11n)?.narrowLiteral == 3 &&
                maybeViewCheck.opcode == Opcode.IF_GE &&
                maybeClickCheck.opcode == Opcode.IF_LT
            ) {
                limitIndex = i
                break
            }
        }
        if (limitIndex < 0) {
            throw IllegalStateException(
                "visitor-limit comparison (const/4 3 + if-ge + if-lt) not found",
            )
        }

        val viewCheck = instructions[limitIndex + 1] as BuilderInstruction22t
        val clickCheck = instructions[limitIndex + 2] as BuilderInstruction22t

        // Register numbers come from the matched instructions, so the patch follows
        // a register reshuffle. viewCount / clickCount are the left-hand operands;
        // the shared scratch register holds the "3".
        val viewCount = viewCheck.registerA
        val clickCount = clickCheck.registerA
        val scratch = viewCheck.registerB

        // The original no-limit path: where `if-lt ... :cond_5` jumped.
        val noLimitInstruction = (clickCheck.target as? Label)
            ?.location
            ?.instruction
            ?: throw IllegalStateException("visitor-limit branch target is not a resolvable label")

        // Replace the two comparisons with the extension call. `const/4 v4, 0x3`
        // stays: `:cond_3` is the target of an earlier branch, so removing it would
        // break that jump.
        limitMethod.removeInstructions(limitIndex + 1, 2)
        limitMethod.addInstructionsWithLabels(
            limitIndex + 1,
            """
                invoke-static {v$viewCount, v$clickCount}, ${EXT_PREFIX}PdbLimits;->visitorLimitReached(II)Z
                move-result v$scratch
                if-nez v$scratch, :morphe_no_visitor_limit
            """.trimIndent(),
            ExternalLabel("morphe_no_visitor_limit", noLimitInstruction),
        )
    }
}
