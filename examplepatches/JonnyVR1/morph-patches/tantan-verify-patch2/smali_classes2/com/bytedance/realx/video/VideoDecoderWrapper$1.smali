.class Lcom/bytedance/realx/video/VideoDecoderWrapper$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bytedance/realx/video/VideoDecoder$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bytedance/realx/video/VideoDecoderWrapper;->createDecoderCallback(J)Lcom/bytedance/realx/video/VideoDecoder$Callback;
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
    iput-wide p1, p0, Lcom/bytedance/realx/video/VideoDecoderWrapper$1;->val$nativeDecoder:J

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onDecodedFrame(Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;)V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/bytedance/realx/video/VideoDecoderWrapper$1;->val$nativeDecoder:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long p0, v0, v2

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-static {v0, v1, p1}, Lcom/bytedance/realx/video/VideoDecoderWrapper;->access$000(JLcom/bytedance/realx/video/memory/RXVideoFrameInterface;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public onMediaCodecStatus(Lcom/bytedance/realx/video/VideoCodecStatus;Ljava/lang/String;)V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/bytedance/realx/video/VideoDecoderWrapper$1;->val$nativeDecoder:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-wide v0, p0, Lcom/bytedance/realx/video/VideoDecoderWrapper$1;->val$nativeDecoder:J

    .line 18
    .line 19
    invoke-static {v0, v1, p1, p2}, Lcom/bytedance/realx/video/VideoDecoderWrapper;->access$100(JLcom/bytedance/realx/video/VideoCodecStatus;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method
