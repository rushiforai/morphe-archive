package app.template.patches.fotmob.betting

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.string

// The odds gate, a suspend fun returning Boolean (239: am9.b(Continuation)Object). It answers false
// after logging this line when the user turned odds off in settings or the odds config is missing,
// and true otherwise. Match odds, the odds tab (an odds WebView tab built only when it allows), the
// odds promo and the betting card offers all wait on it. The log line ("User has disabled odds in
// settings or oddsConfig is null or not valid, can't show odds") is the anchor, matched by its
// stable prefix; the continuation parameter is R8-renamed, so only its object shape is pinned.
internal object OddsGateFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("L"),
    filters = listOf(string("User has disabled odds in settings", StringComparisonType.STARTS_WITH)),
)
