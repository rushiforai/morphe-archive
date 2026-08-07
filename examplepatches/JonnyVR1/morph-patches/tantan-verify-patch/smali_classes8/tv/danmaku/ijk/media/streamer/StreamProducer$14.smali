.class Ltv/danmaku/ijk/media/streamer/StreamProducer$14;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltv/danmaku/ijk/media/streamer/StreamProducer$PacketBufferlingStatusListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ltv/danmaku/ijk/media/streamer/StreamProducer;->w0()V
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
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$14;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

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
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "audioMux PacketBufferlingStatusUpdata: "

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
    move-result-object p2

    .line 23
    const-string p3, "streamerCameraProducer"

    .line 24
    .line 25
    invoke-static {p3, p2}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    const/16 p2, 0x68

    .line 29
    .line 30
    if-ne p1, p2, :cond_0

    .line 31
    .line 32
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$14;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 33
    .line 34
    invoke-static {p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->D(Ltv/danmaku/ijk/media/streamer/StreamProducer;)J

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$14;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 38
    .line 39
    invoke-static {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->D(Ltv/danmaku/ijk/media/streamer/StreamProducer;)J

    .line 40
    .line 41
    .line 42
    :cond_0
    return-void
.end method
