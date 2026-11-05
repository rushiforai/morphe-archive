package app.template.patches.truecaller.layout

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.shared.hevalcontrols.addHevalGate
import app.template.patches.shared.hevalcontrols.featurePatch
import app.template.patches.shared.hevalcontrols.hevalReturnEarly
import app.template.patches.truecaller.controls.TruecallerControlsCategory
import app.template.patches.truecaller.controls.truecallerControls
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val FEATURE = "truecaller.hide_call_log_filters"

// A Heval Controls feature: the row composable and the filter setter take their patched path only
// while it is on. The gate is read each time the row is composed, so a switch shows once the call
// log screen composes it again; the restart badge asks for a clean start, since an open screen
// keeps its current row until then.
@Suppress("unused")
val hideCallLogFiltersPatch = truecallerControls.featurePatch(
    HevalFeature(
        id = FEATURE,
        name = "Hide call log filters",
        description = "Hides the filter bar above the call log.",
        category = TruecallerControlsCategory.CALL_LOG,
        restartRequired = true,
    ),
    default = false,
) {
    // 1. The filter row composable returns before it starts its restart group, so it emits
    // nothing and the callers' groups stay balanced. Pinned, the row is gone; in scrollable mode
    // its LazyColumn item is empty. The call list and its data are untouched.
    CallLogFiltersRowFingerprint.method.hevalReturnEarly(FEATURE)

    // 2. The selected filter lives only in memory (onCreate resets it, nothing stores it), but
    // notification and deep-link intents (set_missed_filter, set_voicemail_filter,
    // set_assistant_filter, force_assistant_filter) select a filter through one setter. Without
    // the row there is no way back, so the setter always selects NONE, the value behind the All
    // chip (the filter enum has no ALL; onCreate resets to NONE too).
    val intentHandler = CallLogFilterIntentFingerprint
    val setterCall = intentHandler.method
        .getInstruction<ReferenceInstruction>(intentHandler.instructionMatches.last().index)
        .reference as MethodReference
    val setter = mutableClassDefBy(setterCall.definingClass).methods.singleOrNull { method ->
        method.name == setterCall.name && method.returnType == "V" &&
            method.parameterTypes.map(CharSequence::toString) == listOf(CALL_LOG_FILTER_TYPE)
    } ?: throw PatchException("${setterCall.definingClass} has no ${setterCall.name}($CALL_LOG_FILTER_TYPE)V")
    if (setter.implementation == null || AccessFlags.STATIC.isSet(setter.accessFlags)) {
        throw PatchException("${setterCall.definingClass}->${setter.name} is not a concrete instance method")
    }
    // sget-object takes any 8-bit register; p1 is the FilterType parameter. The gate's v0 is a
    // local of the setter.
    setter.addHevalGate(FEATURE) { "sget-object p1, $CALL_LOG_FILTER_TYPE->NONE:$CALL_LOG_FILTER_TYPE" }
}
