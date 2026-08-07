.class Lcom/xiaomi/mipush/sdk/f$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/mipush/sdk/f;->Y(Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/xiaomi/mipush/sdk/f;


# direct methods
.method public constructor <init>(Lcom/xiaomi/mipush/sdk/f;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/xiaomi/mipush/sdk/f$d;->a:Lcom/xiaomi/mipush/sdk/f;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/f$d;->a:Lcom/xiaomi/mipush/sdk/f;

    .line 2
    .line 3
    monitor-enter p1

    .line 4
    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/f$d;->a:Lcom/xiaomi/mipush/sdk/f;

    .line 5
    .line 6
    new-instance v1, Landroid/os/Messenger;

    .line 7
    .line 8
    invoke-direct {v1, p2}, Landroid/os/Messenger;-><init>(Landroid/os/IBinder;)V

    .line 9
    .line 10
    .line 11
    invoke-static {v0, v1}, Lcom/xiaomi/mipush/sdk/f;->g(Lcom/xiaomi/mipush/sdk/f;Landroid/os/Messenger;)Landroid/os/Messenger;

    .line 12
    .line 13
    .line 14
    iget-object p2, p0, Lcom/xiaomi/mipush/sdk/f$d;->a:Lcom/xiaomi/mipush/sdk/f;

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    invoke-static {p2, v0}, Lcom/xiaomi/mipush/sdk/f;->L(Lcom/xiaomi/mipush/sdk/f;Z)Z

    .line 18
    .line 19
    .line 20
    iget-object p2, p0, Lcom/xiaomi/mipush/sdk/f$d;->a:Lcom/xiaomi/mipush/sdk/f;

    .line 21
    .line 22
    invoke-static {p2}, Lcom/xiaomi/mipush/sdk/f;->l(Lcom/xiaomi/mipush/sdk/f;)Ljava/util/List;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_0

    .line 35
    .line 36
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Landroid/os/Message;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 41
    .line 42
    :try_start_1
    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/f$d;->a:Lcom/xiaomi/mipush/sdk/f;

    .line 43
    .line 44
    invoke-static {v1}, Lcom/xiaomi/mipush/sdk/f;->f(Lcom/xiaomi/mipush/sdk/f;)Landroid/os/Messenger;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v1, v0}, Landroid/os/Messenger;->send(Landroid/os/Message;)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :catchall_0
    move-exception p0

    .line 53
    goto :goto_1

    .line 54
    :catch_0
    move-exception v0

    .line 55
    :try_start_2
    invoke-static {v0}, Ll/ouq0;->q(Ljava/lang/Throwable;)V

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_0
    iget-object p0, p0, Lcom/xiaomi/mipush/sdk/f$d;->a:Lcom/xiaomi/mipush/sdk/f;

    .line 60
    .line 61
    invoke-static {p0}, Lcom/xiaomi/mipush/sdk/f;->l(Lcom/xiaomi/mipush/sdk/f;)Ljava/util/List;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 66
    .line 67
    .line 68
    monitor-exit p1

    .line 69
    return-void

    .line 70
    :goto_1
    monitor-exit p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 71
    throw p0
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/f$d;->a:Lcom/xiaomi/mipush/sdk/f;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p1, v0}, Lcom/xiaomi/mipush/sdk/f;->g(Lcom/xiaomi/mipush/sdk/f;Landroid/os/Messenger;)Landroid/os/Messenger;

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/xiaomi/mipush/sdk/f$d;->a:Lcom/xiaomi/mipush/sdk/f;

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    invoke-static {p0, p1}, Lcom/xiaomi/mipush/sdk/f;->L(Lcom/xiaomi/mipush/sdk/f;Z)Z

    .line 11
    .line 12
    .line 13
    return-void
.end method
