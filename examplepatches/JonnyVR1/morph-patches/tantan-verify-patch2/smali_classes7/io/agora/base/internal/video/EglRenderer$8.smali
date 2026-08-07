.class Lio/agora/base/internal/video/EglRenderer$8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/agora/base/internal/video/EglRenderer;->addFrameListener(Lio/agora/base/internal/video/EglRenderer$FrameListener;FLio/agora/base/internal/video/RendererCommon$GlDrawer;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/agora/base/internal/video/EglRenderer;

.field final synthetic val$applyFpsReduction:Z

.field final synthetic val$drawerParam:Lio/agora/base/internal/video/RendererCommon$GlDrawer;

.field final synthetic val$listener:Lio/agora/base/internal/video/EglRenderer$FrameListener;

.field final synthetic val$scale:F


# direct methods
.method public constructor <init>(Lio/agora/base/internal/video/EglRenderer;Lio/agora/base/internal/video/RendererCommon$GlDrawer;Lio/agora/base/internal/video/EglRenderer$FrameListener;FZ)V
    .locals 0

    .line 1
    iput-object p1, p0, Lio/agora/base/internal/video/EglRenderer$8;->this$0:Lio/agora/base/internal/video/EglRenderer;

    .line 2
    .line 3
    iput-object p2, p0, Lio/agora/base/internal/video/EglRenderer$8;->val$drawerParam:Lio/agora/base/internal/video/RendererCommon$GlDrawer;

    .line 4
    .line 5
    iput-object p3, p0, Lio/agora/base/internal/video/EglRenderer$8;->val$listener:Lio/agora/base/internal/video/EglRenderer$FrameListener;

    .line 6
    .line 7
    iput p4, p0, Lio/agora/base/internal/video/EglRenderer$8;->val$scale:F

    .line 8
    .line 9
    iput-boolean p5, p0, Lio/agora/base/internal/video/EglRenderer$8;->val$applyFpsReduction:Z

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 1
    iget-object v0, p0, Lio/agora/base/internal/video/EglRenderer$8;->val$drawerParam:Lio/agora/base/internal/video/RendererCommon$GlDrawer;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lio/agora/base/internal/video/EglRenderer$8;->this$0:Lio/agora/base/internal/video/EglRenderer;

    .line 6
    .line 7
    invoke-static {v0}, Lio/agora/base/internal/video/EglRenderer;->access$1700(Lio/agora/base/internal/video/EglRenderer;)Lio/agora/base/internal/video/RendererCommon$GlDrawer;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    :cond_0
    iget-object v1, p0, Lio/agora/base/internal/video/EglRenderer$8;->this$0:Lio/agora/base/internal/video/EglRenderer;

    .line 12
    .line 13
    invoke-static {v1}, Lio/agora/base/internal/video/EglRenderer;->access$2000(Lio/agora/base/internal/video/EglRenderer;)Ljava/util/ArrayList;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    new-instance v2, Lio/agora/base/internal/video/EglRenderer$FrameListenerAndParams;

    .line 18
    .line 19
    iget-object v3, p0, Lio/agora/base/internal/video/EglRenderer$8;->val$listener:Lio/agora/base/internal/video/EglRenderer$FrameListener;

    .line 20
    .line 21
    iget v4, p0, Lio/agora/base/internal/video/EglRenderer$8;->val$scale:F

    .line 22
    .line 23
    iget-boolean p0, p0, Lio/agora/base/internal/video/EglRenderer$8;->val$applyFpsReduction:Z

    .line 24
    .line 25
    invoke-direct {v2, v3, v4, v0, p0}, Lio/agora/base/internal/video/EglRenderer$FrameListenerAndParams;-><init>(Lio/agora/base/internal/video/EglRenderer$FrameListener;FLio/agora/base/internal/video/RendererCommon$GlDrawer;Z)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    return-void
.end method
