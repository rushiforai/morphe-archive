.class public final Ll/otb;
.super Ll/cs2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/cs2<",
        "Ll/btb;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000>\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0017\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J#\u0010\u000b\u001a\u000e\u0012\u0004\u0012\u00020\n\u0012\u0004\u0012\u00020\n0\t2\u0006\u0010\u0008\u001a\u00020\u0007H\u0002\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u000f\u0010\r\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u000f\u0010\u0010\u001a\u00020\u000fH\u0016\u00a2\u0006\u0004\u0008\u0010\u0010\u0011J\u000f\u0010\u0013\u001a\u00020\u0012H\u0016\u00a2\u0006\u0004\u0008\u0013\u0010\u0014R\u0017\u0010\u001a\u001a\u00020\u00158\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0016\u0010\u0017\u001a\u0004\u0008\u0018\u0010\u0019R\"\u0010!\u001a\u00020\u00078\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u001b\u0010\u001c\u001a\u0004\u0008\u001d\u0010\u001e\"\u0004\u0008\u001f\u0010 R\"\u0010&\u001a\u00020\u000f8\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u0013\u0010\"\u001a\u0004\u0008#\u0010\u0011\"\u0004\u0008$\u0010%R\u0014\u0010(\u001a\u00020\u00028\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u000b\u0010\'R\u0017\u0010\u0004\u001a\u00020\u00038\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0010\u0010)\u001a\u0004\u0008*\u0010+\u00a8\u0006,"
    }
    d2 = {
        "Ll/otb;",
        "Ll/cs2;",
        "Ll/btb;",
        "Ll/ci2;",
        "cpuConfig",
        "<init>",
        "(Ll/ci2;)V",
        "",
        "sampleIntervalMs",
        "Lkotlin/Pair;",
        "Ll/ntb;",
        "h",
        "(J)Lkotlin/Pair;",
        "j",
        "()Ll/btb;",
        "",
        "i",
        "()Z",
        "",
        "g",
        "()V",
        "Ljava/text/DecimalFormat;",
        "e",
        "Ljava/text/DecimalFormat;",
        "getDf",
        "()Ljava/text/DecimalFormat;",
        "df",
        "f",
        "J",
        "getLastSampleTs",
        "()J",
        "setLastSampleTs",
        "(J)V",
        "lastSampleTs",
        "Z",
        "getCpuTracerEnable",
        "setCpuTracerEnable",
        "(Z)V",
        "cpuTracerEnable",
        "Ll/btb;",
        "cupUsageInfo",
        "Ll/ci2;",
        "getCpuConfig",
        "()Ll/ci2;",
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
.field private final e:Ljava/text/DecimalFormat;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private f:J

.field private g:Z

.field private final h:Ll/btb;

.field private final i:Ll/ci2;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/ci2;)V
    .locals 2
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
    iput-object p1, p0, Ll/otb;->i:Ll/ci2;

    .line 8
    .line 9
    new-instance p1, Ljava/text/DecimalFormat;

    .line 10
    .line 11
    const-string v0, "#.#"

    .line 12
    .line 13
    invoke-direct {p1, v0}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Ll/otb;->e:Ljava/text/DecimalFormat;

    .line 17
    .line 18
    const/4 p1, 0x1

    .line 19
    iput-boolean p1, p0, Ll/otb;->g:Z

    .line 20
    .line 21
    new-instance p1, Ll/btb;

    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    const/4 v1, 0x0

    .line 25
    invoke-direct {p1, v0, v0, v1}, Ll/btb;-><init>(FFI)V

    .line 26
    .line 27
    .line 28
    iput-object p1, p0, Ll/otb;->h:Ll/btb;

    .line 29
    .line 30
    return-void
.end method

.method private final h(J)Lkotlin/Pair;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Lkotlin/Pair<",
            "Ll/ntb;",
            "Ll/ntb;",
            ">;"
        }
    .end annotation

    .line 1
    sget p0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v0, 0x1a

    .line 4
    .line 5
    if-lt p0, v0, :cond_0

    .line 6
    .line 7
    new-instance p0, Lkotlin/Pair;

    .line 8
    .line 9
    sget-object v0, Lcom/immomo/molive/apm/cpu/CpuUtils;->INSTANCE:Lcom/immomo/molive/apm/cpu/CpuUtils;

    .line 10
    .line 11
    invoke-virtual {v0, p1, p2}, Lcom/immomo/molive/apm/cpu/CpuUtils;->f(J)Ll/ntb;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {v0}, Lcom/immomo/molive/apm/cpu/CpuUtils;->h()Ll/ntb;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    invoke-direct {p0, p1, p2}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_0
    sget-object p0, Lcom/immomo/molive/apm/cpu/CpuUtils;->INSTANCE:Lcom/immomo/molive/apm/cpu/CpuUtils;

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/immomo/molive/apm/cpu/CpuUtils;->e()Lkotlin/Pair;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method


