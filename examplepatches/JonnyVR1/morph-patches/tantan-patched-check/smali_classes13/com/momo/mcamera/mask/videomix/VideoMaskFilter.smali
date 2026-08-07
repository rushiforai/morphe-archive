.class public Lcom/momo/mcamera/mask/videomix/VideoMaskFilter;
.super Ll/jt2;
.source "SourceFile"


# instance fields
.field private maskPath:Ljava/lang/String;

.field private maskTexture:I

.field private roll:F

.field private rollHandle:I

.field private textureCoordinate:[F

.field private textureSizeHandle:I

.field private vertexCoordinate:[F


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/jt2;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/momo/mcamera/mask/videomix/VideoMaskFilter;->maskTexture:I

    .line 6
    .line 7
    const/16 v0, 0x8

    .line 8
    .line 9
    new-array v1, v0, [F

    .line 10
    .line 11
    iput-object v1, p0, Lcom/momo/mcamera/mask/videomix/VideoMaskFilter;->vertexCoordinate:[F

    .line 12
    .line 13
    new-array v1, v0, [F

    .line 14
    .line 15
    iput-object v1, p0, Lcom/momo/mcamera/mask/videomix/VideoMaskFilter;->textureCoordinate:[F

    .line 16
    .line 17
    new-array v1, v0, [F

    .line 18
    .line 19
    fill-array-data v1, :array_0

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v1}, Lcom/momo/mcamera/mask/videomix/VideoMaskFilter;->updateVertexCoordinate([F)V

    .line 23
    .line 24
    .line 25
    new-array v0, v0, [F

    .line 26
    .line 27
    fill-array-data v0, :array_1

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, v0}, Lcom/momo/mcamera/mask/videomix/VideoMaskFilter;->updateTextureCoordinate([F)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    nop

    .line 35
    :array_0
    .array-data 4
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
    .end array-data

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
    .line 50
    .line 51
    .line 52
    .line 53
    .line 54
    .line 55
    :array_1
    .array-data 4
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private transformedCoordinate()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "vec2 transformedCoordinate(vec2 originCoordinate, vec2 offset, mat2 transformMatrix, vec2 textureSize) {\n        vec2 centered = originCoordinate * textureSize - offset * textureSize;\n        vec2 trans = transformMatrix * centered;\n        vec2 result = trans.xy + offset * textureSize;\n        return result / textureSize;\n    }"

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public declared-synchronized destroy()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-super {p0}, Ll/gfj;->destroy()V

    .line 3
    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-object v0, p0, Lcom/momo/mcamera/mask/videomix/VideoMaskFilter;->vertexCoordinate:[F

    .line 7
    .line 8
    iput-object v0, p0, Lcom/momo/mcamera/mask/videomix/VideoMaskFilter;->textureCoordinate:[F

    .line 9
    .line 10
    iget v0, p0, Lcom/momo/mcamera/mask/videomix/VideoMaskFilter;->maskTexture:I

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    filled-new-array {v0}, [I

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {v0}, Lcom/core/glcore/util/TextureHelper;->destroyTexture([I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :catchall_0
    move-exception v0

    .line 23
    goto :goto_1

    .line 24
    :cond_0
    :goto_0
    monitor-exit p0

    .line 25
    return-void

    .line 26
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 27
    throw v0
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "precision highp float;\nuniform sampler2D inputImageTexture0;\nvarying vec2 textureCoordinate;\nuniform float roll;\nuniform vec2 textureSize;\n\n"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Lcom/momo/mcamera/mask/videomix/VideoMaskFilter;->transformedCoordinate()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string p0, "\nvoid main() {\n    vec2 textureCoordinate = transformedCoordinate(textureCoordinate, vec2(0.5, 0.5), mat2(vec2(cos(roll), -sin(roll)), vec2(sin(roll), cos(roll))), textureSize);\n    gl_FragColor = texture2D(inputImageTexture0, textureCoordinate);\n}\n"

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public initShaderHandles()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/wej;->initShaderHandles()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/wej;->programHandle:I

    .line 5
    .line 6
    const-string v1, "roll"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Lcom/momo/mcamera/mask/videomix/VideoMaskFilter;->rollHandle:I

    .line 13
    .line 14
    iget v0, p0, Ll/wej;->programHandle:I

    .line 15
    .line 16
    const-string v1, "textureSize"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Lcom/momo/mcamera/mask/videomix/VideoMaskFilter;->textureSizeHandle:I

    .line 23
    .line 24
    return-void
.end method

.method public newTextureReady(ILl/gfj;Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/jt2;->newTextureReady(ILl/gfj;Z)V

    .line 2
    .line 3
    .line 4
    iget p1, p0, Lcom/momo/mcamera/mask/videomix/VideoMaskFilter;->maskTexture:I

    .line 5
    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    iget-object p1, p0, Lcom/momo/mcamera/mask/videomix/VideoMaskFilter;->maskPath:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-nez p1, :cond_0

    .line 15
    .line 16
    iget-object p1, p0, Lcom/momo/mcamera/mask/videomix/VideoMaskFilter;->maskPath:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {p1}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-static {p1}, Lcom/core/glcore/util/TextureHelper;->bitmapToTexture(Landroid/graphics/Bitmap;)I

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    iput p2, p0, Lcom/momo/mcamera/mask/videomix/VideoMaskFilter;->maskTexture:I

    .line 27
    .line 28
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public passShaderValues()V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/wej;->renderVertices:Ljava/nio/FloatBuffer;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/momo/mcamera/mask/videomix/VideoMaskFilter;->vertexCoordinate:[F

    .line 6
    .line 7
    array-length v0, v0

    .line 8
    mul-int/lit8 v0, v0, 0x4

    .line 9
    .line 10
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, p0, Ll/wej;->renderVertices:Ljava/nio/FloatBuffer;

    .line 27
    .line 28
    :cond_0
    iget-object v0, p0, Ll/wej;->renderVertices:Ljava/nio/FloatBuffer;

    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/nio/FloatBuffer;->clear()Ljava/nio/Buffer;

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/wej;->renderVertices:Ljava/nio/FloatBuffer;

    .line 34
    .line 35
    iget-object v1, p0, Lcom/momo/mcamera/mask/videomix/VideoMaskFilter;->vertexCoordinate:[F

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    const/4 v1, 0x0

    .line 42
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 43
    .line 44
    .line 45
    iget v2, p0, Ll/wej;->positionHandle:I

    .line 46
    .line 47
    const/16 v6, 0x8

    .line 48
    .line 49
    iget-object v7, p0, Ll/wej;->renderVertices:Ljava/nio/FloatBuffer;

    .line 50
    .line 51
    const/4 v3, 0x2

    .line 52
    const/16 v4, 0x1406

    .line 53
    .line 54
    const/4 v5, 0x0

    .line 55
    invoke-static/range {v2 .. v7}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 56
    .line 57
    .line 58
    iget v0, p0, Ll/wej;->positionHandle:I

    .line 59
    .line 60
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 64
    .line 65
    iget v2, p0, Ll/wej;->curRotation:I

    .line 66
    .line 67
    aget-object v3, v0, v2

    .line 68
    .line 69
    if-nez v3, :cond_1

    .line 70
    .line 71
    iget-object v3, p0, Lcom/momo/mcamera/mask/videomix/VideoMaskFilter;->textureCoordinate:[F

    .line 72
    .line 73
    array-length v3, v3

    .line 74
    mul-int/lit8 v3, v3, 0x4

    .line 75
    .line 76
    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 77
    .line 78
    .line 79
    move-result-object v3

    .line 80
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 81
    .line 82
    .line 83
    move-result-object v4

    .line 84
    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 89
    .line 90
    .line 91
    move-result-object v3

    .line 92
    aput-object v3, v0, v2

    .line 93
    .line 94
    :cond_1
    iget-object v0, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 95
    .line 96
    iget v2, p0, Ll/wej;->curRotation:I

    .line 97
    .line 98
    aget-object v0, v0, v2

    .line 99
    .line 100
    invoke-virtual {v0}, Ljava/nio/FloatBuffer;->clear()Ljava/nio/Buffer;

    .line 101
    .line 102
    .line 103
    iget-object v0, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 104
    .line 105
    iget v2, p0, Ll/wej;->curRotation:I

    .line 106
    .line 107
    aget-object v0, v0, v2

    .line 108
    .line 109
    iget-object v2, p0, Lcom/momo/mcamera/mask/videomix/VideoMaskFilter;->textureCoordinate:[F

    .line 110
    .line 111
    invoke-virtual {v0, v2}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 116
    .line 117
    .line 118
    iget v2, p0, Ll/wej;->texCoordHandle:I

    .line 119
    .line 120
    iget-object v0, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 121
    .line 122
    iget v3, p0, Ll/wej;->curRotation:I

    .line 123
    .line 124
    aget-object v7, v0, v3

    .line 125
    .line 126
    const/4 v3, 0x2

    .line 127
    const/16 v4, 0x1406

    .line 128
    .line 129
    const/4 v5, 0x0

    .line 130
    const/16 v6, 0x8

    .line 131
    .line 132
    invoke-static/range {v2 .. v7}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 133
    .line 134
    .line 135
    iget v0, p0, Ll/wej;->texCoordHandle:I

    .line 136
    .line 137
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 138
    .line 139
    .line 140
    const v0, 0x84c0

    .line 141
    .line 142
    .line 143
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 144
    .line 145
    .line 146
    const/16 v0, 0xde1

    .line 147
    .line 148
    iget v2, p0, Lcom/momo/mcamera/mask/videomix/VideoMaskFilter;->maskTexture:I

    .line 149
    .line 150
    invoke-static {v0, v2}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 151
    .line 152
    .line 153
    iget v0, p0, Ll/wej;->textureHandle:I

    .line 154
    .line 155
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 156
    .line 157
    .line 158
    iget v0, p0, Lcom/momo/mcamera/mask/videomix/VideoMaskFilter;->textureSizeHandle:I

    .line 159
    .line 160
    iget v1, p0, Ll/wej;->width:I

    .line 161
    .line 162
    int-to-float v1, v1

    .line 163
    iget v2, p0, Ll/wej;->height:I

    .line 164
    .line 165
    int-to-float v2, v2

    .line 166
    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glUniform2f(IFF)V

    .line 167
    .line 168
    .line 169
    iget v0, p0, Lcom/momo/mcamera/mask/videomix/VideoMaskFilter;->rollHandle:I

    .line 170
    .line 171
    iget p0, p0, Lcom/momo/mcamera/mask/videomix/VideoMaskFilter;->roll:F

    .line 172
    .line 173
    neg-float p0, p0

    .line 174
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 175
    .line 176
    .line 177
    return-void
.end method

.method public setVideoFileConfig(Landroid/graphics/RectF;Ljava/lang/String;)V
    .locals 6

    .line 1
    iput-object p2, p0, Lcom/momo/mcamera/mask/videomix/VideoMaskFilter;->maskPath:Ljava/lang/String;

    .line 2
    .line 3
    iget p2, p1, Landroid/graphics/RectF;->left:F

    .line 4
    .line 5
    iget v0, p1, Landroid/graphics/RectF;->bottom:F

    .line 6
    .line 7
    const/high16 v1, 0x3f800000    # 1.0f

    .line 8
    .line 9
    sub-float v2, v1, v0

    .line 10
    .line 11
    iget v3, p1, Landroid/graphics/RectF;->right:F

    .line 12
    .line 13
    sub-float v0, v1, v0

    .line 14
    .line 15
    iget p1, p1, Landroid/graphics/RectF;->top:F

    .line 16
    .line 17
    sub-float v4, v1, p1

    .line 18
    .line 19
    sub-float/2addr v1, p1

    .line 20
    const/16 p1, 0x8

    .line 21
    .line 22
    new-array p1, p1, [F

    .line 23
    .line 24
    const/4 v5, 0x0

    .line 25
    aput p2, p1, v5

    .line 26
    .line 27
    const/4 v5, 0x1

    .line 28
    aput v2, p1, v5

    .line 29
    .line 30
    const/4 v2, 0x2

    .line 31
    aput v3, p1, v2

    .line 32
    .line 33
    const/4 v2, 0x3

    .line 34
    aput v0, p1, v2

    .line 35
    .line 36
    const/4 v0, 0x4

    .line 37
    aput p2, p1, v0

    .line 38
    .line 39
    const/4 p2, 0x5

    .line 40
    aput v4, p1, p2

    .line 41
    .line 42
    const/4 p2, 0x6

    .line 43
    aput v3, p1, p2

    .line 44
    .line 45
    const/4 p2, 0x7

    .line 46
    aput v1, p1, p2

    .line 47
    .line 48
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/videomix/VideoMaskFilter;->updateTextureCoordinate([F)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public updateMaskRoll(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/videomix/VideoMaskFilter;->roll:F

    .line 2
    .line 3
    return-void
.end method

.method public updateTextureCoordinate([F)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/videomix/VideoMaskFilter;->textureCoordinate:[F

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    aget v1, p1, v0

    .line 5
    .line 6
    aput v1, p0, v0

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    aget v1, p1, v0

    .line 10
    .line 11
    aput v1, p0, v0

    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    aget v1, p1, v0

    .line 15
    .line 16
    aput v1, p0, v0

    .line 17
    .line 18
    const/4 v0, 0x3

    .line 19
    aget v1, p1, v0

    .line 20
    .line 21
    aput v1, p0, v0

    .line 22
    .line 23
    const/4 v0, 0x4

    .line 24
    aget v1, p1, v0

    .line 25
    .line 26
    aput v1, p0, v0

    .line 27
    .line 28
    const/4 v0, 0x5

    .line 29
    aget v1, p1, v0

    .line 30
    .line 31
    aput v1, p0, v0

    .line 32
    .line 33
    const/4 v0, 0x6

    .line 34
    aget v1, p1, v0

    .line 35
    .line 36
    aput v1, p0, v0

    .line 37
    .line 38
    const/4 v0, 0x7

    .line 39
    aget p1, p1, v0

    .line 40
    .line 41
    aput p1, p0, v0

    .line 42
    .line 43
    return-void
.end method

.method public updateVertexCoordinate([F)V
    .locals 9

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/videomix/VideoMaskFilter;->vertexCoordinate:[F

    .line 2
    .line 3
    const/4 v0, 0x6

    .line 4
    aget v1, p1, v0

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    aput v1, p0, v2

    .line 8
    .line 9
    const/4 v1, 0x7

    .line 10
    aget v3, p1, v1

    .line 11
    .line 12
    const/4 v4, 0x1

    .line 13
    aput v3, p0, v4

    .line 14
    .line 15
    const/4 v3, 0x4

    .line 16
    aget v5, p1, v3

    .line 17
    .line 18
    const/4 v6, 0x2

    .line 19
    aput v5, p0, v6

    .line 20
    .line 21
    const/4 v5, 0x5

    .line 22
    aget v7, p1, v5

    .line 23
    .line 24
    const/4 v8, 0x3

    .line 25
    aput v7, p0, v8

    .line 26
    .line 27
    aget v6, p1, v6

    .line 28
    .line 29
    aput v6, p0, v3

    .line 30
    .line 31
    aget v3, p1, v8

    .line 32
    .line 33
    aput v3, p0, v5

    .line 34
    .line 35
    aget v2, p1, v2

    .line 36
    .line 37
    aput v2, p0, v0

    .line 38
    .line 39
    aget p1, p1, v4

    .line 40
    .line 41
    aput p1, p0, v1

    .line 42
    .line 43
    return-void
.end method
