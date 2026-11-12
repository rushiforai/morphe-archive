.class public Lkx8;
.super Lltl;
.source "SourceFile"


# instance fields
.field public r:Lqi8;

.field public s:Landroidx/media3/ui/PlayerView;


# direct methods
.method public constructor <init>()V
    .registers 3

    const v0, 0x7f0d0146

    invoke-static {v0}, Lu7k;->j(I)Lu7k;

    move-result-object v0

    iget-object v0, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast v0, Litl;

    const/4 v1, 0x1

    iput-boolean v1, v0, Litl;->e:Z

    invoke-direct {p0, v0}, Lltl;-><init>(Litl;)V

    return-void
.end method


# virtual methods
.method public final onCreate(Landroid/os/Bundle;)V
    .registers 25

    move-object/from16 v0, p0

    invoke-super/range {p0 .. p1}, Lltl;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Lai8;

    invoke-direct {v2, v1}, Lai8;-><init>(Landroid/content/Context;)V

    new-instance v3, Ljx6;

    invoke-direct {v3, v1}, Ljx6;-><init>(Landroid/content/Context;)V

    iget-boolean v4, v2, Lai8;->o:Z

    const/4 v5, 0x1

    xor-int/2addr v4, v5

    invoke-static {v4}, Lz4o;->H(Z)V

    new-instance v4, Lst6;

    invoke-direct {v4, v3, v5}, Lst6;-><init>(Ljava/lang/Object;B)V

    iput-object v4, v2, Lai8;->d:Ldsk;

    invoke-virtual {v2}, Lai8;->a()Lqi8;

    move-result-object v2

    iput-object v2, v0, Lkx8;->r:Lqi8;

    new-instance v3, Ljx8;

    new-instance v4, Ldg7;

    const/16 v6, 0x12

    invoke-direct {v4, v0, v6}, Ldg7;-><init>(Ljava/lang/Object;B)V

    sget-object v6, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v1

    iget-object v1, v1, Ld6j;->c:Lx5f;

    invoke-direct {v3, v4, v1}, Ljx8;-><init>(Ldg7;Lx5f;)V

    iget-object v1, v2, Lqi8;->n:Lijc;

    invoke-virtual {v1, v3}, Lijc;->a(Ljava/lang/Object;)V

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    if-eqz v1, :cond_56

    const-string v3, "uri"

    invoke-virtual {v1, v3}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    instance-of v3, v1, Landroid/net/Uri;

    if-nez v3, :cond_58

    :cond_56
    const/4 v7, 0x0

    goto :goto_5b

    :cond_58
    check-cast v1, Landroid/net/Uri;

    move-object v7, v1

    :goto_5b
    if-nez v7, :cond_61

    invoke-virtual {v0}, Lryl;->g0()V

    return-void

    :cond_61
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lpyn;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Li16;

    invoke-direct {v4, v1, v3}, Li16;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    new-instance v1, Lmp6;

    invoke-direct {v1}, Lmp6;-><init>()V

    iget-object v3, v0, Lkx8;->r:Lqi8;

    new-instance v6, Lr9g;

    const/16 v8, 0xb

    invoke-direct {v6, v1, v8}, Lr9g;-><init>(Ljava/lang/Object;B)V

    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    new-instance v8, Li06;

    const/4 v9, 0x2

    invoke-direct {v8, v9}, Li06;-><init>(B)V

    new-instance v9, Lfjd;

    invoke-direct {v9}, Lfjd;-><init>()V

    new-instance v10, Lijd;

    invoke-direct {v10}, Lijd;-><init>()V

    sget-object v11, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    sget-object v12, Lh1b;->b:La1b;

    sget-object v13, Lcsh;->e:Lcsh;

    new-instance v12, Lkjd;

    invoke-direct {v12}, Lkjd;-><init>()V

    sget-object v20, Lnjd;->d:Lnjd;

    iget-object v14, v10, Lijd;->e:Ljava/lang/Object;

    check-cast v14, Landroid/net/Uri;

    if-eqz v14, :cond_ab

    iget-object v14, v10, Lijd;->d:Ljava/lang/Object;

    check-cast v14, Ljava/util/UUID;

    if-nez v14, :cond_ab

    const/4 v5, 0x0

    :cond_ab
    invoke-static {v5}, Lz4o;->H(Z)V

    new-instance v17, Lmjd;

    iget-object v5, v10, Lijd;->d:Ljava/lang/Object;

    check-cast v5, Ljava/util/UUID;

    if-eqz v5, :cond_bd

    new-instance v5, Ljjd;

    invoke-direct {v5, v10}, Ljjd;-><init>(Lijd;)V

    :goto_bb
    move-object v10, v8

    goto :goto_bf

    :cond_bd
    const/4 v5, 0x0

    goto :goto_bb

    :goto_bf
    const/4 v8, 0x0

    move-object v14, v10

    const/4 v10, 0x0

    move-object v15, v12

    const/4 v12, 0x0

    move-object/from16 v16, v14

    move-object/from16 v18, v15

    const-wide v14, -0x7fffffffffffffffL    # -4.9E-324

    move-object/from16 v22, v3

    move-object v2, v9

    move-object/from16 v21, v16

    move-object/from16 v3, v18

    move-object v9, v5

    move-object v5, v6

    move-object/from16 v6, v17

    invoke-direct/range {v6 .. v15}, Lmjd;-><init>(Landroid/net/Uri;Ljava/lang/String;Ljjd;Ldjd;Ljava/util/List;Ljava/lang/String;Lh1b;J)V

    new-instance v14, Lqjd;

    const-string v15, ""

    new-instance v6, Lhjd;

    invoke-direct {v6, v2}, Lgjd;-><init>(Lfjd;)V

    new-instance v2, Lljd;

    invoke-direct {v2, v3}, Lljd;-><init>(Lkjd;)V

    sget-object v19, Lvjd;->K:Lvjd;

    move-object/from16 v18, v2

    move-object/from16 v16, v6

    invoke-direct/range {v14 .. v20}, Lqjd;-><init>(Ljava/lang/String;Lhjd;Lmjd;Lljd;Lvjd;Lnjd;)V

    new-instance v8, Lj5h;

    iget-object v2, v14, Lqjd;->b:Lmjd;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v2, v14, Lqjd;->b:Lmjd;

    iget-object v2, v2, Lmjd;->c:Ljjd;

    if-nez v2, :cond_104

    sget-object v1, Lem7;->a:Lcm7;

    move-object v12, v1

    :goto_102
    move-object v9, v14

    goto :goto_118

    :cond_104
    monitor-enter v1

    const/4 v3, 0x0

    :try_start_106
    invoke-virtual {v2, v3}, Ljjd;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_111

    invoke-static {v2}, Ld5o;->v(Ljjd;)Lwn6;

    move-result-object v2

    goto :goto_112

    :cond_111
    move-object v2, v3

    :goto_112
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    monitor-exit v1
    :try_end_116
    .catchall {:try_start_106 .. :try_end_116} :catchall_141

    move-object v12, v2

    goto :goto_102

    :goto_118
    const/4 v14, 0x0

    move-object v10, v4

    move-object v11, v5

    move-object/from16 v13, v21

    invoke-direct/range {v8 .. v14}, Lj5h;-><init>(Lqjd;Lbd6;Lr9g;Lem7;Li06;Loj9;)V

    invoke-virtual/range {v22 .. v22}, Lqi8;->Y0()V

    invoke-static {v8}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v9

    invoke-virtual/range {v22 .. v22}, Lqi8;->Y0()V

    invoke-virtual/range {v22 .. v22}, Lqi8;->Y0()V

    const/4 v13, -0x1

    const-wide v11, -0x7fffffffffffffffL    # -4.9E-324

    const/4 v10, 0x1

    move-object/from16 v8, v22

    invoke-virtual/range {v8 .. v13}, Lqi8;->P0(Ljava/util/List;ZJI)V

    iget-object v0, v0, Lkx8;->r:Lqi8;

    invoke-virtual {v0}, Lqi8;->a()V

    return-void

    :goto_13f
    :try_start_13f
    monitor-exit v1
    :try_end_140
    .catchall {:try_start_13f .. :try_end_140} :catchall_141

    throw v0

    :catchall_141
    move-exception v0

    goto :goto_13f
