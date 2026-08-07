.class public abstract Lcom/tantanapp/ijk/media/player/AbstractMediaPlayer;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantanapp/ijk/media/player/IMediaPlayer;


# instance fields
.field private mOnBufferingUpdateListener:Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnBufferingUpdateListener;

.field private mOnCompletionListener:Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnCompletionListener;

.field private mOnErrorListener:Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnErrorListener;

.field private mOnInfoListener:Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnInfoListener;

.field private mOnPreparedListener:Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnPreparedListener;

.field private mOnSeekCompleteListener:Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnSeekCompleteListener;

.field private mOnTimedTextListener:Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnTimedTextListener;

.field private mOnVideoSizeChangedListener:Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnVideoSizeChangedListener;


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
.method public final notifyOnBufferingUpdate(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tantanapp/ijk/media/player/AbstractMediaPlayer;->mOnBufferingUpdateListener:Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnBufferingUpdateListener;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p0, p1}, Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnBufferingUpdateListener;->onBufferingUpdate(Lcom/tantanapp/ijk/media/player/IMediaPlayer;I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final notifyOnCompletion()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tantanapp/ijk/media/player/AbstractMediaPlayer;->mOnCompletionListener:Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnCompletionListener;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p0}, Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnCompletionListener;->onCompletion(Lcom/tantanapp/ijk/media/player/IMediaPlayer;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final notifyOnError(II)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tantanapp/ijk/media/player/AbstractMediaPlayer;->mOnErrorListener:Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnErrorListener;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p0, p1, p2}, Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnErrorListener;->onError(Lcom/tantanapp/ijk/media/player/IMediaPlayer;II)Z

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

.method public final notifyOnInfo(II)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tantanapp/ijk/media/player/AbstractMediaPlayer;->mOnInfoListener:Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnInfoListener;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p0, p1, p2}, Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnInfoListener;->onInfo(Lcom/tantanapp/ijk/media/player/IMediaPlayer;II)Z

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

.method public final notifyOnPrepared()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tantanapp/ijk/media/player/AbstractMediaPlayer;->mOnPreparedListener:Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnPreparedListener;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p0}, Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnPreparedListener;->onPrepared(Lcom/tantanapp/ijk/media/player/IMediaPlayer;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final notifyOnSeekComplete()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tantanapp/ijk/media/player/AbstractMediaPlayer;->mOnSeekCompleteListener:Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnSeekCompleteListener;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p0}, Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnSeekCompleteListener;->onSeekComplete(Lcom/tantanapp/ijk/media/player/IMediaPlayer;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final notifyOnTimedText(Lcom/tantanapp/ijk/media/player/IjkTimedText;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tantanapp/ijk/media/player/AbstractMediaPlayer;->mOnTimedTextListener:Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnTimedTextListener;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p0, p1}, Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnTimedTextListener;->onTimedText(Lcom/tantanapp/ijk/media/player/IMediaPlayer;Lcom/tantanapp/ijk/media/player/IjkTimedText;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final notifyOnVideoSizeChanged(IIII)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/tantanapp/ijk/media/player/AbstractMediaPlayer;->mOnVideoSizeChangedListener:Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnVideoSizeChangedListener;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v1, p0

    .line 6
    move v2, p1

    .line 7
    move v3, p2

    .line 8
    move v4, p3

    .line 9
    move v5, p4

    .line 10
    invoke-interface/range {v0 .. v5}, Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnVideoSizeChangedListener;->onVideoSizeChanged(Lcom/tantanapp/ijk/media/player/IMediaPlayer;IIII)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public resetListeners()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/tantanapp/ijk/media/player/AbstractMediaPlayer;->mOnPreparedListener:Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnPreparedListener;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/tantanapp/ijk/media/player/AbstractMediaPlayer;->mOnBufferingUpdateListener:Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnBufferingUpdateListener;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/tantanapp/ijk/media/player/AbstractMediaPlayer;->mOnCompletionListener:Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnCompletionListener;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/tantanapp/ijk/media/player/AbstractMediaPlayer;->mOnSeekCompleteListener:Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnSeekCompleteListener;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/tantanapp/ijk/media/player/AbstractMediaPlayer;->mOnVideoSizeChangedListener:Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnVideoSizeChangedListener;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/tantanapp/ijk/media/player/AbstractMediaPlayer;->mOnErrorListener:Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnErrorListener;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/tantanapp/ijk/media/player/AbstractMediaPlayer;->mOnInfoListener:Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnInfoListener;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/tantanapp/ijk/media/player/AbstractMediaPlayer;->mOnTimedTextListener:Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnTimedTextListener;

    .line 17
    .line 18
    return-void
.end method

.method public setDataSource(Lcom/tantanapp/ijk/media/player/misc/IMediaDataSource;)V
    .locals 0

    .line 1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    .line 4
    .line 5
    .line 6
    throw p0
.end method

.method public final setOnBufferingUpdateListener(Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnBufferingUpdateListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/ijk/media/player/AbstractMediaPlayer;->mOnBufferingUpdateListener:Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnBufferingUpdateListener;

    .line 2
    .line 3
    return-void
.end method

.method public final setOnCompletionListener(Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnCompletionListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/ijk/media/player/AbstractMediaPlayer;->mOnCompletionListener:Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnCompletionListener;

    .line 2
    .line 3
    return-void
.end method

.method public final setOnErrorListener(Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnErrorListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/ijk/media/player/AbstractMediaPlayer;->mOnErrorListener:Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnErrorListener;

    .line 2
    .line 3
    return-void
.end method

.method public final setOnInfoListener(Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnInfoListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/ijk/media/player/AbstractMediaPlayer;->mOnInfoListener:Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnInfoListener;

    .line 2
    .line 3
    return-void
.end method

.method public final setOnPreparedListener(Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnPreparedListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/ijk/media/player/AbstractMediaPlayer;->mOnPreparedListener:Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnPreparedListener;

    .line 2
    .line 3
    return-void
.end method

.method public final setOnSeekCompleteListener(Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnSeekCompleteListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/ijk/media/player/AbstractMediaPlayer;->mOnSeekCompleteListener:Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnSeekCompleteListener;

    .line 2
    .line 3
    return-void
.end method

.method public final setOnTimedTextListener(Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnTimedTextListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/ijk/media/player/AbstractMediaPlayer;->mOnTimedTextListener:Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnTimedTextListener;

    .line 2
    .line 3
    return-void
.end method

.method public final setOnVideoSizeChangedListener(Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnVideoSizeChangedListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/ijk/media/player/AbstractMediaPlayer;->mOnVideoSizeChangedListener:Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnVideoSizeChangedListener;

    .line 2
    .line 3
    return-void
.end method
