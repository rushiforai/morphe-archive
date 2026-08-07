.class public final Lcom/immomo/molive/debuger/performance/tracer/memory/MemTracer;
.super Ll/cs2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/cs2<",
        "Ll/ogy;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u000e\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u000f\u0010\u0008\u001a\u00020\u0007H\u0002\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u000f\u0010\n\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\u0017\u0010\u000f\u001a\u00020\u000e2\u0008\u0010\r\u001a\u0004\u0018\u00010\u000c\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J\u000f\u0010\u0011\u001a\u00020\u0007H\u0016\u00a2\u0006\u0004\u0008\u0011\u0010\tR\u0018\u0010\u0015\u001a\u0004\u0018\u00010\u00128\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0013\u0010\u0014R\u0018\u0010\u0019\u001a\u0004\u0018\u00010\u00168\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0017\u0010\u0018R\u0016\u0010\u001c\u001a\u00020\u00078\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u001a\u0010\u001bR\"\u0010!\u001a\u00020\u00078\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u001d\u0010\u001b\u001a\u0004\u0008\u001e\u0010\t\"\u0004\u0008\u001f\u0010 R\u001b\u0010#\u001a\u00020\u00028BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u0011\u0010\"\u001a\u0004\u0008\u001d\u0010\u000b\u00a8\u0006$"
    }
    d2 = {
        "Lcom/immomo/molive/debuger/performance/tracer/memory/MemTracer;",
        "Ll/cs2;",
        "Ll/ogy;",
        "Ll/ci2;",
        "memConfig",
        "<init>",
        "(Ll/ci2;)V",
        "",
        "j",
        "()Z",
        "k",
        "()Ll/ogy;",
        "Landroid/content/Context;",
        "context",
        "",
        "l",
        "(Landroid/content/Context;)V",
        "i",
        "Landroid/app/ActivityManager;",
        "e",
        "Landroid/app/ActivityManager;",
        "mActivityManager",
        "Landroid/app/ActivityManager$MemoryInfo;",
        "f",
        "Landroid/app/ActivityManager$MemoryInfo;",
        "totalMemInfo",
        "g",
        "Z",
        "memTotalTracerEnable",
        "h",
        "getMemTracerEnable",
        "setMemTracerEnable",
        "(Z)V",
        "memTracerEnable",
        "Lkotlin/Lazy;",
        "currentMem",
        "apm-tracer_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# instance fields
.field private e:Landroid/app/ActivityManager;

.field private f:Landroid/app/ActivityManager$MemoryInfo;

.field private g:Z

.field private h:Z

.field private final i:Lkotlin/Lazy;


# direct methods
.method public constructor <init>(Ll/ci2;)V
    .locals 0
    .param p1    # Ll/ci2;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Ll/cs2;-><init>(Ll/ci2;)V

    .line 5
    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    iput-boolean p1, p0, Lcom/immomo/molive/debuger/performance/tracer/memory/MemTracer;->g:Z

    .line 9
    .line 10
    iput-boolean p1, p0, Lcom/immomo/molive/debuger/performance/tracer/memory/MemTracer;->h:Z

    .line 11
    .line 12
    sget-object p1, Lcom/immomo/molive/debuger/performance/tracer/memory/MemTracer$currentMem$2;->INSTANCE:Lcom/immomo/molive/debuger/performance/tracer/memory/MemTracer$currentMem$2;

    .line 13
    .line 14
    invoke-static {p1}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, p0, Lcom/immomo/molive/debuger/performance/tracer/memory/MemTracer;->i:Lkotlin/Lazy;

    .line 19
    .line 20
    return-void
.end method

.method private final h()Ll/ogy;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/molive/debuger/performance/tracer/memory/MemTracer;->i:Lkotlin/Lazy;

    .line 2
    .line 3
    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/ogy;

    .line 8
    .line 9
    return-object p0
.end method

.method private final j()Z
    .locals 1

    .line 1
    sget p0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v0, 0x1c

    .line 4
    .line 5
    if-gt p0, v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method


# virtual methods
.method public bridge synthetic c()Ll/erl;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/immomo/molive/debuger/performance/tracer/memory/MemTracer;->k()Ll/ogy;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public i()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/molive/debuger/performance/tracer/memory/MemTracer;->h:Z

    .line 2
    .line 3
    return p0
.end method

.method public k()Ll/ogy;
    .locals 7
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    iget-boolean v1, p0, Lcom/immomo/molive/debuger/performance/tracer/memory/MemTracer;->g:Z

    .line 3
    .line 4
    if-eqz v1, :cond_1

    .line 5
    .line 6
    iget-object v1, p0, Lcom/immomo/molive/debuger/performance/tracer/memory/MemTracer;->f:Landroid/app/ActivityManager$MemoryInfo;

    .line 7
    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    new-instance v1, Landroid/app/ActivityManager$MemoryInfo;

    .line 11
    .line 12
    invoke-direct {v1}, Landroid/app/ActivityManager$MemoryInfo;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v1, p0, Lcom/immomo/molive/debuger/performance/tracer/memory/MemTracer;->f:Landroid/app/ActivityManager$MemoryInfo;

    .line 16
    .line 17
    :cond_0
    iget-object v1, p0, Lcom/immomo/molive/debuger/performance/tracer/memory/MemTracer;->e:Landroid/app/ActivityManager;

    .line 18
    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    iget-object v2, p0, Lcom/immomo/molive/debuger/performance/tracer/memory/MemTracer;->f:Landroid/app/ActivityManager$MemoryInfo;

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Landroid/app/ActivityManager;->getMemoryInfo(Landroid/app/ActivityManager$MemoryInfo;)V

    .line 24
    .line 25
    .line 26
    :cond_1
    invoke-direct {p0}, Lcom/immomo/molive/debuger/performance/tracer/memory/MemTracer;->j()Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-nez v1, :cond_2

    .line 31
    .line 32
    new-instance v1, Landroid/os/Debug$MemoryInfo;

    .line 33
    .line 34
    invoke-direct {v1}, Landroid/os/Debug$MemoryInfo;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-static {v1}, Landroid/os/Debug;->getMemoryInfo(Landroid/os/Debug$MemoryInfo;)V

    .line 38
    .line 39
    .line 40
    goto :goto_2

    .line 41
    :cond_2
    iget-object v1, p0, Lcom/immomo/molive/debuger/performance/tracer/memory/MemTracer;->e:Landroid/app/ActivityManager;

    .line 42
    .line 43
    const/4 v2, 0x0

    .line 44
    if-eqz v1, :cond_3

    .line 45
    .line 46
    invoke-static {}, Landroid/os/Process;->myPid()I

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    filled-new-array {v3}, [I

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    invoke-virtual {v1, v3}, Landroid/app/ActivityManager;->getProcessMemoryInfo([I)[Landroid/os/Debug$MemoryInfo;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    goto :goto_0

    .line 59
    :cond_3
    move-object v1, v2

    .line 60
    :goto_0
    new-instance v3, Landroid/app/ActivityManager$MemoryInfo;

    .line 61
    .line 62
    invoke-direct {v3}, Landroid/app/ActivityManager$MemoryInfo;-><init>()V

    .line 63
    .line 64
    .line 65
    iget-object v4, p0, Lcom/immomo/molive/debuger/performance/tracer/memory/MemTracer;->e:Landroid/app/ActivityManager;

    .line 66
    .line 67
    if-eqz v4, :cond_4

    .line 68
    .line 69
    invoke-virtual {v4, v3}, Landroid/app/ActivityManager;->getMemoryInfo(Landroid/app/ActivityManager$MemoryInfo;)V

    .line 70
    .line 71
    .line 72
    :cond_4
    if-eqz v1, :cond_6

    .line 73
    .line 74
    array-length v3, v1

    .line 75
    if-nez v3, :cond_5

    .line 76
    .line 77
    const/4 v3, 0x1

    .line 78
    goto :goto_1

    .line 79
    :cond_5
    move v3, v0

    .line 80
    :goto_1
    if-nez v3, :cond_6

    .line 81
    .line 82
    aget-object v1, v1, v0

    .line 83
    .line 84
    goto :goto_2

    .line 85
    :cond_6
    move-object v1, v2

    .line 86
    :goto_2
    if-eqz v1, :cond_7

    .line 87
    .line 88
    invoke-virtual {v1}, Landroid/os/Debug$MemoryInfo;->getTotalPss()I

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    goto :goto_3

    .line 93
    :cond_7
    move v1, v0

    .line 94
    :goto_3
    if-ltz v1, :cond_8

    .line 95
    .line 96
    invoke-direct {p0}, Lcom/immomo/molive/debuger/performance/tracer/memory/MemTracer;->h()Ll/ogy;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    int-to-float v1, v1

    .line 101
    const/high16 v3, 0x44800000    # 1024.0f

    .line 102
    .line 103
    div-float/2addr v1, v3

    .line 104
    float-to-int v1, v1

    .line 105
    invoke-virtual {v2, v1}, Ll/ogy;->e(I)V

    .line 106
    .line 107
    .line 108
    :cond_8
    iget-object v1, p0, Lcom/immomo/molive/debuger/performance/tracer/memory/MemTracer;->f:Landroid/app/ActivityManager$MemoryInfo;

    .line 109
    .line 110
    if-eqz v1, :cond_a

    .line 111
    .line 112
    iget-wide v2, v1, Landroid/app/ActivityManager$MemoryInfo;->totalMem:J

    .line 113
    .line 114
    const-wide/16 v4, 0x0

    .line 115
    .line 116
    cmp-long v2, v2, v4

    .line 117
    .line 118
    if-lez v2, :cond_9

    .line 119
    .line 120
    iget-wide v2, v1, Landroid/app/ActivityManager$MemoryInfo;->availMem:J

    .line 121
    .line 122
    cmp-long v2, v2, v4

    .line 123
    .line 124
    if-lez v2, :cond_9

    .line 125
    .line 126
    invoke-direct {p0}, Lcom/immomo/molive/debuger/performance/tracer/memory/MemTracer;->h()Ll/ogy;

    .line 127
    .line 128
    .line 129
    move-result-object v2

    .line 130
    iget-wide v3, v1, Landroid/app/ActivityManager$MemoryInfo;->availMem:J

    .line 131
    .line 132
    const-wide/32 v5, 0x100000

    .line 133
    .line 134
    .line 135
    div-long/2addr v3, v5

    .line 136
    long-to-int v3, v3

    .line 137
    invoke-virtual {v2, v3}, Ll/ogy;->f(I)V

    .line 138
    .line 139
    .line 140
    invoke-direct {p0}, Lcom/immomo/molive/debuger/performance/tracer/memory/MemTracer;->h()Ll/ogy;

    .line 141
    .line 142
    .line 143
    move-result-object v2

    .line 144
    iget-wide v3, v1, Landroid/app/ActivityManager$MemoryInfo;->totalMem:J

    .line 145
    .line 146
    div-long/2addr v3, v5

    .line 147
    long-to-int v1, v3

    .line 148
    invoke-virtual {v2, v1}, Ll/ogy;->g(I)V

    .line 149
    .line 150
    .line 151
    goto :goto_4

    .line 152
    :cond_9
    iput-boolean v0, p0, Lcom/immomo/molive/debuger/performance/tracer/memory/MemTracer;->g:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 153
    .line 154
    goto :goto_4

    .line 155
    :catch_0
    iput-boolean v0, p0, Lcom/immomo/molive/debuger/performance/tracer/memory/MemTracer;->h:Z

    .line 156
    .line 157
    :cond_a
    :goto_4
    invoke-direct {p0}, Lcom/immomo/molive/debuger/performance/tracer/memory/MemTracer;->h()Ll/ogy;

    .line 158
    .line 159
    .line 160
    move-result-object p0

    .line 161
    return-object p0
.end method

.method public final l(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    const-string v0, "activity"

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    check-cast p1, Landroid/app/ActivityManager;

    .line 12
    .line 13
    iput-object p1, p0, Lcom/immomo/molive/debuger/performance/tracer/memory/MemTracer;->e:Landroid/app/ActivityManager;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/cs2;->f()V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    const-string p0, "null cannot be cast to non-null type android.app.ActivityManager"

    .line 20
    .line 21
    invoke-static {p0}, Lb;->a(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    const/4 p1, 0x0

    .line 26
    iput-boolean p1, p0, Lcom/immomo/molive/debuger/performance/tracer/memory/MemTracer;->h:Z

    .line 27
    .line 28
    return-void
.end method
