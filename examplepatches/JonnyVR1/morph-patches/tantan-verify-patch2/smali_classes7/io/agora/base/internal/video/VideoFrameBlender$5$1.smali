.class Lio/agora/base/internal/video/VideoFrameBlender$5$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/agora/base/internal/video/VideoFrameBlender$5;->call()Lio/agora/base/VideoFrame$TextureBuffer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lio/agora/base/internal/video/VideoFrameBlender$5;

.field final synthetic val$new_texture_id:I


# direct methods
.method public constructor <init>(Lio/agora/base/internal/video/VideoFrameBlender$5;I)V
    .locals 0

    iput-object p1, p0, Lio/agora/base/internal/video/VideoFrameBlender$5$1;->this$1:Lio/agora/base/internal/video/VideoFrameBlender$5;

    iput p2, p0, Lio/agora/base/internal/video/VideoFrameBlender$5$1;->val$new_texture_id:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lio/agora/base/internal/video/VideoFrameBlender$5$1;->this$1:Lio/agora/base/internal/video/VideoFrameBlender$5;

    iget-object v0, v0, Lio/agora/base/internal/video/VideoFrameBlender$5;->this$0:Lio/agora/base/internal/video/VideoFrameBlender;

    invoke-static {v0}, Lio/agora/base/internal/video/VideoFrameBlender;->access$1200(Lio/agora/base/internal/video/VideoFrameBlender;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lio/agora/base/internal/video/VideoFrameBlender$5$1$1;

    invoke-direct {v1, p0}, Lio/agora/base/internal/video/VideoFrameBlender$5$1$1;-><init>(Lio/agora/base/internal/video/VideoFrameBlender$5$1;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
