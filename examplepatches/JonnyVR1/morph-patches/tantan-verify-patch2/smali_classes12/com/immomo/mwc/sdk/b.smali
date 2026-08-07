.class final Lcom/immomo/mwc/sdk/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Closeable;


# static fields
.field private static g:I


# instance fields
.field private a:Lcom/quickjs/QuickJS;

.field private b:Lcom/quickjs/JSContext;

.field private final c:Landroid/os/HandlerThread;

.field private final d:Landroid/os/Handler;

.field private e:Z

.field private final f:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap<",
            "Lcom/immomo/mwc/sdk/EventType;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/immomo/mwc/sdk/b;->a:Lcom/quickjs/QuickJS;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/immomo/mwc/sdk/b;->b:Lcom/quickjs/JSContext;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-boolean v0, p0, Lcom/immomo/mwc/sdk/b;->e:Z

    .line 11
    .line 12
    new-instance v0, Ljava/util/LinkedHashMap;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/immomo/mwc/sdk/b;->f:Ljava/util/LinkedHashMap;

    .line 18
    .line 19
    new-instance v0, Landroid/os/HandlerThread;

    .line 20
    .line 21
    new-instance v1, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    const-string v2, "mwc-runtime-"

    .line 24
    .line 25
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    sget v2, Lcom/immomo/mwc/sdk/b;->g:I

    .line 29
    .line 30
    add-int/lit8 v3, v2, 0x1

    .line 31
    .line 32
    sput v3, Lcom/immomo/mwc/sdk/b;->g:I

    .line 33
    .line 34
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    const/16 v2, 0xa

    .line 42
    .line 43
    invoke-direct {v0, v1, v2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;I)V

    .line 44
    .line 45
    .line 46
    iput-object v0, p0, Lcom/immomo/mwc/sdk/b;->c:Landroid/os/HandlerThread;

    .line 47
    .line 48
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 49
    .line 50
    .line 51
    new-instance v1, Landroid/os/Handler;

    .line 52
    .line 53
    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 58
    .line 59
    .line 60
    iput-object v1, p0, Lcom/immomo/mwc/sdk/b;->d:Landroid/os/Handler;

    .line 61
    .line 62
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    if-ne v1, v0, :cond_0

    .line 67
    .line 68
    invoke-direct {p0}, Lcom/immomo/mwc/sdk/b;->F()V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_0
    new-instance v0, Lcom/immomo/mwc/sdk/a;

    .line 73
    .line 74
    invoke-direct {v0, p0}, Lcom/immomo/mwc/sdk/a;-><init>(Lcom/immomo/mwc/sdk/b;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0, v0}, Lcom/immomo/mwc/sdk/b;->v(Ljava/lang/Runnable;)Z

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method private F()V
    .locals 5

    .line 1
    invoke-static {}, Lcom/quickjs/QuickJS;->createRuntime()Lcom/quickjs/QuickJS;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/immomo/mwc/sdk/b;->a:Lcom/quickjs/QuickJS;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/quickjs/QuickJS;->createContext()Lcom/quickjs/JSContext;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lcom/immomo/mwc/sdk/b;->b:Lcom/quickjs/JSContext;

    .line 12
    .line 13
    new-instance v0, Ll/xx5;

    .line 14
    .line 15
    invoke-direct {v0}, Ll/xx5;-><init>()V

    .line 16
    .line 17
    .line 18
    new-instance v1, Ll/jrq;

    .line 19
    .line 20
    invoke-direct {v1}, Ll/jrq;-><init>()V

    .line 21
    .line 22
    .line 23
    new-instance v2, Ll/lmq;

    .line 24
    .line 25
    invoke-direct {v2}, Ll/lmq;-><init>()V

    .line 26
    .line 27
    .line 28
    const/4 v3, 0x3

    .line 29
    new-array v3, v3, [Ll/ef00;

    .line 30
    .line 31
    const/4 v4, 0x0

    .line 32
    aput-object v0, v3, v4

    .line 33
    .line 34
    const/4 v0, 0x1

    .line 35
    aput-object v1, v3, v0

    .line 36
    .line 37
    const/4 v0, 0x2

    .line 38
    aput-object v2, v3, v0

    .line 39
    .line 40
    invoke-virtual {p0, v3}, Lcom/immomo/mwc/sdk/b;->B([Ll/ef00;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public static synthetic b(Lcom/immomo/mwc/sdk/b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/mwc/sdk/b;->F()V

    return-void
.end method

.method public static k()Lcom/immomo/mwc/sdk/b;
    .locals 1

    .line 1
    new-instance v0, Lcom/immomo/mwc/sdk/b;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/immomo/mwc/sdk/b;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static t(Ljava/lang/String;)Lcom/immomo/mwc/sdk/c;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/rre0;->f(Ljava/lang/String;)Lcom/immomo/mwc/sdk/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method


# virtual methods
.method public varargs B([Ll/ef00;)V
    .locals 6

    .line 1
    array-length v0, p1

    .line 2
    const/4 v1, 0x0

    .line 3
    :goto_0
    const/4 v2, 0x0

    .line 4
    const-string v3, "MWCRuntime"

    .line 5
    .line 6
    if-ge v1, v0, :cond_0

    .line 7
    .line 8
    aget-object v4, p1, v1

    .line 9
    .line 10
    :try_start_0
    iget-object v5, p0, Lcom/immomo/mwc/sdk/b;->b:Lcom/quickjs/JSContext;

    .line 11
    .line 12
    invoke-virtual {v5, v4}, Lcom/quickjs/JSContext;->addPlugin(Lcom/quickjs/Plugin;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    .line 14
    .line 15
    goto :goto_1

    .line 16
    :catchall_0
    move-exception v4

    .line 17
    const-string v5, "register modules exception @error=%s"

    .line 18
    .line 19
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v4

    .line 23
    invoke-static {v3, v2, v5, v4}, Lcom/immomo/mwc/sdk/MWCEngine;->m(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    const-string p0, "register modules success"

    .line 30
    .line 31
    invoke-static {v3, v2, p0}, Lcom/immomo/mwc/sdk/MWCEngine;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public H(Lcom/immomo/mwc/sdk/EventType;Ljava/lang/String;Lorg/json/JSONObject;Ll/z84;)V
    .locals 4
    .param p4    # Ll/z84;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-static {p2}, Ll/rre0;->f(Ljava/lang/String;)Lcom/immomo/mwc/sdk/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "MWCRuntime"

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    sget-object v0, Lcom/immomo/mwc/sdk/b$a;->a:[I

    .line 11
    .line 12
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 13
    .line 14
    .line 15
    move-result v3

    .line 16
    aget v0, v0, v3

    .line 17
    .line 18
    const/4 v3, 0x1

    .line 19
    if-eq v0, v3, :cond_0

    .line 20
    .line 21
    const/4 v3, 0x2

    .line 22
    if-eq v0, v3, :cond_0

    .line 23
    .line 24
    new-instance p0, Ll/y84;

    .line 25
    .line 26
    new-instance p3, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    const-string v0, "unknown event name:"

    .line 29
    .line 30
    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    const/16 p3, 0x3e9

    .line 41
    .line 42
    invoke-direct {p0, p3, p1}, Ll/y84;-><init>(ILjava/lang/String;)V

    .line 43
    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_0
    iget-object v0, p1, Lcom/immomo/mwc/sdk/EventType;->value:Ljava/lang/String;

    .line 47
    .line 48
    invoke-static {v0, p2, p3}, Ll/d2j0;->b(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p3

    .line 52
    const-string v0, "global._workers.trigger(%s)"

    .line 53
    .line 54
    filled-new-array {p3}, [Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object p3

    .line 58
    invoke-static {v0, p3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p3

    .line 62
    const-string v0, "trigger::start @eventName=%s"

    .line 63
    .line 64
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    invoke-static {v1, p2, v0, v3}, Lcom/immomo/mwc/sdk/MWCEngine;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 69
    .line 70
    .line 71
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 72
    .line 73
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    const-string v3, ".js"

    .line 80
    .line 81
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-virtual {p0, p3, v0}, Lcom/immomo/mwc/sdk/b;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;
    :try_end_0
    .catch Lcom/quickjs/QuickJSException; {:try_start_0 .. :try_end_0} :catch_0

    .line 89
    .line 90
    .line 91
    goto :goto_0

    .line 92
    :catch_0
    move-exception p0

    .line 93
    const-string p3, "trigger::end @eventName=%s, @error=%s"

    .line 94
    .line 95
    filled-new-array {p1, p0}, [Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    invoke-static {v1, p2, p3, p0}, Lcom/immomo/mwc/sdk/MWCEngine;->m(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 100
    .line 101
    .line 102
    :goto_0
    const-string p0, "trigger::end @eventName=%s"

    .line 103
    .line 104
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    invoke-static {v1, p2, p0, p1}, Lcom/immomo/mwc/sdk/MWCEngine;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 109
    .line 110
    .line 111
    move-object p0, v2

    .line 112
    goto :goto_1

    .line 113
    :cond_1
    new-instance p0, Ll/y84;

    .line 114
    .line 115
    new-instance v0, Ljava/lang/StringBuilder;

    .line 116
    .line 117
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 118
    .line 119
    .line 120
    iget-object p1, p1, Lcom/immomo/mwc/sdk/EventType;->value:Ljava/lang/String;

    .line 121
    .line 122
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    const-string p1, ":unknown worker @workerId="

    .line 126
    .line 127
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    const-string p1, ", @data="

    .line 134
    .line 135
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    invoke-virtual {p3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    const/16 p3, 0x3ea

    .line 150
    .line 151
    invoke-direct {p0, p3, p1}, Ll/y84;-><init>(ILjava/lang/String;)V

    .line 152
    .line 153
    .line 154
    :goto_1
    if-eqz p4, :cond_2

    .line 155
    .line 156
    invoke-interface {p4, p0, v2}, Ll/z84;->a(Ll/y84;Ljava/lang/Object;)V

    .line 157
    .line 158
    .line 159
    goto :goto_2

    .line 160
    :cond_2
    if-eqz p0, :cond_3

    .line 161
    .line 162
    const-string p1, "trigger:error @error=%s"

    .line 163
    .line 164
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 165
    .line 166
    .line 167
    move-result-object p0

    .line 168
    invoke-static {v1, p2, p1, p0}, Lcom/immomo/mwc/sdk/MWCEngine;->m(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 169
    .line 170
    .line 171
    :cond_3
    :goto_2
    return-void
.end method

.method public close()V
    .locals 3

    .line 1
    const-string v0, "MWCRuntime"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :try_start_0
    iget-object v2, p0, Lcom/immomo/mwc/sdk/b;->b:Lcom/quickjs/JSContext;

    .line 5
    .line 6
    invoke-virtual {v2}, Lcom/quickjs/JSContext;->close()V

    .line 7
    .line 8
    .line 9
    iget-object v2, p0, Lcom/immomo/mwc/sdk/b;->a:Lcom/quickjs/QuickJS;

    .line 10
    .line 11
    invoke-virtual {v2}, Lcom/quickjs/QuickJS;->close()V

    .line 12
    .line 13
    .line 14
    iget-object v2, p0, Lcom/immomo/mwc/sdk/b;->c:Landroid/os/HandlerThread;

    .line 15
    .line 16
    invoke-virtual {v2}, Landroid/os/HandlerThread;->quitSafely()Z

    .line 17
    .line 18
    .line 19
    const/4 v2, 0x1

    .line 20
    iput-boolean v2, p0, Lcom/immomo/mwc/sdk/b;->e:Z

    .line 21
    .line 22
    const-string p0, "destroyed context and runtime"

    .line 23
    .line 24
    invoke-static {v0, v1, p0}, Lcom/immomo/mwc/sdk/MWCEngine;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :catchall_0
    move-exception p0

    .line 29
    const-string v2, "could not destroyed context and runtime @error=%s"

    .line 30
    .line 31
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-static {v0, v1, v2, p0}, Lcom/immomo/mwc/sdk/MWCEngine;->m(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public d(Lcom/immomo/mwc/sdk/c;Ll/ro5;)V
    .locals 2

    .line 1
    sget-object p0, Lcom/immomo/mwc/sdk/MWCEngine$CodeType;->JS:Lcom/immomo/mwc/sdk/MWCEngine$CodeType;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Lcom/immomo/mwc/sdk/c;->a(Lcom/immomo/mwc/sdk/MWCEngine$CodeType;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-static {p1, p2}, Ll/rre0;->b(Lcom/immomo/mwc/sdk/c;Ll/ro5;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    sget-object p0, Lcom/immomo/mwc/sdk/MWCEngine$CodeType;->BINARY:Lcom/immomo/mwc/sdk/MWCEngine$CodeType;

    .line 14
    .line 15
    invoke-virtual {p1, p0}, Lcom/immomo/mwc/sdk/c;->a(Lcom/immomo/mwc/sdk/MWCEngine$CodeType;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    invoke-static {p1, p2}, Ll/rre0;->c(Lcom/immomo/mwc/sdk/c;Ll/ro5;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    new-instance p0, Lcom/immomo/mwc/sdk/exception/MWCException;

    .line 26
    .line 27
    new-instance v0, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    const-string v1, "Not supported MWCEngine.CodeType:"

    .line 30
    .line 31
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/immomo/mwc/sdk/c;->b()Lcom/immomo/mwc/sdk/MWCEngine$CodeType;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    const/16 v0, 0x3ec

    .line 46
    .line 47
    invoke-direct {p0, v0, p1}, Lcom/immomo/mwc/sdk/exception/MWCException;-><init>(ILjava/lang/String;)V

    .line 48
    .line 49
    .line 50
    const/4 p1, 0x0

    .line 51
    invoke-interface {p2, p0, p1}, Ll/ro5;->a(Lcom/immomo/mwc/sdk/exception/MWCException;Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/quickjs/QuickJSException;
        }
    .end annotation

    .line 1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string p2, "anonymous"

    .line 8
    .line 9
    :cond_0
    iget-object p0, p0, Lcom/immomo/mwc/sdk/b;->b:Lcom/quickjs/JSContext;

    .line 10
    .line 11
    invoke-virtual {p0, p1, p2}, Lcom/quickjs/JSContext;->executeScript(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public n(Ljava/lang/String;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/quickjs/QuickJSException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/mwc/sdk/b;->b:Lcom/quickjs/JSContext;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/quickjs/JSContext;->executeBinaryScript(Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public q()Landroid/os/HandlerThread;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mwc/sdk/b;->c:Landroid/os/HandlerThread;

    .line 2
    .line 3
    return-object p0
.end method

.method public u()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mwc/sdk/b;->c:Landroid/os/HandlerThread;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/Thread;->isInterrupted()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x1

    .line 11
    return p0
.end method

.method public v(Ljava/lang/Runnable;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mwc/sdk/b;->d:Landroid/os/Handler;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
