.class public abstract Ltv/danmaku/ijk/media/player/AbsIjkRender;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltv/danmaku/ijk/media/player/IjkFilter;


# static fields
.field private static final TAG:Ljava/lang/String; = "AbsIjkRender"


# instance fields
.field protected height:I

.field protected positionHandle:I

.field protected programHandle:I

.field protected renderVertices:Ljava/nio/FloatBuffer;

.field protected texCoordHandle:I

.field protected textureHandle:I

.field protected textureIn:I

.field protected textureVertices:Ljava/nio/FloatBuffer;

.field protected width:I


# direct methods
.method public constructor <init>()V
    .locals 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x8

    .line 5
    .line 6
    new-array v1, v0, [F

    .line 7
    .line 8
    fill-array-data v1, :array_0

    .line 9
    .line 10
    .line 11
    const/16 v2, 0x20

    .line 12
    .line 13
    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 18
    .line 19
    .line 20
    move-result-object v4

    .line 21
    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    iput-object v3, p0, Ltv/danmaku/ijk/media/player/AbsIjkRender;->renderVertices:Ljava/nio/FloatBuffer;

    .line 30
    .line 31
    invoke-virtual {v3, v1}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    const/4 v3, 0x0

    .line 36
    invoke-virtual {v1, v3}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 37
    .line 38
    .line 39
    new-array v0, v0, [F

    .line 40
    .line 41
    fill-array-data v0, :array_1

    .line 42
    .line 43
    .line 44
    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-virtual {v1, v0}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    iput-object v0, p0, Ltv/danmaku/ijk/media/player/AbsIjkRender;->textureVertices:Ljava/nio/FloatBuffer;

    .line 65
    .line 66
    invoke-virtual {v0, v3}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    nop

    .line 71
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

    .line 72
    .line 73
    .line 74
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

.method private createProgram(Ljava/lang/String;Ljava/lang/String;)I
    .locals 4

    .line 1
    const v0, 0x8b31

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, v0, p1}, Ltv/danmaku/ijk/media/player/AbsIjkRender;->loadShader(ILjava/lang/String;)I

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
    invoke-direct {p0, v1, p2}, Ltv/danmaku/ijk/media/player/AbsIjkRender;->loadShader(ILjava/lang/String;)I

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
    invoke-virtual {p0, v2}, Ltv/danmaku/ijk/media/player/AbsIjkRender;->checkGlError(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    const-string v2, "AbsIjkRender"

    .line 32
    .line 33
    if-nez v1, :cond_2

    .line 34
    .line 35
    const-string v3, "Could not create program"

    .line 36
    .line 37
    invoke-static {v2, v3}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    :cond_2
    invoke-static {v1, p1}, Landroid/opengl/GLES20;->glAttachShader(II)V

    .line 41
    .line 42
    .line 43
    const-string p1, "glAttachShader"

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/player/AbsIjkRender;->checkGlError(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-static {v1, p2}, Landroid/opengl/GLES20;->glAttachShader(II)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/player/AbsIjkRender;->checkGlError(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    invoke-static {v1}, Landroid/opengl/GLES20;->glLinkProgram(I)V

    .line 55
    .line 56
    .line 57
    const/4 p0, 0x1

    .line 58
    new-array p1, p0, [I

    .line 59
    .line 60
    const p2, 0x8b82

    .line 61
    .line 62
    .line 63
    invoke-static {v1, p2, p1, v0}, Landroid/opengl/GLES20;->glGetProgramiv(II[II)V

    .line 64
    .line 65
    .line 66
    aget p1, p1, v0

    .line 67
    .line 68
    if-eq p1, p0, :cond_3

    .line 69
    .line 70
    const-string p0, "Could not link program: "

    .line 71
    .line 72
    invoke-static {v2, p0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    .line 74
    .line 75
    invoke-static {v1}, Landroid/opengl/GLES20;->glGetProgramInfoLog(I)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-static {v2, p0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
    .line 81
    .line 82
    invoke-static {v1}, Landroid/opengl/GLES20;->glDeleteProgram(I)V

    .line 83
    .line 84
    .line 85
    return v0

    .line 86
    :cond_3
    return v1
.end method

.method private loadShader(ILjava/lang/String;)I
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
    move-result-object v1

    .line 19
    invoke-virtual {p0, v1}, Ltv/danmaku/ijk/media/player/AbsIjkRender;->checkGlError(Ljava/lang/String;)V

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
    const p2, 0x8b81

    .line 32
    .line 33
    .line 34
    const/4 v1, 0x0

    .line 35
    invoke-static {v0, p2, p0, v1}, Landroid/opengl/GLES20;->glGetShaderiv(II[II)V

    .line 36
    .line 37
    .line 38
    aget p0, p0, v1

    .line 39
    .line 40
    if-nez p0, :cond_0

    .line 41
    .line 42
    new-instance p0, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    const-string p2, "Could not compile shader "

    .line 45
    .line 46
    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    const-string p1, ":"

    .line 53
    .line 54
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    const-string p1, "AbsIjkRender"

    .line 62
    .line 63
    invoke-static {p1, p0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 64
    .line 65
    .line 66
    new-instance p0, Ljava/lang/StringBuilder;

    .line 67
    .line 68
    const-string p2, " "

    .line 69
    .line 70
    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    invoke-static {v0}, Landroid/opengl/GLES20;->glGetShaderInfoLog(I)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p2

    .line 77
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-static {p1, p0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 85
    .line 86
    .line 87
    invoke-static {v0}, Landroid/opengl/GLES20;->glDeleteShader(I)V

    .line 88
    .line 89
    .line 90
    return v1

    .line 91
    :cond_0
    return v0
.end method


# virtual methods
.method public bindShaderAttributes()V
    .locals 3

    .line 1
    iget v0, p0, Ltv/danmaku/ijk/media/player/AbsIjkRender;->programHandle:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "position"

    .line 5
    .line 6
    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glBindAttribLocation(IILjava/lang/String;)V

    .line 7
    .line 8
    .line 9
    iget p0, p0, Ltv/danmaku/ijk/media/player/AbsIjkRender;->programHandle:I

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    const-string v1, "inputTextureCoordinate"

    .line 13
    .line 14
    invoke-static {p0, v0, v1}, Landroid/opengl/GLES20;->glBindAttribLocation(IILjava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public checkGlError(Ljava/lang/String;)V
    .locals 2

    .line 1
    :goto_0
    invoke-static {}, Landroid/opengl/GLES20;->glGetError()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, ": glError "

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string v0, "AbsIjkRender"

    .line 28
    .line 29
    invoke-static {v0, p0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    return-void
.end method

.method public disableDrawArray()V
    .locals 1

    .line 1
    iget v0, p0, Ltv/danmaku/ijk/media/player/AbsIjkRender;->positionHandle:I

    .line 2
    .line 3
    invoke-static {v0}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    .line 4
    .line 5
    .line 6
    iget p0, p0, Ltv/danmaku/ijk/media/player/AbsIjkRender;->texCoordHandle:I

    .line 7
    .line 8
    invoke-static {p0}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    .line 9
    .line 10
    .line 11
    const/16 p0, 0xde1

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-static {p0, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture;\nvarying vec2 textureCoordinate;\nvoid main() {\n    gl_FragColor = texture2D(inputImageTexture, uv);\n}"

    .line 2
    .line 3
    return-object p0
.end method

.method public getHeight()I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/player/AbsIjkRender;->height:I

    .line 2
    .line 3
    return p0
.end method

.method public getVertexShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "attribute vec4 position;\nattribute vec2 inputTextureCoordinate;\nvarying vec2 textureCoordinate;\nvoid main() {\n    textureCoordinate = inputTextureCoordinate;\n    gl_Position = position;\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public getWidth()I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/player/AbsIjkRender;->width:I

    .line 2
    .line 3
    return p0
.end method

.method public initShaderHandles()V
    .locals 2

    .line 1
    iget v0, p0, Ltv/danmaku/ijk/media/player/AbsIjkRender;->programHandle:I

    .line 2
    .line 3
    const-string v1, "position"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iput v0, p0, Ltv/danmaku/ijk/media/player/AbsIjkRender;->positionHandle:I

    .line 10
    .line 11
    iget v0, p0, Ltv/danmaku/ijk/media/player/AbsIjkRender;->programHandle:I

    .line 12
    .line 13
    const-string v1, "inputTextureCoordinate"

    .line 14
    .line 15
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iput v0, p0, Ltv/danmaku/ijk/media/player/AbsIjkRender;->texCoordHandle:I

    .line 20
    .line 21
    iget v0, p0, Ltv/danmaku/ijk/media/player/AbsIjkRender;->programHandle:I

    .line 22
    .line 23
    const-string v1, "inputImageTexture"

    .line 24
    .line 25
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iput v0, p0, Ltv/danmaku/ijk/media/player/AbsIjkRender;->textureHandle:I

    .line 30
    .line 31
    return-void
.end method

.method public onCreated()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/AbsIjkRender;->getVertexShader()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/AbsIjkRender;->getFragmentShader()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-direct {p0, v0, v1}, Ltv/danmaku/ijk/media/player/AbsIjkRender;->createProgram(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iput v0, p0, Ltv/danmaku/ijk/media/player/AbsIjkRender;->programHandle:I

    .line 14
    .line 15
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/AbsIjkRender;->bindShaderAttributes()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/AbsIjkRender;->initShaderHandles()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public onDrawFrame(I)V
    .locals 2

    .line 1
    iget v0, p0, Ltv/danmaku/ijk/media/player/AbsIjkRender;->programHandle:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/AbsIjkRender;->onCreated()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iput p1, p0, Ltv/danmaku/ijk/media/player/AbsIjkRender;->textureIn:I

    .line 9
    .line 10
    iget p1, p0, Ltv/danmaku/ijk/media/player/AbsIjkRender;->width:I

    .line 11
    .line 12
    iget v0, p0, Ltv/danmaku/ijk/media/player/AbsIjkRender;->height:I

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-static {v1, v1, p1, v0}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 16
    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    invoke-static {p1, p1, p1, p1}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 20
    .line 21
    .line 22
    const/16 p1, 0x4100

    .line 23
    .line 24
    invoke-static {p1}, Landroid/opengl/GLES20;->glClear(I)V

    .line 25
    .line 26
    .line 27
    iget p1, p0, Ltv/danmaku/ijk/media/player/AbsIjkRender;->programHandle:I

    .line 28
    .line 29
    invoke-static {p1}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/AbsIjkRender;->passShaderValues()V

    .line 33
    .line 34
    .line 35
    const/4 p1, 0x5

    .line 36
    const/4 v0, 0x4

    .line 37
    invoke-static {p1, v1, v0}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/AbsIjkRender;->disableDrawArray()V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public onSizeChanged(II)V
    .locals 1

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/player/AbsIjkRender;->width:I

    .line 2
    .line 3
    iput p2, p0, Ltv/danmaku/ijk/media/player/AbsIjkRender;->height:I

    .line 4
    .line 5
    new-instance p0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v0, "size changed size changed "

    .line 8
    .line 9
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string p1, ", "

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string p1, "lqdebug"

    .line 28
    .line 29
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public passShaderValues()V
    .locals 7

    .line 1
    iget v0, p0, Ltv/danmaku/ijk/media/player/AbsIjkRender;->positionHandle:I

    .line 2
    .line 3
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Ltv/danmaku/ijk/media/player/AbsIjkRender;->positionHandle:I

    .line 7
    .line 8
    const/16 v5, 0x8

    .line 9
    .line 10
    iget-object v6, p0, Ltv/danmaku/ijk/media/player/AbsIjkRender;->renderVertices:Ljava/nio/FloatBuffer;

    .line 11
    .line 12
    const/4 v2, 0x2

    .line 13
    const/16 v3, 0x1406

    .line 14
    .line 15
    const/4 v4, 0x0

    .line 16
    invoke-static/range {v1 .. v6}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 17
    .line 18
    .line 19
    iget v0, p0, Ltv/danmaku/ijk/media/player/AbsIjkRender;->texCoordHandle:I

    .line 20
    .line 21
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 22
    .line 23
    .line 24
    iget v1, p0, Ltv/danmaku/ijk/media/player/AbsIjkRender;->texCoordHandle:I

    .line 25
    .line 26
    iget-object v6, p0, Ltv/danmaku/ijk/media/player/AbsIjkRender;->textureVertices:Ljava/nio/FloatBuffer;

    .line 27
    .line 28
    invoke-static/range {v1 .. v6}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 29
    .line 30
    .line 31
    const v0, 0x84c0

    .line 32
    .line 33
    .line 34
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 35
    .line 36
    .line 37
    const/16 v0, 0xde1

    .line 38
    .line 39
    iget v1, p0, Ltv/danmaku/ijk/media/player/AbsIjkRender;->textureIn:I

    .line 40
    .line 41
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 42
    .line 43
    .line 44
    iget p0, p0, Ltv/danmaku/ijk/media/player/AbsIjkRender;->textureHandle:I

    .line 45
    .line 46
    const/4 v0, 0x0

    .line 47
    invoke-static {p0, v0}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 48
    .line 49
    .line 50
    return-void
.end method
