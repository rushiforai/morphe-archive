.class public Ll/nc00;
.super Ll/hs10;
.source "SourceFile"


# instance fields
.field final a:Ljava/lang/String;

.field b:I

.field c:[F

.field d:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

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
    iput-object v1, p0, Ll/nc00;->a:Ljava/lang/String;

    .line 8
    .line 9
    new-array v0, v0, [F

    .line 10
    .line 11
    iput-object v0, p0, Ll/nc00;->c:[F

    .line 12
    .line 13
    const-string v0, "precision highp float;\nvarying vec2 textureCoordinate; \nuniform sampler2D inputImageTexture0;\nuniform sampler2D inputImageTexture1;\nuniform sampler2D inputImageTexture2;\nuniform sampler2D inputImageTexture3;\nvoid main(){ \n    vec4 color1 = max(texture2D(inputImageTexture0, textureCoordinate), texture2D(inputImageTexture1, textureCoordinate));\n    vec4 color2 = max(texture2D(inputImageTexture2, textureCoordinate), texture2D(inputImageTexture3, textureCoordinate));\n    gl_FragColor = max(color1, color2); \n}\n"

    .line 14
    .line 15
    iput-object v0, p0, Ll/nc00;->d:Ljava/lang/String;

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    invoke-virtual {p0, v0}, Ll/gfj;->setFloatTexture(Z)V

    .line 19
    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nc00;->d:Ljava/lang/String;

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
    iput v0, p0, Ll/nc00;->b:I

    .line 13
    .line 14
    return-void
.end method

.method public passShaderValues()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/hs10;->passShaderValues()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
