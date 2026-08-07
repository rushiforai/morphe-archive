.class public Lcom/momo/mcamera/mask/beauty/DrawGestureFilter;
.super Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpSrcFilter;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpSrcFilter;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public drawSub()V
    .locals 14

    .line 1
    invoke-super {p0}, Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpSrcFilter;->drawSub()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpSrcFilter;->colorHandle:I

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpSrcFilter;->data:[F

    .line 11
    .line 12
    if-eqz v0, :cond_3

    .line 13
    .line 14
    array-length v0, v0

    .line 15
    if-gtz v0, :cond_0

    .line 16
    .line 17
    goto/16 :goto_0

    .line 18
    .line 19
    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    invoke-static {v0, v2, v2, v0}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpSrcFilter;->data:[F

    .line 26
    .line 27
    aget v0, v0, v1

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    int-to-float v2, v2

    .line 34
    div-float/2addr v0, v2

    .line 35
    const/high16 v2, 0x3f000000    # 0.5f

    .line 36
    .line 37
    sub-float/2addr v0, v2

    .line 38
    const/high16 v3, 0x40000000    # 2.0f

    .line 39
    .line 40
    mul-float/2addr v0, v3

    .line 41
    iget-object v4, p0, Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpSrcFilter;->data:[F

    .line 42
    .line 43
    const/4 v5, 0x1

    .line 44
    aget v4, v4, v5

    .line 45
    .line 46
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 47
    .line 48
    .line 49
    move-result v6

    .line 50
    int-to-float v6, v6

    .line 51
    div-float/2addr v4, v6

    .line 52
    sub-float/2addr v4, v2

    .line 53
    const/high16 v6, -0x40000000    # -2.0f

    .line 54
    .line 55
    mul-float/2addr v4, v6

    .line 56
    iget-object v7, p0, Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpSrcFilter;->data:[F

    .line 57
    .line 58
    aget v8, v7, v1

    .line 59
    .line 60
    const/4 v9, 0x2

    .line 61
    aget v7, v7, v9

    .line 62
    .line 63
    add-float/2addr v8, v7

    .line 64
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 65
    .line 66
    .line 67
    move-result v7

    .line 68
    int-to-float v7, v7

    .line 69
    div-float/2addr v8, v7

    .line 70
    sub-float/2addr v8, v2

    .line 71
    mul-float/2addr v8, v3

    .line 72
    iget-object v7, p0, Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpSrcFilter;->data:[F

    .line 73
    .line 74
    aget v10, v7, v5

    .line 75
    .line 76
    const/4 v11, 0x3

    .line 77
    aget v7, v7, v11

    .line 78
    .line 79
    add-float/2addr v10, v7

    .line 80
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 81
    .line 82
    .line 83
    move-result v7

    .line 84
    int-to-float v7, v7

    .line 85
    div-float/2addr v10, v7

    .line 86
    sub-float/2addr v10, v2

    .line 87
    mul-float/2addr v10, v6

    .line 88
    const/16 v2, 0x10

    .line 89
    .line 90
    new-array v6, v2, [F

    .line 91
    .line 92
    aput v0, v6, v1

    .line 93
    .line 94
    aput v4, v6, v5

    .line 95
    .line 96
    aput v0, v6, v9

    .line 97
    .line 98
    aput v10, v6, v11

    .line 99
    .line 100
    const/4 v7, 0x4

    .line 101
    aput v0, v6, v7

    .line 102
    .line 103
    const/4 v7, 0x5

    .line 104
    aput v10, v6, v7

    .line 105
    .line 106
    const/4 v7, 0x6

    .line 107
    aput v8, v6, v7

    .line 108
    .line 109
    const/4 v7, 0x7

    .line 110
    aput v10, v6, v7

    .line 111
    .line 112
    const/16 v7, 0x8

    .line 113
    .line 114
    aput v8, v6, v7

    .line 115
    .line 116
    const/16 v9, 0x9

    .line 117
    .line 118
    aput v10, v6, v9

    .line 119
    .line 120
    const/16 v9, 0xa

    .line 121
    .line 122
    aput v8, v6, v9

    .line 123
    .line 124
    const/16 v9, 0xb

    .line 125
    .line 126
    aput v4, v6, v9

    .line 127
    .line 128
    const/16 v9, 0xc

    .line 129
    .line 130
    aput v0, v6, v9

    .line 131
    .line 132
    const/16 v0, 0xd

    .line 133
    .line 134
    aput v4, v6, v0

    .line 135
    .line 136
    const/16 v0, 0xe

    .line 137
    .line 138
    aput v8, v6, v0

    .line 139
    .line 140
    const/16 v0, 0xf

    .line 141
    .line 142
    aput v4, v6, v0

    .line 143
    .line 144
    iget-object v0, p0, Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpSrcFilter;->floatBuffer:Ljava/nio/FloatBuffer;

    .line 145
    .line 146
    if-eqz v0, :cond_1

    .line 147
    .line 148
    invoke-virtual {v0}, Ljava/nio/Buffer;->capacity()I

    .line 149
    .line 150
    .line 151
    move-result v0

    .line 152
    if-eq v0, v2, :cond_2

    .line 153
    .line 154
    :cond_1
    const/16 v0, 0x40

    .line 155
    .line 156
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 161
    .line 162
    .line 163
    move-result-object v2

    .line 164
    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    iput-object v0, p0, Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpSrcFilter;->floatBuffer:Ljava/nio/FloatBuffer;

    .line 173
    .line 174
    :cond_2
    iget-object v0, p0, Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpSrcFilter;->floatBuffer:Ljava/nio/FloatBuffer;

    .line 175
    .line 176
    invoke-virtual {v0, v6}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 177
    .line 178
    .line 179
    iget-object v0, p0, Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpSrcFilter;->floatBuffer:Ljava/nio/FloatBuffer;

    .line 180
    .line 181
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 182
    .line 183
    .line 184
    iget v8, p0, Ll/wej;->positionHandle:I

    .line 185
    .line 186
    const/16 v12, 0x8

    .line 187
    .line 188
    iget-object v13, p0, Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpSrcFilter;->floatBuffer:Ljava/nio/FloatBuffer;

    .line 189
    .line 190
    const/4 v9, 0x2

    .line 191
    const/16 v10, 0x1406

    .line 192
    .line 193
    const/4 v11, 0x0

    .line 194
    invoke-static/range {v8 .. v13}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 195
    .line 196
    .line 197
    iget p0, p0, Ll/wej;->positionHandle:I

    .line 198
    .line 199
    invoke-static {p0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 200
    .line 201
    .line 202
    invoke-static {v3}, Landroid/opengl/GLES20;->glLineWidth(F)V

    .line 203
    .line 204
    .line 205
    invoke-static {v5, v1, v7}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 206
    .line 207
    .line 208
    return-void

    .line 209
    :cond_3
    :goto_0
    const-string p0, "mediaRender"

    .line 210
    .line 211
    const-string v0, "Render no face!"

    .line 212
    .line 213
    invoke-static {p0, v0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 214
    .line 215
    .line 216
    return-void
.end method

.method public updateFaceInfo(Ll/omw;)V
    .locals 7

    .line 1
    invoke-virtual {p1}, Ll/omw;->n()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-gtz v0, :cond_0

    .line 6
    .line 7
    const-string p0, "mediaRender"

    .line 8
    .line 9
    const-string p1, "No face"

    .line 10
    .line 11
    invoke-static {p0, p1}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    const/4 v1, 0x0

    .line 16
    move v2, v1

    .line 17
    :goto_0
    if-ge v2, v0, :cond_3

    .line 18
    .line 19
    iget-object v3, p1, Ll/omw;->G:Lcom/momocv/objectdetect/ObjectDetectInfo;

    .line 20
    .line 21
    if-eqz v3, :cond_2

    .line 22
    .line 23
    iget-object v3, v3, Lcom/momocv/objectdetect/ObjectDetectInfo;->detect_results_:[Lcom/momocv/MMBox;

    .line 24
    .line 25
    if-eqz v3, :cond_2

    .line 26
    .line 27
    array-length v4, v3

    .line 28
    const/4 v5, 0x1

    .line 29
    if-lt v4, v5, :cond_2

    .line 30
    .line 31
    iget-object v4, p0, Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpSrcFilter;->data:[F

    .line 32
    .line 33
    if-nez v4, :cond_1

    .line 34
    .line 35
    const/4 v4, 0x4

    .line 36
    new-array v4, v4, [F

    .line 37
    .line 38
    iput-object v4, p0, Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpSrcFilter;->data:[F

    .line 39
    .line 40
    :cond_1
    iget-object v4, p0, Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpSrcFilter;->data:[F

    .line 41
    .line 42
    aget-object v3, v3, v1

    .line 43
    .line 44
    iget v6, v3, Lcom/momocv/MMRect;->x_:I

    .line 45
    .line 46
    int-to-float v6, v6

    .line 47
    aput v6, v4, v1

    .line 48
    .line 49
    iget v6, v3, Lcom/momocv/MMRect;->y_:I

    .line 50
    .line 51
    int-to-float v6, v6

    .line 52
    aput v6, v4, v5

    .line 53
    .line 54
    iget v5, v3, Lcom/momocv/MMRect;->width_:I

    .line 55
    .line 56
    int-to-float v5, v5

    .line 57
    const/4 v6, 0x2

    .line 58
    aput v5, v4, v6

    .line 59
    .line 60
    iget v3, v3, Lcom/momocv/MMRect;->height_:I

    .line 61
    .line 62
    int-to-float v3, v3

    .line 63
    const/4 v5, 0x3

    .line 64
    aput v3, v4, v5

    .line 65
    .line 66
    :cond_2
    add-int/lit8 v2, v2, 0x1

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_3
    return-void
.end method
