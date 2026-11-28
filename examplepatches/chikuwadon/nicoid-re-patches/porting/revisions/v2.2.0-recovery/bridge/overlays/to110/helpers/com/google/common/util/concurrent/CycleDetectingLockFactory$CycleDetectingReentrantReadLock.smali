.class final Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingReentrantReadLock;
.super Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;
.source "CycleDetectingLockFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/util/concurrent/CycleDetectingLockFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "CycleDetectingReentrantReadLock"
.end annotation


# instance fields
.field final readWriteLock:Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingReentrantReadWriteLock;

.field final synthetic this$0:Lcom/google/common/util/concurrent/CycleDetectingLockFactory;


# direct methods
.method constructor <init>(Lcom/google/common/util/concurrent/CycleDetectingLockFactory;Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingReentrantReadWriteLock;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010,
            0x0
        }
        names = {
            "this$0",
            "readWriteLock"
        }
    .end annotation

    .line 865
    iput-object p1, p0, Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingReentrantReadLock;->this$0:Lcom/google/common/util/concurrent/CycleDetectingLockFactory;

    .line 866
    invoke-direct {p0, p2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;-><init>(Ljava/util/concurrent/locks/ReentrantReadWriteLock;)V

    .line 867
    iput-object p2, p0, Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingReentrantReadLock;->readWriteLock:Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingReentrantReadWriteLock;

    return-void
.end method


# virtual methods
.method public lock()V
    .registers 3

    .line 872
    iget-object v0, p0, Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingReentrantReadLock;->this$0:Lcom/google/common/util/concurrent/CycleDetectingLockFactory;

    iget-object v1, p0, Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingReentrantReadLock;->readWriteLock:Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingReentrantReadWriteLock;

    # invokes: Lcom/google/common/util/concurrent/CycleDetectingLockFactory;->aboutToAcquire(Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingLock;)V
    invoke-static {v0, v1}, Lcom/google/common/util/concurrent/CycleDetectingLockFactory;->access$600(Lcom/google/common/util/concurrent/CycleDetectingLockFactory;Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingLock;)V

    .line 874
    :try_start_0
    invoke-super {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 876
    iget-object p0, p0, Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingReentrantReadLock;->readWriteLock:Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingReentrantReadWriteLock;

    # invokes: Lcom/google/common/util/concurrent/CycleDetectingLockFactory;->lockStateChanged(Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingLock;)V
    invoke-static {p0}, Lcom/google/common/util/concurrent/CycleDetectingLockFactory;->access$700(Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingLock;)V

    return-void

    :catchall_0
    move-exception v0

    iget-object p0, p0, Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingReentrantReadLock;->readWriteLock:Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingReentrantReadWriteLock;

    # invokes: Lcom/google/common/util/concurrent/CycleDetectingLockFactory;->lockStateChanged(Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingLock;)V
    invoke-static {p0}, Lcom/google/common/util/concurrent/CycleDetectingLockFactory;->access$700(Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingLock;)V

    .line 877
    throw v0
.end method

.method public lockInterruptibly()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 882
    iget-object v0, p0, Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingReentrantReadLock;->this$0:Lcom/google/common/util/concurrent/CycleDetectingLockFactory;

    iget-object v1, p0, Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingReentrantReadLock;->readWriteLock:Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingReentrantReadWriteLock;

    # invokes: Lcom/google/common/util/concurrent/CycleDetectingLockFactory;->aboutToAcquire(Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingLock;)V
    invoke-static {v0, v1}, Lcom/google/common/util/concurrent/CycleDetectingLockFactory;->access$600(Lcom/google/common/util/concurrent/CycleDetectingLockFactory;Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingLock;)V

    .line 884
    :try_start_0
    invoke-super {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lockInterruptibly()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 886
    iget-object p0, p0, Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingReentrantReadLock;->readWriteLock:Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingReentrantReadWriteLock;

    # invokes: Lcom/google/common/util/concurrent/CycleDetectingLockFactory;->lockStateChanged(Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingLock;)V
    invoke-static {p0}, Lcom/google/common/util/concurrent/CycleDetectingLockFactory;->access$700(Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingLock;)V

    return-void

    :catchall_0
    move-exception v0

    iget-object p0, p0, Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingReentrantReadLock;->readWriteLock:Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingReentrantReadWriteLock;

    # invokes: Lcom/google/common/util/concurrent/CycleDetectingLockFactory;->lockStateChanged(Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingLock;)V
    invoke-static {p0}, Lcom/google/common/util/concurrent/CycleDetectingLockFactory;->access$700(Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingLock;)V

    .line 887
    throw v0
.end method

.method public tryLock()Z
    .registers 3

    .line 892
    iget-object v0, p0, Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingReentrantReadLock;->this$0:Lcom/google/common/util/concurrent/CycleDetectingLockFactory;

    iget-object v1, p0, Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingReentrantReadLock;->readWriteLock:Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingReentrantReadWriteLock;

    # invokes: Lcom/google/common/util/concurrent/CycleDetectingLockFactory;->aboutToAcquire(Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingLock;)V
    invoke-static {v0, v1}, Lcom/google/common/util/concurrent/CycleDetectingLockFactory;->access$600(Lcom/google/common/util/concurrent/CycleDetectingLockFactory;Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingLock;)V

    .line 894
    :try_start_0
    invoke-super {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->tryLock()Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 896
    iget-object p0, p0, Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingReentrantReadLock;->readWriteLock:Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingReentrantReadWriteLock;

    # invokes: Lcom/google/common/util/concurrent/CycleDetectingLockFactory;->lockStateChanged(Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingLock;)V
    invoke-static {p0}, Lcom/google/common/util/concurrent/CycleDetectingLockFactory;->access$700(Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingLock;)V

    return v0

    :catchall_0
    move-exception v0

    iget-object p0, p0, Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingReentrantReadLock;->readWriteLock:Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingReentrantReadWriteLock;

    # invokes: Lcom/google/common/util/concurrent/CycleDetectingLockFactory;->lockStateChanged(Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingLock;)V
    invoke-static {p0}, Lcom/google/common/util/concurrent/CycleDetectingLockFactory;->access$700(Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingLock;)V

    .line 897
    throw v0
.end method

.method public tryLock(JLjava/util/concurrent/TimeUnit;)Z
    .registers 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "timeout",
            "unit"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 902
    iget-object v0, p0, Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingReentrantReadLock;->this$0:Lcom/google/common/util/concurrent/CycleDetectingLockFactory;

    iget-object v1, p0, Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingReentrantReadLock;->readWriteLock:Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingReentrantReadWriteLock;

    # invokes: Lcom/google/common/util/concurrent/CycleDetectingLockFactory;->aboutToAcquire(Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingLock;)V
    invoke-static {v0, v1}, Lcom/google/common/util/concurrent/CycleDetectingLockFactory;->access$600(Lcom/google/common/util/concurrent/CycleDetectingLockFactory;Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingLock;)V

    .line 904
    :try_start_0
    invoke-super {p0, p1, p2, p3}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->tryLock(JLjava/util/concurrent/TimeUnit;)Z

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 906
    iget-object p0, p0, Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingReentrantReadLock;->readWriteLock:Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingReentrantReadWriteLock;

    # invokes: Lcom/google/common/util/concurrent/CycleDetectingLockFactory;->lockStateChanged(Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingLock;)V
    invoke-static {p0}, Lcom/google/common/util/concurrent/CycleDetectingLockFactory;->access$700(Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingLock;)V

    return p1

    :catchall_0
    move-exception p1

    iget-object p0, p0, Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingReentrantReadLock;->readWriteLock:Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingReentrantReadWriteLock;

    # invokes: Lcom/google/common/util/concurrent/CycleDetectingLockFactory;->lockStateChanged(Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingLock;)V
    invoke-static {p0}, Lcom/google/common/util/concurrent/CycleDetectingLockFactory;->access$700(Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingLock;)V

    .line 907
    throw p1
.end method

.method public unlock()V
    .registers 2

    .line 913
    :try_start_0
    invoke-super {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 915
    iget-object p0, p0, Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingReentrantReadLock;->readWriteLock:Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingReentrantReadWriteLock;

    # invokes: Lcom/google/common/util/concurrent/CycleDetectingLockFactory;->lockStateChanged(Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingLock;)V
    invoke-static {p0}, Lcom/google/common/util/concurrent/CycleDetectingLockFactory;->access$700(Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingLock;)V

    return-void

    :catchall_0
    move-exception v0

    iget-object p0, p0, Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingReentrantReadLock;->readWriteLock:Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingReentrantReadWriteLock;

    # invokes: Lcom/google/common/util/concurrent/CycleDetectingLockFactory;->lockStateChanged(Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingLock;)V
    invoke-static {p0}, Lcom/google/common/util/concurrent/CycleDetectingLockFactory;->access$700(Lcom/google/common/util/concurrent/CycleDetectingLockFactory$CycleDetectingLock;)V

    .line 916
    throw v0
.end method
