.class public Lcom/leanplum/LeanplumPushReceiver;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 5

    const/4 p0, 0x0

    if-nez p2, :cond_b

    :try_start_3
    const-string p1, "Received a null intent."

    new-array p0, p0, [Ljava/lang/Object;

    invoke-static {p1, p0}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_b
    invoke-static {}, Lcom/leanplum/internal/LeanplumManifestHelper;->parseNotificationMetadata()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1c

    const-string v0, "Custom broadcast receiver class not set, using default one."

    new-array p0, p0, [Ljava/lang/Object;

    invoke-static {v0, p0}, Lcom/leanplum/internal/Log;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-static {p1, p2}, Lcom/leanplum/LeanplumPushService;->openNotification(Landroid/content/Context;Landroid/content/Intent;)V

    return-void

    :cond_1c
    const-string v1, "Custom broadcast receiver class found, using it to handle push notifications."

    new-array p0, p0, [Ljava/lang/Object;

    invoke-static {v1, p0}, Lcom/leanplum/internal/Log;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance p0, Landroid/content/Intent;

    invoke-direct {p0}, Landroid/content/Intent;-><init>()V

    const-string v1, "LP_NOTIFICATION"

    invoke-virtual {p0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, p1, v0}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p2

    invoke-virtual {p0, p2}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    invoke-virtual {p1, p0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V
    :try_end_3a
    .catchall {:try_start_3 .. :try_end_3a} :catchall_3b

    return-void

    :catchall_3b
    move-exception p0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    return-void
.end method
