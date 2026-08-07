.class public Ll/qj0;
.super Ll/jt2;
.source "SourceFile"


# instance fields
.field private a:I

.field private b:I

.field protected c:F

.field protected d:F

.field protected e:F

.field private f:F

.field private g:F

.field private i:F

.field private j:F

.field private k:F

.field private l:F


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/jt2;-><init>()V

    .line 2
    .line 3
    .line 4
    const v0, 0x3d23d70a    # 0.04f

    .line 5
    .line 6
    .line 7
    iput v0, p0, Ll/qj0;->c:F

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput v0, p0, Ll/qj0;->d:F

    .line 11
    .line 12
    iput v0, p0, Ll/qj0;->e:F

    .line 13
    .line 14
    const/high16 v1, 0x3f800000    # 1.0f

    .line 15
    .line 16
    iput v1, p0, Ll/qj0;->f:F

    .line 17
    .line 18
    iput v0, p0, Ll/qj0;->g:F

    .line 19
    .line 20
    iput v1, p0, Ll/qj0;->i:F

    .line 21
    .line 22
    iput v0, p0, Ll/qj0;->j:F

    .line 23
    .line 24
    iput v0, p0, Ll/qj0;->k:F

    .line 25
    .line 26
    iput v1, p0, Ll/qj0;->l:F

    .line 27
    .line 28
    return-void
.end method


# virtual methods
.method public declared-synchronized Q1(F)V
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iput p1, p0, Ll/qj0;->e:F
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return-void

    .line 6
    :catchall_0
    move-exception p1

    .line 7
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 8
    throw p1
.end method

.method public declared-synchronized R1(F)V
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iput p1, p0, Ll/qj0;->g:F
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return-void

    .line 6
    :catchall_0
    move-exception p1

    .line 7
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 8
    throw p1
.end method

.method public declared-synchronized S1(F)V
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iput p1, p0, Ll/qj0;->f:F
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return-void

    .line 6
    :catchall_0
    move-exception p1

    .line 7
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 8
    throw p1
.end method

.method public declared-synchronized T1(F)V
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iput p1, p0, Ll/qj0;->k:F
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return-void

    .line 6
    :catchall_0
    move-exception p1

    .line 7
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 8
    throw p1
.end method

.method public declared-synchronized U1(F)V
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iput p1, p0, Ll/qj0;->j:F
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return-void

    .line 6
    :catchall_0
    move-exception p1

    .line 7
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 8
    throw p1
.end method

.method public declared-synchronized V1(F)V
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iput p1, p0, Ll/qj0;->l:F
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return-void

    .line 6
    :catchall_0
    move-exception p1

    .line 7
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 8
    throw p1
.end method

.method public declared-synchronized W1()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    const v0, 0x3d23d70a    # 0.04f

    .line 3
    .line 4
    .line 5
    :try_start_0
    iput v0, p0, Ll/qj0;->c:F

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput v0, p0, Ll/qj0;->d:F

    .line 9
    .line 10
    iput v0, p0, Ll/qj0;->e:F

    .line 11
    .line 12
    const/high16 v1, 0x3f800000    # 1.0f

    .line 13
    .line 14
    iput v1, p0, Ll/qj0;->f:F

    .line 15
    .line 16
    iput v0, p0, Ll/qj0;->g:F

    .line 17
    .line 18
    iput v1, p0, Ll/qj0;->i:F

    .line 19
    .line 20
    iput v0, p0, Ll/qj0;->j:F

    .line 21
    .line 22
    iput v0, p0, Ll/qj0;->k:F

    .line 23
    .line 24
    iput v1, p0, Ll/qj0;->l:F
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    .line 26
    monitor-exit p0

    .line 27
    return-void

    .line 28
    :catchall_0
    move-exception v0

    .line 29
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 30
    throw v0
.end method

