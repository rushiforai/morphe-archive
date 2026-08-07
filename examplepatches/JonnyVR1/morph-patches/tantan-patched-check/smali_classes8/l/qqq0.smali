.class public Ll/qqq0;
.super Ll/hs10;
.source "SourceFile"


# instance fields
.field private a:I

.field private b:I

.field private c:F

.field private d:F

.field private e:Z

.field private f:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-direct {p0, v0}, Ll/hs10;-><init>(I)V

    .line 3
    .line 4
    .line 5
    const v0, 0x3f4ccccd    # 0.8f

    .line 6
    .line 7
    .line 8
    iput v0, p0, Ll/qqq0;->c:F

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput v0, p0, Ll/qqq0;->d:F

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput-boolean v0, p0, Ll/qqq0;->e:Z

    .line 15
    .line 16
    const/16 v0, 0x19

    .line 17
    .line 18
    iput v0, p0, Ll/qqq0;->f:I

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public Q1(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/qqq0;->e:Z

    .line 2
    .line 3
    const p1, 0x3f4ccccd    # 0.8f

    .line 4
    .line 5
    .line 6
    iput p1, p0, Ll/qqq0;->c:F

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput p1, p0, Ll/qqq0;->d:F

    .line 10
    .line 11
    return-void
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision highp float;\nuniform sampler2D inputImageTexture0;\nuniform sampler2D inputImageTexture1;\nvarying vec2 textureCoordinate;\nuniform float shift;\n  uniform float mixShift;\nvec2 scaleFromCenter(vec2 coord, float scale) {\n  if (scale < 0.0) { return coord; }\n  vec2 scaleCenter = vec2(0.5);\n  return (coord - scaleCenter) * scale + scaleCenter;\n}\nvoid main(){\n    vec2 uv = textureCoordinate;\n    vec2 uv1 = scaleFromCenter(uv,shift);\n    vec3 color1 = texture2D(inputImageTexture1, uv1).rgb;\n    vec3 color2 = texture2D(inputImageTexture0, uv).rgb;\n    vec3 mixColor = mix(color1, color2, 1.0 -mixShift);\n    gl_FragColor = vec4(mixColor,1.0);\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public initShaderHandles()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/hs10;->initShaderHandles()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/wej;->programHandle:I

    .line 5
    .line 6
    const-string v1, "shift"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Ll/qqq0;->a:I

    .line 13
    .line 14
    iget v0, p0, Ll/wej;->programHandle:I

    .line 15
    .line 16
    const-string v1, "mixShift"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Ll/qqq0;->b:I

    .line 23
    .line 24
    return-void
.end method

.method public passShaderValues()V
    .locals 6

    .line 1
    invoke-super {p0}, Ll/hs10;->passShaderValues()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Ll/qqq0;->e:Z

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    iget v0, p0, Ll/qqq0;->c:F

    .line 9
    .line 10
    iget v1, p0, Ll/qqq0;->f:I

    .line 11
    .line 12
    int-to-float v2, v1

    .line 13
    const v3, 0x3ecccccd    # 0.4f

    .line 14
    .line 15
    .line 16
    div-float/2addr v3, v2

    .line 17
    add-float/2addr v0, v3

    .line 18
    iput v0, p0, Ll/qqq0;->c:F

    .line 19
    .line 20
    float-to-double v2, v0

    .line 21
    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    .line 22
    .line 23
    cmpl-double v0, v2, v4

    .line 24
    .line 25
    const/high16 v2, 0x3f800000    # 1.0f

    .line 26
    .line 27
    if-ltz v0, :cond_0

    .line 28
    .line 29
    iput v2, p0, Ll/qqq0;->c:F

    .line 30
    .line 31
    :cond_0
    iget v0, p0, Ll/qqq0;->d:F

    .line 32
    .line 33
    int-to-float v1, v1

    .line 34
    div-float v1, v2, v1

    .line 35
    .line 36
    add-float/2addr v0, v1

    .line 37
    iput v0, p0, Ll/qqq0;->d:F

    .line 38
    .line 39
    float-to-double v0, v0

    .line 40
    cmpl-double v0, v0, v4

    .line 41
    .line 42
    if-ltz v0, :cond_1

    .line 43
    .line 44
    iput v2, p0, Ll/qqq0;->d:F

    .line 45
    .line 46
    :cond_1
    iget v0, p0, Ll/qqq0;->a:I

    .line 47
    .line 48
    iget v1, p0, Ll/qqq0;->c:F

    .line 49
    .line 50
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 51
    .line 52
    .line 53
    iget v0, p0, Ll/qqq0;->b:I

    .line 54
    .line 55
    iget p0, p0, Ll/qqq0;->d:F

    .line 56
    .line 57
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public setFrameRate(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/qqq0;->f:I

    .line 2
    .line 3
    return-void
.end method
