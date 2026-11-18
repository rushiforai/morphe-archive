package patches.flitsmeister

/**
 * Functional service lifecycle restored from the recovered 14.17 bodies and
 * the publisher 15.0 synthetic-accessor contracts. The start body's 197
 * nonstatic calls match all 197 accessors in order. The destroy body's 109
 * calls match its accessors after accounting for name collisions with start.
 *
 * Version 15 obtains the signalling service through tef, removes the duplicate
 * unconditional end-of-trip analytics event, and extracts report-flow resets
 * into hff.a. All referenced publisher members resolve in the 15.0 DEX.
 *
 * Native string records independently confirm the service-running field t1,
 * the end-of-trip event subtype fp7, and the signalling entrypoint tef. These
 * bindings are verified against the original protected programs, rather than
 * inferred from obfuscated field positions. Android acceptance remains separate.
 */
internal const val serviceOnStartCommandRegisterCount15 = 41
internal const val serviceOnDestroyRegisterCount15 = 13

internal val serviceOnStartCommand15 = """
    move-object/from16 v1, p0
    move-object/from16 v0, p1
    const/4 v2, 0x1
    if-eqz v0, :cond_0
    const-string v3, "checkBackgroundPermission"
    invoke-virtual {v0, v3}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z
    move-result v3
    if-ne v3, v2, :cond_0
    const-string v3, "checkBackgroundPermission"
    sget-boolean v4, Lvug;->c:Z
    invoke-virtual {v0, v3, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z
    move-result v3
    goto :goto_0
    :cond_0
    sget-boolean v3, Lvug;->c:Z
    :goto_0
    invoke-static {v1, v3}, Lttg;->a(Landroid/content/Context;Z)Z
    move-result v3
    const/4 v4, 0x2
    const/4 v5, 0x0
    const/4 v6, 0x0
    if-nez v3, :cond_1
    const-string v0, "[FlitsmeisterBaseService] Service not started since location permission was invalid."
    invoke-static {}, Lhha;->c()Lorg/slf4j/Logger;
    move-result-object v1
    invoke-static {v1, v0, v6}, Lhha;->i(Lorg/slf4j/Logger;Ljava/lang/String;Ljava/lang/Throwable;)V
    sput-boolean v5, Lvug;->b:Z
    return v4
    :cond_1
    sget-object v3, Lnl/flitsmeister/services/autostart/AutoStartDetectionService;->Companion:Lnl/flitsmeister/services/autostart/AutoStartDetectionService${'$'}Companion;
    invoke-virtual {v3, v1}, Lnl/flitsmeister/services/autostart/AutoStartDetectionService${'$'}Companion;->stopDetecting(Landroid/content/Context;)V
    new-instance v3, Lnl/flitsmeister/services/base/FlitsmeisterBaseService${'$'}f;
    invoke-direct {v3, v1, v6}, Lnl/flitsmeister/services/base/FlitsmeisterBaseService${'$'}f;-><init>(Lnl/flitsmeister/services/base/FlitsmeisterBaseService;Lsn4;)V
    sget-object v7, Ln37;->a:Lre6;
    sget-object v7, Laab;->a:Loi9;
    invoke-static {v7, v3}, Lhv0;->e(Lb45;Li49;)Lyhi;
    sget v3, Landroid/os/Build${'$'}VERSION;->SDK_INT:I
    const/16 v7, 0x22
    if-lt v3, v7, :cond_3
    if-eqz v0, :cond_2
    goto :goto_1
    :cond_2
    const-string v0, "[FlitsmeisterBaseService] Service did not startForeground because intent was null"
    invoke-static {}, Lhha;->c()Lorg/slf4j/Logger;
    move-result-object v3
    invoke-static {v3, v0, v6}, Lhha;->i(Lorg/slf4j/Logger;Ljava/lang/String;Ljava/lang/Throwable;)V
    goto :goto_3
    :cond_3
    :goto_1
    if-eqz v0, :cond_4
    :try_start_0
    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;
    move-result-object v0
    if-eqz v0, :cond_4
    const-string v3, "closeWithDeviceType"
    invoke-virtual {v0, v3}, Landroid/os/BaseBundle;->get(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object v0
    goto :goto_2
    :catchall_0
    move-exception v0
    goto/16 :goto_13
    :cond_4
    move-object v0, v6
    :goto_2
    check-cast v0, Lnl/flitsmeister/managers/ble/BleDeviceType;
    const-string v3, "FMCore-Base"
    filled-new-array {v3}, [Ljava/lang/String;
    move-result-object v3
    invoke-static {v1, v3}, Lezc;->a(Landroid/content/ContextWrapper;[Ljava/lang/String;)V
    invoke-static {}, Llp0;->f()Lu71;
    move-result-object v3
    invoke-virtual {v3, v1}, Lu71;->c(Landroid/content/Context;)Landroid/content/ContextWrapper;
    move-result-object v3
    invoke-static {v3, v0}, Lsc0;->f(Landroid/content/ContextWrapper;Lnl/flitsmeister/managers/ble/BleDeviceType;)Landroid/app/Notification;
    move-result-object v0
    const/16 v3, 0x8
    invoke-static {v1, v2, v0, v3}, Landroidx/core/app/ServiceCompat;->startForeground(Landroid/app/Service;ILandroid/app/Notification;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    :goto_3
    iget-boolean v0, v1, Lnl/flitsmeister/services/base/FlitsmeisterBaseService;->t1:Z
    if-nez v0, :cond_21
    const-string v0, "[FlitsmeisterBaseService] Service wasn\'t running, initializing all depending services"
    invoke-static {}, Lhha;->c()Lorg/slf4j/Logger;
    move-result-object v3
    invoke-static {v3, v0}, Lhha;->j(Lorg/slf4j/Logger;Ljava/lang/String;)V
    iput-boolean v2, v1, Lnl/flitsmeister/services/base/FlitsmeisterBaseService;->t1:Z
    sput-boolean v2, Lvug;->b:Z
    invoke-static {v2}, Lp08;->b(Z)Ljava/lang/String;
    move-result-object v0
    sput-object v0, Lp08;->a:Ljava/lang/String;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v8
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    move-result-object v0
    sput-object v0, Lp08;->b:Ljava/lang/Long;
    const/4 v0, 0x0
    sput v0, Lp08;->c:F
    sput-boolean v5, Lp08;->d:Z
    sput-boolean v5, Lp08;->e:Z
    const/4 v0, -0x1
    sput v0, Lp08;->h:I
    sput v0, Lp08;->i:I
    sput-object v6, Lp08;->g:Landroid/location/Location;
    iget-object v0, v1, Lnl/flitsmeister/services/base/FlitsmeisterBaseService;->I:La41;
    if-eqz v0, :cond_20
    sget-object v3, Ljwf;->c:Ljwf${'$'}a;
    iget-object v8, v0, La41;->c:Landroid/content/Context;
    invoke-virtual {v3, v8}, Lig0;->getInstance(Landroid/content/Context;)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ldh8;
    invoke-virtual {v0, v3}, Ly31;->a(Ldh8;)V
    sget-object v3, Lnl/flitsmeister/lba/service/LBADataService;->Companion:Lnl/flitsmeister/lba/service/LBADataService${'$'}Companion;
    invoke-virtual {v3, v8}, Lig0;->getInstance(Landroid/content/Context;)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ldh8;
    invoke-virtual {v0, v3}, Ly31;->a(Ldh8;)V
    sget-object v3, Lb65;->Y:Lb65${'$'}a;
    invoke-virtual {v3, v8}, Lig0;->getInstance(Landroid/content/Context;)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ldh8;
    invoke-virtual {v0, v3}, Ly31;->a(Ldh8;)V
    sget-object v3, Ld90;->d:Ld90${'$'}a;
    invoke-virtual {v3, v8}, Lig0;->getInstance(Landroid/content/Context;)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ldh8;
    invoke-virtual {v0, v3}, Ly31;->a(Ldh8;)V
    sget-object v3, Lfc0;->N1:Lfc0${'$'}a;
    invoke-virtual {v3, v8}, Lig0;->getInstance(Landroid/content/Context;)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ldh8;
    invoke-virtual {v0, v3}, Ly31;->a(Ldh8;)V
    sget-object v3, Lbb0;->z1:Lbb0${'$'}a;
    invoke-virtual {v3, v8}, Lig0;->getInstance(Landroid/content/Context;)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ldh8;
    invoke-virtual {v0, v3}, Ly31;->a(Ldh8;)V
    sget-object v3, Lnl/flitsmeister/fmcore/feature/signalfootprints/SignalFootprintsManager;->Singleton:Lnl/flitsmeister/fmcore/feature/signalfootprints/SignalFootprintsManager${'$'}Singleton;
    invoke-virtual {v3, v8}, Lig0;->getInstance(Landroid/content/Context;)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ldh8;
    invoke-virtual {v0, v3}, Ly31;->a(Ldh8;)V
    sget-object v3, Lirf;->A1:Lirf${'$'}a;
    invoke-virtual {v3, v8}, Lig0;->getInstance(Landroid/content/Context;)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ldh8;
    invoke-virtual {v0, v3}, Ly31;->a(Ldh8;)V
    sget-object v3, Lcck;->Y:Lcck${'$'}a;
    invoke-virtual {v3, v8}, Lig0;->getInstance(Landroid/content/Context;)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ldh8;
    invoke-virtual {v0, v3}, Ly31;->a(Ldh8;)V
    sget-object v3, Lrd7;->a:Lrd7;
    invoke-virtual {v0, v3}, Ly31;->a(Ldh8;)V
    iget-object v3, v0, La41;->d:Lbhd;
    invoke-virtual {v0, v3}, Ly31;->a(Ldh8;)V
    sget-object v3, Lfr5;->I:Lfr5${'$'}a;
    invoke-virtual {v3, v8}, Lig0;->getInstance(Landroid/content/Context;)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ldh8;
    invoke-virtual {v0, v3}, Ly31;->a(Ldh8;)V
    sget-object v3, Lq55;->y:Lq55${'$'}a;
    invoke-virtual {v3, v8}, Lig0;->getInstance(Landroid/content/Context;)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ldh8;
    invoke-virtual {v0, v3}, Ly31;->a(Ldh8;)V
    sget-object v3, Lpz2;->s1:Lpz2${'$'}a;
    invoke-virtual {v3, v8}, Lig0;->getInstance(Landroid/content/Context;)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ldh8;
    invoke-virtual {v0, v3}, Ly31;->a(Ldh8;)V
    sget-object v3, Lbm6;->I:Lbm6${'$'}a;
    invoke-virtual {v3, v8}, Lig0;->getInstance(Landroid/content/Context;)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ldh8;
    invoke-virtual {v0, v3}, Ly31;->a(Ldh8;)V
    sget-object v3, Ltie;->s:Ltie${'$'}b;
    invoke-virtual {v3, v8}, Lig0;->getInstance(Landroid/content/Context;)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ldh8;
    invoke-virtual {v0, v3}, Ly31;->a(Ldh8;)V
    iget-object v3, v0, La41;->f:Lnl/flitsmeister/fmcore/service/lookahead/EventsAheadService;
    invoke-virtual {v0, v3}, Ly31;->a(Ldh8;)V
    sget-object v3, Lnl/flitsmeister/fmcore/service/lookahead/LookAheadPolylineService;->Companion:Lnl/flitsmeister/fmcore/service/lookahead/LookAheadPolylineService${'$'}Companion;
    invoke-virtual {v3, v8}, Lig0;->getInstance(Landroid/content/Context;)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ldh8;
    invoke-virtual {v0, v3}, Ly31;->a(Ldh8;)V
    const-class v3, Ltef;
    invoke-static {v8, v3}, Lyig;->b(Landroid/content/Context;Ljava/lang/Class;)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ltef;
    invoke-interface {v3}, Ltef;->l()Lsef;
    move-result-object v3
    invoke-virtual {v0, v3}, Ly31;->a(Ldh8;)V
    sget-object v3, Llh7;->Z:Llh7${'$'}a;
    sget-object v9, Lnia;->a:Lnia;
    invoke-virtual {v9, v8}, Lu71;->c(Landroid/content/Context;)Landroid/content/ContextWrapper;
    move-result-object v9
    invoke-virtual {v3, v9}, Lig0;->getInstance(Landroid/content/Context;)Ljava/lang/Object;
    move-result-object v3
    move-object v9, v3
    check-cast v9, Llh7;
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    new-instance v10, Lnl/flitsmeister/models/clients/EarlyWarningClientImpl;
    iget-object v11, v9, Llh7;->a:Landroid/content/Context;
    invoke-direct {v10, v11}, Lnl/flitsmeister/models/clients/EarlyWarningClientImpl;-><init>(Landroid/content/Context;)V
    iput-object v10, v9, Llh7;->x:Lnl/flitsmeister/models/clients/EarlyWarningClientImpl;
    const-class v10, Lile;
    invoke-static {v11, v10}, Lyig;->b(Landroid/content/Context;Ljava/lang/Class;)Ljava/lang/Object;
    move-result-object v10
    check-cast v10, Lile;
    invoke-interface {v10}, Lile;->D()Lgm8;
    move-result-object v10
    iput-object v10, v9, Llh7;->s:Lhle;
    check-cast v3, Ldh8;
    invoke-virtual {v0, v3}, Ly31;->a(Ldh8;)V
    iget-object v3, v0, La41;->g:Le68;
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    sget-object v3, Lnl/flitsmeister/services/parking/Parking4411Service;->Companion:Lnl/flitsmeister/services/parking/Parking4411Service${'$'}Companion;
    invoke-virtual {v3, v8}, Lig0;->getInstance(Landroid/content/Context;)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ldh8;
    invoke-virtual {v0, v3}, Ly31;->a(Ldh8;)V
    sget-object v3, Lnl/flitsmeister/services/ble/BleDeviceService;->Companion:Lnl/flitsmeister/services/ble/BleDeviceService${'$'}Companion;
    invoke-virtual {v3, v8}, Lig0;->getInstance(Landroid/content/Context;)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ldh8;
    invoke-virtual {v0, v3}, Ly31;->a(Ldh8;)V
    invoke-static {v8}, Lnxj;->c(Landroid/content/Context;)Z
    move-result v3
    if-eqz v3, :cond_5
    iget-object v3, v0, La41;->e:Lnl/flitsmeister/triphistory/domain/service/TripHistoryService;
    invoke-virtual {v0, v3}, Ly31;->a(Ldh8;)V
    :cond_5
    sget-object v0, Levc;->e:Levc${'$'}a;
    invoke-virtual {v0, v1}, Lig0;->getInstance(Landroid/content/Context;)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Levc;
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_start_1
    iget-object v3, v0, Levc;->b:Ljava/util/HashSet;
    invoke-virtual {v3}, Ljava/util/HashSet;->clear()V
    iget-object v3, v0, Levc;->c:Lfti;
    invoke-virtual {v3}, Lfti;->getValue()Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Landroid/net/ConnectivityManager;
    if-eqz v3, :cond_6
    iget-object v8, v0, Levc;->d:Lfti;
    invoke-virtual {v8}, Lfti;->getValue()Ljava/lang/Object;
    move-result-object v8
    check-cast v8, Landroid/net/NetworkRequest;
    invoke-virtual {v3, v8, v0}, Landroid/net/ConnectivityManager;->registerNetworkCallback(Landroid/net/NetworkRequest;Landroid/net/ConnectivityManager${'$'}NetworkCallback;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    goto :goto_4
    :catch_0
    move-exception v0
    const-string v3, "[NetworkStatusManager] Exception while registering connectivity monitor: "
    invoke-static {v3, v0}, Lfze;->a(Ljava/lang/String;Ljava/lang/Exception;)Ljava/lang/String;
    move-result-object v3
    invoke-static {}, Lhha;->c()Lorg/slf4j/Logger;
    move-result-object v8
    invoke-static {v8, v3, v0}, Lhha;->i(Lorg/slf4j/Logger;Ljava/lang/String;Ljava/lang/Throwable;)V
    :cond_6
    :goto_4
    const-string v0, "15.0"
    const/16 v3, 0x509
    invoke-static {v3, v0}, Ln9k;->a(ILjava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-static {}, Lhha;->c()Lorg/slf4j/Logger;
    move-result-object v3
    const-string v8, "[BaseService] Starting service. "
    invoke-virtual {v8, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-static {v3, v0}, Lhha;->j(Lorg/slf4j/Logger;Ljava/lang/String;)V
    invoke-static {}, Lhha;->c()Lorg/slf4j/Logger;
    move-result-object v0
    sget-object v3, Lt28;->i:Ltuh;
    invoke-virtual {v3, v1}, Ltuh;->e(Landroid/content/Context;)Ljava/lang/String;
    move-result-object v3
    new-instance v8, Ljava/lang/StringBuilder;
    const-string v9, "[BaseService] Crashlytics identifier "
    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v3
    invoke-static {v0, v3}, Lhha;->j(Lorg/slf4j/Logger;Ljava/lang/String;)V
    invoke-static {}, Lhha;->c()Lorg/slf4j/Logger;
    move-result-object v0
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;
    move-result-object v3
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_start_2
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;
    move-result-object v8
    invoke-virtual {v8}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;
    move-result-object v8
    invoke-virtual {v8, v3, v5}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    move-result-object v3
    iget-wide v8, v3, Landroid/content/pm/PackageInfo;->firstInstallTime:J
    invoke-static {}, Ljava/text/DateFormat;->getDateTimeInstance()Ljava/text/DateFormat;
    move-result-object v3
    new-instance v10, Ljava/util/Date;
    invoke-direct {v10, v8, v9}, Ljava/util/Date;-><init>(J)V
    invoke-virtual {v3, v10}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;
    move-result-object v3
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    goto :goto_5
    :catch_1
    const-string v3, "???"
    :goto_5
    const-string v8, "[BaseService] installed: "
    invoke-virtual {v8, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v3
    invoke-static {v0, v3}, Lhha;->j(Lorg/slf4j/Logger;Ljava/lang/String;)V
    sget-object v0, Lt28;->S:Ltuh;
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;
    move-result-object v3
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    invoke-virtual {v0, v3}, Ltuh;->c(Landroid/content/Context;)I
    move-result v3
    sget-object v8, Lt28;->R:Ltuh;
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;
    move-result-object v9
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    invoke-virtual {v8, v9}, Ltuh;->d(Landroid/content/Context;)J
    move-result-wide v8
    if-lt v3, v2, :cond_9
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;
    move-result-object v10
    invoke-virtual {v10, v8, v9}, Ljava/util/Calendar;->setTimeInMillis(J)V
    invoke-virtual {v10, v4, v2}, Ljava/util/Calendar;->add(II)V
    invoke-virtual {v10}, Ljava/util/Calendar;->getTimeInMillis()J
    move-result-wide v8
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v10
    cmp-long v8, v10, v8
    if-lez v8, :cond_7
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;
    move-result-object v3
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    invoke-virtual {v0, v5, v3}, Ltuh;->k(ILandroid/content/Context;)V
    sget-object v0, Lt28;->Q:Ltuh;
    invoke-virtual {v0, v1, v2}, Ltuh;->i(Landroid/content/Context;Z)Z
    goto :goto_6
    :cond_7
    if-lt v3, v4, :cond_8
    if-gez v8, :cond_8
    const-string v3, "Mau_user_continued_using"
    new-instance v4, Lnl/flitsmeister/fmcore/data/model/StringParam;
    const-string v8, "value"
    const-string v9, "true"
    invoke-direct {v4, v8, v9}, Lnl/flitsmeister/fmcore/data/model/StringParam;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    filled-new-array {v4}, [Lnl/flitsmeister/fmcore/data/model/StringParam;
    move-result-object v4
    invoke-static {v1, v3, v4}, Lho;->c(Landroid/content/Context;Ljava/lang/String;[Lnl/flitsmeister/fmcore/data/model/StringParam;)V
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;
    move-result-object v3
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    invoke-virtual {v0, v5, v3}, Ltuh;->k(ILandroid/content/Context;)V
    sget-object v0, Lt28;->Q:Ltuh;
    invoke-virtual {v0, v1, v5}, Ltuh;->i(Landroid/content/Context;Z)Z
    goto :goto_6
    :cond_8
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;
    move-result-object v4
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    add-int/2addr v3, v2
    invoke-virtual {v0, v3, v4}, Ltuh;->k(ILandroid/content/Context;)V
    sget-object v0, Lt28;->Q:Ltuh;
    invoke-virtual {v0, v1, v2}, Ltuh;->i(Landroid/content/Context;Z)Z
    :cond_9
    :goto_6
    new-instance v0, Lnl/flitsmeister/services/base/FlitsmeisterBaseService${'$'}g;
    invoke-direct {v0, v1, v6}, Lnl/flitsmeister/services/base/FlitsmeisterBaseService${'$'}g;-><init>(Lnl/flitsmeister/services/base/FlitsmeisterBaseService;Lsn4;)V
    sget-object v3, Ln37;->a:Lre6;
    sget-object v3, Lv96;->a:Lv96;
    invoke-static {v3, v0}, Lhv0;->e(Lb45;Li49;)Lyhi;
    invoke-static {}, Lfb8;->a()Lfb8;
    move-result-object v0
    const-string v3, "user_logged_in"
    sget-object v4, Lgb;->j:Lgb${'$'}a;
    invoke-virtual {v4, v1}, Lig0;->getInstance(Landroid/content/Context;)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Lgb;
    iget-object v4, v4, Lgb;->b:Lnl/flitsmeister/models/data/account/UserAccountFM;
    if-eqz v4, :cond_a
    move v4, v2
    goto :goto_7
    :cond_a
    move v4, v5
    :goto_7
    invoke-virtual {v0, v3, v4}, Lfb8;->e(Ljava/lang/String;Z)V
    const-string v3, "app_language"
    sget-object v4, Lnia;->a:Lnia;
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    invoke-static {v1}, Lu71;->a(Landroid/content/Context;)Ly9k;
    move-result-object v4
    iget-object v4, v4, Ly9k;->a:Ljava/lang/String;
    invoke-virtual {v0, v3, v4}, Lfb8;->d(Ljava/lang/String;Ljava/lang/String;)V
    const-string v3, "route_active"
    invoke-virtual {v0, v3, v5}, Lfb8;->e(Ljava/lang/String;Z)V
    const-string v3, "social_media_blocker"
    sget-object v4, Lxc0;->H:Lnl/flitsmeister/fmcore/models/preferences/AppPreference;
    invoke-static {v1, v4}, Lxc0;->a(Landroid/content/Context;Lnl/flitsmeister/fmcore/models/preferences/AppPreference;)Ljava/lang/Boolean;
    move-result-object v4
    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z
    move-result v4
    invoke-virtual {v0, v3, v4}, Lfb8;->e(Ljava/lang/String;Z)V
    const-string v3, "received_close_event"
    invoke-virtual {v0, v3, v5}, Lfb8;->e(Ljava/lang/String;Z)V
    const-string v3, "app_started_at"
    invoke-static {}, Ljava/time/LocalDateTime;->now()Ljava/time/LocalDateTime;
    move-result-object v4
    const-string v8, "MMM dd, uuuu, HH:mm:ss"
    invoke-static {v8}, Ljava/time/format/DateTimeFormatter;->ofPattern(Ljava/lang/String;)Ljava/time/format/DateTimeFormatter;
    move-result-object v8
    invoke-virtual {v4, v8}, Ljava/time/LocalDateTime;->format(Ljava/time/format/DateTimeFormatter;)Ljava/lang/String;
    move-result-object v4
    invoke-virtual {v0, v3, v4}, Lfb8;->d(Ljava/lang/String;Ljava/lang/String;)V
    const-string v8, "android.permission.ACCESS_BACKGROUND_LOCATION"
    const/4 v9, 0x0
    const-string v9, "android.permission.ACCESS_FINE_LOCATION"
    const-string v10, "android.permission.ACCESS_COARSE_LOCATION"
    const-string v11, "android.permission.ACCEPT_HANDOVER"
    const-string v12, "android.permission.ACCESS_MEDIA_LOCATION"
    const-string v13, "android.permission.ACTIVITY_RECOGNITION"
    const-string v14, "com.android.voicemail.permission.ADD_VOICEMAIL"
    const-string v15, "android.permission.ANSWER_PHONE_CALLS"
    const-string v16, "android.permission.BODY_SENSORS"
    const-string v17, "android.permission.CALL_PHONE"
    const-string v18, "android.permission.CAMERA"
    const-string v19, "android.permission.GET_ACCOUNTS"
    const-string v20, "android.permission.READ_CALENDAR"
    const-string v21, "android.permission.READ_CALL_LOG"
    const-string v22, "android.permission.READ_CONTACTS"
    const-string v23, "android.permission.READ_EXTERNAL_STORAGE"
    const-string v24, "android.permission.READ_PHONE_NUMBERS"
    const-string v25, "android.permission.READ_PHONE_STATE"
    const-string v26, "android.permission.READ_SMS"
    const-string v27, "android.permission.RECEIVE_MMS"
    const-string v28, "android.permission.RECEIVE_SMS"
    const-string v29, "android.permission.RECEIVE_WAP_PUSH"
    const-string v30, "android.permission.RECORD_AUDIO"
    const-string v31, "android.permission.SEND_SMS"
    const-string v32, "android.permission.USE_SIP"
    const-string v33, "android.permission.WRITE_CALENDAR"
    const-string v34, "android.permission.WRITE_CALL_LOG"
    const-string v35, "android.permission.WRITE_CONTACTS"
    const-string v36, "android.permission.WRITE_EXTERNAL_STORAGE"
    filled-new-array/range {v8 .. v36}, [Ljava/lang/String;
    move-result-object v3
    invoke-static {v3}, Ll33;->i([Ljava/lang/Object;)Ljava/util/ArrayList;
    move-result-object v3
    sget v4, Landroid/os/Build${'$'}VERSION;->SDK_INT:I
    const/16 v8, 0x1f
    if-lt v4, v8, :cond_b
    const-string v8, "android.permission.BLUETOOTH_ADVERTISE"
    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    const-string v8, "android.permission.BLUETOOTH_CONNECT"
    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    const-string v8, "android.permission.BLUETOOTH_SCAN"
    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    const-string v8, "android.permission.UWB_RANGING"
    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :cond_b
    const/16 v8, 0x21
    if-lt v4, v8, :cond_c
    const-string v8, "android.permission.BODY_SENSORS_BACKGROUND"
    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    const-string v8, "android.permission.NEARBY_WIFI_DEVICES"
    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    const-string v8, "android.permission.POST_NOTIFICATIONS"
    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    const-string v8, "android.permission.READ_MEDIA_AUDIO"
    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    const-string v8, "android.permission.READ_MEDIA_IMAGES"
    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    const-string v8, "android.permission.READ_MEDIA_VIDEO"
    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :cond_c
    if-lt v4, v7, :cond_d
    const-string v4, "android.permission.FOREGROUND_SERVICE_LOCATION"
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    const-string v4, "android.permission.READ_MEDIA_VISUAL_USER_SELECTED"
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :cond_d
    new-instance v4, Ljava/util/ArrayList;
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V
    new-instance v7, Ljava/util/ArrayList;
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;
    move-result-object v3
    :goto_8
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z
    move-result v8
    if-eqz v8, :cond_f
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v8
    check-cast v8, Ljava/lang/String;
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;
    move-result-object v9
    invoke-static {v9, v8}, Landroidx/core/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I
    move-result v9
    if-nez v9, :cond_e
    invoke-virtual {v4, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :goto_8
    :cond_e
    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :goto_8
    :cond_f
    new-instance v3, Lkotlin/Pair;
    invoke-direct {v3, v4, v7}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V
    const-string v4, "permissions_granted"
    invoke-virtual {v3}, Lkotlin/Pair;->getFirst()Ljava/lang/Object;
    move-result-object v7
    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;
    move-result-object v7
    invoke-virtual {v0, v4, v7}, Lfb8;->d(Ljava/lang/String;Ljava/lang/String;)V
    const-string v4, "permissions_not_granted"
    invoke-virtual {v3}, Lkotlin/Pair;->getSecond()Ljava/lang/Object;
    move-result-object v3
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;
    move-result-object v3
    invoke-virtual {v0, v4, v3}, Lfb8;->d(Ljava/lang/String;Ljava/lang/String;)V
    const-string v3, "should_simulate_call"
    sget-object v4, Lxc0;->F:Lnl/flitsmeister/fmcore/models/preferences/AppPreference;
    invoke-static {v1, v4}, Lxc0;->a(Landroid/content/Context;Lnl/flitsmeister/fmcore/models/preferences/AppPreference;)Ljava/lang/Boolean;
    move-result-object v4
    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z
    move-result v4
    invoke-virtual {v0, v3, v4}, Lfb8;->e(Ljava/lang/String;Z)V
    const-string v3, "force_speaker"
    sget-object v4, Lxc0;->w:Lnl/flitsmeister/fmcore/models/preferences/AppPreference;
    invoke-static {v1, v4}, Lxc0;->a(Landroid/content/Context;Lnl/flitsmeister/fmcore/models/preferences/AppPreference;)Ljava/lang/Boolean;
    move-result-object v4
    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z
    move-result v4
    invoke-virtual {v0, v3, v4}, Lfb8;->e(Ljava/lang/String;Z)V
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v3
    sput-wide v3, Lvug;->a:J
    invoke-static {v1}, Landroidx/core/app/NotificationManagerCompat;->from(Landroid/content/Context;)Landroidx/core/app/NotificationManagerCompat;
    move-result-object v0
    const/16 v3, 0x3039
    invoke-virtual {v0, v3}, Landroidx/core/app/NotificationManagerCompat;->cancel(I)V
    const v3, 0x8707
    invoke-virtual {v0, v3}, Landroidx/core/app/NotificationManagerCompat;->cancel(I)V
    const v3, 0xb26e
    invoke-virtual {v0, v3}, Landroidx/core/app/NotificationManagerCompat;->cancel(I)V
    const v3, 0xae17
    invoke-virtual {v0, v3}, Landroidx/core/app/NotificationManagerCompat;->cancel(I)V
    const v3, 0xae18
    invoke-virtual {v0, v3}, Landroidx/core/app/NotificationManagerCompat;->cancel(I)V
    const v3, 0xae19
    invoke-virtual {v0, v3}, Landroidx/core/app/NotificationManagerCompat;->cancel(I)V
    sget-object v0, Ld86;->a:Ld86;
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    invoke-static {v1}, Landroidx/core/app/NotificationManagerCompat;->from(Landroid/content/Context;)Landroidx/core/app/NotificationManagerCompat;
    move-result-object v0
    sget-object v3, Ld86;->b:Ljava/util/HashSet;
    invoke-virtual {v3}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;
    move-result-object v4
    :goto_9
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z
    move-result v7
    if-eqz v7, :cond_10
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v7
    check-cast v7, Ljava/lang/Number;
    invoke-virtual {v7}, Ljava/lang/Number;->intValue()I
    move-result v7
    invoke-virtual {v0, v7}, Landroidx/core/app/NotificationManagerCompat;->cancel(I)V
    goto :goto_9
    :cond_10
    invoke-virtual {v3}, Ljava/util/HashSet;->clear()V
    iget-object v0, v1, Lnl/flitsmeister/services/base/FlitsmeisterBaseService;->x:Lbja;
    if-eqz v0, :cond_1f
    iget-object v3, v1, Lnl/flitsmeister/services/base/FlitsmeisterBaseService;->y:Lkxi;
    if-eqz v3, :cond_1e
    iget-object v3, v3, Lkxi;->f:Lhxc;
    invoke-virtual {v3}, Lhxc;->d()V
    iget-object v3, v0, Lyia;->a:Ljava/util/Set;
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v3
    :goto_a
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z
    move-result v4
    if-eqz v4, :cond_11
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Lv71;
    invoke-virtual {v4, v0}, Lv71;->execute(Lcja;)V
    goto :goto_a
    :cond_11
    iget-object v3, v0, Lyia;->d:Lyhi;
    if-eqz v3, :cond_12
    invoke-virtual {v3, v6}, Lmca;->cancel(Ljava/util/concurrent/CancellationException;)V
    :cond_12
    new-instance v3, Lxia;
    invoke-direct {v3, v0, v6}, Lxia;-><init>(Lyia;Lsn4;)V
    sget-object v4, Ln37;->a:Lre6;
    sget-object v4, Laab;->a:Loi9;
    invoke-static {v4, v3}, Lhv0;->e(Lb45;Li49;)Lyhi;
    move-result-object v3
    iput-object v3, v0, Lyia;->d:Lyhi;
    new-instance v3, Leh8;
    invoke-direct {v3, v1}, Leh8;-><init>(Lnl/flitsmeister/services/base/FlitsmeisterBaseService;)V
    iget-boolean v4, v0, Lyia;->c:Z
    if-eqz v4, :cond_13
    invoke-virtual {v3}, Leh8;->a()V
    goto :goto_b
    :cond_13
    iget-object v0, v0, Lyia;->b:Ljava/util/Set;
    invoke-interface {v0, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :goto_b
    iget-object v0, v1, Lnl/flitsmeister/services/base/FlitsmeisterBaseService;->X:Ly81;
    if-eqz v0, :cond_1d
    iget-object v3, v0, Ly81;->e:Ljava/util/Set;
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    monitor-enter v3
    :try_start_3
    iget-boolean v4, v0, Ly81;->j:Z
    if-nez v4, :cond_14
    iget-object v4, v0, Ly81;->e:Ljava/util/Set;
    iget-object v7, v0, Ly81;->f:Lfti;
    invoke-virtual {v7}, Lfti;->getValue()Ljava/lang/Object;
    move-result-object v7
    check-cast v7, Llh8;
    invoke-interface {v4, v7}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    iget-object v4, v0, Ly81;->e:Ljava/util/Set;
    iget-object v7, v0, Ly81;->g:Lfti;
    invoke-virtual {v7}, Lfti;->getValue()Ljava/lang/Object;
    move-result-object v7
    check-cast v7, Ljz0;
    invoke-interface {v4, v7}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    iget-object v4, v0, Ly81;->e:Ljava/util/Set;
    iget-object v7, v0, Ly81;->h:Lfti;
    invoke-virtual {v7}, Lfti;->getValue()Ljava/lang/Object;
    move-result-object v7
    check-cast v7, Lnfe;
    invoke-interface {v4, v7}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    iget-object v4, v0, Ly81;->e:Ljava/util/Set;
    iget-object v7, v0, Ly81;->i:Lfti;
    invoke-virtual {v7}, Lfti;->getValue()Ljava/lang/Object;
    move-result-object v7
    check-cast v7, Lqsf;
    invoke-interface {v4, v7}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    goto :goto_c
    :catchall_1
    move-exception v0
    goto/16 :goto_11
    :cond_14
    :goto_c
    iput-boolean v2, v0, Ly81;->j:Z
    iget-object v0, v0, Ly81;->e:Ljava/util/Set;
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v0
    :goto_d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z
    move-result v4
    if-eqz v4, :cond_15
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ln91;
    invoke-virtual {v4}, Ln91;->e()V
    goto :goto_d
    :cond_15
    sget-object v0, Ll1k;->a:Ll1k;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1
    monitor-exit v3
    iget-object v0, v1, Lnl/flitsmeister/services/base/FlitsmeisterBaseService;->p1:Lgm8;
    if-eqz v0, :cond_1c
    invoke-virtual {v0, v1}, Lgm8;->a0(Landroid/content/Context;)Z
    move-result v0
    if-eqz v0, :cond_16
    invoke-virtual {v1, v2}, Lnl/flitsmeister/services/base/FlitsmeisterBaseService;->b(Z)V
    :cond_16
    sget-object v0, Ldyj;->a:Ldyj;
    sput-boolean v5, Ldyj;->i:Z
    sget-object v3, Lgb;->j:Lgb${'$'}a;
    invoke-virtual {v3, v1}, Lig0;->getInstance(Landroid/content/Context;)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lgb;
    iget-object v3, v3, Lgb;->b:Lnl/flitsmeister/models/data/account/UserAccountFM;
    if-eqz v3, :cond_18
    new-instance v3, Lfh8;
    invoke-direct {v3, v1}, Lfh8;-><init>(Lnl/flitsmeister/services/base/FlitsmeisterBaseService;)V
    new-instance v0, Lcom/google/gson/Gson;
    invoke-direct {v0}, Lcom/google/gson/Gson;-><init>()V
    sget-object v4, Lsuh;->A0:Ltuh;
    invoke-static {v1}, Landroidx/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;
    move-result-object v5
    iget-object v7, v4, Ltuh;->a:Ljava/lang/String;
    new-instance v8, Lcom/google/gson/Gson;
    invoke-direct {v8}, Lcom/google/gson/Gson;-><init>()V
    iget-object v4, v4, Ltuh;->b:Ljava/lang/Object;
    invoke-virtual {v8, v4}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v4
    invoke-interface {v5, v7, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v4
    new-instance v5, Lcom/google/gson/Gson;
    invoke-direct {v5}, Lcom/google/gson/Gson;-><init>()V
    const-class v7, Lnl/flitsmeister/fmcore/models/data/tripdata/TripData;
    invoke-virtual {v5, v4, v7}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    move-result-object v4
    invoke-virtual {v0, v4}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v0
    new-instance v4, Lcom/google/gson/Gson;
    invoke-direct {v4}, Lcom/google/gson/Gson;-><init>()V
    const-class v5, Ljava/util/HashMap;
    invoke-virtual {v4, v0, v5}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/lang/Object;
    move-result-object v0
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-object v4, v0
    check-cast v4, Ljava/util/HashMap;
    invoke-static {v4}, Lh4e;->a(Ljava/util/AbstractMap;)V
    new-instance v0, Ljava/lang/StringBuilder;
    const-string v5, "[TripStatistics] Validated trip data, sending it now: "
    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static {}, Lhha;->c()Lorg/slf4j/Logger;
    move-result-object v5
    if-eqz v5, :cond_17
    invoke-interface {v5, v0}, Lorg/slf4j/Logger;->info(Ljava/lang/String;)V
    :cond_17
    :try_start_4
    invoke-static {}, Lfb8;->a()Lfb8;
    move-result-object v5
    invoke-virtual {v5, v0}, Lfb8;->b(Ljava/lang/String;)V
    :try_end_4
    .catch Ljava/lang/IllegalStateException; {:try_start_4 .. :try_end_4} :catch_2
    goto :goto_e
    :catch_2
    move-exception v0
    const-string v5, "Exception logging to firebase crashlytics"
    invoke-static {v5, v0}, Lhha;->g(Ljava/lang/String;Ljava/lang/Throwable;)V
    :goto_e
    const-string v0, "saveTripData"
    new-instance v5, Ld4e;
    invoke-direct {v5, v3, v1}, Ld4e;-><init>(Lfh8;Lnl/flitsmeister/services/base/FlitsmeisterBaseService;)V
    invoke-static {v0, v4, v5}, Lcom/parse/ParseCloud;->callFunctionInBackground(Ljava/lang/String;Ljava/util/Map;Lcom/parse/FunctionCallback;)V
    goto :goto_f
    :cond_18
    invoke-virtual {v0, v1}, Ldyj;->m(Landroid/content/Context;)V
    :goto_f
    sget-object v0, Lt28;->s:Ltuh;
    invoke-virtual {v0, v1}, Ltuh;->c(Landroid/content/Context;)I
    move-result v3
    add-int/2addr v3, v2
    invoke-virtual {v0, v3, v1}, Ltuh;->k(ILandroid/content/Context;)V
    invoke-static {v1}, Lnxj;->c(Landroid/content/Context;)Z
    move-result v0
    if-eqz v0, :cond_19
    sget-object v0, Lgh6;->m:Lgh6${'$'}a;
    invoke-virtual {v0, v1}, Lig0;->getInstance(Landroid/content/Context;)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lgh6;
    invoke-virtual {v0}, Lgh6;->e()V
    :cond_19
    sget-object v0, Lwd0;->f:Lwd0${'$'}a;
    invoke-virtual {v0, v1}, Lig0;->getInstance(Landroid/content/Context;)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lwd0;
    invoke-virtual {v0}, Lwd0;->a()V
    sget-object v0, Lnl/flitsmeister/route_guidance/logger/RouteGuidanceLogger;->Companion:Lnl/flitsmeister/route_guidance/logger/RouteGuidanceLogger${'$'}Companion;
    new-instance v3, Lhh8;
    invoke-direct {v3}, Ljava/lang/Object;-><init>()V
    invoke-virtual {v0, v3}, Lnl/flitsmeister/route_guidance/logger/RouteGuidanceLogger${'$'}Companion;->setLoggerInstance(Lnl/flitsmeister/route_guidance/logger/RouteGuidanceLogger;)V
    sget-object v0, Lnl/flitsmeister/local_notifications/EndOfTripLocalNotification;->INSTANCE:Lnl/flitsmeister/local_notifications/EndOfTripLocalNotification;
    invoke-virtual {v0, v6}, Lnl/flitsmeister/local_notifications/EndOfTripLocalNotification;->setLocalNotification(Landroid/app/Notification;)V
    const-string v0, "[FMRouteRequestManager] sendCancelRouteRequest"
    invoke-static {}, Lhha;->c()Lorg/slf4j/Logger;
    move-result-object v3
    if-eqz v3, :cond_1a
    invoke-interface {v3, v0}, Lorg/slf4j/Logger;->info(Ljava/lang/String;)V
    :cond_1a
    :try_start_5
    invoke-static {}, Lfb8;->a()Lfb8;
    move-result-object v3
    invoke-virtual {v3, v0}, Lfb8;->b(Ljava/lang/String;)V
    :try_end_5
    .catch Ljava/lang/IllegalStateException; {:try_start_5 .. :try_end_5} :catch_3
    goto :goto_10
    :catch_3
    move-exception v0
    const-string v3, "Exception logging to firebase crashlytics"
    invoke-static {v3, v0}, Lhha;->g(Ljava/lang/String;Ljava/lang/Throwable;)V
    :goto_10
    invoke-static {}, Llp0;->c()Lff4;
    move-result-object v0
    invoke-interface {v0, v1}, Lff4;->r(Landroid/content/Context;)Lu61;
    move-result-object v0
    iget-object v0, v0, Lu61;->c:Lbemobile/cits/sdk/core/service/CITSService;
    invoke-virtual {v0}, Lbemobile/cits/sdk/core/service/CITSService;->getRouteRequestManager()Lbemobile/cits/sdk/core/manager/CITSRouteRequestManager;
    move-result-object v0
    invoke-static {v0, v6, v2, v6}, Lbemobile/cits/sdk/core/manager/CITSRouteRequestManager;->sendCancelRouteRequest${'$'}default(Lbemobile/cits/sdk/core/manager/CITSRouteRequestManager;Ljava/lang/String;ILjava/lang/Object;)V
    sget-object v0, Ltlj;->d:Ljava/util/ArrayList;
    new-instance v1, Lxe3;
    invoke-direct {v1, v2}, Lxe3;-><init>(I)V
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    const-string v0, "[FlitsmeisterBaseService] Service initialized."
    invoke-static {}, Lhha;->c()Lorg/slf4j/Logger;
    move-result-object v1
    if-eqz v1, :cond_1b
    invoke-interface {v1, v0}, Lorg/slf4j/Logger;->info(Ljava/lang/String;)V
    :cond_1b
    :try_start_6
    invoke-static {}, Lfb8;->a()Lfb8;
    move-result-object v1
    invoke-virtual {v1, v0}, Lfb8;->b(Ljava/lang/String;)V
    :try_end_6
    .catch Ljava/lang/IllegalStateException; {:try_start_6 .. :try_end_6} :catch_4
    goto :goto_12
    :catch_4
    move-exception v0
    const-string v1, "Exception logging to firebase crashlytics"
    invoke-static {v1, v0}, Lhha;->g(Ljava/lang/String;Ljava/lang/Throwable;)V
    goto :goto_12
    :cond_1c
    const-string v0, "proFeatureProvider"
    invoke-static {v0}, Lq9a;->k(Ljava/lang/String;)V
    throw v6
    :goto_11
    monitor-exit v3
    throw v0
    :cond_1d
    const-string v0, "baseReportDataManager"
    invoke-static {v0}, Lq9a;->k(Ljava/lang/String;)V
    throw v6
    :cond_1e
    const-string v0, "taskManager"
    invoke-static {v0}, Lq9a;->k(Ljava/lang/String;)V
    throw v6
    :cond_1f
    const-string v0, "launchManagerImpl"
    invoke-static {v0}, Lq9a;->k(Ljava/lang/String;)V
    throw v6
    :cond_20
    const-string v0, "backgroundServiceManagerImpl"
    invoke-static {v0}, Lq9a;->k(Ljava/lang/String;)V
    throw v6
    :cond_21
    const-string v0, "[FlitsmeisterBaseService] Service is already running, not initializing other services."
    invoke-static {}, Lhha;->c()Lorg/slf4j/Logger;
    move-result-object v1
    if-eqz v1, :cond_22
    invoke-interface {v1, v0}, Lorg/slf4j/Logger;->info(Ljava/lang/String;)V
    :cond_22
    :try_start_7
    invoke-static {}, Lfb8;->a()Lfb8;
    move-result-object v1
    invoke-virtual {v1, v0}, Lfb8;->b(Ljava/lang/String;)V
    :try_end_7
    .catch Ljava/lang/IllegalStateException; {:try_start_7 .. :try_end_7} :catch_5
    goto :goto_12
    :catch_5
    move-exception v0
    const-string v1, "Exception logging to firebase crashlytics"
    invoke-static {v1, v0}, Lhha;->g(Ljava/lang/String;Ljava/lang/Throwable;)V
    :goto_12
    return v2
    :goto_13
    invoke-static {}, Lfb8;->a()Lfb8;
    move-result-object v1
    invoke-virtual {v1, v0}, Lfb8;->c(Ljava/lang/Throwable;)V
    new-instance v1, Ljava/lang/StringBuilder;
    const-string v2, "[FlitsmeisterBaseService] Service did not start because of an exception: "
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    invoke-static {}, Lhha;->c()Lorg/slf4j/Logger;
    move-result-object v2
    invoke-static {v2, v1, v0}, Lhha;->i(Lorg/slf4j/Logger;Ljava/lang/String;Ljava/lang/Throwable;)V
    sput-boolean v5, Lvug;->b:Z
    return v4
""".trimIndent()

