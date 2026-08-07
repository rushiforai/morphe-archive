.class public Ll/zph0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/txl;


# instance fields
.field a:Landroid/media/MediaPlayer;


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


# virtual methods
.method public a(Ll/uxl;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zph0;->a:Landroid/media/MediaPlayer;

    .line 2
    .line 3
    new-instance v1, Ll/zph0$c;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/zph0$c;-><init>(Ll/zph0;Ll/uxl;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setOnVideoSizeChangedListener(Landroid/media/MediaPlayer$OnVideoSizeChangedListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public b(Ll/qxl;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zph0;->a:Landroid/media/MediaPlayer;

    .line 2
    .line 3
    new-instance v1, Ll/zph0$b;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/zph0$b;-><init>(Ll/zph0;Ll/qxl;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public c(Ll/sxl;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zph0;->a:Landroid/media/MediaPlayer;

    .line 2
    .line 3
    new-instance v1, Ll/zph0$a;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/zph0$a;-><init>(Ll/zph0;Ll/sxl;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public d(Ll/rxl;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zph0;->a:Landroid/media/MediaPlayer;

    .line 2
    .line 3
    new-instance v1, Ll/zph0$d;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/zph0$d;-><init>(Ll/zph0;Ll/rxl;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public getCurrentPosition()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/zph0;->a:Landroid/media/MediaPlayer;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    int-to-long v0, p0

    .line 8
    return-wide v0
.end method

.method public getVideoHeight()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zph0;->a:Landroid/media/MediaPlayer;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/media/MediaPlayer;->getVideoHeight()I

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
    iget-object p0, p0, Ll/zph0;->a:Landroid/media/MediaPlayer;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/media/MediaPlayer;->getVideoWidth()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public init(Landroid/content/Context;)V
    .locals 0

    .line 1
    new-instance p1, Landroid/media/MediaPlayer;

    .line 2
    .line 3
    invoke-direct {p1}, Landroid/media/MediaPlayer;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Ll/zph0;->a:Landroid/media/MediaPlayer;

    .line 7
    .line 8
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
    iget-object p0, p0, Ll/zph0;->a:Landroid/media/MediaPlayer;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/media/MediaPlayer;->prepareAsync()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public release()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/zph0;->a:Landroid/media/MediaPlayer;

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
    iget-object v1, p0, Ll/zph0;->a:Landroid/media/MediaPlayer;

    .line 8
    .line 9
    if-eqz v1, :cond_1

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v1, v2}, Landroid/media/MediaPlayer;->setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V

    .line 13
    .line 14
    .line 15
    iget-object v1, p0, Ll/zph0;->a:Landroid/media/MediaPlayer;

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Landroid/media/MediaPlayer;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Ll/zph0;->a:Landroid/media/MediaPlayer;

    .line 21
    .line 22
    invoke-virtual {v1, v2}, Landroid/media/MediaPlayer;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Ll/zph0;->a:Landroid/media/MediaPlayer;

    .line 26
    .line 27
    invoke-virtual {v1, v2}, Landroid/media/MediaPlayer;->setOnVideoSizeChangedListener(Landroid/media/MediaPlayer$OnVideoSizeChangedListener;)V

    .line 28
    .line 29
    .line 30
    iget-object v1, p0, Ll/zph0;->a:Landroid/media/MediaPlayer;

    .line 31
    .line 32
    invoke-virtual {v1, v2}, Landroid/media/MediaPlayer;->setSurface(Landroid/view/Surface;)V

    .line 33
    .line 34
    .line 35
    iget-object v1, p0, Ll/zph0;->a:Landroid/media/MediaPlayer;

    .line 36
    .line 37
    invoke-virtual {v1}, Landroid/media/MediaPlayer;->stop()V

    .line 38
    .line 39
    .line 40
    iget-object v1, p0, Ll/zph0;->a:Landroid/media/MediaPlayer;

    .line 41
    .line 42
    invoke-virtual {v1}, Landroid/media/MediaPlayer;->reset()V

    .line 43
    .line 44
    .line 45
    iget-object v1, p0, Ll/zph0;->a:Landroid/media/MediaPlayer;

    .line 46
    .line 47
    invoke-virtual {v1}, Landroid/media/MediaPlayer;->release()V

    .line 48
    .line 49
    .line 50
    iput-object v2, p0, Ll/zph0;->a:Landroid/media/MediaPlayer;

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :catchall_0
    move-exception p0

    .line 54
    goto :goto_1

    .line 55
    :cond_1
    :goto_0
    monitor-exit v0

    .line 56
    return-void

    .line 57
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 58
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
    iget-object p0, p0, Ll/zph0;->a:Landroid/media/MediaPlayer;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/media/MediaPlayer;->setDataSource(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setLooping(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zph0;->a:Landroid/media/MediaPlayer;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/media/MediaPlayer;->setLooping(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setSurface(Landroid/view/Surface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zph0;->a:Landroid/media/MediaPlayer;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/media/MediaPlayer;->setSurface(Landroid/view/Surface;)V

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
    iget-object p0, p0, Ll/zph0;->a:Landroid/media/MediaPlayer;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/media/MediaPlayer;->start()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
