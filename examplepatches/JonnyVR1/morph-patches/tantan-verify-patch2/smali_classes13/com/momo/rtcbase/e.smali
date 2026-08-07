.class public final synthetic Lcom/momo/rtcbase/e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/rtcbase/VideoDecoder$Callback;


# instance fields
.field public final synthetic a:J


# direct methods
.method public synthetic constructor <init>(J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lcom/momo/rtcbase/e;->a:J

    return-void
.end method


# virtual methods
.method public final onDecodedFrame(Lcom/momo/rtcbase/VideoFrame;Ljava/lang/Integer;Ljava/lang/Integer;)V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/rtcbase/e;->a:J

    invoke-static {v0, v1, p1, p2, p3}, Lcom/momo/rtcbase/VideoDecoderWrapper;->a(JLcom/momo/rtcbase/VideoFrame;Ljava/lang/Integer;Ljava/lang/Integer;)V

    return-void
.end method
