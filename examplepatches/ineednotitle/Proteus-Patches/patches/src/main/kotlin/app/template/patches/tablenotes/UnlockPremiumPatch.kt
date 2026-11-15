package app.template.patches.tablenotes

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.TABLE_NOTES_COMPATIBILITY
import app.template.patches.shared.ensureRegisters
import app.template.patches.shared.logUniversal
import com.android.tools.smali.dexlib2.Opcode

/**
 * Table Notes (vivekagarwal.playwithdb) premium unlock.
 *
 * Entitlement model, verified against 20261111 (versionCode 20261111):
 *
 *   App.a  — active subscription (expiry compared with App.C/App.H)
 *   App.b  — active one-time purchase  (expiry compared with App.D/App.I)
 *   App.c  — subscription premium flag set by the subscription prefs loader
 *   App.O  — subscription latch; while true the prefs loader will not
 *            recompute App.a from the server/local expiry data
 *   App.P  — one-time-purchase latch; same role for App.b
 *   App.f  — plan enum `mo6` (LITE / PERSONAL / BUSINESS / CORPORATE / NONE)
 *
 * The rest of the app never reads the individual expiry timestamps for
 * entitlement decisions; it uses the single predicate
 * `App.a || App.b || App.c || App.O` (28 call sites across the UI, the ad
 * slots and the export/publish path). Setting those five booleans makes every
 * one of those checks resolve to "paid", which:
 *
 *   - opens the PDF / Word / Excel export dialog instead of the paywall,
 *   - removes the AdMob banner/interstitial slots (they are skipped when the
 *     paid predicate is true),
 *   - lifts the free-tier row/column caps (the caps check the same predicate
 *     and only use App.f for the limit message).
 *
 * The latches O and P are forced as well so the two Firebase preference
 * listeners cannot reset a/b back to false after startup on a free account.
 * App.f is set to BUSINESS so the tier message matches the unlocked limits.
 *
 * R8 renames these per build, so the patch verifies the exact field set and
 * aborts with a clear message instead of silently applying half a bypass.
 */
private const val APP_CLASS = "Lvivekagarwal/playwithdb/App;"
private const val PLAN_ENUM = "Lmo6;"

/** Boolean entitlement fields that must be forced on, in this order. */
private val ENTITLEMENT_FIELDS = listOf("a", "b", "c", "O", "P")

@Suppress("unused")
val tableNotesUnlockPremiumPatch = bytecodePatch(
    name = "Table Notes: Unlock premium",
    description = """
        Unlocks Table Notes premium: PDF / Word / Excel export, publishing and
        the paid feature set, and removes the premium-tier ad slots (banner and
        interstitial). Also suppresses the paywall.

        Verified against 20261111. Does not touch Firebase sync of your own
        tables; the app simply believes every entitlement is owned.
    """.trimIndent(),
    default = false,
) {
    compatibleWith(TABLE_NOTES_COMPATIBILITY)

    execute {
        val app = mutableClassDefBy(APP_CLASS)
        val fieldTypes = app.staticFields.associate { it.name to it.type.toString() }

        val missing = ENTITLEMENT_FIELDS.filterNot { fieldTypes[it] == "Z" }
        if (missing.isNotEmpty()) {
            throw PatchException(
                "Table Notes entitlement fields not found in this build: $missing. " +
                    "Found static fields: ${fieldTypes.keys}. Only 20261111 " +
                    "(versionCode 20261111) is supported.",
            )
        }
        if (fieldTypes["f"] != PLAN_ENUM) {
            throw PatchException(
                "Table Notes plan field App.f has type ${fieldTypes["f"]} instead of $PLAN_ENUM; " +
                    "only 20261111 (versionCode 20261111) is supported.",
            )
        }

        val clinit = app.methods.firstOrNull { it.name == "<clinit>" }
            ?: throw PatchException("Table Notes App.<clinit> not found")

        clinit.ensureRegisters(1)
        // Insert immediately BEFORE the final return-void: App.<clinit> ends by
        // setting App.f = mo6.NONE, so a prologue write would be overwritten,
        // and instructions appended after `return-void` never execute.
        val instructions = clinit.implementation!!.instructions.toList()
        val returnIndex = instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
            .takeIf { it >= 0 } ?: instructions.size
        val sets = ENTITLEMENT_FIELDS.joinToString("\n") {
            "sput-boolean v0, $APP_CLASS->$it:Z"
        }
        clinit.addInstructions(
            returnIndex,
            """
                const/4 v0, 0x1
                $sets
                sget-object v0, ${PLAN_ENUM}->BUSINESS:${PLAN_ENUM}
                sput-object v0, $APP_CLASS->f:$PLAN_ENUM
            """.trimIndent(),
        )

        logUniversal(
            "Table Notes: premium unlocked — forced " +
                ENTITLEMENT_FIELDS.joinToString() + " and App.f = BUSINESS.",
        )
    }
}
