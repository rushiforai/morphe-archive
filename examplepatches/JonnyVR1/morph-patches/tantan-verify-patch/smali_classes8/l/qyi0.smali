.class public Ll/qyi0;
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
    const/high16 v0, 0x40000000    # 2.0f

    .line 5
    .line 6
    iput v0, p0, Ll/qyi0;->b:F

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Ll/qyi0;->c:Z

    .line 10
    .line 11
    const-wide/16 v0, -0x1

    .line 12
    .line 13
    iput-wide v0, p0, Ll/qyi0;->d:J

    .line 14
    .line 15
    iput-wide v0, p0, Ll/qyi0;->e:J

    .line 16
    .line 17
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
    iput-wide v0, p0, Ll/qyi0;->d:J

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Ll/qyi0;->c:Z

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput v0, p0, Ll/qyi0;->b:F
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
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nvarying vec2 textureCoordinate;\nuniform float shift;\nvoid main(){\nvec2 uv = textureCoordinate;\n     \n     if (shift == 0.0) {\n         if (uv.y < 1.0 / 3.0) {\n             gl_FragColor = texture2D(inputImageTexture0, uv);\n         } else {\n             gl_FragColor = vec4(vec3(1.0), 1.0);\n         }\n     } else if (shift == 1.0) {\n         if (uv.y > 1.0 / 3.0 && uv.y < 2.0 / 3.0) {\n             gl_FragColor = texture2D(inputImageTexture0, uv);\n         } else {\n             gl_FragColor = vec4(vec3(1.0), 1.0);\n         }\n     } else if (shift == 2.0) {\n         if (uv.y > 2.0 / 3.0) {\n             gl_FragColor = texture2D(inputImageTexture0, uv);\n         } else {\n             gl_FragColor = vec4(vec3(1.0), 1.0);\n         }\n     } else {\n         gl_FragColor = texture2D(inputImageTexture0, uv);\n     } }\n"

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
    iput v0, p0, Ll/qyi0;->a:I

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
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 3
    .line 4
    .line 5
    iget-wide v0, p0, Ll/qyi0;->d:J

    .line 6
    .line 7
    const-wide/16 v2, -0x1

    .line 8
    .line 9
    cmp-long v0, v0, v2

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-wide v0, p0, Ll/qyi0;->e:J

    .line 14
    .line 15
    iput-wide v0, p0, Ll/qyi0;->d:J

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :catchall_0
    move-exception p1

    .line 19
    goto :goto_2

    .line 20
    :cond_0
    :goto_0
    iget-boolean v0, p0, Ll/qyi0;->c:Z

    .line 21
    .line 22
    if-eqz v0, :cond_4

    .line 23
    .line 24
    iget-wide v0, p0, Ll/qyi0;->e:J

    .line 25
    .line 26
    iget-wide v2, p0, Ll/qyi0;->d:J

    .line 27
    .line 28
    sub-long/2addr v0, v2

    .line 29
    const-wide/16 v2, 0x2bc

    .line 30
    .line 31
    cmp-long v2, v0, v2

    .line 32
    .line 33
    if-gez v2, :cond_1

    .line 34
    .line 35
    const/high16 v0, 0x40000000    # 2.0f

    .line 36
    .line 37
    iput v0, p0, Ll/qyi0;->b:F

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_1
    const-wide/16 v2, 0x578

    .line 41
    .line 42
    cmp-long v2, v0, v2

    .line 43
    .line 44
    if-gez v2, :cond_2

    .line 45
    .line 46
    const/high16 v0, 0x3f800000    # 1.0f

    .line 47
    .line 48
    iput v0, p0, Ll/qyi0;->b:F

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_2
    const-wide/16 v2, 0x834

    .line 52
    .line 53
    cmp-long v0, v0, v2

    .line 54
    .line 55
    if-gez v0, :cond_3

    .line 56
    .line 57
    const/4 v0, 0x0

    .line 58
    iput v0, p0, Ll/qyi0;->b:F

    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_3
    const/high16 v0, -0x40800000    # -1.0f

    .line 62
    .line 63
    iput v0, p0, Ll/qyi0;->b:F

    .line 64
    .line 65
    :cond_4
    :goto_1
    invoke-super {p0, p1, p2, p3}, Ll/jt2;->newTextureReady(ILl/gfj;Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 66
    .line 67
    .line 68
    monitor-exit p0

    .line 69
    return-void

    .line 70
    :goto_2
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 71
    throw p1
.end method

.method public passShaderValues()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/wej;->passShaderValues()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/qyi0;->a:I

    .line 5
    .line 6
    iget p0, p0, Ll/qyi0;->b:F

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
    iput-wide p1, p0, Ll/qyi0;->e:J

    .line 2
    .line 3
    return-void
.end method
