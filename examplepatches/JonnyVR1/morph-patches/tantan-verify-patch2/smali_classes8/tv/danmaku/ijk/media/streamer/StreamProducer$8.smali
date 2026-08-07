.class Ltv/danmaku/ijk/media/streamer/StreamProducer$8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltv/danmaku/ijk/media/player/IMediaPlayer$OnSeekCompleteListener;


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
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$8;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onSeekComplete(Ltv/danmaku/ijk/media/player/IMediaPlayer;)V
    .locals 2

    .line 1
    const-string p1, "streamerCameraProducer"

    .line 2
    .line 3
    const-string v0, "Mediaplayer onSeekComplete"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$8;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 9
    .line 10
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->m1:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnSurroundMusicStatusListener;

    .line 11
    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->C:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 15
    .line 16
    const/4 v0, 0x3

    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-interface {p1, p0, v0, v1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnSurroundMusicStatusListener;->a(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;II)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method
