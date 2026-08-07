.class public abstract Lorg/eclipse/jetty/server/AbstractHttpConnection;
.super Lorg/eclipse/jetty/io/AbstractConnection;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jetty/server/AbstractHttpConnection$OutputWriter;,
        Lorg/eclipse/jetty/server/AbstractHttpConnection$Output;,
        Lorg/eclipse/jetty/server/AbstractHttpConnection$RequestHandler;
    }
.end annotation


# static fields
.field private static final LOG:Lorg/eclipse/jetty/util/log/Logger;

.field private static final UNKNOWN:I = -0x2

.field private static final __currentConnection:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "Lorg/eclipse/jetty/server/AbstractHttpConnection;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private _associatedObject:Ljava/lang/Object;

.field private _charset:Ljava/lang/String;

.field protected final _connector:Lorg/eclipse/jetty/server/Connector;

.field private _delayedHandling:Z

.field private _earlyEOF:Z

.field private _expect:Z

.field private _expect100Continue:Z

.field private _expect102Processing:Z

.field protected final _generator:Lorg/eclipse/jetty/http/Generator;

.field private _head:Z

.field private _host:Z

.field protected volatile _in:Ll/dse0;

.field _include:I

.field protected volatile _out:Lorg/eclipse/jetty/server/AbstractHttpConnection$Output;

.field protected final _parser:Lorg/eclipse/jetty/http/Parser;

.field protected volatile _printWriter:Ljava/io/PrintWriter;

.field protected final _request:Lorg/eclipse/jetty/server/Request;

.field protected final _requestFields:Lorg/eclipse/jetty/http/HttpFields;

.field private _requests:I

.field protected final _response:Lorg/eclipse/jetty/server/Response;

.field protected final _responseFields:Lorg/eclipse/jetty/http/HttpFields;

.field protected final _server:Lorg/eclipse/jetty/server/Server;

.field protected final _uri:Lorg/eclipse/jetty/http/HttpURI;

.field private _version:I

.field protected volatile _writer:Lorg/eclipse/jetty/server/AbstractHttpConnection$OutputWriter;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-class v0, Lorg/eclipse/jetty/server/AbstractHttpConnection;

    .line 2
    .line 3
    invoke-static {v0}, Lorg/eclipse/jetty/util/log/Log;->getLogger(Ljava/lang/Class;)Lorg/eclipse/jetty/util/log/Logger;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 8
    .line 9
    new-instance v0, Ljava/lang/ThreadLocal;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    .line 12
    .line 13
    .line 14
    sput-object v0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->__currentConnection:Ljava/lang/ThreadLocal;

    .line 15
    .line 16
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jetty/server/Connector;Lorg/eclipse/jetty/io/EndPoint;Lorg/eclipse/jetty/server/Server;)V
    .locals 3

    .line 1
    invoke-direct {p0, p2}, Lorg/eclipse/jetty/io/AbstractConnection;-><init>(Lorg/eclipse/jetty/io/EndPoint;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x2

    .line 5
    iput v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_version:I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_expect:Z

    .line 9
    .line 10
    iput-boolean v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_expect100Continue:Z

    .line 11
    .line 12
    iput-boolean v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_expect102Processing:Z

    .line 13
    .line 14
    iput-boolean v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_head:Z

    .line 15
    .line 16
    iput-boolean v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_host:Z

    .line 17
    .line 18
    iput-boolean v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_delayedHandling:Z

    .line 19
    .line 20
    iput-boolean v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_earlyEOF:Z

    .line 21
    .line 22
    sget-object v0, Lorg/eclipse/jetty/util/URIUtil;->__CHARSET:Ljava/lang/String;

    .line 23
    .line 24
    const-string v1, "UTF-8"

    .line 25
    .line 26
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    new-instance v0, Lorg/eclipse/jetty/http/HttpURI;

    .line 33
    .line 34
    invoke-direct {v0}, Lorg/eclipse/jetty/http/HttpURI;-><init>()V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    new-instance v1, Lorg/eclipse/jetty/http/EncodedHttpURI;

    .line 39
    .line 40
    invoke-direct {v1, v0}, Lorg/eclipse/jetty/http/EncodedHttpURI;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    move-object v0, v1

    .line 44
    :goto_0
    iput-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_uri:Lorg/eclipse/jetty/http/HttpURI;

    .line 45
    .line 46
    iput-object p1, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_connector:Lorg/eclipse/jetty/server/Connector;

    .line 47
    .line 48
    check-cast p1, Lorg/eclipse/jetty/http/HttpBuffers;

    .line 49
    .line 50
    invoke-interface {p1}, Lorg/eclipse/jetty/http/HttpBuffers;->getRequestBuffers()Lorg/eclipse/jetty/io/Buffers;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    new-instance v1, Lorg/eclipse/jetty/server/AbstractHttpConnection$RequestHandler;

    .line 55
    .line 56
    const/4 v2, 0x0

    .line 57
    invoke-direct {v1, p0, v2}, Lorg/eclipse/jetty/server/AbstractHttpConnection$RequestHandler;-><init>(Lorg/eclipse/jetty/server/AbstractHttpConnection;Lorg/eclipse/jetty/server/AbstractHttpConnection$1;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0, v0, p2, v1}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->newHttpParser(Lorg/eclipse/jetty/io/Buffers;Lorg/eclipse/jetty/io/EndPoint;Lorg/eclipse/jetty/http/HttpParser$EventHandler;)Lorg/eclipse/jetty/http/HttpParser;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    iput-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_parser:Lorg/eclipse/jetty/http/Parser;

    .line 65
    .line 66
    new-instance v0, Lorg/eclipse/jetty/http/HttpFields;

    .line 67
    .line 68
    invoke-direct {v0}, Lorg/eclipse/jetty/http/HttpFields;-><init>()V

    .line 69
    .line 70
    .line 71
    iput-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_requestFields:Lorg/eclipse/jetty/http/HttpFields;

    .line 72
    .line 73
    new-instance v0, Lorg/eclipse/jetty/http/HttpFields;

    .line 74
    .line 75
    invoke-direct {v0}, Lorg/eclipse/jetty/http/HttpFields;-><init>()V

    .line 76
    .line 77
    .line 78
    iput-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_responseFields:Lorg/eclipse/jetty/http/HttpFields;

    .line 79
    .line 80
    new-instance v0, Lorg/eclipse/jetty/server/Request;

    .line 81
    .line 82
    invoke-direct {v0, p0}, Lorg/eclipse/jetty/server/Request;-><init>(Lorg/eclipse/jetty/server/AbstractHttpConnection;)V

    .line 83
    .line 84
    .line 85
    iput-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_request:Lorg/eclipse/jetty/server/Request;

    .line 86
    .line 87
    new-instance v0, Lorg/eclipse/jetty/server/Response;

    .line 88
    .line 89
    invoke-direct {v0, p0}, Lorg/eclipse/jetty/server/Response;-><init>(Lorg/eclipse/jetty/server/AbstractHttpConnection;)V

    .line 90
    .line 91
    .line 92
    iput-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_response:Lorg/eclipse/jetty/server/Response;

    .line 93
    .line 94
    invoke-interface {p1}, Lorg/eclipse/jetty/http/HttpBuffers;->getResponseBuffers()Lorg/eclipse/jetty/io/Buffers;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->newHttpGenerator(Lorg/eclipse/jetty/io/Buffers;Lorg/eclipse/jetty/io/EndPoint;)Lorg/eclipse/jetty/http/HttpGenerator;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    iput-object p1, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 103
    .line 104
    invoke-virtual {p3}, Lorg/eclipse/jetty/server/Server;->getSendServerVersion()Z

    .line 105
    .line 106
    .line 107
    move-result p2

    .line 108
    invoke-interface {p1, p2}, Lorg/eclipse/jetty/http/Generator;->setSendServerVersion(Z)V

    .line 109
    .line 110
    .line 111
    iput-object p3, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_server:Lorg/eclipse/jetty/server/Server;

    .line 112
    .line 113
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jetty/server/Connector;Lorg/eclipse/jetty/io/EndPoint;Lorg/eclipse/jetty/server/Server;Lorg/eclipse/jetty/http/Parser;Lorg/eclipse/jetty/http/Generator;Lorg/eclipse/jetty/server/Request;)V
    .locals 1

    .line 114
    invoke-direct {p0, p2}, Lorg/eclipse/jetty/io/AbstractConnection;-><init>(Lorg/eclipse/jetty/io/EndPoint;)V

    const/4 p2, -0x2

    .line 115
    iput p2, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_version:I

    const/4 p2, 0x0

    .line 116
    iput-boolean p2, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_expect:Z

    .line 117
    iput-boolean p2, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_expect100Continue:Z

    .line 118
    iput-boolean p2, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_expect102Processing:Z

    .line 119
    iput-boolean p2, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_head:Z

    .line 120
    iput-boolean p2, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_host:Z

    .line 121
    iput-boolean p2, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_delayedHandling:Z

    .line 122
    iput-boolean p2, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_earlyEOF:Z

    .line 123
    sget-object p2, Lorg/eclipse/jetty/util/URIUtil;->__CHARSET:Ljava/lang/String;

    const-string v0, "UTF-8"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance p2, Lorg/eclipse/jetty/http/HttpURI;

    invoke-direct {p2}, Lorg/eclipse/jetty/http/HttpURI;-><init>()V

    goto :goto_0

    :cond_0
    new-instance v0, Lorg/eclipse/jetty/http/EncodedHttpURI;

    invoke-direct {v0, p2}, Lorg/eclipse/jetty/http/EncodedHttpURI;-><init>(Ljava/lang/String;)V

    move-object p2, v0

    :goto_0
    iput-object p2, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_uri:Lorg/eclipse/jetty/http/HttpURI;

    .line 124
    iput-object p1, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_connector:Lorg/eclipse/jetty/server/Connector;

    .line 125
    iput-object p4, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_parser:Lorg/eclipse/jetty/http/Parser;

    .line 126
    new-instance p1, Lorg/eclipse/jetty/http/HttpFields;

    invoke-direct {p1}, Lorg/eclipse/jetty/http/HttpFields;-><init>()V

    iput-object p1, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_requestFields:Lorg/eclipse/jetty/http/HttpFields;

    .line 127
    new-instance p1, Lorg/eclipse/jetty/http/HttpFields;

    invoke-direct {p1}, Lorg/eclipse/jetty/http/HttpFields;-><init>()V

    iput-object p1, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_responseFields:Lorg/eclipse/jetty/http/HttpFields;

    .line 128
    iput-object p6, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_request:Lorg/eclipse/jetty/server/Request;

    .line 129
    new-instance p1, Lorg/eclipse/jetty/server/Response;

    invoke-direct {p1, p0}, Lorg/eclipse/jetty/server/Response;-><init>(Lorg/eclipse/jetty/server/AbstractHttpConnection;)V

    iput-object p1, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_response:Lorg/eclipse/jetty/server/Response;

    .line 130
    iput-object p5, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 131
    invoke-virtual {p3}, Lorg/eclipse/jetty/server/Server;->getSendServerVersion()Z

    move-result p1

    invoke-interface {p5, p1}, Lorg/eclipse/jetty/http/Generator;->setSendServerVersion(Z)V

    .line 132
    iput-object p3, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_server:Lorg/eclipse/jetty/server/Server;

    return-void
.end method

.method public static synthetic access$100()Lorg/eclipse/jetty/util/log/Logger;
    .locals 1

    .line 1
    sget-object v0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 2
    .line 3
    return-object v0
.end method

.method public static getCurrentConnection()Lorg/eclipse/jetty/server/AbstractHttpConnection;
    .locals 1

    .line 1
    sget-object v0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->__currentConnection:Ljava/lang/ThreadLocal;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lorg/eclipse/jetty/server/AbstractHttpConnection;

    .line 8
    .line 9
    return-object v0
.end method

