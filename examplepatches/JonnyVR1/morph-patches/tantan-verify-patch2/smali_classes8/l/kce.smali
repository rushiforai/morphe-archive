.class public Ll/kce;
.super Ll/jt2;
.source "SourceFile"


# instance fields
.field a:I

.field b:I

.field c:I

.field d:I

.field e:I

.field f:I

.field private g:[F

.field private i:F

.field private j:[F

.field private k:[F

.field private l:[F

.field private m:[F

.field n:Ljava/lang/String;

.field o:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/jt2;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    new-array v0, v0, [F

    .line 6
    .line 7
    iput-object v0, p0, Ll/kce;->g:[F

    .line 8
    .line 9
    const/4 v0, 0x4

    .line 10
    new-array v1, v0, [F

    .line 11
    .line 12
    iput-object v1, p0, Ll/kce;->j:[F

    .line 13
    .line 14
    new-array v1, v0, [F

    .line 15
    .line 16
    iput-object v1, p0, Ll/kce;->k:[F

    .line 17
    .line 18
    new-array v1, v0, [F

    .line 19
    .line 20
    iput-object v1, p0, Ll/kce;->l:[F

    .line 21
    .line 22
    new-array v0, v0, [F

    .line 23
    .line 24
    iput-object v0, p0, Ll/kce;->m:[F

    .line 25
    .line 26
    const-string v0, "precision highp float;\nattribute vec4 position;\nattribute vec2 inputTextureCoordinate;\nuniform vec2 stepSize;\nuniform float Stride;\nvarying vec2 TexCoord1;\nvarying vec2 TexCoord2;\nvarying vec2 TexCoord3;\nvarying vec2 TexCoord4;\nvoid main(){ \n    TexCoord1 = inputTextureCoordinate;\n    TexCoord2 = inputTextureCoordinate + stepSize*Stride;\n    TexCoord3 = inputTextureCoordinate + stepSize*2.0*Stride;\n    TexCoord4 = inputTextureCoordinate + stepSize*3.0*Stride;\n    gl_Position = position;\n}"

    .line 27
    .line 28
    iput-object v0, p0, Ll/kce;->n:Ljava/lang/String;

    .line 29
    .line 30
    const-string v0, "precision highp float;\nuniform vec4 colorCoeff1;\nuniform vec4 colorCoeff2;\nuniform vec4 colorCoeff3;\nuniform vec4 colorCoeff4;\nvarying vec2 TexCoord1;\nvarying vec2 TexCoord2;\nvarying vec2 TexCoord3;\nvarying vec2 TexCoord4;\nuniform sampler2D inputImageTexture0;\nvoid main(){ \n    gl_FragColor = texture2D(inputImageTexture0, TexCoord1)*colorCoeff1 + texture2D(inputImageTexture0, TexCoord2)*colorCoeff2 + texture2D(inputImageTexture0, TexCoord3)*colorCoeff3 + texture2D(inputImageTexture0, TexCoord4)*colorCoeff4; \n}"

    .line 31
    .line 32
    iput-object v0, p0, Ll/kce;->o:Ljava/lang/String;

    .line 33
    .line 34
    return-void
.end method


# virtual methods
.method public Q1(FFFF)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/kce;->j:[F

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    aput p1, p0, v0

    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    aput p2, p0, p1

    .line 8
    .line 9
    const/4 p1, 0x2

    .line 10
    aput p3, p0, p1

    .line 11
    .line 12
    const/4 p1, 0x3

    .line 13
    aput p4, p0, p1

    .line 14
    .line 15
    return-void
.end method

.method public R1(FFFF)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/kce;->k:[F

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    aput p1, p0, v0

    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    aput p2, p0, p1

    .line 8
    .line 9
    const/4 p1, 0x2

    .line 10
    aput p3, p0, p1

    .line 11
    .line 12
    const/4 p1, 0x3

    .line 13
    aput p4, p0, p1

    .line 14
    .line 15
    return-void
.end method

.method public S1(FFFF)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/kce;->l:[F

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    aput p1, p0, v0

    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    aput p2, p0, p1

    .line 8
    .line 9
    const/4 p1, 0x2

    .line 10
    aput p3, p0, p1

    .line 11
    .line 12
    const/4 p1, 0x3

    .line 13
    aput p4, p0, p1

    .line 14
    .line 15
    return-void
.end method

.method public T1(FFFF)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/kce;->m:[F

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    aput p1, p0, v0

    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    aput p2, p0, p1

    .line 8
    .line 9
    const/4 p1, 0x2

    .line 10
    aput p3, p0, p1

    .line 11
    .line 12
    const/4 p1, 0x3

    .line 13
    aput p4, p0, p1

    .line 14
    .line 15
    return-void
.end method

.method public U1(FF)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/kce;->g:[F

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    aput p1, p0, v0

    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    aput p2, p0, p1

    .line 8
    .line 9
    return-void
.end method

.method public V1(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/kce;->i:F

    .line 2
    .line 3
    return-void
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kce;->o:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getVertexShader()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kce;->n:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public initWithGLContext()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/wej;->initWithGLContext()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/wej;->programHandle:I

    .line 5
    .line 6
    const-string v1, "stepSize"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Ll/kce;->a:I

    .line 13
    .line 14
    iget v0, p0, Ll/wej;->programHandle:I

    .line 15
    .line 16
    const-string v1, "Stride"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Ll/kce;->b:I

    .line 23
    .line 24
    iget v0, p0, Ll/wej;->programHandle:I

    .line 25
    .line 26
    const-string v1, "colorCoeff1"

    .line 27
    .line 28
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iput v0, p0, Ll/kce;->c:I

    .line 33
    .line 34
    iget v0, p0, Ll/wej;->programHandle:I

    .line 35
    .line 36
    const-string v1, "colorCoeff2"

    .line 37
    .line 38
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iput v0, p0, Ll/kce;->d:I

    .line 43
    .line 44
    iget v0, p0, Ll/wej;->programHandle:I

    .line 45
    .line 46
    const-string v1, "colorCoeff3"

    .line 47
    .line 48
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    iput v0, p0, Ll/kce;->e:I

    .line 53
    .line 54
    iget v0, p0, Ll/wej;->programHandle:I

    .line 55
    .line 56
    const-string v1, "colorCoeff4"

    .line 57
    .line 58
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    iput v0, p0, Ll/kce;->f:I

    .line 63
    .line 64
    return-void
.end method

.method public passShaderValues()V
    .locals 9

    .line 1
    invoke-super {p0}, Ll/wej;->passShaderValues()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/kce;->b:I

    .line 5
    .line 6
    iget v1, p0, Ll/kce;->i:F

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 9
    .line 10
    .line 11
    iget v0, p0, Ll/kce;->a:I

    .line 12
    .line 13
    iget-object v1, p0, Ll/kce;->g:[F

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    aget v3, v1, v2

    .line 17
    .line 18
    const/4 v4, 0x1

    .line 19
    aget v1, v1, v4

    .line 20
    .line 21
    invoke-static {v0, v3, v1}, Landroid/opengl/GLES20;->glUniform2f(IFF)V

    .line 22
    .line 23
    .line 24
    iget v0, p0, Ll/kce;->c:I

    .line 25
    .line 26
    iget-object v1, p0, Ll/kce;->j:[F

    .line 27
    .line 28
    aget v3, v1, v2

    .line 29
    .line 30
    aget v5, v1, v4

    .line 31
    .line 32
    const/4 v6, 0x2

    .line 33
    aget v7, v1, v6

    .line 34
    .line 35
    const/4 v8, 0x3

    .line 36
    aget v1, v1, v8

    .line 37
    .line 38
    invoke-static {v0, v3, v5, v7, v1}, Landroid/opengl/GLES20;->glUniform4f(IFFFF)V

    .line 39
    .line 40
    .line 41
    iget v0, p0, Ll/kce;->d:I

    .line 42
    .line 43
    iget-object v1, p0, Ll/kce;->k:[F

    .line 44
    .line 45
    aget v3, v1, v2

    .line 46
    .line 47
    aget v5, v1, v4

    .line 48
    .line 49
    aget v7, v1, v6

    .line 50
    .line 51
    aget v1, v1, v8

    .line 52
    .line 53
    invoke-static {v0, v3, v5, v7, v1}, Landroid/opengl/GLES20;->glUniform4f(IFFFF)V

    .line 54
    .line 55
    .line 56
    iget v0, p0, Ll/kce;->e:I

    .line 57
    .line 58
    iget-object v1, p0, Ll/kce;->l:[F

    .line 59
    .line 60
    aget v3, v1, v2

    .line 61
    .line 62
    aget v5, v1, v4

    .line 63
    .line 64
    aget v7, v1, v6

    .line 65
    .line 66
    aget v1, v1, v8

    .line 67
    .line 68
    invoke-static {v0, v3, v5, v7, v1}, Landroid/opengl/GLES20;->glUniform4f(IFFFF)V

    .line 69
    .line 70
    .line 71
    iget v0, p0, Ll/kce;->f:I

    .line 72
    .line 73
    iget-object p0, p0, Ll/kce;->m:[F

    .line 74
    .line 75
    aget v1, p0, v2

    .line 76
    .line 77
    aget v2, p0, v4

    .line 78
    .line 79
    aget v3, p0, v6

    .line 80
    .line 81
    aget p0, p0, v8

    .line 82
    .line 83
    invoke-static {v0, v1, v2, v3, p0}, Landroid/opengl/GLES20;->glUniform4f(IFFFF)V

    .line 84
    .line 85
    .line 86
    return-void
.end method
