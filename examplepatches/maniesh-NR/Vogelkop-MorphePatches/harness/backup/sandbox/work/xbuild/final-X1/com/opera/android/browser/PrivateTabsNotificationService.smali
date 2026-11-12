.class public Lcom/opera/android/browser/PrivateTabsNotificationService;
.super Landroid/app/Service;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    return-void
.end method


# virtual methods
.method public final onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .registers 2

    const/4 p0, 0x0

    return-object p0
.end method

.method public final onStartCommand(Landroid/content/Intent;II)I
    .registers 4

    const/4 p0, 0x2

    return p0
.end method

.method public final onTaskRemoved(Landroid/content/Intent;)V
    .registers 6

    if-eqz p1, :cond_2b

    invoke-static {p0}, Lmdb;->a(Landroid/content/Context;)Landroid/content/ComponentName;

    move-result-object v0

    invoke-virtual {p1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2b

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

    invoke-virtual {p0}, Landroid/app/Service;->stopSelf()V

    :cond_2b
    return-void
.end method
