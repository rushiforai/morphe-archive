.class Lnicoid/network238/SessionStore258$1;
.super Ljava/lang/Object;
.source "SessionStore258.java"

# interfaces
.implements Lnicoid/network238/SessionIndex276$Rules;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/SessionStore258;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lnicoid/network238/SessionIndex276$Rules<",
        "Lorg/apache/http/cookie/Cookie;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lnicoid/network238/SessionStore258;


# direct methods
.method constructor <init>(Lnicoid/network238/SessionStore258;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 7
    iput-object p1, p0, Lnicoid/network238/SessionStore258$1;->this$0:Lnicoid/network238/SessionStore258;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic domain(Ljava/lang/Object;)Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            null
        }
    .end annotation

    .line 7
    check-cast p1, Lorg/apache/http/cookie/Cookie;

    invoke-virtual {p0, p1}, Lnicoid/network238/SessionStore258$1;->domain(Lorg/apache/http/cookie/Cookie;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public domain(Lorg/apache/http/cookie/Cookie;)Ljava/lang/String;
    .registers 2

    .line 9
    invoke-interface {p1}, Lorg/apache/http/cookie/Cookie;->getDomain()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic expired(Ljava/lang/Object;Ljava/util/Date;)Z
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 7
    check-cast p1, Lorg/apache/http/cookie/Cookie;

    invoke-virtual {p0, p1, p2}, Lnicoid/network238/SessionStore258$1;->expired(Lorg/apache/http/cookie/Cookie;Ljava/util/Date;)Z

    move-result p1

    return p1
.end method

.method public expired(Lorg/apache/http/cookie/Cookie;Ljava/util/Date;)Z
    .registers 3

    .line 11
    invoke-interface {p1, p2}, Lorg/apache/http/cookie/Cookie;->isExpired(Ljava/util/Date;)Z

    move-result p1

    return p1
.end method

.method public bridge synthetic name(Ljava/lang/Object;)Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            null
        }
    .end annotation

    .line 7
    check-cast p1, Lorg/apache/http/cookie/Cookie;

    invoke-virtual {p0, p1}, Lnicoid/network238/SessionStore258$1;->name(Lorg/apache/http/cookie/Cookie;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public name(Lorg/apache/http/cookie/Cookie;)Ljava/lang/String;
    .registers 2

    .line 8
    invoke-interface {p1}, Lorg/apache/http/cookie/Cookie;->getName()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic path(Ljava/lang/Object;)Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            null
        }
    .end annotation

    .line 7
    check-cast p1, Lorg/apache/http/cookie/Cookie;

    invoke-virtual {p0, p1}, Lnicoid/network238/SessionStore258$1;->path(Lorg/apache/http/cookie/Cookie;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public path(Lorg/apache/http/cookie/Cookie;)Ljava/lang/String;
    .registers 2

    .line 10
    invoke-interface {p1}, Lorg/apache/http/cookie/Cookie;->getPath()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method
