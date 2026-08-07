.class public Ll/xsf;
.super Ll/bs2;
.source "SourceFile"


# instance fields
.field private d:I

.field private e:I

.field private f:[F

.field private g:[F


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/bs2;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public Q1(I)V
    .locals 4

    .line 1
    invoke-static {p1}, Landroid/graphics/Color;->red(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    const/high16 v1, 0x437f0000    # 255.0f

    .line 7
    .line 8
    div-float/2addr v0, v1

    .line 9
    invoke-static {p1}, Landroid/graphics/Color;->green(I)I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    int-to-float v2, v2

    .line 14
    div-float/2addr v2, v1

    .line 15
    invoke-static {p1}, Landroid/graphics/Color;->blue(I)I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    int-to-float p1, p1

    .line 20
    div-float/2addr p1, v1

    .line 21
    const/4 v1, 0x3

    .line 22
    new-array v1, v1, [F

    .line 23
    .line 24
    const/4 v3, 0x0

    .line 25
    aput v0, v1, v3

    .line 26
    .line 27
    const/4 v0, 0x1

    .line 28
    aput v2, v1, v0

    .line 29
    .line 30
    const/4 v0, 0x2

    .line 31
    aput p1, v1, v0

    .line 32
    .line 33
    iput-object v1, p0, Ll/xsf;->g:[F

    .line 34
    .line 35
    return-void
.end method

.method public R1(I)V
    .locals 4

    .line 1
    invoke-static {p1}, Landroid/graphics/Color;->red(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    const/high16 v1, 0x437f0000    # 255.0f

    .line 7
    .line 8
    div-float/2addr v0, v1

    .line 9
    invoke-static {p1}, Landroid/graphics/Color;->green(I)I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    int-to-float v2, v2

    .line 14
    div-float/2addr v2, v1

    .line 15
    invoke-static {p1}, Landroid/graphics/Color;->blue(I)I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    int-to-float p1, p1

    .line 20
    div-float/2addr p1, v1

    .line 21
    const/4 v1, 0x3

    .line 22
    new-array v1, v1, [F

    .line 23
    .line 24
    const/4 v3, 0x0

    .line 25
    aput v0, v1, v3

    .line 26
    .line 27
    const/4 v0, 0x1

    .line 28
    aput v2, v1, v0

    .line 29
    .line 30
    const/4 v0, 0x2

    .line 31
    aput p1, v1, v0

    .line 32
    .line 33
    iput-object v1, p0, Ll/xsf;->f:[F

    .line 34
    .line 35
    return-void
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision highp float;\n varying highp vec2 textureCoordinate;\n uniform sampler2D inputImageTexture0;\n uniform highp vec3 lightColor;\n uniform highp vec3 darkColor;\n void main(){\n     highp vec2 uv = textureCoordinate;\n     vec4 color = texture2D(inputImageTexture0,fract(uv));\n     float luma = dot(color.rgb,vec3(0.299,0.587,0.114));\n     vec3 col = clamp(color.rgb,0.0,1.0);\n     col = mix(darkColor, lightColor,luma);\n     gl_FragColor = vec4(col,1.0);\n }"

    .line 2
    .line 3
    return-object p0
.end method

.method public initShaderHandles()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/bs2;->initShaderHandles()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/wej;->programHandle:I

    .line 5
    .line 6
    const-string v1, "lightColor"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Ll/xsf;->d:I

    .line 13
    .line 14
    iget v0, p0, Ll/wej;->programHandle:I

    .line 15
    .line 16
    const-string v1, "darkColor"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Ll/xsf;->e:I

    .line 23
    .line 24
    return-void
.end method

.method public passShaderValues()V
    .locals 7

    .line 1
    invoke-super {p0}, Ll/bs2;->passShaderValues()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/xsf;->d:I

    .line 5
    .line 6
    iget-object v1, p0, Ll/xsf;->f:[F

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    aget v3, v1, v2

    .line 10
    .line 11
    const/4 v4, 0x1

    .line 12
    aget v5, v1, v4

    .line 13
    .line 14
    const/4 v6, 0x2

    .line 15
    aget v1, v1, v6

    .line 16
    .line 17
    invoke-static {v0, v3, v5, v1}, Landroid/opengl/GLES20;->glUniform3f(IFFF)V

    .line 18
    .line 19
    .line 20
    iget v0, p0, Ll/xsf;->e:I

    .line 21
    .line 22
    iget-object p0, p0, Ll/xsf;->g:[F

    .line 23
    .line 24
    aget v1, p0, v2

    .line 25
    .line 26
    aget v2, p0, v4

    .line 27
    .line 28
    aget p0, p0, v6

    .line 29
    .line 30
    invoke-static {v0, v1, v2, p0}, Landroid/opengl/GLES20;->glUniform3f(IFFF)V

    .line 31
    .line 32
    .line 33
    return-void
.end method
