.class public Lcom/bytedance/realx/video/EncodedImage;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bytedance/realx/video/EncodedImage$Builder;,
        Lcom/bytedance/realx/video/EncodedImage$FrameType;
    }
.end annotation


# instance fields
.field public final buffer:Ljava/nio/ByteBuffer;

.field public final captureTimeMs:J

.field public final captureTimeNs:J

.field public final completeFrame:Z

.field public final compositionTimeUs:J

.field public final encodedHeight:I

.field public final encodedWidth:I

.field public final frameType:Lcom/bytedance/realx/video/EncodedImage$FrameType;

.field public final qp:Ljava/lang/Integer;

.field public final rotation:I

.field public final svcLayerNum:I


# direct methods
.method private constructor <init>(Ljava/nio/ByteBuffer;IIJLcom/bytedance/realx/video/EncodedImage$FrameType;IZLjava/lang/Integer;IJ)V
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/bytedance/realx/video/EncodedImage;->buffer:Ljava/nio/ByteBuffer;

    .line 5
    .line 6
    iput p2, p0, Lcom/bytedance/realx/video/EncodedImage;->encodedWidth:I

    .line 7
    .line 8
    iput p3, p0, Lcom/bytedance/realx/video/EncodedImage;->encodedHeight:I

    .line 9
    .line 10
    const-wide/32 p1, 0xf4240

    .line 11
    .line 12
    .line 13
    div-long p1, p4, p1

    .line 14
    .line 15
    iput-wide p1, p0, Lcom/bytedance/realx/video/EncodedImage;->captureTimeMs:J

    .line 16
    .line 17
    iput-wide p4, p0, Lcom/bytedance/realx/video/EncodedImage;->captureTimeNs:J

    .line 18
    .line 19
    iput-object p6, p0, Lcom/bytedance/realx/video/EncodedImage;->frameType:Lcom/bytedance/realx/video/EncodedImage$FrameType;

    .line 20
    .line 21
    iput p7, p0, Lcom/bytedance/realx/video/EncodedImage;->rotation:I

    .line 22
    .line 23
    iput-boolean p8, p0, Lcom/bytedance/realx/video/EncodedImage;->completeFrame:Z

    .line 24
    .line 25
    iput-object p9, p0, Lcom/bytedance/realx/video/EncodedImage;->qp:Ljava/lang/Integer;

    .line 26
    .line 27
    iput p10, p0, Lcom/bytedance/realx/video/EncodedImage;->svcLayerNum:I

    .line 28
    .line 29
    iput-wide p11, p0, Lcom/bytedance/realx/video/EncodedImage;->compositionTimeUs:J

    .line 30
    .line 31
    return-void
.end method

.method public synthetic constructor <init>(Ljava/nio/ByteBuffer;IIJLcom/bytedance/realx/video/EncodedImage$FrameType;IZLjava/lang/Integer;IJLcom/bytedance/realx/video/EncodedImage$1;)V
    .locals 0

    .line 32
    invoke-direct/range {p0 .. p12}, Lcom/bytedance/realx/video/EncodedImage;-><init>(Ljava/nio/ByteBuffer;IIJLcom/bytedance/realx/video/EncodedImage$FrameType;IZLjava/lang/Integer;IJ)V

    return-void
.end method

.method public static builder()Lcom/bytedance/realx/video/EncodedImage$Builder;
    .locals 2

    .line 1
    new-instance v0, Lcom/bytedance/realx/video/EncodedImage$Builder;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/bytedance/realx/video/EncodedImage$Builder;-><init>(Lcom/bytedance/realx/video/EncodedImage$1;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method private getBuffer()Ljava/nio/ByteBuffer;
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/EncodedImage;->buffer:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p0
.end method

.method private getCaptureTimeNs()J
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-wide v0, p0, Lcom/bytedance/realx/video/EncodedImage;->captureTimeNs:J

    .line 2
    .line 3
    return-wide v0
.end method

.method private getCompleteFrame()Z
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/bytedance/realx/video/EncodedImage;->completeFrame:Z

    .line 2
    .line 3
    return p0
.end method

.method private getCompositionTimeUs()J
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-wide v0, p0, Lcom/bytedance/realx/video/EncodedImage;->compositionTimeUs:J

    .line 2
    .line 3
    return-wide v0
.end method

.method private getEncodedHeight()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lcom/bytedance/realx/video/EncodedImage;->encodedHeight:I

    .line 2
    .line 3
    return p0
.end method

.method private getEncodedWidth()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lcom/bytedance/realx/video/EncodedImage;->encodedWidth:I

    .line 2
    .line 3
    return p0
.end method

.method private getFrameType()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/EncodedImage;->frameType:Lcom/bytedance/realx/video/EncodedImage$FrameType;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/bytedance/realx/video/EncodedImage$FrameType;->getNative()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method private getQp()Ljava/lang/Integer;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/EncodedImage;->qp:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method private getRotation()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lcom/bytedance/realx/video/EncodedImage;->rotation:I

    .line 2
    .line 3
    return p0
.end method

.method private getSvcLayerNum()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lcom/bytedance/realx/video/EncodedImage;->svcLayerNum:I

    .line 2
    .line 3
    return p0
.end method
