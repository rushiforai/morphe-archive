.class public final Lay;
.super Lcom/opera/android/Lazy;
.source "SourceFile"


# instance fields
.field public final synthetic e:B

.field public final synthetic f:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lcom/opera/android/crashhandler/MainProcessCrashHandler;Lcom/opera/android/OperaApplication;)V
    .registers 3

    const/4 p1, 0x7

    iput-byte p1, p0, Lay;->e:B

    iput-object p2, p0, Lay;->f:Ljava/lang/Object;

    invoke-direct {p0}, Lcom/opera/android/Lazy;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 9
    iput-byte p2, p0, Lay;->e:B

    iput-object p1, p0, Lay;->f:Ljava/lang/Object;

    invoke-direct {p0}, Lcom/opera/android/Lazy;-><init>()V

    return-void
.end method


# virtual methods
.method public final d()Ljava/lang/Object;
    .registers 50

    move-object/from16 v0, p0

    iget-byte v1, v0, Lay;->e:B

    const/4 v2, 0x2

    const/4 v7, 0x0

    const/4 v8, 0x1

    iget-object v0, v0, Lay;->f:Ljava/lang/Object;

    packed-switch v1, :pswitch_data_3a6

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    check-cast v0, Lcom/opera/android/weather/ui/WeatherWidgetActivity;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    new-instance v1, Lsk6;

    iget-object v2, v0, Lcom/opera/android/OperaApplication;->A:Lj4c;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Llpe;

    iget-object v2, v2, Llpe;->c:Lcq5;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v0

    invoke-direct {v1, v2, v0}, Lsk6;-><init>(Lcq5;Lcom/opera/android/settings/SettingsManager;)V

    return-object v1

    :pswitch_2a
    new-instance v1, Lkze;

    check-cast v0, Lqln;

    invoke-virtual {v0}, Lqln;->j()Ljava/util/ArrayList;

    move-result-object v0

    invoke-direct {v1, v0}, Lekc;-><init>(Ljava/lang/Object;)V

    return-object v1

    :pswitch_36
    check-cast v0, Lmvh;

    iget-object v0, v0, Lmvh;->b:Ljava/lang/Object;

    check-cast v0, Lz7;

    iget-object v1, v0, Lz7;->d:Ljava/lang/String;

    if-eqz v1, :cond_4d

    const-string v2, "; charset=UTF-8"

    invoke-virtual {v1, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lesd;->e:Lkotlin/text/Regex;

    :try_start_48
    invoke-static {v1}, Lwyh;->x(Ljava/lang/String;)Lesd;

    move-result-object v6
    :try_end_4c
    .catch Ljava/lang/IllegalArgumentException; {:try_start_48 .. :try_end_4c} :catch_4d

    goto :goto_4e

    :catch_4d
    :cond_4d
    const/4 v6, 0x0

    :goto_4e
    invoke-virtual {v0}, Lz7;->a()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v6}, Lrvh;->create(Ljava/lang/String;Lesd;)Lrvh;

    move-result-object v0

    return-object v0

    :pswitch_57
    invoke-static {}, Lcom/google/android/gms/common/GoogleApiAvailability;->getInstance()Lcom/google/android/gms/common/GoogleApiAvailability;

    move-result-object v1

    check-cast v0, Ljtg;

    iget-object v0, v0, Ljtg;->a:Landroid/content/Context;

    invoke-virtual {v1, v0}, Lcom/google/android/gms/common/GoogleApiAvailability;->isGooglePlayServicesAvailable(Landroid/content/Context;)I

    move-result v0

    if-nez v0, :cond_66

    move v7, v8

    :cond_66
    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_6b
    check-cast v0, Ldyf;

    iget-object v0, v0, Ldyf;->a:Landroid/content/Context;

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    new-instance v2, Lp0c;

    sget-object v3, Lbqe;->k:Lcqe;

    invoke-static {v0}, Luup;->r(Landroid/content/Context;)Lbqe;

    move-result-object v0

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v1

    invoke-direct {v2, v0, v1}, Lp0c;-><init>(Lbqe;Lcom/opera/android/settings/SettingsManager;)V

    return-object v2

    :pswitch_87
    new-instance v1, Ljava/util/ArrayList;

    const/16 v2, 0xc8

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    :try_start_8e
    check-cast v0, Lukf;

    invoke-virtual {v0, v1}, Lukf;->a(Ljava/util/ArrayList;)V
    :try_end_93
    .catch Ljava/io/IOException; {:try_start_8e .. :try_end_93} :catch_94

    goto :goto_97

    :catch_94
    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    :goto_97
    return-object v1

    :pswitch_98
    check-cast v0, Lgbf;

    iget-object v1, v0, Lgbf;->r:Lpt3;

    new-instance v11, Lfbf;

    invoke-direct {v11, v0}, Lfbf;-><init>(Lgbf;)V

    iget-object v9, v1, Lpt3;->b:Lcom/opera/android/BrowserActivity;

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v9}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    new-instance v7, Lzqi;

    iget-object v8, v9, Lcom/opera/android/BrowserActivity;->x:Lumi;

    const v1, 0x7f0a0360

    invoke-virtual {v9, v1}, Lfp1;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v10, v1

    check-cast v10, Landroid/view/ViewGroup;

    const v1, 0x7f0a0b01

    invoke-virtual {v9, v1}, Lfp1;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/search/SuggestionsContainer;

    iget-object v12, v9, Lcom/opera/android/BrowserActivity;->w1:Lj4c;

    invoke-virtual {v9}, Lcom/opera/android/BrowserActivity;->H0()Lcom/opera/android/settings/SettingsManager;

    move-result-object v13

    iget-object v1, v9, Lcom/opera/android/BrowserActivity;->y:Ltw3;

    iget-object v2, v1, Ltw3;->a:Lhx3;

    iget-object v14, v2, Lhx3;->l:Lfx3;

    invoke-virtual {v14}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Liv7;

    iget-object v15, v9, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-nez v15, :cond_de

    const/4 v15, 0x0

    :cond_de
    invoke-virtual {v9}, Lcom/opera/android/BrowserActivity;->L0()Lipk;

    move-result-object v16

    iget-object v6, v1, Ltw3;->y0:Lzv3;

    invoke-virtual {v6}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lwcd;

    const-string v3, "clipboard"

    invoke-virtual {v9, v3}, Lt5d;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/ClipboardManager;

    iget-object v4, v1, Ltw3;->F:Lhw3;

    invoke-virtual {v4}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lmbf;

    iget-object v4, v4, Lmbf;->e:Lpde;

    new-instance v5, Lwt3;

    move-object/from16 p0, v3

    const/16 v3, 0x15

    invoke-direct {v5, v9, v3}, Lwt3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    iget-object v3, v9, Ldx3;->o:Lqim;

    invoke-static {v3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-object/from16 v21, v3

    iget-object v3, v9, Lcom/opera/android/BrowserActivity;->B1:Lzyk;

    invoke-virtual {v3}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v3

    move-object/from16 v22, v3

    check-cast v22, Lyz9;

    invoke-virtual {v9}, Ldx3;->M()Llg;

    move-result-object v23

    iget-object v3, v9, Lcom/opera/android/BrowserActivity;->Y:Lm6m;

    move-object/from16 v24, v3

    iget-object v3, v9, Lcom/opera/android/BrowserActivity;->O:Ls28;

    move-object/from16 v25, v3

    iget-object v3, v9, Lcom/opera/android/BrowserActivity;->M:Lgbf;

    if-nez v3, :cond_127

    const/4 v3, 0x0

    :cond_127
    move-object/from16 v26, v4

    iget-object v4, v3, Lgbf;->A:Lode;

    invoke-virtual {v4}, Lekc;->g()Ljava/lang/Object;

    move-result-object v27

    if-nez v27, :cond_13a

    iget-object v3, v3, Lgbf;->b:Lz43;

    invoke-virtual {v3}, Lz43;->a()Ljm7;

    move-result-object v3

    invoke-virtual {v4, v3}, Lekc;->r(Ljava/lang/Object;)V

    :cond_13a
    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v3

    move-object/from16 v27, v4

    iget-object v4, v0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v3, v3, Ld6j;->c:Lx5f;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v0

    iget-object v0, v0, Ld6j;->d:Lx5f;

    move-object/from16 v29, v0

    iget-object v0, v9, Lcom/opera/android/BrowserActivity;->M:Lgbf;

    if-nez v0, :cond_153

    const/4 v0, 0x0

    :cond_153
    iget-object v0, v0, Lgbf;->m:Ldbf;

    move-object/from16 v17, v0

    iget-object v0, v4, Lxv1;->A0:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    move-object/from16 v30, v0

    check-cast v30, Lqdh;

    iget-object v0, v4, Lxv1;->h0:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    move-object/from16 v31, v0

    check-cast v31, Lbr6;

    invoke-virtual/range {v28 .. v28}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v0

    iget-object v0, v0, Ld6j;->f:Losf;

    invoke-virtual/range {v28 .. v28}, Lcom/opera/android/OperaApplication;->G()Lmdh;

    move-result-object v33

    invoke-virtual/range {v28 .. v28}, Lcom/opera/android/OperaApplication;->g()Li53;

    move-result-object v34

    invoke-virtual/range {v28 .. v28}, Lcom/opera/android/OperaApplication;->o()Lnr8;

    move-result-object v35

    const-class v4, Lqr8;

    move-object/from16 v32, v0

    iget-object v0, v9, Lcom/opera/android/BrowserActivity;->g0:Lwub;

    invoke-virtual {v0, v4}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object v0

    move-object/from16 v36, v0

    check-cast v36, Lqr8;

    invoke-virtual {v2}, Lhx3;->m()Lcom/opera/android/Lazy;

    move-result-object v0

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    move-object/from16 v37, v0

    check-cast v37, Lnv2;

    invoke-virtual {v9}, Lcom/opera/android/BrowserActivity;->P0()Lgjm;

    move-result-object v38

    new-instance v0, Lnwf;

    new-instance v4, Lhv3;

    invoke-direct {v4, v9}, Lhv3;-><init>(Lcom/opera/android/BrowserActivity;)V

    move-object/from16 v28, v3

    new-instance v3, Lpt3;

    move-object/from16 v39, v5

    const/16 v5, 0xd

    invoke-direct {v3, v9, v5}, Lpt3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    const/4 v5, 0x3

    invoke-direct {v0, v4, v3, v5}, Lnwf;-><init>(Lhv3;Ljava/lang/Object;B)V

    iget-object v3, v1, Ltw3;->F0:Lzv3;

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v3

    move-object/from16 v40, v3

    check-cast v40, Lm0a;

    iget-object v3, v1, Ltw3;->t0:Lhw3;

    iget-object v4, v1, Ltw3;->s0:Lj4c;

    invoke-virtual {v4}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v4

    move-object/from16 v42, v4

    check-cast v42, Lky1;

    iget-object v4, v9, Lcom/opera/android/BrowserActivity;->F0:Ljv3;

    new-instance v5, Lx77;

    move-object/from16 v19, v0

    iget-object v0, v9, Ldx3;->o:Lqim;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-object/from16 v41, v3

    new-instance v3, Leme;

    invoke-direct {v3, v9}, Leme;-><init>(Lcom/opera/android/BrowserActivity;)V

    move-object/from16 v43, v4

    const/16 v4, 0x9

    invoke-direct {v5, v0, v3, v4}, Lx77;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v0, v9, Lcom/opera/android/BrowserActivity;->E0:Ljv3;

    iget-object v3, v1, Ltw3;->A0:Lzv3;

    iget-object v2, v2, Lhx3;->q:Lfx3;

    iget-object v1, v1, Ltw3;->H0:Lhw3;

    move-object/from16 v18, p0

    move-object/from16 v45, v0

    move-object/from16 v48, v1

    move-object/from16 v47, v2

    move-object/from16 v46, v3

    move-object/from16 v44, v5

    move-object/from16 v20, v39

    move-object/from16 v39, v19

    move-object/from16 v19, v26

    move-object/from16 v26, v27

    move-object/from16 v27, v28

    move-object/from16 v28, v29

    move-object/from16 v29, v17

    move-object/from16 v17, v6

    invoke-direct/range {v7 .. v48}, Lzqi;-><init>(Lumi;Lxd5;Landroid/view/ViewGroup;Lfbf;Lj4c;Lcom/opera/android/settings/SettingsManager;Liv7;Lk6l;Lipk;Lwcd;Landroid/content/ClipboardManager;Lpde;Lwt3;Lqim;Lyz9;Llg;Lm6m;Ls28;Lode;Lx5f;Lx5f;Ldbf;Lqdh;Lbr6;Losf;Lmdh;Li53;Lnr8;Lqr8;Lnv2;Lgjm;Lnwf;Lm0a;Lhw3;Lky1;Ljv3;Lx77;Ljv3;Lzv3;Lcom/opera/android/Lazy;Lhw3;)V

    return-object v7

    :pswitch_208
    new-instance v1, Lpz5;

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v0

    invoke-direct {v1, v0}, Lpz5;-><init>(Ljava/io/File;)V

    new-instance v2, Ljava/io/File;

    const-string v3, "crash_dumps"

    invoke-direct {v2, v0, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_225

    sget-object v3, Ls29;->a:Ljava/util/HashSet;

    invoke-virtual {v2}, Ljava/io/File;->mkdir()Z

    :cond_225
    new-instance v2, Ljava/io/File;

    const-string v3, "Crashpad"

    invoke-direct {v2, v0, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_237

    sget-object v0, Ls29;->a:Ljava/util/HashSet;

    invoke-virtual {v2}, Ljava/io/File;->mkdir()Z

    :cond_237
    return-object v1

    :pswitch_238
    new-instance v3, Lvo7;

    check-cast v0, Lcom/opera/android/esim/ui/EsimActivity;

    new-instance v4, Lv68;

    invoke-direct {v4, v0, v7}, Lv68;-><init>(Lcom/opera/android/esim/ui/EsimActivity;B)V

    new-instance v5, Lv68;

    invoke-direct {v5, v0, v8}, Lv68;-><init>(Lcom/opera/android/esim/ui/EsimActivity;B)V

    new-instance v6, Lu68;

    invoke-direct {v6, v0, v8}, Lu68;-><init>(Lcom/opera/android/esim/ui/EsimActivity;B)V

    new-instance v7, Lyqa;

    new-instance v1, Lv68;

    invoke-direct {v1, v0, v2}, Lv68;-><init>(Lcom/opera/android/esim/ui/EsimActivity;B)V

    new-instance v2, Lv68;

    const/4 v8, 0x3

    invoke-direct {v2, v0, v8}, Lv68;-><init>(Lcom/opera/android/esim/ui/EsimActivity;B)V

    const/16 v8, 0xd

    invoke-direct {v7, v1, v2, v8}, Lyqa;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v8, Lkw3;

    const/16 v1, 0x8

    invoke-direct {v8, v1}, Lkw3;-><init>(B)V

    new-instance v9, Lqq6;

    new-instance v1, Lv68;

    const/4 v2, 0x4

    invoke-direct {v1, v0, v2}, Lv68;-><init>(Lcom/opera/android/esim/ui/EsimActivity;B)V

    const/4 v2, 0x7

    invoke-direct {v9, v1, v2}, Lqq6;-><init>(Ljava/lang/Object;B)V

    new-instance v10, Lv68;

    const/4 v1, 0x5

    invoke-direct {v10, v0, v1}, Lv68;-><init>(Lcom/opera/android/esim/ui/EsimActivity;B)V

    invoke-direct/range {v3 .. v10}, Lvo7;-><init>(Lesk;Lesk;Lkotlin/jvm/functions/Function1;Lyqa;Lesk;Lqq6;Lesk;)V

    invoke-virtual {v0}, Lxd5;->getLifecycle()Ltcc;

    move-result-object v0

    invoke-virtual {v0, v3}, Ltcc;->a(Lmdc;)V

    return-object v3

    :pswitch_281
    :try_start_281
    check-cast v0, Lk8;

    iget-object v0, v0, Lk8;->a:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    const-class v1, Lqyf;

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-static {v0, v7, v1}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
    :try_end_292
    .catch Ljava/lang/ClassNotFoundException; {:try_start_281 .. :try_end_292} :catch_293

    goto :goto_295

    :catch_293
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    :goto_295
    return-object v0

    :pswitch_296
    check-cast v0, Lgc7;

    iget-object v0, v0, Lgc7;->a:Landroid/content/Context;

    :try_start_29a
    invoke-virtual {v0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    new-instance v1, Ljava/io/InputStreamReader;

    const-string v2, "distribution"

    invoke-virtual {v0, v2}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    const/16 v0, 0x100

    new-array v0, v0, [C

    invoke-virtual {v1, v0}, Ljava/io/Reader;->read([C)I

    move-result v2

    invoke-virtual {v1}, Ljava/io/InputStreamReader;->close()V

    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, v0, v7, v2}, Ljava/lang/String;-><init>([CII)V

    const-string v0, ":"

    invoke-virtual {v1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lfc7;

    aget-object v2, v0, v7

    aget-object v0, v0, v8

    invoke-direct {v1, v2, v0}, Lfc7;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2c8
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_29a .. :try_end_2c8} :catch_2d2
    .catch Ljava/io/IOException; {:try_start_29a .. :try_end_2c8} :catch_2c9

    goto :goto_2da

    :catch_2c9
    new-instance v0, Lfc7;

    const-string v1, "IOException"

    invoke-direct {v0, v1, v1}, Lfc7;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    :goto_2d0
    move-object v1, v0

    goto :goto_2da

    :catch_2d2
    new-instance v0, Lfc7;

    const-string v1, "ArrayIndexOutOfBoundsException"

    invoke-direct {v0, v1, v1}, Lfc7;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2d0

    :goto_2da
    return-object v1

    :pswitch_2db
    check-cast v0, Lx65;

    iget-object v1, v0, Lx65;->d:Lr65;

    iget-boolean v0, v0, Lx65;->m:Z

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lp65;

    invoke-direct {v2, v0, v1}, Lp65;-><init>(ZLr65;)V

    return-object v2

    :pswitch_2ea
    new-instance v1, Lgjm;

    check-cast v0, Ld5o;

    iget-object v0, v0, Ld5o;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;

    invoke-virtual {v0}, Landroidx/fragment/app/r;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object v3

    invoke-virtual {v0}, Lxd5;->getLifecycle()Ltcc;

    move-result-object v0

    new-instance v4, Lf32;

    const/16 v5, 0x9

    invoke-direct {v4, v5}, Lf32;-><init>(B)V

    invoke-direct {v1, v3, v0, v4}, Lgjm;-><init>(Landroidx/fragment/app/w;Ltcc;Lkotlin/jvm/functions/Function1;)V

    new-instance v0, Lfj;

    invoke-direct {v0, v2}, Lfj;-><init>(B)V

    filled-new-array {v0}, [Lfj;

    move-result-object v0

    invoke-static {v0, v8}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    array-length v2, v0

    if-lez v2, :cond_319

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    goto :goto_31b

    :cond_319
    sget-object v0, Ll08;->a:Ll08;

    :goto_31b
    check-cast v0, Ljava/util/Collection;

    iget-object v2, v1, Lgjm;->d:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    return-object v1

    :pswitch_323
    new-instance v1, Locd;

    check-cast v0, Lwy;

    iget-object v0, v0, Lwy;->n:Lb59;

    invoke-direct {v1, v0}, Locd;-><init>(Lb59;)V

    return-object v1

    :pswitch_32d
    check-cast v0, Lcy;

    iget-object v1, v0, Lcy;->c:Ljava/lang/Object;

    check-cast v1, Ltw2;

    iget-object v1, v1, Ltw2;->b:Ljava/lang/Object;

    check-cast v1, Lwy;

    invoke-virtual {v1}, Lwy;->T()Z

    move-result v1

    if-eqz v1, :cond_344

    new-instance v0, Lml;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lml;-><init>(Ljava/lang/String;)V

    goto :goto_3a5

    :cond_344
    iget-object v1, v0, Lcy;->d:Ljava/lang/Object;

    check-cast v1, Lb59;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/SharedPreferences;

    const-string v2, "controller_config_timestamp"

    const-wide/16 v3, 0x0

    invoke-interface {v1, v2, v3, v4}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v5

    cmp-long v2, v5, v3

    if-lez v2, :cond_370

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    const-wide/32 v7, 0x4d3f6400

    add-long/2addr v5, v7

    cmp-long v2, v2, v5

    if-lez v2, :cond_370

    invoke-static {v1}, Lcy;->a(Landroid/content/SharedPreferences;)V

    new-instance v0, Lml;

    const/4 v2, 0x0

    invoke-direct {v0, v2}, Lml;-><init>(Ljava/lang/String;)V

    goto :goto_3a5

    :cond_370
    const/4 v2, 0x0

    const-string v3, "controller_config_url"

    invoke-interface {v1, v3, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_39b

    iget-object v2, v0, Lcy;->f:Ljava/lang/Object;

    check-cast v2, Lsy;

    invoke-virtual {v2}, Lsy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lr9i;

    iget-object v2, v2, Lr9i;->b:Ljava/lang/Object;

    check-cast v2, Landroid/net/Uri;

    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_39b

    invoke-static {v1}, Lcy;->a(Landroid/content/SharedPreferences;)V

    new-instance v0, Lml;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lml;-><init>(Ljava/lang/String;)V

    goto :goto_3a5

    :cond_39b
    new-instance v1, Lml;

    invoke-virtual {v0}, Lcy;->b()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lml;-><init>(Ljava/lang/String;)V

    move-object v0, v1

    :goto_3a5
    return-object v0

    :pswitch_data_3a6
    .packed-switch 0x0
        :pswitch_32d
        :pswitch_323
        :pswitch_2ea
        :pswitch_2db
        :pswitch_296
        :pswitch_281
        :pswitch_238
        :pswitch_208
        :pswitch_98
        :pswitch_87
        :pswitch_6b
        :pswitch_57
        :pswitch_36
        :pswitch_2a
    .end packed-switch
.end method
