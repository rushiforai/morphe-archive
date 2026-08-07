.class public Ll/ryi0;
.super Ll/jt2;
.source "SourceFile"

# interfaces
.implements Ll/gam;


# instance fields
.field private a:I

.field private b:F

.field private c:Z

.field private d:J

.field private e:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/jt2;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/ryi0;->b:F

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Ll/ryi0;->c:Z

    .line 9
    .line 10
    const-wide/16 v0, -0x1

    .line 11
    .line 12
    iput-wide v0, p0, Ll/ryi0;->d:J

    .line 13
    .line 14
    iput-wide v0, p0, Ll/ryi0;->e:J

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public declared-synchronized Q1()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    const-wide/16 v0, -0x1

    .line 3
    .line 4
    :try_start_0
    iput-wide v0, p0, Ll/ryi0;->d:J

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Ll/ryi0;->c:Z

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput v0, p0, Ll/ryi0;->b:F
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    monitor-exit p0

    .line 13
    return-void

    .line 14
    :catchall_0
    move-exception v0

    .line 15
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 16
    throw v0
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nvarying vec2 textureCoordinate;\nuniform float shift;\nvoid main(){\n vec2 uv = textureCoordinate ;\n     \n     if (uv.y < 1.0 / 3.0 || uv.y > 2.0 / 3.0) {\n         if (uv.x < shift) {\n             vec2 uv1 = vec2(uv.x + 1.0 - shift, uv.y);\n             gl_FragColor = texture2D(inputImageTexture0, uv1);\n         } else {\n             gl_FragColor = vec4(vec3(0.0), 1.0);\n         }\n     } else {\n         gl_FragColor = texture2D(inputImageTexture0, uv);\n     }}\n"

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
    iput v0, p0, Ll/ryi0;->a:I

    .line 13
    .line 14
    return-void
.end method

.method public declared-synchronized newTextureReady(ILl/gfj;Z)V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-super {p0, p1, p2, p3}, Ll/jt2;->newTextureReady(ILl/gfj;Z)V

    .line 3
    .line 4
    .line 5
    iget-wide p1, p0, Ll/ryi0;->d:J

    .line 6
    .line 7
    const-wide/16 v0, -0x1

    .line 8
    .line 9
    cmp-long p3, p1, v0

    .line 10
    .line 11
    if-nez p3, :cond_0

    .line 12
    .line 13
    iget-wide p1, p0, Ll/ryi0;->e:J

    .line 14
    .line 15
    iput-wide p1, p0, Ll/ryi0;->d:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    .line 17
    monitor-exit p0

    .line 18
    return-void

    .line 19
    :catchall_0
    move-exception p1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    :try_start_1
    iget-boolean p3, p0, Ll/ryi0;->c:Z

    .line 22
    .line 23
    if-eqz p3, :cond_2

    .line 24
    .line 25
    iget-wide v0, p0, Ll/ryi0;->e:J

    .line 26
    .line 27
    sub-long/2addr v0, p1

    .line 28
    iget p3, p0, Ll/ryi0;->b:F

    .line 29
    .line 30
    long-to-float v2, v0

    .line 31
    const/high16 v3, 0x447a0000    # 1000.0f

    .line 32
    .line 33
    div-float/2addr v2, v3

    .line 34
    add-float/2addr p3, v2

    .line 35
    iput p3, p0, Ll/ryi0;->b:F

    .line 36
    .line 37
    const/high16 v2, 0x3f800000    # 1.0f

    .line 38
    .line 39
    cmpl-float p3, p3, v2

    .line 40
    .line 41
    if-ltz p3, :cond_1

    .line 42
    .line 43
    iput v2, p0, Ll/ryi0;->b:F

    .line 44
    .line 45
    const/4 p3, 0x0

    .line 46
    iput-boolean p3, p0, Ll/ryi0;->c:Z

    .line 47
    .line 48
    :cond_1
    add-long/2addr v0, p1

    .line 49
    iput-wide v0, p0, Ll/ryi0;->d:J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 50
    .line 51
    :cond_2
    monitor-exit p0

    .line 52
    return-void

    .line 53
    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 54
    throw p1
.end method

.method public passShaderValues()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/wej;->passShaderValues()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/ryi0;->a:I

    .line 5
    .line 6
    iget p0, p0, Ll/ryi0;->b:F

    .line 7
    .line 8
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setTimeStamp(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/ryi0;->e:J

    .line 2
    .line 3
    return-void
.end method
