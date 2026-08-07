.class public abstract Ll/rdk;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Ll/rdk;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/yod;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/yod;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/rdk;->a:Ll/rdk;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Ll/d13;[F)V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/d13;->m()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Ll/d13;->j()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const/4 v1, 0x1

    .line 10
    const/4 v2, 0x0

    .line 11
    move v4, v1

    .line 12
    move v3, v2

    .line 13
    :goto_0
    array-length v5, p1

    .line 14
    const/4 v6, 0x0

    .line 15
    const/4 v7, -0x1

    .line 16
    if-ge v3, v5, :cond_5

    .line 17
    .line 18
    if-eqz v4, :cond_5

    .line 19
    .line 20
    aget v4, p1, v3

    .line 21
    .line 22
    float-to-int v4, v4

    .line 23
    add-int/lit8 v5, v3, 0x1

    .line 24
    .line 25
    aget v8, p1, v5

    .line 26
    .line 27
    float-to-int v8, v8

    .line 28
    if-lt v4, v7, :cond_4

    .line 29
    .line 30
    if-gt v4, v0, :cond_4

    .line 31
    .line 32
    if-lt v8, v7, :cond_4

    .line 33
    .line 34
    if-gt v8, p0, :cond_4

    .line 35
    .line 36
    if-ne v4, v7, :cond_0

    .line 37
    .line 38
    aput v6, p1, v3

    .line 39
    .line 40
    :goto_1
    move v4, v1

    .line 41
    goto :goto_2

    .line 42
    :cond_0
    if-ne v4, v0, :cond_1

    .line 43
    .line 44
    add-int/lit8 v4, v0, -0x1

    .line 45
    .line 46
    int-to-float v4, v4

    .line 47
    aput v4, p1, v3

    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_1
    move v4, v2

    .line 51
    :goto_2
    if-ne v8, v7, :cond_2

    .line 52
    .line 53
    aput v6, p1, v5

    .line 54
    .line 55
    :goto_3
    move v4, v1

    .line 56
    goto :goto_4

    .line 57
    :cond_2
    if-ne v8, p0, :cond_3

    .line 58
    .line 59
    add-int/lit8 v4, p0, -0x1

    .line 60
    .line 61
    int-to-float v4, v4

    .line 62
    aput v4, p1, v5

    .line 63
    .line 64
    goto :goto_3

    .line 65
    :cond_3
    :goto_4
    add-int/lit8 v3, v3, 0x2

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_4
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    throw p0

    .line 73
    :cond_5
    array-length v3, p1

    .line 74
    add-int/lit8 v3, v3, -0x2

    .line 75
    .line 76
    move v4, v1

    .line 77
    :goto_5
    if-ltz v3, :cond_b

    .line 78
    .line 79
    if-eqz v4, :cond_b

    .line 80
    .line 81
    aget v4, p1, v3

    .line 82
    .line 83
    float-to-int v4, v4

    .line 84
    add-int/lit8 v5, v3, 0x1

    .line 85
    .line 86
    aget v8, p1, v5

    .line 87
    .line 88
    float-to-int v8, v8

    .line 89
    if-lt v4, v7, :cond_a

    .line 90
    .line 91
    if-gt v4, v0, :cond_a

    .line 92
    .line 93
    if-lt v8, v7, :cond_a

    .line 94
    .line 95
    if-gt v8, p0, :cond_a

    .line 96
    .line 97
    if-ne v4, v7, :cond_6

    .line 98
    .line 99
    aput v6, p1, v3

    .line 100
    .line 101
    :goto_6
    move v4, v1

    .line 102
    goto :goto_7

    .line 103
    :cond_6
    if-ne v4, v0, :cond_7

    .line 104
    .line 105
    add-int/lit8 v4, v0, -0x1

    .line 106
    .line 107
    int-to-float v4, v4

    .line 108
    aput v4, p1, v3

    .line 109
    .line 110
    goto :goto_6

    .line 111
    :cond_7
    move v4, v2

    .line 112
    :goto_7
    if-ne v8, v7, :cond_8

    .line 113
    .line 114
    aput v6, p1, v5

    .line 115
    .line 116
    :goto_8
    move v4, v1

    .line 117
    goto :goto_9

    .line 118
    :cond_8
    if-ne v8, p0, :cond_9

    .line 119
    .line 120
    add-int/lit8 v4, p0, -0x1

    .line 121
    .line 122
    int-to-float v4, v4

    .line 123
    aput v4, p1, v5

    .line 124
    .line 125
    goto :goto_8

    .line 126
    :cond_9
    :goto_9
    add-int/lit8 v3, v3, -0x2

    .line 127
    .line 128
    goto :goto_5

    .line 129
    :cond_a
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    throw p0

    .line 134
    :cond_b
    return-void
.end method

.method public static b()Ll/rdk;
    .locals 1

    .line 1
    sget-object v0, Ll/rdk;->a:Ll/rdk;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public abstract c(Ll/d13;IIFFFFFFFFFFFFFFFF)Ll/d13;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation
.end method

.method public abstract d(Ll/d13;IILl/xw60;)Ll/d13;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation
.end method