.end method

.method public final onDestroy()V
    .registers 1

    invoke-super {p0}, Lryl;->onDestroy()V

    iget-object p0, p0, Lkx8;->r:Lqi8;

    invoke-virtual {p0}, Lqi8;->release()V

    return-void
.end method

.method public final onDestroyView()V
    .registers 2

    invoke-super {p0}, Lltl;->onDestroyView()V

    iget-object p0, p0, Lkx8;->s:Landroidx/media3/ui/PlayerView;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroidx/media3/ui/PlayerView;->g(Lgig;)V

    return-void
.end method

.method public final onPause()V
    .registers 2

    invoke-super {p0}, Lltl;->onPause()V

    iget-object p0, p0, Lkx8;->r:Lqi8;

    const/4 v0, 0x0

    invoke-interface {p0, v0}, Lgig;->setPlayWhenReady(Z)V

    return-void
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 4

    invoke-super {p0, p1, p2}, Lk24;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    iget-object p2, p0, Lltl;->k:Lcom/opera/android/StatusBarDrawingFrameLayout;

    const/high16 v0, -0x1000000

    invoke-virtual {p2, v0}, Lcom/opera/android/StatusBarDrawingFrameLayout;->e(I)V

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    check-cast p2, Lcom/opera/android/OperaApplication;

    invoke-virtual {p2}, Lcom/opera/android/OperaApplication;->B()Lqwe;

    move-result-object p2

    iget-object p2, p2, Lqwe;->a:Lbp;

    iget-object p2, p2, Lbp;->b:Ljava/lang/Object;

    check-cast p2, Landroid/graphics/LightingColorFilter;

    if-eqz p2, :cond_26

    const p2, 0x7f0a0ae7

    goto :goto_29

    :cond_26
    const p2, 0x7f0a0ae6

    :goto_29
    invoke-static {p1, p2}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/view/View;

    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Landroid/view/View;->setVisibility(I)V

    const p2, 0x7f0a0a67

    invoke-static {p1, p2}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    check-cast p1, Landroidx/media3/ui/PlayerView;

    iput-object p1, p0, Lkx8;->s:Landroidx/media3/ui/PlayerView;

    iget-object p2, p0, Lkx8;->r:Lqi8;

    invoke-virtual {p1, p2}, Landroidx/media3/ui/PlayerView;->g(Lgig;)V

    iget-object p0, p0, Lkx8;->r:Lqi8;

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lqi8;->setPlayWhenReady(Z)V

    return-void
.end method
