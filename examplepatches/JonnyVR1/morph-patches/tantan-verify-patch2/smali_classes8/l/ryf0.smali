.class public Ll/ryf0;
.super Ll/jt2;
.source "SourceFile"


# instance fields
.field private a:I

.field protected b:F

.field protected c:F

.field private d:F

.field private e:F

.field private f:F


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
    iput v0, p0, Ll/ryf0;->b:F

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput v0, p0, Ll/ryf0;->c:F

    .line 11
    .line 12
    const/high16 v1, 0x3f000000    # 0.5f

    .line 13
    .line 14
    iput v1, p0, Ll/ryf0;->d:F

    .line 15
    .line 16
    iput v0, p0, Ll/ryf0;->e:F

    .line 17
    .line 18
    iput v0, p0, Ll/ryf0;->f:F

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public Q1(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/ryf0;->e:F

    .line 2
    .line 3
    return-void
.end method

.method public R1(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/ryf0;->f:F

    .line 2
    .line 3
    return-void
.end method

.method public declared-synchronized S1()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    const v0, 0x3d23d70a    # 0.04f

    .line 3
    .line 4
    .line 5
    :try_start_0
    iput v0, p0, Ll/ryf0;->b:F

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput v0, p0, Ll/ryf0;->c:F

    .line 9
    .line 10
    const/high16 v1, 0x3f000000    # 0.5f

    .line 11
    .line 12
    iput v1, p0, Ll/ryf0;->d:F

    .line 13
    .line 14
    iput v0, p0, Ll/ryf0;->e:F

    .line 15
    .line 16
    iput v0, p0, Ll/ryf0;->f:F
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    .line 18
    monitor-exit p0

    .line 19
    return-void

    .line 20
    :catchall_0
    move-exception v0

    .line 21
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 22
    throw v0
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision highp float;\nuniform sampler2D inputImageTexture0;\nvarying vec2 textureCoordinate;\n  uniform float range;\nvoid main(){\n    vec2 uv = textureCoordinate;\n    if (uv.x > range && uv.x < 1.0 - range) {\n        gl_FragColor = texture2D(inputImageTexture0,uv);\n    } else {    }\n}\n"

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
    const-string v1, "range"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Ll/ryf0;->a:I

    .line 13
    .line 14
    return-void
.end method

.method public passShaderValues()V
    .locals 2

    .line 1
    iget v0, p0, Ll/ryf0;->c:F

    .line 2
    .line 3
    iget v1, p0, Ll/ryf0;->b:F

    .line 4
    .line 5
    add-float/2addr v0, v1

    .line 6
    iput v0, p0, Ll/ryf0;->c:F

    .line 7
    .line 8
    invoke-super {p0}, Ll/wej;->passShaderValues()V

    .line 9
    .line 10
    .line 11
    iget v0, p0, Ll/ryf0;->c:F

    .line 12
    .line 13
    iget v1, p0, Ll/ryf0;->f:F

    .line 14
    .line 15
    cmpl-float v0, v0, v1

    .line 16
    .line 17
    if-ltz v0, :cond_0

    .line 18
    .line 19
    iget v0, p0, Ll/ryf0;->d:F

    .line 20
    .line 21
    iget v1, p0, Ll/ryf0;->e:F

    .line 22
    .line 23
    sub-float/2addr v0, v1

    .line 24
    iput v0, p0, Ll/ryf0;->d:F

    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    cmpg-float v0, v0, v1

    .line 28
    .line 29
    if-gez v0, :cond_0

    .line 30
    .line 31
    iput v1, p0, Ll/ryf0;->d:F

    .line 32
    .line 33
    :cond_0
    iget v0, p0, Ll/ryf0;->a:I

    .line 34
    .line 35
    iget p0, p0, Ll/ryf0;->d:F

    .line 36
    .line 37
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 38
    .line 39
    .line 40
    return-void
.end method
