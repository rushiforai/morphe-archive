package patches.candysoda

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import com.android.tools.smali.dexlib2.Opcode
import patches.shared.disableComponents
import patches.shared.disableMeasurementAndAttribution

private const val ANDROID = "http://schemas.android.com/apk/res/android"
private const val APPSFLYER = "Lcom/king/usdk/appsflyer/AppsFlyerModule;"
private const val BRAZE = "Lcom/king/usdk/braze/BrazeAndroidModule;"
private const val FIREBASE = "Lcom/king/firebaseanalytics/FirebaseAnalyticsManager;"
private const val ADVERTISING_ID = "Lcom/king/usdk/adinfo/AdvertisingId${'$'}AdvertisingIdInitializer;"
private const val REFERRER = "Lcom/king/usdk/adinfo/ReferrerProvider;"

private val trackingResources = resourcePatch {
    dependsOn(originalInput)
    execute {
        document("AndroidManifest.xml").use { manifest ->
            disableMeasurementAndAttribution(manifest)
            // Attribution receivers and the deferred Braze analytics init stay off.
            disableComponents(
                manifest,
                "com.king.core.ReferrerReceiver",
                "com.king.usdk.kdid.AnalyticsReceiver",
                "com.king.usdk.braze.BrazeDelayedInitializationProvider",
            )
            // Facebook advertiser-ID collection is on by default; the app only disables
            // auto-logged app events itself.
            val application = manifest.getElementsByTagName("application").item(0) as org.w3c.dom.Element
            val flag = manifest.createElement("meta-data").apply {
                setAttributeNS(ANDROID, "android:name", "com.facebook.sdk.AdvertiserIDCollectionEnabled")
                setAttributeNS(ANDROID, "android:value", "false")
            }
            application.appendChild(flag)
        }
    }
}

internal val candySodaTrackingGate = bytecodePatch {
    dependsOn(originalInput, trackingResources)

    execute {
        fun voidMethod(owner: String, name: String, parameters: Int) =
            mutableClassDefBy(owner).methods.singleOrNull {
                it.name == name && it.returnType == "V" && it.parameterTypes.size == parameters
            } ?: error("Candy tracking entry changed: ${owner.substringAfterLast('/')}/$name")

        fun disable(owner: String, name: String, parameters: Int) {
            val method = voidMethod(owner, name, parameters)
            check(method.implementation?.instructions?.firstOrNull()?.opcode != Opcode.RETURN_VOID) {
                "Candy tracking already patched: $name"
            }
            method.addInstructions(0, "return-void")
        }

        // Attribution and advertising identifiers.
        disable(REFERRER, "startFetch", 2)
        disable(ADVERTISING_ID, "run", 0)

        // Analytics SDKs.
        disable(APPSFLYER, "start", 0)
        disable(BRAZE, "configureBraze", 11)
        disable(FIREBASE, "init", 4)
        disable(FIREBASE, "logEvent", 2)
        disable(FIREBASE, "setUserProperty", 2)
    }
}

@Suppress("unused")
val candySodaDisableTracking = bytecodePatch(
    name = "Disable tracking",
    description = "Stops AppsFlyer, Braze, Firebase Analytics and the advertising identifier and " +
        "install-referrer collection, and switches off Google measurement, Crashlytics and Sessions " +
        "upload and Facebook advertiser-ID collection in the manifest. The game keeps working.",
    default = true,
) {
    compatibleWith(candySoda)
    dependsOn(candySodaTrackingGate)
}
