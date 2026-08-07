.class public Lorg/eclipse/jetty/server/jmx/ServerMBean;
.super Lorg/eclipse/jetty/jmx/ObjectMBean;
.source "SourceFile"


# instance fields
.field private final server:Lorg/eclipse/jetty/server/Server;

.field private final startupTime:J


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lorg/eclipse/jetty/jmx/ObjectMBean;-><init>(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 5
    .line 6
    .line 7
    move-result-wide v0

    .line 8
    iput-wide v0, p0, Lorg/eclipse/jetty/server/jmx/ServerMBean;->startupTime:J

    .line 9
    .line 10
    check-cast p1, Lorg/eclipse/jetty/server/Server;

    .line 11
    .line 12
    iput-object p1, p0, Lorg/eclipse/jetty/server/jmx/ServerMBean;->server:Lorg/eclipse/jetty/server/Server;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public getContexts()[Lorg/eclipse/jetty/server/Handler;
    .locals 1

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/jmx/ServerMBean;->server:Lorg/eclipse/jetty/server/Server;

    .line 2
    .line 3
    const-class v0, Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/server/handler/AbstractHandlerContainer;->getChildHandlersByClass(Ljava/lang/Class;)[Lorg/eclipse/jetty/server/Handler;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getStartupTime()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lorg/eclipse/jetty/server/jmx/ServerMBean;->startupTime:J

    .line 2
    .line 3
    return-wide v0
.end method
