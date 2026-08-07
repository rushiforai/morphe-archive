.class public Lorg/eclipse/jetty/server/handler/ShutdownHandler;
.super Lorg/eclipse/jetty/server/handler/AbstractHandler;
.source "SourceFile"


# static fields
.field private static final LOG:Lorg/eclipse/jetty/util/log/Logger;


# instance fields
.field private _exitJvm:Z

.field private final _server:Lorg/eclipse/jetty/server/Server;

.field private final _shutdownToken:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-class v0, Lorg/eclipse/jetty/server/handler/ShutdownHandler;

    .line 2
    .line 3
    invoke-static {v0}, Lorg/eclipse/jetty/util/log/Log;->getLogger(Ljava/lang/Class;)Lorg/eclipse/jetty/util/log/Logger;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lorg/eclipse/jetty/server/handler/ShutdownHandler;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jetty/server/Server;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lorg/eclipse/jetty/server/handler/AbstractHandler;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lorg/eclipse/jetty/server/handler/ShutdownHandler;->_exitJvm:Z

    .line 6
    .line 7
    iput-object p1, p0, Lorg/eclipse/jetty/server/handler/ShutdownHandler;->_server:Lorg/eclipse/jetty/server/Server;

    .line 8
    .line 9
    iput-object p2, p0, Lorg/eclipse/jetty/server/handler/ShutdownHandler;->_shutdownToken:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic access$000(Lorg/eclipse/jetty/server/handler/ShutdownHandler;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lorg/eclipse/jetty/server/handler/ShutdownHandler;->shutdownServer()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$100()Lorg/eclipse/jetty/util/log/Logger;
    .locals 1

    .line 1
    sget-object v0, Lorg/eclipse/jetty/server/handler/ShutdownHandler;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 2
    .line 3
    return-object v0
.end method

.method private hasCorrectSecurityToken(Ljavax/servlet/http/HttpServletRequest;)Z
    .locals 1

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/ShutdownHandler;->_shutdownToken:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "token"

    .line 4
    .line 5
    invoke-interface {p1, v0}, Ll/gse0;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method private requestFromLocalhost(Ljavax/servlet/http/HttpServletRequest;)Z
    .locals 1

    .line 1
    const-string v0, "127.0.0.1"

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/server/handler/ShutdownHandler;->getRemoteAddr(Ljavax/servlet/http/HttpServletRequest;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method private shutdownServer()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/server/handler/ShutdownHandler;->_server:Lorg/eclipse/jetty/server/Server;

    .line 2
    .line 3
    invoke-virtual {v0}, Lorg/eclipse/jetty/util/component/AbstractLifeCycle;->stop()V

    .line 4
    .line 5
    .line 6
    iget-boolean p0, p0, Lorg/eclipse/jetty/server/handler/ShutdownHandler;->_exitJvm:Z

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    invoke-static {p0}, Ljava/lang/System;->exit(I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method


# virtual methods
.method public getRemoteAddr(Ljavax/servlet/http/HttpServletRequest;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-interface {p1}, Ll/gse0;->getRemoteAddr()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public handle(Ljava/lang/String;Lorg/eclipse/jetty/server/Request;Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljavax/servlet/ServletException;
        }
    .end annotation

    .line 1
    const-string p2, "/shutdown"

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-interface {p3}, Ljavax/servlet/http/HttpServletRequest;->getMethod()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    const-string p2, "POST"

    .line 15
    .line 16
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-nez p1, :cond_1

    .line 21
    .line 22
    const/16 p0, 0x190

    .line 23
    .line 24
    invoke-interface {p4, p0}, Ljavax/servlet/http/HttpServletResponse;->sendError(I)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    invoke-direct {p0, p3}, Lorg/eclipse/jetty/server/handler/ShutdownHandler;->hasCorrectSecurityToken(Ljavax/servlet/http/HttpServletRequest;)Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    const/16 p2, 0x191

    .line 33
    .line 34
    const-string v0, "Unauthorized shutdown attempt from "

    .line 35
    .line 36
    const/4 v1, 0x0

    .line 37
    if-nez p1, :cond_2

    .line 38
    .line 39
    sget-object p1, Lorg/eclipse/jetty/server/handler/ShutdownHandler;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 40
    .line 41
    new-instance v2, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0, p3}, Lorg/eclipse/jetty/server/handler/ShutdownHandler;->getRemoteAddr(Ljavax/servlet/http/HttpServletRequest;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    new-array p3, v1, [Ljava/lang/Object;

    .line 58
    .line 59
    invoke-interface {p1, p0, p3}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    invoke-interface {p4, p2}, Ljavax/servlet/http/HttpServletResponse;->sendError(I)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_2
    invoke-direct {p0, p3}, Lorg/eclipse/jetty/server/handler/ShutdownHandler;->requestFromLocalhost(Ljavax/servlet/http/HttpServletRequest;)Z

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    if-nez p1, :cond_3

    .line 71
    .line 72
    sget-object p1, Lorg/eclipse/jetty/server/handler/ShutdownHandler;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 73
    .line 74
    new-instance v2, Ljava/lang/StringBuilder;

    .line 75
    .line 76
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p0, p3}, Lorg/eclipse/jetty/server/handler/ShutdownHandler;->getRemoteAddr(Ljavax/servlet/http/HttpServletRequest;)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    new-array p3, v1, [Ljava/lang/Object;

    .line 91
    .line 92
    invoke-interface {p1, p0, p3}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 93
    .line 94
    .line 95
    invoke-interface {p4, p2}, Ljavax/servlet/http/HttpServletResponse;->sendError(I)V

    .line 96
    .line 97
    .line 98
    return-void

    .line 99
    :cond_3
    sget-object p1, Lorg/eclipse/jetty/server/handler/ShutdownHandler;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 100
    .line 101
    new-instance p2, Ljava/lang/StringBuilder;

    .line 102
    .line 103
    const-string p4, "Shutting down by request from "

    .line 104
    .line 105
    invoke-direct {p2, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {p0, p3}, Lorg/eclipse/jetty/server/handler/ShutdownHandler;->getRemoteAddr(Ljavax/servlet/http/HttpServletRequest;)Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object p3

    .line 112
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p2

    .line 119
    new-array p3, v1, [Ljava/lang/Object;

    .line 120
    .line 121
    invoke-interface {p1, p2, p3}, Lorg/eclipse/jetty/util/log/Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 122
    .line 123
    .line 124
    new-instance p1, Lorg/eclipse/jetty/server/handler/ShutdownHandler$1;

    .line 125
    .line 126
    invoke-direct {p1, p0}, Lorg/eclipse/jetty/server/handler/ShutdownHandler$1;-><init>(Lorg/eclipse/jetty/server/handler/ShutdownHandler;)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 130
    .line 131
    .line 132
    return-void
.end method

.method public setExitJvm(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lorg/eclipse/jetty/server/handler/ShutdownHandler;->_exitJvm:Z

    .line 2
    .line 3
    return-void
.end method
