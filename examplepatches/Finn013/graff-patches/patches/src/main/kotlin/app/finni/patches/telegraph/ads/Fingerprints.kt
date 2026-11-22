package app.finni.patches.telegraph.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall

/** Method that initialises AppLovin MAX / InMobi / AdMob mediation (sets consent first). */
internal object AdSdkInitFingerprint : Fingerprint(
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/applovin/sdk/AppLovinPrivacySettings;",
            name = "setHasUserConsent",
        ),
    ),
)
