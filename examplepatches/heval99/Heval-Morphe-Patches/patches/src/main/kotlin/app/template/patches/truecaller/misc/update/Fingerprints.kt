package app.template.patches.truecaller.misc.update

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.string

internal const val UPDATE_TRIGGER = "Lcom/truecaller/inappupdate/UpdateTrigger;"

// The in-app update manager (R8-renamed) exposes startUpdate(activity, trigger) as a
// CompletableFuture for Java callers; it only wraps the suspend version below.
internal object UpdateManagerFutureFingerprint : Fingerprint(
    returnType = "Ljava/util/concurrent/CompletableFuture;",
    parameters = listOf("Landroid/app/Activity;", UPDATE_TRIGGER),
)

// suspend startUpdate(activity, trigger): Boolean. Every soft and forced (HardUpgrade) Play Core
// update flow is launched only from here; the other Activity + UpdateTrigger methods of the
// class are its steps and are entered only through it (or resumed by their continuations).
internal object StartUpdateFingerprint : Fingerprint(
    classFingerprint = UpdateManagerFutureFingerprint,
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Landroid/app/Activity;", UPDATE_TRIGGER, "L"),
    custom = { method, _ -> method.parameterTypes.size == 3 },
)

// The app's own forced-update state: the server's answer (NONE, OPTIONAL, REQUIRED,
// DISCONTINUED) stored in SharedPreferences. ForcedUpdateActivity reads it through this getter
// (via its dismissal-aware b(Boolean) sibling).
internal object ForcedUpdateTypeFingerprint : Fingerprint(
    returnType = "Lcom/truecaller/forcedupdate/UpdateType;",
    parameters = listOf(),
    strings = listOf(
        string("forcedUpdate_updateType", StringComparisonType.CONTAINS),
        string("forcedUpdate_appVersion", StringComparisonType.CONTAINS),
    ),
)
