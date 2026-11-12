.class public final Lsom;
.super Llim;
.source "SourceFile"


# instance fields
.field public final a:Ldb;

.field public final b:Lnj2;

.field public final c:Li53;

.field public final d:Ldl3;

.field public final e:Lrom;

.field public final f:Lb59;

.field public g:Ljava/lang/Runnable;

.field public h:Lcom/opera/android/autofill/PasswordManager;

.field public i:Lcom/opera/android/autofill/PasswordDataMonitor;

.field public j:Z

.field public k:Z

.field public l:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Ldb;Li53;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lnj2;

    const/16 v1, 0x8

    invoke-direct {v0, p0, v1}, Lnj2;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lsom;->b:Lnj2;

    new-instance v0, Ldl3;

    const/4 v1, 0x5

    invoke-direct {v0, p0, v1}, Ldl3;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lsom;->d:Ldl3;

    new-instance v0, Lrom;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lrom;-><init>(Lsom;B)V

    iput-object v0, p0, Lsom;->e:Lrom;

    iput-object p2, p0, Lsom;->a:Ldb;

    iput-object p3, p0, Lsom;->c:Li53;

    sget-object p2, Lvml;->d:Lumi;

    const-string p3, "sync_upgrade_promo"

    new-array v0, v1, [Lbg1;

    invoke-static {p1, p2, p3, v0}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object p1

    iput-object p1, p0, Lsom;->f:Lb59;

    return-void
.end method


# virtual methods
.method public final R(I)Z
    .registers 9

    iget-boolean v0, p0, Lsom;->j:Z

    const/4 v1, 0x0

    if-nez v0, :cond_53

    const/4 v0, 0x1

    if-eqz p1, :cond_f

    if-ne p1, v0, :cond_17

    iget-boolean p1, p0, Lsom;->k:Z

    if-nez p1, :cond_17

    goto :goto_53

    :cond_f
    iget-boolean p1, p0, Lsom;->k:Z

    if-nez p1, :cond_17

    iget-boolean p1, p0, Lsom;->l:Z

    if-eqz p1, :cond_53

    :cond_17
    iget-object p1, p0, Lsom;->a:Ldb;

    invoke-virtual {p1}, Ldb;->f()Z

    move-result v2

    if-eqz v2, :cond_53

    invoke-virtual {p1}, Ldb;->d()Z

    move-result p1

    if-eqz p1, :cond_53

    iget-object p0, p0, Lsom;->f:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/SharedPreferences;

    const-string v2, "last_signin"

    const-wide/16 v3, 0x0

    invoke-interface {p1, v2, v3, v4}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v5

    cmp-long p1, v5, v3

    if-nez p1, :cond_47

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-static {p0, v2}, Lam2;->x(Landroid/content/SharedPreferences$Editor;Ljava/lang/String;)V

    return v1

    :cond_47
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p0

    sub-long/2addr p0, v5

    const-wide/32 v2, 0x44aa200

    cmp-long p0, p0, v2

    if-gez p0, :cond_54

    :cond_53
    :goto_53
    return v1

    :cond_54
    return v0
.end method

.method public final W(Lndc;)V
    .registers 4

    iget-object p1, p0, Lsom;->a:Ldb;

    iget-object v0, p0, Lsom;->b:Lnj2;

    invoke-virtual {p1, v0}, Ldb;->a(Lcb;)V

    new-instance p1, Lrom;

    const/4 v0, 0x1

    invoke-direct {p1, p0, v0}, Lrom;-><init>(Lsom;B)V

    iget-object v1, p0, Lsom;->c:Li53;

    check-cast v1, Lcom/opera/android/bookmarks/h;

    iget-object v1, v1, Lcom/opera/android/bookmarks/h;->a:Lnrl;

    invoke-virtual {v1, p1}, Lnrl;->d(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    move-result-object p1

    iput-object p1, p0, Lsom;->g:Ljava/lang/Runnable;

    sget-object p1, Lcak;->d:Lavj;

    iget-object p0, p0, Lsom;->e:Lrom;

    invoke-static {v0, p0}, Lavj;->g(ILjava/lang/Runnable;)V

    return-void
.end method

.method public final onDestroy(Lndc;)V
    .registers 4

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    iget-object p1, p0, Lsom;->a:Ldb;

    iget-object v0, p0, Lsom;->b:Lnj2;

    invoke-virtual {p1, v0}, Ldb;->h(Lcb;)V

    iget-object p1, p0, Lsom;->g:Ljava/lang/Runnable;

    iget-object v0, p0, Lsom;->c:Li53;

    const/4 v1, 0x0

    if-nez p1, :cond_1f

    iget-boolean p1, p0, Lsom;->k:Z

    if-nez p1, :cond_32

    iget-object p1, p0, Lsom;->d:Ldl3;

    invoke-virtual {v0, p1}, Li53;->f(Lql3;)V

    goto :goto_32

    :cond_1f
    check-cast v0, Lcom/opera/android/bookmarks/h;

    iget-object v0, v0, Lcom/opera/android/bookmarks/h;->a:Lnrl;

    iget-object v0, v0, Lnrl;->b:Ljava/lang/Object;

    check-cast v0, Lvl9;

    iget-object v0, v0, Lvl9;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    if-eqz v0, :cond_30

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    :cond_30
    iput-object v1, p0, Lsom;->g:Ljava/lang/Runnable;

    :cond_32
    :goto_32
    iget-object p1, p0, Lsom;->i:Lcom/opera/android/autofill/PasswordDataMonitor;

    if-eqz p1, :cond_3b

    invoke-virtual {p1}, Lcom/opera/android/autofill/PasswordDataMonitor;->a()V

    iput-object v1, p0, Lsom;->i:Lcom/opera/android/autofill/PasswordDataMonitor;

    :cond_3b
    iget-object p1, p0, Lsom;->h:Lcom/opera/android/autofill/PasswordManager;

    if-nez p1, :cond_47

    sget-object p1, Lcak;->d:Lavj;

    iget-object p1, p0, Lsom;->e:Lrom;

    invoke-static {p1}, Lavj;->f(Ljava/lang/Runnable;)V

    goto :goto_49

    :cond_47
    iput-object v1, p0, Lsom;->h:Lcom/opera/android/autofill/PasswordManager;

    :goto_49
    const/4 p1, 0x0

    iput-boolean p1, p0, Lsom;->k:Z

    iput-boolean p1, p0, Lsom;->l:Z

    return-void
.end method
