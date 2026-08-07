.class public interface abstract Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a$a;
    }
.end annotation


# virtual methods
.method public abstract a()Z
.end method

.method public abstract b(Lokio/Buffer;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract c()V
.end method

.method public abstract getCurrentState()I
.end method

.method public abstract isConnected()Z
.end method

.method public abstract read()Lokio/BufferedSource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
