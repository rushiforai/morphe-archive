.class public Ll/ze5;
.super Ll/i4;
.source "SourceFile"


# instance fields
.field private a:[Ljava/lang/String;

.field private b:[I

.field private c:[I

.field private d:I

.field private e:F

.field private f:I

.field private g:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/i4;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x96

    .line 5
    .line 6
    iput v0, p0, Ll/ze5;->f:I

    .line 7
    .line 8
    invoke-direct {p0}, Ll/ze5;->R1()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private Q1()V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget-object v2, p0, Ll/ze5;->b:[I

    .line 4
    .line 5
    array-length v3, v2

    .line 6
    if-ge v1, v3, :cond_1

    .line 7
    .line 8
    aget v2, v2, v1

    .line 9
    .line 10
    if-lez v2, :cond_0

    .line 11
    .line 12
    const/4 v2, 0x1

    .line 13
    new-array v3, v2, [I

    .line 14
    .line 15
    invoke-static {v2, v3, v0}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 16
    .line 17
    .line 18
    iget-object v2, p0, Ll/ze5;->b:[I

    .line 19
    .line 20
    aput v0, v2, v1

    .line 21
    .line 22
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    return-void
.end method

.method private R1()V
    .locals 2

    .line 1
    const/4 v0, 0x2

    .line 2
    iput v0, p0, Ll/ze5;->g:I

    .line 3
    .line 4
    new-array v1, v0, [I

    .line 5
    .line 6
    iput-object v1, p0, Ll/ze5;->b:[I

    .line 7
    .line 8
    new-array v1, v0, [I

    .line 9
    .line 10
    iput-object v1, p0, Ll/ze5;->c:[I

    .line 11
    .line 12
    new-array v0, v0, [Ljava/lang/String;

    .line 13
    .line 14
    iput-object v0, p0, Ll/ze5;->a:[Ljava/lang/String;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/gfj;->destroy()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/ze5;->Q1()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision highp float;\nvarying vec2 textureCoordinate;\nuniform sampler2D inputImageTexture;\nuniform sampler2D inputImageTexture1;\nuniform sampler2D inputImageTexture2;\nuniform float uTime;\n\nconst float pi = 3.14159;\nconst float stepDis = 1.0 / 8.0;\nconst float perPixel = 1.0 / 512.0;\nconst float halfPixel = 0.5 / 512.0;\n\nvec4 lookup(vec4 color, sampler2D lookupTexture) {\n    float blue = color.b * 63.0;\n    vec2 coord;\n    coord.y = floor(blue / 8.0);\n    coord.x = floor(blue) - (coord.y * 8.0);\n    coord = coord * stepDis + halfPixel + (stepDis - perPixel) * color.xy;\n    return texture2D(lookupTexture, coord);\n}\n\nvoid main() {\n    vec4 inputColor = texture2D(inputImageTexture, textureCoordinate);\n    vec4 lookupColor1 = lookup(inputColor, inputImageTexture1);\n    vec4 lookupColor2 = lookup(inputColor, inputImageTexture2);\n\n    float density = sin(uTime);\n    density = ((density + 1.0) / 2.0);\n\tgl_FragColor = mix(lookupColor2, lookupColor1, density);\n}"

    .line 2
    .line 3
    return-object p0
.end method

.method public initShaderHandles()V
    .locals 5

    .line 1
    invoke-super {p0}, Ll/wej;->initShaderHandles()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    :goto_0
    iget v1, p0, Ll/ze5;->g:I

    .line 6
    .line 7
    if-ge v0, v1, :cond_0

    .line 8
    .line 9
    iget-object v1, p0, Ll/ze5;->c:[I

    .line 10
    .line 11
    iget v2, p0, Ll/wej;->programHandle:I

    .line 12
    .line 13
    new-instance v3, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v4, "inputImageTexture"

    .line 16
    .line 17
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    add-int/lit8 v4, v0, 0x1

    .line 21
    .line 22
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    invoke-static {v2, v3}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    aput v2, v1, v0

    .line 34
    .line 35
    move v0, v4

    .line 36
    goto :goto_0

    .line 37
    :cond_0
    iget v0, p0, Ll/wej;->programHandle:I

    .line 38
    .line 39
    const-string v1, "uTime"

    .line 40
    .line 41
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    iput v0, p0, Ll/ze5;->d:I

    .line 46
    .line 47
    return-void
.end method

.method public newTextureReady(ILl/gfj;Z)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Ll/ze5;->b:[I

    .line 3
    .line 4
    array-length v2, v1

    .line 5
    if-ge v0, v2, :cond_1

    .line 6
    .line 7
    aget v2, v1, v0

    .line 8
    .line 9
    if-nez v2, :cond_0

    .line 10
    .line 11
    iget-object v2, p0, Ll/ze5;->a:[Ljava/lang/String;

    .line 12
    .line 13
    aget-object v2, v2, v0

    .line 14
    .line 15
    invoke-static {v2}, Ll/oim;->c(Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-static {v2}, Ll/oim;->a(Landroid/graphics/Bitmap;)I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    aput v2, v1, v0

    .line 24
    .line 25
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    invoke-super {p0, p1, p2, p3}, Ll/i4;->newTextureReady(ILl/gfj;Z)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public passShaderValues()V
    .locals 7

    .line 1
    invoke-super {p0}, Ll/wej;->passShaderValues()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/ze5;->passTextureValues()V

    .line 5
    .line 6
    .line 7
    iget v0, p0, Ll/ze5;->f:I

    .line 8
    .line 9
    const-wide v1, 0x400921fb54442d18L    # Math.PI

    .line 10
    .line 11
    .line 12
    .line 13
    .line 14
    if-lez v0, :cond_0

    .line 15
    .line 16
    iget v3, p0, Ll/ze5;->e:F

    .line 17
    .line 18
    float-to-double v3, v3

    .line 19
    int-to-double v5, v0

    .line 20
    div-double/2addr v1, v5

    .line 21
    add-double/2addr v3, v1

    .line 22
    double-to-float v0, v3

    .line 23
    iput v0, p0, Ll/ze5;->e:F

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 27
    .line 28
    .line 29
    move-result-wide v3

    .line 30
    const-wide/32 v5, 0x186a0

    .line 31
    .line 32
    .line 33
    rem-long/2addr v3, v5

    .line 34
    long-to-float v0, v3

    .line 35
    const/high16 v3, 0x447a0000    # 1000.0f

    .line 36
    .line 37
    div-float/2addr v0, v3

    .line 38
    float-to-double v3, v0

    .line 39
    mul-double/2addr v3, v1

    .line 40
    double-to-float v0, v3

    .line 41
    iput v0, p0, Ll/ze5;->e:F

    .line 42
    .line 43
    :goto_0
    iget v0, p0, Ll/ze5;->d:I

    .line 44
    .line 45
    iget p0, p0, Ll/ze5;->e:F

    .line 46
    .line 47
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public passTextureValues()V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget v2, p0, Ll/ze5;->g:I

    .line 4
    .line 5
    if-ge v0, v2, :cond_2

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    if-eq v0, v2, :cond_0

    .line 11
    .line 12
    goto :goto_1

    .line 13
    :cond_0
    const v1, 0x84c2

    .line 14
    .line 15
    .line 16
    goto :goto_1

    .line 17
    :cond_1
    const v1, 0x84c1

    .line 18
    .line 19
    .line 20
    :goto_1
    invoke-static {v1}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 21
    .line 22
    .line 23
    iget-object v2, p0, Ll/ze5;->b:[I

    .line 24
    .line 25
    aget v2, v2, v0

    .line 26
    .line 27
    const/16 v3, 0xde1

    .line 28
    .line 29
    invoke-static {v3, v2}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 30
    .line 31
    .line 32
    iget-object v2, p0, Ll/ze5;->c:[I

    .line 33
    .line 34
    aget v2, v2, v0

    .line 35
    .line 36
    add-int/lit8 v0, v0, 0x1

    .line 37
    .line 38
    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_2
    return-void
.end method

.method public releaseFrameBuffer()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/gfj;->releaseFrameBuffer()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/ze5;->Q1()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setFilterOptions(Lproject/android/imageprocessing/model/FilterOptions;)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Ll/i4;->setFilterOptions(Lproject/android/imageprocessing/model/FilterOptions;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/ze5;->a:[Ljava/lang/String;

    .line 5
    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Lproject/android/imageprocessing/model/FilterOptions;->getFolder()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v3, "lut_0.png"

    .line 24
    .line 25
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    const/4 v3, 0x0

    .line 33
    aput-object v1, v0, v3

    .line 34
    .line 35
    iget-object v0, p0, Ll/ze5;->a:[Ljava/lang/String;

    .line 36
    .line 37
    new-instance v1, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1}, Lproject/android/imageprocessing/model/FilterOptions;->getFolder()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    const-string v2, "lut_1.png"

    .line 53
    .line 54
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    const/4 v2, 0x1

    .line 62
    aput-object v1, v0, v2

    .line 63
    .line 64
    invoke-virtual {p1}, Lproject/android/imageprocessing/model/FilterOptions;->getFrameCost()I

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    iput p1, p0, Ll/ze5;->f:I

    .line 69
    .line 70
    return-void
.end method
