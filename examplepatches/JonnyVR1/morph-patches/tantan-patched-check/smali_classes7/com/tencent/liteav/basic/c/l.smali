.class public Lcom/tencent/liteav/basic/c/l;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:[F

.field public static final b:[F

.field public static final c:[F

.field public static final d:[F

.field public static final e:[F


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    new-array v1, v0, [F

    .line 4
    .line 5
    fill-array-data v1, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v1, Lcom/tencent/liteav/basic/c/l;->a:[F

    .line 9
    .line 10
    new-array v1, v0, [F

    .line 11
    .line 12
    fill-array-data v1, :array_1

    .line 13
    .line 14
    .line 15
    sput-object v1, Lcom/tencent/liteav/basic/c/l;->b:[F

    .line 16
    .line 17
    new-array v1, v0, [F

    .line 18
    .line 19
    fill-array-data v1, :array_2

    .line 20
    .line 21
    .line 22
    sput-object v1, Lcom/tencent/liteav/basic/c/l;->c:[F

    .line 23
    .line 24
    new-array v1, v0, [F

    .line 25
    .line 26
    fill-array-data v1, :array_3

    .line 27
    .line 28
    .line 29
    sput-object v1, Lcom/tencent/liteav/basic/c/l;->d:[F

    .line 30
    .line 31
    new-array v0, v0, [F

    .line 32
    .line 33
    fill-array-data v0, :array_4

    .line 34
    .line 35
    .line 36
    sput-object v0, Lcom/tencent/liteav/basic/c/l;->e:[F

    .line 37
    .line 38
    return-void

    .line 39
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 40
    .line 41
    .line 42
    .line 43
    .line 44
    .line 45
    .line 46
    .line 47
    .line 48
    .line 49
    .line 50
    .line 51
    .line 52
    .line 53
    .line 54
    .line 55
    .line 56
    .line 57
    .line 58
    .line 59
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
    .end array-data

    .line 60
    .line 61
    .line 62
    .line 63
    .line 64
    .line 65
    .line 66
    .line 67
    .line 68
    .line 69
    .line 70
    .line 71
    .line 72
    .line 73
    .line 74
    .line 75
    :array_2
    .array-data 4
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
        0x3f800000    # 1.0f
    .end array-data

    :array_3
    .array-data 4
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
    .end array-data

    :array_4
    .array-data 4
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private static a(F)F
    .locals 1

    .line 167
    const/4 v0, 0x0

    cmpl-float p0, p0, v0

    if-nez p0, :cond_0

    const/high16 p0, 0x3f800000    # 1.0f

    return p0

    :cond_0
    return v0
.end method

.method public static a(Lcom/tencent/liteav/basic/c/k;ZZ)[F
    .locals 10

    .line 1
    sget-object v0, Lcom/tencent/liteav/basic/c/l$1;->a:[I

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    aget p0, v0, p0

    .line 8
    .line 9
    const/4 v0, 0x3

    .line 10
    const/4 v1, 0x2

    .line 11
    const/4 v2, 0x1

    .line 12
    if-eq p0, v2, :cond_2

    .line 13
    .line 14
    if-eq p0, v1, :cond_1

    .line 15
    .line 16
    if-eq p0, v0, :cond_0

    .line 17
    .line 18
    sget-object p0, Lcom/tencent/liteav/basic/c/l;->a:[F

    .line 19
    .line 20
    invoke-virtual {p0}, [F->clone()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    check-cast p0, [F

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    sget-object p0, Lcom/tencent/liteav/basic/c/l;->d:[F

    .line 28
    .line 29
    invoke-virtual {p0}, [F->clone()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    check-cast p0, [F

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    sget-object p0, Lcom/tencent/liteav/basic/c/l;->c:[F

    .line 37
    .line 38
    invoke-virtual {p0}, [F->clone()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    check-cast p0, [F

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_2
    sget-object p0, Lcom/tencent/liteav/basic/c/l;->b:[F

    .line 46
    .line 47
    invoke-virtual {p0}, [F->clone()Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    check-cast p0, [F

    .line 52
    .line 53
    :goto_0
    const/16 v3, 0x8

    .line 54
    .line 55
    const/4 v4, 0x7

    .line 56
    const/4 v5, 0x6

    .line 57
    const/4 v6, 0x5

    .line 58
    const/4 v7, 0x4

    .line 59
    const/4 v8, 0x0

    .line 60
    if-eqz p1, :cond_3

    .line 61
    .line 62
    new-array p1, v3, [F

    .line 63
    .line 64
    aget v9, p0, v8

    .line 65
    .line 66
    invoke-static {v9}, Lcom/tencent/liteav/basic/c/l;->a(F)F

    .line 67
    .line 68
    .line 69
    move-result v9

    .line 70
    aput v9, p1, v8

    .line 71
    .line 72
    aget v9, p0, v2

    .line 73
    .line 74
    aput v9, p1, v2

    .line 75
    .line 76
    aget v9, p0, v1

    .line 77
    .line 78
    invoke-static {v9}, Lcom/tencent/liteav/basic/c/l;->a(F)F

    .line 79
    .line 80
    .line 81
    move-result v9

    .line 82
    aput v9, p1, v1

    .line 83
    .line 84
    aget v9, p0, v0

    .line 85
    .line 86
    aput v9, p1, v0

    .line 87
    .line 88
    aget v9, p0, v7

    .line 89
    .line 90
    invoke-static {v9}, Lcom/tencent/liteav/basic/c/l;->a(F)F

    .line 91
    .line 92
    .line 93
    move-result v9

    .line 94
    aput v9, p1, v7

    .line 95
    .line 96
    aget v9, p0, v6

    .line 97
    .line 98
    aput v9, p1, v6

    .line 99
    .line 100
    aget v9, p0, v5

    .line 101
    .line 102
    invoke-static {v9}, Lcom/tencent/liteav/basic/c/l;->a(F)F

    .line 103
    .line 104
    .line 105
    move-result v9

    .line 106
    aput v9, p1, v5

    .line 107
    .line 108
    aget p0, p0, v4

    .line 109
    .line 110
    aput p0, p1, v4

    .line 111
    .line 112
    move-object p0, p1

    .line 113
    :cond_3
    if-eqz p2, :cond_4

    .line 114
    .line 115
    new-array p1, v3, [F

    .line 116
    .line 117
    aget p2, p0, v8

    .line 118
    .line 119
    aput p2, p1, v8

    .line 120
    .line 121
    aget p2, p0, v2

    .line 122
    .line 123
    invoke-static {p2}, Lcom/tencent/liteav/basic/c/l;->a(F)F

    .line 124
    .line 125
    .line 126
    move-result p2

    .line 127
    aput p2, p1, v2

    .line 128
    .line 129
    aget p2, p0, v1

    .line 130
    .line 131
    aput p2, p1, v1

    .line 132
    .line 133
    aget p2, p0, v0

    .line 134
    .line 135
    invoke-static {p2}, Lcom/tencent/liteav/basic/c/l;->a(F)F

    .line 136
    .line 137
    .line 138
    move-result p2

    .line 139
    aput p2, p1, v0

    .line 140
    .line 141
    aget p2, p0, v7

    .line 142
    .line 143
    aput p2, p1, v7

    .line 144
    .line 145
    aget p2, p0, v6

    .line 146
    .line 147
    invoke-static {p2}, Lcom/tencent/liteav/basic/c/l;->a(F)F

    .line 148
    .line 149
    .line 150
    move-result p2

    .line 151
    aput p2, p1, v6

    .line 152
    .line 153
    aget p2, p0, v5

    .line 154
    .line 155
    aput p2, p1, v5

    .line 156
    .line 157
    aget p0, p0, v4

    .line 158
    .line 159
    invoke-static {p0}, Lcom/tencent/liteav/basic/c/l;->a(F)F

    .line 160
    .line 161
    .line 162
    move-result p0

    .line 163
    aput p0, p1, v4

    .line 164
    .line 165
    return-object p1

    .line 166
    :cond_4
    return-object p0
.end method
