.class public final Ll/z4l;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static a(Ljava/lang/CharSequence;I)I
    .locals 4

    .line 1
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-ge p1, v0, :cond_1

    .line 7
    .line 8
    invoke-interface {p0, p1}, Ljava/lang/CharSequence;->charAt(I)C

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    :cond_0
    :goto_0
    invoke-static {v2}, Ll/z4l;->f(C)Z

    .line 13
    .line 14
    .line 15
    move-result v3

    .line 16
    if-eqz v3, :cond_1

    .line 17
    .line 18
    if-ge p1, v0, :cond_1

    .line 19
    .line 20
    add-int/lit8 v1, v1, 0x1

    .line 21
    .line 22
    add-int/lit8 p1, p1, 0x1

    .line 23
    .line 24
    if-ge p1, v0, :cond_0

    .line 25
    .line 26
    invoke-interface {p0, p1}, Ljava/lang/CharSequence;->charAt(I)C

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    goto :goto_0

    .line 31
    :cond_1
    return v1
.end method

.method public static b(Ljava/lang/String;Lcom/google/zxing/datamatrix/encoder/SymbolShapeHint;Ll/s2e;Ll/s2e;)Ljava/lang/String;
    .locals 8

    .line 1
    new-instance v0, Ll/u1;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/u1;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/yr3;

    .line 7
    .line 8
    invoke-direct {v1}, Ll/yr3;-><init>()V

    .line 9
    .line 10
    .line 11
    new-instance v2, Ll/sri0;

    .line 12
    .line 13
    invoke-direct {v2}, Ll/sri0;-><init>()V

    .line 14
    .line 15
    .line 16
    new-instance v3, Ll/ukq0;

    .line 17
    .line 18
    invoke-direct {v3}, Ll/ukq0;-><init>()V

    .line 19
    .line 20
    .line 21
    new-instance v4, Ll/nke;

    .line 22
    .line 23
    invoke-direct {v4}, Ll/nke;-><init>()V

    .line 24
    .line 25
    .line 26
    new-instance v5, Ll/me2;

    .line 27
    .line 28
    invoke-direct {v5}, Ll/me2;-><init>()V

    .line 29
    .line 30
    .line 31
    const/4 v6, 0x6

    .line 32
    new-array v6, v6, [Ll/t0f;

    .line 33
    .line 34
    const/4 v7, 0x0

    .line 35
    aput-object v0, v6, v7

    .line 36
    .line 37
    const/4 v0, 0x1

    .line 38
    aput-object v1, v6, v0

    .line 39
    .line 40
    const/4 v1, 0x2

    .line 41
    aput-object v2, v6, v1

    .line 42
    .line 43
    const/4 v2, 0x3

    .line 44
    aput-object v3, v6, v2

    .line 45
    .line 46
    const/4 v2, 0x4

    .line 47
    aput-object v4, v6, v2

    .line 48
    .line 49
    const/4 v3, 0x5

    .line 50
    aput-object v5, v6, v3

    .line 51
    .line 52
    new-instance v4, Ll/w0f;

    .line 53
    .line 54
    invoke-direct {v4, p0}, Ll/w0f;-><init>(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v4, p1}, Ll/w0f;->n(Lcom/google/zxing/datamatrix/encoder/SymbolShapeHint;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v4, p2, p3}, Ll/w0f;->l(Ll/s2e;Ll/s2e;)V

    .line 61
    .line 62
    .line 63
    const-string p1, "[)>\u001e05\u001d"

    .line 64
    .line 65
    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    const-string p2, "\u001e\u0004"

    .line 70
    .line 71
    if-eqz p1, :cond_0

    .line 72
    .line 73
    invoke-virtual {p0, p2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    if-eqz p1, :cond_0

    .line 78
    .line 79
    const/16 p0, 0xec

    .line 80
    .line 81
    invoke-virtual {v4, p0}, Ll/w0f;->r(C)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {v4, v1}, Ll/w0f;->m(I)V

    .line 85
    .line 86
    .line 87
    iget p0, v4, Ll/w0f;->f:I

    .line 88
    .line 89
    add-int/lit8 p0, p0, 0x7

    .line 90
    .line 91
    iput p0, v4, Ll/w0f;->f:I

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_0
    const-string p1, "[)>\u001e06\u001d"

    .line 95
    .line 96
    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 97
    .line 98
    .line 99
    move-result p1

    .line 100
    if-eqz p1, :cond_1

    .line 101
    .line 102
    invoke-virtual {p0, p2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 103
    .line 104
    .line 105
    move-result p0

    .line 106
    if-eqz p0, :cond_1

    .line 107
    .line 108
    const/16 p0, 0xed

    .line 109
    .line 110
    invoke-virtual {v4, p0}, Ll/w0f;->r(C)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {v4, v1}, Ll/w0f;->m(I)V

    .line 114
    .line 115
    .line 116
    iget p0, v4, Ll/w0f;->f:I

    .line 117
    .line 118
    add-int/lit8 p0, p0, 0x7

    .line 119
    .line 120
    iput p0, v4, Ll/w0f;->f:I

    .line 121
    .line 122
    :cond_1
    :goto_0
    invoke-virtual {v4}, Ll/w0f;->i()Z

    .line 123
    .line 124
    .line 125
    move-result p0

    .line 126
    if-eqz p0, :cond_2

    .line 127
    .line 128
    aget-object p0, v6, v7

    .line 129
    .line 130
    invoke-interface {p0, v4}, Ll/t0f;->a(Ll/w0f;)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {v4}, Ll/w0f;->e()I

    .line 134
    .line 135
    .line 136
    move-result p0

    .line 137
    if-ltz p0, :cond_1

    .line 138
    .line 139
    invoke-virtual {v4}, Ll/w0f;->e()I

    .line 140
    .line 141
    .line 142
    move-result v7

    .line 143
    invoke-virtual {v4}, Ll/w0f;->j()V

    .line 144
    .line 145
    .line 146
    goto :goto_0

    .line 147
    :cond_2
    invoke-virtual {v4}, Ll/w0f;->a()I

    .line 148
    .line 149
    .line 150
    move-result p0

    .line 151
    invoke-virtual {v4}, Ll/w0f;->p()V

    .line 152
    .line 153
    .line 154
    invoke-virtual {v4}, Ll/w0f;->g()Ll/hoh0;

    .line 155
    .line 156
    .line 157
    move-result-object p1

    .line 158
    invoke-virtual {p1}, Ll/hoh0;->a()I

    .line 159
    .line 160
    .line 161
    move-result p1

    .line 162
    if-ge p0, p1, :cond_3

    .line 163
    .line 164
    if-eqz v7, :cond_3

    .line 165
    .line 166
    if-eq v7, v3, :cond_3

    .line 167
    .line 168
    if-eq v7, v2, :cond_3

    .line 169
    .line 170
    const/16 p0, 0xfe

    .line 171
    .line 172
    invoke-virtual {v4, p0}, Ll/w0f;->r(C)V

    .line 173
    .line 174
    .line 175
    :cond_3
    invoke-virtual {v4}, Ll/w0f;->b()Ljava/lang/StringBuilder;

    .line 176
    .line 177
    .line 178
    move-result-object p0

    .line 179
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->length()I

    .line 180
    .line 181
    .line 182
    move-result p2

    .line 183
    const/16 p3, 0x81

    .line 184
    .line 185
    if-ge p2, p1, :cond_4

    .line 186
    .line 187
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 188
    .line 189
    .line 190
    :cond_4
    :goto_1
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->length()I

    .line 191
    .line 192
    .line 193
    move-result p2

    .line 194
    if-ge p2, p1, :cond_5

    .line 195
    .line 196
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->length()I

    .line 197
    .line 198
    .line 199
    move-result p2

    .line 200
    add-int/2addr p2, v0

    .line 201
    invoke-static {p3, p2}, Ll/z4l;->o(CI)C

    .line 202
    .line 203
    .line 204
    move-result p2

    .line 205
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 206
    .line 207
    .line 208
    goto :goto_1

    .line 209
    :cond_5
    invoke-virtual {v4}, Ll/w0f;->b()Ljava/lang/StringBuilder;

    .line 210
    .line 211
    .line 212
    move-result-object p0

    .line 213
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object p0

    .line 217
    return-object p0
.end method

.method public static c([F[II[B)I
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p3, v0}, Ljava/util/Arrays;->fill([BB)V

    .line 3
    .line 4
    .line 5
    move v1, v0

    .line 6
    :goto_0
    const/4 v2, 0x6

    .line 7
    if-ge v1, v2, :cond_2

    .line 8
    .line 9
    aget v2, p0, v1

    .line 10
    .line 11
    float-to-double v2, v2

    .line 12
    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    .line 13
    .line 14
    .line 15
    move-result-wide v2

    .line 16
    double-to-int v2, v2

    .line 17
    aput v2, p1, v1

    .line 18
    .line 19
    if-le p2, v2, :cond_0

    .line 20
    .line 21
    invoke-static {p3, v0}, Ljava/util/Arrays;->fill([BB)V

    .line 22
    .line 23
    .line 24
    move p2, v2

    .line 25
    :cond_0
    if-ne p2, v2, :cond_1

    .line 26
    .line 27
    aget-byte v2, p3, v1

    .line 28
    .line 29
    add-int/lit8 v2, v2, 0x1

    .line 30
    .line 31
    int-to-byte v2, v2

    .line 32
    aput-byte v2, p3, v1

    .line 33
    .line 34
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_2
    return p2
.end method

.method public static d([B)I
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    const/4 v2, 0x6

    .line 4
    if-ge v0, v2, :cond_0

    .line 5
    .line 6
    aget-byte v2, p0, v0

    .line 7
    .line 8
    add-int/2addr v1, v2

    .line 9
    add-int/lit8 v0, v0, 0x1

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    return v1
.end method

.method public static e(C)V
    .locals 4

    .line 1
    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    rsub-int/lit8 v1, v1, 0x4

    .line 10
    .line 11
    const-string v2, "0000"

    .line 12
    .line 13
    const/4 v3, 0x0

    .line 14
    invoke-virtual {v2, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ljava/lang/IllegalArgumentException;

    .line 23
    .line 24
    new-instance v2, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    const-string v3, "Illegal character: "

    .line 27
    .line 28
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    const-string p0, " (0x"

    .line 35
    .line 36
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    const/16 p0, 0x29

    .line 43
    .line 44
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-direct {v1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    throw v1
.end method

.method public static f(C)Z
    .locals 1

    .line 1
    const/16 v0, 0x30

    .line 2
    .line 3
    if-lt p0, v0, :cond_0

    .line 4
    .line 5
    const/16 v0, 0x39

    .line 6
    .line 7
    if-gt p0, v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public static g(C)Z
    .locals 1

    .line 1
    const/16 v0, 0x80

    .line 2
    .line 3
    if-lt p0, v0, :cond_0

    .line 4
    .line 5
    const/16 v0, 0xff

    .line 6
    .line 7
    if-gt p0, v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public static h(C)Z
    .locals 1

    .line 1
    const/16 v0, 0x20

    .line 2
    .line 3
    if-eq p0, v0, :cond_2

    .line 4
    .line 5
    const/16 v0, 0x30

    .line 6
    .line 7
    if-lt p0, v0, :cond_0

    .line 8
    .line 9
    const/16 v0, 0x39

    .line 10
    .line 11
    if-le p0, v0, :cond_2

    .line 12
    .line 13
    :cond_0
    const/16 v0, 0x41

    .line 14
    .line 15
    if-lt p0, v0, :cond_1

    .line 16
    .line 17
    const/16 v0, 0x5a

    .line 18
    .line 19
    if-gt p0, v0, :cond_1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    const/4 p0, 0x0

    .line 23
    return p0

    .line 24
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 25
    return p0
.end method

.method public static i(C)Z
    .locals 1

    .line 1
    const/16 v0, 0x20

    .line 2
    .line 3
    if-lt p0, v0, :cond_0

    .line 4
    .line 5
    const/16 v0, 0x5e

    .line 6
    .line 7
    if-gt p0, v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public static j(C)Z
    .locals 1

    .line 1
    const/16 v0, 0x20

    .line 2
    .line 3
    if-eq p0, v0, :cond_2

    .line 4
    .line 5
    const/16 v0, 0x30

    .line 6
    .line 7
    if-lt p0, v0, :cond_0

    .line 8
    .line 9
    const/16 v0, 0x39

    .line 10
    .line 11
    if-le p0, v0, :cond_2

    .line 12
    .line 13
    :cond_0
    const/16 v0, 0x61

    .line 14
    .line 15
    if-lt p0, v0, :cond_1

    .line 16
    .line 17
    const/16 v0, 0x7a

    .line 18
    .line 19
    if-gt p0, v0, :cond_1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    const/4 p0, 0x0

    .line 23
    return p0

    .line 24
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 25
    return p0
.end method

.method public static k(C)Z
    .locals 1

    .line 1
    invoke-static {p0}, Ll/z4l;->m(C)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_2

    .line 6
    .line 7
    const/16 v0, 0x20

    .line 8
    .line 9
    if-eq p0, v0, :cond_2

    .line 10
    .line 11
    const/16 v0, 0x30

    .line 12
    .line 13
    if-lt p0, v0, :cond_0

    .line 14
    .line 15
    const/16 v0, 0x39

    .line 16
    .line 17
    if-le p0, v0, :cond_2

    .line 18
    .line 19
    :cond_0
    const/16 v0, 0x41

    .line 20
    .line 21
    if-lt p0, v0, :cond_1

    .line 22
    .line 23
    const/16 v0, 0x5a

    .line 24
    .line 25
    if-gt p0, v0, :cond_1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    const/4 p0, 0x0

    .line 29
    return p0

    .line 30
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 31
    return p0
.end method

.method public static l(C)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public static m(C)Z
    .locals 1

    .line 1
    const/16 v0, 0xd

    .line 2
    .line 3
    if-eq p0, v0, :cond_1

    .line 4
    .line 5
    const/16 v0, 0x2a

    .line 6
    .line 7
    if-eq p0, v0, :cond_1

    .line 8
    .line 9
    const/16 v0, 0x3e

    .line 10
    .line 11
    if-ne p0, v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method public static n(Ljava/lang/CharSequence;II)I
    .locals 21

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p1

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-lt v1, v2, :cond_0

    .line 10
    .line 11
    return p2

    .line 12
    :cond_0
    const/4 v2, 0x0

    .line 13
    const/high16 v3, 0x40000000    # 2.0f

    .line 14
    .line 15
    const/4 v4, 0x6

    .line 16
    const/high16 v5, 0x3f800000    # 1.0f

    .line 17
    .line 18
    const/4 v6, 0x5

    .line 19
    const/4 v7, 0x2

    .line 20
    const/4 v8, 0x4

    .line 21
    const/4 v9, 0x3

    .line 22
    const/4 v10, 0x0

    .line 23
    const/4 v11, 0x1

    .line 24
    if-nez p2, :cond_1

    .line 25
    .line 26
    new-array v12, v4, [F

    .line 27
    .line 28
    aput v2, v12, v10

    .line 29
    .line 30
    aput v5, v12, v11

    .line 31
    .line 32
    aput v5, v12, v7

    .line 33
    .line 34
    aput v5, v12, v9

    .line 35
    .line 36
    aput v5, v12, v8

    .line 37
    .line 38
    const/high16 v2, 0x3fa00000    # 1.25f

    .line 39
    .line 40
    aput v2, v12, v6

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    new-array v12, v4, [F

    .line 44
    .line 45
    aput v5, v12, v10

    .line 46
    .line 47
    aput v3, v12, v11

    .line 48
    .line 49
    aput v3, v12, v7

    .line 50
    .line 51
    aput v3, v12, v9

    .line 52
    .line 53
    aput v3, v12, v8

    .line 54
    .line 55
    const/high16 v13, 0x40100000    # 2.25f

    .line 56
    .line 57
    aput v13, v12, v6

    .line 58
    .line 59
    aput v2, v12, p2

    .line 60
    .line 61
    :goto_0
    move v2, v10

    .line 62
    :goto_1
    add-int v13, v1, v2

    .line 63
    .line 64
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 65
    .line 66
    .line 67
    move-result v14

    .line 68
    const v15, 0x7fffffff

    .line 69
    .line 70
    .line 71
    if-ne v13, v14, :cond_7

    .line 72
    .line 73
    new-array v0, v4, [B

    .line 74
    .line 75
    new-array v1, v4, [I

    .line 76
    .line 77
    invoke-static {v12, v1, v15, v0}, Ll/z4l;->c([F[II[B)I

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    invoke-static {v0}, Ll/z4l;->d([B)I

    .line 82
    .line 83
    .line 84
    move-result v3

    .line 85
    aget v1, v1, v10

    .line 86
    .line 87
    if-ne v1, v2, :cond_2

    .line 88
    .line 89
    return v10

    .line 90
    :cond_2
    if-ne v3, v11, :cond_3

    .line 91
    .line 92
    aget-byte v1, v0, v6

    .line 93
    .line 94
    if-lez v1, :cond_3

    .line 95
    .line 96
    return v6

    .line 97
    :cond_3
    if-ne v3, v11, :cond_4

    .line 98
    .line 99
    aget-byte v1, v0, v8

    .line 100
    .line 101
    if-lez v1, :cond_4

    .line 102
    .line 103
    return v8

    .line 104
    :cond_4
    if-ne v3, v11, :cond_5

    .line 105
    .line 106
    aget-byte v1, v0, v7

    .line 107
    .line 108
    if-lez v1, :cond_5

    .line 109
    .line 110
    return v7

    .line 111
    :cond_5
    if-ne v3, v11, :cond_6

    .line 112
    .line 113
    aget-byte v0, v0, v9

    .line 114
    .line 115
    if-lez v0, :cond_6

    .line 116
    .line 117
    return v9

    .line 118
    :cond_6
    return v11

    .line 119
    :cond_7
    invoke-interface {v0, v13}, Ljava/lang/CharSequence;->charAt(I)C

    .line 120
    .line 121
    .line 122
    move-result v13

    .line 123
    add-int/lit8 v2, v2, 0x1

    .line 124
    .line 125
    invoke-static {v13}, Ll/z4l;->f(C)Z

    .line 126
    .line 127
    .line 128
    move-result v14

    .line 129
    if-eqz v14, :cond_8

    .line 130
    .line 131
    aget v14, v12, v10

    .line 132
    .line 133
    const/high16 v16, 0x3f000000    # 0.5f

    .line 134
    .line 135
    add-float v14, v14, v16

    .line 136
    .line 137
    aput v14, v12, v10

    .line 138
    .line 139
    move/from16 v16, v5

    .line 140
    .line 141
    move/from16 v17, v6

    .line 142
    .line 143
    goto :goto_2

    .line 144
    :cond_8
    invoke-static {v13}, Ll/z4l;->g(C)Z

    .line 145
    .line 146
    .line 147
    move-result v14

    .line 148
    if-eqz v14, :cond_9

    .line 149
    .line 150
    aget v14, v12, v10

    .line 151
    .line 152
    move/from16 v16, v5

    .line 153
    .line 154
    move/from16 v17, v6

    .line 155
    .line 156
    float-to-double v5, v14

    .line 157
    invoke-static {v5, v6}, Ljava/lang/Math;->ceil(D)D

    .line 158
    .line 159
    .line 160
    move-result-wide v5

    .line 161
    double-to-float v5, v5

    .line 162
    aput v5, v12, v10

    .line 163
    .line 164
    add-float/2addr v5, v3

    .line 165
    aput v5, v12, v10

    .line 166
    .line 167
    goto :goto_2

    .line 168
    :cond_9
    move/from16 v16, v5

    .line 169
    .line 170
    move/from16 v17, v6

    .line 171
    .line 172
    aget v5, v12, v10

    .line 173
    .line 174
    float-to-double v5, v5

    .line 175
    invoke-static {v5, v6}, Ljava/lang/Math;->ceil(D)D

    .line 176
    .line 177
    .line 178
    move-result-wide v5

    .line 179
    double-to-float v5, v5

    .line 180
    aput v5, v12, v10

    .line 181
    .line 182
    add-float v5, v5, v16

    .line 183
    .line 184
    aput v5, v12, v10

    .line 185
    .line 186
    :goto_2
    invoke-static {v13}, Ll/z4l;->h(C)Z

    .line 187
    .line 188
    .line 189
    move-result v5

    .line 190
    const v6, 0x3faaaaab

    .line 191
    .line 192
    .line 193
    const v14, 0x402aaaab

    .line 194
    .line 195
    .line 196
    const v18, 0x3f2aaaab

    .line 197
    .line 198
    .line 199
    if-eqz v5, :cond_a

    .line 200
    .line 201
    aget v5, v12, v11

    .line 202
    .line 203
    add-float v5, v5, v18

    .line 204
    .line 205
    aput v5, v12, v11

    .line 206
    .line 207
    goto :goto_3

    .line 208
    :cond_a
    invoke-static {v13}, Ll/z4l;->g(C)Z

    .line 209
    .line 210
    .line 211
    move-result v5

    .line 212
    if-eqz v5, :cond_b

    .line 213
    .line 214
    aget v5, v12, v11

    .line 215
    .line 216
    add-float/2addr v5, v14

    .line 217
    aput v5, v12, v11

    .line 218
    .line 219
    goto :goto_3

    .line 220
    :cond_b
    aget v5, v12, v11

    .line 221
    .line 222
    add-float/2addr v5, v6

    .line 223
    aput v5, v12, v11

    .line 224
    .line 225
    :goto_3
    invoke-static {v13}, Ll/z4l;->j(C)Z

    .line 226
    .line 227
    .line 228
    move-result v5

    .line 229
    if-eqz v5, :cond_c

    .line 230
    .line 231
    aget v5, v12, v7

    .line 232
    .line 233
    add-float v5, v5, v18

    .line 234
    .line 235
    aput v5, v12, v7

    .line 236
    .line 237
    goto :goto_4

    .line 238
    :cond_c
    invoke-static {v13}, Ll/z4l;->g(C)Z

    .line 239
    .line 240
    .line 241
    move-result v5

    .line 242
    if-eqz v5, :cond_d

    .line 243
    .line 244
    aget v5, v12, v7

    .line 245
    .line 246
    add-float/2addr v5, v14

    .line 247
    aput v5, v12, v7

    .line 248
    .line 249
    goto :goto_4

    .line 250
    :cond_d
    aget v5, v12, v7

    .line 251
    .line 252
    add-float/2addr v5, v6

    .line 253
    aput v5, v12, v7

    .line 254
    .line 255
    :goto_4
    invoke-static {v13}, Ll/z4l;->k(C)Z

    .line 256
    .line 257
    .line 258
    move-result v5

    .line 259
    if-eqz v5, :cond_e

    .line 260
    .line 261
    aget v5, v12, v9

    .line 262
    .line 263
    add-float v5, v5, v18

    .line 264
    .line 265
    aput v5, v12, v9

    .line 266
    .line 267
    goto :goto_5

    .line 268
    :cond_e
    invoke-static {v13}, Ll/z4l;->g(C)Z

    .line 269
    .line 270
    .line 271
    move-result v5

    .line 272
    if-eqz v5, :cond_f

    .line 273
    .line 274
    aget v5, v12, v9

    .line 275
    .line 276
    const v6, 0x408aaaab

    .line 277
    .line 278
    .line 279
    add-float/2addr v5, v6

    .line 280
    aput v5, v12, v9

    .line 281
    .line 282
    goto :goto_5

    .line 283
    :cond_f
    aget v5, v12, v9

    .line 284
    .line 285
    const v6, 0x40555555

    .line 286
    .line 287
    .line 288
    add-float/2addr v5, v6

    .line 289
    aput v5, v12, v9

    .line 290
    .line 291
    :goto_5
    invoke-static {v13}, Ll/z4l;->i(C)Z

    .line 292
    .line 293
    .line 294
    move-result v5

    .line 295
    if-eqz v5, :cond_10

    .line 296
    .line 297
    aget v5, v12, v8

    .line 298
    .line 299
    const/high16 v6, 0x3f400000    # 0.75f

    .line 300
    .line 301
    add-float/2addr v5, v6

    .line 302
    aput v5, v12, v8

    .line 303
    .line 304
    goto :goto_6

    .line 305
    :cond_10
    invoke-static {v13}, Ll/z4l;->g(C)Z

    .line 306
    .line 307
    .line 308
    move-result v5

    .line 309
    if-eqz v5, :cond_11

    .line 310
    .line 311
    aget v5, v12, v8

    .line 312
    .line 313
    const/high16 v6, 0x40880000    # 4.25f

    .line 314
    .line 315
    add-float/2addr v5, v6

    .line 316
    aput v5, v12, v8

    .line 317
    .line 318
    goto :goto_6

    .line 319
    :cond_11
    aget v5, v12, v8

    .line 320
    .line 321
    const/high16 v6, 0x40500000    # 3.25f

    .line 322
    .line 323
    add-float/2addr v5, v6

    .line 324
    aput v5, v12, v8

    .line 325
    .line 326
    :goto_6
    invoke-static {v13}, Ll/z4l;->l(C)Z

    .line 327
    .line 328
    .line 329
    move-result v5

    .line 330
    if-eqz v5, :cond_12

    .line 331
    .line 332
    aget v5, v12, v17

    .line 333
    .line 334
    const/high16 v6, 0x40800000    # 4.0f

    .line 335
    .line 336
    add-float/2addr v5, v6

    .line 337
    aput v5, v12, v17

    .line 338
    .line 339
    goto :goto_7

    .line 340
    :cond_12
    aget v5, v12, v17

    .line 341
    .line 342
    add-float v5, v5, v16

    .line 343
    .line 344
    aput v5, v12, v17

    .line 345
    .line 346
    :goto_7
    if-lt v2, v8, :cond_1c

    .line 347
    .line 348
    new-array v5, v4, [I

    .line 349
    .line 350
    new-array v6, v4, [B

    .line 351
    .line 352
    invoke-static {v12, v5, v15, v6}, Ll/z4l;->c([F[II[B)I

    .line 353
    .line 354
    .line 355
    invoke-static {v6}, Ll/z4l;->d([B)I

    .line 356
    .line 357
    .line 358
    move-result v13

    .line 359
    aget v14, v5, v10

    .line 360
    .line 361
    aget v15, v5, v17

    .line 362
    .line 363
    if-ge v14, v15, :cond_13

    .line 364
    .line 365
    aget v3, v5, v11

    .line 366
    .line 367
    if-ge v14, v3, :cond_13

    .line 368
    .line 369
    aget v3, v5, v7

    .line 370
    .line 371
    if-ge v14, v3, :cond_13

    .line 372
    .line 373
    aget v3, v5, v9

    .line 374
    .line 375
    if-ge v14, v3, :cond_13

    .line 376
    .line 377
    aget v3, v5, v8

    .line 378
    .line 379
    if-ge v14, v3, :cond_13

    .line 380
    .line 381
    return v10

    .line 382
    :cond_13
    if-lt v15, v14, :cond_1b

    .line 383
    .line 384
    aget-byte v3, v6, v11

    .line 385
    .line 386
    aget-byte v19, v6, v7

    .line 387
    .line 388
    add-int v3, v3, v19

    .line 389
    .line 390
    aget-byte v20, v6, v9

    .line 391
    .line 392
    add-int v3, v3, v20

    .line 393
    .line 394
    aget-byte v6, v6, v8

    .line 395
    .line 396
    add-int/2addr v3, v6

    .line 397
    if-nez v3, :cond_14

    .line 398
    .line 399
    goto :goto_9

    .line 400
    :cond_14
    if-ne v13, v11, :cond_15

    .line 401
    .line 402
    if-lez v6, :cond_15

    .line 403
    .line 404
    return v8

    .line 405
    :cond_15
    if-ne v13, v11, :cond_16

    .line 406
    .line 407
    if-lez v19, :cond_16

    .line 408
    .line 409
    return v7

    .line 410
    :cond_16
    if-ne v13, v11, :cond_17

    .line 411
    .line 412
    if-lez v20, :cond_17

    .line 413
    .line 414
    return v9

    .line 415
    :cond_17
    aget v3, v5, v11

    .line 416
    .line 417
    add-int/lit8 v6, v3, 0x1

    .line 418
    .line 419
    if-ge v6, v14, :cond_1c

    .line 420
    .line 421
    add-int/lit8 v6, v3, 0x1

    .line 422
    .line 423
    if-ge v6, v15, :cond_1c

    .line 424
    .line 425
    add-int/lit8 v6, v3, 0x1

    .line 426
    .line 427
    aget v13, v5, v8

    .line 428
    .line 429
    if-ge v6, v13, :cond_1c

    .line 430
    .line 431
    add-int/lit8 v6, v3, 0x1

    .line 432
    .line 433
    aget v13, v5, v7

    .line 434
    .line 435
    if-ge v6, v13, :cond_1c

    .line 436
    .line 437
    aget v5, v5, v9

    .line 438
    .line 439
    if-ge v3, v5, :cond_18

    .line 440
    .line 441
    return v11

    .line 442
    :cond_18
    if-ne v3, v5, :cond_1c

    .line 443
    .line 444
    add-int/2addr v1, v2

    .line 445
    add-int/2addr v1, v11

    .line 446
    :goto_8
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 447
    .line 448
    .line 449
    move-result v2

    .line 450
    if-ge v1, v2, :cond_1a

    .line 451
    .line 452
    invoke-interface {v0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    .line 453
    .line 454
    .line 455
    move-result v2

    .line 456
    invoke-static {v2}, Ll/z4l;->m(C)Z

    .line 457
    .line 458
    .line 459
    move-result v3

    .line 460
    if-eqz v3, :cond_19

    .line 461
    .line 462
    return v9

    .line 463
    :cond_19
    invoke-static {v2}, Ll/z4l;->k(C)Z

    .line 464
    .line 465
    .line 466
    move-result v2

    .line 467
    if-eqz v2, :cond_1a

    .line 468
    .line 469
    add-int/lit8 v1, v1, 0x1

    .line 470
    .line 471
    goto :goto_8

    .line 472
    :cond_1a
    return v11

    .line 473
    :cond_1b
    :goto_9
    return v17

    .line 474
    :cond_1c
    move/from16 v5, v16

    .line 475
    .line 476
    move/from16 v6, v17

    .line 477
    .line 478
    const/high16 v3, 0x40000000    # 2.0f

    .line 479
    .line 480
    goto/16 :goto_1
.end method

.method public static o(CI)C
    .locals 0

    .line 1
    mul-int/lit16 p1, p1, 0x95

    .line 2
    .line 3
    rem-int/lit16 p1, p1, 0xfd

    .line 4
    .line 5
    add-int/lit8 p1, p1, 0x1

    .line 6
    .line 7
    add-int/2addr p0, p1

    .line 8
    const/16 p1, 0xfe

    .line 9
    .line 10
    if-gt p0, p1, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    add-int/lit16 p0, p0, -0xfe

    .line 14
    .line 15
    :goto_0
    int-to-char p0, p0

    .line 16
    return p0
.end method
