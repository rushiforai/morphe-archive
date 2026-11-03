package app.template.patches.truecaller.misc.haptics

import app.morphe.patcher.Fingerprint

internal const val CALL_UI_HAPTIC = "Lcom/truecaller/callui/presentation/ui/CallUIHaptic;"
internal const val SWIPE_DRAGGING_STATE = "Lcom/truecaller/callui/presentation/ui/components/CallUISwipeButtonDraggingState;"
private const val ANALYTICS_MODEL = "Lcom/truecaller/callui/api/internal/analytics/model/"

/**
 * The analytics actions reported when a call is answered or declined (full screen, details view,
 * PiP), each with the haptic the same handler plays. Hang-up reports HANGUP / KEYPAD_END_CALL with
 * the same REJECT haptic and is not listed, so it keeps its haptic.
 */
internal val ANSWER_DECLINE_ACTIONS: Map<Pair<String, String>, String> = listOf(
    "CallUIActions", "CallUIDetailsViewAction", "CallUIPipActions",
).flatMap { enum ->
    listOf(
        ("$ANALYTICS_MODEL$enum;" to "ACCEPT") to "CONFIRM",
        ("$ANALYTICS_MODEL$enum;" to "REJECT") to "REJECT",
    )
}.toMap()

internal const val DRAGGING_STATE_HANDLER = "onCallUiSwipeButtonDraggingStateChanged"
internal const val DRAGGING_PROGRESS_HANDLER = "onDraggingProgressChanged"

// The incoming call screen composable builds the swipe buttons' callbacks as function references
// to the call UI view model, each with its kept name, e.g. new Lambda(1, viewModel, ViewModel.class,
// "onDraggingProgressChanged", "onDraggingProgressChanged(D)V", 0, case) for an R8-merged lambda.
internal object IncomingCallSwipeHandlersFingerprint : Fingerprint(
    strings = listOf(DRAGGING_STATE_HANDLER, DRAGGING_PROGRESS_HANDLER),
)
