.class public Ll/klk0;
.super Ll/gs10;
.source "SourceFile"


# instance fields
.field private J:I

.field private K:I

.field private L:F

.field private M:F

.field private N:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-direct {p0, v0}, Ll/gs10;-><init>(I)V

    .line 3
    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput v0, p0, Ll/klk0;->J:I

    .line 7
    .line 8
    iput v0, p0, Ll/klk0;->K:I

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput v0, p0, Ll/klk0;->L:F

    .line 12
    .line 13
    iput v0, p0, Ll/klk0;->M:F

    .line 14
    .line 15
    const-string v0, "mediump"

    .line 16
    .line 17
    iput-object v0, p0, Ll/klk0;->N:Ljava/lang/String;

    .line 18
    .line 19
    return-void
.end method

.method private S()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, " vec3 rgb2yuv(vec3 color) {\n            float y =  0.299 * color.r + 0.587 * color.g + 0.114 * color.b;\n            float u = -0.147 * color.r - 0.289 * color.g + 0.436 * color.b;\n            float v =  0.615 * color.r - 0.515 * color.g - 0.100 * color.b;\n            return vec3(y, u, v);\n        }\n"

    .line 2
    .line 3
    return-object p0
.end method

.method private V()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "vec3 yuv2rgb(vec3 color) {\n            float y = color.r; float u = color.g; float v = color.b;\n            float r = y + 1.14 * v;\n            float g = y - 0.39 * u - 0.58 * v;\n            float b = y + 2.03 * u;\n            return vec3(r, g, b);\n        }\n"

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public T(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/klk0;->M:F

    .line 2
    .line 3
    return-void
.end method

.method public U(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/klk0;->L:F

    .line 2
    .line 3
    return-void
.end method

.method public f(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/klk0;->N:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public p()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "precision "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ll/klk0;->N:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " float;\nuniform sampler2D inputImageTexture0;\nuniform sampler2D inputImageTexture1;\nvarying vec2 textureCoordinate;\nuniform float threshold;\nuniform float scale;\n"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-direct {p0}, Ll/klk0;->S()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-direct {p0}, Ll/klk0;->V()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    const-string p0, "void main(){\n   vec4 textureColor = texture2D(inputImageTexture0,textureCoordinate);\n   vec4 blurColor = texture2D(inputImageTexture1,textureCoordinate);\n   vec3 textureYUV = rgb2yuv(textureColor.rgb);\n   vec3 blurYUV = rgb2yuv(blurColor.rgb);\n   if (abs(textureYUV.r - blurYUV.r) < threshold) {\n       gl_FragColor = textureColor;\n   } else {\n       float sharpenY = textureYUV.r * (1.0 + scale) - scale * blurYUV.r;\n       vec3 temp = yuv2rgb(vec3(sharpenY, textureYUV.gb));\n       gl_FragColor = vec4(temp, textureColor.a);\n   }\n}\n"

    .line 33
    .line 34
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0
.end method

.method public u()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/gs10;->u()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/vej;->d:I

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
    iput v0, p0, Ll/klk0;->J:I

    .line 13
    .line 14
    iget v0, p0, Ll/vej;->d:I

    .line 15
    .line 16
    const-string v1, "scale"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Ll/klk0;->K:I

    .line 23
    .line 24
    return-void
.end method

.method public x()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/gs10;->x()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/klk0;->J:I

    .line 5
    .line 6
    iget v1, p0, Ll/klk0;->L:F

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 9
    .line 10
    .line 11
    iget v0, p0, Ll/klk0;->K:I

    .line 12
    .line 13
    iget p0, p0, Ll/klk0;->M:F

    .line 14
    .line 15
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
