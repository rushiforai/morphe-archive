.class public Ll/jfj;
.super Ll/gfj;
.source "SourceFile"

# interfaces
.implements Ll/dfj;


# instance fields
.field public a:Z

.field private b:F

.field private c:F

.field private d:I

.field private e:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/gfj;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/jfj;->a:Z

    .line 6
    .line 7
    return-void
.end method

.method private drawIndeed()V
    .locals 5

    .line 1
    iget v0, p0, Ll/wej;->texture_in:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    const/4 v2, 0x0

    .line 15
    invoke-static {v2, v2, v0, v1}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 16
    .line 17
    .line 18
    iget v0, p0, Ll/wej;->programHandle:I

    .line 19
    .line 20
    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 21
    .line 22
    .line 23
    const/16 v0, 0x4100

    .line 24
    .line 25
    invoke-static {v0}, Landroid/opengl/GLES20;->glClear(I)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Ll/wej;->getBackgroundRed()F

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    invoke-virtual {p0}, Ll/wej;->getBackgroundGreen()F

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    invoke-virtual {p0}, Ll/wej;->getBackgroundBlue()F

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    invoke-virtual {p0}, Ll/wej;->getBackgroundAlpha()F

    .line 41
    .line 42
    .line 43
    move-result v4

    .line 44
    invoke-static {v0, v1, v3, v4}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0}, Ll/jfj;->passShaderValues()V

    .line 48
    .line 49
    .line 50
    const/4 p0, 0x5

    .line 51
    const/4 v0, 0x4

    .line 52
    invoke-static {p0, v2, v0}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 53
    .line 54
    .line 55
    return-void
.end method


