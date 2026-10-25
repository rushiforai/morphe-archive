package app.template.patches.transfermarkt.misc.telemetry

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_TRANSFERMARKT
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.transfermarkt.shared.interceptWebViewRequests
import app.template.patches.transfermarkt.shared.webViewBlocklistExtensionPatch

@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Disables analytics and tracking.",
) {
    compatibleWith(COMPATIBILITY_TRANSFERMARKT)

    dependsOn(webViewBlocklistExtensionPatch)

    execute {
        // 1. Requests to the tracker hosts get an empty script (see the extension). The web app
        // still defines dataLayer / tmAnalytics itself, so its tracking calls keep working as no-ops.
        interceptWebViewRequests("blockTelemetry", "Disable telemetry")

        // 2. The idfa plugin answers an empty advertising ID with tracking limited, without asking
        // Google Play services for the real one. The snippet needs three locals (4.3.2: .locals 4).
        val getInfo = IdfaGetInfoFingerprint.method
        val locals = getInfo.implementation!!.registerCount - 2
        if (locals < 3) throw PatchException("Disable telemetry: IdfaPlugin.getInfo has $locals locals, the hook needs 3")
        getInfo.addInstructionsChecked(
            0,
            """
                new-instance v0, Lorg/json/JSONObject;
                invoke-direct { v0 }, Lorg/json/JSONObject;-><init>()V
                const-string v1, "aaid"
                const-string v2, ""
                invoke-virtual { v0, v1, v2 }, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
                const-string v1, "trackingLimited"
                const/4 v2, 0x1
                invoke-virtual { v0, v1, v2 }, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
                invoke-virtual { p1, v0 }, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONObject;)V
                return-void
            """,
        )
    }
}
