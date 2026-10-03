package app.aidan.patches.aftership.ads

import app.aidan.patches.aftership.auth.bypassSignatureCheckResourcePatch
import app.aidan.patches.aftership.shared.Constants.COMPATIBILITY_AFTERSHIP
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val removeAdsAndTrackingPatch = bytecodePatch(
    name = "Remove Ads and Tracking",
    description = "Neutralizes in-app advertisements (Disco Network SDK shopping/cashback ads and list placements), removes the 'Leave us a 5-star review' in-app rating prompt dialogs, zeros the Google Play Advertising ID (AAID), disables first-party behavioral and impression analytics (StatisticsCenter, AbsListImpEventHelper, AutoUploadManager), and blocks diagnostic telemetry (Firebase Analytics, Crashlytics, Logan logging).",
    default = true
) {
    compatibleWith(COMPATIBILITY_AFTERSHIP)
    dependsOn(bypassSignatureCheckResourcePatch)

    execute {
        // =========================================================================
        // 1. DISCO NETWORK AD SDK & UI PLACEMENT NEUTRALIZATION
        // =========================================================================

        // Neutralize CollectionUtils / Disco init entrypoint: Le3/c;->p(Lcom/aftership/shopper/AfterShipApplication;)V
        disableVoidMethods("Le3/c;", "p")

        // Neutralize Disco SDK methods if present
        disableVoidMethods(
            "Lcom/disconetwork/discosdk/Disco;",
            "initSdk",
            "execute",
            "events",
            "doExecute\$discosdk_publicRelease",
            "setDebugLogsEnabled"
        )

        // Force collapse on DiscoInlinePlacement: Ls4/d;->b(Landroid/content/Context;Ll6/b;)V
        forceCollapseDiscoInlinePlacement("Ls4/d;")

        // Zero DiscoAdAdapter item count: Ls4/a;->j()I -> return 0
        returnZeroInt("Ls4/a;", "j")

        // Prevent Ad insertion in Main Tracking List: LY6/i;->f3(Ljava/util/List;Ls3/a;ILqe/n;)Ljava/util/List;
        returnFirstParameter("LY6/i;", "f3")

        // =========================================================================
        // 2. GOOGLE PLAY ADVERTISING ID (AAID) ZEROING & OPT-OUT
        // =========================================================================

        // Spoof minified AdvertisingIdClient: Lm9/a;->a(Landroid/content/Context;)Lm9/a$a;
        spoofMinifiedAdvertisingId("Lm9/a;")

        // Spoof unminified AdvertisingIdClient$Info if present
        returnConstString("Lcom/google/android/gms/ads/identifier/AdvertisingIdClient\$Info;", "getId", "00000000-0000-0000-0000-000000000000")
        returnBoolean("Lcom/google/android/gms/ads/identifier/AdvertisingIdClient\$Info;", "isLimitAdTrackingEnabled", true)

        // =========================================================================
        // 3. CENTRAL ANALYTICS & EVENT DISPATCHER NEUTRALIZATION
        // =========================================================================

        // Neutralize FirebaseStatisticsManage (Lx3/d;)
        disableVoidMethods("Lx3/d;", "b", "c", "d", "e", "f")

        // Neutralize StatisticsCenter (Lx3/i;)
        disableVoidMethods(
            "Lx3/i;",
            "v", "B", "E", "J", "K", "b", "c", "d", "e", "f", "I", "i", "j", "n", "s", "t", "z", "G", "H", "p", "q", "w", "y"
        )

        // =========================================================================
        // 4. AUTOMATED UPLOAD STRATEGIES, IMPRESSION TELEMETRY & LOGGERS
        // =========================================================================

        // Disable auto-upload strategies
        disableVoidMethods("Lo4/a;", "a")
        disableVoidMethods("Lo4/b;", "a")
        disableVoidMethods("Lo4/d;", "a")

        // Disable remote log uploading via OkHttp (/pretty-log)
        disableVoidMethods("Lx3/k;", "d")

        // Disable RecyclerView impression tracking
        disableVoidMethods("Lcom/aftership/shopper/views/event/impr/base/AbsListImpEventHelper;", "postEvent", "checkAndPostEvent")

        // Disable Logan diagnostic logging
        disableVoidMethods("LF2/k;", "c", "i", "j")
        disableVoidMethods("Lcom/dianping/logan/a;", "a")

        // Disable Firebase Crashlytics
        disableVoidMethods(
            "Lcom/google/firebase/crashlytics/FirebaseCrashlytics;",
            "log",
            "recordException",
            "setCrashlyticsCollectionEnabled",
            "setCustomKey",
            "setUserId",
            "sendUnsentReports",
            "deleteUnsentReports"
        )

        // Disable Firebase Analytics screen tracking
        disableVoidMethods("Lcom/google/firebase/analytics/FirebaseAnalytics;", "setCurrentScreen")

        // =========================================================================
        // 5. IN-APP 5-STAR REVIEW PROMPT NEUTRALIZATION
        // =========================================================================

        // Suppress HomePresenter rating prompt checks and triggers
        disableVoidMethods(
            "Lcom/aftership/shopper/views/home/presenter/HomePresenter;",
            "checkAndShowReviewsDialog",
            "checkAndShowReviewsDialogNewStrategy",
            "checkAndShowReviewsDialogOldStrategy",
            "showRatingDialog",
            "showRatingDialogNewStyle",
            "showRatingDialogOldStyle"
        )

        // Suppress HomeActivity feedback/rating dialog inflation and display (layout_feedback_dialog & layout_feedback_dialog_new)
        disableVoidMethods(
            "Lcom/aftership/shopper/views/home/HomeActivity;",
            "N1",
            "Y"
        )

        // Suppress TrackingListTabPresenter review dialog triggering
        disableVoidMethods(
            "Lcom/aftership/shopper/views/shipment/presenter/TrackingListTabPresenter;",
            "handleReviewLogic",
            "access\$handleReviewLogic"
        )
        returnBoolean("Lcom/aftership/shopper/views/shipment/presenter/TrackingListTabPresenter;", "hadShowReviewDialog", true)
        returnBoolean("Lcom/aftership/shopper/views/shipment/presenter/TrackingListTabPresenter;", "isUsingNewStrategy", false)

        // Suppress TrackingListTabFragment review dialog schedulers (new F0(this, 3) and new Y6.e)
        disableVoidMethods(
            "LY6/i;",
            "Y1",
            "b2"
        )

        // Suppress background Runnable review dialog display
        disableVoidMethods(
            "LY6/e;",
            "run"
        )

        // Suppress ReviewStyleABTestEnum strategy check
        returnBoolean("LA3/e\$a;", "a", false)
    }
}

