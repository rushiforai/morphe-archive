.class public Lcom/momo/mcamera/mask/SobelFilter;
.super Ll/jt2;
.source "SourceFile"


# instance fields
.field private sobelEnableHandler:I

.field private sobelEnabled:I

.field private texelHeightHandler:I

.field private texelWidthHandler:I

.field private thresholdHandler:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/jt2;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput v0, p0, Lcom/momo/mcamera/mask/SobelFilter;->sobelEnabled:I

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nvarying vec2 textureCoordinate;\n\nvarying vec2 leftTextureCoordinate;\nvarying vec2 rightTextureCoordinate;\n\nvarying vec2 topTextureCoordinate;\nvarying vec2 topLeftTextureCoordinate;\nvarying vec2 topRightTextureCoordinate;\n\nvarying vec2 bottomTextureCoordinate;\nvarying vec2 bottomLeftTextureCoordinate;\nvarying vec2 bottomRightTextureCoordinate;\n\nuniform float threshold;\n\nuniform float texelWidth;\nuniform float texelHeight;\n\nuniform int sobelEnabled;\nfloat stepWidth = 1.0;\n\nfloat intensity(in vec4 color){\n    return sign(sqrt((color.x*color.x)+(color.y*color.y)+(color.z*color.z))-threshold);\n}\n\nvec4 sobel(vec2 center){\n    // get samples around pixel\n    float tleft = intensity(texture2D( inputImageTexture0, clamp(vec2(0.0), vec2(1.0), topLeftTextureCoordinate)));\n    float left = intensity(texture2D( inputImageTexture0,  clamp(vec2(0.0), vec2(1.0), leftTextureCoordinate)));\n    float bleft = intensity(texture2D( inputImageTexture0,  clamp(vec2(0.0), vec2(1.0), bottomLeftTextureCoordinate)));\n    float top = intensity(texture2D( inputImageTexture0,  clamp(vec2(0.0), vec2(1.0), topTextureCoordinate)));\n    float bottom = intensity(texture2D( inputImageTexture0,  clamp(vec2(0.0), vec2(1.0), bottomTextureCoordinate)));\n    float tright = intensity(texture2D( inputImageTexture0,  clamp(vec2(0.0), vec2(1.0), topRightTextureCoordinate)));\n    float right = intensity(texture2D( inputImageTexture0,  clamp(vec2(0.0), vec2(1.0), rightTextureCoordinate)));\n    float bright = intensity(texture2D( inputImageTexture0,  clamp(vec2(0.0), vec2(1.0), bottomRightTextureCoordinate)));\n    \n    // Sobel masks (see http://en.wikipedia.org/wiki/Sobel_operator)\n    //        1 0 -1     -1 -2 -1\n    //    X = 2 0 -2  Y = 0  0  0\n    //        1 0 -1      1  2  1\n    \n    // You could also use Scharr operator:\n    //        3 0 -3        3 10   3\n    //    X = 10 0 -10  Y = 0  0   0\n    //        3 0 -3        -3 -10 -3\n    \n    float x = 1.0*tleft + 2.0*left + 1.0*bleft - 1.0*tright - 2.0*right - 1.0*bright;\n    float y = -1.0*tleft - 2.0*top - 1.0*tright + 1.0*bleft + 2.0 * bottom + 1.0*bright;\n    //float x = 3.0*tleft + 10.0*left + 3.0*bleft - 3.0*tright - 10.0*right - 3.0*bright;\n    //float y = -3.0*tleft - 10.0*top - 3.0*tright + 3.0*bleft + 10.0 * bottom + 3.0*bright;\n    \n    float color = sqrt((x*x) + (y*y));\n    return vec4(color,color,color,1.0);\n}\n\nvoid main(){\n      vec4 colorSobel = sobel(textureCoordinate);\n      gl_FragColor = mix(vec4(0.0, 0.0, 0.0, 1.0), colorSobel, float(sobelEnabled));\n}"

    .line 2
    .line 3
    return-object p0
.end method

.method public getVertexShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "attribute vec4 position;\nattribute vec2 inputTextureCoordinate;\nvarying vec2 textureCoordinate;\n\nuniform float texelWidth;\nuniform float texelHeight;\n\nvarying vec2 leftTextureCoordinate;\nvarying vec2 rightTextureCoordinate;\n\nvarying vec2 topTextureCoordinate;\nvarying vec2 topLeftTextureCoordinate;\nvarying vec2 topRightTextureCoordinate;\n\nvarying vec2 bottomTextureCoordinate;\nvarying vec2 bottomLeftTextureCoordinate;\nvarying vec2 bottomRightTextureCoordinate;\n\nvoid main() {\n   textureCoordinate = inputTextureCoordinate;\n   gl_Position = position;\n\n   vec2 widthStep = vec2(texelWidth, 0.0);\n   vec2 heightStep = vec2(0.0, texelHeight);\n   vec2 widthHeightStep = vec2(texelWidth, texelHeight);\n   vec2 widthNegativeHeightStep = vec2(texelWidth, -texelHeight);\n\n   leftTextureCoordinate = inputTextureCoordinate.xy - widthStep;\n   rightTextureCoordinate = inputTextureCoordinate.xy + widthStep;\n   \n   topTextureCoordinate = inputTextureCoordinate.xy - heightStep;\n   topLeftTextureCoordinate = inputTextureCoordinate.xy - widthHeightStep;\n   topRightTextureCoordinate = inputTextureCoordinate.xy + widthNegativeHeightStep;\n   \n   bottomTextureCoordinate = inputTextureCoordinate.xy + heightStep;\n   bottomLeftTextureCoordinate = inputTextureCoordinate.xy - widthNegativeHeightStep;\n   bottomRightTextureCoordinate = inputTextureCoordinate.xy + widthHeightStep;\n}"

    .line 2
    .line 3
    return-object p0
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
    const-string v1, "threshold"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Lcom/momo/mcamera/mask/SobelFilter;->thresholdHandler:I

    .line 13
    .line 14
    iget v0, p0, Ll/wej;->programHandle:I

    .line 15
    .line 16
    const-string v1, "texelWidth"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Lcom/momo/mcamera/mask/SobelFilter;->texelWidthHandler:I

    .line 23
    .line 24
    iget v0, p0, Ll/wej;->programHandle:I

    .line 25
    .line 26
    const-string v1, "texelHeight"

    .line 27
    .line 28
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iput v0, p0, Lcom/momo/mcamera/mask/SobelFilter;->texelHeightHandler:I

    .line 33
    .line 34
    iget v0, p0, Ll/wej;->programHandle:I

    .line 35
    .line 36
    const-string v1, "sobelEnabled"

    .line 37
    .line 38
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iput v0, p0, Lcom/momo/mcamera/mask/SobelFilter;->sobelEnableHandler:I

    .line 43
    .line 44
    return-void
.end method

.method public passShaderValues()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/wej;->passShaderValues()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/momo/mcamera/mask/SobelFilter;->thresholdHandler:I

    .line 5
    .line 6
    const v1, 0x3f4ccccd    # 0.8f

    .line 7
    .line 8
    .line 9
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 10
    .line 11
    .line 12
    iget v0, p0, Lcom/momo/mcamera/mask/SobelFilter;->texelWidthHandler:I

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    int-to-float v1, v1

    .line 19
    const/high16 v2, 0x3f800000    # 1.0f

    .line 20
    .line 21
    div-float v1, v2, v1

    .line 22
    .line 23
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 24
    .line 25
    .line 26
    iget v0, p0, Lcom/momo/mcamera/mask/SobelFilter;->texelHeightHandler:I

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    int-to-float v1, v1

    .line 33
    div-float/2addr v2, v1

    .line 34
    invoke-static {v0, v2}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 35
    .line 36
    .line 37
    iget v0, p0, Lcom/momo/mcamera/mask/SobelFilter;->sobelEnableHandler:I

    .line 38
    .line 39
    iget p0, p0, Lcom/momo/mcamera/mask/SobelFilter;->sobelEnabled:I

    .line 40
    .line 41
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public setSobelEnabled(Z)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/SobelFilter;->sobelEnabled:I

    .line 2
    .line 3
    return-void
.end method
