package semicoloncolonel.mobilestream.patches.att.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import semicoloncolonel.mobilestream.patches.att.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers

// myAT&T 2026.10.1:
//   Dynatrace: the agent never starts, so its hooks woven through the app
//     and the sign-in SDK do nothing. Every public startup() goes through
//     the private one patched here.
//   Adobe Experience Platform (analytics, in-app marketing, push tracking):
//     the app's JavaScript starts it through the React Native module, which
//     now reports success without starting it.
//   Medallia surveys: the same, through its React Native module.
// Firebase Analytics is switched off in the manifest.
//
// Not touched: Akamai Bot Manager and Arkose Labs, which sign-in relies on,
// AT&T's sign-in SDK, and the speed test.

private const val PROMISE = "Lcom/facebook/react/bridge/Promise;"

internal object DynatraceStartupFingerprint : Fingerprint(
    definingClass = "Lcom/dynatrace/android/agent/Dynatrace;",
    name = "startup",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.STATIC),
    returnType = "V",
)

internal object AdobeInitializeFingerprint : Fingerprint(
    definingClass = "Lcom/adobe/marketing/mobile/reactnative/RCTAEPCoreModule;",
    name = "initialize",
    parameters = listOf("Lcom/facebook/react/bridge/ReadableMap;", PROMISE),
    returnType = "V",
)

internal object MedalliaInitializeFingerprint : Fingerprint(
    definingClass = "Lcom/medallia/digital/mobilesdk/reactlibrary/Medallia;",
    name = "initialize",
    parameters = listOf("Ljava/lang/String;", PROMISE),
    returnType = "V",
)

private val RESOLVE_PROMISE = """
    const/4 v0, 0x0
    invoke-interface { p2, v0 }, $PROMISE->resolve(Ljava/lang/Object;)V
    return-void
""".trimIndent()

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops the app's analytics, ad measurement, and marketing services.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute {
        DynatraceStartupFingerprint.method.returnEarly("return-void")
        AdobeInitializeFingerprint.method.returnEarly(RESOLVE_PROMISE)
        MedalliaInitializeFingerprint.method.returnEarly(RESOLVE_PROMISE)

        blockTrackers()
    }
}
