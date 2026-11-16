package app.danielthemaniel.patches.campfire

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import java.util.logging.Logger

// -------------------------------------------------------------------------------------
// Campfire's UI is an Ionic web app inside a Capacitor WebView, so Android color resources
// don't reach it. The theme lives in Ionic CSS variables (--ion-color-*, --ion-background-color,
// --ion-text-color, --ion-color-step-*), plus a lot of hard-coded hex colors in the CSS.
//
// Everything happens at runtime, in the extension (MaterialYou / ThemeCss):
//
//  1. JSInjector.getScriptString(): Capacitor injects its bridge JS into index.html; we append
//     a <style> with the device's Monet palette (light or dark per system), overriding :root
//     and any body-class theme ("discovery", game themes).
//
//  2. WebViewLocalServer.handleLocalRequest(): every stylesheet is rewritten as it's served —
//     brand cyan / navy / white / light-grey literals -> var(--my-*, <orig>), other light
//     backgrounds and dark text -> color-mix() toward the theme. Done at serve time (not on
//     the APK assets) because Campfire downloads OTA web bundles (Capgo) from nianticlabs.com
//     and serves them from storage.
//
//  3. Bridge.onResume() / Bridge.onConfigurationChanged(): the app's html/body are transparent,
//     so the native WebView background shows through; paint it with the theme background. On
//     uiMode changes (MainActivity handles uiMode itself, no reload) re-theme the open page.
// -------------------------------------------------------------------------------------

private const val LOCAL_SERVER = "Lcom/getcapacitor/WebViewLocalServer;"
private const val BRIDGE = "Lcom/getcapacitor/Bridge;"
private const val CONFIGURATION = "Landroid/content/res/Configuration;"
private const val RESPONSE = "Landroid/webkit/WebResourceResponse;"
private const val EXT = "Lapp/danielthemaniel/patches/campfire/extension/MaterialYou;"

private val logger = Logger.getLogger("CampfireMaterialYou")

@Suppress("unused")
val materialYouThemePatch = bytecodePatch(
    name = "Material You Theme",
    description = "Uses Android 12+ wallpaper-derived Material You colors throughout Campfire, " +
        "with a dark theme that follows the system. Keeps success/warning/danger and game-brand colors.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CAMPFIRE)
    dependsOn(sharedPermissionFixPatch, campfireExtensionPatch)

    execute {
        // 1. Palette <style>, appended to Capacitor's injected script.
        mutableClassDefBy(JS_INJECTOR).methods.firstOrNull {
            it.name == "getScriptString" && it.parameterTypes.isEmpty() && it.returnType == STRING
        }.orScriptStringNotFound()
            .filterReturns("$EXT->appendTheme($STRING)$STRING")

        // 2. Stylesheet rewrite for every locally served file (APK assets and OTA bundles).
        mutableClassDefBy(LOCAL_SERVER).methods.firstOrNull {
            it.name == "handleLocalRequest" && it.returnType == RESPONSE
        }?.filterReturns("$EXT->filterResponse($RESPONSE)$RESPONSE")
            ?: throw PatchException("WebViewLocalServer.handleLocalRequest() not found")

        // 3. Native WebView background + live light/dark switching.
        val bridge = mutableClassDefBy(BRIDGE)
        bridge.methods.firstOrNull {
            it.name == "onResume" && it.parameterTypes.isEmpty()
        }?.addInstructions(0, "invoke-static/range {p0 .. p0}, $EXT->onBridgeResume(Ljava/lang/Object;)V")
            ?: logger.warning("Bridge.onResume not found; WebView background stays white")

        bridge.methods.firstOrNull {
            it.name == "onConfigurationChanged" &&
                it.parameterTypes.map { p -> p.toString() } == listOf(CONFIGURATION)
        }?.addInstructions(
            0,
            "invoke-static/range {p0 .. p1}, $EXT->onConfigurationChanged(Ljava/lang/Object;$CONFIGURATION)V",
        ) ?: logger.warning("Bridge.onConfigurationChanged not found; dark mode applies on next launch")
    }
}
