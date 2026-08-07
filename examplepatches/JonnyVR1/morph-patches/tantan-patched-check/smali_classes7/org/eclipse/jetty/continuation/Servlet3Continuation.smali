.class public Lorg/eclipse/jetty/continuation/Servlet3Continuation;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/eclipse/jetty/continuation/Continuation;


# static fields
.field private static final __exception:Lorg/eclipse/jetty/continuation/ContinuationThrowable;


# instance fields
.field private _context:Ll/o21;

.field private volatile _expired:Z

.field private volatile _initial:Z

.field private _listeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/r21;",
            ">;"
        }
    .end annotation
.end field

.field private final _request:Ll/gse0;

.field private _response:Ll/lse0;

.field private volatile _responseWrapped:Z

.field private volatile _resumed:Z

.field private _timeoutMs:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lorg/eclipse/jetty/continuation/ContinuationThrowable;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/eclipse/jetty/continuation/ContinuationThrowable;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lorg/eclipse/jetty/continuation/Servlet3Continuation;->__exception:Lorg/eclipse/jetty/continuation/ContinuationThrowable;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Ll/gse0;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lorg/eclipse/jetty/continuation/Servlet3Continuation;->_listeners:Ljava/util/List;

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    iput-boolean v0, p0, Lorg/eclipse/jetty/continuation/Servlet3Continuation;->_initial:Z

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-boolean v0, p0, Lorg/eclipse/jetty/continuation/Servlet3Continuation;->_resumed:Z

    .line 16
    .line 17
    iput-boolean v0, p0, Lorg/eclipse/jetty/continuation/Servlet3Continuation;->_expired:Z

    .line 18
    .line 19
    iput-boolean v0, p0, Lorg/eclipse/jetty/continuation/Servlet3Continuation;->_responseWrapped:Z

    .line 20
    .line 21
    const-wide/16 v0, -0x1

    .line 22
    .line 23
    iput-wide v0, p0, Lorg/eclipse/jetty/continuation/Servlet3Continuation;->_timeoutMs:J

    .line 24
    .line 25
    iput-object p1, p0, Lorg/eclipse/jetty/continuation/Servlet3Continuation;->_request:Ll/gse0;

    .line 26
    .line 27
    iget-object p1, p0, Lorg/eclipse/jetty/continuation/Servlet3Continuation;->_listeners:Ljava/util/List;

    .line 28
    .line 29
    new-instance v0, Lorg/eclipse/jetty/continuation/Servlet3Continuation$1;

    .line 30
    .line 31
    invoke-direct {v0, p0}, Lorg/eclipse/jetty/continuation/Servlet3Continuation$1;-><init>(Lorg/eclipse/jetty/continuation/Servlet3Continuation;)V

    .line 32
    .line 33
    .line 34
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public static synthetic access$002(Lorg/eclipse/jetty/continuation/Servlet3Continuation;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lorg/eclipse/jetty/continuation/Servlet3Continuation;->_initial:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$102(Lorg/eclipse/jetty/continuation/Servlet3Continuation;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lorg/eclipse/jetty/continuation/Servlet3Continuation;->_expired:Z

    .line 2
    .line 3
    return p1
.end method


# virtual methods
.method public addContinuationListener(Lorg/eclipse/jetty/continuation/ContinuationListener;)V
    .locals 1

    .line 1
    new-instance v0, Lorg/eclipse/jetty/continuation/Servlet3Continuation$2;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lorg/eclipse/jetty/continuation/Servlet3Continuation$2;-><init>(Lorg/eclipse/jetty/continuation/Servlet3Continuation;Lorg/eclipse/jetty/continuation/ContinuationListener;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lorg/eclipse/jetty/continuation/Servlet3Continuation;->_context:Ll/o21;

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    invoke-interface {p1, v0}, Ll/o21;->addListener(Ll/r21;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object p0, p0, Lorg/eclipse/jetty/continuation/Servlet3Continuation;->_listeners:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public complete()V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/continuation/Servlet3Continuation;->_context:Ll/o21;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/o21;->complete()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-static {}, Ll/wpg0;->a()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public getAttribute(Ljava/lang/String;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/continuation/Servlet3Continuation;->_request:Ll/gse0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/gse0;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getServletResponse()Ll/lse0;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/continuation/Servlet3Continuation;->_response:Ll/lse0;

    .line 2
    .line 3
    return-object p0
.end method

.method public isExpired()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/continuation/Servlet3Continuation;->_expired:Z

    .line 2
    .line 3
    return p0
.end method

.method public isInitial()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lorg/eclipse/jetty/continuation/Servlet3Continuation;->_initial:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lorg/eclipse/jetty/continuation/Servlet3Continuation;->_request:Ll/gse0;

    .line 6
    .line 7
    invoke-interface {p0}, Ll/gse0;->getDispatcherType()Ljavax/servlet/DispatcherType;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget-object v0, Ljavax/servlet/DispatcherType;->ASYNC:Ljavax/servlet/DispatcherType;

    .line 12
    .line 13
    if-eq p0, v0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public isResponseWrapped()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/continuation/Servlet3Continuation;->_responseWrapped:Z

    .line 2
    .line 3
    return p0
.end method

.method public isResumed()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/continuation/Servlet3Continuation;->_resumed:Z

    .line 2
    .line 3
    return p0
.end method

.method public isSuspended()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/continuation/Servlet3Continuation;->_request:Ll/gse0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/gse0;->isAsyncStarted()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public keepWrappers()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lorg/eclipse/jetty/continuation/Servlet3Continuation;->_responseWrapped:Z

    .line 3
    .line 4
    return-void
.end method

.method public removeAttribute(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/continuation/Servlet3Continuation;->_request:Ll/gse0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/gse0;->removeAttribute(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public resume()V
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/continuation/Servlet3Continuation;->_context:Ll/o21;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Lorg/eclipse/jetty/continuation/Servlet3Continuation;->_resumed:Z

    .line 7
    .line 8
    iget-object p0, p0, Lorg/eclipse/jetty/continuation/Servlet3Continuation;->_context:Ll/o21;

    .line 9
    .line 10
    invoke-interface {p0}, Ll/o21;->dispatch()V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-static {}, Ll/wpg0;->a()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public setAttribute(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/continuation/Servlet3Continuation;->_request:Ll/gse0;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Ll/gse0;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setTimeout(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lorg/eclipse/jetty/continuation/Servlet3Continuation;->_timeoutMs:J

    .line 2
    .line 3
    iget-object p0, p0, Lorg/eclipse/jetty/continuation/Servlet3Continuation;->_context:Ll/o21;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1, p2}, Ll/o21;->setTimeout(J)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public suspend()V
    .locals 3

    const/4 v0, 0x0

    .line 55
    iput-boolean v0, p0, Lorg/eclipse/jetty/continuation/Servlet3Continuation;->_resumed:Z

    .line 56
    iput-boolean v0, p0, Lorg/eclipse/jetty/continuation/Servlet3Continuation;->_expired:Z

    .line 57
    iget-object v0, p0, Lorg/eclipse/jetty/continuation/Servlet3Continuation;->_request:Ll/gse0;

    invoke-interface {v0}, Ll/gse0;->startAsync()Ll/o21;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jetty/continuation/Servlet3Continuation;->_context:Ll/o21;

    .line 58
    iget-wide v1, p0, Lorg/eclipse/jetty/continuation/Servlet3Continuation;->_timeoutMs:J

    invoke-interface {v0, v1, v2}, Ll/o21;->setTimeout(J)V

    .line 59
    iget-object v0, p0, Lorg/eclipse/jetty/continuation/Servlet3Continuation;->_listeners:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ll/r21;

    .line 60
    iget-object v2, p0, Lorg/eclipse/jetty/continuation/Servlet3Continuation;->_context:Ll/o21;

    invoke-interface {v2, v1}, Ll/o21;->addListener(Ll/r21;)V

    goto :goto_0

    .line 61
    :cond_0
    iget-object p0, p0, Lorg/eclipse/jetty/continuation/Servlet3Continuation;->_listeners:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->clear()V

    return-void
.end method

.method public suspend(Ll/lse0;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/continuation/Servlet3Continuation;->_response:Ll/lse0;

    .line 2
    .line 3
    instance-of p1, p1, Ll/mse0;

    .line 4
    .line 5
    iput-boolean p1, p0, Lorg/eclipse/jetty/continuation/Servlet3Continuation;->_responseWrapped:Z

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput-boolean p1, p0, Lorg/eclipse/jetty/continuation/Servlet3Continuation;->_resumed:Z

    .line 9
    .line 10
    iput-boolean p1, p0, Lorg/eclipse/jetty/continuation/Servlet3Continuation;->_expired:Z

    .line 11
    .line 12
    iget-object p1, p0, Lorg/eclipse/jetty/continuation/Servlet3Continuation;->_request:Ll/gse0;

    .line 13
    .line 14
    invoke-interface {p1}, Ll/gse0;->startAsync()Ll/o21;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, p0, Lorg/eclipse/jetty/continuation/Servlet3Continuation;->_context:Ll/o21;

    .line 19
    .line 20
    iget-wide v0, p0, Lorg/eclipse/jetty/continuation/Servlet3Continuation;->_timeoutMs:J

    .line 21
    .line 22
    invoke-interface {p1, v0, v1}, Ll/o21;->setTimeout(J)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Lorg/eclipse/jetty/continuation/Servlet3Continuation;->_listeners:Ljava/util/List;

    .line 26
    .line 27
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Ll/r21;

    .line 42
    .line 43
    iget-object v1, p0, Lorg/eclipse/jetty/continuation/Servlet3Continuation;->_context:Ll/o21;

    .line 44
    .line 45
    invoke-interface {v1, v0}, Ll/o21;->addListener(Ll/r21;)V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    iget-object p0, p0, Lorg/eclipse/jetty/continuation/Servlet3Continuation;->_listeners:Ljava/util/List;

    .line 50
    .line 51
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public undispatch()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/continuation/Servlet3Continuation;->isSuspended()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    sget-boolean p0, Lorg/eclipse/jetty/continuation/ContinuationFilter;->__debug:Z

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    new-instance p0, Lorg/eclipse/jetty/continuation/ContinuationThrowable;

    .line 12
    .line 13
    invoke-direct {p0}, Lorg/eclipse/jetty/continuation/ContinuationThrowable;-><init>()V

    .line 14
    .line 15
    .line 16
    throw p0

    .line 17
    :cond_0
    sget-object p0, Lorg/eclipse/jetty/continuation/Servlet3Continuation;->__exception:Lorg/eclipse/jetty/continuation/ContinuationThrowable;

    .line 18
    .line 19
    throw p0

    .line 20
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 21
    .line 22
    const-string v0, "!suspended"

    .line 23
    .line 24
    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    throw p0
.end method
