.class public Ll/gri;
.super Ll/i4;
.source "SourceFile"


# instance fields
.field private a:[Ljava/lang/String;

.field private b:I

.field private c:I

.field private d:I

.field private e:I

.field private f:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/i4;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    new-array v0, v0, [Ljava/lang/String;

    .line 6
    .line 7
    iput-object v0, p0, Ll/gri;->a:[Ljava/lang/String;

    .line 8
    .line 9
    return-void
.end method

.method private Q1()V
    .locals 3

    .line 1
    iget v0, p0, Ll/gri;->f:I

    .line 2
    .line 3
    if-gtz v0, :cond_1

    .line 4
    .line 5
    iget v1, p0, Ll/gri;->e:I

    .line 6
    .line 7
    if-lez v1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    return-void

    .line 11
    :cond_1
    :goto_0
    iget v1, p0, Ll/gri;->e:I

    .line 12
    .line 13
    filled-new-array {v0, v1}, [I

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const/4 v1, 0x2

    .line 18
    const/4 v2, 0x0

    .line 19
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 20
    .line 21
    .line 22
    iput v2, p0, Ll/gri;->f:I

    .line 23
    .line 24
    iput v2, p0, Ll/gri;->e:I

    .line 25
    .line 26
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
    invoke-direct {p0}, Ll/gri;->Q1()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;\nvarying vec2 textureCoordinate;\n\nuniform sampler2D inputImageTexture;\nuniform sampler2D boxTexture;\nuniform sampler2D bottomTexture;\nuniform vec2 ratio;\nfloat PI = 3.14159265358979323846;\n\nfloat rand(vec2 co) {\n    return fract(sin(dot(co.xy, vec2(12.9898, 78.233))) * 43758.5453);\n}\n\nvec4 getBg(sampler2D texture, vec2 uv) {\n    vec2 center = vec2(0.5, 0.5);\n    vec2 rr = uv + 0.01 * 1.4 * (uv - center);\n    vec2 bb = uv - 0.02 * 1.4 * (uv - center);\n\n    float r = texture2D(texture, clamp(rr, 0.0, 1.0)).r;\n    float g = texture2D(texture, uv).g;\n    float b = texture2D(texture, clamp(bb, 0.0, 1.0)).b;\n\n    return vec4(r, g, b, 1.0);\n}\n\nvec3 checker(vec2 uv) {\n    return getBg(inputImageTexture, uv).rgb;\n}\n\nvec3 checker2(vec2 uv) {\n    return vec3(0.0);\n}\n\nvec4 getColor(vec2 uv) {\n    float d = length(uv);\n    if (d > 1.0) return vec4(checker2(uv), 1.0);\n    float z = sqrt(1.0 - 1.0 * d * d); //0.8->radius\n    float r = atan(d, z) / PI; //main deform fuction -> 1.0 / (PI/2) for normalization, then /2 for scale to [0,0.5]\n\n    float phi = atan(uv.y, uv.x);\n    uv = vec2(r * cos(phi), r * sin(phi) * ratio.x);\n    uv *= 1.8;//intensity\n    uv += vec2(0.5);\n    return vec4(checker(uv), 1.0);\n}\n\nvec4 reverse(sampler2D texture) {\n    vec2 tex = textureCoordinate;\n    tex.y = 1. - tex.y;\n    return texture2D(texture, tex);\n}\n\nvec4 blend_normal(vec4 base, vec4 overlay) {\n    return base + overlay * (1.0 - base.a);\n}\n\nvoid main() {\n    vec2 uv = textureCoordinate.xy * 2. - vec2(1.);\n    uv /= 1.4;//radius of visible\n    uv /= vec2(1., ratio.x);\n\n    vec4 fragColor = getColor(uv);\n    vec4 boxColor = texture2D(boxTexture, textureCoordinate);\n    vec4 bottomColor = texture2D(bottomTexture, textureCoordinate);\n\n    fragColor = blend_normal(bottomColor, fragColor);\n    fragColor = blend_normal(boxColor, fragColor);\n    gl_FragColor = fragColor;\n}"

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
    const-string v1, "boxTexture"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Ll/gri;->b:I

    .line 13
    .line 14
    iget v0, p0, Ll/wej;->programHandle:I

    .line 15
    .line 16
    const-string v1, "bottomTexture"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Ll/gri;->c:I

    .line 23
    .line 24
    iget v0, p0, Ll/wej;->programHandle:I

    .line 25
    .line 26
    const-string v1, "ratio"

    .line 27
    .line 28
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iput v0, p0, Ll/gri;->d:I

    .line 33
    .line 34
    return-void
.end method

.method public newTextureReady(ILl/gfj;Z)V
    .locals 1

    .line 1
    invoke-virtual {p2}, Ll/wej;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0, v0}, Ll/wej;->setWidth(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p2}, Ll/wej;->getHeight()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    invoke-virtual {p0, v0}, Ll/wej;->setHeight(I)V

    .line 13
    .line 14
    .line 15
    invoke-super {p0, p1, p2, p3}, Ll/i4;->newTextureReady(ILl/gfj;Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public passShaderValues()V
    .locals 4

    .line 1
    invoke-super {p0}, Ll/wej;->passShaderValues()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/gri;->e:I

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Ll/gri;->a:[Ljava/lang/String;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    aget-object v0, v0, v1

    .line 12
    .line 13
    invoke-static {v0}, Ll/oim;->c(Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Ll/oim;->a(Landroid/graphics/Bitmap;)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iput v0, p0, Ll/gri;->e:I

    .line 22
    .line 23
    :cond_0
    iget v0, p0, Ll/gri;->f:I

    .line 24
    .line 25
    const/4 v1, 0x1

    .line 26
    if-nez v0, :cond_1

    .line 27
    .line 28
    iget-object v0, p0, Ll/gri;->a:[Ljava/lang/String;

    .line 29
    .line 30
    aget-object v0, v0, v1

    .line 31
    .line 32
    invoke-static {v0}, Ll/oim;->c(Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-static {v0}, Ll/oim;->a(Landroid/graphics/Bitmap;)I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    iput v0, p0, Ll/gri;->f:I

    .line 41
    .line 42
    :cond_1
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    int-to-float v0, v0

    .line 47
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    int-to-float v2, v2

    .line 52
    div-float/2addr v0, v2

    .line 53
    iget v2, p0, Ll/gri;->d:I

    .line 54
    .line 55
    const/high16 v3, 0x3f800000    # 1.0f

    .line 56
    .line 57
    div-float/2addr v3, v0

    .line 58
    invoke-static {v2, v0, v3}, Landroid/opengl/GLES20;->glUniform2f(IFF)V

    .line 59
    .line 60
    .line 61
    const v0, 0x84c1

    .line 62
    .line 63
    .line 64
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 65
    .line 66
    .line 67
    iget v0, p0, Ll/gri;->f:I

    .line 68
    .line 69
    const/16 v2, 0xde1

    .line 70
    .line 71
    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 72
    .line 73
    .line 74
    iget v0, p0, Ll/gri;->c:I

    .line 75
    .line 76
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 77
    .line 78
    .line 79
    const v0, 0x84c2

    .line 80
    .line 81
    .line 82
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 83
    .line 84
    .line 85
    iget v0, p0, Ll/gri;->e:I

    .line 86
    .line 87
    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 88
    .line 89
    .line 90
    iget p0, p0, Ll/gri;->b:I

    .line 91
    .line 92
    const/4 v0, 0x2

    .line 93
    invoke-static {p0, v0}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public releaseFrameBuffer()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/gfj;->releaseFrameBuffer()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/gri;->Q1()V

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
    iget-object v0, p0, Ll/gri;->a:[Ljava/lang/String;

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
    const-string v3, "box.png"

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
    iget-object p0, p0, Ll/gri;->a:[Ljava/lang/String;

    .line 36
    .line 37
    new-instance v0, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1}, Lproject/android/imageprocessing/model/FilterOptions;->getFolder()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    const-string p1, "bottom.png"

    .line 53
    .line 54
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    const/4 v0, 0x1

    .line 62
    aput-object p1, p0, v0

    .line 63
    .line 64
    return-void
.end method