.method public drawSub()V
    .locals 4

    .line 1
    iget v0, p0, Ll/qj0;->f:F

    .line 2
    .line 3
    const/high16 v1, 0x3f800000    # 1.0f

    .line 4
    .line 5
    cmpl-float v0, v0, v1

    .line 6
    .line 7
    if-ltz v0, :cond_0

    .line 8
    .line 9
    invoke-super {p0}, Ll/gfj;->drawSub()V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    const/16 v0, 0xbe2

    .line 14
    .line 15
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnable(I)V

    .line 16
    .line 17
    .line 18
    const/16 v1, 0x302

    .line 19
    .line 20
    const/4 v2, 0x1

    .line 21
    const/16 v3, 0x303

    .line 22
    .line 23
    invoke-static {v1, v3, v2, v3}, Landroid/opengl/GLES20;->glBlendFuncSeparate(IIII)V

    .line 24
    .line 25
    .line 26
    invoke-super {p0}, Ll/gfj;->drawSub()V

    .line 27
    .line 28
    .line 29
    invoke-static {v0}, Landroid/opengl/GLES20;->glDisable(I)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision highp float;\nuniform sampler2D inputImageTexture0;\nvarying vec2 textureCoordinate;\n  uniform float alpha;\n  uniform float light;\nvoid main(){\n    vec2 uv = textureCoordinate;\n    gl_FragColor = vec4(texture2D(inputImageTexture0, uv).rgb,alpha)*light;\n}\n"

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
    const-string v1, "alpha"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Ll/qj0;->a:I

    .line 13
    .line 14
    iget v0, p0, Ll/wej;->programHandle:I

    .line 15
    .line 16
    const-string v1, "light"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Ll/qj0;->b:I

    .line 23
    .line 24
    return-void
.end method

.method public passShaderValues()V
    .locals 4

    .line 1
    iget v0, p0, Ll/qj0;->d:F

    .line 2
    .line 3
    iget v1, p0, Ll/qj0;->c:F

    .line 4
    .line 5
    add-float/2addr v0, v1

    .line 6
    iput v0, p0, Ll/qj0;->d:F

    .line 7
    .line 8
    invoke-super {p0}, Ll/wej;->passShaderValues()V

    .line 9
    .line 10
    .line 11
    iget v0, p0, Ll/qj0;->d:F

    .line 12
    .line 13
    iget v1, p0, Ll/qj0;->e:F

    .line 14
    .line 15
    cmpl-float v1, v0, v1

    .line 16
    .line 17
    const/high16 v2, 0x3f800000    # 1.0f

    .line 18
    .line 19
    if-lez v1, :cond_0

    .line 20
    .line 21
    iget v1, p0, Ll/qj0;->f:F

    .line 22
    .line 23
    iget v3, p0, Ll/qj0;->g:F

    .line 24
    .line 25
    add-float/2addr v1, v3

    .line 26
    iput v1, p0, Ll/qj0;->f:F

    .line 27
    .line 28
    cmpl-float v1, v1, v2

    .line 29
    .line 30
    if-lez v1, :cond_0

    .line 31
    .line 32
    iput v2, p0, Ll/qj0;->f:F

    .line 33
    .line 34
    :cond_0
    iget v1, p0, Ll/qj0;->k:F

    .line 35
    .line 36
    cmpl-float v0, v0, v1

    .line 37
    .line 38
    if-lez v0, :cond_2

    .line 39
    .line 40
    iget v0, p0, Ll/qj0;->j:F

    .line 41
    .line 42
    const/4 v1, 0x0

    .line 43
    cmpl-float v1, v0, v1

    .line 44
    .line 45
    if-lez v1, :cond_1

    .line 46
    .line 47
    iget v1, p0, Ll/qj0;->i:F

    .line 48
    .line 49
    sub-float/2addr v1, v0

    .line 50
    iput v1, p0, Ll/qj0;->i:F

    .line 51
    .line 52
    iget v0, p0, Ll/qj0;->l:F

    .line 53
    .line 54
    cmpg-float v1, v1, v0

    .line 55
    .line 56
    if-gez v1, :cond_2

    .line 57
    .line 58
    iput v0, p0, Ll/qj0;->i:F

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_1
    iget v1, p0, Ll/qj0;->l:F

    .line 62
    .line 63
    sub-float/2addr v1, v0

    .line 64
    iput v1, p0, Ll/qj0;->l:F

    .line 65
    .line 66
    iput v1, p0, Ll/qj0;->i:F

    .line 67
    .line 68
    cmpl-float v0, v1, v2

    .line 69
    .line 70
    if-lez v0, :cond_2

    .line 71
    .line 72
    iput v2, p0, Ll/qj0;->i:F

    .line 73
    .line 74
    :cond_2
    :goto_0
    iget v0, p0, Ll/qj0;->a:I

    .line 75
    .line 76
    iget v1, p0, Ll/qj0;->f:F

    .line 77
    .line 78
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 79
    .line 80
    .line 81
    iget v0, p0, Ll/qj0;->b:I

    .line 82
    .line 83
    iget p0, p0, Ll/qj0;->i:F

    .line 84
    .line 85
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 86
    .line 87
    .line 88
    return-void
.end method
