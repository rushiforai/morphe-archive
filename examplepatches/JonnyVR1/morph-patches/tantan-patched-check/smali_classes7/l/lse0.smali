.class public interface abstract Ll/lse0;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract flushBuffer()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract getBufferSize()I
.end method

.method public abstract getCharacterEncoding()Ljava/lang/String;
.end method

.method public abstract getContentType()Ljava/lang/String;
.end method

.method public abstract getLocale()Ljava/util/Locale;
.end method

.method public abstract getOutputStream()Ll/ese0;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract getWriter()Ljava/io/PrintWriter;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract isCommitted()Z
.end method

.method public abstract reset()V
.end method

.method public abstract resetBuffer()V
.end method

.method public abstract setBufferSize(I)V
.end method

.method public abstract setCharacterEncoding(Ljava/lang/String;)V
.end method

.method public abstract setContentLength(I)V
.end method

.method public abstract setContentType(Ljava/lang/String;)V
.end method

.method public abstract setLocale(Ljava/util/Locale;)V
.end method
