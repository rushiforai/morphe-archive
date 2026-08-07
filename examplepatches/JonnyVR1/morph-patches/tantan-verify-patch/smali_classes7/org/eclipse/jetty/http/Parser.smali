.class public interface abstract Lorg/eclipse/jetty/http/Parser;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract isComplete()Z
.end method

.method public abstract isIdle()Z
.end method

.method public abstract isMoreInBuffer()Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract isPersistent()Z
.end method

.method public abstract parseAvailable()Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract reset()V
.end method

.method public abstract returnBuffers()V
.end method

.method public abstract setPersistent(Z)V
.end method
