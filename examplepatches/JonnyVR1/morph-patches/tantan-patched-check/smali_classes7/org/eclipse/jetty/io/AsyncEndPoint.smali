.class public interface abstract Lorg/eclipse/jetty/io/AsyncEndPoint;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/eclipse/jetty/io/ConnectedEndPoint;


# virtual methods
.method public abstract asyncDispatch()V
.end method

.method public abstract cancelTimeout(Lorg/eclipse/jetty/util/thread/Timeout$Task;)V
.end method

.method public abstract dispatch()V
.end method

.method public abstract hasProgressed()Z
.end method

.method public abstract isCheckForIdle()Z
.end method

.method public abstract isWritable()Z
.end method

.method public abstract onIdleExpired(J)V
.end method

.method public abstract scheduleTimeout(Lorg/eclipse/jetty/util/thread/Timeout$Task;J)V
.end method

.method public abstract scheduleWrite()V
.end method

.method public abstract setCheckForIdle(Z)V
.end method
