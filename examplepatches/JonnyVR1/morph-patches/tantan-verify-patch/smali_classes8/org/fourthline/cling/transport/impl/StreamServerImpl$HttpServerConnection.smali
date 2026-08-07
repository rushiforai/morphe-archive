.class public Lorg/fourthline/cling/transport/impl/StreamServerImpl$HttpServerConnection;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/fourthline/cling/model/message/Connection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/fourthline/cling/transport/impl/StreamServerImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "HttpServerConnection"
.end annotation


# instance fields
.field protected exchange:Lcom/sun/net/httpserver/HttpExchange;

.field final synthetic this$0:Lorg/fourthline/cling/transport/impl/StreamServerImpl;


# direct methods
.method public constructor <init>(Lorg/fourthline/cling/transport/impl/StreamServerImpl;Lcom/sun/net/httpserver/HttpExchange;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/transport/impl/StreamServerImpl$HttpServerConnection;->this$0:Lorg/fourthline/cling/transport/impl/StreamServerImpl;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lorg/fourthline/cling/transport/impl/StreamServerImpl$HttpServerConnection;->exchange:Lcom/sun/net/httpserver/HttpExchange;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public getLocalAddress()Ljava/net/InetAddress;
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/fourthline/cling/transport/impl/StreamServerImpl$HttpServerConnection;->exchange:Lcom/sun/net/httpserver/HttpExchange;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/sun/net/httpserver/HttpExchange;->getLocalAddress()Ljava/net/InetSocketAddress;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lorg/fourthline/cling/transport/impl/StreamServerImpl$HttpServerConnection;->exchange:Lcom/sun/net/httpserver/HttpExchange;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/sun/net/httpserver/HttpExchange;->getLocalAddress()Ljava/net/InetSocketAddress;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ljava/net/InetSocketAddress;->getAddress()Ljava/net/InetAddress;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return-object p0
.end method

.method public getRemoteAddress()Ljava/net/InetAddress;
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/fourthline/cling/transport/impl/StreamServerImpl$HttpServerConnection;->exchange:Lcom/sun/net/httpserver/HttpExchange;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/sun/net/httpserver/HttpExchange;->getRemoteAddress()Ljava/net/InetSocketAddress;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lorg/fourthline/cling/transport/impl/StreamServerImpl$HttpServerConnection;->exchange:Lcom/sun/net/httpserver/HttpExchange;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/sun/net/httpserver/HttpExchange;->getRemoteAddress()Ljava/net/InetSocketAddress;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ljava/net/InetSocketAddress;->getAddress()Ljava/net/InetAddress;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return-object p0
.end method

.method public isOpen()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/fourthline/cling/transport/impl/StreamServerImpl$HttpServerConnection;->this$0:Lorg/fourthline/cling/transport/impl/StreamServerImpl;

    .line 2
    .line 3
    iget-object p0, p0, Lorg/fourthline/cling/transport/impl/StreamServerImpl$HttpServerConnection;->exchange:Lcom/sun/net/httpserver/HttpExchange;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lorg/fourthline/cling/transport/impl/StreamServerImpl;->isConnectionOpen(Lcom/sun/net/httpserver/HttpExchange;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