/**
 * Neutralizes all matched void-returning methods by injecting an immediate `return-void` at index 0.
 *
 * All matching implemented overloads are patched; absent classes or matches are skipped.
 */
private fun BytecodePatchContext.disableVoidMethods(
    classDescriptor: String,
    vararg methodNames: String
) {
    val mutableClass = mutableClassDefByOrNull(classDescriptor) ?: return
    val methodSet = methodNames.toSet()

    for (method in mutableClass.methods) {
        if (method.name in methodSet && method.returnType == "V" && method.implementation != null) {
            method.addInstructions(0, "return-void")
        }
    }
}

/**
 * Stubs a method to immediately return a constant boolean value.
 *
 * All matching implemented overloads are patched; absent classes or matches are skipped.
 */
private fun BytecodePatchContext.returnBoolean(
    classDescriptor: String,
    methodName: String,
    value: Boolean
) {
    val mutableClass = mutableClassDefByOrNull(classDescriptor) ?: return

    for (method in mutableClass.methods) {
        if (method.name == methodName && method.returnType == "Z" && method.implementation != null) {
            val constInstruction = if (value) "const/4 v0, 0x1" else "const/4 v0, 0x0"
            method.addInstructions(
                0,
                """
                $constInstruction
                return v0
                """.trimIndent()
            )
        }
    }
}

/**
 * Stubs matching integer-returning methods to immediately return zero.
 *
 * All matching implemented overloads are patched; absent classes or matches are skipped.
 */
