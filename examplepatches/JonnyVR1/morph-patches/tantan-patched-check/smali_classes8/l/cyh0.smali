.class public Ll/cyh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/azl;


# instance fields
.field public a:Ll/dyh0;

.field public b:Landroid/view/Surface;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/fyh0;->d()Ll/fyh0;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/fyh0;->e()Ll/dyh0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Ll/cyh0;->a:Ll/dyh0;

    .line 13
    .line 14
    invoke-static {p0}, Ll/qe20;->a(Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static synthetic f(Ll/a30;Lcom/tantanapp/ijk/media/player/IMediaPlayer;II)Z
    .locals 2

    .line 1
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-interface {p0, p1, v0, v1}, Ll/a30;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    new-instance p0, Landroid/os/Bundle;

    .line 13
    .line 14
    invoke-direct {p0}, Landroid/os/Bundle;-><init>()V

    .line 15
    .line 16
    .line 17
    const-string p1, "what"

    .line 18
    .line 19
    invoke-virtual {p0, p1, p2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 20
    .line 21
    .line 22
    const-string p1, "extra"

    .line 23
    .line 24
    invoke-virtual {p0, p1, p3}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 25
    .line 26
    .line 27
    invoke-static {}, Ll/yqx;->b()Ll/yqx;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    const/4 p2, 0x0

    .line 32
    const/4 p3, 0x5

    .line 33
    invoke-virtual {p1, p2, p3, p0}, Ll/yqx;->e(IILandroid/os/Bundle;)V

    .line 34
    .line 35
    .line 36
    const/4 p0, 0x1

    .line 37
    return p0
.end method

.method public static synthetic g(Ll/y20;Lcom/tantanapp/ijk/media/player/IMediaPlayer;)V
    .locals 2

    .line 1
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/yqx;->b()Ll/yqx;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    const/4 p1, 0x4

    .line 9
    const/4 v0, 0x0

    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {p0, v1, p1, v0}, Ll/yqx;->e(IILandroid/os/Bundle;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic h(Ll/y20;Lcom/tantanapp/ijk/media/player/IMediaPlayer;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i(Ll/a30;Lcom/tantanapp/ijk/media/player/IMediaPlayer;II)Z
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object p3

    .line 11
    invoke-interface {p0, p1, p2, p3}, Ll/a30;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    const/4 p0, 0x1

    .line 15
    return p0
.end method


# virtual methods
.method public a(Ll/a30;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/a30<",
            "Ljava/lang/Object;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/cyh0;->a:Ll/dyh0;

    .line 2
    .line 3
    new-instance v0, Ll/byh0;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/byh0;-><init>(Ll/a30;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/dyh0;->setOnInfoListener(Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnInfoListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public b(Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/cyh0;->a:Ll/dyh0;

    .line 2
    .line 3
    new-instance v0, Ll/yxh0;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/yxh0;-><init>(Ll/y20;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/dyh0;->setOnPreparedListener(Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnPreparedListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public c(Ll/a30;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/a30<",
            "Ljava/lang/Object;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/cyh0;->a:Ll/dyh0;

    .line 2
    .line 3
    new-instance v0, Ll/zxh0;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/zxh0;-><init>(Ll/a30;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/dyh0;->setOnErrorListener(Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnErrorListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public d(Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/cyh0;->a:Ll/dyh0;

    .line 2
    .line 3
    new-instance v0, Ll/ayh0;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/ayh0;-><init>(Ll/y20;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/dyh0;->setOnCompletionListener(Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnCompletionListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public e()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyh0;->a:Ll/dyh0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/dyh0;->b()Lcom/tantanapp/ijk/media/player/IMediaPlayer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    instance-of v0, v0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/cyh0;->a:Ll/dyh0;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/dyh0;->b()Lcom/tantanapp/ijk/media/player/IMediaPlayer;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->resetListeners()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public getCurrentPosition()F
    .locals 2

    .line 1
    iget-object p0, p0, Ll/cyh0;->a:Ll/dyh0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/dyh0;->getCurrentPosition()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    long-to-float p0, v0

    .line 8
    return p0
.end method

.method public isPlaying()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyh0;->a:Ll/dyh0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/dyh0;->isPlaying()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public j()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyh0;->a:Ll/dyh0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/dyh0;->a()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public pause()V
    .locals 3

    .line 1
    iget-object p0, p0, Ll/cyh0;->a:Ll/dyh0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/dyh0;->pause()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/yqx;->b()Ll/yqx;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const/4 v0, 0x1

    .line 11
    const/4 v1, 0x0

    .line 12
    const/4 v2, 0x0

    .line 13
    invoke-virtual {p0, v2, v0, v1}, Ll/yqx;->e(IILandroid/os/Bundle;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public prepareAsync()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyh0;->b:Landroid/view/Surface;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/Surface;->isValid()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/cyh0;->a:Ll/dyh0;

    .line 12
    .line 13
    iget-object v1, p0, Ll/cyh0;->b:Landroid/view/Surface;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ll/dyh0;->setSurface(Landroid/view/Surface;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object p0, p0, Ll/cyh0;->a:Ll/dyh0;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/dyh0;->prepareAsync()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public release()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/cyh0;->a:Ll/dyh0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/dyh0;->release()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Ll/qe20;->b(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    invoke-static {}, Ll/yqx;->b()Ll/yqx;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/4 v0, 0x3

    .line 14
    const/4 v1, 0x0

    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-virtual {p0, v2, v0, v1}, Ll/yqx;->e(IILandroid/os/Bundle;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public reset()V
    .locals 3

    .line 1
    iget-object p0, p0, Ll/cyh0;->a:Ll/dyh0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/dyh0;->reset()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/yqx;->b()Ll/yqx;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const/4 v0, 0x2

    .line 11
    const/4 v1, 0x0

    .line 12
    const/4 v2, 0x0

    .line 13
    invoke-virtual {p0, v2, v0, v1}, Ll/yqx;->e(IILandroid/os/Bundle;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public seekTo(J)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyh0;->a:Ll/dyh0;

    .line 2
    .line 3
    const-wide/16 p1, 0x0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/dyh0;->seekTo(J)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setDataSource(Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/cyh0;->a:Ll/dyh0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/dyh0;->setDataSource(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setLooping(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyh0;->a:Ll/dyh0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/dyh0;->setLooping(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setSurface(Landroid/view/Surface;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cyh0;->b:Landroid/view/Surface;

    .line 2
    .line 3
    iget-object p0, p0, Ll/cyh0;->a:Ll/dyh0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/dyh0;->setSurface(Landroid/view/Surface;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setVolume(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyh0;->a:Ll/dyh0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p1}, Ll/dyh0;->setVolume(FF)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public start()V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/cyh0;->a:Ll/dyh0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/dyh0;->start()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/yqx;->b()Ll/yqx;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const/4 v0, 0x0

    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {p0, v0, v0, v1}, Ll/yqx;->e(IILandroid/os/Bundle;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public stop()V
    .locals 3

    .line 1
    iget-object p0, p0, Ll/cyh0;->a:Ll/dyh0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/dyh0;->stop()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/yqx;->b()Ll/yqx;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const/4 v0, 0x6

    .line 11
    const/4 v1, 0x0

    .line 12
    const/4 v2, 0x0

    .line 13
    invoke-virtual {p0, v2, v0, v1}, Ll/yqx;->e(IILandroid/os/Bundle;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
