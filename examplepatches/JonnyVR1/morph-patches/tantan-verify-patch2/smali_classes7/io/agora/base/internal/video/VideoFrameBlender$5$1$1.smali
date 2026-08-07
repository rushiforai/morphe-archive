.class Lio/agora/base/internal/video/VideoFrameBlender$5$1$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/agora/base/internal/video/VideoFrameBlender$5$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lio/agora/base/internal/video/VideoFrameBlender$5$1;


# direct methods
.method public constructor <init>(Lio/agora/base/internal/video/VideoFrameBlender$5$1;)V
    .locals 0

    iput-object p1, p0, Lio/agora/base/internal/video/VideoFrameBlender$5$1$1;->this$2:Lio/agora/base/internal/video/VideoFrameBlender$5$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object p0, p0, Lio/agora/base/internal/video/VideoFrameBlender$5$1$1;->this$2:Lio/agora/base/internal/video/VideoFrameBlender$5$1;

    iget p0, p0, Lio/agora/base/internal/video/VideoFrameBlender$5$1;->val$new_texture_id:I

    filled-new-array {p0}, [I

    move-result-object p0

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-static {v1, p0, v0}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    return-void
.end method
