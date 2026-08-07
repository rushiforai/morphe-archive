.class public Ll/zjm;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static a:[B


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
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

.method public static a(Landroid/media/Image;I[B)[B
    .locals 18
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x13
    .end annotation

    .line 1
    move/from16 v0, p1

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x2

    .line 7
    const/4 v4, 0x1

    .line 8
    if-eq v0, v4, :cond_1

    .line 9
    .line 10
    if-ne v0, v3, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const-string v0, "only support COLOR_FormatI420 and COLOR_FormatNV21"

    .line 14
    .line 15
    invoke-static {v0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-object v2

    .line 19
    :cond_1
    :goto_0
    invoke-static/range {p0 .. p0}, Ll/zjm;->b(Landroid/media/Image;)Z

    .line 20
    .line 21
    .line 22
    move-result v5

    .line 23
    if-eqz v5, :cond_12

    .line 24
    .line 25
    invoke-virtual/range {p0 .. p0}, Landroid/media/Image;->getCropRect()Landroid/graphics/Rect;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual/range {p0 .. p0}, Landroid/media/Image;->getFormat()I

    .line 30
    .line 31
    .line 32
    move-result v5

    .line 33
    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    .line 34
    .line 35
    .line 36
    move-result v6

    .line 37
    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    .line 38
    .line 39
    .line 40
    move-result v7

    .line 41
    invoke-virtual/range {p0 .. p0}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    .line 42
    .line 43
    .line 44
    move-result-object v8

    .line 45
    if-eqz v1, :cond_2

    .line 46
    .line 47
    array-length v9, v1

    .line 48
    mul-int v10, v6, v7

    .line 49
    .line 50
    invoke-static {v5}, Landroid/graphics/ImageFormat;->getBitsPerPixel(I)I

    .line 51
    .line 52
    .line 53
    move-result v11

    .line 54
    mul-int/2addr v10, v11

    .line 55
    div-int/lit8 v10, v10, 0x8

    .line 56
    .line 57
    if-eq v9, v10, :cond_3

    .line 58
    .line 59
    :cond_2
    mul-int v1, v6, v7

    .line 60
    .line 61
    invoke-static {v5}, Landroid/graphics/ImageFormat;->getBitsPerPixel(I)I

    .line 62
    .line 63
    .line 64
    move-result v5

    .line 65
    mul-int/2addr v1, v5

    .line 66
    div-int/lit8 v1, v1, 0x8

    .line 67
    .line 68
    new-array v1, v1, [B

    .line 69
    .line 70
    :cond_3
    sget-object v5, Ll/zjm;->a:[B

    .line 71
    .line 72
    const/4 v9, 0x0

    .line 73
    if-eqz v5, :cond_4

    .line 74
    .line 75
    array-length v5, v5

    .line 76
    aget-object v10, v8, v9

    .line 77
    .line 78
    invoke-virtual {v10}, Landroid/media/Image$Plane;->getRowStride()I

    .line 79
    .line 80
    .line 81
    move-result v10

    .line 82
    if-eq v5, v10, :cond_5

    .line 83
    .line 84
    :cond_4
    aget-object v5, v8, v9

    .line 85
    .line 86
    invoke-virtual {v5}, Landroid/media/Image$Plane;->getRowStride()I

    .line 87
    .line 88
    .line 89
    move-result v5

    .line 90
    new-array v5, v5, [B

    .line 91
    .line 92
    sput-object v5, Ll/zjm;->a:[B

    .line 93
    .line 94
    :cond_5
    move v11, v4

    .line 95
    move v5, v9

    .line 96
    move v10, v5

    .line 97
    :goto_1
    array-length v12, v8

    .line 98
    if-ge v5, v12, :cond_11

    .line 99
    .line 100
    if-eqz v5, :cond_a

    .line 101
    .line 102
    if-eq v5, v4, :cond_8

    .line 103
    .line 104
    if-eq v5, v3, :cond_6

    .line 105
    .line 106
    goto :goto_4

    .line 107
    :cond_6
    if-ne v0, v4, :cond_7

    .line 108
    .line 109
    mul-int v10, v6, v7

    .line 110
    .line 111
    int-to-double v10, v10

    .line 112
    const-wide/high16 v12, 0x3ff4000000000000L    # 1.25

    .line 113
    .line 114
    mul-double/2addr v10, v12

    .line 115
    double-to-int v10, v10

    .line 116
    :goto_2
    move v11, v4

    .line 117
    goto :goto_4

    .line 118
    :cond_7
    if-ne v0, v3, :cond_b

    .line 119
    .line 120
    mul-int v10, v6, v7

    .line 121
    .line 122
    :goto_3
    move v11, v3

    .line 123
    goto :goto_4

    .line 124
    :cond_8
    if-ne v0, v4, :cond_9

    .line 125
    .line 126
    mul-int v10, v6, v7

    .line 127
    .line 128
    goto :goto_2

    .line 129
    :cond_9
    if-ne v0, v3, :cond_b

    .line 130
    .line 131
    mul-int v10, v6, v7

    .line 132
    .line 133
    add-int/2addr v10, v4

    .line 134
    goto :goto_3

    .line 135
    :cond_a
    move v11, v4

    .line 136
    move v10, v9

    .line 137
    :cond_b
    :goto_4
    aget-object v12, v8, v5

    .line 138
    .line 139
    invoke-virtual {v12}, Landroid/media/Image$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    .line 140
    .line 141
    .line 142
    move-result-object v12

    .line 143
    aget-object v13, v8, v5

    .line 144
    .line 145
    invoke-virtual {v13}, Landroid/media/Image$Plane;->getRowStride()I

    .line 146
    .line 147
    .line 148
    move-result v13

    .line 149
    aget-object v14, v8, v5

    .line 150
    .line 151
    invoke-virtual {v14}, Landroid/media/Image$Plane;->getPixelStride()I

    .line 152
    .line 153
    .line 154
    move-result v14

    .line 155
    if-nez v5, :cond_c

    .line 156
    .line 157
    move v15, v9

    .line 158
    goto :goto_5

    .line 159
    :cond_c
    move v15, v4

    .line 160
    :goto_5
    shr-int v3, v6, v15

    .line 161
    .line 162
    shr-int v9, v7, v15

    .line 163
    .line 164
    iget v4, v2, Landroid/graphics/Rect;->top:I

    .line 165
    .line 166
    shr-int/2addr v4, v15

    .line 167
    mul-int/2addr v4, v13

    .line 168
    iget v0, v2, Landroid/graphics/Rect;->left:I

    .line 169
    .line 170
    shr-int/2addr v0, v15

    .line 171
    mul-int/2addr v0, v14

    .line 172
    add-int/2addr v4, v0

    .line 173
    invoke-virtual {v12, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 174
    .line 175
    .line 176
    const/4 v0, 0x0

    .line 177
    :goto_6
    if-ge v0, v9, :cond_10

    .line 178
    .line 179
    const/4 v4, 0x1

    .line 180
    if-ne v14, v4, :cond_d

    .line 181
    .line 182
    if-ne v11, v4, :cond_d

    .line 183
    .line 184
    invoke-virtual {v12, v1, v10, v3}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 185
    .line 186
    .line 187
    add-int/2addr v10, v3

    .line 188
    move-object/from16 p2, v1

    .line 189
    .line 190
    move v15, v3

    .line 191
    const/4 v1, 0x0

    .line 192
    goto :goto_8

    .line 193
    :cond_d
    add-int/lit8 v15, v3, -0x1

    .line 194
    .line 195
    mul-int/2addr v15, v14

    .line 196
    add-int/2addr v15, v4

    .line 197
    sget-object v4, Ll/zjm;->a:[B

    .line 198
    .line 199
    move-object/from16 p2, v1

    .line 200
    .line 201
    const/4 v1, 0x0

    .line 202
    invoke-virtual {v12, v4, v1, v15}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 203
    .line 204
    .line 205
    move v4, v1

    .line 206
    :goto_7
    if-ge v4, v3, :cond_e

    .line 207
    .line 208
    sget-object v16, Ll/zjm;->a:[B

    .line 209
    .line 210
    mul-int v17, v4, v14

    .line 211
    .line 212
    aget-byte v16, v16, v17

    .line 213
    .line 214
    aput-byte v16, p2, v10

    .line 215
    .line 216
    add-int/2addr v10, v11

    .line 217
    add-int/lit8 v4, v4, 0x1

    .line 218
    .line 219
    goto :goto_7

    .line 220
    :cond_e
    :goto_8
    add-int/lit8 v4, v9, -0x1

    .line 221
    .line 222
    if-ge v0, v4, :cond_f

    .line 223
    .line 224
    invoke-virtual {v12}, Ljava/nio/Buffer;->position()I

    .line 225
    .line 226
    .line 227
    move-result v4

    .line 228
    add-int/2addr v4, v13

    .line 229
    sub-int/2addr v4, v15

    .line 230
    invoke-virtual {v12, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 231
    .line 232
    .line 233
    :cond_f
    add-int/lit8 v0, v0, 0x1

    .line 234
    .line 235
    move-object/from16 v1, p2

    .line 236
    .line 237
    goto :goto_6

    .line 238
    :cond_10
    move-object/from16 p2, v1

    .line 239
    .line 240
    const/4 v1, 0x0

    .line 241
    add-int/lit8 v5, v5, 0x1

    .line 242
    .line 243
    move/from16 v0, p1

    .line 244
    .line 245
    move v9, v1

    .line 246
    const/4 v3, 0x2

    .line 247
    const/4 v4, 0x1

    .line 248
    move-object/from16 v1, p2

    .line 249
    .line 250
    goto/16 :goto_1

    .line 251
    .line 252
    :cond_11
    move-object/from16 p2, v1

    .line 253
    .line 254
    return-object p2

    .line 255
    :cond_12
    const-string v0, "can\'t convert Image to byte array, format "

    .line 256
    .line 257
    invoke-virtual/range {p0 .. p0}, Landroid/media/Image;->getFormat()I

    .line 258
    .line 259
    .line 260
    move-result v1

    .line 261
    invoke-static {v0, v1}, Ll/x3k;->a(Ljava/lang/String;I)V

    .line 262
    .line 263
    .line 264
    return-object v2
.end method

.method private static b(Landroid/media/Image;)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/media/Image;->getFormat()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/16 v0, 0x11

    .line 6
    .line 7
    if-eq p0, v0, :cond_0

    .line 8
    .line 9
    const/16 v0, 0x23

    .line 10
    .line 11
    if-eq p0, v0, :cond_0

    .line 12
    .line 13
    const v0, 0x32315659

    .line 14
    .line 15
    .line 16
    if-eq p0, v0, :cond_0

    .line 17
    .line 18
    const/4 p0, 0x0

    .line 19
    return p0

    .line 20
    :cond_0
    const/4 p0, 0x1

    .line 21
    return p0
.end method
