.class public final synthetic Lcom/ss/bytertc/base/media/camera/d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/ss/bytertc/base/media/VideoSink;


# instance fields
.field public final synthetic a:Lcom/ss/bytertc/base/media/camera/Camera2Session$CaptureSessionCallback;


# direct methods
.method public synthetic constructor <init>(Lcom/ss/bytertc/base/media/camera/Camera2Session$CaptureSessionCallback;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/ss/bytertc/base/media/camera/d;->a:Lcom/ss/bytertc/base/media/camera/Camera2Session$CaptureSessionCallback;

    return-void
.end method


# virtual methods
.method public final onFrame(Lcom/bytedance/realx/video/VideoFrame;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/d;->a:Lcom/ss/bytertc/base/media/camera/Camera2Session$CaptureSessionCallback;

    invoke-static {p0, p1}, Lcom/ss/bytertc/base/media/camera/Camera2Session$CaptureSessionCallback;->a(Lcom/ss/bytertc/base/media/camera/Camera2Session$CaptureSessionCallback;Lcom/bytedance/realx/video/VideoFrame;)V

    return-void
.end method
