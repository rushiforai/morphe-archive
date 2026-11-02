package semicoloncolonel.mobilestream.patches.homedepot.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import semicoloncolonel.mobilestream.patches.homedepot.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.AI_FILTER
import semicoloncolonel.mobilestream.patches.shared.misc.forEachMatchingMethod
import semicoloncolonel.mobilestream.patches.shared.misc.hasSignature
import semicoloncolonel.mobilestream.patches.shared.misc.prependGate

// ─────────────────────────────────────────────────────────────────────────────
// Disable AI (OPT-IN, default OFF).
//
// The Home Depot 8.2.5 gates Magic Apron, its AI project assistant, with the
// remote flag EnableMagicApronChat, read through two APIs: the remote config
// engine (IRemoteConfigEngine.e) and the app dependency provider
// (AppDependency.getRemoteConfigFSFlag). Both are gated so Magic Apron flags
// read as off, which removes the native chat and its entry points.
//
// The web pages the app shows also have their own Magic Apron button, which
// the app normally redirects to its native chat. With the flag off the web
// button would work on its own, so every page the app's web client finishes
// loading gets a style rule that hides it.
// ─────────────────────────────────────────────────────────────────────────────

private const val REMOTE_CONFIG_ENGINE = "Lcom/thehomedepot/core/remoteconfigengine/IRemoteConfigEngine;"
private const val APP_DEPENDENCY = "Lcom/thehomedepot/app_dependency_manager/AppDependency;"

internal object WebviewModulePageFinishedFingerprint : Fingerprint(
    definingClass = "Lcom/thehomedepot/webviewcore/clients/THDWebviewModuleClient;",
    name = "onPageFinished",
    parameters = listOf("Landroid/webkit/WebView;", "Ljava/lang/String;"),
    returnType = "V",
)

private const val KEY_GATE = """
    invoke-static/range { p1 .. p1 }, $AI_FILTER->isHomeDepotAiKey(Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :msp_orig
    const/4 v0, 0x0
    return v0
"""

@Suppress("unused")
val disableAiPatch = bytecodePatch(
    name = "Disable AI",
    description = "Turns off Magic Apron, The Home Depot's AI project assistant, in the app and " +
        "hides its chat button on the store's web pages inside the app. Opt-in / " +
        "experimental; test on-device.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        val gated = forEachMatchingMethod(
            { classDef ->
                !AccessFlags.INTERFACE.isSet(classDef.accessFlags) &&
                    classDef.interfaces.any { it == REMOTE_CONFIG_ENGINE || it == APP_DEPENDENCY }
            },
            { method ->
                (method.name == "e" && method.hasSignature("Z", "Ljava/lang/String;")) ||
                    (method.name == "getRemoteConfigFSFlag" && method.hasSignature("Z", "Ljava/lang/String;", "Z"))
            },
        ) { method -> method.prependGate(KEY_GATE.trimIndent()) }
        if (gated < 2) throw PatchException("Home Depot remote config readers not found ($gated)")

        // onPageFinished(WebView, url): p1 is the WebView.
        WebviewModulePageFinishedFingerprint.method.addInstructions(
            0,
            "invoke-static/range { p1 .. p1 }, $AI_FILTER->hideHomeDepotWebAssistant(Landroid/webkit/WebView;)V",
        )
    }
}
