.class public Lorg/eclipse/jetty/server/session/jmx/AbstractSessionManagerMBean;
.super Lorg/eclipse/jetty/server/handler/jmx/AbstractHandlerMBean;
.source "SourceFile"


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lorg/eclipse/jetty/server/handler/jmx/AbstractHandlerMBean;-><init>(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getObjectContextBasis()Ljava/lang/String;
    .locals 3

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/server/session/jmx/AbstractSessionManagerMBean;->_managed:Ljava/lang/Object;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lorg/eclipse/jetty/server/session/jmx/AbstractSessionManagerMBean;->_managed:Ljava/lang/Object;

    .line 6
    .line 7
    instance-of v0, v0, Lorg/eclipse/jetty/server/session/AbstractSessionManager;

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Lorg/eclipse/jetty/server/session/jmx/AbstractSessionManagerMBean;->_managed:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v0, Lorg/eclipse/jetty/server/session/AbstractSessionManager;

    .line 14
    .line 15
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/session/AbstractSessionManager;->getSessionHandler()Lorg/eclipse/jetty/server/session/SessionHandler;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/handler/AbstractHandler;->getServer()Lorg/eclipse/jetty/server/Server;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const-class v2, Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 26
    .line 27
    invoke-static {v1, v2, v0}, Lorg/eclipse/jetty/server/handler/AbstractHandlerContainer;->findContainerOf(Lorg/eclipse/jetty/server/HandlerContainer;Ljava/lang/Class;Lorg/eclipse/jetty/server/Handler;)Lorg/eclipse/jetty/server/HandlerContainer;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 32
    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/server/handler/jmx/AbstractHandlerMBean;->getContextName(Lorg/eclipse/jetty/server/handler/ContextHandler;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    goto :goto_0

    .line 40
    :cond_0
    const/4 v0, 0x0

    .line 41
    :goto_0
    if-eqz v0, :cond_1

    .line 42
    .line 43
    return-object v0

    .line 44
    :cond_1
    invoke-super {p0}, Lorg/eclipse/jetty/server/handler/jmx/AbstractHandlerMBean;->getObjectContextBasis()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0
.end method
