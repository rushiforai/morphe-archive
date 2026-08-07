.class public Lcom/momo/mcamera/mask/Sphere;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public draw()V
    .locals 25

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v1, v0, [I

    .line 3
    .line 4
    const/4 v2, 0x1

    .line 5
    const/4 v3, 0x3

    .line 6
    aput v3, v1, v2

    .line 7
    .line 8
    const/4 v4, 0x0

    .line 9
    const/16 v5, 0x20

    .line 10
    .line 11
    aput v5, v1, v4

    .line 12
    .line 13
    sget-object v5, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    .line 14
    .line 15
    invoke-static {v5, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, [[F

    .line 20
    .line 21
    array-length v5, v1

    .line 22
    aget-object v6, v1, v4

    .line 23
    .line 24
    array-length v6, v6

    .line 25
    mul-int/2addr v5, v6

    .line 26
    mul-int/lit8 v5, v5, 0x4

    .line 27
    .line 28
    invoke-static {v5}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 29
    .line 30
    .line 31
    move-result-object v5

    .line 32
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 33
    .line 34
    .line 35
    move-result-object v6

    .line 36
    invoke-virtual {v5, v6}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 40
    .line 41
    .line 42
    move-result-object v5

    .line 43
    const v6, 0x8074

    .line 44
    .line 45
    .line 46
    invoke-static {v6}, Landroid/opengl/GLES10;->glEnableClientState(I)V

    .line 47
    .line 48
    .line 49
    const v7, 0x8075

    .line 50
    .line 51
    .line 52
    invoke-static {v7}, Landroid/opengl/GLES10;->glEnableClientState(I)V

    .line 53
    .line 54
    .line 55
    const/high16 v8, -0x3d4c0000    # -90.0f

    .line 56
    .line 57
    :goto_0
    const/high16 v9, 0x42b40000    # 90.0f

    .line 58
    .line 59
    cmpg-float v9, v8, v9

    .line 60
    .line 61
    if-gez v9, :cond_2

    .line 62
    .line 63
    float-to-double v9, v8

    .line 64
    const-wide v11, 0x400921fb54442d18L    # Math.PI

    .line 65
    .line 66
    .line 67
    .line 68
    .line 69
    mul-double/2addr v9, v11

    .line 70
    const-wide v13, 0x4066800000000000L    # 180.0

    .line 71
    .line 72
    .line 73
    .line 74
    .line 75
    div-double/2addr v9, v13

    .line 76
    move/from16 p0, v0

    .line 77
    .line 78
    move-object v15, v1

    .line 79
    invoke-static {v9, v10}, Ljava/lang/Math;->cos(D)D

    .line 80
    .line 81
    .line 82
    move-result-wide v0

    .line 83
    double-to-float v0, v0

    .line 84
    const/high16 v1, 0x41f00000    # 30.0f

    .line 85
    .line 86
    add-float/2addr v8, v1

    .line 87
    move/from16 v17, v1

    .line 88
    .line 89
    move/from16 v16, v2

    .line 90
    .line 91
    float-to-double v1, v8

    .line 92
    mul-double/2addr v1, v11

    .line 93
    div-double/2addr v1, v13

    .line 94
    move/from16 v18, v6

    .line 95
    .line 96
    move/from16 v19, v7

    .line 97
    .line 98
    invoke-static {v1, v2}, Ljava/lang/Math;->cos(D)D

    .line 99
    .line 100
    .line 101
    move-result-wide v6

    .line 102
    double-to-float v6, v6

    .line 103
    invoke-static {v9, v10}, Ljava/lang/Math;->sin(D)D

    .line 104
    .line 105
    .line 106
    move-result-wide v9

    .line 107
    double-to-float v7, v9

    .line 108
    invoke-static {v1, v2}, Ljava/lang/Math;->sin(D)D

    .line 109
    .line 110
    .line 111
    move-result-wide v1

    .line 112
    double-to-float v1, v1

    .line 113
    const/4 v2, 0x0

    .line 114
    move v9, v4

    .line 115
    :goto_1
    const/high16 v10, 0x43b40000    # 360.0f

    .line 116
    .line 117
    cmpg-float v10, v2, v10

    .line 118
    .line 119
    move-wide/from16 v20, v11

    .line 120
    .line 121
    if-gtz v10, :cond_1

    .line 122
    .line 123
    move-wide/from16 v22, v13

    .line 124
    .line 125
    float-to-double v13, v2

    .line 126
    mul-double v13, v13, v20

    .line 127
    .line 128
    div-double v13, v13, v22

    .line 129
    .line 130
    invoke-static {v13, v14}, Ljava/lang/Math;->cos(D)D

    .line 131
    .line 132
    .line 133
    move-result-wide v11

    .line 134
    double-to-float v11, v11

    .line 135
    invoke-static {v13, v14}, Ljava/lang/Math;->sin(D)D

    .line 136
    .line 137
    .line 138
    move-result-wide v12

    .line 139
    double-to-float v12, v12

    .line 140
    neg-float v12, v12

    .line 141
    aget-object v13, v15, v9

    .line 142
    .line 143
    mul-float v14, v6, v11

    .line 144
    .line 145
    aput v14, v13, v4

    .line 146
    .line 147
    aput v1, v13, v16

    .line 148
    .line 149
    mul-float v14, v6, v12

    .line 150
    .line 151
    aput v14, v13, p0

    .line 152
    .line 153
    add-int/lit8 v14, v9, 0x1

    .line 154
    .line 155
    aget-object v24, v15, v14

    .line 156
    .line 157
    mul-float/2addr v11, v0

    .line 158
    aput v11, v24, v4

    .line 159
    .line 160
    aput v7, v24, v16

    .line 161
    .line 162
    mul-float/2addr v12, v0

    .line 163
    aput v12, v24, p0

    .line 164
    .line 165
    invoke-virtual {v5, v13}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 166
    .line 167
    .line 168
    aget-object v11, v15, v14

    .line 169
    .line 170
    invoke-virtual {v5, v11}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 171
    .line 172
    .line 173
    add-int/lit8 v9, v9, 0x2

    .line 174
    .line 175
    const/16 v11, 0x1f

    .line 176
    .line 177
    if-le v9, v11, :cond_0

    .line 178
    .line 179
    invoke-virtual {v5, v4}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 180
    .line 181
    .line 182
    const/16 v11, 0x1406

    .line 183
    .line 184
    invoke-static {v3, v11, v4, v5}, Landroid/opengl/GLES10;->glVertexPointer(IIILjava/nio/Buffer;)V

    .line 185
    .line 186
    .line 187
    invoke-static {v11, v4, v5}, Landroid/opengl/GLES10;->glNormalPointer(IILjava/nio/Buffer;)V

    .line 188
    .line 189
    .line 190
    const/4 v10, 0x5

    .line 191
    invoke-static {v10, v4, v9}, Landroid/opengl/GLES10;->glDrawArrays(III)V

    .line 192
    .line 193
    .line 194
    sub-float v2, v2, v17

    .line 195
    .line 196
    move v9, v4

    .line 197
    :cond_0
    add-float v2, v2, v17

    .line 198
    .line 199
    move-wide/from16 v11, v20

    .line 200
    .line 201
    move-wide/from16 v13, v22

    .line 202
    .line 203
    goto :goto_1

    .line 204
    :cond_1
    const/4 v10, 0x5

    .line 205
    const/16 v11, 0x1406

    .line 206
    .line 207
    invoke-virtual {v5, v4}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 208
    .line 209
    .line 210
    invoke-static {v3, v11, v4, v5}, Landroid/opengl/GLES10;->glVertexPointer(IIILjava/nio/Buffer;)V

    .line 211
    .line 212
    .line 213
    invoke-static {v11, v4, v5}, Landroid/opengl/GLES10;->glNormalPointer(IILjava/nio/Buffer;)V

    .line 214
    .line 215
    .line 216
    invoke-static {v10, v4, v9}, Landroid/opengl/GLES10;->glDrawArrays(III)V

    .line 217
    .line 218
    .line 219
    move/from16 v0, p0

    .line 220
    .line 221
    move-object v1, v15

    .line 222
    move/from16 v2, v16

    .line 223
    .line 224
    move/from16 v6, v18

    .line 225
    .line 226
    move/from16 v7, v19

    .line 227
    .line 228
    goto/16 :goto_0

    .line 229
    .line 230
    :cond_2
    move/from16 v18, v6

    .line 231
    .line 232
    move/from16 v19, v7

    .line 233
    .line 234
    invoke-static/range {v18 .. v18}, Landroid/opengl/GLES10;->glDisableClientState(I)V

    .line 235
    .line 236
    .line 237
    invoke-static/range {v19 .. v19}, Landroid/opengl/GLES10;->glDisableClientState(I)V

    .line 238
    .line 239
    .line 240
    return-void
.end method
