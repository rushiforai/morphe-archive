.class public Ll/qxb;
.super Ll/i4;
.source "SourceFile"


# instance fields
.field final a:Ljava/lang/String;

.field final b:Ljava/lang/String;

.field private c:I

.field private d:I

.field private e:F

.field f:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/i4;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "textureSize"

    .line 5
    .line 6
    iput-object v0, p0, Ll/qxb;->a:Ljava/lang/String;

    .line 7
    .line 8
    const-string v0, "tile_size"

    .line 9
    .line 10
    iput-object v0, p0, Ll/qxb;->b:Ljava/lang/String;

    .line 11
    .line 12
    const/high16 v0, 0x40a00000    # 5.0f

    .line 13
    .line 14
    iput v0, p0, Ll/qxb;->e:F

    .line 15
    .line 16
    const-string v0, "precision highp float;\n\nuniform sampler2D inputImageTexture;\nvarying vec2 textureCoordinate;\n uniform vec2 textureSize;\n\nuniform float tile_size;\nvec4 fragColor;\n\nvoid main()\n{\n     float lum = length(texture2D(inputImageTexture, textureCoordinate).rgb);\n     fragColor = vec4(1.0, 1.0, 1.0, 1.0);\n     \n     if (lum < 1.00) {\n         if (mod(floor(textureCoordinate.x*textureSize.y + textureCoordinate.y*textureSize.x), tile_size) == 0.0) {\n             fragColor = vec4(0.0, 0.0, 0.0, 1.0);\n         }\n     }\n     \n     if (lum < 0.75) {\n         if (mod(floor(textureCoordinate.x*textureSize.y - textureCoordinate.y*textureSize.x), tile_size) == 0.0) {\n             fragColor = vec4(0.0, 0.0, 0.0, 1.0);\n         }\n     }\n     \n     if (lum < 0.50) {\n         if (mod(floor(textureCoordinate.x*textureSize.y + textureCoordinate.y*textureSize.x -tile_size/2.), tile_size) == 0.0) {\n             fragColor = vec4(0.0, 0.0, 0.0, 1.0);\n         }\n     }\n     \n     if (lum < 0.3) {\n         if (mod(floor(textureCoordinate.x*textureSize.y - textureCoordinate.y*textureSize.x -tile_size/2.), tile_size) == 0.0) {\n             fragColor = vec4(0.0, 0.0, 0.0, 1.0);\n         }\n     }\n     gl_FragColor = fragColor;\n}\n"

    .line 17
    .line 18
    iput-object v0, p0, Ll/qxb;->f:Ljava/lang/String;

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qxb;->f:Ljava/lang/String;

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
    const-string v1, "textureSize"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Ll/qxb;->c:I

    .line 13
    .line 14
    iget v0, p0, Ll/wej;->programHandle:I

    .line 15
    .line 16
    const-string v1, "tile_size"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Ll/qxb;->d:I

    .line 23
    .line 24
    return-void
.end method

.method public passShaderValues()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/wej;->passShaderValues()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/qxb;->c:I

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    int-to-float v1, v1

    .line 11
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    int-to-float v2, v2

    .line 16
    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glUniform2f(IFF)V

    .line 17
    .line 18
    .line 19
    iget v0, p0, Ll/qxb;->d:I

    .line 20
    .line 21
    iget p0, p0, Ll/qxb;->e:F

    .line 22
    .line 23
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public setFilterOptions(Lproject/android/imageprocessing/model/FilterOptions;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/i4;->setFilterOptions(Lproject/android/imageprocessing/model/FilterOptions;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lproject/android/imageprocessing/model/FilterOptions;->getAmount()F

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    const/high16 v0, 0x41200000    # 10.0f

    .line 9
    .line 10
    mul-float/2addr p1, v0

    .line 11
    iput p1, p0, Ll/qxb;->e:F

    .line 12
    .line 13
    return-void
.end method
