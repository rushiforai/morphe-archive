.class public Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/immomo/mediacore/strinf/NotifyCenter;
.implements Ltv/danmaku/ijk/media/util/netspeedutil/SpeedTask;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer$MeasureRunnable;,
        Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer$OnMeasurerFinishedListener;,
        Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer$OnMeasurerIntervalListener;
    }
.end annotation


# instance fields
.field private a:Lcom/immomo/mediacore/sink/SinkBase;

.field private b:I

.field private c:I

.field private d:Ljava/nio/ByteBuffer;

.field private e:Ljava/nio/ByteBuffer;

.field private f:Z

.field private g:J

.field private h:Ltv/danmaku/ijk/media/util/netspeedutil/ResultBean;

.field private i:J

.field private j:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private k:I

.field private l:Ljava/lang/Object;

.field private m:Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer$OnMeasurerFinishedListener;

.field private n:Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer$OnMeasurerIntervalListener;

.field private o:J


# direct methods
.method public static synthetic a(Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;)Lcom/immomo/mediacore/sink/SinkBase;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;->a:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;Lcom/immomo/mediacore/sink/SinkBase;)Lcom/immomo/mediacore/sink/SinkBase;
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;->a:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic c(Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;->g:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic d(Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;->i:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic e(Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;->i:J

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic f(Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;)I
    .locals 1

    .line 1
    iget v0, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;->k:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, -0x1

    .line 4
    .line 5
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;->k:I

    .line 6
    .line 7
    return v0
.end method

.method public static synthetic g(Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;J)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;->g:J

    .line 2
    .line 3
    sub-long/2addr v0, p1

    .line 4
    iput-wide v0, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;->g:J

    .line 5
    .line 6
    return-wide v0
.end method

.method public static synthetic h(Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;->f:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic i(Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;)Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;->d:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic j(Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;)I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic k(Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;)I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic l(Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;->o:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic m(Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;->p(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic n(Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;->q(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic o(Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;->l:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method private p(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;->n:Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer$OnMeasurerIntervalListener;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer$OnMeasurerIntervalListener;->a(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method private q(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;->m:Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer$OnMeasurerFinishedListener;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer$OnMeasurerFinishedListener;->a(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method


# virtual methods
.method public getPreviewScale()Landroid/graphics/PointF;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getPreviewZoom()F
    .locals 0

    const/high16 p0, 0x3f800000    # 1.0f

    return p0
.end method

.method public getStreamerCaptureType(I)I
    .locals 0

    const/4 p0, 0x3

    return p0
.end method

.method public getStreamerType()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public getVideoQuality()Lcom/immomo/mediacore/strinf/VideoQuality;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getWriter()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;->a:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    return-object p0
.end method

.method public notify(IIILjava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p4, Lcom/immomo/mediacore/sink/IjkWriter;

    .line 2
    .line 3
    const/16 p2, 0x64

    .line 4
    .line 5
    if-ne p1, p2, :cond_0

    .line 6
    .line 7
    iget-object p2, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;->a:Lcom/immomo/mediacore/sink/SinkBase;

    .line 8
    .line 9
    if-ne p4, p2, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;->e:Ljava/nio/ByteBuffer;

    .line 12
    .line 13
    const-wide/16 p2, 0x4

    .line 14
    .line 15
    invoke-virtual {p4, p1, p2, p3}, Lcom/immomo/mediacore/sink/IjkWriter;->writeAudioExtradata(Ljava/nio/ByteBuffer;J)V

    .line 16
    .line 17
    .line 18
    const/4 p1, 0x1

    .line 19
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;->f:Z

    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    const/16 p2, 0x12c

    .line 23
    .line 24
    if-ne p1, p2, :cond_1

    .line 25
    .line 26
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;->h:Ltv/danmaku/ijk/media/util/netspeedutil/ResultBean;

    .line 27
    .line 28
    invoke-virtual {p0, p3}, Ltv/danmaku/ijk/media/util/netspeedutil/ResultBean;->a(I)V

    .line 29
    .line 30
    .line 31
    :cond_1
    return-void
.end method

.method public notifyAdjustAef(IZ)V
    .locals 0

    return-void
.end method

.method public notifyAdjustEQ(IZ)V
    .locals 0

    return-void
.end method

.method public notifyAdjustEf(II)V
    .locals 0

    return-void
.end method

.method public notifyAdjustTune(IZ)V
    .locals 0

    return-void
.end method

.method public notifyEffectReset()V
    .locals 0

    return-void
.end method

.method public notifyEffectSet(IIF)V
    .locals 0

    return-void
.end method

.method public notifyEnableExtralAudio(Z)V
    .locals 0

    return-void
.end method

.method public notifyExtralAudioLoss()V
    .locals 0

    return-void
.end method

.method public notifyExtralAudioReady()V
    .locals 0

    return-void
.end method

.method public notifyRecording()V
    .locals 0

    return-void
.end method

.method public notifyResumeRecording()V
    .locals 0

    return-void
.end method

.method public notifyUpdateResolution()V
    .locals 0

    return-void
.end method

.method public r(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;->j:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public setSourceSucess()V
    .locals 0

    return-void
.end method

.method public setStreamerCaptureType(II)V
    .locals 0

    return-void
.end method

.method public startSurroundMusic(Ljava/lang/String;IJ)V
    .locals 0

    return-void
.end method

.method public stopSurroundMusic()V
    .locals 0

    return-void
.end method
