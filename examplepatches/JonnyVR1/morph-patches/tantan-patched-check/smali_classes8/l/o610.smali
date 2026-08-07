.class public Ll/o610;
.super Ll/i4;
.source "SourceFile"


# instance fields
.field private final a:Ljava/lang/String;

.field private final b:Ljava/lang/String;

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
    const-string v0, "tile_size"

    .line 5
    .line 6
    iput-object v0, p0, Ll/o610;->a:Ljava/lang/String;

    .line 7
    .line 8
    const-string v0, "ratio"

    .line 9
    .line 10
    iput-object v0, p0, Ll/o610;->b:Ljava/lang/String;

    .line 11
    .line 12
    const/high16 v0, 0x3f000000    # 0.5f

    .line 13
    .line 14
    iput v0, p0, Ll/o610;->e:F

    .line 15
    .line 16
    const-string v0, "precision highp float;\nvarying vec2 textureCoordinate;\n\nuniform sampler2D inputImageTexture;\nuniform float tile_size;\nuniform float ratio;\n\nvoid main()\n{\n   vec2 mos_texCoord;\n   if(tile_size > 0.0) {\n       float factor = 25.0 / tile_size;\n       mos_texCoord = floor(textureCoordinate * vec2(factor * ratio, factor))/vec2(factor * ratio, factor);\n   } else {\n       mos_texCoord = textureCoordinate;\n   }\n   gl_FragColor = texture2D(inputImageTexture, mos_texCoord);\n}"

    .line 17
    .line 18
    iput-object v0, p0, Ll/o610;->f:Ljava/lang/String;

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o610;->f:Ljava/lang/String;

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
    const-string v1, "tile_size"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Ll/o610;->d:I

    .line 13
    .line 14
    iget v0, p0, Ll/wej;->programHandle:I

    .line 15
    .line 16
    const-string v1, "ratio"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Ll/o610;->c:I

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
    iget v0, p0, Ll/o610;->d:I

    .line 5
    .line 6
    iget v1, p0, Ll/o610;->e:F

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 9
    .line 10
    .line 11
    iget v0, p0, Ll/o610;->c:I

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    int-to-float v1, v1

    .line 18
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    int-to-float p0, p0

    .line 23
    div-float/2addr v1, p0

    .line 24
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public setFilterOptions(Lproject/android/imageprocessing/model/FilterOptions;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/i4;->setFilterOptions(Lproject/android/imageprocessing/model/FilterOptions;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lproject/android/imageprocessing/model/FilterOptions;->getBlockSize()F

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Ll/o610;->e:F

    .line 9
    .line 10
    return-void
.end method
