package app.template.patches.onecricket.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_ONECRICKET
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val ADS = "Lone/cricket/app/ads/"
private const val GMA = "Lcom/google/android/gms/ads/"

// Every placement goes through these app wrappers (class names kept, methods R8-renamed),
// so their entry points are matched by parameter shape. BannerAdLoader and AppOpenAdLoader
// each have two methods with the same shape (the loader and a thin wrapper); all are patched.
private val WRAPPER_ENTRY_POINTS = mapOf(
    "${ADS}BannerAdLoader;" to listOf(
        "Landroid/app/Activity;", "Ljava/lang/String;", "Ljava/lang/String;",
        "Ljava/lang/String;", "Landroid/os/Bundle;", "Lorg/json/JSONObject;", "J",
    ),
    "${ADS}InterstitialAdLoader;" to listOf(
        "Landroid/app/Activity;", "Lone/cricket/app/MyApplication;", "Landroid/content/Context;",
        "Ljava/lang/String;", "Ljava/lang/String;", "Landroid/os/Bundle;", "Ljava/lang/String;",
        "Lorg/json/JSONObject;", "I",
    ),
    "${ADS}InlineNativeAdLoader;" to listOf(
        "Landroid/content/Context;", "Ljava/lang/String;", "Ljava/lang/String;",
        "Lorg/json/JSONObject;", "I",
    ),
    "${ADS}AppOpenAdLoader;" to listOf(
        "Lone/cricket/app/MyApplication;", "Ljava/lang/String;", "Ljava/lang/String;",
        "Lorg/json/JSONObject;",
    ),
)

// AdMob is the fallback network and the mediation entry for every other bundled SDK.
private val GMA_LOADERS = listOf(
    "BaseAdView",
    "AdLoader",
    "interstitial/InterstitialAd",
    "admanager/AdManagerInterstitialAd",
    "appopen/AppOpenAd",
)

// Containers that render a "loading" placeholder as soon as they are built; with no ad
// ever loading they would stay as empty boxes, so they are kept GONE.
private val AD_CONTAINERS = listOf(
    "${ADS}BannerAdViewContainer;",
    "${ADS}InlineBannerAdView;",
    "${ADS}MediumBannerAdView;",
    "Lone/cricket/app/utils/BannerAdView;",
)

private fun BytecodePatchContext.neuter(owner: String, label: String, predicate: (List<String>, String) -> Boolean) {
    val targets = mutableClassDefBy(owner).methods.filter { method ->
        method.implementation != null &&
            method.returnType == "V" &&
            predicate(method.parameterTypes.map(CharSequence::toString), method.name)
    }
    if (targets.isEmpty()) throw PatchException("No $label entry point found on $owner")
    targets.forEach { it.returnEarly() }
}

/** Forces the view to stay GONE by overriding (or prepending to) setVisibility(int). */
private fun BytecodePatchContext.keepGone(type: String) {
    val classDef = mutableClassDefBy(type)
    val existing = classDef.methods.firstOrNull {
        it.name == "setVisibility" && it.parameterTypes.map(CharSequence::toString) == listOf("I")
    }
    if (existing != null) {
        existing.addInstructions(0, "const/16 p1, 0x8")
        return
    }
    val superclass = classDef.superclass ?: throw PatchException("$type has no superclass")
    classDef.methods.add(
        ImmutableMethod(
            type,
            "setVisibility",
            listOf(ImmutableMethodParameter("I", null, null)),
            "V",
            AccessFlags.PUBLIC.value,
            null,
            null,
            MutableMethodImplementation(2),
        ).toMutable().apply {
            addInstructions(
                0,
                """
                    const/16 p1, 0x8
                    invoke-super {p0, p1}, $superclass->setVisibility(I)V
                    return-void
                """.trimIndent()
            )
        }
    )
}

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Disables banner, interstitial, native/inline and app-open ads and hides " +
            "the empty ad slots."
) {
    compatibleWith(COMPATIBILITY_ONECRICKET)

    execute {
        // App wrappers: no placement ever requests an ad.
        WRAPPER_ENTRY_POINTS.forEach { (owner, parameters) ->
            neuter(owner, "ad loader") { params, _ -> params == parameters }
        }
        // App-open ads on every foreground transition (lifecycle callback keeps its name).
        neuter("${ADS}AppOpenManager;", "app-open") { params, name ->
            name == "onStart" && params.isEmpty()
        }

        // AdMob backstop: never initialize, every load is a no-op.
        neuter("${GMA}MobileAds;", "MobileAds.initialize") { _, name -> name == "initialize" }
        GMA_LOADERS.forEach { relative ->
            neuter("$GMA$relative;", relative) { _, name ->
                name == "load" || name == "loadAd" || name == "loadAds"
            }
        }

        AD_CONTAINERS.forEach { keepGone(it) }
    }
}
