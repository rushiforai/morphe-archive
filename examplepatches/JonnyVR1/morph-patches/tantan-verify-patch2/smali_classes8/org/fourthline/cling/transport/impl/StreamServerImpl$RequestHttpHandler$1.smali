.class Lorg/fourthline/cling/transport/impl/StreamServerImpl$RequestHttpHandler$1;
.super Lorg/fourthline/cling/transport/impl/HttpExchangeUpnpStream;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/fourthline/cling/transport/impl/StreamServerImpl$RequestHttpHandler;->handle(Lcom/sun/net/httpserver/HttpExchange;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/fourthline/cling/transport/impl/StreamServerImpl$RequestHttpHandler;

.field final synthetic val$httpExchange:Lcom/sun/net/httpserver/HttpExchange;


# direct methods
.method public constructor <init>(Lorg/fourthline/cling/transport/impl/StreamServerImpl$RequestHttpHandler;Lorg/fourthline/cling/protocol/ProtocolFactory;Lcom/sun/net/httpserver/HttpExchange;Lcom/sun/net/httpserver/HttpExchange;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/transport/impl/StreamServerImpl$RequestHttpHandler$1;->this$1:Lorg/fourthline/cling/transport/impl/StreamServerImpl$RequestHttpHandler;

    .line 2
    .line 3
    iput-object p4, p0, Lorg/fourthline/cling/transport/impl/StreamServerImpl$RequestHttpHandler$1;->val$httpExchange:Lcom/sun/net/httpserver/HttpExchange;

    .line 4
    .line 5
    invoke-direct {p0, p2, p3}, Lorg/fourthline/cling/transport/impl/HttpExchangeUpnpStream;-><init>(Lorg/fourthline/cling/protocol/ProtocolFactory;Lcom/sun/net/httpserver/HttpExchange;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public createConnection()Lorg/fourthline/cling/model/message/Connection;
    .locals 2

    .line 1
    new-instance v0, Lorg/fourthline/cling/transport/impl/StreamServerImpl$HttpServerConnection;

    .line 2
    .line 3
    iget-object v1, p0, Lorg/fourthline/cling/transport/impl/StreamServerImpl$RequestHttpHandler$1;->this$1:Lorg/fourthline/cling/transport/impl/StreamServerImpl$RequestHttpHandler;

    .line 4
    .line 5
    iget-object v1, v1, Lorg/fourthline/cling/transport/impl/StreamServerImpl$RequestHttpHandler;->this$0:Lorg/fourthline/cling/transport/impl/StreamServerImpl;

    .line 6
    .line 7
    iget-object p0, p0, Lorg/fourthline/cling/transport/impl/StreamServerImpl$RequestHttpHandler$1;->val$httpExchange:Lcom/sun/net/httpserver/HttpExchange;

    .line 8
    .line 9
    invoke-direct {v0, v1, p0}, Lorg/fourthline/cling/transport/impl/StreamServerImpl$HttpServerConnection;-><init>(Lorg/fourthline/cling/transport/impl/StreamServerImpl;Lcom/sun/net/httpserver/HttpExchange;)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method
