package app.fakh.patches.coverscreen

import app.fakh.patches.coverscreen.shared.Constants.COMPATIBILITY_COVERSCREEN
import app.fakh.patches.shared.disableProviders
import app.fakh.patches.shared.pairip.pairipLicenseCheckPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch

/**
 * The Pro state lives on the Room entity `apps.ijp.coverscreenos.db.OSProperties`
 * (SQLCipher database, written by the native `sabtopw` method after a Firebase
 * license validation). Every Java-side reader goes through its getters:
 *
 * - `A()` returns the `vanisb` field, the Pro flag. The settings UI reads it at
 *   every feature gate (15+ call sites in CoverOSSettings alone) and the cover
 *   engine gates notification actions on it.
 * - `B()` returns `varMirSam`, the trial expiry timestamp. The engine's lock
 *   check is `licensed = I() || B() > now`, so a far-future value keeps the
 *   trial branch open forever.
 * - `z()` returns `valer`, the license email (sentinel `-1` when none). The
 *   engines' `I()` and the "has license email" flows (`H1`, `i2`) all compare
 *   it against the sentinel, and the paywall card keys off those flows.
 *
 * The license itself is validated server-side (Firestore + App Check, device
 * model bound), but forcing the getters makes every read see a licensed state
 * regardless of what the server wrote.
 */
private val isProFingerprint = Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    custom = { method, classDef ->
        classDef.type == "Lapps/ijp/coverscreenos/db/OSProperties;" &&
            method.name == "A" &&
            method.implementation != null
    },
)

private val trialExpiryFingerprint = Fingerprint(
    returnType = "J",
    parameters = listOf(),
    custom = { method, classDef ->
        classDef.type == "Lapps/ijp/coverscreenos/db/OSProperties;" &&
            method.name == "B" &&
            method.implementation != null
    },
)

private val licenseEmailFingerprint = Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    custom = { method, classDef ->
        classDef.type == "Lapps/ijp/coverscreenos/db/OSProperties;" &&
            method.name == "z" &&
            method.implementation != null
    },
)

/**
 * `CoverScreenOSApplication.n()` exists only to launch the coroutine that
 * initializes AdMob (`ze3` case 0, all it does is the `MobileAds` init chain).
 * The disabled init provider alone still leaves this eager init running and
 * fetching config on every launch. Premium hides every ad slot, so nothing
 * waits on it.
 */
private val adsInitFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf(),
    custom = { method, classDef ->
        classDef.type == "Lapps/ijp/coverscreenos/CoverScreenOSApplication;" &&
            method.name == "n" &&
            method.implementation != null
    },
)

/**
 * The two-boolean state holder (`a`, `b`) behind the timeout dialog: its text
 * and second button depend on `a`. See the execute block note.
 */
private val az5HolderFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf("Z", "Z"),
    custom = { method, classDef ->
        classDef.type == "Laz5;" && method.name == "<init>" && method.implementation != null
    },
)

/**
 * The billing/license snapshot (`ni5`) that `vw` builds from the Firebase
 * `app_bundle` claims and the Play purchases. Its second boolean is the Pro
 * verdict: `cx.g` (the flow `CoverOSSettings.a()` reads first, before falling
 * back to the license email) maps it straight to `Boolean`, and the settings
 * ad rows and the paywall card key off that. It stays false with no real
 * license, whatever the OSProperties getters say.
 */
private val billingStateFingerprint = Fingerprint(
    returnType = "V",
    custom = { method, _ ->
        // R8 renames the class every release, so match the constructor shape.
        method.name == "<init>" &&
            method.parameterTypes.map { it.toString() }.let { types ->
                types.size == 16 &&
                    types.slice(listOf(0, 1, 3, 4, 5, 6, 9, 14)) == listOf("Z", "Z", "Z", "Z", "Z", "Z", "Z", "I") &&
                    types.slice(listOf(7, 8, 10, 11, 12)).all { it == "Ljava/util/List;" } &&
                    types[13] == "Ljava/lang/String;"
            }
    },
)

/**
 * Ad and analytics SDKs that start themselves from a content provider before
 * `Application.onCreate`. Facebook also logs app events (its own analytics)
 * from the same init.
 */
private val adSdksManifestPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { manifest ->
            manifest.disableProviders(
                "com.google.android.gms.ads.MobileAdsInitProvider",
                "com.facebook.internal.FacebookInitProvider",
                "com.facebook.ads.AudienceNetworkContentProvider",
            )
        }
    }
}

@Suppress("unused")
val premiumUnlockPatch = bytecodePatch(
    name = "Premium unlock",
    description = "Unlocks Pro on your phone (every premium feature, no ads), keeps the trial from expiring, " +
        "stops the Play license check from closing the app, and stops the ad SDKs from starting so they cannot " +
        "load ads in the background.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_COVERSCREEN)
    category("Premium")
    dependsOn(adSdksManifestPatch, pairipLicenseCheckPatch)

    execute {
        isProFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )
        // ~256e9 ms, year ~9780. The lock check only compares it against the current time.
        trialExpiryFingerprint.method.addInstructions(
            0,
            """
                const-wide v0, 0x3b9aca0000L
                return-wide v0
            """,
        )
        licenseEmailFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "csospro@device.local"
                return-object v0
            """,
        )
        adsInitFingerprint.method.addInstructions(0, "return-void")
        // p2 is the Pro verdict (`b`), p6 is `f`, which the subscription sheet reads
        // (`t7b`) to pick "Manage Subscription" over the purchase options. The
        // registers sit above v15, so const/4 cannot encode them.
        billingStateFingerprint.method.addInstructions(
            0,
            """
                const/16 p2, 0x1
                const/16 p6, 0x1
            """,
        )

        // The timeout dialog (`lz3`) reads `az5.a` off a StateFlow to pick its
        // text and to show or hide its second button. Force `a` true for every
        // instance; the class is a plain data holder with exactly three
        // consumers (the dialog, one flow mapper and one flow producer).
        // The constructor has no locals, so v0 is `this`: overwrite the parameter instead.
        az5HolderFingerprint.method.addInstructions(0, "const/4 p1, 0x1")
    }
}
