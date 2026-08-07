.class public final Ll/jg50;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field public static final d:[B

.field public static final e:[B


# instance fields
.field public a:Ljava/nio/ByteBuffer;

.field public b:I

.field public c:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/16 v0, 0x2f

    .line 2
    .line 3
    new-array v0, v0, [B

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v0, Ll/jg50;->d:[B

    .line 9
    .line 10
    const/16 v0, 0x2c

    .line 11
    .line 12
    new-array v0, v0, [B

    .line 13
    .line 14
    fill-array-data v0, :array_1

    .line 15
    .line 16
    .line 17
    sput-object v0, Ll/jg50;->e:[B

    .line 18
    .line 19
    return-void

    .line 20
    nop

    .line 21
    :array_0
    .array-data 1
        0x4ft
        0x67t
        0x67t
        0x53t
        0x0t
        0x2t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x1ct
        -0x2bt
        -0x3bt
        -0x9t
        0x1t
        0x13t
        0x4ft
        0x70t
        0x75t
        0x73t
        0x48t
        0x65t
        0x61t
        0x64t
        0x1t
        0x2t
        0x38t
        0x1t
        -0x80t
        -0x45t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
    .end array-data

    .line 22
    .line 23
    .line 24
    .line 25
    .line 26
    .line 27
    .line 28
    .line 29
    .line 30
    .line 31
    .line 32
    .line 33
    .line 34
    .line 35
    .line 36
    .line 37
    .line 38
    .line 39
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
    :array_1
    .array-data 1
        0x4ft
        0x67t
        0x67t
        0x53t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x1t
        0x0t
        0x0t
        0x0t
        0xbt
        -0x67t
        0x57t
        0x53t
        0x1t
        0x10t
        0x4ft
        0x70t
        0x75t
        0x73t
        0x54t
        0x61t
        0x67t
        0x73t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/google/android/exoplayer2/audio/AudioProcessor;->a:Ljava/nio/ByteBuffer;

    .line 5
    .line 6
    iput-object v0, p0, Ll/jg50;->a:Ljava/nio/ByteBuffer;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput v0, p0, Ll/jg50;->c:I

    .line 10
    .line 11
    const/4 v0, 0x2

    .line 12
    iput v0, p0, Ll/jg50;->b:I

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public a(Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;",
            "Ljava/util/List<",
            "[B>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;->c:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    iget-object v0, p1, Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;->c:Ljava/nio/ByteBuffer;

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/nio/Buffer;->limit()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iget-object v1, p1, Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;->c:Ljava/nio/ByteBuffer;

    .line 13
    .line 14
    invoke-virtual {v1}, Ljava/nio/Buffer;->position()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    sub-int/2addr v0, v1

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    iget v0, p0, Ll/jg50;->b:I

    .line 23
    .line 24
    const/4 v1, 0x2

    .line 25
    if-ne v0, v1, :cond_2

    .line 26
    .line 27
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    const/4 v1, 0x1

    .line 32
    if-eq v0, v1, :cond_1

    .line 33
    .line 34
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    const/4 v1, 0x3

    .line 39
    if-ne v0, v1, :cond_2

    .line 40
    .line 41
    :cond_1
    const/4 v0, 0x0

    .line 42
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    check-cast p2, [B

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_2
    const/4 p2, 0x0

    .line 50
    :goto_0
    iget-object v0, p1, Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;->c:Ljava/nio/ByteBuffer;

    .line 51
    .line 52
    invoke-virtual {p0, v0, p2}, Ll/jg50;->b(Ljava/nio/ByteBuffer;[B)Ljava/nio/ByteBuffer;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    iput-object p2, p0, Ll/jg50;->a:Ljava/nio/ByteBuffer;

    .line 57
    .line 58
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;->i()V

    .line 59
    .line 60
    .line 61
    iget-object p2, p0, Ll/jg50;->a:Ljava/nio/ByteBuffer;

    .line 62
    .line 63
    invoke-virtual {p2}, Ljava/nio/Buffer;->remaining()I

    .line 64
    .line 65
    .line 66
    move-result p2

    .line 67
    invoke-virtual {p1, p2}, Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;->v(I)V

    .line 68
    .line 69
    .line 70
    iget-object p2, p1, Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;->c:Ljava/nio/ByteBuffer;

    .line 71
    .line 72
    iget-object p0, p0, Ll/jg50;->a:Ljava/nio/ByteBuffer;

    .line 73
    .line 74
    invoke-virtual {p2, p0}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 75
    .line 76
    .line 77
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;->w()V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public final b(Ljava/nio/ByteBuffer;[B)Ljava/nio/ByteBuffer;
    .locals 15
    .param p2    # [B
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    move-object/from16 v7, p1

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    invoke-virtual {v7}, Ljava/nio/Buffer;->position()I

    .line 6
    .line 7
    .line 8
    move-result v8

    .line 9
    invoke-virtual {v7}, Ljava/nio/Buffer;->limit()I

    .line 10
    .line 11
    .line 12
    move-result v9

    .line 13
    sub-int v10, v9, v8

    .line 14
    .line 15
    add-int/lit16 v2, v10, 0xff

    .line 16
    .line 17
    const/16 v11, 0xff

    .line 18
    .line 19
    div-int/lit16 v5, v2, 0xff

    .line 20
    .line 21
    add-int/lit8 v2, v5, 0x1b

    .line 22
    .line 23
    add-int/2addr v2, v10

    .line 24
    iget v3, p0, Ll/jg50;->b:I

    .line 25
    .line 26
    const/4 v12, 0x0

    .line 27
    const/4 v13, 0x2

    .line 28
    if-ne v3, v13, :cond_1

    .line 29
    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    array-length v3, v1

    .line 33
    add-int/lit8 v3, v3, 0x1c

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    sget-object v3, Ll/jg50;->d:[B

    .line 37
    .line 38
    array-length v3, v3

    .line 39
    :goto_0
    sget-object v4, Ll/jg50;->e:[B

    .line 40
    .line 41
    array-length v4, v4

    .line 42
    add-int/2addr v4, v3

    .line 43
    add-int/2addr v2, v4

    .line 44
    move v14, v3

    .line 45
    goto :goto_1

    .line 46
    :cond_1
    move v14, v12

    .line 47
    :goto_1
    invoke-virtual {p0, v2}, Ll/jg50;->c(I)Ljava/nio/ByteBuffer;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    iget v3, p0, Ll/jg50;->b:I

    .line 52
    .line 53
    if-ne v3, v13, :cond_3

    .line 54
    .line 55
    if-eqz v1, :cond_2

    .line 56
    .line 57
    invoke-virtual {p0, v2, v1}, Ll/jg50;->e(Ljava/nio/ByteBuffer;[B)V

    .line 58
    .line 59
    .line 60
    goto :goto_2

    .line 61
    :cond_2
    sget-object v1, Ll/jg50;->d:[B

    .line 62
    .line 63
    invoke-virtual {v2, v1}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 64
    .line 65
    .line 66
    :goto_2
    sget-object v1, Ll/jg50;->e:[B

    .line 67
    .line 68
    invoke-virtual {v2, v1}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 69
    .line 70
    .line 71
    :cond_3
    invoke-static {v7}, Ll/w560;->i(Ljava/nio/ByteBuffer;)I

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    iget v3, p0, Ll/jg50;->c:I

    .line 76
    .line 77
    add-int/2addr v3, v1

    .line 78
    iput v3, p0, Ll/jg50;->c:I

    .line 79
    .line 80
    int-to-long v3, v3

    .line 81
    move-object v1, v2

    .line 82
    move-wide v2, v3

    .line 83
    iget v4, p0, Ll/jg50;->b:I

    .line 84
    .line 85
    const/4 v6, 0x0

    .line 86
    move-object v0, p0

    .line 87
    invoke-virtual/range {v0 .. v6}, Ll/jg50;->f(Ljava/nio/ByteBuffer;JIIZ)V

    .line 88
    .line 89
    .line 90
    move v2, v12

    .line 91
    :goto_3
    if-ge v2, v5, :cond_5

    .line 92
    .line 93
    if-lt v10, v11, :cond_4

    .line 94
    .line 95
    const/4 v3, -0x1

    .line 96
    invoke-virtual {v1, v3}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 97
    .line 98
    .line 99
    add-int/lit16 v10, v10, -0xff

    .line 100
    .line 101
    goto :goto_4

    .line 102
    :cond_4
    int-to-byte v3, v10

    .line 103
    invoke-virtual {v1, v3}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 104
    .line 105
    .line 106
    move v10, v12

    .line 107
    :goto_4
    add-int/lit8 v2, v2, 0x1

    .line 108
    .line 109
    goto :goto_3

    .line 110
    :cond_5
    :goto_5
    if-ge v8, v9, :cond_6

    .line 111
    .line 112
    invoke-virtual {v7, v8}, Ljava/nio/ByteBuffer;->get(I)B

    .line 113
    .line 114
    .line 115
    move-result v2

    .line 116
    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 117
    .line 118
    .line 119
    add-int/lit8 v8, v8, 0x1

    .line 120
    .line 121
    goto :goto_5

    .line 122
    :cond_6
    invoke-virtual {v7}, Ljava/nio/Buffer;->limit()I

    .line 123
    .line 124
    .line 125
    move-result v2

    .line 126
    invoke-virtual {v7, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 127
    .line 128
    .line 129
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 130
    .line 131
    .line 132
    iget v2, p0, Ll/jg50;->b:I

    .line 133
    .line 134
    const/16 v3, 0x16

    .line 135
    .line 136
    if-ne v2, v13, :cond_7

    .line 137
    .line 138
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    .line 139
    .line 140
    .line 141
    move-result-object v2

    .line 142
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->arrayOffset()I

    .line 143
    .line 144
    .line 145
    move-result v4

    .line 146
    add-int/2addr v4, v14

    .line 147
    sget-object v5, Ll/jg50;->e:[B

    .line 148
    .line 149
    array-length v6, v5

    .line 150
    add-int/2addr v4, v6

    .line 151
    invoke-virtual {v1}, Ljava/nio/Buffer;->limit()I

    .line 152
    .line 153
    .line 154
    move-result v6

    .line 155
    invoke-virtual {v1}, Ljava/nio/Buffer;->position()I

    .line 156
    .line 157
    .line 158
    move-result v7

    .line 159
    sub-int/2addr v6, v7

    .line 160
    invoke-static {v2, v4, v6, v12}, Ll/bmk0;->t([BIII)I

    .line 161
    .line 162
    .line 163
    move-result v2

    .line 164
    array-length v4, v5

    .line 165
    add-int/2addr v14, v4

    .line 166
    add-int/2addr v14, v3

    .line 167
    invoke-virtual {v1, v14, v2}, Ljava/nio/ByteBuffer;->putInt(II)Ljava/nio/ByteBuffer;

    .line 168
    .line 169
    .line 170
    goto :goto_6

    .line 171
    :cond_7
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    .line 172
    .line 173
    .line 174
    move-result-object v2

    .line 175
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->arrayOffset()I

    .line 176
    .line 177
    .line 178
    move-result v4

    .line 179
    invoke-virtual {v1}, Ljava/nio/Buffer;->limit()I

    .line 180
    .line 181
    .line 182
    move-result v5

    .line 183
    invoke-virtual {v1}, Ljava/nio/Buffer;->position()I

    .line 184
    .line 185
    .line 186
    move-result v6

    .line 187
    sub-int/2addr v5, v6

    .line 188
    invoke-static {v2, v4, v5, v12}, Ll/bmk0;->t([BIII)I

    .line 189
    .line 190
    .line 191
    move-result v2

    .line 192
    invoke-virtual {v1, v3, v2}, Ljava/nio/ByteBuffer;->putInt(II)Ljava/nio/ByteBuffer;

    .line 193
    .line 194
    .line 195
    :goto_6
    iget v2, p0, Ll/jg50;->b:I

    .line 196
    .line 197
    add-int/lit8 v2, v2, 0x1

    .line 198
    .line 199
    iput v2, p0, Ll/jg50;->b:I

    .line 200
    .line 201
    return-object v1
.end method

.method public final c(I)Ljava/nio/ByteBuffer;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jg50;->a:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/nio/Buffer;->capacity()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-ge v0, p1, :cond_0

    .line 8
    .line 9
    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    sget-object v0, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iput-object p1, p0, Ll/jg50;->a:Ljava/nio/ByteBuffer;

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object p1, p0, Ll/jg50;->a:Ljava/nio/ByteBuffer;

    .line 23
    .line 24
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 25
    .line 26
    .line 27
    :goto_0
    iget-object p0, p0, Ll/jg50;->a:Ljava/nio/ByteBuffer;

    .line 28
    .line 29
    return-object p0
.end method

.method public d()V
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/exoplayer2/audio/AudioProcessor;->a:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    iput-object v0, p0, Ll/jg50;->a:Ljava/nio/ByteBuffer;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput v0, p0, Ll/jg50;->c:I

    .line 7
    .line 8
    const/4 v0, 0x2

    .line 9
    iput v0, p0, Ll/jg50;->b:I

    .line 10
    .line 11
    return-void
.end method

.method public final e(Ljava/nio/ByteBuffer;[B)V
    .locals 7

    .line 1
    const/4 v5, 0x1

    .line 2
    const/4 v6, 0x1

    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    const/4 v4, 0x0

    .line 6
    move-object v0, p0

    .line 7
    move-object v1, p1

    .line 8
    invoke-virtual/range {v0 .. v6}, Ll/jg50;->f(Ljava/nio/ByteBuffer;JIIZ)V

    .line 9
    .line 10
    .line 11
    array-length p0, p2

    .line 12
    int-to-long p0, p0

    .line 13
    invoke-static {p0, p1}, Ll/myj0;->a(J)B

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    invoke-virtual {v1, p0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1, p2}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->arrayOffset()I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    array-length v0, p2

    .line 32
    add-int/lit8 v0, v0, 0x1c

    .line 33
    .line 34
    const/4 v2, 0x0

    .line 35
    invoke-static {p0, p1, v0, v2}, Ll/bmk0;->t([BIII)I

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    const/16 p1, 0x16

    .line 40
    .line 41
    invoke-virtual {v1, p1, p0}, Ljava/nio/ByteBuffer;->putInt(II)Ljava/nio/ByteBuffer;

    .line 42
    .line 43
    .line 44
    array-length p0, p2

    .line 45
    add-int/lit8 p0, p0, 0x1c

    .line 46
    .line 47
    invoke-virtual {v1, p0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final f(Ljava/nio/ByteBuffer;JIIZ)V
    .locals 0

    .line 1
    const/16 p0, 0x4f

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 4
    .line 5
    .line 6
    const/16 p0, 0x67

    .line 7
    .line 8
    invoke-virtual {p1, p0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1, p0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 12
    .line 13
    .line 14
    const/16 p0, 0x53

    .line 15
    .line 16
    invoke-virtual {p1, p0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    invoke-virtual {p1, p0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 21
    .line 22
    .line 23
    if-eqz p6, :cond_0

    .line 24
    .line 25
    const/4 p6, 0x2

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    move p6, p0

    .line 28
    :goto_0
    invoke-virtual {p1, p6}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1, p2, p3}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1, p0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1, p4}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1, p0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 41
    .line 42
    .line 43
    int-to-long p2, p5

    .line 44
    invoke-static {p2, p3}, Ll/myj0;->a(J)B

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    invoke-virtual {p1, p0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 49
    .line 50
    .line 51
    return-void
.end method
