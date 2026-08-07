.class Lorg/eclipse/jetty/util/log/JettyAwareLogger;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/slf4j/Logger;


# static fields
.field private static final DEBUG:I = 0xa

.field private static final ERROR:I = 0x28

.field private static final FQCN:Ljava/lang/String;

.field private static final INFO:I = 0x14

.field private static final TRACE:I = 0x0

.field private static final WARN:I = 0x1e


# instance fields
.field private final _logger:Lorg/slf4j/spi/LocationAwareLogger;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-class v0, Lorg/eclipse/jetty/util/log/Slf4jLog;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->FQCN:Ljava/lang/String;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Lorg/slf4j/spi/LocationAwareLogger;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->_logger:Lorg/slf4j/spi/LocationAwareLogger;

    .line 5
    .line 6
    return-void
.end method

.method private log(Lorg/slf4j/Marker;ILjava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V
    .locals 13

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->_logger:Lorg/slf4j/spi/LocationAwareLogger;

    .line 2
    .line 3
    if-nez p4, :cond_0

    .line 4
    .line 5
    sget-object v2, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->FQCN:Ljava/lang/String;

    .line 6
    .line 7
    const/4 v5, 0x0

    .line 8
    move-object v1, p1

    .line 9
    move v3, p2

    .line 10
    move-object/from16 v4, p3

    .line 11
    .line 12
    move-object/from16 v6, p5

    .line 13
    .line 14
    invoke-interface/range {v0 .. v6}, Lorg/slf4j/spi/LocationAwareLogger;->log(Lorg/slf4j/Marker;Ljava/lang/String;ILjava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    invoke-interface {v0}, Lorg/slf4j/Logger;->isTraceEnabled()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    goto :goto_0

    .line 26
    :cond_1
    iget-object v0, p0, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->_logger:Lorg/slf4j/spi/LocationAwareLogger;

    .line 27
    .line 28
    invoke-interface {v0}, Lorg/slf4j/Logger;->isDebugEnabled()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    const/16 v0, 0xa

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_2
    iget-object v0, p0, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->_logger:Lorg/slf4j/spi/LocationAwareLogger;

    .line 38
    .line 39
    invoke-interface {v0}, Lorg/slf4j/Logger;->isInfoEnabled()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_3

    .line 44
    .line 45
    const/16 v0, 0x14

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_3
    iget-object v0, p0, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->_logger:Lorg/slf4j/spi/LocationAwareLogger;

    .line 49
    .line 50
    invoke-interface {v0}, Lorg/slf4j/Logger;->isWarnEnabled()Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-eqz v0, :cond_4

    .line 55
    .line 56
    const/16 v0, 0x1e

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_4
    const/16 v0, 0x28

    .line 60
    .line 61
    :goto_0
    if-gt v0, p2, :cond_5

    .line 62
    .line 63
    invoke-static/range {p3 .. p4}, Lorg/slf4j/helpers/MessageFormatter;->arrayFormat(Ljava/lang/String;[Ljava/lang/Object;)Lorg/slf4j/helpers/FormattingTuple;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    iget-object v6, p0, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->_logger:Lorg/slf4j/spi/LocationAwareLogger;

    .line 68
    .line 69
    sget-object v8, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->FQCN:Ljava/lang/String;

    .line 70
    .line 71
    invoke-virtual {v0}, Lorg/slf4j/helpers/FormattingTuple;->getMessage()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v10

    .line 75
    const/4 v11, 0x0

    .line 76
    move-object v7, p1

    .line 77
    move v9, p2

    .line 78
    move-object/from16 v12, p5

    .line 79
    .line 80
    invoke-interface/range {v6 .. v12}, Lorg/slf4j/spi/LocationAwareLogger;->log(Lorg/slf4j/Marker;Ljava/lang/String;ILjava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 81
    .line 82
    .line 83
    :cond_5
    return-void
.end method


# virtual methods
.method public debug(Ljava/lang/String;)V
    .locals 6

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v1, 0x0

    const/16 v2, 0xa

    move-object v0, p0

    move-object v3, p1

    .line 15
    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->log(Lorg/slf4j/Marker;ILjava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
.end method

.method public debug(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 6

    .line 1
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v4

    .line 5
    const/4 v5, 0x0

    .line 6
    const/4 v1, 0x0

    .line 7
    const/16 v2, 0xa

    .line 8
    .line 9
    move-object v0, p0

    .line 10
    move-object v3, p1

    .line 11
    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->log(Lorg/slf4j/Marker;ILjava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public debug(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 6

    .line 16
    filled-new-array {p2, p3}, [Ljava/lang/Object;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v1, 0x0

    const/16 v2, 0xa

    move-object v0, p0

    move-object v3, p1

    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->log(Lorg/slf4j/Marker;ILjava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
.end method

.method public debug(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 6

    const/16 v2, 0xa

    const/4 v4, 0x0

    const/4 v1, 0x0

    move-object v0, p0

    move-object v3, p1

    move-object v5, p2

    .line 18
    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->log(Lorg/slf4j/Marker;ILjava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
.end method

.method public debug(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 6

    const/16 v2, 0xa

    const/4 v5, 0x0

    const/4 v1, 0x0

    move-object v0, p0

    move-object v3, p1

    move-object v4, p2

    .line 17
    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->log(Lorg/slf4j/Marker;ILjava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
.end method

.method public debug(Lorg/slf4j/Marker;Ljava/lang/String;)V
    .locals 6

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/16 v2, 0xa

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    .line 19
    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->log(Lorg/slf4j/Marker;ILjava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
.end method

.method public debug(Lorg/slf4j/Marker;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 6

    .line 20
    filled-new-array {p3}, [Ljava/lang/Object;

    move-result-object v4

    const/4 v5, 0x0

    const/16 v2, 0xa

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->log(Lorg/slf4j/Marker;ILjava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
.end method

.method public debug(Lorg/slf4j/Marker;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 6

    .line 21
    filled-new-array {p3, p4}, [Ljava/lang/Object;

    move-result-object v4

    const/4 v5, 0x0

    const/16 v2, 0xa

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->log(Lorg/slf4j/Marker;ILjava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
.end method

.method public debug(Lorg/slf4j/Marker;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 6

    const/16 v2, 0xa

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move-object v5, p3

    .line 23
    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->log(Lorg/slf4j/Marker;ILjava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
.end method

.method public debug(Lorg/slf4j/Marker;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 6

    const/16 v2, 0xa

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move-object v4, p3

    .line 22
    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->log(Lorg/slf4j/Marker;ILjava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
.end method

.method public error(Ljava/lang/String;)V
    .locals 6

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v1, 0x0

    const/16 v2, 0x28

    move-object v0, p0

    move-object v3, p1

    .line 15
    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->log(Lorg/slf4j/Marker;ILjava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
.end method

.method public error(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 6

    .line 1
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v4

    .line 5
    const/4 v5, 0x0

    .line 6
    const/4 v1, 0x0

    .line 7
    const/16 v2, 0x28

    .line 8
    .line 9
    move-object v0, p0

    .line 10
    move-object v3, p1

    .line 11
    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->log(Lorg/slf4j/Marker;ILjava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public error(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 6

    .line 16
    filled-new-array {p2, p3}, [Ljava/lang/Object;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v1, 0x0

    const/16 v2, 0x28

    move-object v0, p0

    move-object v3, p1

    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->log(Lorg/slf4j/Marker;ILjava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
.end method

.method public error(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 6

    const/16 v2, 0x28

    const/4 v4, 0x0

    const/4 v1, 0x0

    move-object v0, p0

    move-object v3, p1

    move-object v5, p2

    .line 18
    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->log(Lorg/slf4j/Marker;ILjava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
.end method

.method public error(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 6

    const/16 v2, 0x28

    const/4 v5, 0x0

    const/4 v1, 0x0

    move-object v0, p0

    move-object v3, p1

    move-object v4, p2

    .line 17
    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->log(Lorg/slf4j/Marker;ILjava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
.end method

.method public error(Lorg/slf4j/Marker;Ljava/lang/String;)V
    .locals 6

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/16 v2, 0x28

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    .line 19
    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->log(Lorg/slf4j/Marker;ILjava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
.end method

.method public error(Lorg/slf4j/Marker;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 6

    .line 20
    filled-new-array {p3}, [Ljava/lang/Object;

    move-result-object v4

    const/4 v5, 0x0

    const/16 v2, 0x28

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->log(Lorg/slf4j/Marker;ILjava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
.end method

.method public error(Lorg/slf4j/Marker;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 6

    .line 21
    filled-new-array {p3, p4}, [Ljava/lang/Object;

    move-result-object v4

    const/4 v5, 0x0

    const/16 v2, 0x28

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->log(Lorg/slf4j/Marker;ILjava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
.end method

.method public error(Lorg/slf4j/Marker;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 6

    const/16 v2, 0x28

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move-object v5, p3

    .line 23
    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->log(Lorg/slf4j/Marker;ILjava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
.end method

.method public error(Lorg/slf4j/Marker;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 6

    const/16 v2, 0x28

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move-object v4, p3

    .line 22
    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->log(Lorg/slf4j/Marker;ILjava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
.end method

.method public getName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->_logger:Lorg/slf4j/spi/LocationAwareLogger;

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

.method public info(Ljava/lang/String;)V
    .locals 6

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v1, 0x0

    const/16 v2, 0x14

    move-object v0, p0

    move-object v3, p1

    .line 15
    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->log(Lorg/slf4j/Marker;ILjava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
.end method

.method public info(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 6

    .line 1
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v4

    .line 5
    const/4 v5, 0x0

    .line 6
    const/4 v1, 0x0

    .line 7
    const/16 v2, 0x14

    .line 8
    .line 9
    move-object v0, p0

    .line 10
    move-object v3, p1

    .line 11
    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->log(Lorg/slf4j/Marker;ILjava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public info(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 6

    .line 16
    filled-new-array {p2, p3}, [Ljava/lang/Object;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v1, 0x0

    const/16 v2, 0x14

    move-object v0, p0

    move-object v3, p1

    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->log(Lorg/slf4j/Marker;ILjava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
.end method

.method public info(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 6

    const/16 v2, 0x14

    const/4 v4, 0x0

    const/4 v1, 0x0

    move-object v0, p0

    move-object v3, p1

    move-object v5, p2

    .line 18
    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->log(Lorg/slf4j/Marker;ILjava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
.end method

.method public info(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 6

    const/16 v2, 0x14

    const/4 v5, 0x0

    const/4 v1, 0x0

    move-object v0, p0

    move-object v3, p1

    move-object v4, p2

    .line 17
    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->log(Lorg/slf4j/Marker;ILjava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
.end method

.method public info(Lorg/slf4j/Marker;Ljava/lang/String;)V
    .locals 6

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/16 v2, 0x14

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    .line 19
    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->log(Lorg/slf4j/Marker;ILjava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
.end method

.method public info(Lorg/slf4j/Marker;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 6

    .line 20
    filled-new-array {p3}, [Ljava/lang/Object;

    move-result-object v4

    const/4 v5, 0x0

    const/16 v2, 0x14

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->log(Lorg/slf4j/Marker;ILjava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
.end method

.method public info(Lorg/slf4j/Marker;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 6

    .line 21
    filled-new-array {p3, p4}, [Ljava/lang/Object;

    move-result-object v4

    const/4 v5, 0x0

    const/16 v2, 0x14

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->log(Lorg/slf4j/Marker;ILjava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
.end method

.method public info(Lorg/slf4j/Marker;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 6

    const/16 v2, 0x14

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move-object v5, p3

    .line 23
    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->log(Lorg/slf4j/Marker;ILjava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
.end method

.method public info(Lorg/slf4j/Marker;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 6

    const/16 v2, 0x14

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move-object v4, p3

    .line 22
    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->log(Lorg/slf4j/Marker;ILjava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
.end method

.method public isDebugEnabled()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->_logger:Lorg/slf4j/spi/LocationAwareLogger;

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

.method public isDebugEnabled(Lorg/slf4j/Marker;)Z
    .locals 0

    .line 8
    iget-object p0, p0, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->_logger:Lorg/slf4j/spi/LocationAwareLogger;

    invoke-interface {p0, p1}, Lorg/slf4j/Logger;->isDebugEnabled(Lorg/slf4j/Marker;)Z

    move-result p0

    return p0
.end method

.method public isErrorEnabled()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->_logger:Lorg/slf4j/spi/LocationAwareLogger;

    .line 2
    .line 3
    invoke-interface {p0}, Lorg/slf4j/Logger;->isErrorEnabled()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isErrorEnabled(Lorg/slf4j/Marker;)Z
    .locals 0

    .line 8
    iget-object p0, p0, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->_logger:Lorg/slf4j/spi/LocationAwareLogger;

    invoke-interface {p0, p1}, Lorg/slf4j/Logger;->isErrorEnabled(Lorg/slf4j/Marker;)Z

    move-result p0

    return p0
.end method

.method public isInfoEnabled()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->_logger:Lorg/slf4j/spi/LocationAwareLogger;

    .line 2
    .line 3
    invoke-interface {p0}, Lorg/slf4j/Logger;->isInfoEnabled()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isInfoEnabled(Lorg/slf4j/Marker;)Z
    .locals 0

    .line 8
    iget-object p0, p0, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->_logger:Lorg/slf4j/spi/LocationAwareLogger;

    invoke-interface {p0, p1}, Lorg/slf4j/Logger;->isInfoEnabled(Lorg/slf4j/Marker;)Z

    move-result p0

    return p0
.end method

.method public isTraceEnabled()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->_logger:Lorg/slf4j/spi/LocationAwareLogger;

    .line 2
    .line 3
    invoke-interface {p0}, Lorg/slf4j/Logger;->isTraceEnabled()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isTraceEnabled(Lorg/slf4j/Marker;)Z
    .locals 0

    .line 8
    iget-object p0, p0, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->_logger:Lorg/slf4j/spi/LocationAwareLogger;

    invoke-interface {p0, p1}, Lorg/slf4j/Logger;->isTraceEnabled(Lorg/slf4j/Marker;)Z

    move-result p0

    return p0
.end method

.method public isWarnEnabled()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->_logger:Lorg/slf4j/spi/LocationAwareLogger;

    .line 2
    .line 3
    invoke-interface {p0}, Lorg/slf4j/Logger;->isWarnEnabled()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isWarnEnabled(Lorg/slf4j/Marker;)Z
    .locals 0

    .line 8
    iget-object p0, p0, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->_logger:Lorg/slf4j/spi/LocationAwareLogger;

    invoke-interface {p0, p1}, Lorg/slf4j/Logger;->isWarnEnabled(Lorg/slf4j/Marker;)Z

    move-result p0

    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->_logger:Lorg/slf4j/spi/LocationAwareLogger;

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

.method public trace(Ljava/lang/String;)V
    .locals 6

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    move-object v0, p0

    move-object v3, p1

    .line 14
    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->log(Lorg/slf4j/Marker;ILjava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
.end method

.method public trace(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 6

    .line 1
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v4

    .line 5
    const/4 v5, 0x0

    .line 6
    const/4 v1, 0x0

    .line 7
    const/4 v2, 0x0

    .line 8
    move-object v0, p0

    .line 9
    move-object v3, p1

    .line 10
    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->log(Lorg/slf4j/Marker;ILjava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public trace(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 6

    .line 15
    filled-new-array {p2, p3}, [Ljava/lang/Object;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    move-object v0, p0

    move-object v3, p1

    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->log(Lorg/slf4j/Marker;ILjava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
.end method

.method public trace(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 6

    const/4 v2, 0x0

    const/4 v4, 0x0

    const/4 v1, 0x0

    move-object v0, p0

    move-object v3, p1

    move-object v5, p2

    .line 17
    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->log(Lorg/slf4j/Marker;ILjava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
.end method

.method public trace(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 6

    const/4 v2, 0x0

    const/4 v5, 0x0

    const/4 v1, 0x0

    move-object v0, p0

    move-object v3, p1

    move-object v4, p2

    .line 16
    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->log(Lorg/slf4j/Marker;ILjava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
.end method

.method public trace(Lorg/slf4j/Marker;Ljava/lang/String;)V
    .locals 6

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v2, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    .line 18
    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->log(Lorg/slf4j/Marker;ILjava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
.end method

.method public trace(Lorg/slf4j/Marker;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 6

    .line 19
    filled-new-array {p3}, [Ljava/lang/Object;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v2, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->log(Lorg/slf4j/Marker;ILjava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
.end method

.method public trace(Lorg/slf4j/Marker;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 6

    .line 20
    filled-new-array {p3, p4}, [Ljava/lang/Object;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v2, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->log(Lorg/slf4j/Marker;ILjava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
.end method

.method public trace(Lorg/slf4j/Marker;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 6

    const/4 v2, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move-object v5, p3

    .line 22
    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->log(Lorg/slf4j/Marker;ILjava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
.end method

.method public trace(Lorg/slf4j/Marker;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 6

    const/4 v2, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move-object v4, p3

    .line 21
    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->log(Lorg/slf4j/Marker;ILjava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
.end method

.method public warn(Ljava/lang/String;)V
    .locals 6

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v1, 0x0

    const/16 v2, 0x1e

    move-object v0, p0

    move-object v3, p1

    .line 15
    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->log(Lorg/slf4j/Marker;ILjava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
.end method

.method public warn(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 6

    .line 1
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v4

    .line 5
    const/4 v5, 0x0

    .line 6
    const/4 v1, 0x0

    .line 7
    const/16 v2, 0x1e

    .line 8
    .line 9
    move-object v0, p0

    .line 10
    move-object v3, p1

    .line 11
    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->log(Lorg/slf4j/Marker;ILjava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public warn(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 6

    .line 17
    filled-new-array {p2, p3}, [Ljava/lang/Object;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v1, 0x0

    const/16 v2, 0x1e

    move-object v0, p0

    move-object v3, p1

    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->log(Lorg/slf4j/Marker;ILjava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
.end method

.method public warn(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 6

    const/16 v2, 0x1e

    const/4 v4, 0x0

    const/4 v1, 0x0

    move-object v0, p0

    move-object v3, p1

    move-object v5, p2

    .line 18
    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->log(Lorg/slf4j/Marker;ILjava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
.end method

.method public warn(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 6

    const/16 v2, 0x1e

    const/4 v5, 0x0

    const/4 v1, 0x0

    move-object v0, p0

    move-object v3, p1

    move-object v4, p2

    .line 16
    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->log(Lorg/slf4j/Marker;ILjava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
.end method

.method public warn(Lorg/slf4j/Marker;Ljava/lang/String;)V
    .locals 6

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/16 v2, 0x1e

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    .line 19
    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->log(Lorg/slf4j/Marker;ILjava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
.end method

.method public warn(Lorg/slf4j/Marker;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 6

    .line 20
    filled-new-array {p3}, [Ljava/lang/Object;

    move-result-object v4

    const/4 v5, 0x0

    const/16 v2, 0x1e

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->log(Lorg/slf4j/Marker;ILjava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
.end method

.method public warn(Lorg/slf4j/Marker;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 6

    .line 21
    filled-new-array {p3, p4}, [Ljava/lang/Object;

    move-result-object v4

    const/4 v5, 0x0

    const/16 v2, 0x1e

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->log(Lorg/slf4j/Marker;ILjava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
.end method

.method public warn(Lorg/slf4j/Marker;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 6

    const/16 v2, 0x1e

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move-object v5, p3

    .line 23
    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->log(Lorg/slf4j/Marker;ILjava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
.end method

.method public warn(Lorg/slf4j/Marker;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 6

    const/16 v2, 0x1e

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move-object v4, p3

    .line 22
    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jetty/util/log/JettyAwareLogger;->log(Lorg/slf4j/Marker;ILjava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
.end method
