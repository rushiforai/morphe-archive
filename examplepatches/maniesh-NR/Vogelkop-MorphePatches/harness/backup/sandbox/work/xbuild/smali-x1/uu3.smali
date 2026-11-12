.class public final Luu3;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final synthetic a:Lcom/opera/android/BrowserActivity;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Luu3;->a:Lcom/opera/android/BrowserActivity;

    return-void
.end method


# virtual methods
.method public final A(Lnzj;)V
    .registers 3
    .param p1    # Lnzj;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lvkk;
    .end annotation

    iget-object p1, p1, Lnzj;->a:Lmzj;

    iget-boolean p1, p1, Lmzj;->d:Z

    if-nez p1, :cond_7

    return-void

    :cond_7
    iget-object p0, p0, Luu3;->a:Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Ldx3;->o:Lqim;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p0, p0, Lqim;->e:Lysj;

    const p1, 0x7f141162    # 1.96816E38f

    const/16 v0, 0x9c4

    invoke-static {p1, v0, p0}, Lam2;->i(IILysj;)Lglj;

    move-result-object p1

    sget-object v0, Lijm;->b:Lijm;

    invoke-virtual {p0, p1, v0}, Lr22;->b(Ljjm;Lijm;)V

    return-void
.end method

.method public final B(Lxrl;)V
    .registers 2
    .param p1    # Lxrl;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lvkk;
    .end annotation

    sget p0, Lcom/opera/android/BrowserActivity;->E1:I

    return-void
.end method

.method public final C(Lxxh;)V
    .registers 2
    .param p1    # Lxxh;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lvkk;
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget p1, Lcom/opera/android/BrowserActivity;->E1:I

    iget-object p0, p0, Luu3;->a:Lcom/opera/android/BrowserActivity;

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lcom/opera/android/BrowserActivity;->o1(I)V

    return-void
.end method

.method public final D(Lq5j;)V
    .registers 4
    .param p1    # Lq5j;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lvkk;
    .end annotation

    iget-object p1, p1, Lq5j;->b:Ljava/lang/String;

    const-string v0, "app_layout"

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    iget-object p0, p0, Luu3;->a:Lcom/opera/android/BrowserActivity;

    if-nez v0, :cond_3f

    const-string v0, "addressbar_position"

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3f

    const-string v0, "app_theme"

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-string v1, "app_theme_accent"

    if-nez v0, :cond_2c

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2c

    const-string v0, "night_mode_switch_theme"

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3e

    :cond_2c
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {p0}, Lhjf;->C()V

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3e

    sget p1, Leif;->a:I

    const-class p1, Lcom/opera/android/BrowserAppWidget;

    invoke-static {p0, p1}, Lkfo;->k0(Landroid/content/Context;Ljava/lang/Class;)V

    :cond_3e
    return-void

    :cond_3f
    iget-object p1, p0, Lcom/opera/android/BrowserActivity;->x:Lumi;

    new-instance v0, Lqt3;

    const/16 v1, 0x11

    invoke-direct {v0, p0, v1}, Lqt3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    invoke-interface {p1, v0}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void
.end method

.method public final E(Lk6h;)V
    .registers 3
    .annotation runtime Lvkk;
    .end annotation

    iget-object p0, p0, Luu3;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p1

    const/16 v0, 0x50

    invoke-virtual {p1, v0}, Landroid/app/Application;->onTrimMemory(I)V

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->onLowMemory()V

    return-void
.end method

.method public final a(Lyu;)V
    .registers 4
    .param p1    # Lyu;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lvkk;
    .end annotation

    iget-object v0, p1, Lyu;->a:Ljava/lang/String;

    iget-object p1, p1, Lyu;->b:Ljava/lang/String;

    sget v1, Lcom/opera/android/BrowserActivity;->E1:I

    new-instance v1, Lwpe;

    invoke-direct {v1, p1, v0}, Lwpe;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "com.opera.android.ui.DIALOG_QUEUE_SERVICE"

    iget-object p0, p0, Luu3;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0, p1}, Lt5d;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lz77;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Lijm;->b:Lijm;

    invoke-virtual {p0, v1, p1}, Lr22;->b(Ljjm;Lijm;)V

    return-void
.end method

.method public final b(Lh6h;)V
    .registers 2
    .annotation runtime Lvkk;
    .end annotation

    new-instance p0, Ljava/lang/RuntimeException;

    const-string p1, "Intentional crash on demand"

    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public final c(Lby3;)V
    .registers 3
    .param p1    # Lby3;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lvkk;
    .end annotation

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    iget-object p0, p0, Luu3;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0, p1}, Lcom/opera/android/BrowserActivity;->c1(Lby3;)V

    return-void
.end method

.method public final d(Lps1;)V
    .registers 8
    .param p1    # Lps1;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lvkk;
    .end annotation

    const/4 p1, 0x1

    iget-object v0, p0, Luu3;->a:Lcom/opera/android/BrowserActivity;

    iput-boolean p1, v0, Lcom/opera/android/BrowserActivity;->S0:Z

    const-wide/16 v1, 0xbb8

    const-wide/16 v3, 0x258

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/opera/android/BrowserActivity;->z1(JJZ)V

    return-void
.end method

.method public final e(La03;)V
    .registers 5
    .param p1    # La03;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lvkk;
    .end annotation

    iget-object p0, p0, Luu3;->a:Lcom/opera/android/BrowserActivity;

    iget-object v0, p0, Lcom/opera/android/BrowserActivity;->l1:Lpde;

    iget v1, p1, La03;->a:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_b

    const/4 v1, 0x1

    goto :goto_c

    :cond_b
    const/4 v1, 0x0

    :goto_c
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {v0, v1}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->U0:Lpyl;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget p1, p1, La03;->a:I

    iput p1, p0, Lpyl;->b:I

    if-eq p1, v2, :cond_30

    const/4 v0, 0x3

    if-eq p1, v0, :cond_30

    iget-object p1, p0, Lpyl;->c:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/LoadingView;

    if-eqz p1, :cond_2a

    iget-object p1, p1, Lcom/opera/android/LoadingView;->a:Ltah;

    goto :goto_2b

    :cond_2a
    const/4 p1, 0x0

    :goto_2b
    if-eqz p1, :cond_30

    invoke-virtual {p0}, Lpyl;->m()V

    :cond_30
    return-void
.end method

.method public final f(Lfc6;)V
    .registers 6
    .param p1    # Lfc6;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lvkk;
    .end annotation

    iget-object v0, p1, Lfc6;->a:Ljm3;

    iget-boolean v1, v0, Ljm3;->a:Z

    iget-object p0, p0, Luu3;->a:Lcom/opera/android/BrowserActivity;

    if-eqz v1, :cond_21

    iget-wide v0, v0, Ljm3;->b:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_21

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->g()Li53;

    move-result-object v0

    check-cast v0, Lcom/opera/android/bookmarks/h;

    invoke-virtual {v0}, Lcom/opera/android/bookmarks/h;->j()V

    :cond_21
    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->z0()Lz77;

    move-result-object p0

    iget-object v0, p1, Lfc6;->a:Ljm3;

    iget-object p1, p1, Lfc6;->b:Lv5g;

    invoke-static {v0, p1}, Lvtp;->y(Ljm3;Lv5g;)Lnz0;

    move-result-object p1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {p1}, Ljjm;->getDefaultPriority()Lijm;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lr22;->b(Ljjm;Lijm;)V

    return-void
