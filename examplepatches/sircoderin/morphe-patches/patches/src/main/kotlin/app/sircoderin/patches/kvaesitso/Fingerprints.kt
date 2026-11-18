package app.sircoderin.patches.kvaesitso

import app.morphe.patcher.Fingerprint

internal const val DISMISS_COMPONENT =
    "Lde/mm20/launcher2/ui/launcher/scaffold/components/DismissComponent;"

/**
 * `ScaffoldComponent.onPreActivate(state)`: called when a swipe is released and the scaffold has decided
 * to transition to the gesture's component, *before* the settle animation runs.
 * (`onActivate`, which `DismissComponent` uses to call `finish()`, only runs after the spring fully settles.)
 */
internal object ScaffoldComponentOnPreActivateFingerprint : Fingerprint(
    definingClass = "Lde/mm20/launcher2/ui/launcher/scaffold/components/ScaffoldComponent;",
    name = "onPreActivate",
    returnType = "V",
    parameters = listOf("Lde/mm20/launcher2/ui/launcher/scaffold/LauncherScaffoldState;"),
)

/** `SharedLauncherActivity.onAttachedToWindow()`: runs once each time the launcher/search window is attached. */
internal object SharedLauncherActivityOnAttachedToWindowFingerprint : Fingerprint(
    definingClass = "Lde/mm20/launcher2/ui/launcher/SharedLauncherActivity;",
    name = "onAttachedToWindow",
    returnType = "V",
    parameters = listOf(),
)

/** `SharedLauncherActivity.onNewIntent(intent)`: runs when an existing search window is reopened. */
internal object SharedLauncherActivityOnNewIntentFingerprint : Fingerprint(
    definingClass = "Lde/mm20/launcher2/ui/launcher/SharedLauncherActivity;",
    name = "onNewIntent",
    returnType = "V",
    parameters = listOf("Landroid/content/Intent;"),
)
