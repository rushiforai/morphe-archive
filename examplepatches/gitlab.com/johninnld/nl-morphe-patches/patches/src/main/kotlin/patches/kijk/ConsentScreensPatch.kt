package patches.kijk

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import patches.atv.exact

@Suppress("unused")
val skipConsentScreens = bytecodePatch(
    name = "Skip consent screens",
    description = "Rejects optional OneTrust purposes through its genuine ready-state save path, skips automatic cookie and notification prompts, and defaults notifications off while retaining manual privacy and notification choices.",
) {
    dependsOn(originalInput, disableTracking)
    compatibleWith(kijk)
    execute {
        // L is reached only from the original SDK-success callback. Save the same
        // genuine action as OneTrust's Reject All button, then complete through r.
        // Migrate once, also on already-accepted installs; retain later manual
        // choices until OneTrust requires fresh consent for a changed template.
        exact("Lcom/nakko/android/radio10gold/businesslogic/v2/consent/h;",
            "L()V", 4, 29)
            .addInstructions(0, "sget-object v0, Lcom/nakko/android/radio10gold/businesslogic/v2/consent/h;->e:Lcom/onetrust/otpublishers/headless/Public/OTPublishersHeadlessSDK;\nif-eqz v0, :complete\niget-object v1, v0, Lcom/onetrust/otpublishers/headless/Public/OTPublishersHeadlessSDK;->a:Landroid/content/Context;\nconst-string v2, \"dutch_kijk_privacy\"\nconst/4 p0, 0x0\ninvoke-virtual {v1, v2, p0}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;\nmove-result-object v1\nconst-string v2, \"reject_optional_v1\"\ninvoke-interface {v1, v2}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z\nmove-result p0\nif-eqz p0, :reject\ninvoke-virtual {v0}, Lcom/onetrust/otpublishers/headless/Public/OTPublishersHeadlessSDK;->shouldShowBanner()Z\nmove-result p0\nif-eqz p0, :complete\n:reject\nconst-string v2, \"Banner - Reject All\"\ninvoke-virtual {v0, v2}, Lcom/onetrust/otpublishers/headless/Public/OTPublishersHeadlessSDK;->saveConsent(Ljava/lang/String;)V\ninvoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences\$Editor;\nmove-result-object v1\nconst-string v2, \"reject_optional_v1\"\nconst/4 p0, 0x1\ninvoke-interface {v1, v2, p0}, Landroid/content/SharedPreferences\$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences\$Editor;\ninvoke-interface {v1}, Landroid/content/SharedPreferences\$Editor;->apply()V\n:complete\nsget-object v0, Lcom/nakko/android/radio10gold/businesslogic/v2/consent/h;->a:Lcom/nakko/android/radio10gold/businesslogic/v2/consent/h;\ninvoke-virtual {v0}, Lcom/nakko/android/radio10gold/businesslogic/v2/consent/h;->r()V\nreturn-void")
        exact("Lcom/nakko/android/radio10gold/utils/B;",
            "a(Landroid/app/Activity;)V", 3, 8)
            .addInstructions(0, "return-void")
        exact("Lcom/nakko/android/radio10gold/businesslogic/manager/H;",
            "s()Z", 4, 6)
            .addInstructions(0, "iget-object v0, p0, Lcom/nakko/android/radio10gold/businesslogic/manager/H;->a:Landroid/content/SharedPreferences;\nconst-string v1, \"dutch_kijk_push_choice_v1\"\ninvoke-interface {v0, v1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z\nmove-result v2\nif-nez v2, :read\ninvoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences\$Editor;\nmove-result-object p0\nconst-string v1, \"push_notification_enabled\"\nconst/4 v2, 0x0\ninvoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences\$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences\$Editor;\nconst-string v1, \"dutch_kijk_push_choice_v1\"\nconst/4 v2, 0x1\ninvoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences\$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences\$Editor;\ninvoke-interface {p0}, Landroid/content/SharedPreferences\$Editor;->apply()V\n:read\nconst-string v1, \"push_notification_enabled\"\nconst/4 v2, 0x0\ninvoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z\nmove-result v0\nreturn v0")
        exact("Lcom/nakko/android/radio10gold/businesslogic/manager/H;",
            "F(Z)V", 4, 7)
            .addInstructions(0, "iget-object v0, p0, Lcom/nakko/android/radio10gold/businesslogic/manager/H;->a:Landroid/content/SharedPreferences;\ninvoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences\$Editor;\nmove-result-object v0\nconst-string v1, \"dutch_kijk_push_choice_v1\"\ninvoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences\$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences\$Editor;\ninvoke-interface {v0}, Landroid/content/SharedPreferences\$Editor;->apply()V")
    }
}
