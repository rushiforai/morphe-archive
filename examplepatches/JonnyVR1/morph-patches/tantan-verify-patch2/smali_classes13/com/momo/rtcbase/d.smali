.class public final synthetic Lcom/momo/rtcbase/d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/rtcbase/VideoSink;


# instance fields
.field public final synthetic a:Lcom/momo/rtcbase/Camera2Session$CaptureSessionCallback;


# direct methods
.method public synthetic constructor <init>(Lcom/momo/rtcbase/Camera2Session$CaptureSessionCallback;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/momo/rtcbase/d;->a:Lcom/momo/rtcbase/Camera2Session$CaptureSessionCallback;

    return-void
.end method


# virtual methods
.method public final onFrame(Lcom/momo/rtcbase/VideoFrame;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/d;->a:Lcom/momo/rtcbase/Camera2Session$CaptureSessionCallback;

    invoke-static {p0, p1}, Lcom/momo/rtcbase/Camera2Session$CaptureSessionCallback;->a(Lcom/momo/rtcbase/Camera2Session$CaptureSessionCallback;Lcom/momo/rtcbase/VideoFrame;)V

    return-void
.end method
