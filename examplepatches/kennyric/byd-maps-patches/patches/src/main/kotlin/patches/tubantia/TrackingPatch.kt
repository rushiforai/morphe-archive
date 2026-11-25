package patches.tubantia

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
    compatibleWith(tubantia)
    dependsOn(originalInput, hideAds, trackingResources)
    execute {
        change("Lcom/kubusapp/analytics/ComscoreEventTransmitter;", "execute(Ljava/util/Map;)V", STOP)
        change("Lp63;", "a(Ljava/lang/String;)V", STOP)
        change("Lf1i;", "b(Lbe/persgroep/tracking/base/model/TrackingEvent;)V", STOP)
        change("Ld4i;", "c(Lezh;Lpo0;)V", STOP)
        change("Ld4i;", "d(Lrmc;Lpo0;)V", STOP)
        change("Lshh;", "b(Lp5b;Ljava/lang/String;Ljava/lang/String;)V", STOP)
        change("Lzhf;", "run()V", STOP)
        change("Lq64;", "a()V", STOP)
        change("Lim0;", "e(Ljava/lang/String;Ljava/lang/Double;Landroid/os/Bundle;ZLjava/util/UUID;Lh6c;)V", STOP)
        change("Lm9;", "c(Landroid/app/Application;Ljava/lang/String;)V", STOP)
        change("Lcom/kubusapp/webview/TrackingEventJsListener;", "trackEvent(Ljava/lang/String;)V", STOP)
        change("Lx49;", "sendAnalytics(Ljava/lang/String;)V", STOP)
        change("Lsii;", "c(Ljava/lang/String;)V", STOP)
        change("Lsii;", "d(Ljava/util/Map;)V", STOP)
        change("Lol0;", "c(Lgp6;)V", STOP)
        change("Lol0;", "d(Lgp6;)V", STOP)
        change("Lbe/dpgmedia/privacy/privacygatesdk/client/metrics/MetricsClient;", "sendErrorMetric\$privacygatesdk_release(Lbe/dpgmedia/privacy/privacygatesdk/client/metrics/ErrorMessage;Lbe/dpgmedia/privacy/privacygatesdk/client/metrics/ErrorType;Ljava/lang/String;)V", STOP)
        change("Lbe/persgroep/advertising/userprofile/IdManager;", "setExternalUserIds(Ljava/util/Map;)V", STOP)
        change("Ld94;", "o()Z", FALSE)
        change("Lbe/persgroep/tracking/config/FeatureFlags;", "getSnowplowEnabled()Z", FALSE)
        change("Lu4k;", "H3()Z", TRUE)
        change("Lo64;", "invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;", UNIT)
        change("Le3d;", "invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;", UNIT)
        change("Lbe/persgroep/advertising/userprofile/IdManager\$1;", "invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;", UNIT)
        change("Lbe/persgroep/advertising/userprofile/IdManager\$fetchUserIds\$1;", "invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;", UNIT)
        change("Lsgj;", "y(Landroid/content/Intent;)V", STOP)
        change("Lsgj;", "z(Ljava/lang/String;Landroid/os/Bundle;)V", STOP)
        change("Lsgj;", "H(Landroid/content/Intent;)Z", FALSE)
        change("Lsgj;", "r()Z", FALSE)
        disableBooleanWrites(VIDEO, "l", 3)
        disableFiamConsumers()
        disableIdentifierAcquisition()
        val usability = exact("Lsii;", "a(Lss3;)Ljava/lang/Object;").method
        val sends = usability.instructions.withIndex().filter { (_, insn) ->
            val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == "Lcom/usabilla/sdk/ubform/Usabilla;" && ref.name == "sendEvent"
        }
        check(sends.size == 1) { "Tubantia Usabilla automatic event changed" }
        usability.replaceInstruction(sends.single().index, "nop")
    }
}

context(patchContext: app.morphe.patcher.patch.BytecodePatchContext)
private fun disableFiamConsumers() {
    val cls = exact(FILTER, "morpheAds()Z").classDef
    cls.methods.add(helper("morpheSuppressFiam", "V", listOf("Lte6;", "Z"), 0, """
        if-eqz p0, :done
        iput-boolean p1, p0, Lte6;->c:Z
        :done
        return-void
    """))
    // In 9.23.2 the startup assignment moved from MainApplication into an
    // AndroidX initializer. Preserve its analytics registration flow and guard
    // only its optional FIAM component, just like the two remaining consumers.
    val sites = listOf(
        "Lcom/kubusapp/startup/TrackingStarterInitializer;" to "b(Landroid/content/Context;)Ljava/lang/Object;",
        "Lcom/kubusapp/MainActivity;" to "onCreate(Landroid/os/Bundle;)V",
        "Lj1i;" to "b(Lss3;)Ljava/lang/Object;",
    )
    sites.forEach { (owner, sig) ->
        val method = exact(owner, sig).method
        val code = method.instructions.toList()
        val casts = code.withIndex().filter { (_, insn) -> insn.opcode == Opcode.CHECK_CAST &&
            ((insn as? ReferenceInstruction)?.reference as? TypeReference)?.type == "Lte6;" }
        check(casts.size == 1) { "Tubantia optional FIAM consumer changed: $owner" }
        val cast = casts.single()
        val receiver = (cast.value as OneRegisterInstruction).registerA
        val end = (cast.index + 1 until code.size).firstOrNull { index ->
            val ref = (code[index] as? ReferenceInstruction)?.reference as? FieldReference
            ref?.definingClass == "Lte6;" && ref.name == "c" && code[index].opcode == Opcode.IPUT_BOOLEAN
        } ?: error("Tubantia FIAM suppression assignment missing")
        check(end - cast.index in 2..4)
        val checks = (cast.index + 1 until end).filter { index ->
            val ref = (code[index] as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == "Ljava/lang/Object;" && ref.name == "getClass"
        }
        check(checks.size == 1)
        val field = code[end] as TwoRegisterInstruction
        check(field.registerB == receiver)
        method.replaceInstruction(checks.single(), "nop")
        method.replaceInstruction(end, "invoke-static {v$receiver, v${field.registerA}}, $FILTER->morpheSuppressFiam(Lte6;Z)V")
    }
}

context(patchContext: app.morphe.patcher.patch.BytecodePatchContext)
private fun disableIdentifierAcquisition() {
    // Keep initialized provider objects and their nullable asynchronous fields.
    val appSet = exact("Lpn0;", "<init>(Landroid/content/Context;)V").method
    val code = appSet.instructions.toList()
    val base = code.withIndex().filter { (_, insn) ->
        val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
        insn.opcode == Opcode.INVOKE_DIRECT && ref?.definingClass == "Ljava/lang/Object;" && ref.name == "<init>"
    }
    check(base.size == 1)
    appSet.addInstructions(base.single().index + 1, STOP)
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
        change(idManager, sig, "sget-object v0, Lus5;->a:Lus5;\nreturn-object v0")
    }
    // Kotlin inline Result<String> represents success by the actual raw String.
    change(idManager, "fetch-IoAF18A(Lqs3;)Ljava/lang/Object;", "const-string v0, \"\"\nreturn-object v0")
}
