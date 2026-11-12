.class public final Ls58;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lneb;


# instance fields
.field public a:Lorg/chromium/content_public/browser/WebContents;

.field public b:Lk68;


# virtual methods
.method public final close()V
    .registers 6

    iget-object v0, p0, Ls58;->b:Lk68;

    const/4 v1, 0x0

    if-eqz v0, :cond_25

    iget-object v2, v0, Lk68;->h:Lkm5;

    if-eqz v2, :cond_1a

    iget-object v3, v2, Lkm5;->d:Ljava/lang/Object;

    check-cast v3, Loml;

    if-eqz v3, :cond_13

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Loml;->cancel(Z)Z

    :cond_13
    iput-object v1, v2, Lkm5;->d:Ljava/lang/Object;

    const/4 v3, 0x0

    iput-boolean v3, v2, Lkm5;->a:Z

    iput-boolean v3, v2, Lkm5;->b:Z

    :cond_1a
    iput-object v1, v0, Lk68;->h:Lkm5;

    iput-object v1, v0, Lk68;->g:Li68;

    iget-object v2, v0, Lk68;->c:Lydn;

    invoke-virtual {v2, v0}, Lydn;->A(Ltdn;)V

    iput-object v1, p0, Ls58;->b:Lk68;

    :cond_25
    iput-object v1, p0, Ls58;->a:Lorg/chromium/content_public/browser/WebContents;

    return-void
.end method

.method public final h(Lk8e;)V
    .registers 6

    iget-object p1, p0, Ls58;->b:Lk68;

    const/4 v0, 0x0

    if-eqz p1, :cond_25

    iget-object v1, p1, Lk68;->h:Lkm5;

    if-eqz v1, :cond_1a

    iget-object v2, v1, Lkm5;->d:Ljava/lang/Object;

    check-cast v2, Loml;

    if-eqz v2, :cond_13

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Loml;->cancel(Z)Z

    :cond_13
    iput-object v0, v1, Lkm5;->d:Ljava/lang/Object;

    const/4 v2, 0x0

    iput-boolean v2, v1, Lkm5;->a:Z

    iput-boolean v2, v1, Lkm5;->b:Z

    :cond_1a
    iput-object v0, p1, Lk68;->h:Lkm5;

    iput-object v0, p1, Lk68;->g:Li68;

    iget-object v1, p1, Lk68;->c:Lydn;

    invoke-virtual {v1, p1}, Lydn;->A(Ltdn;)V

    iput-object v0, p0, Ls58;->b:Lk68;

    :cond_25
    iput-object v0, p0, Ls58;->a:Lorg/chromium/content_public/browser/WebContents;

    return-void
.end method

