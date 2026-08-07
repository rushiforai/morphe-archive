.class Lio/agora/base/internal/video/TimerSurfaceTextureHelper$12;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->setTextureSize(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/agora/base/internal/video/TimerSurfaceTextureHelper;

.field final synthetic val$textureHeight:I

.field final synthetic val$textureWidth:I


# direct methods
.method public constructor <init>(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;II)V
    .locals 0

    .line 1
    iput-object p1, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$12;->this$0:Lio/agora/base/internal/video/TimerSurfaceTextureHelper;

    .line 2
    .line 3
    iput p2, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$12;->val$textureWidth:I

    .line 4
    .line 5
    iput p3, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$12;->val$textureHeight:I

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$12;->this$0:Lio/agora/base/internal/video/TimerSurfaceTextureHelper;

    .line 2
    .line 3
    iget v1, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$12;->val$textureWidth:I

    .line 4
    .line 5
    invoke-static {v0, v1}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->access$1802(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;I)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$12;->this$0:Lio/agora/base/internal/video/TimerSurfaceTextureHelper;

    .line 9
    .line 10
    iget p0, p0, Lio/agora/base/internal/video/TimerSurfaceTextureHelper$12;->val$textureHeight:I

    .line 11
    .line 12
    invoke-static {v0, p0}, Lio/agora/base/internal/video/TimerSurfaceTextureHelper;->access$1902(Lio/agora/base/internal/video/TimerSurfaceTextureHelper;I)I

    .line 13
    .line 14
    .line 15
    return-void
.end method
