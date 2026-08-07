.class public Ll/abh0;
.super Ll/eli0;
.source "SourceFile"

# interfaces
.implements Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;


# instance fields
.field private B:I

.field private C:Landroid/graphics/SurfaceTexture;

.field private D:Landroid/view/Surface;

.field private E:Ll/zah0;

.field private F:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/eli0;-><init>(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/lang/Object;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/abh0;->F:Ljava/lang/Object;

    .line 10
    .line 11
    const/4 p1, 0x1

    .line 12
    invoke-virtual {p0, p1}, Ll/eli0;->o0(I)V

    .line 13
    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    invoke-virtual {p0, p1}, Ll/qt2;->D(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method private L0(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "set Rotation = "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "huli"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/abh0;->E:Ll/zah0;

    .line 21
    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Ll/zah0;->t(I)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method


# virtual methods
.method public G0()V
    .locals 2

    .line 1
    const-string v0, "EditProcess"

    .line 2
    .line 3
    const-string v1, "SurfaceTextureRenderThread clearSurfaceTexture!!!"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/abh0;->C:Landroid/graphics/SurfaceTexture;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->release()V

    .line 14
    .line 15
    .line 16
    iput-object v1, p0, Ll/abh0;->C:Landroid/graphics/SurfaceTexture;

    .line 17
    .line 18
    :cond_0
    iget-object v0, p0, Ll/abh0;->D:Landroid/view/Surface;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    .line 23
    .line 24
    .line 25
    iput-object v1, p0, Ll/abh0;->D:Landroid/view/Surface;

    .line 26
    .line 27
    :cond_1
    return-void
.end method

.method public H0()Landroid/graphics/SurfaceTexture;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/abh0;->C:Landroid/graphics/SurfaceTexture;

    .line 2
    .line 3
    return-object p0
.end method

.method public I0()Landroid/view/Surface;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/abh0;->D:Landroid/view/Surface;

    .line 2
    .line 3
    return-object p0
.end method

.method public J0()I
    .locals 0

    .line 1
    iget p0, p0, Ll/abh0;->B:I

    .line 2
    .line 3
    return p0
.end method

.method public K0()V
    .locals 5

    .line 1
    const/4 v0, 0x1

    .line 2
    new-array v1, v0, [I

    .line 3
    .line 4
    const/4 v2, 0x0

    .line 5
    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 6
    .line 7
    .line 8
    aget v0, v1, v2

    .line 9
    .line 10
    const v3, 0x8d65

    .line 11
    .line 12
    .line 13
    invoke-static {v3, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 14
    .line 15
    .line 16
    const/16 v0, 0x2801

    .line 17
    .line 18
    const v4, 0x46180400    # 9729.0f

    .line 19
    .line 20
    .line 21
    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 22
    .line 23
    .line 24
    const/16 v0, 0x2800

    .line 25
    .line 26
    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 27
    .line 28
    .line 29
    const/16 v0, 0x2802

    .line 30
    .line 31
    const v4, 0x812f

    .line 32
    .line 33
    .line 34
    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 35
    .line 36
    .line 37
    const/16 v0, 0x2803

    .line 38
    .line 39
    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 40
    .line 41
    .line 42
    aget v0, v1, v2

    .line 43
    .line 44
    iput v0, p0, Ll/abh0;->B:I

    .line 45
    .line 46
    new-instance v0, Landroid/graphics/SurfaceTexture;

    .line 47
    .line 48
    iget v1, p0, Ll/abh0;->B:I

    .line 49
    .line 50
    invoke-direct {v0, v1}, Landroid/graphics/SurfaceTexture;-><init>(I)V

    .line 51
    .line 52
    .line 53
    iput-object v0, p0, Ll/abh0;->C:Landroid/graphics/SurfaceTexture;

    .line 54
    .line 55
    invoke-virtual {v0, p0}, Landroid/graphics/SurfaceTexture;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;)V

    .line 56
    .line 57
    .line 58
    new-instance v0, Landroid/view/Surface;

    .line 59
    .line 60
    iget-object v1, p0, Ll/abh0;->C:Landroid/graphics/SurfaceTexture;

    .line 61
    .line 62
    invoke-direct {v0, v1}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 63
    .line 64
    .line 65
    iput-object v0, p0, Ll/abh0;->D:Landroid/view/Surface;

    .line 66
    .line 67
    return-void
.end method

.method public M0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/abh0;->C:Landroid/graphics/SurfaceTexture;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/eli0;->k:Ll/uje;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/uje;->f()Z

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/abh0;->C:Landroid/graphics/SurfaceTexture;

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/graphics/SurfaceTexture;->updateTexImage()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public f()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/abh0;->E:Ll/zah0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/zah0;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/zah0;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/abh0;->E:Ll/zah0;

    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public h()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/qt2;->h()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/abh0;->E:Ll/zah0;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/bkm;->e()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/abh0;->E:Ll/zah0;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/abh0;->H0()Landroid/graphics/SurfaceTexture;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {p0}, Ll/abh0;->J0()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    invoke-virtual {v0, v1, v2}, Ll/zah0;->u(Landroid/graphics/SurfaceTexture;I)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/abh0;->E:Ll/zah0;

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Ll/eli0;->C0(Ll/bkm;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public bridge synthetic j0()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/abh0;->H0()Landroid/graphics/SurfaceTexture;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public l(Landroid/os/Message;)V
    .locals 2

    .line 1
    iget v0, p1, Landroid/os/Message;->what:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eq v0, v1, :cond_1

    .line 5
    .line 6
    const/4 v1, 0x2

    .line 7
    if-eq v0, v1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget v0, p1, Landroid/os/Message;->arg1:I

    .line 11
    .line 12
    invoke-direct {p0, v0}, Ll/abh0;->L0(I)V

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_1
    invoke-virtual {p0}, Ll/abh0;->K0()V

    .line 17
    .line 18
    .line 19
    :goto_0
    iget-object p0, p0, Ll/eli0;->t:Ll/tpr;

    .line 20
    .line 21
    if-eqz p0, :cond_2

    .line 22
    .line 23
    invoke-interface {p0, p1}, Ll/tpr;->a(Landroid/os/Message;)V

    .line 24
    .line 25
    .line 26
    :cond_2
    return-void
.end method

.method public m()V
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x12
    .end annotation

    .line 1
    iget-object v0, p0, Ll/eli0;->t:Ll/tpr;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/os/Message;

    .line 6
    .line 7
    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 8
    .line 9
    .line 10
    const/16 v1, 0x109

    .line 11
    .line 12
    iput v1, v0, Landroid/os/Message;->what:I

    .line 13
    .line 14
    iget-object v1, p0, Ll/eli0;->t:Ll/tpr;

    .line 15
    .line 16
    invoke-interface {v1, v0}, Ll/tpr;->a(Landroid/os/Message;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    invoke-super {p0}, Ll/eli0;->m()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/abh0;->G0()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public onFrameAvailable(Landroid/graphics/SurfaceTexture;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/abh0;->F:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-virtual {p0}, Ll/eli0;->s0()V

    .line 5
    .line 6
    .line 7
    iget-object v1, p0, Ll/abh0;->E:Ll/zah0;

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/abh0;->J0()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    invoke-virtual {v1, p1, p0}, Ll/zah0;->u(Landroid/graphics/SurfaceTexture;I)V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :catchall_0
    move-exception p0

    .line 22
    goto :goto_1

    .line 23
    :cond_0
    :goto_0
    monitor-exit v0

    .line 24
    return-void

    .line 25
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    throw p0
.end method

.method public p()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/abh0;->C:Landroid/graphics/SurfaceTexture;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/eli0;->k:Ll/uje;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/uje;->f()Z

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/abh0;->C:Landroid/graphics/SurfaceTexture;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->updateTexImage()V

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-super {p0}, Ll/eli0;->p()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public u()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/qt2;->u()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public x0(I)V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-virtual {p0, v0, p1}, Ll/eli0;->p0(II)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public y(Ll/crf0;)V
    .locals 4
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0xf
    .end annotation

    .line 1
    iget-object v0, p0, Ll/abh0;->C:Landroid/graphics/SurfaceTexture;

    .line 2
    .line 3
    const-string v1, "huli"

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v2, "input render mInputSurfaceTexture "

    .line 10
    .line 11
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1}, Ll/crf0;->b()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/abh0;->C:Landroid/graphics/SurfaceTexture;

    .line 29
    .line 30
    invoke-virtual {p1}, Ll/crf0;->b()I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    invoke-virtual {p1}, Ll/crf0;->a()I

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    invoke-virtual {v0, v2, v3}, Landroid/graphics/SurfaceTexture;->setDefaultBufferSize(II)V

    .line 39
    .line 40
    .line 41
    :cond_0
    iget-object v0, p0, Ll/abh0;->E:Ll/zah0;

    .line 42
    .line 43
    if-eqz v0, :cond_1

    .line 44
    .line 45
    new-instance v0, Ljava/lang/StringBuilder;

    .line 46
    .line 47
    const-string v2, "input render setSize + "

    .line 48
    .line 49
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p1}, Ll/crf0;->b()I

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    iget-object p0, p0, Ll/abh0;->E:Ll/zah0;

    .line 67
    .line 68
    invoke-virtual {p0, p1}, Ll/zah0;->n(Ll/crf0;)V

    .line 69
    .line 70
    .line 71
    :cond_1
    return-void
.end method
