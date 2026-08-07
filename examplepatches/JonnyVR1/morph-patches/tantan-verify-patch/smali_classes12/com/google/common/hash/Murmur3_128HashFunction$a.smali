.class public final Lcom/google/common/hash/Murmur3_128HashFunction$a;
.super Ll/d8;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/hash/Murmur3_128HashFunction;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public d:J

.field public e:J

.field public f:I


# direct methods
.method public constructor <init>(I)V
    .locals 2

    .line 1
    const/16 v0, 0x10

    .line 2
    .line 3
    invoke-direct {p0, v0}, Ll/d8;-><init>(I)V

    .line 4
    .line 5
    .line 6
    int-to-long v0, p1

    .line 7
    iput-wide v0, p0, Lcom/google/common/hash/Murmur3_128HashFunction$a;->d:J

    .line 8
    .line 9
    iput-wide v0, p0, Lcom/google/common/hash/Murmur3_128HashFunction$a;->e:J

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput p1, p0, Lcom/google/common/hash/Murmur3_128HashFunction$a;->f:I

    .line 13
    .line 14
    return-void
.end method

.method public static s(J)J
    .locals 3

    .line 1
    const/16 v0, 0x21

    ushr-long v1, p0, v0

    xor-long/2addr p0, v1

    const-wide v1, -0xae502812aa7333L

    mul-long/2addr p0, v1

    ushr-long v1, p0, v0

    xor-long/2addr p0, v1

    const-wide v1, -0x3b314601e57a13adL    # -2.902039044684214E23

    mul-long/2addr p0, v1

    ushr-long v0, p0, v0

    xor-long/2addr p0, v0

    return-wide p0
.end method

.method public static t(J)J
    .locals 2

    .line 1
    const-wide v0, -0x783c846eeebdac2bL

    .line 2
    .line 3
    .line 4
    .line 5
    .line 6
    mul-long/2addr p0, v0

    .line 7
    const/16 v0, 0x1f

    .line 8
    .line 9
    invoke-static {p0, p1, v0}, Ljava/lang/Long;->rotateLeft(JI)J

    .line 10
    .line 11
    .line 12
    move-result-wide p0

    .line 13
    const-wide v0, 0x4cf5ad432745937fL    # 5.573325460219186E62

    .line 14
    .line 15
    .line 16
    .line 17
    .line 18
    mul-long/2addr p0, v0

    .line 19
    return-wide p0
.end method

.method public static u(J)J
    .locals 2

    .line 1
    const-wide v0, 0x4cf5ad432745937fL    # 5.573325460219186E62

    .line 2
    .line 3
    .line 4
    .line 5
    .line 6
    mul-long/2addr p0, v0

    .line 7
    const/16 v0, 0x21

    .line 8
    .line 9
    invoke-static {p0, p1, v0}, Ljava/lang/Long;->rotateLeft(JI)J

    .line 10
    .line 11
    .line 12
    move-result-wide p0

    .line 13
    const-wide v0, -0x783c846eeebdac2bL

    .line 14
    .line 15
    .line 16
    .line 17
    .line 18
    mul-long/2addr p0, v0

    .line 19
    return-wide p0
.end method


