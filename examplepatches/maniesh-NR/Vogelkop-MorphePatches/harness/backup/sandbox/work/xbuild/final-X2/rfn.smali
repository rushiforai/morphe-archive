.class public final Lrfn;
.super Lmgn;
.source "SourceFile"


# instance fields
.field public final j:Lyug;

.field public final k:Ljava/util/HashSet;

.field public l:Z

.field public m:Lqfn;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Loz3;Lcom/opera/android/BrowserActivity;Lgbf;Lcom/opera/android/BrowserActivity;Lk6l;Lydn;Lyug;Lysl;Lcom/opera/android/settings/SettingsManager;)V
    .registers 21

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object/from16 v6, p6

    move-object/from16 v7, p7

    move-object/from16 v8, p9

    move-object/from16 v9, p10

    invoke-direct/range {v0 .. v9}, Lmgn;-><init>(Lcom/opera/android/BrowserActivity;Loz3;Lcom/opera/android/BrowserActivity;Lgbf;Lcom/opera/android/BrowserActivity;Lk6l;Lydn;Lysl;Lcom/opera/android/settings/SettingsManager;)V

    new-instance p2, Ljava/util/HashSet;

    invoke-direct {p2}, Ljava/util/HashSet;-><init>()V

    iput-object p2, p0, Lrfn;->k:Ljava/util/HashSet;

    move-object/from16 p2, p8

    iput-object p2, p0, Lrfn;->j:Lyug;

    iget-object p0, v7, Lydn;->d:Lvdn;

    iget-boolean p0, p0, Lvdn;->a:Z

    if-eqz p0, :cond_4a

    invoke-static {p1}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    iget-object p0, p0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string p2, "vpn.tooltip_premium.vpn_enabled_timestamp"

    const-wide/16 p3, 0x0

    invoke-interface {p0, p2, p3, p4}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    cmp-long p0, v0, p3

    if-nez p0, :cond_4a

    invoke-static {p1}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    invoke-virtual {p0}, Lru9;->b()Lnv6;

    move-result-object p0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p3

    iget-object p1, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast p1, Landroid/content/SharedPreferences$Editor;

    invoke-interface {p1, p2, p3, p4}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lnv6;->w()V

    :cond_4a
    return-void
.end method

.method public static h(Lcom/opera/android/BrowserActivity;)Z
    .registers 4

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->R()Lydn;

    move-result-object v0

    iget-object v0, v0, Lydn;->c:Lgfn;

    invoke-interface {v0}, Lgfn;->isEnabled()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_35

    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v0

    iget-object v0, v0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v2, "vpn.tooltip_premium.closed"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_35

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->D()Ljtg;

    move-result-object p0

    invoke-virtual {p0}, Ljtg;->d()Z

    move-result p0

    if-eqz p0, :cond_35

    const/4 p0, 0x1

    return p0

    :cond_35
    return v1
.end method


# virtual methods
.method public final a()Z
    .registers 1

    iget-object p0, p0, Lmgn;->a:Lcom/opera/android/BrowserActivity;

    invoke-static {p0}, Lrfn;->h(Lcom/opera/android/BrowserActivity;)Z

    move-result p0

    return p0
.end method

.method public final c()Lcom/opera/android/bar/OmniButtonView;
    .registers 2

    iget-object p0, p0, Lmgn;->d:Lgbf;

    iget-object v0, p0, Lgbf;->b:Lz43;

    invoke-virtual {v0}, Lz43;->q()Z

    move-result v0

    if-eqz v0, :cond_11

    invoke-virtual {p0}, Lgbf;->r()Landroid/view/View;

    move-result-object p0

    check-cast p0, Lcom/opera/android/bar/OmniButtonView;

    return-object p0

    :cond_11
    const/4 p0, 0x0

    return-object p0
.end method

.method public final e()Z
    .registers 2

    invoke-super {p0}, Lmgn;->e()Z

    move-result v0

    if-eqz v0, :cond_12

    iget-object v0, p0, Lmgn;->f:Lk6l;

    iget-object v0, v0, Lk6l;->o:Lb2l;

    invoke-virtual {p0, v0}, Lrfn;->i(Lb2l;)Z

    move-result p0

    if-eqz p0, :cond_12

    const/4 p0, 0x1

    return p0

    :cond_12
    const/4 p0, 0x0

    return p0
.end method

.method public final f()V
    .registers 3

    iget-object v0, p0, Lmgn;->c:Lcom/opera/android/BrowserActivity;

    invoke-interface {v0}, Lndc;->getLifecycle()Ltcc;

    move-result-object v0

    invoke-virtual {v0, p0}, Ltcc;->a(Lmdc;)V

    new-instance v0, Lqfn;

    invoke-direct {v0, p0}, Lqfn;-><init>(Lrfn;)V

    iput-object v0, p0, Lrfn;->m:Lqfn;

    iget-object v1, p0, Lmgn;->g:Lydn;

    invoke-virtual {v1, v0}, Lydn;->b(Ltdn;)V

    iget-object v0, p0, Lmgn;->f:Lk6l;

    iget-object p0, p0, Lrfn;->m:Lqfn;

    invoke-virtual {v0, p0}, Lk6l;->c(Lj6l;)V

    return-void
.end method

.method public final g()V
    .registers 5

    iget-object v0, p0, Lmgn;->c:Lcom/opera/android/BrowserActivity;

    invoke-interface {v0}, Lndc;->getLifecycle()Ltcc;

    move-result-object v0

    invoke-virtual {v0, p0}, Ltcc;->b(Lmdc;)V

    iget-object v0, p0, Lrfn;->m:Lqfn;

    if-eqz v0, :cond_2b

    iget-object v1, v0, Lqfn;->b:Lf6l;

    const/4 v2, 0x0

    if-eqz v1, :cond_1b

    iget-object v3, v0, Lqfn;->d:Lrfn;

    iget-object v3, v3, Lmgn;->f:Lk6l;

    invoke-virtual {v3, v1}, Lk6l;->x(Lj6l;)V

    iput-object v2, v0, Lqfn;->b:Lf6l;

    :cond_1b
    iget-object v0, p0, Lmgn;->g:Lydn;

    iget-object v1, p0, Lrfn;->m:Lqfn;

    invoke-virtual {v0, v1}, Lydn;->A(Ltdn;)V

    iget-object v0, p0, Lmgn;->f:Lk6l;

    iget-object v1, p0, Lrfn;->m:Lqfn;

    invoke-virtual {v0, v1}, Lk6l;->x(Lj6l;)V

    iput-object v2, p0, Lrfn;->m:Lqfn;

    :cond_2b
    return-void
.end method

.method public final i(Lb2l;)Z
    .registers 4

    if-eqz p1, :cond_1f

    move-object v0, p1

    check-cast v0, Ld7l;

    invoke-virtual {v0}, Ld7l;->n0()Z

    move-result v1

    if-nez v1, :cond_1f

    invoke-virtual {p0, p1}, Lmgn;->d(Lb2l;)Z

    move-result p1

    if-eqz p1, :cond_1f

    iget-object p0, p0, Lmgn;->g:Lydn;

    invoke-virtual {v0}, Ld7l;->i0()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lydn;->t(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_1f

    const/4 p0, 0x1

    return p0

    :cond_1f
    const/4 p0, 0x0

    return p0
.end method
