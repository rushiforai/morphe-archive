.class public Ll/gmw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/txl;


# instance fields
.field public a:Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Ll/gmw;Ll/sxl;Lcom/tantanapp/ijk/media/player/IMediaPlayer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/gmw;->k(Ll/sxl;Lcom/tantanapp/ijk/media/player/IMediaPlayer;)V

    return-void
.end method

.method public static synthetic f(Ll/gmw;Ll/qxl;Lcom/tantanapp/ijk/media/player/IMediaPlayer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/gmw;->i(Ll/qxl;Lcom/tantanapp/ijk/media/player/IMediaPlayer;)V

    return-void
.end method

.method public static synthetic g(Ll/gmw;Ll/rxl;Lcom/tantanapp/ijk/media/player/IMediaPlayer;II)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/gmw;->j(Ll/rxl;Lcom/tantanapp/ijk/media/player/IMediaPlayer;II)Z

    move-result p0

    return p0
.end method

.method public static synthetic h(Ll/gmw;Ll/uxl;Lcom/tantanapp/ijk/media/player/IMediaPlayer;IIII)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Ll/gmw;->l(Ll/uxl;Lcom/tantanapp/ijk/media/player/IMediaPlayer;IIII)V

    return-void
.end method


# virtual methods
.method public a(Ll/uxl;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/gmw;->a:Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v1, Ll/fmw;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Ll/fmw;-><init>(Ll/gmw;Ll/uxl;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lcom/tantanapp/ijk/media/player/AbstractMediaPlayer;->setOnVideoSizeChangedListener(Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnVideoSizeChangedListener;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public b(Ll/qxl;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/gmw;->a:Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v1, Ll/cmw;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Ll/cmw;-><init>(Ll/gmw;Ll/qxl;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lcom/tantanapp/ijk/media/player/AbstractMediaPlayer;->setOnCompletionListener(Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnCompletionListener;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public c(Ll/sxl;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/gmw;->a:Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v1, Ll/emw;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Ll/emw;-><init>(Ll/gmw;Ll/sxl;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lcom/tantanapp/ijk/media/player/AbstractMediaPlayer;->setOnPreparedListener(Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnPreparedListener;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public d(Ll/rxl;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/gmw;->a:Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v1, Ll/dmw;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Ll/dmw;-><init>(Ll/gmw;Ll/rxl;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lcom/tantanapp/ijk/media/player/AbstractMediaPlayer;->setOnErrorListener(Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnErrorListener;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public getCurrentPosition()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/gmw;->a:Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->getCurrentPosition()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public getVideoHeight()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gmw;->a:Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->getVideoHeight()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getVideoWidth()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gmw;->a:Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->getVideoWidth()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final synthetic i(Ll/qxl;Lcom/tantanapp/ijk/media/player/IMediaPlayer;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-interface {p1, p0}, Ll/qxl;->a(Ll/txl;)V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public init(Landroid/content/Context;)V
    .locals 0

    .line 1
    new-instance p1, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;

    .line 2
    .line 3
    invoke-direct {p1}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Ll/gmw;->a:Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;

    .line 7
    .line 8
    return-void
.end method

.method public final synthetic j(Ll/rxl;Lcom/tantanapp/ijk/media/player/IMediaPlayer;II)Z
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-static {p4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-interface {p1, p0, p3, p2}, Ll/rxl;->c(Ll/txl;ILjava/lang/String;)Z

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

.method public final synthetic k(Ll/sxl;Lcom/tantanapp/ijk/media/player/IMediaPlayer;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-interface {p1, p0}, Ll/sxl;->g(Ll/txl;)V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public final synthetic l(Ll/uxl;Lcom/tantanapp/ijk/media/player/IMediaPlayer;IIII)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-interface {p1, p0, p3, p4}, Ll/uxl;->e(Ll/txl;II)V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public prepareAsync()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/gmw;->a:Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->prepareAsync()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public release()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/gmw;->a:Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    monitor-enter v0

    .line 7
    :try_start_0
    iget-object p0, p0, Ll/gmw;->a:Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;

    .line 8
    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->release()V

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :catchall_0
    move-exception p0

    .line 16
    goto :goto_1

    .line 17
    :cond_1
    :goto_0
    monitor-exit v0

    .line 18
    return-void

    .line 19
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    throw p0
.end method

.method public setDataSource(Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/SecurityException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/gmw;->a:Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->setDataSource(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setLooping(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gmw;->a:Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->setLooping(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setSurface(Landroid/view/Surface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gmw;->a:Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->setSurface(Landroid/view/Surface;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public start()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/gmw;->a:Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;->start()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
