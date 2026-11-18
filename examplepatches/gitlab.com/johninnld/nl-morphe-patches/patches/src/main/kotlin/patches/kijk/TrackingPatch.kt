package patches.kijk

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import patches.atv.exact
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

@Suppress("unused")
val disableTracking = bytecodePatch(
    name = "Disable tracking",
    description = "Disables optional analytics, marketing identifiers and queued telemetry uploads while preserving content and account services.",
) {
    dependsOn(originalInput, trackingResources)
    compatibleWith(kijk)
    execute {
        // Preserve initialized player and push SDKs. Stop optional collectors at
        // their ingress and queue boundaries, including persisted retries.
        exact("Lcom/nakko/android/radio10gold/tracking/e;",
            "Q(Ljava/lang/String;[Lkotlin/U;)V", 31, 154)
            .addInstructions(0, "return-void")
        exact("Lcom/nakko/android/radio10gold/tracking/e;",
            "x()V", 5, 21)
            .addInstructions(0, "return-void")
        exact("Lcom/nakko/android/radio10gold/tracking/comscore/a;",
            "b()V", 3, 24)
            .addInstructions(0, "return-void")
        exact("Lcom/nakko/android/radio10gold/tracking/comscore/a;",
            "c(Lcom/nakko/android/radio10gold/tracking/j;Ljava/lang/Integer;)V", 10, 36)
            .addInstructions(0, "return-void")
        exact("Lcom/nakko/android/radio10gold/tracking/comscore/a;",
            "d(Z)V", 4, 10)
            .addInstructions(0, "return-void")
        exact("Lcom/nakko/android/radio10gold/tracking/comscore/a;",
            "e(Z)V", 4, 10)
            .addInstructions(0, "return-void")
        exact("Lcom/tealium/library/Tealium;",
            "track(Ljava/util/Map;)V", 8, 25)
            .addInstructions(0, "return-void")
        exact("Lcom/tealium/internal/dispatcher/CollectDispatcher;",
            "onDispatchSend(Lcom/tealium/internal/data/Dispatch;)V", 6, 73)
            .addInstructions(0, "return-void")
        exact("Lcom/tealium/internal/dispatcher/CollectDispatcher;",
            "onBulkDispatchSend(Ljava/util/List;)V", 8, 107)
            .addInstructions(0, "return-void")
        exact("Lcom/tealium/internal/dispatcher/WebViewDispatcher;",
            "onDispatchSend(Lcom/tealium/internal/data/Dispatch;)V", 5, 43)
            .addInstructions(0, "return-void")
        exact("Lcom/tealium/internal/dispatcher/WebViewDispatcher;",
            "onBulkDispatchSend(Ljava/util/List;)V", 3, 11)
            .addInstructions(0, "return-void")
        exact("Lcom/tealium/internal/dispatcher/WebViewDispatcher;",
            "attemptLoadPublishAfterDelay()V", 5, 10)
            .addInstructions(0, "return-void")
        exact("Lcom/tealium/internal/dispatcher/WebViewDispatcher;",
            "attemptCheckForUpdatedPublish()V", 6, 39)
            .addInstructions(0, "return-void")
        exact("Lcom/google/android/datatransport/runtime/scheduling/jobscheduling/AlarmManagerSchedulerBroadcastReceiver;",
            "onReceive(Landroid/content/Context;Landroid/content/Intent;)V", 7, 48)
            .addInstructions(0, "return-void")
        exact("Lcom/tealium/internal/dispatcher/WebViewDispatcher;",
            "attemptLoadPublishURL()Z", 9, 80)
            .addInstructions(0, "const/4 v0, 0x0\nreturn v0")
        exact("Lcom/google/android/datatransport/runtime/scheduling/jobscheduling/JobInfoSchedulerService;",
            "onStartJob(Landroid/app/job/JobParameters;)Z", 7, 47)
            .addInstructions(0, "const/4 v0, 0x0\nreturn v0")
        exact("Lcom/google/android/datatransport/cct/d;",
            "b(Lcom/google/android/datatransport/runtime/backends/g;)Lcom/google/android/datatransport/runtime/backends/h;", 6, 68)
            .addInstructions(0, "const-wide/16 v0, 0x0\ninvoke-static {v0, v1}, Lcom/google/android/datatransport/runtime/backends/h;->e(J)Lcom/google/android/datatransport/runtime/backends/h;\nmove-result-object v0\nreturn-object v0")
        exact("Lcom/google/firebase/analytics/FirebaseAnalytics;",
            "e(Z)V", 3, 5)
            .addInstructions(0, "const/4 p1, 0x0")
        exact("Lcom/google/firebase/perf/e;",
            "j(Z)V", 2, 4)
            .addInstructions(0, "const/4 p1, 0x0")
        exact("Lcom/google/firebase/crashlytics/i;",
            "k(Z)V", 3, 5)
            .addInstructions(0, "const/4 p1, 0x0")
        exact("Lcom/google/android/gms/ads/identifier/AdvertisingIdClient\$Info;",
            "getId()Ljava/lang/String;", 2, 2)
            .addInstructions(0, "const-string p0, \"\"\nreturn-object p0")
        exact("Lcom/google/android/gms/ads/identifier/AdvertisingIdClient\$Info;",
            "isLimitAdTrackingEnabled()Z", 2, 2)
            .addInstructions(0, "const/4 p0, 0x1\nreturn p0")
        exact("Lcom/google/android/gms/measurement/internal/x2;",
            "run()V", 16, 197)
            .addInstructions(0, "iget-object v0, p0, Lcom/google/android/gms/measurement/internal/x2;->i:Lcom/google/android/gms/measurement/internal/t2;\ninvoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/E3;->zzl()Lcom/google/android/gms/measurement/internal/U2;\nmove-result-object v0\nnew-instance v5, Lcom/google/android/gms/measurement/internal/v2;\niget-object v6, p0, Lcom/google/android/gms/measurement/internal/x2;->g:Ljava/lang/String;\niget-object v7, p0, Lcom/google/android/gms/measurement/internal/x2;->f:Lcom/google/android/gms/measurement/internal/s2;\nconst/16 v8, 0xcc\nconst/4 v9, 0x0\nconst/4 v10, 0x0\nconst/4 v11, 0x0\nconst/4 v12, 0x0\ninvoke-direct/range {v5 .. v12}, Lcom/google/android/gms/measurement/internal/v2;-><init>(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/s2;ILjava/lang/Throwable;[BLjava/util/Map;Lcom/google/android/gms/measurement/internal/u2;)V\ninvoke-virtual {v0, v5}, Lcom/google/android/gms/measurement/internal/U2;->y(Ljava/lang/Runnable;)V\nreturn-void")
        exact("Lcom/conviva/platforms/android/HTTPTask;",
            "run()V", 3, 6)
            .addInstructions(0, "const/4 v0, 0x1\nconst-string v1, \"{}\"\ninvoke-direct {p0, v0, v1}, Lcom/conviva/platforms/android/HTTPTask;->callbackIfPresent(ZLjava/lang/String;)V\nreturn-void")
        exact("Lcom/tealium/library/g;",
            "c()V", 7, 39)
            .addInstructions(0, "return-void")
        exact("Lcom/tealium/library/g;",
            "i(Z)V", 4, 41)
            .addInstructions(0, "return-void")
        exact("Lcom/nakko/android/radio10gold/tracking/h;",
            "d(Ljava/lang/String;Lcom/nakko/android/radio10gold/tracking/event/b;Ljava/util/Map;Ljava/util/Map;Lcom/nakko/android/radio10gold/tracking/j;)V", 14, 73)
            .addInstructions(0, "return-void")
        exact("Lcom/tealium/library/Tealium;",
            "e(Lcom/tealium/internal/data/Dispatch;)V", 4, 28)
            .addInstructions(0, "return-void")
        exact("Lcom/nakko/android/radio10gold/businesslogic/manager/e;",
            "d()V", 6, 31)
            .addInstructions(0, "return-void")
        exact("Lcom/nakko/android/radio10gold/businesslogic/manager/e;",
            "g(Z)V", 2, 5)
            .addInstructions(0, "return-void")
        exact("Lcom/nakko/android/radio10gold/businesslogic/manager/e;",
            "h(Ljava/lang/String;)V", 3, 8)
            .addInstructions(0, "return-void")
        exact("Lcom/adjust/sdk/Adjust;",
            "trackEvent(Lcom/adjust/sdk/AdjustEvent;)V", 2, 4)
            .addInstructions(0, "return-void")
        exact("Lcom/adjust/sdk/PackageHandler;",
            "addPackage(Lcom/adjust/sdk/ActivityPackage;)V", 4, 5)
            .addInstructions(0, "return-void")
        exact("Lcom/adjust/sdk/PackageHandler;",
            "sendFirstI()V", 6, 54)
            .addInstructions(0, "return-void")
        exact("Lcom/adjust/sdk/SdkClickHandler;",
            "sendSdkClick(Lcom/adjust/sdk/ActivityPackage;)V", 4, 5)
            .addInstructions(0, "return-void")
        exact("Lcom/adjust/sdk/SdkClickHandler;",
            "sendNextSdkClickI()V", 6, 40)
            .addInstructions(0, "return-void")
        exact("Lcom/salesforce/marketingcloud/MarketingCloudConfig\$Builder;",
            "setAnalyticsEnabled(Z)Lcom/salesforce/marketingcloud/MarketingCloudConfig\$Builder;", 2, 2)
            .addInstructions(0, "const/4 p1, 0x0")
        exact("Lcom/salesforce/marketingcloud/MarketingCloudConfig\$Builder;",
            "setPiAnalyticsEnabled(Z)Lcom/salesforce/marketingcloud/MarketingCloudConfig\$Builder;", 2, 2)
            .addInstructions(0, "const/4 p1, 0x0")
        exact("Lcom/salesforce/marketingcloud/analytics/h;",
            "init(Lcom/salesforce/marketingcloud/InitializationStatus\$a;I)V", 11, 46)
            .addInstructions(0, "return-void")
        exact("Lcom/salesforce/marketingcloud/analytics/h;",
            "controlChannelInit(I)V", 19, 129)
            .addInstructions(0, "return-void")
        exact("Lcom/salesforce/marketingcloud/analytics/h;",
            "enableAnalytics()V", 5, 38)
            .addInstructions(0, "return-void")
        exact("Lcom/salesforce/marketingcloud/analytics/h;",
            "enablePiAnalytics()V", 7, 54)
            .addInstructions(0, "return-void")
        exact("Lcom/salesforce/marketingcloud/analytics/h;",
            "onBehavior(Lcom/salesforce/marketingcloud/behaviors/a;Landroid/os/Bundle;)V", 4, 19)
            .addInstructions(0, "return-void")
        exact("Lcom/salesforce/marketingcloud/analytics/h;",
            "b(ILcom/salesforce/marketingcloud/toggles/a;)V", 6, 24)
            .addInstructions(0, "return-void")
        exact("Lcom/salesforce/marketingcloud/analytics/h;",
            "setPiIdentifier(Ljava/lang/String;)V", 4, 14)
            .addInstructions(0, "return-void")
        exact("Lcom/salesforce/marketingcloud/analytics/h;",
            "areAnalyticsEnabled()Z", 4, 31)
            .addInstructions(0, "const/4 v0, 0x0\nreturn v0")
        exact("Lcom/salesforce/marketingcloud/analytics/h;",
            "arePiAnalyticsEnabled()Z", 4, 31)
            .addInstructions(0, "const/4 v0, 0x0\nreturn v0")
        exact("Lcom/salesforce/marketingcloud/analytics/h;",
            "a(ILcom/salesforce/marketingcloud/toggles/a;)Z", 5, 23)
            .addInstructions(0, "const/4 v0, 0x0\nreturn v0")
        // Retain contact/profile ID and PushModuleReadyListener registration.
        // Remove only optional IDFV attribution and advertising-ID acquisition.
        val registration = exact("Lcom/nakko/android/radio10gold/businesslogic/manager/D;",
            "k(Lcom/salesforce/marketingcloud/sfmcsdk/SFMCSdk;)V", 11, 34)
        for (target in arrayOf(
            "Lcom/salesforce/marketingcloud/sfmcsdk/components/identity/Identity;->setProfileAttribute\$default(Lcom/salesforce/marketingcloud/sfmcsdk/components/identity/Identity;Ljava/lang/String;Ljava/lang/String;[Lcom/salesforce/marketingcloud/sfmcsdk/modules/ModuleIdentifier;ILjava/lang/Object;)V",
            "Lcom/nakko/android/radio10gold/tracking/n;->b(Landroid/content/Context;Lkotlin/jvm/functions/l;)V")) {
            val locations = registration.instructions.withIndex().filter {
                (it.value as? ReferenceInstruction)?.reference?.toString() == target
            }.map { it.index }
            check(locations.size == 1) { "KIJK optional registration identifier changed: $target" }
            registration.replaceInstruction(locations.single(), "nop")
        }
    }
}
