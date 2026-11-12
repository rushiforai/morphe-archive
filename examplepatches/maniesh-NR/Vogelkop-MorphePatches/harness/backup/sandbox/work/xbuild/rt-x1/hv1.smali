.class public final synthetic Lhv1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lxv1;


# direct methods
.method public synthetic constructor <init>(Lxv1;B)V
    .registers 3

    iput-byte p2, p0, Lhv1;->a:B

    iput-object p1, p0, Lhv1;->b:Lxv1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 31

    move-object/from16 v0, p0

    iget-byte v1, v0, Lhv1;->a:B

    const/16 v2, 0xb

    const/4 v3, 0x4

    const/4 v4, 0x6

    const/4 v5, 0x0

    const/16 v6, 0xa

    const/4 v7, 0x3

    const/4 v8, 0x7

    const/4 v9, 0x2

    const/4 v10, 0x5

    const/4 v11, 0x1

    const/4 v12, 0x0

    iget-object v0, v0, Lhv1;->b:Lxv1;

    packed-switch v1, :pswitch_data_498

    new-instance v1, Lmgh;

    new-instance v2, Lhv1;

    const/16 v3, 0x19

    invoke-direct {v2, v0, v3}, Lhv1;-><init>(Lxv1;B)V

    sget-object v3, Lxne;->b:Lii;

    invoke-direct {v1, v2, v3, v10}, Lmgh;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v13, Lydn;

    iget-object v3, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-virtual {v3}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v15

    sget-object v16, Lvml;->d:Lumi;

    invoke-virtual {v3}, Lcom/opera/android/OperaApplication;->b()Ldb;

    move-result-object v18

    iget-object v2, v3, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v2, v2, Lxv1;->O:Lj4c;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    move-object/from16 v19, v2

    check-cast v19, Lzv9;

    invoke-static {v3}, Lufn;->t(Landroid/content/Context;)Lufn;

    move-result-object v20

    invoke-static {v3}, Ltvg;->t(Landroid/content/Context;)Ltvg;

    move-result-object v21

    iget-object v0, v0, Lxv1;->t0:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    move-object/from16 v22, v0

    check-cast v22, Ljtg;

    new-instance v2, Lli;

    const-class v4, Lcom/opera/android/OperaApplication;

    const-string v5, "usageReporter"

    const-string v6, "getUsageReporter()Lcom/opera/android/analytics/UsageReporter;"

    const/4 v7, 0x0

    const/16 v8, 0x8

    invoke-direct/range {v2 .. v8}, Lli;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance v0, Lwv1;

    invoke-direct {v0, v2, v12}, Lwv1;-><init>(Lb6h;B)V

    sget-object v2, Lvml;->e:Lwjh;

    iget-object v2, v2, Lwjh;->d:Ljava/lang/Object;

    move-object/from16 v24, v2

    check-cast v24, Ljg8;

    move-object/from16 v23, v0

    move-object/from16 v17, v1

    move-object v14, v3

    invoke-direct/range {v13 .. v24}, Lydn;-><init>(Landroid/content/Context;Lcom/opera/android/settings/SettingsManager;Lumi;Lmgh;Ldb;Lzv9;Lufn;Ltvg;Ljtg;Lwv1;Ljg8;)V

    return-object v13

    :pswitch_74
    iget-object v0, v0, Lxv1;->H0:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ly3i;

    invoke-interface {v0}, Ly3i;->l()Lhfk;

    move-result-object v0

    return-object v0

    :pswitch_81
    iget-object v0, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :pswitch_88
    iget-object v0, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const-wide/16 v2, 0x0

    invoke-static {v0, v1, v2, v3}, Lr9n;->u(Landroid/content/Context;Ljava/lang/String;J)Landroid/content/pm/PackageInfo;

    move-result-object v0

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    return-object v0

    :pswitch_97
    iget-object v0, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-static {v0}, Le3j;->t(Landroid/content/Context;)Le3j;

    move-result-object v0

    invoke-virtual {v0}, Lno7;->i()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ld3j;

    invoke-virtual {v0, v6, v11}, Ld3j;->d(IZ)Lc3j;

    move-result-object v0

    new-instance v1, Ldnk;

    if-eqz v0, :cond_b0

    iget-object v2, v0, Lc3j;->d:Ljava/lang/Comparable;

    check-cast v2, Ljava/lang/String;

    goto :goto_b2

    :cond_b0
    const-string v2, "subscriptions.opera.com"

    :goto_b2
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "https://"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/"

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    if-eqz v0, :cond_d0

    iget-object v0, v0, Lqsh;->b:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    goto :goto_d2

    :cond_d0
    const-string v0, ""

    :goto_d2
    invoke-direct {v1, v2, v0}, Ldnk;-><init>(Landroid/net/Uri;Ljava/lang/String;)V

    return-object v1

    :pswitch_d6
    new-instance v1, Lyf;

    invoke-direct {v1, v9, v5, v0}, Lyf;-><init>(BLmt5;Ljava/lang/Object;)V

    sget-object v0, Lkotlin/coroutines/h;->a:Lkotlin/coroutines/h;

    invoke-static {v0, v1}, Lscd;->g0(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lh1a;

    return-object v0

    :pswitch_e4
    new-instance v1, Lsv1;

    invoke-direct {v1, v0}, Lsv1;-><init>(Lxv1;)V

    return-object v1

    :pswitch_ea
    new-instance v1, Lvu2;

    iget-object v0, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v0

    iget-object v0, v0, Ld6j;->c:Lx5f;

    invoke-direct {v1, v0}, Lvu2;-><init>(Lx5f;)V

    return-object v1

    :pswitch_f8
    iget-object v0, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    sget-object v1, Lvml;->d:Lumi;

    invoke-static {}, Locp;->k()Z

    const-string v2, "opera_osp_local_attributes"

    new-array v5, v12, [Lbg1;

    invoke-static {v0, v1, v2, v5}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object v2

    sget-object v5, Lh11;->j:Lh11;

    new-instance v5, Lx5f;

    invoke-direct {v5, v0, v2, v1}, Lx5f;-><init>(Landroid/content/Context;Lb59;Lumi;)V

    sget-object v2, Laxh;->j:Laxh;

    new-instance v2, Lhd;

    invoke-direct {v2, v0, v1, v8}, Lhd;-><init>(Landroid/content/Context;Lumi;B)V

    new-instance v6, Lcom/opera/android/requests/OspExtension;

    sget-object v8, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v8

    check-cast v8, Lcom/opera/android/OperaApplication;

    invoke-virtual {v8}, Lcom/opera/android/OperaApplication;->R()Lydn;

    move-result-object v8

    invoke-direct {v6, v2, v8}, Lcom/opera/android/requests/OspExtension;-><init>(Lhd;Lydn;)V

    sget-object v6, Ltc3;->j:Ltc3;

    new-instance v6, Losf;

    invoke-direct {v6, v0, v1}, Losf;-><init>(Landroid/content/Context;Lumi;)V

    sget-object v8, Lcef;->j:Lcef;

    new-instance v8, Lwsf;

    invoke-direct {v8, v0, v1}, Lwsf;-><init>(Landroid/content/Context;Lumi;)V

    sget-object v13, Lbe7;->j:Lbe7;

    new-instance v13, Lhd;

    invoke-direct {v13, v0, v1, v4}, Lhd;-><init>(Landroid/content/Context;Lumi;B)V

    move-object/from16 v21, v13

    new-instance v13, Ld6j;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v14

    new-instance v15, Lqfb;

    new-array v0, v10, [Lubk;

    aput-object v5, v0, v12

    aput-object v2, v0, v11

    aput-object v6, v0, v9

    aput-object v8, v0, v7

    aput-object v21, v0, v3

    const/16 v1, 0xd

    invoke-direct {v15, v0, v1}, Lqfb;-><init>(Ljava/lang/Object;B)V

    move-object/from16 v17, v5

    move-object/from16 v18, v2

    move-object/from16 v16, v5

    move-object/from16 v19, v6

    move-object/from16 v20, v8

    invoke-direct/range {v13 .. v21}, Ld6j;-><init>(Lcom/opera/android/settings/SettingsManager;Lqfb;Lx5f;Lx5f;Lhd;Losf;Lwsf;Lhd;)V

    return-object v13

    :pswitch_16a
    new-instance v1, Lu8k;

    iget-object v2, v0, Lxv1;->P0:Lj4c;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/opera/android/settings/SettingsManager;

    iget-object v0, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-static {v0}, Lru9;->c(Landroid/content/Context;)Lru9;

    sget-object v3, Lk7k;->l:Lio7;

    sget-object v4, Lk7k;->n:La3j;

    invoke-static {v0, v3, v4}, Lno7;->n(Landroid/content/Context;Lio7;Llo7;)Lno7;

    move-result-object v3

    check-cast v3, Lk7k;

    invoke-static {v0}, Lv1;->u(Landroid/content/Context;)Lv1;

    move-result-object v0

    invoke-direct {v1, v2, v3, v0}, Lu8k;-><init>(Lcom/opera/android/settings/SettingsManager;Lk7k;Lv1;)V

    return-object v1

    :pswitch_18b
    iget-object v0, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    const-class v1, Luup;

    monitor-enter v1

    :try_start_190
    sget-object v2, Luup;->a:Lz4k;

    if-nez v2, :cond_1a8

    new-instance v2, Lh61;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    if-eqz v3, :cond_19d

    move-object v0, v3

    :cond_19d
    invoke-direct {v2, v0, v12}, Lh61;-><init>(Landroid/content/Context;Z)V

    new-instance v0, Lz4k;

    invoke-direct {v0, v2}, Lz4k;-><init>(Lh61;)V

    sput-object v0, Luup;->a:Lz4k;
    :try_end_1a7
    .catchall {:try_start_190 .. :try_end_1a7} :catchall_1b6

    move-object v2, v0

    :cond_1a8
    monitor-exit v1

    iget-object v0, v2, Lz4k;->b:Ljava/lang/Object;

    check-cast v0, Ljrp;

    invoke-interface {v0}, Ljrp;->zza()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lr0k;

    return-object v0

    :goto_1b4
    :try_start_1b4
    monitor-exit v1
    :try_end_1b5
    .catchall {:try_start_1b4 .. :try_end_1b5} :catchall_1b6

    throw v0

    :catchall_1b6
    move-exception v0

    goto :goto_1b4

    :pswitch_1b8
    new-instance v1, Lzzj;

    iget-object v0, v0, Lxv1;->R0:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lvnj;

    invoke-direct {v1, v0}, Lzzj;-><init>(Lvnj;)V

    return-object v1

    :pswitch_1c6
    new-instance v1, Llzj;

    iget-object v2, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    iget-object v0, v0, Lxv1;->P0:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/opera/android/settings/SettingsManager;

    invoke-direct {v1, v2, v0}, Llzj;-><init>(Landroid/content/Context;Lcom/opera/android/settings/SettingsManager;)V

    return-object v1

    :pswitch_1d6
    new-instance v1, Leoj;

    sget-object v2, Lvml;->d:Lumi;

    iget-object v0, v0, Lxv1;->d1:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, La5l;

    invoke-direct {v1, v2, v0}, Leoj;-><init>(Lumi;La5l;)V

    return-object v1

    :pswitch_1e6
    new-instance v1, Lvnj;

    iget-object v0, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    sget-object v2, Lvml;->d:Lumi;

    invoke-direct {v1, v0, v2}, Lvnj;-><init>(Landroid/content/Context;Lumi;)V

    return-object v1

    :pswitch_1f0
    new-instance v1, Lzcj;

    iget-object v0, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    sget-object v2, Lvml;->d:Lumi;

    invoke-direct {v1, v0, v2}, Lzcj;-><init>(Landroid/content/Context;Lumi;)V

    return-object v1

    :pswitch_1fa
    iget-object v0, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    iget-object v1, v0, Lcom/opera/android/OperaApplication;->n:Lorg/chromium/base/CommandLine;

    if-eqz v1, :cond_201

    move-object v5, v1

    :cond_201
    sget-object v1, Lvml;->d:Lumi;

    new-instance v2, Lwf2;

    invoke-direct {v2, v0}, Lwf2;-><init>(Landroid/content/Context;)V

    invoke-static {}, Locp;->k()Z

    move-result v3

    if-eqz v3, :cond_214

    new-instance v3, Ls14;

    invoke-direct {v3, v0, v2}, Ls14;-><init>(Landroid/content/Context;Lwf2;)V

    move-object v2, v3

    :cond_214
    new-instance v3, Lcom/opera/android/settings/SettingsManager;

    invoke-direct {v3, v2, v0, v5, v1}, Lcom/opera/android/settings/SettingsManager;-><init>(Ly9j;Landroid/content/Context;Lorg/chromium/base/CommandLine;Lumi;)V

    return-object v3

    :pswitch_21a
    iget-object v12, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    sget-object v13, Lvml;->d:Lumi;

    iget-object v1, v0, Lxv1;->i:Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v14, v1

    check-cast v14, Lnx5;

    sget-object v15, Lvml;->e:Lwjh;

    new-instance v1, Luu1;

    invoke-direct {v1, v10}, Luu1;-><init>(B)V

    iget-object v0, v0, Lxv1;->i0:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Llpe;

    iget-object v2, v2, Llpe;->c:Lcq5;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Llpe;

    iget-object v3, v3, Llpe;->s:Lplh;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Llpe;

    iget-object v0, v0, Llpe;->w:Lplh;

    sget-object v4, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v12}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    check-cast v4, Lcom/opera/android/OperaApplication;

    invoke-virtual {v4}, Lcom/opera/android/OperaApplication;->e()Lj4c;

    move-result-object v5

    invoke-virtual {v5}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lyk6;

    iget-object v6, v4, Lcom/opera/android/OperaApplication;->x:Lj4c;

    invoke-virtual {v6}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lh0a;

    new-instance v11, Lq6e;

    invoke-virtual {v12}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    invoke-static {v7}, Ljbf;->t(Landroid/content/Context;)Ljbf;

    move-result-object v16

    new-instance v7, Liri;

    invoke-direct {v7, v12}, Liri;-><init>(Landroid/content/Context;)V

    iget-object v5, v5, Lyk6;->j:Lkze;

    iget-object v6, v6, Lh0a;->d:Lode;

    invoke-static {v12}, Li0l;->h(Landroid/content/Context;)Lcom/opera/android/Lazy;

    move-result-object v22

    invoke-virtual {v4}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v4

    iget-object v4, v4, Ld6j;->c:Lx5f;

    new-instance v8, Lk6e;

    invoke-direct {v8, v2, v3}, Lk6e;-><init>(Lcq5;Lplh;)V

    move-object/from16 v17, v0

    move-object/from16 v19, v1

    move-object/from16 v23, v4

    move-object/from16 v20, v5

    move-object/from16 v21, v6

    move-object/from16 v18, v7

    move-object/from16 v24, v8

    invoke-direct/range {v11 .. v24}, Lq6e;-><init>(Landroid/content/Context;Lumi;Lnx5;Lwjh;Ljbf;Lplh;Liri;Luu1;Lkze;Lode;Lcom/opera/android/Lazy;Lx5f;Lk6e;)V

    sput-object v11, Leti;->a:Lq6e;

    return-object v11

    :pswitch_298
    new-instance v1, Lv3m;

    iget-object v2, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v3

    iget-object v0, v0, Lxv1;->O0:Lj4c;

    sget-object v4, Lvml;->d:Lumi;

    invoke-direct {v1, v2, v3, v0, v4}, Lv3m;-><init>(Landroid/content/Context;Lcom/opera/android/settings/SettingsManager;Lj4c;Lumi;)V

    return-object v1

    :pswitch_2a8
    new-instance v1, Lub2;

    sget-object v2, Lvml;->d:Lumi;

    iget-object v0, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    new-instance v4, Li16;

    sget-object v5, Lxne;->b:Lii;

    invoke-direct {v4, v5}, Li16;-><init>(Lii;)V

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-class v5, Lcom/opera/android/autofill/assetlinks/db/AssetLinksDataBase;

    const-string v6, "asset_links"

    invoke-static {v0, v5, v6}, Lxih;->f(Landroid/content/Context;Ljava/lang/Class;Ljava/lang/String;)Lu5i;

    move-result-object v0

    new-array v5, v11, [Lryd;

    sget-object v6, Lcom/opera/android/autofill/assetlinks/db/AssetLinksDataBase;->l:Lczd;

    aput-object v6, v5, v12

    invoke-virtual {v0, v5}, Lu5i;->a([Lryd;)V

    invoke-virtual {v0}, Lu5i;->b()Ly5i;

    move-result-object v0

    check-cast v0, Lcom/opera/android/autofill/assetlinks/db/AssetLinksDataBase;

    invoke-virtual {v0}, Lcom/opera/android/autofill/assetlinks/db/AssetLinksDataBase;->x()Lob2;

    move-result-object v0

    invoke-direct {v1, v2, v3, v4, v0}, Lub2;-><init>(Lumi;Landroid/content/pm/PackageManager;Li16;Lob2;)V

    return-object v1

    :pswitch_2dc
    iget-object v1, v0, Lxv1;->K0:Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v6, v1

    check-cast v6, Lpqi;

    new-instance v4, Lshf;

    iget-object v1, v0, Lxv1;->i:Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnx5;

    new-instance v3, Lbr6;

    iget-object v5, v0, Lxv1;->h0:Lj4c;

    invoke-virtual {v5}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lbr6;

    invoke-direct {v3, v5, v6}, Lbr6;-><init>(Lbr6;Lpqi;)V

    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    iput-object v1, v4, Lshf;->a:Ljava/lang/Object;

    iput-object v3, v4, Lshf;->b:Ljava/lang/Object;

    new-instance v1, Lj3i;

    invoke-direct {v1, v4, v2}, Lj3i;-><init>(Ljava/lang/Object;B)V

    invoke-static {v1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v1

    iput-object v1, v4, Lshf;->c:Ljava/lang/Object;

    new-instance v7, Lghf;

    new-instance v1, Ljava/io/File;

    iget-object v2, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-virtual {v2}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v2

    const-string v3, "sdx"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    sget-object v2, Lvml;->d:Lumi;

    invoke-direct {v7, v1, v2}, Lghf;-><init>(Ljava/io/File;Lumi;)V

    new-instance v3, Lvqi;

    iget-object v1, v0, Lxv1;->L0:Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v5, v1

    check-cast v5, Lsqi;

    iget-object v0, v0, Lxv1;->M0:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v8, v0

    check-cast v8, Luqi;

    invoke-direct/range {v3 .. v8}, Lvqi;-><init>(Lshf;Lsqi;Lpqi;Lghf;Luqi;)V

    return-object v3

    :pswitch_33a
    new-instance v1, Luqi;

    iget-object v0, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    sget-object v2, Lvml;->d:Lumi;

    invoke-direct {v1, v0, v2}, Luqi;-><init>(Landroid/content/Context;Lumi;)V

    return-object v1

    :pswitch_344
    new-instance v12, Lsqi;

    new-instance v13, Llld;

    iget-object v1, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-static {v1}, Ldj9;->t(Landroid/content/Context;)Ldj9;

    move-result-object v5

    invoke-direct {v13, v5, v8}, Llld;-><init>(Ljava/lang/Object;B)V

    new-instance v14, Lhga;

    invoke-direct {v14, v1, v11}, Lhga;-><init>(Ljava/lang/Object;B)V

    new-instance v15, Luu1;

    invoke-direct {v15, v9}, Luu1;-><init>(B)V

    new-instance v5, Ljv1;

    invoke-direct {v5, v0, v8}, Ljv1;-><init>(Lxv1;B)V

    new-instance v8, Ljv1;

    const/16 v9, 0x8

    invoke-direct {v8, v0, v9}, Ljv1;-><init>(Lxv1;B)V

    iget-object v9, v0, Lxv1;->f:Lg92;

    invoke-virtual {v9}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v9

    move-object/from16 v18, v9

    check-cast v18, Lesk;

    new-instance v9, Luu1;

    invoke-direct {v9, v3}, Luu1;-><init>(B)V

    iget-object v3, v0, Lxv1;->z0:Lj4c;

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v3

    move-object/from16 v20, v3

    check-cast v20, Lndh;

    new-instance v3, Ltvk;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->o()Lnr8;

    move-result-object v1

    invoke-direct {v3, v1}, Ltvk;-><init>(Ljava/lang/Object;)V

    new-instance v1, Ljv1;

    const/16 v10, 0x9

    invoke-direct {v1, v0, v10}, Ljv1;-><init>(Lxv1;B)V

    new-instance v10, Ljv1;

    invoke-direct {v10, v0, v6}, Ljv1;-><init>(Lxv1;B)V

    new-instance v6, Ljv1;

    invoke-direct {v6, v0, v2}, Ljv1;-><init>(Lxv1;B)V

    new-instance v2, Ljv1;

    const/16 v4, 0xc

    invoke-direct {v2, v0, v4}, Ljv1;-><init>(Lxv1;B)V

    new-instance v4, Llv1;

    invoke-direct {v4, v0, v11}, Llv1;-><init>(Lxv1;B)V

    new-instance v11, Ljv1;

    const/16 v7, 0xe

    invoke-direct {v11, v0, v7}, Ljv1;-><init>(Lxv1;B)V

    new-instance v7, Luu1;

    move-object/from16 v22, v1

    const/4 v1, 0x3

    invoke-direct {v7, v1}, Luu1;-><init>(B)V

    new-instance v1, Ljv1;

    move-object/from16 v25, v2

    const/4 v2, 0x6

    invoke-direct {v1, v0, v2}, Ljv1;-><init>(Lxv1;B)V

    move-object/from16 v29, v1

    move-object/from16 v21, v3

    move-object/from16 v26, v4

    move-object/from16 v16, v5

    move-object/from16 v24, v6

    move-object/from16 v28, v7

    move-object/from16 v17, v8

    move-object/from16 v19, v9

    move-object/from16 v23, v10

    move-object/from16 v27, v11

    invoke-direct/range {v12 .. v29}, Lsqi;-><init>(Llld;Lhga;Luu1;Ljv1;Ljv1;Lesk;Luu1;Lndh;Ltvk;Ljv1;Ljv1;Ljv1;Ljv1;Llv1;Ljv1;Luu1;Ljv1;)V

    return-object v12

    :pswitch_3d5
    new-instance v1, Lpqi;

    iget-object v0, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    sget-object v2, Lvml;->d:Lumi;

    invoke-direct {v1, v0, v2}, Lpqi;-><init>(Landroid/content/Context;Lumi;)V

    return-object v1

    :pswitch_3df
    new-instance v1, Lx79;

    iget-object v2, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    iget-object v3, v0, Lxv1;->E0:Lj4c;

    sget-object v4, Lvml;->d:Lumi;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v5

    iget-object v5, v5, Ld6j;->c:Lx5f;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v6

    iget-object v6, v6, Ld6j;->d:Lx5f;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v3, v1, Lx79;->a:Ljava/lang/Object;

    iput-object v4, v1, Lx79;->b:Ljava/lang/Object;

    iput-object v5, v1, Lx79;->c:Ljava/lang/Object;

    iput-object v6, v1, Lx79;->d:Ljava/lang/Object;

    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    iput-object v2, v1, Lx79;->e:Ljava/lang/Object;

    new-instance v2, Ly5e;

    iget-object v0, v0, Lxv1;->G0:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lx3i;

    invoke-direct {v2, v1, v0}, Ly5e;-><init>(Lx79;Lx3i;)V

    return-object v2

    :pswitch_412
    new-instance v1, Lnzl;

    iget-object v2, v0, Lxv1;->H0:Lj4c;

    iget-object v3, v0, Lxv1;->E0:Lj4c;

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lk3i;

    invoke-virtual {v3}, Lk3i;->a()Likc;

    move-result-object v3

    invoke-static {v3}, Lxf8;->t(Lekc;)Lf99;

    move-result-object v3

    iget-object v0, v0, Lxv1;->i:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnx5;

    invoke-direct {v1, v2, v3, v0}, Lnzl;-><init>(Lj4c;Lf99;Lnx5;)V

    return-object v1

    :pswitch_432
    iget-object v5, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    sget-object v3, Lvml;->e:Lwjh;

    invoke-static {v5}, Ldj9;->t(Landroid/content/Context;)Ldj9;

    move-result-object v7

    invoke-static {v5}, Le3j;->t(Landroid/content/Context;)Le3j;

    move-result-object v4

    iget-object v2, v0, Lxv1;->F0:Lj4c;

    new-instance v12, Ljv1;

    const/4 v1, 0x3

    invoke-direct {v12, v0, v1}, Ljv1;-><init>(Lxv1;B)V

    iget-object v1, v0, Lxv1;->Q:Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v9, v1

    check-cast v9, Lv1a;

    iget-object v6, v0, Lxv1;->K:Lj4c;

    iget-object v10, v0, Lxv1;->J0:Lj4c;

    iget-object v8, v0, Lxv1;->I0:Lj4c;

    iget-object v11, v0, Lxv1;->i1:Lj4c;

    invoke-static {}, Li0l;->g()Z

    move-result v0

    if-eqz v0, :cond_463

    new-instance v0, Leye;

    invoke-direct {v0}, Leye;-><init>()V

    goto :goto_46d

    :cond_463
    new-instance v0, Lav6;

    new-instance v1, Lz3i;

    invoke-direct/range {v1 .. v11}, Lz3i;-><init>(Lj4c;Lwjh;Le3j;Landroid/content/Context;Lj4c;Ldj9;Lj4c;Lv1a;Lj4c;Lj4c;)V

    invoke-direct {v0, v1, v12}, Lav6;-><init>(Lz3i;Ljv1;)V

    :goto_46d
    return-object v0

    :pswitch_46e
    new-instance v1, Lx3i;

    iget-object v2, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    iget-object v3, v0, Lxv1;->P0:Lj4c;

    iget-object v4, v0, Lxv1;->E0:Lj4c;

    new-instance v5, Lhv1;

    const/16 v6, 0x1c

    invoke-direct {v5, v0, v6}, Lhv1;-><init>(Lxv1;B)V

    invoke-direct {v1, v2, v3, v4, v5}, Lx3i;-><init>(Landroid/content/Context;Lj4c;Lj4c;Lhv1;)V

    return-object v1

    :pswitch_481
    new-instance v1, Lv3e;

    iget-object v0, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-direct {v1, v0}, Lv3e;-><init>(Landroid/content/Context;)V

    return-object v1

    :pswitch_489
    new-instance v1, Ldb;

    iget-object v0, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    sget-object v2, Lvml;->d:Lumi;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->N()Lzwk;

    move-result-object v3

    invoke-direct {v1, v0, v2, v3}, Ldb;-><init>(Landroid/content/Context;Lumi;Lzwk;)V

    return-object v1

    nop

    :pswitch_data_498
    .packed-switch 0x0
        :pswitch_489
        :pswitch_481
        :pswitch_46e
        :pswitch_432
        :pswitch_412
        :pswitch_3df
        :pswitch_3d5
        :pswitch_344
        :pswitch_33a
        :pswitch_2dc
        :pswitch_2a8
        :pswitch_298
        :pswitch_21a
        :pswitch_1fa
        :pswitch_1f0
        :pswitch_1e6
        :pswitch_1d6
        :pswitch_1c6
        :pswitch_1b8
        :pswitch_18b
        :pswitch_16a
        :pswitch_f8
        :pswitch_ea
        :pswitch_e4
        :pswitch_d6
        :pswitch_97
        :pswitch_88
        :pswitch_81
        :pswitch_74
    .end packed-switch
.end method
