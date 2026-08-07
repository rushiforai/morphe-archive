.class Lcom/momo/rtcbase/EglRenderer$FrameListenerAndParams;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/rtcbase/EglRenderer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FrameListenerAndParams"
.end annotation


# instance fields
.field public final applyFpsReduction:Z

.field public final drawer:Lcom/momo/rtcbase/RendererCommon$GlDrawer;

.field public final listener:Lcom/momo/rtcbase/EglRenderer$FrameListener;

.field public final scale:F


# direct methods
.method public constructor <init>(Lcom/momo/rtcbase/EglRenderer$FrameListener;FLcom/momo/rtcbase/RendererCommon$GlDrawer;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/momo/rtcbase/EglRenderer$FrameListenerAndParams;->listener:Lcom/momo/rtcbase/EglRenderer$FrameListener;

    .line 5
    .line 6
    iput p2, p0, Lcom/momo/rtcbase/EglRenderer$FrameListenerAndParams;->scale:F

    .line 7
    .line 8
    iput-object p3, p0, Lcom/momo/rtcbase/EglRenderer$FrameListenerAndParams;->drawer:Lcom/momo/rtcbase/RendererCommon$GlDrawer;

    .line 9
    .line 10
    iput-boolean p4, p0, Lcom/momo/rtcbase/EglRenderer$FrameListenerAndParams;->applyFpsReduction:Z

    .line 11
    .line 12
    return-void
.end method
