.class public Lcom/opera/android/downloads/DownloadItemWrapper;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/android/downloads/DownloadItem;


# instance fields
.field public a:J

.field public final b:Lh7f;

.field public c:B


# direct methods
.method public constructor <init>(J)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lh7f;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/opera/android/downloads/DownloadItemWrapper;->b:Lh7f;

    const/4 v0, 0x0

    iput-byte v0, p0, Lcom/opera/android/downloads/DownloadItemWrapper;->c:B

    iput-wide p1, p0, Lcom/opera/android/downloads/DownloadItemWrapper;->a:J

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;)V
    .registers 6

    iget-wide v0, p0, Lcom/opera/android/downloads/DownloadItemWrapper;->a:J

    const-wide/16 v2, 0x0

    cmp-long p0, v0, v2

    if-nez p0, :cond_9

    return-void

    :cond_9
    invoke-static {v0, v1, p1}, LJ/N;->MxRxyxjm(JLjava/lang/Object;)V

    return-void
.end method

.method public final b()J
    .registers 5

    iget-wide v0, p0, Lcom/opera/android/downloads/DownloadItemWrapper;->a:J

    const-wide/16 v2, 0x0

    cmp-long p0, v0, v2

    if-nez p0, :cond_9

    return-wide v2

    :cond_9
    invoke-static {v0, v1}, LJ/N;->MGRXh7P_(J)J

    move-result-wide v0

    return-wide v0
.end method

.method public final c()Ljava/lang/String;
    .registers 5

    iget-wide v0, p0, Lcom/opera/android/downloads/DownloadItemWrapper;->a:J

    const-wide/16 v2, 0x0

    cmp-long p0, v0, v2

    if-nez p0, :cond_b

    const-string p0, ""

    return-object p0

    :cond_b
    invoke-static {v0, v1}, LJ/N;->MY2A$B8A(J)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method public final cancel()V
    .registers 5

    iget-wide v0, p0, Lcom/opera/android/downloads/DownloadItemWrapper;->a:J

    const-wide/16 v2, 0x0

    cmp-long p0, v0, v2

    if-nez p0, :cond_9

    return-void

    :cond_9
    const/4 p0, 0x0

    invoke-static {v0, v1, p0}, LJ/N;->MibYHGiY(JZ)V

    return-void
.end method

.method public final d(Ljava/lang/String;)V
    .registers 6

    iget-wide v0, p0, Lcom/opera/android/downloads/DownloadItemWrapper;->a:J

    const-wide/16 v2, 0x0

    cmp-long p0, v0, v2

    if-nez p0, :cond_9

    return-void

    :cond_9
    invoke-static {v0, v1, p1}, LJ/N;->Mb4IY7ak(JLjava/lang/Object;)V

    return-void
.end method

.method public final e()I
    .registers 5

    iget-wide v0, p0, Lcom/opera/android/downloads/DownloadItemWrapper;->a:J

    const-wide/16 v2, 0x0

    cmp-long p0, v0, v2

    if-nez p0, :cond_a

    const/4 p0, 0x0

    return p0

    :cond_a
    invoke-static {v0, v1}, LJ/N;->MlyMuNZ_(J)I

    move-result p0

    return p0
.end method

.method public final f()Lorg/chromium/content_public/browser/WebContents;
    .registers 5

    iget-wide v0, p0, Lcom/opera/android/downloads/DownloadItemWrapper;->a:J

    const-wide/16 v2, 0x0

    cmp-long p0, v0, v2

    if-nez p0, :cond_a

    const/4 p0, 0x0

    return-object p0

    :cond_a
    invoke-static {v0, v1}, LJ/N;->Mt8u9gXm(J)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lorg/chromium/content_public/browser/WebContents;

    return-object p0
.end method

.method public final g()Ljava/lang/String;
    .registers 5

    iget-wide v0, p0, Lcom/opera/android/downloads/DownloadItemWrapper;->a:J

    const-wide/16 v2, 0x0

    cmp-long p0, v0, v2

    if-nez p0, :cond_b

    const-string p0, ""

    return-object p0

    :cond_b
    invoke-static {v0, v1}, LJ/N;->MSDDruyz(J)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method public final getId()J
    .registers 5

    iget-wide v0, p0, Lcom/opera/android/downloads/DownloadItemWrapper;->a:J

    const-wide/16 v2, 0x0

    cmp-long p0, v0, v2

    if-nez p0, :cond_9

    return-wide v2

    :cond_9
    invoke-static {v0, v1}, LJ/N;->MsCG5nFy(J)J

    move-result-wide v0

    return-wide v0
.end method