.method public final k(Ljava/lang/String;Ln61;)V
    .registers 9

    iget-object v0, p0, Ls58;->a:Lorg/chromium/content_public/browser/WebContents;

    const/4 v1, 0x0

    if-eqz v0, :cond_b

    invoke-static {v0}, Ldx3;->L(Lorg/chromium/content_public/browser/WebContents;)Ldx3;

    move-result-object v0

    if-nez v0, :cond_d

    :cond_b
    move-object v0, v1

    goto :goto_13

    :cond_d
    iget-object v2, p0, Ls58;->a:Lorg/chromium/content_public/browser/WebContents;

    invoke-virtual {v0, v2}, Ldx3;->V(Lorg/chromium/content_public/browser/WebContents;)Lb2l;

    move-result-object v0

    :goto_13
    iget-object p0, p0, Ls58;->a:Lorg/chromium/content_public/browser/WebContents;

    if-eqz p0, :cond_42

    if-eqz v0, :cond_42

    invoke-static {p0}, Ldx3;->L(Lorg/chromium/content_public/browser/WebContents;)Ldx3;

    move-result-object p0

    if-eqz p0, :cond_42

    sget-object v2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->I()Lq6e;

    move-result-object p0

    move-object v2, v0

    check-cast v2, Ld7l;

    invoke-virtual {v2}, Ld7l;->j0()J

    move-result-wide v2

    const-wide/16 v4, -0x1

    cmp-long v4, v2, v4

    if-eqz v4, :cond_3c

    invoke-virtual {p0, v2, v3}, Lq6e;->c(J)Ll6e;

    move-result-object v1

    :cond_3c
    if-nez v1, :cond_42

    invoke-virtual {p0}, Lq6e;->b()Leri;

    move-result-object v1

    :cond_42
    if-nez v1, :cond_4b

    const-string p0, ""

    const/4 p1, 0x0

    invoke-virtual {p2, p0, p1}, Ln61;->f(Ljava/lang/String;Z)V

    return-void

    :cond_4b
    const/16 p0, 0x9

    invoke-interface {v0}, Lb9l;->T()Lp6l;

    move-result-object v0

    invoke-interface {v1, p0, v0, p1}, Leri;->a(ILp6l;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ldti;->a(Ljava/lang/String;)Z

    move-result p1

    invoke-virtual {p2, p0, p1}, Ln61;->f(Ljava/lang/String;Z)V

    return-void
.end method

.method public final l(Ln61;)V
    .registers 8

    iget-object p0, p0, Ls58;->a:Lorg/chromium/content_public/browser/WebContents;

    const-string v0, ""

    if-eqz p0, :cond_1c

    invoke-static {p0}, Ldx3;->L(Lorg/chromium/content_public/browser/WebContents;)Ldx3;

    move-result-object p0

    if-eqz p0, :cond_1c

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object p0

    invoke-static {p0}, Lcom/opera/android/browser/ThemeProviderHelper;->a(Lcom/opera/android/settings/SettingsManager;)Ljava/lang/String;

    move-result-object v0

    :cond_1c
    new-instance p0, Ly58;

    const/16 v1, 0x10

    invoke-direct {p0, v1}, Luik;-><init>(I)V

    iput-object v0, p0, Ly58;->b:Ljava/lang/String;

    :try_start_25
    iget-object v0, p1, Ln61;->b:Lorg/chromium/mojo/system/impl/CoreImpl;

    new-instance v1, Llvd;

    iget-wide v2, p1, Ln61;->d:J

    const/4 v4, 0x3

    const/4 v5, 0x6

    invoke-direct {v1, v4, v5, v2, v3}, Llvd;-><init>(IIJ)V

    invoke-virtual {p0, v0, v1}, Luik;->b(Lorg/chromium/mojo/system/impl/CoreImpl;Llvd;)Lh3j;

    move-result-object p0

    iget-object p1, p1, Ln61;->c:Lmwd;

    invoke-interface {p1, p0}, Lmwd;->S0(Levd;)Z
    :try_end_39
    .catch Le13; {:try_start_25 .. :try_end_39} :catch_3a

    goto :goto_3e

    :catch_3a
    move-exception p0

    invoke-static {p0}, Lh9o;->o(Ljava/lang/Throwable;)V

    :goto_3e
    return-void
.end method

.method public final m()Lk68;
    .registers 9

    iget-object v0, p0, Ls58;->b:Lk68;

    if-nez v0, :cond_40

    iget-object v0, p0, Ls58;->a:Lorg/chromium/content_public/browser/WebContents;

    if-eqz v0, :cond_14

    invoke-static {v0}, Ldx3;->L(Lorg/chromium/content_public/browser/WebContents;)Ldx3;

    move-result-object v3

    if-eqz v3, :cond_14

    invoke-static {v3}, Lq9n;->o(Landroid/content/Context;)Lcom/opera/android/BrowserActivity;

    move-result-object v0

    if-nez v0, :cond_16

    :cond_14
    const/4 p0, 0x0

    return-object p0

    :cond_16
    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v3}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->R()Lydn;

    move-result-object v4

    invoke-static {v3}, Lufn;->t(Landroid/content/Context;)Lufn;

    move-result-object v5

    invoke-virtual {v0}, Lcom/opera/android/BrowserActivity;->P0()Lgjm;

    move-result-object v6

    invoke-virtual {v3}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v0

    iget-object v7, v0, Ld6j;->c:Lx5f;

    new-instance v1, Lk68;

    iget-object v2, p0, Ls58;->a:Lorg/chromium/content_public/browser/WebContents;

    invoke-direct/range {v1 .. v7}, Lk68;-><init>(Lorg/chromium/content_public/browser/WebContents;Ldx3;Lydn;Lufn;Lgjm;Lx5f;)V

    iput-object v1, p0, Ls58;->b:Lk68;

    return-object v1

    :cond_40
    return-object v0
.end method

