.class public final Lipk;
.super Llim;
.source "SourceFile"

# interfaces
.implements Lw25;


# instance fields
.field public final a:Lxbf;

.field public final b:Ljs6;

.field public final c:Li32;

.field public final d:Lkd7;

.field public final e:Llld;

.field public final f:Lwok;

.field public final g:Lt1;

.field public final h:Leq6;

.field public final i:Lnr8;

.field public final j:Lcpk;

.field public final k:Lxbf;

.field public l:Z

.field public final m:Lvk;

.field public final n:Lrle;

.field public o:Z

.field public final p:Lvi5;

.field public final q:Lr8f;

.field public final r:Lf35;

.field public final s:Lqie;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lumi;Lwok;Lx5f;Lnr8;Lglh;Ljava/lang/String;Ltcc;Lf35;Le00;Ldu3;Lt1;Lkw0;)V
    .registers 44

    move-object/from16 v0, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v8, p5

    move-object/from16 v9, p6

    move-object/from16 v10, p9

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    move-object/from16 v1, p3

    iput-object v1, v0, Lipk;->f:Lwok;

    move-object/from16 v1, p12

    iput-object v1, v0, Lipk;->g:Lt1;

    new-instance v1, Leq6;

    new-instance v4, Lvuh;

    const/4 v11, 0x3

    move-object/from16 v5, p4

    invoke-direct {v4, v5, v11}, Lvuh;-><init>(Lx5f;B)V

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    new-instance v5, Lrr8;

    new-instance v6, Lk32;

    const/4 v7, 0x6

    invoke-direct {v6, v1, v2, v7}, Lk32;-><init>(Ljava/lang/Object;Landroid/content/Context;B)V

    invoke-direct {v5, v3, v6, v4}, Lrr8;-><init>(Lumi;Lk32;Lvuh;)V

    iput-object v5, v1, Leq6;->a:Ljava/lang/Object;

    invoke-virtual {v5}, Lldk;->h()V

    iput-object v1, v0, Lipk;->h:Leq6;

    iput-object v8, v0, Lipk;->i:Lnr8;

    new-instance v12, Lcpk;

    new-instance v4, Lepk;

    const/4 v13, 0x0

    invoke-direct {v4, v0, v13}, Lepk;-><init>(Lipk;B)V

    new-instance v5, Lzzh;

    const/16 v14, 0xf

    invoke-direct {v5, v8, v14}, Lzzh;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v12, v4, v5}, Lcpk;-><init>(Lepk;Lzzh;)V

    iput-object v12, v0, Lipk;->j:Lcpk;

    new-instance v15, Lqii;

    invoke-direct {v15}, Ljava/lang/Object;-><init>()V

    new-instance v4, Ltw2;

    const/16 v5, 0x14

    invoke-direct {v4, v9, v5}, Ltw2;-><init>(Ljava/lang/Object;B)V

    new-instance v5, Lvk;

    const/4 v6, 0x2

    invoke-direct {v5, v6}, Lvk;-><init>(B)V

    iput-object v5, v0, Lipk;->m:Lvk;

    new-instance v7, Lvi5;

    new-instance v6, Lkw3;

    const/16 v13, 0x1a

    invoke-direct {v6, v0, v13}, Lkw3;-><init>(Ljava/lang/Object;B)V

    move-object/from16 v11, p7

    invoke-direct {v7, v6, v4, v11}, Lvi5;-><init>(Lkw3;Ltw2;Ljava/lang/String;)V

    iput-object v7, v0, Lipk;->p:Lvi5;

    new-instance v4, Lr8f;

    invoke-direct {v4, v9}, Lr8f;-><init>(Lglh;)V

    iput-object v4, v0, Lipk;->q:Lr8f;

    new-instance v11, Lu7k;

    new-instance v4, Lkw3;

    invoke-direct {v4, v0, v13}, Lkw3;-><init>(Ljava/lang/Object;B)V

    new-instance v4, Lkw3;

    const/16 v6, 0x1b

    invoke-direct {v4, v0, v6}, Lkw3;-><init>(Ljava/lang/Object;B)V

    new-instance v4, Ltxi;

    invoke-direct {v4, v1, v6}, Ltxi;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v11}, Ljava/lang/Object;-><init>()V

    iput-object v4, v11, Lu7k;->a:Ljava/lang/Object;

    move-object/from16 v21, v5

    new-instance v5, Lk32;

    const/16 v1, 0x8

    invoke-direct {v5, v0, v2, v1}, Lk32;-><init>(Ljava/lang/Object;Landroid/content/Context;B)V

    new-instance v1, Lxbf;

    move-object/from16 v19, v7

    new-instance v7, Ljjg;

    const/4 v4, 0x7

    invoke-direct {v7, v0, v4}, Ljjg;-><init>(Ljava/lang/Object;B)V

    move-object/from16 v4, p10

    move v14, v6

    move-object/from16 v6, p13

    invoke-direct/range {v1 .. v7}, Lxbf;-><init>(Landroid/content/Context;Lumi;Le00;Lk32;Lkw0;Ljjg;)V

    iput-object v1, v0, Lipk;->k:Lxbf;

    new-instance v23, Lw6j;

    new-instance v1, Lqfb;

    new-instance v4, Lkw3;

    invoke-direct {v4, v0, v13}, Lkw3;-><init>(Ljava/lang/Object;B)V

    new-instance v6, Lkw3;

    invoke-direct {v6, v0, v14}, Lkw3;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v1, v4, v6, v15}, Lqfb;-><init>(Lkw3;Lkw3;Lqii;)V

    new-instance v4, Ldcl;

    new-instance v6, Lkw3;

    invoke-direct {v6, v0, v13}, Lkw3;-><init>(Ljava/lang/Object;B)V

    new-instance v7, Lkw3;

    invoke-direct {v7, v0, v14}, Lkw3;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v4, v6, v7, v15}, Ldcl;-><init>(Lkw3;Lkw3;Lqii;)V

    new-instance v6, Ld7h;

    new-instance v7, Ltxi;

    const/16 v14, 0x1c

    invoke-direct {v7, v11, v14}, Ltxi;-><init>(Ljava/lang/Object;B)V

    new-instance v11, Ljjg;

    const/16 v15, 0x8

    invoke-direct {v11, v8, v15}, Ljjg;-><init>(Ljava/lang/Object;B)V

    const/4 v8, 0x5

    invoke-direct {v6, v7, v11, v8}, Ld7h;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    move-object/from16 v17, v1

    move-object/from16 v18, v4

    move-object/from16 v20, v6

    move-object/from16 v16, v23

    invoke-direct/range {v16 .. v21}, Lw6j;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v1, Li32;

    const/16 v4, 0xa

    invoke-direct {v1, v3, v5, v4}, Li32;-><init>(Lumi;Lk32;B)V

    invoke-virtual {v1}, Lldk;->h()V

    new-instance v4, Llld;

    const/16 v6, 0xf

    invoke-direct {v4, v1, v6}, Llld;-><init>(Ljava/lang/Object;B)V

    iput-object v4, v0, Lipk;->e:Llld;

    new-instance v6, Leyi;

    new-instance v7, Lepk;

    const/4 v11, 0x2

    invoke-direct {v7, v0, v11}, Lepk;-><init>(Lipk;B)V

    invoke-direct {v6, v1, v4, v7}, Leyi;-><init>(Li32;Llld;Lepk;)V

    new-instance v1, Lkd7;

    new-instance v4, Lkw3;

    invoke-direct {v4, v0, v14}, Lkw3;-><init>(Ljava/lang/Object;B)V

    move-object/from16 v7, p11

    invoke-direct {v1, v3, v5, v7, v4}, Lkd7;-><init>(Lumi;Lk32;Ldu3;Lkw3;)V

    iput-object v1, v0, Lipk;->d:Lkd7;

    invoke-virtual {v1}, Lldk;->h()V

    new-instance v22, Lxbf;

    new-instance v4, Lepk;

    const/4 v7, 0x3

    invoke-direct {v4, v0, v7}, Lepk;-><init>(Lipk;B)V

    new-instance v11, Lepk;

    invoke-direct {v11, v0, v7}, Lepk;-><init>(Lipk;B)V

    new-instance v7, Lepk;

    const/4 v14, 0x4

    invoke-direct {v7, v0, v14}, Lepk;-><init>(Lipk;B)V

    new-instance v14, Lgpk;

    const/4 v15, 0x0

    invoke-direct {v14, v0, v15}, Lgpk;-><init>(Ljava/lang/Object;B)V

    new-instance v15, Lepk;

    const/4 v13, 0x1

    invoke-direct {v15, v0, v13}, Lepk;-><init>(Lipk;B)V

    move-object/from16 v25, v4

    move-object/from16 v24, v6

    move-object/from16 v27, v7

    move-object/from16 v26, v11

    move-object/from16 v28, v14

    move-object/from16 v29, v15

    invoke-direct/range {v22 .. v29}, Lxbf;-><init>(Lw6j;Leyi;Lepk;Lepk;Lepk;Lgpk;Lepk;)V

    move-object/from16 v4, v22

    iput-object v4, v0, Lipk;->a:Lxbf;

    new-instance v6, Lqie;

    iget-object v4, v4, Lxbf;->c:Ljava/lang/Object;

    check-cast v4, Lh42;

    invoke-direct {v6, v2, v4}, Lqie;-><init>(Landroid/content/Context;Lh42;)V

    iput-object v6, v0, Lipk;->s:Lqie;

    new-instance v2, Ljs6;

    new-instance v4, Lqlk;

    invoke-direct {v4, v0, v8}, Lqlk;-><init>(Ljava/lang/Object;B)V

    new-instance v6, Ltxi;

    const/16 v7, 0x1a

    invoke-direct {v6, v1, v7}, Ltxi;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v2, v12, v9, v4, v6}, Ljs6;-><init>(Lcpk;Lglh;Lqlk;Ltxi;)V

    iput-object v2, v0, Lipk;->b:Ljs6;

    new-instance v1, Li32;

    const/16 v2, 0xb

    invoke-direct {v1, v3, v5, v2}, Li32;-><init>(Lumi;Lk32;B)V

    iput-object v1, v0, Lipk;->c:Li32;

    invoke-virtual {v1}, Lldk;->h()V

    move-object/from16 v1, p8

    invoke-virtual {v1, v0}, Ltcc;->a(Lmdc;)V

    iput-object v10, v0, Lipk;->r:Lf35;

    iget-object v1, v10, Lf35;->a:Li7f;

    invoke-virtual {v1, v0}, Li7f;->b(Ljava/lang/Object;)Z

    new-instance v1, Lfpk;

    const/4 v15, 0x0

    invoke-direct {v1, v0, v15}, Lfpk;-><init>(Ljava/lang/Object;B)V

    invoke-static {v1}, Lsle;->a(Lorg/chromium/net/NetworkChangeNotifier$ConnectionTypeObserver;)Lrle;

    move-result-object v1

    iput-object v1, v0, Lipk;->n:Lrle;

    invoke-virtual {v0, v13}, Lipk;->R(Z)Z

    return-void
