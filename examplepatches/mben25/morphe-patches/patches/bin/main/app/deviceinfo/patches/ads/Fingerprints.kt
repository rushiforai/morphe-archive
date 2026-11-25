package app.deviceinfo.patches.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall

/**
 * DeviceInfo 3.4.3.4 shows native ads (via the new `com.google.android.libraries.ads.mobile.sdk`
 * ads-mobile-sdk, with Facebook Audience Network as a mediation network) on six screens:
 * dashboard, Wi-Fi/app analyzer, sensors, battery, memory and the automatic tests list, plus a
 * "tools" list screen. Every one of those screens is otherwise unobfuscated app code
 * (`SensorActivity`, `AutomaticTestActivity`, ...) or a lightly-renamed sibling Fragment, but each
 * of them constructs the *same* single obfuscated class — `Lgq1;` in this build — passing it an
 * ad-unit-id string literal and a `Landroid/os/Bundle`-less lifecycle owner:
 *
 *   `new-instance v0, Lgq1;` ... `invoke-direct {...}, Lgq1;-><init>(Lom;Ljava/lang/String;I...)V`
 *
 * `Lgq1` is a lifecycle-aware native ad loader/holder (it registers itself as a lifecycle
 * observer in its constructors). Its instance method that actually performs the ad request is
 * the one that:
 *  - takes a single object parameter (the lifecycle owner) and returns void,
 *  - calls this class's own no-arg boolean method (`a()Z`, a "can I skip loading" check) before
 *    doing anything else.
 * That method is called from two lifecycle callbacks (`g`/`h` in this build, roughly
 * onStart/onCreate) so stubbing deeper call sites would require patching multiple methods; this
 * one method is the single choke point all of them funnel through, exactly analogous to
 * masareef's `AdsManagerLoadAdFingerprint`.
 *
 * The `custom` check further requires the class to hold a field of the ad SDK's internal ad
 * holder type (`Lads_mobile_sdk/bu1;` in this build) so this can't accidentally match some
 * unrelated method elsewhere with the same trivial shape.
 */
object NativeAdLoadTriggerFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("L"),
    filters = listOf(
        // Every load attempt starts by asking "can this be skipped" via a same-class,
        // no-arg, boolean-returning helper before touching the ad SDK.
        methodCall(
            definingClass = "this",
            returnType = "Z",
            parameters = emptyList(),
        ),
    ),
    custom = { _, classDef ->
        classDef.fields.any { it.type == "Lads_mobile_sdk/bu1;" }
    },
)
