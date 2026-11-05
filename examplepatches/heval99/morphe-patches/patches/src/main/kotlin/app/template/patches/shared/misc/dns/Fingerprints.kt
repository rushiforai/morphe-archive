package app.template.patches.shared.misc.dns

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

internal const val GECKO_RUNTIME = "Lorg/mozilla/geckoview/GeckoRuntime;"
internal const val GECKO_RUNTIME_SETTINGS = "Lorg/mozilla/geckoview/GeckoRuntimeSettings;"

// GeckoView's public API (kept by its consumer rules, and Fenix / Focus are built with
// -dontobfuscate). R8 may narrow return types, so none is pinned. Each setter commits one
// network.trr.* pref; GeckoView sends them to Gecko as default-branch prefs and resets their user
// values on every start (RuntimeSettings.commitResetPrefs).

// network.trr.mode: 0 off (native), 2 TRR first, 3 TRR only, 5 off by choice.
internal object GeckoSetTrrModeFingerprint : Fingerprint(
    definingClass = GECKO_RUNTIME_SETTINGS,
    name = "setTrustedRecursiveResolverMode",
    parameters = listOf("I"),
)

// network.trr.uri
internal object GeckoSetTrrUriFingerprint : Fingerprint(
    definingClass = GECKO_RUNTIME_SETTINGS,
    name = "setTrustedRecursiveResolverUri",
    parameters = listOf("Ljava/lang/String;"),
)

// network.trr.excluded-domains (the user's exceptions, joined with ","). Gecko's own
// network.trr.builtin-excluded-domains (localhost, local) is a separate pref and stays.
internal object GeckoSetTrrExcludedDomainsFingerprint : Fingerprint(
    definingClass = GECKO_RUNTIME_SETTINGS,
    name = "setTrustedRecursiveResolverExcludedDomains",
    parameters = listOf("Ljava/util/List;"),
)

// The runtime factory both apps start Gecko with; create(Context) delegates here too.
internal object GeckoRuntimeCreateWithSettingsFingerprint : Fingerprint(
    definingClass = GECKO_RUNTIME,
    name = "create",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = GECKO_RUNTIME,
    parameters = listOf("Landroid/content/Context;", GECKO_RUNTIME_SETTINGS),
)
