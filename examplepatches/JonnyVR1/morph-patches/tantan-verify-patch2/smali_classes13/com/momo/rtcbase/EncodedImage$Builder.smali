.class public Lcom/momo/rtcbase/EncodedImage$Builder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/rtcbase/EncodedImage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private buffer:Ljava/nio/ByteBuffer;

.field private captureTimeNs:J

.field private completeFrame:Z

.field private encodedHeight:I

.field private encodedWidth:I

.field private frameType:Lcom/momo/rtcbase/EncodedImage$FrameType;

.field private qp:Ljava/lang/Integer;

.field private rotation:I


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lcom/momo/rtcbase/EncodedImage$1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/EncodedImage$Builder;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public createEncodedImage()Lcom/momo/rtcbase/EncodedImage;
    .locals 11

    .line 1
    new-instance v0, Lcom/momo/rtcbase/EncodedImage;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/momo/rtcbase/EncodedImage$Builder;->buffer:Ljava/nio/ByteBuffer;

    .line 4
    .line 5
    iget v2, p0, Lcom/momo/rtcbase/EncodedImage$Builder;->encodedWidth:I

    .line 6
    .line 7
    iget v3, p0, Lcom/momo/rtcbase/EncodedImage$Builder;->encodedHeight:I

    .line 8
    .line 9
    iget-wide v4, p0, Lcom/momo/rtcbase/EncodedImage$Builder;->captureTimeNs:J

    .line 10
    .line 11
    iget-object v6, p0, Lcom/momo/rtcbase/EncodedImage$Builder;->frameType:Lcom/momo/rtcbase/EncodedImage$FrameType;

    .line 12
    .line 13
    iget v7, p0, Lcom/momo/rtcbase/EncodedImage$Builder;->rotation:I

    .line 14
    .line 15
    iget-boolean v8, p0, Lcom/momo/rtcbase/EncodedImage$Builder;->completeFrame:Z

    .line 16
    .line 17
    iget-object v9, p0, Lcom/momo/rtcbase/EncodedImage$Builder;->qp:Ljava/lang/Integer;

    .line 18
    .line 19
    const/4 v10, 0x0

    .line 20
    invoke-direct/range {v0 .. v10}, Lcom/momo/rtcbase/EncodedImage;-><init>(Ljava/nio/ByteBuffer;IIJLcom/momo/rtcbase/EncodedImage$FrameType;IZLjava/lang/Integer;Lcom/momo/rtcbase/EncodedImage$1;)V

    .line 21
    .line 22
    .line 23
    return-object v0
.end method

.method public setBuffer(Ljava/nio/ByteBuffer;)Lcom/momo/rtcbase/EncodedImage$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/rtcbase/EncodedImage$Builder;->buffer:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public setCaptureTimeMs(J)Lcom/momo/rtcbase/EncodedImage$Builder;
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
    iput-wide p1, p0, Lcom/momo/rtcbase/EncodedImage$Builder;->captureTimeNs:J

    .line 8
    .line 9
    return-object p0
.end method

.method public setCaptureTimeNs(J)Lcom/momo/rtcbase/EncodedImage$Builder;
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/momo/rtcbase/EncodedImage$Builder;->captureTimeNs:J

    .line 2
    .line 3
    return-object p0
.end method

.method public setCompleteFrame(Z)Lcom/momo/rtcbase/EncodedImage$Builder;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/rtcbase/EncodedImage$Builder;->completeFrame:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public setEncodedHeight(I)Lcom/momo/rtcbase/EncodedImage$Builder;
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/rtcbase/EncodedImage$Builder;->encodedHeight:I

    .line 2
    .line 3
    return-object p0
.end method

.method public setEncodedWidth(I)Lcom/momo/rtcbase/EncodedImage$Builder;
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/rtcbase/EncodedImage$Builder;->encodedWidth:I

    .line 2
    .line 3
    return-object p0
.end method

.method public setFrameType(Lcom/momo/rtcbase/EncodedImage$FrameType;)Lcom/momo/rtcbase/EncodedImage$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/rtcbase/EncodedImage$Builder;->frameType:Lcom/momo/rtcbase/EncodedImage$FrameType;

    .line 2
    .line 3
    return-object p0
.end method

.method public setQp(Ljava/lang/Integer;)Lcom/momo/rtcbase/EncodedImage$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/rtcbase/EncodedImage$Builder;->qp:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method public setRotation(I)Lcom/momo/rtcbase/EncodedImage$Builder;
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/rtcbase/EncodedImage$Builder;->rotation:I

    .line 2
    .line 3
    return-object p0
.end method
