.class public Lcom/tantanapp/push/xiaomi/MiPushReceiver$a;
.super Ll/hmb0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/push/xiaomi/MiPushReceiver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field public d:Z

.field public final synthetic e:Lcom/tantanapp/push/xiaomi/MiPushReceiver;


# direct methods
.method public constructor <init>(Lcom/tantanapp/push/xiaomi/MiPushReceiver;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/push/xiaomi/MiPushReceiver$a;->e:Lcom/tantanapp/push/xiaomi/MiPushReceiver;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/hmb0;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-boolean p1, p0, Lcom/tantanapp/push/xiaomi/MiPushReceiver$a;->d:Z

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public a(Landroid/content/Intent;)Z
    .locals 1

    .line 1
    :try_start_0
    const-string v0, "key_message"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lcom/xiaomi/mipush/sdk/MiPushMessage;

    .line 8
    .line 9
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/xiaomi/mipush/sdk/MiPushMessage;->getExtra()Ljava/util/Map;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    const-string v0, "custom"

    .line 26
    .line 27
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    check-cast p1, Ljava/lang/String;

    .line 32
    .line 33
    const/4 v0, 0x1

    .line 34
    invoke-virtual {p0, p1, v0}, Ll/hmb0;->c(Ljava/lang/String;Z)Z

    .line 35
    .line 36
    .line 37
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 38
    invoke-static {}, Ll/k26;->a()Landroid/app/Application;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-static {p1}, Lcom/xiaomi/mipush/sdk/MiPushClient;->clearNotification(Landroid/content/Context;)V

    .line 43
    .line 44
    .line 45
    return p0

    .line 46
    :cond_0
    :goto_0
    invoke-static {}, Ll/k26;->a()Landroid/app/Application;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-static {p0}, Lcom/xiaomi/mipush/sdk/MiPushClient;->clearNotification(Landroid/content/Context;)V

    .line 51
    .line 52
    .line 53
    goto :goto_1

    .line 54
    :catch_0
    move-exception p0

    .line 55
    :try_start_1
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :goto_1
    const/4 p0, 0x0

    .line 60
    return p0

    .line 61
    :catchall_0
    move-exception p0

    .line 62
    invoke-static {}, Ll/k26;->a()Landroid/app/Application;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-static {p1}, Lcom/xiaomi/mipush/sdk/MiPushClient;->clearNotification(Landroid/content/Context;)V

    .line 67
    .line 68
    .line 69
    throw p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "mipush"

    .line 2
    .line 3
    return-object p0
.end method

.method public i()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/tantanapp/push/xiaomi/MiPushReceiver$a;->d:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    monitor-enter p0

    .line 6
    :try_start_0
    iget-boolean v0, p0, Lcom/tantanapp/push/xiaomi/MiPushReceiver$a;->d:Z

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const-string v0, "[common][push]"

    .line 12
    .line 13
    const-string v2, "MiPushReceiver start!"

    .line 14
    .line 15
    invoke-static {v0, v2}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-static {}, Ll/k26;->a()Landroid/app/Application;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v2, "2882303761517241939"

    .line 23
    .line 24
    const-string v3, "5271724125939"

    .line 25
    .line 26
    invoke-static {v0, v2, v3}, Lcom/xiaomi/mipush/sdk/MiPushClient;->registerPush(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iput-boolean v1, p0, Lcom/tantanapp/push/xiaomi/MiPushReceiver$a;->d:Z

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :catchall_0
    move-exception v0

    .line 33
    goto :goto_1

    .line 34
    :cond_0
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 35
    invoke-virtual {p0, v1}, Ll/hmb0;->f(Z)V

    .line 36
    .line 37
    .line 38
    sget-boolean v0, Ll/kmk0;->c:Z

    .line 39
    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    new-instance v0, Lcom/tantanapp/push/xiaomi/MiPushReceiver$a$a;

    .line 43
    .line 44
    invoke-direct {v0, p0}, Lcom/tantanapp/push/xiaomi/MiPushReceiver$a$a;-><init>(Lcom/tantanapp/push/xiaomi/MiPushReceiver$a;)V

    .line 45
    .line 46
    .line 47
    invoke-static {}, Ll/k26;->a()Landroid/app/Application;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-static {p0, v0}, Ll/xzv;->b(Landroid/content/Context;Ll/zzv;)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 56
    throw v0

    .line 57
    :cond_1
    return-void
.end method
