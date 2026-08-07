.class public Lorg/eclipse/jetty/util/log/Slf4jLog;
.super Lorg/eclipse/jetty/util/log/AbstractLogger;
.source "SourceFile"


# instance fields
.field private final _logger:Lorg/slf4j/Logger;


# direct methods
.method public constructor <init>()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 25
    const-string v0, "org.eclipse.jetty.util.log"

    invoke-direct {p0, v0}, Lorg/eclipse/jetty/util/log/Slf4jLog;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lorg/eclipse/jetty/util/log/AbstractLogger;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/String;)Lorg/slf4j/Logger;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    instance-of v0, p1, Lorg/slf4j/spi/LocationAwareLogger;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    new-instance v0, Lorg/eclipse/jetty/util/log/JettyAwareLogger;

    .line 13
    .line 14
    check-cast p1, Lorg/slf4j/spi/LocationAwareLogger;

    .line 15
    .line 16
    invoke-direct {v0, p1}, Lorg/eclipse/jetty/util/log/JettyAwareLogger;-><init>(Lorg/slf4j/spi/LocationAwareLogger;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lorg/eclipse/jetty/util/log/Slf4jLog;->_logger:Lorg/slf4j/Logger;

    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    iput-object p1, p0, Lorg/eclipse/jetty/util/log/Slf4jLog;->_logger:Lorg/slf4j/Logger;

    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public debug(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 8
    iget-object p0, p0, Lorg/eclipse/jetty/util/log/Slf4jLog;->_logger:Lorg/slf4j/Logger;

    invoke-interface {p0, p1, p2}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public varargs debug(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/util/log/Slf4jLog;->_logger:Lorg/slf4j/Logger;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public debug(Ljava/lang/Throwable;)V
    .locals 1

    .line 7
    const-string v0, ""

    invoke-virtual {p0, v0, p1}, Lorg/eclipse/jetty/util/log/Slf4jLog;->debug(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public getName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/util/log/Slf4jLog;->_logger:Lorg/slf4j/Logger;

    .line 2
    .line 3
    invoke-interface {p0}, Lorg/slf4j/Logger;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public ignore(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-static {}, Lorg/eclipse/jetty/util/log/Log;->isIgnored()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "IGNORED "

    .line 8
    .line 9
    invoke-virtual {p0, v0, p1}, Lorg/eclipse/jetty/util/log/Slf4jLog;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public info(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 8
    iget-object p0, p0, Lorg/eclipse/jetty/util/log/Slf4jLog;->_logger:Lorg/slf4j/Logger;

    invoke-interface {p0, p1, p2}, Lorg/slf4j/Logger;->info(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public varargs info(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/util/log/Slf4jLog;->_logger:Lorg/slf4j/Logger;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Lorg/slf4j/Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public info(Ljava/lang/Throwable;)V
    .locals 1

    .line 7
    const-string v0, ""

    invoke-virtual {p0, v0, p1}, Lorg/eclipse/jetty/util/log/Slf4jLog;->info(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public isDebugEnabled()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/util/log/Slf4jLog;->_logger:Lorg/slf4j/Logger;

    .line 2
    .line 3
    invoke-interface {p0}, Lorg/slf4j/Logger;->isDebugEnabled()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public newLogger(Ljava/lang/String;)Lorg/eclipse/jetty/util/log/Logger;
    .locals 0

    .line 1
    new-instance p0, Lorg/eclipse/jetty/util/log/Slf4jLog;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lorg/eclipse/jetty/util/log/Slf4jLog;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public setDebugEnabled(Z)V
    .locals 1

    .line 1
    const/4 p1, 0x0

    .line 2
    filled-new-array {p1, p1}, [Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    const-string v0, "setDebugEnabled not implemented"

    .line 7
    .line 8
    invoke-virtual {p0, v0, p1}, Lorg/eclipse/jetty/util/log/Slf4jLog;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/util/log/Slf4jLog;->_logger:Lorg/slf4j/Logger;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public warn(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 8
    iget-object p0, p0, Lorg/eclipse/jetty/util/log/Slf4jLog;->_logger:Lorg/slf4j/Logger;

    invoke-interface {p0, p1, p2}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public varargs warn(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/util/log/Slf4jLog;->_logger:Lorg/slf4j/Logger;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public warn(Ljava/lang/Throwable;)V
    .locals 1

    .line 7
    const-string v0, ""

    invoke-virtual {p0, v0, p1}, Lorg/eclipse/jetty/util/log/Slf4jLog;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method
