.class public Lcom/momo/mcamera/util/BlendFilter;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final ATTRIBUTE_POSITION:Ljava/lang/String; = "aVertexCo"

.field public static final ATTRIBUTE_TEXCOORD:Ljava/lang/String; = "aTextureCo"

.field private static final SHADER_FRAGMENT:Ljava/lang/String; = "precision mediump float;\nuniform sampler2D inputImageTexture10;\nuniform sampler2D inputImageTexture1;\nvarying vec2 vTextureCo;\nvoid main(){\n   vec4 color1 = texture2D(inputImageTexture10,vTextureCo);\n   vec4 color2 = texture2D(inputImageTexture1,vTextureCo);\n   vec4 outputColor;\n   float a = color1.a + color2.a * (1.0 - color1.a);\n   outputColor.rgb = color1.rgb*(1.0 - color2.a) + color2.rgb*color2.a;\n   outputColor.a = 1.0;\n   gl_FragColor = outputColor;\n}\n"

.field private static final SHADER_VETEX:Ljava/lang/String; = "attribute vec4 aVertexCo;\nattribute vec2 aTextureCo;\n \nvarying vec2 vTextureCo;\n\nvoid main(){\n    gl_Position = aVertexCo;\n    vTextureCo = aTextureCo;\n}"

.field public static final UNIFORM_TEXTURE0:Ljava/lang/String; = "inputImageTexture10"

.field protected static final UNIFORM_TEXTURE1:Ljava/lang/String; = "inputImageTexture1"

.field public static final VARYING_TEXCOORD:Ljava/lang/String; = "vTextureCo"


# instance fields
.field private mGLProgram:I

.field private mGLTextureCo:I

.field private mGLVertexCo:I

.field private mTextureBuffer:Ljava/nio/FloatBuffer;

.field private mVertexBuffer:Ljava/nio/FloatBuffer;

.field private text1Handle:I

