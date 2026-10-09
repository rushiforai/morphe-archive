package app.template.patches.bluecoins.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.string

// Bluecoins 13.1.149 is fully R8-obfuscated (kotlinx.coroutines included), so every anchor
// here is a Timber log line from the encrypted premium preference pipeline plus method shape.
// The log prefixes are matched with STARTS_WITH so a reworded tail does not break them.

// FlowCollector.emit(value, continuation) of the map stage that decrypts the salted
// "premiumKey" preference and logs "Startup: Encryption: Premium is <state> based on salted
// value verification" before emitting the verified state downstream. Present in 13.1.79
// (EncryptedAppPreferenceManager$isPremiumVersionFlow$$inlined$map$1$2.emit) and 13.1.149.
internal object PremiumStateEmitFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    filters = listOf(
        string("Startup: Encryption: Premium is ", StringComparisonType.STARTS_WITH),
    ),
    custom = { method, _ ->
        method.parameterTypes.size == 2 && method.parameterTypes[0] == "Ljava/lang/Object;"
    },
)

// The premium use case that every screen collects: it reads both the "premiumKey" and the
// "versionOverride" preferences and combines them. Only exists from 13.1.149 on (13.1.79
// has no Google Play version override), so it tells the patch whether step 2 is required.
internal object PremiumUseCaseFingerprint : Fingerprint(
    strings = listOf("premiumKey", "versionOverride"),
)

// invokeSuspend(result) of the combine lambda that merges the salted premium state with the
// "versionOverride" pref set from the Google Play version override setting
// ("premium"/"standard"); a non-null override wins.
internal object PremiumOverrideCombineFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(
        string("Startup: Encryption: Google Play premium override", StringComparisonType.STARTS_WITH),
    ),
)
