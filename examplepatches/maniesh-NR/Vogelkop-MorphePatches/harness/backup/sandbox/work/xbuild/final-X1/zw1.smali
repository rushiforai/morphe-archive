.class public final Lzw1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Las6;


# instance fields
.field public final a:Lhjf;

.field public final b:Lcom/opera/android/settings/SettingsManager;

.field public final c:Lr65;

.field public final d:Lcq5;

.field public final e:Lnx5;

.field public final f:Lb59;

.field public g:Ls9;


# direct methods
.method public constructor <init>(Lhjf;Lcom/opera/android/settings/SettingsManager;Lr65;Lcq5;Lnx5;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lzw1;->a:Lhjf;

    iput-object p2, p0, Lzw1;->b:Lcom/opera/android/settings/SettingsManager;

    iput-object p3, p0, Lzw1;->c:Lr65;

    iput-object p4, p0, Lzw1;->d:Lcq5;

    iput-object p5, p0, Lzw1;->e:Lnx5;

    sget-object p2, Lvml;->d:Lumi;

    const/4 p3, 0x0

    new-array p4, p3, [Lbg1;

    const-string p5, "appsflyer"

    invoke-static {p1, p2, p5, p4}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object p4

    iput-object p4, p0, Lzw1;->f:Lb59;

    invoke-virtual {p1}, Lxd5;->getLifecycle()Ltcc;

    move-result-object p4

    invoke-virtual {p4, p0}, Ltcc;->a(Lmdc;)V

    const-string p0, "appsflyer-data"

    new-array p3, p3, [Lbg1;

    invoke-static {p1, p2, p0, p3}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    return-void
.end method


# virtual methods
.method public final W(Lndc;)V
    .registers 4

    const-string p1, "eula_accepted.gdpr"

    iget-object v0, p0, Lzw1;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v0, p1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_e

    invoke-virtual {p0}, Lzw1;->a()V

    return-void

    :cond_e
    new-instance p1, Ls9;

    const/4 v1, 0x3

    invoke-direct {p1, p0, v1}, Ls9;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, p1}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    iput-object p1, p0, Lzw1;->g:Ls9;

    return-void
.end method

.method public final a()V
    .registers 20

    move-object/from16 v0, p0

    iget-object v1, v0, Lzw1;->b:Lcom/opera/android/settings/SettingsManager;

    const-string v2, "ga_usage_statistics"

    invoke-virtual {v1, v2}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_2d9

    iget-object v3, v0, Lzw1;->a:Lhjf;

    iget-object v1, v0, Lzw1;->f:Lb59;

    iget-object v5, v0, Lzw1;->c:Lr65;

    iget-object v6, v0, Lzw1;->b:Lcom/opera/android/settings/SettingsManager;

    iget-object v4, v0, Lzw1;->d:Lcq5;

    iget-object v7, v0, Lzw1;->e:Lnx5;

    const-string v8, ""

    sget-boolean v9, Lxw1;->a:Z

    if-nez v9, :cond_2d9

    invoke-virtual {v3}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v11

    iget-object v9, v5, Lr65;->b:Lvx;

    invoke-virtual {v9}, Lvx;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ld75;

    iget-boolean v9, v9, Ld75;->i:Z

    if-eqz v9, :cond_3a

    invoke-virtual {v6}, Lcom/opera/android/settings/SettingsManager;->G()Z

    move-result v9

    if-nez v9, :cond_3a

    invoke-static {v11}, Li0l;->h(Landroid/content/Context;)Lcom/opera/android/Lazy;

    move-result-object v9

    goto :goto_3b

    :cond_3a
    move-object v9, v2

    :goto_3b
    sget-object v10, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v11}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v10

    move-object/from16 v16, v10

    check-cast v16, Lcom/opera/android/OperaApplication;

    new-instance v15, Ll45;

    invoke-virtual/range {v16 .. v16}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v10

    iget-object v10, v10, Ld6j;->d:Lx5f;

    invoke-direct {v15}, Ljava/lang/Object;-><init>()V

    iput-object v10, v15, Ll45;->a:Ljava/lang/Object;

    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    iput-object v10, v15, Ll45;->b:Ljava/lang/Object;

    new-instance v10, Ls3;

    const/16 v12, 0x8

    invoke-direct {v10, v15, v4, v2, v12}, Ls3;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    const/4 v4, 0x3

    invoke-static {v7, v2, v2, v10, v4}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    sget-object v4, Lxw1;->b:Lvzk;

    new-instance v10, Lnw1;

    invoke-virtual/range {v16 .. v16}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v7

    iget-object v12, v7, Ld6j;->d:Lx5f;

    invoke-virtual/range {v16 .. v16}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v7

    iget-object v13, v7, Ld6j;->c:Lx5f;

    invoke-static {v11}, Lxnh;->t(Landroid/content/Context;)Lxnh;

    move-result-object v14

    invoke-direct/range {v10 .. v15}, Lnw1;-><init>(Landroid/content/Context;Lx5f;Lx5f;Lxnh;Ll45;)V

    iget-object v7, v4, Lvzk;->b:Ljava/lang/Object;

    check-cast v7, Li7f;

    invoke-virtual {v7, v10}, Li7f;->b(Ljava/lang/Object;)Z

    iget-object v7, v4, Lvzk;->c:Ljava/lang/Object;

    monitor-enter v7

    :try_start_85
    iget-object v12, v4, Lvzk;->d:Ljava/lang/Object;

    check-cast v12, Lpw1;

    monitor-exit v7
    :try_end_8a
    .catchall {:try_start_85 .. :try_end_8a} :catchall_2d7

    if-eqz v12, :cond_8f

    invoke-virtual {v10, v12}, Lnw1;->a(Lpw1;)V

    :cond_8f
    invoke-static {}, Lcom/appsflyer/AppsFlyerLib;->getInstance()Lcom/appsflyer/AppsFlyerLib;

    move-result-object v7

    const-string v10, "USD"

    invoke-virtual {v7, v10}, Lcom/appsflyer/AppsFlyerLib;->setCurrencyCode(Ljava/lang/String;)V

    invoke-static {}, Lcom/appsflyer/AppsFlyerLib;->getInstance()Lcom/appsflyer/AppsFlyerLib;

    move-result-object v7

    const/4 v10, 0x0

    invoke-virtual {v7, v10}, Lcom/appsflyer/AppsFlyerLib;->setCollectIMEI(Z)V

    invoke-static {}, Lcom/appsflyer/AppsFlyerLib;->getInstance()Lcom/appsflyer/AppsFlyerLib;

    move-result-object v7

    invoke-virtual {v7, v10}, Lcom/appsflyer/AppsFlyerLib;->setCollectAndroidID(Z)V

    invoke-static {}, Lcom/appsflyer/AppsFlyerLib;->getInstance()Lcom/appsflyer/AppsFlyerLib;

    move-result-object v7

    invoke-virtual {v7, v10}, Lcom/appsflyer/AppsFlyerLib;->setCollectOaid(Z)V

    invoke-static {}, Lcom/appsflyer/AppsFlyerLib;->getInstance()Lcom/appsflyer/AppsFlyerLib;

    move-result-object v7

    const/4 v12, 0x1

    invoke-virtual {v7, v12}, Lcom/appsflyer/AppsFlyerLib;->setDisableNetworkData(Z)V

    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v7

    const-string v13, "disableLogs"

    invoke-virtual {v7, v13, v12}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;Z)V

    invoke-virtual {v11}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    check-cast v7, Lcom/opera/android/OperaApplication;

    invoke-virtual {v7}, Lcom/opera/android/OperaApplication;->q()Le59;

    move-result-object v7

    sget-object v13, Ld59;->a:Ld59;

    invoke-virtual {v7, v13, v12}, Le59;->c(Ld59;Z)V

    invoke-virtual {v11}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    check-cast v7, Lcom/opera/android/OperaApplication;

    invoke-virtual {v7}, Lcom/opera/android/OperaApplication;->l()Lgc7;

    move-result-object v7

    invoke-virtual {v7}, Lgc7;->a()Ljava/lang/String;

    move-result-object v7

    const-string v13, "amazon"

    invoke-virtual {v13, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_ef

    invoke-static {}, Lcom/appsflyer/AppsFlyerLib;->getInstance()Lcom/appsflyer/AppsFlyerLib;

    move-result-object v7

    const-string v13, "OFA_AMAZON_STORE"

    invoke-virtual {v7, v13, v2, v2}, Lcom/appsflyer/AppsFlyerLib;->setPreinstallAttribution(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_192

    :cond_ef
    const-string v13, "oem_ofa_xiaomi_store"

    invoke-virtual {v13, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_102

    invoke-static {}, Lcom/appsflyer/AppsFlyerLib;->getInstance()Lcom/appsflyer/AppsFlyerLib;

    move-result-object v7

    const-string v13, "OFA_XIAOMI_STORE"

    invoke-virtual {v7, v13, v2, v2}, Lcom/appsflyer/AppsFlyerLib;->setPreinstallAttribution(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_192

    :cond_102
    const-string v13, "samsungappstore"

    invoke-virtual {v13, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_115

    invoke-static {}, Lcom/appsflyer/AppsFlyerLib;->getInstance()Lcom/appsflyer/AppsFlyerLib;

    move-result-object v7

    const-string v13, "OFA_SAMSUNG_STORE"

    invoke-virtual {v7, v13, v2, v2}, Lcom/appsflyer/AppsFlyerLib;->setPreinstallAttribution(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_192

    :cond_115
    const-string v13, "oem_Huawei_appgallery"

    invoke-virtual {v13, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_127

    invoke-static {}, Lcom/appsflyer/AppsFlyerLib;->getInstance()Lcom/appsflyer/AppsFlyerLib;

    move-result-object v7

    const-string v13, "ofa_huawei_store"

    invoke-virtual {v7, v13}, Lcom/appsflyer/AppsFlyerLib;->setOutOfStore(Ljava/lang/String;)V

    goto :goto_192

    :cond_127
    const-string v13, "oem_ofa_honor_store"

    invoke-virtual {v13, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_139

    invoke-static {}, Lcom/appsflyer/AppsFlyerLib;->getInstance()Lcom/appsflyer/AppsFlyerLib;

    move-result-object v7

    const-string v13, "OFA_HONOR_STORE"

    invoke-virtual {v7, v13, v2, v2}, Lcom/appsflyer/AppsFlyerLib;->setPreinstallAttribution(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_192

    :cond_139
    const-string v13, "oem_ofa_xiaomi_offline"

    invoke-virtual {v13, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_14b

    invoke-static {}, Lcom/appsflyer/AppsFlyerLib;->getInstance()Lcom/appsflyer/AppsFlyerLib;

    move-result-object v7

    const-string v13, "XIAOMI_PRELOAD_EU"

    invoke-virtual {v7, v13, v2, v2}, Lcom/appsflyer/AppsFlyerLib;->setPreinstallAttribution(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_192

    :cond_14b
    const-string v13, "oem_ofa_sliide_offline"

    invoke-virtual {v13, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_15d

    invoke-static {}, Lcom/appsflyer/AppsFlyerLib;->getInstance()Lcom/appsflyer/AppsFlyerLib;

    move-result-object v7

    const-string v13, "OFA_SLIIDE_PRELOAD"

    invoke-virtual {v7, v13, v2, v2}, Lcom/appsflyer/AppsFlyerLib;->setPreinstallAttribution(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_192

    :cond_15d
    const-string v13, "oem_ofa_lenovo_offline"

    invoke-virtual {v13, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_16f

    invoke-static {}, Lcom/appsflyer/AppsFlyerLib;->getInstance()Lcom/appsflyer/AppsFlyerLib;

    move-result-object v7

    const-string v13, "OFA_LENOVO_PRELOAD"

    invoke-virtual {v7, v13, v2, v2}, Lcom/appsflyer/AppsFlyerLib;->setPreinstallAttribution(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_192

    :cond_16f
    const-string v13, "oem_ofa_transsion_onlinestore_af"

    invoke-virtual {v13, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_181

    invoke-static {}, Lcom/appsflyer/AppsFlyerLib;->getInstance()Lcom/appsflyer/AppsFlyerLib;

    move-result-object v7

    const-string v13, "ofa_transsion_onlinestore"

    invoke-virtual {v7, v13, v2, v2}, Lcom/appsflyer/AppsFlyerLib;->setPreinstallAttribution(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_192

    :cond_181
    const-string v13, "oem_ofa_transsion_store"

    invoke-virtual {v13, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_192

    invoke-static {}, Lcom/appsflyer/AppsFlyerLib;->getInstance()Lcom/appsflyer/AppsFlyerLib;

    move-result-object v7

    const-string v13, "ofa_transsion_store"

    invoke-virtual {v7, v13, v2, v2}, Lcom/appsflyer/AppsFlyerLib;->setPreinstallAttribution(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :cond_192
    :goto_192
    invoke-static {v11}, Le3j;->t(Landroid/content/Context;)Le3j;

    move-result-object v7

    invoke-virtual {v7}, Lno7;->i()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ld3j;

    const/16 v13, 0x12

    invoke-virtual {v7, v13, v10}, Ld3j;->d(IZ)Lc3j;

    move-result-object v7

    if-eqz v7, :cond_1af

    invoke-static {}, Lcom/appsflyer/AppsFlyerLib;->getInstance()Lcom/appsflyer/AppsFlyerLib;

    move-result-object v13

    iget-object v7, v7, Lc3j;->d:Ljava/lang/Comparable;

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v13, v8, v7}, Lcom/appsflyer/AppsFlyerLib;->setHost(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1af
    invoke-static {}, Lcom/appsflyer/AppsFlyerLib;->getInstance()Lcom/appsflyer/AppsFlyerLib;

    move-result-object v7

    const-string v13, "aWV5TF2eQmEbHYUWbhuGNP"

    new-instance v14, Lmw1;

    invoke-virtual {v11}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v17

    check-cast v17, Lcom/opera/android/OperaApplication;

    move/from16 v18, v12

    invoke-virtual/range {v17 .. v17}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v12

    iget-object v12, v12, Ld6j;->d:Lx5f;

    invoke-direct {v14, v4, v12, v15}, Lmw1;-><init>(Lvzk;Lx5f;Ll45;)V

    invoke-virtual {v7, v13, v14, v11}, Lcom/appsflyer/AppsFlyerLib;->init(Ljava/lang/String;Lcom/appsflyer/AppsFlyerConversionListener;Landroid/content/Context;)Lcom/appsflyer/AppsFlyerLib;

    invoke-static {}, Lcom/appsflyer/AppsFlyerLib;->getInstance()Lcom/appsflyer/AppsFlyerLib;

    move-result-object v4

    invoke-virtual {v4, v11}, Lcom/appsflyer/AppsFlyerLib;->getAppsFlyerUID(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_1dd

    sget-object v7, Ltw1;->c:Ltw1;

    const-string v12, ""

    invoke-virtual {v15, v7, v12}, Ll45;->M(Ltw1;Ljava/lang/String;)V

    goto :goto_1ea

    :cond_1dd
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_1ea

    sget-object v7, Ltw1;->d:Ltw1;

    const-string v12, ""

    invoke-virtual {v15, v7, v12}, Ll45;->M(Ltw1;Ljava/lang/String;)V

    :cond_1ea
    :goto_1ea
    invoke-virtual/range {v16 .. v16}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v7

    iget-object v7, v7, Ld6j;->d:Lx5f;

    if-eqz v4, :cond_1f3

    move-object v8, v4

    :cond_1f3
    iget-object v4, v7, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v12

    new-instance v13, Lck0;

    invoke-direct {v13, v4, v12}, Lck0;-><init>(Lzpa;Lx56;)V

    iget-object v4, v13, Lck0;->c:Lzyk;

    invoke-virtual {v4}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lxf0;

    iget-object v4, v4, Lxf0;->a:Ltf0;

    const/4 v13, 0x5

    invoke-virtual {v4, v13, v8}, Ltf0;->x(ILjava/lang/String;)V

    invoke-virtual {v7, v12}, Lx5f;->U0(Lx56;)V

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/SharedPreferences;

    const-string v4, "start_count"

    invoke-interface {v1, v4, v10}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v7

    const-string v8, "last_version"

    invoke-interface {v1, v8, v10}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v12

    const v13, 0x71de74d2

    if-eq v12, v13, :cond_246

    invoke-static {v1, v8, v13}, Lcom/appsflyer/internal/j;->b(Landroid/content/SharedPreferences;Ljava/lang/String;I)V

    if-lez v7, :cond_246

    const-string v7, "af_content_id"

    invoke-virtual {v11}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v8

    const-wide/16 v12, 0x0

    invoke-static {v11, v8, v12, v13}, Lr9n;->u(Landroid/content/Context;Ljava/lang/String;J)Landroid/content/pm/PackageInfo;

    move-result-object v8

    iget-object v8, v8, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    invoke-static {v7, v8}, Ljava/util/Collections;->singletonMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v7

    invoke-static {}, Lcom/appsflyer/AppsFlyerLib;->getInstance()Lcom/appsflyer/AppsFlyerLib;

    move-result-object v8

    const-string v12, "af_update"

    invoke-virtual {v8, v11, v12, v7}, Lcom/appsflyer/AppsFlyerLib;->logEvent(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;)V

    :cond_246
    invoke-interface {v1, v4, v10}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v7

    const/4 v8, 0x4

    if-ge v7, v8, :cond_25d

    add-int/lit8 v7, v7, 0x1

    invoke-static {v1, v4, v7}, Lcom/appsflyer/internal/j;->b(Landroid/content/SharedPreferences;Ljava/lang/String;I)V

    if-lt v7, v8, :cond_25d

    invoke-static {}, Lcom/appsflyer/AppsFlyerLib;->getInstance()Lcom/appsflyer/AppsFlyerLib;

    move-result-object v1

    const-string v4, "User"

    invoke-virtual {v1, v11, v4, v2}, Lcom/appsflyer/AppsFlyerLib;->logEvent(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;)V

    :cond_25d
    invoke-static {}, Lcom/appsflyer/AppsFlyerLib;->getInstance()Lcom/appsflyer/AppsFlyerLib;

    move-result-object v1

    new-instance v4, Lb8f;

    invoke-direct {v4, v11}, Lb8f;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v4}, Lcom/appsflyer/AppsFlyerLib;->subscribeForDeepLink(Lcom/appsflyer/deeplink/DeepLinkListener;)V

    sput-boolean v18, Lxw1;->a:Z

    const-string v1, "huawei"

    sget-object v4, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_27c

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v4, v7}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v4

    goto :goto_27e

    :cond_27c
    const-string v4, "unknown"

    :goto_27e
    invoke-virtual {v4, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_2ce

    invoke-virtual {v11}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    check-cast v4, Lcom/opera/android/OperaApplication;

    invoke-virtual {v4}, Lcom/opera/android/OperaApplication;->l()Lgc7;

    move-result-object v4

    invoke-virtual {v4}, Lgc7;->a()Ljava/lang/String;

    move-result-object v4

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v4, v7}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2ce

    move-object v4, v3

    new-instance v3, Lvw1;

    const/4 v10, 0x0

    move-object v7, v6

    move-object v8, v9

    move-object v9, v15

    move-object v6, v5

    move-object v5, v11

    invoke-direct/range {v3 .. v10}, Lvw1;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    move-object v1, v3

    move-object v3, v4

    move-object v4, v5

    move-object v5, v6

    move-object v6, v7

    move-object v7, v8

    new-instance v8, Lg6f;

    invoke-direct {v8, v4, v1}, Lg6f;-><init>(Landroid/content/Context;Lvw1;)V

    new-instance v1, Landroid/content/Intent;

    const-string v9, "com.uodis.opendevice.OPENIDS_SERVICE"

    invoke-direct {v1, v9}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v9, "com.huawei.hwid"

    invoke-virtual {v1, v9}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    move/from16 v9, v18

    invoke-virtual {v4, v1, v8, v9}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    move-result v1

    if-nez v1, :cond_2d9

    move-object v8, v15

    invoke-static/range {v3 .. v8}, Lxw1;->a(Lhjf;Landroid/content/Context;Lr65;Lcom/opera/android/settings/SettingsManager;Lcom/opera/android/Lazy;Ll45;)V

    goto :goto_2d9

    :cond_2ce
    move-object v7, v9

    move-object v4, v11

    move-object v8, v15

    invoke-static/range {v3 .. v8}, Lxw1;->a(Lhjf;Landroid/content/Context;Lr65;Lcom/opera/android/settings/SettingsManager;Lcom/opera/android/Lazy;Ll45;)V

    goto :goto_2d9

    :goto_2d5
    :try_start_2d5
    monitor-exit v7
    :try_end_2d6
    .catchall {:try_start_2d5 .. :try_end_2d6} :catchall_2d7

    throw v0

    :catchall_2d7
    move-exception v0

    goto :goto_2d5

    :cond_2d9
    :goto_2d9
    iget-object v1, v0, Lzw1;->g:Ls9;

    if-eqz v1, :cond_2e4

    iget-object v3, v0, Lzw1;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v3, v1}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    iput-object v2, v0, Lzw1;->g:Ls9;

    :cond_2e4
    iget-object v1, v0, Lzw1;->a:Lhjf;

    invoke-virtual {v1}, Lxd5;->getLifecycle()Ltcc;

    move-result-object v1

    invoke-virtual {v1, v0}, Ltcc;->b(Lmdc;)V

    return-void
.end method

.method public final onDestroy(Lndc;)V
    .registers 3

    iget-object p1, p0, Lzw1;->g:Ls9;

    if-eqz p1, :cond_c

    iget-object v0, p0, Lzw1;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v0, p1}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lzw1;->g:Ls9;

    :cond_c
    iget-object p1, p0, Lzw1;->a:Lhjf;

    invoke-virtual {p1}, Lxd5;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    return-void
.end method
