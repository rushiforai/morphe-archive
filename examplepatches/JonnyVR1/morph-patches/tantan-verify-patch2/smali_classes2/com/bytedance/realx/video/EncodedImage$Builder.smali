.class public Lcom/bytedance/realx/video/EncodedImage$Builder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bytedance/realx/video/EncodedImage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private buffer:Ljava/nio/ByteBuffer;

.field private captureTimeNs:J

.field private completeFrame:Z

.field private compositionTimeUs:J

.field private encodedHeight:I

.field private encodedWidth:I

.field private frameType:Lcom/bytedance/realx/video/EncodedImage$FrameType;

.field private qp:Ljava/lang/Integer;

.field private rotation:I

.field private svcLayerNum:I


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/bytedance/realx/video/EncodedImage$Builder;->qp:Ljava/lang/Integer;

    .line 10
    .line 11
    return-void
.end method

.method public synthetic constructor <init>(Lcom/bytedance/realx/video/EncodedImage$1;)V
    .locals 0

    .line 12
    invoke-direct {p0}, Lcom/bytedance/realx/video/EncodedImage$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public createEncodedImage()Lcom/bytedance/realx/video/EncodedImage;
    .locals 14

    .line 1
    new-instance v0, Lcom/bytedance/realx/video/EncodedImage;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/bytedance/realx/video/EncodedImage$Builder;->buffer:Ljava/nio/ByteBuffer;

    .line 4
    .line 5
    iget v2, p0, Lcom/bytedance/realx/video/EncodedImage$Builder;->encodedWidth:I

    .line 6
    .line 7
    iget v3, p0, Lcom/bytedance/realx/video/EncodedImage$Builder;->encodedHeight:I

    .line 8
    .line 9
    iget-wide v4, p0, Lcom/bytedance/realx/video/EncodedImage$Builder;->captureTimeNs:J

    .line 10
    .line 11
    iget-object v6, p0, Lcom/bytedance/realx/video/EncodedImage$Builder;->frameType:Lcom/bytedance/realx/video/EncodedImage$FrameType;

    .line 12
    .line 13
    iget v7, p0, Lcom/bytedance/realx/video/EncodedImage$Builder;->rotation:I

    .line 14
    .line 15
    iget-boolean v8, p0, Lcom/bytedance/realx/video/EncodedImage$Builder;->completeFrame:Z

    .line 16
    .line 17
    iget-object v9, p0, Lcom/bytedance/realx/video/EncodedImage$Builder;->qp:Ljava/lang/Integer;

    .line 18
    .line 19
    iget v10, p0, Lcom/bytedance/realx/video/EncodedImage$Builder;->svcLayerNum:I

    .line 20
    .line 21
    iget-wide v11, p0, Lcom/bytedance/realx/video/EncodedImage$Builder;->compositionTimeUs:J

    .line 22
    .line 23
    const/4 v13, 0x0

    .line 24
    invoke-direct/range {v0 .. v13}, Lcom/bytedance/realx/video/EncodedImage;-><init>(Ljava/nio/ByteBuffer;IIJLcom/bytedance/realx/video/EncodedImage$FrameType;IZLjava/lang/Integer;IJLcom/bytedance/realx/video/EncodedImage$1;)V

    .line 25
    .line 26
    .line 27
    return-object v0
.end method

.method public setBuffer(Ljava/nio/ByteBuffer;)Lcom/bytedance/realx/video/EncodedImage$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/bytedance/realx/video/EncodedImage$Builder;->buffer:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public setCaptureTimeMs(J)Lcom/bytedance/realx/video/EncodedImage$Builder;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    .line 4
    .line 5
    .line 6
    move-result-wide p1

    .line 7
    iput-wide p1, p0, Lcom/bytedance/realx/video/EncodedImage$Builder;->captureTimeNs:J

    .line 8
    .line 9
    return-object p0
.end method

.method public setCaptureTimeNs(J)Lcom/bytedance/realx/video/EncodedImage$Builder;
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/bytedance/realx/video/EncodedImage$Builder;->captureTimeNs:J

    .line 2
    .line 3
    return-object p0
.end method

.method public setCompleteFrame(Z)Lcom/bytedance/realx/video/EncodedImage$Builder;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/bytedance/realx/video/EncodedImage$Builder;->completeFrame:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public setCompositionTimeUs(J)Lcom/bytedance/realx/video/EncodedImage$Builder;
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/bytedance/realx/video/EncodedImage$Builder;->compositionTimeUs:J

    .line 2
    .line 3
    return-object p0
.end method

.method public setEncodedHeight(I)Lcom/bytedance/realx/video/EncodedImage$Builder;
    .locals 0

    .line 1
    iput p1, p0, Lcom/bytedance/realx/video/EncodedImage$Builder;->encodedHeight:I

    .line 2
    .line 3
    return-object p0
.end method

.method public setEncodedWidth(I)Lcom/bytedance/realx/video/EncodedImage$Builder;
    .locals 0

    .line 1
    iput p1, p0, Lcom/bytedance/realx/video/EncodedImage$Builder;->encodedWidth:I

    .line 2
    .line 3
    return-object p0
.end method

.method public setFrameType(Lcom/bytedance/realx/video/EncodedImage$FrameType;)Lcom/bytedance/realx/video/EncodedImage$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/bytedance/realx/video/EncodedImage$Builder;->frameType:Lcom/bytedance/realx/video/EncodedImage$FrameType;

    .line 2
    .line 3
    return-object p0
.end method

.method public setQp(Ljava/lang/Integer;)Lcom/bytedance/realx/video/EncodedImage$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/bytedance/realx/video/EncodedImage$Builder;->qp:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method public setRotation(I)Lcom/bytedance/realx/video/EncodedImage$Builder;
    .locals 0

    .line 1
    iput p1, p0, Lcom/bytedance/realx/video/EncodedImage$Builder;->rotation:I

    .line 2
    .line 3
    return-object p0
.end method

.method public setSvcLayerNum(I)Lcom/bytedance/realx/video/EncodedImage$Builder;
    .locals 0

    .line 1
    iput p1, p0, Lcom/bytedance/realx/video/EncodedImage$Builder;->svcLayerNum:I

    .line 2
    .line 3
    return-object p0
.end method
