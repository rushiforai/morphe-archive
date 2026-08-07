.class Ltv/danmaku/ijk/media/streamer/StreamProducer$5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltv/danmaku/ijk/media/player/IMediaPlayer$OnErrorListener;


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
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$5;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onError(Ltv/danmaku/ijk/media/player/IMediaPlayer;II)Z
    .locals 0

    .line 1
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    filled-new-array {p1, p2}, [Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const-string p2, "streamerCameraProducer"

    .line 14
    .line 15
    const-string p3, "Mediaplayer Error: %d, %d"

    .line 16
    .line 17
    invoke-static {p2, p3, p1}, Ll/t9c;->b(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)I

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$5;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 21
    .line 22
    const/4 p2, 0x0

    .line 23
    invoke-static {p1, p2}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->j(Ltv/danmaku/ijk/media/streamer/StreamProducer;Z)Z

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$5;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 27
    .line 28
    const/4 p3, -0x1

    .line 29
    invoke-static {p1, p3}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->m0(Ltv/danmaku/ijk/media/streamer/StreamProducer;I)I

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$5;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 33
    .line 34
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->m1:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnSurroundMusicStatusListener;

    .line 35
    .line 36
    if-eqz p1, :cond_0

    .line 37
    .line 38
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->C:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 39
    .line 40
    invoke-interface {p1, p0, p3, p2}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnSurroundMusicStatusListener;->a(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;II)V

    .line 41
    .line 42
    .line 43
    :cond_0
    const/4 p0, 0x1

    .line 44
    return p0
.end method
