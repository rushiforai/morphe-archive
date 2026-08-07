.class public Ll/vti0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:[F

.field public b:Ljava/nio/FloatBuffer;

.field public c:Ljava/nio/FloatBuffer;

.field public d:[F

.field public e:[F

.field public f:I

.field public g:I

.field public h:I

.field public i:I

.field public j:I

.field public k:I

.field public l:I


# direct methods
.method public constructor <init>(I)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x8

    .line 5
    .line 6
    new-array v0, v0, [F

    .line 7
    .line 8
    fill-array-data v0, :array_0

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/vti0;->a:[F

    .line 12
    .line 13
    const/16 v1, 0x10

    .line 14
    .line 15
    new-array v2, v1, [F

    .line 16
    .line 17
    iput-object v2, p0, Ll/vti0;->d:[F

    .line 18
    .line 19
    new-array v1, v1, [F

    .line 20
    .line 21
    iput-object v1, p0, Ll/vti0;->e:[F

    .line 22
    .line 23
    const/16 v2, -0x3039

    .line 24
    .line 25
    iput v2, p0, Ll/vti0;->g:I

    .line 26
    .line 27
    iput p1, p0, Ll/vti0;->l:I

    .line 28
    .line 29
    const/4 p1, 0x0

    .line 30
    invoke-static {v1, p1}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    .line 31
    .line 32
    .line 33
    array-length v1, v0

    .line 34
    mul-int/lit8 v1, v1, 0x4

    .line 35
    .line 36
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    iput-object v1, p0, Ll/vti0;->b:Ljava/nio/FloatBuffer;

    .line 53
    .line 54
    invoke-virtual {v1, v0}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {v1, p1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 59
    .line 60
    .line 61
    array-length p1, v0

    .line 62
    mul-int/lit8 p1, p1, 0x4

    .line 63
    .line 64
    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    iput-object p1, p0, Ll/vti0;->c:Ljava/nio/FloatBuffer;

    .line 81
    .line 82
    return-void

    .line 83
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
.end method


# virtual methods
.method public a(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {}, Landroid/opengl/GLES20;->glGetError()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const-string v0, ": glError "

    .line 9
    .line 10
    invoke-static {p1, v0, p0}, Ll/y3k;->a(Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final b(Ljava/lang/String;Ljava/lang/String;)I
    .locals 3

    .line 1
    const v0, 0x8b31

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0, p1}, Ll/vti0;->f(ILjava/lang/String;)I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    const/4 v0, 0x0

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    return v0

    .line 12
    :cond_0
    const v1, 0x8b30

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v1, p2}, Ll/vti0;->f(ILjava/lang/String;)I

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    if-nez p2, :cond_1

    .line 20
    .line 21
    return v0

    .line 22
    :cond_1
    invoke-static {}, Landroid/opengl/GLES20;->glCreateProgram()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    const-string v2, "glCreateProgram"

    .line 27
    .line 28
    invoke-virtual {p0, v2}, Ll/vti0;->a(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    if-nez v1, :cond_2

    .line 32
    .line 33
    return v0

    .line 34
    :cond_2
    invoke-static {v1, p1}, Landroid/opengl/GLES20;->glAttachShader(II)V

    .line 35
    .line 36
    .line 37
    const-string p1, "glAttachShader"

    .line 38
    .line 39
    invoke-virtual {p0, p1}, Ll/vti0;->a(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-static {v1, p2}, Landroid/opengl/GLES20;->glAttachShader(II)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, p1}, Ll/vti0;->a(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-static {v1}, Landroid/opengl/GLES20;->glLinkProgram(I)V

    .line 49
    .line 50
    .line 51
    const/4 p0, 0x1

    .line 52
    new-array p1, p0, [I

    .line 53
    .line 54
    const p2, 0x8b82

    .line 55
    .line 56
    .line 57
    invoke-static {v1, p2, p1, v0}, Landroid/opengl/GLES20;->glGetProgramiv(II[II)V

    .line 58
    .line 59
    .line 60
    aget p1, p1, v0

    .line 61
    .line 62
    if-eq p1, p0, :cond_3

    .line 63
    .line 64
    invoke-static {v1}, Landroid/opengl/GLES20;->glDeleteProgram(I)V

    .line 65
    .line 66
    .line 67
    return v0

    .line 68
    :cond_3
    return v1
.end method

.method public c(Landroid/graphics/SurfaceTexture;Z)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/vti0;->e:[F

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/graphics/SurfaceTexture;->getTransformMatrix([F)V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x5

    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    iget-object p2, p0, Ll/vti0;->e:[F

    .line 10
    .line 11
    aget v0, p2, p1

    .line 12
    .line 13
    neg-float v0, v0

    .line 14
    aput v0, p2, p1

    .line 15
    .line 16
    const/high16 v0, 0x3f800000    # 1.0f

    .line 17
    .line 18
    const/16 v1, 0xd

    .line 19
    .line 20
    aget v2, p2, v1

    .line 21
    .line 22
    sub-float/2addr v0, v2

    .line 23
    aput v0, p2, v1

    .line 24
    .line 25
    :cond_0
    iget p2, p0, Ll/vti0;->f:I

    .line 26
    .line 27
    invoke-static {p2}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 28
    .line 29
    .line 30
    const p2, 0x84c0

    .line 31
    .line 32
    .line 33
    invoke-static {p2}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 34
    .line 35
    .line 36
    const p2, 0x8d65

    .line 37
    .line 38
    .line 39
    iget v0, p0, Ll/vti0;->g:I

    .line 40
    .line 41
    invoke-static {p2, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 42
    .line 43
    .line 44
    iget-object p2, p0, Ll/vti0;->b:Ljava/nio/FloatBuffer;

    .line 45
    .line 46
    const/4 v0, 0x0

    .line 47
    invoke-virtual {p2, v0}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 48
    .line 49
    .line 50
    iget v1, p0, Ll/vti0;->j:I

    .line 51
    .line 52
    const/4 v5, 0x0

    .line 53
    iget-object v6, p0, Ll/vti0;->b:Ljava/nio/FloatBuffer;

    .line 54
    .line 55
    const/4 v2, 0x2

    .line 56
    const/16 v3, 0x1406

    .line 57
    .line 58
    const/4 v4, 0x0

    .line 59
    invoke-static/range {v1 .. v6}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 60
    .line 61
    .line 62
    iget p2, p0, Ll/vti0;->j:I

    .line 63
    .line 64
    invoke-static {p2}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 65
    .line 66
    .line 67
    iget-object p2, p0, Ll/vti0;->c:Ljava/nio/FloatBuffer;

    .line 68
    .line 69
    invoke-virtual {p2, v0}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 70
    .line 71
    .line 72
    iget v1, p0, Ll/vti0;->k:I

    .line 73
    .line 74
    iget-object v6, p0, Ll/vti0;->c:Ljava/nio/FloatBuffer;

    .line 75
    .line 76
    invoke-static/range {v1 .. v6}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 77
    .line 78
    .line 79
    iget p2, p0, Ll/vti0;->k:I

    .line 80
    .line 81
    invoke-static {p2}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 82
    .line 83
    .line 84
    iget p2, p0, Ll/vti0;->i:I

    .line 85
    .line 86
    iget-object v1, p0, Ll/vti0;->e:[F

    .line 87
    .line 88
    const/4 v2, 0x1

    .line 89
    invoke-static {p2, v2, v0, v1, v0}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    .line 90
    .line 91
    .line 92
    iget p2, p0, Ll/vti0;->h:I

    .line 93
    .line 94
    iget-object p0, p0, Ll/vti0;->d:[F

    .line 95
    .line 96
    invoke-static {p2, v2, v0, p0, v0}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    .line 97
    .line 98
    .line 99
    const/4 p0, 0x4

    .line 100
    invoke-static {p1, v0, p0}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method public d()I
    .locals 0

    .line 1
    iget p0, p0, Ll/vti0;->g:I

    .line 2
    .line 3
    return p0
.end method

.method public e(ZFI)V
    .locals 12

    .line 1
    const/16 v0, 0x5a

    .line 2
    .line 3
    const/4 v1, 0x7

    .line 4
    const/4 v2, 0x6

    .line 5
    const/4 v3, 0x5

    .line 6
    const/4 v4, 0x4

    .line 7
    const/4 v5, 0x3

    .line 8
    const/4 v6, 0x2

    .line 9
    const/4 v7, 0x1

    .line 10
    const/16 v8, 0x8

    .line 11
    .line 12
    const/4 v9, 0x0

    .line 13
    const/high16 v10, 0x3f800000    # 1.0f

    .line 14
    .line 15
    const/4 v11, 0x0

    .line 16
    if-eq p3, v0, :cond_1

    .line 17
    .line 18
    const/16 v0, 0x10e

    .line 19
    .line 20
    if-eq p3, v0, :cond_1

    .line 21
    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    add-float p1, p2, v11

    .line 26
    .line 27
    sub-float p2, v10, p2

    .line 28
    .line 29
    new-array p3, v8, [F

    .line 30
    .line 31
    aput p1, p3, v9

    .line 32
    .line 33
    aput v11, p3, v7

    .line 34
    .line 35
    aput p2, p3, v6

    .line 36
    .line 37
    aput v11, p3, v5

    .line 38
    .line 39
    aput p1, p3, v4

    .line 40
    .line 41
    aput v10, p3, v3

    .line 42
    .line 43
    aput p2, p3, v2

    .line 44
    .line 45
    aput v10, p3, v1

    .line 46
    .line 47
    iget-object p0, p0, Ll/vti0;->c:Ljava/nio/FloatBuffer;

    .line 48
    .line 49
    invoke-virtual {p0, p3}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p0, v9}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_1
    :goto_0
    add-float p1, p2, v11

    .line 58
    .line 59
    sub-float p2, v10, p2

    .line 60
    .line 61
    new-array p3, v8, [F

    .line 62
    .line 63
    aput v11, p3, v9

    .line 64
    .line 65
    aput p1, p3, v7

    .line 66
    .line 67
    aput v10, p3, v6

    .line 68
    .line 69
    aput p1, p3, v5

    .line 70
    .line 71
    aput v11, p3, v4

    .line 72
    .line 73
    aput p2, p3, v3

    .line 74
    .line 75
    aput v10, p3, v2

    .line 76
    .line 77
    aput p2, p3, v1

    .line 78
    .line 79
    iget-object p0, p0, Ll/vti0;->c:Ljava/nio/FloatBuffer;

    .line 80
    .line 81
    invoke-virtual {p0, p3}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-virtual {p0, v9}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public final f(ILjava/lang/String;)I
    .locals 3

    .line 1
    invoke-static {p1}, Landroid/opengl/GLES20;->glCreateShader(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v2, "glCreateShader type="

    .line 8
    .line 9
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p0, p1}, Ll/vti0;->a(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-static {v0, p2}, Landroid/opengl/GLES20;->glShaderSource(ILjava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v0}, Landroid/opengl/GLES20;->glCompileShader(I)V

    .line 26
    .line 27
    .line 28
    const/4 p0, 0x1

    .line 29
    new-array p0, p0, [I

    .line 30
    .line 31
    const p1, 0x8b81

    .line 32
    .line 33
    .line 34
    const/4 p2, 0x0

    .line 35
    invoke-static {v0, p1, p0, p2}, Landroid/opengl/GLES20;->glGetShaderiv(II[II)V

    .line 36
    .line 37
    .line 38
    aget p0, p0, p2

    .line 39
    .line 40
    if-nez p0, :cond_0

    .line 41
    .line 42
    invoke-static {v0}, Landroid/opengl/GLES20;->glDeleteShader(I)V

    .line 43
    .line 44
    .line 45
    return p2

    .line 46
    :cond_0
    return v0
.end method

.method public g()V
    .locals 7

    .line 1
    const-string v0, "uniform mat4 uMVPMatrix;\nuniform mat4 uSTMatrix;\nattribute vec4 aPosition;\nattribute vec4 aTextureCoord;\nvarying vec2 vTextureCoord;\nvoid main() {\n  gl_Position = uMVPMatrix * aPosition;\n  vTextureCoord = (uSTMatrix * aTextureCoord).xy;\n}\n"

    .line 2
    .line 3
    const-string v1, "#extension GL_OES_EGL_image_external : require\nprecision mediump float;\nvarying vec2 vTextureCoord;\nuniform samplerExternalOES sTexture;\nvoid main() {\n  gl_FragColor = texture2D(sTexture, vTextureCoord);\n}\n"

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1}, Ll/vti0;->b(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iput v0, p0, Ll/vti0;->f:I

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    const-string v1, "aPosition"

    .line 14
    .line 15
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iput v0, p0, Ll/vti0;->j:I

    .line 20
    .line 21
    iget v0, p0, Ll/vti0;->f:I

    .line 22
    .line 23
    const-string v1, "aTextureCoord"

    .line 24
    .line 25
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iput v0, p0, Ll/vti0;->k:I

    .line 30
    .line 31
    iget v0, p0, Ll/vti0;->f:I

    .line 32
    .line 33
    const-string v1, "uMVPMatrix"

    .line 34
    .line 35
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    iput v0, p0, Ll/vti0;->h:I

    .line 40
    .line 41
    iget v0, p0, Ll/vti0;->f:I

    .line 42
    .line 43
    const-string v1, "uSTMatrix"

    .line 44
    .line 45
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    iput v0, p0, Ll/vti0;->i:I

    .line 50
    .line 51
    const/4 v0, 0x1

    .line 52
    new-array v1, v0, [I

    .line 53
    .line 54
    const/4 v2, 0x0

    .line 55
    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 56
    .line 57
    .line 58
    aget v0, v1, v2

    .line 59
    .line 60
    iput v0, p0, Ll/vti0;->g:I

    .line 61
    .line 62
    const v1, 0x8d65

    .line 63
    .line 64
    .line 65
    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 66
    .line 67
    .line 68
    const-string v0, "glBindTexture mTextureID"

    .line 69
    .line 70
    invoke-virtual {p0, v0}, Ll/vti0;->a(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    const/16 v0, 0x2801

    .line 74
    .line 75
    const v3, 0x46180400    # 9729.0f

    .line 76
    .line 77
    .line 78
    invoke-static {v1, v0, v3}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 79
    .line 80
    .line 81
    const/16 v0, 0x2800

    .line 82
    .line 83
    invoke-static {v1, v0, v3}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 84
    .line 85
    .line 86
    const/16 v0, 0x2802

    .line 87
    .line 88
    const v3, 0x812f

    .line 89
    .line 90
    .line 91
    invoke-static {v1, v0, v3}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 92
    .line 93
    .line 94
    const/16 v0, 0x2803

    .line 95
    .line 96
    invoke-static {v1, v0, v3}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 97
    .line 98
    .line 99
    const-string v0, "glTexParameter"

    .line 100
    .line 101
    invoke-virtual {p0, v0}, Ll/vti0;->a(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    iget-object v0, p0, Ll/vti0;->d:[F

    .line 105
    .line 106
    invoke-static {v0, v2}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    .line 107
    .line 108
    .line 109
    iget v0, p0, Ll/vti0;->l:I

    .line 110
    .line 111
    if-eqz v0, :cond_0

    .line 112
    .line 113
    iget-object v1, p0, Ll/vti0;->d:[F

    .line 114
    .line 115
    int-to-float v3, v0

    .line 116
    const/4 v5, 0x0

    .line 117
    const/high16 v6, 0x3f800000    # 1.0f

    .line 118
    .line 119
    const/4 v2, 0x0

    .line 120
    const/4 v4, 0x0

    .line 121
    invoke-static/range {v1 .. v6}, Landroid/opengl/Matrix;->rotateM([FIFFFF)V

    .line 122
    .line 123
    .line 124
    :cond_0
    return-void

    .line 125
    :cond_1
    const-string p0, "failed creating program"

    .line 126
    .line 127
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    return-void
.end method
