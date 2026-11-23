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
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
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

/** The widget refresh work's repeat interval (30 minutes, passed in minutes since 26.11.09). */
private const val STOCK_INTERVAL_MINUTES = 30L

/**
 * The static (Context)V that schedules the widget refresh (SofaWidgetReceiver.onEnabled and
 * onUpdate call it): it builds a PeriodicWorkRequest for WidgetPeriodicRefreshWorker (an
 * unobfuscated worker) and enqueues it as the unique periodic work "widget_periodic_refresh" with
 * the UPDATE policy, so a new interval replaces the old one at the next call. Found by the work
 * name and the worker class (the receiver's own scheduling method holds the name but not the
 * worker class).
 */
internal object WidgetPeriodicRefreshFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    strings = listOf(string("widget_periodic_refresh", StringComparisonType.EQUALS)),
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
    // The repeat interval: PeriodicWorkRequest.Builder(Class, long, TimeUnit) is built with
    // const-wide vX, 30 and TimeUnit.MINUTES (since 26.11.09; the older builds stored 1800000 ms
    // into the work spec). Anchored on that constructor call, its wide register pair and the
    // MINUTES unit; the 5-minute flex window of the old builds is gone.
    val builderCalls = instructions.indices.filter { i ->
        val call = instructions[i]
        call.opcode == Opcode.INVOKE_DIRECT && call is FiveRegisterInstruction &&
            ((call as ReferenceInstruction).reference as? MethodReference)?.let { ref ->
                ref.definingClass == "Landroidx/work/PeriodicWorkRequest\$Builder;" && ref.name == "<init>" &&
                    ref.parameterTypes.map(CharSequence::toString) ==
                    listOf("Ljava/lang/Class;", "J", "Ljava/util/concurrent/TimeUnit;")
            } == true
    }
    if (builderCalls.size != 1) {
        throw PatchException("Slower widget refresh: expected one PeriodicWorkRequest.Builder(Class, long, TimeUnit), found ${builderCalls.size}")
    }
    val builderCall = builderCalls.single()
    val call = instructions[builderCall] as FiveRegisterInstruction
    val register = call.registerE
    // The unit is loaded right before the call and must be MINUTES.
    val unit = instructions.subList(0, builderCall).lastOrNull {
        it.opcode == Opcode.SGET_OBJECT && (it as OneRegisterInstruction).registerA == call.registerG
    }
    if (((unit as? ReferenceInstruction)?.reference as? FieldReference)?.let {
            it.definingClass == "Ljava/util/concurrent/TimeUnit;" && it.name == "MINUTES"
        } != true
    ) {
        throw PatchException("Slower widget refresh: the repeat interval unit is not TimeUnit.MINUTES")
    }
    // The interval literal is the last load of the wide pair before the call.
    val load = instructions.indices.last { i ->
        i < builderCall && instructions[i] is OneRegisterInstruction &&
            (instructions[i] as OneRegisterInstruction).registerA == register
    }
    val literal = instructions[load]
    if (literal !is WideLiteralInstruction || literal.wideLiteral != STOCK_INTERVAL_MINUTES) {
        throw PatchException("Slower widget refresh: the repeat interval is not the $STOCK_INTERVAL_MINUTES minutes the patch expects")
    }
    method.requireNoBranchTargetAt(load + 1, "widget refresh interval")
    // vX = widgetRefreshMinutes(vX) right after the load; /range takes any register pair.
    method.addInstructionsChecked(
        load + 1,
        """
            invoke-static/range {v$register .. v${register + 1}}, $SOFASCORE_CONTROLS->widgetRefreshMinutes(J)J
            move-result-wide v$register
        """,
    )
}
