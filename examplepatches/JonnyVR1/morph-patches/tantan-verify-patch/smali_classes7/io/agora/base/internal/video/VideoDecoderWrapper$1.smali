.class Lio/agora/base/internal/video/VideoDecoderWrapper$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lio/agora/base/internal/video/VideoDecoder$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/agora/base/internal/video/VideoDecoderWrapper;->createDecoderCallback(J)Lio/agora/base/internal/video/VideoDecoder$Callback;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic val$nativeDecoder:J


# direct methods
.method public constructor <init>(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lio/agora/base/internal/video/VideoDecoderWrapper$1;->val$nativeDecoder:J

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onDecodeBufferPrepared(J)V
    .locals 2

    .line 1
    iget-wide v0, p0, Lio/agora/base/internal/video/VideoDecoderWrapper$1;->val$nativeDecoder:J

    .line 2
    .line 3
    invoke-static {v0, v1, p1, p2}, Lio/agora/base/internal/video/VideoDecoderWrapper;->access$200(JJ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onDecodeReset()V
    .locals 2

    .line 1
    iget-wide v0, p0, Lio/agora/base/internal/video/VideoDecoderWrapper$1;->val$nativeDecoder:J

    .line 2
    .line 3
    invoke-static {v0, v1}, Lio/agora/base/internal/video/VideoDecoderWrapper;->access$100(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onDecodedFrame(Lio/agora/base/VideoFrame;Ljava/lang/Integer;Ljava/lang/Integer;IIILio/agora/base/internal/video/CodecSpecificInfo;Lio/agora/base/internal/video/FrameExtraInfo;)V
    .locals 10

    .line 1
    iget-wide v0, p0, Lio/agora/base/internal/video/VideoDecoderWrapper$1;->val$nativeDecoder:J

    .line 2
    .line 3
    move-object v2, p1

    .line 4
    move-object v3, p2

    .line 5
    move-object v4, p3

    .line 6
    move v5, p4

    .line 7
    move v6, p5

    .line 8
    move/from16 v7, p6

    .line 9
    .line 10
    move-object/from16 v8, p7

    .line 11
    .line 12
    move-object/from16 v9, p8

    .line 13
    .line 14
    invoke-static/range {v0 .. v9}, Lio/agora/base/internal/video/VideoDecoderWrapper;->access$000(JLio/agora/base/VideoFrame;Ljava/lang/Integer;Ljava/lang/Integer;IIILio/agora/base/internal/video/CodecSpecificInfo;Lio/agora/base/internal/video/FrameExtraInfo;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
