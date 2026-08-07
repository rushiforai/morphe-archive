.class public final synthetic Lcom/momo/rtcbase/f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/rtcbase/VideoEncoder$Callback;


# instance fields
.field public final synthetic a:J


# direct methods
.method public synthetic constructor <init>(J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lcom/momo/rtcbase/f;->a:J

    return-void
.end method


# virtual methods
.method public final onEncodedFrame(Lcom/momo/rtcbase/EncodedImage;Lcom/momo/rtcbase/VideoEncoder$CodecSpecificInfo;)V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/rtcbase/f;->a:J

    invoke-static {v0, v1, p1, p2}, Lcom/momo/rtcbase/VideoEncoderWrapper;->a(JLcom/momo/rtcbase/EncodedImage;Lcom/momo/rtcbase/VideoEncoder$CodecSpecificInfo;)V

    return-void
.end method
