.class public Ll/nyh0;
.super Ll/rt2;
.source "SourceFile"

# interfaces
.implements Ll/gam;


# instance fields
.field private a:I

.field private b:I

.field private c:I

.field private d:I

.field private e:I

.field private f:F

.field private g:F

.field private i:F

.field private j:F

.field private k:F

.field private l:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/rt2;-><init>()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x3f800000    # 1.0f

    .line 5
    .line 6
    iput v0, p0, Ll/nyh0;->f:F

    .line 7
    .line 8
    iput v0, p0, Ll/nyh0;->g:F

    .line 9
    .line 10
    iput v0, p0, Ll/nyh0;->i:F

    .line 11
    .line 12
    iput v0, p0, Ll/nyh0;->j:F

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput v0, p0, Ll/nyh0;->k:F

    .line 16
    .line 17
    const-wide/32 v0, 0x186a0

    .line 18
    .line 19
    .line 20
    iput-wide v0, p0, Ll/nyh0;->l:J

    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision highp float;\nuniform sampler2D inputImageTexture0;\nuniform float colorization;\nuniform float noise;\nuniform float parasite;\nuniform float fade;\nuniform float time;\nvarying vec2 textureCoordinate;\nfloat rng2(vec2 seed, float time)\n{\n    return fract(sin(dot(seed * floor(time * 12.0), vec2(12.9898,78.233))) * 43758.5453123);\n}\nfloat rng(float seed, float time)\n{\n    return rng2(vec2(seed, 1.0), time);\n}\nvoid main(){\n   vec2 uv = textureCoordinate;\n   vec2 blockS = floor(uv * vec2(24.0,9.0));\n   vec2 blockL = floor(uv * vec2(8.0,4.0));\n   float r = rng2(uv,time);\n   vec3 noise_ = (vec3(r, 1. - r * colorization, r / 2.0 + 0.5) * 1.0 * noise - 2.0) * 0.08;\n   float lineNoise = pow(rng2(blockS, time), 8.0) * parasite * pow(rng2(blockL, time), 3.0) - pow(rng(7.2341, time), 17.0) * 2.0;\n   vec4 col1 = texture2D(inputImageTexture0,uv).rgba;\n   vec4 col2 = texture2D(inputImageTexture0,uv + vec2(lineNoise * 0.05 * rng(5.0, time), 0)).rgba;\n   vec4 col3 = texture2D(inputImageTexture0,uv - vec2(lineNoise * 0.05 * rng(31.0, time), 0)).rgba;\n   vec4 result = vec4(vec3(col1.x, col2.y, col3.z) + noise_, 1.0);\n   result = mix(col1,result,fade);\n   gl_FragColor = result;\n}\n"

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
    const-string v1, "colorization"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Ll/nyh0;->a:I

    .line 13
    .line 14
    iget v0, p0, Ll/wej;->programHandle:I

    .line 15
    .line 16
    const-string v1, "noise"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Ll/nyh0;->b:I

    .line 23
    .line 24
    iget v0, p0, Ll/wej;->programHandle:I

    .line 25
    .line 26
    const-string v1, "parasite"

    .line 27
    .line 28
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iput v0, p0, Ll/nyh0;->c:I

    .line 33
    .line 34
    iget v0, p0, Ll/wej;->programHandle:I

    .line 35
    .line 36
    const-string v1, "fade"

    .line 37
    .line 38
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iput v0, p0, Ll/nyh0;->d:I

    .line 43
    .line 44
    iget v0, p0, Ll/wej;->programHandle:I

    .line 45
    .line 46
    const-string v1, "time"

    .line 47
    .line 48
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    iput v0, p0, Ll/nyh0;->e:I

    .line 53
    .line 54
    return-void
.end method

.method public passShaderValues()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/wej;->passShaderValues()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/nyh0;->a:I

    .line 5
    .line 6
    iget v1, p0, Ll/nyh0;->f:F

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 9
    .line 10
    .line 11
    iget v0, p0, Ll/nyh0;->b:I

    .line 12
    .line 13
    iget v1, p0, Ll/nyh0;->g:F

    .line 14
    .line 15
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 16
    .line 17
    .line 18
    iget v0, p0, Ll/nyh0;->c:I

    .line 19
    .line 20
    iget v1, p0, Ll/nyh0;->i:F

    .line 21
    .line 22
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 23
    .line 24
    .line 25
    iget v0, p0, Ll/nyh0;->d:I

    .line 26
    .line 27
    iget v1, p0, Ll/nyh0;->j:F

    .line 28
    .line 29
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 30
    .line 31
    .line 32
    iget v0, p0, Ll/nyh0;->e:I

    .line 33
    .line 34
    iget p0, p0, Ll/nyh0;->k:F

    .line 35
    .line 36
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public setTimeStamp(J)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Ll/bof0;->setTimeStamp(J)V

    .line 2
    .line 3
    .line 4
    long-to-float p1, p1

    .line 5
    const/high16 p2, 0x44960000    # 1200.0f

    .line 6
    .line 7
    div-float/2addr p1, p2

    .line 8
    iput p1, p0, Ll/nyh0;->k:F

    .line 9
    .line 10
    return-void
.end method