.end method

.method public final g(Lsk5;)V
    .registers 14
    .param p1    # Lsk5;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lvkk;
    .end annotation

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, p0, Luu3;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->i()Ljk5;

    move-result-object v1

    iget-object v2, v1, Ljk5;->d:Ljava/lang/Object;

    monitor-enter v2

    :try_start_11
    iget-object v3, v1, Ljk5;->e:Ljava/lang/String;
    :try_end_13
    .catchall {:try_start_11 .. :try_end_13} :catchall_66

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-eqz v3, :cond_19

    move v3, v5

    goto :goto_1a

    :cond_19
    move v3, v4

    :goto_1a
    monitor-exit v2

    if-nez v3, :cond_65

    iget-object v1, v1, Ljk5;->b:Lode;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Leb8;

    if-eqz v1, :cond_2b

    iget-boolean v1, v1, Leb8;->b:Z

    xor-int/lit8 v4, v1, 0x1

    :cond_2b
    if-nez v4, :cond_65

    iget-object v1, v0, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-nez v1, :cond_32

    const/4 v1, 0x0

    :cond_32
    iget-object v8, v1, Lk6l;->o:Lb2l;

    if-eqz v8, :cond_47

    move-object v1, v8

    check-cast v1, Ld7l;

    invoke-virtual {v1}, Ld7l;->n0()Z

    move-result v2

    if-eqz v2, :cond_47

    iget-object v1, v1, Ld7l;->j:Le7l;

    invoke-interface {v1}, Lb9l;->m()Z

    move-result v1

    if-eqz v1, :cond_51

    :cond_47
    iget-object v6, p0, Luu3;->a:Lcom/opera/android/BrowserActivity;

    const/4 v9, 0x0

    sget-object v10, Llqm;->l:Llqm;

    const/4 v7, 0x0

    const/4 v11, 0x0

    invoke-virtual/range {v6 .. v11}, Lcom/opera/android/BrowserActivity;->i0(ZLb2l;ZLlqm;Lcom/opera/android/browser/TabInfo;)Ld7l;

    :cond_51
    invoke-virtual {v0, v5}, Lcom/opera/android/BrowserActivity;->o1(I)V

    iget-object p0, v0, Lcom/opera/android/BrowserActivity;->y:Ltw3;

    iget-object p0, p0, Ltw3;->s:Lzv3;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lbk5;

    iget-object p1, p1, Lsk5;->a:Ljava/lang/String;

    sget-object v0, Lgk5;->b:Lgk5;

    invoke-virtual {p0, p1, v0}, Lbk5;->e(Ljava/lang/String;Lgk5;)Z

    :cond_65
    return-void

    :catchall_66
    move-exception v0

    move-object p0, v0

    monitor-exit v2

    throw p0
.end method

.method public final h(Lbgf;)V
    .registers 4
    .param p1    # Lbgf;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lvkk;
    .end annotation

    iget-object v0, p1, Lbgf;->a:Landroid/net/Uri;

    iget-object v1, p1, Lbgf;->b:Llqm;

    iget-byte p1, p1, Lbgf;->c:B

    iget-object p0, p0, Luu3;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {v0, v1, p1, p0}, Llk6;->a(Landroid/net/Uri;Llqm;ILandroid/content/Context;)Z

    return-void
.end method

.method public final i(Lxh2;)V
    .registers 3
    .param p1    # Lxh2;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lvkk;
    .end annotation

    iget-object p0, p1, Lxh2;->a:Landroid/net/Uri;

    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    iget-object p1, p1, Lxh2;->b:Llqm;

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object p0

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lvx3;->c(Z)V

    new-instance p1, Lay3;

    invoke-direct {p1, p0}, Lay3;-><init>(Lvx3;)V

    invoke-static {p1}, Lac8;->a(Ljava/lang/Object;)V

    return-void
.end method

.method public final j(Lth8;)V
    .registers 2
    .param p1    # Lth8;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lvkk;
    .end annotation

    sget p1, Lcom/opera/android/BrowserActivity;->E1:I

    iget-object p0, p0, Luu3;->a:Lcom/opera/android/BrowserActivity;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/opera/android/BrowserActivity;->e1(Z)V

    return-void
.end method

