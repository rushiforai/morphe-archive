.class public final synthetic Lcom/ss/bytertc/base/media/camera/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/ss/bytertc/base/media/VideoSink;


# instance fields
.field public final synthetic a:Lcom/ss/bytertc/base/media/camera/Camera1Session;


# direct methods
.method public synthetic constructor <init>(Lcom/ss/bytertc/base/media/camera/Camera1Session;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/ss/bytertc/base/media/camera/a;->a:Lcom/ss/bytertc/base/media/camera/Camera1Session;

    return-void
.end method


# virtual methods
.method public final onFrame(Lcom/bytedance/realx/video/VideoFrame;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/a;->a:Lcom/ss/bytertc/base/media/camera/Camera1Session;

    invoke-static {p0, p1}, Lcom/ss/bytertc/base/media/camera/Camera1Session;->a(Lcom/ss/bytertc/base/media/camera/Camera1Session;Lcom/bytedance/realx/video/VideoFrame;)V

    return-void
.end method