# virtual methods
.method public drawFrame()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/jfj;->initFBO()V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object v0, p0, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 21
    .line 22
    if-eqz v0, :cond_2

    .line 23
    .line 24
    invoke-virtual {v0}, Ll/lej;->h()[I

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    if-nez v0, :cond_2

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    invoke-virtual {p0}, Ll/jfj;->initFBO()V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    return-void

    .line 47
    :cond_2
    :goto_0
    iget-boolean v0, p0, Ll/gfj;->dirty:Z

    .line 48
    .line 49
    const/4 v1, 0x0

    .line 50
    if-eqz v0, :cond_3

    .line 51
    .line 52
    invoke-virtual {p0}, Ll/gfj;->lockRenderBuffer()V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 56
    .line 57
    invoke-virtual {v0}, Ll/lej;->h()[I

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    aget v0, v0, v1

    .line 62
    .line 63
    const v2, 0x8d40

    .line 64
    .line 65
    .line 66
    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0}, Ll/wej;->getBackgroundRed()F

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    invoke-virtual {p0}, Ll/wej;->getBackgroundGreen()F

    .line 74
    .line 75
    .line 76
    move-result v3

    .line 77
    invoke-virtual {p0}, Ll/wej;->getBackgroundBlue()F

    .line 78
    .line 79
    .line 80
    move-result v4

    .line 81
    invoke-virtual {p0}, Ll/wej;->getBackgroundAlpha()F

    .line 82
    .line 83
    .line 84
    move-result v5

    .line 85
    invoke-static {v0, v3, v4, v5}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 86
    .line 87
    .line 88
    const/16 v0, 0x4100

    .line 89
    .line 90
    invoke-static {v0}, Landroid/opengl/GLES20;->glClear(I)V

    .line 91
    .line 92
    .line 93
    invoke-direct {p0}, Ll/jfj;->drawIndeed()V

    .line 94
    .line 95
    .line 96
    invoke-static {v2, v1}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p0}, Ll/gfj;->unlockInputRenderBuffer()V

    .line 100
    .line 101
    .line 102
    const/4 v0, 0x1

    .line 103
    goto :goto_1

    .line 104
    :cond_3
    move v0, v1

    .line 105
    :goto_1
    iget-object v2, p0, Ll/gfj;->listLock:Ljava/lang/Object;

    .line 106
    .line 107
    monitor-enter v2

    .line 108
    :try_start_0
    iget-object v3, p0, Ll/gfj;->targets:Ljava/util/List;

    .line 109
    .line 110
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 111
    .line 112
    .line 113
    move-result-object v3

    .line 114
    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 115
    .line 116
    .line 117
    move-result v4

    .line 118
    if-eqz v4, :cond_4

    .line 119
    .line 120
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object v4

    .line 124
    check-cast v4, Ll/dfj;

    .line 125
    .line 126
    iget-object v5, p0, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 127
    .line 128
    invoke-virtual {v5}, Ll/lej;->i()[I

    .line 129
    .line 130
    .line 131
    move-result-object v5

    .line 132
    aget v5, v5, v1

    .line 133
    .line 134
    invoke-interface {v4, v5, p0, v0}, Ll/dfj;->newTextureReady(ILl/gfj;Z)V

    .line 135
    .line 136
    .line 137
    goto :goto_2

    .line 138
    :catchall_0
    move-exception p0

    .line 139
    goto :goto_3

    .line 140
    :cond_4
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 141
    invoke-virtual {p0}, Ll/gfj;->unlockRenderBuffer()V

    .line 142
    .line 143
    .line 144
    return-void

    .line 145
    :goto_3
    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 146
    throw p0
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nvarying vec2 textureCoordinate;\nvarying vec2 lefttopCoordinate;\nvarying vec2 rightbottomCoordinate; \nvarying vec2 righttopCoordinate;\nvarying vec2 leftbottomCoordinate;\nvoid main(){\nvec4 center = texture2D(inputImageTexture0,textureCoordinate); \nvec4 lt=texture2D(inputImageTexture0, clamp(lefttopCoordinate, 0.0, 1.0)); \nvec4 lb=texture2D(inputImageTexture0, clamp(leftbottomCoordinate, 0.0, 1.0)); \nvec4 rt=texture2D(inputImageTexture0, clamp(righttopCoordinate, 0.0, 1.0)); \nvec4 rb=texture2D(inputImageTexture0, clamp(rightbottomCoordinate, 0.0, 1.0)); \nvec4 l=texture2D(inputImageTexture0, clamp(vec2(lefttopCoordinate.x,textureCoordinate.y), 0.0, 1.0)); \nvec4 r=texture2D(inputImageTexture0, clamp(vec2(righttopCoordinate.x,textureCoordinate.y), 0.0, 1.0)); \nvec4 t=texture2D(inputImageTexture0, clamp(vec2(textureCoordinate.x, lefttopCoordinate.y), 0.0, 1.0)); \nvec4 b=texture2D(inputImageTexture0, clamp(vec2(textureCoordinate.x, rightbottomCoordinate.y), 0.0, 1.0)); \ngl_FragColor = clamp((center+lt+lb+rt+rb+l+t+b+r)/9.0, 0.0, 1.0); \n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public getVertexShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "attribute vec4 position;\nattribute vec2 inputTextureCoordinate;\nvarying vec2 textureCoordinate;\nuniform float imageWidthFactor; \nuniform float imageHeightFactor; \nvarying vec2 lefttopCoordinate;\nvarying vec2 rightbottomCoordinate; \nvarying vec2 righttopCoordinate;\nvarying vec2 leftbottomCoordinate;\nvoid main() {\n  textureCoordinate = inputTextureCoordinate;\nvec2 widthStep = vec2(imageWidthFactor, -imageHeightFactor);\nvec2 heightStep = vec2(imageWidthFactor, imageHeightFactor);\nlefttopCoordinate = inputTextureCoordinate.xy - widthStep;\nrightbottomCoordinate = inputTextureCoordinate.xy + widthStep;\nrighttopCoordinate = inputTextureCoordinate.xy + heightStep;\nleftbottomCoordinate = inputTextureCoordinate.xy - heightStep;\ngl_Position = position;\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public initFBO()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/lej;->e()V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-static {}, Ll/sej;->d()Ll/sej;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    invoke-virtual {v0, v1, v2}, Ll/sej;->c(II)Ll/lej;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iput-object v0, p0, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    invoke-virtual {v0, v1, v2}, Ll/lej;->b(II)V

    .line 35
    .line 36
    .line 37
    const v0, 0x8d40

    .line 38
    .line 39
    .line 40
    invoke-static {v0}, Landroid/opengl/GLES20;->glCheckFramebufferStatus(I)I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    const v1, 0x8cd5

    .line 45
    .line 46
    .line 47
    if-ne v0, v1, :cond_1

    .line 48
    .line 49
    return-void

    .line 50
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-static {}, Landroid/opengl/GLES20;->glGetError()I

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    invoke-static {v1, v0, p0}, Ll/muf;->a(Ljava/lang/StringBuilder;II)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public initShaderHandles()V
    .locals 2

    .line 1
    iget v0, p0, Ll/wej;->programHandle:I

    .line 2
    .line 3
    const-string v1, "inputImageTexture0"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iput v0, p0, Ll/wej;->textureHandle:I

    .line 10
    .line 11
    iget v0, p0, Ll/wej;->programHandle:I

    .line 12
    .line 13
    const-string v1, "position"

    .line 14
    .line 15
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iput v0, p0, Ll/wej;->positionHandle:I

    .line 20
    .line 21
    iget v0, p0, Ll/wej;->programHandle:I

    .line 22
    .line 23
    const-string v1, "inputTextureCoordinate"

    .line 24
    .line 25
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iput v0, p0, Ll/wej;->texCoordHandle:I

    .line 30
    .line 31
    iget v0, p0, Ll/wej;->programHandle:I

    .line 32
    .line 33
    const-string v1, "imageWidthFactor"

    .line 34
    .line 35
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    iput v0, p0, Ll/jfj;->d:I

    .line 40
    .line 41
    iget v0, p0, Ll/wej;->programHandle:I

    .line 42
    .line 43
    const-string v1, "imageHeightFactor"

    .line 44
    .line 45
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    iput v0, p0, Ll/jfj;->e:I

    .line 50
    .line 51
    return-void
.end method

.method public initWithGLContext()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/wej;->initWithGLContext()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public newTextureReady(ILl/gfj;Z)V
    .locals 0

    .line 1
    if-eqz p3, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/gfj;->markAsDirty()V

    .line 4
    .line 5
    .line 6
    :cond_0
    iput p1, p0, Ll/wej;->texture_in:I

    .line 7
    .line 8
    invoke-virtual {p2}, Ll/wej;->getWidth()I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    int-to-float p1, p1

    .line 13
    iput p1, p0, Ll/jfj;->b:F

    .line 14
    .line 15
    invoke-virtual {p2}, Ll/wej;->getHeight()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    int-to-float p1, p1

    .line 20
    iput p1, p0, Ll/jfj;->c:F

    .line 21
    .line 22
    invoke-virtual {p2}, Ll/wej;->getWidth()I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    invoke-virtual {p0, p1}, Ll/wej;->setWidth(I)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p2}, Ll/wej;->getHeight()I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    invoke-virtual {p0, p1}, Ll/wej;->setHeight(I)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ll/wej;->onDrawFrame()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public passShaderValues()V
    .locals 10

    .line 1
    iget-object v0, p0, Ll/wej;->renderVertices:Ljava/nio/FloatBuffer;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 5
    .line 6
    .line 7
    iget v0, p0, Ll/jfj;->e:I

    .line 8
    .line 9
    iget v2, p0, Ll/jfj;->b:F

    .line 10
    .line 11
    const/high16 v3, 0x3f800000    # 1.0f

    .line 12
    .line 13
    div-float v2, v3, v2

    .line 14
    .line 15
    invoke-static {v0, v2}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 16
    .line 17
    .line 18
    iget v0, p0, Ll/jfj;->d:I

    .line 19
    .line 20
    iget v2, p0, Ll/jfj;->c:F

    .line 21
    .line 22
    div-float/2addr v3, v2

    .line 23
    invoke-static {v0, v3}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 24
    .line 25
    .line 26
    iget v4, p0, Ll/wej;->positionHandle:I

    .line 27
    .line 28
    const/16 v8, 0x8

    .line 29
    .line 30
    iget-object v9, p0, Ll/wej;->renderVertices:Ljava/nio/FloatBuffer;

    .line 31
    .line 32
    const/4 v5, 0x2

    .line 33
    const/16 v6, 0x1406

    .line 34
    .line 35
    const/4 v7, 0x0

    .line 36
    invoke-static/range {v4 .. v9}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 37
    .line 38
    .line 39
    iget v0, p0, Ll/wej;->positionHandle:I

    .line 40
    .line 41
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 45
    .line 46
    iget v2, p0, Ll/wej;->curRotation:I

    .line 47
    .line 48
    aget-object v0, v0, v2

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 51
    .line 52
    .line 53
    iget v2, p0, Ll/wej;->texCoordHandle:I

    .line 54
    .line 55
    iget-object v0, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 56
    .line 57
    iget v3, p0, Ll/wej;->curRotation:I

    .line 58
    .line 59
    aget-object v7, v0, v3

    .line 60
    .line 61
    const/4 v3, 0x2

    .line 62
    const/16 v4, 0x1406

    .line 63
    .line 64
    const/4 v5, 0x0

    .line 65
    const/16 v6, 0x8

    .line 66
    .line 67
    invoke-static/range {v2 .. v7}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 68
    .line 69
    .line 70
    iget v0, p0, Ll/wej;->texCoordHandle:I

    .line 71
    .line 72
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 73
    .line 74
    .line 75
    const v0, 0x84c0

    .line 76
    .line 77
    .line 78
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 79
    .line 80
    .line 81
    const/16 v0, 0xde1

    .line 82
    .line 83
    iget v2, p0, Ll/wej;->texture_in:I

    .line 84
    .line 85
    invoke-static {v0, v2}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 86
    .line 87
    .line 88
    iget p0, p0, Ll/wej;->textureHandle:I

    .line 89
    .line 90
    invoke-static {p0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 91
    .line 92
    .line 93
    return-void
.end method
