.class public Ll/zej;
.super Ll/wej;
.source "SourceFile"

# interfaces
.implements Ll/dfj;


# instance fields
.field private a:F

.field private b:F

.field private c:F

.field private d:F

.field private e:Z

.field private f:I

.field private g:I

.field private i:I

.field private j:I

.field private k:[Ljava/nio/FloatBuffer;

.field private l:[F

.field private m:[F

.field private n:[F

.field private o:[F

.field private p:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/wej;-><init>()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x3f800000    # 1.0f

    .line 5
    .line 6
    iput v0, p0, Ll/zej;->b:F

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Ll/zej;->e:Z

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput v0, p0, Ll/zej;->j:I

    .line 13
    .line 14
    iput-boolean v0, p0, Ll/zej;->p:Z

    .line 15
    .line 16
    return-void
.end method

.method private Q1(II)V
    .locals 2

    .line 1
    int-to-float p1, p1

    .line 2
    const/high16 v0, 0x3f800000    # 1.0f

    .line 3
    .line 4
    mul-float/2addr p1, v0

    .line 5
    iget v1, p0, Ll/zej;->c:F

    .line 6
    .line 7
    div-float/2addr p1, v1

    .line 8
    int-to-float p2, p2

    .line 9
    mul-float/2addr p2, v0

    .line 10
    iget v0, p0, Ll/zej;->d:F

    .line 11
    .line 12
    div-float/2addr p2, v0

    .line 13
    const/high16 v0, 0x3f000000    # 0.5f

    .line 14
    .line 15
    cmpg-float p1, p1, v0

    .line 16
    .line 17
    if-gtz p1, :cond_0

    .line 18
    .line 19
    cmpg-float p1, p2, v0

    .line 20
    .line 21
    if-gtz p1, :cond_0

    .line 22
    .line 23
    const/4 p1, 0x2

    .line 24
    iput p1, p0, Ll/zej;->j:I

    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    const/4 p1, 0x0

    .line 28
    iput p1, p0, Ll/zej;->j:I

    .line 29
    .line 30
    return-void
.end method

.method private R1(F)V
    .locals 7

    .line 1
    iget v0, p0, Ll/zej;->d:F

    .line 2
    .line 3
    div-float v1, v0, p1

    .line 4
    .line 5
    float-to-int v1, v1

    .line 6
    iget v2, p0, Ll/zej;->c:F

    .line 7
    .line 8
    mul-float/2addr p1, v2

    .line 9
    float-to-int p1, p1

    .line 10
    int-to-float v1, v1

    .line 11
    cmpg-float v3, v1, v2

    .line 12
    .line 13
    const/4 v4, 0x0

    .line 14
    const/high16 v5, 0x3f000000    # 0.5f

    .line 15
    .line 16
    const/high16 v6, 0x3f800000    # 1.0f

    .line 17
    .line 18
    if-gez v3, :cond_0

    .line 19
    .line 20
    sub-float p1, v2, v1

    .line 21
    .line 22
    mul-float/2addr p1, v5

    .line 23
    div-float/2addr p1, v2

    .line 24
    sub-float v0, v6, p1

    .line 25
    .line 26
    invoke-direct {p0, p1, v0, v4, v6}, Ll/zej;->S1(FFFF)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    int-to-float p1, p1

    .line 31
    sub-float p1, v0, p1

    .line 32
    .line 33
    mul-float/2addr p1, v5

    .line 34
    div-float/2addr p1, v0

    .line 35
    sub-float v0, v6, p1

    .line 36
    .line 37
    invoke-direct {p0, v4, v6, p1, v0}, Ll/zej;->S1(FFFF)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method private S1(FFFF)V
    .locals 11

    .line 1
    iget-boolean v0, p0, Ll/zej;->p:Z

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    const/4 v2, 0x1

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-array v0, v1, [Ljava/nio/FloatBuffer;

    .line 8
    .line 9
    iput-object v0, p0, Ll/zej;->k:[Ljava/nio/FloatBuffer;

    .line 10
    .line 11
    const/16 v0, 0x8

    .line 12
    .line 13
    new-array v3, v0, [F

    .line 14
    .line 15
    iput-object v3, p0, Ll/zej;->l:[F

    .line 16
    .line 17
    new-array v3, v0, [F

    .line 18
    .line 19
    iput-object v3, p0, Ll/zej;->m:[F

    .line 20
    .line 21
    new-array v3, v0, [F

    .line 22
    .line 23
    iput-object v3, p0, Ll/zej;->n:[F

    .line 24
    .line 25
    new-array v0, v0, [F

    .line 26
    .line 27
    iput-object v0, p0, Ll/zej;->o:[F

    .line 28
    .line 29
    iput-boolean v2, p0, Ll/zej;->p:Z

    .line 30
    .line 31
    :cond_0
    iget-boolean v0, p0, Ll/zej;->p:Z

    .line 32
    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    iget-object v0, p0, Ll/zej;->l:[F

    .line 36
    .line 37
    const/4 v3, 0x0

    .line 38
    aput p1, v0, v3

    .line 39
    .line 40
    aput p3, v0, v2

    .line 41
    .line 42
    const/4 v4, 0x2

    .line 43
    aput p2, v0, v4

    .line 44
    .line 45
    const/4 v5, 0x3

    .line 46
    aput p3, v0, v5

    .line 47
    .line 48
    aput p1, v0, v1

    .line 49
    .line 50
    const/4 v6, 0x5

    .line 51
    aput p4, v0, v6

    .line 52
    .line 53
    const/4 v7, 0x6

    .line 54
    aput p2, v0, v7

    .line 55
    .line 56
    const/4 v8, 0x7

    .line 57
    aput p4, v0, v8

    .line 58
    .line 59
    iget-object v9, p0, Ll/zej;->k:[Ljava/nio/FloatBuffer;

    .line 60
    .line 61
    aget-object v10, v9, v3

    .line 62
    .line 63
    invoke-static {v10, v0}, Ll/ch3;->a(Ljava/nio/FloatBuffer;[F)Ljava/nio/FloatBuffer;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    aput-object v0, v9, v3

    .line 68
    .line 69
    iget-object v0, p0, Ll/zej;->m:[F

    .line 70
    .line 71
    aput p1, v0, v3

    .line 72
    .line 73
    aput p4, v0, v2

    .line 74
    .line 75
    aput p1, v0, v4

    .line 76
    .line 77
    aput p3, v0, v5

    .line 78
    .line 79
    aput p2, v0, v1

    .line 80
    .line 81
    aput p4, v0, v6

    .line 82
    .line 83
    aput p2, v0, v7

    .line 84
    .line 85
    aput p3, v0, v8

    .line 86
    .line 87
    iget-object v9, p0, Ll/zej;->k:[Ljava/nio/FloatBuffer;

    .line 88
    .line 89
    aget-object v10, v9, v2

    .line 90
    .line 91
    invoke-static {v10, v0}, Ll/ch3;->a(Ljava/nio/FloatBuffer;[F)Ljava/nio/FloatBuffer;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    aput-object v0, v9, v2

    .line 96
    .line 97
    iget-object v0, p0, Ll/zej;->n:[F

    .line 98
    .line 99
    aput p2, v0, v3

    .line 100
    .line 101
    aput p4, v0, v2

    .line 102
    .line 103
    aput p1, v0, v4

    .line 104
    .line 105
    aput p4, v0, v5

    .line 106
    .line 107
    aput p2, v0, v1

    .line 108
    .line 109
    aput p3, v0, v6

    .line 110
    .line 111
    aput p1, v0, v7

    .line 112
    .line 113
    aput p3, v0, v8

    .line 114
    .line 115
    iget-object v9, p0, Ll/zej;->k:[Ljava/nio/FloatBuffer;

    .line 116
    .line 117
    aget-object v10, v9, v4

    .line 118
    .line 119
    invoke-static {v10, v0}, Ll/ch3;->a(Ljava/nio/FloatBuffer;[F)Ljava/nio/FloatBuffer;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    aput-object v0, v9, v4

    .line 124
    .line 125
    iget-object v0, p0, Ll/zej;->o:[F

    .line 126
    .line 127
    aput p2, v0, v3

    .line 128
    .line 129
    aput p3, v0, v2

    .line 130
    .line 131
    aput p2, v0, v4

    .line 132
    .line 133
    aput p4, v0, v5

    .line 134
    .line 135
    aput p1, v0, v1

    .line 136
    .line 137
    aput p3, v0, v6

    .line 138
    .line 139
    aput p1, v0, v7

    .line 140
    .line 141
    aput p4, v0, v8

    .line 142
    .line 143
    iget-object p0, p0, Ll/zej;->k:[Ljava/nio/FloatBuffer;

    .line 144
    .line 145
    aget-object p1, p0, v5

    .line 146
    .line 147
    invoke-static {p1, v0}, Ll/ch3;->a(Ljava/nio/FloatBuffer;[F)Ljava/nio/FloatBuffer;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    aput-object p1, p0, v5

    .line 152
    .line 153
    :cond_1
    return-void
.end method


# virtual methods
.method public T1(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/zej;->e:Z

    .line 2
    .line 3
    return-void
.end method

.method public U1(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/zej;->b:F

    .line 2
    .line 3
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/wej;->destroy()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public drawFrame()V
    .locals 5

    .line 1
    iget v0, p0, Ll/wej;->texture_in:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_1

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
    invoke-direct {p0, v0, v1}, Ll/zej;->Q1(II)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    int-to-float v0, v0

    .line 22
    const/high16 v1, 0x3f800000    # 1.0f

    .line 23
    .line 24
    mul-float/2addr v0, v1

    .line 25
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    int-to-float v2, v2

    .line 30
    div-float/2addr v0, v2

    .line 31
    iget v2, p0, Ll/zej;->a:F

    .line 32
    .line 33
    cmpl-float v0, v0, v2

    .line 34
    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    int-to-float v0, v0

    .line 42
    mul-float/2addr v0, v1

    .line 43
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    int-to-float v1, v1

    .line 48
    div-float/2addr v0, v1

    .line 49
    invoke-direct {p0, v0}, Ll/zej;->R1(F)V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    const/4 v0, 0x0

    .line 54
    invoke-direct {p0, v0, v1, v0, v1}, Ll/zej;->S1(FFFF)V

    .line 55
    .line 56
    .line 57
    :goto_0
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    const/4 v2, 0x0

    .line 66
    invoke-static {v2, v2, v0, v1}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 67
    .line 68
    .line 69
    iget v0, p0, Ll/wej;->programHandle:I

    .line 70
    .line 71
    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0}, Ll/wej;->getBackgroundRed()F

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    invoke-virtual {p0}, Ll/wej;->getBackgroundGreen()F

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    invoke-virtual {p0}, Ll/wej;->getBackgroundBlue()F

    .line 83
    .line 84
    .line 85
    move-result v3

    .line 86
    invoke-virtual {p0}, Ll/wej;->getBackgroundAlpha()F

    .line 87
    .line 88
    .line 89
    move-result v4

    .line 90
    invoke-static {v0, v1, v3, v4}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 91
    .line 92
    .line 93
    const/16 v0, 0x4100

    .line 94
    .line 95
    invoke-static {v0}, Landroid/opengl/GLES20;->glClear(I)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p0}, Ll/zej;->passShaderValues()V

    .line 99
    .line 100
    .line 101
    const/4 v0, 0x5

    .line 102
    const/4 v1, 0x4

    .line 103
    invoke-static {v0, v2, v1}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 104
    .line 105
    .line 106
    iget-boolean p0, p0, Ll/zej;->e:Z

    .line 107
    .line 108
    if-eqz p0, :cond_2

    .line 109
    .line 110
    invoke-static {}, Landroid/opengl/GLES20;->glFinish()V

    .line 111
    .line 112
    .line 113
    :cond_2
    :goto_1
    return-void
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nvarying vec2 textureCoordinate;\nvarying vec2 xy_step;\nvarying float smooth; \nvoid main(){\nvec2 point = textureCoordinate; \nvec4 image_c = texture2D(inputImageTexture0,point); \nvec4 image = image_c;\nif (smooth >= 0.1) { \nvec4 image_lt=texture2D(inputImageTexture0, clamp(point+vec2(-xy_step.x,  xy_step.y), 0.0, 1.0)); \nvec4 image_lb=texture2D(inputImageTexture0, clamp(point+vec2(-xy_step.x, -xy_step.y), 0.0, 1.0)); \nvec4 image_rt=texture2D(inputImageTexture0, clamp(point+vec2( xy_step.x,  xy_step.y), 0.0, 1.0)); \nvec4 image_rb=texture2D(inputImageTexture0, clamp(point+vec2( xy_step.x, -xy_step.y), 0.0, 1.0)); \nvec4 image_l =texture2D(inputImageTexture0, clamp(point+vec2(-xy_step.x,     0.0), 0.0, 1.0)); \nvec4 image_r =texture2D(inputImageTexture0, clamp(point+vec2( xy_step.x,     0.0), 0.0, 1.0)); \nvec4 image_t =texture2D(inputImageTexture0, clamp(point+vec2(    0.0,  xy_step.y), 0.0, 1.0)); \nvec4 image_b =texture2D(inputImageTexture0, clamp(point+vec2(    0.0, -xy_step.y), 0.0, 1.0)); \nimage = clamp(image_c*0.25+(image_lt+image_lb+image_rt+image_rb)*0.125+(image_l+image_t+image_b+image_r)*0.0625, 0.0, 1.0); \n} \ngl_FragColor = image;\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public getVertexShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "attribute vec4 position;\nattribute vec2 inputTextureCoordinate;\nvarying vec2 textureCoordinate;\nuniform float widthStep; \nuniform float heightStep; \nuniform float smoothMode; \nvarying float smooth; \nvarying vec2 xy_step;\nvoid main() {\nsmooth = smoothMode; \n  textureCoordinate = inputTextureCoordinate;\nxy_step = vec2(widthStep, heightStep);\ngl_Position = position;\n}\n"

    .line 2
    .line 3
    return-object p0
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
    const-string v1, "widthStep"

    .line 34
    .line 35
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    iput v0, p0, Ll/zej;->f:I

    .line 40
    .line 41
    iget v0, p0, Ll/wej;->programHandle:I

    .line 42
    .line 43
    const-string v1, "heightStep"

    .line 44
    .line 45
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    iput v0, p0, Ll/zej;->g:I

    .line 50
    .line 51
    iget v0, p0, Ll/wej;->programHandle:I

    .line 52
    .line 53
    const-string v1, "smoothMode"

    .line 54
    .line 55
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    iput v0, p0, Ll/zej;->i:I

    .line 60
    .line 61
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
    .locals 1

    .line 1
    iput p1, p0, Ll/wej;->texture_in:I

    .line 2
    .line 3
    invoke-virtual {p2}, Ll/wej;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-virtual {p0, p1}, Ll/wej;->setWidth(I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p2}, Ll/wej;->getHeight()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    invoke-virtual {p0, p1}, Ll/wej;->setHeight(I)V

    .line 15
    .line 16
    .line 17
    iget p1, p0, Ll/wej;->curRotation:I

    .line 18
    .line 19
    rem-int/lit8 p1, p1, 0x2

    .line 20
    .line 21
    const/4 p3, 0x1

    .line 22
    if-ne p1, p3, :cond_0

    .line 23
    .line 24
    invoke-virtual {p2}, Ll/wej;->getHeight()I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    int-to-float p1, p1

    .line 29
    iput p1, p0, Ll/zej;->c:F

    .line 30
    .line 31
    invoke-virtual {p2}, Ll/wej;->getWidth()I

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    int-to-float p1, p1

    .line 36
    iput p1, p0, Ll/zej;->d:F

    .line 37
    .line 38
    invoke-virtual {p2}, Ll/wej;->getWidth()I

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    int-to-float p1, p1

    .line 43
    invoke-virtual {p2}, Ll/wej;->getHeight()I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    int-to-float v0, v0

    .line 48
    div-float/2addr p1, v0

    .line 49
    iput p1, p0, Ll/zej;->a:F

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    invoke-virtual {p2}, Ll/wej;->getWidth()I

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    int-to-float p1, p1

    .line 57
    iput p1, p0, Ll/zej;->c:F

    .line 58
    .line 59
    invoke-virtual {p2}, Ll/wej;->getHeight()I

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    int-to-float p1, p1

    .line 64
    iput p1, p0, Ll/zej;->d:F

    .line 65
    .line 66
    invoke-virtual {p2}, Ll/wej;->getHeight()I

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    int-to-float p1, p1

    .line 71
    invoke-virtual {p2}, Ll/wej;->getWidth()I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    int-to-float v0, v0

    .line 76
    div-float/2addr p1, v0

    .line 77
    iput p1, p0, Ll/zej;->a:F

    .line 78
    .line 79
    :goto_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    const-class v0, Ll/zej;

    .line 84
    .line 85
    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    if-eqz p1, :cond_1

    .line 90
    .line 91
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    invoke-virtual {p1}, Ll/u6y;->O()V

    .line 96
    .line 97
    .line 98
    :cond_1
    invoke-virtual {p0}, Ll/wej;->onDrawFrame()V

    .line 99
    .line 100
    .line 101
    iget-object p0, p2, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 102
    .line 103
    if-eqz p0, :cond_2

    .line 104
    .line 105
    iget p1, p0, Ll/lej;->h:I

    .line 106
    .line 107
    sub-int/2addr p1, p3

    .line 108
    iput p1, p0, Ll/lej;->h:I

    .line 109
    .line 110
    :cond_2
    invoke-virtual {p2}, Ll/gfj;->unlockRenderBuffer()V

    .line 111
    .line 112
    .line 113
    return-void
.end method

.method public passShaderValues()V
    .locals 9

    .line 1
    iget v0, p0, Ll/wej;->curRotation:I

    .line 2
    .line 3
    iget-object v1, p0, Ll/wej;->renderVertices:Ljava/nio/FloatBuffer;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-virtual {v1, v2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 7
    .line 8
    .line 9
    iget v1, p0, Ll/zej;->c:F

    .line 10
    .line 11
    const/high16 v3, 0x3f800000    # 1.0f

    .line 12
    .line 13
    div-float v1, v3, v1

    .line 14
    .line 15
    iget v4, p0, Ll/zej;->d:F

    .line 16
    .line 17
    div-float/2addr v3, v4

    .line 18
    iget v4, p0, Ll/zej;->f:I

    .line 19
    .line 20
    invoke-static {v4, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 21
    .line 22
    .line 23
    iget v1, p0, Ll/zej;->g:I

    .line 24
    .line 25
    invoke-static {v1, v3}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 26
    .line 27
    .line 28
    iget v1, p0, Ll/zej;->i:I

    .line 29
    .line 30
    iget v3, p0, Ll/zej;->j:I

    .line 31
    .line 32
    int-to-float v3, v3

    .line 33
    const/high16 v4, 0x41200000    # 10.0f

    .line 34
    .line 35
    div-float/2addr v3, v4

    .line 36
    invoke-static {v1, v3}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 37
    .line 38
    .line 39
    rem-int/lit8 v0, v0, 0x4

    .line 40
    .line 41
    iget v3, p0, Ll/wej;->positionHandle:I

    .line 42
    .line 43
    const/16 v7, 0x8

    .line 44
    .line 45
    iget-object v8, p0, Ll/wej;->renderVertices:Ljava/nio/FloatBuffer;

    .line 46
    .line 47
    const/4 v4, 0x2

    .line 48
    const/16 v5, 0x1406

    .line 49
    .line 50
    const/4 v6, 0x0

    .line 51
    invoke-static/range {v3 .. v8}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 52
    .line 53
    .line 54
    iget v1, p0, Ll/wej;->positionHandle:I

    .line 55
    .line 56
    invoke-static {v1}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 57
    .line 58
    .line 59
    iget-object v1, p0, Ll/zej;->k:[Ljava/nio/FloatBuffer;

    .line 60
    .line 61
    aget-object v1, v1, v0

    .line 62
    .line 63
    invoke-virtual {v1, v2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 64
    .line 65
    .line 66
    iget v3, p0, Ll/wej;->texCoordHandle:I

    .line 67
    .line 68
    iget-object v1, p0, Ll/zej;->k:[Ljava/nio/FloatBuffer;

    .line 69
    .line 70
    aget-object v8, v1, v0

    .line 71
    .line 72
    invoke-static/range {v3 .. v8}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 73
    .line 74
    .line 75
    iget v0, p0, Ll/wej;->texCoordHandle:I

    .line 76
    .line 77
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 78
    .line 79
    .line 80
    const v0, 0x84c0

    .line 81
    .line 82
    .line 83
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 84
    .line 85
    .line 86
    const/16 v0, 0xde1

    .line 87
    .line 88
    iget v1, p0, Ll/wej;->texture_in:I

    .line 89
    .line 90
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 91
    .line 92
    .line 93
    iget p0, p0, Ll/wej;->textureHandle:I

    .line 94
    .line 95
    invoke-static {p0, v2}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 96
    .line 97
    .line 98
    return-void
.end method

.method public setRenderSize(II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Ll/wej;->setRenderSize(II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
