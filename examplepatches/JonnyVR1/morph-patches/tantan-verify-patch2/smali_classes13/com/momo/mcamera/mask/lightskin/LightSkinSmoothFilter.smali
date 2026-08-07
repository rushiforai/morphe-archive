.class public Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;
.super Ll/hs10;
.source "SourceFile"

# interfaces
.implements Ll/suf;


# instance fields
.field private bgBlur:F

.field private blurAlphaHandle:I

.field private freqRangeBlurHandle:I

.field private freqRangeValueHandle:I

.field private heightOffset:F

.field private heightOffsetHandle:I

.field private mmcvInfo:Ll/omw;

.field private sharpen:F

.field private sharpenHandle:I

.field private smoothLevel:F

.field private texCoordBuffer:Ljava/nio/FloatBuffer;

.field private verticesBuffer:Ljava/nio/FloatBuffer;

.field private widthOffset:F

.field private widthOffsetHandle:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    const/4 v0, 0x3

    .line 2
    invoke-direct {p0, v0}, Ll/hs10;-><init>(I)V

    .line 3
    .line 4
    .line 5
    const/high16 v0, 0x3f000000    # 0.5f

    .line 6
    .line 7
    iput v0, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;->sharpen:F

    .line 8
    .line 9
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
    iget-object v0, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;->mmcvInfo:Ll/omw;

    .line 5
    .line 6
    if-eqz v0, :cond_4

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/omw;->n()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    goto/16 :goto_1

    .line 15
    .line 16
    :cond_0
    iget v0, p0, Ll/wej;->programHandle:I

    .line 17
    .line 18
    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 19
    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    move v1, v0

    .line 23
    :goto_0
    iget-object v2, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;->mmcvInfo:Ll/omw;

    .line 24
    .line 25
    invoke-virtual {v2}, Ll/omw;->n()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-ge v1, v2, :cond_3

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;->facePassShaderValues()V

    .line 32
    .line 33
    .line 34
    iget-object v2, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;->mmcvInfo:Ll/omw;

    .line 35
    .line 36
    invoke-virtual {v2, v1}, Ll/omw;->j(I)Ll/nuf;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {v2}, Ll/nuf;->r()[F

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 49
    .line 50
    .line 51
    move-result v4

    .line 52
    const/4 v5, 0x0

    .line 53
    invoke-static {v2, v3, v4, v5}, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation;->getFaceTriangulation([FII[F)[[F

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    aget-object v3, v2, v0

    .line 58
    .line 59
    const/4 v4, 0x1

    .line 60
    aget-object v2, v2, v4

    .line 61
    .line 62
    iget-object v4, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;->verticesBuffer:Ljava/nio/FloatBuffer;

    .line 63
    .line 64
    const/4 v5, 0x4

    .line 65
    if-nez v4, :cond_1

    .line 66
    .line 67
    array-length v4, v3

    .line 68
    mul-int/2addr v4, v5

    .line 69
    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 70
    .line 71
    .line 72
    move-result-object v4

    .line 73
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 74
    .line 75
    .line 76
    move-result-object v6

    .line 77
    invoke-virtual {v4, v6}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 78
    .line 79
    .line 80
    move-result-object v4

    .line 81
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 82
    .line 83
    .line 84
    move-result-object v4

    .line 85
    iput-object v4, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;->verticesBuffer:Ljava/nio/FloatBuffer;

    .line 86
    .line 87
    :cond_1
    iget-object v4, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;->verticesBuffer:Ljava/nio/FloatBuffer;

    .line 88
    .line 89
    invoke-virtual {v4}, Ljava/nio/FloatBuffer;->rewind()Ljava/nio/Buffer;

    .line 90
    .line 91
    .line 92
    iget-object v4, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;->verticesBuffer:Ljava/nio/FloatBuffer;

    .line 93
    .line 94
    invoke-virtual {v4, v3}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 95
    .line 96
    .line 97
    iget-object v3, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;->verticesBuffer:Ljava/nio/FloatBuffer;

    .line 98
    .line 99
    invoke-virtual {v3, v0}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 100
    .line 101
    .line 102
    iget v6, p0, Ll/wej;->positionHandle:I

    .line 103
    .line 104
    const/4 v10, 0x0

    .line 105
    iget-object v11, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;->verticesBuffer:Ljava/nio/FloatBuffer;

    .line 106
    .line 107
    const/4 v7, 0x2

    .line 108
    const/16 v8, 0x1406

    .line 109
    .line 110
    const/4 v9, 0x0

    .line 111
    invoke-static/range {v6 .. v11}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 112
    .line 113
    .line 114
    iget v3, p0, Ll/wej;->positionHandle:I

    .line 115
    .line 116
    invoke-static {v3}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 117
    .line 118
    .line 119
    iget-object v3, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;->texCoordBuffer:Ljava/nio/FloatBuffer;

    .line 120
    .line 121
    if-nez v3, :cond_2

    .line 122
    .line 123
    array-length v3, v2

    .line 124
    mul-int/2addr v3, v5

    .line 125
    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 126
    .line 127
    .line 128
    move-result-object v3

    .line 129
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 130
    .line 131
    .line 132
    move-result-object v4

    .line 133
    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 134
    .line 135
    .line 136
    move-result-object v3

    .line 137
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 138
    .line 139
    .line 140
    move-result-object v3

    .line 141
    iput-object v3, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;->texCoordBuffer:Ljava/nio/FloatBuffer;

    .line 142
    .line 143
    :cond_2
    iget-object v3, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;->texCoordBuffer:Ljava/nio/FloatBuffer;

    .line 144
    .line 145
    invoke-virtual {v3}, Ljava/nio/FloatBuffer;->rewind()Ljava/nio/Buffer;

    .line 146
    .line 147
    .line 148
    iget-object v3, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;->texCoordBuffer:Ljava/nio/FloatBuffer;

    .line 149
    .line 150
    invoke-virtual {v3, v2}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 151
    .line 152
    .line 153
    iget-object v3, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;->texCoordBuffer:Ljava/nio/FloatBuffer;

    .line 154
    .line 155
    invoke-virtual {v3, v0}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 156
    .line 157
    .line 158
    iget v6, p0, Ll/wej;->texCoordHandle:I

    .line 159
    .line 160
    const/4 v10, 0x0

    .line 161
    iget-object v11, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;->texCoordBuffer:Ljava/nio/FloatBuffer;

    .line 162
    .line 163
    const/4 v7, 0x2

    .line 164
    const/16 v8, 0x1406

    .line 165
    .line 166
    const/4 v9, 0x0

    .line 167
    invoke-static/range {v6 .. v11}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 168
    .line 169
    .line 170
    iget v3, p0, Ll/wej;->texCoordHandle:I

    .line 171
    .line 172
    invoke-static {v3}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 173
    .line 174
    .line 175
    array-length v2, v2

    .line 176
    div-int/lit8 v2, v2, 0x2

    .line 177
    .line 178
    invoke-static {v5, v0, v2}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 179
    .line 180
    .line 181
    add-int/lit8 v1, v1, 0x1

    .line 182
    .line 183
    goto/16 :goto_0

    .line 184
    .line 185
    :cond_3
    invoke-virtual {p0}, Ll/wej;->disableDrawArray()V

    .line 186
    .line 187
    .line 188
    :cond_4
    :goto_1
    return-void
.end method

.method public facePassShaderValues()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/hs10;->passTextureValues()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;->blurAlphaHandle:I

    .line 5
    .line 6
    iget v1, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;->smoothLevel:F

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-static {v0, v1, v2, v2}, Landroid/opengl/GLES20;->glUniform3f(IFFF)V

    .line 10
    .line 11
    .line 12
    iget v0, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;->widthOffsetHandle:I

    .line 13
    .line 14
    iget v1, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;->widthOffset:F

    .line 15
    .line 16
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 17
    .line 18
    .line 19
    iget v0, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;->heightOffsetHandle:I

    .line 20
    .line 21
    iget v1, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;->heightOffset:F

    .line 22
    .line 23
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 24
    .line 25
    .line 26
    iget v0, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;->sharpenHandle:I

    .line 27
    .line 28
    iget v1, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;->sharpen:F

    .line 29
    .line 30
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 31
    .line 32
    .line 33
    iget v0, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;->freqRangeValueHandle:I

    .line 34
    .line 35
    const v1, 0x3e4ccccd    # 0.2f

    .line 36
    .line 37
    .line 38
    const/high16 v2, 0x3f000000    # 0.5f

    .line 39
    .line 40
    const v3, 0x3f666666    # 0.9f

    .line 41
    .line 42
    .line 43
    invoke-static {v0, v1, v2, v3, v3}, Landroid/opengl/GLES20;->glUniform4f(IFFFF)V

    .line 44
    .line 45
    .line 46
    iget p0, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;->freqRangeBlurHandle:I

    .line 47
    .line 48
    const/high16 v0, 0x3f800000    # 1.0f

    .line 49
    .line 50
    const v1, 0x3da3d70a    # 0.08f

    .line 51
    .line 52
    .line 53
    invoke-static {p0, v0, v3, v2, v1}, Landroid/opengl/GLES20;->glUniform4f(IFFFF)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision highp float;\nvarying highp vec2 textureCoordinate; \nuniform sampler2D inputImageTexture0; //\u539f\u56fe\nuniform sampler2D inputImageTexture1;  \nuniform sampler2D inputImageTexture2;  \nuniform lowp vec3 blurAlpha; //0.59   1.0\nuniform highp float widthOffset; //0.0018519 \u5373 1/w\nuniform highp float heightOffset; //0.0010417 \u53731/h\nuniform highp float sharpen;//0.05\n\nuniform  vec4 frequencyRangeValue; \nuniform  vec4 frequencyRangeBlur;\n\nvoid main() \n{ \n    lowp vec4 iColor = texture2D(inputImageTexture0, textureCoordinate); \n    lowp vec4 meanColor = texture2D(inputImageTexture1, textureCoordinate); \n    lowp vec4 varColor = texture2D(inputImageTexture2, textureCoordinate); \n    lowp float theta = 0.1; \n    mediump float p = clamp((min(iColor.r, meanColor.r - 0.1) - 0.2) * 4.0, 0.0, 1.0); \n    mediump float meanVar = (varColor.r + varColor.g + varColor.b) / 3.0; \n    mediump float kMin; \n    lowp vec3 resultColor; \n    lowp float intensity = blurAlpha.r; \n    kMin = (1.0 - meanVar / (meanVar + theta)) * p * intensity; \n\n    ////////////////////////////////////////////////////////\n    //\u5206\u9891\n    if(kMin > 1.0 - frequencyRangeValue.x)\n    {\n        kMin = kMin * frequencyRangeBlur.x ; //\u4f4e\u9891\n    }\n    else if(kMin > 1.0 - frequencyRangeValue.y)\n    {\n        kMin = kMin * frequencyRangeBlur.y; //\u4f4e\u4e2d\u9891\n    }\n    else if(kMin > 1.0 - frequencyRangeValue.z)\n    {\n        kMin = kMin * frequencyRangeBlur.z; //\u4e2d\u9891\n    }\n    else\n    {\n        kMin = kMin * frequencyRangeBlur.w; //\u9ad8\u9891        \n    }    \n\n    ////////////////////////////////////////////////////////\n\n    resultColor = mix(iColor.rgb, meanColor.rgb, kMin); \n     \n    highp float sum = 0.25*iColor.g;\n    sum += 0.125*texture2D(inputImageTexture0,textureCoordinate+vec2(-widthOffset,0.0)).g;\n    sum += 0.125*texture2D(inputImageTexture0,textureCoordinate+vec2(widthOffset,0.0)).g;\n    sum += 0.125*texture2D(inputImageTexture0,textureCoordinate+vec2(0.0,-heightOffset)).g;\n    sum += 0.125*texture2D(inputImageTexture0,textureCoordinate+vec2(0.0,heightOffset)).g;\n    sum += 0.0625*texture2D(inputImageTexture0,textureCoordinate+vec2(widthOffset,heightOffset)).g;\n    sum += 0.0625*texture2D(inputImageTexture0,textureCoordinate+vec2(-widthOffset,-heightOffset)).g;\n    sum += 0.0625*texture2D(inputImageTexture0,textureCoordinate+vec2(-widthOffset,heightOffset)).g;\n    sum += 0.0625*texture2D(inputImageTexture0,textureCoordinate+vec2(widthOffset,-heightOffset)).g;\n\n\n    float hPass = iColor.g-sum+0.5;\n    float flag = step(0.5, hPass);\n    highp vec3 color = mix(max(vec3(0.0), (2.0*hPass + resultColor - 1.0)), min(vec3(1.0), (resultColor + 2.0*hPass - 1.0)), flag);\n    color = mix(resultColor.rgb, color.rgb, sharpen);\n\n    gl_FragColor = vec4(color, 1.0);\n}"

    .line 2
    .line 3
    return-object p0
.end method

.method public getSmoothLevel()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;->smoothLevel:F

    .line 2
    .line 3
    return p0
.end method

.method public initShaderHandles()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/hs10;->initShaderHandles()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/wej;->programHandle:I

    .line 5
    .line 6
    const-string v1, "blurAlpha"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;->blurAlphaHandle:I

    .line 13
    .line 14
    iget v0, p0, Ll/wej;->programHandle:I

    .line 15
    .line 16
    const-string v1, "widthOffset"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;->widthOffsetHandle:I

    .line 23
    .line 24
    iget v0, p0, Ll/wej;->programHandle:I

    .line 25
    .line 26
    const-string v1, "heightOffset"

    .line 27
    .line 28
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iput v0, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;->heightOffsetHandle:I

    .line 33
    .line 34
    iget v0, p0, Ll/wej;->programHandle:I

    .line 35
    .line 36
    const-string v1, "sharpen"

    .line 37
    .line 38
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iput v0, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;->sharpenHandle:I

    .line 43
    .line 44
    iget v0, p0, Ll/wej;->programHandle:I

    .line 45
    .line 46
    const-string v1, "frequencyRangeValue"

    .line 47
    .line 48
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    iput v0, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;->freqRangeValueHandle:I

    .line 53
    .line 54
    iget v0, p0, Ll/wej;->programHandle:I

    .line 55
    .line 56
    const-string v1, "frequencyRangeBlur"

    .line 57
    .line 58
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    iput v0, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;->freqRangeBlurHandle:I

    .line 63
    .line 64
    return-void
.end method

.method public declared-synchronized newTextureReady(ILl/gfj;Z)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    invoke-virtual {p0, v0}, Ll/wej;->setWidth(I)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-virtual {p0, v0}, Ll/wej;->setHeight(I)V

    .line 14
    .line 15
    .line 16
    invoke-super {p0, p1, p2, p3}, Ll/hs10;->newTextureReady(ILl/gfj;Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    .line 18
    .line 19
    monitor-exit p0

    .line 20
    return-void

    .line 21
    :catchall_0
    move-exception p1

    .line 22
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 23
    throw p1
.end method

.method public passShaderValues()V
    .locals 5

    .line 1
    invoke-super {p0}, Ll/hs10;->passShaderValues()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    int-to-float v0, v0

    .line 9
    const/high16 v1, 0x3f800000    # 1.0f

    .line 10
    .line 11
    div-float v0, v1, v0

    .line 12
    .line 13
    iput v0, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;->widthOffset:F

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    int-to-float v0, v0

    .line 20
    div-float v0, v1, v0

    .line 21
    .line 22
    iput v0, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;->heightOffset:F

    .line 23
    .line 24
    iget-object v0, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;->mmcvInfo:Ll/omw;

    .line 25
    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    invoke-virtual {v0}, Ll/omw;->n()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-lez v0, :cond_0

    .line 33
    .line 34
    iget v0, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;->bgBlur:F

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    iget v0, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;->smoothLevel:F

    .line 38
    .line 39
    :goto_0
    iget v2, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;->blurAlphaHandle:I

    .line 40
    .line 41
    const/4 v3, 0x0

    .line 42
    invoke-static {v2, v0, v3, v3}, Landroid/opengl/GLES20;->glUniform3f(IFFF)V

    .line 43
    .line 44
    .line 45
    iget v0, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;->widthOffsetHandle:I

    .line 46
    .line 47
    iget v2, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;->widthOffset:F

    .line 48
    .line 49
    invoke-static {v0, v2}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 50
    .line 51
    .line 52
    iget v0, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;->heightOffsetHandle:I

    .line 53
    .line 54
    iget v2, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;->heightOffset:F

    .line 55
    .line 56
    invoke-static {v0, v2}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 57
    .line 58
    .line 59
    iget v0, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;->sharpenHandle:I

    .line 60
    .line 61
    const v2, 0x3e4ccccd    # 0.2f

    .line 62
    .line 63
    .line 64
    invoke-static {v0, v2}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 65
    .line 66
    .line 67
    iget v0, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;->freqRangeValueHandle:I

    .line 68
    .line 69
    const/high16 v3, 0x3f000000    # 0.5f

    .line 70
    .line 71
    const v4, 0x3f666666    # 0.9f

    .line 72
    .line 73
    .line 74
    invoke-static {v0, v2, v3, v4, v4}, Landroid/opengl/GLES20;->glUniform4f(IFFFF)V

    .line 75
    .line 76
    .line 77
    iget p0, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;->freqRangeBlurHandle:I

    .line 78
    .line 79
    const v0, 0x3da3d70a    # 0.08f

    .line 80
    .line 81
    .line 82
    invoke-static {p0, v1, v4, v3, v0}, Landroid/opengl/GLES20;->glUniform4f(IFFFF)V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public setMMCVInfo(Ll/omw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;->mmcvInfo:Ll/omw;

    .line 2
    .line 3
    return-void
.end method

.method public setSmoothLevel(F)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/gfj;->getLockObject()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    iput p1, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;->smoothLevel:F

    .line 7
    .line 8
    const v1, 0x3e99999a    # 0.3f

    .line 9
    .line 10
    .line 11
    invoke-static {p1, v1}, Ljava/lang/Math;->min(FF)F

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    iput p1, p0, Lcom/momo/mcamera/mask/lightskin/LightSkinSmoothFilter;->bgBlur:F

    .line 16
    .line 17
    monitor-exit v0

    .line 18
    return-void

    .line 19
    :catchall_0
    move-exception p0

    .line 20
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    throw p0
.end method