.end method

.method public static S()Ljava/util/Date;
    .registers 5

    new-instance v0, Ljava/util/Date;

    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    const-wide/32 v3, 0x48190800

    sub-long/2addr v1, v3

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    return-object v0
.end method


# virtual methods
.method public final P()V
    .registers 1

    iget-object p0, p0, Lipk;->b:Ljs6;

    invoke-virtual {p0}, Ljs6;->a()V

    return-void
.end method

.method public final R(Z)Z
    .registers 8

    invoke-static {}, Lsle;->d()Z

    move-result v0

    iget-boolean v1, p0, Lipk;->o:Z

    if-ne v1, v0, :cond_c

    if-nez p1, :cond_c

    const/4 p0, 0x0

    return p0

    :cond_c
    iput-boolean v0, p0, Lipk;->o:Z

    iget-object p1, p0, Lipk;->a:Lxbf;

    iget-object p1, p1, Lxbf;->g:Ljava/lang/Object;

    check-cast p1, Leyi;

    iput-boolean v0, p1, Leyi;->b:Z

    if-eqz v0, :cond_21

    const-wide/32 v0, 0x5265c00

    const-wide/32 v2, 0x240c8400

    const-wide/16 v4, 0x0

    goto :goto_29

    :cond_21
    const-wide v2, 0x7fffffffffffffffL

    const-wide/high16 v0, -0x8000000000000000L

    move-wide v4, v2

    :goto_29
    iget-object p0, p0, Lipk;->p:Lvi5;

    iput-wide v0, p0, Lvi5;->a:J

    iput-wide v2, p0, Lvi5;->b:J

    iput-wide v4, p0, Lvi5;->c:J

    const/4 p0, 0x1

    return p0
