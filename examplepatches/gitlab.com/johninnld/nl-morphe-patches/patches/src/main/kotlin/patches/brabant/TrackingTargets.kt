package patches.brabant

import com.android.tools.smali.dexlib2.Opcode

// Original APK headers and exact source anchors; remaining bodies stay native.
internal val trackingTargets = listOf(
    OwnedMethod("Lxd;", "d(Lxd;Le3;)V", 0x9, 9, 99, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("return-void")),
    )),
    OwnedMethod("Lxd;", "b(Ljava/lang/Throwable;Lzd;)V", 0x11, 5, 33, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("return-void")),
    )),
    OwnedMethod("Lxd;", "c(Lb5;Lzd;)V", 0x11, 5, 18, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("return-void")),
    )),
    OwnedMethod("La67;", "a([Lnw2;)V", 0x91, 5, 8, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("return-void")),
    )),
    OwnedMethod("Ljq;", "a(Ljava/util/Map;)V", 0x1, 6, 100, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("return-void")),
    )),
    OwnedMethod("Ljx2;", "a(Lgl8;)V", 0x11, 6, 23, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("return-void")),
    )),
    OwnedMethod("Lap6;", "c(Ljava/lang/String;)V", 0x11, 8, 104, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("return-void")),
    )),
    OwnedMethod("Lew9;", "X(Landroid/content/Intent;)V", 0x9, 24, 286, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("return-void")),
    )),
    OwnedMethod("Lew9;", "Y(Landroid/os/Bundle;Ljava/lang/String;)V", 0x9, 7, 123, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("return-void")),
    )),
    OwnedMethod("Lkj8;", "run()V", 0x11, 13, 225, listOf(
        OwnedEdit(35, listOf(Opcode.IGET_OBJECT), listOf("Lkj8;->c:Le42;"), listOf("return-void")),
    )),
    OwnedMethod("Lt77;", "a(Lhp1;)Ljava/lang/Object;", 0x11, 6, 49, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;", "return-object v0")),
    )),
    OwnedMethod("Lvd5;", "b()Ljava/lang/Boolean;", 0x11, 3, 12, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;", "return-object v0")),
    )),
    OwnedMethod("Luy1;", "a()Z", 0x20001, 2, 20, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("const/4 v0, 0x0", "return v0")),
    )),
    OwnedMethod("Lew9;", "N()Z", 0x9, 6, 40, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("const/4 v0, 0x0", "return v0")),
    )),
    OwnedMethod("Lcom/google/android/gms/measurement/internal/zzal;", "zzt()Z", 0x11, 2, 13, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("const/4 v0, 0x1", "return v0")),
    )),
    OwnedMethod("Lw56;", "F0(Lhp1;)Ljava/lang/Object;", 0x1, 16, 98, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("new-instance v0, Ljava/lang/IllegalStateException;", "const-string v1, \"Optional measurement disabled\"", "invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V", "new-instance v1, Lp58;", "invoke-direct {v1, v0}, Lp58;-><init>(Ljava/lang/Throwable;)V", "return-object v1")),
    )),
    OwnedMethod("Lw56;", "x0(Lhp1;)Ljava/lang/Object;", 0x1, 6, 48, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("const/4 v0, 0x0", "return-object v0")),
    )),
    OwnedMethod("Lrt6;", "a(Lnl/pinch/optoutadvertising/sdk/webview/OptOutBridgeWebView;Ljava/lang/String;Lw8;)Ljava/lang/Object;", 0x11, 7, 43, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("new-instance v0, Ljava/lang/IllegalStateException;", "const-string v1, \"Optional measurement disabled\"", "invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V", "new-instance v1, Lp58;", "invoke-direct {v1, v0}, Lp58;-><init>(Ljava/lang/Throwable;)V", "return-object v1")),
    )),
    OwnedMethod("Lrt6;", "b(Ljava/lang/String;Lhp1;)Ljava/lang/Object;", 0x11, 7, 37, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("new-instance v0, Ljava/lang/IllegalStateException;", "const-string v1, \"Optional measurement disabled\"", "invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V", "new-instance v1, Lp58;", "invoke-direct {v1, v0}, Lp58;-><init>(Ljava/lang/Throwable;)V", "return-object v1")),
    )),
    OwnedMethod("Lnl/omroepbrabant/android/presentation/services/push/PushNotificationService;", "d(Lg28;)V", 0x11, 19, 411, listOf(
        OwnedEdit(125, listOf(Opcode.INVOKE_VIRTUAL), listOf("Lcom/google/android/gms/internal/measurement/zzez;->zzh(Ljava/lang/String;Landroid/os/Bundle;)V"), listOf("nop")),
        OwnedEdit(182, listOf(Opcode.INVOKE_VIRTUAL), listOf("Lcom/google/android/gms/internal/measurement/zzez;->zzh(Ljava/lang/String;Landroid/os/Bundle;)V"), listOf("nop")),
        OwnedEdit(191, listOf(Opcode.INVOKE_VIRTUAL), listOf("Lcom/google/android/gms/internal/measurement/zzez;->zzh(Ljava/lang/String;Landroid/os/Bundle;)V"), listOf("nop")),
    )),
    OwnedMethod("Lyr1;", "uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V", 0x11, 4, 8, listOf(
        OwnedEdit(2, listOf(Opcode.IGET_OBJECT, Opcode.INVOKE_VIRTUAL), listOf("Lyr1;->b:Lx00;", "Lx00;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;"), listOf("nop", "nop")),
    )),
    OwnedMethod("Lnt;", "k(Ljava/lang/String;Lhp1;)Ljava/lang/Object;", 0x1, 13, 105, listOf(
        OwnedEdit(87, listOf(Opcode.IGET_OBJECT), listOf("Lnt;->e:Ljava/lang/Object;"), listOf("nop", "iget-object p2, p0, Lnt;->e:Ljava/lang/Object;"), target = 103, branch = 0),
    )),
    OwnedMethod("Lnt;", "n(Lpz;ZLhp1;)Ljava/lang/Object;", 0x1, 23, 596, listOf(
        OwnedEdit(158, listOf(Opcode.IGET_OBJECT), listOf("Lnt;->g:Ljava/lang/Object;"), listOf("return-object v6", "iget-object v2, v0, Lnt;->g:Ljava/lang/Object;")),
    )),
    OwnedMethod("Lwp0;", "k(Ljava/util/Map;)V", 0x11, 13, 129, listOf(
        OwnedEdit(78, listOf(Opcode.NEW_INSTANCE), listOf("Ljava/lang/StringBuilder;"), listOf("nop", "new-instance v1, Ljava/lang/StringBuilder;"), target = 99, branch = 0),
    )),
    OwnedMethod("Lyh0;", "g(Ljava/lang/String;Ljava/util/Map;)V", 0x11, 23, 382, listOf(
        OwnedEdit(269, listOf(), listOf(), listOf("invoke-static {v5}, Lyh0;->morpheNoStats(Ljava/util/Map;)V")),
    )),
    OwnedMethod("Lcom/google/android/gms/measurement/internal/zzln;", "run()V", 0x11, 11, 206, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("move-object v0, p0", "const/4 v1, 0x0", "new-instance v2, Ljava/io/IOException;", "const-string v3, \"Measurement disabled\"", "invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V", "const/4 v3, 0x0", "const/4 v4, 0x0", "invoke-direct/range {v0 .. v4}, Lcom/google/android/gms/measurement/internal/zzln;->zzb(ILjava/lang/Exception;[BLjava/util/Map;)V", "return-void")),
    )),
    OwnedMethod("Lcom/google/android/gms/measurement/internal/zzgy;", "run()V", 0x11, 14, 226, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("const/4 v7, 0x0", "new-instance v8, Ljava/io/IOException;", "const-string v10, \"Measurement disabled\"", "invoke-direct {v8, v10}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V", "const/4 v10, 0x0", "nop"), target = 214, branch = 5),
    )),
    OwnedMethod("Lnv3;", "y()Ljava/lang/String;", 0x11, 1, 9, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("const/4 p0, 0x0", "return-object p0")),
    )),
    OwnedMethod("Lnv3;", "t()Z", 0x11, 1, 9, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("const/4 p0, 0x1", "return p0")),
    )),
    OwnedMethod("Lm74;", "a()Lbc;", 0x11, 3, 23, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("const/4 v0, 0x0", "return-object v0")),
    )),
    OwnedMethod("Lm74;", "y()Ljava/lang/String;", 0x11, 1, 9, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("const/4 p0, 0x0", "return-object p0")),
    )),
    OwnedMethod("Lm74;", "t()Z", 0x11, 1, 9, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("const/4 p0, 0x1", "return p0")),
    )),
    OwnedMethod("Ldf2;", "invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;", 0x11, 5, 20, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("sget-object v0, Llz9;->a:Llz9;", "return-object v0")),
    )),
    OwnedMethod("Lcom/google/android/gms/measurement/internal/zzhh;", "zzb(Ljava/lang/String;)Landroid/util/Pair;", 0x11, 9, 71, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("new-instance v0, Landroid/util/Pair;", "const-string v1, \"\"", "sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;", "invoke-direct {v0, v1, p0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V", "return-object v0")),
    )),
    OwnedMethod("Lcom/google/android/gms/measurement/internal/zznn;", "zzc(Lcom/google/android/gms/measurement/internal/zzr;Lcom/google/android/gms/measurement/internal/zzjl;)Landroid/util/Pair;", 0x11, 5, 17, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("new-instance v0, Landroid/util/Pair;", "const-string v1, \"\"", "sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;", "invoke-direct {v0, v1, p0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V", "return-object v0")),
    )),
    OwnedMethod("Lcom/google/android/gms/measurement/internal/zznn;", "zzd(Ljava/lang/String;)Landroid/util/Pair;", 0x11, 14, 96, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("new-instance v0, Landroid/util/Pair;", "const-string v1, \"\"", "sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;", "invoke-direct {v0, v1, p0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V", "return-object v0")),
    )),
    OwnedMethod("Lcom/google/android/gms/measurement/internal/zznn;", "zzf(Lcom/google/android/gms/measurement/internal/zzr;Lcom/google/android/gms/measurement/internal/zzjl;)Ljava/lang/String;", 0x11, 5, 35, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("const-string v0, \"\"", "return-object v0")),
    )),
    OwnedMethod("Lcom/google/ads/interactivemedia/v3/internal/zzeo;", "zza(Lcom/google/ads/interactivemedia/v3/api/BaseRequest;Lcom/google/ads/interactivemedia/v3/internal/zzej;Ljava/lang/String;)Lcom/google/ads/interactivemedia/v3/impl/data/zzbn;", 0x11, 15, 95, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("const/4 v0, 0x0", "return-object v0")),
    )),
    OwnedMethod("Lcom/google/android/gms/internal/pal/zzax;", "zza()Lcom/google/android/gms/internal/pal/zzil;", 0x11, 3, 9, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("invoke-static {}, Lcom/google/android/gms/internal/pal/zzil;->zze()Lcom/google/android/gms/internal/pal/zzil;", "move-result-object v0", "return-object v0")),
    )),
    OwnedMethod("Lcom/google/android/gms/internal/pal/zzay;", "zza()Lcom/google/android/gms/internal/pal/zzil;", 0x11, 4, 24, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("invoke-static {}, Lcom/google/android/gms/internal/pal/zzil;->zze()Lcom/google/android/gms/internal/pal/zzil;", "move-result-object v0", "return-object v0")),
    )),
    OwnedMethod("Lcom/google/android/gms/internal/pal/zzay;", "zzf(Landroid/content/Context;)Lcom/google/android/gms/appset/AppSetIdClient;", 0xa, 3, 9, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("const/4 v0, 0x0", "return-object v0")),
    )),
    OwnedMethod("Lcom/google/android/gms/internal/consent_sdk/zza;", "zza()Ljava/lang/String;", 0x11, 3, 12, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("const/4 v0, 0x0", "return-object v0")),
    )),
    OwnedMethod("Lcom/google/android/gms/internal/consent_sdk/zzx;", "zzb(Landroid/app/Activity;Lrl1;Lpl1;Lol1;)V", 0x1011, 8, 64, listOf(
        OwnedEdit(2, listOf(Opcode.IGET_OBJECT), listOf("Lcom/google/android/gms/internal/consent_sdk/zzx;->zza:Landroid/app/Application;"), listOf("nop"), target = 14, branch = 0),
    )),
    OwnedMethod("Lcom/google/android/gms/internal/consent_sdk/zzn;", "zzd(Landroid/app/Activity;Lrl1;)Lcom/google/android/gms/internal/consent_sdk/zzck;", 0x11, 14, 31, listOf(
        OwnedEdit(9, listOf(Opcode.INVOKE_STATIC), listOf("Lcom/google/android/gms/internal/consent_sdk/zzcn;->zzb()Z"), listOf("nop"), target = 19, branch = 0),
    )),
    OwnedMethod("Lcom/startapp/sdk/internal/e2;", "a(Landroid/content/Context;Lcom/startapp/sdk/adsbase/model/AdPreferences;)V", 0x11, 4, 60, listOf(
        OwnedEdit(20, listOf(Opcode.SGET_OBJECT), listOf("Lcom/startapp/sdk/internal/gh;->b:Ljava/util/concurrent/atomic/AtomicBoolean;"), listOf("const/4 p2, 0x0", "iput-object p2, p0, Lcom/startapp/sdk/internal/e2;->k:Ljava/lang/String;", "nop"), target = 39, branch = 2),
    )),
    OwnedMethod("Lc98;", "run()V", 0x11, 11, 201, listOf(
        OwnedEdit(9, listOf(Opcode.INVOKE_STATIC), listOf("Lcom/google/android/gms/ads/identifier/AdvertisingIdClient;->getAdvertisingIdInfo(Landroid/content/Context;)Lcom/google/android/gms/ads/identifier/AdvertisingIdClient\$Info;"), listOf("iput-object v0, p0, Lh98;->m:Ljava/lang/String;", "nop"), target = 20, branch = 1),
    )),
)
