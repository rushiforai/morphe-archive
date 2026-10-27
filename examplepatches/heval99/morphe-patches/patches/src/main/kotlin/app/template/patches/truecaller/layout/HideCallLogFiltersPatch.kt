package app.template.patches.truecaller.layout

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_TRUECALLER
import app.template.patches.shared.addInstructionsChecked
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

@Suppress("unused")
val hideCallLogFiltersPatch = bytecodePatch(
    name = "Hide call log filters",
    description = "Hides the filter bar above the call log.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_TRUECALLER)

    execute {
        // 1. The filter row composable returns before it starts its restart group, so it emits
        // nothing and the callers' groups stay balanced. Pinned, the row is gone; in scrollable mode
        // its LazyColumn item is empty. The call list and its data are untouched.
        CallLogFiltersRowFingerprint.method.returnEarly()

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
        // sget-object takes any 8-bit register; p1 is the FilterType parameter.
        setter.addInstructionsChecked(0, "sget-object p1, $CALL_LOG_FILTER_TYPE->NONE:$CALL_LOG_FILTER_TYPE")
    }
}
