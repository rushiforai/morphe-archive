.class public final Ll/z8;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/z8$b;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field public static final a:[I

.field public static final b:[I

.field public static final c:[I

.field public static final d:[I

.field public static final e:[I

.field public static final f:[I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    const/4 v0, 0x3

    .line 2
    const/4 v1, 0x6

    .line 3
    const/4 v2, 0x1

    .line 4
    const/4 v3, 0x2

    .line 5
    filled-new-array {v2, v3, v0, v1}, [I

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sput-object v0, Ll/z8;->a:[I

    .line 10
    .line 11
    const v0, 0xac44

    .line 12
    .line 13
    .line 14
    const/16 v1, 0x7d00

    .line 15
    .line 16
    const v2, 0xbb80

    .line 17
    .line 18
    .line 19
    filled-new-array {v2, v0, v1}, [I

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sput-object v0, Ll/z8;->b:[I

    .line 24
    .line 25
    const/16 v0, 0x5622

    .line 26
    .line 27
    const/16 v1, 0x3e80

    .line 28
    .line 29
    const/16 v2, 0x5dc0

    .line 30
    .line 31
    filled-new-array {v2, v0, v1}, [I

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    sput-object v0, Ll/z8;->c:[I

    .line 36
    .line 37
    const/16 v0, 0x8

    .line 38
    .line 39
    new-array v0, v0, [I

    .line 40
    .line 41
    fill-array-data v0, :array_0

    .line 42
    .line 43
    .line 44
    sput-object v0, Ll/z8;->d:[I

    .line 45
    .line 46
    const/16 v0, 0x13

    .line 47
    .line 48
    new-array v1, v0, [I

    .line 49
    .line 50
    fill-array-data v1, :array_1

    .line 51
    .line 52
    .line 53
    sput-object v1, Ll/z8;->e:[I

    .line 54
    .line 55
    new-array v0, v0, [I

    .line 56
    .line 57
    fill-array-data v0, :array_2

    .line 58
    .line 59
    .line 60
    sput-object v0, Ll/z8;->f:[I

    .line 61
    .line 62
    return-void

    .line 63
    :array_0
    .array-data 4
        0x2
        0x1
        0x2
        0x3
        0x3
        0x4
        0x4
        0x5
    .end array-data

    .line 64
    :array_1
    .array-data 4
        0x20
        0x28
        0x30
        0x38
        0x40
        0x50
        0x60
        0x70
        0x80
        0xa0
        0xc0
        0xe0
        0x100
        0x140
        0x180
        0x1c0
        0x200
        0x240
        0x280
    .end array-data

    :array_2
    .array-data 4
        0x45
        0x57
        0x68
        0x79
        0x8b
        0xae
        0xd0
        0xf3
        0x116
        0x15c
        0x1a1
        0x1e7
        0x22d
        0x2b8
        0x343
        0x3cf
        0x45a
        0x4e5
        0x571
    .end array-data
.end method

.method public static a(III)I
    .locals 0

    .line 1
    mul-int/2addr p0, p1

    .line 2
    mul-int/lit8 p2, p2, 0x20

    .line 3
    .line 4
    div-int/2addr p0, p2

    .line 5
    return p0
.end method

.method public static b(Ljava/nio/ByteBuffer;)I
    .locals 5

    .line 1
    invoke-virtual {p0}, Ljava/nio/Buffer;->position()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Ljava/nio/Buffer;->limit()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    add-int/lit8 v1, v1, -0xa

    .line 10
    .line 11
    move v2, v0

    .line 12
    :goto_0
    if-gt v2, v1, :cond_1

    .line 13
    .line 14
    add-int/lit8 v3, v2, 0x4

    .line 15
    .line 16
    invoke-static {p0, v3}, Ll/bmk0;->J(Ljava/nio/ByteBuffer;I)I

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    and-int/lit8 v3, v3, -0x2

    .line 21
    .line 22
    const v4, -0x78d9046

    .line 23
    .line 24
    .line 25
    if-ne v3, v4, :cond_0

    .line 26
    .line 27
    sub-int/2addr v2, v0

    .line 28
    return v2

    .line 29
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    const/4 p0, -0x1

    .line 33
    return p0
.end method

.method public static c(II)I
    .locals 4

    .line 1
    div-int/lit8 v0, p1, 0x2

    .line 2
    .line 3
    if-ltz p0, :cond_3

    .line 4
    .line 5
    sget-object v1, Ll/z8;->b:[I

    .line 6
    .line 7
    array-length v2, v1

    .line 8
    if-ge p0, v2, :cond_3

    .line 9
    .line 10
    if-ltz p1, :cond_3

    .line 11
    .line 12
    sget-object v2, Ll/z8;->f:[I

    .line 13
    .line 14
    array-length v3, v2

    .line 15
    if-lt v0, v3, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    aget p0, v1, p0

    .line 19
    .line 20
    const v1, 0xac44

    .line 21
    .line 22
    .line 23
    if-ne p0, v1, :cond_1

    .line 24
    .line 25
    aget p0, v2, v0

    .line 26
    .line 27
    rem-int/lit8 p1, p1, 0x2

    .line 28
    .line 29
    add-int/2addr p0, p1

    .line 30
    mul-int/lit8 p0, p0, 0x2

    .line 31
    .line 32
    return p0

    .line 33
    :cond_1
    sget-object p1, Ll/z8;->e:[I

    .line 34
    .line 35
    aget p1, p1, v0

    .line 36
    .line 37
    const/16 v0, 0x7d00

    .line 38
    .line 39
    if-ne p0, v0, :cond_2

    .line 40
    .line 41
    mul-int/lit8 p1, p1, 0x6

    .line 42
    .line 43
    return p1

    .line 44
    :cond_2
    mul-int/lit8 p1, p1, 0x4

    .line 45
    .line 46
    return p1

    .line 47
    :cond_3
    :goto_0
    const/4 p0, -0x1

    .line 48
    return p0
.end method

.method public static d(Ll/ig60;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/exoplayer2/drm/DrmInitData;)Lcom/google/android/exoplayer2/k;
    .locals 5
    .param p3    # Lcom/google/android/exoplayer2/drm/DrmInitData;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    new-instance v0, Ll/hg60;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/hg60;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Ll/hg60;->m(Ll/ig60;)V

    .line 7
    .line 8
    .line 9
    const/4 v1, 0x2

    .line 10
    invoke-virtual {v0, v1}, Ll/hg60;->h(I)I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    sget-object v2, Ll/z8;->b:[I

    .line 15
    .line 16
    aget v1, v2, v1

    .line 17
    .line 18
    const/16 v2, 0x8

    .line 19
    .line 20
    invoke-virtual {v0, v2}, Ll/hg60;->r(I)V

    .line 21
    .line 22
    .line 23
    sget-object v2, Ll/z8;->d:[I

    .line 24
    .line 25
    const/4 v3, 0x3

    .line 26
    invoke-virtual {v0, v3}, Ll/hg60;->h(I)I

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    aget v2, v2, v3

    .line 31
    .line 32
    const/4 v3, 0x1

    .line 33
    invoke-virtual {v0, v3}, Ll/hg60;->h(I)I

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    if-eqz v3, :cond_0

    .line 38
    .line 39
    add-int/lit8 v2, v2, 0x1

    .line 40
    .line 41
    :cond_0
    const/4 v3, 0x5

    .line 42
    invoke-virtual {v0, v3}, Ll/hg60;->h(I)I

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    sget-object v4, Ll/z8;->e:[I

    .line 47
    .line 48
    aget v3, v4, v3

    .line 49
    .line 50
    mul-int/lit16 v3, v3, 0x3e8

    .line 51
    .line 52
    invoke-virtual {v0}, Ll/hg60;->c()V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0}, Ll/hg60;->d()I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    invoke-virtual {p0, v0}, Ll/ig60;->U(I)V

    .line 60
    .line 61
    .line 62
    new-instance p0, Lcom/google/android/exoplayer2/k$b;

    .line 63
    .line 64
    invoke-direct {p0}, Lcom/google/android/exoplayer2/k$b;-><init>()V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/k$b;->U(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    const-string p1, "audio/ac3"

    .line 72
    .line 73
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/k$b;->g0(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-virtual {p0, v2}, Lcom/google/android/exoplayer2/k$b;->J(I)Lcom/google/android/exoplayer2/k$b;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-virtual {p0, v1}, Lcom/google/android/exoplayer2/k$b;->h0(I)Lcom/google/android/exoplayer2/k$b;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-virtual {p0, p3}, Lcom/google/android/exoplayer2/k$b;->O(Lcom/google/android/exoplayer2/drm/DrmInitData;)Lcom/google/android/exoplayer2/k$b;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-virtual {p0, p2}, Lcom/google/android/exoplayer2/k$b;->X(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-virtual {p0, v3}, Lcom/google/android/exoplayer2/k$b;->I(I)Lcom/google/android/exoplayer2/k$b;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-virtual {p0, v3}, Lcom/google/android/exoplayer2/k$b;->b0(I)Lcom/google/android/exoplayer2/k$b;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/k$b;->G()Lcom/google/android/exoplayer2/k;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    return-object p0
.end method

.method public static e(Ljava/nio/ByteBuffer;)I
    .locals 3

    .line 1
    invoke-virtual {p0}, Ljava/nio/Buffer;->position()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    add-int/lit8 v0, v0, 0x5

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->get(I)B

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    and-int/lit16 v0, v0, 0xf8

    .line 12
    .line 13
    const/4 v1, 0x3

    .line 14
    shr-int/2addr v0, v1

    .line 15
    const/16 v2, 0xa

    .line 16
    .line 17
    if-le v0, v2, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/nio/Buffer;->position()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    add-int/lit8 v0, v0, 0x4

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->get(I)B

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    and-int/lit16 v0, v0, 0xc0

    .line 30
    .line 31
    shr-int/lit8 v0, v0, 0x6

    .line 32
    .line 33
    if-ne v0, v1, :cond_0

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    invoke-virtual {p0}, Ljava/nio/Buffer;->position()I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    add-int/lit8 v0, v0, 0x4

    .line 41
    .line 42
    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->get(I)B

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    and-int/lit8 p0, p0, 0x30

    .line 47
    .line 48
    shr-int/lit8 v1, p0, 0x4

    .line 49
    .line 50
    :goto_0
    sget-object p0, Ll/z8;->a:[I

    .line 51
    .line 52
    aget p0, p0, v1

    .line 53
    .line 54
    mul-int/lit16 p0, p0, 0x100

    .line 55
    .line 56
    return p0

    .line 57
    :cond_1
    const/16 p0, 0x600

    .line 58
    .line 59
    return p0
.end method

.method public static f(Ll/hg60;)Ll/z8$b;
    .locals 30

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/hg60;->e()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/16 v2, 0x28

    .line 8
    .line 9
    invoke-virtual {v0, v2}, Ll/hg60;->r(I)V

    .line 10
    .line 11
    .line 12
    const/4 v2, 0x5

    .line 13
    invoke-virtual {v0, v2}, Ll/hg60;->h(I)I

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    const/4 v5, 0x1

    .line 18
    const/16 v6, 0xa

    .line 19
    .line 20
    if-le v3, v6, :cond_0

    .line 21
    .line 22
    move v3, v5

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 v3, 0x0

    .line 25
    :goto_0
    invoke-virtual {v0, v1}, Ll/hg60;->p(I)V

    .line 26
    .line 27
    .line 28
    const/4 v1, -0x1

    .line 29
    const/16 v7, 0x8

    .line 30
    .line 31
    const/4 v9, 0x3

    .line 32
    const/4 v10, 0x2

    .line 33
    if-eqz v3, :cond_2a

    .line 34
    .line 35
    const/16 v3, 0x10

    .line 36
    .line 37
    invoke-virtual {v0, v3}, Ll/hg60;->r(I)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, v10}, Ll/hg60;->h(I)I

    .line 41
    .line 42
    .line 43
    move-result v11

    .line 44
    if-eqz v11, :cond_3

    .line 45
    .line 46
    if-eq v11, v5, :cond_2

    .line 47
    .line 48
    if-eq v11, v10, :cond_1

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_1
    move v1, v10

    .line 52
    goto :goto_1

    .line 53
    :cond_2
    move v1, v5

    .line 54
    goto :goto_1

    .line 55
    :cond_3
    const/4 v1, 0x0

    .line 56
    :goto_1
    invoke-virtual {v0, v9}, Ll/hg60;->r(I)V

    .line 57
    .line 58
    .line 59
    const/16 v11, 0xb

    .line 60
    .line 61
    invoke-virtual {v0, v11}, Ll/hg60;->h(I)I

    .line 62
    .line 63
    .line 64
    move-result v11

    .line 65
    add-int/2addr v11, v5

    .line 66
    mul-int/2addr v11, v10

    .line 67
    invoke-virtual {v0, v10}, Ll/hg60;->h(I)I

    .line 68
    .line 69
    .line 70
    move-result v12

    .line 71
    if-ne v12, v9, :cond_4

    .line 72
    .line 73
    sget-object v13, Ll/z8;->c:[I

    .line 74
    .line 75
    invoke-virtual {v0, v10}, Ll/hg60;->h(I)I

    .line 76
    .line 77
    .line 78
    move-result v14

    .line 79
    aget v13, v13, v14

    .line 80
    .line 81
    move v14, v9

    .line 82
    const/4 v15, 0x6

    .line 83
    goto :goto_2

    .line 84
    :cond_4
    invoke-virtual {v0, v10}, Ll/hg60;->h(I)I

    .line 85
    .line 86
    .line 87
    move-result v13

    .line 88
    sget-object v14, Ll/z8;->a:[I

    .line 89
    .line 90
    aget v14, v14, v13

    .line 91
    .line 92
    sget-object v15, Ll/z8;->b:[I

    .line 93
    .line 94
    aget v15, v15, v12

    .line 95
    .line 96
    move/from16 v29, v14

    .line 97
    .line 98
    move v14, v13

    .line 99
    move v13, v15

    .line 100
    move/from16 v15, v29

    .line 101
    .line 102
    :goto_2
    mul-int/lit16 v4, v15, 0x100

    .line 103
    .line 104
    invoke-static {v11, v13, v15}, Ll/z8;->a(III)I

    .line 105
    .line 106
    .line 107
    move-result v16

    .line 108
    invoke-virtual {v0, v9}, Ll/hg60;->h(I)I

    .line 109
    .line 110
    .line 111
    move-result v8

    .line 112
    invoke-virtual {v0}, Ll/hg60;->g()Z

    .line 113
    .line 114
    .line 115
    move-result v18

    .line 116
    sget-object v19, Ll/z8;->d:[I

    .line 117
    .line 118
    aget v19, v19, v8

    .line 119
    .line 120
    add-int v19, v19, v18

    .line 121
    .line 122
    invoke-virtual {v0, v6}, Ll/hg60;->r(I)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {v0}, Ll/hg60;->g()Z

    .line 126
    .line 127
    .line 128
    move-result v6

    .line 129
    if-eqz v6, :cond_5

    .line 130
    .line 131
    invoke-virtual {v0, v7}, Ll/hg60;->r(I)V

    .line 132
    .line 133
    .line 134
    :cond_5
    if-nez v8, :cond_6

    .line 135
    .line 136
    invoke-virtual {v0, v2}, Ll/hg60;->r(I)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {v0}, Ll/hg60;->g()Z

    .line 140
    .line 141
    .line 142
    move-result v6

    .line 143
    if-eqz v6, :cond_6

    .line 144
    .line 145
    invoke-virtual {v0, v7}, Ll/hg60;->r(I)V

    .line 146
    .line 147
    .line 148
    :cond_6
    if-ne v1, v5, :cond_7

    .line 149
    .line 150
    invoke-virtual {v0}, Ll/hg60;->g()Z

    .line 151
    .line 152
    .line 153
    move-result v6

    .line 154
    if-eqz v6, :cond_7

    .line 155
    .line 156
    invoke-virtual {v0, v3}, Ll/hg60;->r(I)V

    .line 157
    .line 158
    .line 159
    :cond_7
    invoke-virtual {v0}, Ll/hg60;->g()Z

    .line 160
    .line 161
    .line 162
    move-result v3

    .line 163
    const/4 v6, 0x4

    .line 164
    if-eqz v3, :cond_20

    .line 165
    .line 166
    if-le v8, v10, :cond_8

    .line 167
    .line 168
    invoke-virtual {v0, v10}, Ll/hg60;->r(I)V

    .line 169
    .line 170
    .line 171
    :cond_8
    and-int/lit8 v3, v8, 0x1

    .line 172
    .line 173
    if-eqz v3, :cond_9

    .line 174
    .line 175
    if-le v8, v10, :cond_9

    .line 176
    .line 177
    const/4 v3, 0x6

    .line 178
    invoke-virtual {v0, v3}, Ll/hg60;->r(I)V

    .line 179
    .line 180
    .line 181
    goto :goto_3

    .line 182
    :cond_9
    const/4 v3, 0x6

    .line 183
    :goto_3
    and-int/lit8 v17, v8, 0x4

    .line 184
    .line 185
    if-eqz v17, :cond_a

    .line 186
    .line 187
    invoke-virtual {v0, v3}, Ll/hg60;->r(I)V

    .line 188
    .line 189
    .line 190
    :cond_a
    if-eqz v18, :cond_b

    .line 191
    .line 192
    invoke-virtual {v0}, Ll/hg60;->g()Z

    .line 193
    .line 194
    .line 195
    move-result v3

    .line 196
    if-eqz v3, :cond_b

    .line 197
    .line 198
    invoke-virtual {v0, v2}, Ll/hg60;->r(I)V

    .line 199
    .line 200
    .line 201
    :cond_b
    if-nez v1, :cond_20

    .line 202
    .line 203
    invoke-virtual {v0}, Ll/hg60;->g()Z

    .line 204
    .line 205
    .line 206
    move-result v3

    .line 207
    if-eqz v3, :cond_c

    .line 208
    .line 209
    const/4 v3, 0x6

    .line 210
    invoke-virtual {v0, v3}, Ll/hg60;->r(I)V

    .line 211
    .line 212
    .line 213
    goto :goto_4

    .line 214
    :cond_c
    const/4 v3, 0x6

    .line 215
    :goto_4
    if-nez v8, :cond_d

    .line 216
    .line 217
    invoke-virtual {v0}, Ll/hg60;->g()Z

    .line 218
    .line 219
    .line 220
    move-result v17

    .line 221
    if-eqz v17, :cond_d

    .line 222
    .line 223
    invoke-virtual {v0, v3}, Ll/hg60;->r(I)V

    .line 224
    .line 225
    .line 226
    :cond_d
    invoke-virtual {v0}, Ll/hg60;->g()Z

    .line 227
    .line 228
    .line 229
    move-result v17

    .line 230
    if-eqz v17, :cond_e

    .line 231
    .line 232
    invoke-virtual {v0, v3}, Ll/hg60;->r(I)V

    .line 233
    .line 234
    .line 235
    :cond_e
    invoke-virtual {v0, v10}, Ll/hg60;->h(I)I

    .line 236
    .line 237
    .line 238
    move-result v3

    .line 239
    if-ne v3, v5, :cond_f

    .line 240
    .line 241
    invoke-virtual {v0, v2}, Ll/hg60;->r(I)V

    .line 242
    .line 243
    .line 244
    goto/16 :goto_5

    .line 245
    .line 246
    :cond_f
    if-ne v3, v10, :cond_10

    .line 247
    .line 248
    const/16 v3, 0xc

    .line 249
    .line 250
    invoke-virtual {v0, v3}, Ll/hg60;->r(I)V

    .line 251
    .line 252
    .line 253
    goto/16 :goto_5

    .line 254
    .line 255
    :cond_10
    if-ne v3, v9, :cond_1b

    .line 256
    .line 257
    invoke-virtual {v0, v2}, Ll/hg60;->h(I)I

    .line 258
    .line 259
    .line 260
    move-result v3

    .line 261
    invoke-virtual {v0}, Ll/hg60;->g()Z

    .line 262
    .line 263
    .line 264
    move-result v18

    .line 265
    if-eqz v18, :cond_19

    .line 266
    .line 267
    invoke-virtual {v0, v2}, Ll/hg60;->r(I)V

    .line 268
    .line 269
    .line 270
    invoke-virtual {v0}, Ll/hg60;->g()Z

    .line 271
    .line 272
    .line 273
    move-result v18

    .line 274
    if-eqz v18, :cond_11

    .line 275
    .line 276
    invoke-virtual {v0, v6}, Ll/hg60;->r(I)V

    .line 277
    .line 278
    .line 279
    :cond_11
    invoke-virtual {v0}, Ll/hg60;->g()Z

    .line 280
    .line 281
    .line 282
    move-result v18

    .line 283
    if-eqz v18, :cond_12

    .line 284
    .line 285
    invoke-virtual {v0, v6}, Ll/hg60;->r(I)V

    .line 286
    .line 287
    .line 288
    :cond_12
    invoke-virtual {v0}, Ll/hg60;->g()Z

    .line 289
    .line 290
    .line 291
    move-result v18

    .line 292
    if-eqz v18, :cond_13

    .line 293
    .line 294
    invoke-virtual {v0, v6}, Ll/hg60;->r(I)V

    .line 295
    .line 296
    .line 297
    :cond_13
    invoke-virtual {v0}, Ll/hg60;->g()Z

    .line 298
    .line 299
    .line 300
    move-result v18

    .line 301
    if-eqz v18, :cond_14

    .line 302
    .line 303
    invoke-virtual {v0, v6}, Ll/hg60;->r(I)V

    .line 304
    .line 305
    .line 306
    :cond_14
    invoke-virtual {v0}, Ll/hg60;->g()Z

    .line 307
    .line 308
    .line 309
    move-result v18

    .line 310
    if-eqz v18, :cond_15

    .line 311
    .line 312
    invoke-virtual {v0, v6}, Ll/hg60;->r(I)V

    .line 313
    .line 314
    .line 315
    :cond_15
    invoke-virtual {v0}, Ll/hg60;->g()Z

    .line 316
    .line 317
    .line 318
    move-result v18

    .line 319
    if-eqz v18, :cond_16

    .line 320
    .line 321
    invoke-virtual {v0, v6}, Ll/hg60;->r(I)V

    .line 322
    .line 323
    .line 324
    :cond_16
    invoke-virtual {v0}, Ll/hg60;->g()Z

    .line 325
    .line 326
    .line 327
    move-result v18

    .line 328
    if-eqz v18, :cond_17

    .line 329
    .line 330
    invoke-virtual {v0, v6}, Ll/hg60;->r(I)V

    .line 331
    .line 332
    .line 333
    :cond_17
    invoke-virtual {v0}, Ll/hg60;->g()Z

    .line 334
    .line 335
    .line 336
    move-result v18

    .line 337
    if-eqz v18, :cond_19

    .line 338
    .line 339
    invoke-virtual {v0}, Ll/hg60;->g()Z

    .line 340
    .line 341
    .line 342
    move-result v18

    .line 343
    if-eqz v18, :cond_18

    .line 344
    .line 345
    invoke-virtual {v0, v6}, Ll/hg60;->r(I)V

    .line 346
    .line 347
    .line 348
    :cond_18
    invoke-virtual {v0}, Ll/hg60;->g()Z

    .line 349
    .line 350
    .line 351
    move-result v18

    .line 352
    if-eqz v18, :cond_19

    .line 353
    .line 354
    invoke-virtual {v0, v6}, Ll/hg60;->r(I)V

    .line 355
    .line 356
    .line 357
    :cond_19
    invoke-virtual {v0}, Ll/hg60;->g()Z

    .line 358
    .line 359
    .line 360
    move-result v18

    .line 361
    if-eqz v18, :cond_1a

    .line 362
    .line 363
    invoke-virtual {v0, v2}, Ll/hg60;->r(I)V

    .line 364
    .line 365
    .line 366
    invoke-virtual {v0}, Ll/hg60;->g()Z

    .line 367
    .line 368
    .line 369
    move-result v18

    .line 370
    if-eqz v18, :cond_1a

    .line 371
    .line 372
    const/4 v5, 0x7

    .line 373
    invoke-virtual {v0, v5}, Ll/hg60;->r(I)V

    .line 374
    .line 375
    .line 376
    invoke-virtual {v0}, Ll/hg60;->g()Z

    .line 377
    .line 378
    .line 379
    move-result v5

    .line 380
    if-eqz v5, :cond_1a

    .line 381
    .line 382
    invoke-virtual {v0, v7}, Ll/hg60;->r(I)V

    .line 383
    .line 384
    .line 385
    :cond_1a
    add-int/2addr v3, v10

    .line 386
    mul-int/2addr v3, v7

    .line 387
    invoke-virtual {v0, v3}, Ll/hg60;->r(I)V

    .line 388
    .line 389
    .line 390
    invoke-virtual {v0}, Ll/hg60;->c()V

    .line 391
    .line 392
    .line 393
    :cond_1b
    :goto_5
    if-ge v8, v10, :cond_1d

    .line 394
    .line 395
    invoke-virtual {v0}, Ll/hg60;->g()Z

    .line 396
    .line 397
    .line 398
    move-result v3

    .line 399
    const/16 v5, 0xe

    .line 400
    .line 401
    if-eqz v3, :cond_1c

    .line 402
    .line 403
    invoke-virtual {v0, v5}, Ll/hg60;->r(I)V

    .line 404
    .line 405
    .line 406
    :cond_1c
    if-nez v8, :cond_1d

    .line 407
    .line 408
    invoke-virtual {v0}, Ll/hg60;->g()Z

    .line 409
    .line 410
    .line 411
    move-result v3

    .line 412
    if-eqz v3, :cond_1d

    .line 413
    .line 414
    invoke-virtual {v0, v5}, Ll/hg60;->r(I)V

    .line 415
    .line 416
    .line 417
    :cond_1d
    invoke-virtual {v0}, Ll/hg60;->g()Z

    .line 418
    .line 419
    .line 420
    move-result v3

    .line 421
    if-eqz v3, :cond_20

    .line 422
    .line 423
    if-nez v14, :cond_1e

    .line 424
    .line 425
    invoke-virtual {v0, v2}, Ll/hg60;->r(I)V

    .line 426
    .line 427
    .line 428
    goto :goto_7

    .line 429
    :cond_1e
    const/4 v3, 0x0

    .line 430
    :goto_6
    if-ge v3, v15, :cond_20

    .line 431
    .line 432
    invoke-virtual {v0}, Ll/hg60;->g()Z

    .line 433
    .line 434
    .line 435
    move-result v5

    .line 436
    if-eqz v5, :cond_1f

    .line 437
    .line 438
    invoke-virtual {v0, v2}, Ll/hg60;->r(I)V

    .line 439
    .line 440
    .line 441
    :cond_1f
    add-int/lit8 v3, v3, 0x1

    .line 442
    .line 443
    goto :goto_6

    .line 444
    :cond_20
    :goto_7
    invoke-virtual {v0}, Ll/hg60;->g()Z

    .line 445
    .line 446
    .line 447
    move-result v3

    .line 448
    if-eqz v3, :cond_25

    .line 449
    .line 450
    invoke-virtual {v0, v2}, Ll/hg60;->r(I)V

    .line 451
    .line 452
    .line 453
    if-ne v8, v10, :cond_21

    .line 454
    .line 455
    invoke-virtual {v0, v6}, Ll/hg60;->r(I)V

    .line 456
    .line 457
    .line 458
    :cond_21
    const/4 v3, 0x6

    .line 459
    if-lt v8, v3, :cond_22

    .line 460
    .line 461
    invoke-virtual {v0, v10}, Ll/hg60;->r(I)V

    .line 462
    .line 463
    .line 464
    :cond_22
    invoke-virtual {v0}, Ll/hg60;->g()Z

    .line 465
    .line 466
    .line 467
    move-result v2

    .line 468
    if-eqz v2, :cond_23

    .line 469
    .line 470
    invoke-virtual {v0, v7}, Ll/hg60;->r(I)V

    .line 471
    .line 472
    .line 473
    :cond_23
    if-nez v8, :cond_24

    .line 474
    .line 475
    invoke-virtual {v0}, Ll/hg60;->g()Z

    .line 476
    .line 477
    .line 478
    move-result v2

    .line 479
    if-eqz v2, :cond_24

    .line 480
    .line 481
    invoke-virtual {v0, v7}, Ll/hg60;->r(I)V

    .line 482
    .line 483
    .line 484
    :cond_24
    if-ge v12, v9, :cond_25

    .line 485
    .line 486
    invoke-virtual {v0}, Ll/hg60;->q()V

    .line 487
    .line 488
    .line 489
    :cond_25
    if-nez v1, :cond_26

    .line 490
    .line 491
    if-eq v14, v9, :cond_26

    .line 492
    .line 493
    invoke-virtual {v0}, Ll/hg60;->q()V

    .line 494
    .line 495
    .line 496
    :cond_26
    if-ne v1, v10, :cond_28

    .line 497
    .line 498
    if-eq v14, v9, :cond_27

    .line 499
    .line 500
    invoke-virtual {v0}, Ll/hg60;->g()Z

    .line 501
    .line 502
    .line 503
    move-result v2

    .line 504
    if-eqz v2, :cond_28

    .line 505
    .line 506
    :cond_27
    const/4 v3, 0x6

    .line 507
    goto :goto_8

    .line 508
    :cond_28
    const/4 v3, 0x6

    .line 509
    goto :goto_9

    .line 510
    :goto_8
    invoke-virtual {v0, v3}, Ll/hg60;->r(I)V

    .line 511
    .line 512
    .line 513
    :goto_9
    invoke-virtual {v0}, Ll/hg60;->g()Z

    .line 514
    .line 515
    .line 516
    move-result v2

    .line 517
    if-eqz v2, :cond_29

    .line 518
    .line 519
    invoke-virtual {v0, v3}, Ll/hg60;->h(I)I

    .line 520
    .line 521
    .line 522
    move-result v2

    .line 523
    const/4 v3, 0x1

    .line 524
    if-ne v2, v3, :cond_29

    .line 525
    .line 526
    invoke-virtual {v0, v7}, Ll/hg60;->h(I)I

    .line 527
    .line 528
    .line 529
    move-result v0

    .line 530
    if-ne v0, v3, :cond_29

    .line 531
    .line 532
    const-string v0, "audio/eac3-joc"

    .line 533
    .line 534
    goto :goto_a

    .line 535
    :cond_29
    const-string v0, "audio/eac3"

    .line 536
    .line 537
    :goto_a
    move-object/from16 v21, v0

    .line 538
    .line 539
    move/from16 v27, v16

    .line 540
    .line 541
    :goto_b
    move/from16 v22, v1

    .line 542
    .line 543
    move/from16 v26, v4

    .line 544
    .line 545
    move/from16 v25, v11

    .line 546
    .line 547
    move/from16 v24, v13

    .line 548
    .line 549
    move/from16 v23, v19

    .line 550
    .line 551
    goto :goto_f

    .line 552
    :cond_2a
    const/16 v2, 0x20

    .line 553
    .line 554
    invoke-virtual {v0, v2}, Ll/hg60;->r(I)V

    .line 555
    .line 556
    .line 557
    invoke-virtual {v0, v10}, Ll/hg60;->h(I)I

    .line 558
    .line 559
    .line 560
    move-result v2

    .line 561
    if-ne v2, v9, :cond_2b

    .line 562
    .line 563
    const/4 v3, 0x0

    .line 564
    :goto_c
    const/4 v4, 0x6

    .line 565
    goto :goto_d

    .line 566
    :cond_2b
    const-string v3, "audio/ac3"

    .line 567
    .line 568
    goto :goto_c

    .line 569
    :goto_d
    invoke-virtual {v0, v4}, Ll/hg60;->h(I)I

    .line 570
    .line 571
    .line 572
    move-result v4

    .line 573
    sget-object v5, Ll/z8;->e:[I

    .line 574
    .line 575
    div-int/lit8 v6, v4, 0x2

    .line 576
    .line 577
    aget v5, v5, v6

    .line 578
    .line 579
    mul-int/lit16 v5, v5, 0x3e8

    .line 580
    .line 581
    invoke-static {v2, v4}, Ll/z8;->c(II)I

    .line 582
    .line 583
    .line 584
    move-result v11

    .line 585
    invoke-virtual {v0, v7}, Ll/hg60;->r(I)V

    .line 586
    .line 587
    .line 588
    invoke-virtual {v0, v9}, Ll/hg60;->h(I)I

    .line 589
    .line 590
    .line 591
    move-result v4

    .line 592
    and-int/lit8 v6, v4, 0x1

    .line 593
    .line 594
    if-eqz v6, :cond_2c

    .line 595
    .line 596
    const/4 v6, 0x1

    .line 597
    if-eq v4, v6, :cond_2c

    .line 598
    .line 599
    invoke-virtual {v0, v10}, Ll/hg60;->r(I)V

    .line 600
    .line 601
    .line 602
    :cond_2c
    and-int/lit8 v6, v4, 0x4

    .line 603
    .line 604
    if-eqz v6, :cond_2d

    .line 605
    .line 606
    invoke-virtual {v0, v10}, Ll/hg60;->r(I)V

    .line 607
    .line 608
    .line 609
    :cond_2d
    if-ne v4, v10, :cond_2e

    .line 610
    .line 611
    invoke-virtual {v0, v10}, Ll/hg60;->r(I)V

    .line 612
    .line 613
    .line 614
    :cond_2e
    sget-object v6, Ll/z8;->b:[I

    .line 615
    .line 616
    array-length v7, v6

    .line 617
    if-ge v2, v7, :cond_2f

    .line 618
    .line 619
    aget v2, v6, v2

    .line 620
    .line 621
    move v13, v2

    .line 622
    goto :goto_e

    .line 623
    :cond_2f
    move v13, v1

    .line 624
    :goto_e
    invoke-virtual {v0}, Ll/hg60;->g()Z

    .line 625
    .line 626
    .line 627
    move-result v0

    .line 628
    sget-object v2, Ll/z8;->d:[I

    .line 629
    .line 630
    aget v2, v2, v4

    .line 631
    .line 632
    add-int v19, v2, v0

    .line 633
    .line 634
    const/16 v4, 0x600

    .line 635
    .line 636
    move-object/from16 v21, v3

    .line 637
    .line 638
    move/from16 v27, v5

    .line 639
    .line 640
    goto :goto_b

    .line 641
    :goto_f
    new-instance v20, Ll/z8$b;

    .line 642
    .line 643
    const/16 v28, 0x0

    .line 644
    .line 645
    invoke-direct/range {v20 .. v28}, Ll/z8$b;-><init>(Ljava/lang/String;IIIIIILl/z8$a;)V

    .line 646
    .line 647
    .line 648
    return-object v20
.end method

.method public static g([B)I
    .locals 4

    .line 1
    array-length v0, p0

    .line 2
    const/4 v1, 0x6

    .line 3
    if-ge v0, v1, :cond_0

    .line 4
    .line 5
    const/4 p0, -0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 v0, 0x5

    .line 8
    aget-byte v0, p0, v0

    .line 9
    .line 10
    and-int/lit16 v0, v0, 0xf8

    .line 11
    .line 12
    const/4 v2, 0x3

    .line 13
    shr-int/2addr v0, v2

    .line 14
    const/16 v3, 0xa

    .line 15
    .line 16
    if-le v0, v3, :cond_1

    .line 17
    .line 18
    const/4 v0, 0x2

    .line 19
    aget-byte v1, p0, v0

    .line 20
    .line 21
    and-int/lit8 v1, v1, 0x7

    .line 22
    .line 23
    shl-int/lit8 v1, v1, 0x8

    .line 24
    .line 25
    aget-byte p0, p0, v2

    .line 26
    .line 27
    and-int/lit16 p0, p0, 0xff

    .line 28
    .line 29
    or-int/2addr p0, v1

    .line 30
    add-int/lit8 p0, p0, 0x1

    .line 31
    .line 32
    mul-int/2addr p0, v0

    .line 33
    return p0

    .line 34
    :cond_1
    const/4 v0, 0x4

    .line 35
    aget-byte p0, p0, v0

    .line 36
    .line 37
    and-int/lit16 v0, p0, 0xc0

    .line 38
    .line 39
    shr-int/2addr v0, v1

    .line 40
    and-int/lit8 p0, p0, 0x3f

    .line 41
    .line 42
    invoke-static {v0, p0}, Ll/z8;->c(II)I

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    return p0
.end method

.method public static h(Ll/ig60;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/exoplayer2/drm/DrmInitData;)Lcom/google/android/exoplayer2/k;
    .locals 7
    .param p3    # Lcom/google/android/exoplayer2/drm/DrmInitData;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    new-instance v0, Ll/hg60;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/hg60;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Ll/hg60;->m(Ll/ig60;)V

    .line 7
    .line 8
    .line 9
    const/16 v1, 0xd

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ll/hg60;->h(I)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    mul-int/lit16 v1, v1, 0x3e8

    .line 16
    .line 17
    const/4 v2, 0x3

    .line 18
    invoke-virtual {v0, v2}, Ll/hg60;->r(I)V

    .line 19
    .line 20
    .line 21
    const/4 v3, 0x2

    .line 22
    invoke-virtual {v0, v3}, Ll/hg60;->h(I)I

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    sget-object v4, Ll/z8;->b:[I

    .line 27
    .line 28
    aget v3, v4, v3

    .line 29
    .line 30
    const/16 v4, 0xa

    .line 31
    .line 32
    invoke-virtual {v0, v4}, Ll/hg60;->r(I)V

    .line 33
    .line 34
    .line 35
    sget-object v4, Ll/z8;->d:[I

    .line 36
    .line 37
    invoke-virtual {v0, v2}, Ll/hg60;->h(I)I

    .line 38
    .line 39
    .line 40
    move-result v5

    .line 41
    aget v4, v4, v5

    .line 42
    .line 43
    const/4 v5, 0x1

    .line 44
    invoke-virtual {v0, v5}, Ll/hg60;->h(I)I

    .line 45
    .line 46
    .line 47
    move-result v6

    .line 48
    if-eqz v6, :cond_0

    .line 49
    .line 50
    add-int/lit8 v4, v4, 0x1

    .line 51
    .line 52
    :cond_0
    invoke-virtual {v0, v2}, Ll/hg60;->r(I)V

    .line 53
    .line 54
    .line 55
    const/4 v2, 0x4

    .line 56
    invoke-virtual {v0, v2}, Ll/hg60;->h(I)I

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    invoke-virtual {v0, v5}, Ll/hg60;->r(I)V

    .line 61
    .line 62
    .line 63
    if-lez v2, :cond_2

    .line 64
    .line 65
    const/4 v2, 0x6

    .line 66
    invoke-virtual {v0, v2}, Ll/hg60;->r(I)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0, v5}, Ll/hg60;->h(I)I

    .line 70
    .line 71
    .line 72
    move-result v2

    .line 73
    if-eqz v2, :cond_1

    .line 74
    .line 75
    add-int/lit8 v4, v4, 0x2

    .line 76
    .line 77
    :cond_1
    invoke-virtual {v0, v5}, Ll/hg60;->r(I)V

    .line 78
    .line 79
    .line 80
    :cond_2
    invoke-virtual {v0}, Ll/hg60;->b()I

    .line 81
    .line 82
    .line 83
    move-result v2

    .line 84
    const/4 v6, 0x7

    .line 85
    if-le v2, v6, :cond_3

    .line 86
    .line 87
    invoke-virtual {v0, v6}, Ll/hg60;->r(I)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v0, v5}, Ll/hg60;->h(I)I

    .line 91
    .line 92
    .line 93
    move-result v2

    .line 94
    if-eqz v2, :cond_3

    .line 95
    .line 96
    const-string v2, "audio/eac3-joc"

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_3
    const-string v2, "audio/eac3"

    .line 100
    .line 101
    :goto_0
    invoke-virtual {v0}, Ll/hg60;->c()V

    .line 102
    .line 103
    .line 104
    invoke-virtual {v0}, Ll/hg60;->d()I

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    invoke-virtual {p0, v0}, Ll/ig60;->U(I)V

    .line 109
    .line 110
    .line 111
    new-instance p0, Lcom/google/android/exoplayer2/k$b;

    .line 112
    .line 113
    invoke-direct {p0}, Lcom/google/android/exoplayer2/k$b;-><init>()V

    .line 114
    .line 115
    .line 116
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/k$b;->U(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    invoke-virtual {p0, v2}, Lcom/google/android/exoplayer2/k$b;->g0(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    invoke-virtual {p0, v4}, Lcom/google/android/exoplayer2/k$b;->J(I)Lcom/google/android/exoplayer2/k$b;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    invoke-virtual {p0, v3}, Lcom/google/android/exoplayer2/k$b;->h0(I)Lcom/google/android/exoplayer2/k$b;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    invoke-virtual {p0, p3}, Lcom/google/android/exoplayer2/k$b;->O(Lcom/google/android/exoplayer2/drm/DrmInitData;)Lcom/google/android/exoplayer2/k$b;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    invoke-virtual {p0, p2}, Lcom/google/android/exoplayer2/k$b;->X(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    invoke-virtual {p0, v1}, Lcom/google/android/exoplayer2/k$b;->b0(I)Lcom/google/android/exoplayer2/k$b;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/k$b;->G()Lcom/google/android/exoplayer2/k;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    return-object p0
.end method

.method public static i(Ljava/nio/ByteBuffer;I)I
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/nio/Buffer;->position()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    add-int/2addr v0, p1

    .line 6
    add-int/lit8 v0, v0, 0x7

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->get(I)B

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    and-int/lit16 v0, v0, 0xff

    .line 13
    .line 14
    const/16 v1, 0xbb

    .line 15
    .line 16
    if-ne v0, v1, :cond_0

    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v0, 0x0

    .line 21
    :goto_0
    invoke-virtual {p0}, Ljava/nio/Buffer;->position()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    add-int/2addr v1, p1

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    const/16 p1, 0x9

    .line 29
    .line 30
    goto :goto_1

    .line 31
    :cond_1
    const/16 p1, 0x8

    .line 32
    .line 33
    :goto_1
    add-int/2addr v1, p1

    .line 34
    invoke-virtual {p0, v1}, Ljava/nio/ByteBuffer;->get(I)B

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    shr-int/lit8 p0, p0, 0x4

    .line 39
    .line 40
    and-int/lit8 p0, p0, 0x7

    .line 41
    .line 42
    const/16 p1, 0x28

    .line 43
    .line 44
    shl-int p0, p1, p0

    .line 45
    .line 46
    return p0
.end method

.method public static j([B)I
    .locals 6

    .line 1
    const/4 v0, 0x4

    .line 2
    aget-byte v1, p0, v0

    .line 3
    .line 4
    const/4 v2, -0x8

    .line 5
    const/4 v3, 0x0

    .line 6
    if-ne v1, v2, :cond_3

    .line 7
    .line 8
    const/4 v1, 0x5

    .line 9
    aget-byte v1, p0, v1

    .line 10
    .line 11
    const/16 v2, 0x72

    .line 12
    .line 13
    if-ne v1, v2, :cond_3

    .line 14
    .line 15
    const/4 v1, 0x6

    .line 16
    aget-byte v1, p0, v1

    .line 17
    .line 18
    const/16 v2, 0x6f

    .line 19
    .line 20
    if-ne v1, v2, :cond_3

    .line 21
    .line 22
    const/4 v1, 0x7

    .line 23
    aget-byte v2, p0, v1

    .line 24
    .line 25
    and-int/lit16 v4, v2, 0xfe

    .line 26
    .line 27
    const/16 v5, 0xba

    .line 28
    .line 29
    if-eq v4, v5, :cond_0

    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_0
    and-int/lit16 v2, v2, 0xff

    .line 33
    .line 34
    const/16 v4, 0xbb

    .line 35
    .line 36
    if-ne v2, v4, :cond_1

    .line 37
    .line 38
    const/4 v3, 0x1

    .line 39
    :cond_1
    if-eqz v3, :cond_2

    .line 40
    .line 41
    const/16 v2, 0x9

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_2
    const/16 v2, 0x8

    .line 45
    .line 46
    :goto_0
    aget-byte p0, p0, v2

    .line 47
    .line 48
    shr-int/2addr p0, v0

    .line 49
    and-int/2addr p0, v1

    .line 50
    const/16 v0, 0x28

    .line 51
    .line 52
    shl-int p0, v0, p0

    .line 53
    .line 54
    return p0

    .line 55
    :cond_3
    :goto_1
    return v3
.end method
