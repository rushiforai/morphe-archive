.class public Lcom/tencent/youtu/sdkkitframework/common/Base64$DecInputStream;
.super Ljava/io/InputStream;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/youtu/sdkkitframework/common/Base64;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DecInputStream"
.end annotation


# instance fields
.field public final a:Ljava/io/InputStream;

.field public final b:Z

.field public final c:[I

.field public d:I

.field public e:I

.field public f:I

.field public g:Z

.field public h:Z

.field public i:[B


# direct methods
.method public constructor <init>(Ljava/io/InputStream;[IZ)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$DecInputStream;->d:I

    .line 6
    .line 7
    const/16 v1, 0x12

    .line 8
    .line 9
    iput v1, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$DecInputStream;->e:I

    .line 10
    .line 11
    const/4 v1, -0x8

    .line 12
    iput v1, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$DecInputStream;->f:I

    .line 13
    .line 14
    iput-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$DecInputStream;->g:Z

    .line 15
    .line 16
    iput-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$DecInputStream;->h:Z

    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    new-array v0, v0, [B

    .line 20
    .line 21
    iput-object v0, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$DecInputStream;->i:[B

    .line 22
    .line 23
    iput-object p1, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$DecInputStream;->a:Ljava/io/InputStream;

    .line 24
    .line 25
    iput-object p2, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$DecInputStream;->c:[I

    .line 26
    .line 27
    iput-boolean p3, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$DecInputStream;->b:Z

    .line 28
    .line 29
    return-void
.end method


# virtual methods
.method public available()I
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$DecInputStream;->h:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$DecInputStream;->a:Ljava/io/InputStream;

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    const-string p0, "Stream is closed"

    .line 13
    .line 14
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public close()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$DecInputStream;->h:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$DecInputStream;->h:Z

    .line 7
    .line 8
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$DecInputStream;->a:Ljava/io/InputStream;

    .line 9
    .line 10
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public read()I
    .locals 3

    .line 272
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$DecInputStream;->i:[B

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v2, v1}, Lcom/tencent/youtu/sdkkitframework/common/Base64$DecInputStream;->read([BII)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    return v1

    :cond_0
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$DecInputStream;->i:[B

    aget-byte p0, p0, v2

    and-int/lit16 p0, p0, 0xff

    return p0
.end method

.method public read([BII)I
    .locals 8

    .line 1
    iget-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$DecInputStream;->h:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_16

    .line 5
    .line 6
    iget-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$DecInputStream;->g:Z

    .line 7
    .line 8
    const/4 v2, -0x1

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget v0, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$DecInputStream;->f:I

    .line 12
    .line 13
    if-gez v0, :cond_0

    .line 14
    .line 15
    return v2

    .line 16
    :cond_0
    if-ltz p2, :cond_15

    .line 17
    .line 18
    if-ltz p3, :cond_15

    .line 19
    .line 20
    array-length v0, p1

    .line 21
    sub-int/2addr v0, p2

    .line 22
    if-gt p3, v0, :cond_15

    .line 23
    .line 24
    iget v0, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$DecInputStream;->f:I

    .line 25
    .line 26
    if-ltz v0, :cond_3

    .line 27
    .line 28
    move v0, p2

    .line 29
    :goto_0
    if-nez p3, :cond_1

    .line 30
    .line 31
    sub-int/2addr v0, p2

    .line 32
    return v0

    .line 33
    :cond_1
    add-int/lit8 v3, v0, 0x1

    .line 34
    .line 35
    iget v4, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$DecInputStream;->d:I

    .line 36
    .line 37
    iget v5, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$DecInputStream;->f:I

    .line 38
    .line 39
    shr-int/2addr v4, v5

    .line 40
    int-to-byte v4, v4

    .line 41
    aput-byte v4, p1, v0

    .line 42
    .line 43
    add-int/lit8 p3, p3, -0x1

    .line 44
    .line 45
    add-int/lit8 v5, v5, -0x8

    .line 46
    .line 47
    iput v5, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$DecInputStream;->f:I

    .line 48
    .line 49
    if-gez v5, :cond_2

    .line 50
    .line 51
    iput v1, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$DecInputStream;->d:I

    .line 52
    .line 53
    goto :goto_1

    .line 54
    :cond_2
    move v0, v3

    .line 55
    goto :goto_0

    .line 56
    :cond_3
    move v3, p2

    .line 57
    :goto_1
    if-lez p3, :cond_14

    .line 58
    .line 59
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$DecInputStream;->a:Ljava/io/InputStream;

    .line 60
    .line 61
    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    const/16 v4, 0xc

    .line 66
    .line 67
    const/16 v5, 0x12

    .line 68
    .line 69
    const/4 v6, 0x1

    .line 70
    if-ne v0, v2, :cond_9

    .line 71
    .line 72
    iput-boolean v6, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$DecInputStream;->g:Z

    .line 73
    .line 74
    iget v0, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$DecInputStream;->e:I

    .line 75
    .line 76
    if-eq v0, v5, :cond_7

    .line 77
    .line 78
    if-eq v0, v4, :cond_6

    .line 79
    .line 80
    add-int/lit8 v4, v3, 0x1

    .line 81
    .line 82
    iget v5, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$DecInputStream;->d:I

    .line 83
    .line 84
    shr-int/lit8 v6, v5, 0x10

    .line 85
    .line 86
    int-to-byte v6, v6

    .line 87
    aput-byte v6, p1, v3

    .line 88
    .line 89
    add-int/2addr p3, v2

    .line 90
    if-nez v0, :cond_5

    .line 91
    .line 92
    if-nez p3, :cond_4

    .line 93
    .line 94
    shr-int/lit8 p1, v5, 0x8

    .line 95
    .line 96
    iput p1, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$DecInputStream;->d:I

    .line 97
    .line 98
    iput v1, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$DecInputStream;->f:I

    .line 99
    .line 100
    goto :goto_2

    .line 101
    :cond_4
    add-int/lit8 v3, v3, 0x2

    .line 102
    .line 103
    shr-int/lit8 p0, v5, 0x8

    .line 104
    .line 105
    int-to-byte p0, p0

    .line 106
    aput-byte p0, p1, v4

    .line 107
    .line 108
    goto :goto_3

    .line 109
    :cond_5
    :goto_2
    move v3, v4

    .line 110
    goto :goto_3

    .line 111
    :cond_6
    const-string p0, "Base64 stream has one un-decoded dangling byte."

    .line 112
    .line 113
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    return v1

    .line 117
    :cond_7
    :goto_3
    if-ne v3, p2, :cond_8

    .line 118
    .line 119
    return v2

    .line 120
    :cond_8
    sub-int/2addr v3, p2

    .line 121
    return v3

    .line 122
    :cond_9
    const/16 v7, 0x3d

    .line 123
    .line 124
    if-ne v0, v7, :cond_e

    .line 125
    .line 126
    iget v0, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$DecInputStream;->e:I

    .line 127
    .line 128
    if-eq v0, v5, :cond_d

    .line 129
    .line 130
    if-eq v0, v4, :cond_d

    .line 131
    .line 132
    const/4 v4, 0x6

    .line 133
    if-ne v0, v4, :cond_a

    .line 134
    .line 135
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$DecInputStream;->a:Ljava/io/InputStream;

    .line 136
    .line 137
    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    if-ne v0, v7, :cond_d

    .line 142
    .line 143
    :cond_a
    add-int/lit8 v0, v3, 0x1

    .line 144
    .line 145
    iget v4, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$DecInputStream;->d:I

    .line 146
    .line 147
    shr-int/lit8 v5, v4, 0x10

    .line 148
    .line 149
    int-to-byte v5, v5

    .line 150
    aput-byte v5, p1, v3

    .line 151
    .line 152
    add-int/2addr p3, v2

    .line 153
    iget v2, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$DecInputStream;->e:I

    .line 154
    .line 155
    if-nez v2, :cond_c

    .line 156
    .line 157
    if-nez p3, :cond_b

    .line 158
    .line 159
    shr-int/lit8 p1, v4, 0x8

    .line 160
    .line 161
    iput p1, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$DecInputStream;->d:I

    .line 162
    .line 163
    iput v1, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$DecInputStream;->f:I

    .line 164
    .line 165
    goto :goto_4

    .line 166
    :cond_b
    add-int/lit8 v3, v3, 0x2

    .line 167
    .line 168
    shr-int/lit8 p3, v4, 0x8

    .line 169
    .line 170
    int-to-byte p3, p3

    .line 171
    aput-byte p3, p1, v0

    .line 172
    .line 173
    goto :goto_5

    .line 174
    :cond_c
    :goto_4
    move v3, v0

    .line 175
    :goto_5
    iput-boolean v6, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$DecInputStream;->g:Z

    .line 176
    .line 177
    goto :goto_7

    .line 178
    :cond_d
    const-string p1, "Illegal base64 ending sequence:"

    .line 179
    .line 180
    iget p0, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$DecInputStream;->e:I

    .line 181
    .line 182
    invoke-static {p1, p0}, Ll/yll;->a(Ljava/lang/String;I)V

    .line 183
    .line 184
    .line 185
    return v1

    .line 186
    :cond_e
    iget-object v4, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$DecInputStream;->c:[I

    .line 187
    .line 188
    aget v0, v4, v0

    .line 189
    .line 190
    const/16 v4, 0x10

    .line 191
    .line 192
    if-ne v0, v2, :cond_10

    .line 193
    .line 194
    iget-boolean v5, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$DecInputStream;->b:Z

    .line 195
    .line 196
    if-eqz v5, :cond_f

    .line 197
    .line 198
    goto/16 :goto_1

    .line 199
    .line 200
    :cond_f
    const-string p0, "Illegal base64 character "

    .line 201
    .line 202
    invoke-static {v0, v4}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object p1

    .line 206
    invoke-static {p0, p1}, Ll/rr10;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 207
    .line 208
    .line 209
    return v1

    .line 210
    :cond_10
    iget v6, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$DecInputStream;->d:I

    .line 211
    .line 212
    iget v7, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$DecInputStream;->e:I

    .line 213
    .line 214
    shl-int/2addr v0, v7

    .line 215
    or-int/2addr v0, v6

    .line 216
    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$DecInputStream;->d:I

    .line 217
    .line 218
    if-nez v7, :cond_13

    .line 219
    .line 220
    iput v5, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$DecInputStream;->e:I

    .line 221
    .line 222
    iput v4, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$DecInputStream;->f:I

    .line 223
    .line 224
    :goto_6
    iget v0, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$DecInputStream;->f:I

    .line 225
    .line 226
    if-ltz v0, :cond_12

    .line 227
    .line 228
    add-int/lit8 v4, v3, 0x1

    .line 229
    .line 230
    iget v5, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$DecInputStream;->d:I

    .line 231
    .line 232
    shr-int/2addr v5, v0

    .line 233
    int-to-byte v5, v5

    .line 234
    aput-byte v5, p1, v3

    .line 235
    .line 236
    add-int/lit8 p3, p3, -0x1

    .line 237
    .line 238
    add-int/lit8 v0, v0, -0x8

    .line 239
    .line 240
    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$DecInputStream;->f:I

    .line 241
    .line 242
    if-nez p3, :cond_11

    .line 243
    .line 244
    if-ltz v0, :cond_11

    .line 245
    .line 246
    sub-int/2addr v4, p2

    .line 247
    return v4

    .line 248
    :cond_11
    move v3, v4

    .line 249
    goto :goto_6

    .line 250
    :cond_12
    iput v1, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$DecInputStream;->d:I

    .line 251
    .line 252
    goto/16 :goto_1

    .line 253
    .line 254
    :cond_13
    add-int/lit8 v7, v7, -0x6

    .line 255
    .line 256
    iput v7, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$DecInputStream;->e:I

    .line 257
    .line 258
    goto/16 :goto_1

    .line 259
    .line 260
    :cond_14
    :goto_7
    sub-int/2addr v3, p2

    .line 261
    return v3

    .line 262
    :cond_15
    invoke-static {}, Ll/onl;->a()V

    .line 263
    .line 264
    .line 265
    return v1

    .line 266
    :cond_16
    const-string p0, "Stream is closed"

    .line 267
    .line 268
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 269
    .line 270
    .line 271
    return v1
.end method
