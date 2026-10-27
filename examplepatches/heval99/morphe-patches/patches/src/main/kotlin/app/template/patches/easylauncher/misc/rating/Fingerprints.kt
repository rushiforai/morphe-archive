package app.template.patches.easylauncher.misc.rating

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.string

// The launcher's review lifecycle observer (R8-renamed). Its onResume (the
// DefaultLifecycleObserver name is kept) posts the "user_sentiment" dialog, and the
// Play review request once the user answered positively, a day has passed since install and the
// "app_launch_count_for_review" counter is high enough.
internal object ReviewObserverOnResumeFingerprint : Fingerprint(
    name = "onResume",
    returnType = "V",
    strings = listOf(string("app_launch_count_for_review", StringComparisonType.CONTAINS)),
    filters = listOf(string("getDaysSinceInstall", StringComparisonType.STARTS_WITH)),
    custom = { method, _ -> method.parameterTypes.size == 1 },
)

// The review manager's two decisions, found by their "-> true" log lines.
internal object IsUserPrimedForReviewFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(string("isUserPrimedForReview -> true", StringComparisonType.STARTS_WITH)),
)

internal object ShouldRequestAppReviewFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(string("shouldRequestAppReview -> true", StringComparisonType.STARTS_WITH)),
)
