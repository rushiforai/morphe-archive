package app.template.patches.vesselfinder.misc.ads

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_VESSELFINDER
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.misc.ads.neutraliseMobileAdsStatics
import app.template.patches.vesselfinder.misc.license.disableLicenseCheckPatch
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// The Capacitor plugin behind the web layer's "Advert" bridge. Its class name is the classpath in
// assets/capacitor.plugins.json, which Capacitor loads reflectively, so R8 must keep it; the
// @PluginMethod handlers keep their names for the same reason (the JS side calls them by name).
private const val ADVERT_PLUGIN = "Lcom/izosa/advert/AdvertPlugin;"
private const val PLUGIN_CALL = "Lcom/getcapacitor/PluginCall;"
private const val PLUGIN_METHOD = "Lcom/getcapacitor/PluginMethod;"
private const val MOBILE_ADS = "Lcom/google/android/gms/ads/MobileAds;"

// VesselFinder is a Capacitor/Angular app. Premium ("No advertisements") is an account role from
// the server, so ads cannot be unlocked locally; instead the one ad path is cut. The web layer's
// AuthService.advert() calls Advert.show({id: <banner unit>}) + Advert.resize() for free users,
// Advert.hide() for paid ones, and pages call Advert.resize() on navigation. All of them are
// fire-and-forget (no await / then). Natively, show() asks for UMP consent, initializes Google
// Mobile Ads, wraps the WebView in a LinearLayout and adds an adaptive AdView below it; resize()
// and fullscreen() are empty and hide() only acts on an existing AdView. The app has no other ad
// code (the AdvertPlugin's interstitial field is never loaded).
//
// The web layer reserves no banner space: its ion-router-outlet.advert height rule is never
// applied (the template binds no class), so with show() cut the WebView keeps the full screen.
@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes all ads."
) {
    compatibleWith(COMPATIBILITY_VESSELFINDER)

    // Every patched build is re-signed and would otherwise stop at the license paywall.
    dependsOn(disableLicenseCheckPatch)

    execute {
        val plugin = mutableClassDefBy(ADVERT_PLUGIN)

        // 1. Every @PluginMethod handler (show, hide, resize, fullscreen) resolves its call and
        // returns. The stock handlers never settle the call; resolving matches the web fallback
        // (AdvertWeb resolves) and keeps any future awaiting caller from hanging. show() thus
        // never asks for consent, starts the SDK or wraps the WebView, so there is no banner gap.
        val handlers = plugin.methods.filter { it.isPluginMethod() }
        if (handlers.none { it.name == "show" }) {
            throw PatchException("Disable ads: no @PluginMethod show(PluginCall) on $ADVERT_PLUGIN (found ${handlers.map { it.name }})")
        }
        handlers.forEach {
            it.addInstructionsChecked(
                0,
                """
                    invoke-virtual {p1}, $PLUGIN_CALL->resolve()V
                    return-void
                """,
            )
        }

        // 2. The plugin's SDK start (initializeMobileAdsSdk, found by its MobileAds.initialize
        // call) returns at once, should anything still reach it.
        val initializers = plugin.methods.filter { it.returnType == "V" && it.callsMobileAdsInitialize() }
        if (initializers.isEmpty()) throw PatchException("Disable ads: no $ADVERT_PLUGIN method calls MobileAds.initialize")
        initializers.forEach { it.returnEarly() }

        // 3. Backstop at the SDK: never initialize Google Mobile Ads, and neuter every MobileAds
        // static that needs it (AGENTS.md rule 9).
        neutraliseMobileAdsStatics("initialize")
    }
}

// Public void handler(PluginCall) annotated @PluginMethod, with a body.
private fun Method.isPluginMethod() =
    returnType == "V" && implementation != null &&
        parameterTypes.map(CharSequence::toString) == listOf(PLUGIN_CALL) &&
        annotations.any { it.type == PLUGIN_METHOD }

private fun Method.callsMobileAdsInitialize() = implementation?.instructions?.any {
    val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
    ref?.definingClass == MOBILE_ADS && ref.name == "initialize"
} == true
