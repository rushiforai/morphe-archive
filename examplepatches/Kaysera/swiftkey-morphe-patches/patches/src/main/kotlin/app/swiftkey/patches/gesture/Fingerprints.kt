package app.swiftkey.patches.gesture

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

internal const val FLOW_VS_GESTURES_CLASS =
    "Lcom/touchtype/materialsettings/custompreferences/FlowVsGesturesListPreference;"

internal const val FLOW_SWITCH_PREF_KEY = "pref_flow_switch_key"
internal const val DISABLED_PREF_KEY = "pref_gesture_input_disabled"
internal const val DISABLED_VALUE = "pref_list_disabled"

/**
 * `FlowVsGesturesListPreference.J(String)`, the method that stores the selected mode.
 *
 * It reads the existing `pref_flow_switch_key` preference, writes it, then sets the summary.
 * This is where the third value is persisted.
 */
internal object FlowVsGesturesValueFingerprint : Fingerprint(
    definingClass = FLOW_VS_GESTURES_CLASS,
    parameters = listOf("Ljava/lang/String;"),
    returnType = "V",
    filters = listOf(
        // super.setValue(value)
        methodCall(
            definingClass = "Landroidx/preference/ListPreference;",
            parameters = listOf("Ljava/lang/String;"),
            returnType = "V",
        ),
        string(FLOW_SWITCH_PREF_KEY),
        methodCall(name = "putBoolean"),
        methodCall(
            definingClass = "Landroidx/preference/ListPreference;",
            parameters = listOf("Ljava/lang/CharSequence;"),
            returnType = "V",
        ),
    ),
)

/**
 * `FlowVsGesturesListPreference.t(Object)`, which restores the preference value when the
 * settings screen is opened.
 */
internal object FlowVsGesturesStateFingerprint : Fingerprint(
    definingClass = FLOW_VS_GESTURES_CLASS,
    parameters = listOf("Ljava/lang/Object;"),
    returnType = "V",
)
