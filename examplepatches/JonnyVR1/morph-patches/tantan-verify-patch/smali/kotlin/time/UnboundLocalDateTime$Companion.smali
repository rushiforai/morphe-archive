.class public final Lkotlin/time/UnboundLocalDateTime$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lkotlin/time/UnboundLocalDateTime;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0015\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0007\u0010\u0008\u00a8\u0006\t"
    }
    d2 = {
        "Lkotlin/time/UnboundLocalDateTime$Companion;",
        "",
        "<init>",
        "()V",
        "Lkotlin/time/Instant;",
        "instant",
        "Lkotlin/time/UnboundLocalDateTime;",
        "a",
        "(Lkotlin/time/Instant;)Lkotlin/time/UnboundLocalDateTime;",
        "kotlin-stdlib"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lkotlin/time/UnboundLocalDateTime$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Lkotlin/time/Instant;)Lkotlin/time/UnboundLocalDateTime;
    .locals 24
    .param p1    # Lkotlin/time/Instant;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual/range {p1 .. p1}, Lkotlin/time/Instant;->getEpochSeconds()J

    .line 5
    .line 6
    .line 7
    move-result-wide v0

    .line 8
    const-wide/32 v2, 0x15180

    .line 9
    .line 10
    .line 11
    div-long v4, v0, v2

    .line 12
    .line 13
    xor-long v6, v0, v2

    .line 14
    .line 15
    const-wide/16 v8, 0x0

    .line 16
    .line 17
    cmp-long v6, v6, v8

    .line 18
    .line 19
    const-wide/16 v10, -0x1

    .line 20
    .line 21
    if-gez v6, :cond_0

    .line 22
    .line 23
    mul-long v6, v4, v2

    .line 24
    .line 25
    cmp-long v6, v6, v0

    .line 26
    .line 27
    if-eqz v6, :cond_0

    .line 28
    .line 29
    add-long/2addr v4, v10

    .line 30
    :cond_0
    rem-long/2addr v0, v2

    .line 31
    xor-long v6, v0, v2

    .line 32
    .line 33
    neg-long v12, v0

    .line 34
    or-long/2addr v12, v0

    .line 35
    and-long/2addr v6, v12

    .line 36
    const/16 v12, 0x3f

    .line 37
    .line 38
    shr-long/2addr v6, v12

    .line 39
    and-long/2addr v2, v6

    .line 40
    add-long/2addr v0, v2

    .line 41
    long-to-int v0, v0

    .line 42
    const-wide/32 v1, 0xafa6c

    .line 43
    .line 44
    .line 45
    add-long/2addr v1, v4

    .line 46
    cmp-long v3, v1, v8

    .line 47
    .line 48
    const-wide/16 v6, 0x190

    .line 49
    .line 50
    const-wide/32 v12, 0x23ab1

    .line 51
    .line 52
    .line 53
    if-gez v3, :cond_1

    .line 54
    .line 55
    const-wide/32 v14, 0xafa6d

    .line 56
    .line 57
    .line 58
    add-long/2addr v4, v14

    .line 59
    div-long/2addr v4, v12

    .line 60
    const-wide/16 v14, 0x1

    .line 61
    .line 62
    sub-long/2addr v4, v14

    .line 63
    mul-long v14, v4, v6

    .line 64
    .line 65
    neg-long v3, v4

    .line 66
    mul-long/2addr v3, v12

    .line 67
    add-long/2addr v1, v3

    .line 68
    goto :goto_0

    .line 69
    :cond_1
    move-wide v14, v8

    .line 70
    :goto_0
    mul-long v3, v6, v1

    .line 71
    .line 72
    const-wide/16 v16, 0x24f

    .line 73
    .line 74
    add-long v3, v3, v16

    .line 75
    .line 76
    div-long/2addr v3, v12

    .line 77
    const-wide/16 v12, 0x16d

    .line 78
    .line 79
    mul-long v16, v12, v3

    .line 80
    .line 81
    const-wide/16 v18, 0x4

    .line 82
    .line 83
    div-long v20, v3, v18

    .line 84
    .line 85
    add-long v16, v16, v20

    .line 86
    .line 87
    const-wide/16 v20, 0x64

    .line 88
    .line 89
    div-long v22, v3, v20

    .line 90
    .line 91
    sub-long v16, v16, v22

    .line 92
    .line 93
    div-long v22, v3, v6

    .line 94
    .line 95
    add-long v16, v16, v22

    .line 96
    .line 97
    sub-long v16, v1, v16

    .line 98
    .line 99
    cmp-long v5, v16, v8

    .line 100
    .line 101
    if-gez v5, :cond_2

    .line 102
    .line 103
    add-long/2addr v3, v10

    .line 104
    mul-long/2addr v12, v3

    .line 105
    div-long v8, v3, v18

    .line 106
    .line 107
    add-long/2addr v12, v8

    .line 108
    div-long v8, v3, v20

    .line 109
    .line 110
    sub-long/2addr v12, v8

    .line 111
    div-long v5, v3, v6

    .line 112
    .line 113
    add-long/2addr v12, v5

    .line 114
    sub-long v16, v1, v12

    .line 115
    .line 116
    :cond_2
    move-wide/from16 v1, v16

    .line 117
    .line 118
    add-long/2addr v3, v14

    .line 119
    long-to-int v1, v1

    .line 120
    mul-int/lit8 v2, v1, 0x5

    .line 121
    .line 122
    add-int/lit8 v2, v2, 0x2

    .line 123
    .line 124
    div-int/lit16 v2, v2, 0x99

    .line 125
    .line 126
    add-int/lit8 v5, v2, 0x2

    .line 127
    .line 128
    rem-int/lit8 v5, v5, 0xc

    .line 129
    .line 130
    add-int/lit8 v8, v5, 0x1

    .line 131
    .line 132
    mul-int/lit16 v5, v2, 0x132

    .line 133
    .line 134
    add-int/lit8 v5, v5, 0x5

    .line 135
    .line 136
    div-int/lit8 v5, v5, 0xa

    .line 137
    .line 138
    sub-int/2addr v1, v5

    .line 139
    add-int/lit8 v9, v1, 0x1

    .line 140
    .line 141
    div-int/lit8 v2, v2, 0xa

    .line 142
    .line 143
    int-to-long v1, v2

    .line 144
    add-long/2addr v3, v1

    .line 145
    long-to-int v7, v3

    .line 146
    div-int/lit16 v10, v0, 0xe10

    .line 147
    .line 148
    mul-int/lit16 v1, v10, 0xe10

    .line 149
    .line 150
    sub-int/2addr v0, v1

    .line 151
    div-int/lit8 v11, v0, 0x3c

    .line 152
    .line 153
    mul-int/lit8 v1, v11, 0x3c

    .line 154
    .line 155
    sub-int v12, v0, v1

    .line 156
    .line 157
    new-instance v6, Lkotlin/time/UnboundLocalDateTime;

    .line 158
    .line 159
    invoke-virtual/range {p1 .. p1}, Lkotlin/time/Instant;->getNanosecondsOfSecond()I

    .line 160
    .line 161
    .line 162
    move-result v13

    .line 163
    invoke-direct/range {v6 .. v13}, Lkotlin/time/UnboundLocalDateTime;-><init>(IIIIIII)V

    .line 164
    .line 165
    .line 166
    return-object v6
.end method
