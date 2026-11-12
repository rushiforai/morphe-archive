package app.template.patches.sofascore.misc.widget

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.string
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.shared.hevalcontrols.featurePatch
import app.template.patches.shared.requireNoBranchTargetAt
import app.template.patches.sofascore.controls.SOFASCORE_CONTROLS
import app.template.patches.sofascore.controls.SofascoreControlsCategory
import app.template.patches.sofascore.controls.sofascoreControls
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

internal val SLOWER_WIDGET_REFRESH = HevalFeature(
    id = "sofascore.slower_widget_refresh",
    name = "Update widgets less often",
    description = "Updates home screen widgets every hour instead of every 30 minutes.",
    category = SofascoreControlsCategory.PERFORMANCE,
    default = false,
    restartRequired = true,
    icon = "refresh",
)

private const val WIDGET_REFRESH_WORKER = "Lcom/sofascore/results/service/WidgetPeriodicRefreshWorker;"

/** The widget refresh work's repeat interval in 26.10.19 (30 minutes). */
private const val STOCK_INTERVAL_MILLIS = 1_800_000L

/**
 * The static (Context)V that schedules the widget refresh (kv9.U in 26.10.19, called from
 * SofaWidgetReceiver.onEnabled and onUpdate): it builds a PeriodicWorkRequest for
 * WidgetPeriodicRefreshWorker (an unobfuscated worker) and enqueues it as the unique periodic work
 * "widget_periodic_refresh" with the UPDATE policy (WorkManager's
 * "enqueueUniquePeriodic_<name>" trace label is inlined), so a new interval replaces the old one
 * at the next call.
 */
internal object WidgetPeriodicRefreshFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    strings = listOf(string("enqueueUniquePeriodic_widget_periodic_refresh", StringComparisonType.EQUALS)),
    custom = { method, _ ->
        method.implementation?.instructions?.any { insn ->
            insn.opcode == Opcode.CONST_CLASS &&
                ((insn as ReferenceInstruction).reference as? TypeReference)?.type == WIDGET_REFRESH_WORKER
        } == true
    },
)

// A Heval Controls feature, off by default: the widget keeps the app's 30-minute refresh until
// the user turns the switch on.
@Suppress("unused")
val slowerWidgetRefreshPatch = sofascoreControls.featurePatch(
    SLOWER_WIDGET_REFRESH,
    // The Manager patch keeps its name and description; only the Patch settings row was reworded (2026-11-11).
    name = "Slower widget refresh",
    description = "Refreshes home screen widgets every hour instead of every 30 minutes.",
    default = false,
) {
    val method = WidgetPeriodicRefreshFingerprint.method
    val instructions = method.implementation!!.instructions
    // The repeat interval: const-wide vX, 1800000 stored straight into the work spec
    // (iput-wide vX, <spec>.<interval>:J). The flex window (5 minutes, clamped to the interval)
    // is left as it is.
    val stores = instructions.indices.filter { i ->
        val load = instructions[i]
        val store = instructions.getOrNull(i + 1)
        load is WideLiteralInstruction && load.wideLiteral == STOCK_INTERVAL_MILLIS &&
            load.opcode in setOf(Opcode.CONST_WIDE_32, Opcode.CONST_WIDE) &&
            store?.opcode == Opcode.IPUT_WIDE &&
            (store as OneRegisterInstruction).registerA == (load as OneRegisterInstruction).registerA &&
            ((store as ReferenceInstruction).reference as FieldReference).type == "J"
    }
    if (stores.size != 1) {
        throw PatchException("Slower widget refresh: expected one interval store, found ${stores.size}")
    }
    val load = stores.single()
    val register = (instructions[load] as OneRegisterInstruction).registerA
    method.requireNoBranchTargetAt(load + 1, "widget refresh interval")
    // vX = widgetRefreshInterval(vX) between the load and the store; /range takes any register pair.
    method.addInstructionsChecked(
        load + 1,
        """
            invoke-static/range {v$register .. v${register + 1}}, $SOFASCORE_CONTROLS->widgetRefreshInterval(J)J
            move-result-wide v$register
        """,
    )
}
