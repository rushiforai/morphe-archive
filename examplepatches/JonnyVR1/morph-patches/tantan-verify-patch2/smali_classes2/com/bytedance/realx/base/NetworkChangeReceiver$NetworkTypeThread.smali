.class Lcom/bytedance/realx/base/NetworkChangeReceiver$NetworkTypeThread;
.super Ljava/lang/Thread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bytedance/realx/base/NetworkChangeReceiver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "NetworkTypeThread"
.end annotation


# instance fields
.field public keepAlive:Z

.field final synthetic this$0:Lcom/bytedance/realx/base/NetworkChangeReceiver;


# direct methods
.method public constructor <init>(Lcom/bytedance/realx/base/NetworkChangeReceiver;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/bytedance/realx/base/NetworkChangeReceiver$NetworkTypeThread;->this$0:Lcom/bytedance/realx/base/NetworkChangeReceiver;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    iput-boolean p1, p0, Lcom/bytedance/realx/base/NetworkChangeReceiver$NetworkTypeThread;->keepAlive:Z

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    :goto_0
    sget-object v0, Lcom/bytedance/realx/base/NetworkChangeReceiver;->threadLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/bytedance/realx/base/NetworkChangeReceiver$NetworkTypeThread;->this$0:Lcom/bytedance/realx/base/NetworkChangeReceiver;

    .line 5
    .line 6
    invoke-static {v1}, Lcom/bytedance/realx/base/NetworkChangeReceiver;->access$000(Lcom/bytedance/realx/base/NetworkChangeReceiver;)Z

    .line 7
    .line 8
    .line 9
    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    :try_start_1
    sget-object v1, Lcom/bytedance/realx/base/NetworkChangeReceiver;->threadLock:Ljava/lang/Object;

    .line 13
    .line 14
    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 15
    .line 16
    .line 17
    goto :goto_1

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_3

    .line 20
    :catch_0
    move-exception v1

    .line 21
    :try_start_2
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 22
    .line 23
    .line 24
    :cond_0
    :goto_1
    iget-boolean v1, p0, Lcom/bytedance/realx/base/NetworkChangeReceiver$NetworkTypeThread;->keepAlive:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 25
    .line 26
    if-eqz v1, :cond_1

    .line 27
    .line 28
    :try_start_3
    iget-object v1, p0, Lcom/bytedance/realx/base/NetworkChangeReceiver$NetworkTypeThread;->this$0:Lcom/bytedance/realx/base/NetworkChangeReceiver;

    .line 29
    .line 30
    invoke-static {v1}, Lcom/bytedance/realx/base/NetworkChangeReceiver;->access$100(Lcom/bytedance/realx/base/NetworkChangeReceiver;)V
    :try_end_3
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 31
    .line 32
    .line 33
    goto :goto_2

    .line 34
    :catch_1
    move-exception v1

    .line 35
    :try_start_4
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 36
    .line 37
    .line 38
    :goto_2
    monitor-exit v0

    .line 39
    goto :goto_0

    .line 40
    :cond_1
    monitor-exit v0

    .line 41
    return-void

    .line 42
    :goto_3
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 43
    throw p0
.end method

.method public stopThread()V
    .locals 3

    .line 1
    sget-object v0, Lcom/bytedance/realx/base/NetworkChangeReceiver;->threadLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    const-string v1, "NetworkChangeReceiver"

    .line 5
    .line 6
    const-string v2, "stopThread"

    .line 7
    .line 8
    invoke-static {v1, v2}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    iput-boolean v1, p0, Lcom/bytedance/realx/base/NetworkChangeReceiver$NetworkTypeThread;->keepAlive:Z

    .line 13
    .line 14
    sget-object p0, Lcom/bytedance/realx/base/NetworkChangeReceiver;->threadLock:Ljava/lang/Object;

    .line 15
    .line 16
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 17
    .line 18
    .line 19
    monitor-exit v0

    .line 20
    return-void

    .line 21
    :catchall_0
    move-exception p0

    .line 22
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    throw p0
.end method