.method public final getState()I
    .registers 5

    iget-wide v0, p0, Lcom/opera/android/downloads/DownloadItemWrapper;->a:J

    const-wide/16 v2, 0x0

    cmp-long p0, v0, v2

    if-nez p0, :cond_a

    const/4 p0, 0x0

    return p0

    :cond_a
    invoke-static {v0, v1}, LJ/N;->MZJBKWfH(J)I

    move-result p0

    return p0
.end method

.method public final getUrl()Ljava/lang/String;
    .registers 5

    iget-wide v0, p0, Lcom/opera/android/downloads/DownloadItemWrapper;->a:J

    const-wide/16 v2, 0x0

    cmp-long p0, v0, v2

    if-nez p0, :cond_b

    const-string p0, ""

    return-object p0

    :cond_b
    invoke-static {v0, v1}, LJ/N;->Mi9OoezY(J)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method public final h()Ljava/lang/String;
    .registers 5

    iget-wide v0, p0, Lcom/opera/android/downloads/DownloadItemWrapper;->a:J

    const-wide/16 v2, 0x0

    cmp-long p0, v0, v2

    if-nez p0, :cond_b

    const-string p0, ""

    return-object p0

    :cond_b
    invoke-static {v0, v1}, LJ/N;->MYqjgXx_(J)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method public final i()J
    .registers 5

    iget-wide v0, p0, Lcom/opera/android/downloads/DownloadItemWrapper;->a:J

    const-wide/16 v2, 0x0

    cmp-long p0, v0, v2

    if-nez p0, :cond_9

    return-wide v2

    :cond_9
    invoke-static {v0, v1}, LJ/N;->Mim06BuT(J)J

    move-result-wide v0

    return-wide v0
.end method

