.class Ltv/danmaku/ijk/media/sink/AgoraWriter$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ltv/danmaku/ijk/media/sink/AgoraWriter;->pauseRecording()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ltv/danmaku/ijk/media/sink/AgoraWriter;


# direct methods
.method public constructor <init>(Ltv/danmaku/ijk/media/sink/AgoraWriter;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$2;->a:Ltv/danmaku/ijk/media/sink/AgoraWriter;

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
    .locals 5

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$2;->a:Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/immomo/mediacore/sink/SinkBase;->isHost()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$2;->a:Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 8
    .line 9
    const/16 v2, 0xc9

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-static {v1}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->k(Ltv/danmaku/ijk/media/sink/AgoraWriter;)Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const/16 v1, 0x12c

    .line 18
    .line 19
    const/16 v3, -0x130

    .line 20
    .line 21
    invoke-virtual {v0, v1, v3, v2, p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->notify(IIILjava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-static {v1}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->h(Ltv/danmaku/ijk/media/sink/AgoraWriter;)Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$2;->a:Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 32
    .line 33
    invoke-static {v0}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->h(Ltv/danmaku/ijk/media/sink/AgoraWriter;)Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$2;->a:Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/SinkBase;->getUserID()J

    .line 40
    .line 41
    .line 42
    move-result-wide v3

    .line 43
    invoke-interface {v0, v3, v4, v2}, Lcom/immomo/mediacore/coninf/MRtcEventHandler;->onUserOffline(JI)V

    .line 44
    .line 45
    .line 46
    :cond_1
    return-void
.end method
