package app.sircoderin.patches.kvaesitso

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.smali.ExternalLabel
import app.sircoderin.patches.shared.Constants.COMPATIBILITY_KVAESITSO

/**
 * In search-only (assistant) mode, swiping down/up dismisses the overlay via `DismissComponent`, which calls
 * `activity.finish()` in `onActivate` — after the swipe's spring animation has fully settled. The content is
 * already invisible long before that, so the user sees ~350 ms of frozen blurred wallpaper before the system
 * close transition even starts.
 *
 * This finishes the activity in `onPreActivate` instead (same moment the dismiss is decided), so the normal
 * ~200 ms system close transition starts immediately — same feel as closing with Back.
 */
@Suppress("unused")
val instantSearchDismissPatch = patch(
    name = "Instant search dismiss",
    description = "Closes the search overlay as soon as the swipe-to-close is released, " +
        "instead of after the swipe animation fully settles (removes the frozen blur when closing).",
    default = true,
) {
    compatibleWith(COMPATIBILITY_KVAESITSO)

    execute {
        ScaffoldComponentOnPreActivateFingerprint.method.apply {
            // Original body: p1.getClass() (null check); return-void. p1 is free to reuse after the check.
            val returnIndex = implementation!!.instructions.size - 1
            // Jump target is the original return-void (an internal `:label` + `nop` produced a wrong branch offset).
            addInstructionsWithLabels(
                returnIndex,
                """
                    instance-of p1, p0, $DISMISS_COMPONENT
                    if-eqz p1, :not_dismiss
                    move-object p1, p0
                    check-cast p1, $DISMISS_COMPONENT
                    iget-object p1, p1, $DISMISS_COMPONENT->activity:Landroid/app/Activity;
                    invoke-virtual { p1 }, Landroid/app/Activity;->finish()V
                """,
                ExternalLabel("not_dismiss", returnIndex),
            )
        }
    }
}
