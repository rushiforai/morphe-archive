.class public Lcom/momo/rtcbase/EncodedImage;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/rtcbase/EncodedImage$Builder;,
        Lcom/momo/rtcbase/EncodedImage$FrameType;
    }
.end annotation


# instance fields
.field public final buffer:Ljava/nio/ByteBuffer;

.field public final captureTimeMs:J

.field public final captureTimeNs:J

.field public final completeFrame:Z

.field public final encodedHeight:I

.field public final encodedWidth:I

.field public final frameType:Lcom/momo/rtcbase/EncodedImage$FrameType;

.field public final qp:Ljava/lang/Integer;

.field public final rotation:I


# direct methods
.method private constructor <init>(Ljava/nio/ByteBuffer;IIJLcom/momo/rtcbase/EncodedImage$FrameType;IZLjava/lang/Integer;)V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/momo/rtcbase/EncodedImage;->buffer:Ljava/nio/ByteBuffer;

    .line 5
    .line 6
    iput p2, p0, Lcom/momo/rtcbase/EncodedImage;->encodedWidth:I

    .line 7
    .line 8
    iput p3, p0, Lcom/momo/rtcbase/EncodedImage;->encodedHeight:I

    .line 9
    .line 10
    const-wide/32 p1, 0xf4240

    .line 11
    .line 12
    .line 13
    div-long p1, p4, p1

    .line 14
    .line 15
    iput-wide p1, p0, Lcom/momo/rtcbase/EncodedImage;->captureTimeMs:J

    .line 16
    .line 17
    iput-wide p4, p0, Lcom/momo/rtcbase/EncodedImage;->captureTimeNs:J

    .line 18
    .line 19
    iput-object p6, p0, Lcom/momo/rtcbase/EncodedImage;->frameType:Lcom/momo/rtcbase/EncodedImage$FrameType;

    .line 20
    .line 21
    iput p7, p0, Lcom/momo/rtcbase/EncodedImage;->rotation:I

    .line 22
    .line 23
    iput-boolean p8, p0, Lcom/momo/rtcbase/EncodedImage;->completeFrame:Z

    .line 24
    .line 25
    iput-object p9, p0, Lcom/momo/rtcbase/EncodedImage;->qp:Ljava/lang/Integer;

    .line 26
    .line 27
    return-void
.end method

.method public synthetic constructor <init>(Ljava/nio/ByteBuffer;IIJLcom/momo/rtcbase/EncodedImage$FrameType;IZLjava/lang/Integer;Lcom/momo/rtcbase/EncodedImage$1;)V
    .locals 0

    .line 28
    invoke-direct/range {p0 .. p9}, Lcom/momo/rtcbase/EncodedImage;-><init>(Ljava/nio/ByteBuffer;IIJLcom/momo/rtcbase/EncodedImage$FrameType;IZLjava/lang/Integer;)V

    return-void
.end method

.method public static builder()Lcom/momo/rtcbase/EncodedImage$Builder;
    .locals 2

    .line 1
    new-instance v0, Lcom/momo/rtcbase/EncodedImage$Builder;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/momo/rtcbase/EncodedImage$Builder;-><init>(Lcom/momo/rtcbase/EncodedImage$1;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method
