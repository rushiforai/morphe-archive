.class Ltv/danmaku/ijk/media/streamer/StreamProducer$11;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ltv/danmaku/ijk/media/streamer/StreamProducer;->notifyExtralAudioReady()V
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
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$11;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$11;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->q(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Ltv/danmaku/ijk/media/source/audio/audioSource;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/source/audio/audioSource;->d()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$11;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 11
    .line 12
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->q(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Ltv/danmaku/ijk/media/source/audio/audioSource;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$11;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 17
    .line 18
    invoke-static {v1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Lcom/immomo/mediacore/sink/SinkBase$ExtPcmDateCallback;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Ltv/danmaku/ijk/media/source/audio/audioSource;->b(Lcom/immomo/mediacore/sink/SinkBase$ExtPcmDateCallback;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$11;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 26
    .line 27
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->q(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Ltv/danmaku/ijk/media/source/audio/audioSource;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$11;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 32
    .line 33
    invoke-static {v1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Lcom/immomo/mediacore/sink/SinkBase$ExtPcmDateCallback;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v0, v1}, Ltv/danmaku/ijk/media/source/audio/audioSource;->c(Lcom/immomo/mediacore/sink/SinkBase$ExtPcmDateCallback;)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$11;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 41
    .line 42
    invoke-static {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->s(Ltv/danmaku/ijk/media/streamer/StreamProducer;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method
