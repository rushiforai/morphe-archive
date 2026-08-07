.class public Ll/dyh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantanapp/ijk/media/player/IMediaPlayer;


# instance fields
.field public final a:Lcom/tantanapp/ijk/media/player/IMediaPlayer;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/tantanapp/ijk/media/player/IjkMediaPlayer;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/dyh0;->a:Lcom/tantanapp/ijk/media/player/IMediaPlayer;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/dyh0;->c()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public a()V
    .locals 4

    .line 1
    iget-object p0, p0, Ll/dyh0;->a:Lcom/tantanapp/ijk/media/player/IMediaPlayer;

    .line 2
    .line 3
    const-string v0, "enable-dynbuf"

    .line 4
    .line 5
    const-wide/16 v1, 0x1

    .line 6
    .line 7
    const/4 v3, 0x4

    .line 8
    invoke-interface {p0, v3, v0, v1, v2}, Lcom/tantanapp/ijk/media/player/IMediaPlayer;->setOption(ILjava/lang/String;J)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public b()Lcom/tantanapp/ijk/media/player/IMediaPlayer;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dyh0;->a:Lcom/tantanapp/ijk/media/player/IMediaPlayer;

    .line 2
    .line 3
    return-object p0
.end method

.method public final c()V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/dyh0;->a:Lcom/tantanapp/ijk/media/player/IMediaPlayer;

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    const-string v2, "framedrop"

    .line 5
    .line 6
    const-wide/16 v3, 0x1

    .line 7
    .line 8
    invoke-interface {v0, v1, v2, v3, v4}, Lcom/tantanapp/ijk/media/player/IMediaPlayer;->setOption(ILjava/lang/String;J)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/dyh0;->a:Lcom/tantanapp/ijk/media/player/IMediaPlayer;

    .line 12
    .line 13
    const-string v2, "min-frames"

    .line 14
    .line 15
    const-wide/16 v5, 0x32

    .line 16
    .line 17
    invoke-interface {v0, v1, v2, v5, v6}, Lcom/tantanapp/ijk/media/player/IMediaPlayer;->setOption(ILjava/lang/String;J)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/dyh0;->a:Lcom/tantanapp/ijk/media/player/IMediaPlayer;

    .line 21
    .line 22
    const-string v2, "probesize"

    .line 23
    .line 24
    const-wide/16 v5, 0x400

    .line 25
    .line 26
    const/4 v7, 0x1

    .line 27
    invoke-interface {v0, v7, v2, v5, v6}, Lcom/tantanapp/ijk/media/player/IMediaPlayer;->setOption(ILjava/lang/String;J)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/dyh0;->a:Lcom/tantanapp/ijk/media/player/IMediaPlayer;

    .line 31
    .line 32
    const-string v2, "max-buffer-size"

    .line 33
    .line 34
    const-wide/32 v5, 0xa000

    .line 35
    .line 36
    .line 37
    invoke-interface {v0, v7, v2, v5, v6}, Lcom/tantanapp/ijk/media/player/IMediaPlayer;->setOption(ILjava/lang/String;J)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Ll/dyh0;->a:Lcom/tantanapp/ijk/media/player/IMediaPlayer;

    .line 41
    .line 42
    const-string v2, "analyzeduration"

    .line 43
    .line 44
    const-wide/16 v5, 0x3e8

    .line 45
    .line 46
    invoke-interface {v0, v7, v2, v5, v6}, Lcom/tantanapp/ijk/media/player/IMediaPlayer;->setOption(ILjava/lang/String;J)V

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Ll/dyh0;->a:Lcom/tantanapp/ijk/media/player/IMediaPlayer;

    .line 50
    .line 51
    const-string v0, "enable-accurate-seek-seek"

    .line 52
    .line 53
    invoke-interface {p0, v1, v0, v3, v4}, Lcom/tantanapp/ijk/media/player/IMediaPlayer;->setOption(ILjava/lang/String;J)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public getAudioSessionId()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dyh0;->a:Lcom/tantanapp/ijk/media/player/IMediaPlayer;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/tantanapp/ijk/media/player/IMediaPlayer;->getAudioSessionId()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getCurrentPosition()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/dyh0;->a:Lcom/tantanapp/ijk/media/player/IMediaPlayer;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/tantanapp/ijk/media/player/IMediaPlayer;->getCurrentPosition()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public getDataSource()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dyh0;->a:Lcom/tantanapp/ijk/media/player/IMediaPlayer;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/tantanapp/ijk/media/player/IMediaPlayer;->getDataSource()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getDuration()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/dyh0;->a:Lcom/tantanapp/ijk/media/player/IMediaPlayer;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/tantanapp/ijk/media/player/IMediaPlayer;->getDuration()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public getMediaInfo()Lcom/tantanapp/ijk/media/player/MediaInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dyh0;->a:Lcom/tantanapp/ijk/media/player/IMediaPlayer;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/tantanapp/ijk/media/player/IMediaPlayer;->getMediaInfo()Lcom/tantanapp/ijk/media/player/MediaInfo;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getTrackInfo()[Lcom/tantanapp/ijk/media/player/misc/ITrackInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dyh0;->a:Lcom/tantanapp/ijk/media/player/IMediaPlayer;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/tantanapp/ijk/media/player/IMediaPlayer;->getTrackInfo()[Lcom/tantanapp/ijk/media/player/misc/ITrackInfo;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getVideoHeight()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dyh0;->a:Lcom/tantanapp/ijk/media/player/IMediaPlayer;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/tantanapp/ijk/media/player/IMediaPlayer;->getVideoHeight()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getVideoSarDen()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dyh0;->a:Lcom/tantanapp/ijk/media/player/IMediaPlayer;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/tantanapp/ijk/media/player/IMediaPlayer;->getVideoSarDen()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getVideoSarNum()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dyh0;->a:Lcom/tantanapp/ijk/media/player/IMediaPlayer;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/tantanapp/ijk/media/player/IMediaPlayer;->getVideoSarNum()I

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
    iget-object p0, p0, Ll/dyh0;->a:Lcom/tantanapp/ijk/media/player/IMediaPlayer;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/tantanapp/ijk/media/player/IMediaPlayer;->getVideoWidth()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isLooping()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dyh0;->a:Lcom/tantanapp/ijk/media/player/IMediaPlayer;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/tantanapp/ijk/media/player/IMediaPlayer;->isLooping()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isPlayable()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public isPlaying()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dyh0;->a:Lcom/tantanapp/ijk/media/player/IMediaPlayer;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/tantanapp/ijk/media/player/IMediaPlayer;->isPlaying()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public pause()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/dyh0;->a:Lcom/tantanapp/ijk/media/player/IMediaPlayer;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/tantanapp/ijk/media/player/IMediaPlayer;->pause()V

    .line 4
    .line 5
    .line 6
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
    iget-object p0, p0, Ll/dyh0;->a:Lcom/tantanapp/ijk/media/player/IMediaPlayer;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/tantanapp/ijk/media/player/IMediaPlayer;->prepareAsync()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public release()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dyh0;->a:Lcom/tantanapp/ijk/media/player/IMediaPlayer;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/tantanapp/ijk/media/player/IMediaPlayer;->release()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public reset()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dyh0;->a:Lcom/tantanapp/ijk/media/player/IMediaPlayer;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/tantanapp/ijk/media/player/IMediaPlayer;->reset()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public seekTo(J)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/dyh0;->a:Lcom/tantanapp/ijk/media/player/IMediaPlayer;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Lcom/tantanapp/ijk/media/player/IMediaPlayer;->seekTo(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setAudioStreamType(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dyh0;->a:Lcom/tantanapp/ijk/media/player/IMediaPlayer;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lcom/tantanapp/ijk/media/player/IMediaPlayer;->setAudioStreamType(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setDataSource(Landroid/content/Context;Landroid/net/Uri;)V
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
    iget-object p0, p0, Ll/dyh0;->a:Lcom/tantanapp/ijk/media/player/IMediaPlayer;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Lcom/tantanapp/ijk/media/player/IMediaPlayer;->setDataSource(Landroid/content/Context;Landroid/net/Uri;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setDataSource(Landroid/content/Context;Landroid/net/Uri;Ljava/util/Map;)V
    .locals 0
    .annotation build Landroid/annotation/TargetApi;
        value = 0xe
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/net/Uri;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/SecurityException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 7
    iget-object p0, p0, Ll/dyh0;->a:Lcom/tantanapp/ijk/media/player/IMediaPlayer;

    invoke-interface {p0, p1, p2, p3}, Lcom/tantanapp/ijk/media/player/IMediaPlayer;->setDataSource(Landroid/content/Context;Landroid/net/Uri;Ljava/util/Map;)V

    return-void
.end method

.method public setDataSource(Lcom/tantanapp/ijk/media/player/misc/IMediaDataSource;)V
    .locals 0

    .line 10
    iget-object p0, p0, Ll/dyh0;->a:Lcom/tantanapp/ijk/media/player/IMediaPlayer;

    invoke-interface {p0, p1}, Lcom/tantanapp/ijk/media/player/IMediaPlayer;->setDataSource(Lcom/tantanapp/ijk/media/player/misc/IMediaDataSource;)V

    return-void
.end method

.method public setDataSource(Ljava/io/FileDescriptor;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 8
    iget-object p0, p0, Ll/dyh0;->a:Lcom/tantanapp/ijk/media/player/IMediaPlayer;

    invoke-interface {p0, p1}, Lcom/tantanapp/ijk/media/player/IMediaPlayer;->setDataSource(Ljava/io/FileDescriptor;)V

    return-void
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

    .line 9
    iget-object p0, p0, Ll/dyh0;->a:Lcom/tantanapp/ijk/media/player/IMediaPlayer;

    invoke-interface {p0, p1}, Lcom/tantanapp/ijk/media/player/IMediaPlayer;->setDataSource(Ljava/lang/String;)V

    return-void
.end method

.method public setDisplay(Landroid/view/SurfaceHolder;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dyh0;->a:Lcom/tantanapp/ijk/media/player/IMediaPlayer;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lcom/tantanapp/ijk/media/player/IMediaPlayer;->setDisplay(Landroid/view/SurfaceHolder;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setKeepInBackground(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dyh0;->a:Lcom/tantanapp/ijk/media/player/IMediaPlayer;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lcom/tantanapp/ijk/media/player/IMediaPlayer;->setKeepInBackground(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setLogEnabled(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public setLooping(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dyh0;->a:Lcom/tantanapp/ijk/media/player/IMediaPlayer;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lcom/tantanapp/ijk/media/player/IMediaPlayer;->setLooping(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setOnBufferingUpdateListener(Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnBufferingUpdateListener;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dyh0;->a:Lcom/tantanapp/ijk/media/player/IMediaPlayer;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    new-instance v1, Ll/dyh0$c;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Ll/dyh0$c;-><init>(Ll/dyh0;Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnBufferingUpdateListener;)V

    .line 8
    .line 9
    .line 10
    invoke-interface {v0, v1}, Lcom/tantanapp/ijk/media/player/IMediaPlayer;->setOnBufferingUpdateListener(Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnBufferingUpdateListener;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    invoke-interface {v0, p0}, Lcom/tantanapp/ijk/media/player/IMediaPlayer;->setOnBufferingUpdateListener(Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnBufferingUpdateListener;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public setOnCompletionListener(Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnCompletionListener;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dyh0;->a:Lcom/tantanapp/ijk/media/player/IMediaPlayer;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    new-instance v1, Ll/dyh0$b;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Ll/dyh0$b;-><init>(Ll/dyh0;Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnCompletionListener;)V

    .line 8
    .line 9
    .line 10
    invoke-interface {v0, v1}, Lcom/tantanapp/ijk/media/player/IMediaPlayer;->setOnCompletionListener(Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnCompletionListener;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    invoke-interface {v0, p0}, Lcom/tantanapp/ijk/media/player/IMediaPlayer;->setOnCompletionListener(Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnCompletionListener;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public setOnErrorListener(Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnErrorListener;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dyh0;->a:Lcom/tantanapp/ijk/media/player/IMediaPlayer;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    new-instance v1, Ll/dyh0$f;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Ll/dyh0$f;-><init>(Ll/dyh0;Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnErrorListener;)V

    .line 8
    .line 9
    .line 10
    invoke-interface {v0, v1}, Lcom/tantanapp/ijk/media/player/IMediaPlayer;->setOnErrorListener(Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnErrorListener;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    invoke-interface {v0, p0}, Lcom/tantanapp/ijk/media/player/IMediaPlayer;->setOnErrorListener(Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnErrorListener;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public setOnInfoListener(Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnInfoListener;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dyh0;->a:Lcom/tantanapp/ijk/media/player/IMediaPlayer;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    new-instance v1, Ll/dyh0$g;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Ll/dyh0$g;-><init>(Ll/dyh0;Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnInfoListener;)V

    .line 8
    .line 9
    .line 10
    invoke-interface {v0, v1}, Lcom/tantanapp/ijk/media/player/IMediaPlayer;->setOnInfoListener(Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnInfoListener;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    invoke-interface {v0, p0}, Lcom/tantanapp/ijk/media/player/IMediaPlayer;->setOnInfoListener(Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnInfoListener;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public setOnPreparedListener(Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnPreparedListener;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dyh0;->a:Lcom/tantanapp/ijk/media/player/IMediaPlayer;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    new-instance v1, Ll/dyh0$a;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Ll/dyh0$a;-><init>(Ll/dyh0;Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnPreparedListener;)V

    .line 8
    .line 9
    .line 10
    invoke-interface {v0, v1}, Lcom/tantanapp/ijk/media/player/IMediaPlayer;->setOnPreparedListener(Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnPreparedListener;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    invoke-interface {v0, p0}, Lcom/tantanapp/ijk/media/player/IMediaPlayer;->setOnPreparedListener(Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnPreparedListener;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public setOnSeekCompleteListener(Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnSeekCompleteListener;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dyh0;->a:Lcom/tantanapp/ijk/media/player/IMediaPlayer;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    new-instance v1, Ll/dyh0$d;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Ll/dyh0$d;-><init>(Ll/dyh0;Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnSeekCompleteListener;)V

    .line 8
    .line 9
    .line 10
    invoke-interface {v0, v1}, Lcom/tantanapp/ijk/media/player/IMediaPlayer;->setOnSeekCompleteListener(Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnSeekCompleteListener;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    invoke-interface {v0, p0}, Lcom/tantanapp/ijk/media/player/IMediaPlayer;->setOnSeekCompleteListener(Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnSeekCompleteListener;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public setOnTimedTextListener(Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnTimedTextListener;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dyh0;->a:Lcom/tantanapp/ijk/media/player/IMediaPlayer;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    new-instance v1, Ll/dyh0$h;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Ll/dyh0$h;-><init>(Ll/dyh0;Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnTimedTextListener;)V

    .line 8
    .line 9
    .line 10
    invoke-interface {v0, v1}, Lcom/tantanapp/ijk/media/player/IMediaPlayer;->setOnTimedTextListener(Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnTimedTextListener;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    invoke-interface {v0, p0}, Lcom/tantanapp/ijk/media/player/IMediaPlayer;->setOnTimedTextListener(Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnTimedTextListener;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public setOnVideoSizeChangedListener(Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnVideoSizeChangedListener;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dyh0;->a:Lcom/tantanapp/ijk/media/player/IMediaPlayer;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    new-instance v1, Ll/dyh0$e;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Ll/dyh0$e;-><init>(Ll/dyh0;Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnVideoSizeChangedListener;)V

    .line 8
    .line 9
    .line 10
    invoke-interface {v0, v1}, Lcom/tantanapp/ijk/media/player/IMediaPlayer;->setOnVideoSizeChangedListener(Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnVideoSizeChangedListener;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    invoke-interface {v0, p0}, Lcom/tantanapp/ijk/media/player/IMediaPlayer;->setOnVideoSizeChangedListener(Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnVideoSizeChangedListener;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public setOption(ILjava/lang/String;J)V
    .locals 0

    .line 7
    iget-object p0, p0, Ll/dyh0;->a:Lcom/tantanapp/ijk/media/player/IMediaPlayer;

    invoke-interface {p0, p1, p2, p3, p4}, Lcom/tantanapp/ijk/media/player/IMediaPlayer;->setOption(ILjava/lang/String;J)V

    return-void
.end method

.method public setOption(ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dyh0;->a:Lcom/tantanapp/ijk/media/player/IMediaPlayer;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2, p3}, Lcom/tantanapp/ijk/media/player/IMediaPlayer;->setOption(ILjava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setScreenOnWhilePlaying(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dyh0;->a:Lcom/tantanapp/ijk/media/player/IMediaPlayer;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lcom/tantanapp/ijk/media/player/IMediaPlayer;->setScreenOnWhilePlaying(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setSurface(Landroid/view/Surface;)V
    .locals 0
    .annotation build Landroid/annotation/TargetApi;
        value = 0xe
    .end annotation

    .line 1
    iget-object p0, p0, Ll/dyh0;->a:Lcom/tantanapp/ijk/media/player/IMediaPlayer;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lcom/tantanapp/ijk/media/player/IMediaPlayer;->setSurface(Landroid/view/Surface;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setVolume(FF)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dyh0;->a:Lcom/tantanapp/ijk/media/player/IMediaPlayer;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Lcom/tantanapp/ijk/media/player/IMediaPlayer;->setVolume(FF)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setWakeMode(Landroid/content/Context;I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dyh0;->a:Lcom/tantanapp/ijk/media/player/IMediaPlayer;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Lcom/tantanapp/ijk/media/player/IMediaPlayer;->setWakeMode(Landroid/content/Context;I)V

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
    iget-object p0, p0, Ll/dyh0;->a:Lcom/tantanapp/ijk/media/player/IMediaPlayer;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/tantanapp/ijk/media/player/IMediaPlayer;->start()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public stop()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/dyh0;->a:Lcom/tantanapp/ijk/media/player/IMediaPlayer;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/tantanapp/ijk/media/player/IMediaPlayer;->stop()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
