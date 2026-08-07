.class public Ll/rkf;
.super Ll/jt2;
.source "SourceFile"


# instance fields
.field final a:Ljava/lang/String;

.field b:I

.field c:[F

.field d:Ljava/lang/String;

.field e:Ljava/lang/String;


# direct methods
.method public constructor <init>(II)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ll/jt2;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "twoTexelSize"

    .line 5
    .line 6
    iput-object v0, p0, Ll/rkf;->a:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v0, 0x2

    .line 9
    new-array v0, v0, [F

    .line 10
    .line 11
    iput-object v0, p0, Ll/rkf;->c:[F

    .line 12
    .line 13
    const-string v0, "precision highp float;\nattribute vec4 position;\nattribute vec2 inputTextureCoordinate;\nuniform vec2 twoTexelSize;\nvarying vec2 TexCoord1;\nvarying vec2 TexCoord2;\nvarying vec2 TexCoord3;\nvarying vec2 TexCoord4;\nvoid main(){ \nTexCoord1 = inputTextureCoordinate;\nTexCoord2 = inputTextureCoordinate + vec2(twoTexelSize.x, 0);\nTexCoord3 = inputTextureCoordinate + vec2(twoTexelSize.x, twoTexelSize.y);\nTexCoord4 = inputTextureCoordinate + vec2(0, twoTexelSize.y);\ngl_Position = position; \n}"

    .line 14
    .line 15
    iput-object v0, p0, Ll/rkf;->d:Ljava/lang/String;

    .line 16
    .line 17
    const-string v0, "precision highp float;\nvarying vec2 TexCoord1;\nvarying vec2 TexCoord2;\nvarying vec2 TexCoord3;\nvarying vec2 TexCoord4;\nuniform sampler2D inputImageTexture0;\nvoid main(){ \n   gl_FragColor= max(max(texture2D(inputImageTexture0, TexCoord1), texture2D(inputImageTexture0, TexCoord2)), max(texture2D(inputImageTexture0, TexCoord3), texture2D(inputImageTexture0, TexCoord4))); \n}"

    .line 18
    .line 19
    iput-object v0, p0, Ll/rkf;->e:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {p0, p1, p2}, Ll/wej;->setRenderSize(II)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/rkf;->c:[F

    .line 25
    .line 26
    int-to-float p1, p1

    .line 27
    const/high16 v1, 0x3f800000    # 1.0f

    .line 28
    .line 29
    div-float p1, v1, p1

    .line 30
    .line 31
    const/4 v2, 0x0

    .line 32
    aput p1, v0, v2

    .line 33
    .line 34
    int-to-float p1, p2

    .line 35
    div-float/2addr v1, p1

    .line 36
    const/4 p1, 0x1

    .line 37
    aput v1, v0, p1

    .line 38
    .line 39
    invoke-virtual {p0, p1}, Ll/gfj;->setFloatTexture(Z)V

    .line 40
    .line 41
    .line 42
    return-void
.end method


# virtual methods
.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rkf;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getVertexShader()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rkf;->d:Ljava/lang/String;

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
    const-string v1, "twoTexelSize"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Ll/rkf;->b:I

    .line 13
    .line 14
    return-void
.end method

.method public passShaderValues()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/wej;->passShaderValues()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/rkf;->b:I

    .line 5
    .line 6
    iget-object p0, p0, Ll/rkf;->c:[F

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    aget v1, p0, v1

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    aget p0, p0, v2

    .line 13
    .line 14
    invoke-static {v0, v1, p0}, Landroid/opengl/GLES20;->glUniform2f(IFF)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
