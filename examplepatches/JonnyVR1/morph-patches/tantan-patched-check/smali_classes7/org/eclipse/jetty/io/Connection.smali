.class public interface abstract Lorg/eclipse/jetty/io/Connection;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract getTimeStamp()J
.end method

.method public abstract handle()Lorg/eclipse/jetty/io/Connection;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract isIdle()Z
.end method

.method public abstract isSuspended()Z
.end method

.method public abstract onClose()V
.end method

.method public abstract onIdleExpired(J)V
.end method
