.class public Lio/agora/base/internal/video/EncodedImage$Builder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/base/internal/video/EncodedImage;
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

.field private frameType:Lio/agora/base/internal/video/EncodedImage$FrameType;

.field private qp:Ljava/lang/Integer;

.field private rotation:I


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lio/agora/base/internal/video/EncodedImage$1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lio/agora/base/internal/video/EncodedImage$Builder;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public createEncodedImage()Lio/agora/base/internal/video/EncodedImage;
    .locals 12

    .line 1
    new-instance v0, Lio/agora/base/internal/video/EncodedImage;

    .line 2
    .line 3
    iget-object v1, p0, Lio/agora/base/internal/video/EncodedImage$Builder;->buffer:Ljava/nio/ByteBuffer;

    .line 4
    .line 5
    iget v2, p0, Lio/agora/base/internal/video/EncodedImage$Builder;->encodedWidth:I

    .line 6
    .line 7
    iget v3, p0, Lio/agora/base/internal/video/EncodedImage$Builder;->encodedHeight:I

    .line 8
    .line 9
    iget-wide v4, p0, Lio/agora/base/internal/video/EncodedImage$Builder;->captureTimeNs:J

    .line 10
    .line 11
    iget-object v6, p0, Lio/agora/base/internal/video/EncodedImage$Builder;->frameType:Lio/agora/base/internal/video/EncodedImage$FrameType;

    .line 12
    .line 13
    iget v7, p0, Lio/agora/base/internal/video/EncodedImage$Builder;->rotation:I

    .line 14
    .line 15
    iget-boolean v8, p0, Lio/agora/base/internal/video/EncodedImage$Builder;->completeFrame:Z

    .line 16
    .line 17
    iget-object v9, p0, Lio/agora/base/internal/video/EncodedImage$Builder;->qp:Ljava/lang/Integer;

    .line 18
    .line 19
    const/4 v10, 0x0

    .line 20
    const/4 v11, 0x0

    .line 21
    invoke-direct/range {v0 .. v11}, Lio/agora/base/internal/video/EncodedImage;-><init>(Ljava/nio/ByteBuffer;IIJLio/agora/base/internal/video/EncodedImage$FrameType;IZLjava/lang/Integer;Lio/agora/base/VideoFrame$ColorSpace;Lio/agora/base/internal/video/EncodedImage$1;)V

    .line 22
    .line 23
    .line 24
    return-object v0
.end method

.method public setBuffer(Ljava/nio/ByteBuffer;)Lio/agora/base/internal/video/EncodedImage$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lio/agora/base/internal/video/EncodedImage$Builder;->buffer:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public setCaptureTimeMs(J)Lio/agora/base/internal/video/EncodedImage$Builder;
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
    iput-wide p1, p0, Lio/agora/base/internal/video/EncodedImage$Builder;->captureTimeNs:J

    .line 8
    .line 9
    return-object p0
.end method

.method public setCaptureTimeNs(J)Lio/agora/base/internal/video/EncodedImage$Builder;
    .locals 0

    .line 1
    iput-wide p1, p0, Lio/agora/base/internal/video/EncodedImage$Builder;->captureTimeNs:J

    .line 2
    .line 3
    return-object p0
.end method

.method public setCompleteFrame(Z)Lio/agora/base/internal/video/EncodedImage$Builder;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lio/agora/base/internal/video/EncodedImage$Builder;->completeFrame:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public setEncodedHeight(I)Lio/agora/base/internal/video/EncodedImage$Builder;
    .locals 0

    .line 1
    iput p1, p0, Lio/agora/base/internal/video/EncodedImage$Builder;->encodedHeight:I

    .line 2
    .line 3
    return-object p0
.end method

.method public setEncodedWidth(I)Lio/agora/base/internal/video/EncodedImage$Builder;
    .locals 0

    .line 1
    iput p1, p0, Lio/agora/base/internal/video/EncodedImage$Builder;->encodedWidth:I

    .line 2
    .line 3
    return-object p0
.end method

.method public setFrameType(Lio/agora/base/internal/video/EncodedImage$FrameType;)Lio/agora/base/internal/video/EncodedImage$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lio/agora/base/internal/video/EncodedImage$Builder;->frameType:Lio/agora/base/internal/video/EncodedImage$FrameType;

    .line 2
    .line 3
    return-object p0
.end method

.method public setQp(Ljava/lang/Integer;)Lio/agora/base/internal/video/EncodedImage$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lio/agora/base/internal/video/EncodedImage$Builder;->qp:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method public setRotation(I)Lio/agora/base/internal/video/EncodedImage$Builder;
    .locals 0

    .line 1
    iput p1, p0, Lio/agora/base/internal/video/EncodedImage$Builder;->rotation:I

    .line 2
    .line 3
    return-object p0
.end method
