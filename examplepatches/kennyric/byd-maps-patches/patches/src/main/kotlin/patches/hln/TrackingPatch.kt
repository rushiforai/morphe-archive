package patches.hln

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

@Suppress("unused")
val disableTracking = bytecodePatch(name = "Disable tracking", description = "Disables audited native event collectors, queued uploads, analytics re-enable paths, advertising identifiers and FIAM while preserving push, real login, manual feedback and player session synchronization.") {
    compatibleWith(hln)
    dependsOn(originalInput, hideAds, trackingResources, suppressMarketingRequests)
    execute {
        change("Lbx2;", "a()V", STOP)
        change("Lcom/kubusapp/analytics/cim/CimEventTransmitter;", "execute(Ljava/util/Map;)V", STOP)
        change("Lcom/kubusapp/analytics/ComscoreEventTransmitter;", "execute(Ljava/util/Map;)V", STOP)
        change("Ls63;", "a(Ljava/lang/String;)V", STOP)
        change("Lh1i;", "b(Lbe/persgroep/tracking/base/model/TrackingEvent;)V", STOP)
        change("Lg4i;", "c(Lhzh;Lpo0;)V", STOP)
        change("Lg4i;", "d(Lymc;Lpo0;)V", STOP)
        change("Lvhh;", "b(Lw5b;Ljava/lang/String;Ljava/lang/String;)V", STOP)
        change("Leif;", "run()V", STOP)
        change("Lu64;", "a()V", STOP)
        change("Lim0;", "e(Ljava/lang/String;Ljava/lang/Double;Landroid/os/Bundle;ZLjava/util/UUID;Lo6c;)V", STOP)
        change("Lm9;", "c(Landroid/app/Application;Ljava/lang/String;)V", STOP)
        change("Lcom/kubusapp/webview/TrackingEventJsListener;", "trackEvent(Ljava/lang/String;)V", STOP)
        change("Ld59;", "sendAnalytics(Ljava/lang/String;)V", STOP)
        change("Lvii;", "c(Ljava/lang/String;)V", STOP)
        change("Lvii;", "d(Ljava/util/Map;)V", STOP)
        change("Lnl0;", "c(Lmp6;)V", STOP)
        change("Lnl0;", "d(Lmp6;)V", STOP)
        change("Lbe/dpgmedia/privacy/privacygatesdk/client/metrics/MetricsClient;", "sendErrorMetric\$privacygatesdk_release(Lbe/dpgmedia/privacy/privacygatesdk/client/metrics/ErrorMessage;Lbe/dpgmedia/privacy/privacygatesdk/client/metrics/ErrorType;Ljava/lang/String;)V", STOP)
        change("Lbe/persgroep/advertising/userprofile/IdManager;", "setExternalUserIds(Ljava/util/Map;)V", STOP)
        change("Lh94;", "o()Z", FALSE)
        change("Lbe/persgroep/tracking/config/FeatureFlags;", "getSnowplowEnabled()Z", FALSE)
        change("Ly4k;", "H3()Z", TRUE)
        change("Ls64;", "invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;", UNIT)
        change("Ll3d;", "invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;", UNIT)
        change("Lbe/persgroep/advertising/userprofile/IdManager\$1;", "invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;", UNIT)
        change("Lbe/persgroep/advertising/userprofile/IdManager\$fetchUserIds\$1;", "invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;", UNIT)
        changeIfPresent("Lj94;", "N(Landroid/content/Intent;)V", STOP)
        changeIfPresent("Lj94;", "O(Ljava/lang/String;Landroid/os/Bundle;)V", STOP)
        changeIfPresent("Lj94;", "U(Landroid/content/Intent;)Z", FALSE)
        changeIfPresent("Lj94;", "w()Z", FALSE)
        disableBooleanWrites(VIDEO, "l", 3)
        suppressCatsureUploads()
        disableFiamConsumers()
        disableIdentifierAcquisition()
        val usability = exact("Lvii;", "a(Lws3;)Ljava/lang/Object;").method
        val sends = usability.instructions.withIndex().filter { (_, insn) ->
            val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == "Lcom/usabilla/sdk/ubform/Usabilla;" && ref.name == "sendEvent"
        }
        check(sends.size == 1) { "HLN Usabilla automatic event changed" }
        usability.replaceInstruction(sends.single().index, "nop")
    }
}

