.class public Ll/te3;
.super Ll/hs10;
.source "SourceFile"


# instance fields
.field private a:I

.field private b:F

.field private c:Z

.field private d:I


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
    const/4 v0, 0x0

    .line 6
    iput v0, p0, Ll/te3;->b:F

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Ll/te3;->c:Z

    .line 10
    .line 11
    const/16 v0, 0x19

    .line 12
    .line 13
    iput v0, p0, Ll/te3;->d:I

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public Q1(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/te3;->c:Z

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput p1, p0, Ll/te3;->b:F

    .line 5
    .line 6
    return-void
.end method

.method public destroy()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/hs10;->destroy()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/te3;->b:F

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Ll/te3;->c:Z

    .line 9
    .line 10
    return-void
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision highp float;\nuniform sampler2D inputImageTexture0;\nuniform sampler2D inputImageTexture1;\nvarying vec2 textureCoordinate;\nuniform float shift;\nvec2 scaleFromCenter(vec2 coord, float scale) {\n  if (scale < 0.0) { return coord; }\n  vec2 scaleCenter = vec2(0.5);\n  return (coord - scaleCenter) * scale + scaleCenter;\n}\nvoid main(){\n    vec2 uv = textureCoordinate;\n    if (uv.y <= shift){\n    vec2 uv1 = vec2(uv.x,uv.y + 1.0 - shift);\n       gl_FragColor = texture2D(inputImageTexture1, uv1);\n    } else {\n        vec2 uv2 = scaleFromCenter(uv,1.0 + .2*shift);\n        if (uv.x > 0.2 * shift *0.5 && uv.x < 1.0 - 0.2 * shift *0.5\n           && uv.y > 0.2 * shift *0.5 && uv.y < 1.0 - 0.2 * shift*0.5) {\n           gl_FragColor = texture2D(inputImageTexture0, uv2)*(1.0 -  shift);\n        }\n    }\n}\n"

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
    iput v0, p0, Ll/te3;->a:I

    .line 13
    .line 14
    return-void
.end method

.method public passShaderValues()V
    .locals 6

    .line 1
    invoke-super {p0}, Ll/hs10;->passShaderValues()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Ll/te3;->c:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget v0, p0, Ll/te3;->b:F

    .line 9
    .line 10
    const/high16 v1, 0x3f800000    # 1.0f

    .line 11
    .line 12
    cmpg-float v2, v0, v1

    .line 13
    .line 14
    if-gez v2, :cond_0

    .line 15
    .line 16
    iget v2, p0, Ll/te3;->d:I

    .line 17
    .line 18
    int-to-float v2, v2

    .line 19
    const/high16 v3, 0x40000000    # 2.0f

    .line 20
    .line 21
    div-float/2addr v3, v2

    .line 22
    add-float/2addr v0, v3

    .line 23
    iput v0, p0, Ll/te3;->b:F

    .line 24
    .line 25
    float-to-double v2, v0

    .line 26
    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    .line 27
    .line 28
    cmpl-double v0, v2, v4

    .line 29
    .line 30
    if-ltz v0, :cond_0

    .line 31
    .line 32
    iput v1, p0, Ll/te3;->b:F

    .line 33
    .line 34
    :cond_0
    iget v0, p0, Ll/te3;->a:I

    .line 35
    .line 36
    iget p0, p0, Ll/te3;->b:F

    .line 37
    .line 38
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public setFrameRate(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/te3;->d:I

    .line 2
    .line 3
    return-void
.end method