# virtual methods
.method public bridge synthetic c()Ll/erl;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/otb;->j()Ll/btb;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public g()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/cs2;->g()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Ll/otb;->f:J

    .line 7
    .line 8
    iget-object v0, p0, Ll/otb;->h:Ll/btb;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, v1}, Ll/btb;->f(F)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/otb;->h:Ll/btb;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ll/btb;->d(F)V

    .line 17
    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    iput-boolean v0, p0, Ll/otb;->g:Z

    .line 21
    .line 22
    sget-object p0, Ll/itb;->INSTANCE:Ll/itb;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/itb;->l()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public i()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/otb;->g:Z

    .line 2
    .line 3
    return p0
.end method

.method public j()Ll/btb;
    .locals 11
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 3
    .line 4
    .line 5
    move-result-wide v1

    .line 6
    iget-wide v3, p0, Ll/otb;->f:J

    .line 7
    .line 8
    const-wide/16 v5, 0x0

    .line 9
    .line 10
    cmp-long v7, v3, v5

    .line 11
    .line 12
    if-nez v7, :cond_0

    .line 13
    .line 14
    iget-object v3, p0, Ll/otb;->i:Ll/ci2;

    .line 15
    .line 16
    invoke-virtual {v3}, Ll/ci2;->a()J

    .line 17
    .line 18
    .line 19
    move-result-wide v3

    .line 20
    invoke-direct {p0, v3, v4}, Ll/otb;->h(J)Lkotlin/Pair;

    .line 21
    .line 22
    .line 23
    sget-object v3, Lcom/immomo/molive/apm/cpu/CpuUtils;->INSTANCE:Lcom/immomo/molive/apm/cpu/CpuUtils;

    .line 24
    .line 25
    invoke-virtual {v3}, Lcom/immomo/molive/apm/cpu/CpuUtils;->i()J

    .line 26
    .line 27
    .line 28
    goto/16 :goto_1

    .line 29
    .line 30
    :cond_0
    sub-long v3, v1, v3

    .line 31
    .line 32
    cmp-long v5, v3, v5

    .line 33
    .line 34
    const/4 v6, 0x0

    .line 35
    if-gtz v5, :cond_1

    .line 36
    .line 37
    iget-object v1, p0, Ll/otb;->h:Ll/btb;

    .line 38
    .line 39
    invoke-virtual {v1, v6}, Ll/btb;->f(F)V

    .line 40
    .line 41
    .line 42
    iget-object v1, p0, Ll/otb;->h:Ll/btb;

    .line 43
    .line 44
    invoke-virtual {v1, v6}, Ll/btb;->d(F)V

    .line 45
    .line 46
    .line 47
    iget-object v1, p0, Ll/otb;->h:Ll/btb;

    .line 48
    .line 49
    invoke-virtual {v1, v0}, Ll/btb;->e(I)V

    .line 50
    .line 51
    .line 52
    iget-object p0, p0, Ll/otb;->h:Ll/btb;

    .line 53
    .line 54
    return-object p0

    .line 55
    :cond_1
    invoke-direct {p0, v3, v4}, Ll/otb;->h(J)Lkotlin/Pair;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    invoke-virtual {v3}, Lkotlin/Pair;->getFirst()Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v4

    .line 63
    check-cast v4, Ll/ntb;

    .line 64
    .line 65
    invoke-virtual {v4}, Ll/ntb;->a()Z

    .line 66
    .line 67
    .line 68
    move-result v4

    .line 69
    if-eqz v4, :cond_5

    .line 70
    .line 71
    invoke-virtual {v3}, Lkotlin/Pair;->getSecond()Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v4

    .line 75
    check-cast v4, Ll/ntb;

    .line 76
    .line 77
    invoke-virtual {v4}, Ll/ntb;->a()Z

    .line 78
    .line 79
    .line 80
    move-result v4

    .line 81
    if-nez v4, :cond_2

    .line 82
    .line 83
    goto :goto_2

    .line 84
    :cond_2
    invoke-virtual {v3}, Lkotlin/Pair;->getFirst()Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v4

    .line 88
    check-cast v4, Ll/ntb;

    .line 89
    .line 90
    invoke-virtual {v4}, Ll/ntb;->b()J

    .line 91
    .line 92
    .line 93
    move-result-wide v4

    .line 94
    invoke-virtual {v3}, Lkotlin/Pair;->getSecond()Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    check-cast v3, Ll/ntb;

    .line 99
    .line 100
    invoke-virtual {v3}, Ll/ntb;->b()J

    .line 101
    .line 102
    .line 103
    move-result-wide v7

    .line 104
    sget-object v3, Lcom/immomo/molive/apm/cpu/CpuUtils;->INSTANCE:Lcom/immomo/molive/apm/cpu/CpuUtils;

    .line 105
    .line 106
    invoke-virtual {v3}, Lcom/immomo/molive/apm/cpu/CpuUtils;->i()J

    .line 107
    .line 108
    .line 109
    move-result-wide v9

    .line 110
    long-to-float v7, v7

    .line 111
    long-to-float v4, v4

    .line 112
    sub-float v4, v7, v4

    .line 113
    .line 114
    div-float/2addr v4, v7

    .line 115
    const/high16 v5, 0x42c80000    # 100.0f

    .line 116
    .line 117
    mul-float/2addr v4, v5

    .line 118
    long-to-float v8, v9

    .line 119
    div-float/2addr v8, v7

    .line 120
    mul-float/2addr v8, v5

    .line 121
    iget-object v5, p0, Ll/otb;->h:Ll/btb;

    .line 122
    .line 123
    iget-object v7, p0, Ll/otb;->e:Ljava/text/DecimalFormat;

    .line 124
    .line 125
    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 126
    .line 127
    .line 128
    move-result-object v4

    .line 129
    invoke-virtual {v7, v4}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v4

    .line 133
    if-eqz v4, :cond_3

    .line 134
    .line 135
    invoke-static {v4}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 136
    .line 137
    .line 138
    move-result v4

    .line 139
    goto :goto_0

    .line 140
    :cond_3
    move v4, v6

    .line 141
    :goto_0
    invoke-virtual {v5, v4}, Ll/btb;->f(F)V

    .line 142
    .line 143
    .line 144
    iget-object v4, p0, Ll/otb;->h:Ll/btb;

    .line 145
    .line 146
    iget-object v5, p0, Ll/otb;->e:Ljava/text/DecimalFormat;

    .line 147
    .line 148
    invoke-static {v8}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 149
    .line 150
    .line 151
    move-result-object v7

    .line 152
    invoke-virtual {v5, v7}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v5

    .line 156
    if-eqz v5, :cond_4

    .line 157
    .line 158
    invoke-static {v5}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 159
    .line 160
    .line 161
    move-result v6

    .line 162
    :cond_4
    invoke-virtual {v4, v6}, Ll/btb;->d(F)V

    .line 163
    .line 164
    .line 165
    iget-object v4, p0, Ll/otb;->h:Ll/btb;

    .line 166
    .line 167
    invoke-virtual {v3}, Lcom/immomo/molive/apm/cpu/CpuUtils;->d()I

    .line 168
    .line 169
    .line 170
    move-result v3

    .line 171
    invoke-virtual {v4, v3}, Ll/btb;->e(I)V

    .line 172
    .line 173
    .line 174
    :goto_1
    iput-wide v1, p0, Ll/otb;->f:J

    .line 175
    .line 176
    goto :goto_3

    .line 177
    :cond_5
    :goto_2
    iput-boolean v0, p0, Ll/otb;->g:Z

    .line 178
    .line 179
    iget-object v1, p0, Ll/otb;->h:Ll/btb;

    .line 180
    .line 181
    invoke-virtual {v1, v6}, Ll/btb;->f(F)V

    .line 182
    .line 183
    .line 184
    iget-object v1, p0, Ll/otb;->h:Ll/btb;

    .line 185
    .line 186
    invoke-virtual {v1, v6}, Ll/btb;->d(F)V

    .line 187
    .line 188
    .line 189
    iget-object v1, p0, Ll/otb;->h:Ll/btb;

    .line 190
    .line 191
    invoke-virtual {v1, v0}, Ll/btb;->e(I)V

    .line 192
    .line 193
    .line 194
    iget-object p0, p0, Ll/otb;->h:Ll/btb;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 195
    .line 196
    return-object p0

    .line 197
    :catch_0
    iput-boolean v0, p0, Ll/otb;->g:Z

    .line 198
    .line 199
    :goto_3
    iget-object p0, p0, Ll/otb;->h:Ll/btb;

    .line 200
    .line 201
    return-object p0
.end method