.method public final j(Lre7;)Z
    .registers 2

    iget-object p0, p0, Lcom/opera/android/downloads/DownloadItemWrapper;->b:Lh7f;

    invoke-virtual {p0, p1}, Lh7f;->b(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public final k()J
    .registers 5

    iget-wide v0, p0, Lcom/opera/android/downloads/DownloadItemWrapper;->a:J

    const-wide/16 v2, 0x0

    cmp-long p0, v0, v2

    if-nez p0, :cond_9

    return-wide v2

    :cond_9
    invoke-static {v0, v1}, LJ/N;->M6ybzcxh(J)J

    move-result-wide v0

    return-wide v0
.end method

.method public final l()Z
    .registers 5

    iget-wide v0, p0, Lcom/opera/android/downloads/DownloadItemWrapper;->a:J

    const-wide/16 v2, 0x0

    cmp-long p0, v0, v2

    if-nez p0, :cond_a

    const/4 p0, 0x0

    return p0

    :cond_a
    invoke-static {v0, v1}, LJ/N;->MTk8hRbC(J)Z

    move-result p0

    return p0
.end method

.method public final m()I
    .registers 1

    iget-byte p0, p0, Lcom/opera/android/downloads/DownloadItemWrapper;->c:B

    return p0
.end method

.method public final n()J
    .registers 5

    iget-wide v0, p0, Lcom/opera/android/downloads/DownloadItemWrapper;->a:J

    const-wide/16 v2, 0x0

    cmp-long p0, v0, v2

    if-nez p0, :cond_9

    return-wide v2

    :cond_9
    invoke-static {v0, v1}, LJ/N;->MBn5fRYt(J)J

    move-result-wide v0

    return-wide v0
.end method

.method public final o(I)V
    .registers 6

    iget-wide v0, p0, Lcom/opera/android/downloads/DownloadItemWrapper;->a:J

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-nez v2, :cond_9

    return-void

    :cond_9
    iput-byte p1, p0, Lcom/opera/android/downloads/DownloadItemWrapper;->c:B

    invoke-static {v0, v1}, LJ/N;->MTYRKIE2(J)V

    return-void
.end method

.method public final onDestroyed()V
    .registers 3

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/opera/android/downloads/DownloadItemWrapper;->a:J

    return-void
.end method

.method public final onStateChanged(I)V
    .registers 27

    move/from16 v0, p1

    new-instance v1, Lg7f;

    move-object/from16 v2, p0

    iget-object v2, v2, Lcom/opera/android/downloads/DownloadItemWrapper;->b:Lh7f;

    invoke-direct {v1, v2}, Lg7f;-><init>(Lh7f;)V

    :goto_b
    invoke-virtual {v1}, Lg7f;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_128

    invoke-virtual {v1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lre7;

    iget-object v3, v2, Lre7;->a:Lxf7;

    iget-object v4, v2, Lre7;->a:Lxf7;

    iget-object v5, v2, Lre7;->t:Lcom/opera/android/downloads/DownloadItem;

    const/4 v6, 0x2

    const/4 v7, 0x1

    const/4 v8, 0x3

    if-ne v0, v8, :cond_4c

    invoke-interface {v5}, Lcom/opera/android/downloads/DownloadItem;->e()I

    move-result v9

    const/16 v10, 0xf

    if-ne v9, v10, :cond_4c

    iget v9, v2, Lre7;->v:I

    if-ge v9, v7, :cond_4c

    iget-object v9, v3, Lxf7;->b:Lcom/opera/android/downloads/DownloadPauseManager;

    invoke-interface {v5}, Lcom/opera/android/downloads/DownloadItem;->getId()J

    move-result-wide v10

    iget-wide v12, v9, Lcom/opera/android/downloads/DownloadPauseManager;->a:J

    invoke-static {v12, v13, v10, v11}, LJ/N;->MNFDpvSY(JJ)I

    move-result v9

    if-eq v9, v6, :cond_4c

    iget v9, v2, Lre7;->v:I

    add-int/2addr v9, v7

    iput v9, v2, Lre7;->v:I

    new-instance v7, Lbl6;

    const/16 v9, 0x11

    invoke-direct {v7, v2, v9}, Lbl6;-><init>(Ljava/lang/Object;B)V

    invoke-static {v7}, Lvml;->c(Ljava/lang/Runnable;)V

    goto :goto_5e

    :cond_4c
    iget-object v9, v4, Lxf7;->b:Lcom/opera/android/downloads/DownloadPauseManager;

    invoke-interface {v5}, Lcom/opera/android/downloads/DownloadItem;->getId()J

    move-result-wide v10

    iget-wide v12, v9, Lcom/opera/android/downloads/DownloadPauseManager;->a:J

    invoke-static {v12, v13, v10, v11}, LJ/N;->MNFDpvSY(JJ)I

    move-result v9

    if-nez v9, :cond_5b

    const/4 v7, 0x0

    :cond_5b
    invoke-virtual {v2, v0, v7}, Lre7;->B(IZ)V

    :goto_5e
    iget-wide v9, v2, Lre7;->q:J

    const-wide/16 v11, 0x0

    cmp-long v7, v9, v11

    if-nez v7, :cond_6c

    iget-wide v9, v2, Lre7;->r:J

    cmp-long v7, v9, v11

    if-eqz v7, :cond_8d

    :cond_6c
    iget-object v7, v3, Lxf7;->d:Lag7;

    iget-object v7, v7, Lag7;->b:Landroid/content/Context;

    sget-object v9, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v7}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    check-cast v7, Lcom/opera/android/OperaApplication;

    invoke-virtual {v7}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v7

    iget-object v13, v7, Ld6j;->c:Lx5f;

    iget-wide v14, v2, Lre7;->q:J

    iget-wide v9, v2, Lre7;->r:J

    const-string v18, "downloads"

    move-wide/from16 v16, v9

    invoke-virtual/range {v13 .. v18}, Lx5f;->J(JJLjava/lang/String;)V

    iput-wide v11, v2, Lre7;->q:J

    iput-wide v11, v2, Lre7;->r:J

    :cond_8d
    iget v7, v2, Lre7;->f:I

    invoke-static {v7}, Lvep;->A(I)I

    move-result v7

    if-eq v7, v6, :cond_9e

    if-eq v7, v8, :cond_9a

    move-object v4, v1

    goto/16 :goto_123

    :cond_9a
    sget-object v6, Ltc0;->b:Ltc0;

    :goto_9c
    move-object v8, v6

    goto :goto_a6

    :cond_9e
    if-ne v0, v6, :cond_a3

    sget-object v6, Ltc0;->c:Ltc0;

    goto :goto_9c

    :cond_a3
    sget-object v6, Ltc0;->d:Ltc0;

    goto :goto_9c

    :goto_a6
    iget-object v6, v2, Lre7;->d:Landroid/net/Uri;

    if-nez v6, :cond_be

    iget-object v4, v4, Lxf7;->d:Lag7;

    iget-object v4, v4, Lag7;->b:Landroid/content/Context;

    sget-object v6, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v4}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    check-cast v4, Lcom/opera/android/OperaApplication;

    invoke-virtual {v4}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v4

    invoke-virtual {v4}, Lcom/opera/android/settings/SettingsManager;->m()Landroid/net/Uri;

    move-result-object v6

    :cond_be
    invoke-virtual {v2}, Lre7;->o()Z

    move-result v4

    if-nez v4, :cond_d9

    :try_start_c4
    new-instance v4, Landroid/os/StatFs;

    invoke-virtual {v6}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v4, v7}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Landroid/os/StatFs;->getAvailableBlocksLong()J

    move-result-wide v9

    invoke-virtual {v4}, Landroid/os/StatFs;->getBlockSizeLong()J

    move-result-wide v11
    :try_end_d5
    .catch Ljava/lang/IllegalArgumentException; {:try_start_c4 .. :try_end_d5} :catch_d9

    mul-long/2addr v11, v9

    :goto_d6
    move-wide/from16 v22, v11

    goto :goto_dc

    :catch_d9
    :cond_d9
    const-wide/16 v11, -0x1

    goto :goto_d6

    :goto_dc
    iget-object v3, v3, Lxf7;->d:Lag7;

    iget-object v3, v3, Lag7;->b:Landroid/content/Context;

    sget-object v4, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v3}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    check-cast v3, Lcom/opera/android/OperaApplication;

    invoke-virtual {v3}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v3

    iget-object v3, v3, Ld6j;->c:Lx5f;

    iget-wide v9, v2, Lre7;->j:J

    iget-wide v11, v2, Lre7;->i:J

    invoke-interface {v5}, Lcom/opera/android/downloads/DownloadItem;->k()J

    move-result-wide v13

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v15

    move-object v4, v1

    iget-wide v0, v2, Lre7;->l:J

    invoke-interface {v5}, Lcom/opera/android/downloads/DownloadItem;->e()I

    move-result v7

    invoke-static {v7}, LJ/N;->MyxQF6e1(I)Ljava/lang/Object;

    move-result-object v7

    move-object/from16 v19, v7

    check-cast v19, Ljava/lang/String;

    invoke-interface {v5}, Lcom/opera/android/downloads/DownloadItem;->h()Ljava/lang/String;

    move-result-object v20

    invoke-virtual {v6}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v21

    invoke-virtual {v2}, Lre7;->c()Lnc0;

    move-result-object v24

    iget-boolean v2, v3, Lx5f;->h:Z

    if-eqz v2, :cond_123

    new-instance v7, Lp5f;

    move-wide/from16 v17, v0

    invoke-direct/range {v7 .. v24}, Lp5f;-><init>(Ltc0;JJJJJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;JLnc0;)V

    invoke-virtual {v3, v7}, Lx5f;->T0(Lkotlin/jvm/functions/Function1;)V

    :cond_123
    :goto_123
    move/from16 v0, p1

    move-object v1, v4

    goto/16 :goto_b

    :cond_128
    return-void