# virtual methods
.method public l()Lcom/google/common/hash/HashCode;
    .locals 7

    .line 1
    iget-wide v0, p0, Lcom/google/common/hash/Murmur3_128HashFunction$a;->d:J

    .line 2
    .line 3
    iget v2, p0, Lcom/google/common/hash/Murmur3_128HashFunction$a;->f:I

    .line 4
    .line 5
    int-to-long v3, v2

    .line 6
    xor-long/2addr v0, v3

    .line 7
    iget-wide v3, p0, Lcom/google/common/hash/Murmur3_128HashFunction$a;->e:J

    .line 8
    .line 9
    int-to-long v5, v2

    .line 10
    xor-long v2, v3, v5

    .line 11
    .line 12
    add-long/2addr v0, v2

    .line 13
    iput-wide v0, p0, Lcom/google/common/hash/Murmur3_128HashFunction$a;->d:J

    .line 14
    .line 15
    add-long/2addr v2, v0

    .line 16
    iput-wide v2, p0, Lcom/google/common/hash/Murmur3_128HashFunction$a;->e:J

    .line 17
    .line 18
    invoke-static {v0, v1}, Lcom/google/common/hash/Murmur3_128HashFunction$a;->s(J)J

    .line 19
    .line 20
    .line 21
    move-result-wide v0

    .line 22
    iput-wide v0, p0, Lcom/google/common/hash/Murmur3_128HashFunction$a;->d:J

    .line 23
    .line 24
    iget-wide v0, p0, Lcom/google/common/hash/Murmur3_128HashFunction$a;->e:J

    .line 25
    .line 26
    invoke-static {v0, v1}, Lcom/google/common/hash/Murmur3_128HashFunction$a;->s(J)J

    .line 27
    .line 28
    .line 29
    move-result-wide v0

    .line 30
    iget-wide v2, p0, Lcom/google/common/hash/Murmur3_128HashFunction$a;->d:J

    .line 31
    .line 32
    add-long/2addr v2, v0

    .line 33
    iput-wide v2, p0, Lcom/google/common/hash/Murmur3_128HashFunction$a;->d:J

    .line 34
    .line 35
    add-long/2addr v0, v2

    .line 36
    iput-wide v0, p0, Lcom/google/common/hash/Murmur3_128HashFunction$a;->e:J

    .line 37
    .line 38
    const/16 v0, 0x10

    .line 39
    .line 40
    new-array v0, v0, [B

    .line 41
    .line 42
    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iget-wide v1, p0, Lcom/google/common/hash/Murmur3_128HashFunction$a;->d:J

    .line 53
    .line 54
    invoke-virtual {v0, v1, v2}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    iget-wide v1, p0, Lcom/google/common/hash/Murmur3_128HashFunction$a;->e:J

    .line 59
    .line 60
    invoke-virtual {v0, v1, v2}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->array()[B

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-static {p0}, Lcom/google/common/hash/HashCode;->fromBytesNoCopy([B)Lcom/google/common/hash/HashCode;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    return-object p0
.end method

.method public o(Ljava/nio/ByteBuffer;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getLong()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getLong()J

    .line 6
    .line 7
    .line 8
    move-result-wide v2

    .line 9
    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/google/common/hash/Murmur3_128HashFunction$a;->r(JJ)V

    .line 10
    .line 11
    .line 12
    iget p1, p0, Lcom/google/common/hash/Murmur3_128HashFunction$a;->f:I

    .line 13
    .line 14
    add-int/lit8 p1, p1, 0x10

    .line 15
    .line 16
    iput p1, p0, Lcom/google/common/hash/Murmur3_128HashFunction$a;->f:I

    .line 17
    .line 18
    return-void
.end method

.method public p(Ljava/nio/ByteBuffer;)V
    .locals 13

    .line 1
    iget v0, p0, Lcom/google/common/hash/Murmur3_128HashFunction$a;->f:I

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/nio/Buffer;->remaining()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    add-int/2addr v0, v1

    .line 8
    iput v0, p0, Lcom/google/common/hash/Murmur3_128HashFunction$a;->f:I

    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/nio/Buffer;->remaining()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/16 v1, 0x10

    .line 15
    .line 16
    const/16 v2, 0x18

    .line 17
    .line 18
    const/16 v3, 0x20

    .line 19
    .line 20
    const/16 v4, 0x28

    .line 21
    .line 22
    const/16 v5, 0x30

    .line 23
    .line 24
    const/16 v6, 0x8

    .line 25
    .line 26
    const-wide/16 v7, 0x0

    .line 27
    .line 28
    packed-switch v0, :pswitch_data_0

    .line 29
    .line 30
    .line 31
    const-string p0, "Should never get here."

    .line 32
    .line 33
    invoke-static {p0}, Ll/gig0;->a(Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :pswitch_0
    const/16 v0, 0xe

    .line 38
    .line 39
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->get(I)B

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    invoke-static {v0}, Ll/myj0;->c(B)I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    int-to-long v7, v0

    .line 48
    shl-long/2addr v7, v5

    .line 49
    :pswitch_1
    const/16 v0, 0xd

    .line 50
    .line 51
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->get(I)B

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    invoke-static {v0}, Ll/myj0;->c(B)I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    int-to-long v9, v0

    .line 60
    shl-long v4, v9, v4

    .line 61
    .line 62
    xor-long/2addr v7, v4

    .line 63
    :pswitch_2
    const/16 v0, 0xc

    .line 64
    .line 65
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->get(I)B

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    invoke-static {v0}, Ll/myj0;->c(B)I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    int-to-long v4, v0

    .line 74
    shl-long v3, v4, v3

    .line 75
    .line 76
    xor-long/2addr v7, v3

    .line 77
    :pswitch_3
    const/16 v0, 0xb

    .line 78
    .line 79
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->get(I)B

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    invoke-static {v0}, Ll/myj0;->c(B)I

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    int-to-long v3, v0

    .line 88
    shl-long v2, v3, v2

    .line 89
    .line 90
    xor-long/2addr v7, v2

    .line 91
    :pswitch_4
    const/16 v0, 0xa

    .line 92
    .line 93
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->get(I)B

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    invoke-static {v0}, Ll/myj0;->c(B)I

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    int-to-long v2, v0

    .line 102
    shl-long v0, v2, v1

    .line 103
    .line 104
    xor-long/2addr v7, v0

    .line 105
    :pswitch_5
    const/16 v0, 0x9

    .line 106
    .line 107
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->get(I)B

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    invoke-static {v0}, Ll/myj0;->c(B)I

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    int-to-long v0, v0

    .line 116
    shl-long/2addr v0, v6

    .line 117
    xor-long/2addr v7, v0

    .line 118
    :pswitch_6
    invoke-virtual {p1, v6}, Ljava/nio/ByteBuffer;->get(I)B

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    invoke-static {v0}, Ll/myj0;->c(B)I

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    int-to-long v0, v0

    .line 127
    xor-long/2addr v7, v0

    .line 128
    :pswitch_7
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getLong()J

    .line 129
    .line 130
    .line 131
    move-result-wide v0

    .line 132
    goto :goto_6

    .line 133
    :pswitch_8
    const/4 v0, 0x6

    .line 134
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->get(I)B

    .line 135
    .line 136
    .line 137
    move-result v0

    .line 138
    invoke-static {v0}, Ll/myj0;->c(B)I

    .line 139
    .line 140
    .line 141
    move-result v0

    .line 142
    int-to-long v9, v0

    .line 143
    shl-long/2addr v9, v5

    .line 144
    goto :goto_0

    .line 145
    :pswitch_9
    move-wide v9, v7

    .line 146
    :goto_0
    const/4 v0, 0x5

    .line 147
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->get(I)B

    .line 148
    .line 149
    .line 150
    move-result v0

    .line 151
    invoke-static {v0}, Ll/myj0;->c(B)I

    .line 152
    .line 153
    .line 154
    move-result v0

    .line 155
    int-to-long v11, v0

    .line 156
    shl-long v4, v11, v4

    .line 157
    .line 158
    xor-long/2addr v4, v9

    .line 159
    goto :goto_1

    .line 160
    :pswitch_a
    move-wide v4, v7

    .line 161
    :goto_1
    const/4 v0, 0x4

    .line 162
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->get(I)B

    .line 163
    .line 164
    .line 165
    move-result v0

    .line 166
    invoke-static {v0}, Ll/myj0;->c(B)I

    .line 167
    .line 168
    .line 169
    move-result v0

    .line 170
    int-to-long v9, v0

    .line 171
    shl-long/2addr v9, v3

    .line 172
    xor-long v3, v4, v9

    .line 173
    .line 174
    goto :goto_2

    .line 175
    :pswitch_b
    move-wide v3, v7

    .line 176
    :goto_2
    const/4 v0, 0x3

    .line 177
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->get(I)B

    .line 178
    .line 179
    .line 180
    move-result v0

    .line 181
    invoke-static {v0}, Ll/myj0;->c(B)I

    .line 182
    .line 183
    .line 184
    move-result v0

    .line 185
    int-to-long v9, v0

    .line 186
    shl-long/2addr v9, v2

    .line 187
    xor-long v2, v3, v9

    .line 188
    .line 189
    goto :goto_3

    .line 190
    :pswitch_c
    move-wide v2, v7

    .line 191
    :goto_3
    const/4 v0, 0x2

    .line 192
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->get(I)B

    .line 193
    .line 194
    .line 195
    move-result v0

    .line 196
    invoke-static {v0}, Ll/myj0;->c(B)I

    .line 197
    .line 198
    .line 199
    move-result v0

    .line 200
    int-to-long v4, v0

    .line 201
    shl-long v0, v4, v1

    .line 202
    .line 203
    xor-long/2addr v0, v2

    .line 204
    goto :goto_4

    .line 205
    :pswitch_d
    move-wide v0, v7

    .line 206
    :goto_4
    const/4 v2, 0x1

    .line 207
    invoke-virtual {p1, v2}, Ljava/nio/ByteBuffer;->get(I)B

    .line 208
    .line 209
    .line 210
    move-result v2

    .line 211
    invoke-static {v2}, Ll/myj0;->c(B)I

    .line 212
    .line 213
    .line 214
    move-result v2

    .line 215
    int-to-long v2, v2

    .line 216
    shl-long/2addr v2, v6

    .line 217
    xor-long/2addr v0, v2

    .line 218
    goto :goto_5

    .line 219
    :pswitch_e
    move-wide v0, v7

    .line 220
    :goto_5
    const/4 v2, 0x0

    .line 221
    invoke-virtual {p1, v2}, Ljava/nio/ByteBuffer;->get(I)B

    .line 222
    .line 223
    .line 224
    move-result p1

    .line 225
    invoke-static {p1}, Ll/myj0;->c(B)I

    .line 226
    .line 227
    .line 228
    move-result p1

    .line 229
    int-to-long v2, p1

    .line 230
    xor-long/2addr v0, v2

    .line 231
    :goto_6
    iget-wide v2, p0, Lcom/google/common/hash/Murmur3_128HashFunction$a;->d:J

    .line 232
    .line 233
    invoke-static {v0, v1}, Lcom/google/common/hash/Murmur3_128HashFunction$a;->t(J)J

    .line 234
    .line 235
    .line 236
    move-result-wide v0

    .line 237
    xor-long/2addr v0, v2

    .line 238
    iput-wide v0, p0, Lcom/google/common/hash/Murmur3_128HashFunction$a;->d:J

    .line 239
    .line 240
    iget-wide v0, p0, Lcom/google/common/hash/Murmur3_128HashFunction$a;->e:J

    .line 241
    .line 242
    invoke-static {v7, v8}, Lcom/google/common/hash/Murmur3_128HashFunction$a;->u(J)J

    .line 243
    .line 244
    .line 245
    move-result-wide v2

    .line 246
    xor-long/2addr v0, v2

    .line 247
    iput-wide v0, p0, Lcom/google/common/hash/Murmur3_128HashFunction$a;->e:J

    .line 248
    .line 249
    return-void

    .line 250
    nop

    .line 251
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final r(JJ)V
    .locals 6

    .line 1
    iget-wide v0, p0, Lcom/google/common/hash/Murmur3_128HashFunction$a;->d:J

    .line 2
    .line 3
    invoke-static {p1, p2}, Lcom/google/common/hash/Murmur3_128HashFunction$a;->t(J)J

    .line 4
    .line 5
    .line 6
    move-result-wide p1

    .line 7
    xor-long/2addr p1, v0

    .line 8
    iput-wide p1, p0, Lcom/google/common/hash/Murmur3_128HashFunction$a;->d:J

    .line 9
    .line 10
    const/16 v0, 0x1b

    .line 11
    .line 12
    invoke-static {p1, p2, v0}, Ljava/lang/Long;->rotateLeft(JI)J

    .line 13
    .line 14
    .line 15
    move-result-wide p1

    .line 16
    iget-wide v0, p0, Lcom/google/common/hash/Murmur3_128HashFunction$a;->e:J

    .line 17
    .line 18
    add-long/2addr p1, v0

    .line 19
    const-wide/16 v2, 0x5

    .line 20
    .line 21
    mul-long/2addr p1, v2

    .line 22
    const-wide/32 v4, 0x52dce729

    .line 23
    .line 24
    .line 25
    add-long/2addr p1, v4

    .line 26
    iput-wide p1, p0, Lcom/google/common/hash/Murmur3_128HashFunction$a;->d:J

    .line 27
    .line 28
    invoke-static {p3, p4}, Lcom/google/common/hash/Murmur3_128HashFunction$a;->u(J)J

    .line 29
    .line 30
    .line 31
    move-result-wide p1

    .line 32
    xor-long/2addr p1, v0

    .line 33
    iput-wide p1, p0, Lcom/google/common/hash/Murmur3_128HashFunction$a;->e:J

    .line 34
    .line 35
    const/16 p3, 0x1f

    .line 36
    .line 37
    invoke-static {p1, p2, p3}, Ljava/lang/Long;->rotateLeft(JI)J

    .line 38
    .line 39
    .line 40
    move-result-wide p1

    .line 41
    iget-wide p3, p0, Lcom/google/common/hash/Murmur3_128HashFunction$a;->d:J

    .line 42
    .line 43
    add-long/2addr p1, p3

    .line 44
    mul-long/2addr p1, v2

    .line 45
    const-wide/32 p3, 0x38495ab5

    .line 46
    .line 47
    .line 48
    add-long/2addr p1, p3

    .line 49
    iput-wide p1, p0, Lcom/google/common/hash/Murmur3_128HashFunction$a;->e:J

    .line 50
    .line 51
    return-void
.end method
