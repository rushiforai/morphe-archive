.class public final synthetic Lcom/bytedance/realx/video/e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bytedance/realx/video/VideoEncoder$Callback;


# instance fields
.field public final synthetic a:J


# direct methods
.method public synthetic constructor <init>(J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lcom/bytedance/realx/video/e;->a:J

    return-void
.end method


# virtual methods
.method public final onEncodedFrame(Lcom/bytedance/realx/video/EncodedImage;Lcom/bytedance/realx/video/VideoEncoder$CodecSpecificInfo;)V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/bytedance/realx/video/e;->a:J

    invoke-static {v0, v1, p1, p2}, Lcom/bytedance/realx/video/VideoEncoderWrapper;->a(JLcom/bytedance/realx/video/EncodedImage;Lcom/bytedance/realx/video/VideoEncoder$CodecSpecificInfo;)V

    return-void
.end method
