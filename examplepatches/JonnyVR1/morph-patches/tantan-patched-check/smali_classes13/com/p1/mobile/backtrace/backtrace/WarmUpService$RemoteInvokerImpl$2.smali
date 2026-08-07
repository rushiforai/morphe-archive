.class Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl$2;
.super Landroid/os/Handler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;->connect(Landroid/content/Context;Landroid/os/Bundle;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;Landroid/os/Looper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl$2;->this$0:Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2

    .line 1
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 2
    .line 3
    instance-of v0, p1, Landroid/os/Bundle;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p1, Landroid/os/Bundle;

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl$2;->this$0:Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;->mResult:[Landroid/os/Bundle;

    .line 12
    .line 13
    monitor-enter v0

    .line 14
    :try_start_0
    iget-object p0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl$2;->this$0:Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;->mResult:[Landroid/os/Bundle;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    aput-object p1, p0, v1

    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 22
    .line 23
    .line 24
    monitor-exit v0

    .line 25
    return-void

    .line 26
    :catchall_0
    move-exception p0

    .line 27
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    throw p0

    .line 29
    :cond_0
    return-void
.end method