context(patchContext: app.morphe.patcher.patch.BytecodePatchContext)
private fun disableFiamConsumers() {
    val cls = exact(FILTER, "morpheAds()Z").classDef
    cls.methods.add(helper("morpheSuppressFiam", "V", listOf("Lze6;", "Z"), 0, """
        if-eqz p0, :done
        iput-boolean p1, p0, Lze6;->c:Z
        :done
        return-void
    """))
    // `trackingResources` removes the four FIAM component registrars from the manifest,
    // so FirebaseApp.get(FirebaseInAppMessaging.class) returns null in every consumer.
    // The app dereferences it unconditionally (`TrackingStarterInitializer` fails at
    // launch), so every such site must go through the null-safe helper below.
    val sites = listOf("Lcom/kubusapp/MainApplication;" to "onCreate()V", "Lcom/kubusapp/MainActivity;" to "onCreate(Landroid/os/Bundle;)V", "Ldwh;" to "b(Lws3;)Ljava/lang/Object;", "Lcom/kubusapp/startup/TrackingStarterInitializer;" to "b(Landroid/content/Context;)Ljava/lang/Object;")
    sites.forEach { (owner, sig) ->
        val method = optionalExact(owner, sig) ?: return@forEach
        val code = method.instructions.toList()
        val casts = code.withIndex().filter { (_, insn) -> insn.opcode == Opcode.CHECK_CAST &&
            ((insn as? ReferenceInstruction)?.reference as? TypeReference)?.type == "Lze6;" }
        check(casts.size == 1) { "HLN optional FIAM consumer changed: $owner" }
        val cast = casts.single()
        val receiver = (cast.value as OneRegisterInstruction).registerA
        val end = (cast.index + 1 until code.size).firstOrNull { index ->
            val ref = (code[index] as? ReferenceInstruction)?.reference as? FieldReference
            ref?.definingClass == "Lze6;" && ref.name == "c" && code[index].opcode == Opcode.IPUT_BOOLEAN
        } ?: error("HLN FIAM suppression assignment missing")
        check(end - cast.index in 2..4)
        val checks = (cast.index + 1 until end).filter { index ->
            val ref = (code[index] as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == "Ljava/lang/Object;" && ref.name == "getClass"
        }
        check(checks.size == 1)
        val field = code[end] as TwoRegisterInstruction
        check(field.registerB == receiver)
        method.replaceInstruction(checks.single(), "nop")
        method.replaceInstruction(end, "invoke-static {v$receiver, v${field.registerA}}, $FILTER->morpheSuppressFiam(Lze6;Z)V")
    }
}

context(patchContext: app.morphe.patcher.patch.BytecodePatchContext)
private fun disableIdentifierAcquisition() {
    // `gn0` is the app's startup service locator in 9.23.3 (its field `d` is the
    // Context androidx.startup.InitializationProvider builds its ComponentName
    // from), so its constructor must run untouched. Advertising identifiers are
    // still blocked through the AdvertisingIdClient and IdManager hooks below.
    val piano = exact("Lak;", "<init>(Landroid/content/Context;Ljava/util/concurrent/ScheduledExecutorService;)V").method
    val schedules = piano.instructions.withIndex().filter { (_, insn) ->
        val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass == "Ljava/util/concurrent/ScheduledExecutorService;" && ref.name == "schedule"
    }
    check(schedules.size == 1)
    piano.replaceInstruction(schedules.single().index, "nop")
    // getInfo has only one local: construct the non-null result in our helper.
    val cls = exact(FILTER, "morpheAds()Z").classDef
    cls.methods.add(helper("morpheAdvertisingInfo", "Lcom/google/android/gms/ads/identifier/AdvertisingIdClient\$Info;", emptyList(), 3, """
        new-instance v0, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient${'$'}Info;
        const-string v1, ""
        const/4 v2, 0x1
        invoke-direct {v0, v1, v2}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient${'$'}Info;-><init>(Ljava/lang/String;Z)V
        return-object v0
    """))
    listOf("getAdvertisingIdInfo(Landroid/content/Context;)Lcom/google/android/gms/ads/identifier/AdvertisingIdClient\$Info;", "getInfo()Lcom/google/android/gms/ads/identifier/AdvertisingIdClient\$Info;").forEach { sig ->
        change("Lcom/google/android/gms/ads/identifier/AdvertisingIdClient;", sig, """
            invoke-static {}, $FILTER->morpheAdvertisingInfo()Lcom/google/android/gms/ads/identifier/AdvertisingIdClient${'$'}Info;
            move-result-object v0
            return-object v0
        """)
    }
    val idManager = "Lbe/persgroep/advertising/userprofile/IdManager;"
    listOf("getCachedUserIds()Ljava/util/Map;", "getUserIdsWithoutPrivacyCheck()Ljava/util/Map;").forEach { sig ->
        change(idManager, sig, "sget-object v0, Lmt5;->a:Lmt5;\nreturn-object v0")
    }
    // Kotlin inline Result<String> represents success by the actual raw String.
    change(idManager, "fetch-IoAF18A(Lus3;)Ljava/lang/Object;", "const-string v0, \"\"\nreturn-object v0")
}
