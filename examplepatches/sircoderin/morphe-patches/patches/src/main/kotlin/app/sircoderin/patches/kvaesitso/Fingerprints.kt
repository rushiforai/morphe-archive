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

/**
 * `LauncherScaffoldState.reset()` (suspend): clears search bar focus, snaps back to the home page and, only if a
 * secondary page is open, re-runs the home component's `onPreActivate`. Called when the window resumes after
 * more than 5 s in the background.
 */
internal object LauncherScaffoldStateResetFingerprint : Fingerprint(
    definingClass = "Lde/mm20/launcher2/ui/launcher/scaffold/LauncherScaffoldState;",
    name = "reset",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Lkotlin/coroutines/Continuation;"),
)

/** `SharedLauncherActivity.onPause()`: `super.onPause()`, then clears `isNewIntent`. */
internal object SharedLauncherActivityOnPauseFingerprint : Fingerprint(
    definingClass = "Lde/mm20/launcher2/ui/launcher/SharedLauncherActivity;",
    name = "onPause",
    returnType = "V",
    parameters = listOf(),
)

/** `BaseActivity.onResume()`: runs before ON_RESUME is dispatched, so before the scaffold's resume check. */
internal object BaseActivityOnResumeFingerprint : Fingerprint(
    definingClass = "Lde/mm20/launcher2/ui/base/BaseActivity;",
    name = "onResume",
    returnType = "V",
    parameters = listOf(),
)
