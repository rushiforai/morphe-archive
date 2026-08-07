.class public abstract Lorg/java_websocket/AbstractWebSocket;
.super Lorg/java_websocket/WebSocketAdapter;
.source "SourceFile"


# instance fields
.field private connectionLostTimeout:I

.field private connectionLostTimer:Ljava/util/Timer;

.field private connectionLostTimerTask:Ljava/util/TimerTask;

.field private reuseAddr:Z

.field private tcpNoDelay:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lorg/java_websocket/WebSocketAdapter;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x3c

    .line 5
    .line 6
    iput v0, p0, Lorg/java_websocket/AbstractWebSocket;->connectionLostTimeout:I

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic access$000(Lorg/java_websocket/AbstractWebSocket;)I
    .locals 0

    .line 1
    iget p0, p0, Lorg/java_websocket/AbstractWebSocket;->connectionLostTimeout:I

    .line 2
    .line 3
    return p0
.end method

.method private cancelConnectionLostTimer()V
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/java_websocket/AbstractWebSocket;->connectionLostTimer:Ljava/util/Timer;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 7
    .line 8
    .line 9
    iput-object v1, p0, Lorg/java_websocket/AbstractWebSocket;->connectionLostTimer:Ljava/util/Timer;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lorg/java_websocket/AbstractWebSocket;->connectionLostTimerTask:Ljava/util/TimerTask;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/util/TimerTask;->cancel()Z

    .line 16
    .line 17
    .line 18
    iput-object v1, p0, Lorg/java_websocket/AbstractWebSocket;->connectionLostTimerTask:Ljava/util/TimerTask;

    .line 19
    .line 20
    :cond_1
    return-void
.end method

.method private restartConnectionLostTimer()V
    .locals 8

    .line 1
    invoke-direct {p0}, Lorg/java_websocket/AbstractWebSocket;->cancelConnectionLostTimer()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/Timer;

    .line 5
    .line 6
    const-string v1, "WebSocketTimer"

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/util/Timer;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lorg/java_websocket/AbstractWebSocket;->connectionLostTimer:Ljava/util/Timer;

    .line 12
    .line 13
    new-instance v3, Lorg/java_websocket/AbstractWebSocket$1;

    .line 14
    .line 15
    invoke-direct {v3, p0}, Lorg/java_websocket/AbstractWebSocket$1;-><init>(Lorg/java_websocket/AbstractWebSocket;)V

    .line 16
    .line 17
    .line 18
    iput-object v3, p0, Lorg/java_websocket/AbstractWebSocket;->connectionLostTimerTask:Ljava/util/TimerTask;

    .line 19
    .line 20
    iget-object v2, p0, Lorg/java_websocket/AbstractWebSocket;->connectionLostTimer:Ljava/util/Timer;

    .line 21
    .line 22
    iget p0, p0, Lorg/java_websocket/AbstractWebSocket;->connectionLostTimeout:I

    .line 23
    .line 24
    mul-int/lit16 v0, p0, 0x3e8

    .line 25
    .line 26
    int-to-long v4, v0

    .line 27
    mul-int/lit16 p0, p0, 0x3e8

    .line 28
    .line 29
    int-to-long v6, p0

    .line 30
    invoke-virtual/range {v2 .. v7}, Ljava/util/Timer;->scheduleAtFixedRate(Ljava/util/TimerTask;JJ)V

    .line 31
    .line 32
    .line 33
    return-void
.end method


# virtual methods
.method public getConnectionLostTimeout()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/java_websocket/AbstractWebSocket;->connectionLostTimeout:I

    .line 2
    .line 3
    return p0
.end method

.method public abstract getConnections()Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Lorg/java_websocket/WebSocket;",
            ">;"
        }
    .end annotation
.end method

.method public isReuseAddr()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/java_websocket/AbstractWebSocket;->reuseAddr:Z

    .line 2
    .line 3
    return p0
.end method

.method public isTcpNoDelay()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/java_websocket/AbstractWebSocket;->tcpNoDelay:Z

    .line 2
    .line 3
    return p0
.end method

.method public setConnectionLostTimeout(I)V
    .locals 1

    .line 1
    iput p1, p0, Lorg/java_websocket/AbstractWebSocket;->connectionLostTimeout:I

    .line 2
    .line 3
    if-gtz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lorg/java_websocket/AbstractWebSocket;->stopConnectionLostTimer()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p1, p0, Lorg/java_websocket/AbstractWebSocket;->connectionLostTimer:Ljava/util/Timer;

    .line 9
    .line 10
    if-nez p1, :cond_2

    .line 11
    .line 12
    iget-object p1, p0, Lorg/java_websocket/AbstractWebSocket;->connectionLostTimerTask:Ljava/util/TimerTask;

    .line 13
    .line 14
    if-eqz p1, :cond_1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    return-void

    .line 18
    :cond_2
    :goto_0
    sget-boolean p1, Lorg/java_websocket/WebSocketImpl;->DEBUG:Z

    .line 19
    .line 20
    if-eqz p1, :cond_3

    .line 21
    .line 22
    sget-object p1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .line 23
    .line 24
    const-string v0, "Connection lost timer restarted"

    .line 25
    .line 26
    invoke-virtual {p1, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    :cond_3
    invoke-direct {p0}, Lorg/java_websocket/AbstractWebSocket;->restartConnectionLostTimer()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public setReuseAddr(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lorg/java_websocket/AbstractWebSocket;->reuseAddr:Z

    .line 2
    .line 3
    return-void
.end method

.method public setTcpNoDelay(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lorg/java_websocket/AbstractWebSocket;->tcpNoDelay:Z

    .line 2
    .line 3
    return-void
.end method

.method public startConnectionLostTimer()V
    .locals 2

    .line 1
    iget v0, p0, Lorg/java_websocket/AbstractWebSocket;->connectionLostTimeout:I

    .line 2
    .line 3
    if-gtz v0, :cond_1

    .line 4
    .line 5
    sget-boolean p0, Lorg/java_websocket/WebSocketImpl;->DEBUG:Z

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .line 10
    .line 11
    const-string v0, "Connection lost timer deactivated"

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void

    .line 17
    :cond_1
    sget-boolean v0, Lorg/java_websocket/WebSocketImpl;->DEBUG:Z

    .line 18
    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .line 22
    .line 23
    const-string v1, "Connection lost timer started"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :cond_2
    invoke-direct {p0}, Lorg/java_websocket/AbstractWebSocket;->restartConnectionLostTimer()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public stopConnectionLostTimer()V
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/java_websocket/AbstractWebSocket;->connectionLostTimer:Ljava/util/Timer;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lorg/java_websocket/AbstractWebSocket;->connectionLostTimerTask:Ljava/util/TimerTask;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    return-void

    .line 11
    :cond_1
    :goto_0
    sget-boolean v0, Lorg/java_websocket/WebSocketImpl;->DEBUG:Z

    .line 12
    .line 13
    if-eqz v0, :cond_2

    .line 14
    .line 15
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .line 16
    .line 17
    const-string v1, "Connection lost timer stopped"

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    :cond_2
    invoke-direct {p0}, Lorg/java_websocket/AbstractWebSocket;->cancelConnectionLostTimer()V

    .line 23
    .line 24
    .line 25
    return-void
.end method
