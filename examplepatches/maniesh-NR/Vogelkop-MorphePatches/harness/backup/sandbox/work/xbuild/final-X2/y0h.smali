.class public final Ly0h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lj6l;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lx5f;

.field public c:Z


# direct methods
.method public constructor <init>(Landroidx/fragment/app/r;Lk6l;Lx5f;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Ly0h;->a:Landroid/content/Context;

    iput-object p3, p0, Ly0h;->b:Lx5f;

    invoke-virtual {p2, p0}, Lk6l;->c(Lj6l;)V

    sget-object p3, Lcom/opera/android/browser/PrivateTabsBroadcastReceiver;->a:Ljava/util/Random;

    if-nez p3, :cond_19

    new-instance p3, Ljava/util/Random;

    invoke-direct {p3}, Ljava/util/Random;-><init>()V

    sput-object p3, Lcom/opera/android/browser/PrivateTabsBroadcastReceiver;->a:Ljava/util/Random;

    :cond_19
    sget-object p3, Lcom/opera/android/browser/PrivateTabsBroadcastReceiver;->b:Ljava/lang/Object;

    monitor-enter p3

    const/4 v0, 0x1

    :try_start_1d
    sput-boolean v0, Lcom/opera/android/browser/PrivateTabsBroadcastReceiver;->c:Z

    monitor-exit p3
    :try_end_20
    .catchall {:try_start_1d .. :try_end_20} :catchall_4e

    new-instance p3, Ld7d;

    invoke-direct {p3, p1}, Ld7d;-><init>(Landroidx/fragment/app/r;)V

    const/4 p1, 0x0

    new-array p1, p1, [Ljava/lang/Void;

    invoke-static {p3, p1}, Lhe2;->a(Landroid/os/AsyncTask;[Ljava/lang/Object;)Z

    iget p1, p2, Lk6l;->n:I

    if-lez p1, :cond_33

    invoke-virtual {p0}, Ly0h;->a()V

    return-void

    :cond_33
    invoke-static {}, Laib;->t()Lwub;

    move-result-object p0

    const-string p1, "NotificationManagerProxyImpl.cancel(id)"

    const/4 p2, 0x0

    invoke-static {p1, p2}, Lorg/chromium/base/TraceEvent;->n(Ljava/lang/String;Ljava/lang/String;)Lorg/chromium/base/TraceEvent;

    move-result-object p1

    new-instance p2, Lbr;

    const/16 p3, 0x12

    const v0, 0x7f0a07d9

    invoke-direct {p2, p0, v0, p3}, Lbr;-><init>(Ljava/lang/Object;IB)V

    invoke-static {p1, p2}, Lwub;->N(Lorg/chromium/base/TraceEvent;Ljava/lang/Runnable;)V

    return-void

    :goto_4c
    :try_start_4c
    monitor-exit p3
    :try_end_4d
    .catchall {:try_start_4c .. :try_end_4d} :catchall_4e

    throw p0

    :catchall_4e
    move-exception p0

    goto :goto_4c
.end method


# virtual methods
.method public final a()V
    .registers 8

    iget-object v0, p0, Ly0h;->a:Landroid/content/Context;

    iget-boolean v1, p0, Ly0h;->c:Z

    if-eqz v1, :cond_7

    return-void

    :cond_7
    sget-object v1, Lcom/opera/android/browser/PrivateTabsBroadcastReceiver;->a:Ljava/util/Random;

    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/opera/android/browser/PrivateTabsBroadcastReceiver;

    invoke-direct {v1, v0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v2, "com.opera.android.ACTION_CLOSE_ALL_PRIVATE_TABS"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const-string v2, "com.opera.android.ARGUMENT"

    sget-object v3, Lcom/opera/android/browser/PrivateTabsBroadcastReceiver;->b:Ljava/lang/Object;

    monitor-enter v3

    :try_start_1a
    sget-boolean v4, Lcom/opera/android/browser/PrivateTabsBroadcastReceiver;->c:Z

    if-eqz v4, :cond_21

    invoke-static {v0}, Lcom/opera/android/browser/PrivateTabsBroadcastReceiver;->a(Landroid/content/Context;)V

    :cond_21
    monitor-exit v3
    :try_end_22
    .catchall {:try_start_1a .. :try_end_22} :catchall_a8

    const-string v3, "private_tabs_receiver"

    const/4 v4, 0x0

    invoke-virtual {v0, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    const-string v5, "secret"

    invoke-interface {v3, v5, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v3

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const/high16 v2, 0xc000000

    invoke-static {v0, v4, v1, v2}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    const-string v2, "private_tabs"

    new-instance v3, Lcm;

    const v4, 0x7f0a07d9

    const/4 v5, 0x5

    const/4 v6, 0x0

    invoke-direct {v3, v6, v4, v5}, Lcm;-><init>(Ljava/lang/String;IB)V

    invoke-static {v2, v3}, Lzi4;->t(Ljava/lang/String;Lcm;)Lua7;

    move-result-object v2

    iget-object v3, v2, Lua7;->b:Ljava/lang/Object;

    check-cast v3, Ll1f;

    iget-object v4, v2, Lua7;->b:Ljava/lang/Object;

    check-cast v4, Ll1f;

    iput-object v1, v4, Ll1f;->g:Landroid/app/PendingIntent;

    const/4 v1, -0x1

    iput v1, v3, Ll1f;->z:I

    const/4 v1, 0x1

    invoke-virtual {v2, v1}, Lua7;->R(Z)V

    const v4, 0x7f080244

    invoke-virtual {v2, v4}, Lua7;->S(I)V

    const v4, 0x7f140d58

    invoke-virtual {v0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ll1f;->f(Ljava/lang/CharSequence;)V

    const v4, 0x7f140d57

    invoke-virtual {v0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ll1f;->e(Ljava/lang/CharSequence;)V

    invoke-static {}, Laib;->t()Lwub;

    move-result-object v3

    invoke-virtual {v2}, Lua7;->l()Li16;

    move-result-object v2

    invoke-virtual {v3, v2}, Lwub;->H(Li16;)V

    iput-boolean v1, p0, Ly0h;->c:Z

    iget-object p0, p0, Ly0h;->b:Lx5f;

    iget-boolean v2, p0, Lx5f;->h:Z

    if-eqz v2, :cond_9b

    iget-object v2, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v3

    invoke-static {v2, v3}, Lam2;->f(Lzpa;Lx56;)Lhi0;

    move-result-object v2

    iget-object v2, v2, Lhi0;->b:Lfi0;

    const/4 v4, 0x6

    const-wide/16 v5, 0x1

    invoke-virtual {v2, v4, v1, v5, v6}, Ljf0;->p(IIJ)V

    invoke-virtual {p0, v3}, Lx5f;->U0(Lx56;)V

    :cond_9b
    new-instance p0, Landroid/content/Intent;

    const-class v1, Lcom/opera/android/browser/PrivateTabsNotificationService;

    invoke-direct {p0, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, p0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    return-void

    :goto_a6
    :try_start_a6
    monitor-exit v3
    :try_end_a7
    .catchall {:try_start_a6 .. :try_end_a7} :catchall_a8

    throw p0

    :catchall_a8
    move-exception p0

    goto :goto_a6
.end method

.method public final d(I)V
    .registers 6

    if-lez p1, :cond_6

    invoke-virtual {p0}, Ly0h;->a()V

    return-void

    :cond_6
    iget-boolean p1, p0, Ly0h;->c:Z

    if-nez p1, :cond_b

    return-void

    :cond_b
    new-instance p1, Landroid/content/Intent;

    const-class v0, Lcom/opera/android/browser/PrivateTabsNotificationService;

    iget-object v1, p0, Ly0h;->a:Landroid/content/Context;

    invoke-direct {p1, v1, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v1, p1}, Landroid/content/Context;->stopService(Landroid/content/Intent;)Z

    invoke-static {}, Laib;->t()Lwub;

    move-result-object p1

    const-string v0, "NotificationManagerProxyImpl.cancel(id)"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/chromium/base/TraceEvent;->n(Ljava/lang/String;Ljava/lang/String;)Lorg/chromium/base/TraceEvent;

    move-result-object v0

    new-instance v1, Lbr;

    const/16 v2, 0x12

    const v3, 0x7f0a07d9

    invoke-direct {v1, p1, v3, v2}, Lbr;-><init>(Ljava/lang/Object;IB)V

    invoke-static {v0, v1}, Lwub;->N(Lorg/chromium/base/TraceEvent;Ljava/lang/Runnable;)V

    const/4 p1, 0x0

    iput-boolean p1, p0, Ly0h;->c:Z

    return-void
.end method

.method public final onDestroy()V
    .registers 6

    iget-boolean v0, p0, Ly0h;->c:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/opera/android/browser/PrivateTabsNotificationService;

    iget-object v2, p0, Ly0h;->a:Landroid/content/Context;

    invoke-direct {v0, v2, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v2, v0}, Landroid/content/Context;->stopService(Landroid/content/Intent;)Z

    invoke-static {}, Laib;->t()Lwub;

    move-result-object v0

    const-string v1, "NotificationManagerProxyImpl.cancel(id)"

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lorg/chromium/base/TraceEvent;->n(Ljava/lang/String;Ljava/lang/String;)Lorg/chromium/base/TraceEvent;

    move-result-object v1

    new-instance v2, Lbr;

    const/16 v3, 0x12

    const v4, 0x7f0a07d9

    invoke-direct {v2, v0, v4, v3}, Lbr;-><init>(Ljava/lang/Object;IB)V

    invoke-static {v1, v2}, Lwub;->N(Lorg/chromium/base/TraceEvent;Ljava/lang/Runnable;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Ly0h;->c:Z

    return-void
.end method
