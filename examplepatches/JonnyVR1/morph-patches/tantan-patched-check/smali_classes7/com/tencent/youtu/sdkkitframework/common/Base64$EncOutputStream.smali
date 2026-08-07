.class public Lcom/tencent/youtu/sdkkitframework/common/Base64$EncOutputStream;
.super Ljava/io/FilterOutputStream;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/youtu/sdkkitframework/common/Base64;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "EncOutputStream"
.end annotation


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:I

.field public e:Z

.field public final f:[C

.field public final g:[B

.field public final h:I

.field public final i:Z

.field public j:I


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;[C[BIZ)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ljava/io/FilterOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$EncOutputStream;->a:I

    .line 6
    .line 7
    iput-boolean p1, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$EncOutputStream;->e:Z

    .line 8
    .line 9
    iput p1, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$EncOutputStream;->j:I

    .line 10
    .line 11
    iput-object p2, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$EncOutputStream;->f:[C

    .line 12
    .line 13
    iput-object p3, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$EncOutputStream;->g:[B

    .line 14
    .line 15
    iput p4, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$EncOutputStream;->h:I

    .line 16
    .line 17
    iput-boolean p5, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$EncOutputStream;->i:Z

    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$EncOutputStream;->j:I

    .line 2
    .line 3
    iget v1, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$EncOutputStream;->h:I

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ljava/io/FilterOutputStream;->out:Ljava/io/OutputStream;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$EncOutputStream;->g:[B

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$EncOutputStream;->j:I

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public close()V
    .locals 6

    .line 1
    iget-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$EncOutputStream;->e:Z

    .line 2
    .line 3
    if-nez v0, :cond_2

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$EncOutputStream;->e:Z

    .line 7
    .line 8
    iget v1, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$EncOutputStream;->a:I

    .line 9
    .line 10
    const/16 v2, 0x3d

    .line 11
    .line 12
    const/4 v3, 0x2

    .line 13
    if-ne v1, v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/tencent/youtu/sdkkitframework/common/Base64$EncOutputStream;->a()V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ljava/io/FilterOutputStream;->out:Ljava/io/OutputStream;

    .line 19
    .line 20
    iget-object v1, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$EncOutputStream;->f:[C

    .line 21
    .line 22
    iget v4, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$EncOutputStream;->b:I

    .line 23
    .line 24
    shr-int/lit8 v3, v4, 0x2

    .line 25
    .line 26
    aget-char v1, v1, v3

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write(I)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ljava/io/FilterOutputStream;->out:Ljava/io/OutputStream;

    .line 32
    .line 33
    iget-object v1, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$EncOutputStream;->f:[C

    .line 34
    .line 35
    iget v3, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$EncOutputStream;->b:I

    .line 36
    .line 37
    shl-int/lit8 v3, v3, 0x4

    .line 38
    .line 39
    and-int/lit8 v3, v3, 0x3f

    .line 40
    .line 41
    aget-char v1, v1, v3

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write(I)V

    .line 44
    .line 45
    .line 46
    iget-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$EncOutputStream;->i:Z

    .line 47
    .line 48
    if-eqz v0, :cond_1

    .line 49
    .line 50
    iget-object v0, p0, Ljava/io/FilterOutputStream;->out:Ljava/io/OutputStream;

    .line 51
    .line 52
    invoke-virtual {v0, v2}, Ljava/io/OutputStream;->write(I)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Ljava/io/FilterOutputStream;->out:Ljava/io/OutputStream;

    .line 56
    .line 57
    invoke-virtual {v0, v2}, Ljava/io/OutputStream;->write(I)V

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_0
    if-ne v1, v3, :cond_1

    .line 62
    .line 63
    invoke-virtual {p0}, Lcom/tencent/youtu/sdkkitframework/common/Base64$EncOutputStream;->a()V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Ljava/io/FilterOutputStream;->out:Ljava/io/OutputStream;

    .line 67
    .line 68
    iget-object v1, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$EncOutputStream;->f:[C

    .line 69
    .line 70
    iget v4, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$EncOutputStream;->b:I

    .line 71
    .line 72
    shr-int/2addr v4, v3

    .line 73
    aget-char v1, v1, v4

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write(I)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Ljava/io/FilterOutputStream;->out:Ljava/io/OutputStream;

    .line 79
    .line 80
    iget-object v1, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$EncOutputStream;->f:[C

    .line 81
    .line 82
    iget v4, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$EncOutputStream;->b:I

    .line 83
    .line 84
    shl-int/lit8 v4, v4, 0x4

    .line 85
    .line 86
    and-int/lit8 v4, v4, 0x3f

    .line 87
    .line 88
    iget v5, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$EncOutputStream;->c:I

    .line 89
    .line 90
    shr-int/lit8 v5, v5, 0x4

    .line 91
    .line 92
    or-int/2addr v4, v5

    .line 93
    aget-char v1, v1, v4

    .line 94
    .line 95
    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write(I)V

    .line 96
    .line 97
    .line 98
    iget-object v0, p0, Ljava/io/FilterOutputStream;->out:Ljava/io/OutputStream;

    .line 99
    .line 100
    iget-object v1, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$EncOutputStream;->f:[C

    .line 101
    .line 102
    iget v4, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$EncOutputStream;->c:I

    .line 103
    .line 104
    shl-int/lit8 v3, v4, 0x2

    .line 105
    .line 106
    and-int/lit8 v3, v3, 0x3f

    .line 107
    .line 108
    aget-char v1, v1, v3

    .line 109
    .line 110
    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write(I)V

    .line 111
    .line 112
    .line 113
    iget-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$EncOutputStream;->i:Z

    .line 114
    .line 115
    if-eqz v0, :cond_1

    .line 116
    .line 117
    iget-object v0, p0, Ljava/io/FilterOutputStream;->out:Ljava/io/OutputStream;

    .line 118
    .line 119
    invoke-virtual {v0, v2}, Ljava/io/OutputStream;->write(I)V

    .line 120
    .line 121
    .line 122
    :cond_1
    :goto_0
    const/4 v0, 0x0

    .line 123
    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$EncOutputStream;->a:I

    .line 124
    .line 125
    iget-object p0, p0, Ljava/io/FilterOutputStream;->out:Ljava/io/OutputStream;

    .line 126
    .line 127
    invoke-virtual {p0}, Ljava/io/OutputStream;->close()V

    .line 128
    .line 129
    .line 130
    :cond_2
    return-void
.end method

.method public write(I)V
    .locals 3

    and-int/lit16 p1, p1, 0xff

    int-to-byte p1, p1

    const/4 v0, 0x1

    .line 262
    new-array v1, v0, [B

    const/4 v2, 0x0

    aput-byte p1, v1, v2

    .line 263
    invoke-virtual {p0, v1, v2, v0}, Lcom/tencent/youtu/sdkkitframework/common/Base64$EncOutputStream;->write([BII)V

    return-void
.end method

.method public write([BII)V
    .locals 6

    .line 1
    iget-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$EncOutputStream;->e:Z

    .line 2
    .line 3
    if-nez v0, :cond_8

    .line 4
    .line 5
    if-ltz p2, :cond_7

    .line 6
    .line 7
    if-ltz p3, :cond_7

    .line 8
    .line 9
    array-length v0, p1

    .line 10
    sub-int/2addr v0, p2

    .line 11
    if-gt p3, v0, :cond_7

    .line 12
    .line 13
    if-nez p3, :cond_0

    .line 14
    .line 15
    goto/16 :goto_1

    .line 16
    .line 17
    :cond_0
    iget v0, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$EncOutputStream;->a:I

    .line 18
    .line 19
    const/4 v1, 0x2

    .line 20
    const/4 v2, 0x1

    .line 21
    if-eqz v0, :cond_3

    .line 22
    .line 23
    if-ne v0, v2, :cond_2

    .line 24
    .line 25
    add-int/lit8 v3, p2, 0x1

    .line 26
    .line 27
    aget-byte p2, p1, p2

    .line 28
    .line 29
    and-int/lit16 p2, p2, 0xff

    .line 30
    .line 31
    iput p2, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$EncOutputStream;->c:I

    .line 32
    .line 33
    add-int/lit8 p3, p3, -0x1

    .line 34
    .line 35
    if-nez p3, :cond_1

    .line 36
    .line 37
    add-int/2addr v0, v2

    .line 38
    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$EncOutputStream;->a:I

    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    move p2, v3

    .line 42
    :cond_2
    add-int/lit8 v0, p2, 0x1

    .line 43
    .line 44
    aget-byte p2, p1, p2

    .line 45
    .line 46
    and-int/lit16 p2, p2, 0xff

    .line 47
    .line 48
    iput p2, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$EncOutputStream;->d:I

    .line 49
    .line 50
    add-int/lit8 p3, p3, -0x1

    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/tencent/youtu/sdkkitframework/common/Base64$EncOutputStream;->a()V

    .line 53
    .line 54
    .line 55
    iget-object p2, p0, Ljava/io/FilterOutputStream;->out:Ljava/io/OutputStream;

    .line 56
    .line 57
    iget-object v3, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$EncOutputStream;->f:[C

    .line 58
    .line 59
    iget v4, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$EncOutputStream;->b:I

    .line 60
    .line 61
    shr-int/2addr v4, v1

    .line 62
    aget-char v3, v3, v4

    .line 63
    .line 64
    invoke-virtual {p2, v3}, Ljava/io/OutputStream;->write(I)V

    .line 65
    .line 66
    .line 67
    iget-object p2, p0, Ljava/io/FilterOutputStream;->out:Ljava/io/OutputStream;

    .line 68
    .line 69
    iget-object v3, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$EncOutputStream;->f:[C

    .line 70
    .line 71
    iget v4, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$EncOutputStream;->b:I

    .line 72
    .line 73
    shl-int/lit8 v4, v4, 0x4

    .line 74
    .line 75
    and-int/lit8 v4, v4, 0x3f

    .line 76
    .line 77
    iget v5, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$EncOutputStream;->c:I

    .line 78
    .line 79
    shr-int/lit8 v5, v5, 0x4

    .line 80
    .line 81
    or-int/2addr v4, v5

    .line 82
    aget-char v3, v3, v4

    .line 83
    .line 84
    invoke-virtual {p2, v3}, Ljava/io/OutputStream;->write(I)V

    .line 85
    .line 86
    .line 87
    iget-object p2, p0, Ljava/io/FilterOutputStream;->out:Ljava/io/OutputStream;

    .line 88
    .line 89
    iget-object v3, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$EncOutputStream;->f:[C

    .line 90
    .line 91
    iget v4, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$EncOutputStream;->c:I

    .line 92
    .line 93
    shl-int/2addr v4, v1

    .line 94
    and-int/lit8 v4, v4, 0x3f

    .line 95
    .line 96
    iget v5, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$EncOutputStream;->d:I

    .line 97
    .line 98
    shr-int/lit8 v5, v5, 0x6

    .line 99
    .line 100
    or-int/2addr v4, v5

    .line 101
    aget-char v3, v3, v4

    .line 102
    .line 103
    invoke-virtual {p2, v3}, Ljava/io/OutputStream;->write(I)V

    .line 104
    .line 105
    .line 106
    iget-object p2, p0, Ljava/io/FilterOutputStream;->out:Ljava/io/OutputStream;

    .line 107
    .line 108
    iget-object v3, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$EncOutputStream;->f:[C

    .line 109
    .line 110
    iget v4, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$EncOutputStream;->d:I

    .line 111
    .line 112
    and-int/lit8 v4, v4, 0x3f

    .line 113
    .line 114
    aget-char v3, v3, v4

    .line 115
    .line 116
    invoke-virtual {p2, v3}, Ljava/io/OutputStream;->write(I)V

    .line 117
    .line 118
    .line 119
    iget p2, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$EncOutputStream;->j:I

    .line 120
    .line 121
    add-int/lit8 p2, p2, 0x4

    .line 122
    .line 123
    iput p2, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$EncOutputStream;->j:I

    .line 124
    .line 125
    move p2, v0

    .line 126
    :cond_3
    div-int/lit8 v0, p3, 0x3

    .line 127
    .line 128
    mul-int/lit8 v3, v0, 0x3

    .line 129
    .line 130
    sub-int/2addr p3, v3

    .line 131
    iput p3, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$EncOutputStream;->a:I

    .line 132
    .line 133
    :goto_0
    add-int/lit8 p3, v0, -0x1

    .line 134
    .line 135
    if-lez v0, :cond_4

    .line 136
    .line 137
    invoke-virtual {p0}, Lcom/tencent/youtu/sdkkitframework/common/Base64$EncOutputStream;->a()V

    .line 138
    .line 139
    .line 140
    add-int/lit8 v0, p2, 0x1

    .line 141
    .line 142
    aget-byte v3, p1, p2

    .line 143
    .line 144
    and-int/lit16 v3, v3, 0xff

    .line 145
    .line 146
    shl-int/lit8 v3, v3, 0x10

    .line 147
    .line 148
    add-int/lit8 v4, p2, 0x2

    .line 149
    .line 150
    aget-byte v0, p1, v0

    .line 151
    .line 152
    and-int/lit16 v0, v0, 0xff

    .line 153
    .line 154
    shl-int/lit8 v0, v0, 0x8

    .line 155
    .line 156
    or-int/2addr v0, v3

    .line 157
    add-int/lit8 p2, p2, 0x3

    .line 158
    .line 159
    aget-byte v3, p1, v4

    .line 160
    .line 161
    and-int/lit16 v3, v3, 0xff

    .line 162
    .line 163
    or-int/2addr v0, v3

    .line 164
    iget-object v3, p0, Ljava/io/FilterOutputStream;->out:Ljava/io/OutputStream;

    .line 165
    .line 166
    iget-object v4, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$EncOutputStream;->f:[C

    .line 167
    .line 168
    ushr-int/lit8 v5, v0, 0x12

    .line 169
    .line 170
    and-int/lit8 v5, v5, 0x3f

    .line 171
    .line 172
    aget-char v4, v4, v5

    .line 173
    .line 174
    invoke-virtual {v3, v4}, Ljava/io/OutputStream;->write(I)V

    .line 175
    .line 176
    .line 177
    iget-object v3, p0, Ljava/io/FilterOutputStream;->out:Ljava/io/OutputStream;

    .line 178
    .line 179
    iget-object v4, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$EncOutputStream;->f:[C

    .line 180
    .line 181
    ushr-int/lit8 v5, v0, 0xc

    .line 182
    .line 183
    and-int/lit8 v5, v5, 0x3f

    .line 184
    .line 185
    aget-char v4, v4, v5

    .line 186
    .line 187
    invoke-virtual {v3, v4}, Ljava/io/OutputStream;->write(I)V

    .line 188
    .line 189
    .line 190
    iget-object v3, p0, Ljava/io/FilterOutputStream;->out:Ljava/io/OutputStream;

    .line 191
    .line 192
    iget-object v4, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$EncOutputStream;->f:[C

    .line 193
    .line 194
    ushr-int/lit8 v5, v0, 0x6

    .line 195
    .line 196
    and-int/lit8 v5, v5, 0x3f

    .line 197
    .line 198
    aget-char v4, v4, v5

    .line 199
    .line 200
    invoke-virtual {v3, v4}, Ljava/io/OutputStream;->write(I)V

    .line 201
    .line 202
    .line 203
    iget-object v3, p0, Ljava/io/FilterOutputStream;->out:Ljava/io/OutputStream;

    .line 204
    .line 205
    iget-object v4, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$EncOutputStream;->f:[C

    .line 206
    .line 207
    and-int/lit8 v0, v0, 0x3f

    .line 208
    .line 209
    aget-char v0, v4, v0

    .line 210
    .line 211
    invoke-virtual {v3, v0}, Ljava/io/OutputStream;->write(I)V

    .line 212
    .line 213
    .line 214
    iget v0, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$EncOutputStream;->j:I

    .line 215
    .line 216
    add-int/lit8 v0, v0, 0x4

    .line 217
    .line 218
    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$EncOutputStream;->j:I

    .line 219
    .line 220
    move v0, p3

    .line 221
    goto :goto_0

    .line 222
    :cond_4
    iget p3, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$EncOutputStream;->a:I

    .line 223
    .line 224
    if-ne p3, v2, :cond_5

    .line 225
    .line 226
    aget-byte p1, p1, p2

    .line 227
    .line 228
    and-int/lit16 p1, p1, 0xff

    .line 229
    .line 230
    iput p1, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$EncOutputStream;->b:I

    .line 231
    .line 232
    return-void

    .line 233
    :cond_5
    if-ne p3, v1, :cond_6

    .line 234
    .line 235
    add-int/lit8 p3, p2, 0x1

    .line 236
    .line 237
    aget-byte p2, p1, p2

    .line 238
    .line 239
    and-int/lit16 p2, p2, 0xff

    .line 240
    .line 241
    iput p2, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$EncOutputStream;->b:I

    .line 242
    .line 243
    aget-byte p1, p1, p3

    .line 244
    .line 245
    and-int/lit16 p1, p1, 0xff

    .line 246
    .line 247
    iput p1, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$EncOutputStream;->c:I

    .line 248
    .line 249
    :cond_6
    :goto_1
    return-void

    .line 250
    :cond_7
    new-instance p0, Ljava/lang/ArrayIndexOutOfBoundsException;

    .line 251
    .line 252
    invoke-direct {p0}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>()V

    .line 253
    .line 254
    .line 255
    throw p0

    .line 256
    :cond_8
    const-string p0, "Stream is closed"

    .line 257
    .line 258
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 259
    .line 260
    .line 261
    return-void
.end method