.end method

.method public final onUpdated(JJJ)V
    .registers 12

    new-instance v0, Lg7f;

    iget-object p0, p0, Lcom/opera/android/downloads/DownloadItemWrapper;->b:Lh7f;

    invoke-direct {v0, p0}, Lg7f;-><init>(Lh7f;)V

    :cond_7
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_5b

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lre7;

    iget-wide v1, p0, Lre7;->i:J

    cmp-long v3, p1, v1

    if-lez v3, :cond_37

    sub-long v1, p1, v1

    invoke-static {}, Lsle;->c()I

    move-result v3

    const/4 v4, 0x3

    if-eq v3, v4, :cond_32

    const/4 v4, 0x4

    if-eq v3, v4, :cond_32

    const/4 v4, 0x5

    if-eq v3, v4, :cond_32

    const/16 v4, 0x8

    if-eq v3, v4, :cond_32

    iget-wide v3, p0, Lre7;->q:J

    add-long/2addr v3, v1

    iput-wide v3, p0, Lre7;->q:J

    goto :goto_37

    :cond_32
    iget-wide v3, p0, Lre7;->r:J

    add-long/2addr v3, v1

    iput-wide v3, p0, Lre7;->r:J

    :cond_37
    :goto_37
    iput-wide p1, p0, Lre7;->i:J

    iput-wide p3, p0, Lre7;->j:J

    iput-wide p5, p0, Lre7;->k:J

    iget-wide v1, p0, Lre7;->l:J

    cmp-long v1, p5, v1

    if-lez v1, :cond_45

    iput-wide p5, p0, Lre7;->l:J

    :cond_45
    iget-object v1, p0, Lre7;->u:Lh7f;

    invoke-static {v1, v1}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v1

    :goto_4b
    invoke-virtual {v1}, Lg7f;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_7

    invoke-virtual {v1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lqe7;

    invoke-interface {v2, p0}, Lqe7;->b(Lre7;)V

    goto :goto_4b

    :cond_5b
    return-void
.end method

.method public final p()Ljava/lang/String;
    .registers 5

    iget-wide v0, p0, Lcom/opera/android/downloads/DownloadItemWrapper;->a:J

    const-wide/16 v2, 0x0

    cmp-long p0, v0, v2

    if-nez p0, :cond_b

    const-string p0, ""

    return-object p0

    :cond_b
    invoke-static {v0, v1}, LJ/N;->MFbAnp5O(J)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method public final remove()V
    .registers 5

    iget-wide v0, p0, Lcom/opera/android/downloads/DownloadItemWrapper;->a:J

    const-wide/16 v2, 0x0

    cmp-long p0, v0, v2

    if-nez p0, :cond_9

    return-void

    :cond_9
    invoke-static {v0, v1}, LJ/N;->MtU6MpDb(J)V

    return-void
.end method
