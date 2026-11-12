.class public final Lf1j;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lcom/opera/android/BrowserActivity;

.field public final b:Lumi;

.field public final c:Lbf9;

.field public final d:Lcom/opera/android/settings/SettingsManager;

.field public final e:Lx5f;

.field public final f:Lki;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lumi;Lbf9;Lcom/opera/android/settings/SettingsManager;Lx5f;Lki;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lf1j;->a:Lcom/opera/android/BrowserActivity;

    iput-object p2, p0, Lf1j;->b:Lumi;

    iput-object p3, p0, Lf1j;->c:Lbf9;

    iput-object p4, p0, Lf1j;->d:Lcom/opera/android/settings/SettingsManager;

    iput-object p5, p0, Lf1j;->e:Lx5f;

    iput-object p6, p0, Lf1j;->f:Lki;

    invoke-virtual {p1}, Lxd5;->getLifecycle()Ltcc;

    move-result-object p1

    new-instance p2, Le1j;

    invoke-direct {p2, p0}, Le1j;-><init>(Lf1j;)V

    invoke-virtual {p1, p2}, Ltcc;->a(Lmdc;)V

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 2

    iget-object p0, p0, Lf1j;->c:Lbf9;

    invoke-virtual {p0}, Lbf9;->r()I

    move-result p0

    const/4 v0, 0x2

    if-lt p0, v0, :cond_b

    const/4 p0, 0x1

    return p0

    :cond_b
    const/4 p0, 0x0

    return p0
.end method

.method public final b()Z
    .registers 3

    iget-object v0, p0, Lf1j;->d:Lcom/opera/android/settings/SettingsManager;

    const-string v1, "my_flow_visible"

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_14

    iget-object p0, p0, Lf1j;->c:Lbf9;

    invoke-virtual {p0}, Lbf9;->t()Z

    move-result p0

    if-eqz p0, :cond_14

    const/4 p0, 0x1

    return p0

    :cond_14
    const/4 p0, 0x0

    return p0
.end method

.method public final c(Z)V
    .registers 4

    if-eqz p1, :cond_19

    iget-object p1, p0, Lf1j;->a:Lcom/opera/android/BrowserActivity;

    iget-object p1, p1, Ldx3;->o:Lqim;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p1, p1, Lqim;->e:Lysj;

    new-instance v0, Lqt;

    const/4 v1, 0x3

    invoke-direct {v0, p0, v1}, Lqt;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Lijm;->b:Lijm;

    invoke-virtual {p1, v0, p0}, Lr22;->b(Ljjm;Lijm;)V

    :cond_19
    return-void
.end method

