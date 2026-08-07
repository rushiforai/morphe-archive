.class Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/immomo/mediacore/sink/SinkBase$PcmDateCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->attachStreamerForAudio(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;


# direct methods
.method public constructor <init>(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$2;->a:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onPcmDateCallback(J[BIZ)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$2;->a:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 2
    .line 3
    array-length p1, p3

    .line 4
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 5
    .line 6
    .line 7
    move-result-wide p4

    .line 8
    invoke-virtual {p0, p3, p1, p4, p5}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->qbuffer([BIJ)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
