.class public Ll/x43;
.super Ll/jt2;
.source "SourceFile"


# instance fields
.field private a:I

.field protected b:F

.field protected c:F

.field private d:F

.field private e:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/jt2;-><init>()V

    .line 2
    .line 3
    .line 4
    const v0, 0x3d23d70a    # 0.04f

    .line 5
    .line 6
    .line 7
    iput v0, p0, Ll/x43;->b:F

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput v0, p0, Ll/x43;->c:F

    .line 11
    .line 12
    const/high16 v0, 0x41200000    # 10.0f

    .line 13
    .line 14
    iput v0, p0, Ll/x43;->d:F

    .line 15
    .line 16
    const/high16 v0, 0x41000000    # 8.0f

    .line 17
    .line 18
    iput v0, p0, Ll/x43;->e:F

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public Q1(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/x43;->e:F

    .line 2
    .line 3
    return-void
.end method

.method public declared-synchronized R1()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    const v0, 0x3d23d70a    # 0.04f

    .line 3
    .line 4
    .line 5
    :try_start_0
    iput v0, p0, Ll/x43;->b:F

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput v0, p0, Ll/x43;->c:F

    .line 9
    .line 10
    const/high16 v1, 0x41200000    # 10.0f

    .line 11
    .line 12
    iput v1, p0, Ll/x43;->d:F

    .line 13
    .line 14
    iput v0, p0, Ll/x43;->e:F
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    .line 16
    monitor-exit p0

    .line 17
    return-void

    .line 18
    :catchall_0
    move-exception v0

    .line 19
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 20
    throw v0
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision highp float;\nuniform sampler2D inputImageTexture0;\nvarying vec2 textureCoordinate;\n  uniform float grad;\nvoid main(){\n    vec2 uv = textureCoordinate;\n    gl_FragColor = texture2D(inputImageTexture0,uv, grad);\n}\n"

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
    const-string v1, "grad"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Ll/x43;->a:I

    .line 13
    .line 14
    return-void
.end method

.method public passShaderValues()V
    .locals 3

    .line 1
    iget v0, p0, Ll/wej;->texture_in:I

    .line 2
    .line 3
    const/16 v1, 0xde1

    .line 4
    .line 5
    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 6
    .line 7
    .line 8
    const/16 v0, 0x2800

    .line 9
    .line 10
    const v2, 0x461c0c00    # 9987.0f

    .line 11
    .line 12
    .line 13
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 14
    .line 15
    .line 16
    const/16 v0, 0x2801

    .line 17
    .line 18
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 19
    .line 20
    .line 21
    const/16 v0, 0x2802

    .line 22
    .line 23
    const v2, 0x47012f00    # 33071.0f

    .line 24
    .line 25
    .line 26
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 27
    .line 28
    .line 29
    const/16 v0, 0x2803

    .line 30
    .line 31
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 32
    .line 33
    .line 34
    invoke-static {v1}, Landroid/opengl/GLES20;->glGenerateMipmap(I)V

    .line 35
    .line 36
    .line 37
    iget v0, p0, Ll/x43;->c:F

    .line 38
    .line 39
    iget v1, p0, Ll/x43;->b:F

    .line 40
    .line 41
    add-float/2addr v0, v1

    .line 42
    iput v0, p0, Ll/x43;->c:F

    .line 43
    .line 44
    invoke-super {p0}, Ll/wej;->passShaderValues()V

    .line 45
    .line 46
    .line 47
    iget v0, p0, Ll/x43;->c:F

    .line 48
    .line 49
    iget v1, p0, Ll/x43;->e:F

    .line 50
    .line 51
    cmpl-float v0, v0, v1

    .line 52
    .line 53
    if-ltz v0, :cond_0

    .line 54
    .line 55
    iget v0, p0, Ll/x43;->d:F

    .line 56
    .line 57
    const/high16 v1, 0x3f800000    # 1.0f

    .line 58
    .line 59
    sub-float/2addr v0, v1

    .line 60
    iput v0, p0, Ll/x43;->d:F

    .line 61
    .line 62
    const/4 v1, 0x0

    .line 63
    cmpg-float v0, v0, v1

    .line 64
    .line 65
    if-gez v0, :cond_0

    .line 66
    .line 67
    iput v1, p0, Ll/x43;->d:F

    .line 68
    .line 69
    :cond_0
    iget v0, p0, Ll/x43;->a:I

    .line 70
    .line 71
    iget p0, p0, Ll/x43;->d:F

    .line 72
    .line 73
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 74
    .line 75
    .line 76
    return-void
.end method
