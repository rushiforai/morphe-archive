.class public Ll/ia4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ypl$a;
.implements Ll/ypl$c;
.implements Ll/ypl$b;
.implements Ll/ypl$d;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/ia4$b;
    }
.end annotation


# instance fields
.field final a:I

.field private b:Ll/ia4$b;

.field private c:Ll/ypl;

.field d:I

.field private e:Landroid/graphics/Rect;

.field private f:Landroid/graphics/Rect;

.field private g:Landroid/graphics/SurfaceTexture;

.field private h:Ll/spw;


# direct methods
.method public constructor <init>(Ll/sow;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x12f

    .line 5
    .line 6
    iput v0, p0, Ll/ia4;->a:I

    .line 7
    .line 8
    const/16 v0, 0x3c

    .line 9
    .line 10
    iput v0, p0, Ll/ia4;->d:I

    .line 11
    .line 12
    new-instance v0, Landroid/graphics/Rect;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-direct {v0, v1, v1, v1, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Ll/ia4;->e:Landroid/graphics/Rect;

    .line 19
    .line 20
    new-instance v0, Landroid/graphics/Rect;

    .line 21
    .line 22
    invoke-direct {v0, v1, v1, v1, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Ll/ia4;->f:Landroid/graphics/Rect;

    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    iput-object v0, p0, Ll/ia4;->g:Landroid/graphics/SurfaceTexture;

    .line 29
    .line 30
    iput-object v0, p0, Ll/ia4;->h:Ll/spw;

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Ll/ia4;->e(Ll/sow;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public static synthetic b(Ll/ia4;)Ll/spw;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ia4;->h:Ll/spw;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public a([B)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ia4;->b:Ll/ia4$b;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/ia4$b;->E([B)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public c(Landroid/graphics/Rect;Landroid/hardware/Camera$AutoFocusCallback;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ia4;->c:Ll/ypl;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Ll/ia4;->e:Landroid/graphics/Rect;

    .line 6
    .line 7
    iget v1, p0, Ll/ia4;->d:I

    .line 8
    .line 9
    invoke-static {v0, p1, v1}, Ll/ad4;->d(Landroid/graphics/Rect;Landroid/graphics/Rect;I)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/ia4;->g()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    :cond_0
    iget-object v0, p0, Ll/ia4;->e:Landroid/graphics/Rect;

    .line 22
    .line 23
    invoke-virtual {v0, p1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Ll/ia4;->c:Ll/ypl;

    .line 27
    .line 28
    iget-object p0, p0, Ll/ia4;->e:Landroid/graphics/Rect;

    .line 29
    .line 30
    invoke-interface {p1, p0, p2}, Ll/ypl;->k(Landroid/graphics/Rect;Landroid/hardware/Camera$AutoFocusCallback;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void
.end method

.method public d()Ll/ypl;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ia4;->c:Ll/ypl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const/4 p0, 0x0

    .line 7
    return-object p0
.end method

.method public declared-synchronized e(Ll/sow;)V
    .locals 3

    .line 1
    const-string v0, "cameraType is camera1 "

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/ia4;->c:Ll/ypl;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/ia4;->i()V

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :catchall_0
    move-exception p1

    .line 13
    goto :goto_3

    .line 14
    :cond_0
    :goto_0
    iget-boolean v1, p1, Ll/sow;->T:Z

    .line 15
    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    new-instance v1, Ll/diw;

    .line 19
    .line 20
    invoke-direct {v1, p1}, Ll/diw;-><init>(Ll/sow;)V

    .line 21
    .line 22
    .line 23
    iput-object v1, p0, Ll/ia4;->c:Ll/ypl;

    .line 24
    .line 25
    invoke-static {}, Lcom/immomo/moment/datadot/DataDotUtils;->getInstance()Lcom/immomo/moment/datadot/DataDotUtils;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v1}, Lcom/immomo/moment/datadot/DataDotUtils;->getRecoderDataDotInfo()Lcom/immomo/moment/datadot/RecoderDataDotInfo;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    const/4 v2, 0x2

    .line 34
    invoke-virtual {v1, v2}, Lcom/immomo/moment/datadot/RecoderDataDotInfo;->setCameraType(I)V

    .line 35
    .line 36
    .line 37
    goto :goto_1

    .line 38
    :cond_1
    const/4 v1, 0x1

    .line 39
    iput-boolean v1, p1, Ll/sow;->h0:Z

    .line 40
    .line 41
    new-instance v2, Ll/aiw;

    .line 42
    .line 43
    invoke-direct {v2, p1}, Ll/aiw;-><init>(Ll/sow;)V

    .line 44
    .line 45
    .line 46
    iput-object v2, p0, Ll/ia4;->c:Ll/ypl;

    .line 47
    .line 48
    invoke-static {}, Lcom/immomo/moment/datadot/DataDotUtils;->getInstance()Lcom/immomo/moment/datadot/DataDotUtils;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-virtual {v2}, Lcom/immomo/moment/datadot/DataDotUtils;->getRecoderDataDotInfo()Lcom/immomo/moment/datadot/RecoderDataDotInfo;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-virtual {v2, v1}, Lcom/immomo/moment/datadot/RecoderDataDotInfo;->setCameraType(I)V

    .line 57
    .line 58
    .line 59
    :goto_1
    const-string v1, "Camera"

    .line 60
    .line 61
    iget-boolean p1, p1, Ll/sow;->T:Z

    .line 62
    .line 63
    if-eqz p1, :cond_2

    .line 64
    .line 65
    const-string p1, "false"

    .line 66
    .line 67
    goto :goto_2

    .line 68
    :cond_2
    const-string p1, "true"

    .line 69
    .line 70
    :goto_2
    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-static {v1, p1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 75
    .line 76
    .line 77
    monitor-exit p0

    .line 78
    return-void

    .line 79
    :goto_3
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 80
    throw p1
.end method

.method public f(IILandroid/graphics/Rect;Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ia4;->c:Ll/ypl;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/ia4;->f:Landroid/graphics/Rect;

    .line 6
    .line 7
    iget v1, p0, Ll/ia4;->d:I

    .line 8
    .line 9
    invoke-static {v0, p3, v1}, Ll/ad4;->d(Landroid/graphics/Rect;Landroid/graphics/Rect;I)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/ia4;->f:Landroid/graphics/Rect;

    .line 16
    .line 17
    invoke-virtual {v0, p3}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/ia4;->c:Ll/ypl;

    .line 21
    .line 22
    invoke-interface {p0, p1, p2, p3, p4}, Ll/ypl;->f(IILandroid/graphics/Rect;Z)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public g()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ia4;->c:Ll/ypl;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-interface {p0}, Ll/ypl;->i()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public h(ILl/qow;)Z
    .locals 3

    .line 1
    const-string v0, "CameraMediaSourceManager prepare !!!"

    .line 2
    .line 3
    const-string v1, "Camera"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/ia4;->c:Ll/ypl;

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-interface {v0, p1, p2}, Ll/ypl;->C(ILl/qow;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    const-string p0, "Camera prepare Failed !!!"

    .line 20
    .line 21
    invoke-static {v1, p0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return v2

    .line 25
    :cond_0
    iget-object p1, p0, Ll/ia4;->c:Ll/ypl;

    .line 26
    .line 27
    invoke-interface {p1, p0}, Ll/ypl;->w(Ll/ypl$a;)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Ll/ia4;->c:Ll/ypl;

    .line 31
    .line 32
    invoke-interface {p1, p0}, Ll/ypl;->q(Ll/ypl$d;)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Ll/ia4;->c:Ll/ypl;

    .line 36
    .line 37
    invoke-interface {p1, p0}, Ll/ypl;->r(Ll/ypl$c;)V

    .line 38
    .line 39
    .line 40
    new-instance p1, Landroid/graphics/Rect;

    .line 41
    .line 42
    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    .line 43
    .line 44
    .line 45
    iput-object p1, p0, Ll/ia4;->e:Landroid/graphics/Rect;

    .line 46
    .line 47
    const/4 p0, 0x1

    .line 48
    return p0

    .line 49
    :cond_1
    return v2
.end method

.method public declared-synchronized i()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/ia4;->c:Ll/ypl;

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    const-string v0, "Camera"

    .line 7
    .line 8
    const-string v1, "CameraMediaSourceManager release !!!"

    .line 9
    .line 10
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/ia4;->c:Ll/ypl;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-interface {v0, v1}, Ll/ypl;->e(Landroid/hardware/Camera$ErrorCallback;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/ia4;->c:Ll/ypl;

    .line 20
    .line 21
    invoke-interface {v0}, Ll/ypl;->a()I

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/ia4;->c:Ll/ypl;

    .line 25
    .line 26
    invoke-interface {v0, v1}, Ll/ypl;->w(Ll/ypl$a;)V

    .line 27
    .line 28
    .line 29
    iput-object v1, p0, Ll/ia4;->g:Landroid/graphics/SurfaceTexture;

    .line 30
    .line 31
    iput-object v1, p0, Ll/ia4;->c:Ll/ypl;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :catchall_0
    move-exception v0

    .line 35
    goto :goto_1

    .line 36
    :cond_0
    :goto_0
    monitor-exit p0

    .line 37
    return-void

    .line 38
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 39
    throw v0
.end method

.method public j(ILl/qow;)Z
    .locals 2

    .line 1
    const-string v0, "Camera"

    .line 2
    .line 3
    const-string v1, "CameraMediaSourceManager resetCamera !!!"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/ia4;->c:Ll/ypl;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-interface {v0, p1, p2}, Ll/ypl;->u(ILl/qow;)Z

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Ll/ia4;->c:Ll/ypl;

    .line 17
    .line 18
    iget-object p0, p0, Ll/ia4;->g:Landroid/graphics/SurfaceTexture;

    .line 19
    .line 20
    invoke-interface {p1, p0}, Ll/ypl;->j(Landroid/graphics/SurfaceTexture;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-nez p0, :cond_0

    .line 25
    .line 26
    return v1

    .line 27
    :cond_0
    const/4 p0, 0x1

    .line 28
    return p0

    .line 29
    :cond_1
    return v1
.end method

.method public k(Landroid/content/Context;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ia4;->c:Ll/ypl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    instance-of v0, p0, Ll/diw;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    check-cast p0, Ll/diw;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/diw;->p0(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public l(Ll/ia4$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ia4;->b:Ll/ia4$b;

    .line 2
    .line 3
    return-void
.end method

.method public m(Ll/spw;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/ia4;->h:Ll/spw;

    .line 2
    .line 3
    iget-object p1, p0, Ll/ia4;->c:Ll/ypl;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    new-instance v0, Ll/ia4$a;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/ia4$a;-><init>(Ll/ia4;)V

    .line 10
    .line 11
    .line 12
    invoke-interface {p1, v0}, Ll/ypl;->p(Ll/ypl$e;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public n(Ll/diw$h;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ia4;->c:Ll/ypl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    instance-of v0, p0, Ll/diw;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    check-cast p0, Ll/diw;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/diw;->q0(Ll/diw$h;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public o(Landroid/hardware/Camera$ErrorCallback;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ia4;->c:Ll/ypl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/ypl;->e(Landroid/hardware/Camera$ErrorCallback;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public onData([B)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ia4;->b:Ll/ia4$b;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/ia4$b;->D([B)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public p(Ll/ypl$f;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ia4;->c:Ll/ypl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/ypl;->l(Ll/ypl$f;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public q(Landroid/graphics/SurfaceTexture;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ia4;->c:Ll/ypl;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iput-object p1, p0, Ll/ia4;->g:Landroid/graphics/SurfaceTexture;

    .line 6
    .line 7
    invoke-interface {v0, p1}, Ll/ypl;->j(Landroid/graphics/SurfaceTexture;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method public r()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ia4;->c:Ll/ypl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/ypl;->a()I

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public s(ILl/qow;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ia4;->c:Ll/ypl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Ll/ypl;->A(ILl/qow;)Z

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public t(I)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ia4;->c:Ll/ypl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/ypl;->s(I)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method