internal val serviceOnDestroy15 = """
    const/4 v0, 0x0
    invoke-static {}, Lhha;->c()Lorg/slf4j/Logger;
    move-result-object v2
    const-string v3, "[FlitsmeisterBaseService] Stopping service"
    if-eqz v2, :cond_0
    invoke-interface {v2, v3}, Lorg/slf4j/Logger;->info(Ljava/lang/String;)V
    :cond_0
    :try_start_0
    invoke-static {}, Lfb8;->a()Lfb8;
    move-result-object v2
    invoke-virtual {v2, v3}, Lfb8;->b(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0
    goto :goto_0
    :catch_0
    move-exception v2
    const-string v3, "Exception logging to firebase crashlytics"
    invoke-static {v3, v2}, Lhha;->g(Ljava/lang/String;Ljava/lang/Throwable;)V
    :goto_0
    sget-object v2, Lnl/flitsmeister/services/autostart/AutoStartDetectionService;->Companion:Lnl/flitsmeister/services/autostart/AutoStartDetectionService${'$'}Companion;
    invoke-virtual {v2, p0}, Lnl/flitsmeister/services/autostart/AutoStartDetectionService${'$'}Companion;->startDetecting(Landroid/content/Context;)V
    sput-boolean v0, Lvug;->b:Z
    iput-boolean v0, p0, Lnl/flitsmeister/services/base/FlitsmeisterBaseService;->t1:Z
    sget-object v2, Ldyj;->a:Ldyj;
    new-instance v3, Lsd1;
    const/4 v4, 0x1
    const/4 v6, 0x2
    invoke-direct {v3, v6}, Lsd1;-><init>(I)V
    invoke-virtual {v2, p0, v3}, Ldyj;->a(Landroid/content/Context;Lu39;)V
    invoke-virtual {v2, p0, v4}, Ldyj;->n(Landroid/content/Context;Z)V
    sget-object v3, Lsuh;->L0:Ltuh;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v5
    invoke-virtual {v3, p0, v5, v6}, Ltuh;->l(Landroid/content/Context;J)V
    new-instance v3, Lnl/flitsmeister/services/base/FlitsmeisterBaseService${'$'}c;
    const/4 v5, 0x0
    invoke-direct {v3, p0, v5}, Lnl/flitsmeister/services/base/FlitsmeisterBaseService${'$'}c;-><init>(Lnl/flitsmeister/services/base/FlitsmeisterBaseService;Lsn4;)V
    sget-object v6, Ln37;->a:Lre6;
    sget-object v6, Lv96;->a:Lv96;
    invoke-static {v6, v3}, Lhv0;->e(Lb45;Li49;)Lyhi;
    sget-object v3, Lnl/flitsmeister/fmcore/managers/speedcam/SpeedCamUpdateManager;->Companion:Lnl/flitsmeister/fmcore/managers/speedcam/SpeedCamUpdateManager${'$'}Companion;
    invoke-virtual {v3, p0}, Lig0;->getInstance(Landroid/content/Context;)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lnl/flitsmeister/fmcore/managers/speedcam/SpeedCamUpdateManager;
    invoke-virtual {v3}, Lnl/flitsmeister/fmcore/managers/speedcam/SpeedCamUpdateManager;->pauseUpdating()V
    sget v3, Lvug;->p:I
    if-lez v3, :cond_1
    move v3, v4
    goto :goto_1
    :cond_1
    move v3, v0
    :goto_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v7
    sget-wide v9, Lvug;->a:J
    sub-long/2addr v7, v9
    sget-wide v9, Lvug;->r:J
    cmp-long v11, v7, v9
    if-lez v11, :cond_2
    long-to-float v9, v9
    long-to-float v7, v7
    div-float/2addr v9, v7
    const/high16 v7, 0x42c80000    # 100.0f
    mul-float/2addr v9, v7
    float-to-int v7, v9
    goto :goto_2
    :cond_2
    move v7, v0
    :goto_2
    const-string v8, "focus_mode_end_app_session"
    new-instance v9, Lnl/flitsmeister/fmcore/data/model/StringParam;
    const-string v10, "opened"
    invoke-static {v3}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;
    move-result-object v3
    invoke-direct {v9, v10, v3}, Lnl/flitsmeister/fmcore/data/model/StringParam;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    new-instance v3, Lnl/flitsmeister/fmcore/data/model/StringParam;
    const-string v10, "openedPercentage"
    invoke-static {v7}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
    move-result-object v7
    invoke-direct {v3, v10, v7}, Lnl/flitsmeister/fmcore/data/model/StringParam;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    filled-new-array {v9, v3}, [Lnl/flitsmeister/fmcore/data/model/StringParam;
    move-result-object v3
    invoke-static {p0, v8, v3}, Lho;->c(Landroid/content/Context;Ljava/lang/String;[Lnl/flitsmeister/fmcore/data/model/StringParam;)V
    sget-boolean v3, Lvug;->f:Z
    if-eqz v3, :cond_3
    sget-object v3, Lsuh;->R0:Ltuh;
    invoke-virtual {v3, p0}, Ltuh;->c(Landroid/content/Context;)I
    move-result v7
    add-int/2addr v7, v4
    invoke-virtual {v3, v7, p0}, Ltuh;->k(ILandroid/content/Context;)V
    monitor-enter v2
    :try_start_1
    sget-object v3, Ldyj;->b:Lnl/flitsmeister/fmcore/models/data/tripdata/TripData;
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    invoke-virtual {v3}, Lnl/flitsmeister/fmcore/models/data/tripdata/TripData;->getTripCount()I
    move-result v8
    add-int/2addr v8, v4
    invoke-virtual {v3, v8}, Lnl/flitsmeister/fmcore/models/data/tripdata/TripData;->setTripCount(I)V
    sget-object v3, Ll1k;->a:Ll1k;
    invoke-virtual {v2, p0, v0}, Ldyj;->n(Landroid/content/Context;Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    monitor-exit v2
    invoke-virtual {v2, p0, v4}, Ldyj;->n(Landroid/content/Context;Z)V
    iput-boolean v0, p0, Lnl/flitsmeister/services/base/FlitsmeisterBaseService;->B1:Z
    invoke-virtual {p0}, Lnl/flitsmeister/services/base/FlitsmeisterBaseService;->a()Llob;
    move-result-object v2
    new-instance v3, Ljava/util/LinkedHashMap;
    invoke-direct {v3}, Ljava/util/LinkedHashMap;-><init>()V
    sget-object v8, Ll1k;->a:Ll1k;
    invoke-static {v3}, Lcob;->l(Ljava/util/Map;)Ljava/util/Map;
    move-result-object v3
    new-instance v8, Lfp7;
    const-string v9, "end_of_trip"
    invoke-direct {v8, v9, v3}, Lro;-><init>(Ljava/lang/String;Ljava/util/Map;)V
    iput-object v9, v8, Lfp7;->b:Ljava/lang/String;
    iput-object v3, v8, Lfp7;->c:Ljava/util/Map;
    invoke-interface {v2, v8}, Llob;->d(Lro;)V
    invoke-virtual {p0}, Lnl/flitsmeister/services/base/FlitsmeisterBaseService;->a()Llob;
    move-result-object v2
    const-string v3, "trip_count"
    invoke-static {v7}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
    move-result-object v7
    invoke-interface {v2, v7, v3}, Llob;->a(Ljava/lang/Object;Ljava/lang/String;)V
    goto :goto_3
    :catchall_0
    move-exception p0
    monitor-exit v2
    throw p0
    :cond_3
    :goto_3
    new-instance v2, Lnl/flitsmeister/services/base/FlitsmeisterBaseService${'$'}d;
    invoke-direct {v2, p0, v5}, Lnl/flitsmeister/services/base/FlitsmeisterBaseService${'$'}d;-><init>(Lnl/flitsmeister/services/base/FlitsmeisterBaseService;Lsn4;)V
    invoke-static {v6, v2}, Lhv0;->e(Lb45;Li49;)Lyhi;
    sput-boolean v0, Lnl/flitsmeister/services/car/BaseCarAppService;->x1:Z
    invoke-static {}, Lnl/flitsmeister/fmcore/models/eventbuses/AndroidAutoEventBus;->getBusAndroidAutoServiceActive()Las7;
    move-result-object v2
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
    invoke-virtual {v2, v3}, Las7;->a(Ljava/lang/Object;)V
    :try_start_2
    invoke-virtual {p0, v4}, Landroid/app/Service;->stopForeground(I)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    goto :goto_4
    :catch_1
    move-exception v2
    new-instance v3, Ljava/lang/StringBuilder;
    const-string v6, "Weird crash occured on OnePlus device: "
    invoke-direct {v3, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
    invoke-static {v2}, Lhha;->d(Ljava/lang/String;)V
    :goto_4
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;
    move-result-object v2
    const/4 v3, 0x2
    invoke-static {v3, v2}, Ltai;->a(ILandroid/content/Context;)V
    iget-object v2, p0, Lnl/flitsmeister/services/base/FlitsmeisterBaseService;->I:La41;
    if-eqz v2, :cond_1f
    iget-object v3, v2, Ly31;->a:Ljava/lang/Object;
    monitor-enter v3
    :try_start_3
    iget-object v6, v2, Ly31;->b:Ljava/util/Set;
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    check-cast v6, Ljava/lang/Iterable;
    invoke-interface {v6}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;
    move-result-object v6
    :goto_5
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z
    move-result v7
    if-eqz v7, :cond_4
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v7
    check-cast v7, Ldh8;
    invoke-virtual {v7}, Ldh8;->stop()V
    goto :goto_5
    :catchall_1
    move-exception p0
    goto/16 :goto_14
    :cond_4
    iget-object v2, v2, Ly31;->b:Ljava/util/Set;
    invoke-interface {v2}, Ljava/util/Set;->clear()V
    sget-object v2, Ll1k;->a:Ll1k;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1
    monitor-exit v3
    sget-object v2, Lqr7;->h:Lqr7${'$'}a;
    invoke-virtual {p0}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;
    move-result-object v3
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    invoke-virtual {v2, v3}, Lig0;->getInstance(Landroid/content/Context;)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lqr7;
    iget-boolean v3, v3, Lqr7;->g:Z
    if-eqz v3, :cond_5
    invoke-virtual {p0}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;
    move-result-object v3
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    invoke-virtual {v2, v3}, Lig0;->getInstance(Landroid/content/Context;)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lqr7;
    sget-object v3, Lnl/flitsmeister/models/enums/EtaStatusEnum;->CLOSED:Lnl/flitsmeister/models/enums/EtaStatusEnum;
    invoke-virtual {v2, v3}, Lqr7;->a(Lnl/flitsmeister/models/enums/EtaStatusEnum;)V
    :cond_5
    iget-object v2, p0, Lnl/flitsmeister/services/base/FlitsmeisterBaseService;->x:Lbja;
    if-eqz v2, :cond_1e
    iput-boolean v0, v2, Lyia;->c:Z
    iget-object v2, p0, Lnl/flitsmeister/services/base/FlitsmeisterBaseService;->y:Lkxi;
    if-eqz v2, :cond_1d
    sget-object v2, Lvxi;->a:Lwm4;
    sput-boolean v0, Lvxi;->d:Z
    sget-object v2, Lvxi;->a:Lwm4;
    if-eqz v2, :cond_6
    invoke-static {v2, v5}, Lr45;->b(Lq45;Ljava/util/concurrent/CancellationException;)V
    :cond_6
    sput-object v5, Lvxi;->a:Lwm4;
    sget-object v2, Lvxi;->b:Ljava/util/Set;
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    monitor-enter v2
    :try_start_4
    move-object v3, v2
    check-cast v3, Ljava/lang/Iterable;
    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;
    move-result-object v3
    :goto_6
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z
    move-result v6
    if-eqz v6, :cond_7
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v6
    check-cast v6, Lsa1;
    new-instance v7, Luxi;
    invoke-direct {v7, v6, v5}, Luxi;-><init>(Lsa1;Lsn4;)V
    sget-object v6, Ln37;->a:Lre6;
    sget-object v6, Laab;->a:Loi9;
    invoke-static {v6, v7}, Lhv0;->e(Lb45;Li49;)Lyhi;
    goto :goto_6
    :catchall_2
    move-exception p0
    goto/16 :goto_13
    :cond_7
    sget-object v3, Lvxi;->b:Ljava/util/Set;
    invoke-interface {v3}, Ljava/util/Set;->clear()V
    sget-object v3, Ll1k;->a:Ll1k;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2
    monitor-exit v2
    sget-object v2, Lvxi;->c:Lwni;
    invoke-virtual {v2}, Lwni;->c()V
    const-string v2, "[FlitsmeisterBaseService]"
    sget-object v3, Lhha;->a:Lhha;
    iget-boolean v6, p0, Lnl/flitsmeister/services/base/FlitsmeisterBaseService;->w1:Z
    if-nez v6, :cond_8
    const-string v6, "App event broadcast receiver was not registered, skipping unregister"
    invoke-interface {v3, v2, v6}, Ltu6;->a(Ljava/lang/String;Ljava/lang/String;)V
    goto :goto_7
    :cond_8
    const-string v6, "Unregistering app event broadcast receiver"
    invoke-interface {v3, v2, v6}, Ltu6;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_start_5
    iget-object v6, p0, Lnl/flitsmeister/services/base/FlitsmeisterBaseService;->v1:Lnl/flitsmeister/services/base/FlitsmeisterBaseService${'$'}AppEventBroadcastReceiver;
    invoke-virtual {p0, v6}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    iput-boolean v0, p0, Lnl/flitsmeister/services/base/FlitsmeisterBaseService;->w1:Z
    const-string v6, "Unregistered app event broadcast receiver successfully!"
    invoke-interface {v3, v2, v6}, Ltu6;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2
    goto :goto_7
    :catch_2
    move-exception v2
    const-string v3, "[FlitsmeisterBaseService] Failed to unregister app event broadcast receiver"
    invoke-static {}, Lhha;->c()Lorg/slf4j/Logger;
    move-result-object v6
    invoke-static {v6, v3, v2}, Lhha;->i(Lorg/slf4j/Logger;Ljava/lang/String;Ljava/lang/Throwable;)V
    iput-boolean v0, p0, Lnl/flitsmeister/services/base/FlitsmeisterBaseService;->w1:Z
    :goto_7
    sget-object v2, Levc;->e:Levc${'$'}a;
    invoke-virtual {v2, p0}, Lig0;->getInstance(Landroid/content/Context;)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Levc;
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_start_6
    iget-object v3, v2, Levc;->c:Lfti;
    invoke-virtual {v3}, Lfti;->getValue()Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Landroid/net/ConnectivityManager;
    if-eqz v3, :cond_9
    invoke-virtual {v3, v2}, Landroid/net/ConnectivityManager;->unregisterNetworkCallback(Landroid/net/ConnectivityManager${'$'}NetworkCallback;)V
    goto :goto_8
    :catch_3
    move-exception v2
    goto :goto_9
    :cond_9
    :goto_8
    iget-object v2, v2, Levc;->b:Ljava/util/HashSet;
    invoke-virtual {v2}, Ljava/util/HashSet;->clear()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_3
    goto :goto_a
    :goto_9
    const-string v3, "[NetworkStatusManager] Exception while unregistering connectivity monitor: "
    invoke-static {v3, v2}, Lfze;->a(Ljava/lang/String;Ljava/lang/Exception;)Ljava/lang/String;
    move-result-object v3
    invoke-static {}, Lhha;->c()Lorg/slf4j/Logger;
    move-result-object v6
    invoke-static {v6, v3, v2}, Lhha;->i(Lorg/slf4j/Logger;Ljava/lang/String;Ljava/lang/Throwable;)V
    :goto_a
    iget-boolean v2, p0, Lnl/flitsmeister/services/base/FlitsmeisterBaseService;->x1:Z
    if-nez v2, :cond_a
    const-string v2, "[FlitsmeisterBaseService]"
    const-string v3, "Bluetooth receiver was not registered, skipping unregister"
    const-string v6, " "
    invoke-static {v2, v6, v3}, Lpv1;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    invoke-static {}, Lhha;->c()Lorg/slf4j/Logger;
    move-result-object v3
    invoke-static {v3, v2}, Lhha;->j(Lorg/slf4j/Logger;Ljava/lang/String;)V
    goto :goto_b
    :cond_a
    :try_start_7
    iget-object v2, p0, Lnl/flitsmeister/services/base/FlitsmeisterBaseService;->A1:Lnl/flitsmeister/receivers/bluetooth/BluetoothAdapterStateReceiver;
    invoke-virtual {v2, p0}, Lnl/flitsmeister/receivers/bluetooth/BluetoothAdapterStateReceiver;->b(Landroid/app/Service;)V
    iput-boolean v0, p0, Lnl/flitsmeister/services/base/FlitsmeisterBaseService;->x1:Z
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_4
    goto :goto_b
    :catch_4
    move-exception v2
    const-string v3, "[FlitsmeisterBaseService] Failed to unregister bluetooth receiver"
    invoke-static {}, Lhha;->c()Lorg/slf4j/Logger;
    move-result-object v6
    invoke-static {v6, v3, v2}, Lhha;->i(Lorg/slf4j/Logger;Ljava/lang/String;Ljava/lang/Throwable;)V
    iput-boolean v0, p0, Lnl/flitsmeister/services/base/FlitsmeisterBaseService;->x1:Z
    :goto_b
    sget-object v2, Lhha;->a:Lhha;
    iget-boolean v3, p0, Lnl/flitsmeister/services/base/FlitsmeisterBaseService;->y1:Z
    if-nez v3, :cond_b
    const-string v3, "[FlitsmeisterBaseService]"
    const-string v6, "Battery receiver was not registered, skipping unregister"
    invoke-interface {v2, v3, v6}, Ltu6;->a(Ljava/lang/String;Ljava/lang/String;)V
    goto :goto_d
    :cond_b
    :try_start_8
    sget-boolean v3, Lnl/flitsmeister/receivers/powerconnection/PowerConnectionReceiver;->a:Z
    iget-object v3, p0, Lnl/flitsmeister/services/base/FlitsmeisterBaseService;->z1:Lnl/flitsmeister/receivers/powerconnection/PowerConnectionReceiver;
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    const-string v6, "PowerConnectionReceiver"
    const-string v7, "unregistering receiver..."
    invoke-interface {v2, v6, v7}, Ltu6;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_6
    :try_start_9
    invoke-virtual {p0, v3}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    const-string v3, "receiver unregistered successfully!"
    invoke-interface {v2, v6, v3}, Ltu6;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_5
    goto :goto_c
    :catch_5
    move-exception v2
    :try_start_a
    const-string v3, "[PowerConnectionReceiver] Exception while unregistering power connection receiver"
    invoke-static {}, Lhha;->c()Lorg/slf4j/Logger;
    move-result-object v6
    invoke-static {v6, v3, v2}, Lhha;->i(Lorg/slf4j/Logger;Ljava/lang/String;Ljava/lang/Throwable;)V
    :goto_c
    iput-boolean v0, p0, Lnl/flitsmeister/services/base/FlitsmeisterBaseService;->y1:Z
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_6
    goto :goto_d
    :catch_6
    move-exception v2
    const-string v3, "[FlitsmeisterBaseService] Failed to unregister battery receiver"
    invoke-static {}, Lhha;->c()Lorg/slf4j/Logger;
    move-result-object v6
    invoke-static {v6, v3, v2}, Lhha;->i(Lorg/slf4j/Logger;Ljava/lang/String;Ljava/lang/Throwable;)V
    iput-boolean v0, p0, Lnl/flitsmeister/services/base/FlitsmeisterBaseService;->y1:Z
    :goto_d
    iget-object v2, p0, Lnl/flitsmeister/services/base/FlitsmeisterBaseService;->X:Ly81;
    if-eqz v2, :cond_1c
    invoke-virtual {v2}, Ly81;->c()V
    sget-object v2, Ld86;->a:Ld86;
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    sget-object v2, Ld86;->f:Ld86${'$'}a;
    new-instance v3, Lc86;
    invoke-direct {v3, p0, v5}, Lc86;-><init>(Lnl/flitsmeister/services/base/FlitsmeisterBaseService;Lsn4;)V
    const/4 v6, 0x3
    invoke-static {v2, v5, v5, v3, v6}, Lbx1;->c(Lq45;Lb45;Lu45;Li49;I)Lyhi;
    iget-object v2, p0, Lnl/flitsmeister/services/base/FlitsmeisterBaseService;->Z:Lsii;
    if-eqz v2, :cond_1b
    iget-object v3, v2, Lsii;->d:Lq53;
    if-eqz v3, :cond_c
    sget-object v6, Lnl/flitsmeister/fmcore/data/enums/DestinationGroup;->Companion:Lnl/flitsmeister/fmcore/data/enums/DestinationGroup${'$'}Companion;
    iget-object v3, v3, Lq53;->b:Lnl/flitsmeister/fmcore/data/enums/DestinationGroup;
    invoke-virtual {v6, v3}, Lnl/flitsmeister/fmcore/data/enums/DestinationGroup${'$'}Companion;->toggleHomeAndWork(Lnl/flitsmeister/fmcore/data/enums/DestinationGroup;)Lnl/flitsmeister/fmcore/data/enums/DestinationGroup;
    move-result-object v3
    invoke-virtual {v3}, Lnl/flitsmeister/fmcore/data/enums/DestinationGroup;->getDatabaseEnum()I
    move-result v3
    new-instance v6, Llii;
    invoke-direct {v6, v2, v3, v5}, Llii;-><init>(Lsii;ILsn4;)V
    sget-object v2, Ln37;->a:Lre6;
    invoke-static {v2, v6}, Lhv0;->e(Lb45;Li49;)Lyhi;
    :cond_c
    sget-object v2, Lxc0;->B:Lnl/flitsmeister/fmcore/models/preferences/AppPreference;
    invoke-static {p0, v2}, Lxc0;->a(Landroid/content/Context;Lnl/flitsmeister/fmcore/models/preferences/AppPreference;)Ljava/lang/Boolean;
    move-result-object v2
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z
    move-result v2
    if-eqz v2, :cond_d
    invoke-virtual {p0, v0}, Lnl/flitsmeister/services/base/FlitsmeisterBaseService;->b(Z)V
    :cond_d
    invoke-static {}, Lnl/flitsmeister/fmcore/models/eventbuses/AppEventBus;->busGlobalEvent()Las7;
    move-result-object v2
    sget-object v3, Lnl/flitsmeister/fmcore/models/eventbuses/AppEventBus${'$'}GlobalAppEvent;->SERVICE_STOPPED:Lnl/flitsmeister/fmcore/models/eventbuses/AppEventBus${'$'}GlobalAppEvent;
    invoke-virtual {v2, v3}, Las7;->a(Ljava/lang/Object;)V
    sget v2, Lsc0;->a:I
    invoke-static {p0}, Lsc0;->n(Landroid/content/Context;)V
    sget-object v2, Lh0a;->o:Lh0a${'$'}a;
    invoke-virtual {v2, p0}, Lig0;->getInstance(Landroid/content/Context;)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lh0a;
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    const-string v3, "[IAP] stopping billingClient connection and removing handler callbacks"
    invoke-static {}, Lhha;->c()Lorg/slf4j/Logger;
    move-result-object v6
    if-eqz v6, :cond_e
    invoke-interface {v6, v3}, Lorg/slf4j/Logger;->info(Ljava/lang/String;)V
    :cond_e
    :try_start_b
    invoke-static {}, Lfb8;->a()Lfb8;
    move-result-object v6
    invoke-virtual {v6, v3}, Lfb8;->b(Ljava/lang/String;)V
    :try_end_b
    .catch Ljava/lang/IllegalStateException; {:try_start_b .. :try_end_b} :catch_7
    goto :goto_e
    :catch_7
    move-exception v3
    const-string v6, "Exception logging to firebase crashlytics"
    invoke-static {v6, v3}, Lhha;->g(Ljava/lang/String;Ljava/lang/Throwable;)V
    :goto_e
    iget-object v3, v2, Lh0a;->b:Lcom/android/billingclient/api/b;
    invoke-virtual {v3}, Lcom/android/billingclient/api/b;->c()V
    iget-object v3, v2, Lh0a;->i:Landroid/os/Handler;
    invoke-virtual {v3, v5}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V
    const-wide/16 v6, 0x64
    iput-wide v6, v2, Lh0a;->j:J
    iput v0, v2, Lh0a;->k:I
    iput v0, v2, Lh0a;->l:I
    iput v0, v2, Lh0a;->m:I
    const-string v2, "FM_SIMPLE_BLUE"
    sget-object v3, Lt28;->i1:Ltuh;
    invoke-virtual {v3, p0}, Ltuh;->e(Landroid/content/Context;)Ljava/lang/String;
    move-result-object v6
    if-nez v6, :cond_f
    move-object v6, v2
    :cond_f
    invoke-static {v6}, Lnl/flitsmeister/models/enums/AppIcon;->valueOf(Ljava/lang/String;)Lnl/flitsmeister/models/enums/AppIcon;
    move-result-object v6
    invoke-virtual {v6}, Lnl/flitsmeister/models/enums/AppIcon;->isProOnly()Z
    move-result v6
    if-eqz v6, :cond_11
    iget-object v6, p0, Lnl/flitsmeister/services/base/FlitsmeisterBaseService;->o1:Laqe;
    if-eqz v6, :cond_10
    invoke-interface {v6, p0}, Laqe;->b(Landroid/content/Context;)Z
    move-result v6
    if-nez v6, :cond_11
    invoke-virtual {v3, p0, v2}, Ltuh;->m(Landroid/content/Context;Ljava/lang/String;)Z
    sget-object v3, Lt28;->j1:Ltuh;
    invoke-virtual {v3, p0, v2}, Ltuh;->m(Landroid/content/Context;Ljava/lang/String;)Z
    goto :goto_f
    :cond_10
    const-string p0, "proStatusProvider"
    invoke-static {p0}, Lq9a;->k(Ljava/lang/String;)V
    throw v5
    :cond_11
    :goto_f
    sget-object v2, Lnjd;->a:Lnjd;
    invoke-virtual {v2, p0}, Lnjd;->b(Landroid/content/Context;)V
    sget-object v2, Lwd0;->f:Lwd0${'$'}a;
    invoke-virtual {v2, p0}, Lig0;->getInstance(Landroid/content/Context;)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lwd0;
    iget-object v3, v2, Lwd0;->b:Landroid/speech/tts/TextToSpeech;
    if-eqz v3, :cond_12
    invoke-virtual {v3, v5}, Landroid/speech/tts/TextToSpeech;->setOnUtteranceProgressListener(Landroid/speech/tts/UtteranceProgressListener;)I
    :cond_12
    iget-object v3, v2, Lwd0;->b:Landroid/speech/tts/TextToSpeech;
    if-eqz v3, :cond_13
    invoke-virtual {v3}, Landroid/speech/tts/TextToSpeech;->shutdown()V
    :cond_13
    iput-object v5, v2, Lwd0;->b:Landroid/speech/tts/TextToSpeech;
    iput-object v5, v2, Lwd0;->e:Lp50;
    iput-boolean v0, v2, Lwd0;->d:Z
    const-string v2, "[AUDIOMANAGER] Destroyed TTS instance"
    invoke-static {}, Lhha;->c()Lorg/slf4j/Logger;
    move-result-object v3
    if-eqz v3, :cond_14
    invoke-interface {v3, v2}, Lorg/slf4j/Logger;->info(Ljava/lang/String;)V
    :cond_14
    :try_start_c
    invoke-static {}, Lfb8;->a()Lfb8;
    move-result-object v3
    invoke-virtual {v3, v2}, Lfb8;->b(Ljava/lang/String;)V
    :try_end_c
    .catch Ljava/lang/IllegalStateException; {:try_start_c .. :try_end_c} :catch_8
    goto :goto_10
    :catch_8
    move-exception v2
    const-string v3, "Exception logging to firebase crashlytics"
    invoke-static {v3, v2}, Lhha;->g(Ljava/lang/String;Ljava/lang/Throwable;)V
    :goto_10
    sget-object v2, Lt28;->j1:Ltuh;
    invoke-virtual {v2, p0}, Ltuh;->g(Landroid/content/Context;)Z
    move-result v3
    if-eqz v3, :cond_16
    invoke-virtual {v2, p0}, Ltuh;->e(Landroid/content/Context;)Ljava/lang/String;
    move-result-object v3
    if-nez v3, :cond_15
    const-string v3, "FM_SIMPLE_BLUE"
    :cond_15
    invoke-static {v3}, Lnl/flitsmeister/models/enums/AppIcon;->valueOf(Ljava/lang/String;)Lnl/flitsmeister/models/enums/AppIcon;
    move-result-object v3
    invoke-virtual {v2, p0}, Ltuh;->h(Landroid/content/Context;)V
    invoke-virtual {v3, p0}, Lnl/flitsmeister/models/enums/AppIcon;->setAsApplicationIcon(Landroid/content/Context;)V
    :cond_16
    invoke-static {}, Lnl/flitsmeister/fmcore/models/eventbuses/AppNotificationBus;->getBusNotificationEvent()Las7;
    move-result-object v2
    invoke-virtual {v2, v5}, Las7;->a(Ljava/lang/Object;)V
    sget-object v2, Lnl/flitsmeister/route_guidance/logger/RouteGuidanceLogger;->Companion:Lnl/flitsmeister/route_guidance/logger/RouteGuidanceLogger${'$'}Companion;
    invoke-virtual {v2, v5}, Lnl/flitsmeister/route_guidance/logger/RouteGuidanceLogger${'$'}Companion;->setLoggerInstance(Lnl/flitsmeister/route_guidance/logger/RouteGuidanceLogger;)V
    new-instance v2, Lnl/flitsmeister/services/base/FlitsmeisterBaseService${'$'}e;
    invoke-direct {v2, p0, v5}, Lnl/flitsmeister/services/base/FlitsmeisterBaseService${'$'}e;-><init>(Lnl/flitsmeister/services/base/FlitsmeisterBaseService;Lsn4;)V
    sget-object v3, Ln37;->a:Lre6;
    sget-object v3, Laab;->a:Loi9;
    invoke-static {v3, v2}, Lhv0;->e(Lb45;Li49;)Lyhi;
    const-string v2, "[FMRouteRequestManager] sendCancelRouteRequest"
    invoke-static {}, Lhha;->c()Lorg/slf4j/Logger;
    move-result-object v3
    if-eqz v3, :cond_17
    invoke-interface {v3, v2}, Lorg/slf4j/Logger;->info(Ljava/lang/String;)V
    :cond_17
    :try_start_d
    invoke-static {}, Lfb8;->a()Lfb8;
    move-result-object v3
    invoke-virtual {v3, v2}, Lfb8;->b(Ljava/lang/String;)V
    :try_end_d
    .catch Ljava/lang/IllegalStateException; {:try_start_d .. :try_end_d} :catch_9
    goto :goto_11
    :catch_9
    move-exception v2
    const-string v3, "Exception logging to firebase crashlytics"
    invoke-static {v3, v2}, Lhha;->g(Ljava/lang/String;Ljava/lang/Throwable;)V
    :goto_11
    invoke-static {}, Llp0;->c()Lff4;
    move-result-object v2
    invoke-interface {v2, p0}, Lff4;->r(Landroid/content/Context;)Lu61;
    move-result-object v2
    iget-object v2, v2, Lu61;->c:Lbemobile/cits/sdk/core/service/CITSService;
    invoke-virtual {v2}, Lbemobile/cits/sdk/core/service/CITSService;->getRouteRequestManager()Lbemobile/cits/sdk/core/manager/CITSRouteRequestManager;
    move-result-object v2
    invoke-static {v2, v5, v4, v5}, Lbemobile/cits/sdk/core/manager/CITSRouteRequestManager;->sendCancelRouteRequest${'$'}default(Lbemobile/cits/sdk/core/manager/CITSRouteRequestManager;Ljava/lang/String;ILjava/lang/Object;)V
    sput-boolean v0, Lvug;->b:Z
    sput-boolean v0, Lvug;->f:Z
    sput-boolean v0, Lvug;->g:Z
    invoke-static {}, Lnl/flitsmeister/fmcore/models/eventbuses/NightmodeBus;->getBusNightmodeActive()Las7;
    move-result-object v2
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
    invoke-virtual {v2, v3}, Las7;->a(Ljava/lang/Object;)V
    sget-object v2, Lnl/flitsmeister/fmcore/models/eventbuses/DarkThemeFlow;->INSTANCE:Lnl/flitsmeister/fmcore/models/eventbuses/DarkThemeFlow;
    invoke-virtual {v2, v0}, Lnl/flitsmeister/fmcore/models/eventbuses/DarkThemeFlow;->update(Z)V
    sget-object v2, Lvug;->h:Ljava/util/LinkedHashMap;
    invoke-virtual {v2}, Ljava/util/LinkedHashMap;->clear()V
    sget-object v2, Lvug;->i:Ljava/util/LinkedHashMap;
    invoke-virtual {v2}, Ljava/util/LinkedHashMap;->clear()V
    sget-object v2, Lvug;->j:Ljava/util/LinkedHashMap;
    invoke-virtual {v2}, Ljava/util/LinkedHashMap;->clear()V
    sget-object v2, Lvug;->k:Ljava/util/HashSet;
    invoke-virtual {v2}, Ljava/util/HashSet;->clear()V
    sget-object v2, Lvug;->l:Ljava/util/ArrayList;
    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V
    sput-boolean v0, Lvug;->m:Z
    sput-boolean v0, Lvug;->n:Z
    sget-object v2, Lnl/flitsmeister/fmcore/models/enums/DriveState;->UNKNOWN:Lnl/flitsmeister/fmcore/models/enums/DriveState;
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    sput-object v2, Lvug;->e:Lnl/flitsmeister/fmcore/models/enums/DriveState;
    invoke-virtual {v2}, Lnl/flitsmeister/fmcore/models/enums/DriveState;->isDrivingOrHasDriven()Z
    move-result v2
    if-eqz v2, :cond_18
    sput-boolean v4, Lvug;->f:Z
    :cond_18
    sget-object v2, Lvug;->o:Ljava/util/HashSet;
    invoke-virtual {v2}, Ljava/util/HashSet;->clear()V
    sput v0, Lvug;->p:I
    const-wide/16 v2, 0x0
    sput-wide v2, Lvug;->q:J
    sput-wide v2, Lvug;->r:J
    sget-object v2, Lhff;->e:Liji;
    invoke-static {}, Lhff;->a()V
    sput-object v5, Lnza;->b:Landroid/location/Location;
    sput-object v5, Lnza;->h:Ljava/lang/Float;
    sput-object v5, Lnza;->i:Ljava/lang/Float;
    sput-object v5, Lnza;->g:Lp99;
    sput-object v5, Lnza;->d:Lvia;
    const-wide/16 v6, -0x1
    sput-wide v6, Lnza;->c:J
    sget-object v3, Lnza;->e:Landroid/location/Location;
    if-nez v3, :cond_19
    sput-object v5, Lnza;->e:Landroid/location/Location;
    :cond_19
    sput-boolean v0, Lhff;->a:Z
    sput-object v5, Lhff;->b:Lnl/flitsmeister/fmcore/data/model/reports/AvgSpeedCheck;
    sput-object v5, Lhff;->d:Lnl/flitsmeister/fmcore/data/model/reports/Incident;
    invoke-static {}, Lhff;->a()V
    sget-object v0, Lbr5;->c:Ljava/util/Set;
    invoke-static {v4}, Lbr5${'$'}a;->a(Z)V
    invoke-virtual {p0}, Lnl/flitsmeister/services/base/FlitsmeisterBaseService;->a()Llob;
    move-result-object v0
    invoke-interface {v0, v4}, Llob;->f(Z)V
    invoke-interface {v0, v4}, Llob;->c(Z)V
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V
    iget-object p0, p0, Lnl/flitsmeister/services/base/FlitsmeisterBaseService;->u1:Lyoi;
    invoke-virtual {p0, v5}, Lmca;->cancel(Ljava/util/concurrent/CancellationException;)V
    const-string p0, "[FlitsmeisterBaseService] Service stopped"
    invoke-static {}, Lhha;->c()Lorg/slf4j/Logger;
    move-result-object v0
    if-eqz v0, :cond_1a
    invoke-interface {v0, p0}, Lorg/slf4j/Logger;->info(Ljava/lang/String;)V
    :cond_1a
    :try_start_e
    invoke-static {}, Lfb8;->a()Lfb8;
    move-result-object v0
    invoke-virtual {v0, p0}, Lfb8;->b(Ljava/lang/String;)V
    :try_end_e
    .catch Ljava/lang/IllegalStateException; {:try_start_e .. :try_end_e} :catch_a
    goto :goto_12
    :catch_a
    move-exception p0
    const-string v0, "Exception logging to firebase crashlytics"
    invoke-static {v0, p0}, Lhha;->g(Ljava/lang/String;Ljava/lang/Throwable;)V
    :goto_12
    return-void
    :cond_1b
    const-string p0, "startNavigationAutomaticallyUseCase"
    invoke-static {p0}, Lq9a;->k(Ljava/lang/String;)V
    throw v5
    :cond_1c
    const-string p0, "baseReportDataManager"
    invoke-static {p0}, Lq9a;->k(Ljava/lang/String;)V
    throw v5
    :goto_13
    monitor-exit v2
    throw p0
    :cond_1d
    const-string p0, "taskManager"
    invoke-static {p0}, Lq9a;->k(Ljava/lang/String;)V
    throw v5
    :cond_1e
    const-string p0, "launchManagerImpl"
    invoke-static {p0}, Lq9a;->k(Ljava/lang/String;)V
    throw v5
    :goto_14
    monitor-exit v3
    throw p0
    :cond_1f
    const-string p0, "backgroundServiceManagerImpl"
    invoke-static {p0}, Lq9a;->k(Ljava/lang/String;)V
    throw v5
""".trimIndent()