.method public final k(Lxm8;)V
    .registers 15
    .param p1    # Lxm8;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lvkk;
    .end annotation

    iget-byte v0, p1, Lxm8;->a:B

    const/4 v1, 0x1

    iget-object p0, p0, Luu3;->a:Lcom/opera/android/BrowserActivity;

    if-eqz v0, :cond_3a

    const/4 v2, 0x0

    const/4 v3, 0x2

    const/4 v4, 0x0

    if-eq v0, v1, :cond_2b

    if-eq v0, v3, :cond_f

    return-void

    :cond_f
    new-array p1, v2, [Ln6h;

    new-instance v6, Lwzg;

    const/4 v0, 0x4

    const-class v1, Li8d;

    invoke-direct {v6, v4, v1, v0}, Lwzg;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v5, Lzhj;

    const/4 v10, 0x0

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v12

    const/4 v7, 0x0

    const/4 v8, 0x2

    const/4 v9, 0x0

    const/4 v11, 0x1

    invoke-direct/range {v5 .. v12}, Lzhj;-><init>(Lwzg;Landroid/os/Bundle;IILjava/lang/String;ZLjava/util/List;)V

    invoke-virtual {v5, p0}, Lzhj;->c(Landroid/content/Context;)V

    return-void

    :cond_2b
    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->P0()Lgjm;

    move-result-object p0

    new-instance v0, Lvfn;

    iget-boolean p1, p1, Lxm8;->b:Z

    invoke-direct {v0, p1, v4, v3}, Lvfn;-><init>(ILoba;I)V

    invoke-virtual {p0, v0, v2}, Lgjm;->e(Ln37;Z)V

    return-void

    :cond_3a
    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->y:Ltw3;

    iget-object p0, p0, Ltw3;->a:Lhx3;

    iget-object p0, p0, Lhx3;->m:Lfx3;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lyug;

    const/16 p1, 0xb

    sget-object v0, Lltg;->d:Lltg;

    invoke-virtual {p0, p1, v0, v1}, Lyug;->b(ILltg;Z)V

    return-void
.end method

.method public final l(Lay3;)V
    .registers 37
    .param p1    # Lay3;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lvkk;
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v6, v0, Luu3;->a:Lcom/opera/android/BrowserActivity;

    iget-object v7, v6, Lcom/opera/android/BrowserActivity;->y:Ltw3;

    iget-object v0, v6, Lcom/opera/android/BrowserActivity;->g1:Lou3;

    iget-boolean v8, v1, Lay3;->f:Z

    iget-object v9, v1, Lay3;->e:Ln3l;

    iget v10, v1, Lay3;->j:I

    iget v11, v1, Lay3;->i:I

    iget v12, v1, Lay3;->d:I

    iget v13, v1, Lay3;->c:I

    iget-object v14, v1, Lay3;->h:Lv4l;

    iget-object v15, v1, Lay3;->a:Llqm;

    if-eqz v8, :cond_26

    invoke-virtual {v6}, Landroidx/fragment/app/r;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/fragment/app/w;->R()Z

    move-result v2

    if-nez v2, :cond_470

    :cond_26
    sget-object v2, Llqm;->f:Llqm;

    const/4 v3, 0x1

    if-ne v15, v2, :cond_2e

    move/from16 v23, v3

    goto :goto_30

    :cond_2e
    const/16 v23, 0x0

    :goto_30
    if-eqz v23, :cond_36

    iget-boolean v2, v0, Lou3;->f:Z

    if-nez v2, :cond_470

    :cond_36
    invoke-virtual {v6}, Ldx3;->M()Llg;

    move-result-object v2

    invoke-virtual {v2}, Llg;->b()Leri;

    move-result-object v2

    sget-object v5, Llqm;->p:Llqm;

    if-ne v15, v5, :cond_46

    iget-boolean v0, v0, Lou3;->f:Z

    if-nez v0, :cond_470

    :cond_46
    invoke-virtual {v6}, Lcom/opera/android/BrowserActivity;->w0()Lb2l;

    move-result-object v0

    if-eqz v0, :cond_470

    iget-object v3, v6, Lcom/opera/android/BrowserActivity;->X0:Lzpa;

    iget-object v4, v7, Ltw3;->a:Lhx3;

    invoke-virtual {v4}, Lhx3;->e()Lcom/opera/android/Lazy;

    move-result-object v4

    invoke-virtual {v4}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lsk6;

    invoke-static {v0, v13}, Lo18;->a(Lb2l;I)Z

    move-result v16

    if-eqz v16, :cond_65

    sget-object v16, Lp6l;->b:Lp6l;

    :goto_62
    move/from16 v24, v8

    goto :goto_68

    :cond_65
    sget-object v16, Lp6l;->a:Lp6l;

    goto :goto_62

    :goto_68
    new-instance v8, Ljava/util/ArrayList;

    move-object/from16 v25, v9

    iget-object v9, v1, Lay3;->s:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v5

    invoke-direct {v8, v5}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v5

    move-object/from16 v18, v0

    const/4 v0, 0x0

    :goto_7c
    if-ge v0, v5, :cond_a1

    invoke-virtual {v9, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v19

    add-int/lit8 v20, v0, 0x1

    move-object/from16 v0, v19

    check-cast v0, Lzx3;

    move-object/from16 p0, v16

    move/from16 v16, v5

    move-object/from16 v5, p0

    move-object/from16 v19, v9

    invoke-interface/range {v0 .. v5}, Lzx3;->a(Lay3;Leri;Lzpa;Lsk6;Lp6l;)Llsc;

    move-result-object v0

    invoke-virtual {v8, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move/from16 v0, v16

    move-object/from16 v16, v5

    move v5, v0

    move-object/from16 v9, v19

    move/from16 v0, v20

    goto :goto_7c

    :cond_a1
    move-object/from16 p0, v18

    const/4 v9, 0x1

    new-instance v0, Lmr3;

    const/4 v2, 0x5

    invoke-direct {v0, v2}, Lmr3;-><init>(B)V

    new-instance v3, Lzx1;

    const/4 v4, 0x6

    invoke-direct {v3, v0, v4}, Lzx1;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v8, v3}, Ljava/util/ArrayList;->removeIf(Ljava/util/function/Predicate;)Z

    const/4 v4, 0x3

    const/high16 v0, -0x80000000

    if-eq v12, v9, :cond_11f

    iget-boolean v5, v1, Lay3;->p:Z

    if-eqz v5, :cond_11f

    if-ne v11, v0, :cond_11f

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ne v5, v9, :cond_11f

    iget-object v5, v6, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-nez v5, :cond_c9

    const/4 v5, 0x0

    :cond_c9
    const/4 v3, 0x0

    invoke-virtual {v8, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v16

    move-object/from16 v2, v16

    check-cast v2, Llsc;

    iget-object v2, v2, Lksc;->a:Ljava/lang/String;

    invoke-static {v2}, Lcom/opera/android/browser/BrowserUtils;->getRendererUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    sget-object v16, Lu3l;->a:Ls3l;

    invoke-interface/range {p0 .. p0}, Lb9l;->T()Lp6l;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    if-eqz v3, :cond_ed

    if-ne v3, v9, :cond_e9

    sget-object v3, Lu3l;->b:Ls3l;

    goto :goto_ef

    :cond_e9
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_ed
    sget-object v3, Lu3l;->a:Ls3l;

    :goto_ef
    new-instance v0, Ln6l;

    invoke-direct {v0, v2}, Ln6l;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lp3l;

    invoke-direct {v2, v3, v0}, Lp3l;-><init>(Lu3l;Lu3l;)V

    iget-object v0, v5, Lk6l;->m:Lz6l;

    invoke-static {v5, v2, v0}, Lexg;->p(Lk6l;Lu3l;Lnxg;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->firstOrNull(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb2l;

    if-eqz v0, :cond_11f

    if-eqz v24, :cond_10f

    invoke-virtual {v6, v9}, Lcom/opera/android/BrowserActivity;->o1(I)V

    :cond_10f
    iget-object v1, v6, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-nez v1, :cond_115

    const/4 v3, 0x0

    goto :goto_116

    :cond_115
    move-object v3, v1

    :goto_116
    invoke-virtual {v3, v0, v4}, Lk6l;->C(Lb2l;I)V

    check-cast v0, Ld7l;

    invoke-virtual {v0}, Ld7l;->q()V

    return-void

    :cond_11f
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v2, 0x0

    :goto_124
    if-ge v2, v0, :cond_137

    invoke-virtual {v8, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Llsc;

    iget-boolean v5, v1, Lay3;->m:Z

    iput-boolean v5, v3, Llsc;->m:Z

    iget-boolean v5, v1, Lay3;->n:Z

    iput-boolean v5, v3, Llsc;->n:Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_124

    :cond_137
    iget v0, v1, Lay3;->b:I

    const/4 v2, 0x2

    if-eq v0, v9, :cond_15a

    if-eq v0, v2, :cond_158

    move-object/from16 v0, p0

    check-cast v0, Ld7l;

    invoke-virtual {v0}, Ld7l;->n0()Z

    move-result v3

    if-eqz v3, :cond_15a

    invoke-virtual {v0}, Ld7l;->i()Lcom/opera/android/browser/NavigationHistory;

    move-result-object v0

    check-cast v0, Liuh;

    iget-object v0, v0, Liuh;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/browser/NavigationHistory;

    invoke-interface {v0}, Lcom/opera/android/browser/NavigationHistory;->d()I

    move-result v0

    if-gt v0, v9, :cond_15a

    :cond_158
    const/4 v3, 0x0

    goto :goto_15b

    :cond_15a
    move v3, v9

    :goto_15b
    if-nez v3, :cond_15e

    move v12, v2

    :cond_15e
    if-eq v12, v9, :cond_165

    if-eqz v24, :cond_165

    invoke-virtual {v6, v9}, Lcom/opera/android/BrowserActivity;->o1(I)V

    :cond_165
    if-eqz v3, :cond_3ac

    const/high16 v3, -0x80000000

    if-ne v11, v3, :cond_174

    iget-object v3, v1, Lay3;->k:Lwx3;

    move-object/from16 v5, p0

    invoke-interface {v3, v5}, Lwx3;->o(Lb2l;)Lb2l;

    move-result-object v3

    goto :goto_17f

    :cond_174
    move-object/from16 v5, p0

    iget-object v3, v6, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-nez v3, :cond_17b

    const/4 v3, 0x0

    :cond_17b
    invoke-virtual {v3, v11}, Lk6l;->r(I)Lb2l;

    move-result-object v3

    :goto_17f
    if-ltz v10, :cond_18e

    iget-object v11, v6, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-nez v11, :cond_186

    const/4 v11, 0x0

    :cond_186
    iget-object v11, v11, Lk6l;->b:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v11

    if-le v10, v11, :cond_1a6

    :cond_18e
    iget-object v10, v6, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-eqz v3, :cond_19d

    if-nez v10, :cond_195

    const/4 v10, 0x0

    :cond_195
    iget-object v10, v10, Lk6l;->b:Ljava/util/ArrayList;

    invoke-virtual {v10, v3}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v10

    add-int/2addr v10, v9

    goto :goto_1a6

    :cond_19d
    if-nez v10, :cond_1a0

    const/4 v10, 0x0

    :cond_1a0
    iget-object v10, v10, Lk6l;->b:Ljava/util/ArrayList;

    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v10

    :cond_1a6
    :goto_1a6
    iget-object v11, v1, Lay3;->g:Lcom/opera/android/browser/TabInfo;

    if-nez v11, :cond_25a

    invoke-virtual {v6}, Lcom/opera/android/BrowserActivity;->H0()Lcom/opera/android/settings/SettingsManager;

    move-result-object v11

    const-string v4, "tab_auto_grouping"

    invoke-virtual {v11, v4}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_245

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-le v4, v9, :cond_245

    iget-boolean v4, v14, Lv4l;->b:Z

    iget-object v11, v14, Lv4l;->a:Ljava/lang/String;

    if-eqz v4, :cond_1df

    if-eqz v3, :cond_1df

    move-object v4, v3

    check-cast v4, Ld7l;

    iget-object v0, v4, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object v0

    iget v0, v0, Lcom/opera/android/browser/TabInfo;->d:I

    if-eqz v0, :cond_1df

    iget-object v0, v4, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object v0

    iget v0, v0, Lcom/opera/android/browser/TabInfo;->d:I

    move/from16 v18, v0

    move/from16 v27, v9

    const/4 v0, 0x0

    goto :goto_20f

    :cond_1df
    invoke-virtual {v6}, Ldx3;->P()Lcom/opera/android/browser/BrowserFragment;

    move-result-object v0

    iget-object v0, v0, Lcom/opera/android/browser/BrowserFragment;->h:Lxbf;

    iget-object v0, v0, Lxbf;->b:Ljava/lang/Object;

    check-cast v0, Lvzk;

    const/4 v4, 0x0

    invoke-virtual {v0, v4}, Lvzk;->L(Z)I

    move-result v0

    if-eqz v11, :cond_209

    iget-object v7, v7, Ltw3;->a:Lhx3;

    iget-object v7, v7, Lhx3;->s:Lfx3;

    invoke-virtual {v7}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lu4l;

    invoke-virtual {v7, v0}, Lu4l;->a(I)Lm4l;

    move-result-object v2

    move/from16 v27, v9

    const/4 v9, 0x5

    invoke-static {v2, v11, v4, v9}, Lm4l;->a(Lm4l;Ljava/lang/String;II)Lm4l;

    move-result-object v2

    invoke-virtual {v7, v2}, Lu4l;->b(Lm4l;)V

    goto :goto_20b

    :cond_209
    move/from16 v27, v9

    :goto_20b
    move/from16 v18, v0

    move/from16 v0, v27

    :goto_20f
    iget-boolean v2, v14, Lv4l;->c:Z

    if-eqz v2, :cond_230

    if-eqz v3, :cond_230

    check-cast v3, Ld7l;

    iget-object v2, v3, Ld7l;->j:Le7l;

    invoke-interface {v2}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v19, 0x0

    const/16 v21, 0x7

    move/from16 v20, v18

    const-wide/16 v17, 0x0

    invoke-static/range {v16 .. v21}, Lcom/opera/android/browser/TabInfo;->a(Lcom/opera/android/browser/TabInfo;JIII)Lcom/opera/android/browser/TabInfo;

    move-result-object v2

    invoke-virtual {v3, v2}, Ld7l;->s(Lcom/opera/android/browser/TabInfo;)Z

    goto :goto_232

    :cond_230
    move/from16 v20, v18

    :goto_232
    new-instance v16, Lcom/opera/android/browser/TabInfo;

    move/from16 v18, v20

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v19

    const-wide/16 v21, 0x0

    const/16 v17, 0x0

    invoke-direct/range {v16 .. v22}, Lcom/opera/android/browser/TabInfo;-><init>(IIJJ)V

    move v4, v0

    move-object/from16 v11, v16

    goto :goto_25d

    :cond_245
    move/from16 v27, v9

    new-instance v28, Lcom/opera/android/browser/TabInfo;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v31

    const-wide/16 v33, 0x0

    const/16 v29, 0x0

    const/16 v30, 0x0

    invoke-direct/range {v28 .. v34}, Lcom/opera/android/browser/TabInfo;-><init>(IIJJ)V

    move-object/from16 v11, v28

    :goto_258
    const/4 v4, 0x0

    goto :goto_25d

    :cond_25a
    move/from16 v27, v9

    goto :goto_258

    :goto_25d
    iget-boolean v0, v1, Lay3;->r:Z

    if-eqz v0, :cond_27d

    const-string v0, "startpage"

    invoke-static {v0}, Lwqm;->d(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f1410aa

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ltu3;

    const/4 v7, 0x0

    invoke-direct {v3, v0, v2, v7}, Ltu3;-><init>(Ljava/lang/String;Ljava/lang/String;B)V

    invoke-static {v3}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    goto :goto_27f

    :cond_27d
    const/4 v7, 0x0

    const/4 v0, 0x0

    :goto_27f
    iget-boolean v2, v1, Lay3;->q:Z

    if-eqz v2, :cond_285

    const/4 v2, 0x3

    goto :goto_286

    :cond_285
    move v2, v7

    :goto_286
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v3

    move v9, v7

    move v14, v9

    const/4 v7, 0x0

    :goto_28d
    if-ge v9, v3, :cond_3a7

    invoke-virtual {v8, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v16

    move-object/from16 v26, v16

    check-cast v26, Llsc;

    move-object/from16 v28, v0

    if-nez v7, :cond_29d

    move v0, v10

    goto :goto_2aa

    :cond_29d
    iget-object v0, v6, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-nez v0, :cond_2a2

    const/4 v0, 0x0

    :cond_2a2
    iget-object v0, v0, Lk6l;->b:Ljava/util/ArrayList;

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    :goto_2aa
    invoke-static {v5, v13}, Lo18;->a(Lb2l;I)Z

    move-result v7

    move/from16 v16, v2

    invoke-static {v12}, Lvep;->A(I)I

    move-result v2

    move/from16 v29, v3

    if-eqz v2, :cond_2d2

    move/from16 v3, v27

    if-eq v2, v3, :cond_2ce

    move/from16 v17, v3

    const/4 v3, 0x2

    if-ne v2, v3, :cond_2ca

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-ne v9, v2, :cond_2d2

    goto :goto_2d0

    :cond_2ca
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_2ce
    if-nez v9, :cond_2d2

    :goto_2d0
    const/4 v3, 0x1

    goto :goto_2d3

    :cond_2d2
    const/4 v3, 0x0

    :goto_2d3
    add-int/lit8 v2, v16, -0x1

    if-lez v16, :cond_2dc

    const/16 v21, 0x1

    :goto_2d9
    move/from16 v30, v2

    goto :goto_2df

    :cond_2dc
    const/16 v21, 0x0

    goto :goto_2d9

    :goto_2df
    sget-object v2, Llqm;->F:Llqm;

    if-eq v15, v2, :cond_2e7

    sget-object v2, Llqm;->K:Llqm;

    if-ne v15, v2, :cond_2eb

    :cond_2e7
    if-eqz v3, :cond_2eb

    const/4 v2, 0x1

    goto :goto_2ec

    :cond_2eb
    const/4 v2, 0x0

    :goto_2ec
    move/from16 v31, v2

    if-eqz v2, :cond_336

    invoke-virtual {v6}, Ldx3;->P()Lcom/opera/android/browser/BrowserFragment;

    move-result-object v2

    iget-object v2, v2, Lcom/opera/android/browser/BrowserFragment;->h:Lxbf;

    move/from16 v32, v4

    iget-object v4, v2, Lxbf;->b:Ljava/lang/Object;

    check-cast v4, Lvzk;

    move-object/from16 v33, v5

    iget-object v5, v4, Lvzk;->b:Ljava/lang/Object;

    check-cast v5, Lhz4;

    move/from16 v34, v9

    const/4 v9, 0x0

    invoke-virtual {v5, v7, v9}, Lhz4;->a(ZLorg/chromium/content_public/browser/WebContents;)Lcom/opera/android/browser/chromium/ChromiumContent;

    move-result-object v5

    invoke-virtual {v4, v11, v5}, Lvzk;->t(Lcom/opera/android/browser/TabInfo;Lcom/opera/android/browser/chromium/ChromiumContent;)Luy3;

    move-result-object v17

    move-object/from16 v22, v15

    new-instance v15, Ld7l;

    iget-object v4, v2, Lxbf;->e:Ljava/lang/Object;

    move-object/from16 v18, v4

    check-cast v18, Ltw2;

    iget-object v4, v2, Lxbf;->f:Ljava/lang/Object;

    move-object/from16 v19, v4

    check-cast v19, Laal;

    iget-object v4, v2, Lxbf;->c:Ljava/lang/Object;

    move-object/from16 v20, v4

    check-cast v20, Liga;

    iget-object v4, v2, Lxbf;->d:Ljava/lang/Object;

    move-object/from16 v21, v4

    check-cast v21, Lrc6;

    move-object/from16 v16, v2

    invoke-direct/range {v15 .. v22}, Ld7l;-><init>(Lxbf;Luy3;Ltw2;Laal;Liga;Lrc6;Llqm;)V

    move-object/from16 v2, v22

    move-object/from16 v17, v11

    move-object v7, v15

    move-object/from16 v5, v26

    goto :goto_359

    :cond_336
    move/from16 v32, v4

    move-object/from16 v33, v5

    move/from16 v34, v9

    move-object v2, v15

    const/4 v9, 0x0

    invoke-virtual {v6}, Ldx3;->P()Lcom/opera/android/browser/BrowserFragment;

    move-result-object v4

    iget-object v4, v4, Lcom/opera/android/browser/BrowserFragment;->h:Lxbf;

    iget-object v5, v1, Lay3;->a:Llqm;

    move-object/from16 v16, v4

    move-object/from16 v19, v5

    move/from16 v18, v7

    move-object/from16 v17, v11

    move-object/from16 v20, v26

    move-object/from16 v22, v28

    invoke-virtual/range {v16 .. v22}, Lxbf;->v(Lcom/opera/android/browser/TabInfo;ZLlqm;Llsc;ZLjava/util/List;)Ld7l;

    move-result-object v4

    move-object/from16 v5, v20

    move-object v7, v4

    :goto_359
    iget-object v4, v5, Lksc;->i:Lorg/chromium/content_public/common/ResourceRequestBody;

    if-eqz v4, :cond_373

    iget-object v4, v5, Lksc;->a:Ljava/lang/String;

    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-static {v4}, Lic4;->v(Landroid/net/Uri;)Z

    move-result v4

    if-eqz v4, :cond_373

    new-instance v4, Lqz;

    const/16 v11, 0x8

    invoke-direct {v4, v5, v11}, Lqz;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v7, v4}, Ld7l;->e0(La2l;)V

    :cond_373
    if-eqz v23, :cond_384

    new-instance v4, Lc23;

    new-instance v11, Lpt3;

    const/16 v15, 0x10

    invoke-direct {v11, v6, v15}, Lpt3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    invoke-direct {v4, v11}, Lc23;-><init>(Lpt3;)V

    invoke-virtual {v7, v4}, Ld7l;->e0(La2l;)V

    :cond_384
    iget-object v4, v6, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-nez v4, :cond_389

    move-object v4, v9

    :cond_389
    invoke-virtual {v4, v0, v7, v3}, Lk6l;->e(ILd7l;Z)V

    if-eqz v31, :cond_391

    invoke-virtual {v7, v5}, Ld7l;->Z(Llsc;)V

    :cond_391
    add-int/lit8 v14, v14, 0x1

    add-int/lit8 v0, v34, 0x1

    move v9, v0

    move-object v15, v2

    move-object/from16 v11, v17

    move-object/from16 v0, v28

    move/from16 v3, v29

    move/from16 v2, v30

    move/from16 v4, v32

    move-object/from16 v5, v33

    const/16 v27, 0x1

    goto/16 :goto_28d

    :cond_3a7
    move/from16 v32, v4

    move-object v3, v7

    move v4, v14

    goto :goto_3df

    :cond_3ac
    move-object/from16 v33, p0

    const/4 v9, 0x0

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v4, 0x0

    :goto_3b4
    if-ge v4, v0, :cond_3db

    invoke-virtual {v8, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Llsc;

    if-eqz v23, :cond_3d1

    new-instance v2, Lc23;

    new-instance v3, Lpt3;

    const/16 v5, 0x11

    invoke-direct {v3, v6, v5}, Lpt3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    invoke-direct {v2, v3}, Lc23;-><init>(Lpt3;)V

    move-object/from16 v3, v33

    check-cast v3, Ld7l;

    invoke-virtual {v3, v2}, Ld7l;->e0(La2l;)V

    :cond_3d1
    move-object/from16 v2, v33

    check-cast v2, Ld7l;

    invoke-virtual {v2, v1}, Ld7l;->Z(Llsc;)V

    add-int/lit8 v4, v4, 0x1

    goto :goto_3b4

    :cond_3db
    move-object v3, v9

    const/4 v4, 0x0

    const/16 v32, 0x0

    :goto_3df
    if-eqz v4, :cond_470

    const/4 v5, 0x1

    if-eq v12, v5, :cond_3e6

    if-nez v24, :cond_470

    :cond_3e6
    sget-object v0, Lijm;->b:Lijm;

    move-object/from16 v1, v25

    if-eqz v32, :cond_404

    iget-boolean v2, v1, Ln3l;->b:Z

    if-eqz v2, :cond_404

    iget-object v2, v6, Ldx3;->o:Lqim;

    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v2, v2, Lqim;->e:Lysj;

    new-instance v3, Ltl3;

    const/4 v5, 0x1

    invoke-direct {v3, v1, v6, v5}, Ltl3;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v2, v3, v0}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :cond_404
    const/4 v5, 0x1

    iget-boolean v1, v1, Ln3l;->a:Z

    if-eqz v1, :cond_470

    if-le v4, v5, :cond_41f

    invoke-virtual {v6}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    const v5, 0x7f12004c

    invoke-virtual {v1, v5, v4, v2}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_426

    :cond_41f
    const v1, 0x7f140b12

    invoke-virtual {v6, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    :goto_426
    new-instance v2, Lbi2;

    const/16 v5, 0x11

    invoke-direct {v2, v3, v6, v5}, Lbi2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v6}, Lcom/opera/android/BrowserActivity;->B0()Landroidx/fragment/app/Fragment;

    move-result-object v3

    if-eqz v3, :cond_447

    iget-object v3, v6, Ldx3;->o:Lqim;

    invoke-static {v3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v3, v3, Lqim;->e:Lysj;

    new-instance v4, Ltl3;

    const/4 v5, 0x2

    invoke-direct {v4, v1, v2, v5}, Ltl3;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v3, v4, v0}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :cond_447
    iget-object v3, v6, Lcom/opera/android/BrowserActivity;->v0:Lj4c;

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->f()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lv9l;

    if-eqz v3, :cond_456

    iget-object v3, v3, Lv9l;->v:Lr9l;

    if-eqz v3, :cond_456

    return-void

    :cond_456
    new-instance v3, Lbi2;

    const/16 v4, 0x12

    invoke-direct {v3, v6, v2, v4}, Lbi2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v2, v6, Ldx3;->o:Lqim;

    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v2, v2, Lqim;->e:Lysj;

    new-instance v4, Ltl3;

    const/4 v5, 0x2

    invoke-direct {v4, v1, v3, v5}, Ltl3;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v2, v4, v0}, Lr22;->b(Ljjm;Lijm;)V

    :cond_470
    return-void
.end method

.method public final m(Lk3b;)V
    .registers 7
    .param p1    # Lk3b;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lvkk;
    .end annotation

    iget-object p0, p0, Luu3;->a:Lcom/opera/android/BrowserActivity;

    invoke-static {p0}, Ljoh;->p(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_4c

    iget-byte v0, p1, Lk3b;->a:B

    const/4 v1, 0x1

    sget-object v2, Lijm;->b:Lijm;

    if-ne v0, v1, :cond_35

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->g()Li53;

    move-result-object v0

    check-cast v0, Lcom/opera/android/bookmarks/h;

    invoke-virtual {v0}, Lcom/opera/android/bookmarks/h;->j()V

    iget-object p0, p0, Ldx3;->o:Lqim;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p0, p0, Lqim;->c:Lz77;

    new-instance v0, Ll3b;

    iget-wide v3, p1, Lk3b;->b:J

    invoke-direct {v0, v3, v4}, Ll3b;-><init>(J)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0, v0, v2}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :cond_35
    const/4 v1, 0x2

    if-ne v0, v1, :cond_4c

    iget-object p0, p0, Ldx3;->o:Lqim;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p0, p0, Lqim;->c:Lz77;

    new-instance v0, Lz2b;

    iget-boolean p1, p1, Lk3b;->c:Z

    invoke-direct {v0, p1}, Lz2b;-><init>(Z)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0, v0, v2}, Lr22;->b(Ljjm;Lijm;)V

    :cond_4c
    return-void
.end method

.method public final n(Lvwc;)V
    .registers 2
    .annotation runtime Lvkk;
    .end annotation

    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object p0, p0, Luu3;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->F()Lcom/opera/android/PushedContentHandler;

    move-result-object p0

    iget-object p0, p0, Lcom/opera/android/PushedContentHandler;->e:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string p1, "timer"

    invoke-interface {p0, p1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    new-instance p0, Lyzh;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p0}, Lac8;->a(Ljava/lang/Object;)V

    return-void
.end method

.method public final o(Lu6d;)V
    .registers 12
    .param p1    # Lu6d;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lvkk;
    .end annotation

    const v0, 0x7f0a062c

    iget-object p0, p0, Luu3;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0, v0}, Lfp1;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iget-object p1, p1, Lu6d;->a:Lt6d;

    sget-object v1, Lt6d;->d:Lt6d;

    const/4 v2, 0x4

    const/4 v3, 0x0

    if-ne p1, v1, :cond_13

    move v4, v2

    goto :goto_14

    :cond_13
    move v4, v3

    :goto_14
    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lcom/opera/android/BrowserActivity;->G:Lr22;

    const/4 v4, 0x0

    if-nez v0, :cond_1d

    move-object v0, v4

    :cond_1d
    iget-object v5, v0, Lr22;->a:Ljava/lang/Object;

    check-cast v5, Lcom/opera/android/bar/BottomBar;

    sget-object v6, Lt6d;->a:Lt6d;

    const/4 v7, 0x1

    if-ne p1, v6, :cond_28

    move v6, v7

    goto :goto_29

    :cond_28
    move v6, v3

    :goto_29
    iget-object v0, v0, Lr22;->c:Ljava/lang/Object;

    check-cast v0, Lbp;

    if-eqz v6, :cond_3d

    iget-object v8, v0, Lbp;->b:Ljava/lang/Object;

    check-cast v8, Landroid/view/View;

    if-eqz v8, :cond_3a

    iget v9, v0, Lbp;->a:I

    invoke-virtual {v8, v9}, Landroid/view/View;->setImportantForAccessibility(I)V

    :cond_3a
    iput-object v4, v0, Lbp;->b:Ljava/lang/Object;

    goto :goto_55

    :cond_3d
    iget-object v8, v0, Lbp;->b:Ljava/lang/Object;

    check-cast v8, Landroid/view/View;

    if-eq v8, v5, :cond_55

    if-eqz v8, :cond_4a

    iget v9, v0, Lbp;->a:I

    invoke-virtual {v8, v9}, Landroid/view/View;->setImportantForAccessibility(I)V

    :cond_4a
    iput-object v5, v0, Lbp;->b:Ljava/lang/Object;

    invoke-virtual {v5}, Landroid/view/View;->getImportantForAccessibility()I

    move-result v8

    iput v8, v0, Lbp;->a:I

    invoke-virtual {v5, v2}, Landroid/view/View;->setImportantForAccessibility(I)V

    :cond_55
    :goto_55
    const v0, 0x7f0a0a8f

    invoke-virtual {v5, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_61

    check-cast v8, Latj;

    goto :goto_8d

    :cond_61
    invoke-virtual {v5}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v8

    instance-of v9, v8, Landroid/view/View;

    if-eqz v9, :cond_6c

    check-cast v8, Landroid/view/View;

    goto :goto_6d

    :cond_6c
    move-object v8, v4

    :goto_6d
    if-eqz v8, :cond_8c

    invoke-virtual {v8, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_79

    check-cast v0, Latj;

    :goto_77
    move-object v8, v0

    goto :goto_8d

    :cond_79
    invoke-virtual {v8}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v8, v0, Landroid/view/View;

    if-eqz v8, :cond_84

    check-cast v0, Landroid/view/View;

    goto :goto_85

    :cond_84
    move-object v0, v4

    :goto_85
    if-eqz v0, :cond_8c

    invoke-static {v0}, Lxug;->k(Landroid/view/View;)Latj;

    move-result-object v0

    goto :goto_77

    :cond_8c
    move-object v8, v4

    :goto_8d
    if-eqz v8, :cond_a6

    iget-object v0, v8, Latj;->d:Ljava/util/LinkedHashSet;

    if-eqz v6, :cond_9d

    invoke-interface {v0, v5}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a6

    invoke-virtual {v8}, Latj;->b()V

    goto :goto_a6

    :cond_9d
    invoke-interface {v0, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a6

    invoke-virtual {v8}, Latj;->b()V

    :cond_a6
    :goto_a6
    iget-object v0, p0, Lcom/opera/android/BrowserActivity;->M:Lgbf;

    if-eqz v0, :cond_ab

    move-object v4, v0

    :cond_ab
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-ne p1, v1, :cond_b3

    invoke-virtual {v4, v7}, Lgbf;->m(Z)V

    :cond_b3
    invoke-virtual {p0}, Ldx3;->P()Lcom/opera/android/browser/BrowserFragment;

    move-result-object p0

    if-eqz p0, :cond_e4

    iget-object v0, p0, Lcom/opera/android/browser/BrowserFragment;->e:Lvp5;

    if-eq p1, v1, :cond_be

    move v7, v3

    :cond_be
    iget-boolean v1, v0, Lvp5;->e:Z

    if-eq v1, v7, :cond_d2

    iput-boolean v7, v0, Lvp5;->e:Z

    iget-object v1, v0, Lvp5;->f:Lcom/opera/android/browser/chromium/ChromiumContainerView;

    if-eqz v1, :cond_d2

    iget v0, v0, Lvp5;->c:I

    if-nez v0, :cond_ce

    if-nez v7, :cond_cf

    :cond_ce
    move v2, v0

    :cond_cf
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    :cond_d2
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    const/4 v0, 0x2

    if-ne p1, v0, :cond_e4

    iget-object p0, p0, Lcom/opera/android/browser/BrowserFragment;->g:Lk6l;

    iget-object p0, p0, Lk6l;->o:Lb2l;

    if-eqz p0, :cond_e4

    check-cast p0, Ld7l;

    invoke-virtual {p0, v3}, Ld7l;->M(Z)Z

    :cond_e4
    return-void
.end method

.method public final p(Lc8d;)V
    .registers 11
    .annotation runtime Lvkk;
    .end annotation

    iget-object p0, p0, Luu3;->a:Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Ldx3;->o:Lqim;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 p1, 0x1

    invoke-static {p1}, Le35;->H0(I)Le35;

    move-result-object p1

    const/4 v0, 0x0

    new-array v0, v0, [Ln6h;

    new-instance v2, Lwzg;

    const-class v1, Le35;

    const/4 v3, 0x4

    invoke-direct {v2, p1, v1, v3}, Lwzg;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v1, Lzhj;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v8

    const/4 v3, 0x0

    const/4 v4, 0x1

    const/4 v5, -0x1

    const/4 v6, 0x0

    const/4 v7, 0x1

    invoke-direct/range {v1 .. v8}, Lzhj;-><init>(Lwzg;Landroid/os/Bundle;IILjava/lang/String;ZLjava/util/List;)V

    invoke-virtual {p0, v1}, Lqim;->g(Lzhj;)V

    return-void
.end method

.method public final q(Lx2b;)V
    .registers 4
    .param p1    # Lx2b;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lvkk;
    .end annotation

    if-eqz p1, :cond_47

    instance-of v0, p1, Lm3b;

    iget-object p0, p0, Luu3;->a:Lcom/opera/android/BrowserActivity;

    if-eqz v0, :cond_1f

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->z0()Lz77;

    move-result-object p0

    new-instance v0, Lk4g;

    check-cast p1, Lm3b;

    iget p1, p1, Lm3b;->a:I

    const/4 v1, 0x1

    invoke-direct {v0, p1, v1}, Lk4g;-><init>(IZ)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Lijm;->b:Lijm;

    invoke-virtual {p0, v0, p1}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :cond_1f
    instance-of v0, p1, La3b;

    if-eqz v0, :cond_47

    check-cast p1, La3b;

    iget-object p1, p1, La3b;->a:Ly2b;

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->z0()Lz77;

    move-result-object p0

    sget-object v0, Ly2b;->c:Ly2b;

    const/4 v1, 0x0

    if-ne p1, v0, :cond_37

    new-instance p1, Lyz5;

    const/4 v0, 0x5

    invoke-direct {p1, v1, v1, v0}, Lyz5;-><init>(ZZB)V

    goto :goto_3d

    :cond_37
    new-instance p1, Lyz5;

    const/4 v0, 0x4

    invoke-direct {p1, v1, v1, v0}, Lyz5;-><init>(ZZB)V

    :goto_3d
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {p1}, Ljjm;->getDefaultPriority()Lijm;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lr22;->b(Ljjm;Lijm;)V

    :cond_47
    return-void
.end method

.method public final r(Li6h;)V
    .registers 2
    .param p1    # Li6h;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lvkk;
    .end annotation

    return-void
.end method

.method public final s(Lyzh;)V
    .registers 8
    .annotation runtime Lvkk;
    .end annotation

    const/4 p1, 0x1

    iget-object v0, p0, Luu3;->a:Lcom/opera/android/BrowserActivity;

    iput-boolean p1, v0, Lcom/opera/android/BrowserActivity;->S0:Z

    const-wide/16 v1, 0x3e8

    const-wide/16 v3, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/opera/android/BrowserActivity;->z1(JJZ)V

    return-void
.end method

.method public final t(Luhj;)V
    .registers 9
    .param p1    # Luhj;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lvkk;
    .end annotation

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v1, p0, Luu3;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->e()Lj4c;

    move-result-object p0

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lyk6;

    iget-object p0, p0, Lyk6;->i:Lkze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-nez p0, :cond_23

    return-void

    :cond_23
    invoke-virtual {v1}, Lcom/opera/android/BrowserActivity;->H0()Lcom/opera/android/settings/SettingsManager;

    move-result-object v2

    const-class p0, Ld8j;

    iget-object v0, v1, Lcom/opera/android/BrowserActivity;->g0:Lwub;

    invoke-virtual {v0, p0}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object p0

    move-object v3, p0

    check-cast v3, Ld8j;

    iget-boolean p0, p1, Luhj;->c:Z

    if-eqz p0, :cond_3a

    iget-object p0, p1, Luhj;->a:Ljava/lang/String;

    :goto_38
    move-object v4, p0

    goto :goto_3c

    :cond_3a
    const/4 p0, 0x0

    goto :goto_38

    :goto_3c
    iget-boolean v5, p1, Luhj;->b:Z

    new-instance v6, Lpt3;

    const/16 p0, 0xe

    invoke-direct {v6, v1, p0}, Lpt3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    invoke-static/range {v1 .. v6}, Lz5i;->s0(Landroid/content/Context;Lcom/opera/android/settings/SettingsManager;Ld8j;Ljava/lang/String;ZLpt3;)V

    return-void
.end method

.method public final u(Lwhj;)V
    .registers 23
    .param p1    # Lwhj;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lvkk;
    .end annotation

    move-object/from16 v0, p1

    sget v1, Lcom/opera/android/BrowserActivity;->E1:I

    move-object/from16 v1, p0

    iget-object v1, v1, Luu3;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v1}, Lcom/opera/android/BrowserActivity;->B1()V

    invoke-virtual {v1}, Lcom/opera/android/BrowserActivity;->w0()Lb2l;

    move-result-object v2

    if-nez v2, :cond_12

    return-void

    :cond_12
    iget-object v3, v1, Lcom/opera/android/BrowserActivity;->e0:Lc5o;

    iget-object v4, v0, Lwhj;->a:Lg82;

    iget-object v11, v0, Lwhj;->d:Ljava/util/ArrayList;

    iget-object v8, v0, Lwhj;->c:Llqm;

    invoke-virtual {v1}, Lcom/opera/android/BrowserActivity;->x0()Lwy;

    move-result-object v5

    iget-object v5, v5, Lwy;->v:Llhb;

    iget-boolean v6, v0, Lwhj;->b:Z

    invoke-virtual {v5, v6}, Llhb;->b(I)Z

    move-result v7

    if-eqz v7, :cond_2b

    invoke-virtual {v5}, Llhb;->a()V

    :cond_2b
    iget v9, v5, Llhb;->m:I

    const/4 v12, 0x1

    add-int/2addr v9, v12

    iput v9, v5, Llhb;->m:I

    const/4 v13, 0x0

    if-eqz v7, :cond_3a

    new-instance v5, Lkhb;

    invoke-direct {v5, v6}, Lkhb;-><init>(I)V

    goto :goto_3b

    :cond_3a
    move-object v5, v13

    :goto_3b
    iget-object v6, v3, Lc5o;->a:Ljava/lang/Object;

    check-cast v6, Ljava/util/HashMap;

    iget-object v7, v4, Lg82;->a:Ljava/lang/String;

    invoke-virtual {v6, v7, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v3, v3, Lc5o;->b:Ljava/lang/Object;

    check-cast v3, Ljava/util/HashMap;

    if-eqz v5, :cond_4e

    invoke-virtual {v3, v7, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_51

    :cond_4e
    invoke-virtual {v3, v7}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :goto_51
    iget-object v3, v1, Lcom/opera/android/BrowserActivity;->E:Lt82;

    if-nez v3, :cond_56

    move-object v3, v13

    :cond_56
    iget-object v0, v0, Lwhj;->a:Lg82;

    iget-object v4, v3, Lt82;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lo7j;->values()[Lo7j;

    move-result-object v5

    const-string v6, "enable_reading_mode_as_default"

    invoke-virtual {v4, v6}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result v4

    aget-object v4, v5, v4

    sget-object v5, Lo7j;->c:Lo7j;

    if-ne v4, v5, :cond_76

    iget v4, v0, Lg82;->f:I

    invoke-static {v4}, Lvep;->A(I)I

    move-result v4

    if-eqz v4, :cond_80

    goto :goto_7a

    :cond_76
    sget-object v5, Lo7j;->d:Lo7j;

    if-ne v4, v5, :cond_80

    :goto_7a
    invoke-virtual {v3, v0, v8}, Lt82;->a(Lg82;Llqm;)Llsc;

    move-result-object v0

    :goto_7e
    move-object v9, v0

    goto :goto_a0

    :cond_80
    new-instance v3, Lcom/opera/android/browser/UrlMangler$Builder;

    const-string v4, "article"

    iget-object v5, v0, Lg82;->d:Ljava/lang/String;

    invoke-direct {v3, v4, v5}, Lcom/opera/android/browser/UrlMangler$Builder;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v4, v0, Lg82;->b:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/opera/android/browser/UrlMangler$Builder;->title(Ljava/lang/String;)Lcom/opera/android/browser/UrlMangler$Builder;

    iget-object v0, v0, Lg82;->a:Ljava/lang/String;

    iget-object v4, v3, Lcom/opera/android/browser/UrlMangler$Builder;->c:Ljava/util/HashMap;

    const-string v5, "article_id"

    invoke-virtual {v4, v5, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v3}, Lcom/opera/android/browser/UrlMangler$Builder;->build()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v13, v8}, Lwqm;->f(Ljava/lang/String;Lsqh;Llqm;)Llsc;

    move-result-object v0

    goto :goto_7e

    :goto_a0
    if-eqz v11, :cond_c6

    invoke-virtual {v1}, Ldx3;->P()Lcom/opera/android/browser/BrowserFragment;

    move-result-object v0

    iget-object v5, v0, Lcom/opera/android/browser/BrowserFragment;->h:Lxbf;

    new-instance v14, Lcom/opera/android/browser/TabInfo;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v17

    const-wide/16 v19, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    invoke-direct/range {v14 .. v20}, Lcom/opera/android/browser/TabInfo;-><init>(IIJJ)V

    const/4 v7, 0x0

    const/4 v10, 0x1

    move-object v6, v14

    invoke-virtual/range {v5 .. v11}, Lxbf;->v(Lcom/opera/android/browser/TabInfo;ZLlqm;Llsc;ZLjava/util/List;)Ld7l;

    move-result-object v0

    iget-object v1, v1, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-nez v1, :cond_c2

    move-object v1, v13

    :cond_c2
    invoke-virtual {v1, v13, v0, v12}, Lk6l;->f(Lb2l;Ld7l;Z)V

    return-void

    :cond_c6
    check-cast v2, Ld7l;

    invoke-virtual {v2, v9}, Ld7l;->Z(Llsc;)V

    return-void
.end method

.method public final v(Lyhj;)V
    .registers 5
    .param p1    # Lyhj;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lvkk;
    .end annotation

    iget-object v0, p1, Lyhj;->a:Ljava/lang/Long;

    iget-object p0, p0, Luu3;->a:Lcom/opera/android/BrowserActivity;

    if-eqz v0, :cond_1f

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->m()Lsf7;

    move-result-object v0

    iget-object v0, v0, Lsf7;->a:Lrf7;

    iget-object p1, p1, Lyhj;->a:Ljava/lang/Long;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lrf7;->d(J)Lre7;

    move-result-object p1

    goto :goto_20

    :cond_1f
    const/4 p1, 0x0

    :goto_20
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/opera/android/BrowserActivity;->u1(Lre7;I)V

    return-void
.end method

.method public final w(Lzhj;)V
    .registers 2
    .param p1    # Lzhj;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lvkk;
    .end annotation

    iget-object p0, p0, Luu3;->a:Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Ldx3;->o:Lqim;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0, p1}, Lqim;->g(Lzhj;)V

    return-void
.end method

.method public final x(Laij;)V
    .registers 3
    .param p1    # Laij;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lvkk;
    .end annotation

    iget-object p0, p0, Luu3;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->J0()Lysj;

    move-result-object p0

    const p1, 0x7f14087a

    const/16 v0, 0x1388

    invoke-static {p1, v0, p0}, Lam2;->i(IILysj;)Lglj;

    move-result-object p1

    sget-object v0, Lijm;->b:Lijm;

    invoke-virtual {p0, p1, v0}, Lr22;->b(Ljjm;Lijm;)V

    return-void
.end method

.method public final y(Lcij;)V
    .registers 5
    .param p1    # Lcij;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lvkk;
    .end annotation

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    iget-object p0, p0, Luu3;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->w0()Lb2l;

    move-result-object v0

    if-eqz v0, :cond_1a

    iget-object p0, p0, Ldx3;->o:Lqim;

    iget-object p0, p0, Lqim;->f:Laal;

    new-instance v1, Lxq3;

    iget-object v2, p1, Lcij;->a:Ljava/util/List;

    iget-object p1, p1, Lcij;->b:Landroid/view/View;

    invoke-direct {v1, p1, v2}, Lxq3;-><init>(Landroid/view/View;Ljava/util/List;)V

    invoke-virtual {p0, v1, v0}, Laal;->R(Lcej;Lb2l;)V

    :cond_1a
    return-void
.end method

.method public final z(Lj6h;)V
    .registers 2
    .param p1    # Lj6h;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lvkk;
    .end annotation

    sget p0, Lcom/opera/android/BrowserActivity;->E1:I

    return-void
.end method
