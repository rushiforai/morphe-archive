.class public final Lj9k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lk9k;


# instance fields
.field public final a:Landroid/app/Activity;

.field public final b:Lumi;

.field public final c:Lcom/opera/android/settings/SettingsManager;

.field public final d:Lj4c;

.field public e:Li9k;

.field public f:Z

.field public final g:Ljze;


# direct methods
.method public constructor <init>(Landroid/app/Activity;Lumi;Lcom/opera/android/Lazy;Lcom/opera/android/settings/SettingsManager;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lj9k;->a:Landroid/app/Activity;

    iput-object p2, p0, Lj9k;->b:Lumi;

    iput-object p4, p0, Lj9k;->c:Lcom/opera/android/settings/SettingsManager;

    new-instance p1, Low3;

    const/16 p2, 0xa

    invoke-direct {p1, p0, p3, p2}, Low3;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance p2, Lj4c;

    const/4 p3, 0x0

    invoke-direct {p2, p1, p3}, Lj4c;-><init>(Lesk;B)V

    iput-object p2, p0, Lj9k;->d:Lj4c;

    new-instance p1, Ljze;

    sget-object p2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-direct {p1, p2}, Ljze;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lj9k;->g:Ljze;

    return-void
.end method


# virtual methods
.method public final a()Lize;
    .registers 1

    iget-object p0, p0, Lj9k;->g:Ljze;

    return-object p0
.end method

.method public final b(Z)V
    .registers 5

    invoke-virtual {p0}, Lj9k;->d()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    iget-object v0, p0, Lj9k;->d:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->f()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_3b

    check-cast v0, Lbk5;

    if-eqz p1, :cond_19

    sget-object p1, Lxle;->d:Lxle;

    invoke-virtual {v0, p1}, Lbk5;->b(Lp58;)Z

    goto :goto_3b

    :cond_19
    invoke-virtual {v0}, Lbk5;->a()Z

    move-result p1

    if-eqz p1, :cond_3b

    iget-object p1, v0, Lbk5;->g:Llh4;

    const/4 v1, 0x0

    if-eqz p1, :cond_28

    iput-object v1, p1, Llh4;->b:Lcom/opera/api/Callback;

    iput-object v1, v0, Lbk5;->g:Llh4;

    :cond_28
    iget-object p1, v0, Lbk5;->a:Ljk5;

    iget-object v2, p1, Ljk5;->d:Ljava/lang/Object;

    monitor-enter v2

    :try_start_2d
    iput-object v1, p1, Ljk5;->e:Ljava/lang/String;
    :try_end_2f
    .catchall {:try_start_2d .. :try_end_2f} :catchall_38

    monitor-exit v2

    iput-object v1, v0, Lbk5;->h:Lzj5;

    sget-object p1, Lak5;->a:Lak5;

    invoke-virtual {v0, p1}, Lbk5;->d(Lak5;)V

    goto :goto_3b

    :catchall_38
    move-exception p0

    monitor-exit v2

    throw p0

    :cond_3b
    :goto_3b
    invoke-virtual {p0}, Lj9k;->c()V

    return-void
.end method

.method public final c()V
    .registers 3

    invoke-virtual {p0}, Lj9k;->d()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    iget-object v0, p0, Lj9k;->e:Li9k;

    if-eqz v0, :cond_17

    sget-object v1, Lxw1;->b:Lvzk;

    iget-object v1, v1, Lvzk;->b:Ljava/lang/Object;

    check-cast v1, Li7f;

    invoke-virtual {v1, v0}, Li7f;->c(Ljava/lang/Object;)Z

    const/4 v0, 0x0

    iput-object v0, p0, Lj9k;->e:Li9k;

    :cond_17
    iget-object p0, p0, Lj9k;->g:Ljze;

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p0, v0}, Ljze;->r(Ljava/lang/Object;)V

    return-void
.end method

.method public final d()Z
    .registers 1

    iget-object p0, p0, Lj9k;->g:Ljze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0
.end method

.method public final e(Ljava/lang/String;)V
    .registers 5

    invoke-virtual {p0}, Lj9k;->d()Z

    move-result v0

    if-nez v0, :cond_e

    iget-object v0, p0, Lj9k;->d:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->c()Z

    move-result v1

    if-eqz v1, :cond_f

    :cond_e
    return-void

    :cond_f
    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lbk5;

    sget-object v1, Lgk5;->a:Lgk5;

    invoke-virtual {v0, p1, v1}, Lbk5;->e(Ljava/lang/String;Lgk5;)Z

    move-result p1

    if-nez p1, :cond_21

    invoke-virtual {p0}, Lj9k;->c()V

    return-void

    :cond_21
    iget-object p1, v0, Lbk5;->f:Lkze;

    new-instance v0, Ln6k;

    const/4 v1, 0x7

    invoke-direct {v0, p0, v1}, Ln6k;-><init>(Ljava/lang/Object;B)V

    new-instance v1, Lw4i;

    const/16 v2, 0xe

    invoke-direct {v1, v0, v2}, Lw4i;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p0, Lj9k;->g:Ljze;

    iget-object p0, p0, Ljze;->l:Lh42;

    invoke-virtual {p0, p1, v1}, Lh42;->s(Lekc;Lf7f;)V

    return-void
.end method

.method public final start()V
    .registers 3

    iget-boolean v0, p0, Lj9k;->f:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Lj9k;->f:Z

    iget-object v0, p0, Lj9k;->c:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v0}, Lcom/opera/android/settings/SettingsManager;->J()Z

    move-result v0

    if-eqz v0, :cond_36

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, p0, Lj9k;->a:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->i()Ljk5;

    move-result-object v0

    invoke-virtual {v0}, Ljk5;->a()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_36

    sget-object v0, Lcak;->d:Lavj;

    new-instance v0, Lmni;

    const/16 v1, 0x17

    invoke-direct {v0, p0, v1}, Lmni;-><init>(Ljava/lang/Object;B)V

    const/4 p0, 0x2

    invoke-static {p0, v0}, Lavj;->g(ILjava/lang/Runnable;)V

    return-void

    :cond_36
    invoke-virtual {p0}, Lj9k;->c()V

    return-void
.end method
