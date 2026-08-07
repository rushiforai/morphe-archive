.class public Lorg/eclipse/jetty/util/log/LoggerLog;
.super Lorg/eclipse/jetty/util/log/AbstractLogger;
.source "SourceFile"


# instance fields
.field private volatile _debug:Z

.field private final _debugMAA:Ljava/lang/reflect/Method;

.field private final _debugMT:Ljava/lang/reflect/Method;

.field private final _getLoggerN:Ljava/lang/reflect/Method;

.field private final _getName:Ljava/lang/reflect/Method;

.field private final _infoMAA:Ljava/lang/reflect/Method;

.field private final _infoMT:Ljava/lang/reflect/Method;

.field private final _logger:Ljava/lang/Object;

.field private final _setDebugEnabledE:Ljava/lang/reflect/Method;

.field private final _warnMAA:Ljava/lang/reflect/Method;

.field private final _warnMT:Ljava/lang/reflect/Method;


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .locals 9

    .line 1
    const-string v0, "warn"

    .line 2
    .line 3
    const-string v1, "info"

    .line 4
    .line 5
    const-string v2, "debug"

    .line 6
    .line 7
    const-class v3, [Ljava/lang/Object;

    .line 8
    .line 9
    const-class v4, Ljava/lang/Throwable;

    .line 10
    .line 11
    const-class v5, Ljava/lang/String;

    .line 12
    .line 13
    invoke-direct {p0}, Lorg/eclipse/jetty/util/log/AbstractLogger;-><init>()V

    .line 14
    .line 15
    .line 16
    const/4 v6, 0x0

    .line 17
    :try_start_0
    iput-object p1, p0, Lorg/eclipse/jetty/util/log/LoggerLog;->_logger:Ljava/lang/Object;

    .line 18
    .line 19
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    move-result-object v7

    .line 23
    filled-new-array {v5, v4}, [Ljava/lang/Class;

    .line 24
    .line 25
    .line 26
    move-result-object v8

    .line 27
    invoke-virtual {v7, v2, v8}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 28
    .line 29
    .line 30
    move-result-object v8

    .line 31
    iput-object v8, p0, Lorg/eclipse/jetty/util/log/LoggerLog;->_debugMT:Ljava/lang/reflect/Method;

    .line 32
    .line 33
    filled-new-array {v5, v3}, [Ljava/lang/Class;

    .line 34
    .line 35
    .line 36
    move-result-object v8

    .line 37
    invoke-virtual {v7, v2, v8}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    iput-object v2, p0, Lorg/eclipse/jetty/util/log/LoggerLog;->_debugMAA:Ljava/lang/reflect/Method;

    .line 42
    .line 43
    filled-new-array {v5, v4}, [Ljava/lang/Class;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-virtual {v7, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    iput-object v2, p0, Lorg/eclipse/jetty/util/log/LoggerLog;->_infoMT:Ljava/lang/reflect/Method;

    .line 52
    .line 53
    filled-new-array {v5, v3}, [Ljava/lang/Class;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    invoke-virtual {v7, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    iput-object v1, p0, Lorg/eclipse/jetty/util/log/LoggerLog;->_infoMAA:Ljava/lang/reflect/Method;

    .line 62
    .line 63
    filled-new-array {v5, v4}, [Ljava/lang/Class;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    invoke-virtual {v7, v0, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    iput-object v1, p0, Lorg/eclipse/jetty/util/log/LoggerLog;->_warnMT:Ljava/lang/reflect/Method;

    .line 72
    .line 73
    filled-new-array {v5, v3}, [Ljava/lang/Class;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-virtual {v7, v0, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    iput-object v0, p0, Lorg/eclipse/jetty/util/log/LoggerLog;->_warnMAA:Ljava/lang/reflect/Method;

    .line 82
    .line 83
    const-string v0, "isDebugEnabled"

    .line 84
    .line 85
    invoke-virtual {v7, v0, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    const-string v1, "setDebugEnabled"

    .line 90
    .line 91
    sget-object v2, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    .line 92
    .line 93
    filled-new-array {v2}, [Ljava/lang/Class;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    invoke-virtual {v7, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    iput-object v1, p0, Lorg/eclipse/jetty/util/log/LoggerLog;->_setDebugEnabledE:Ljava/lang/reflect/Method;

    .line 102
    .line 103
    const-string v1, "getLogger"

    .line 104
    .line 105
    filled-new-array {v5}, [Ljava/lang/Class;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    invoke-virtual {v7, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    iput-object v1, p0, Lorg/eclipse/jetty/util/log/LoggerLog;->_getLoggerN:Ljava/lang/reflect/Method;

    .line 114
    .line 115
    const-string v1, "getName"

    .line 116
    .line 117
    invoke-virtual {v7, v1, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    iput-object v1, p0, Lorg/eclipse/jetty/util/log/LoggerLog;->_getName:Ljava/lang/reflect/Method;

    .line 122
    .line 123
    invoke-virtual {v0, p1, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    check-cast p1, Ljava/lang/Boolean;

    .line 128
    .line 129
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 130
    .line 131
    .line 132
    move-result p1

    .line 133
    iput-boolean p1, p0, Lorg/eclipse/jetty/util/log/LoggerLog;->_debug:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 134
    .line 135
    return-void

    .line 136
    :catch_0
    move-exception p0

    .line 137
    invoke-static {p0}, Ll/xpg0;->a(Ljava/lang/Throwable;)V

    .line 138
    .line 139
    .line 140
    throw v6
.end method


# virtual methods
.method public debug(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lorg/eclipse/jetty/util/log/LoggerLog;->_debug:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jetty/util/log/LoggerLog;->_debugMT:Ljava/lang/reflect/Method;

    .line 7
    .line 8
    iget-object p0, p0, Lorg/eclipse/jetty/util/log/LoggerLog;->_logger:Ljava/lang/Object;

    .line 9
    .line 10
    filled-new-array {p1, p2}, [Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {v0, p0, p1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :catch_0
    move-exception p0

    .line 19
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public varargs debug(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 0

    .line 24
    iget-boolean p1, p0, Lorg/eclipse/jetty/util/log/LoggerLog;->_debug:Z

    if-nez p1, :cond_0

    return-void

    .line 25
    :cond_0
    :try_start_0
    iget-object p1, p0, Lorg/eclipse/jetty/util/log/LoggerLog;->_debugMAA:Ljava/lang/reflect/Method;

    iget-object p0, p0, Lorg/eclipse/jetty/util/log/LoggerLog;->_logger:Ljava/lang/Object;

    invoke-virtual {p1, p0, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 26
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    return-void
.end method

.method public debug(Ljava/lang/Throwable;)V
    .locals 1

    .line 23
    const-string v0, ""

    invoke-virtual {p0, v0, p1}, Lorg/eclipse/jetty/util/log/LoggerLog;->debug(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public getName()Ljava/lang/String;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    iget-object v1, p0, Lorg/eclipse/jetty/util/log/LoggerLog;->_getName:Ljava/lang/reflect/Method;

    .line 3
    .line 4
    iget-object p0, p0, Lorg/eclipse/jetty/util/log/LoggerLog;->_logger:Ljava/lang/Object;

    .line 5
    .line 6
    invoke-virtual {v1, p0, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    .line 12
    return-object p0

    .line 13
    :catch_0
    move-exception p0

    .line 14
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 15
    .line 16
    .line 17
    return-object v0
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
    invoke-virtual {p0, v0, p1}, Lorg/eclipse/jetty/util/log/LoggerLog;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public info(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jetty/util/log/LoggerLog;->_infoMT:Ljava/lang/reflect/Method;

    .line 2
    .line 3
    iget-object p0, p0, Lorg/eclipse/jetty/util/log/LoggerLog;->_logger:Ljava/lang/Object;

    .line 4
    .line 5
    filled-new-array {p1, p2}, [Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {v0, p0, p1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :catch_0
    move-exception p0

    .line 14
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public varargs info(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 0

    .line 19
    :try_start_0
    iget-object p1, p0, Lorg/eclipse/jetty/util/log/LoggerLog;->_infoMAA:Ljava/lang/reflect/Method;

    iget-object p0, p0, Lorg/eclipse/jetty/util/log/LoggerLog;->_logger:Ljava/lang/Object;

    invoke-virtual {p1, p0, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 20
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    return-void
.end method

.method public info(Ljava/lang/Throwable;)V
    .locals 1

    .line 18
    const-string v0, ""

    invoke-virtual {p0, v0, p1}, Lorg/eclipse/jetty/util/log/LoggerLog;->info(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public isDebugEnabled()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/util/log/LoggerLog;->_debug:Z

    .line 2
    .line 3
    return p0
.end method

.method public newLogger(Ljava/lang/String;)Lorg/eclipse/jetty/util/log/Logger;
    .locals 2

    .line 1
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jetty/util/log/LoggerLog;->_getLoggerN:Ljava/lang/reflect/Method;

    .line 2
    .line 3
    iget-object v1, p0, Lorg/eclipse/jetty/util/log/LoggerLog;->_logger:Ljava/lang/Object;

    .line 4
    .line 5
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {v0, v1, p1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    new-instance v0, Lorg/eclipse/jetty/util/log/LoggerLog;

    .line 14
    .line 15
    invoke-direct {v0, p1}, Lorg/eclipse/jetty/util/log/LoggerLog;-><init>(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    .line 17
    .line 18
    return-object v0

    .line 19
    :catch_0
    move-exception p1

    .line 20
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 21
    .line 22
    .line 23
    return-object p0
.end method

.method public setDebugEnabled(Z)V
    .locals 3

    .line 1
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jetty/util/log/LoggerLog;->_setDebugEnabledE:Ljava/lang/reflect/Method;

    .line 2
    .line 3
    iget-object v1, p0, Lorg/eclipse/jetty/util/log/LoggerLog;->_logger:Ljava/lang/Object;

    .line 4
    .line 5
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    iput-boolean p1, p0, Lorg/eclipse/jetty/util/log/LoggerLog;->_debug:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    .line 18
    return-void

    .line 19
    :catch_0
    move-exception p0

    .line 20
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public warn(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jetty/util/log/LoggerLog;->_warnMT:Ljava/lang/reflect/Method;

    .line 2
    .line 3
    iget-object p0, p0, Lorg/eclipse/jetty/util/log/LoggerLog;->_logger:Ljava/lang/Object;

    .line 4
    .line 5
    filled-new-array {p1, p2}, [Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {v0, p0, p1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :catch_0
    move-exception p0

    .line 14
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public varargs warn(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 0

    .line 19
    :try_start_0
    iget-object p1, p0, Lorg/eclipse/jetty/util/log/LoggerLog;->_warnMAA:Ljava/lang/reflect/Method;

    iget-object p0, p0, Lorg/eclipse/jetty/util/log/LoggerLog;->_logger:Ljava/lang/Object;

    invoke-virtual {p1, p0, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 20
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    return-void
.end method

.method public warn(Ljava/lang/Throwable;)V
    .locals 1

    .line 18
    const-string v0, ""

    invoke-virtual {p0, v0, p1}, Lorg/eclipse/jetty/util/log/LoggerLog;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method
