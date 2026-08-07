.class public abstract Lcom/immomo/moment/mediautils/m;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/moment/mediautils/m$e;,
        Lcom/immomo/moment/mediautils/m$c;,
        Lcom/immomo/moment/mediautils/m$d;
    }
.end annotation


# instance fields
.field protected A:Landroid/media/MediaFormat;

.field protected B:Landroid/media/MediaFormat;

.field private C:Ll/uje;

.field protected D:Landroid/os/HandlerThread;

.field protected E:Lcom/immomo/moment/mediautils/m$d;

.field private F:Z

.field private G:Ljava/lang/Object;

.field private H:Z

.field protected I:Z

.field protected J:J

.field protected a:I

.field protected b:I

.field protected c:I

.field protected d:I

.field protected e:I

.field protected f:I

.field protected g:I

.field protected h:I

.field protected i:I

.field protected j:I

.field protected k:I

.field protected l:I

.field protected m:J

.field protected n:I

.field protected o:J

.field protected p:J

.field protected q:J

.field protected r:I

.field protected s:Z

.field protected t:I

.field protected u:Landroid/graphics/SurfaceTexture;

.field protected v:Landroid/view/Surface;

.field private w:Z

.field protected x:Lcom/immomo/moment/mediautils/m$c;

.field protected y:Lcom/immomo/moment/mediautils/m$e;

.field protected z:Ll/spw;


# direct methods
.method public constructor <init>()V
    .locals 7

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/immomo/moment/mediautils/m;->a:I

    .line 6
    .line 7
    iput v0, p0, Lcom/immomo/moment/mediautils/m;->b:I

    .line 8
    .line 9
    const v1, 0xac44

    .line 10
    .line 11
    .line 12
    iput v1, p0, Lcom/immomo/moment/mediautils/m;->c:I

    .line 13
    .line 14
    const/16 v1, 0x10

    .line 15
    .line 16
    iput v1, p0, Lcom/immomo/moment/mediautils/m;->d:I

    .line 17
    .line 18
    const/4 v2, 0x1

    .line 19
    iput v2, p0, Lcom/immomo/moment/mediautils/m;->e:I

    .line 20
    .line 21
    iput v0, p0, Lcom/immomo/moment/mediautils/m;->f:I

    .line 22
    .line 23
    iput v1, p0, Lcom/immomo/moment/mediautils/m;->g:I

    .line 24
    .line 25
    iput v0, p0, Lcom/immomo/moment/mediautils/m;->h:I

    .line 26
    .line 27
    iput v0, p0, Lcom/immomo/moment/mediautils/m;->i:I

    .line 28
    .line 29
    iput v0, p0, Lcom/immomo/moment/mediautils/m;->j:I

    .line 30
    .line 31
    iput v0, p0, Lcom/immomo/moment/mediautils/m;->k:I

    .line 32
    .line 33
    iput v0, p0, Lcom/immomo/moment/mediautils/m;->l:I

    .line 34
    .line 35
    const-wide/16 v3, 0x0

    .line 36
    .line 37
    iput-wide v3, p0, Lcom/immomo/moment/mediautils/m;->m:J

    .line 38
    .line 39
    iput v1, p0, Lcom/immomo/moment/mediautils/m;->n:I

    .line 40
    .line 41
    const-wide/16 v5, -0x1

    .line 42
    .line 43
    iput-wide v5, p0, Lcom/immomo/moment/mediautils/m;->o:J

    .line 44
    .line 45
    iput-wide v3, p0, Lcom/immomo/moment/mediautils/m;->p:J

    .line 46
    .line 47
    iput-wide v5, p0, Lcom/immomo/moment/mediautils/m;->q:J

    .line 48
    .line 49
    const/16 v1, 0x11

    .line 50
    .line 51
    iput v1, p0, Lcom/immomo/moment/mediautils/m;->r:I

    .line 52
    .line 53
    iput-boolean v2, p0, Lcom/immomo/moment/mediautils/m;->s:Z

    .line 54
    .line 55
    const/4 v1, -0x1

    .line 56
    iput v1, p0, Lcom/immomo/moment/mediautils/m;->t:I

    .line 57
    .line 58
    iput-boolean v0, p0, Lcom/immomo/moment/mediautils/m;->w:Z

    .line 59
    .line 60
    const/4 v1, 0x0

    .line 61
    iput-object v1, p0, Lcom/immomo/moment/mediautils/m;->x:Lcom/immomo/moment/mediautils/m$c;

    .line 62
    .line 63
    iput-object v1, p0, Lcom/immomo/moment/mediautils/m;->y:Lcom/immomo/moment/mediautils/m$e;

    .line 64
    .line 65
    iput-object v1, p0, Lcom/immomo/moment/mediautils/m;->z:Ll/spw;

    .line 66
    .line 67
    iput-object v1, p0, Lcom/immomo/moment/mediautils/m;->A:Landroid/media/MediaFormat;

    .line 68
    .line 69
    iput-object v1, p0, Lcom/immomo/moment/mediautils/m;->B:Landroid/media/MediaFormat;

    .line 70
    .line 71
    iput-object v1, p0, Lcom/immomo/moment/mediautils/m;->D:Landroid/os/HandlerThread;

    .line 72
    .line 73
    iput-object v1, p0, Lcom/immomo/moment/mediautils/m;->E:Lcom/immomo/moment/mediautils/m$d;

    .line 74
    .line 75
    iput-boolean v0, p0, Lcom/immomo/moment/mediautils/m;->F:Z

    .line 76
    .line 77
    new-instance v1, Ljava/lang/Object;

    .line 78
    .line 79
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 80
    .line 81
    .line 82
    iput-object v1, p0, Lcom/immomo/moment/mediautils/m;->G:Ljava/lang/Object;

    .line 83
    .line 84
    iput-boolean v2, p0, Lcom/immomo/moment/mediautils/m;->H:Z

    .line 85
    .line 86
    iput-boolean v0, p0, Lcom/immomo/moment/mediautils/m;->I:Z

    .line 87
    .line 88
    iput-wide v5, p0, Lcom/immomo/moment/mediautils/m;->J:J

    .line 89
    .line 90
    return-void
