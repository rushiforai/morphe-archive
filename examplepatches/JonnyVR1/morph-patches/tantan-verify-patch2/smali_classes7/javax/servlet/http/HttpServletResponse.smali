.class public interface abstract Ljavax/servlet/http/HttpServletResponse;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/lse0;


# virtual methods
.method public abstract addCookie(Ljavax/servlet/http/Cookie;)V
.end method

.method public abstract addDateHeader(Ljava/lang/String;J)V
.end method

.method public abstract addHeader(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract addIntHeader(Ljava/lang/String;I)V
.end method

.method public abstract containsHeader(Ljava/lang/String;)Z
.end method

.method public abstract encodeRedirectURL(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract encodeRedirectUrl(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract encodeURL(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract encodeUrl(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract getHeader(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract getHeaderNames()Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getHeaders(Ljava/lang/String;)Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getStatus()I
.end method

.method public abstract sendError(I)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract sendError(ILjava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract sendRedirect(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract setDateHeader(Ljava/lang/String;J)V
.end method

.method public abstract setHeader(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract setIntHeader(Ljava/lang/String;I)V
.end method

.method public abstract setStatus(I)V
.end method

.method public abstract setStatus(ILjava/lang/String;)V
.end method
