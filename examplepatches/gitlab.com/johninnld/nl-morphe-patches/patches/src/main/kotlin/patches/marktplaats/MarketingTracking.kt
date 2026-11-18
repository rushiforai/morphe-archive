package patches.marktplaats


private const val braze = "Lcom/braze/Braze;"
private const val companion = "Lcom/braze/Braze\$Companion;"
private const val manager = "Lcom/horizon/android/braze/i;"

context(context: app.morphe.patcher.patch.BytecodePatchContext)
internal fun suppressMarketingMeasurement() {
    // The merged zaj class also contains unrelated Compose helpers. Only its
    // app-event activation, timer and queue admission methods are measurement.
    data class Gate(val owner: String, val signature: String, val flags: Int, val registers: Int, val count: Int)
    val gates = listOf(
        Gate("Lqn5;", "b(Lmd0;Ljava/lang/String;Landroid/os/Bundle;Ljava/lang/Double;)V", 17, 7, 24),
        Gate("Lqn5;", "c(Lnc5;Z)V", 17, 5, 12),
        Gate("Lzaj;", "b(Landroid/app/Application;Ljava/lang/String;)V", 9, 16, 141),
        Gate("Lzaj;", "i()V", 9, 10, 39),
        Gate("Lzaj;", "j(Lcom/facebook/appevents/AppEvent;Lcom/facebook/appevents/AccessTokenAppIdPair;)V", 9, 9, 147),
        Gate("Lnd0;", "f(Ljava/lang/String;Ljava/lang/Double;Landroid/os/Bundle;ZLjava/util/UUID;Lu4b;)V", 17, 18, 247),
        Gate("Lxc0;", "c(Lcom/facebook/appevents/FlushReason;)V", 25, 5, 16),
        Gate("Lxc0;", "d(Lcom/facebook/appevents/FlushReason;)V", 25, 5, 40),
        // Prevent coroutine admission, including calls made by push or restored
        // SDK state. Keep genuine SDK objects and privacy/wipe methods intact.
        Gate(braze, "runGuardedAsync\$android_sdk_base_release(Lkotlin/jvm/functions/Function0;ZZZLkotlin/jvm/functions/Function0;)V", 4113, 23, 28),
    )
    val methods = gates.map { exact(it.owner, it.signature, it.flags, it.registers, it.count) }
    methods.forEach { it.addInstructions(0, "return-void") }
    // Existing FCM registrations can enter Braze without SDK initialization.
    // Consume only the native Braze discriminator; false leaves the app's
    // first-party handler chain available without entering Braze fallback work.
    val messaging = "Lcom/braze/push/BrazeFirebaseMessagingService\$Companion;"
    exact("Lkn1;", "a(Lqtc;)Z", 17, 3, 5).addInstructions(0, """
        sget-object v0, Lcom/braze/push/BrazeFirebaseMessagingService;->Companion:$messaging
        invoke-virtual {v0, p1}, $messaging->isBrazePushNotification(Lqtc;)Z
        move-result v0
        return v0
    """.trimIndent())
    // Preserve native Context/Intent validation, then stop direct/background
    // receiver re-entry before synchronous dispatch or coroutine admission.
    exact("Lcom/braze/push/BrazePushReceiver\$Companion;",
        "handleReceivedIntent(Landroid/content/Context;Landroid/content/Intent;Z)V", 17, 5, 12)
        .addInstructions(2, "return-void")
    // An absent flush result is already a native Facebook outcome. Do not
    // acknowledge persisted app events as successfully uploaded.
    exact("Lxc0;", "f(Lcom/facebook/appevents/FlushReason;Lvoa;)Lq42;", 25, 10, 48)
        .addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")

    // Reuse Braze's actual disableSdk: persistent disabled state, cancellation
    // and offline transport. Never substitute a null SDK singleton.
    val disable = """
        iget-object v1, p0, $manager->a:Landroid/app/Application;
        sget-object v0, $braze->Companion:$companion
        invoke-virtual {v0, v1}, $companion->disableSdk(Landroid/content/Context;)V
        return-void
    """.trimIndent()
    exact(manager, "e($manager)V", 9, 7, 60).addInstructions(0, disable)
    exact(manager, "g()V", 17, 16, 147).addInstructions(0, disable)
    exact(manager, "d(${manager}Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", 25, 12, 42)
        .addInstructions(0, "sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;\nreturn-object v0")
    exact(companion, "enableSdk(Landroid/content/Context;)V", 17, 10, 22).addInstructions(0, """
        invoke-virtual {p0, p1}, $companion->disableSdk(Landroid/content/Context;)V
        return-void
    """.trimIndent())
    // These SDK predicates protect the window before the app bootstrap and
    // background re-entry; stored or later runtime enablement cannot undo it.
    exact(companion, "isDisabled()Z", 17, 10, 52)
        .addInstructions(0, "const/4 v0, 0x1\nreturn v0")
    exact("Lbo/app/qe;", "a()Z", 17, 3, 9)
        .addInstructions(0, "const/4 v0, 0x1\nreturn v0")
    exact("Lbo/app/qe;", "b(Z)V", 17, 10, 17).addInstructions(0, "const/4 p1, 0x1")
    exact(companion, "setOutboundNetworkRequestsOffline(Z)V", 17, 10, 27)
        .addInstructions(0, "const/4 p1, 0x1")
}
