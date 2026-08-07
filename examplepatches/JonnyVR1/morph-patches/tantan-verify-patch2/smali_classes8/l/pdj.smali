.class public Ll/pdj;
.super Ll/jt2;
.source "SourceFile"


# instance fields
.field protected a:I

.field protected b:[F

.field protected c:F

.field protected d:F

.field protected e:F

.field protected f:F

.field protected g:F

.field protected i:F

.field protected j:Z

.field protected k:Ll/ymi;

.field protected l:F

.field protected m:F

.field protected n:F


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/jt2;-><init>()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x3f000000    # 0.5f

    .line 5
    .line 6
    iput v0, p0, Ll/pdj;->c:F

    .line 7
    .line 8
    const/high16 v0, 0x3f800000    # 1.0f

    .line 9
    .line 10
    iput v0, p0, Ll/pdj;->d:F

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    iput v1, p0, Ll/pdj;->e:F

    .line 14
    .line 15
    iput v1, p0, Ll/pdj;->f:F

    .line 16
    .line 17
    iput v0, p0, Ll/pdj;->g:F

    .line 18
    .line 19
    iput v0, p0, Ll/pdj;->i:F

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    iput-boolean v0, p0, Ll/pdj;->j:Z

    .line 23
    .line 24
    const v0, 0x3d23d70a    # 0.04f

    .line 25
    .line 26
    .line 27
    iput v0, p0, Ll/pdj;->l:F

    .line 28
    .line 29
    const/16 v0, 0x10

    .line 30
    .line 31
    new-array v0, v0, [F

    .line 32
    .line 33
    fill-array-data v0, :array_0

    .line 34
    .line 35
    .line 36
    iput-object v0, p0, Ll/pdj;->b:[F

    .line 37
    .line 38
    return-void

    .line 39
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
    iget v0, p0, Ll/pdj;->m:F

    .line 2
    .line 3
    iget v1, p0, Ll/pdj;->n:F

    .line 4
    .line 5
    cmpl-float v0, v0, v1

    .line 6
    .line 7
    if-ltz v0, :cond_0

    .line 8
    .line 9
    iget v0, p0, Ll/pdj;->c:F

    .line 10
    .line 11
    iget v1, p0, Ll/pdj;->f:F

    .line 12
    .line 13
    add-float/2addr v0, v1

    .line 14
    iput v0, p0, Ll/pdj;->c:F

    .line 15
    .line 16
    iget v1, p0, Ll/pdj;->d:F

    .line 17
    .line 18
    const/high16 v2, 0x40000000    # 2.0f

    .line 19
    .line 20
    div-float v3, v1, v2

    .line 21
    .line 22
    cmpl-float v0, v0, v3

    .line 23
    .line 24
    if-lez v0, :cond_0

    .line 25
    .line 26
    div-float/2addr v1, v2

    .line 27
    iput v1, p0, Ll/pdj;->c:F

    .line 28
    .line 29
    :cond_0
    iget v0, p0, Ll/pdj;->d:F

    .line 30
    .line 31
    new-instance v1, Landroid/graphics/PointF;

    .line 32
    .line 33
    iget v2, p0, Ll/pdj;->c:F

    .line 34
    .line 35
    const/high16 v3, 0x3f000000    # 0.5f

    .line 36
    .line 37
    invoke-direct {v1, v2, v3}, Landroid/graphics/PointF;-><init>(FF)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0, v0, v0, v1}, Ll/pdj;->T1(FFLandroid/graphics/PointF;)[F

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {p0, v0}, Ll/wej;->setRenderVertices([F)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public R1(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/pdj;->i:F

    .line 2
    .line 3
    return-void
.end method

.method public S1(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/pdj;->g:F

    .line 2
    .line 3
    return-void
.end method

.method public T1(FFLandroid/graphics/PointF;)[F
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
    iget-object v7, p0, Ll/pdj;->b:[F

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

.method public U1(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/pdj;->e:F

    .line 2
    .line 3
    return-void
.end method

.method public V1(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/pdj;->n:F

    .line 2
    .line 3
    const p1, 0x3d23d70a    # 0.04f

    .line 4
    .line 5
    .line 6
    iput p1, p0, Ll/pdj;->l:F

    .line 7
    .line 8
    return-void
.end method

.method public W1(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/pdj;->f:F

    .line 2
    .line 3
    return-void
.end method

.method public X1(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/pdj;->n:F

    .line 2
    .line 3
    const p1, 0x3d23d70a    # 0.04f

    .line 4
    .line 5
    .line 6
    iput p1, p0, Ll/pdj;->l:F

    .line 7
    .line 8
    return-void
.end method

.method public Y1(Z)V
    .locals 3

    .line 1
    iput-boolean p1, p0, Ll/pdj;->j:Z

    .line 2
    .line 3
    new-instance p1, Ll/ymi;

    .line 4
    .line 5
    iget v0, p0, Ll/pdj;->g:F

    .line 6
    .line 7
    const/high16 v1, 0x3f800000    # 1.0f

    .line 8
    .line 9
    const/high16 v2, 0x40400000    # 3.0f

    .line 10
    .line 11
    invoke-direct {p1, v0, v1, v2}, Ll/ymi;-><init>(FFF)V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Ll/pdj;->k:Ll/ymi;

    .line 15
    .line 16
    const p1, 0x3d23d70a    # 0.04f

    .line 17
    .line 18
    .line 19
    iput p1, p0, Ll/pdj;->l:F

    .line 20
    .line 21
    return-void
.end method

.method public Z1(F)V
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
    iput p1, p0, Ll/pdj;->d:F

    .line 9
    .line 10
    return-void
.end method

.method public declared-synchronized a2()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    const/high16 v0, 0x3f000000    # 0.5f

    .line 3
    .line 4
    :try_start_0
    iput v0, p0, Ll/pdj;->c:F

    .line 5
    .line 6
    const/high16 v0, 0x3f800000    # 1.0f

    .line 7
    .line 8
    iput v0, p0, Ll/pdj;->d:F

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    iput v1, p0, Ll/pdj;->e:F

    .line 12
    .line 13
    iput v1, p0, Ll/pdj;->f:F

    .line 14
    .line 15
    iput v0, p0, Ll/pdj;->g:F

    .line 16
    .line 17
    iput v0, p0, Ll/pdj;->i:F

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    iput-boolean v0, p0, Ll/pdj;->j:Z

    .line 21
    .line 22
    const v0, 0x3d23d70a    # 0.04f

    .line 23
    .line 24
    .line 25
    iput v0, p0, Ll/pdj;->l:F

    .line 26
    .line 27
    iput v1, p0, Ll/pdj;->m:F

    .line 28
    .line 29
    iput v1, p0, Ll/pdj;->n:F
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    .line 31
    monitor-exit p0

    .line 32
    return-void

    .line 33
    :catchall_0
    move-exception v0

    .line 34
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 35
    throw v0
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision highp float;\nuniform sampler2D inputImageTexture0;\nvarying vec2 textureCoordinate;\n  uniform float scaleStep;\nvec2 scaleFromCenter(vec2 coord, float scale) {\n  if (scale > 1.0 || scale < 0.0) { return coord; }\n  vec2 scaleCenter = vec2(0.5);\n  return (coord - scaleCenter) * scale + scaleCenter;\n}\nvoid main(){\n    vec2 uv = textureCoordinate;\n    vec2 uv2 = scaleFromCenter(uv, scaleStep);\n    gl_FragColor = texture2D(inputImageTexture0, uv2);\n}\n"

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
    const-string v1, "scaleStep"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Ll/pdj;->a:I

    .line 13
    .line 14
    return-void
.end method

.method public passShaderValues()V
    .locals 3

    .line 1
    iget v0, p0, Ll/pdj;->m:F

    .line 2
    .line 3
    iget v1, p0, Ll/pdj;->l:F

    .line 4
    .line 5
    add-float/2addr v0, v1

    .line 6
    iput v0, p0, Ll/pdj;->m:F

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/pdj;->Q1()V

    .line 9
    .line 10
    .line 11
    invoke-super {p0}, Ll/wej;->passShaderValues()V

    .line 12
    .line 13
    .line 14
    iget-boolean v0, p0, Ll/pdj;->j:Z

    .line 15
    .line 16
    iget v1, p0, Ll/pdj;->m:F

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    const/high16 v0, 0x40400000    # 3.0f

    .line 21
    .line 22
    cmpg-float v0, v1, v0

    .line 23
    .line 24
    if-gtz v0, :cond_2

    .line 25
    .line 26
    iget-object v0, p0, Ll/pdj;->k:Ll/ymi;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ll/ymi;->a(F)F

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iput v0, p0, Ll/pdj;->g:F

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    iget v0, p0, Ll/pdj;->n:F

    .line 36
    .line 37
    cmpl-float v0, v1, v0

    .line 38
    .line 39
    if-lez v0, :cond_2

    .line 40
    .line 41
    iget v0, p0, Ll/pdj;->g:F

    .line 42
    .line 43
    iget v1, p0, Ll/pdj;->e:F

    .line 44
    .line 45
    add-float/2addr v0, v1

    .line 46
    iput v0, p0, Ll/pdj;->g:F

    .line 47
    .line 48
    const/4 v2, 0x0

    .line 49
    cmpl-float v1, v1, v2

    .line 50
    .line 51
    if-lez v1, :cond_1

    .line 52
    .line 53
    const/high16 v1, 0x3f800000    # 1.0f

    .line 54
    .line 55
    cmpl-float v0, v0, v1

    .line 56
    .line 57
    if-lez v0, :cond_2

    .line 58
    .line 59
    iput v1, p0, Ll/pdj;->g:F

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_1
    iget v1, p0, Ll/pdj;->i:F

    .line 63
    .line 64
    cmpg-float v0, v0, v1

    .line 65
    .line 66
    if-gez v0, :cond_2

    .line 67
    .line 68
    iput v1, p0, Ll/pdj;->g:F

    .line 69
    .line 70
    :cond_2
    :goto_0
    iget v0, p0, Ll/pdj;->a:I

    .line 71
    .line 72
    iget p0, p0, Ll/pdj;->g:F

    .line 73
    .line 74
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 75
    .line 76
    .line 77
    return-void
.end method
