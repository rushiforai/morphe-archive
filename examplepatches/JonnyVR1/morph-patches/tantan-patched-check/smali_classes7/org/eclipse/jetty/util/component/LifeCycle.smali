.class public interface abstract Lorg/eclipse/jetty/util/component/LifeCycle;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jetty/util/component/LifeCycle$Listener;
    }
.end annotation


# virtual methods
.method public abstract addLifeCycleListener(Lorg/eclipse/jetty/util/component/LifeCycle$Listener;)V
.end method

.method public abstract isFailed()Z
.end method

.method public abstract isRunning()Z
.end method

.method public abstract isStarted()Z
.end method

.method public abstract isStarting()Z
.end method

.method public abstract isStopped()Z
.end method

.method public abstract isStopping()Z
.end method

.method public abstract removeLifeCycleListener(Lorg/eclipse/jetty/util/component/LifeCycle$Listener;)V
.end method

.method public abstract start()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method public abstract stop()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method
