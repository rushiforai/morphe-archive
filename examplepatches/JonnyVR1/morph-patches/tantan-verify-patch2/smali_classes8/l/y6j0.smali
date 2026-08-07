.class public Ll/y6j0;
.super Ll/jt2;
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
    invoke-direct {p0}, Ll/jt2;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/y6j0;->b:F

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    iput-boolean v0, p0, Ll/y6j0;->c:Z

    .line 9
    .line 10
    const/16 v0, 0x19

    .line 11
    .line 12
    iput v0, p0, Ll/y6j0;->d:I

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public declared-synchronized Q1()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    const/4 v0, 0x1

    .line 3
    :try_start_0
    iput-boolean v0, p0, Ll/y6j0;->c:Z

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput v0, p0, Ll/y6j0;->b:F
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    .line 8
    monitor-exit p0

    .line 9
    return-void

    .line 10
    :catchall_0
    move-exception v0

    .line 11
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 12
    throw v0
.end method

.method public destroy()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/gfj;->destroy()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/y6j0;->b:F

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Ll/y6j0;->c:Z

    .line 9
    .line 10
    return-void
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision highp float;\nuniform sampler2D inputImageTexture0;\nvarying vec2 textureCoordinate;\nuniform float shift;\nvoid main(){\n    vec2 uv = textureCoordinate;\n    if (uv.y >= 1.0 - shift){\n       vec2 uv1 = vec2(uv.x,uv.y - 1.0 + shift);\n       gl_FragColor = texture2D(inputImageTexture0, uv1);\n    }}\n"

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
    const-string v1, "shift"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Ll/y6j0;->a:I

    .line 13
    .line 14
    return-void
.end method

.method public passShaderValues()V
    .locals 6

    .line 1
    invoke-super {p0}, Ll/wej;->passShaderValues()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Ll/y6j0;->c:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget v0, p0, Ll/y6j0;->b:F

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
    iget v2, p0, Ll/y6j0;->d:I

    .line 17
    .line 18
    int-to-float v2, v2

    .line 19
    const/high16 v3, 0x3f000000    # 0.5f

    .line 20
    .line 21
    div-float/2addr v3, v2

    .line 22
    add-float/2addr v0, v3

    .line 23
    iput v0, p0, Ll/y6j0;->b:F

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
    iput v1, p0, Ll/y6j0;->b:F

    .line 33
    .line 34
    :cond_0
    iget v0, p0, Ll/y6j0;->a:I

    .line 35
    .line 36
    iget p0, p0, Ll/y6j0;->b:F

    .line 37
    .line 38
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 39
    .line 40
    .line 41
    return-void
.end method
