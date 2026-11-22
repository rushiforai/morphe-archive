package patches.videoland

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import patches.atv.exact
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

@Suppress("unused")
val disableTrackingPatch = bytecodePatch(
    name = "Disable tracking ${patches.shared.platformTitleSuffix(videolandMobile)}",
    description = "Disables inspected Tealium, Snowplow, NPAW, advertising ID, New Relic, Salesforce analytics and automatic Google/Facebook measurement, including queued CCT uploads. Preserves functional account, media and notification services.",
    default = true,
) {
    compatibleWith(videolandMobile)
    dependsOn(originalInput, trackingResources)
    execute {
        // Filter only optional measurement flags at consumption, including remote refresh.
        exact("Lcom/bedrockstreaming/component/config/domain/ConfigImpl;",
            "h(Ljava/lang/String;)Z", 4, 11).addInstructions(0, trackingConfigGuard)

        exact("Lcom/bedrockstreaming/plugin/tealium/TealiumTaggingPlan;",
            "y0(Ljava/lang/String;Ljava/util/Map;)V", 11, 18)
            .addInstructions(0, "return-void")

        exact("Lcom/bedrockstreaming/plugin/tealium/TealiumTaggingPlan;",
            "z0(Ljava/util/Map;)V", 5, 15)
            .addInstructions(0, "return-void")

        // Keep Object initialization and all three stored dependencies; stop before emitter creation.
        val snowplow = "Lcom/bedrockstreaming/plugin/snowplow/SnowplowTracker;"
        exact(snowplow,
            "<init>(Landroid/content/Context;Lgr/c;LYk/a;Lcom/bedrockstreaming/feature/player/domain/mediaplayer/usecase/GetDeviceVolumeUseCase;Lcom/bedrockstreaming/plugin/snowplow/SnowplowEntityMapper;)V", 15, 114).apply {
            val anchors = instructions.withIndex().filter { (_, instruction) ->
                val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
                field?.definingClass == snowplow && field.name == "c" &&
                    field.type == "Lcom/bedrockstreaming/plugin/snowplow/SnowplowEntityMapper;"
            }
            check(anchors.size == 1) { "Changed Videoland mobile Snowplow initialization" }
            addInstructions(anchors.single().index + 1, "return-void")
        }

        exact("Lcom/bedrockstreaming/plugin/advertisingid/google/data/GoogleAdvertisingIdSource;",
            "a()LB6/a;", 4, 27)
            .addInstructions(0, "sget-object v0, LB6/b;->a:LB6/b;\nreturn-object v0")

        exact("Lcom/newrelic/agent/android/NewRelic;",
            "start(Landroid/content/Context;)V", 7, 83)
            .addInstructions(0, "return-void")

        // The uploader treats 403 as fatal and deletes the queued batch without HTTP/retry.
        exact("LAu/a;",
            "j(LBy/d0;)LLs/b;", 16, 184)
            .addInstructions(0, "new-instance v0, LLs/b;\nconst/16 v1, 0x193\nconst/4 v2, 0x0\nconst-wide/16 v3, 0x0\ninvoke-direct {v0, v1, v2, v3, v4}, LLs/b;-><init>(ILjava/net/URL;J)V\nreturn-object v0")

        // Skip only Salesforce analytics collectors/alarms, retaining SDK push/inbox/account services.
        exact("Lcom/salesforce/marketingcloud/analytics/h;",
            "init(Lcom/salesforce/marketingcloud/InitializationStatus\$a;I)V", 11, 51)
            .addInstructions(0, "return-void")

        exact("Lcom/salesforce/marketingcloud/analytics/h;",
            "controlChannelInit(I)V", 19, 129)
            .addInstructions(0, "return-void")

        exact("Lcom/salesforce/marketingcloud/analytics/h;",
            "enableAnalytics()V", 5, 38)
            .addInstructions(0, "return-void")

        exact("Lcom/salesforce/marketingcloud/analytics/h;",
            "enablePiAnalytics()V", 7, 53)
            .addInstructions(0, "return-void")

        exact("Lcom/salesforce/marketingcloud/analytics/h;",
            "areAnalyticsEnabled()Z", 4, 31)
            .addInstructions(0, "const/4 v0, 0x0\nreturn v0")

        exact("Lcom/salesforce/marketingcloud/analytics/h;",
            "arePiAnalyticsEnabled()Z", 4, 31)
            .addInstructions(0, "const/4 v0, 0x0\nreturn v0")

        // Facebook's cached settings and remote app-event overrides can supersede
        // manifest defaults. Pin the actual advertising-ID and automatic-event gates.
        exact("Lcom/facebook/j;", "b()Z", 3, 15)
            .addInstructions(0, "const/4 v0, 0x0\nreturn v0")
        exact("Lcom/facebook/j;", "c()Z", 3, 14)
            .addInstructions(0, "const/4 v0, 0x0\nreturn v0")

        // A previously saved Crashlytics/API opt-in takes precedence over the
        // manifest default. Disable the real arbiter read before permissions resolve.
        exact("Lcom/google/firebase/crashlytics/internal/common/DataCollectionArbiter;",
            "a()Z", 8, 38).addInstructions(0, "const/4 v0, 0x0\nreturn v0")

        // Preserve the current Activity for explicit feedback, but avoid boot/resume SDK initialization.
        val usabilityLifecycle = "Lcom/bedrockstreaming/plugin/usabilla/data/UsabillaRepositoryImpl\$b;"
        exact(usabilityLifecycle, "onActivityResumed(Landroid/app/Activity;)V", 4, 19).apply {
            val anchors = instructions.withIndex().filter { (_, instruction) ->
                val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
                field?.definingClass == usabilityLifecycle && field.name == "d" &&
                    field.type == "Ljava/lang/ref/WeakReference;"
            }
            check(anchors.size == 1) { "Changed Videoland Usabilla Activity reference" }
            addInstructions(anchors.single().index + 1, "return-void")
        }

        exact("Lcom/bedrockstreaming/plugin/usabilla/UsabillaTaggingPlan;", "c(Ljava/lang/String;Ljava/util/Map;)V", 6, 26)
            .addInstructions(0, "return-void")

        exact("Lcom/usabilla/sdk/ubform/Usabilla;", "sendEvent(Landroid/content/Context;Ljava/lang/String;)V", 6, 16)
            .addInstructions(0, "return-void")

        exact("Lcom/usabilla/sdk/ubform/telemetry/UbTelemetryRecorder;", "d()V", 7, 27)
            .addInstructions(0, "return-void")

        exact("Lxy/i;", "a(LAx/a;Ljava/util/List;)V", 6, 27)
            .addInstructions(0, "return-void")

        exact("Lxy/d;", "invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;", 11, 90)
            .addInstructions(0, "sget-object v0, Liz/M;->a:Liz/M;\nreturn-object v0")

        // Return a real empty-list Flow, preserving Usabilla initialize/callback completion.
        // The original catch action is retained; it never runs for the successful empty Flow.
        exact("Lay/M;", "b(Ljava/lang/String;)LSz/G;", 6, 43)
            .addInstructions(0, "new-instance v0, LSz/q;\nsget-object v1, Ljz/K;->d:Ljz/K;\ninvoke-direct {v0, v1}, LSz/q;-><init>(Ljava/lang/Object;)V\nnew-instance v1, Lay/J;\nconst/4 v2, 0x0\ninvoke-direct {v1, p0, v2}, Lay/J;-><init>(Lay/M;Lmz/d;)V\nnew-instance v2, LSz/G;\ninvoke-direct {v2, v0, v1}, LSz/G;-><init>(LSz/k;Lxz/g;)V\nreturn-object v2")

        // Batched JOIN measurement has a dedicated Retrofit service.
        exact("LKv/g;", "d(Ljava/util/List;Loz/d;)Ljava/lang/Object;", 8, 58)
            .addInstructions(0, "sget-object v0, Liz/M;->a:Liz/M;\nreturn-object v0")
    }
}

private val trackingConfigGuard = listOf(
    "activateTealium", "playerNPAWv7Enabled", "playerSnowplowMediaTrackingEnabled",
).joinToString("\n") { key -> """
    const-string v0, "$key"
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :videoland_disabled
""".trimIndent() } + "\n" + """

    goto :videoland_original
    :videoland_disabled
    const/4 v0, 0x0
    return v0
    :videoland_original
    nop
""".trimIndent()
