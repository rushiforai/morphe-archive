.class Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl$1;->this$0:Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;

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
    iget-object p1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl$1;->this$0:Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;

    .line 2
    .line 3
    new-instance v0, Landroid/os/Messenger;

    .line 4
    .line 5
    invoke-direct {v0, p2}, Landroid/os/Messenger;-><init>(Landroid/os/IBinder;)V

    .line 6
    .line 7
    .line 8
    iput-object v0, p1, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;->mReq:Landroid/os/Messenger;

    .line 9
    .line 10
    iget-object p1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl$1;->this$0:Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;

    .line 11
    .line 12
    invoke-static {p1}, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;->access$000(Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;)[Z

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    monitor-enter p1

    .line 17
    :try_start_0
    iget-object p2, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl$1;->this$0:Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;

    .line 18
    .line 19
    invoke-static {p2}, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;->access$000(Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;)[Z

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    const/4 v0, 0x0

    .line 24
    const/4 v1, 0x1

    .line 25
    aput-boolean v1, p2, v0

    .line 26
    .line 27
    iget-object p2, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl$1;->this$0:Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;

    .line 28
    .line 29
    invoke-static {p2}, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;->access$000(Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;)[Z

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    invoke-virtual {p2}, Ljava/lang/Object;->notifyAll()V

    .line 34
    .line 35
    .line 36
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 37
    const-string p1, "Matrix.WarmUpInvoker"

    .line 38
    .line 39
    const-string p2, "This remote invoker(%s) connected."

    .line 40
    .line 41
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-static {p1, p2, p0}, Lcom/p1/mobile/backtrace/MatrixLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :catchall_0
    move-exception p0

    .line 50
    :try_start_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 51
    throw p0
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 4

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl$1;->this$0:Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    iput-object v0, p1, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;->mReq:Landroid/os/Messenger;

    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl$1;->this$0:Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;

    .line 7
    .line 8
    invoke-static {p1}, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;->access$000(Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;)[Z

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    monitor-enter p1

    .line 13
    :try_start_0
    iget-object v1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl$1;->this$0:Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;

    .line 14
    .line 15
    invoke-static {v1}, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;->access$000(Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;)[Z

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const/4 v2, 0x0

    .line 20
    aput-boolean v2, v1, v2

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl$1;->this$0:Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;

    .line 23
    .line 24
    invoke-static {v1}, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;->access$000(Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;)[Z

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 29
    .line 30
    .line 31
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 32
    const-string p1, "Matrix.WarmUpInvoker"

    .line 33
    .line 34
    const-string v1, "This remote invoker(%s) disconnected."

    .line 35
    .line 36
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    invoke-static {p1, v1, v3}, Lcom/p1/mobile/backtrace/MatrixLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl$1;->this$0:Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;

    .line 44
    .line 45
    iget-object v1, p1, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;->mResult:[Landroid/os/Bundle;

    .line 46
    .line 47
    monitor-enter v1

    .line 48
    :try_start_1
    iget-object p0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl$1;->this$0:Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;

    .line 49
    .line 50
    iget-object p0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;->mResult:[Landroid/os/Bundle;

    .line 51
    .line 52
    aput-object v0, p0, v2

    .line 53
    .line 54
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 55
    .line 56
    .line 57
    monitor-exit v1

    .line 58
    return-void

    .line 59
    :catchall_0
    move-exception p0

    .line 60
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 61
    throw p0

    .line 62
    :catchall_1
    move-exception p0

    .line 63
    :try_start_2
    monitor-exit p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 64
    throw p0
.end method
