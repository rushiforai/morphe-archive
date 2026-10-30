package patches.negentwee

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val disableTracking = bytecodePatch(
    name = "Disable tracking",
    description = "Disables optional app analytics, diagnostic collection, queued Firebase measurements, Usercentrics session pixels and Adyen analytics. Includes Hide ads. Preserves the functional API identity, travel location, consent choices, notifications and genuine checkout outcomes.",
) {
    dependsOn(originalInput, hideAds, trackingResources)
    compatibleWith(negentwee)
    execute {
        exact("Llq;", "f(Ljava/lang/String;Landroid/os/Bundle;)V", 17, 9, 11)
            .addInstructions(0, "return-void")
        exact("Llq;", "j(Llq;Ljava/lang/String;Ljava/io/Serializable;I)V", 9, 12, 44)
            .addInstructions(0, "return-void")
        // Retain validation, Object initialization, fields and the native UUID
        // read/create. Only its publication to analytics/diagnostics is omitted.
        exact("Lyz;", "<init>(Lqg9;Lru2;Llq;)V", 65537, 5, 18)
            .addInstructions(8, "return-void")
        val arbiter = "Lcom/google/firebase/crashlytics/internal/common/DataCollectionArbiter;"
        exact(arbiter, "isAutomaticDataCollectionEnabled()Z", 131073, 2, 15)
            .addInstructions(0, "const/4 v0, 0x0\nreturn v0")
        exact(arbiter, "setCrashlyticsDataCollectionEnabled(Ljava/lang/Boolean;)V", 131073, 5, 45)
            .addInstructions(0, "sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;")
        // Use the existing unavailable-settings outcome after native worker and
        // token validation. Collection flags alone do not stop this HTTP client.
        exact("Lcom/google/firebase/crashlytics/internal/settings/DefaultSettingsSpiCall;",
            "invoke(Lcom/google/firebase/crashlytics/internal/settings/SettingsRequest;Z)Lorg/json/JSONObject;",
            1, 8, 39).addInstructions(5, "return-object v2")
        exact("Lbd1;", "a(JLjava/lang/String;)V", 17, 11, 59)
            .addInstructions(0, "return-void")
        exact("Lcg;", "s(Ljava/lang/String;Lez2;)Ljava/lang/Object;", 1, 33, 413)
            .addInstructions(0, "sget-object v0, Lc9d;->a:Lc9d;\nreturn-object v0")
        suppressPersistedMeasurement()
    }
}
