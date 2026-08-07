.class public interface abstract Lorg/eclipse/jetty/security/CrossContextPsuedoSession;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# virtual methods
.method public abstract clear(Ljavax/servlet/http/HttpServletRequest;)V
.end method

.method public abstract fetch(Ljavax/servlet/http/HttpServletRequest;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljavax/servlet/http/HttpServletRequest;",
            ")TT;"
        }
    .end annotation
.end method

.method public abstract store(Ljava/lang/Object;Ljavax/servlet/http/HttpServletResponse;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ljavax/servlet/http/HttpServletResponse;",
            ")V"
        }
    .end annotation
.end method
