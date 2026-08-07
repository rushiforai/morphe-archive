.class public interface abstract Lorg/eclipse/jetty/http/Generator;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final LAST:Z = true

.field public static final MORE:Z


# virtual methods
.method public abstract addContent(Lorg/eclipse/jetty/io/Buffer;Z)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract complete()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract completeHeader(Lorg/eclipse/jetty/http/HttpFields;Z)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract flushBuffer()I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract getContentBufferSize()I
.end method

.method public abstract getContentWritten()J
.end method

.method public abstract increaseContentBufferSize(I)V
.end method

.method public abstract isAllContentWritten()Z
.end method

.method public abstract isBufferFull()Z
.end method

.method public abstract isCommitted()Z
.end method

.method public abstract isComplete()Z
.end method

.method public abstract isIdle()Z
.end method

.method public abstract isPersistent()Z
.end method

.method public abstract isWritten()Z
.end method

.method public abstract reset()V
.end method

.method public abstract resetBuffer()V
.end method

.method public abstract returnBuffers()V
.end method

.method public abstract sendError(ILjava/lang/String;Ljava/lang/String;Z)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract setContentLength(J)V
.end method

.method public abstract setDate(Lorg/eclipse/jetty/io/Buffer;)V
.end method

.method public abstract setHead(Z)V
.end method

.method public abstract setPersistent(Z)V
.end method

.method public abstract setRequest(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract setResponse(ILjava/lang/String;)V
.end method

.method public abstract setSendServerVersion(Z)V
.end method

.method public abstract setVersion(I)V
.end method
