.class public final synthetic Lnv1;
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

    iput-byte p2, p0, Lnv1;->a:B

    iput-object p1, p0, Lnv1;->b:Lxv1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 28

    move-object/from16 v0, p0

    iget-byte v1, v0, Lnv1;->a:B

    const/16 v2, 0xa

    const/4 v3, 0x5

    const/16 v4, 0xf

    const/16 v5, 0xc

    const/16 v6, 0x9

    const/4 v7, 0x2

    const/4 v8, 0x1

    const/4 v9, 0x0

    iget-object v0, v0, Lnv1;->b:Lxv1;

    packed-switch v1, :pswitch_data_4ea

    iget-object v11, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    iget-object v1, v0, Lxv1;->E:Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v12, v1

    check-cast v12, Li88;

    new-instance v13, Lx77;

    sget-object v1, Lvml;->e:Lwjh;

    iget-object v2, v1, Lwjh;->d:Ljava/lang/Object;

    check-cast v2, Ljg8;

    invoke-direct {v13, v11, v2}, Lx77;-><init>(Landroid/content/Context;Ljg8;)V

    new-instance v14, Lg77;

    iget-object v2, v0, Lxv1;->i0:Lj4c;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Llpe;

    iget-object v3, v3, Llpe;->v:Lplh;

    invoke-direct {v14}, Ljava/lang/Object;-><init>()V

    new-instance v6, Lw78;

    invoke-direct {v6, v3, v9}, Lw78;-><init>(Lplh;B)V

    invoke-static {v6}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v6

    iput-object v6, v14, Lg77;->a:Ljava/lang/Object;

    new-instance v6, Lw78;

    invoke-direct {v6, v3, v8}, Lw78;-><init>(Lplh;B)V

    invoke-static {v6}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v6

    iput-object v6, v14, Lg77;->b:Ljava/lang/Object;

    new-instance v6, Lw78;

    invoke-direct {v6, v3, v7}, Lw78;-><init>(Lplh;B)V

    invoke-static {v6}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v3

    iput-object v3, v14, Lg77;->c:Ljava/lang/Object;

    new-instance v15, Leq6;

    new-instance v3, Ljv1;

    const/4 v6, 0x4

    invoke-direct {v3, v0, v6}, Ljv1;-><init>(Lxv1;B)V

    invoke-direct {v15, v3}, Leq6;-><init>(Ljava/lang/Object;)V

    sget-object v16, Lxne;->b:Lii;

    new-instance v3, Li06;

    invoke-direct {v3, v5}, Li06;-><init>(B)V

    new-instance v5, Lf1p;

    invoke-direct {v5, v4}, Lf1p;-><init>(B)V

    iget-object v4, v0, Lxv1;->s0:Lj4c;

    new-instance v6, Lbpd;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Llpe;

    iget-object v2, v2, Llpe;->v:Lplh;

    invoke-direct {v6, v2}, Lbpd;-><init>(Lplh;)V

    new-instance v22, Lhv5;

    invoke-direct/range {v22 .. v22}, Ljava/lang/Object;-><init>()V

    new-instance v2, Llv1;

    invoke-direct {v2, v0, v9}, Llv1;-><init>(Lxv1;B)V

    new-instance v8, Lk5o;

    iget-object v1, v1, Lwjh;->d:Ljava/lang/Object;

    check-cast v1, Ljg8;

    invoke-direct {v8, v11, v1}, Lk5o;-><init>(Landroid/content/Context;Ljg8;)V

    new-instance v10, Ldp6;

    new-instance v1, Liv1;

    invoke-direct {v1, v0, v7}, Liv1;-><init>(Lxv1;B)V

    new-instance v0, Lk51;

    const/16 v7, 0x16

    invoke-direct {v0, v7}, Lk51;-><init>(B)V

    move-object/from16 v20, v0

    move-object/from16 v18, v1

    move-object/from16 v23, v2

    move-object/from16 v17, v3

    move-object/from16 v19, v4

    move-object/from16 v25, v5

    move-object/from16 v21, v6

    move-object/from16 v24, v8

    invoke-direct/range {v10 .. v25}, Ldp6;-><init>(Landroid/content/Context;Li88;Lx77;Lg77;Leq6;Lii;Li06;Liv1;Lj4c;Lk51;Lbpd;Lhv5;Llv1;Lk5o;Lf1p;)V

    return-object v10

    :pswitch_b6
    new-instance v1, Li88;

    iget-object v0, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-static {v0}, Ldj9;->t(Landroid/content/Context;)Ldj9;

    move-result-object v2

    sget-object v3, Lvml;->e:Lwjh;

    iget-object v3, v3, Lwjh;->d:Ljava/lang/Object;

    check-cast v3, Ljg8;

    invoke-direct {v1, v3, v2, v0}, Li88;-><init>(Ljg8;Ldj9;Landroid/content/Context;)V

    return-object v1

    :pswitch_c8
    new-instance v1, Lag7;

    iget-object v0, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->m()Lsf7;

    move-result-object v2

    iget-object v2, v2, Lsf7;->a:Lrf7;

    sget-object v3, Lvml;->d:Lumi;

    invoke-direct {v1, v2, v3, v0}, Lag7;-><init>(Lrf7;Lumi;Landroid/content/Context;)V

    return-object v1

    :pswitch_d8
    new-instance v1, Lsf7;

    iget-object v0, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    sget-object v2, Lvml;->d:Lumi;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->R()Lydn;

    move-result-object v3

    invoke-direct {v1, v0, v2, v3}, Lsf7;-><init>(Landroid/content/Context;Lumi;Lydn;)V

    return-object v1

    :pswitch_e6
    new-instance v1, Lwc7;

    iget-object v0, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v2

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->R()Lydn;

    move-result-object v0

    invoke-direct {v1, v2, v0}, Lwc7;-><init>(Lcom/opera/android/settings/SettingsManager;Lydn;)V

    return-object v1

    :pswitch_f6
    new-instance v1, Lgc7;

    iget-object v0, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-direct {v1, v0}, Lgc7;-><init>(Landroid/content/Context;)V

    return-object v1

    :pswitch_fe
    new-instance v1, Lu0a;

    iget-object v0, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->I()Lq6e;

    move-result-object v2

    iget-object v0, v0, Lcom/opera/android/OperaApplication;->A:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Llpe;

    iget-object v0, v0, Llpe;->s:Lplh;

    invoke-static {v0}, Lxf8;->u(Lf99;)Lhx5;

    move-result-object v0

    invoke-direct {v1, v2, v0}, Lu0a;-><init>(Lq6e;Lhx5;)V

    return-object v1

    :pswitch_118
    new-instance v1, Lkze;

    sget-object v2, Leri;->a:Lcri;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v2, Lcri;->b:Lbri;

    invoke-direct {v1, v2}, Lekc;-><init>(Ljava/lang/Object;)V

    iget-object v0, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->I()Lq6e;

    move-result-object v0

    new-instance v2, Lkv1;

    invoke-direct {v2, v1, v9}, Lkv1;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v2}, Lq6e;->a(Lkri;)V

    return-object v1

    :pswitch_133
    new-instance v1, Lku5;

    iget-object v0, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v2

    iget-object v2, v2, Ld6j;->c:Lx5f;

    invoke-direct {v1, v0, v2}, Lku5;-><init>(Landroid/content/Context;Lx5f;)V

    return-object v1

    :pswitch_141
    new-instance v1, Ljk5;

    iget-object v2, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    new-instance v3, Lpv1;

    invoke-direct {v3, v0, v9}, Lpv1;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v1, v2, v3}, Ljk5;-><init>(Landroid/content/Context;Lpv1;)V

    return-object v1

    :pswitch_14e
    new-instance v1, Lcom/opera/android/account/push/AccountPushManager;

    iget-object v0, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-static {v0}, Le3j;->t(Landroid/content/Context;)Le3j;

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/opera/android/account/push/AccountPushManager;-><init>(Le3j;)V

    return-object v1

    :pswitch_15a
    sget-object v1, Lc75;->k:Ld75;

    iget-object v11, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    sget-object v1, Lc75;->l:Lio7;

    sget-object v2, Lc75;->n:Lyq4;

    invoke-static {v11, v1, v2}, Lno7;->n(Landroid/content/Context;Lio7;Llo7;)Lno7;

    move-result-object v1

    check-cast v1, Lc75;

    new-instance v2, Lr65;

    new-instance v4, Lvx;

    invoke-direct {v4, v1, v3}, Lvx;-><init>(Ljava/lang/Object;B)V

    new-instance v1, Ljv1;

    invoke-direct {v1, v0, v9}, Ljv1;-><init>(Lxv1;B)V

    new-instance v3, Ljv1;

    invoke-direct {v3, v0, v8}, Ljv1;-><init>(Lxv1;B)V

    new-instance v10, Lli;

    const-class v12, Lcom/opera/android/OperaApplication;

    const-string v13, "usageReporter"

    const-string v14, "getUsageReporter()Lcom/opera/android/analytics/UsageReporter;"

    const/4 v15, 0x0

    const/16 v16, 0x4

    invoke-direct/range {v10 .. v16}, Lli;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance v5, Lwv1;

    invoke-direct {v5, v10, v9}, Lwv1;-><init>(Lb6h;B)V

    new-instance v10, Lli;

    const-string v13, "unfilteredUsageReporter"

    const-string v14, "getUnfilteredUsageReporter()Lcom/opera/android/analytics/UnfilteredUsageReporter;"

    const/16 v16, 0x5

    invoke-direct/range {v10 .. v16}, Lli;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance v8, Lwv1;

    invoke-direct {v8, v10, v9}, Lwv1;-><init>(Lb6h;B)V

    new-instance v17, Ld7h;

    new-instance v10, Ljv1;

    invoke-direct {v10, v0, v7}, Ljv1;-><init>(Lxv1;B)V

    move-object v0, v10

    new-instance v10, Lli;

    const-string v13, "unfilteredUsageReporter"

    const-string v14, "getUnfilteredUsageReporter()Lcom/opera/android/analytics/UnfilteredUsageReporter;"

    const/16 v16, 0x6

    move-object v7, v0

    move-object/from16 v0, v17

    invoke-direct/range {v10 .. v16}, Lli;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance v12, Lwv1;

    invoke-direct {v12, v10, v9}, Lwv1;-><init>(Lb6h;B)V

    invoke-direct {v0, v7, v12, v6}, Ld7h;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    sget-object v18, Lvml;->d:Lumi;

    move-object v13, v1

    move-object v10, v2

    move-object v14, v3

    move-object v12, v4

    move-object v15, v5

    move-object/from16 v16, v8

    invoke-direct/range {v10 .. v18}, Lr65;-><init>(Landroid/content/Context;Lvx;Ljv1;Ljv1;Lwv1;Lwv1;Ld7h;Lumi;)V

    return-object v10

    :pswitch_1c7
    sget v1, Lswk;->e:I

    iget-object v0, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    sget-object v1, Lvml;->d:Lumi;

    new-instance v2, Lswk;

    const-string v3, "startpage.sync"

    new-array v4, v9, [Lbg1;

    invoke-static {v0, v1, v3, v4}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object v0

    invoke-direct {v2, v0, v1}, Lswk;-><init>(Lb59;Lumi;)V

    return-object v2

    :pswitch_1db
    iget-object v0, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-static {v0}, Le3j;->t(Landroid/content/Context;)Le3j;

    move-result-object v0

    new-instance v1, Lpjn;

    const/16 v2, 0x1a

    invoke-direct {v1, v0, v2}, Lpjn;-><init>(Ljava/lang/Object;B)V

    new-instance v0, La55;

    invoke-direct {v0, v1}, La55;-><init>(Lpjn;)V

    return-object v0

    :pswitch_1ee
    new-instance v1, Lin3;

    iget-object v0, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->g()Li53;

    move-result-object v0

    invoke-direct {v1, v0}, Lin3;-><init>(Li53;)V

    return-object v1

    :pswitch_1fa
    new-instance v1, Lcom/opera/android/bookmarks/h;

    iget-object v2, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->N()Lzwk;

    move-result-object v2

    iget-object v0, v0, Lxv1;->i0:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Llpe;

    iget-object v0, v0, Llpe;->c:Lcq5;

    invoke-direct {v1, v2, v0}, Lcom/opera/android/bookmarks/h;-><init>(Lzwk;Lcq5;)V

    return-object v1

    :pswitch_210
    new-instance v10, Lsi3;

    iget-object v12, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    new-instance v1, Luu1;

    invoke-direct {v1, v2}, Luu1;-><init>(B)V

    new-instance v11, Lli;

    const-class v13, Lcom/opera/android/OperaApplication;

    const-string v14, "blockList"

    const-string v15, "getBlockList()Lcom/opera/android/browser/blocklist/pushed/PushedBlockLists;"

    const/16 v16, 0x0

    const/16 v17, 0x1

    invoke-direct/range {v11 .. v17}, Lli;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance v2, Lwv1;

    invoke-direct {v2, v11, v9}, Lwv1;-><init>(Lb6h;B)V

    new-instance v4, Lnv1;

    invoke-direct {v4, v0, v3}, Lnv1;-><init>(Lxv1;B)V

    new-instance v3, Luu1;

    const/16 v6, 0xb

    invoke-direct {v3, v6}, Luu1;-><init>(B)V

    sget-object v6, Lxne;->b:Lii;

    iget-object v0, v0, Lxv1;->u:Lj4c;

    iget-object v7, v12, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v7, v7, Lxv1;->P0:Lj4c;

    new-instance v8, Luu1;

    invoke-direct {v8, v5}, Luu1;-><init>(B)V

    new-instance v11, Lli;

    const-string v14, "usageReporter"

    const-string v15, "getUsageReporter()Lcom/opera/android/analytics/UsageReporter;"

    const/16 v17, 0x2

    invoke-direct/range {v11 .. v17}, Lli;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance v5, Lwv1;

    invoke-direct {v5, v11, v9}, Lwv1;-><init>(Lb6h;B)V

    new-instance v11, Lli;

    const-string v14, "pushedContentHandler"

    const-string v15, "getPushedContentHandler()Lcom/opera/android/PushedContentHandler;"

    const/16 v17, 0x3

    invoke-direct/range {v11 .. v17}, Lli;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance v13, Lwv1;

    invoke-direct {v13, v11, v9}, Lwv1;-><init>(Lb6h;B)V

    move-object/from16 v17, v0

    move-object v15, v3

    move-object v14, v4

    move-object/from16 v20, v5

    move-object/from16 v16, v6

    move-object/from16 v18, v7

    move-object/from16 v19, v8

    move-object v11, v12

    move-object/from16 v21, v13

    move-object v12, v1

    move-object v13, v2

    invoke-direct/range {v10 .. v21}, Lsi3;-><init>(Landroid/content/Context;Luu1;Lwv1;Lnv1;Luu1;Lii;Lj4c;Lj4c;Luu1;Lwv1;Lwv1;)V

    return-object v10

    :pswitch_27b
    new-instance v1, Lf84;

    iget-object v2, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    iget-object v0, v0, Lxv1;->b:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ldb;

    iget-object v0, v0, Ldb;->c:Lcom/opera/android/oauth2/OAuth2Account;

    const/4 v3, 0x0

    if-eqz v0, :cond_29c

    iget-object v0, v0, Lcom/opera/android/oauth2/OAuth2Account;->a:Lrb;

    iget-object v0, v0, Lrb;->a:Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    const-string v4, "profile_picture"

    invoke-interface {v0, v4, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    :cond_29c
    sget-object v0, Lvml;->d:Lumi;

    sget-object v4, Lzsd;->b:Lzsd;

    invoke-direct {v1, v2, v3, v0, v4}, Lf84;-><init>(Landroid/content/Context;Ljava/lang/String;Lumi;Lzsd;)V

    return-object v1

    :pswitch_2a4
    iget-object v0, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    const-string v1, "user"

    invoke-virtual {v0, v1}, Lcom/opera/android/OperaApplication;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/UserManager;

    if-eqz v0, :cond_2b4

    invoke-virtual {v0}, Landroid/os/UserManager;->isSystemUser()Z

    move-result v9

    :cond_2b4
    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_2b9
    new-instance v5, Lb1o;

    iget-object v6, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    sget-object v7, Lvml;->e:Lwjh;

    sget-object v1, Lngh;->a:Lr16;

    new-instance v8, Lm91;

    invoke-direct {v8, v6, v7, v4}, Lm91;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v1, v0, Lxv1;->h0:Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v9, v1

    check-cast v9, Lbr6;

    new-instance v10, Ljv1;

    const/16 v1, 0x10

    invoke-direct {v10, v0, v1}, Ljv1;-><init>(Lxv1;B)V

    invoke-direct/range {v5 .. v10}, Lb1o;-><init>(Landroid/content/Context;Lwjh;Lm91;Lbr6;Ljv1;)V

    return-object v5

    :pswitch_2da
    new-instance v1, Levn;

    iget-object v0, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v0

    iget-object v0, v0, Ld6j;->c:Lx5f;

    invoke-direct {v1, v0}, Lsc;-><init>(Lx5f;)V

    return-object v1

    :pswitch_2e8
    sget-object v1, Lvml;->d:Lumi;

    iget-object v11, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    new-instance v2, Lmcj;

    invoke-direct {v2, v11, v1}, Lmcj;-><init>(Landroid/content/Context;Lumi;)V

    new-instance v3, Lwth;

    invoke-direct {v3, v11, v6}, Lwth;-><init>(Ljava/lang/Object;B)V

    sget-object v4, Lxne;->b:Lii;

    new-instance v5, Lshf;

    invoke-direct {v5, v3, v1, v4}, Lshf;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v3, Lm59;

    invoke-direct {v3, v1, v2}, Lm59;-><init>(Lumi;Lmcj;)V

    new-instance v1, Lxbf;

    invoke-virtual {v11}, Lcom/opera/android/OperaApplication;->b()Ldb;

    move-result-object v4

    new-instance v10, Lli;

    const-class v12, Lcom/opera/android/OperaApplication;

    const-string v13, "clientTokenManager"

    const-string v14, "getClientTokenManager()Lcom/opera/android/oauth2/ClientTokenManager;"

    const/4 v15, 0x0

    const/16 v16, 0x7

    invoke-direct/range {v10 .. v16}, Lli;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance v6, Lwv1;

    invoke-direct {v6, v10, v9}, Lwv1;-><init>(Lb6h;B)V

    invoke-direct {v1, v4, v6}, Lxbf;-><init>(Ldb;Lwv1;)V

    new-instance v4, Lnv1;

    invoke-direct {v4, v0, v7}, Lnv1;-><init>(Lxv1;B)V

    const-string v6, "premium"

    const-string v7, "premium_beta"

    filled-new-array {v6, v7}, [Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Le82;->E([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v16

    new-instance v12, Ltmk;

    new-instance v6, Ldnj;

    const/16 v7, 0x14

    invoke-direct {v6, v3, v7}, Ldnj;-><init>(Ljava/lang/Object;B)V

    move-object v15, v1

    move-object v13, v2

    move-object/from16 v18, v4

    move-object v14, v5

    move-object/from16 v17, v6

    invoke-direct/range {v12 .. v18}, Ltmk;-><init>(Lmcj;Lshf;Lxbf;Ljava/util/Set;Ldnj;Lnv1;)V

    move-object v1, v12

    new-instance v2, Lnv1;

    const/4 v4, 0x3

    invoke-direct {v2, v0, v4}, Lnv1;-><init>(Lxv1;B)V

    invoke-virtual {v11}, Lcom/opera/android/OperaApplication;->D()Ljtg;

    move-result-object v17

    new-instance v12, Lpy9;

    move-object/from16 v16, v2

    invoke-direct/range {v12 .. v17}, Lpy9;-><init>(Lmcj;Lshf;Lxbf;Lnv1;Ljtg;)V

    new-instance v2, Lzkk;

    invoke-virtual {v11}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v4

    iget-object v4, v4, Ld6j;->d:Lx5f;

    invoke-direct {v2, v4}, Lzkk;-><init>(Lx5f;)V

    move-object/from16 v16, v15

    move-object v15, v12

    new-instance v12, Lslk;

    iget-object v4, v11, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v4, v4, Lxv1;->c:Lj4c;

    invoke-virtual {v4}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/opera/android/account/push/AccountPushManager;

    invoke-virtual {v4, v9}, Lcom/opera/android/account/push/AccountPushManager;->a(I)Lode;

    move-result-object v17

    iget-object v0, v0, Lxv1;->i:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    move-object/from16 v20, v0

    check-cast v20, Lnx5;

    move-object v14, v1

    move-object v13, v3

    move-object/from16 v19, v18

    move-object/from16 v18, v2

    invoke-direct/range {v12 .. v20}, Lslk;-><init>(Lm59;Ltmk;Lpy9;Lxbf;Lode;Lzkk;Lnv1;Lnx5;)V

    return-object v12

    :pswitch_386
    iget-object v11, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-static {v11}, Ldj9;->t(Landroid/content/Context;)Ldj9;

    move-result-object v1

    new-instance v10, Llz6;

    iget-object v3, v0, Lxv1;->i:Lj4c;

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v3

    move-object v12, v3

    check-cast v12, Lnx5;

    sget-object v3, Lvml;->e:Lwjh;

    iget-object v4, v3, Lwjh;->d:Ljava/lang/Object;

    move-object v13, v4

    check-cast v13, Ljg8;

    sget-object v14, Lxne;->b:Lii;

    new-instance v15, Luu1;

    const/4 v4, 0x6

    invoke-direct {v15, v4}, Luu1;-><init>(B)V

    new-instance v4, Lz4k;

    invoke-static {v11}, Le3j;->t(Landroid/content/Context;)Le3j;

    move-result-object v5

    const/16 v7, 0xe

    invoke-direct {v4, v5, v7}, Lz4k;-><init>(Ljava/lang/Object;B)V

    new-instance v5, Lw6j;

    iget-object v3, v3, Lwjh;->d:Ljava/lang/Object;

    check-cast v3, Ljg8;

    invoke-direct {v5, v3, v1, v11}, Lw6j;-><init>(Ljg8;Ldj9;Landroid/content/Context;)V

    new-instance v3, Lauj;

    invoke-direct {v3, v6}, Lauj;-><init>(B)V

    new-instance v6, Ljon;

    invoke-direct {v6, v1}, Ljon;-><init>(Ldj9;)V

    new-instance v1, Lu7k;

    iget-object v7, v11, Lcom/opera/android/OperaApplication;->I:Lj4c;

    invoke-virtual {v7}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lu8k;

    iget-object v8, v0, Lxv1;->i0:Lj4c;

    invoke-virtual {v8}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v17

    move-object/from16 v9, v17

    check-cast v9, Llpe;

    iget-object v9, v9, Llpe;->r:Lplh;

    invoke-static {v11}, Lv1;->u(Landroid/content/Context;)Lv1;

    move-result-object v2

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    move-object/from16 p0, v3

    new-instance v3, Luef;

    move-object/from16 v19, v4

    const/16 v4, 0xa

    invoke-direct {v3, v7, v9, v2, v4}, Luef;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v3}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v2

    iput-object v2, v1, Lu7k;->a:Ljava/lang/Object;

    new-instance v2, Lg7l;

    invoke-virtual {v11}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v3

    invoke-direct {v2, v3}, Lg7l;-><init>(Lcom/opera/android/settings/SettingsManager;)V

    new-instance v3, Lw7j;

    iget-object v4, v0, Lxv1;->l0:Lj4c;

    invoke-virtual {v4}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lx0f;

    invoke-virtual {v8}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Llpe;

    iget-object v7, v7, Llpe;->r:Lplh;

    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    iput-object v4, v3, Lw7j;->a:Ljava/lang/Object;

    iput-object v7, v3, Lw7j;->b:Ljava/lang/Object;

    new-instance v4, Lson;

    const/4 v7, 0x0

    invoke-direct {v4, v3, v7}, Lson;-><init>(Lw7j;B)V

    invoke-static {v4}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v4

    iput-object v4, v3, Lw7j;->c:Ljava/lang/Object;

    new-instance v4, Lson;

    const/4 v7, 0x1

    invoke-direct {v4, v3, v7}, Lson;-><init>(Lw7j;B)V

    invoke-static {v4}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v4

    iput-object v4, v3, Lw7j;->d:Ljava/lang/Object;

    new-instance v4, Loji;

    iget-object v0, v0, Lxv1;->V:Lj4c;

    invoke-direct {v4, v0}, Loji;-><init>(Ljava/lang/Object;)V

    new-instance v24, Lbon;

    invoke-direct/range {v24 .. v24}, Ljava/lang/Object;-><init>()V

    invoke-virtual {v11}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v0

    iget-object v0, v0, Ld6j;->c:Lx5f;

    new-instance v7, Lu74;

    invoke-static {}, Lcom/google/android/gms/common/GoogleApiAvailability;->getInstance()Lcom/google/android/gms/common/GoogleApiAvailability;

    move-result-object v8

    invoke-virtual {v8, v11}, Lcom/google/android/gms/common/GoogleApiAvailability;->isGooglePlayServicesAvailable(Landroid/content/Context;)I

    move-result v8

    if-nez v8, :cond_450

    new-instance v8, Lk5o;

    invoke-direct {v8, v11}, Lk5o;-><init>(Landroid/content/Context;)V

    goto :goto_455

    :cond_450
    new-instance v8, Lpad;

    invoke-direct {v8, v11}, Lpad;-><init>(Landroid/content/Context;)V

    :goto_455
    invoke-direct {v7, v8}, Lu74;-><init>(Lwv9;)V

    move-object/from16 v18, p0

    move-object/from16 v25, v0

    move-object/from16 v20, v1

    move-object/from16 v21, v2

    move-object/from16 v22, v3

    move-object/from16 v23, v4

    move-object/from16 v17, v5

    move-object/from16 v26, v7

    move-object/from16 v16, v19

    move-object/from16 v19, v6

    invoke-direct/range {v10 .. v26}, Llz6;-><init>(Landroid/content/Context;Lnx5;Ljg8;Lii;Luu1;Lz4k;Lw6j;Lauj;Ljon;Lu7k;Lg7l;Lw7j;Loji;Lbon;Lx5f;Lu74;)V

    return-object v10

    :pswitch_470
    new-instance v1, Lwun;

    iget-object v0, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    sget-object v2, Lvml;->d:Lumi;

    invoke-direct {v1, v0, v2}, Lwun;-><init>(Landroid/content/Context;Lumi;)V

    return-object v1

    :pswitch_47a
    sget-object v1, Lzi3;->k:Lui3;

    iget-object v0, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    sget-object v1, Lio7;->E:Lio7;

    sget-object v2, Lzi3;->l:Lqp2;

    invoke-static {v0, v1, v2}, Lno7;->n(Landroid/content/Context;Lio7;Llo7;)Lno7;

    move-result-object v0

    check-cast v0, Lzi3;

    return-object v0

    :pswitch_489
    new-instance v1, Lvwn;

    iget-object v0, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-direct {v1, v0}, Lvwn;-><init>(Landroid/content/Context;)V

    return-object v1

    :pswitch_491
    iget-object v0, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-static {v0}, Lzi4;->A(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :pswitch_498
    iget-object v0, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-static {v0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v0

    iget-object v0, v0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v1, "vpn_pro.kill_switch.on"

    const/4 v7, 0x0

    invoke-interface {v0, v1, v7}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    const/16 v16, 0x1

    xor-int/lit8 v0, v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_4b0
    iget-object v0, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    const-class v1, Lcqp;

    monitor-enter v1

    :try_start_4b5
    sget-object v2, Lcqp;->a:Lu7k;

    if-nez v2, :cond_4ce

    new-instance v2, Ln0c;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    if-eqz v3, :cond_4c2

    move-object v0, v3

    :cond_4c2
    const/4 v7, 0x0

    invoke-direct {v2, v0, v7}, Ln0c;-><init>(Landroid/content/Context;Z)V

    new-instance v0, Lu7k;

    invoke-direct {v0, v2}, Lu7k;-><init>(Ln0c;)V

    sput-object v0, Lcqp;->a:Lu7k;
    :try_end_4cd
    .catchall {:try_start_4b5 .. :try_end_4cd} :catchall_4dc

    move-object v2, v0

    :cond_4ce
    monitor-exit v1

    iget-object v0, v2, Lu7k;->a:Ljava/lang/Object;

    check-cast v0, Lcpp;

    invoke-interface {v0}, Lcpp;->zza()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lrsp;

    return-object v0

    :goto_4da
    :try_start_4da
    monitor-exit v1
    :try_end_4db
    .catchall {:try_start_4da .. :try_end_4db} :catchall_4dc

    throw v0

    :catchall_4dc
    move-exception v0

    goto :goto_4da

    :pswitch_4de
    iget-object v0, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-static {v0}, Lnr8;->e(Landroid/content/Context;)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0

    nop

    :pswitch_data_4ea
    .packed-switch 0x0
        :pswitch_4de
        :pswitch_4b0
        :pswitch_498
        :pswitch_491
        :pswitch_489
        :pswitch_47a
        :pswitch_470
        :pswitch_386
        :pswitch_2e8
        :pswitch_2da
        :pswitch_2b9
        :pswitch_2a4
        :pswitch_27b
        :pswitch_210
        :pswitch_1fa
        :pswitch_1ee
        :pswitch_1db
        :pswitch_1c7
        :pswitch_15a
        :pswitch_14e
        :pswitch_141
        :pswitch_133
        :pswitch_118
        :pswitch_fe
        :pswitch_f6
        :pswitch_e6
        :pswitch_d8
        :pswitch_c8
        :pswitch_b6
    .end packed-switch
.end method
