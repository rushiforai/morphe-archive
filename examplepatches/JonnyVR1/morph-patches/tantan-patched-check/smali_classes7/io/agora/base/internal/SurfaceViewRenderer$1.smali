.class Lio/agora/base/internal/SurfaceViewRenderer$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/agora/base/internal/SurfaceViewRenderer;->onFrameResolutionChanged(III)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/agora/base/internal/SurfaceViewRenderer;

.field final synthetic val$rotatedHeight:I

.field final synthetic val$rotatedWidth:I


# direct methods
.method public constructor <init>(Lio/agora/base/internal/SurfaceViewRenderer;II)V
    .locals 0

    .line 1
    iput-object p1, p0, Lio/agora/base/internal/SurfaceViewRenderer$1;->this$0:Lio/agora/base/internal/SurfaceViewRenderer;

    .line 2
    .line 3
    iput p2, p0, Lio/agora/base/internal/SurfaceViewRenderer$1;->val$rotatedWidth:I

    .line 4
    .line 5
    iput p3, p0, Lio/agora/base/internal/SurfaceViewRenderer$1;->val$rotatedHeight:I

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
    iget-object v0, p0, Lio/agora/base/internal/SurfaceViewRenderer$1;->this$0:Lio/agora/base/internal/SurfaceViewRenderer;

    .line 2
    .line 3
    iget v1, p0, Lio/agora/base/internal/SurfaceViewRenderer$1;->val$rotatedWidth:I

    .line 4
    .line 5
    invoke-static {v0, v1}, Lio/agora/base/internal/SurfaceViewRenderer;->access$002(Lio/agora/base/internal/SurfaceViewRenderer;I)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lio/agora/base/internal/SurfaceViewRenderer$1;->this$0:Lio/agora/base/internal/SurfaceViewRenderer;

    .line 9
    .line 10
    iget v1, p0, Lio/agora/base/internal/SurfaceViewRenderer$1;->val$rotatedHeight:I

    .line 11
    .line 12
    invoke-static {v0, v1}, Lio/agora/base/internal/SurfaceViewRenderer;->access$102(Lio/agora/base/internal/SurfaceViewRenderer;I)I

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lio/agora/base/internal/SurfaceViewRenderer$1;->this$0:Lio/agora/base/internal/SurfaceViewRenderer;

    .line 16
    .line 17
    invoke-static {v0}, Lio/agora/base/internal/SurfaceViewRenderer;->access$200(Lio/agora/base/internal/SurfaceViewRenderer;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lio/agora/base/internal/SurfaceViewRenderer$1;->this$0:Lio/agora/base/internal/SurfaceViewRenderer;

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 23
    .line 24
    .line 25
    return-void
.end method