.method public final d(Lre7;)V
    .registers 5

    invoke-virtual {p0}, Lf1j;->a()Z

    move-result v0

    if-nez v0, :cond_10

    new-instance v0, Ljri;

    const/4 v1, 0x5

    invoke-direct {v0, p0, p1, v1}, Ljri;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, v0}, Lf1j;->h(Ljava/lang/Runnable;)V

    return-void

    :cond_10
    invoke-virtual {p1}, Lre7;->k()Z

    move-result v0

    if-eqz v0, :cond_36

    invoke-virtual {p1}, Lre7;->g()Landroid/net/Uri;

    move-result-object v0

    if-eqz v0, :cond_36

    new-instance p1, Lfge;

    iget-object v1, p0, Lf1j;->b:Lumi;

    iget-object v2, p0, Lf1j;->e:Lx5f;

    iget-object p0, p0, Lf1j;->a:Lcom/opera/android/BrowserActivity;

    invoke-direct {p1, p0, v1, v2}, Lfge;-><init>(Lcom/opera/android/BrowserActivity;Ltcl;Lx5f;)V

    iput-object v0, p1, Lfge;->L:Landroid/net/Uri;

    const/4 v0, 0x0

    iput-object v0, p1, Lfge;->M:Ljava/lang/String;

    const/16 v0, 0x1003

    invoke-static {p1, v0}, Lzhj;->a(Lryl;I)Lzhj;

    move-result-object p1

    invoke-virtual {p1, p0}, Lzhj;->c(Landroid/content/Context;)V

    return-void

    :cond_36
    iget-object v0, p1, Lre7;->t:Lcom/opera/android/downloads/DownloadItem;

    invoke-interface {v0}, Lcom/opera/android/downloads/DownloadItem;->getUrl()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lre7;->f()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lf1j;->g(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public final e(Lb2l;)V
    .registers 12

    invoke-virtual {p0}, Lf1j;->a()Z

    move-result v0

    if-nez v0, :cond_10

    new-instance v0, Ljri;

    const/4 v1, 0x3

    invoke-direct {v0, p0, p1, v1}, Ljri;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, v0}, Lf1j;->h(Ljava/lang/Runnable;)V

    return-void

    :cond_10
    move-object v0, p1

    check-cast v0, Ld7l;

    iget-object v1, v0, Ld7l;->j:Le7l;

    invoke-interface {v1}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/opera/android/browser/UrlMangler;->isMangled(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5a

    iget-object v1, v0, Ld7l;->j:Le7l;

    invoke-interface {v1}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lz5i;->a0(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_44

    iget-object v0, p0, Lf1j;->f:Lki;

    invoke-virtual {v0}, Lki;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ly22;

    iget-object v0, v0, Ly22;->a:Lx22;

    if-eqz v0, :cond_43

    new-instance v1, Lq3;

    const/16 v2, 0x13

    iget-object v3, p0, Lf1j;->a:Lcom/opera/android/BrowserActivity;

    invoke-direct {v1, v3, p0, v2}, Lq3;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, p1, v1}, Lx22;->b(Lb2l;Lkotlin/jvm/functions/Function1;)V

    :cond_43
    return-void

    :cond_44
    invoke-virtual {v0}, Ld7l;->l0()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0}, Ld7l;->k0()Ljava/lang/String;

    move-result-object v7

    new-instance v9, Ld1j;

    const/4 p1, 0x0

    invoke-direct {v9, p0, p1}, Ld1j;-><init>(Lf1j;B)V

    iget-object v4, p0, Lf1j;->c:Lbf9;

    const/4 v6, 0x0

    const/4 v8, 0x0

    invoke-static/range {v4 .. v9}, Laib;->I(Lbf9;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/opera/api/Callback;)V

    return-void

    :cond_5a
    invoke-virtual {v0}, Ld7l;->k0()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0}, Ld7l;->l0()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lf1j;->g(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public final f(Ljava/lang/String;)V
    .registers 11

    invoke-virtual {p0}, Lf1j;->a()Z

    move-result v0

    if-nez v0, :cond_10

    new-instance v0, Ljri;

    const/4 v1, 0x4

    invoke-direct {v0, p0, p1, v1}, Ljri;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, v0}, Lf1j;->h(Ljava/lang/Runnable;)V

    return-void

    :cond_10
    new-instance v0, Ld1j;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Ld1j;-><init>(Lf1j;B)V

    invoke-static {p1}, Laib;->Q(Ljava/lang/String;)Z

    move-result v1

    iget-object v2, p0, Lf1j;->c:Lbf9;

    if-eqz v1, :cond_31

    sget-object v6, Lp6l;->a:Lp6l;

    new-instance v7, Lvzk;

    const-string v1, ""

    invoke-direct {v7, v2, v1, p1, v0}, Lvzk;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v3, Lcom/opera/android/browser/b;

    iget-object v4, p0, Lf1j;->b:Lumi;

    const/4 v8, 0x0

    move-object v5, p1

    invoke-direct/range {v3 .. v8}, Lcom/opera/android/browser/b;-><init>(Ltcl;Ljava/lang/String;Lp6l;Lzun;Z)V

    return-void

    :cond_31
    move-object v5, p1

    invoke-virtual {v2, v5, v0}, Lbf9;->G(Ljava/lang/String;Lcom/opera/api/Callback;)V

    return-void
.end method

.method public final g(Ljava/lang/String;Ljava/lang/String;)V
    .registers 11

    invoke-static {p1}, Lwqm;->r(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_23

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    new-instance v0, Lfge;

    iget-object v1, p0, Lf1j;->b:Lumi;

    iget-object v2, p0, Lf1j;->e:Lx5f;

    iget-object p0, p0, Lf1j;->a:Lcom/opera/android/BrowserActivity;

    invoke-direct {v0, p0, v1, v2}, Lfge;-><init>(Lcom/opera/android/BrowserActivity;Ltcl;Lx5f;)V

    iput-object p1, v0, Lfge;->L:Landroid/net/Uri;

    iput-object p2, v0, Lfge;->M:Ljava/lang/String;

    const/16 p1, 0x1003

    invoke-static {v0, p1}, Lzhj;->a(Lryl;I)Lzhj;

    move-result-object p1

    invoke-virtual {p1, p0}, Lzhj;->c(Landroid/content/Context;)V

    return-void

    :cond_23
    new-instance v0, Ld1j;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Ld1j;-><init>(Lf1j;B)V

    sget-object v5, Lp6l;->a:Lp6l;

    new-instance v6, Lvzk;

    iget-object v1, p0, Lf1j;->c:Lbf9;

    invoke-direct {v6, v1, p2, p1, v0}, Lvzk;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v2, Lcom/opera/android/browser/b;

    iget-object v3, p0, Lf1j;->b:Lumi;

    const/4 v7, 0x0

    move-object v4, p1

    invoke-direct/range {v2 .. v7}, Lcom/opera/android/browser/b;-><init>(Ltcl;Ljava/lang/String;Lp6l;Lzun;Z)V

    return-void
.end method

.method public final h(Ljava/lang/Runnable;)V
    .registers 5

    new-instance v0, Lgge;

    iget-object v1, p0, Lf1j;->c:Lbf9;

    iget-object v2, p0, Lf1j;->d:Lcom/opera/android/settings/SettingsManager;

    invoke-direct {v0, v1, v2}, Lgge;-><init>(Lbf9;Lcom/opera/android/settings/SettingsManager;)V

    iput-object p1, v0, Lgge;->v:Ljava/lang/Runnable;

    const/16 p1, 0x1003

    invoke-static {v0, p1}, Lzhj;->a(Lryl;I)Lzhj;

    move-result-object p1

    iget-object p0, p0, Lf1j;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p1, p0}, Lzhj;->c(Landroid/content/Context;)V

    return-void
.end method
