.class Ltv/danmaku/ijk/media/streamer/StreamProducer$13;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltv/danmaku/ijk/media/streamer/StreamProducer$PacketBufferlingStatusListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ltv/danmaku/ijk/media/streamer/StreamProducer;->x0()V
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
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$13;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(IJ)V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "videoMux PacketBufferlingStatusUpdata: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, ";duration:"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "streamerCameraProducer"

    .line 24
    .line 25
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$13;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 29
    .line 30
    iget-object v1, v0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->C:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 31
    .line 32
    if-eqz v1, :cond_1

    .line 33
    .line 34
    const/16 v1, 0x68

    .line 35
    .line 36
    if-ne p1, v1, :cond_1

    .line 37
    .line 38
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->x(Ltv/danmaku/ijk/media/streamer/StreamProducer;)J

    .line 39
    .line 40
    .line 41
    move-result-wide v0

    .line 42
    cmp-long p1, p2, v0

    .line 43
    .line 44
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$13;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 45
    .line 46
    const/4 v1, 0x0

    .line 47
    const/4 v2, 0x0

    .line 48
    const/4 v3, 0x1

    .line 49
    if-gez p1, :cond_0

    .line 50
    .line 51
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->y(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Z

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    if-nez p1, :cond_1

    .line 56
    .line 57
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$13;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 58
    .line 59
    invoke-static {p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->A(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Z

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    if-ne p1, v3, :cond_1

    .line 64
    .line 65
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$13;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 66
    .line 67
    const/16 v0, 0x69

    .line 68
    .line 69
    long-to-int p2, p2

    .line 70
    invoke-virtual {p1, v0, p2, v2, v1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->notify(IIILjava/lang/Object;)V

    .line 71
    .line 72
    .line 73
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$13;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 74
    .line 75
    invoke-static {p1, v3}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->z(Ltv/danmaku/ijk/media/streamer/StreamProducer;Z)Z

    .line 76
    .line 77
    .line 78
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$13;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 79
    .line 80
    invoke-static {p0, v2}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->B(Ltv/danmaku/ijk/media/streamer/StreamProducer;Z)Z

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_0
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->A(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Z

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    if-nez p1, :cond_1

    .line 89
    .line 90
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$13;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 91
    .line 92
    invoke-static {p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->y(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Z

    .line 93
    .line 94
    .line 95
    move-result p1

    .line 96
    if-ne p1, v3, :cond_1

    .line 97
    .line 98
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$13;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 99
    .line 100
    const/16 v0, 0x67

    .line 101
    .line 102
    long-to-int p2, p2

    .line 103
    invoke-virtual {p1, v0, p2, v2, v1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->notify(IIILjava/lang/Object;)V

    .line 104
    .line 105
    .line 106
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$13;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 107
    .line 108
    invoke-static {p1, v3}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->B(Ltv/danmaku/ijk/media/streamer/StreamProducer;Z)Z

    .line 109
    .line 110
    .line 111
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$13;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 112
    .line 113
    invoke-static {p1, v2}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->z(Ltv/danmaku/ijk/media/streamer/StreamProducer;Z)Z

    .line 114
    .line 115
    .line 116
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$13;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 117
    .line 118
    invoke-static {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->C(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I

    .line 119
    .line 120
    .line 121
    :cond_1
    return-void
.end method
