.class public Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;
.super Ll/p21;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jetty/server/AsyncContinuation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "AsyncEventState"
.end annotation


# instance fields
.field private _dispatchContext:Ll/ase0;

.field private _pathInContext:Ljava/lang/String;

.field private final _suspendedContext:Ll/ase0;

.field private _timeout:Lorg/eclipse/jetty/util/thread/Timeout$Task;

.field final synthetic this$0:Lorg/eclipse/jetty/server/AsyncContinuation;


# direct methods
.method public constructor <init>(Lorg/eclipse/jetty/server/AsyncContinuation;Ll/ase0;Ll/gse0;Ll/lse0;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;->this$0:Lorg/eclipse/jetty/server/AsyncContinuation;

    .line 2
    .line 3
    invoke-direct {p0, p1, p3, p4}, Ll/p21;-><init>(Ll/o21;Ll/gse0;Ll/lse0;)V

    .line 4
    .line 5
    .line 6
    new-instance p3, Lorg/eclipse/jetty/server/AsyncContinuation$AsyncTimeout;

    .line 7
    .line 8
    invoke-direct {p3, p1}, Lorg/eclipse/jetty/server/AsyncContinuation$AsyncTimeout;-><init>(Lorg/eclipse/jetty/server/AsyncContinuation;)V

    .line 9
    .line 10
    .line 11
    iput-object p3, p0, Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;->_timeout:Lorg/eclipse/jetty/util/thread/Timeout$Task;

    .line 12
    .line 13
    iput-object p2, p0, Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;->_suspendedContext:Ll/ase0;

    .line 14
    .line 15
    iget-object p0, p1, Lorg/eclipse/jetty/server/AsyncContinuation;->_connection:Lorg/eclipse/jetty/server/AbstractHttpConnection;

    .line 16
    .line 17
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->getRequest()Lorg/eclipse/jetty/server/Request;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string p1, "javax.servlet.async.request_uri"

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/server/Request;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    if-nez p2, :cond_1

    .line 28
    .line 29
    const-string p2, "javax.servlet.forward.request_uri"

    .line 30
    .line 31
    invoke-virtual {p0, p2}, Lorg/eclipse/jetty/server/Request;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    check-cast p2, Ljava/lang/String;

    .line 36
    .line 37
    const-string p3, "javax.servlet.async.query_string"

    .line 38
    .line 39
    const-string p4, "javax.servlet.async.path_info"

    .line 40
    .line 41
    const-string v0, "javax.servlet.async.servlet_path"

    .line 42
    .line 43
    const-string v1, "javax.servlet.async.context_path"

    .line 44
    .line 45
    if-eqz p2, :cond_0

    .line 46
    .line 47
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jetty/server/Request;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    const-string p1, "javax.servlet.forward.context_path"

    .line 51
    .line 52
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/server/Request;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p0, v1, p1}, Lorg/eclipse/jetty/server/Request;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 57
    .line 58
    .line 59
    const-string p1, "javax.servlet.forward.servlet_path"

    .line 60
    .line 61
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/server/Request;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-virtual {p0, v0, p1}, Lorg/eclipse/jetty/server/Request;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 66
    .line 67
    .line 68
    const-string p1, "javax.servlet.forward.path_info"

    .line 69
    .line 70
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/server/Request;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-virtual {p0, p4, p1}, Lorg/eclipse/jetty/server/Request;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 75
    .line 76
    .line 77
    const-string p1, "javax.servlet.forward.query_string"

    .line 78
    .line 79
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/server/Request;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-virtual {p0, p3, p1}, Lorg/eclipse/jetty/server/Request;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/Request;->getRequestURI()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p2

    .line 91
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jetty/server/Request;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/Request;->getContextPath()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    invoke-virtual {p0, v1, p1}, Lorg/eclipse/jetty/server/Request;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/Request;->getServletPath()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    invoke-virtual {p0, v0, p1}, Lorg/eclipse/jetty/server/Request;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/Request;->getPathInfo()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    invoke-virtual {p0, p4, p1}, Lorg/eclipse/jetty/server/Request;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/Request;->getQueryString()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    invoke-virtual {p0, p3, p1}, Lorg/eclipse/jetty/server/Request;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 120
    .line 121
    .line 122
    :cond_1
    return-void
.end method

.method public static synthetic access$002(Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;Ll/ase0;)Ll/ase0;
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;->_dispatchContext:Ll/ase0;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$102(Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;->_pathInContext:Ljava/lang/String;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$200(Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;)Lorg/eclipse/jetty/util/thread/Timeout$Task;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;->_timeout:Lorg/eclipse/jetty/util/thread/Timeout$Task;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public getDispatchContext()Ll/ase0;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;->_dispatchContext:Ll/ase0;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPath()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;->_pathInContext:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getServletContext()Ll/ase0;
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;->_dispatchContext:Ll/ase0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;->_suspendedContext:Ll/ase0;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    return-object v0
.end method

.method public getSuspendedContext()Ll/ase0;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;->_suspendedContext:Ll/ase0;

    .line 2
    .line 3
    return-object p0
.end method