private fun BytecodePatchContext.returnZeroInt(
    classDescriptor: String,
    methodName: String
) {
    val mutableClass = mutableClassDefByOrNull(classDescriptor) ?: return

    for (method in mutableClass.methods) {
        if (method.name == methodName && method.returnType == "I" && method.implementation != null) {
            method.addInstructions(
                0,
                """
                const/4 v0, 0x0
                return v0
                """.trimIndent()
            )
        }
    }
}

/**
 * Stubs a method to immediately return a constant string.
 *
 * All matching implemented overloads are patched; absent classes or matches are skipped.
 *
 * [value] must be safe to embed in a Smali string literal.
 */
private fun BytecodePatchContext.returnConstString(
    classDescriptor: String,
    methodName: String,
    value: String
) {
    val mutableClass = mutableClassDefByOrNull(classDescriptor) ?: return

    for (method in mutableClass.methods) {
        if (method.name == methodName && method.returnType == "Ljava/lang/String;" && method.implementation != null) {
            method.addInstructions(
                0,
                """
                const-string v0, "$value"
                return-object v0
                """.trimIndent()
            )
        }
    }
}

/**
 * Stubs an instance method to immediately return its first argument (p1).
 *
 * All matching implemented overloads are patched; absent classes or matches are skipped.
 *
 * Targets must be instance methods returning an object with only single-register
 * parameters; static methods, return types, and parameter widths are not validated.
 */
private fun BytecodePatchContext.returnFirstParameter(
    classDescriptor: String,
    methodName: String
) {
    val mutableClass = mutableClassDefByOrNull(classDescriptor) ?: return

    for (method in mutableClass.methods) {
        if (method.name == methodName && method.implementation != null) {
            val registerCount = method.implementation!!.registerCount
            val paramCount = method.parameterTypes.size
            // In Dalvik: registers are [v0..vN, p0 (this), p1, p2, ...].
            // p1 is at index (registerCount - paramCount)
            val p1Register = registerCount - paramCount
            method.addInstructions(
                0,
                """
                return-object v$p1Register
                """.trimIndent()
            )
        }
    }
}

/**
 * Forces DiscoInlinePlacement to status COLLAPSED immediately.
 *
 * All matching implemented overloads are patched; absent classes or matches are skipped.
 */
private fun BytecodePatchContext.forceCollapseDiscoInlinePlacement(
    classDescriptor: String = "Ls4/d;"
) {
    val mutableClass = mutableClassDefByOrNull(classDescriptor) ?: return

    for (method in mutableClass.methods) {
        if (method.name == "b" && method.returnType == "V" && method.implementation != null) {
            val registerCount = method.implementation!!.registerCount
            val paramCount = method.parameterTypes.size
            val thisRegister = registerCount - 1 - paramCount
            method.addInstructions(
                0,
                """
                sget-object v0, Ls4/d${'$'}a;->d:Ls4/d${'$'}a;
                iput-object v0, v$thisRegister, Ls4/d;->b:Ls4/d${'$'}a;
                return-void
                """.trimIndent()
            )
        }
    }
}

/**
 * Spoofs minified AdvertisingIdClient.a(Context) to return a zeroed AAID with limitAdTracking=true.
 *
 * All matching implemented overloads are patched; absent classes or matches are skipped.
 */
private fun BytecodePatchContext.spoofMinifiedAdvertisingId(
    classDescriptor: String = "Lm9/a;"
) {
    val mutableClass = mutableClassDefByOrNull(classDescriptor) ?: return

    for (method in mutableClass.methods) {
        if (method.name == "a" && method.implementation != null && method.parameterTypes.size == 1) {
            method.addInstructions(
                0,
                """
                new-instance v0, Lm9/a${'$'}a;
                const-string v1, "00000000-0000-0000-0000-000000000000"
                const/4 v2, 0x1
                invoke-direct {v0, v1, v2}, Lm9/a${'$'}a;-><init>(Ljava/lang/String;Z)V
                return-object v0
                """.trimIndent()
            )
        }
    }
}
