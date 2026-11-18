package patches.flitsmeister

/** Genuine receiver callbacks matched to every publisher accessor and native type record. */
internal data class ReceiverBody15(
    val descriptor: String,
    val registers: Int,
    val program: String,
    val code: String,
    val exceptions: Int,
)

internal val receiverBodies15 = listOf(
    ReceiverBody15(
        "Lkjl;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V", 19, "eipw0h0rNmETWOgv",
        """
    move-object/from16 v0, p0
    iget-object v1, v0, Lkjl;->c:Lmjl;
    iget-object v8, v1, Lmjl;->c:Ldll;
    iget-object v9, v1, Lmjl;->b:Lq0f;
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;
    move-result-object v1
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I
    move-result v2
    const v3, -0x58756162
    if-eq v2, v3, :cond_2
    const v3, -0x141f9074
    if-eq v2, v3, :cond_1
    const v3, 0x14937179
    if-eq v2, v3, :cond_0
    goto :goto_1
    :cond_0
    const-string v2, "com.android.vending.billing.ALTERNATIVE_BILLING"
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :cond_3
    sget-object v1, Lcom/google/android/gms/internal/play_billing/zzjk;->zzd:Lcom/google/android/gms/internal/play_billing/zzjk;
    :goto_0
    move-object v4, v1
    goto :goto_2
    :cond_1
    const-string v2, "com.android.vending.billing.LOCAL_BROADCAST_PURCHASES_UPDATED"
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :cond_3
    sget-object v1, Lcom/google/android/gms/internal/play_billing/zzjk;->zzc:Lcom/google/android/gms/internal/play_billing/zzjk;
    goto :goto_0
    :cond_2
    const-string v2, "com.android.vending.billing.PURCHASES_UPDATED"
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :cond_3
    sget-object v1, Lcom/google/android/gms/internal/play_billing/zzjk;->zzb:Lcom/google/android/gms/internal/play_billing/zzjk;
    goto :goto_0
    :cond_3
    :goto_1
    sget-object v1, Lcom/google/android/gms/internal/play_billing/zzjk;->zza:Lcom/google/android/gms/internal/play_billing/zzjk;
    goto :goto_0
    :goto_2
    sget-object v1, Lcom/google/android/gms/internal/play_billing/zzjk;->zzc:Lcom/google/android/gms/internal/play_billing/zzjk;
    invoke-virtual {v4, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z
    move-result v2
    const/4 v3, 0x2
    if-nez v2, :cond_4
    sget-object v2, Lcom/google/android/gms/internal/play_billing/zzjk;->zzd:Lcom/google/android/gms/internal/play_billing/zzjk;
    invoke-virtual {v4, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :cond_5
    :cond_4
    move v2, v3
    goto :goto_3
    :cond_5
    sget-object v2, Lcom/google/android/gms/internal/play_billing/zzjk;->zzb:Lcom/google/android/gms/internal/play_billing/zzjk;
    invoke-virtual {v4, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :cond_6
    const/16 v2, 0x20
    goto :goto_3
    :cond_6
    const/4 v2, 0x1
    :goto_3
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;
    move-result-object v5
    const/4 v10, 0x0
    const-string v11, "BillingBroadcastManager"
    if-nez v5, :cond_7
    const-string v0, "Bundle is null."
    invoke-static {v11, v0}, Lcom/google/android/gms/internal/play_billing/zzc;->zzo(Ljava/lang/String;Ljava/lang/String;)V
    sget-object v0, Lcom/google/android/gms/internal/play_billing/zzjd;->zzk:Lcom/google/android/gms/internal/play_billing/zzjd;
    sget-object v1, Lcom/android/billingclient/api/h;->h:Lcom/android/billingclient/api/d;
    invoke-static {v0, v2, v1, v10, v4}, Lcll;->b(Lcom/google/android/gms/internal/play_billing/zzjd;ILcom/android/billingclient/api/d;Ljava/lang/String;Lcom/google/android/gms/internal/play_billing/zzjk;)Lcom/google/android/gms/internal/play_billing/zziw;
    move-result-object v0
    check-cast v8, Li2a;
    invoke-virtual {v8, v0}, Li2a;->b(Lcom/google/android/gms/internal/play_billing/zziw;)V
    if-eqz v9, :cond_f
    invoke-interface {v9, v1, v10}, Lq0f;->c(Lcom/android/billingclient/api/d;Ljava/util/List;)V
    return-void
    :cond_7
    const/4 v6, 0x0
    if-ne v2, v3, :cond_b
    sget v3, Lcom/google/android/gms/internal/play_billing/zzc;->zza:I
    invoke-static {}, Lcom/android/billingclient/api/d;->a()Lcom/android/billingclient/api/d${'$'}a;
    move-result-object v3
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;
    move-result-object v7
    invoke-static {v7, v11}, Lcom/google/android/gms/internal/play_billing/zzc;->zzb(Landroid/os/Bundle;Ljava/lang/String;)I
    move-result v7
    iput v7, v3, Lcom/android/billingclient/api/d${'$'}a;->a:I
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;
    move-result-object v7
    if-nez v7, :cond_8
    const-string v7, "Unexpected null bundle received!"
    invoke-static {v11, v7}, Lcom/google/android/gms/internal/play_billing/zzc;->zzo(Ljava/lang/String;Ljava/lang/String;)V
    :goto_4
    move v7, v6
    goto :goto_5
    :cond_8
    const-string v12, "SUB_RESPONSE_CODE"
    invoke-virtual {v7, v12}, Landroid/os/BaseBundle;->get(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object v7
    if-nez v7, :cond_9
    const-string v7, "getOnPurchasesUpdatedSubResponseCodeFromBundle() got null response code, assuming OK"
    invoke-static {v11, v7}, Lcom/google/android/gms/internal/play_billing/zzc;->zzn(Ljava/lang/String;Ljava/lang/String;)V
    goto :goto_4
    :cond_9
    instance-of v12, v7, Ljava/lang/Integer;
    if-eqz v12, :cond_a
    check-cast v7, Ljava/lang/Integer;
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I
    move-result v7
    goto :goto_5
    :cond_a
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object v7
    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;
    move-result-object v7
    const-string v12, "Unexpected type for bundle sub response code: "
    invoke-virtual {v12, v7}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v7
    invoke-static {v11, v7}, Lcom/google/android/gms/internal/play_billing/zzc;->zzo(Ljava/lang/String;Ljava/lang/String;)V
    goto :goto_4
    :goto_5
    iput v7, v3, Lcom/android/billingclient/api/d${'$'}a;->b:I
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;
    move-result-object v7
    invoke-static {v7, v11}, Lcom/google/android/gms/internal/play_billing/zzc;->zzk(Landroid/os/Bundle;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v7
    iput-object v7, v3, Lcom/android/billingclient/api/d${'$'}a;->c:Ljava/lang/String;
    invoke-virtual {v3}, Lcom/android/billingclient/api/d${'$'}a;->a()Lcom/android/billingclient/api/d;
    move-result-object v3
    goto :goto_6
    :cond_b
    move-object/from16 v3, p2
    invoke-static {v3, v11}, Lcom/google/android/gms/internal/play_billing/zzc;->zzi(Landroid/content/Intent;Ljava/lang/String;)Lcom/android/billingclient/api/d;
    move-result-object v3
    :goto_6
    const-string v7, "billingClientTransactionId"
    const-wide/16 v12, 0x0
    invoke-virtual {v5, v7, v12, v13}, Landroid/os/BaseBundle;->getLong(Ljava/lang/String;J)J
    move-result-wide v14
    const-string v7, "wasServiceAutoReconnected"
    invoke-virtual {v5, v7, v6}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z
    move-result v7
    sget-object v6, Lcom/google/android/gms/internal/play_billing/zzjk;->zzb:Lcom/google/android/gms/internal/play_billing/zzjk;
    invoke-virtual {v4, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z
    move-result v6
    if-nez v6, :cond_c
    invoke-virtual {v4, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :cond_d
    :cond_c
    move-object v1, v3
    move v3, v2
    move-object v2, v1
    move-object v1, v5
    move-wide v5, v14
    goto :goto_7
    :cond_d
    sget-object v1, Lcom/google/android/gms/internal/play_billing/zzjk;->zzd:Lcom/google/android/gms/internal/play_billing/zzjk;
    invoke-virtual {v4, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :cond_f
    iget v1, v3, Lcom/android/billingclient/api/d;->a:I
    if-eqz v1, :cond_e
    move-object v1, v3
    move v3, v2
    move-object v2, v1
    move-object v1, v5
    move-wide v5, v14
    invoke-virtual/range {v0 .. v7}, Lkjl;->c(Landroid/os/Bundle;Lcom/android/billingclient/api/d;ILcom/google/android/gms/internal/play_billing/zzjk;JZ)V
    invoke-static {}, Lcom/google/android/gms/internal/play_billing/zzbw;->zzk()Lcom/google/android/gms/internal/play_billing/zzbw;
    move-result-object v0
    invoke-interface {v9, v2, v0}, Lq0f;->c(Lcom/android/billingclient/api/d;Ljava/util/List;)V
    return-void
    :cond_e
    move v3, v2
    move-wide v5, v14
    const-string v0, "No valid alternative billing listener is registered."
    invoke-static {v11, v0}, Lcom/google/android/gms/internal/play_billing/zzc;->zzo(Ljava/lang/String;Ljava/lang/String;)V
    sget-object v0, Lcom/google/android/gms/internal/play_billing/zzjd;->zzbK:Lcom/google/android/gms/internal/play_billing/zzjd;
    sget-object v1, Lcom/android/billingclient/api/h;->h:Lcom/android/billingclient/api/d;
    invoke-static {v0, v3, v1, v10, v4}, Lcll;->b(Lcom/google/android/gms/internal/play_billing/zzjd;ILcom/android/billingclient/api/d;Ljava/lang/String;Lcom/google/android/gms/internal/play_billing/zzjk;)Lcom/google/android/gms/internal/play_billing/zziw;
    move-result-object v0
    check-cast v8, Li2a;
    invoke-virtual {v8, v0, v5, v6, v7}, Li2a;->d(Lcom/google/android/gms/internal/play_billing/zziw;JZ)V
    invoke-static {}, Lcom/google/android/gms/internal/play_billing/zzbw;->zzk()Lcom/google/android/gms/internal/play_billing/zzbw;
    move-result-object v0
    invoke-interface {v9, v1, v0}, Lq0f;->c(Lcom/android/billingclient/api/d;Ljava/util/List;)V
    :cond_f
    return-void
    :goto_7
    invoke-static {v1}, Lcom/google/android/gms/internal/play_billing/zzc;->zzm(Landroid/os/Bundle;)Ljava/util/List;
    move-result-object v10
    iget v0, v2, Lcom/android/billingclient/api/d;->a:I
    if-nez v0, :cond_11
    invoke-static {v3, v4}, Lcll;->c(ILcom/google/android/gms/internal/play_billing/zzjk;)Lcom/google/android/gms/internal/play_billing/zzja;
    move-result-object v0
    check-cast v8, Li2a;
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_start_0
    invoke-virtual {v0}, Lcom/google/android/gms/internal/play_billing/zzfu;->zzq()Lcom/google/android/gms/internal/play_billing/zzfq;
    move-result-object v1
    check-cast v1, Lcom/google/android/gms/internal/play_billing/zziy;
    invoke-virtual {v0}, Lcom/google/android/gms/internal/play_billing/zzja;->zzc()Lcom/google/android/gms/internal/play_billing/zzke;
    move-result-object v0
    invoke-virtual {v0}, Lcom/google/android/gms/internal/play_billing/zzfu;->zzq()Lcom/google/android/gms/internal/play_billing/zzfq;
    move-result-object v0
    check-cast v0, Lcom/google/android/gms/internal/play_billing/zzjz;
    invoke-virtual {v0, v7}, Lcom/google/android/gms/internal/play_billing/zzjz;->zza(Z)Lcom/google/android/gms/internal/play_billing/zzjz;
    invoke-virtual {v1, v0}, Lcom/google/android/gms/internal/play_billing/zziy;->zzc(Lcom/google/android/gms/internal/play_billing/zzjz;)Lcom/google/android/gms/internal/play_billing/zziy;
    invoke-virtual {v1}, Lcom/google/android/gms/internal/play_billing/zzfq;->zzi()Lcom/google/android/gms/internal/play_billing/zzfu;
    move-result-object v0
    check-cast v0, Lcom/google/android/gms/internal/play_billing/zzja;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    cmp-long v1, v5, v12
    iget-object v3, v8, Li2a;->b:Ljava/lang/Object;
    check-cast v3, Lcom/google/android/gms/internal/play_billing/zzjr;
    if-nez v1, :cond_10
    goto :goto_8
    :cond_10
    :try_start_1
    invoke-virtual {v3}, Lcom/google/android/gms/internal/play_billing/zzfu;->zzq()Lcom/google/android/gms/internal/play_billing/zzfq;
    move-result-object v1
    check-cast v1, Lcom/google/android/gms/internal/play_billing/zzjp;
    invoke-virtual {v1, v5, v6}, Lcom/google/android/gms/internal/play_billing/zzjp;->zze(J)Lcom/google/android/gms/internal/play_billing/zzjp;
    invoke-virtual {v1}, Lcom/google/android/gms/internal/play_billing/zzfq;->zzi()Lcom/google/android/gms/internal/play_billing/zzfu;
    move-result-object v1
    move-object v3, v1
    check-cast v3, Lcom/google/android/gms/internal/play_billing/zzjr;
    :goto_8
    invoke-virtual {v8, v0, v3}, Li2a;->h(Lcom/google/android/gms/internal/play_billing/zzja;Lcom/google/android/gms/internal/play_billing/zzjr;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    goto :goto_9
    :catchall_0
    move-exception v0
    const-string v1, "BillingLogger"
    const-string v3, "Unable to log."
    invoke-static {v1, v3, v0}, Lcom/google/android/gms/internal/play_billing/zzc;->zzp(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    goto :goto_9
    :cond_11
    move-object/from16 v0, p0
    invoke-virtual/range {v0 .. v7}, Lkjl;->c(Landroid/os/Bundle;Lcom/android/billingclient/api/d;ILcom/google/android/gms/internal/play_billing/zzjk;JZ)V
    :goto_9
    invoke-interface {v9, v2, v10}, Lq0f;->c(Lcom/android/billingclient/api/d;Ljava/util/List;)V
    return-void
        """.trimIndent(), 2,
    ),
    ReceiverBody15(
        "Lnl/flitsmeister/managers/bluetooth/BluetoothDevicesManager\$BluetoothDevicesReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V", 7, "J3PpjrlwTuTi8Ay7",
        """
    iget-object p0, p0, Lnl/flitsmeister/managers/bluetooth/BluetoothDevicesManager${'$'}BluetoothDevicesReceiver;->a:Lnl/flitsmeister/managers/bluetooth/BluetoothDevicesManager;
    iget-object p0, p0, Lnl/flitsmeister/managers/bluetooth/BluetoothDevicesManager;->d:Ljava/util/HashSet;
    const/4 p1, 0x0
    if-eqz p2, :cond_0
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;
    move-result-object v0
    goto :goto_0
    :cond_0
    move-object v0, p1
    :goto_0
    if-eqz v0, :cond_a
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I
    move-result v1
    const v2, -0x11f77b4b
    const-string v3, "android.bluetooth.device.extra.DEVICE"
    if-eq v1, v2, :cond_6
    const v2, 0x459717c3
    if-eq v1, v2, :cond_5
    const v2, 0x6c9330ef
    if-eq v1, v2, :cond_1
    goto/16 :goto_3
    :cond_1
    const-string v1, "android.bluetooth.device.action.ACL_DISCONNECTED"
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :cond_2
    goto :goto_3
    :cond_2
    sget-object v0, Lnl/flitsmeister/managers/bluetooth/BluetoothDevicesManager;->j:Lnl/flitsmeister/managers/bluetooth/BluetoothDevicesManager${'$'}a;
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    invoke-virtual {p2, v3}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :cond_4
    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;
    move-result-object p2
    if-eqz p2, :cond_3
    invoke-virtual {p2, v3}, Landroid/os/BaseBundle;->get(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object p2
    goto :goto_1
    :cond_3
    move-object p2, p1
    :goto_1
    instance-of v0, p2, Landroid/bluetooth/BluetoothDevice;
    if-eqz v0, :cond_4
    move-object p1, p2
    check-cast p1, Landroid/bluetooth/BluetoothDevice;
    :cond_4
    if-eqz p1, :cond_a
    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;
    move-result-object p1
    if-eqz p1, :cond_a
    invoke-virtual {p0, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z
    return-void
    :cond_5
    const-string v1, "android.bluetooth.device.action.FOUND"
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :cond_7
    goto :goto_3
    :cond_6
    const-string v1, "android.bluetooth.device.action.ACL_CONNECTED"
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :cond_a
    :cond_7
    sget-object v0, Lnl/flitsmeister/managers/bluetooth/BluetoothDevicesManager;->j:Lnl/flitsmeister/managers/bluetooth/BluetoothDevicesManager${'$'}a;
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    invoke-virtual {p2, v3}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :cond_9
    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;
    move-result-object p2
    if-eqz p2, :cond_8
    invoke-virtual {p2, v3}, Landroid/os/BaseBundle;->get(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object p2
    goto :goto_2
    :cond_8
    move-object p2, p1
    :goto_2
    instance-of v0, p2, Landroid/bluetooth/BluetoothDevice;
    if-eqz v0, :cond_9
    move-object p1, p2
    check-cast p1, Landroid/bluetooth/BluetoothDevice;
    :cond_9
    if-eqz p1, :cond_a
    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;
    move-result-object p1
    if-eqz p1, :cond_a
    invoke-virtual {p0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
    :cond_a
    :goto_3
    return-void
        """.trimIndent(), 0,
    ),
    ReceiverBody15(
        "Lnl/flitsmeister/receivers/autostart/AutoStartBluetoothEventReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V", 18, "f84JbW2VkAlvaukk",
        """
    move-object/from16 v4, p1
    move-object/from16 v8, p2
    invoke-super/range {p0 .. p2}, Lnl/flitsmeister/receivers/autostart/Hilt_AutoStartBluetoothEventReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    sget-object v9, Lt1b;->a:Lorg/slf4j/Logger;
    const-string v0, "Bluetooth intent received"
    invoke-interface {v9, v0}, Lorg/slf4j/Logger;->info(Ljava/lang/String;)V
    invoke-virtual {v8}, Landroid/content/Intent;->getAction()Ljava/lang/String;
    move-result-object v10
    const-string v0, "android.bluetooth.device.action.ACL_CONNECTED"
    invoke-static {v10, v0}, Lq9a;->e(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result v1
    const-string v2, "android.bluetooth.headset.profile.action.CONNECTION_STATE_CHANGED"
    const-string v3, "android.bluetooth.headset.profile.action.AUDIO_STATE_CHANGED"
    const-string v11, "android.bluetooth.adapter.action.STATE_CHANGED"
    const-string v5, "android.bluetooth.device.action.ACL_DISCONNECTED"
    const-string v6, "Exception logging to firebase crashlytics"
    if-nez v1, :cond_2
    invoke-static {v10, v5}, Lq9a;->e(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result v1
    if-nez v1, :cond_2
    invoke-static {v10, v11}, Lq9a;->e(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result v1
    if-nez v1, :cond_2
    invoke-static {v10, v3}, Lq9a;->e(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result v1
    if-nez v1, :cond_2
    invoke-static {v10, v2}, Lq9a;->e(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :cond_0
    goto :goto_0
    :cond_0
    const-string p0, "Ignoring unsupported Bluetooth intent action: "
    invoke-static {p0, v10}, Lil5;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-static {}, Lhha;->c()Lorg/slf4j/Logger;
    move-result-object v0
    if-eqz v0, :cond_1
    invoke-interface {v0, p0}, Lorg/slf4j/Logger;->info(Ljava/lang/String;)V
    :cond_1
    :try_start_0
    invoke-static {}, Lfb8;->a()Lfb8;
    move-result-object v0
    invoke-virtual {v0, p0}, Lfb8;->b(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0
    return-void
    :catch_0
    move-exception v0
    move-object p0, v0
    invoke-static {v6, p0}, Lhha;->g(Ljava/lang/String;Ljava/lang/Throwable;)V
    return-void
    :cond_2
    :goto_0
    invoke-virtual {v3, v10}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-nez v1, :cond_14
    invoke-virtual {v2, v10}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :cond_3
    goto/16 :goto_f
    :cond_3
    sget v1, Landroid/os/Build${'$'}VERSION;->SDK_INT:I
    const-string v12, "android.permission.BLUETOOTH_CONNECT"
    const/16 v13, 0x1f
    const/4 v14, 0x0
    if-lt v1, v13, :cond_5
    invoke-static {v4, v12}, Landroidx/core/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I
    move-result v1
    if-nez v1, :cond_4
    goto :goto_1
    :cond_4
    move-object v3, v14
    goto :goto_2
    :cond_5
    :goto_1
    const-string v1, "android.bluetooth.device.extra.DEVICE"
    const-class v2, Landroid/bluetooth/BluetoothDevice;
    invoke-static {v8, v1, v2}, Landroidx/core/content/IntentCompat;->getParcelableExtra(Landroid/content/Intent;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Landroid/bluetooth/BluetoothDevice;
    move-object v3, v1
    :goto_2
    if-eqz v3, :cond_6
    invoke-virtual {v3}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;
    move-result-object v1
    goto :goto_3
    :cond_6
    move-object v1, v14
    :goto_3
    if-eqz v1, :cond_e
    sget-boolean v4, Lvug;->b:Z
    invoke-virtual {v0, v10}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :cond_8
    invoke-static {}, Lhha;->c()Lorg/slf4j/Logger;
    move-result-object v0
    const-string v1, "Bluetooth device connected"
    if-eqz v0, :cond_7
    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->info(Ljava/lang/String;)V
    :cond_7
    :try_start_1
    invoke-static {}, Lfb8;->a()Lfb8;
    move-result-object v0
    invoke-virtual {v0, v1}, Lfb8;->b(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_1
    goto :goto_4
    :catch_1
    move-exception v0
    invoke-static {v6, v0}, Lhha;->g(Ljava/lang/String;Ljava/lang/Throwable;)V
    :goto_4
    invoke-virtual {p0}, Landroid/content/BroadcastReceiver;->goAsync()Landroid/content/BroadcastReceiver${'$'}PendingResult;
    move-result-object v1
    new-instance v0, Lws0;
    const/4 v5, 0x0
    move-object v2, p0
    move-object/from16 v4, p1
    invoke-direct/range {v0 .. v5}, Lws0;-><init>(Landroid/content/BroadcastReceiver${'$'}PendingResult;Lnl/flitsmeister/receivers/autostart/AutoStartBluetoothEventReceiver;Landroid/bluetooth/BluetoothDevice;Landroid/content/Context;Lsn4;)V
    sget-object v1, Ln37;->a:Lre6;
    sget-object v1, Lv96;->a:Lv96;
    invoke-static {v1, v0}, Lhv0;->e(Lb45;Li49;)Lyhi;
    goto :goto_a
    :cond_8
    invoke-virtual {v5, v10}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :cond_d
    invoke-static {}, Lhha;->c()Lorg/slf4j/Logger;
    move-result-object v0
    const-string v1, "Bluetooth device disconnected"
    if-eqz v0, :cond_9
    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->info(Ljava/lang/String;)V
    :cond_9
    :try_start_2
    invoke-static {}, Lfb8;->a()Lfb8;
    move-result-object v0
    invoke-virtual {v0, v1}, Lfb8;->b(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/IllegalStateException; {:try_start_2 .. :try_end_2} :catch_2
    goto :goto_5
    :catch_2
    move-exception v0
    invoke-static {v6, v0}, Lhha;->g(Ljava/lang/String;Ljava/lang/Throwable;)V
    :goto_5
    sget-wide v0, Lnza;->c:J
    const-wide/16 v5, 0x0
    cmp-long v2, v0, v5
    if-lez v2, :cond_a
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J
    move-result-wide v5
    sub-long/2addr v5, v0
    const-wide/16 v0, 0x2710
    cmp-long v0, v5, v0
    if-ltz v0, :cond_a
    const/4 v0, 0x1
    goto :goto_6
    :cond_a
    const/4 v0, 0x0
    :goto_6
    invoke-static {}, Lnza;->b()Ljava/lang/Float;
    move-result-object v1
    if-eqz v1, :cond_c
    if-nez v0, :cond_b
    goto :goto_7
    :cond_b
    move-object v1, v14
    :goto_7
    if-eqz v1, :cond_c
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F
    move-result v0
    :goto_8
    move v5, v0
    goto :goto_9
    :cond_c
    const/4 v0, 0x0
    goto :goto_8
    :goto_9
    invoke-virtual {p0}, Landroid/content/BroadcastReceiver;->goAsync()Landroid/content/BroadcastReceiver${'$'}PendingResult;
    move-result-object v1
    new-instance v0, Lvs0;
    const/4 v7, 0x0
    move-object v2, p0
    move-object/from16 v6, p1
    invoke-direct/range {v0 .. v7}, Lvs0;-><init>(Landroid/content/BroadcastReceiver${'$'}PendingResult;Lnl/flitsmeister/receivers/autostart/AutoStartBluetoothEventReceiver;Landroid/bluetooth/BluetoothDevice;ZFLandroid/content/Context;Lsn4;)V
    move-object v4, v6
    sget-object v1, Ln37;->a:Lre6;
    sget-object v1, Lv96;->a:Lv96;
    invoke-static {v1, v0}, Lhv0;->e(Lb45;Li49;)Lyhi;
    goto :goto_a
    :cond_d
    move-object/from16 v4, p1
    :cond_e
    :goto_a
    sget-boolean v0, Lnl/flitsmeister/FlitsmeisterApplication;->I:Z
    if-eqz v0, :cond_f
    invoke-virtual {v11, v10}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :cond_f
    const-string v0, "android.bluetooth.adapter.extra.STATE"
    const/4 v1, -0x1
    invoke-virtual {v8, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I
    move-result v0
    const/16 v1, 0xa
    if-ne v0, v1, :cond_f
    invoke-virtual/range {p0 .. p1}, Lnl/flitsmeister/receivers/autostart/AutoStartBluetoothEventReceiver;->a(Landroid/content/Context;)V
    :cond_f
    const-string p0, ", action: "
    const-string v1, "BT Event: device "
    if-eqz v3, :cond_13
    sget v0, Landroid/os/Build${'$'}VERSION;->SDK_INT:I
    if-lt v0, v13, :cond_10
    invoke-static {v4, v12}, Landroidx/core/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I
    move-result v0
    if-nez v0, :cond_11
    :cond_10
    move-object v14, v3
    :cond_11
    if-eqz v14, :cond_13
    invoke-virtual {v14}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;
    move-result-object v0
    if-nez v0, :cond_12
    goto :goto_c
    :cond_12
    :goto_b
    move-object v2, v0
    goto :goto_d
    :cond_13
    :goto_c
    const-string v0, "<unknown>"
    goto :goto_b
    :goto_d
    :try_start_3
    invoke-virtual {v8}, Landroid/content/Intent;->getAction()Ljava/lang/String;
    move-result-object v0
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-interface {v9, v0}, Lorg/slf4j/Logger;->info(Ljava/lang/String;)V
    sget-object v0, Ll1k;->a:Ll1k;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    goto :goto_e
    :catchall_0
    move-exception v0
    new-instance v3, Leof${'$'}a;
    invoke-direct {v3, v0}, Leof${'$'}a;-><init>(Ljava/lang/Throwable;)V
    move-object v0, v3
    :goto_e
    invoke-static {v0}, Leof;->a(Ljava/lang/Object;)Ljava/lang/Throwable;
    move-result-object v0
    if-eqz v0, :cond_15
    sget-object v3, Lt1b;->a:Lorg/slf4j/Logger;
    invoke-virtual {v8}, Landroid/content/Intent;->getAction()Ljava/lang/String;
    move-result-object v4
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;
    move-result-object v0
    const-string v5, ", error: "
    invoke-static {v1, v2, p0, v4, v5}, Lzm2;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-interface {v3, p0}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V
    goto :goto_10
    :cond_14
    :goto_f
    const-string p0, "android.bluetooth.profile.extra.STATE"
    invoke-virtual {v8, p0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z
    move-result p0
    if-eqz p0, :cond_15
    const-string p0, "Bluetooth headset connected"
    invoke-interface {v9, p0}, Lorg/slf4j/Logger;->info(Ljava/lang/String;)V
    :cond_15
    :goto_10
    return-void
        """.trimIndent(), 4,
    ),
    ReceiverBody15(
        "Lnl/flitsmeister/receivers/autostart/AutoStartBootCompletedReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V", 4, "wojvNhr4mTy8pcCh",
        """
    invoke-super {p0, p1, p2}, Lnl/flitsmeister/receivers/autostart/Hilt_AutoStartBootCompletedReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    new-instance p0, Ljava/lang/StringBuilder;
    const-string v0, "[AutoStartBootCompletedReceiver] Intent received: "
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    sget-object v0, Lhha;->a:Lhha;
    invoke-virtual {v0, p0}, Lhha;->b(Ljava/lang/String;)V
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;
    move-result-object p0
    const-string p2, "android.intent.action.LOCKED_BOOT_COMPLETED"
    invoke-static {p0, p2}, Lq9a;->e(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result p2
    if-nez p2, :cond_1
    const-string p2, "android.intent.action.BOOT_COMPLETED"
    invoke-static {p0, p2}, Lq9a;->e(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result p2
    if-nez p2, :cond_1
    const-string p2, "android.intent.action.REBOOT"
    invoke-static {p0, p2}, Lq9a;->e(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result p2
    if-nez p2, :cond_1
    const-string p2, "android.intent.action.QUICKBOOT_POWERON"
    invoke-static {p0, p2}, Lq9a;->e(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result p2
    if-nez p2, :cond_1
    const-string p2, "com.htc.intent.action.QUICKBOOT_POWERON"
    invoke-static {p0, p2}, Lq9a;->e(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result p2
    if-nez p2, :cond_1
    const-string p2, "com.samsung.intent.action.QUICKBOOT_POWERON"
    invoke-static {p0, p2}, Lq9a;->e(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result p2
    if-nez p2, :cond_1
    const-string p2, "android.intent.action.MY_PACKAGE_REPLACED"
    invoke-static {p0, p2}, Lq9a;->e(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result p2
    if-nez p2, :cond_1
    const-string p2, "android.intent.action.ACTION_BOOT_COMPLETED"
    invoke-static {p0, p2}, Lq9a;->e(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result p2
    if-eqz p2, :cond_0
    goto :goto_0
    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;
    const-string p2, "[AutoStartBootCompletedReceiver] Ignoring unsupported boot intent action: "
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-virtual {v0, p0}, Lhha;->b(Ljava/lang/String;)V
    return-void
    :cond_1
    :goto_0
    sget-boolean p0, Lvug;->b:Z
    if-nez p0, :cond_2
    sget-object p0, Lnl/flitsmeister/services/autostart/AutoStartDetectionService;->Companion:Lnl/flitsmeister/services/autostart/AutoStartDetectionService${'$'}Companion;
    invoke-virtual {p0, p1}, Lnl/flitsmeister/services/autostart/AutoStartDetectionService${'$'}Companion;->startDetecting(Landroid/content/Context;)V
    const-string p0, "[AutoStartBootCompletedReceiver] Enabling motion sensor..."
    invoke-virtual {v0, p0}, Lhha;->b(Ljava/lang/String;)V
    :cond_2
    return-void
        """.trimIndent(), 0,
    ),
    ReceiverBody15(
        "Lnl/flitsmeister/receivers/bluetooth/BluetoothAdapterStateReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V", 6, "S87ByAhlJV46n5Wl",
        """
    if-eqz p2, :cond_3
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;
    move-result-object p0
    if-nez p0, :cond_0
    goto/16 :goto_2
    :cond_0
    const-string v0, "android.bluetooth.adapter.action.STATE_CHANGED"
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z
    move-result v0
    const-string v1, "bluetooth"
    if-eqz v0, :cond_1
    const-string v0, "android.bluetooth.adapter.extra.STATE"
    const/4 v2, -0x1
    invoke-virtual {p2, v0, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I
    move-result p2
    packed-switch p2, :pswitch_data_0
    goto :goto_0
    :pswitch_0
    invoke-static {}, Lnl/flitsmeister/models/eventbuses/ConnectedDeviceBusKt;->getBusBluetoothAdapterStatus()Las7;
    move-result-object p2
    sget-object v0, Lnl/flitsmeister/models/enums/BluetoothAdapterStatus;->TURNING_OFF:Lnl/flitsmeister/models/enums/BluetoothAdapterStatus;
    invoke-virtual {p2, v0}, Las7;->a(Ljava/lang/Object;)V
    goto :goto_0
    :pswitch_1
    invoke-static {}, Lnl/flitsmeister/models/eventbuses/ConnectedDeviceBusKt;->getBusBluetoothAdapterStatus()Las7;
    move-result-object p2
    sget-object v0, Lnl/flitsmeister/models/enums/BluetoothAdapterStatus;->ON:Lnl/flitsmeister/models/enums/BluetoothAdapterStatus;
    invoke-virtual {p2, v0}, Las7;->a(Ljava/lang/Object;)V
    goto :goto_0
    :pswitch_2
    invoke-static {}, Lnl/flitsmeister/models/eventbuses/ConnectedDeviceBusKt;->getBusBluetoothAdapterStatus()Las7;
    move-result-object p2
    sget-object v0, Lnl/flitsmeister/models/enums/BluetoothAdapterStatus;->TURNING_ON:Lnl/flitsmeister/models/enums/BluetoothAdapterStatus;
    invoke-virtual {p2, v0}, Las7;->a(Ljava/lang/Object;)V
    goto :goto_0
    :pswitch_3
    invoke-static {}, Lnl/flitsmeister/models/eventbuses/ConnectedDeviceBusKt;->getBusBluetoothAdapterStatus()Las7;
    move-result-object p2
    sget-object v0, Lnl/flitsmeister/models/enums/BluetoothAdapterStatus;->OFF:Lnl/flitsmeister/models/enums/BluetoothAdapterStatus;
    invoke-virtual {p2, v0}, Las7;->a(Ljava/lang/Object;)V
    sget-boolean p2, Lnl/flitsmeister/receivers/bluetooth/BluetoothAdapterStateReceiver;->b:Z
    if-eqz p2, :cond_1
    const/4 p2, 0x0
    sput-boolean p2, Lnl/flitsmeister/receivers/bluetooth/BluetoothAdapterStateReceiver;->b:Z
    if-eqz p1, :cond_1
    invoke-static {p1}, Lo9e;->b(Landroid/content/Context;)Z
    move-result p2
    if-eqz p2, :cond_1
    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object p2
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    check-cast p2, Landroid/bluetooth/BluetoothManager;
    invoke-virtual {p2}, Landroid/bluetooth/BluetoothManager;->getAdapter()Landroid/bluetooth/BluetoothAdapter;
    move-result-object p2
    if-eqz p2, :cond_1
    invoke-virtual {p2}, Landroid/bluetooth/BluetoothAdapter;->enable()Z
    :cond_1
    :goto_0
    if-eqz p1, :cond_2
    const p2, 0x7f1405fa
    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object p2
    goto :goto_1
    :cond_2
    const/4 p2, 0x0
    :goto_1
    invoke-static {p2, p0}, Lq9a;->e(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result p0
    if-eqz p0, :cond_3
    sget p0, Lsc0;->a:I
    invoke-static {p1}, Lsc0;->n(Landroid/content/Context;)V
    const/4 p0, 0x1
    sput-boolean p0, Lnl/flitsmeister/receivers/bluetooth/BluetoothAdapterStateReceiver;->b:Z
    invoke-static {p1}, Lo9e;->b(Landroid/content/Context;)Z
    move-result p0
    if-eqz p0, :cond_3
    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object p0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    check-cast p0, Landroid/bluetooth/BluetoothManager;
    invoke-virtual {p0}, Landroid/bluetooth/BluetoothManager;->getAdapter()Landroid/bluetooth/BluetoothAdapter;
    move-result-object p0
    if-eqz p0, :cond_3
    invoke-virtual {p0}, Landroid/bluetooth/BluetoothAdapter;->disable()Z
    :cond_3
    :goto_2
    return-void
    nop
    :pswitch_data_0
    .packed-switch 0xa
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
        """.trimIndent(), 0,
    ),
    ReceiverBody15(
        "Lno/nordicsemi/android/ble/BleManagerHandler\$b;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V", 9, "hCAzd1cDreEHmbvI",
        """
    const-string p1, "android.bluetooth.device.extra.DEVICE"
    invoke-virtual {p2, p1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;
    move-result-object p1
    check-cast p1, Landroid/bluetooth/BluetoothDevice;
    const-string v0, "android.bluetooth.device.extra.BOND_STATE"
    const/4 v1, -0x1
    invoke-virtual {p2, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I
    move-result v0
    const-string v2, "android.bluetooth.device.extra.PREVIOUS_BOND_STATE"
    invoke-virtual {p2, v2, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I
    move-result p2
    iget-object p0, p0, Lno/nordicsemi/android/ble/BleManagerHandler${'$'}b;->a:Lno/nordicsemi/android/ble/BleManagerHandler;
    iget-object v1, p0, Lno/nordicsemi/android/ble/BleManagerHandler;->f:Landroid/bluetooth/BluetoothDevice;
    if-eqz v1, :cond_8
    if-eqz p1, :cond_8
    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;
    move-result-object v1
    iget-object v2, p0, Lno/nordicsemi/android/ble/BleManagerHandler;->f:Landroid/bluetooth/BluetoothDevice;
    invoke-virtual {v2}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;
    move-result-object v2
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-nez v1, :cond_0
    goto/16 :goto_1
    :cond_0
    new-instance v1, Lhk1;
    invoke-direct {v1, v0}, Lhk1;-><init>(I)V
    const/4 v2, 0x3
    invoke-virtual {p0, v2, v1}, Lno/nordicsemi/android/ble/BleManagerHandler;->H0(ILno/nordicsemi/android/ble/BleManagerHandler${'$'}d;)V
    sget-object v1, Lno/nordicsemi/android/ble/p${'$'}a;->q:Lno/nordicsemi/android/ble/p${'$'}a;
    sget-object v2, Lno/nordicsemi/android/ble/p${'$'}a;->d:Lno/nordicsemi/android/ble/p${'$'}a;
    const/4 v3, 0x0
    const/4 v4, 0x1
    packed-switch v0, :pswitch_data_0
    goto/16 :goto_0
    :pswitch_0
    iget-object p2, p0, Lno/nordicsemi/android/ble/BleManagerHandler;->h:Lzj1;
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    iget-object p2, p0, Lno/nordicsemi/android/ble/BleManagerHandler;->h:Lzj1;
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    iget-object p2, p0, Lno/nordicsemi/android/ble/BleManagerHandler;->h:Lzj1;
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    iget-object p2, p0, Lno/nordicsemi/android/ble/BleManagerHandler;->A:Lno/nordicsemi/android/ble/p;
    if-eqz p2, :cond_2
    iget-object v0, p2, Lno/nordicsemi/android/ble/p;->d:Lno/nordicsemi/android/ble/p${'$'}a;
    if-eq v0, v2, :cond_1
    if-ne v0, v1, :cond_2
    :cond_1
    invoke-virtual {p2, p1}, Lno/nordicsemi/android/ble/p;->e(Landroid/bluetooth/BluetoothDevice;)Z
    iput-object v3, p0, Lno/nordicsemi/android/ble/BleManagerHandler;->A:Lno/nordicsemi/android/ble/p;
    goto/16 :goto_0
    :cond_2
    iget-boolean p1, p0, Lno/nordicsemi/android/ble/BleManagerHandler;->m:Z
    if-nez p1, :cond_8
    iget-boolean p1, p0, Lno/nordicsemi/android/ble/BleManagerHandler;->o:Z
    if-nez p1, :cond_8
    iget-object p1, p0, Lno/nordicsemi/android/ble/BleManagerHandler;->g:Landroid/bluetooth/BluetoothGatt;
    if-eqz p1, :cond_8
    iput-boolean v4, p0, Lno/nordicsemi/android/ble/BleManagerHandler;->o:Z
    iget-object p2, p0, Lno/nordicsemi/android/ble/BleManagerHandler;->h:Lzj1;
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    iget-object p0, p0, Lno/nordicsemi/android/ble/BleManagerHandler;->h:Lzj1;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGatt;->discoverServices()Z
    return-void
    :pswitch_1
    iget-object p1, p0, Lno/nordicsemi/android/ble/BleManagerHandler;->h:Lzj1;
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    iget-object p0, p0, Lno/nordicsemi/android/ble/BleManagerHandler;->h:Lzj1;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    return-void
    :pswitch_2
    const/16 v0, 0xb
    if-ne p2, v0, :cond_5
    iget-object p2, p0, Lno/nordicsemi/android/ble/BleManagerHandler;->h:Lzj1;
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    iget-object p2, p0, Lno/nordicsemi/android/ble/BleManagerHandler;->h:Lzj1;
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    iget-object p2, p0, Lno/nordicsemi/android/ble/BleManagerHandler;->h:Lzj1;
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    iget-object p2, p0, Lno/nordicsemi/android/ble/BleManagerHandler;->h:Lzj1;
    const-string v0, "Bonding failed"
    const/4 v5, 0x5
    invoke-virtual {p2, v5, v0}, Lzj1;->b(ILjava/lang/String;)V
    iget-object p2, p0, Lno/nordicsemi/android/ble/BleManagerHandler;->A:Lno/nordicsemi/android/ble/p;
    if-eqz p2, :cond_4
    iget-object v0, p2, Lno/nordicsemi/android/ble/p;->d:Lno/nordicsemi/android/ble/p${'$'}a;
    if-eq v0, v2, :cond_3
    if-eq v0, v1, :cond_3
    sget-object v1, Lno/nordicsemi/android/ble/p${'$'}a;->x:Lno/nordicsemi/android/ble/p${'$'}a;
    if-eq v0, v1, :cond_3
    sget-object v1, Lno/nordicsemi/android/ble/p${'$'}a;->I:Lno/nordicsemi/android/ble/p${'$'}a;
    if-eq v0, v1, :cond_3
    sget-object v1, Lno/nordicsemi/android/ble/p${'$'}a;->y:Lno/nordicsemi/android/ble/p${'$'}a;
    if-eq v0, v1, :cond_3
    sget-object v1, Lno/nordicsemi/android/ble/p${'$'}a;->X:Lno/nordicsemi/android/ble/p${'$'}a;
    if-ne v0, v1, :cond_4
    :cond_3
    const/4 v0, -0x4
    invoke-virtual {p2, p1, v0}, Lno/nordicsemi/android/ble/p;->b(Landroid/bluetooth/BluetoothDevice;I)V
    iput-object v3, p0, Lno/nordicsemi/android/ble/BleManagerHandler;->A:Lno/nordicsemi/android/ble/p;
    :cond_4
    iget-boolean p1, p0, Lno/nordicsemi/android/ble/BleManagerHandler;->m:Z
    if-nez p1, :cond_7
    iget-boolean p1, p0, Lno/nordicsemi/android/ble/BleManagerHandler;->o:Z
    if-nez p1, :cond_7
    iget-object p1, p0, Lno/nordicsemi/android/ble/BleManagerHandler;->g:Landroid/bluetooth/BluetoothGatt;
    if-eqz p1, :cond_8
    iput-boolean v4, p0, Lno/nordicsemi/android/ble/BleManagerHandler;->o:Z
    iget-object p2, p0, Lno/nordicsemi/android/ble/BleManagerHandler;->h:Lzj1;
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    iget-object p0, p0, Lno/nordicsemi/android/ble/BleManagerHandler;->h:Lzj1;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGatt;->discoverServices()Z
    return-void
    :cond_5
    const/16 v0, 0xc
    if-ne p2, v0, :cond_7
    iput-boolean v4, p0, Lno/nordicsemi/android/ble/BleManagerHandler;->t:Z
    iget-object p2, p0, Lno/nordicsemi/android/ble/BleManagerHandler;->A:Lno/nordicsemi/android/ble/p;
    if-eqz p2, :cond_6
    iget-object p2, p2, Lno/nordicsemi/android/ble/p;->d:Lno/nordicsemi/android/ble/p${'$'}a;
    sget-object v0, Lno/nordicsemi/android/ble/p${'$'}a;->s:Lno/nordicsemi/android/ble/p${'$'}a;
    if-ne p2, v0, :cond_6
    iget-object p2, p0, Lno/nordicsemi/android/ble/BleManagerHandler;->h:Lzj1;
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    iget-object p2, p0, Lno/nordicsemi/android/ble/BleManagerHandler;->A:Lno/nordicsemi/android/ble/p;
    invoke-virtual {p2, p1}, Lno/nordicsemi/android/ble/p;->e(Landroid/bluetooth/BluetoothDevice;)Z
    iput-object v3, p0, Lno/nordicsemi/android/ble/BleManagerHandler;->A:Lno/nordicsemi/android/ble/p;
    :cond_6
    iget-boolean p1, p0, Lno/nordicsemi/android/ble/BleManagerHandler;->r:Z
    if-nez p1, :cond_7
    invoke-virtual {p0}, Lno/nordicsemi/android/ble/BleManagerHandler;->s0()V
    :cond_7
    :goto_0
    invoke-virtual {p0, v4}, Lno/nordicsemi/android/ble/BleManagerHandler;->I0(Z)V
    :cond_8
    :goto_1
    return-void
    :pswitch_data_0
    .packed-switch 0xa
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
        """.trimIndent(), 0,
    ),
    ReceiverBody15(
        "Lno/nordicsemi/android/dfu/DfuServiceListenerHelper\$ProgressBroadcastsReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V", 10, "pitu1iGVj6HrulkI",
        """
    const-string p1, "no.nordicsemi.android.dfu.extra.EXTRA_DEVICE_ADDRESS"
    invoke-virtual {p2, p1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    if-nez v1, :cond_0
    goto/16 :goto_0
    :cond_0
    iget-object v0, p0, Lno/nordicsemi/android/dfu/DfuServiceListenerHelper${'$'}ProgressBroadcastsReceiver;->mGlobalProgressListener:Lno/nordicsemi/android/dfu/DfuProgressListener;
    iget-object p0, p0, Lno/nordicsemi/android/dfu/DfuServiceListenerHelper${'$'}ProgressBroadcastsReceiver;->mListeners:Ljava/util/Map;
    invoke-interface {p0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Lno/nordicsemi/android/dfu/DfuProgressListener;
    if-nez v0, :cond_1
    if-nez p0, :cond_1
    goto/16 :goto_0
    :cond_1
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;
    move-result-object p1
    if-nez p1, :cond_2
    goto/16 :goto_0
    :cond_2
    const-string v2, "no.nordicsemi.android.dfu.broadcast.BROADCAST_PROGRESS"
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    const-string v3, "no.nordicsemi.android.dfu.extra.EXTRA_DATA"
    const/4 v4, 0x0
    if-nez v2, :cond_b
    const-string v2, "no.nordicsemi.android.dfu.broadcast.BROADCAST_ERROR"
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p1
    if-nez p1, :cond_3
    goto/16 :goto_0
    :cond_3
    invoke-virtual {p2, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I
    move-result p1
    const-string v2, "no.nordicsemi.android.dfu.extra.EXTRA_ERROR_TYPE"
    invoke-virtual {p2, v2, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I
    move-result p2
    if-eqz v0, :cond_4
    invoke-interface {v0, v1}, Lno/nordicsemi/android/dfu/DfuProgressListener;->onDeviceDisconnected(Ljava/lang/String;)V
    :cond_4
    if-eqz p0, :cond_5
    invoke-interface {p0, v1}, Lno/nordicsemi/android/dfu/DfuProgressListener;->onDeviceDisconnected(Ljava/lang/String;)V
    :cond_5
    const/4 v2, 0x1
    if-eq p2, v2, :cond_9
    const/4 v2, 0x3
    if-eq p2, v2, :cond_7
    if-eqz v0, :cond_6
    invoke-static {p1}, Lho5;->c(I)Ljava/lang/String;
    move-result-object v2
    invoke-interface {v0, v1, p1, p2, v2}, Lno/nordicsemi/android/dfu/DfuProgressListener;->onError(Ljava/lang/String;IILjava/lang/String;)V
    :cond_6
    if-eqz p0, :cond_16
    invoke-static {p1}, Lho5;->c(I)Ljava/lang/String;
    move-result-object v0
    invoke-interface {p0, v1, p1, p2, v0}, Lno/nordicsemi/android/dfu/DfuProgressListener;->onError(Ljava/lang/String;IILjava/lang/String;)V
    return-void
    :cond_7
    if-eqz v0, :cond_8
    invoke-static {p1}, Lho5;->e(I)Ljava/lang/String;
    move-result-object v2
    invoke-interface {v0, v1, p1, p2, v2}, Lno/nordicsemi/android/dfu/DfuProgressListener;->onError(Ljava/lang/String;IILjava/lang/String;)V
    :cond_8
    if-eqz p0, :cond_16
    invoke-static {p1}, Lho5;->e(I)Ljava/lang/String;
    move-result-object v0
    invoke-interface {p0, v1, p1, p2, v0}, Lno/nordicsemi/android/dfu/DfuProgressListener;->onError(Ljava/lang/String;IILjava/lang/String;)V
    return-void
    :cond_9
    if-eqz v0, :cond_a
    invoke-static {p1}, Lho5;->d(I)Ljava/lang/String;
    move-result-object v2
    invoke-interface {v0, v1, p1, p2, v2}, Lno/nordicsemi/android/dfu/DfuProgressListener;->onError(Ljava/lang/String;IILjava/lang/String;)V
    :cond_a
    if-eqz p0, :cond_16
    invoke-static {p1}, Lho5;->d(I)Ljava/lang/String;
    move-result-object v0
    invoke-interface {p0, v1, p1, p2, v0}, Lno/nordicsemi/android/dfu/DfuProgressListener;->onError(Ljava/lang/String;IILjava/lang/String;)V
    return-void
    :cond_b
    invoke-virtual {p2, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I
    move-result v2
    const-string p1, "no.nordicsemi.android.dfu.extra.EXTRA_SPEED_B_PER_MS"
    const/4 v3, 0x0
    invoke-virtual {p2, p1, v3}, Landroid/content/Intent;->getFloatExtra(Ljava/lang/String;F)F
    move-result p1
    const-string v5, "no.nordicsemi.android.dfu.extra.EXTRA_AVG_SPEED_B_PER_MS"
    invoke-virtual {p2, v5, v3}, Landroid/content/Intent;->getFloatExtra(Ljava/lang/String;F)F
    move-result v3
    const-string v5, "no.nordicsemi.android.dfu.extra.EXTRA_PART_CURRENT"
    invoke-virtual {p2, v5, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I
    move-result v5
    const-string v6, "no.nordicsemi.android.dfu.extra.EXTRA_PARTS_TOTAL"
    invoke-virtual {p2, v6, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I
    move-result v6
    packed-switch v2, :pswitch_data_0
    if-nez v2, :cond_d
    if-eqz v0, :cond_c
    invoke-interface {v0, v1}, Lno/nordicsemi/android/dfu/DfuProgressListener;->onDfuProcessStarted(Ljava/lang/String;)V
    :cond_c
    if-eqz p0, :cond_d
    invoke-interface {p0, v1}, Lno/nordicsemi/android/dfu/DfuProgressListener;->onDfuProcessStarted(Ljava/lang/String;)V
    :cond_d
    move v4, v3
    move v3, p1
    if-eqz v0, :cond_e
    invoke-interface/range {v0 .. v6}, Lno/nordicsemi/android/dfu/DfuProgressListener;->onProgressChanged(Ljava/lang/String;IFFII)V
    :cond_e
    if-eqz p0, :cond_16
    move-object v0, p0
    invoke-interface/range {v0 .. v6}, Lno/nordicsemi/android/dfu/DfuProgressListener;->onProgressChanged(Ljava/lang/String;IFFII)V
    return-void
    :pswitch_0
    if-eqz v0, :cond_f
    invoke-interface {v0, v1}, Lno/nordicsemi/android/dfu/DfuProgressListener;->onDeviceConnecting(Ljava/lang/String;)V
    :cond_f
    if-eqz p0, :cond_16
    invoke-interface {p0, v1}, Lno/nordicsemi/android/dfu/DfuProgressListener;->onDeviceConnecting(Ljava/lang/String;)V
    return-void
    :pswitch_1
    if-eqz v0, :cond_10
    invoke-interface {v0, v1}, Lno/nordicsemi/android/dfu/DfuProgressListener;->onDeviceConnected(Ljava/lang/String;)V
    invoke-interface {v0, v1}, Lno/nordicsemi/android/dfu/DfuProgressListener;->onDfuProcessStarting(Ljava/lang/String;)V
    :cond_10
    if-eqz p0, :cond_16
    invoke-interface {p0, v1}, Lno/nordicsemi/android/dfu/DfuProgressListener;->onDeviceConnected(Ljava/lang/String;)V
    invoke-interface {p0, v1}, Lno/nordicsemi/android/dfu/DfuProgressListener;->onDfuProcessStarting(Ljava/lang/String;)V
    return-void
    :pswitch_2
    if-eqz v0, :cond_11
    invoke-interface {v0, v1}, Lno/nordicsemi/android/dfu/DfuProgressListener;->onEnablingDfuMode(Ljava/lang/String;)V
    :cond_11
    if-eqz p0, :cond_16
    invoke-interface {p0, v1}, Lno/nordicsemi/android/dfu/DfuProgressListener;->onEnablingDfuMode(Ljava/lang/String;)V
    return-void
    :pswitch_3
    if-eqz v0, :cond_12
    invoke-interface {v0, v1}, Lno/nordicsemi/android/dfu/DfuProgressListener;->onFirmwareValidating(Ljava/lang/String;)V
    :cond_12
    if-eqz p0, :cond_16
    invoke-interface {p0, v1}, Lno/nordicsemi/android/dfu/DfuProgressListener;->onFirmwareValidating(Ljava/lang/String;)V
    return-void
    :pswitch_4
    if-eqz v0, :cond_13
    invoke-interface {v0, v1}, Lno/nordicsemi/android/dfu/DfuProgressListener;->onDeviceDisconnecting(Ljava/lang/String;)V
    :cond_13
    if-eqz p0, :cond_16
    invoke-interface {p0, v1}, Lno/nordicsemi/android/dfu/DfuProgressListener;->onDeviceDisconnecting(Ljava/lang/String;)V
    return-void
    :pswitch_5
    if-eqz v0, :cond_14
    invoke-interface {v0, v1}, Lno/nordicsemi/android/dfu/DfuProgressListener;->onDeviceDisconnected(Ljava/lang/String;)V
    invoke-interface {v0, v1}, Lno/nordicsemi/android/dfu/DfuProgressListener;->onDfuCompleted(Ljava/lang/String;)V
    :cond_14
    if-eqz p0, :cond_16
    invoke-interface {p0, v1}, Lno/nordicsemi/android/dfu/DfuProgressListener;->onDeviceDisconnected(Ljava/lang/String;)V
    invoke-interface {p0, v1}, Lno/nordicsemi/android/dfu/DfuProgressListener;->onDfuCompleted(Ljava/lang/String;)V
    return-void
    :pswitch_6
    if-eqz v0, :cond_15
    invoke-interface {v0, v1}, Lno/nordicsemi/android/dfu/DfuProgressListener;->onDeviceDisconnected(Ljava/lang/String;)V
    invoke-interface {v0, v1}, Lno/nordicsemi/android/dfu/DfuProgressListener;->onDfuAborted(Ljava/lang/String;)V
    :cond_15
    if-eqz p0, :cond_16
    invoke-interface {p0, v1}, Lno/nordicsemi/android/dfu/DfuProgressListener;->onDeviceDisconnected(Ljava/lang/String;)V
    invoke-interface {p0, v1}, Lno/nordicsemi/android/dfu/DfuProgressListener;->onDfuAborted(Ljava/lang/String;)V
    :cond_16
    :goto_0
    return-void
    nop
    :pswitch_data_0
    .packed-switch -0x7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
        """.trimIndent(), 0,
    ),
    ReceiverBody15(
        "Lno/nordicsemi/android/support/v18/scanner/PendingIntentReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V", 40, "DD0nF2Z7yP6MIGB9",
        """
    move-object/from16 v0, p1
    move-object/from16 v1, p2
    if-eqz v0, :cond_18
    if-nez v1, :cond_0
    goto/16 :goto_b
    :cond_0
    const-string v2, "no.nordicsemi.android.support.v18.EXTRA_PENDING_INTENT"
    invoke-virtual {v1, v2}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;
    move-result-object v2
    check-cast v2, Landroid/app/PendingIntent;
    if-nez v2, :cond_1
    goto/16 :goto_b
    :cond_1
    const-string v3, "no.nordicsemi.android.support.v18.EXTRA_FILTERS"
    invoke-virtual {v1, v3}, Landroid/content/Intent;->getParcelableArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;
    move-result-object v3
    const-string v4, "no.nordicsemi.android.support.v18.EXTRA_SETTINGS"
    invoke-virtual {v1, v4}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;
    move-result-object v4
    check-cast v4, Landroid/bluetooth/le/ScanSettings;
    if-eqz v3, :cond_18
    if-nez v4, :cond_2
    goto/16 :goto_b
    :cond_2
    const-string v5, "no.nordicsemi.android.support.v18.EXTRA_USE_HARDWARE_BATCHING"
    const/4 v6, 0x1
    invoke-virtual {v1, v5, v6}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z
    move-result v17
    const-string v5, "no.nordicsemi.android.support.v18.EXTRA_USE_HARDWARE_FILTERING"
    invoke-virtual {v1, v5, v6}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z
    move-result v16
    const-string v5, "no.nordicsemi.android.support.v18.EXTRA_USE_HARDWARE_CALLBACK_TYPES"
    invoke-virtual {v1, v5, v6}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z
    move-result v18
    const-string v5, "no.nordicsemi.android.support.v18.EXTRA_MATCH_LOST_TIMEOUT"
    const-wide/16 v7, 0x2710
    invoke-virtual {v1, v5, v7, v8}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J
    move-result-wide v19
    const-string v5, "no.nordicsemi.android.support.v18.EXTRA_MATCH_LOST_INTERVAL"
    invoke-virtual {v1, v5, v7, v8}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J
    move-result-wide v21
    const-string v5, "no.nordicsemi.android.support.v18.EXTRA_MATCH_MODE"
    invoke-virtual {v1, v5, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I
    move-result v12
    const-string v5, "no.nordicsemi.android.support.v18.EXTRA_NUM_OF_MATCHES"
    const/4 v7, 0x3
    invoke-virtual {v1, v5, v7}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I
    move-result v13
    invoke-static {}, Lno/nordicsemi/android/support/v18/scanner/a;->a()Lno/nordicsemi/android/support/v18/scanner/a;
    move-result-object v5
    move-object v8, v5
    check-cast v8, Lno/nordicsemi/android/support/v18/scanner/c;
    new-instance v9, Ljava/util/ArrayList;
    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;
    move-result-object v3
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z
    move-result v10
    if-eqz v10, :cond_8
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v10
    check-cast v10, Landroid/bluetooth/le/ScanFilter;
    new-instance v11, Lno/nordicsemi/android/support/v18/scanner/ScanFilter${'$'}b;
    invoke-direct {v11}, Lno/nordicsemi/android/support/v18/scanner/ScanFilter${'$'}b;-><init>()V
    invoke-virtual {v10}, Landroid/bluetooth/le/ScanFilter;->getDeviceAddress()Ljava/lang/String;
    move-result-object v14
    if-eqz v14, :cond_4
    invoke-static {v14}, Landroid/bluetooth/BluetoothAdapter;->checkBluetoothAddress(Ljava/lang/String;)Z
    move-result v15
    if-eqz v15, :cond_3
    goto :goto_1
    :cond_3
    const-string v0, "invalid device address "
    invoke-virtual {v0, v14}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-static {v0}, Lew1;->b(Ljava/lang/String;)V
    return-void
    :cond_4
    :goto_1
    iput-object v14, v11, Lno/nordicsemi/android/support/v18/scanner/ScanFilter${'$'}b;->b:Ljava/lang/String;
    invoke-virtual {v10}, Landroid/bluetooth/le/ScanFilter;->getDeviceName()Ljava/lang/String;
    move-result-object v14
    iput-object v14, v11, Lno/nordicsemi/android/support/v18/scanner/ScanFilter${'$'}b;->a:Ljava/lang/String;
    invoke-virtual {v10}, Landroid/bluetooth/le/ScanFilter;->getServiceUuid()Landroid/os/ParcelUuid;
    move-result-object v14
    invoke-virtual {v10}, Landroid/bluetooth/le/ScanFilter;->getServiceUuidMask()Landroid/os/ParcelUuid;
    move-result-object v15
    if-eqz v15, :cond_6
    if-eqz v14, :cond_5
    goto :goto_2
    :cond_5
    const-string v0, "uuid is null while uuidMask is not null!"
    invoke-static {v0}, Lew1;->b(Ljava/lang/String;)V
    return-void
    :cond_6
    :goto_2
    iput-object v14, v11, Lno/nordicsemi/android/support/v18/scanner/ScanFilter${'$'}b;->c:Landroid/os/ParcelUuid;
    iput-object v15, v11, Lno/nordicsemi/android/support/v18/scanner/ScanFilter${'$'}b;->d:Landroid/os/ParcelUuid;
    invoke-virtual {v10}, Landroid/bluetooth/le/ScanFilter;->getManufacturerId()I
    move-result v14
    invoke-virtual {v10}, Landroid/bluetooth/le/ScanFilter;->getManufacturerData()[B
    move-result-object v15
    invoke-virtual {v10}, Landroid/bluetooth/le/ScanFilter;->getManufacturerDataMask()[B
    move-result-object v7
    invoke-virtual {v11, v15, v14, v7}, Lno/nordicsemi/android/support/v18/scanner/ScanFilter${'$'}b;->a([BI[B)V
    invoke-virtual {v10}, Landroid/bluetooth/le/ScanFilter;->getServiceDataUuid()Landroid/os/ParcelUuid;
    move-result-object v7
    if-eqz v7, :cond_7
    invoke-virtual {v10}, Landroid/bluetooth/le/ScanFilter;->getServiceDataUuid()Landroid/os/ParcelUuid;
    move-result-object v7
    invoke-virtual {v10}, Landroid/bluetooth/le/ScanFilter;->getServiceData()[B
    move-result-object v14
    invoke-virtual {v10}, Landroid/bluetooth/le/ScanFilter;->getServiceDataMask()[B
    move-result-object v10
    invoke-virtual {v11, v7, v14, v10}, Lno/nordicsemi/android/support/v18/scanner/ScanFilter${'$'}b;->b(Landroid/os/ParcelUuid;[B[B)V
    :cond_7
    new-instance v23, Lno/nordicsemi/android/support/v18/scanner/ScanFilter;
    iget-object v7, v11, Lno/nordicsemi/android/support/v18/scanner/ScanFilter${'$'}b;->a:Ljava/lang/String;
    iget-object v10, v11, Lno/nordicsemi/android/support/v18/scanner/ScanFilter${'$'}b;->b:Ljava/lang/String;
    iget-object v14, v11, Lno/nordicsemi/android/support/v18/scanner/ScanFilter${'$'}b;->c:Landroid/os/ParcelUuid;
    iget-object v15, v11, Lno/nordicsemi/android/support/v18/scanner/ScanFilter${'$'}b;->d:Landroid/os/ParcelUuid;
    iget-object v6, v11, Lno/nordicsemi/android/support/v18/scanner/ScanFilter${'$'}b;->e:Landroid/os/ParcelUuid;
    move-object/from16 v34, v3
    iget-object v3, v11, Lno/nordicsemi/android/support/v18/scanner/ScanFilter${'$'}b;->f:[B
    move-object/from16 v29, v3
    iget-object v3, v11, Lno/nordicsemi/android/support/v18/scanner/ScanFilter${'$'}b;->g:[B
    move-object/from16 v30, v3
    iget v3, v11, Lno/nordicsemi/android/support/v18/scanner/ScanFilter${'$'}b;->h:I
    move/from16 v31, v3
    iget-object v3, v11, Lno/nordicsemi/android/support/v18/scanner/ScanFilter${'$'}b;->i:[B
    iget-object v11, v11, Lno/nordicsemi/android/support/v18/scanner/ScanFilter${'$'}b;->j:[B
    move-object/from16 v32, v3
    move-object/from16 v28, v6
    move-object/from16 v24, v7
    move-object/from16 v25, v10
    move-object/from16 v33, v11
    move-object/from16 v26, v14
    move-object/from16 v27, v15
    invoke-direct/range {v23 .. v33}, Lno/nordicsemi/android/support/v18/scanner/ScanFilter;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/os/ParcelUuid;Landroid/os/ParcelUuid;Landroid/os/ParcelUuid;[B[BI[B[B)V
    move-object/from16 v3, v23
    invoke-virtual {v9, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    move-object/from16 v3, v34
    const/4 v6, 0x1
    const/4 v7, 0x3
    goto/16 :goto_0
    :cond_8
    invoke-virtual {v4}, Landroid/bluetooth/le/ScanSettings;->getLegacy()Z
    move-result v14
    invoke-virtual {v4}, Landroid/bluetooth/le/ScanSettings;->getPhy()I
    move-result v15
    move-object/from16 v26, v9
    invoke-virtual {v4}, Landroid/bluetooth/le/ScanSettings;->getCallbackType()I
    move-result v9
    const/4 v3, 0x2
    const/4 v6, 0x1
    if-eq v9, v6, :cond_a
    if-eq v9, v3, :cond_a
    const/4 v6, 0x4
    if-ne v9, v6, :cond_9
    goto :goto_3
    :cond_9
    const/4 v6, 0x6
    if-ne v9, v6, :cond_b
    :cond_a
    :goto_3
    move-object v6, v8
    goto :goto_4
    :cond_b
    const-string v0, "invalid callback type - "
    invoke-static {v9, v0}, Lm80;->a(ILjava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-static {v0}, Lew1;->b(Ljava/lang/String;)V
    return-void
    :goto_4
    invoke-virtual {v4}, Landroid/bluetooth/le/ScanSettings;->getScanMode()I
    move-result v8
    const/4 v7, -0x1
    if-lt v8, v7, :cond_17
    if-gt v8, v3, :cond_17
    invoke-virtual {v4}, Landroid/bluetooth/le/ScanSettings;->getReportDelayMillis()J
    move-result-wide v10
    const-wide/16 v23, 0x0
    cmp-long v4, v10, v23
    if-ltz v4, :cond_16
    cmp-long v7, v19, v23
    if-lez v7, :cond_15
    cmp-long v7, v21, v23
    if-lez v7, :cond_15
    const/4 v7, 0x1
    if-lt v12, v7, :cond_14
    if-gt v12, v3, :cond_14
    if-lt v13, v7, :cond_13
    const/4 v3, 0x3
    if-gt v13, v3, :cond_13
    if-eq v8, v7, :cond_d
    const/4 v3, 0x2
    if-eq v8, v3, :cond_c
    const-wide/16 v23, 0x1f4
    const-wide/16 v27, 0x1194
    :goto_5
    move-wide/from16 v35, v27
    move-wide/from16 v27, v23
    move-wide/from16 v23, v35
    goto :goto_6
    :cond_c
    move-wide/from16 v27, v23
    goto :goto_6
    :cond_d
    const-wide/16 v23, 0x7d0
    const-wide/16 v27, 0xbb8
    goto :goto_5
    :goto_6
    new-instance v7, Lno/nordicsemi/android/support/v18/scanner/ScanSettings;
    move-object/from16 v3, v26
    move-wide/from16 v25, v23
    move-wide/from16 v23, v27
    invoke-direct/range {v7 .. v26}, Lno/nordicsemi/android/support/v18/scanner/ScanSettings;-><init>(IIJIIZIZZZJJJJ)V
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;
    move-result-object v8
    invoke-virtual {v8}, Landroid/bluetooth/BluetoothAdapter;->isOffloadedScanBatchingSupported()Z
    move-result v24
    invoke-virtual {v8}, Landroid/bluetooth/BluetoothAdapter;->isOffloadedFilteringSupported()Z
    move-result v25
    monitor-enter v5
    :try_start_0
    invoke-virtual {v6, v2}, Lno/nordicsemi/android/support/v18/scanner/c;->f(Landroid/app/PendingIntent;)Lno/nordicsemi/android/support/v18/scanner/c${'$'}a;
    move-result-object v8
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1
    if-nez v8, :cond_e
    :try_start_1
    new-instance v8, Lf8e;
    invoke-direct {v8, v2, v7}, Lf8e;-><init>(Landroid/app/PendingIntent;Lno/nordicsemi/android/support/v18/scanner/ScanSettings;)V
    new-instance v23, Lno/nordicsemi/android/support/v18/scanner/c${'$'}a;
    move-object/from16 v26, v3
    move-object/from16 v27, v7
    move-object/from16 v28, v8
    invoke-direct/range {v23 .. v28}, Lno/nordicsemi/android/support/v18/scanner/c${'$'}a;-><init>(ZZLjava/util/ArrayList;Lno/nordicsemi/android/support/v18/scanner/ScanSettings;Lf8e;)V
    move-object/from16 v8, v23
    iget-object v3, v6, Lno/nordicsemi/android/support/v18/scanner/c;->c:Ljava/util/HashMap;
    monitor-enter v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1
    :try_start_2
    iget-object v7, v6, Lno/nordicsemi/android/support/v18/scanner/c;->c:Ljava/util/HashMap;
    invoke-virtual {v7, v2, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    monitor-exit v3
    goto :goto_7
    :catchall_0
    move-exception v0
    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    :try_start_3
    throw v0
    :catchall_1
    move-exception v0
    goto :goto_a
    :cond_e
    :goto_7
    monitor-exit v5
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1
    iget-object v2, v8, Lno/nordicsemi/android/support/v18/scanner/c${'$'}a;->n:Lf8e;
    iput-object v0, v2, Lf8e;->b:Landroid/content/Context;
    const-string v0, "android.bluetooth.le.extra.LIST_SCAN_RESULT"
    invoke-virtual {v1, v0}, Landroid/content/Intent;->getParcelableArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;
    move-result-object v0
    const/4 v2, 0x0
    if-eqz v0, :cond_11
    new-instance v3, Ljava/util/ArrayList;
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;
    move-result-object v0
    :goto_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z
    move-result v5
    if-eqz v5, :cond_f
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Landroid/bluetooth/le/ScanResult;
    invoke-virtual {v6, v5}, Lno/nordicsemi/android/support/v18/scanner/c;->d(Landroid/bluetooth/le/ScanResult;)Lno/nordicsemi/android/support/v18/scanner/ScanResult;
    move-result-object v5
    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :goto_8
    :cond_f
    if-lez v4, :cond_10
    invoke-virtual {v8, v3}, Lno/nordicsemi/android/support/v18/scanner/a${'$'}a;->b(Ljava/util/ArrayList;)V
    goto :goto_9
    :cond_10
    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z
    move-result v0
    if-nez v0, :cond_12
    const-string v0, "android.bluetooth.le.extra.CALLBACK_TYPE"
    const/4 v6, 0x1
    invoke-virtual {v1, v0, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I
    move-result v0
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lno/nordicsemi/android/support/v18/scanner/ScanResult;
    invoke-virtual {v8, v0, v1}, Lno/nordicsemi/android/support/v18/scanner/a${'$'}a;->a(ILno/nordicsemi/android/support/v18/scanner/ScanResult;)V
    goto :goto_9
    :cond_11
    const-string v0, "android.bluetooth.le.extra.ERROR_CODE"
    invoke-virtual {v1, v0, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I
    move-result v0
    if-eqz v0, :cond_12
    iget-object v1, v8, Lno/nordicsemi/android/support/v18/scanner/a${'$'}a;->h:Lm8g;
    invoke-virtual {v1, v0}, Lm8g;->b(I)V
    :cond_12
    :goto_9
    iget-object v0, v8, Lno/nordicsemi/android/support/v18/scanner/c${'$'}a;->n:Lf8e;
    const/4 v1, 0x0
    iput-object v1, v0, Lf8e;->b:Landroid/content/Context;
    return-void
    :catch_0
    :try_start_4
    monitor-exit v5
    goto :goto_b
    :goto_a
    monitor-exit v5
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1
    throw v0
    :cond_13
    const-string v0, "invalid numOfMatches "
    invoke-static {v13, v0}, Lm80;->a(ILjava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-static {v0}, Lew1;->b(Ljava/lang/String;)V
    return-void
    :cond_14
    const-string v0, "invalid matchMode "
    invoke-static {v12, v0}, Lm80;->a(ILjava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-static {v0}, Lew1;->b(Ljava/lang/String;)V
    return-void
    :cond_15
    const-string v0, "maxDeviceAgeMillis and taskIntervalMillis must be > 0"
    invoke-static {v0}, Lew1;->b(Ljava/lang/String;)V
    return-void
    :cond_16
    const-string v0, "reportDelay must be > 0"
    invoke-static {v0}, Lew1;->b(Ljava/lang/String;)V
    return-void
    :cond_17
    const-string v0, "invalid scan mode "
    invoke-static {v8, v0}, Lm80;->a(ILjava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-static {v0}, Lew1;->b(Ljava/lang/String;)V
    :cond_18
    :goto_b
    return-void
        """.trimIndent(), 6,
    ),
)
