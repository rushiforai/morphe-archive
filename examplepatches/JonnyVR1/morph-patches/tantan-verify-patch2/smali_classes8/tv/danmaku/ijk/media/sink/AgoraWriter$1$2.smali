.class Ltv/danmaku/ijk/media/sink/AgoraWriter$1$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ltv/danmaku/ijk/media/sink/AgoraWriter$1;->onError(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:Ltv/danmaku/ijk/media/sink/AgoraWriter$1;


# direct methods
.method public constructor <init>(Ltv/danmaku/ijk/media/sink/AgoraWriter$1;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$1$2;->b:Ltv/danmaku/ijk/media/sink/AgoraWriter$1;

    .line 2
    .line 3
    iput p2, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$1$2;->a:I

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$1$2;->b:Ltv/danmaku/ijk/media/sink/AgoraWriter$1;

    .line 2
    .line 3
    iget-object v0, v0, Ltv/danmaku/ijk/media/sink/AgoraWriter$1;->a:Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/immomo/mediacore/sink/SinkBase;->isHost()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/16 v1, -0x130

    .line 10
    .line 11
    const/16 v2, 0x12c

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$1$2;->b:Ltv/danmaku/ijk/media/sink/AgoraWriter$1;

    .line 16
    .line 17
    iget-object v0, v0, Ltv/danmaku/ijk/media/sink/AgoraWriter$1;->a:Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 18
    .line 19
    invoke-static {v0}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->k(Ltv/danmaku/ijk/media/sink/AgoraWriter;)Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    iget v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$1$2;->a:I

    .line 26
    .line 27
    iget-object v3, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$1$2;->b:Ltv/danmaku/ijk/media/sink/AgoraWriter$1;

    .line 28
    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    iget-object v0, v3, Ltv/danmaku/ijk/media/sink/AgoraWriter$1;->a:Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 32
    .line 33
    invoke-static {v0}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->k(Ltv/danmaku/ijk/media/sink/AgoraWriter;)Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iget v3, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$1$2;->a:I

    .line 38
    .line 39
    invoke-virtual {v0, v2, v1, v3, p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->notify(IIILjava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_0
    iget-object v0, v3, Ltv/danmaku/ijk/media/sink/AgoraWriter$1;->a:Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 44
    .line 45
    invoke-static {v0}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->k(Ltv/danmaku/ijk/media/sink/AgoraWriter;)Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    const/16 v3, 0xc

    .line 50
    .line 51
    invoke-virtual {v0, v2, v1, v3, p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->notify(IIILjava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_1
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$1$2;->b:Ltv/danmaku/ijk/media/sink/AgoraWriter$1;

    .line 56
    .line 57
    iget-object v0, v0, Ltv/danmaku/ijk/media/sink/AgoraWriter$1;->a:Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 58
    .line 59
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->stopRecording()V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$1$2;->b:Ltv/danmaku/ijk/media/sink/AgoraWriter$1;

    .line 63
    .line 64
    iget-object v0, v0, Ltv/danmaku/ijk/media/sink/AgoraWriter$1;->a:Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 65
    .line 66
    invoke-static {v0}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->k(Ltv/danmaku/ijk/media/sink/AgoraWriter;)Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    if-eqz v0, :cond_2

    .line 71
    .line 72
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$1$2;->b:Ltv/danmaku/ijk/media/sink/AgoraWriter$1;

    .line 73
    .line 74
    iget-object v0, v0, Ltv/danmaku/ijk/media/sink/AgoraWriter$1;->a:Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 75
    .line 76
    invoke-static {v0}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->k(Ltv/danmaku/ijk/media/sink/AgoraWriter;)Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    iget v3, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$1$2;->a:I

    .line 81
    .line 82
    invoke-virtual {v0, v2, v1, v3, p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->notify(IIILjava/lang/Object;)V

    .line 83
    .line 84
    .line 85
    :cond_2
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$1$2;->b:Ltv/danmaku/ijk/media/sink/AgoraWriter$1;

    .line 86
    .line 87
    iget-object v0, v0, Ltv/danmaku/ijk/media/sink/AgoraWriter$1;->a:Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 88
    .line 89
    invoke-static {v0}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->h(Ltv/danmaku/ijk/media/sink/AgoraWriter;)Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    if-eqz v0, :cond_3

    .line 94
    .line 95
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$1$2;->b:Ltv/danmaku/ijk/media/sink/AgoraWriter$1;

    .line 96
    .line 97
    iget-object v0, v0, Ltv/danmaku/ijk/media/sink/AgoraWriter$1;->a:Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 98
    .line 99
    invoke-static {v0}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->h(Ltv/danmaku/ijk/media/sink/AgoraWriter;)Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    iget-object v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$1$2;->b:Ltv/danmaku/ijk/media/sink/AgoraWriter$1;

    .line 104
    .line 105
    iget-object v1, v1, Ltv/danmaku/ijk/media/sink/AgoraWriter$1;->a:Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 106
    .line 107
    invoke-virtual {v1}, Lcom/immomo/mediacore/sink/SinkBase;->getUserID()J

    .line 108
    .line 109
    .line 110
    move-result-wide v1

    .line 111
    iget p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter$1$2;->a:I

    .line 112
    .line 113
    invoke-interface {v0, v1, v2, p0}, Lcom/immomo/mediacore/coninf/MRtcEventHandler;->onUserOffline(JI)V

    .line 114
    .line 115
    .line 116
    :cond_3
    return-void
.end method