.field private textHandle:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/momo/mcamera/util/BlendFilter;->initBuffer()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/momo/mcamera/util/BlendFilter;->createProgram()V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0}, Lcom/momo/mcamera/util/BlendFilter;->initHandles()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private bindShaderAttributes(I)V
    .locals 1

    .line 1
    const/4 p0, 0x0

    .line 2
    const-string v0, "aVertexCo"

    .line 3
    .line 4
    invoke-static {p1, p0, v0}, Landroid/opengl/GLES20;->glBindAttribLocation(IILjava/lang/String;)V

    .line 5
    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    const-string v0, "aTextureCo"

    .line 9
    .line 10
    invoke-static {p1, p0, v0}, Landroid/opengl/GLES20;->glBindAttribLocation(IILjava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private createGLProgram(Ljava/lang/String;Ljava/lang/String;)I
    .locals 2

    .line 1
    const v0, 0x8b31

    .line 2
    .line 3
    .line 4
    invoke-static {v0, p1}, Lcom/momo/mcamera/util/GpuUtils;->loadShader(ILjava/lang/String;)I

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
    invoke-static {v1, p2}, Lcom/momo/mcamera/util/GpuUtils;->loadShader(ILjava/lang/String;)I

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
    if-eqz v1, :cond_2

    .line 27
    .line 28
    invoke-static {v1, p1}, Landroid/opengl/GLES20;->glAttachShader(II)V

    .line 29
    .line 30
    .line 31
    invoke-static {v1, p2}, Landroid/opengl/GLES20;->glAttachShader(II)V

    .line 32
    .line 33
    .line 34
    invoke-direct {p0, v1}, Lcom/momo/mcamera/util/BlendFilter;->bindShaderAttributes(I)V

    .line 35
    .line 36
    .line 37
    invoke-static {v1}, Landroid/opengl/GLES20;->glLinkProgram(I)V

    .line 38
    .line 39
    .line 40
    const/4 p0, 0x1

    .line 41
    new-array p1, p0, [I

    .line 42
    .line 43
    const p2, 0x8b82

    .line 44
    .line 45
    .line 46
    invoke-static {v1, p2, p1, v0}, Landroid/opengl/GLES20;->glGetProgramiv(II[II)V

    .line 47
    .line 48
    .line 49
    aget p1, p1, v0

    .line 50
    .line 51
    if-eq p1, p0, :cond_2

    .line 52
    .line 53
    invoke-static {v1}, Landroid/opengl/GLES20;->glDeleteProgram(I)V

    .line 54
    .line 55
    .line 56
    return v0

    .line 57
    :cond_2
    return v1
.end method

.method private initHandles()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/momo/mcamera/util/BlendFilter;->mGLProgram:I

    .line 2
    .line 3
    const-string v1, "aVertexCo"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iput v0, p0, Lcom/momo/mcamera/util/BlendFilter;->mGLVertexCo:I

    .line 10
    .line 11
    iget v0, p0, Lcom/momo/mcamera/util/BlendFilter;->mGLProgram:I

    .line 12
    .line 13
    const-string v1, "aTextureCo"

    .line 14
    .line 15
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iput v0, p0, Lcom/momo/mcamera/util/BlendFilter;->mGLTextureCo:I

    .line 20
    .line 21
    iget v0, p0, Lcom/momo/mcamera/util/BlendFilter;->mGLProgram:I

    .line 22
    .line 23
    const-string v1, "inputImageTexture10"

    .line 24
    .line 25
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iput v0, p0, Lcom/momo/mcamera/util/BlendFilter;->textHandle:I

    .line 30
    .line 31
    iget v0, p0, Lcom/momo/mcamera/util/BlendFilter;->mGLProgram:I

    .line 32
    .line 33
    const-string v1, "inputImageTexture1"

    .line 34
    .line 35
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    iput v0, p0, Lcom/momo/mcamera/util/BlendFilter;->text1Handle:I

    .line 40
    .line 41
    return-void
.end method


# virtual methods
.method public blend(II)V
    .locals 8

    .line 1
    iget v0, p0, Lcom/momo/mcamera/util/BlendFilter;->mGLProgram:I

    .line 2
    .line 3
    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 4
    .line 5
    .line 6
    const v0, 0x84c0

    .line 7
    .line 8
    .line 9
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 10
    .line 11
    .line 12
    const/16 v0, 0xde1

    .line 13
    .line 14
    invoke-static {v0, p1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 15
    .line 16
    .line 17
    iget p1, p0, Lcom/momo/mcamera/util/BlendFilter;->textHandle:I

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-static {p1, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 21
    .line 22
    .line 23
    const p1, 0x84c1

    .line 24
    .line 25
    .line 26
    invoke-static {p1}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 27
    .line 28
    .line 29
    invoke-static {v0, p2}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 30
    .line 31
    .line 32
    iget p1, p0, Lcom/momo/mcamera/util/BlendFilter;->text1Handle:I

    .line 33
    .line 34
    const/4 p2, 0x1

    .line 35
    invoke-static {p1, p2}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 36
    .line 37
    .line 38
    iget p1, p0, Lcom/momo/mcamera/util/BlendFilter;->mGLVertexCo:I

    .line 39
    .line 40
    invoke-static {p1}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 41
    .line 42
    .line 43
    iget v2, p0, Lcom/momo/mcamera/util/BlendFilter;->mGLVertexCo:I

    .line 44
    .line 45
    const/4 v6, 0x0

    .line 46
    iget-object v7, p0, Lcom/momo/mcamera/util/BlendFilter;->mVertexBuffer:Ljava/nio/FloatBuffer;

    .line 47
    .line 48
    const/4 v3, 0x2

    .line 49
    const/16 v4, 0x1406

    .line 50
    .line 51
    const/4 v5, 0x0

    .line 52
    invoke-static/range {v2 .. v7}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 53
    .line 54
    .line 55
    iget p1, p0, Lcom/momo/mcamera/util/BlendFilter;->mGLTextureCo:I

    .line 56
    .line 57
    invoke-static {p1}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 58
    .line 59
    .line 60
    iget v2, p0, Lcom/momo/mcamera/util/BlendFilter;->mGLTextureCo:I

    .line 61
    .line 62
    iget-object v7, p0, Lcom/momo/mcamera/util/BlendFilter;->mTextureBuffer:Ljava/nio/FloatBuffer;

    .line 63
    .line 64
    invoke-static/range {v2 .. v7}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 65
    .line 66
    .line 67
    const/4 p1, 0x5

    .line 68
    const/4 p2, 0x4

    .line 69
    invoke-static {p1, v1, p2}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 70
    .line 71
    .line 72
    iget p1, p0, Lcom/momo/mcamera/util/BlendFilter;->mGLVertexCo:I

    .line 73
    .line 74
    invoke-static {p1}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    .line 75
    .line 76
    .line 77
    iget p0, p0, Lcom/momo/mcamera/util/BlendFilter;->mGLTextureCo:I

    .line 78
    .line 79
    invoke-static {p0}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public createProgram()V
    .locals 2

    .line 1
    const-string v0, "attribute vec4 aVertexCo;\nattribute vec2 aTextureCo;\n \nvarying vec2 vTextureCo;\n\nvoid main(){\n    gl_Position = aVertexCo;\n    vTextureCo = aTextureCo;\n}"

    .line 2
    .line 3
    const-string v1, "precision mediump float;\nuniform sampler2D inputImageTexture10;\nuniform sampler2D inputImageTexture1;\nvarying vec2 vTextureCo;\nvoid main(){\n   vec4 color1 = texture2D(inputImageTexture10,vTextureCo);\n   vec4 color2 = texture2D(inputImageTexture1,vTextureCo);\n   vec4 outputColor;\n   float a = color1.a + color2.a * (1.0 - color1.a);\n   outputColor.rgb = color1.rgb*(1.0 - color2.a) + color2.rgb*color2.a;\n   outputColor.a = 1.0;\n   gl_FragColor = outputColor;\n}\n"

    .line 4
    .line 5
    invoke-direct {p0, v0, v1}, Lcom/momo/mcamera/util/BlendFilter;->createGLProgram(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iput v0, p0, Lcom/momo/mcamera/util/BlendFilter;->mGLProgram:I

    .line 10
    .line 11
    return-void
.end method

.method public initBuffer()V
    .locals 3

    .line 1
    const/16 v0, 0x20

    .line 2
    .line 3
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iput-object v1, p0, Lcom/momo/mcamera/util/BlendFilter;->mVertexBuffer:Ljava/nio/FloatBuffer;

    .line 19
    .line 20
    invoke-static {}, Lcom/momo/mcamera/util/MatrixUtils;->getOriginalVertexCo()[F

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {v1, v2}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Lcom/momo/mcamera/util/BlendFilter;->mVertexBuffer:Ljava/nio/FloatBuffer;

    .line 28
    .line 29
    const/4 v2, 0x0

    .line 30
    invoke-virtual {v1, v2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 31
    .line 32
    .line 33
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iput-object v0, p0, Lcom/momo/mcamera/util/BlendFilter;->mTextureBuffer:Ljava/nio/FloatBuffer;

    .line 49
    .line 50
    invoke-static {}, Lcom/momo/mcamera/util/MatrixUtils;->getOriginalTextureCo()[F

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 55
    .line 56
    .line 57
    iget-object p0, p0, Lcom/momo/mcamera/util/BlendFilter;->mTextureBuffer:Ljava/nio/FloatBuffer;

    .line 58
    .line 59
    invoke-virtual {p0, v2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 60
    .line 61
    .line 62
    return-void
.end method
