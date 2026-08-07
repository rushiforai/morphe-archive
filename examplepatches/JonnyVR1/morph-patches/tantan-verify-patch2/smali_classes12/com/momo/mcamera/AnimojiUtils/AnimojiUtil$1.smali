.class Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil$1;
.super Landroid/os/Handler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->onData([B)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;


# direct methods
.method public constructor <init>(Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;Landroid/os/Looper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil$1;->this$0:Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;

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
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil$1;->this$0:Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;

    .line 5
    .line 6
    iget-object p1, p1, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->syncLock:Ljava/lang/Object;

    .line 7
    .line 8
    monitor-enter p1

    .line 9
    :try_start_0
    iget-object v0, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil$1;->this$0:Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->dataList:Ljava/util/LinkedList;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/util/LinkedList;->pollFirst()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, [B

    .line 18
    .line 19
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 20
    iget-object p1, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil$1;->this$0:Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;

    .line 21
    .line 22
    invoke-static {p1, v0}, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->access$000(Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;[B)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil$1;->this$0:Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;

    .line 26
    .line 27
    iget-object v1, p1, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->syncLock:Ljava/lang/Object;

    .line 28
    .line 29
    monitor-enter v1

    .line 30
    :try_start_1
    iget-object p0, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil$1;->this$0:Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->emptyList:Ljava/util/LinkedList;

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    monitor-exit v1

    .line 38
    return-void

    .line 39
    :catchall_0
    move-exception p0

    .line 40
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 41
    throw p0

    .line 42
    :catchall_1
    move-exception p0

    .line 43
    :try_start_2
    monitor-exit p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 44
    throw p0
.end method
