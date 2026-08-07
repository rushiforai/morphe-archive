.class Ltv/danmaku/ijk/media/streamer/StreamProducer$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltv/danmaku/ijk/media/player/IMediaPlayer$OnPreparedListener;


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
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$3;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onPrepared(Ltv/danmaku/ijk/media/player/IMediaPlayer;)V
    .locals 5

    .line 1
    const-string p1, "streamerCameraProducer"

    .line 2
    .line 3
    const-string v0, "Mediaplayer onPrepared"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$3;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 9
    .line 10
    const/4 v0, 0x2

    .line 11
    invoke-static {p1, v0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->m0(Ltv/danmaku/ijk/media/streamer/StreamProducer;I)I

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$3;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 15
    .line 16
    const/4 v0, 0x1

    .line 17
    invoke-static {p1, v0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->j(Ltv/danmaku/ijk/media/streamer/StreamProducer;Z)Z

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$3;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 21
    .line 22
    invoke-static {p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->k(Ltv/danmaku/ijk/media/streamer/StreamProducer;)J

    .line 23
    .line 24
    .line 25
    move-result-wide v1

    .line 26
    const-wide/16 v3, 0x0

    .line 27
    .line 28
    cmp-long p1, v1, v3

    .line 29
    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$3;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 33
    .line 34
    invoke-virtual {p1, v1, v2}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->l1(J)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$3;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 38
    .line 39
    invoke-virtual {p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->e()V

    .line 40
    .line 41
    .line 42
    :cond_0
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$3;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 43
    .line 44
    iget-object v1, p1, Ltv/danmaku/ijk/media/streamer/StreamProducer;->m1:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnSurroundMusicStatusListener;

    .line 45
    .line 46
    if-eqz v1, :cond_1

    .line 47
    .line 48
    iget-object p1, p1, Ltv/danmaku/ijk/media/streamer/StreamProducer;->C:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 49
    .line 50
    const/4 v2, 0x0

    .line 51
    invoke-interface {v1, p1, v0, v2}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnSurroundMusicStatusListener;->a(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;II)V

    .line 52
    .line 53
    .line 54
    :cond_1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$3;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 55
    .line 56
    invoke-static {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->l(Ltv/danmaku/ijk/media/streamer/StreamProducer;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method
