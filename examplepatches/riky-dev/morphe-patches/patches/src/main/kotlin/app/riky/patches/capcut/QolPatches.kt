package app.riky.patches.capcut

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.riky.patches.shared.Constants.COMPATIBILITY_CAPCUT

@Suppress("unused")
val telemetrySuppressPatch = bytecodePatch(
    name = "Suppress Telemetry and Trackers",
    description = "Disables background monitoring and analytics frameworks including ByteDance Helios, AppLog, and AppsFlyer.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CAPCUT)

    execute {
        // Suppress AppLog initialization and logging
        AppLogInitFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )

        AppLogOnEvent1Fingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )

        AppLogOnEvent2Fingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )

        AppLogOnEvent3Fingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )

        AppLogOnEvent4Fingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )

        AppLogOnEventV31Fingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )

        AppLogOnEventV32Fingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )

        AppLogOnEventV33Fingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )

        // Suppress Helios (ByteDance APM/Privacy monitoring) initialization
        HeliosEnvImplInitFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )

        // Suppress AppsFlyer startup
        AppsFlyerAnalyticsStartFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )
    }
}

@Suppress("unused")
val hideAiLabTabPatch = bytecodePatch(
    name = "Hide AI Lab Tab",
    description = "Removes the third bottom navigation tab ('AI Lab' / 'Lab. IA') by forcing its visibility observer to always hide the tab.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CAPCUT)

    execute {
        // Force the observer callback to set visibility to GONE immediately and return
        BaseMainActivityInitMainTab10InvokeFingerprint.method.addInstructions(
            0,
            """
                const/4 v1, 0x0
                const-class v0, Lcom/vega/ui/BadgeButton;
                const v2, 0x7f093818
                iget-object v3, p0, Lcom/vega/main/BaseMainActivity${'$'}initMainTab${'$'}10;->e:Lcom/vega/main/BaseMainActivity;
                invoke-virtual {v3, v3, v2, v0}, Lcom/vega/ui/start/BaseInfraActivity;->findViewByIdCached(Lcom/kanyun/kace/AndroidExtensionsBase;ILjava/lang/Class;)Landroid/view/View;
                move-result-object v5
                invoke-static {v5, v1}, Lcom/vega/infrastructure/extensions/ViewExtKt;->d(Landroid/view/View;Z)V
                sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
                return-object v0
            """
        )
    }
}

@Suppress("unused")
val hideFalseHopesPatch = bytecodePatch(
    name = "Hide False Hopes Features",
    description = "Hides 'IA ultra HD' (Export Super Resolution) and 'Flusso ottico' (Slow Motion Optical Flow) options since they are cloud-gated.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CAPCUT)

    execute {
        // Hide IA ultra HD by disabling its AB setting config
        ExportHighDefinitionConfigGetEnableFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )

        // Hide Flusso ottico (Optical Flow) by returning only Frame Blending in slow motion source list
        SlowMotionSourceGetListFingerprint.method.addInstructions(
            0,
            """
                new-instance v4, Ljava/util/ArrayList;
                invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V
                new-instance v3, Lcom/vega/edit/speed/data/SlowMotionItem;
                sget-object v2, Lcom/vega/middlebridge/swig/LVVEAlgorithmSubType;->c:Lcom/vega/middlebridge/swig/LVVEAlgorithmSubType;
                const v0, 0x7f121269
                invoke-static {v0}, Lcom/vega/infrastructure/base/ModuleCommonKt;->b(I)Ljava/lang/String;
                move-result-object v1
                const v0, 0x7f1230a1
                invoke-static {v0}, Lcom/vega/infrastructure/base/ModuleCommonKt;->b(I)Ljava/lang/String;
                move-result-object v0
                invoke-direct {v3, v2, v1, v0}, Lcom/vega/edit/speed/data/SlowMotionItem;-><init>(Lcom/vega/middlebridge/swig/LVVEAlgorithmSubType;Ljava/lang/String;Ljava/lang/String;)V
                invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
                return-object v4
            """
        )
    }
}

