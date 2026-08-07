.class public Ll/wsi;
.super Ll/jt2;
.source "SourceFile"


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/jt2;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Ll/wsi;->Q1(I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private Q1(I)V
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p1

    .line 4
    .line 5
    const/4 v2, 0x4

    .line 6
    new-array v3, v2, [Ljava/nio/FloatBuffer;

    .line 7
    .line 8
    iput-object v3, v0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 9
    .line 10
    const/4 v4, 0x2

    .line 11
    const/4 v5, 0x1

    .line 12
    const/4 v6, 0x0

    .line 13
    const/high16 v7, 0x3f800000    # 1.0f

    .line 14
    .line 15
    if-eqz v1, :cond_2

    .line 16
    .line 17
    if-eq v1, v5, :cond_1

    .line 18
    .line 19
    if-eq v1, v4, :cond_0

    .line 20
    .line 21
    move v1, v7

    .line 22
    move v8, v1

    .line 23
    move v7, v6

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    move v1, v6

    .line 26
    move v8, v1

    .line 27
    move v6, v7

    .line 28
    goto :goto_0

    .line 29
    :cond_1
    move v8, v6

    .line 30
    move v1, v7

    .line 31
    goto :goto_0

    .line 32
    :cond_2
    move v1, v6

    .line 33
    move v8, v7

    .line 34
    move v7, v1

    .line 35
    move v6, v8

    .line 36
    :goto_0
    const/16 v9, 0x8

    .line 37
    .line 38
    new-array v10, v9, [F

    .line 39
    .line 40
    const/4 v11, 0x0

    .line 41
    aput v6, v10, v11

    .line 42
    .line 43
    aput v7, v10, v5

    .line 44
    .line 45
    aput v1, v10, v4

    .line 46
    .line 47
    const/4 v12, 0x3

    .line 48
    aput v7, v10, v12

    .line 49
    .line 50
    aput v6, v10, v2

    .line 51
    .line 52
    const/4 v13, 0x5

    .line 53
    aput v8, v10, v13

    .line 54
    .line 55
    const/4 v14, 0x6

    .line 56
    aput v1, v10, v14

    .line 57
    .line 58
    const/4 v15, 0x7

    .line 59
    aput v8, v10, v15

    .line 60
    .line 61
    const/16 v16, 0x20

    .line 62
    .line 63
    move/from16 v17, v4

    .line 64
    .line 65
    invoke-static/range {v16 .. v16}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 66
    .line 67
    .line 68
    move-result-object v4

    .line 69
    move/from16 v18, v5

    .line 70
    .line 71
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 72
    .line 73
    .line 74
    move-result-object v5

    .line 75
    invoke-virtual {v4, v5}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 76
    .line 77
    .line 78
    move-result-object v4

    .line 79
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 80
    .line 81
    .line 82
    move-result-object v4

    .line 83
    aput-object v4, v3, v11

    .line 84
    .line 85
    iget-object v3, v0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 86
    .line 87
    aget-object v3, v3, v11

    .line 88
    .line 89
    invoke-virtual {v3, v10}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 90
    .line 91
    .line 92
    move-result-object v3

    .line 93
    invoke-virtual {v3, v11}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 94
    .line 95
    .line 96
    new-array v3, v9, [F

    .line 97
    .line 98
    aput v7, v3, v11

    .line 99
    .line 100
    aput v1, v3, v18

    .line 101
    .line 102
    aput v7, v3, v17

    .line 103
    .line 104
    aput v6, v3, v12

    .line 105
    .line 106
    aput v8, v3, v2

    .line 107
    .line 108
    aput v1, v3, v13

    .line 109
    .line 110
    aput v8, v3, v14

    .line 111
    .line 112
    aput v6, v3, v15

    .line 113
    .line 114
    iget-object v4, v0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 115
    .line 116
    invoke-static/range {v16 .. v16}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 117
    .line 118
    .line 119
    move-result-object v5

    .line 120
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 121
    .line 122
    .line 123
    move-result-object v10

    .line 124
    invoke-virtual {v5, v10}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 125
    .line 126
    .line 127
    move-result-object v5

    .line 128
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 129
    .line 130
    .line 131
    move-result-object v5

    .line 132
    aput-object v5, v4, v18

    .line 133
    .line 134
    iget-object v4, v0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 135
    .line 136
    aget-object v4, v4, v18

    .line 137
    .line 138
    invoke-virtual {v4, v3}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 139
    .line 140
    .line 141
    move-result-object v3

    .line 142
    invoke-virtual {v3, v11}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 143
    .line 144
    .line 145
    new-array v3, v9, [F

    .line 146
    .line 147
    aput v1, v3, v11

    .line 148
    .line 149
    aput v8, v3, v18

    .line 150
    .line 151
    aput v6, v3, v17

    .line 152
    .line 153
    aput v8, v3, v12

    .line 154
    .line 155
    aput v1, v3, v2

    .line 156
    .line 157
    aput v7, v3, v13

    .line 158
    .line 159
    aput v6, v3, v14

    .line 160
    .line 161
    aput v7, v3, v15

    .line 162
    .line 163
    iget-object v4, v0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 164
    .line 165
    invoke-static/range {v16 .. v16}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 166
    .line 167
    .line 168
    move-result-object v5

    .line 169
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 170
    .line 171
    .line 172
    move-result-object v10

    .line 173
    invoke-virtual {v5, v10}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 174
    .line 175
    .line 176
    move-result-object v5

    .line 177
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 178
    .line 179
    .line 180
    move-result-object v5

    .line 181
    aput-object v5, v4, v17

    .line 182
    .line 183
    iget-object v4, v0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 184
    .line 185
    aget-object v4, v4, v17

    .line 186
    .line 187
    invoke-virtual {v4, v3}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 188
    .line 189
    .line 190
    move-result-object v3

    .line 191
    invoke-virtual {v3, v11}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 192
    .line 193
    .line 194
    new-array v3, v9, [F

    .line 195
    .line 196
    aput v8, v3, v11

    .line 197
    .line 198
    aput v6, v3, v18

    .line 199
    .line 200
    aput v8, v3, v17

    .line 201
    .line 202
    aput v1, v3, v12

    .line 203
    .line 204
    aput v7, v3, v2

    .line 205
    .line 206
    aput v6, v3, v13

    .line 207
    .line 208
    aput v7, v3, v14

    .line 209
    .line 210
    aput v1, v3, v15

    .line 211
    .line 212
    iget-object v1, v0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 213
    .line 214
    invoke-static/range {v16 .. v16}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 215
    .line 216
    .line 217
    move-result-object v4

    .line 218
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 219
    .line 220
    .line 221
    move-result-object v5

    .line 222
    invoke-virtual {v4, v5}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 223
    .line 224
    .line 225
    move-result-object v4

    .line 226
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 227
    .line 228
    .line 229
    move-result-object v4

    .line 230
    aput-object v4, v1, v12

    .line 231
    .line 232
    iget-object v0, v0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 233
    .line 234
    aget-object v0, v0, v12

    .line 235
    .line 236
    invoke-virtual {v0, v3}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 237
    .line 238
    .line 239
    move-result-object v0

    .line 240
    invoke-virtual {v0, v11}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 241
    .line 242
    .line 243
    :goto_1
    if-ge v11, v2, :cond_3

    .line 244
    .line 245
    add-int/lit8 v11, v11, 0x1

    .line 246
    .line 247
    goto :goto_1

    .line 248
    :cond_3
    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/gfj;->destroy()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/wej;->texture_in:I

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    filled-new-array {v0}, [I

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x1

    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 15
    .line 16
    .line 17
    iput v2, p0, Ll/wej;->texture_in:I

    .line 18
    .line 19
    :cond_0
    return-void
.end method
