package ee.morphe.patches.appsales.pro

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly

@Suppress("unused")
val enableProPatch = bytecodePatch(
    name = "Enable Pro",
    description = "Enables Appsales features locked behind the subscription paywall and disables UI prompts for Appsales Premium."
) {
    compatibleWith(Compatibility(
        name = "AppSales",
        packageName = "net.tsapps.appsales",
        appIconColor = 0x428BCA,
        targets = listOf(AppTarget("12.3"))
    ))

    execute {
        // 1. Force the app to initialize the Premium status to true by faking the SharedPreferences value for "pu"
        GetBooleanPrefFingerprint.method.addInstructions(
            0,
            """
            const-string v0, "pu"
            invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :cond_skip
            const/4 v0, 0x1
            return v0
            :cond_skip
            """
        )

        // 1.5. Force the UI to show pro as activated by returning a valid SKU for "premium_sku"
        GetStringPrefFingerprint.method.addInstructions(
            0,
            """
            const-string v0, "premium_sku"
            invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :cond_skip_str
            const-string v0, "as_premium_yearly"
            return-object v0
            :cond_skip_str
            """
        )

        // 2. Prevent the server response from downgrading the premium status
        ClearPremiumUserFingerprint.method.returnEarly()

        // 3. Disable any UI prompts that might still pop up by returning early from the dialog method
        ShowPremiumDialogFingerprint.method.returnEarly()
    }
}
