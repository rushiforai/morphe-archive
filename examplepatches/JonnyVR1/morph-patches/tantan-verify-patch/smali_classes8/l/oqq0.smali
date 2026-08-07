.class public Ll/oqq0;
.super Ll/hs10;
.source "SourceFile"


# instance fields
.field private A:F

.field private B:F

.field private C:F

.field private a:I

.field private b:I

.field private c:I

.field private d:I

.field private e:I

.field private f:I

.field private g:I

.field private i:Z

.field private j:F

.field private k:F

.field private l:F

.field private m:F

.field private n:F

.field private o:F

.field private p:F

.field private q:F

.field private r:F

.field public s:[F

.field private t:F

.field private u:F

.field private v:F

.field private x:Z

.field private y:F

.field private z:F


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-direct {p0, v0}, Ll/hs10;-><init>(I)V

    .line 3
    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Ll/oqq0;->i:Z

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    iput v1, p0, Ll/oqq0;->j:F

    .line 10
    .line 11
    const/high16 v2, 0x3f000000    # 0.5f

    .line 12
    .line 13
    iput v2, p0, Ll/oqq0;->k:F

    .line 14
    .line 15
    iput v1, p0, Ll/oqq0;->l:F

    .line 16
    .line 17
    const/high16 v3, 0x3f800000    # 1.0f

    .line 18
    .line 19
    iput v3, p0, Ll/oqq0;->m:F

    .line 20
    .line 21
    iput v3, p0, Ll/oqq0;->n:F

    .line 22
    .line 23
    iput v1, p0, Ll/oqq0;->o:F

    .line 24
    .line 25
    iput v1, p0, Ll/oqq0;->p:F

    .line 26
    .line 27
    iput v1, p0, Ll/oqq0;->q:F

    .line 28
    .line 29
    iput v3, p0, Ll/oqq0;->r:F

    .line 30
    .line 31
    const/high16 v3, -0x40800000    # -1.0f

    .line 32
    .line 33
    iput v3, p0, Ll/oqq0;->t:F

    .line 34
    .line 35
    iput v1, p0, Ll/oqq0;->u:F

    .line 36
    .line 37
    iput v1, p0, Ll/oqq0;->v:F

    .line 38
    .line 39
    iput-boolean v0, p0, Ll/oqq0;->x:Z

    .line 40
    .line 41
    iput v1, p0, Ll/oqq0;->y:F

    .line 42
    .line 43
    iput v1, p0, Ll/oqq0;->z:F

    .line 44
    .line 45
    iput v1, p0, Ll/oqq0;->B:F

    .line 46
    .line 47
    iput v2, p0, Ll/oqq0;->C:F

    .line 48
    .line 49
    const/16 v0, 0x10

    .line 50
    .line 51
    new-array v0, v0, [F

    .line 52
    .line 53
    fill-array-data v0, :array_0

    .line 54
    .line 55
    .line 56
    iput-object v0, p0, Ll/oqq0;->s:[F

    .line 57
    .line 58
    return-void

    .line 59
    :array_0
    .array-data 4
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        -0x40800000    # -1.0f
        0x0
        0x3f800000    # 1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method


# virtual methods
.method public Q1()V
    .locals 4

    .line 1
    iget v0, p0, Ll/oqq0;->k:F

    .line 2
    .line 3
    iget v1, p0, Ll/oqq0;->o:F

    .line 4
    .line 5
    add-float/2addr v0, v1

    .line 6
    iput v0, p0, Ll/oqq0;->k:F

    .line 7
    .line 8
    const v1, 0x3f333333    # 0.7f

    .line 9
    .line 10
    .line 11
    cmpl-float v0, v0, v1

    .line 12
    .line 13
    if-ltz v0, :cond_0

    .line 14
    .line 15
    iput v1, p0, Ll/oqq0;->k:F

    .line 16
    .line 17
    :cond_0
    iget v0, p0, Ll/oqq0;->C:F

    .line 18
    .line 19
    iget v1, p0, Ll/oqq0;->B:F

    .line 20
    .line 21
    add-float/2addr v0, v1

    .line 22
    iput v0, p0, Ll/oqq0;->C:F

    .line 23
    .line 24
    const v1, 0x3f19999a    # 0.6f

    .line 25
    .line 26
    .line 27
    cmpl-float v0, v0, v1

    .line 28
    .line 29
    if-ltz v0, :cond_1

    .line 30
    .line 31
    iput v1, p0, Ll/oqq0;->C:F

    .line 32
    .line 33
    :cond_1
    iget v0, p0, Ll/oqq0;->r:F

    .line 34
    .line 35
    new-instance v1, Landroid/graphics/PointF;

    .line 36
    .line 37
    iget v2, p0, Ll/oqq0;->k:F

    .line 38
    .line 39
    iget v3, p0, Ll/oqq0;->C:F

    .line 40
    .line 41
    invoke-direct {v1, v2, v3}, Landroid/graphics/PointF;-><init>(FF)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0, v0, v0, v1}, Ll/oqq0;->S1(FFLandroid/graphics/PointF;)[F

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {p0, v0}, Ll/wej;->setRenderVertices([F)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public R1(F)V
    .locals 1

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    sub-float p1, v0, p1

    .line 4
    .line 5
    add-float/2addr p1, v0

    .line 6
    iput p1, p0, Ll/oqq0;->n:F

    .line 7
    .line 8
    return-void
.end method

.method public S1(FFLandroid/graphics/PointF;)[F
    .locals 11

    .line 1
    if-nez p3, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    iget v0, p3, Landroid/graphics/PointF;->x:F

    .line 6
    .line 7
    const/high16 v1, 0x40000000    # 2.0f

    .line 8
    .line 9
    mul-float/2addr v0, v1

    .line 10
    const/high16 v2, 0x3f800000    # 1.0f

    .line 11
    .line 12
    sub-float/2addr v0, v2

    .line 13
    neg-float v0, v0

    .line 14
    iget p3, p3, Landroid/graphics/PointF;->y:F

    .line 15
    .line 16
    neg-float p3, p3

    .line 17
    mul-float/2addr p3, v1

    .line 18
    add-float/2addr p3, v2

    .line 19
    const/16 v1, 0x10

    .line 20
    .line 21
    new-array v3, v1, [F

    .line 22
    .line 23
    new-array v5, v1, [F

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    invoke-static {v5, v1}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    .line 27
    .line 28
    .line 29
    invoke-static {v3, v1}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    .line 30
    .line 31
    .line 32
    neg-float v0, v0

    .line 33
    const/4 v4, 0x0

    .line 34
    invoke-static {v5, v1, v0, p3, v4}, Landroid/opengl/Matrix;->translateM([FIFFF)V

    .line 35
    .line 36
    .line 37
    const/4 v6, 0x0

    .line 38
    const/4 v8, 0x0

    .line 39
    const/4 v4, 0x0

    .line 40
    move-object v7, v3

    .line 41
    invoke-static/range {v3 .. v8}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    .line 42
    .line 43
    .line 44
    mul-float/2addr p1, v2

    .line 45
    mul-float/2addr p2, v2

    .line 46
    invoke-static {v3, v1, p1, p2, v2}, Landroid/opengl/Matrix;->scaleM([FIFFF)V

    .line 47
    .line 48
    .line 49
    iget-object v7, p0, Ll/oqq0;->s:[F

    .line 50
    .line 51
    move-object v10, v5

    .line 52
    move-object v5, v3

    .line 53
    move-object v3, v10

    .line 54
    invoke-static/range {v3 .. v8}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    .line 55
    .line 56
    .line 57
    move-object v5, v3

    .line 58
    aget p0, v5, v1

    .line 59
    .line 60
    const/4 p1, 0x1

    .line 61
    aget p2, v5, p1

    .line 62
    .line 63
    const/4 p3, 0x4

    .line 64
    aget v0, v5, p3

    .line 65
    .line 66
    const/4 v2, 0x5

    .line 67
    aget v3, v5, v2

    .line 68
    .line 69
    const/16 v4, 0x8

    .line 70
    .line 71
    aget v6, v5, v4

    .line 72
    .line 73
    const/16 v7, 0x9

    .line 74
    .line 75
    aget v7, v5, v7

    .line 76
    .line 77
    const/16 v8, 0xc

    .line 78
    .line 79
    aget v8, v5, v8

    .line 80
    .line 81
    const/16 v9, 0xd

    .line 82
    .line 83
    aget v5, v5, v9

    .line 84
    .line 85
    new-array v4, v4, [F

    .line 86
    .line 87
    aput p0, v4, v1

    .line 88
    .line 89
    aput p2, v4, p1

    .line 90
    .line 91
    const/4 p0, 0x2

    .line 92
    aput v0, v4, p0

    .line 93
    .line 94
    const/4 p0, 0x3

    .line 95
    aput v3, v4, p0

    .line 96
    .line 97
    aput v6, v4, p3

    .line 98
    .line 99
    aput v7, v4, v2

    .line 100
    .line 101
    const/4 p0, 0x6

    .line 102
    aput v8, v4, p0

    .line 103
    .line 104
    const/4 p0, 0x7

    .line 105
    aput v5, v4, p0

    .line 106
    .line 107
    return-object v4
.end method

.method public T1(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/oqq0;->j:F

    .line 2
    .line 3
    return-void
.end method

.method public U1(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/oqq0;->q:F

    .line 2
    .line 3
    return-void
.end method

.method public V1(F)V
    .locals 1

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    sub-float p1, v0, p1

    .line 4
    .line 5
    add-float/2addr p1, v0

    .line 6
    iput p1, p0, Ll/oqq0;->l:F

    .line 7
    .line 8
    iput p1, p0, Ll/oqq0;->m:F

    .line 9
    .line 10
    return-void
.end method

.method public W1(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/oqq0;->p:F

    .line 2
    .line 3
    iput p1, p0, Ll/oqq0;->A:F

    .line 4
    .line 5
    return-void
.end method

.method public X1(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/oqq0;->k:F

    .line 2
    .line 3
    return-void
.end method

.method public Y1(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/oqq0;->o:F

    .line 2
    .line 3
    return-void
.end method

.method public Z1(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/oqq0;->C:F

    .line 2
    .line 3
    return-void
.end method

.method public a2(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/oqq0;->B:F

    .line 2
    .line 3
    return-void
.end method

.method public b2(ZI)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/oqq0;->x:Z

    .line 2
    .line 3
    int-to-float p1, p2

    .line 4
    iput p1, p0, Ll/oqq0;->y:F

    .line 5
    .line 6
    return-void
.end method

.method public c2(F)V
    .locals 2

    .line 1
    const/high16 v0, 0x40000000    # 2.0f

    .line 2
    .line 3
    const/high16 v1, 0x3f800000    # 1.0f

    .line 4
    .line 5
    sub-float/2addr p1, v1

    .line 6
    mul-float/2addr p1, v0

    .line 7
    add-float/2addr p1, v1

    .line 8
    iput p1, p0, Ll/oqq0;->r:F

    .line 9
    .line 10
    return-void
.end method

.method public d2(Z)V
    .locals 2

    .line 1
    iput-boolean p1, p0, Ll/oqq0;->i:Z

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput p1, p0, Ll/oqq0;->j:F

    .line 5
    .line 6
    const/high16 v0, 0x3f000000    # 0.5f

    .line 7
    .line 8
    iput v0, p0, Ll/oqq0;->k:F

    .line 9
    .line 10
    iput p1, p0, Ll/oqq0;->l:F

    .line 11
    .line 12
    const/high16 v0, 0x3f800000    # 1.0f

    .line 13
    .line 14
    iput v0, p0, Ll/oqq0;->n:F

    .line 15
    .line 16
    iput p1, p0, Ll/oqq0;->o:F

    .line 17
    .line 18
    iput p1, p0, Ll/oqq0;->p:F

    .line 19
    .line 20
    iput p1, p0, Ll/oqq0;->q:F

    .line 21
    .line 22
    iput p1, p0, Ll/oqq0;->v:F

    .line 23
    .line 24
    const/high16 v1, -0x40800000    # -1.0f

    .line 25
    .line 26
    iput v1, p0, Ll/oqq0;->t:F

    .line 27
    .line 28
    iput p1, p0, Ll/oqq0;->u:F

    .line 29
    .line 30
    const/4 v1, 0x0

    .line 31
    iput-boolean v1, p0, Ll/oqq0;->x:Z

    .line 32
    .line 33
    iput v0, p0, Ll/oqq0;->y:F

    .line 34
    .line 35
    iput p1, p0, Ll/oqq0;->z:F

    .line 36
    .line 37
    iput p1, p0, Ll/oqq0;->m:F

    .line 38
    .line 39
    iput p1, p0, Ll/oqq0;->A:F

    .line 40
    .line 41
    return-void
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision highp float;\nuniform sampler2D inputImageTexture0;\nuniform sampler2D inputImageTexture1;\nvarying vec2 textureCoordinate;\nuniform float scale;\n  uniform float ratio;\n  uniform float initScale;\n  uniform float slope;\n  uniform float intercept;\n  uniform float useTransfer;\n  uniform float index;\nvec2 scaleFromCenter(vec2 coord, float scale) {\n  if (scale < 0.0) { return coord; }\n  vec2 scaleCenter = vec2(0.5);\n  return (coord - scaleCenter) * scale + scaleCenter;\n}\nvoid main(){\n    vec2 uv = textureCoordinate;\n    vec2 uv1 = scaleFromCenter(uv,scale);\n    vec3 color1 = texture2D(inputImageTexture1, uv1).rgb;\n    vec2 uv2 = scaleFromCenter(uv,initScale);\n    vec3 color2 = texture2D(inputImageTexture0, uv2).rgb;\n    vec3 mixColor = mix(color1, color2, 1.0 - ratio);\n    if (useTransfer == 1.0) {\n       if (index == 0.0) {\n          if (uv.x > slope * uv.y + intercept) {\n             gl_FragColor = vec4(mixColor,1.0);\n          } else {\n             gl_FragColor = vec4(1.0,1.0,1.0,1.0);\n          }\n       } else {\n          if (uv.x < slope * uv.y + intercept) {\n             gl_FragColor = vec4(mixColor,1.0);\n          } else {\n             gl_FragColor = vec4(1.0,1.0,1.0,1.0);\n          }\n       }\n    } else {\n      gl_FragColor = vec4(mixColor,1.0);\n    }\n}\n"

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
    const-string v1, "scale"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Ll/oqq0;->a:I

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
    iput v0, p0, Ll/oqq0;->b:I

    .line 23
    .line 24
    iget v0, p0, Ll/wej;->programHandle:I

    .line 25
    .line 26
    const-string v1, "initScale"

    .line 27
    .line 28
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iput v0, p0, Ll/oqq0;->c:I

    .line 33
    .line 34
    iget v0, p0, Ll/wej;->programHandle:I

    .line 35
    .line 36
    const-string v1, "slope"

    .line 37
    .line 38
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iput v0, p0, Ll/oqq0;->d:I

    .line 43
    .line 44
    iget v0, p0, Ll/wej;->programHandle:I

    .line 45
    .line 46
    const-string v1, "intercept"

    .line 47
    .line 48
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    iput v0, p0, Ll/oqq0;->e:I

    .line 53
    .line 54
    iget v0, p0, Ll/wej;->programHandle:I

    .line 55
    .line 56
    const-string v1, "useTransfer"

    .line 57
    .line 58
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    iput v0, p0, Ll/oqq0;->f:I

    .line 63
    .line 64
    iget v0, p0, Ll/wej;->programHandle:I

    .line 65
    .line 66
    const-string v1, "index"

    .line 67
    .line 68
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    iput v0, p0, Ll/oqq0;->g:I

    .line 73
    .line 74
    return-void
.end method

.method public passShaderValues()V
    .locals 8

    .line 1
    invoke-virtual {p0}, Ll/oqq0;->Q1()V

    .line 2
    .line 3
    .line 4
    invoke-super {p0}, Ll/hs10;->passShaderValues()V

    .line 5
    .line 6
    .line 7
    iget-boolean v0, p0, Ll/oqq0;->i:Z

    .line 8
    .line 9
    if-eqz v0, :cond_4

    .line 10
    .line 11
    iget v0, p0, Ll/oqq0;->p:F

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    cmpl-float v2, v0, v1

    .line 15
    .line 16
    const/high16 v3, 0x3f800000    # 1.0f

    .line 17
    .line 18
    if-lez v2, :cond_0

    .line 19
    .line 20
    iget v2, p0, Ll/oqq0;->l:F

    .line 21
    .line 22
    add-float/2addr v2, v0

    .line 23
    iput v2, p0, Ll/oqq0;->l:F

    .line 24
    .line 25
    cmpl-float v0, v2, v3

    .line 26
    .line 27
    if-ltz v0, :cond_1

    .line 28
    .line 29
    iput v3, p0, Ll/oqq0;->l:F

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    add-float v2, v0, v3

    .line 33
    .line 34
    iput v2, p0, Ll/oqq0;->l:F

    .line 35
    .line 36
    iget v4, p0, Ll/oqq0;->A:F

    .line 37
    .line 38
    add-float/2addr v0, v4

    .line 39
    iput v0, p0, Ll/oqq0;->p:F

    .line 40
    .line 41
    iget v0, p0, Ll/oqq0;->m:F

    .line 42
    .line 43
    cmpg-float v2, v2, v0

    .line 44
    .line 45
    if-gtz v2, :cond_1

    .line 46
    .line 47
    iput v0, p0, Ll/oqq0;->l:F

    .line 48
    .line 49
    :cond_1
    :goto_0
    iget v0, p0, Ll/oqq0;->j:F

    .line 50
    .line 51
    iget v2, p0, Ll/oqq0;->q:F

    .line 52
    .line 53
    add-float/2addr v0, v2

    .line 54
    iput v0, p0, Ll/oqq0;->j:F

    .line 55
    .line 56
    float-to-double v4, v0

    .line 57
    const-wide/high16 v6, 0x3ff0000000000000L    # 1.0

    .line 58
    .line 59
    cmpl-double v0, v4, v6

    .line 60
    .line 61
    if-ltz v0, :cond_2

    .line 62
    .line 63
    iput v3, p0, Ll/oqq0;->j:F

    .line 64
    .line 65
    :cond_2
    iget-boolean v0, p0, Ll/oqq0;->x:Z

    .line 66
    .line 67
    if-eqz v0, :cond_4

    .line 68
    .line 69
    iget v0, p0, Ll/oqq0;->y:F

    .line 70
    .line 71
    cmpl-float v0, v0, v1

    .line 72
    .line 73
    if-nez v0, :cond_3

    .line 74
    .line 75
    iget v0, p0, Ll/oqq0;->p:F

    .line 76
    .line 77
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    const v1, 0x3e4ccccd    # 0.2f

    .line 82
    .line 83
    .line 84
    cmpl-float v0, v0, v1

    .line 85
    .line 86
    if-ltz v0, :cond_3

    .line 87
    .line 88
    iget v0, p0, Ll/oqq0;->u:F

    .line 89
    .line 90
    add-float/2addr v0, v3

    .line 91
    iput v0, p0, Ll/oqq0;->u:F

    .line 92
    .line 93
    neg-float v0, v0

    .line 94
    iput v0, p0, Ll/oqq0;->v:F

    .line 95
    .line 96
    iget v0, p0, Ll/oqq0;->t:F

    .line 97
    .line 98
    const/high16 v1, 0x3fc00000    # 1.5f

    .line 99
    .line 100
    add-float/2addr v0, v1

    .line 101
    iput v0, p0, Ll/oqq0;->t:F

    .line 102
    .line 103
    iput v3, p0, Ll/oqq0;->z:F

    .line 104
    .line 105
    goto :goto_1

    .line 106
    :cond_3
    iget v0, p0, Ll/oqq0;->y:F

    .line 107
    .line 108
    cmpl-float v0, v0, v3

    .line 109
    .line 110
    if-nez v0, :cond_4

    .line 111
    .line 112
    iget v0, p0, Ll/oqq0;->u:F

    .line 113
    .line 114
    add-float/2addr v0, v3

    .line 115
    iput v0, p0, Ll/oqq0;->u:F

    .line 116
    .line 117
    neg-float v0, v0

    .line 118
    iput v0, p0, Ll/oqq0;->v:F

    .line 119
    .line 120
    iget v0, p0, Ll/oqq0;->t:F

    .line 121
    .line 122
    const v1, 0x3fa66666    # 1.3f

    .line 123
    .line 124
    .line 125
    add-float/2addr v0, v1

    .line 126
    iput v0, p0, Ll/oqq0;->t:F

    .line 127
    .line 128
    iput v3, p0, Ll/oqq0;->z:F

    .line 129
    .line 130
    :cond_4
    :goto_1
    iget v0, p0, Ll/oqq0;->a:I

    .line 131
    .line 132
    iget v1, p0, Ll/oqq0;->l:F

    .line 133
    .line 134
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 135
    .line 136
    .line 137
    iget v0, p0, Ll/oqq0;->b:I

    .line 138
    .line 139
    iget v1, p0, Ll/oqq0;->j:F

    .line 140
    .line 141
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 142
    .line 143
    .line 144
    iget v0, p0, Ll/oqq0;->c:I

    .line 145
    .line 146
    iget v1, p0, Ll/oqq0;->n:F

    .line 147
    .line 148
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 149
    .line 150
    .line 151
    iget v0, p0, Ll/oqq0;->d:I

    .line 152
    .line 153
    iget v1, p0, Ll/oqq0;->v:F

    .line 154
    .line 155
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 156
    .line 157
    .line 158
    iget v0, p0, Ll/oqq0;->e:I

    .line 159
    .line 160
    iget v1, p0, Ll/oqq0;->t:F

    .line 161
    .line 162
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 163
    .line 164
    .line 165
    iget v0, p0, Ll/oqq0;->f:I

    .line 166
    .line 167
    iget v1, p0, Ll/oqq0;->z:F

    .line 168
    .line 169
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 170
    .line 171
    .line 172
    iget v0, p0, Ll/oqq0;->g:I

    .line 173
    .line 174
    iget p0, p0, Ll/oqq0;->y:F

    .line 175
    .line 176
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 177
    .line 178
    .line 179
    return-void
.end method