.method public final n(Z)V
    .registers 10

    invoke-virtual {p0}, Ls58;->m()Lk68;

    move-result-object p0

    if-eqz p0, :cond_77

    const/4 v0, 0x1

    iput-boolean v0, p0, Lk68;->i:Z

    iget-object v1, p0, Lk68;->f:Lx5f;

    iget-boolean v2, v1, Lx5f;->h:Z

    if-eqz v2, :cond_30

    iget-object v2, v1, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v3

    new-instance v4, Lck0;

    invoke-direct {v4, v2, v3}, Lck0;-><init>(Lzpa;Lx56;)V

    invoke-virtual {v4}, Lck0;->d()Ltd0;

    move-result-object v2

    iget-object v2, v2, Ltd0;->e:Lzyk;

    invoke-virtual {v2}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ll80;

    const-wide/16 v4, 0x1

    iget-object v2, v2, Ll80;->a:Lk80;

    invoke-virtual {v2, v0, v0, v4, v5}, Ljf0;->p(IIJ)V

    invoke-virtual {v1, v3}, Lx5f;->U0(Lx56;)V

    :cond_30
    iget-object v1, p0, Lk68;->h:Lkm5;

    if-nez v1, :cond_44

    new-instance v1, Lkm5;

    new-instance v2, Lbn7;

    const/16 v3, 0xc

    invoke-direct {v2, p0, v3}, Lbn7;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v2, v1, Lkm5;->c:Ljava/lang/Object;

    iput-object v1, p0, Lk68;->h:Lkm5;

    :cond_44
    iget-object v2, v1, Lkm5;->d:Ljava/lang/Object;

    check-cast v2, Loml;

    if-eqz v2, :cond_4d

    invoke-virtual {v2, v0}, Loml;->cancel(Z)Z

    :cond_4d
    const/4 v0, 0x0

    iput-object v0, v1, Lkm5;->d:Ljava/lang/Object;

    const/4 v0, 0x0

    iput-boolean v0, v1, Lkm5;->a:Z

    iput-boolean v0, v1, Lkm5;->b:Z

    sget-object v0, Lvml;->d:Lumi;

    new-instance v2, Lbn7;

    const/16 v3, 0xd

    invoke-direct {v2, v1, v3}, Lbn7;-><init>(Ljava/lang/Object;B)V

    invoke-interface {v0, v2}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object v0

    new-instance v2, Loml;

    invoke-direct {v2, v0}, Loml;-><init>(Lnml;)V

    iput-object v2, v1, Lkm5;->d:Ljava/lang/Object;

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const/4 v7, 0x0

    const/4 v3, 0x0

    const-wide/16 v4, 0x3e8

    invoke-virtual/range {v2 .. v7}, Loml;->b(Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;Ljri;)V

    iget-object p0, p0, Lk68;->c:Lydn;

    invoke-virtual {p0, p1}, Lydn;->C(Z)V

    :cond_77
    return-void
.end method

.method public final o(Li68;)V
    .registers 7

    invoke-virtual {p0}, Ls58;->m()Lk68;

    move-result-object p0

    if-eqz p0, :cond_41

    iput-object p1, p0, Lk68;->g:Li68;

    iget-object v0, p0, Lk68;->c:Lydn;

    invoke-virtual {v0, p0}, Lydn;->b(Ltdn;)V

    invoke-virtual {p0}, Lk68;->a()Lpcn;

    move-result-object v0

    invoke-virtual {p1, v0}, Li68;->l(Lpcn;)V

    iget-boolean p1, v0, Lpcn;->b:Z

    if-eqz p1, :cond_41

    iget-object p0, p0, Lk68;->f:Lx5f;

    iget-boolean p1, p0, Lx5f;->h:Z

    if-eqz p1, :cond_41

    iget-object p1, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    new-instance v1, Lck0;

    invoke-direct {v1, p1, v0}, Lck0;-><init>(Lzpa;Lx56;)V

    invoke-virtual {v1}, Lck0;->d()Ltd0;

    move-result-object p1

    iget-object p1, p1, Ltd0;->e:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ll80;

    iget-object p1, p1, Ll80;->a:Lk80;

    const/4 v1, 0x0

    const/4 v2, 0x1

    const-wide/16 v3, 0x1

    invoke-virtual {p1, v1, v2, v3, v4}, Ljf0;->p(IIJ)V

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    :cond_41
    return-void
.end method
