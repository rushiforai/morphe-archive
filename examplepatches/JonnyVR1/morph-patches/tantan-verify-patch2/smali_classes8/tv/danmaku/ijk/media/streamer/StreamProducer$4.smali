.class Ltv/danmaku/ijk/media/streamer/StreamProducer$4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltv/danmaku/ijk/media/player/IMediaPlayer$OnCompletionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ltv/danmaku/ijk/media/streamer/StreamProducer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ltv/danmaku/ijk/media/streamer/StreamProducer;


# direct methods
.method public constructor <init>(Ltv/danmaku/ijk/media/streamer/StreamProducer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$4;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onCompletion(Ltv/danmaku/ijk/media/player/IMediaPlayer;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$4;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p1, v0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->j(Ltv/danmaku/ijk/media/streamer/StreamProducer;Z)Z

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$4;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 8
    .line 9
    const/4 v1, 0x5

    .line 10
    invoke-static {p1, v1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->m0(Ltv/danmaku/ijk/media/streamer/StreamProducer;I)I

    .line 11
    .line 12
    .line 13
    const-string p1, "streamerCameraProducer"

    .line 14
    .line 15
    const-string v1, "Mediaplayer onCompletion"

    .line 16
    .line 17
    invoke-static {p1, v1}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$4;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 21
    .line 22
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->m1:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnSurroundMusicStatusListener;

    .line 23
    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->C:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 27
    .line 28
    const/4 v1, 0x2

    .line 29
    invoke-interface {p1, p0, v1, v0}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnSurroundMusicStatusListener;->a(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;II)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method
