.class Lio/agora/base/internal/video/VideoEncoderWrapper$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lio/agora/base/internal/video/VideoEncoder$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/agora/base/internal/video/VideoEncoderWrapper;->createEncoderCallback(J)Lio/agora/base/internal/video/VideoEncoder$Callback;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic val$nativeEncoder:J


# direct methods
.method public constructor <init>(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lio/agora/base/internal/video/VideoEncoderWrapper$1;->val$nativeEncoder:J

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onEncodeBufferPrepared(J)V
    .locals 2

    .line 1
    iget-wide v0, p0, Lio/agora/base/internal/video/VideoEncoderWrapper$1;->val$nativeEncoder:J

    .line 2
    .line 3
    invoke-static {v0, v1, p1, p2}, Lio/agora/base/internal/video/VideoEncoderWrapper;->access$200(JJ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onEncodeReset()V
    .locals 2

    .line 1
    iget-wide v0, p0, Lio/agora/base/internal/video/VideoEncoderWrapper$1;->val$nativeEncoder:J

    .line 2
    .line 3
    invoke-static {v0, v1}, Lio/agora/base/internal/video/VideoEncoderWrapper;->access$100(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onEncodedFrame(Lio/agora/base/internal/video/EncodedImage;IIIIILio/agora/base/internal/video/CodecSpecificInfo;)V
    .locals 19

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    move-object/from16 v1, p0

    .line 4
    .line 5
    iget-wide v1, v1, Lio/agora/base/internal/video/VideoEncoderWrapper$1;->val$nativeEncoder:J

    .line 6
    .line 7
    move-wide v3, v1

    .line 8
    iget-object v2, v0, Lio/agora/base/internal/video/EncodedImage;->buffer:Ljava/nio/ByteBuffer;

    .line 9
    .line 10
    move-wide v4, v3

    .line 11
    iget v3, v0, Lio/agora/base/internal/video/EncodedImage;->encodedWidth:I

    .line 12
    .line 13
    move-wide v5, v4

    .line 14
    iget v4, v0, Lio/agora/base/internal/video/EncodedImage;->encodedHeight:I

    .line 15
    .line 16
    move-wide v7, v5

    .line 17
    iget-wide v5, v0, Lio/agora/base/internal/video/EncodedImage;->captureTimeNs:J

    .line 18
    .line 19
    iget-object v1, v0, Lio/agora/base/internal/video/EncodedImage;->frameType:Lio/agora/base/internal/video/EncodedImage$FrameType;

    .line 20
    .line 21
    invoke-virtual {v1}, Lio/agora/base/internal/video/EncodedImage$FrameType;->getNative()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    move-wide v9, v7

    .line 26
    iget v8, v0, Lio/agora/base/internal/video/EncodedImage;->rotation:I

    .line 27
    .line 28
    move-wide v10, v9

    .line 29
    iget-boolean v9, v0, Lio/agora/base/internal/video/EncodedImage;->completeFrame:Z

    .line 30
    .line 31
    iget-object v0, v0, Lio/agora/base/internal/video/EncodedImage;->qp:Ljava/lang/Integer;

    .line 32
    .line 33
    move/from16 v12, p3

    .line 34
    .line 35
    move/from16 v13, p4

    .line 36
    .line 37
    move/from16 v14, p5

    .line 38
    .line 39
    move/from16 v15, p6

    .line 40
    .line 41
    move-object/from16 v16, p7

    .line 42
    .line 43
    move v7, v1

    .line 44
    move-wide/from16 v17, v10

    .line 45
    .line 46
    move/from16 v11, p2

    .line 47
    .line 48
    move-object v10, v0

    .line 49
    move-wide/from16 v0, v17

    .line 50
    .line 51
    invoke-static/range {v0 .. v16}, Lio/agora/base/internal/video/VideoEncoderWrapper;->access$000(JLjava/nio/ByteBuffer;IIJIIZLjava/lang/Integer;IIIIILio/agora/base/internal/video/CodecSpecificInfo;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method
