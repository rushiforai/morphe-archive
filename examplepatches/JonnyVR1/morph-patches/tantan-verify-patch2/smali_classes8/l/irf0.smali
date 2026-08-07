.class public Ll/irf0;
.super Ll/i4;
.source "SourceFile"


# instance fields
.field protected a:F

.field protected b:F

.field private c:I

.field private d:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/i4;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nvarying vec2 textureCoordinate;\nuniform float u_TexelWidth;\nuniform float u_TexelHeight;\nvoid main(){\n   vec2 up = vec2(0.0, u_TexelHeight);\n   vec2 right = vec2(u_TexelWidth, 0.0);\n   float bottomLeftIntensity = texture2D(inputImageTexture0, textureCoordinate - up - right).r;\n   float topRightIntensity = texture2D(inputImageTexture0, textureCoordinate + up + right).r;\n   float topLeftIntensity = texture2D(inputImageTexture0, textureCoordinate + up - right).r;\n   float bottomRightIntensity = texture2D(inputImageTexture0, textureCoordinate - up + right).r;\n   float leftIntensity = texture2D(inputImageTexture0, textureCoordinate - right).r;\n   float rightIntensity = texture2D(inputImageTexture0, textureCoordinate + right).r;\n   float bottomIntensity = texture2D(inputImageTexture0, textureCoordinate - up).r;\n   float topIntensity = texture2D(inputImageTexture0, textureCoordinate + up).r;\n   float h = -topLeftIntensity - 2.0 * topIntensity - topRightIntensity + bottomLeftIntensity + 2.0 * bottomIntensity + bottomRightIntensity;\n   float v = -bottomLeftIntensity - 2.0 * leftIntensity - topLeftIntensity + bottomRightIntensity + 2.0 * rightIntensity + topRightIntensity;\n   float mag = 1.0 - length(vec2(h, v));\n   gl_FragColor = vec4(vec3(mag), 1.0);\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public handleSizeChange()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/gfj;->handleSizeChange()V

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
    iput v0, p0, Ll/irf0;->a:F

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
    div-float/2addr v1, v0

    .line 21
    iput v1, p0, Ll/irf0;->b:F

    .line 22
    .line 23
    return-void
.end method

.method public initShaderHandles()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/wej;->initShaderHandles()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/wej;->programHandle:I

    .line 5
    .line 6
    const-string v1, "u_TexelWidth"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Ll/irf0;->c:I

    .line 13
    .line 14
    iget v0, p0, Ll/wej;->programHandle:I

    .line 15
    .line 16
    const-string v1, "u_TexelHeight"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Ll/irf0;->d:I

    .line 23
    .line 24
    return-void
.end method

.method public passShaderValues()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/wej;->passShaderValues()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/irf0;->c:I

    .line 5
    .line 6
    iget v1, p0, Ll/irf0;->a:F

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 9
    .line 10
    .line 11
    iget v0, p0, Ll/irf0;->d:I

    .line 12
    .line 13
    iget p0, p0, Ll/irf0;->b:F

    .line 14
    .line 15
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
