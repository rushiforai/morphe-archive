.class public interface abstract Lorg/eclipse/jetty/util/thread/ThreadPool;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jetty/util/thread/ThreadPool$SizedThreadPool;
    }
.end annotation


# virtual methods
.method public abstract dispatch(Ljava/lang/Runnable;)Z
.end method

.method public abstract getIdleThreads()I
.end method

.method public abstract getThreads()I
.end method

.method public abstract isLowOnThreads()Z
.end method

.method public abstract join()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation
.end method
