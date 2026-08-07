.class public Lcom/momo/mcamera/mask/skin/AISkinBlurFilter;
.super Ll/tmj0;
.source "SourceFile"

# interfaces
.implements Ll/suf;


# instance fields
.field private isDiscard:Z

.field private mBlurSize:F

.field private mMmcvInfo:Ll/omw;

.field private textureBeforeId:I

.field private textureId:I

.field private textureInId:I


# direct methods
.method public constructor <init>(F)V
    .locals 8

    .line 1
    invoke-direct {p0}, Ll/tmj0;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/momo/mcamera/mask/skin/AISkinBlurFilter;->mBlurSize:F

    .line 6
    .line 7
    const/4 v1, -0x1

    .line 8
    iput v1, p0, Lcom/momo/mcamera/mask/skin/AISkinBlurFilter;->textureId:I

    .line 9
    .line 10
    iput v1, p0, Lcom/momo/mcamera/mask/skin/AISkinBlurFilter;->textureInId:I

    .line 11
    .line 12
    iput v1, p0, Lcom/momo/mcamera/mask/skin/AISkinBlurFilter;->textureBeforeId:I

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/skin/AISkinBlurFilter;->isDiscard:Z

    .line 16
    .line 17
    cmpl-float v0, p1, v0

    .line 18
    .line 19
    if-ltz v0, :cond_0

    .line 20
    .line 21
    float-to-double v0, p1

    .line 22
    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    .line 23
    .line 24
    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->pow(DD)D

    .line 25
    .line 26
    .line 27
    move-result-wide v4

    .line 28
    const-wide/high16 v6, -0x4000000000000000L    # -2.0

    .line 29
    .line 30
    mul-double/2addr v4, v6

    .line 31
    const-wide v6, 0x401921fb54442d18L    # 6.283185307179586

    .line 32
    .line 33
    .line 34
    .line 35
    .line 36
    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->pow(DD)D

    .line 37
    .line 38
    .line 39
    move-result-wide v0

    .line 40
    mul-double/2addr v0, v6

    .line 41
    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    .line 42
    .line 43
    .line 44
    move-result-wide v0

    .line 45
    const-wide/high16 v2, 0x3f70000000000000L    # 0.00390625

    .line 46
    .line 47
    mul-double/2addr v2, v0

    .line 48
    invoke-static {v2, v3}, Ljava/lang/Math;->log(D)D

    .line 49
    .line 50
    .line 51
    move-result-wide v0

    .line 52
    mul-double/2addr v4, v0

    .line 53
    invoke-static {v4, v5}, Ljava/lang/Math;->sqrt(D)D

    .line 54
    .line 55
    .line 56
    move-result-wide v0

    .line 57
    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    .line 58
    .line 59
    .line 60
    move-result-wide v0

    .line 61
    double-to-float p1, v0

    .line 62
    const/high16 v0, 0x40000000    # 2.0f

    .line 63
    .line 64
    rem-float v0, p1, v0

    .line 65
    .line 66
    add-float/2addr p1, v0

    .line 67
    iput p1, p0, Lcom/momo/mcamera/mask/skin/AISkinBlurFilter;->mBlurSize:F

    .line 68
    .line 69
    :cond_0
    return-void
.end method


