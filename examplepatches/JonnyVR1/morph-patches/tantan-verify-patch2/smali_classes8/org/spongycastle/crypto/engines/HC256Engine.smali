.class public Lorg/spongycastle/crypto/engines/HC256Engine;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/StreamCipher;


# instance fields
.field private buf:[B

.field private cnt:I

.field private idx:I

.field private initialised:Z

.field private iv:[B

.field private key:[B

.field private p:[I

.field private q:[I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x400

    .line 5
    .line 6
    new-array v1, v0, [I

    .line 7
    .line 8
    iput-object v1, p0, Lorg/spongycastle/crypto/engines/HC256Engine;->p:[I

    .line 9
    .line 10
    new-array v0, v0, [I

    .line 11
    .line 12
    iput-object v0, p0, Lorg/spongycastle/crypto/engines/HC256Engine;->q:[I

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput v0, p0, Lorg/spongycastle/crypto/engines/HC256Engine;->cnt:I

    .line 16
    .line 17
    const/4 v1, 0x4

    .line 18
    new-array v1, v1, [B

    .line 19
    .line 20
    iput-object v1, p0, Lorg/spongycastle/crypto/engines/HC256Engine;->buf:[B

    .line 21
    .line 22
    iput v0, p0, Lorg/spongycastle/crypto/engines/HC256Engine;->idx:I

    .line 23
    .line 24
    return-void
.end method

.method private getByte()B
    .locals 6

    .line 1
    iget v0, p0, Lorg/spongycastle/crypto/engines/HC256Engine;->idx:I

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    const/4 v2, 0x1

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-direct {p0}, Lorg/spongycastle/crypto/engines/HC256Engine;->step()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v3, p0, Lorg/spongycastle/crypto/engines/HC256Engine;->buf:[B

    .line 12
    .line 13
    and-int/lit16 v4, v0, 0xff

    .line 14
    .line 15
    int-to-byte v4, v4

    .line 16
    const/4 v5, 0x0

    .line 17
    aput-byte v4, v3, v5

    .line 18
    .line 19
    shr-int/lit8 v4, v0, 0x8

    .line 20
    .line 21
    and-int/lit16 v4, v4, 0xff

    .line 22
    .line 23
    int-to-byte v4, v4

    .line 24
    aput-byte v4, v3, v2

    .line 25
    .line 26
    shr-int/lit8 v4, v0, 0x10

    .line 27
    .line 28
    and-int/lit16 v4, v4, 0xff

    .line 29
    .line 30
    int-to-byte v4, v4

    .line 31
    const/4 v5, 0x2

    .line 32
    aput-byte v4, v3, v5

    .line 33
    .line 34
    shr-int/lit8 v0, v0, 0x18

    .line 35
    .line 36
    and-int/lit16 v0, v0, 0xff

    .line 37
    .line 38
    int-to-byte v0, v0

    .line 39
    aput-byte v0, v3, v1

    .line 40
    .line 41
    :cond_0
    iget-object v0, p0, Lorg/spongycastle/crypto/engines/HC256Engine;->buf:[B

    .line 42
    .line 43
    iget v3, p0, Lorg/spongycastle/crypto/engines/HC256Engine;->idx:I

    .line 44
    .line 45
    aget-byte v0, v0, v3

    .line 46
    .line 47
    add-int/2addr v3, v2

    .line 48
    and-int/2addr v1, v3

    .line 49
    iput v1, p0, Lorg/spongycastle/crypto/engines/HC256Engine;->idx:I

    .line 50
    .line 51
    return v0
.end method

.method private init()V
    .locals 10

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/engines/HC256Engine;->key:[B

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    const/16 v2, 0x10

    .line 5
    .line 6
    const/16 v3, 0x20

    .line 7
    .line 8
    if-eq v1, v3, :cond_1

    .line 9
    .line 10
    array-length v1, v0

    .line 11
    if-ne v1, v2, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const-string p0, "The key must be 128/256 bits long"

    .line 15
    .line 16
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_1
    :goto_0
    iget-object v1, p0, Lorg/spongycastle/crypto/engines/HC256Engine;->iv:[B

    .line 21
    .line 22
    array-length v1, v1

    .line 23
    if-lt v1, v2, :cond_8

    .line 24
    .line 25
    array-length v1, v0

    .line 26
    const/4 v4, 0x0

    .line 27
    if-eq v1, v3, :cond_2

    .line 28
    .line 29
    new-array v1, v3, [B

    .line 30
    .line 31
    array-length v5, v0

    .line 32
    invoke-static {v0, v4, v1, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lorg/spongycastle/crypto/engines/HC256Engine;->key:[B

    .line 36
    .line 37
    array-length v5, v0

    .line 38
    invoke-static {v0, v4, v1, v2, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 39
    .line 40
    .line 41
    iput-object v1, p0, Lorg/spongycastle/crypto/engines/HC256Engine;->key:[B

    .line 42
    .line 43
    :cond_2
    iget-object v0, p0, Lorg/spongycastle/crypto/engines/HC256Engine;->iv:[B

    .line 44
    .line 45
    array-length v1, v0

    .line 46
    if-ge v1, v3, :cond_3

    .line 47
    .line 48
    new-array v1, v3, [B

    .line 49
    .line 50
    array-length v5, v0

    .line 51
    invoke-static {v0, v4, v1, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lorg/spongycastle/crypto/engines/HC256Engine;->iv:[B

    .line 55
    .line 56
    array-length v5, v0

    .line 57
    array-length v6, v0

    .line 58
    rsub-int/lit8 v6, v6, 0x20

    .line 59
    .line 60
    invoke-static {v0, v4, v1, v5, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 61
    .line 62
    .line 63
    iput-object v1, p0, Lorg/spongycastle/crypto/engines/HC256Engine;->iv:[B

    .line 64
    .line 65
    :cond_3
    iput v4, p0, Lorg/spongycastle/crypto/engines/HC256Engine;->idx:I

    .line 66
    .line 67
    iput v4, p0, Lorg/spongycastle/crypto/engines/HC256Engine;->cnt:I

    .line 68
    .line 69
    const/16 v0, 0xa00

    .line 70
    .line 71
    new-array v1, v0, [I

    .line 72
    .line 73
    move v5, v4

    .line 74
    :goto_1
    if-ge v5, v3, :cond_4

    .line 75
    .line 76
    shr-int/lit8 v6, v5, 0x2

    .line 77
    .line 78
    aget v7, v1, v6

    .line 79
    .line 80
    iget-object v8, p0, Lorg/spongycastle/crypto/engines/HC256Engine;->key:[B

    .line 81
    .line 82
    aget-byte v8, v8, v5

    .line 83
    .line 84
    and-int/lit16 v8, v8, 0xff

    .line 85
    .line 86
    and-int/lit8 v9, v5, 0x3

    .line 87
    .line 88
    mul-int/lit8 v9, v9, 0x8

    .line 89
    .line 90
    shl-int/2addr v8, v9

    .line 91
    or-int/2addr v7, v8

    .line 92
    aput v7, v1, v6

    .line 93
    .line 94
    add-int/lit8 v5, v5, 0x1

    .line 95
    .line 96
    goto :goto_1

    .line 97
    :cond_4
    move v5, v4

    .line 98
    :goto_2
    if-ge v5, v3, :cond_5

    .line 99
    .line 100
    shr-int/lit8 v6, v5, 0x2

    .line 101
    .line 102
    add-int/lit8 v6, v6, 0x8

    .line 103
    .line 104
    aget v7, v1, v6

    .line 105
    .line 106
    iget-object v8, p0, Lorg/spongycastle/crypto/engines/HC256Engine;->iv:[B

    .line 107
    .line 108
    aget-byte v8, v8, v5

    .line 109
    .line 110
    and-int/lit16 v8, v8, 0xff

    .line 111
    .line 112
    and-int/lit8 v9, v5, 0x3

    .line 113
    .line 114
    mul-int/lit8 v9, v9, 0x8

    .line 115
    .line 116
    shl-int/2addr v8, v9

    .line 117
    or-int/2addr v7, v8

    .line 118
    aput v7, v1, v6

    .line 119
    .line 120
    add-int/lit8 v5, v5, 0x1

    .line 121
    .line 122
    goto :goto_2

    .line 123
    :cond_5
    :goto_3
    if-ge v2, v0, :cond_6

    .line 124
    .line 125
    add-int/lit8 v3, v2, -0x2

    .line 126
    .line 127
    aget v3, v1, v3

    .line 128
    .line 129
    add-int/lit8 v5, v2, -0xf

    .line 130
    .line 131
    aget v5, v1, v5

    .line 132
    .line 133
    const/16 v6, 0x11

    .line 134
    .line 135
    invoke-static {v3, v6}, Lorg/spongycastle/crypto/engines/HC256Engine;->rotateRight(II)I

    .line 136
    .line 137
    .line 138
    move-result v6

    .line 139
    const/16 v7, 0x13

    .line 140
    .line 141
    invoke-static {v3, v7}, Lorg/spongycastle/crypto/engines/HC256Engine;->rotateRight(II)I

    .line 142
    .line 143
    .line 144
    move-result v7

    .line 145
    xor-int/2addr v6, v7

    .line 146
    ushr-int/lit8 v3, v3, 0xa

    .line 147
    .line 148
    xor-int/2addr v3, v6

    .line 149
    add-int/lit8 v6, v2, -0x7

    .line 150
    .line 151
    aget v6, v1, v6

    .line 152
    .line 153
    add-int/2addr v3, v6

    .line 154
    const/4 v6, 0x7

    .line 155
    invoke-static {v5, v6}, Lorg/spongycastle/crypto/engines/HC256Engine;->rotateRight(II)I

    .line 156
    .line 157
    .line 158
    move-result v6

    .line 159
    const/16 v7, 0x12

    .line 160
    .line 161
    invoke-static {v5, v7}, Lorg/spongycastle/crypto/engines/HC256Engine;->rotateRight(II)I

    .line 162
    .line 163
    .line 164
    move-result v7

    .line 165
    xor-int/2addr v6, v7

    .line 166
    ushr-int/lit8 v5, v5, 0x3

    .line 167
    .line 168
    xor-int/2addr v5, v6

    .line 169
    add-int/2addr v3, v5

    .line 170
    add-int/lit8 v5, v2, -0x10

    .line 171
    .line 172
    aget v5, v1, v5

    .line 173
    .line 174
    add-int/2addr v3, v5

    .line 175
    add-int/2addr v3, v2

    .line 176
    aput v3, v1, v2

    .line 177
    .line 178
    add-int/lit8 v2, v2, 0x1

    .line 179
    .line 180
    goto :goto_3

    .line 181
    :cond_6
    const/16 v0, 0x200

    .line 182
    .line 183
    iget-object v2, p0, Lorg/spongycastle/crypto/engines/HC256Engine;->p:[I

    .line 184
    .line 185
    const/16 v3, 0x400

    .line 186
    .line 187
    invoke-static {v1, v0, v2, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 188
    .line 189
    .line 190
    const/16 v0, 0x600

    .line 191
    .line 192
    iget-object v2, p0, Lorg/spongycastle/crypto/engines/HC256Engine;->q:[I

    .line 193
    .line 194
    invoke-static {v1, v0, v2, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 195
    .line 196
    .line 197
    move v0, v4

    .line 198
    :goto_4
    const/16 v1, 0x1000

    .line 199
    .line 200
    if-ge v0, v1, :cond_7

    .line 201
    .line 202
    invoke-direct {p0}, Lorg/spongycastle/crypto/engines/HC256Engine;->step()I

    .line 203
    .line 204
    .line 205
    add-int/lit8 v0, v0, 0x1

    .line 206
    .line 207
    goto :goto_4

    .line 208
    :cond_7
    iput v4, p0, Lorg/spongycastle/crypto/engines/HC256Engine;->cnt:I

    .line 209
    .line 210
    return-void

    .line 211
    :cond_8
    const-string p0, "The IV must be at least 128 bits long"

    .line 212
    .line 213
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 214
    .line 215
    .line 216
    return-void
.end method

.method private static rotateRight(II)I
    .locals 1

    ushr-int v0, p0, p1

    neg-int p1, p1

    shl-int/2addr p0, p1

    or-int/2addr p0, v0

    return p0
.end method

.method private step()I
    .locals 8

    .line 1
    iget v0, p0, Lorg/spongycastle/crypto/engines/HC256Engine;->cnt:I

    .line 2
    .line 3
    and-int/lit16 v1, v0, 0x3ff

    .line 4
    .line 5
    const/16 v2, 0x400

    .line 6
    .line 7
    const/16 v3, 0x17

    .line 8
    .line 9
    const/16 v4, 0xa

    .line 10
    .line 11
    if-ge v0, v2, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lorg/spongycastle/crypto/engines/HC256Engine;->p:[I

    .line 14
    .line 15
    add-int/lit8 v2, v1, -0x3

    .line 16
    .line 17
    and-int/lit16 v2, v2, 0x3ff

    .line 18
    .line 19
    aget v2, v0, v2

    .line 20
    .line 21
    add-int/lit16 v5, v1, -0x3ff

    .line 22
    .line 23
    and-int/lit16 v5, v5, 0x3ff

    .line 24
    .line 25
    aget v5, v0, v5

    .line 26
    .line 27
    aget v6, v0, v1

    .line 28
    .line 29
    add-int/lit8 v7, v1, -0xa

    .line 30
    .line 31
    and-int/lit16 v7, v7, 0x3ff

    .line 32
    .line 33
    aget v7, v0, v7

    .line 34
    .line 35
    invoke-static {v2, v4}, Lorg/spongycastle/crypto/engines/HC256Engine;->rotateRight(II)I

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    invoke-static {v5, v3}, Lorg/spongycastle/crypto/engines/HC256Engine;->rotateRight(II)I

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    xor-int/2addr v3, v4

    .line 44
    add-int/2addr v7, v3

    .line 45
    iget-object v3, p0, Lorg/spongycastle/crypto/engines/HC256Engine;->q:[I

    .line 46
    .line 47
    xor-int/2addr v2, v5

    .line 48
    and-int/lit16 v2, v2, 0x3ff

    .line 49
    .line 50
    aget v2, v3, v2

    .line 51
    .line 52
    add-int/2addr v7, v2

    .line 53
    add-int/2addr v6, v7

    .line 54
    aput v6, v0, v1

    .line 55
    .line 56
    iget-object v0, p0, Lorg/spongycastle/crypto/engines/HC256Engine;->p:[I

    .line 57
    .line 58
    add-int/lit8 v2, v1, -0xc

    .line 59
    .line 60
    and-int/lit16 v2, v2, 0x3ff

    .line 61
    .line 62
    aget v2, v0, v2

    .line 63
    .line 64
    and-int/lit16 v4, v2, 0xff

    .line 65
    .line 66
    aget v4, v3, v4

    .line 67
    .line 68
    shr-int/lit8 v5, v2, 0x8

    .line 69
    .line 70
    and-int/lit16 v5, v5, 0xff

    .line 71
    .line 72
    add-int/lit16 v5, v5, 0x100

    .line 73
    .line 74
    aget v5, v3, v5

    .line 75
    .line 76
    add-int/2addr v4, v5

    .line 77
    shr-int/lit8 v5, v2, 0x10

    .line 78
    .line 79
    and-int/lit16 v5, v5, 0xff

    .line 80
    .line 81
    add-int/lit16 v5, v5, 0x200

    .line 82
    .line 83
    aget v5, v3, v5

    .line 84
    .line 85
    add-int/2addr v4, v5

    .line 86
    shr-int/lit8 v2, v2, 0x18

    .line 87
    .line 88
    and-int/lit16 v2, v2, 0xff

    .line 89
    .line 90
    add-int/lit16 v2, v2, 0x300

    .line 91
    .line 92
    aget v2, v3, v2

    .line 93
    .line 94
    add-int/2addr v4, v2

    .line 95
    aget v0, v0, v1

    .line 96
    .line 97
    :goto_0
    xor-int/2addr v0, v4

    .line 98
    goto :goto_1

    .line 99
    :cond_0
    iget-object v0, p0, Lorg/spongycastle/crypto/engines/HC256Engine;->q:[I

    .line 100
    .line 101
    add-int/lit8 v2, v1, -0x3

    .line 102
    .line 103
    and-int/lit16 v2, v2, 0x3ff

    .line 104
    .line 105
    aget v2, v0, v2

    .line 106
    .line 107
    add-int/lit16 v5, v1, -0x3ff

    .line 108
    .line 109
    and-int/lit16 v5, v5, 0x3ff

    .line 110
    .line 111
    aget v5, v0, v5

    .line 112
    .line 113
    aget v6, v0, v1

    .line 114
    .line 115
    add-int/lit8 v7, v1, -0xa

    .line 116
    .line 117
    and-int/lit16 v7, v7, 0x3ff

    .line 118
    .line 119
    aget v7, v0, v7

    .line 120
    .line 121
    invoke-static {v2, v4}, Lorg/spongycastle/crypto/engines/HC256Engine;->rotateRight(II)I

    .line 122
    .line 123
    .line 124
    move-result v4

    .line 125
    invoke-static {v5, v3}, Lorg/spongycastle/crypto/engines/HC256Engine;->rotateRight(II)I

    .line 126
    .line 127
    .line 128
    move-result v3

    .line 129
    xor-int/2addr v3, v4

    .line 130
    add-int/2addr v7, v3

    .line 131
    iget-object v3, p0, Lorg/spongycastle/crypto/engines/HC256Engine;->p:[I

    .line 132
    .line 133
    xor-int/2addr v2, v5

    .line 134
    and-int/lit16 v2, v2, 0x3ff

    .line 135
    .line 136
    aget v2, v3, v2

    .line 137
    .line 138
    add-int/2addr v7, v2

    .line 139
    add-int/2addr v6, v7

    .line 140
    aput v6, v0, v1

    .line 141
    .line 142
    iget-object v0, p0, Lorg/spongycastle/crypto/engines/HC256Engine;->q:[I

    .line 143
    .line 144
    add-int/lit8 v2, v1, -0xc

    .line 145
    .line 146
    and-int/lit16 v2, v2, 0x3ff

    .line 147
    .line 148
    aget v2, v0, v2

    .line 149
    .line 150
    and-int/lit16 v4, v2, 0xff

    .line 151
    .line 152
    aget v4, v3, v4

    .line 153
    .line 154
    shr-int/lit8 v5, v2, 0x8

    .line 155
    .line 156
    and-int/lit16 v5, v5, 0xff

    .line 157
    .line 158
    add-int/lit16 v5, v5, 0x100

    .line 159
    .line 160
    aget v5, v3, v5

    .line 161
    .line 162
    add-int/2addr v4, v5

    .line 163
    shr-int/lit8 v5, v2, 0x10

    .line 164
    .line 165
    and-int/lit16 v5, v5, 0xff

    .line 166
    .line 167
    add-int/lit16 v5, v5, 0x200

    .line 168
    .line 169
    aget v5, v3, v5

    .line 170
    .line 171
    add-int/2addr v4, v5

    .line 172
    shr-int/lit8 v2, v2, 0x18

    .line 173
    .line 174
    and-int/lit16 v2, v2, 0xff

    .line 175
    .line 176
    add-int/lit16 v2, v2, 0x300

    .line 177
    .line 178
    aget v2, v3, v2

    .line 179
    .line 180
    add-int/2addr v4, v2

    .line 181
    aget v0, v0, v1

    .line 182
    .line 183
    goto :goto_0

    .line 184
    :goto_1
    iget v1, p0, Lorg/spongycastle/crypto/engines/HC256Engine;->cnt:I

    .line 185
    .line 186
    add-int/lit8 v1, v1, 0x1

    .line 187
    .line 188
    and-int/lit16 v1, v1, 0x7ff

    .line 189
    .line 190
    iput v1, p0, Lorg/spongycastle/crypto/engines/HC256Engine;->cnt:I

    .line 191
    .line 192
    return v0
.end method


# virtual methods
.method public getAlgorithmName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "HC-256"

    .line 2
    .line 3
    return-object p0
.end method

.method public init(ZLorg/spongycastle/crypto/CipherParameters;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 217
    instance-of p1, p2, Lorg/spongycastle/crypto/params/ParametersWithIV;

    if-eqz p1, :cond_0

    .line 218
    move-object p1, p2

    check-cast p1, Lorg/spongycastle/crypto/params/ParametersWithIV;

    invoke-virtual {p1}, Lorg/spongycastle/crypto/params/ParametersWithIV;->getIV()[B

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/crypto/engines/HC256Engine;->iv:[B

    .line 219
    invoke-virtual {p1}, Lorg/spongycastle/crypto/params/ParametersWithIV;->getParameters()Lorg/spongycastle/crypto/CipherParameters;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 220
    new-array p1, p1, [B

    iput-object p1, p0, Lorg/spongycastle/crypto/engines/HC256Engine;->iv:[B

    move-object p1, p2

    .line 221
    :goto_0
    instance-of v0, p1, Lorg/spongycastle/crypto/params/KeyParameter;

    if-eqz v0, :cond_1

    .line 222
    check-cast p1, Lorg/spongycastle/crypto/params/KeyParameter;

    invoke-virtual {p1}, Lorg/spongycastle/crypto/params/KeyParameter;->getKey()[B

    move-result-object p1

    iput-object p1, p0, Lorg/spongycastle/crypto/engines/HC256Engine;->key:[B

    .line 223
    invoke-direct {p0}, Lorg/spongycastle/crypto/engines/HC256Engine;->init()V

    const/4 p1, 0x1

    .line 224
    iput-boolean p1, p0, Lorg/spongycastle/crypto/engines/HC256Engine;->initialised:Z

    return-void

    .line 225
    :cond_1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    const-string p1, "Invalid parameter passed to HC256 init - "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    return-void
.end method

.method public processBytes([BII[BI)I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/DataLengthException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lorg/spongycastle/crypto/engines/HC256Engine;->initialised:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_3

    .line 5
    .line 6
    add-int v0, p2, p3

    .line 7
    .line 8
    array-length v2, p1

    .line 9
    if-gt v0, v2, :cond_2

    .line 10
    .line 11
    add-int v0, p5, p3

    .line 12
    .line 13
    array-length v2, p4

    .line 14
    if-gt v0, v2, :cond_1

    .line 15
    .line 16
    :goto_0
    if-ge v1, p3, :cond_0

    .line 17
    .line 18
    add-int v0, p5, v1

    .line 19
    .line 20
    add-int v2, p2, v1

    .line 21
    .line 22
    aget-byte v2, p1, v2

    .line 23
    .line 24
    invoke-direct {p0}, Lorg/spongycastle/crypto/engines/HC256Engine;->getByte()B

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    xor-int/2addr v2, v3

    .line 29
    int-to-byte v2, v2

    .line 30
    aput-byte v2, p4, v0

    .line 31
    .line 32
    add-int/lit8 v1, v1, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    return p3

    .line 36
    :cond_1
    const-string p0, "output buffer too short"

    .line 37
    .line 38
    invoke-static {p0}, Ll/g;->a(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return v1

    .line 42
    :cond_2
    const-string p0, "input buffer too short"

    .line 43
    .line 44
    invoke-static {p0}, Ll/tyk0;->a(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    return v1

    .line 48
    :cond_3
    invoke-virtual {p0}, Lorg/spongycastle/crypto/engines/HC256Engine;->getAlgorithmName()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    const-string p1, " not initialised"

    .line 53
    .line 54
    invoke-static {p0, p1}, Ll/rrc0;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    return v1
.end method

.method public reset()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lorg/spongycastle/crypto/engines/HC256Engine;->init()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public returnByte(B)B
    .locals 0

    .line 1
    invoke-direct {p0}, Lorg/spongycastle/crypto/engines/HC256Engine;->getByte()B

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/2addr p0, p1

    .line 6
    int-to-byte p0, p0

    .line 7
    return p0
.end method
