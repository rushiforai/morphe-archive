.class public Ll/mlj;
.super Ll/umj0;
.source "SourceFile"


# instance fields
.field K:Ljava/lang/String;

.field L:F

.field M:I

.field private N:Ljava/lang/String;


# direct methods
.method public constructor <init>(F)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/umj0;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "blurSize"

    .line 5
    .line 6
    iput-object v0, p0, Ll/mlj;->K:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput v0, p0, Ll/mlj;->M:I

    .line 10
    .line 11
    const-string v0, "mediump"

    .line 12
    .line 13
    iput-object v0, p0, Ll/mlj;->N:Ljava/lang/String;

    .line 14
    .line 15
    iput p1, p0, Ll/mlj;->L:F

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public R(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/mlj;->L:F

    .line 2
    .line 3
    return-void
.end method

.method public f(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/mlj;->N:Ljava/lang/String;

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
    iget-object p0, p0, Ll/mlj;->N:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string p0, " float;\nuniform sampler2D inputImageTexture0;\nvarying vec2 textureCoordinate;\nuniform float texelWidthOffset;\nuniform float texelHeightOffset;\nuniform float blurSize;\n\nfloat SCurve(float x) {\n\t\tx = x * 2.0 - 1.0;\n\t\treturn -x * abs(x) * 0.5 + x + 0.5;\n}\n\nvec4 blur(sampler2D source, vec2 size, vec2 uv, float radius) {\n\tif (radius >= 1.0)\n\t{\n\t\tvec4 A = vec4(0.0); \n\t\tvec4 C = vec4(0.0); \n\t\tfloat width = size.x;// 1 / width\n\t\tfloat height = size.y;// 1 / height\n\t\tfloat divisor = 0.0; \n        float weight = 0.0;\n        float radiusMultiplier = 1.0 / radius;\n        for (float y = -radius; y <= radius; y++)\n\t\t{\n\t\t\tA = texture2D(source, uv + vec2(y * width, y * height));\n            weight = SCurve(1.0 - (abs(y) * radiusMultiplier)); \n            C += A * weight; \n\t\t\tdivisor += weight; \n\t\t}\n\t\treturn vec4(C.r / divisor, C.g / divisor, C.b / divisor, 1.0);\n\t}\n\treturn texture2D(source, uv);\n}\n\nvoid main(){\n\tgl_FragColor = blur(inputImageTexture0, vec2(texelWidthOffset, texelHeightOffset), textureCoordinate, blurSize);\n}"

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public u()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/umj0;->u()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/vej;->d:I

    .line 5
    .line 6
    iget-object v1, p0, Ll/mlj;->K:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Ll/mlj;->M:I

    .line 13
    .line 14
    return-void
.end method

.method public x()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/umj0;->x()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/mlj;->M:I

    .line 5
    .line 6
    iget p0, p0, Ll/mlj;->L:F

    .line 7
    .line 8
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
