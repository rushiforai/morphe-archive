.class Lcom/bytedance/realx/video/EglRenderer$FrameListenerAndParams;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bytedance/realx/video/EglRenderer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FrameListenerAndParams"
.end annotation


# instance fields
.field public final applyFpsReduction:Z

.field public final drawer:Lcom/bytedance/realx/video/RendererCommon$GlDrawer;

.field public final listener:Lcom/bytedance/realx/video/EglRenderer$FrameListener;

.field public final scale:F


# direct methods
.method public constructor <init>(Lcom/bytedance/realx/video/EglRenderer$FrameListener;FLcom/bytedance/realx/video/RendererCommon$GlDrawer;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/bytedance/realx/video/EglRenderer$FrameListenerAndParams;->listener:Lcom/bytedance/realx/video/EglRenderer$FrameListener;

    .line 5
    .line 6
    iput p2, p0, Lcom/bytedance/realx/video/EglRenderer$FrameListenerAndParams;->scale:F

    .line 7
    .line 8
    iput-object p3, p0, Lcom/bytedance/realx/video/EglRenderer$FrameListenerAndParams;->drawer:Lcom/bytedance/realx/video/RendererCommon$GlDrawer;

    .line 9
    .line 10
    iput-boolean p4, p0, Lcom/bytedance/realx/video/EglRenderer$FrameListenerAndParams;->applyFpsReduction:Z

    .line 11
    .line 12
    return-void
.end method
