.class public final Ll/m5c;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:[B


# direct methods
.method public constructor <init>(I[B)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/m5c;->a:I

    .line 5
    .line 6
    iput-object p2, p0, Ll/m5c;->b:[B

    .line 7
    .line 8
    return-void
.end method

.method public static b([BLl/o9l0;Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;)[Ll/m5c;
    .locals 12

    .line 1
    array-length v0, p0

    .line 2
    invoke-virtual {p1}, Ll/o9l0;->h()I

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    if-ne v0, v1, :cond_a

    .line 7
    .line 8
    invoke-virtual {p1, p2}, Ll/o9l0;->f(Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;)Ll/o9l0$b;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p1}, Ll/o9l0$b;->a()[Ll/o9l0$a;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    array-length v0, p2

    .line 17
    const/4 v1, 0x0

    .line 18
    move v2, v1

    .line 19
    move v3, v2

    .line 20
    :goto_0
    if-ge v2, v0, :cond_0

    .line 21
    .line 22
    aget-object v4, p2, v2

    .line 23
    .line 24
    invoke-virtual {v4}, Ll/o9l0$a;->a()I

    .line 25
    .line 26
    .line 27
    move-result v4

    .line 28
    add-int/2addr v3, v4

    .line 29
    add-int/lit8 v2, v2, 0x1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    new-array v0, v3, [Ll/m5c;

    .line 33
    .line 34
    array-length v2, p2

    .line 35
    move v4, v1

    .line 36
    move v5, v4

    .line 37
    :goto_1
    if-ge v4, v2, :cond_2

    .line 38
    .line 39
    aget-object v6, p2, v4

    .line 40
    .line 41
    move v7, v1

    .line 42
    :goto_2
    invoke-virtual {v6}, Ll/o9l0$a;->a()I

    .line 43
    .line 44
    .line 45
    move-result v8

    .line 46
    if-ge v7, v8, :cond_1

    .line 47
    .line 48
    invoke-virtual {v6}, Ll/o9l0$a;->b()I

    .line 49
    .line 50
    .line 51
    move-result v8

    .line 52
    invoke-virtual {p1}, Ll/o9l0$b;->b()I

    .line 53
    .line 54
    .line 55
    move-result v9

    .line 56
    add-int/2addr v9, v8

    .line 57
    add-int/lit8 v10, v5, 0x1

    .line 58
    .line 59
    new-instance v11, Ll/m5c;

    .line 60
    .line 61
    new-array v9, v9, [B

    .line 62
    .line 63
    invoke-direct {v11, v8, v9}, Ll/m5c;-><init>(I[B)V

    .line 64
    .line 65
    .line 66
    aput-object v11, v0, v5

    .line 67
    .line 68
    add-int/lit8 v7, v7, 0x1

    .line 69
    .line 70
    move v5, v10

    .line 71
    goto :goto_2

    .line 72
    :cond_1
    add-int/lit8 v4, v4, 0x1

    .line 73
    .line 74
    goto :goto_1

    .line 75
    :cond_2
    aget-object p2, v0, v1

    .line 76
    .line 77
    iget-object p2, p2, Ll/m5c;->b:[B

    .line 78
    .line 79
    array-length p2, p2

    .line 80
    add-int/lit8 v3, v3, -0x1

    .line 81
    .line 82
    :goto_3
    if-ltz v3, :cond_3

    .line 83
    .line 84
    aget-object v2, v0, v3

    .line 85
    .line 86
    iget-object v2, v2, Ll/m5c;->b:[B

    .line 87
    .line 88
    array-length v2, v2

    .line 89
    if-eq v2, p2, :cond_3

    .line 90
    .line 91
    add-int/lit8 v3, v3, -0x1

    .line 92
    .line 93
    goto :goto_3

    .line 94
    :cond_3
    add-int/lit8 v3, v3, 0x1

    .line 95
    .line 96
    invoke-virtual {p1}, Ll/o9l0$b;->b()I

    .line 97
    .line 98
    .line 99
    move-result p1

    .line 100
    sub-int/2addr p2, p1

    .line 101
    move p1, v1

    .line 102
    move v2, p1

    .line 103
    :goto_4
    if-ge p1, p2, :cond_5

    .line 104
    .line 105
    move v4, v1

    .line 106
    :goto_5
    if-ge v4, v5, :cond_4

    .line 107
    .line 108
    aget-object v6, v0, v4

    .line 109
    .line 110
    iget-object v6, v6, Ll/m5c;->b:[B

    .line 111
    .line 112
    add-int/lit8 v7, v2, 0x1

    .line 113
    .line 114
    aget-byte v2, p0, v2

    .line 115
    .line 116
    aput-byte v2, v6, p1

    .line 117
    .line 118
    add-int/lit8 v4, v4, 0x1

    .line 119
    .line 120
    move v2, v7

    .line 121
    goto :goto_5

    .line 122
    :cond_4
    add-int/lit8 p1, p1, 0x1

    .line 123
    .line 124
    goto :goto_4

    .line 125
    :cond_5
    move p1, v3

    .line 126
    :goto_6
    if-ge p1, v5, :cond_6

    .line 127
    .line 128
    aget-object v4, v0, p1

    .line 129
    .line 130
    iget-object v4, v4, Ll/m5c;->b:[B

    .line 131
    .line 132
    add-int/lit8 v6, v2, 0x1

    .line 133
    .line 134
    aget-byte v2, p0, v2

    .line 135
    .line 136
    aput-byte v2, v4, p2

    .line 137
    .line 138
    add-int/lit8 p1, p1, 0x1

    .line 139
    .line 140
    move v2, v6

    .line 141
    goto :goto_6

    .line 142
    :cond_6
    aget-object p1, v0, v1

    .line 143
    .line 144
    iget-object p1, p1, Ll/m5c;->b:[B

    .line 145
    .line 146
    array-length p1, p1

    .line 147
    :goto_7
    if-ge p2, p1, :cond_9

    .line 148
    .line 149
    move v4, v1

    .line 150
    :goto_8
    if-ge v4, v5, :cond_8

    .line 151
    .line 152
    if-ge v4, v3, :cond_7

    .line 153
    .line 154
    move v6, p2

    .line 155
    goto :goto_9

    .line 156
    :cond_7
    add-int/lit8 v6, p2, 0x1

    .line 157
    .line 158
    :goto_9
    aget-object v7, v0, v4

    .line 159
    .line 160
    iget-object v7, v7, Ll/m5c;->b:[B

    .line 161
    .line 162
    add-int/lit8 v8, v2, 0x1

    .line 163
    .line 164
    aget-byte v2, p0, v2

    .line 165
    .line 166
    aput-byte v2, v7, v6

    .line 167
    .line 168
    add-int/lit8 v4, v4, 0x1

    .line 169
    .line 170
    move v2, v8

    .line 171
    goto :goto_8

    .line 172
    :cond_8
    add-int/lit8 p2, p2, 0x1

    .line 173
    .line 174
    goto :goto_7

    .line 175
    :cond_9
    return-object v0

    .line 176
    :cond_a
    invoke-static {}, Ll/fig0;->a()V

    .line 177
    .line 178
    .line 179
    const/4 p0, 0x0

    .line 180
    return-object p0
.end method


# virtual methods
.method public a()[B
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m5c;->b:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public c()I
    .locals 0

    .line 1
    iget p0, p0, Ll/m5c;->a:I

    .line 2
    .line 3
    return p0
.end method