.method public static setCurrentConnection(Lorg/eclipse/jetty/server/AbstractHttpConnection;)V
    .locals 1

    .line 1
    sget-object v0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->__currentConnection:Ljava/lang/ThreadLocal;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public commitResponse(Z)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 2
    .line 3
    invoke-interface {v0}, Lorg/eclipse/jetty/http/Generator;->isCommitted()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 10
    .line 11
    iget-object v1, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_response:Lorg/eclipse/jetty/server/Response;

    .line 12
    .line 13
    invoke-virtual {v1}, Lorg/eclipse/jetty/server/Response;->getStatus()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    iget-object v2, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_response:Lorg/eclipse/jetty/server/Response;

    .line 18
    .line 19
    invoke-virtual {v2}, Lorg/eclipse/jetty/server/Response;->getReason()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-interface {v0, v1, v2}, Lorg/eclipse/jetty/http/Generator;->setResponse(ILjava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    :try_start_0
    iget-boolean v1, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_expect100Continue:Z

    .line 28
    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    iget-object v1, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_response:Lorg/eclipse/jetty/server/Response;

    .line 32
    .line 33
    invoke-virtual {v1}, Lorg/eclipse/jetty/server/Response;->getStatus()I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    const/16 v2, 0x64

    .line 38
    .line 39
    if-eq v1, v2, :cond_0

    .line 40
    .line 41
    iget-object v1, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 42
    .line 43
    invoke-interface {v1, v0}, Lorg/eclipse/jetty/http/Generator;->setPersistent(Z)V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :catch_0
    move-exception p1

    .line 48
    goto :goto_1

    .line 49
    :cond_0
    :goto_0
    iget-object v1, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 50
    .line 51
    iget-object v2, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_responseFields:Lorg/eclipse/jetty/http/HttpFields;

    .line 52
    .line 53
    invoke-interface {v1, v2, p1}, Lorg/eclipse/jetty/http/Generator;->completeHeader(Lorg/eclipse/jetty/http/HttpFields;Z)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 54
    .line 55
    .line 56
    goto :goto_2

    .line 57
    :goto_1
    sget-object v1, Lorg/eclipse/jetty/server/AbstractHttpConnection;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 58
    .line 59
    new-instance v2, Ljava/lang/StringBuilder;

    .line 60
    .line 61
    const-string v3, "header full: "

    .line 62
    .line 63
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    new-array v0, v0, [Ljava/lang/Object;

    .line 74
    .line 75
    invoke-interface {v1, p1, v0}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 76
    .line 77
    .line 78
    iget-object p1, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_response:Lorg/eclipse/jetty/server/Response;

    .line 79
    .line 80
    invoke-virtual {p1}, Lorg/eclipse/jetty/server/Response;->reset()V

    .line 81
    .line 82
    .line 83
    iget-object p1, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 84
    .line 85
    invoke-interface {p1}, Lorg/eclipse/jetty/http/Generator;->reset()V

    .line 86
    .line 87
    .line 88
    iget-object p1, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 89
    .line 90
    const/4 v0, 0x0

    .line 91
    const/16 v1, 0x1f4

    .line 92
    .line 93
    invoke-interface {p1, v1, v0}, Lorg/eclipse/jetty/http/Generator;->setResponse(ILjava/lang/String;)V

    .line 94
    .line 95
    .line 96
    iget-object p1, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 97
    .line 98
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_responseFields:Lorg/eclipse/jetty/http/HttpFields;

    .line 99
    .line 100
    const/4 v2, 0x1

    .line 101
    invoke-interface {p1, v0, v2}, Lorg/eclipse/jetty/http/Generator;->completeHeader(Lorg/eclipse/jetty/http/HttpFields;Z)V

    .line 102
    .line 103
    .line 104
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 105
    .line 106
    invoke-interface {p0}, Lorg/eclipse/jetty/http/Generator;->complete()V

    .line 107
    .line 108
    .line 109
    new-instance p0, Lorg/eclipse/jetty/http/HttpException;

    .line 110
    .line 111
    invoke-direct {p0, v1}, Lorg/eclipse/jetty/http/HttpException;-><init>(I)V

    .line 112
    .line 113
    .line 114
    throw p0

    .line 115
    :cond_1
    :goto_2
    if-eqz p1, :cond_2

    .line 116
    .line 117
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 118
    .line 119
    invoke-interface {p0}, Lorg/eclipse/jetty/http/Generator;->complete()V

    .line 120
    .line 121
    .line 122
    :cond_2
    return-void
.end method

.method public completeResponse()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 2
    .line 3
    invoke-interface {v0}, Lorg/eclipse/jetty/http/Generator;->isCommitted()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 10
    .line 11
    iget-object v1, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_response:Lorg/eclipse/jetty/server/Response;

    .line 12
    .line 13
    invoke-virtual {v1}, Lorg/eclipse/jetty/server/Response;->getStatus()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    iget-object v2, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_response:Lorg/eclipse/jetty/server/Response;

    .line 18
    .line 19
    invoke-virtual {v2}, Lorg/eclipse/jetty/server/Response;->getReason()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-interface {v0, v1, v2}, Lorg/eclipse/jetty/http/Generator;->setResponse(ILjava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const/4 v0, 0x1

    .line 27
    :try_start_0
    iget-object v1, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 28
    .line 29
    iget-object v2, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_responseFields:Lorg/eclipse/jetty/http/HttpFields;

    .line 30
    .line 31
    invoke-interface {v1, v2, v0}, Lorg/eclipse/jetty/http/Generator;->completeHeader(Lorg/eclipse/jetty/http/HttpFields;Z)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :catch_0
    move-exception v1

    .line 36
    sget-object v2, Lorg/eclipse/jetty/server/AbstractHttpConnection;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 37
    .line 38
    new-instance v3, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    const-string v4, "header full: "

    .line 41
    .line 42
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    const/4 v4, 0x0

    .line 53
    new-array v4, v4, [Ljava/lang/Object;

    .line 54
    .line 55
    invoke-interface {v2, v3, v4}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    invoke-interface {v2, v1}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/Throwable;)V

    .line 59
    .line 60
    .line 61
    iget-object v1, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_response:Lorg/eclipse/jetty/server/Response;

    .line 62
    .line 63
    invoke-virtual {v1}, Lorg/eclipse/jetty/server/Response;->reset()V

    .line 64
    .line 65
    .line 66
    iget-object v1, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 67
    .line 68
    invoke-interface {v1}, Lorg/eclipse/jetty/http/Generator;->reset()V

    .line 69
    .line 70
    .line 71
    iget-object v1, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 72
    .line 73
    const/4 v2, 0x0

    .line 74
    const/16 v3, 0x1f4

    .line 75
    .line 76
    invoke-interface {v1, v3, v2}, Lorg/eclipse/jetty/http/Generator;->setResponse(ILjava/lang/String;)V

    .line 77
    .line 78
    .line 79
    iget-object v1, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 80
    .line 81
    iget-object v2, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_responseFields:Lorg/eclipse/jetty/http/HttpFields;

    .line 82
    .line 83
    invoke-interface {v1, v2, v0}, Lorg/eclipse/jetty/http/Generator;->completeHeader(Lorg/eclipse/jetty/http/HttpFields;Z)V

    .line 84
    .line 85
    .line 86
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 87
    .line 88
    invoke-interface {p0}, Lorg/eclipse/jetty/http/Generator;->complete()V

    .line 89
    .line 90
    .line 91
    new-instance p0, Lorg/eclipse/jetty/http/HttpException;

    .line 92
    .line 93
    invoke-direct {p0, v3}, Lorg/eclipse/jetty/http/HttpException;-><init>(I)V

    .line 94
    .line 95
    .line 96
    throw p0

    .line 97
    :cond_0
    :goto_0
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 98
    .line 99
    invoke-interface {p0}, Lorg/eclipse/jetty/http/Generator;->complete()V

    .line 100
    .line 101
    .line 102
    return-void
.end method

.method public content(Lorg/eclipse/jetty/io/Buffer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean p1, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_delayedHandling:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    iput-boolean p1, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_delayedHandling:Z

    .line 7
    .line 8
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->handleRequest()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public earlyEOF()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_earlyEOF:Z

    .line 3
    .line 4
    return-void
.end method

.method public flushResponse()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->commitResponse(Z)V

    .line 3
    .line 4
    .line 5
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 6
    .line 7
    invoke-interface {p0}, Lorg/eclipse/jetty/http/Generator;->flushBuffer()I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :catch_0
    move-exception p0

    .line 12
    instance-of v0, p0, Lorg/eclipse/jetty/io/EofException;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    new-instance v0, Lorg/eclipse/jetty/io/EofException;

    .line 18
    .line 19
    invoke-direct {v0, p0}, Lorg/eclipse/jetty/io/EofException;-><init>(Ljava/lang/Throwable;)V

    .line 20
    .line 21
    .line 22
    move-object p0, v0

    .line 23
    :goto_0
    throw p0
.end method

.method public getAssociatedObject()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_associatedObject:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public getConnector()Lorg/eclipse/jetty/server/Connector;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_connector:Lorg/eclipse/jetty/server/Connector;

    .line 2
    .line 3
    return-object p0
.end method

.method public getGenerator()Lorg/eclipse/jetty/http/Generator;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 2
    .line 3
    return-object p0
.end method

.method public getInputStream()Ll/dse0;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_expect100Continue:Z

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_parser:Lorg/eclipse/jetty/http/Parser;

    .line 6
    .line 7
    check-cast v0, Lorg/eclipse/jetty/http/HttpParser;

    .line 8
    .line 9
    invoke-virtual {v0}, Lorg/eclipse/jetty/http/HttpParser;->getHeaderBuffer()Lorg/eclipse/jetty/io/Buffer;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_parser:Lorg/eclipse/jetty/http/Parser;

    .line 16
    .line 17
    check-cast v0, Lorg/eclipse/jetty/http/HttpParser;

    .line 18
    .line 19
    invoke-virtual {v0}, Lorg/eclipse/jetty/http/HttpParser;->getHeaderBuffer()Lorg/eclipse/jetty/io/Buffer;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    const/4 v1, 0x2

    .line 28
    if-ge v0, v1, :cond_1

    .line 29
    .line 30
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 31
    .line 32
    invoke-interface {v0}, Lorg/eclipse/jetty/http/Generator;->isCommitted()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-nez v0, :cond_2

    .line 37
    .line 38
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 39
    .line 40
    check-cast v0, Lorg/eclipse/jetty/http/HttpGenerator;

    .line 41
    .line 42
    const/16 v1, 0x64

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Lorg/eclipse/jetty/http/HttpGenerator;->send1xx(I)V

    .line 45
    .line 46
    .line 47
    :cond_1
    const/4 v0, 0x0

    .line 48
    iput-boolean v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_expect100Continue:Z

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_2
    const-string p0, "Committed before 100 Continues"

    .line 52
    .line 53
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    const/4 p0, 0x0

    .line 57
    return-object p0

    .line 58
    :cond_3
    :goto_0
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_in:Ll/dse0;

    .line 59
    .line 60
    if-nez v0, :cond_4

    .line 61
    .line 62
    new-instance v0, Lorg/eclipse/jetty/server/HttpInput;

    .line 63
    .line 64
    invoke-direct {v0, p0}, Lorg/eclipse/jetty/server/HttpInput;-><init>(Lorg/eclipse/jetty/server/AbstractHttpConnection;)V

    .line 65
    .line 66
    .line 67
    iput-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_in:Ll/dse0;

    .line 68
    .line 69
    :cond_4
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_in:Ll/dse0;

    .line 70
    .line 71
    return-object p0
.end method

.method public getMaxIdleTime()I
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_connector:Lorg/eclipse/jetty/server/Connector;

    .line 2
    .line 3
    invoke-interface {v0}, Lorg/eclipse/jetty/server/Connector;->isLowResources()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lorg/eclipse/jetty/io/AbstractConnection;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 10
    .line 11
    invoke-interface {v0}, Lorg/eclipse/jetty/io/EndPoint;->getMaxIdleTime()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget-object v1, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_connector:Lorg/eclipse/jetty/server/Connector;

    .line 16
    .line 17
    invoke-interface {v1}, Lorg/eclipse/jetty/server/Connector;->getMaxIdleTime()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-ne v0, v1, :cond_0

    .line 22
    .line 23
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_connector:Lorg/eclipse/jetty/server/Connector;

    .line 24
    .line 25
    invoke-interface {p0}, Lorg/eclipse/jetty/server/Connector;->getLowResourceMaxIdleTime()I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    return p0

    .line 30
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jetty/io/AbstractConnection;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 31
    .line 32
    invoke-interface {v0}, Lorg/eclipse/jetty/io/EndPoint;->getMaxIdleTime()I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-lez v0, :cond_1

    .line 37
    .line 38
    iget-object p0, p0, Lorg/eclipse/jetty/io/AbstractConnection;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 39
    .line 40
    invoke-interface {p0}, Lorg/eclipse/jetty/io/EndPoint;->getMaxIdleTime()I

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    return p0

    .line 45
    :cond_1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_connector:Lorg/eclipse/jetty/server/Connector;

    .line 46
    .line 47
    invoke-interface {p0}, Lorg/eclipse/jetty/server/Connector;->getMaxIdleTime()I

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    return p0
.end method

.method public getOutputStream()Ll/ese0;
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_out:Lorg/eclipse/jetty/server/AbstractHttpConnection$Output;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lorg/eclipse/jetty/server/AbstractHttpConnection$Output;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Lorg/eclipse/jetty/server/AbstractHttpConnection$Output;-><init>(Lorg/eclipse/jetty/server/AbstractHttpConnection;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_out:Lorg/eclipse/jetty/server/AbstractHttpConnection$Output;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_out:Lorg/eclipse/jetty/server/AbstractHttpConnection$Output;

    .line 13
    .line 14
    return-object p0
.end method

.method public getParser()Lorg/eclipse/jetty/http/Parser;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_parser:Lorg/eclipse/jetty/http/Parser;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPrintWriter(Ljava/lang/String;)Ljava/io/PrintWriter;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->getOutputStream()Ll/ese0;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_writer:Lorg/eclipse/jetty/server/AbstractHttpConnection$OutputWriter;

    .line 5
    .line 6
    if-nez v0, :cond_1

    .line 7
    .line 8
    new-instance v0, Lorg/eclipse/jetty/server/AbstractHttpConnection$OutputWriter;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Lorg/eclipse/jetty/server/AbstractHttpConnection$OutputWriter;-><init>(Lorg/eclipse/jetty/server/AbstractHttpConnection;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_writer:Lorg/eclipse/jetty/server/AbstractHttpConnection$OutputWriter;

    .line 14
    .line 15
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_server:Lorg/eclipse/jetty/server/Server;

    .line 16
    .line 17
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/Server;->isUncheckedPrintWriter()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    new-instance v0, Lorg/eclipse/jetty/io/UncheckedPrintWriter;

    .line 24
    .line 25
    iget-object v1, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_writer:Lorg/eclipse/jetty/server/AbstractHttpConnection$OutputWriter;

    .line 26
    .line 27
    invoke-direct {v0, v1}, Lorg/eclipse/jetty/io/UncheckedPrintWriter;-><init>(Ljava/io/Writer;)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_printWriter:Ljava/io/PrintWriter;

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    new-instance v0, Lorg/eclipse/jetty/server/AbstractHttpConnection$1;

    .line 34
    .line 35
    iget-object v1, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_writer:Lorg/eclipse/jetty/server/AbstractHttpConnection$OutputWriter;

    .line 36
    .line 37
    invoke-direct {v0, p0, v1}, Lorg/eclipse/jetty/server/AbstractHttpConnection$1;-><init>(Lorg/eclipse/jetty/server/AbstractHttpConnection;Ljava/io/Writer;)V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_printWriter:Ljava/io/PrintWriter;

    .line 41
    .line 42
    :cond_1
    :goto_0
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_writer:Lorg/eclipse/jetty/server/AbstractHttpConnection$OutputWriter;

    .line 43
    .line 44
    invoke-virtual {v0, p1}, Lorg/eclipse/jetty/server/HttpWriter;->setCharacterEncoding(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_printWriter:Ljava/io/PrintWriter;

    .line 48
    .line 49
    return-object p0
.end method

.method public getRequest()Lorg/eclipse/jetty/server/Request;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_request:Lorg/eclipse/jetty/server/Request;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRequestFields()Lorg/eclipse/jetty/http/HttpFields;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_requestFields:Lorg/eclipse/jetty/http/HttpFields;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRequests()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_requests:I

    .line 2
    .line 3
    return p0
.end method

.method public getResolveNames()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_connector:Lorg/eclipse/jetty/server/Connector;

    .line 2
    .line 3
    invoke-interface {p0}, Lorg/eclipse/jetty/server/Connector;->getResolveNames()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getResponse()Lorg/eclipse/jetty/server/Response;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_response:Lorg/eclipse/jetty/server/Response;

    .line 2
    .line 3
    return-object p0
.end method

.method public getResponseFields()Lorg/eclipse/jetty/http/HttpFields;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_responseFields:Lorg/eclipse/jetty/http/HttpFields;

    .line 2
    .line 3
    return-object p0
.end method

.method public getServer()Lorg/eclipse/jetty/server/Server;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_server:Lorg/eclipse/jetty/server/Server;

    .line 2
    .line 3
    return-object p0
.end method

.method public abstract handle()Lorg/eclipse/jetty/io/Connection;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public handleRequest()V
    .locals 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const-string v0, "100 continues not sent"

    .line 2
    .line 3
    const/16 v1, 0x194

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    const/4 v3, 0x0

    .line 7
    const/4 v4, 0x0

    .line 8
    :try_start_0
    sget-object v5, Lorg/eclipse/jetty/server/AbstractHttpConnection;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 9
    .line 10
    invoke-interface {v5}, Lorg/eclipse/jetty/util/log/Logger;->isDebugEnabled()Z

    .line 11
    .line 12
    .line 13
    move-result v5

    .line 14
    if-eqz v5, :cond_0

    .line 15
    .line 16
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 17
    .line 18
    .line 19
    move-result-object v5

    .line 20
    invoke-virtual {v5}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 24
    :try_start_1
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 25
    .line 26
    .line 27
    move-result-object v6

    .line 28
    new-instance v7, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string v8, " - "

    .line 37
    .line 38
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    iget-object v8, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_uri:Lorg/eclipse/jetty/http/HttpURI;

    .line 42
    .line 43
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v7

    .line 50
    invoke-virtual {v6, v7}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    goto :goto_1

    .line 54
    :catchall_0
    move-exception v6

    .line 55
    move v9, v3

    .line 56
    move-object v8, v4

    .line 57
    :goto_0
    move-object v4, v5

    .line 58
    goto/16 :goto_11

    .line 59
    .line 60
    :catchall_1
    move-exception v6

    .line 61
    move v9, v3

    .line 62
    move-object v8, v4

    .line 63
    goto/16 :goto_11

    .line 64
    .line 65
    :cond_0
    move-object v5, v4

    .line 66
    :goto_1
    iget-object v6, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_server:Lorg/eclipse/jetty/server/Server;

    .line 67
    .line 68
    iget-object v7, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_request:Lorg/eclipse/jetty/server/Request;

    .line 69
    .line 70
    iget-object v7, v7, Lorg/eclipse/jetty/server/Request;->_async:Lorg/eclipse/jetty/server/AsyncContinuation;

    .line 71
    .line 72
    invoke-virtual {v7}, Lorg/eclipse/jetty/server/AsyncContinuation;->handling()Z

    .line 73
    .line 74
    .line 75
    move-result v7

    .line 76
    if-eqz v7, :cond_1

    .line 77
    .line 78
    if-eqz v6, :cond_1

    .line 79
    .line 80
    invoke-virtual {v6}, Lorg/eclipse/jetty/util/component/AbstractLifeCycle;->isRunning()Z

    .line 81
    .line 82
    .line 83
    move-result v7
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 84
    if-eqz v7, :cond_1

    .line 85
    .line 86
    move v7, v2

    .line 87
    goto :goto_2

    .line 88
    :cond_1
    move v7, v3

    .line 89
    :goto_2
    move v9, v3

    .line 90
    move-object v8, v4

    .line 91
    :goto_3
    if-eqz v7, :cond_b

    .line 92
    .line 93
    :try_start_2
    iget-object v7, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_request:Lorg/eclipse/jetty/server/Request;

    .line 94
    .line 95
    invoke-virtual {v7, v3}, Lorg/eclipse/jetty/server/Request;->setHandled(Z)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_4

    .line 96
    .line 97
    .line 98
    const/16 v7, 0x1f4

    .line 99
    .line 100
    const/16 v10, 0x190

    .line 101
    .line 102
    :try_start_3
    iget-object v11, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_uri:Lorg/eclipse/jetty/http/HttpURI;

    .line 103
    .line 104
    invoke-virtual {v11}, Lorg/eclipse/jetty/http/HttpURI;->getPort()I
    :try_end_3
    .catch Lorg/eclipse/jetty/continuation/ContinuationThrowable; {:try_start_3 .. :try_end_3} :catch_0
    .catch Lorg/eclipse/jetty/io/EofException; {:try_start_3 .. :try_end_3} :catch_4
    .catch Lorg/eclipse/jetty/io/RuntimeIOException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Lorg/eclipse/jetty/http/HttpException; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 105
    .line 106
    .line 107
    :try_start_4
    iget-object v11, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_uri:Lorg/eclipse/jetty/http/HttpURI;

    .line 108
    .line 109
    invoke-virtual {v11}, Lorg/eclipse/jetty/http/HttpURI;->getDecodedPath()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v11
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catch Lorg/eclipse/jetty/continuation/ContinuationThrowable; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 113
    goto :goto_4

    .line 114
    :catchall_2
    move-exception v8

    .line 115
    move-object v11, v4

    .line 116
    goto/16 :goto_8

    .line 117
    .line 118
    :catch_0
    move-exception v7

    .line 119
    goto/16 :goto_e

    .line 120
    .line 121
    :catch_1
    move-exception v11

    .line 122
    :try_start_5
    sget-object v12, Lorg/eclipse/jetty/server/AbstractHttpConnection;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 123
    .line 124
    const-string v13, "Failed UTF-8 decode for request path, trying ISO-8859-1"

    .line 125
    .line 126
    new-array v14, v3, [Ljava/lang/Object;

    .line 127
    .line 128
    invoke-interface {v12, v13, v14}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 129
    .line 130
    .line 131
    invoke-interface {v12, v11}, Lorg/eclipse/jetty/util/log/Logger;->ignore(Ljava/lang/Throwable;)V

    .line 132
    .line 133
    .line 134
    iget-object v11, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_uri:Lorg/eclipse/jetty/http/HttpURI;

    .line 135
    .line 136
    const-string v12, "ISO-8859-1"

    .line 137
    .line 138
    invoke-virtual {v11, v12}, Lorg/eclipse/jetty/http/HttpURI;->getDecodedPath(Ljava/lang/String;)Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v11

    .line 142
    :goto_4
    invoke-static {v11}, Lorg/eclipse/jetty/util/URIUtil;->canonicalPath(Ljava/lang/String;)Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object v11
    :try_end_5
    .catch Lorg/eclipse/jetty/continuation/ContinuationThrowable; {:try_start_5 .. :try_end_5} :catch_0
    .catch Lorg/eclipse/jetty/io/EofException; {:try_start_5 .. :try_end_5} :catch_4
    .catch Lorg/eclipse/jetty/io/RuntimeIOException; {:try_start_5 .. :try_end_5} :catch_3
    .catch Lorg/eclipse/jetty/http/HttpException; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 146
    if-nez v11, :cond_3

    .line 147
    .line 148
    :try_start_6
    iget-object v12, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_request:Lorg/eclipse/jetty/server/Request;

    .line 149
    .line 150
    invoke-virtual {v12}, Lorg/eclipse/jetty/server/Request;->getMethod()Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v12

    .line 154
    const-string v13, "CONNECT"

    .line 155
    .line 156
    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 157
    .line 158
    .line 159
    move-result v12

    .line 160
    if-nez v12, :cond_3

    .line 161
    .line 162
    iget-object v12, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_uri:Lorg/eclipse/jetty/http/HttpURI;

    .line 163
    .line 164
    invoke-virtual {v12}, Lorg/eclipse/jetty/http/HttpURI;->getScheme()Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object v12

    .line 168
    if-eqz v12, :cond_2

    .line 169
    .line 170
    iget-object v12, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_uri:Lorg/eclipse/jetty/http/HttpURI;

    .line 171
    .line 172
    invoke-virtual {v12}, Lorg/eclipse/jetty/http/HttpURI;->getHost()Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object v12

    .line 176
    if-eqz v12, :cond_2

    .line 177
    .line 178
    const-string v11, "/"

    .line 179
    .line 180
    goto :goto_5

    .line 181
    :catchall_3
    move-exception v8

    .line 182
    goto :goto_8

    .line 183
    :catch_2
    move-exception v7

    .line 184
    goto/16 :goto_b

    .line 185
    .line 186
    :catch_3
    move-exception v7

    .line 187
    move-object v8, v7

    .line 188
    goto/16 :goto_c

    .line 189
    .line 190
    :catch_4
    move-exception v8

    .line 191
    goto/16 :goto_d

    .line 192
    .line 193
    :cond_2
    new-instance v12, Lorg/eclipse/jetty/http/HttpException;

    .line 194
    .line 195
    invoke-direct {v12, v10}, Lorg/eclipse/jetty/http/HttpException;-><init>(I)V

    .line 196
    .line 197
    .line 198
    throw v12

    .line 199
    :cond_3
    :goto_5
    iget-object v12, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_request:Lorg/eclipse/jetty/server/Request;

    .line 200
    .line 201
    invoke-virtual {v12, v11}, Lorg/eclipse/jetty/server/Request;->setPathInfo(Ljava/lang/String;)V

    .line 202
    .line 203
    .line 204
    iget-object v12, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_out:Lorg/eclipse/jetty/server/AbstractHttpConnection$Output;

    .line 205
    .line 206
    if-eqz v12, :cond_4

    .line 207
    .line 208
    iget-object v12, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_out:Lorg/eclipse/jetty/server/AbstractHttpConnection$Output;

    .line 209
    .line 210
    invoke-virtual {v12}, Lorg/eclipse/jetty/server/HttpOutput;->reopen()V

    .line 211
    .line 212
    .line 213
    :cond_4
    iget-object v12, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_request:Lorg/eclipse/jetty/server/Request;

    .line 214
    .line 215
    iget-object v12, v12, Lorg/eclipse/jetty/server/Request;->_async:Lorg/eclipse/jetty/server/AsyncContinuation;

    .line 216
    .line 217
    invoke-virtual {v12}, Lorg/eclipse/jetty/server/AsyncContinuation;->isInitial()Z

    .line 218
    .line 219
    .line 220
    move-result v12
    :try_end_6
    .catch Lorg/eclipse/jetty/continuation/ContinuationThrowable; {:try_start_6 .. :try_end_6} :catch_0
    .catch Lorg/eclipse/jetty/io/EofException; {:try_start_6 .. :try_end_6} :catch_4
    .catch Lorg/eclipse/jetty/io/RuntimeIOException; {:try_start_6 .. :try_end_6} :catch_3
    .catch Lorg/eclipse/jetty/http/HttpException; {:try_start_6 .. :try_end_6} :catch_2
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    .line 221
    iget-object v13, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_request:Lorg/eclipse/jetty/server/Request;

    .line 222
    .line 223
    if-eqz v12, :cond_5

    .line 224
    .line 225
    :try_start_7
    sget-object v12, Ljavax/servlet/DispatcherType;->REQUEST:Ljavax/servlet/DispatcherType;

    .line 226
    .line 227
    invoke-virtual {v13, v12}, Lorg/eclipse/jetty/server/Request;->setDispatcherType(Ljavax/servlet/DispatcherType;)V

    .line 228
    .line 229
    .line 230
    iget-object v12, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_connector:Lorg/eclipse/jetty/server/Connector;

    .line 231
    .line 232
    iget-object v13, p0, Lorg/eclipse/jetty/io/AbstractConnection;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 233
    .line 234
    iget-object v14, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_request:Lorg/eclipse/jetty/server/Request;

    .line 235
    .line 236
    invoke-interface {v12, v13, v14}, Lorg/eclipse/jetty/server/Connector;->customize(Lorg/eclipse/jetty/io/EndPoint;Lorg/eclipse/jetty/server/Request;)V

    .line 237
    .line 238
    .line 239
    invoke-virtual {v6, p0}, Lorg/eclipse/jetty/server/Server;->handle(Lorg/eclipse/jetty/server/AbstractHttpConnection;)V

    .line 240
    .line 241
    .line 242
    goto :goto_6

    .line 243
    :cond_5
    sget-object v12, Ljavax/servlet/DispatcherType;->ASYNC:Ljavax/servlet/DispatcherType;

    .line 244
    .line 245
    invoke-virtual {v13, v12}, Lorg/eclipse/jetty/server/Request;->setDispatcherType(Ljavax/servlet/DispatcherType;)V

    .line 246
    .line 247
    .line 248
    invoke-virtual {v6, p0}, Lorg/eclipse/jetty/server/Server;->handleAsync(Lorg/eclipse/jetty/server/AbstractHttpConnection;)V
    :try_end_7
    .catch Lorg/eclipse/jetty/continuation/ContinuationThrowable; {:try_start_7 .. :try_end_7} :catch_0
    .catch Lorg/eclipse/jetty/io/EofException; {:try_start_7 .. :try_end_7} :catch_4
    .catch Lorg/eclipse/jetty/io/RuntimeIOException; {:try_start_7 .. :try_end_7} :catch_3
    .catch Lorg/eclipse/jetty/http/HttpException; {:try_start_7 .. :try_end_7} :catch_2
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    .line 249
    .line 250
    .line 251
    :goto_6
    :try_start_8
    iget-object v7, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_request:Lorg/eclipse/jetty/server/Request;

    .line 252
    .line 253
    iget-object v7, v7, Lorg/eclipse/jetty/server/Request;->_async:Lorg/eclipse/jetty/server/AsyncContinuation;

    .line 254
    .line 255
    invoke-virtual {v7}, Lorg/eclipse/jetty/server/AsyncContinuation;->unhandle()Z

    .line 256
    .line 257
    .line 258
    move-result v7

    .line 259
    if-nez v7, :cond_6

    .line 260
    .line 261
    invoke-virtual {v6}, Lorg/eclipse/jetty/util/component/AbstractLifeCycle;->isRunning()Z

    .line 262
    .line 263
    .line 264
    move-result v7

    .line 265
    if-eqz v7, :cond_6

    .line 266
    .line 267
    iget-object v7, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_server:Lorg/eclipse/jetty/server/Server;
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_4

    .line 268
    .line 269
    if-eqz v7, :cond_6

    .line 270
    .line 271
    :goto_7
    move v7, v2

    .line 272
    goto/16 :goto_3

    .line 273
    .line 274
    :catchall_4
    move-exception v6

    .line 275
    goto/16 :goto_0

    .line 276
    .line 277
    :cond_6
    move v7, v3

    .line 278
    goto/16 :goto_3

    .line 279
    .line 280
    :goto_8
    :try_start_9
    sget-object v12, Lorg/eclipse/jetty/server/AbstractHttpConnection;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 281
    .line 282
    iget-object v13, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_uri:Lorg/eclipse/jetty/http/HttpURI;

    .line 283
    .line 284
    invoke-static {v13}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 285
    .line 286
    .line 287
    move-result-object v13

    .line 288
    invoke-interface {v12, v13, v8}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_7

    .line 289
    .line 290
    .line 291
    :try_start_a
    iget-object v9, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_request:Lorg/eclipse/jetty/server/Request;

    .line 292
    .line 293
    invoke-virtual {v9, v2}, Lorg/eclipse/jetty/server/Request;->setHandled(Z)V

    .line 294
    .line 295
    .line 296
    iget-object v9, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 297
    .line 298
    if-nez v11, :cond_7

    .line 299
    .line 300
    move v7, v10

    .line 301
    :cond_7
    invoke-interface {v9, v7, v4, v4, v2}, Lorg/eclipse/jetty/http/Generator;->sendError(ILjava/lang/String;Ljava/lang/String;Z)V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_6

    .line 302
    .line 303
    .line 304
    :try_start_b
    iget-object v7, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_request:Lorg/eclipse/jetty/server/Request;

    .line 305
    .line 306
    iget-object v7, v7, Lorg/eclipse/jetty/server/Request;->_async:Lorg/eclipse/jetty/server/AsyncContinuation;

    .line 307
    .line 308
    invoke-virtual {v7}, Lorg/eclipse/jetty/server/AsyncContinuation;->unhandle()Z

    .line 309
    .line 310
    .line 311
    move-result v7

    .line 312
    if-nez v7, :cond_8

    .line 313
    .line 314
    invoke-virtual {v6}, Lorg/eclipse/jetty/util/component/AbstractLifeCycle;->isRunning()Z

    .line 315
    .line 316
    .line 317
    move-result v7

    .line 318
    if-eqz v7, :cond_8

    .line 319
    .line 320
    iget-object v7, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_server:Lorg/eclipse/jetty/server/Server;
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_5

    .line 321
    .line 322
    if-eqz v7, :cond_8

    .line 323
    .line 324
    :goto_9
    move v7, v2

    .line 325
    goto :goto_a

    .line 326
    :catchall_5
    move-exception v6

    .line 327
    move v9, v2

    .line 328
    goto/16 :goto_0

    .line 329
    .line 330
    :cond_8
    move v7, v3

    .line 331
    :goto_a
    move v9, v2

    .line 332
    goto/16 :goto_3

    .line 333
    .line 334
    :catchall_6
    move-exception v4

    .line 335
    move v9, v2

    .line 336
    goto/16 :goto_f

    .line 337
    .line 338
    :catchall_7
    move-exception v4

    .line 339
    goto/16 :goto_f

    .line 340
    .line 341
    :goto_b
    :try_start_c
    sget-object v10, Lorg/eclipse/jetty/server/AbstractHttpConnection;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 342
    .line 343
    invoke-interface {v10, v7}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/Throwable;)V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_7

    .line 344
    .line 345
    .line 346
    :try_start_d
    iget-object v9, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_request:Lorg/eclipse/jetty/server/Request;

    .line 347
    .line 348
    invoke-virtual {v9, v2}, Lorg/eclipse/jetty/server/Request;->setHandled(Z)V

    .line 349
    .line 350
    .line 351
    iget-object v9, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_response:Lorg/eclipse/jetty/server/Response;

    .line 352
    .line 353
    invoke-virtual {v7}, Lorg/eclipse/jetty/http/HttpException;->getStatus()I

    .line 354
    .line 355
    .line 356
    move-result v10

    .line 357
    invoke-virtual {v7}, Lorg/eclipse/jetty/http/HttpException;->getReason()Ljava/lang/String;

    .line 358
    .line 359
    .line 360
    move-result-object v7

    .line 361
    invoke-virtual {v9, v10, v7}, Lorg/eclipse/jetty/server/Response;->sendError(ILjava/lang/String;)V
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_6

    .line 362
    .line 363
    .line 364
    :try_start_e
    iget-object v7, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_request:Lorg/eclipse/jetty/server/Request;

    .line 365
    .line 366
    iget-object v7, v7, Lorg/eclipse/jetty/server/Request;->_async:Lorg/eclipse/jetty/server/AsyncContinuation;

    .line 367
    .line 368
    invoke-virtual {v7}, Lorg/eclipse/jetty/server/AsyncContinuation;->unhandle()Z

    .line 369
    .line 370
    .line 371
    move-result v7

    .line 372
    if-nez v7, :cond_8

    .line 373
    .line 374
    invoke-virtual {v6}, Lorg/eclipse/jetty/util/component/AbstractLifeCycle;->isRunning()Z

    .line 375
    .line 376
    .line 377
    move-result v7

    .line 378
    if-eqz v7, :cond_8

    .line 379
    .line 380
    iget-object v7, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_server:Lorg/eclipse/jetty/server/Server;
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_5

    .line 381
    .line 382
    if-eqz v7, :cond_8

    .line 383
    .line 384
    goto :goto_9

    .line 385
    :goto_c
    :try_start_f
    sget-object v7, Lorg/eclipse/jetty/server/AbstractHttpConnection;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 386
    .line 387
    invoke-interface {v7, v8}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/Throwable;)V
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_7

    .line 388
    .line 389
    .line 390
    :try_start_10
    iget-object v7, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_request:Lorg/eclipse/jetty/server/Request;

    .line 391
    .line 392
    invoke-virtual {v7, v2}, Lorg/eclipse/jetty/server/Request;->setHandled(Z)V
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_6

    .line 393
    .line 394
    .line 395
    :try_start_11
    iget-object v7, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_request:Lorg/eclipse/jetty/server/Request;

    .line 396
    .line 397
    iget-object v7, v7, Lorg/eclipse/jetty/server/Request;->_async:Lorg/eclipse/jetty/server/AsyncContinuation;

    .line 398
    .line 399
    invoke-virtual {v7}, Lorg/eclipse/jetty/server/AsyncContinuation;->unhandle()Z

    .line 400
    .line 401
    .line 402
    move-result v7

    .line 403
    if-nez v7, :cond_8

    .line 404
    .line 405
    invoke-virtual {v6}, Lorg/eclipse/jetty/util/component/AbstractLifeCycle;->isRunning()Z

    .line 406
    .line 407
    .line 408
    move-result v7

    .line 409
    if-eqz v7, :cond_8

    .line 410
    .line 411
    iget-object v7, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_server:Lorg/eclipse/jetty/server/Server;
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_5

    .line 412
    .line 413
    if-eqz v7, :cond_8

    .line 414
    .line 415
    goto :goto_9

    .line 416
    :goto_d
    :try_start_12
    sget-object v10, Lorg/eclipse/jetty/server/AbstractHttpConnection;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 417
    .line 418
    invoke-interface {v10, v8}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/Throwable;)V
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_7

    .line 419
    .line 420
    .line 421
    :try_start_13
    iget-object v9, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_request:Lorg/eclipse/jetty/server/Request;

    .line 422
    .line 423
    invoke-virtual {v9, v2}, Lorg/eclipse/jetty/server/Request;->setHandled(Z)V

    .line 424
    .line 425
    .line 426
    iget-object v9, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_response:Lorg/eclipse/jetty/server/Response;

    .line 427
    .line 428
    invoke-virtual {v9}, Lorg/eclipse/jetty/server/Response;->isCommitted()Z

    .line 429
    .line 430
    .line 431
    move-result v9

    .line 432
    if-nez v9, :cond_9

    .line 433
    .line 434
    iget-object v9, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 435
    .line 436
    invoke-interface {v9, v7, v4, v4, v2}, Lorg/eclipse/jetty/http/Generator;->sendError(ILjava/lang/String;Ljava/lang/String;Z)V
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_6

    .line 437
    .line 438
    .line 439
    :cond_9
    :try_start_14
    iget-object v7, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_request:Lorg/eclipse/jetty/server/Request;

    .line 440
    .line 441
    iget-object v7, v7, Lorg/eclipse/jetty/server/Request;->_async:Lorg/eclipse/jetty/server/AsyncContinuation;

    .line 442
    .line 443
    invoke-virtual {v7}, Lorg/eclipse/jetty/server/AsyncContinuation;->unhandle()Z

    .line 444
    .line 445
    .line 446
    move-result v7

    .line 447
    if-nez v7, :cond_8

    .line 448
    .line 449
    invoke-virtual {v6}, Lorg/eclipse/jetty/util/component/AbstractLifeCycle;->isRunning()Z

    .line 450
    .line 451
    .line 452
    move-result v7

    .line 453
    if-eqz v7, :cond_8

    .line 454
    .line 455
    iget-object v7, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_server:Lorg/eclipse/jetty/server/Server;
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_5

    .line 456
    .line 457
    if-eqz v7, :cond_8

    .line 458
    .line 459
    goto/16 :goto_9

    .line 460
    .line 461
    :goto_e
    :try_start_15
    sget-object v10, Lorg/eclipse/jetty/server/AbstractHttpConnection;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 462
    .line 463
    invoke-interface {v10, v7}, Lorg/eclipse/jetty/util/log/Logger;->ignore(Ljava/lang/Throwable;)V
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_7

    .line 464
    .line 465
    .line 466
    :try_start_16
    iget-object v7, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_request:Lorg/eclipse/jetty/server/Request;

    .line 467
    .line 468
    iget-object v7, v7, Lorg/eclipse/jetty/server/Request;->_async:Lorg/eclipse/jetty/server/AsyncContinuation;

    .line 469
    .line 470
    invoke-virtual {v7}, Lorg/eclipse/jetty/server/AsyncContinuation;->unhandle()Z

    .line 471
    .line 472
    .line 473
    move-result v7

    .line 474
    if-nez v7, :cond_6

    .line 475
    .line 476
    invoke-virtual {v6}, Lorg/eclipse/jetty/util/component/AbstractLifeCycle;->isRunning()Z

    .line 477
    .line 478
    .line 479
    move-result v7

    .line 480
    if-eqz v7, :cond_6

    .line 481
    .line 482
    iget-object v7, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_server:Lorg/eclipse/jetty/server/Server;

    .line 483
    .line 484
    if-eqz v7, :cond_6

    .line 485
    .line 486
    goto/16 :goto_7

    .line 487
    .line 488
    :goto_f
    iget-object v7, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_request:Lorg/eclipse/jetty/server/Request;

    .line 489
    .line 490
    iget-object v7, v7, Lorg/eclipse/jetty/server/Request;->_async:Lorg/eclipse/jetty/server/AsyncContinuation;

    .line 491
    .line 492
    invoke-virtual {v7}, Lorg/eclipse/jetty/server/AsyncContinuation;->unhandle()Z

    .line 493
    .line 494
    .line 495
    move-result v7

    .line 496
    if-nez v7, :cond_a

    .line 497
    .line 498
    invoke-virtual {v6}, Lorg/eclipse/jetty/util/component/AbstractLifeCycle;->isRunning()Z

    .line 499
    .line 500
    .line 501
    move-result v6

    .line 502
    if-eqz v6, :cond_a

    .line 503
    .line 504
    iget-object v6, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_server:Lorg/eclipse/jetty/server/Server;

    .line 505
    .line 506
    :cond_a
    throw v4
    :try_end_16
    .catchall {:try_start_16 .. :try_end_16} :catchall_4

    .line 507
    :cond_b
    if-eqz v5, :cond_c

    .line 508
    .line 509
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 510
    .line 511
    .line 512
    move-result-object v4

    .line 513
    invoke-virtual {v4, v5}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 514
    .line 515
    .line 516
    :cond_c
    iget-object v4, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_request:Lorg/eclipse/jetty/server/Request;

    .line 517
    .line 518
    iget-object v4, v4, Lorg/eclipse/jetty/server/Request;->_async:Lorg/eclipse/jetty/server/AsyncContinuation;

    .line 519
    .line 520
    invoke-virtual {v4}, Lorg/eclipse/jetty/server/AsyncContinuation;->isUncompleted()Z

    .line 521
    .line 522
    .line 523
    move-result v4

    .line 524
    if-eqz v4, :cond_12

    .line 525
    .line 526
    iget-object v4, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_request:Lorg/eclipse/jetty/server/Request;

    .line 527
    .line 528
    iget-object v4, v4, Lorg/eclipse/jetty/server/Request;->_async:Lorg/eclipse/jetty/server/AsyncContinuation;

    .line 529
    .line 530
    invoke-virtual {v4, v8}, Lorg/eclipse/jetty/server/AsyncContinuation;->doComplete(Ljava/lang/Throwable;)V

    .line 531
    .line 532
    .line 533
    iget-boolean v4, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_expect100Continue:Z

    .line 534
    .line 535
    if-eqz v4, :cond_d

    .line 536
    .line 537
    sget-object v4, Lorg/eclipse/jetty/server/AbstractHttpConnection;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 538
    .line 539
    new-array v5, v3, [Ljava/lang/Object;

    .line 540
    .line 541
    invoke-interface {v4, v0, v5}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 542
    .line 543
    .line 544
    iput-boolean v3, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_expect100Continue:Z

    .line 545
    .line 546
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_response:Lorg/eclipse/jetty/server/Response;

    .line 547
    .line 548
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/Response;->isCommitted()Z

    .line 549
    .line 550
    .line 551
    move-result v0

    .line 552
    if-nez v0, :cond_d

    .line 553
    .line 554
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 555
    .line 556
    invoke-interface {v0, v3}, Lorg/eclipse/jetty/http/Generator;->setPersistent(Z)V

    .line 557
    .line 558
    .line 559
    :cond_d
    iget-object v0, p0, Lorg/eclipse/jetty/io/AbstractConnection;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 560
    .line 561
    invoke-interface {v0}, Lorg/eclipse/jetty/io/EndPoint;->isOpen()Z

    .line 562
    .line 563
    .line 564
    move-result v0

    .line 565
    if-eqz v0, :cond_10

    .line 566
    .line 567
    if-eqz v9, :cond_e

    .line 568
    .line 569
    iget-object v0, p0, Lorg/eclipse/jetty/io/AbstractConnection;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 570
    .line 571
    invoke-interface {v0}, Lorg/eclipse/jetty/io/EndPoint;->shutdownOutput()V

    .line 572
    .line 573
    .line 574
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 575
    .line 576
    invoke-interface {v0, v3}, Lorg/eclipse/jetty/http/Generator;->setPersistent(Z)V

    .line 577
    .line 578
    .line 579
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 580
    .line 581
    invoke-interface {v0}, Lorg/eclipse/jetty/http/Generator;->isComplete()Z

    .line 582
    .line 583
    .line 584
    move-result v0

    .line 585
    if-nez v0, :cond_11

    .line 586
    .line 587
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_response:Lorg/eclipse/jetty/server/Response;

    .line 588
    .line 589
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/Response;->complete()V

    .line 590
    .line 591
    .line 592
    goto :goto_10

    .line 593
    :cond_e
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_response:Lorg/eclipse/jetty/server/Response;

    .line 594
    .line 595
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/Response;->isCommitted()Z

    .line 596
    .line 597
    .line 598
    move-result v0

    .line 599
    if-nez v0, :cond_f

    .line 600
    .line 601
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_request:Lorg/eclipse/jetty/server/Request;

    .line 602
    .line 603
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/Request;->isHandled()Z

    .line 604
    .line 605
    .line 606
    move-result v0

    .line 607
    if-nez v0, :cond_f

    .line 608
    .line 609
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_response:Lorg/eclipse/jetty/server/Response;

    .line 610
    .line 611
    invoke-virtual {v0, v1}, Lorg/eclipse/jetty/server/Response;->sendError(I)V

    .line 612
    .line 613
    .line 614
    :cond_f
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_response:Lorg/eclipse/jetty/server/Response;

    .line 615
    .line 616
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/Response;->complete()V

    .line 617
    .line 618
    .line 619
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 620
    .line 621
    invoke-interface {v0}, Lorg/eclipse/jetty/http/Generator;->isPersistent()Z

    .line 622
    .line 623
    .line 624
    move-result v0

    .line 625
    if-eqz v0, :cond_11

    .line 626
    .line 627
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_connector:Lorg/eclipse/jetty/server/Connector;

    .line 628
    .line 629
    iget-object v1, p0, Lorg/eclipse/jetty/io/AbstractConnection;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 630
    .line 631
    invoke-interface {v0, v1}, Lorg/eclipse/jetty/server/Connector;->persist(Lorg/eclipse/jetty/io/EndPoint;)V

    .line 632
    .line 633
    .line 634
    goto :goto_10

    .line 635
    :cond_10
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_response:Lorg/eclipse/jetty/server/Response;

    .line 636
    .line 637
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/Response;->complete()V

    .line 638
    .line 639
    .line 640
    :cond_11
    :goto_10
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_request:Lorg/eclipse/jetty/server/Request;

    .line 641
    .line 642
    invoke-virtual {p0, v2}, Lorg/eclipse/jetty/server/Request;->setHandled(Z)V

    .line 643
    .line 644
    .line 645
    :cond_12
    return-void

    .line 646
    :goto_11
    if-eqz v4, :cond_13

    .line 647
    .line 648
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 649
    .line 650
    .line 651
    move-result-object v5

    .line 652
    invoke-virtual {v5, v4}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 653
    .line 654
    .line 655
    :cond_13
    iget-object v4, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_request:Lorg/eclipse/jetty/server/Request;

    .line 656
    .line 657
    iget-object v4, v4, Lorg/eclipse/jetty/server/Request;->_async:Lorg/eclipse/jetty/server/AsyncContinuation;

    .line 658
    .line 659
    invoke-virtual {v4}, Lorg/eclipse/jetty/server/AsyncContinuation;->isUncompleted()Z

    .line 660
    .line 661
    .line 662
    move-result v4

    .line 663
    if-eqz v4, :cond_19

    .line 664
    .line 665
    iget-object v4, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_request:Lorg/eclipse/jetty/server/Request;

    .line 666
    .line 667
    iget-object v4, v4, Lorg/eclipse/jetty/server/Request;->_async:Lorg/eclipse/jetty/server/AsyncContinuation;

    .line 668
    .line 669
    invoke-virtual {v4, v8}, Lorg/eclipse/jetty/server/AsyncContinuation;->doComplete(Ljava/lang/Throwable;)V

    .line 670
    .line 671
    .line 672
    iget-boolean v4, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_expect100Continue:Z

    .line 673
    .line 674
    if-eqz v4, :cond_14

    .line 675
    .line 676
    sget-object v4, Lorg/eclipse/jetty/server/AbstractHttpConnection;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 677
    .line 678
    new-array v5, v3, [Ljava/lang/Object;

    .line 679
    .line 680
    invoke-interface {v4, v0, v5}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 681
    .line 682
    .line 683
    iput-boolean v3, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_expect100Continue:Z

    .line 684
    .line 685
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_response:Lorg/eclipse/jetty/server/Response;

    .line 686
    .line 687
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/Response;->isCommitted()Z

    .line 688
    .line 689
    .line 690
    move-result v0

    .line 691
    if-nez v0, :cond_14

    .line 692
    .line 693
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 694
    .line 695
    invoke-interface {v0, v3}, Lorg/eclipse/jetty/http/Generator;->setPersistent(Z)V

    .line 696
    .line 697
    .line 698
    :cond_14
    iget-object v0, p0, Lorg/eclipse/jetty/io/AbstractConnection;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 699
    .line 700
    invoke-interface {v0}, Lorg/eclipse/jetty/io/EndPoint;->isOpen()Z

    .line 701
    .line 702
    .line 703
    move-result v0

    .line 704
    if-eqz v0, :cond_17

    .line 705
    .line 706
    if-eqz v9, :cond_15

    .line 707
    .line 708
    iget-object v0, p0, Lorg/eclipse/jetty/io/AbstractConnection;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 709
    .line 710
    invoke-interface {v0}, Lorg/eclipse/jetty/io/EndPoint;->shutdownOutput()V

    .line 711
    .line 712
    .line 713
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 714
    .line 715
    invoke-interface {v0, v3}, Lorg/eclipse/jetty/http/Generator;->setPersistent(Z)V

    .line 716
    .line 717
    .line 718
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 719
    .line 720
    invoke-interface {v0}, Lorg/eclipse/jetty/http/Generator;->isComplete()Z

    .line 721
    .line 722
    .line 723
    move-result v0

    .line 724
    if-nez v0, :cond_18

    .line 725
    .line 726
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_response:Lorg/eclipse/jetty/server/Response;

    .line 727
    .line 728
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/Response;->complete()V

    .line 729
    .line 730
    .line 731
    goto :goto_12

    .line 732
    :cond_15
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_response:Lorg/eclipse/jetty/server/Response;

    .line 733
    .line 734
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/Response;->isCommitted()Z

    .line 735
    .line 736
    .line 737
    move-result v0

    .line 738
    if-nez v0, :cond_16

    .line 739
    .line 740
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_request:Lorg/eclipse/jetty/server/Request;

    .line 741
    .line 742
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/Request;->isHandled()Z

    .line 743
    .line 744
    .line 745
    move-result v0

    .line 746
    if-nez v0, :cond_16

    .line 747
    .line 748
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_response:Lorg/eclipse/jetty/server/Response;

    .line 749
    .line 750
    invoke-virtual {v0, v1}, Lorg/eclipse/jetty/server/Response;->sendError(I)V

    .line 751
    .line 752
    .line 753
    :cond_16
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_response:Lorg/eclipse/jetty/server/Response;

    .line 754
    .line 755
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/Response;->complete()V

    .line 756
    .line 757
    .line 758
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 759
    .line 760
    invoke-interface {v0}, Lorg/eclipse/jetty/http/Generator;->isPersistent()Z

    .line 761
    .line 762
    .line 763
    move-result v0

    .line 764
    if-eqz v0, :cond_18

    .line 765
    .line 766
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_connector:Lorg/eclipse/jetty/server/Connector;

    .line 767
    .line 768
    iget-object v1, p0, Lorg/eclipse/jetty/io/AbstractConnection;->_endp:Lorg/eclipse/jetty/io/EndPoint;

    .line 769
    .line 770
    invoke-interface {v0, v1}, Lorg/eclipse/jetty/server/Connector;->persist(Lorg/eclipse/jetty/io/EndPoint;)V

    .line 771
    .line 772
    .line 773
    goto :goto_12

    .line 774
    :cond_17
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_response:Lorg/eclipse/jetty/server/Response;

    .line 775
    .line 776
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/Response;->complete()V

    .line 777
    .line 778
    .line 779
    :cond_18
    :goto_12
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_request:Lorg/eclipse/jetty/server/Request;

    .line 780
    .line 781
    invoke-virtual {p0, v2}, Lorg/eclipse/jetty/server/Request;->setHandled(Z)V

    .line 782
    .line 783
    .line 784
    :cond_19
    throw v6
.end method

.method public headerComplete()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_requests:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    add-int/2addr v0, v1

    .line 5
    iput v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_requests:I

    .line 6
    .line 7
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 8
    .line 9
    iget v2, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_version:I

    .line 10
    .line 11
    invoke-interface {v0, v2}, Lorg/eclipse/jetty/http/Generator;->setVersion(I)V

    .line 12
    .line 13
    .line 14
    iget v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_version:I

    .line 15
    .line 16
    const/16 v2, 0xa

    .line 17
    .line 18
    if-eq v0, v2, :cond_4

    .line 19
    .line 20
    const/16 v2, 0xb

    .line 21
    .line 22
    if-eq v0, v2, :cond_0

    .line 23
    .line 24
    goto/16 :goto_1

    .line 25
    .line 26
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 27
    .line 28
    iget-boolean v2, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_head:Z

    .line 29
    .line 30
    invoke-interface {v0, v2}, Lorg/eclipse/jetty/http/Generator;->setHead(Z)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_parser:Lorg/eclipse/jetty/http/Parser;

    .line 34
    .line 35
    invoke-interface {v0}, Lorg/eclipse/jetty/http/Parser;->isPersistent()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_1

    .line 40
    .line 41
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_responseFields:Lorg/eclipse/jetty/http/HttpFields;

    .line 42
    .line 43
    sget-object v2, Lorg/eclipse/jetty/http/HttpHeaders;->CONNECTION_BUFFER:Lorg/eclipse/jetty/io/Buffer;

    .line 44
    .line 45
    sget-object v3, Lorg/eclipse/jetty/http/HttpHeaderValues;->CLOSE_BUFFER:Lorg/eclipse/jetty/io/Buffer;

    .line 46
    .line 47
    invoke-virtual {v0, v2, v3}, Lorg/eclipse/jetty/http/HttpFields;->add(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 51
    .line 52
    const/4 v2, 0x0

    .line 53
    invoke-interface {v0, v2}, Lorg/eclipse/jetty/http/Generator;->setPersistent(Z)V

    .line 54
    .line 55
    .line 56
    :cond_1
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_server:Lorg/eclipse/jetty/server/Server;

    .line 57
    .line 58
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/Server;->getSendDateHeader()Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-eqz v0, :cond_2

    .line 63
    .line 64
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 65
    .line 66
    iget-object v2, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_request:Lorg/eclipse/jetty/server/Request;

    .line 67
    .line 68
    invoke-virtual {v2}, Lorg/eclipse/jetty/server/Request;->getTimeStampBuffer()Lorg/eclipse/jetty/io/Buffer;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    invoke-interface {v0, v2}, Lorg/eclipse/jetty/http/Generator;->setDate(Lorg/eclipse/jetty/io/Buffer;)V

    .line 73
    .line 74
    .line 75
    :cond_2
    iget-boolean v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_host:Z

    .line 76
    .line 77
    const/4 v2, 0x0

    .line 78
    if-nez v0, :cond_3

    .line 79
    .line 80
    sget-object v0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 81
    .line 82
    const-string v3, "!host {}"

    .line 83
    .line 84
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v4

    .line 88
    invoke-interface {v0, v3, v4}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 92
    .line 93
    const/16 v3, 0x190

    .line 94
    .line 95
    invoke-interface {v0, v3, v2}, Lorg/eclipse/jetty/http/Generator;->setResponse(ILjava/lang/String;)V

    .line 96
    .line 97
    .line 98
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_responseFields:Lorg/eclipse/jetty/http/HttpFields;

    .line 99
    .line 100
    sget-object v2, Lorg/eclipse/jetty/http/HttpHeaders;->CONNECTION_BUFFER:Lorg/eclipse/jetty/io/Buffer;

    .line 101
    .line 102
    sget-object v3, Lorg/eclipse/jetty/http/HttpHeaderValues;->CLOSE_BUFFER:Lorg/eclipse/jetty/io/Buffer;

    .line 103
    .line 104
    invoke-virtual {v0, v2, v3}, Lorg/eclipse/jetty/http/HttpFields;->put(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)V

    .line 105
    .line 106
    .line 107
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 108
    .line 109
    iget-object v2, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_responseFields:Lorg/eclipse/jetty/http/HttpFields;

    .line 110
    .line 111
    invoke-interface {v0, v2, v1}, Lorg/eclipse/jetty/http/Generator;->completeHeader(Lorg/eclipse/jetty/http/HttpFields;Z)V

    .line 112
    .line 113
    .line 114
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 115
    .line 116
    invoke-interface {p0}, Lorg/eclipse/jetty/http/Generator;->complete()V

    .line 117
    .line 118
    .line 119
    return-void

    .line 120
    :cond_3
    iget-boolean v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_expect:Z

    .line 121
    .line 122
    if-eqz v0, :cond_7

    .line 123
    .line 124
    sget-object v0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 125
    .line 126
    const-string v3, "!expectation {}"

    .line 127
    .line 128
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    move-result-object v4

    .line 132
    invoke-interface {v0, v3, v4}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 133
    .line 134
    .line 135
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 136
    .line 137
    const/16 v3, 0x1a1

    .line 138
    .line 139
    invoke-interface {v0, v3, v2}, Lorg/eclipse/jetty/http/Generator;->setResponse(ILjava/lang/String;)V

    .line 140
    .line 141
    .line 142
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_responseFields:Lorg/eclipse/jetty/http/HttpFields;

    .line 143
    .line 144
    sget-object v2, Lorg/eclipse/jetty/http/HttpHeaders;->CONNECTION_BUFFER:Lorg/eclipse/jetty/io/Buffer;

    .line 145
    .line 146
    sget-object v3, Lorg/eclipse/jetty/http/HttpHeaderValues;->CLOSE_BUFFER:Lorg/eclipse/jetty/io/Buffer;

    .line 147
    .line 148
    invoke-virtual {v0, v2, v3}, Lorg/eclipse/jetty/http/HttpFields;->put(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)V

    .line 149
    .line 150
    .line 151
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 152
    .line 153
    iget-object v2, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_responseFields:Lorg/eclipse/jetty/http/HttpFields;

    .line 154
    .line 155
    invoke-interface {v0, v2, v1}, Lorg/eclipse/jetty/http/Generator;->completeHeader(Lorg/eclipse/jetty/http/HttpFields;Z)V

    .line 156
    .line 157
    .line 158
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 159
    .line 160
    invoke-interface {p0}, Lorg/eclipse/jetty/http/Generator;->complete()V

    .line 161
    .line 162
    .line 163
    return-void

    .line 164
    :cond_4
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 165
    .line 166
    iget-boolean v2, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_head:Z

    .line 167
    .line 168
    invoke-interface {v0, v2}, Lorg/eclipse/jetty/http/Generator;->setHead(Z)V

    .line 169
    .line 170
    .line 171
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_parser:Lorg/eclipse/jetty/http/Parser;

    .line 172
    .line 173
    invoke-interface {v0}, Lorg/eclipse/jetty/http/Parser;->isPersistent()Z

    .line 174
    .line 175
    .line 176
    move-result v0

    .line 177
    if-eqz v0, :cond_5

    .line 178
    .line 179
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_responseFields:Lorg/eclipse/jetty/http/HttpFields;

    .line 180
    .line 181
    sget-object v2, Lorg/eclipse/jetty/http/HttpHeaders;->CONNECTION_BUFFER:Lorg/eclipse/jetty/io/Buffer;

    .line 182
    .line 183
    sget-object v3, Lorg/eclipse/jetty/http/HttpHeaderValues;->KEEP_ALIVE_BUFFER:Lorg/eclipse/jetty/io/Buffer;

    .line 184
    .line 185
    invoke-virtual {v0, v2, v3}, Lorg/eclipse/jetty/http/HttpFields;->add(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)V

    .line 186
    .line 187
    .line 188
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 189
    .line 190
    invoke-interface {v0, v1}, Lorg/eclipse/jetty/http/Generator;->setPersistent(Z)V

    .line 191
    .line 192
    .line 193
    goto :goto_0

    .line 194
    :cond_5
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_request:Lorg/eclipse/jetty/server/Request;

    .line 195
    .line 196
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/Request;->getMethod()Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    const-string v2, "CONNECT"

    .line 201
    .line 202
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 203
    .line 204
    .line 205
    move-result v0

    .line 206
    if-eqz v0, :cond_6

    .line 207
    .line 208
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 209
    .line 210
    invoke-interface {v0, v1}, Lorg/eclipse/jetty/http/Generator;->setPersistent(Z)V

    .line 211
    .line 212
    .line 213
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_parser:Lorg/eclipse/jetty/http/Parser;

    .line 214
    .line 215
    invoke-interface {v0, v1}, Lorg/eclipse/jetty/http/Parser;->setPersistent(Z)V

    .line 216
    .line 217
    .line 218
    :cond_6
    :goto_0
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_server:Lorg/eclipse/jetty/server/Server;

    .line 219
    .line 220
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/Server;->getSendDateHeader()Z

    .line 221
    .line 222
    .line 223
    move-result v0

    .line 224
    if-eqz v0, :cond_7

    .line 225
    .line 226
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 227
    .line 228
    iget-object v2, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_request:Lorg/eclipse/jetty/server/Request;

    .line 229
    .line 230
    invoke-virtual {v2}, Lorg/eclipse/jetty/server/Request;->getTimeStampBuffer()Lorg/eclipse/jetty/io/Buffer;

    .line 231
    .line 232
    .line 233
    move-result-object v2

    .line 234
    invoke-interface {v0, v2}, Lorg/eclipse/jetty/http/Generator;->setDate(Lorg/eclipse/jetty/io/Buffer;)V

    .line 235
    .line 236
    .line 237
    :cond_7
    :goto_1
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_charset:Ljava/lang/String;

    .line 238
    .line 239
    if-eqz v0, :cond_8

    .line 240
    .line 241
    iget-object v2, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_request:Lorg/eclipse/jetty/server/Request;

    .line 242
    .line 243
    invoke-virtual {v2, v0}, Lorg/eclipse/jetty/server/Request;->setCharacterEncodingUnchecked(Ljava/lang/String;)V

    .line 244
    .line 245
    .line 246
    :cond_8
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_parser:Lorg/eclipse/jetty/http/Parser;

    .line 247
    .line 248
    check-cast v0, Lorg/eclipse/jetty/http/HttpParser;

    .line 249
    .line 250
    invoke-virtual {v0}, Lorg/eclipse/jetty/http/HttpParser;->getContentLength()J

    .line 251
    .line 252
    .line 253
    move-result-wide v2

    .line 254
    const-wide/16 v4, 0x0

    .line 255
    .line 256
    cmp-long v0, v2, v4

    .line 257
    .line 258
    if-gtz v0, :cond_9

    .line 259
    .line 260
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_parser:Lorg/eclipse/jetty/http/Parser;

    .line 261
    .line 262
    check-cast v0, Lorg/eclipse/jetty/http/HttpParser;

    .line 263
    .line 264
    invoke-virtual {v0}, Lorg/eclipse/jetty/http/HttpParser;->isChunking()Z

    .line 265
    .line 266
    .line 267
    move-result v0

    .line 268
    if-eqz v0, :cond_a

    .line 269
    .line 270
    :cond_9
    iget-boolean v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_expect100Continue:Z

    .line 271
    .line 272
    if-eqz v0, :cond_b

    .line 273
    .line 274
    :cond_a
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->handleRequest()V

    .line 275
    .line 276
    .line 277
    return-void

    .line 278
    :cond_b
    iput-boolean v1, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_delayedHandling:Z

    .line 279
    .line 280
    return-void
.end method

.method public include()V
    .locals 1

    .line 1
    iget v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_include:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    iput v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_include:I

    .line 6
    .line 7
    return-void
.end method

.method public included()V
    .locals 1

    .line 1
    iget v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_include:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, -0x1

    .line 4
    .line 5
    iput v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_include:I

    .line 6
    .line 7
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_out:Lorg/eclipse/jetty/server/AbstractHttpConnection$Output;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_out:Lorg/eclipse/jetty/server/AbstractHttpConnection$Output;

    .line 12
    .line 13
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/HttpOutput;->reopen()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public isConfidential(Lorg/eclipse/jetty/server/Request;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_connector:Lorg/eclipse/jetty/server/Connector;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lorg/eclipse/jetty/server/Connector;->isConfidential(Lorg/eclipse/jetty/server/Request;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public isEarlyEOF()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_earlyEOF:Z

    .line 2
    .line 3
    return p0
.end method

.method public isExpecting100Continues()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_expect100Continue:Z

    .line 2
    .line 3
    return p0
.end method

.method public isExpecting102Processing()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_expect102Processing:Z

    .line 2
    .line 3
    return p0
.end method

.method public isIdle()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 2
    .line 3
    invoke-interface {v0}, Lorg/eclipse/jetty/http/Generator;->isIdle()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_parser:Lorg/eclipse/jetty/http/Parser;

    .line 10
    .line 11
    invoke-interface {v0}, Lorg/eclipse/jetty/http/Parser;->isIdle()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-boolean p0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_delayedHandling:Z

    .line 18
    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    :cond_0
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_1
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public isIncluding()Z
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_include:I

    .line 2
    .line 3
    if-lez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public isIntegral(Lorg/eclipse/jetty/server/Request;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_connector:Lorg/eclipse/jetty/server/Connector;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lorg/eclipse/jetty/server/Connector;->isIntegral(Lorg/eclipse/jetty/server/Request;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public isResponseCommitted()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 2
    .line 3
    invoke-interface {p0}, Lorg/eclipse/jetty/http/Generator;->isCommitted()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isSuspended()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_request:Lorg/eclipse/jetty/server/Request;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/Request;->getAsyncContinuation()Lorg/eclipse/jetty/server/AsyncContinuation;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AsyncContinuation;->isSuspended()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public messageComplete(J)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean p1, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_delayedHandling:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    iput-boolean p1, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_delayedHandling:Z

    .line 7
    .line 8
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->handleRequest()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public newHttpGenerator(Lorg/eclipse/jetty/io/Buffers;Lorg/eclipse/jetty/io/EndPoint;)Lorg/eclipse/jetty/http/HttpGenerator;
    .locals 0

    .line 1
    new-instance p0, Lorg/eclipse/jetty/http/HttpGenerator;

    .line 2
    .line 3
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jetty/http/HttpGenerator;-><init>(Lorg/eclipse/jetty/io/Buffers;Lorg/eclipse/jetty/io/EndPoint;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public newHttpParser(Lorg/eclipse/jetty/io/Buffers;Lorg/eclipse/jetty/io/EndPoint;Lorg/eclipse/jetty/http/HttpParser$EventHandler;)Lorg/eclipse/jetty/http/HttpParser;
    .locals 0

    .line 1
    new-instance p0, Lorg/eclipse/jetty/http/HttpParser;

    .line 2
    .line 3
    invoke-direct {p0, p1, p2, p3}, Lorg/eclipse/jetty/http/HttpParser;-><init>(Lorg/eclipse/jetty/io/Buffers;Lorg/eclipse/jetty/io/EndPoint;Lorg/eclipse/jetty/http/HttpParser$EventHandler;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public onClose()V
    .locals 2

    .line 1
    sget-object v0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 2
    .line 3
    const-string v1, "closed {}"

    .line 4
    .line 5
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {v0, v1, p0}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public parsedHeader(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lorg/eclipse/jetty/http/HttpHeaders;->CACHE:Lorg/eclipse/jetty/http/HttpHeaders;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lorg/eclipse/jetty/io/BufferCache;->getOrdinal(Lorg/eclipse/jetty/io/Buffer;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/16 v1, 0x10

    .line 8
    .line 9
    if-eq v0, v1, :cond_8

    .line 10
    .line 11
    const/16 v1, 0x15

    .line 12
    .line 13
    if-eq v0, v1, :cond_7

    .line 14
    .line 15
    const/16 v1, 0x18

    .line 16
    .line 17
    const/4 v2, 0x1

    .line 18
    if-eq v0, v1, :cond_1

    .line 19
    .line 20
    const/16 v1, 0x1b

    .line 21
    .line 22
    if-eq v0, v1, :cond_0

    .line 23
    .line 24
    const/16 v1, 0x28

    .line 25
    .line 26
    if-eq v0, v1, :cond_7

    .line 27
    .line 28
    goto/16 :goto_2

    .line 29
    .line 30
    :cond_0
    iput-boolean v2, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_host:Z

    .line 31
    .line 32
    goto/16 :goto_2

    .line 33
    .line 34
    :cond_1
    sget-object v0, Lorg/eclipse/jetty/http/HttpHeaderValues;->CACHE:Lorg/eclipse/jetty/http/HttpHeaderValues;

    .line 35
    .line 36
    invoke-virtual {v0, p2}, Lorg/eclipse/jetty/io/BufferCache;->lookup(Lorg/eclipse/jetty/io/Buffer;)Lorg/eclipse/jetty/io/Buffer;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    invoke-virtual {v0, p2}, Lorg/eclipse/jetty/io/BufferCache;->getOrdinal(Lorg/eclipse/jetty/io/Buffer;)I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    const/4 v1, 0x6

    .line 45
    if-eq v0, v1, :cond_6

    .line 46
    .line 47
    const/4 v3, 0x7

    .line 48
    if-eq v0, v3, :cond_5

    .line 49
    .line 50
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    const-string v4, ","

    .line 55
    .line 56
    invoke-virtual {v0, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    const/4 v4, 0x0

    .line 61
    :goto_0
    if-eqz v0, :cond_9

    .line 62
    .line 63
    array-length v5, v0

    .line 64
    if-ge v4, v5, :cond_9

    .line 65
    .line 66
    sget-object v5, Lorg/eclipse/jetty/http/HttpHeaderValues;->CACHE:Lorg/eclipse/jetty/http/HttpHeaderValues;

    .line 67
    .line 68
    aget-object v6, v0, v4

    .line 69
    .line 70
    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v6

    .line 74
    invoke-virtual {v5, v6}, Lorg/eclipse/jetty/io/BufferCache;->get(Ljava/lang/String;)Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 75
    .line 76
    .line 77
    move-result-object v5

    .line 78
    if-nez v5, :cond_2

    .line 79
    .line 80
    iput-boolean v2, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_expect:Z

    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_2
    invoke-virtual {v5}, Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;->getOrdinal()I

    .line 84
    .line 85
    .line 86
    move-result v5

    .line 87
    if-eq v5, v1, :cond_4

    .line 88
    .line 89
    if-eq v5, v3, :cond_3

    .line 90
    .line 91
    iput-boolean v2, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_expect:Z

    .line 92
    .line 93
    goto :goto_1

    .line 94
    :cond_3
    iget-object v5, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 95
    .line 96
    instance-of v5, v5, Lorg/eclipse/jetty/http/HttpGenerator;

    .line 97
    .line 98
    iput-boolean v5, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_expect102Processing:Z

    .line 99
    .line 100
    goto :goto_1

    .line 101
    :cond_4
    iget-object v5, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 102
    .line 103
    instance-of v5, v5, Lorg/eclipse/jetty/http/HttpGenerator;

    .line 104
    .line 105
    iput-boolean v5, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_expect100Continue:Z

    .line 106
    .line 107
    :goto_1
    add-int/lit8 v4, v4, 0x1

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :cond_5
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 111
    .line 112
    instance-of v0, v0, Lorg/eclipse/jetty/http/HttpGenerator;

    .line 113
    .line 114
    iput-boolean v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_expect102Processing:Z

    .line 115
    .line 116
    goto :goto_2

    .line 117
    :cond_6
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 118
    .line 119
    instance-of v0, v0, Lorg/eclipse/jetty/http/HttpGenerator;

    .line 120
    .line 121
    iput-boolean v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_expect100Continue:Z

    .line 122
    .line 123
    goto :goto_2

    .line 124
    :cond_7
    sget-object v0, Lorg/eclipse/jetty/http/HttpHeaderValues;->CACHE:Lorg/eclipse/jetty/http/HttpHeaderValues;

    .line 125
    .line 126
    invoke-virtual {v0, p2}, Lorg/eclipse/jetty/io/BufferCache;->lookup(Lorg/eclipse/jetty/io/Buffer;)Lorg/eclipse/jetty/io/Buffer;

    .line 127
    .line 128
    .line 129
    move-result-object p2

    .line 130
    goto :goto_2

    .line 131
    :cond_8
    sget-object v0, Lorg/eclipse/jetty/http/MimeTypes;->CACHE:Lorg/eclipse/jetty/io/BufferCache;

    .line 132
    .line 133
    invoke-virtual {v0, p2}, Lorg/eclipse/jetty/io/BufferCache;->lookup(Lorg/eclipse/jetty/io/Buffer;)Lorg/eclipse/jetty/io/Buffer;

    .line 134
    .line 135
    .line 136
    move-result-object p2

    .line 137
    invoke-static {p2}, Lorg/eclipse/jetty/http/MimeTypes;->getCharsetFromContentType(Lorg/eclipse/jetty/io/Buffer;)Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    iput-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_charset:Ljava/lang/String;

    .line 142
    .line 143
    :cond_9
    :goto_2
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_requestFields:Lorg/eclipse/jetty/http/HttpFields;

    .line 144
    .line 145
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jetty/http/HttpFields;->add(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)V

    .line 146
    .line 147
    .line 148
    return-void
.end method

.method public reset()V
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_parser:Lorg/eclipse/jetty/http/Parser;

    .line 2
    .line 3
    invoke-interface {v0}, Lorg/eclipse/jetty/http/Parser;->reset()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_parser:Lorg/eclipse/jetty/http/Parser;

    .line 7
    .line 8
    invoke-interface {v0}, Lorg/eclipse/jetty/http/Parser;->returnBuffers()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_requestFields:Lorg/eclipse/jetty/http/HttpFields;

    .line 12
    .line 13
    invoke-virtual {v0}, Lorg/eclipse/jetty/http/HttpFields;->clear()V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_request:Lorg/eclipse/jetty/server/Request;

    .line 17
    .line 18
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/Request;->recycle()V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 22
    .line 23
    invoke-interface {v0}, Lorg/eclipse/jetty/http/Generator;->reset()V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 27
    .line 28
    invoke-interface {v0}, Lorg/eclipse/jetty/http/Generator;->returnBuffers()V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_responseFields:Lorg/eclipse/jetty/http/HttpFields;

    .line 32
    .line 33
    invoke-virtual {v0}, Lorg/eclipse/jetty/http/HttpFields;->clear()V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_response:Lorg/eclipse/jetty/server/Response;

    .line 37
    .line 38
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/Response;->recycle()V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_uri:Lorg/eclipse/jetty/http/HttpURI;

    .line 42
    .line 43
    invoke-virtual {v0}, Lorg/eclipse/jetty/http/HttpURI;->clear()V

    .line 44
    .line 45
    .line 46
    const/4 v0, 0x0

    .line 47
    iput-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_writer:Lorg/eclipse/jetty/server/AbstractHttpConnection$OutputWriter;

    .line 48
    .line 49
    const/4 v0, 0x0

    .line 50
    iput-boolean v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_earlyEOF:Z

    .line 51
    .line 52
    return-void
.end method

.method public setAssociatedObject(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_associatedObject:Ljava/lang/Object;

    .line 2
    .line 3
    return-void
.end method

.method public startRequest(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-interface {p2}, Lorg/eclipse/jetty/io/Buffer;->asImmutableBuffer()Lorg/eclipse/jetty/io/Buffer;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_host:Z

    .line 7
    .line 8
    iput-boolean v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_expect:Z

    .line 9
    .line 10
    iput-boolean v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_expect100Continue:Z

    .line 11
    .line 12
    iput-boolean v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_expect102Processing:Z

    .line 13
    .line 14
    iput-boolean v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_delayedHandling:Z

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    iput-object v1, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_charset:Ljava/lang/String;

    .line 18
    .line 19
    iget-object v2, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_request:Lorg/eclipse/jetty/server/Request;

    .line 20
    .line 21
    invoke-virtual {v2}, Lorg/eclipse/jetty/server/Request;->getTimeStamp()J

    .line 22
    .line 23
    .line 24
    move-result-wide v2

    .line 25
    const-wide/16 v4, 0x0

    .line 26
    .line 27
    cmp-long v2, v2, v4

    .line 28
    .line 29
    if-nez v2, :cond_0

    .line 30
    .line 31
    iget-object v2, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_request:Lorg/eclipse/jetty/server/Request;

    .line 32
    .line 33
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 34
    .line 35
    .line 36
    move-result-wide v3

    .line 37
    invoke-virtual {v2, v3, v4}, Lorg/eclipse/jetty/server/Request;->setTimeStamp(J)V

    .line 38
    .line 39
    .line 40
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_request:Lorg/eclipse/jetty/server/Request;

    .line 41
    .line 42
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    invoke-virtual {v2, v3}, Lorg/eclipse/jetty/server/Request;->setMethod(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    const/16 v2, 0x190

    .line 50
    .line 51
    :try_start_0
    iput-boolean v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_head:Z

    .line 52
    .line 53
    sget-object v0, Lorg/eclipse/jetty/http/HttpMethods;->CACHE:Lorg/eclipse/jetty/io/BufferCache;

    .line 54
    .line 55
    invoke-virtual {v0, p1}, Lorg/eclipse/jetty/io/BufferCache;->getOrdinal(Lorg/eclipse/jetty/io/Buffer;)I

    .line 56
    .line 57
    .line 58
    move-result p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 59
    const/4 v0, 0x3

    .line 60
    if-eq p1, v0, :cond_2

    .line 61
    .line 62
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_uri:Lorg/eclipse/jetty/http/HttpURI;

    .line 63
    .line 64
    const/16 v3, 0x8

    .line 65
    .line 66
    if-eq p1, v3, :cond_1

    .line 67
    .line 68
    :try_start_1
    invoke-interface {p2}, Lorg/eclipse/jetty/io/Buffer;->array()[B

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-interface {p2}, Lorg/eclipse/jetty/io/Buffer;->getIndex()I

    .line 73
    .line 74
    .line 75
    move-result v3

    .line 76
    invoke-interface {p2}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 77
    .line 78
    .line 79
    move-result p2

    .line 80
    invoke-virtual {v0, p1, v3, p2}, Lorg/eclipse/jetty/http/HttpURI;->parse([BII)V

    .line 81
    .line 82
    .line 83
    goto :goto_0

    .line 84
    :catch_0
    move-exception p0

    .line 85
    goto :goto_1

    .line 86
    :cond_1
    invoke-interface {p2}, Lorg/eclipse/jetty/io/Buffer;->array()[B

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    invoke-interface {p2}, Lorg/eclipse/jetty/io/Buffer;->getIndex()I

    .line 91
    .line 92
    .line 93
    move-result v3

    .line 94
    invoke-interface {p2}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 95
    .line 96
    .line 97
    move-result p2

    .line 98
    invoke-virtual {v0, p1, v3, p2}, Lorg/eclipse/jetty/http/HttpURI;->parseConnect([BII)V

    .line 99
    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_2
    const/4 p1, 0x1

    .line 103
    iput-boolean p1, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_head:Z

    .line 104
    .line 105
    iget-object p1, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_uri:Lorg/eclipse/jetty/http/HttpURI;

    .line 106
    .line 107
    invoke-interface {p2}, Lorg/eclipse/jetty/io/Buffer;->array()[B

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    invoke-interface {p2}, Lorg/eclipse/jetty/io/Buffer;->getIndex()I

    .line 112
    .line 113
    .line 114
    move-result v3

    .line 115
    invoke-interface {p2}, Lorg/eclipse/jetty/io/Buffer;->length()I

    .line 116
    .line 117
    .line 118
    move-result p2

    .line 119
    invoke-virtual {p1, v0, v3, p2}, Lorg/eclipse/jetty/http/HttpURI;->parse([BII)V

    .line 120
    .line 121
    .line 122
    :goto_0
    iget-object p1, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_request:Lorg/eclipse/jetty/server/Request;

    .line 123
    .line 124
    iget-object p2, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_uri:Lorg/eclipse/jetty/http/HttpURI;

    .line 125
    .line 126
    invoke-virtual {p1, p2}, Lorg/eclipse/jetty/server/Request;->setUri(Lorg/eclipse/jetty/http/HttpURI;)V

    .line 127
    .line 128
    .line 129
    if-nez p3, :cond_3

    .line 130
    .line 131
    iget-object p1, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_request:Lorg/eclipse/jetty/server/Request;

    .line 132
    .line 133
    const-string p2, ""

    .line 134
    .line 135
    invoke-virtual {p1, p2}, Lorg/eclipse/jetty/server/Request;->setProtocol(Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    const/16 p1, 0x9

    .line 139
    .line 140
    iput p1, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_version:I

    .line 141
    .line 142
    return-void

    .line 143
    :cond_3
    sget-object p1, Lorg/eclipse/jetty/http/HttpVersions;->CACHE:Lorg/eclipse/jetty/io/BufferCache;

    .line 144
    .line 145
    invoke-virtual {p1, p3}, Lorg/eclipse/jetty/io/BufferCache;->get(Lorg/eclipse/jetty/io/Buffer;)Lorg/eclipse/jetty/io/BufferCache$CachedBuffer;

    .line 146
    .line 147
    .line 148
    move-result-object p2

    .line 149
    if-eqz p2, :cond_5

    .line 150
    .line 151
    invoke-virtual {p1, p2}, Lorg/eclipse/jetty/io/BufferCache;->getOrdinal(Lorg/eclipse/jetty/io/Buffer;)I

    .line 152
    .line 153
    .line 154
    move-result p1

    .line 155
    iput p1, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_version:I

    .line 156
    .line 157
    if-gtz p1, :cond_4

    .line 158
    .line 159
    const/16 p1, 0xa

    .line 160
    .line 161
    iput p1, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_version:I

    .line 162
    .line 163
    :cond_4
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_request:Lorg/eclipse/jetty/server/Request;

    .line 164
    .line 165
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object p1

    .line 169
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/server/Request;->setProtocol(Ljava/lang/String;)V

    .line 170
    .line 171
    .line 172
    return-void

    .line 173
    :cond_5
    new-instance p0, Lorg/eclipse/jetty/http/HttpException;

    .line 174
    .line 175
    invoke-direct {p0, v2, v1}, Lorg/eclipse/jetty/http/HttpException;-><init>(ILjava/lang/String;)V

    .line 176
    .line 177
    .line 178
    throw p0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 179
    :goto_1
    sget-object p1, Lorg/eclipse/jetty/server/AbstractHttpConnection;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 180
    .line 181
    invoke-interface {p1, p0}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/Throwable;)V

    .line 182
    .line 183
    .line 184
    instance-of p1, p0, Lorg/eclipse/jetty/http/HttpException;

    .line 185
    .line 186
    if-eqz p1, :cond_6

    .line 187
    .line 188
    check-cast p0, Lorg/eclipse/jetty/http/HttpException;

    .line 189
    .line 190
    throw p0

    .line 191
    :cond_6
    new-instance p1, Lorg/eclipse/jetty/http/HttpException;

    .line 192
    .line 193
    invoke-direct {p1, v2, v1, p0}, Lorg/eclipse/jetty/http/HttpException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    .line 194
    .line 195
    .line 196
    throw p1
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    invoke-super {p0}, Lorg/eclipse/jetty/io/AbstractConnection;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_generator:Lorg/eclipse/jetty/http/Generator;

    .line 6
    .line 7
    iget-object v2, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_parser:Lorg/eclipse/jetty/http/Parser;

    .line 8
    .line 9
    iget p0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection;->_requests:I

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    filled-new-array {v0, v1, v2, p0}, [Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const-string v0, "%s,g=%s,p=%s,r=%d"

    .line 20
    .line 21
    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method
