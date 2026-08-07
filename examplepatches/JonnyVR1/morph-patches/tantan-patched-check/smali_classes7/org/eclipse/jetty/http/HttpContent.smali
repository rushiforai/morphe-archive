.class public interface abstract Lorg/eclipse/jetty/http/HttpContent;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jetty/http/HttpContent$ResourceAsHttpContent;
    }
.end annotation


# virtual methods
.method public abstract getContentLength()J
.end method

.method public abstract getContentType()Lorg/eclipse/jetty/io/Buffer;
.end method

.method public abstract getDirectBuffer()Lorg/eclipse/jetty/io/Buffer;
.end method

.method public abstract getIndirectBuffer()Lorg/eclipse/jetty/io/Buffer;
.end method

.method public abstract getInputStream()Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract getLastModified()Lorg/eclipse/jetty/io/Buffer;
.end method

.method public abstract getResource()Lorg/eclipse/jetty/util/resource/Resource;
.end method

.method public abstract release()V
.end method
