.class public Ll/ire;
.super Ll/rnw;
.source "SourceFile"

# interfaces
.implements Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;
.implements Ll/zyl;
.implements Ll/qxl;
.implements Ll/rxl;
.implements Ll/sxl;
.implements Ll/uxl;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0xf
.end annotation


# instance fields
.field E0:I

.field F0:I

.field G0:J

.field H0:Z

.field I0:Ll/zyl$c;

.field J0:Ll/zyl$a;

.field K0:Ll/zyl$d;

.field L0:Ll/zyl$b;

.field M0:I

.field protected N0:Z

.field private O0:Z

.field private P0:Lcom/immomo/velib/player/a;

.field private X:Ll/mre;

.field protected Y:Ll/txl;

.field Z:Ljava/lang/String;

.field private k0:Landroid/view/Surface;

.field private p0:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/rnw;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x1e0

    .line 5
    .line 6
    iput v0, p0, Ll/ire;->E0:I

    .line 7
    .line 8
    iput v0, p0, Ll/ire;->F0:I

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-boolean v0, p0, Ll/ire;->H0:Z

    .line 12
    .line 13
    const/16 v1, 0x1e

    .line 14
    .line 15
    iput v1, p0, Ll/ire;->M0:I

    .line 16
    .line 17
    iput-boolean v0, p0, Ll/ire;->N0:Z

    .line 18
    .line 19
    iput-boolean v0, p0, Ll/ire;->O0:Z

    .line 20
    .line 21
    iput-object p1, p0, Ll/ire;->p0:Landroid/content/Context;

    .line 22
    .line 23
    iput-object p2, p0, Ll/ire;->Z:Ljava/lang/String;

    .line 24
    .line 25
    return-void
.end method