.end method

.method public final T(Ljava/lang/String;)Z
    .registers 19

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    sget-object v2, Lf8a;->d:Lf8a;

    invoke-virtual {v2, v1}, Lf8a;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const/4 v13, 0x0

    :goto_b
    sget-object v3, Ltok;->a:Ly0b;

    iget v5, v3, Ly0b;->b:I

    const/4 v14, 0x1

    if-ge v13, v5, :cond_50

    invoke-virtual {v3, v13}, Ly0b;->d(I)I

    move-result v5

    iget-object v15, v0, Lipk;->c:Li32;

    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v3, Lhpk;

    invoke-direct {v3, v4, v5}, Lhpk;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v15}, Lldk;->i()V

    iget-object v6, v15, Li32;->l:Ljava/lang/Object;

    check-cast v6, Ljava/util/HashMap;

    invoke-virtual {v6, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lnxd;

    if-nez v6, :cond_49

    move-object v6, v3

    new-instance v3, Lnxd;

    const-wide/16 v10, 0x0

    const/4 v12, 0x0

    move-object v8, v6

    const-wide/16 v6, 0x0

    move-object/from16 v16, v8

    const-wide/16 v8, 0x0

    move-object/from16 v2, v16

    invoke-direct/range {v3 .. v12}, Lnxd;-><init>(Ljava/lang/String;IJJJZ)V

    iget-object v5, v15, Li32;->l:Ljava/lang/Object;

    check-cast v5, Ljava/util/HashMap;

    invoke-virtual {v5, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v6, v3

    :cond_49
    iget-boolean v2, v6, Lnxd;->f:Z

    if-nez v2, :cond_e6

    add-int/lit8 v13, v13, 0x1

    goto :goto_b

    :cond_50
    iget-object v0, v0, Lipk;->f:Lwok;

    invoke-virtual {v0}, Lno7;->i()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lvok;

    iget-object v0, v0, Lvok;->e:Lrgh;

    invoke-static {v1}, Lwqm;->i(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_e8

    const/4 v3, -0x1

    :cond_61
    iget-object v4, v0, Lrgh;->a:Ljava/lang/Object;

    check-cast v4, Ltxi;

    add-int/2addr v3, v14

    iget-object v4, v4, Ltxi;->b:Ljava/lang/Object;

    check-cast v4, Lyv4;

    iget-wide v5, v4, Lyv4;->b:J

    const-wide/16 v7, 0x0

    cmp-long v7, v5, v7

    const/4 v8, 0x0

    if-nez v7, :cond_7f

    iget-object v5, v4, Lyv4;->c:Ljava/lang/Object;

    check-cast v5, [Ljava/lang/String;

    invoke-static {v5}, LJ/N;->M3b1Oxa6(Ljava/lang/Object;)J

    move-result-wide v5

    iput-wide v5, v4, Lyv4;->b:J

    iput-object v8, v4, Lyv4;->c:Ljava/lang/Object;

    :cond_7f
    invoke-static {v5, v6, v2, v3}, LJ/N;->MDOEBfJ5(JLjava/lang/Object;I)I

    move-result v3

    if-ltz v3, :cond_e8

    iget-object v4, v0, Lrgh;->b:Ljava/lang/Object;

    check-cast v4, [Ljava/lang/String;

    aget-object v4, v4, v3

    sget-object v5, Lwqm;->a:[Ljava/lang/String;

    :try_start_8d
    new-instance v5, Ljava/net/URI;

    invoke-direct {v5, v1}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v8
    :try_end_96
    .catch Ljava/net/URISyntaxException; {:try_start_8d .. :try_end_96} :catch_96

    :catch_96
    if-nez v8, :cond_9a

    const/4 v4, 0x0

    goto :goto_e4

    :cond_9a
    const-string v5, "*"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_a4

    move v4, v14

    goto :goto_e4

    :cond_a4
    const-string v6, "/"

    invoke-virtual {v8, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_b0

    invoke-virtual {v8, v14}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    :cond_b0
    invoke-virtual {v8, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_bb

    const/4 v6, 0x0

    invoke-static {v14, v6, v8}, Lp3p;->h(IILjava/lang/String;)Ljava/lang/String;

    move-result-object v8

    :cond_bb
    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_cb

    invoke-virtual {v4, v14}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v8, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    move v4, v6

    goto :goto_e4

    :cond_cb
    invoke-virtual {v4, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_e0

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    sub-int/2addr v5, v14

    const/4 v6, 0x0

    invoke-virtual {v4, v6, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v8, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    goto :goto_e4

    :cond_e0
    invoke-virtual {v8, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    :goto_e4
    if-eqz v4, :cond_61

    :cond_e6
    move v2, v14

    goto :goto_ea

    :cond_e8
    const/4 v6, 0x0

    move v2, v6

    :goto_ea
    return v2
.end method

.method public final U(Ljava/lang/String;)Z
    .registers 6

    iget-object v0, p0, Lipk;->h:Leq6;

    iget-object v0, v0, Leq6;->a:Ljava/lang/Object;

    check-cast v0, Lrr8;

    invoke-virtual {v0}, Lldk;->i()V

    iget-object v0, v0, Lrr8;->l:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0, p1}, Laik;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object p0, p0, Lipk;->j:Lcpk;

    iget-object v1, p0, Lcpk;->a:Lepk;

    iget-object v1, v1, Lepk;->b:Lipk;

    iget-object v1, v1, Lipk;->i:Lnr8;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lge5;

    const/16 v3, 0x13

    invoke-direct {v2, v1, v0, v3}, Lge5;-><init>(Ljava/lang/Object;Ljava/lang/String;B)V

    check-cast v1, Lcom/opera/android/favorites/e;

    iget-object v1, v1, Lcom/opera/android/favorites/e;->f:Lcom/opera/android/favorites/b;

    invoke-static {v2, v1}, Lnr8;->g(Lmr8;Ltq8;)Lhq8;

    move-result-object v1

    const/4 v2, 0x1

    if-eqz v1, :cond_33

    return v2

    :cond_33
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_3b

    return v1

    :cond_3b
    iget-object p0, p0, Lcpk;->a:Lepk;

    iget-object p0, p0, Lepk;->b:Lipk;

    iget-object p0, p0, Lipk;->i:Lnr8;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lge5;

    invoke-direct {v0, p0, p1, v3}, Lge5;-><init>(Ljava/lang/Object;Ljava/lang/String;B)V

    check-cast p0, Lcom/opera/android/favorites/e;

    iget-object p0, p0, Lcom/opera/android/favorites/e;->f:Lcom/opera/android/favorites/b;

    invoke-static {v0, p0}, Lnr8;->g(Lmr8;Ltq8;)Lhq8;

    move-result-object p0

    if-eqz p0, :cond_54

    return v2

    :cond_54
    return v1
.end method

.method public final V(Ljava/lang/String;)Z
    .registers 4

    iget-object p0, p0, Lipk;->d:Lkd7;

    iget-boolean v0, p0, Lkd7;->m:Z

    if-eqz v0, :cond_27

    iget-object v0, p0, Lkd7;->k:Lld7;

    const/4 v1, 0x4

    if-eqz v0, :cond_23

    iget-object p0, p0, Lkd7;->l:Ljava/util/HashMap;

    sget-object v0, Lwqm;->a:[Ljava/lang/String;

    invoke-static {p1}, Laik;->f(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    sget-object v0, Lwqm;->e:[Ljava/lang/String;

    invoke-static {p1, v0}, Laik;->s(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lhd7;

    if-eqz p0, :cond_23

    iget v1, p0, Lhd7;->b:I

    :cond_23
    const/4 p0, 0x1

    if-ne v1, p0, :cond_27

    return p0

    :cond_27
    const/4 p0, 0x0

    return p0
.end method

.method public final X(Ljava/util/HashSet;Ljava/util/HashSet;Look;)V
    .registers 26

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-virtual/range {p1 .. p1}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_8
    const/4 v4, 0x0

    :goto_9
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    const/16 v6, 0xb

    const/16 v7, 0x9

    const/4 v8, 0x4

    const/4 v9, 0x2

    const/4 v10, 0x5

    const/4 v12, 0x6

    iget-object v15, v0, Lipk;->e:Llld;

    const-wide/16 v16, 0x1

    const-wide/16 v18, 0x0

    iget-object v13, v0, Lipk;->c:Li32;

    if-eqz v5, :cond_10e

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Look;

    iget-object v14, v5, Look;->b:Ljava/lang/String;

    const/16 v20, 0x3

    iget-byte v11, v5, Look;->e:B

    iget-byte v5, v5, Look;->d:B

    invoke-virtual {v13, v5, v14}, Li32;->k(ILjava/lang/String;)Lnxd;

    move-result-object v14

    move/from16 v21, v4

    iget-wide v3, v14, Lnxd;->c:J

    add-long v3, v3, v16

    iput-wide v3, v14, Lnxd;->c:J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iput-wide v3, v14, Lnxd;->e:J

    new-instance v3, Lnxd;

    invoke-direct {v3, v14}, Lnxd;-><init>(Lnxd;)V

    invoke-virtual {v13, v3}, Lldk;->g(Ljava/lang/Object;)V

    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-eq v5, v12, :cond_108

    if-eq v5, v6, :cond_108

    if-eq v11, v7, :cond_108

    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    invoke-virtual/range {p1 .. p1}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_5e
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_7d

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Look;

    iget-byte v7, v6, Look;->e:B

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v3, v7}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    iget-byte v6, v6, Look;->e:B

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_5e

    :cond_7d
    new-instance v5, Ljava/util/HashSet;

    invoke-direct {v5}, Ljava/util/HashSet;-><init>()V

    invoke-virtual/range {p2 .. p2}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_86
    :goto_86
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_a8

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Look;

    iget-byte v13, v7, Look;->e:B

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v3, v13}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_86

    iget-byte v7, v7, Look;->e:B

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_86

    :cond_a8
    const/4 v7, 0x1

    filled-new-array {v9, v7}, [I

    move-result-object v3

    invoke-static {v4, v5, v3}, Llld;->g0(Ljava/util/HashSet;Ljava/util/HashSet;[I)Z

    move-result v3

    filled-new-array {v10, v8}, [I

    move-result-object v6

    invoke-static {v4, v5, v6}, Llld;->g0(Ljava/util/HashSet;Ljava/util/HashSet;[I)Z

    move-result v6

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v7

    const/4 v13, 0x7

    const/16 v14, 0x8

    filled-new-array {v13, v14}, [I

    move-result-object v13

    invoke-static {v4, v5, v13}, Llld;->g0(Ljava/util/HashSet;Ljava/util/HashSet;[I)Z

    move-result v4

    invoke-static {v3, v6, v7, v4}, Lvep;->k(IIII)I

    move-result v5

    if-eqz v5, :cond_108

    packed-switch v11, :pswitch_data_1a2

    const/4 v8, 0x1

    goto :goto_df

    :pswitch_d7
    move v8, v12

    goto :goto_df

    :pswitch_d9
    move v8, v10

    goto :goto_df

    :pswitch_db
    move v8, v9

    goto :goto_df

    :pswitch_dd
    move/from16 v8, v20

    :goto_df
    :pswitch_df
    const-wide v11, 0x3f747ae147ae147bL    # 0.005

    invoke-virtual {v15, v8, v11, v12}, Llld;->d0(ID)D

    move-result-wide v11

    cmpl-double v8, v11, v18

    if-eqz v8, :cond_108

    int-to-double v13, v5

    div-double/2addr v11, v13

    if-eqz v3, :cond_f5

    const/4 v3, 0x1

    invoke-virtual {v15, v3, v11, v12}, Llld;->Z(ID)V

    goto :goto_f6

    :cond_f5
    const/4 v3, 0x1

    :goto_f6
    if-eqz v6, :cond_fb

    invoke-virtual {v15, v9, v11, v12}, Llld;->Z(ID)V

    :cond_fb
    if-eqz v7, :cond_102

    move/from16 v5, v20

    invoke-virtual {v15, v5, v11, v12}, Llld;->Z(ID)V

    :cond_102
    if-eqz v4, :cond_10b

    invoke-virtual {v15, v10, v11, v12}, Llld;->Z(ID)V

    goto :goto_10b

    :cond_108
    const/4 v3, 0x1

    if-eqz v21, :cond_8

    :cond_10b
    :goto_10b
    move v4, v3

    goto/16 :goto_9

    :cond_10e
    move/from16 v21, v4

    const/4 v3, 0x1

    const/4 v5, 0x3

    if-eqz v1, :cond_198

    iget-byte v2, v1, Look;->e:B

    iget-byte v4, v1, Look;->d:B

    iget-object v1, v1, Look;->b:Ljava/lang/String;

    invoke-virtual {v13, v4, v1}, Li32;->k(ILjava/lang/String;)Lnxd;

    move-result-object v1

    iget-wide v8, v1, Lnxd;->d:J

    add-long v8, v8, v16

    iput-wide v8, v1, Lnxd;->d:J

    new-instance v8, Lnxd;

    invoke-direct {v8, v1}, Lnxd;-><init>(Lnxd;)V

    invoke-virtual {v13, v8}, Lldk;->g(Ljava/lang/Object;)V

    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-eq v4, v12, :cond_191

    if-eq v4, v6, :cond_191

    if-eq v2, v7, :cond_191

    new-instance v1, Ljava/util/HashSet;

    invoke-virtual/range {p1 .. p1}, Ljava/util/HashSet;->size()I

    move-result v4

    invoke-direct {v1, v4}, Ljava/util/HashSet;-><init>(I)V

    invoke-virtual/range {p1 .. p1}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v4

    move-wide/from16 v8, v18

    :cond_144
    :goto_144
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_17d

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Look;

    iget-byte v6, v6, Look;->e:B

    if-eq v6, v7, :cond_144

    packed-switch v6, :pswitch_data_1b8

    move v6, v3

    goto :goto_162

    :pswitch_159
    move v6, v12

    goto :goto_162

    :pswitch_15b
    move v6, v10

    goto :goto_162

    :pswitch_15d
    const/4 v6, 0x4

    goto :goto_162

    :pswitch_15f
    const/4 v6, 0x2

    goto :goto_162

    :pswitch_161
    move v6, v5

    :goto_162
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v1, v13}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v13

    move-object/from16 p1, v4

    if-eqz v13, :cond_179

    const-wide v3, 0x3fb999999999999aL    # 0.1

    invoke-virtual {v15, v6, v3, v4}, Llld;->d0(ID)D

    move-result-wide v3

    add-double/2addr v3, v8

    move-wide v8, v3

    :cond_179
    move-object/from16 v4, p1

    const/4 v3, 0x1

    goto :goto_144

    :cond_17d
    cmpl-double v1, v8, v18

    if-eqz v1, :cond_191

    packed-switch v2, :pswitch_data_1ce

    const/4 v12, 0x1

    goto :goto_18d

    :pswitch_186
    move v12, v10

    goto :goto_18d

    :pswitch_188
    const/4 v12, 0x4

    goto :goto_18d

    :pswitch_18a
    const/4 v12, 0x2

    goto :goto_18d

    :pswitch_18c
    move v12, v5

    :goto_18d
    :pswitch_18d
    invoke-virtual {v15, v12, v8, v9}, Llld;->Z(ID)V

    goto :goto_193

    :cond_191
    if-eqz v21, :cond_195

    :goto_193
    const/4 v3, 0x1

    goto :goto_196

    :cond_195
    const/4 v3, 0x0

    :goto_196
    move v4, v3

    goto :goto_19a

    :cond_198
    move/from16 v4, v21

    :goto_19a
    if-eqz v4, :cond_1a1

    iget-object v0, v0, Lipk;->b:Ljs6;

    invoke-virtual {v0}, Ljs6;->a()V

    :cond_1a1
    return-void

    :pswitch_data_1a2
    .packed-switch 0x3
        :pswitch_dd
        :pswitch_db
        :pswitch_db
        :pswitch_df
        :pswitch_d9
        :pswitch_d9
        :pswitch_d7
        :pswitch_d7
        :pswitch_df
    .end packed-switch

    :pswitch_data_1b8
    .packed-switch 0x3
        :pswitch_161
        :pswitch_15f
        :pswitch_15f
        :pswitch_15d
        :pswitch_15b
        :pswitch_15b
        :pswitch_159
        :pswitch_159
        :pswitch_15d
    .end packed-switch

    :pswitch_data_1ce
    .packed-switch 0x3
        :pswitch_18c
        :pswitch_18a
        :pswitch_18a
        :pswitch_188
        :pswitch_186
        :pswitch_186
        :pswitch_18d
        :pswitch_18d
        :pswitch_188
    .end packed-switch
.end method

.method public final onDestroy(Lndc;)V
    .registers 9

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    iget-object p1, p0, Lipk;->b:Ljs6;

    iget-object v0, p1, Ljs6;->c:Ljava/lang/Object;

    check-cast v0, Lcpk;

    iget-object v1, p1, Ljs6;->i:Ljava/lang/Object;

    check-cast v1, Lopk;

    iget-object v0, v0, Lcpk;->c:Lh7f;

    invoke-virtual {v0, v1}, Lh7f;->c(Ljava/lang/Object;)Z

    iget-object v0, p1, Ljs6;->d:Ljava/lang/Object;

    check-cast v0, Lglh;

    iget-object p1, p1, Ljs6;->g:Ljava/lang/Object;

    check-cast p1, Lppk;

    iget-object v0, v0, Lglh;->b:Lh7f;

    invoke-virtual {v0, p1}, Lh7f;->c(Ljava/lang/Object;)Z

    const/4 p1, 0x1

    iget-object v0, p0, Lipk;->j:Lcpk;

    iput-boolean p1, v0, Lcpk;->f:Z

    iget-object p1, v0, Lcpk;->e:Ltq8;

    if-eqz p1, :cond_4e

    invoke-virtual {p1, v0}, Ltq8;->B(Lsq8;)V

    iget-object p1, v0, Lcpk;->e:Ltq8;

    iget-object p1, p1, Ltq8;->e:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :cond_38
    :goto_38
    if-ge v2, v1, :cond_4e

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Lhq8;

    invoke-virtual {v3}, Lhq8;->j()Z

    move-result v4

    if-eqz v4, :cond_38

    check-cast v3, Ltq8;

    invoke-virtual {v3, v0}, Ltq8;->B(Lsq8;)V

    goto :goto_38

    :cond_4e
    iget-object p1, p0, Lipk;->n:Lrle;

    iget-object p1, p1, Lrle;->a:Lorg/chromium/net/NetworkChangeNotifier$ConnectionTypeObserver;

    invoke-static {p1}, Lorg/chromium/net/NetworkChangeNotifier;->removeConnectionTypeObserver(Lorg/chromium/net/NetworkChangeNotifier$ConnectionTypeObserver;)V

    iget-object p1, p0, Lipk;->q:Lr8f;

    iget-object v0, p1, Lr8f;->a:Lglh;

    iget-object v0, v0, Lglh;->b:Lh7f;

    invoke-virtual {v0, p1}, Lh7f;->c(Ljava/lang/Object;)Z

    iget-object p1, p0, Lipk;->r:Lf35;

    iget-object p1, p1, Lf35;->a:Li7f;

    invoke-virtual {p1, p0}, Li7f;->c(Ljava/lang/Object;)Z

    iget-object p1, p0, Lipk;->d:Lkd7;

    iget-object v0, p1, Lkd7;->k:Lld7;

    if-eqz v0, :cond_72

    iget-object v0, v0, Lld7;->c:Ljava/lang/Object;

    check-cast v0, Li7f;

    invoke-virtual {v0, p1}, Li7f;->c(Ljava/lang/Object;)Z

    :cond_72
    iget-object p0, p0, Lipk;->k:Lxbf;

    iget-object p0, p0, Lxbf;->c:Ljava/lang/Object;

    check-cast p0, Lx79;

    iget-object p1, p0, Lx79;->e:Ljava/lang/Object;

    check-cast p1, Lx79;

    if-eqz p1, :cond_9c

    iget-object v0, p1, Lx79;->c:Ljava/lang/Object;

    check-cast v0, Lv2g;

    const/4 v1, 0x0

    if-eqz v0, :cond_96

    iget-object v0, v0, Lt2g;->a:Lcom/opera/android/browser/SimpleUrlLoader;

    iget-wide v2, v0, Lcom/opera/android/browser/SimpleUrlLoader;->a:J

    const-wide/16 v4, 0x0

    cmp-long v6, v2, v4

    if-eqz v6, :cond_94

    invoke-static {v2, v3}, LJ/N;->Mnq_7cIN(J)V

    iput-wide v4, v0, Lcom/opera/android/browser/SimpleUrlLoader;->a:J

    :cond_94
    iput-object v1, p1, Lx79;->c:Ljava/lang/Object;

    :cond_96
    iput-object v1, p1, Lx79;->d:Ljava/lang/Object;

    iput-object v1, p1, Lx79;->e:Ljava/lang/Object;

    iput-object v1, p0, Lx79;->e:Ljava/lang/Object;

    :cond_9c
    return-void
.end method

.method public final onStart(Lndc;)V
    .registers 4

    const/4 p1, 0x1

    iget-object p0, p0, Lipk;->b:Ljs6;

    iput-boolean p1, p0, Ljs6;->a:Z

    iget-object p1, p0, Ljs6;->h:Ljava/lang/Object;

    check-cast p1, Lopk;

    const-wide/32 v0, 0x1b7740

    invoke-static {p1, v0, v1}, Lvml;->d(Ljava/lang/Runnable;J)V

    invoke-virtual {p0}, Ljs6;->a()V

    return-void
.end method

.method public final onStop(Lndc;)V
    .registers 2

    const/4 p1, 0x0

    iget-object p0, p0, Lipk;->b:Ljs6;

    iput-boolean p1, p0, Ljs6;->a:Z

    iget-object p0, p0, Ljs6;->h:Ljava/lang/Object;

    check-cast p0, Lopk;

    invoke-static {p0}, Lvml;->a(Ljava/lang/Runnable;)V

    return-void
.end method
