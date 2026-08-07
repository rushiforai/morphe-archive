.class Lio/agora/base/internal/video/SurfaceTextureHelper$7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/agora/base/internal/video/SurfaceTextureHelper;->setFrameRotation(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/agora/base/internal/video/SurfaceTextureHelper;

.field final synthetic val$rotation:I


# direct methods
.method public constructor <init>(Lio/agora/base/internal/video/SurfaceTextureHelper;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lio/agora/base/internal/video/SurfaceTextureHelper$7;->this$0:Lio/agora/base/internal/video/SurfaceTextureHelper;

    .line 2
    .line 3
    iput p2, p0, Lio/agora/base/internal/video/SurfaceTextureHelper$7;->val$rotation:I

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lio/agora/base/internal/video/SurfaceTextureHelper$7;->this$0:Lio/agora/base/internal/video/SurfaceTextureHelper;

    .line 2
    .line 3
    iget p0, p0, Lio/agora/base/internal/video/SurfaceTextureHelper$7;->val$rotation:I

    .line 4
    .line 5
    invoke-static {v0, p0}, Lio/agora/base/internal/video/SurfaceTextureHelper;->access$1302(Lio/agora/base/internal/video/SurfaceTextureHelper;I)I

    .line 6
    .line 7
    .line 8
    return-void
.end method