.method private T()V
    .locals 3

    .line 1
    iget v0, p0, Ll/vej;->h:I

    .line 2
    .line 3
    if-lez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    new-array v1, v0, [I

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 10
    .line 11
    .line 12
    iput v2, p0, Ll/vej;->h:I

    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method private V()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ire;->P0:Lcom/immomo/velib/player/a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Lcom/immomo/velib/player/a;->m:Ll/txl;

    .line 6
    .line 7
    iput-object v0, p0, Ll/ire;->Y:Ll/txl;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Ll/ire;->Y:Ll/txl;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    invoke-static {}, Ll/kzb;->b()Ll/txl;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Ll/ire;->Y:Ll/txl;

    .line 18
    .line 19
    :cond_1
    :try_start_0
    iget-object v0, p0, Ll/ire;->Y:Ll/txl;

    .line 20
    .line 21
    iget-object v1, p0, Ll/ire;->p0:Landroid/content/Context;

    .line 22
    .line 23
    invoke-interface {v0, v1}, Ll/txl;->init(Landroid/content/Context;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/ire;->Y:Ll/txl;

    .line 27
    .line 28
    invoke-interface {v0, p0}, Ll/txl;->c(Ll/sxl;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/ire;->Y:Ll/txl;

    .line 32
    .line 33
    invoke-interface {v0, p0}, Ll/txl;->b(Ll/qxl;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/ire;->Y:Ll/txl;

    .line 37
    .line 38
    invoke-interface {v0, p0}, Ll/txl;->a(Ll/uxl;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/ire;->Y:Ll/txl;

    .line 42
    .line 43
    invoke-interface {v0, p0}, Ll/txl;->d(Ll/rxl;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ll/ire;->Y:Ll/txl;

    .line 47
    .line 48
    iget-boolean v1, p0, Ll/ire;->O0:Z

    .line 49
    .line 50
    invoke-interface {v0, v1}, Ll/txl;->setLooping(Z)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Ll/ire;->Y:Ll/txl;

    .line 54
    .line 55
    iget-object v1, p0, Ll/ire;->Z:Ljava/lang/String;

    .line 56
    .line 57
    invoke-interface {v0, v1}, Ll/txl;->setDataSource(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Ll/ire;->Y:Ll/txl;

    .line 61
    .line 62
    if-eqz v0, :cond_3

    .line 63
    .line 64
    invoke-interface {v0}, Ll/txl;->prepareAsync()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :catch_0
    move-exception v0

    .line 69
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Ll/ire;->Y:Ll/txl;

    .line 73
    .line 74
    instance-of v0, v0, Ll/zph0;

    .line 75
    .line 76
    if-eqz v0, :cond_2

    .line 77
    .line 78
    invoke-virtual {p0}, Ll/ire;->e0()V

    .line 79
    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_2
    new-instance v0, Ll/zph0;

    .line 83
    .line 84
    invoke-direct {v0}, Ll/zph0;-><init>()V

    .line 85
    .line 86
    .line 87
    iput-object v0, p0, Ll/ire;->Y:Ll/txl;

    .line 88
    .line 89
    invoke-direct {p0}, Ll/ire;->V()V

    .line 90
    .line 91
    .line 92
    :cond_3
    :goto_0
    return-void
.end method

.method private declared-synchronized f0()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/ire;->Y:Ll/txl;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    monitor-exit p0

    .line 7
    return-void

    .line 8
    :cond_0
    :try_start_1
    invoke-interface {v0}, Ll/txl;->release()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/ire;->k0:Landroid/view/Surface;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    .line 16
    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-object v0, p0, Ll/ire;->k0:Landroid/view/Surface;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :catchall_0
    move-exception v0

    .line 23
    goto :goto_1

    .line 24
    :cond_1
    :goto_0
    monitor-exit p0

    .line 25
    return-void

    .line 26
    :goto_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 27
    throw v0
.end method


# virtual methods
.method public S()V
    .locals 0

    .line 1
    return-void
.end method

.method public U()Landroid/graphics/SurfaceTexture;
    .locals 5

    .line 1
    invoke-direct {p0}, Ll/ire;->T()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/rnw;->E:Landroid/graphics/SurfaceTexture;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    new-array v1, v0, [I

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 13
    .line 14
    .line 15
    aget v0, v1, v2

    .line 16
    .line 17
    const v3, 0x8d65

    .line 18
    .line 19
    .line 20
    invoke-static {v3, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 21
    .line 22
    .line 23
    const/16 v0, 0x2801

    .line 24
    .line 25
    const v4, 0x46180400    # 9729.0f

    .line 26
    .line 27
    .line 28
    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 29
    .line 30
    .line 31
    const/16 v0, 0x2800

    .line 32
    .line 33
    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 34
    .line 35
    .line 36
    const/16 v0, 0x2802

    .line 37
    .line 38
    const v4, 0x812f

    .line 39
    .line 40
    .line 41
    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 42
    .line 43
    .line 44
    const/16 v0, 0x2803

    .line 45
    .line 46
    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 47
    .line 48
    .line 49
    aget v0, v1, v2

    .line 50
    .line 51
    iput v0, p0, Ll/vej;->h:I

    .line 52
    .line 53
    new-instance v0, Landroid/graphics/SurfaceTexture;

    .line 54
    .line 55
    iget v1, p0, Ll/vej;->h:I

    .line 56
    .line 57
    invoke-direct {v0, v1}, Landroid/graphics/SurfaceTexture;-><init>(I)V

    .line 58
    .line 59
    .line 60
    iput-object v0, p0, Ll/rnw;->E:Landroid/graphics/SurfaceTexture;

    .line 61
    .line 62
    const-string v0, "zk"

    .line 63
    .line 64
    const-string v1, "zk init ijk texture"

    .line 65
    .line 66
    invoke-static {v0, v1}, Ll/zqe;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    :cond_0
    iget-object p0, p0, Ll/rnw;->E:Landroid/graphics/SurfaceTexture;

    .line 70
    .line 71
    return-object p0
.end method

.method public W(Lcom/immomo/velib/player/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ire;->P0:Lcom/immomo/velib/player/a;

    .line 2
    .line 3
    return-void
.end method

.method public X(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/ire;->O0:Z

    .line 2
    .line 3
    return-void
.end method

.method public Y(Ll/mre;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ire;->X:Ll/mre;

    .line 2
    .line 3
    return-void
.end method

.method public Z(Ll/zyl$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ire;->J0:Ll/zyl$a;

    .line 2
    .line 3
    return-void
.end method

.method public a(Ll/txl;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ire;->J0:Ll/zyl$a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-interface {p0, p1}, Ll/zyl$a;->h(Ll/zyl;)V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public a0(Ll/zyl$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ire;->L0:Ll/zyl$b;

    .line 2
    .line 3
    return-void
.end method

.method public b0(Ll/zyl$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ire;->I0:Ll/zyl$c;

    .line 2
    .line 3
    return-void
.end method

.method public c(Ll/txl;ILjava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p1, p0, Ll/ire;->L0:Ll/zyl$b;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-interface {p1, p0, p2, p3}, Ll/zyl$b;->b(Ll/zyl;ILjava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public c0(Ll/zyl$d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ire;->K0:Ll/zyl$d;

    .line 2
    .line 3
    return-void
.end method

.method public declared-synchronized d0()V
    .locals 9

    .line 1
    const-string v0, "openPublishHelp Unable to open content: "

    .line 2
    .line 3
    const-string v1, "openPublishHelp, end, cost time:"

    .line 4
    .line 5
    const-string v2, "openPublishHelp, <release> cost time:"

    .line 6
    .line 7
    monitor-enter p0

    .line 8
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 9
    .line 10
    .line 11
    move-result-wide v3

    .line 12
    iput-wide v3, p0, Ll/ire;->G0:J

    .line 13
    .line 14
    const-string v3, "EffectPlayerInput"

    .line 15
    .line 16
    const-string v4, "openPublishHelp, start"

    .line 17
    .line 18
    invoke-static {v3, v4}, Ll/zqe;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object v3, p0, Ll/ire;->Y:Ll/txl;

    .line 22
    .line 23
    if-eqz v3, :cond_0

    .line 24
    .line 25
    invoke-direct {p0}, Ll/ire;->f0()V

    .line 26
    .line 27
    .line 28
    const-string v3, "EffectPlayerInput"

    .line 29
    .line 30
    new-instance v4, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    invoke-direct {v4, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 36
    .line 37
    .line 38
    move-result-wide v5

    .line 39
    iget-wide v7, p0, Ll/ire;->G0:J

    .line 40
    .line 41
    sub-long/2addr v5, v7

    .line 42
    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    const-string v2, "ms"

    .line 46
    .line 47
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-static {v3, v2}, Ll/zqe;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :catchall_0
    move-exception v0

    .line 59
    goto :goto_1

    .line 60
    :cond_0
    :goto_0
    :try_start_1
    iget-object v2, p0, Ll/rnw;->E:Landroid/graphics/SurfaceTexture;

    .line 61
    .line 62
    if-nez v2, :cond_1

    .line 63
    .line 64
    invoke-virtual {p0}, Ll/ire;->U()Landroid/graphics/SurfaceTexture;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    iput-object v2, p0, Ll/rnw;->E:Landroid/graphics/SurfaceTexture;

    .line 69
    .line 70
    new-instance v2, Landroid/view/Surface;

    .line 71
    .line 72
    iget-object v3, p0, Ll/rnw;->E:Landroid/graphics/SurfaceTexture;

    .line 73
    .line 74
    invoke-direct {v2, v3}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 75
    .line 76
    .line 77
    iput-object v2, p0, Ll/ire;->k0:Landroid/view/Surface;

    .line 78
    .line 79
    :cond_1
    invoke-direct {p0}, Ll/ire;->V()V

    .line 80
    .line 81
    .line 82
    const-string v2, "EffectPlayerInput"

    .line 83
    .line 84
    new-instance v3, Ljava/lang/StringBuilder;

    .line 85
    .line 86
    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 90
    .line 91
    .line 92
    move-result-wide v4

    .line 93
    iget-wide v6, p0, Ll/ire;->G0:J

    .line 94
    .line 95
    sub-long/2addr v4, v6

    .line 96
    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    const-string v1, "ms"

    .line 100
    .line 101
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    invoke-static {v2, v1}, Ll/zqe;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 109
    .line 110
    .line 111
    monitor-exit p0

    .line 112
    return-void

    .line 113
    :catch_0
    :try_start_2
    const-string v1, "EffectPlayerInput"

    .line 114
    .line 115
    new-instance v2, Ljava/lang/StringBuilder;

    .line 116
    .line 117
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    iget-object v0, p0, Ll/ire;->Z:Ljava/lang/String;

    .line 121
    .line 122
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    invoke-static {v1, v0}, Ll/zqe;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {p0}, Ll/ire;->e0()V

    .line 133
    .line 134
    .line 135
    invoke-virtual {p0}, Ll/ire;->S()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 136
    .line 137
    .line 138
    monitor-exit p0

    .line 139
    return-void

    .line 140
    :goto_1
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 141
    throw v0
.end method

.method public e(Ll/txl;II)V
    .locals 6

    .line 1
    invoke-interface {p1}, Ll/txl;->getVideoWidth()I

    .line 2
    .line 3
    .line 4
    move-result v2

    .line 5
    invoke-interface {p1}, Ll/txl;->getVideoHeight()I

    .line 6
    .line 7
    .line 8
    move-result v3

    .line 9
    iput v2, p0, Ll/ire;->E0:I

    .line 10
    .line 11
    iput v3, p0, Ll/ire;->F0:I

    .line 12
    .line 13
    iget-object p1, p0, Ll/rnw;->E:Landroid/graphics/SurfaceTexture;

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p1, v2, v3}, Landroid/graphics/SurfaceTexture;->setDefaultBufferSize(II)V

    .line 18
    .line 19
    .line 20
    :cond_0
    invoke-virtual {p0, v2, v3}, Ll/rnw;->E(II)V

    .line 21
    .line 22
    .line 23
    const/4 p1, 0x1

    .line 24
    iput-boolean p1, p0, Ll/ire;->N0:Z

    .line 25
    .line 26
    iget-object v0, p0, Ll/ire;->I0:Ll/zyl$c;

    .line 27
    .line 28
    move-object v1, p0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    move v4, p2

    .line 32
    move v5, p3

    .line 33
    invoke-interface/range {v0 .. v5}, Ll/zyl$c;->a(Ll/zyl;IIII)V

    .line 34
    .line 35
    .line 36
    :cond_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 37
    .line 38
    const-string p1, "openPublishHelp onVideoSizeChanged:w="

    .line 39
    .line 40
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    iget p1, v1, Ll/vej;->l:I

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    const-string p1, ",h="

    .line 49
    .line 50
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    iget p1, v1, Ll/vej;->m:I

    .line 54
    .line 55
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    const-string p1, ","

    .line 59
    .line 60
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    const-string p1, "zk"

    .line 77
    .line 78
    invoke-static {p1, p0}, Ll/zqe;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public e0()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/ire;->H0:Z

    .line 3
    .line 4
    invoke-direct {p0}, Ll/ire;->f0()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public g(Ll/txl;)V
    .locals 5

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/ire;->H0:Z

    .line 3
    .line 4
    invoke-interface {p1}, Ll/txl;->getVideoWidth()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    iput v0, p0, Ll/ire;->E0:I

    .line 9
    .line 10
    invoke-interface {p1}, Ll/txl;->getVideoHeight()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iput v0, p0, Ll/ire;->F0:I

    .line 15
    .line 16
    new-instance v0, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    const-string v1, "openPublishHelp, <onPrepared> cost time:"

    .line 19
    .line 20
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 24
    .line 25
    .line 26
    move-result-wide v1

    .line 27
    iget-wide v3, p0, Ll/ire;->G0:J

    .line 28
    .line 29
    sub-long/2addr v1, v3

    .line 30
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, "ms height"

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget v1, p0, Ll/ire;->E0:I

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, "height"

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget v1, p0, Ll/ire;->F0:I

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    const-string v1, "zk"

    .line 58
    .line 59
    invoke-static {v1, v0}, Ll/zqe;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Ll/rnw;->E:Landroid/graphics/SurfaceTexture;

    .line 63
    .line 64
    if-nez v0, :cond_0

    .line 65
    .line 66
    invoke-virtual {p0}, Ll/ire;->U()Landroid/graphics/SurfaceTexture;

    .line 67
    .line 68
    .line 69
    :cond_0
    iget-object v0, p0, Ll/rnw;->E:Landroid/graphics/SurfaceTexture;

    .line 70
    .line 71
    iget v1, p0, Ll/ire;->E0:I

    .line 72
    .line 73
    iget v2, p0, Ll/ire;->F0:I

    .line 74
    .line 75
    invoke-virtual {v0, v1, v2}, Landroid/graphics/SurfaceTexture;->setDefaultBufferSize(II)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Ll/rnw;->E:Landroid/graphics/SurfaceTexture;

    .line 79
    .line 80
    invoke-virtual {v0, p0}, Landroid/graphics/SurfaceTexture;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;)V

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Ll/ire;->Y:Ll/txl;

    .line 84
    .line 85
    iget-object p0, p0, Ll/ire;->k0:Landroid/view/Surface;

    .line 86
    .line 87
    invoke-interface {v0, p0}, Ll/txl;->setSurface(Landroid/view/Surface;)V

    .line 88
    .line 89
    .line 90
    invoke-interface {p1}, Ll/txl;->start()V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public i()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/rnw;->i()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/rnw;->E:Landroid/graphics/SurfaceTexture;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->release()V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Ll/rnw;->E:Landroid/graphics/SurfaceTexture;

    .line 13
    .line 14
    :cond_0
    invoke-direct {p0}, Ll/ire;->T()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public onFrameAvailable(Landroid/graphics/SurfaceTexture;)V
    .locals 1

    .line 1
    const-string p1, "EffectPlayerInput"

    .line 2
    .line 3
    const-string v0, "onFrameAvailable"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/zqe;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/ire;->X:Ll/mre;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/mre;->m()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public v()V
    .locals 3
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0xf
    .end annotation

    .line 1
    invoke-super {p0}, Ll/rnw;->v()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/ire;->Y:Ll/txl;

    .line 5
    .line 6
    if-eqz v0, :cond_2

    .line 7
    .line 8
    iget-object v0, p0, Ll/rnw;->E:Landroid/graphics/SurfaceTexture;

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/ire;->U()Landroid/graphics/SurfaceTexture;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Ll/rnw;->E:Landroid/graphics/SurfaceTexture;

    .line 17
    .line 18
    :cond_0
    iget-object v0, p0, Ll/ire;->k0:Landroid/view/Surface;

    .line 19
    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    new-instance v0, Landroid/view/Surface;

    .line 23
    .line 24
    iget-object v1, p0, Ll/rnw;->E:Landroid/graphics/SurfaceTexture;

    .line 25
    .line 26
    invoke-direct {v0, v1}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, Ll/ire;->k0:Landroid/view/Surface;

    .line 30
    .line 31
    :cond_1
    iget-object v0, p0, Ll/rnw;->E:Landroid/graphics/SurfaceTexture;

    .line 32
    .line 33
    iget v1, p0, Ll/ire;->E0:I

    .line 34
    .line 35
    iget v2, p0, Ll/ire;->F0:I

    .line 36
    .line 37
    invoke-virtual {v0, v1, v2}, Landroid/graphics/SurfaceTexture;->setDefaultBufferSize(II)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Ll/rnw;->E:Landroid/graphics/SurfaceTexture;

    .line 41
    .line 42
    invoke-virtual {v0, p0}, Landroid/graphics/SurfaceTexture;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Ll/ire;->Y:Ll/txl;

    .line 46
    .line 47
    iget-object p0, p0, Ll/ire;->k0:Landroid/view/Surface;

    .line 48
    .line 49
    invoke-interface {v0, p0}, Ll/txl;->setSurface(Landroid/view/Surface;)V

    .line 50
    .line 51
    .line 52
    :cond_2
    return-void
.end method

.method public w()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ire;->K0:Ll/zyl$d;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Ll/ire;->Y:Ll/txl;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-interface {v1}, Ll/txl;->getCurrentPosition()J

    .line 10
    .line 11
    .line 12
    move-result-wide v1

    .line 13
    invoke-interface {v0, v1, v2}, Ll/zyl$d;->onRenderTimestampChanged(J)V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget v0, p0, Ll/vej;->h:I

    .line 17
    .line 18
    iget-object v1, p0, Ll/rnw;->E:Landroid/graphics/SurfaceTexture;

    .line 19
    .line 20
    invoke-virtual {p0, v0, v1}, Ll/rnw;->R(ILandroid/graphics/SurfaceTexture;)V

    .line 21
    .line 22
    .line 23
    invoke-super {p0}, Ll/vej;->w()V

    .line 24
    .line 25
    .line 26
    return-void
.end method