# virtual methods
.method public drawSub()V
    .locals 12

    .line 1
    invoke-super {p0}, Ll/gfj;->drawSub()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/skin/AISkinBlurFilter;->isDiscard:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    goto/16 :goto_1

    .line 9
    .line 10
    :cond_0
    iget v0, p0, Ll/wej;->width:I

    .line 11
    .line 12
    iget v1, p0, Ll/wej;->height:I

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    invoke-static {v2, v2, v0, v1}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ll/wej;->getBackgroundRed()F

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    invoke-virtual {p0}, Ll/wej;->getBackgroundGreen()F

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    invoke-virtual {p0}, Ll/wej;->getBackgroundBlue()F

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    invoke-virtual {p0}, Ll/wej;->getBackgroundAlpha()F

    .line 31
    .line 32
    .line 33
    move-result v4

    .line 34
    invoke-static {v0, v1, v3, v4}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 35
    .line 36
    .line 37
    const/16 v0, 0x4100

    .line 38
    .line 39
    invoke-static {v0}, Landroid/opengl/GLES20;->glClear(I)V

    .line 40
    .line 41
    .line 42
    iget v0, p0, Ll/wej;->programHandle:I

    .line 43
    .line 44
    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/momo/mcamera/mask/skin/AISkinBlurFilter;->mMmcvInfo:Ll/omw;

    .line 48
    .line 49
    if-eqz v0, :cond_2

    .line 50
    .line 51
    invoke-virtual {v0}, Ll/omw;->n()I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-lez v0, :cond_2

    .line 56
    .line 57
    new-instance v0, Ljava/util/ArrayList;

    .line 58
    .line 59
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 60
    .line 61
    .line 62
    move v1, v2

    .line 63
    :goto_0
    iget-object v3, p0, Lcom/momo/mcamera/mask/skin/AISkinBlurFilter;->mMmcvInfo:Ll/omw;

    .line 64
    .line 65
    invoke-virtual {v3}, Ll/omw;->n()I

    .line 66
    .line 67
    .line 68
    move-result v3

    .line 69
    iget-object v4, p0, Lcom/momo/mcamera/mask/skin/AISkinBlurFilter;->mMmcvInfo:Ll/omw;

    .line 70
    .line 71
    if-ge v1, v3, :cond_1

    .line 72
    .line 73
    invoke-virtual {v4, v1}, Ll/omw;->j(I)Ll/nuf;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    invoke-virtual {v3}, Ll/nuf;->r()[F

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    add-int/lit8 v1, v1, 0x1

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_1
    invoke-virtual {v4}, Ll/omw;->n()I

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    new-array v1, v1, [[F

    .line 92
    .line 93
    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    check-cast v0, [[F

    .line 98
    .line 99
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 104
    .line 105
    .line 106
    move-result v3

    .line 107
    invoke-static {v0, v1, v3}, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation;->getFaceTriangulationBoundingBox([[FII)[[F

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    aget-object v1, v0, v2

    .line 112
    .line 113
    const/4 v3, 0x1

    .line 114
    aget-object v0, v0, v3

    .line 115
    .line 116
    invoke-virtual {p0}, Ll/tmj0;->passShaderValues()V

    .line 117
    .line 118
    .line 119
    array-length v3, v1

    .line 120
    const/4 v4, 0x4

    .line 121
    mul-int/2addr v3, v4

    .line 122
    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 123
    .line 124
    .line 125
    move-result-object v3

    .line 126
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 127
    .line 128
    .line 129
    move-result-object v5

    .line 130
    invoke-virtual {v3, v5}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 131
    .line 132
    .line 133
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 134
    .line 135
    .line 136
    move-result-object v11

    .line 137
    invoke-virtual {v11, v1}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 138
    .line 139
    .line 140
    invoke-virtual {v11, v2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 141
    .line 142
    .line 143
    iget v6, p0, Ll/wej;->positionHandle:I

    .line 144
    .line 145
    const/4 v9, 0x0

    .line 146
    const/4 v10, 0x0

    .line 147
    const/4 v7, 0x2

    .line 148
    const/16 v8, 0x1406

    .line 149
    .line 150
    invoke-static/range {v6 .. v11}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 151
    .line 152
    .line 153
    iget v1, p0, Ll/wej;->positionHandle:I

    .line 154
    .line 155
    invoke-static {v1}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 156
    .line 157
    .line 158
    array-length v1, v0

    .line 159
    mul-int/2addr v1, v4

    .line 160
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 161
    .line 162
    .line 163
    move-result-object v1

    .line 164
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 165
    .line 166
    .line 167
    move-result-object v3

    .line 168
    invoke-virtual {v1, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 169
    .line 170
    .line 171
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 172
    .line 173
    .line 174
    move-result-object v10

    .line 175
    invoke-virtual {v10, v0}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 176
    .line 177
    .line 178
    invoke-virtual {v10, v2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 179
    .line 180
    .line 181
    iget v5, p0, Ll/wej;->texCoordHandle:I

    .line 182
    .line 183
    const/4 v8, 0x0

    .line 184
    const/4 v6, 0x2

    .line 185
    const/16 v7, 0x1406

    .line 186
    .line 187
    invoke-static/range {v5 .. v10}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 188
    .line 189
    .line 190
    iget v0, p0, Ll/wej;->texCoordHandle:I

    .line 191
    .line 192
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 193
    .line 194
    .line 195
    const/4 v0, 0x5

    .line 196
    invoke-static {v0, v2, v4}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 197
    .line 198
    .line 199
    :cond_2
    invoke-virtual {p0}, Ll/rmj0;->getCurrentPass()I

    .line 200
    .line 201
    .line 202
    move-result v0

    .line 203
    const/4 v1, 0x2

    .line 204
    if-ne v0, v1, :cond_3

    .line 205
    .line 206
    invoke-virtual {p0}, Ll/wej;->disableDrawArray()V

    .line 207
    .line 208
    .line 209
    :cond_3
    :goto_1
    return-void
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/skin/AISkinBlurFilter;->mBlurSize:F

    .line 2
    .line 3
    invoke-static {p0, p0}, Ll/llj;->Q1(FF)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getVertexShader()Ljava/lang/String;
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/skin/AISkinBlurFilter;->mBlurSize:F

    .line 2
    .line 3
    invoke-static {p0, p0}, Ll/llj;->R1(FF)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public newTextureReady(ILl/gfj;Z)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/momo/mcamera/mask/skin/AISkinBlurFilter;->textureInId:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-eq v0, v1, :cond_1

    .line 5
    .line 6
    iget v0, p0, Lcom/momo/mcamera/mask/skin/AISkinBlurFilter;->textureId:I

    .line 7
    .line 8
    if-eq v0, v1, :cond_1

    .line 9
    .line 10
    iget v2, p0, Lcom/momo/mcamera/mask/skin/AISkinBlurFilter;->textureBeforeId:I

    .line 11
    .line 12
    if-eq v2, v1, :cond_1

    .line 13
    .line 14
    if-ne p1, v0, :cond_0

    .line 15
    .line 16
    if-eq v2, p1, :cond_1

    .line 17
    .line 18
    :cond_0
    const/4 v0, 0x1

    .line 19
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/skin/AISkinBlurFilter;->isDiscard:Z

    .line 20
    .line 21
    :cond_1
    iget v0, p0, Lcom/momo/mcamera/mask/skin/AISkinBlurFilter;->textureId:I

    .line 22
    .line 23
    iput v0, p0, Lcom/momo/mcamera/mask/skin/AISkinBlurFilter;->textureBeforeId:I

    .line 24
    .line 25
    iput p1, p0, Lcom/momo/mcamera/mask/skin/AISkinBlurFilter;->textureId:I

    .line 26
    .line 27
    iget v0, p0, Ll/wej;->texture_in:I

    .line 28
    .line 29
    iput v0, p0, Lcom/momo/mcamera/mask/skin/AISkinBlurFilter;->textureInId:I

    .line 30
    .line 31
    invoke-super {p0, p1, p2, p3}, Ll/jt2;->newTextureReady(ILl/gfj;Z)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public setMMCVInfo(Ll/omw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/skin/AISkinBlurFilter;->mMmcvInfo:Ll/omw;

    .line 2
    .line 3
    return-void
.end method
