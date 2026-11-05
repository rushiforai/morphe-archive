package semicoloncolonel.mobilestream.patches.xfinity.privacy

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.Method
import semicoloncolonel.mobilestream.patches.shared.misc.forEachMatchingMethod
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers
import semicoloncolonel.mobilestream.patches.xfinity.shared.Constants

// Xfinity 6.14.0-2. The app's own wrappers start each SDK, so each wrapper
// returns at once:
//   Comcast's own event pipeline (Sift): the tracker is never set up, and
//     every event and ID call returns. They are stopped together, since the
//     setters throw on an uninitialized tracker.
//   Datadog RUM and tracing: never initialized. The app's network
//     interceptors fall back to none.
//   Medallia surveys: never initialized.
//   Branch: never initialized, and sessions never start.
//   Firebase Analytics: user properties are not set, and collection is
//     switched off in the manifest.
//
// Not touched: sign-in (including its device fingerprint), Plaid bank
// linking, Crashlytics, and Bluetooth setup of gateways, Pods, and cameras.

private const val SIFT = "Lcom/xfinity/dh/analytics/sift/AnalyticsProcessor;"

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
        fun stop(what: String, minimum: Int, classFilter: (String) -> Boolean, methodFilter: (Method) -> Boolean, smali: String) {
            val count = forEachMatchingMethod({ classFilter(it.type) }, methodFilter) { it.returnEarly(smali) }
            if (count < minimum) throw PatchException("$what not found ($count)")
        }

        stop(
            "Sift tracker setup", 5,
            { it == SIFT },
            { it.returnType == "V" && it.name in setOf("configureAndInitializeTracker", "setAccountId", "setPartnerId", "setSessionId", "tagEvent") },
            "return-void",
        )
        stop(
            "Sift structured events", 1,
            { it == SIFT },
            { it.name == "logStructuredEvent" && it.returnType == "Ljava/lang/Object;" },
            "sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;\nreturn-object v0",
        )
        stop(
            "Datadog initializer", 1,
            { it == "Lcom/xfinity/dh/tracing/DefaultDataDogInitializer;" },
            { it.name == "initialize" && it.returnType == "V" && it.parameterTypes.isEmpty() },
            "return-void",
        )
        stop(
            "Medallia initializer", 1,
            { it == "Lcom/xfinity/dh/medallia/init/DefaultMedalliaInitializer;" },
            { it.name == "initialize" && it.returnType == "V" && it.parameterTypes.isEmpty() },
            "return-void",
        )
        stop(
            "Branch initializer", 2,
            { it == "Lcom/xfinity/digitalhome/features/branchio/DefaultBranchIOInitializer;" },
            { (it.name == "initializeBranchIO" || it.name == "initializeBranchSession") && it.returnType == "V" },
            "return-void",
        )
        stop(
            "Firebase user properties", 1,
            { it == "Lcom/xfinity/digitalhome/utils/settings/FirebaseUserPropertyTracker;" },
            { it.name == "setUserProperty" && it.returnType == "V" },
            "return-void",
        )

        blockTrackers()
    }
}