.end method

.method public static synthetic a(Lcom/immomo/moment/mediautils/m;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/m;->G:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Lcom/immomo/moment/mediautils/m;)Ll/uje;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/m;->C:Ll/uje;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic c(Lcom/immomo/moment/mediautils/m;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/moment/mediautils/m;->F:Z

    .line 2
    .line 3
    return p1
.end method


# virtual methods
.method public A(Ll/uje;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/m;->C:Ll/uje;

    .line 2
    .line 3
    return-void
.end method

.method public abstract B()Z
.end method

.method public C(J)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/immomo/moment/mediautils/m;->B()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public d()Z
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/m;->D:Landroid/os/HandlerThread;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/os/HandlerThread;

    .line 6
    .line 7
    const-string v1, "Texturhandler"

    .line 8
    .line 9
    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/immomo/moment/mediautils/m;->D:Landroid/os/HandlerThread;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Lcom/immomo/moment/mediautils/m;->E:Lcom/immomo/moment/mediautils/m$d;

    .line 18
    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    new-instance v0, Lcom/immomo/moment/mediautils/m$d;

    .line 22
    .line 23
    iget-object v1, p0, Lcom/immomo/moment/mediautils/m;->D:Landroid/os/HandlerThread;

    .line 24
    .line 25
    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-direct {v0, p0, v1}, Lcom/immomo/moment/mediautils/m$d;-><init>(Lcom/immomo/moment/mediautils/m;Landroid/os/Looper;)V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Lcom/immomo/moment/mediautils/m;->E:Lcom/immomo/moment/mediautils/m$d;

    .line 33
    .line 34
    :cond_1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/m;->E:Lcom/immomo/moment/mediautils/m$d;

    .line 35
    .line 36
    const/4 v1, 0x1

    .line 37
    if-eqz v0, :cond_3

    .line 38
    .line 39
    iget-object v2, p0, Lcom/immomo/moment/mediautils/m;->D:Landroid/os/HandlerThread;

    .line 40
    .line 41
    if-eqz v2, :cond_3

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-virtual {v0, v2}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/immomo/moment/mediautils/m;->G:Ljava/lang/Object;

    .line 51
    .line 52
    monitor-enter v0

    .line 53
    :goto_0
    :try_start_0
    iget-boolean v2, p0, Lcom/immomo/moment/mediautils/m;->F:Z

    .line 54
    .line 55
    if-nez v2, :cond_2

    .line 56
    .line 57
    iget-boolean v2, p0, Lcom/immomo/moment/mediautils/m;->H:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 58
    .line 59
    if-eqz v2, :cond_2

    .line 60
    .line 61
    :try_start_1
    iget-object v2, p0, Lcom/immomo/moment/mediautils/m;->G:Ljava/lang/Object;

    .line 62
    .line 63
    const-wide/16 v3, 0xa

    .line 64
    .line 65
    invoke-virtual {v2, v3, v4}, Ljava/lang/Object;->wait(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 66
    .line 67
    .line 68
    goto :goto_0

    .line 69
    :catchall_0
    move-exception p0

    .line 70
    goto :goto_1

    .line 71
    :catch_0
    move-exception v2

    .line 72
    :try_start_2
    invoke-virtual {v2}, Ljava/lang/Throwable;->printStackTrace()V

    .line 73
    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_2
    monitor-exit v0

    .line 77
    goto :goto_2

    .line 78
    :goto_1
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 79
    throw p0

    .line 80
    :cond_3
    invoke-static {}, Ll/uje;->d()I

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    iput v0, p0, Lcom/immomo/moment/mediautils/m;->t:I

    .line 85
    .line 86
    new-instance v0, Landroid/graphics/SurfaceTexture;

    .line 87
    .line 88
    iget v2, p0, Lcom/immomo/moment/mediautils/m;->t:I

    .line 89
    .line 90
    invoke-direct {v0, v2}, Landroid/graphics/SurfaceTexture;-><init>(I)V

    .line 91
    .line 92
    .line 93
    iput-object v0, p0, Lcom/immomo/moment/mediautils/m;->u:Landroid/graphics/SurfaceTexture;

    .line 94
    .line 95
    new-instance v0, Landroid/view/Surface;

    .line 96
    .line 97
    iget-object v2, p0, Lcom/immomo/moment/mediautils/m;->u:Landroid/graphics/SurfaceTexture;

    .line 98
    .line 99
    invoke-direct {v0, v2}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 100
    .line 101
    .line 102
    iput-object v0, p0, Lcom/immomo/moment/mediautils/m;->v:Landroid/view/Surface;

    .line 103
    .line 104
    iget-object v0, p0, Lcom/immomo/moment/mediautils/m;->u:Landroid/graphics/SurfaceTexture;

    .line 105
    .line 106
    new-instance v2, Lcom/immomo/moment/mediautils/m$b;

    .line 107
    .line 108
    invoke-direct {v2, p0}, Lcom/immomo/moment/mediautils/m$b;-><init>(Lcom/immomo/moment/mediautils/m;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v0, v2}, Landroid/graphics/SurfaceTexture;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;)V

    .line 112
    .line 113
    .line 114
    :goto_2
    return v1
.end method

.method public e()Landroid/media/MediaFormat;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/m;->A:Landroid/media/MediaFormat;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget v1, p0, Lcom/immomo/moment/mediautils/m;->h:I

    .line 6
    .line 7
    if-lez v1, :cond_0

    .line 8
    .line 9
    const-string v2, "channel-count"

    .line 10
    .line 11
    invoke-virtual {v0, v2, v1}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget v0, p0, Lcom/immomo/moment/mediautils/m;->f:I

    .line 15
    .line 16
    if-lez v0, :cond_1

    .line 17
    .line 18
    iget-object v1, p0, Lcom/immomo/moment/mediautils/m;->A:Landroid/media/MediaFormat;

    .line 19
    .line 20
    const-string v2, "sample-rate"

    .line 21
    .line 22
    invoke-virtual {v1, v2, v0}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 23
    .line 24
    .line 25
    :cond_1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/m;->A:Landroid/media/MediaFormat;

    .line 26
    .line 27
    return-object p0
.end method

.method public f()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/moment/mediautils/m;->h:I

    .line 2
    .line 3
    return p0
.end method

.method public g()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/moment/mediautils/m;->f:I

    .line 2
    .line 3
    return p0
.end method

.method public h()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/m;->m:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public i()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/moment/mediautils/m;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public j()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/moment/mediautils/m;->t:I

    .line 2
    .line 3
    return p0
.end method

.method public k()I
    .locals 1

    .line 1
    iget v0, p0, Lcom/immomo/moment/mediautils/m;->k:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget p0, p0, Lcom/immomo/moment/mediautils/m;->l:I

    .line 6
    .line 7
    return p0

    .line 8
    :cond_0
    return v0
.end method

.method public l()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/moment/mediautils/m;->r:I

    .line 2
    .line 3
    return p0
.end method

.method public m()Landroid/media/MediaFormat;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/m;->B:Landroid/media/MediaFormat;

    .line 2
    .line 3
    return-object p0
.end method

.method public n()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/moment/mediautils/m;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public abstract o()V
.end method

.method public abstract p(Ljava/lang/String;I)Z
.end method

.method public q()V
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/immomo/moment/mediautils/m;->H:Z

    .line 3
    .line 4
    iput v0, p0, Lcom/immomo/moment/mediautils/m;->a:I

    .line 5
    .line 6
    iput v0, p0, Lcom/immomo/moment/mediautils/m;->b:I

    .line 7
    .line 8
    iput v0, p0, Lcom/immomo/moment/mediautils/m;->c:I

    .line 9
    .line 10
    iput v0, p0, Lcom/immomo/moment/mediautils/m;->d:I

    .line 11
    .line 12
    iput v0, p0, Lcom/immomo/moment/mediautils/m;->e:I

    .line 13
    .line 14
    const-wide/16 v1, -0x1

    .line 15
    .line 16
    iput-wide v1, p0, Lcom/immomo/moment/mediautils/m;->o:J

    .line 17
    .line 18
    iput-wide v1, p0, Lcom/immomo/moment/mediautils/m;->q:J

    .line 19
    .line 20
    const/16 v1, 0x11

    .line 21
    .line 22
    iput v1, p0, Lcom/immomo/moment/mediautils/m;->r:I

    .line 23
    .line 24
    iput-boolean v0, p0, Lcom/immomo/moment/mediautils/m;->s:Z

    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    iput-object v1, p0, Lcom/immomo/moment/mediautils/m;->x:Lcom/immomo/moment/mediautils/m$c;

    .line 28
    .line 29
    iput-object v1, p0, Lcom/immomo/moment/mediautils/m;->y:Lcom/immomo/moment/mediautils/m$e;

    .line 30
    .line 31
    iget-object v2, p0, Lcom/immomo/moment/mediautils/m;->v:Landroid/view/Surface;

    .line 32
    .line 33
    if-eqz v2, :cond_0

    .line 34
    .line 35
    iget-boolean v3, p0, Lcom/immomo/moment/mediautils/m;->w:Z

    .line 36
    .line 37
    if-nez v3, :cond_0

    .line 38
    .line 39
    invoke-virtual {v2}, Landroid/view/Surface;->release()V

    .line 40
    .line 41
    .line 42
    iput-object v1, p0, Lcom/immomo/moment/mediautils/m;->v:Landroid/view/Surface;

    .line 43
    .line 44
    :cond_0
    iget-object v2, p0, Lcom/immomo/moment/mediautils/m;->u:Landroid/graphics/SurfaceTexture;

    .line 45
    .line 46
    if-eqz v2, :cond_1

    .line 47
    .line 48
    iget-boolean v3, p0, Lcom/immomo/moment/mediautils/m;->w:Z

    .line 49
    .line 50
    if-nez v3, :cond_1

    .line 51
    .line 52
    invoke-virtual {v2}, Landroid/graphics/SurfaceTexture;->release()V

    .line 53
    .line 54
    .line 55
    iput-object v1, p0, Lcom/immomo/moment/mediautils/m;->u:Landroid/graphics/SurfaceTexture;

    .line 56
    .line 57
    :cond_1
    iget-object v2, p0, Lcom/immomo/moment/mediautils/m;->D:Landroid/os/HandlerThread;

    .line 58
    .line 59
    if-eqz v2, :cond_3

    .line 60
    .line 61
    iget-object v2, p0, Lcom/immomo/moment/mediautils/m;->E:Lcom/immomo/moment/mediautils/m$d;

    .line 62
    .line 63
    if-eqz v2, :cond_3

    .line 64
    .line 65
    const/4 v3, 0x2

    .line 66
    invoke-virtual {v2, v3}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    invoke-virtual {v2, v3}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 71
    .line 72
    .line 73
    iget-object v2, p0, Lcom/immomo/moment/mediautils/m;->G:Ljava/lang/Object;

    .line 74
    .line 75
    monitor-enter v2

    .line 76
    :goto_0
    :try_start_0
    iget-boolean v3, p0, Lcom/immomo/moment/mediautils/m;->F:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 77
    .line 78
    if-eqz v3, :cond_2

    .line 79
    .line 80
    :try_start_1
    iget-object v3, p0, Lcom/immomo/moment/mediautils/m;->G:Ljava/lang/Object;

    .line 81
    .line 82
    const-wide/16 v4, 0xa

    .line 83
    .line 84
    invoke-virtual {v3, v4, v5}, Ljava/lang/Object;->wait(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 85
    .line 86
    .line 87
    goto :goto_0

    .line 88
    :catchall_0
    move-exception p0

    .line 89
    goto :goto_1

    .line 90
    :catch_0
    move-exception v3

    .line 91
    :try_start_2
    invoke-virtual {v3}, Ljava/lang/Throwable;->printStackTrace()V

    .line 92
    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_2
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 96
    iget-object v2, p0, Lcom/immomo/moment/mediautils/m;->D:Landroid/os/HandlerThread;

    .line 97
    .line 98
    invoke-virtual {v2}, Landroid/os/HandlerThread;->quit()Z

    .line 99
    .line 100
    .line 101
    iput-object v1, p0, Lcom/immomo/moment/mediautils/m;->E:Lcom/immomo/moment/mediautils/m$d;

    .line 102
    .line 103
    iput-object v1, p0, Lcom/immomo/moment/mediautils/m;->D:Landroid/os/HandlerThread;

    .line 104
    .line 105
    goto :goto_2

    .line 106
    :goto_1
    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 107
    throw p0

    .line 108
    :cond_3
    :goto_2
    iget-boolean v1, p0, Lcom/immomo/moment/mediautils/m;->w:Z

    .line 109
    .line 110
    if-nez v1, :cond_4

    .line 111
    .line 112
    iput v0, p0, Lcom/immomo/moment/mediautils/m;->t:I

    .line 113
    .line 114
    :cond_4
    return-void
.end method

.method public r(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    return-void
.end method

.method public abstract s()V
.end method

.method public t(JJZ)V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-ltz v0, :cond_0

    .line 6
    .line 7
    iput-wide p1, p0, Lcom/immomo/moment/mediautils/m;->o:J

    .line 8
    .line 9
    :cond_0
    if-ltz v0, :cond_1

    .line 10
    .line 11
    cmp-long p1, p1, p3

    .line 12
    .line 13
    if-gez p1, :cond_1

    .line 14
    .line 15
    iput-wide p3, p0, Lcom/immomo/moment/mediautils/m;->q:J

    .line 16
    .line 17
    :cond_1
    const-wide/16 p1, -0x1

    .line 18
    .line 19
    cmp-long p3, p3, p1

    .line 20
    .line 21
    if-nez p3, :cond_2

    .line 22
    .line 23
    iput-wide p1, p0, Lcom/immomo/moment/mediautils/m;->q:J

    .line 24
    .line 25
    :cond_2
    iput-boolean p5, p0, Lcom/immomo/moment/mediautils/m;->I:Z

    .line 26
    .line 27
    iput-wide p1, p0, Lcom/immomo/moment/mediautils/m;->J:J

    .line 28
    .line 29
    return-void
.end method

.method public u(Lcom/immomo/moment/mediautils/m$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/m;->x:Lcom/immomo/moment/mediautils/m$c;

    .line 2
    .line 3
    return-void
.end method

.method public v(III)V
    .locals 0

    .line 1
    if-lez p1, :cond_0

    .line 2
    .line 3
    iput p1, p0, Lcom/immomo/moment/mediautils/m;->f:I

    .line 4
    .line 5
    :cond_0
    if-lez p2, :cond_1

    .line 6
    .line 7
    iput p2, p0, Lcom/immomo/moment/mediautils/m;->g:I

    .line 8
    .line 9
    :cond_1
    if-lez p3, :cond_2

    .line 10
    .line 11
    iput p3, p0, Lcom/immomo/moment/mediautils/m;->h:I

    .line 12
    .line 13
    :cond_2
    return-void
.end method

.method public w(Ll/spw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/m;->z:Ll/spw;

    .line 2
    .line 3
    return-void
.end method

.method public x(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/moment/mediautils/m;->s:Z

    .line 2
    .line 3
    return-void
.end method

.method public y(Landroid/graphics/SurfaceTexture;ILandroid/view/Surface;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/m;->u:Landroid/graphics/SurfaceTexture;

    .line 2
    .line 3
    iput p2, p0, Lcom/immomo/moment/mediautils/m;->t:I

    .line 4
    .line 5
    iput-object p3, p0, Lcom/immomo/moment/mediautils/m;->v:Landroid/view/Surface;

    .line 6
    .line 7
    new-instance p2, Lcom/immomo/moment/mediautils/m$a;

    .line 8
    .line 9
    invoke-direct {p2, p0}, Lcom/immomo/moment/mediautils/m$a;-><init>(Lcom/immomo/moment/mediautils/m;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1, p2}, Landroid/graphics/SurfaceTexture;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;)V

    .line 13
    .line 14
    .line 15
    const/4 p1, 0x1

    .line 16
    iput-boolean p1, p0, Lcom/immomo/moment/mediautils/m;->w:Z

    .line 17
    .line 18
    return-void
.end method

.method public z(Lcom/immomo/moment/mediautils/m$e;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/m;->y:Lcom/immomo/moment/mediautils/m$e;

    .line 2
    .line 3
    return-void
.end method
