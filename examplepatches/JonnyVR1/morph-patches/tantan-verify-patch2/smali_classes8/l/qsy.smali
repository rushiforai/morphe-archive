.class public Ll/qsy;
.super Ll/hs10;
.source "SourceFile"


# instance fields
.field final a:Ljava/lang/String;

.field private b:I

.field c:[F

.field d:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    const/4 v0, 0x4

    .line 2
    invoke-direct {p0, v0}, Ll/hs10;-><init>(I)V

    .line 3
    .line 4
    .line 5
    const-string v1, "coeff"

    .line 6
    .line 7
    iput-object v1, p0, Ll/qsy;->a:Ljava/lang/String;

    .line 8
    .line 9
    new-array v0, v0, [F

    .line 10
    .line 11
    iput-object v0, p0, Ll/qsy;->c:[F

    .line 12
    .line 13
    const-string v0, "precision highp float;\nvarying vec2 textureCoordinate;\nuniform vec4 coeff;\nuniform sampler2D inputImageTexture0;\nuniform sampler2D inputImageTexture1;\nuniform sampler2D inputImageTexture2;\nuniform sampler2D inputImageTexture3;\nvoid main(){ \n    gl_FragColor = texture2D(inputImageTexture0, textureCoordinate)*coeff.x + texture2D(inputImageTexture1, textureCoordinate)*coeff.y +                    texture2D(inputImageTexture2, textureCoordinate)*coeff.z + texture2D(inputImageTexture3, textureCoordinate)*coeff.w;\n}"

    .line 14
    .line 15
    iput-object v0, p0, Ll/qsy;->d:Ljava/lang/String;

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    invoke-virtual {p0, v0}, Ll/gfj;->setFloatTexture(Z)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Ll/qsy;->c:[F

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    const/4 v2, 0x0

    .line 25
    aput v2, p0, v1

    .line 26
    .line 27
    aput v2, p0, v0

    .line 28
    .line 29
    const/4 v0, 0x2

    .line 30
    aput v2, p0, v0

    .line 31
    .line 32
    const/4 v0, 0x3

    .line 33
    aput v2, p0, v0

    .line 34
    .line 35
    return-void
.end method


# virtual methods
.method public Q1(FFFF)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/qsy;->c:[F

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

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qsy;->d:Ljava/lang/String;

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
    const-string v1, "coeff"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Ll/qsy;->b:I

    .line 13
    .line 14
    return-void
.end method

.method public passShaderValues()V
    .locals 5

    .line 1
    invoke-super {p0}, Ll/hs10;->passShaderValues()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/qsy;->b:I

    .line 5
    .line 6
    iget-object p0, p0, Ll/qsy;->c:[F

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    aget v1, p0, v1

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    aget v2, p0, v2

    .line 13
    .line 14
    const/4 v3, 0x2

    .line 15
    aget v3, p0, v3

    .line 16
    .line 17
    const/4 v4, 0x3

    .line 18
    aget p0, p0, v4

    .line 19
    .line 20
    invoke-static {v0, v1, v2, v3, p0}, Landroid/opengl/GLES20;->glUniform4f(IFFFF)V

    .line 21
    .line 22
    .line 23
    return-void
.end method
