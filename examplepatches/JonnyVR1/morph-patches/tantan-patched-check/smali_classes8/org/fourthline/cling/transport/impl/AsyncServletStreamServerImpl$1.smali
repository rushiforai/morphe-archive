.class Lorg/fourthline/cling/transport/impl/AsyncServletStreamServerImpl$1;
.super Ljavax/servlet/http/HttpServlet;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/fourthline/cling/transport/impl/AsyncServletStreamServerImpl;->createServlet(Lorg/fourthline/cling/transport/Router;)Ll/yre0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/fourthline/cling/transport/impl/AsyncServletStreamServerImpl;

.field final synthetic val$router:Lorg/fourthline/cling/transport/Router;


# direct methods
.method public constructor <init>(Lorg/fourthline/cling/transport/impl/AsyncServletStreamServerImpl;Lorg/fourthline/cling/transport/Router;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/transport/impl/AsyncServletStreamServerImpl$1;->this$0:Lorg/fourthline/cling/transport/impl/AsyncServletStreamServerImpl;

    .line 2
    .line 3
    iput-object p2, p0, Lorg/fourthline/cling/transport/impl/AsyncServletStreamServerImpl$1;->val$router:Lorg/fourthline/cling/transport/Router;

    .line 4
    .line 5
    invoke-direct {p0}, Ljavax/servlet/http/HttpServlet;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public service(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/ServletException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-object p2, p0, Lorg/fourthline/cling/transport/impl/AsyncServletStreamServerImpl$1;->this$0:Lorg/fourthline/cling/transport/impl/AsyncServletStreamServerImpl;

    .line 6
    .line 7
    invoke-static {p2}, Lorg/fourthline/cling/transport/impl/AsyncServletStreamServerImpl;->access$008(Lorg/fourthline/cling/transport/impl/AsyncServletStreamServerImpl;)I

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    invoke-static {}, Lorg/fourthline/cling/transport/impl/AsyncServletStreamServerImpl;->access$100()Ljava/util/logging/Logger;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    sget-object v3, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    .line 16
    .line 17
    invoke-virtual {v2, v3}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-eqz v2, :cond_0

    .line 22
    .line 23
    invoke-static {}, Lorg/fourthline/cling/transport/impl/AsyncServletStreamServerImpl;->access$100()Ljava/util/logging/Logger;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    invoke-interface {p1}, Ljavax/servlet/http/HttpServletRequest;->getRequestURI()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    filled-new-array {v3, v4}, [Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    const-string v4, "HttpServlet.service(): id: %3d, request URI: %s"

    .line 40
    .line 41
    invoke-static {v4, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    invoke-virtual {v2, v3}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    :cond_0
    invoke-interface {p1}, Ll/gse0;->startAsync()Ll/o21;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    iget-object v3, p0, Lorg/fourthline/cling/transport/impl/AsyncServletStreamServerImpl$1;->this$0:Lorg/fourthline/cling/transport/impl/AsyncServletStreamServerImpl;

    .line 53
    .line 54
    invoke-virtual {v3}, Lorg/fourthline/cling/transport/impl/AsyncServletStreamServerImpl;->getConfiguration()Lorg/fourthline/cling/transport/impl/AsyncServletStreamServerConfigurationImpl;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    invoke-virtual {v3}, Lorg/fourthline/cling/transport/impl/AsyncServletStreamServerConfigurationImpl;->getAsyncTimeoutSeconds()I

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    mul-int/lit16 v3, v3, 0x3e8

    .line 63
    .line 64
    int-to-long v3, v3

    .line 65
    invoke-interface {v2, v3, v4}, Ll/o21;->setTimeout(J)V

    .line 66
    .line 67
    .line 68
    new-instance v3, Lorg/fourthline/cling/transport/impl/AsyncServletStreamServerImpl$1$1;

    .line 69
    .line 70
    invoke-direct {v3, p0, v0, v1, p2}, Lorg/fourthline/cling/transport/impl/AsyncServletStreamServerImpl$1$1;-><init>(Lorg/fourthline/cling/transport/impl/AsyncServletStreamServerImpl$1;JI)V

    .line 71
    .line 72
    .line 73
    invoke-interface {v2, v3}, Ll/o21;->addListener(Ll/r21;)V

    .line 74
    .line 75
    .line 76
    new-instance p2, Lorg/fourthline/cling/transport/impl/AsyncServletStreamServerImpl$1$2;

    .line 77
    .line 78
    iget-object v0, p0, Lorg/fourthline/cling/transport/impl/AsyncServletStreamServerImpl$1;->val$router:Lorg/fourthline/cling/transport/Router;

    .line 79
    .line 80
    invoke-interface {v0}, Lorg/fourthline/cling/transport/Router;->getProtocolFactory()Lorg/fourthline/cling/protocol/ProtocolFactory;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-direct {p2, p0, v0, v2, p1}, Lorg/fourthline/cling/transport/impl/AsyncServletStreamServerImpl$1$2;-><init>(Lorg/fourthline/cling/transport/impl/AsyncServletStreamServerImpl$1;Lorg/fourthline/cling/protocol/ProtocolFactory;Ll/o21;Ljavax/servlet/http/HttpServletRequest;)V

    .line 85
    .line 86
    .line 87
    iget-object p0, p0, Lorg/fourthline/cling/transport/impl/AsyncServletStreamServerImpl$1;->val$router:Lorg/fourthline/cling/transport/Router;

    .line 88
    .line 89
    invoke-interface {p0, p2}, Lorg/fourthline/cling/transport/Router;->received(Lorg/fourthline/cling/transport/spi/UpnpStream;)V

    .line 90
    .line 91
    .line 92
    return-void
.end method
