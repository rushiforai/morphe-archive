.class Lio/agora/rtc2/internal/SurfaceEglRendererHelper$RenderConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/internal/SurfaceEglRendererHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "RenderConfig"
.end annotation


# instance fields
.field private volatile enableAlphaMask:Z

.field private volatile mirror:Z

.field private volatile rect:Landroid/graphics/Rect;

.field private volatile renderMode:I

.field final synthetic this$0:Lio/agora/rtc2/internal/SurfaceEglRendererHelper;

.field private volatile useVsync:Z


# direct methods
.method public constructor <init>(Lio/agora/rtc2/internal/SurfaceEglRendererHelper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lio/agora/rtc2/internal/SurfaceEglRendererHelper$RenderConfig;->this$0:Lio/agora/rtc2/internal/SurfaceEglRendererHelper;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    iput-boolean p1, p0, Lio/agora/rtc2/internal/SurfaceEglRendererHelper$RenderConfig;->mirror:Z

    .line 8
    .line 9
    const/4 p1, 0x2

    .line 10
    iput p1, p0, Lio/agora/rtc2/internal/SurfaceEglRendererHelper$RenderConfig;->renderMode:I

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    iput-boolean p1, p0, Lio/agora/rtc2/internal/SurfaceEglRendererHelper$RenderConfig;->useVsync:Z

    .line 14
    .line 15
    iput-boolean p1, p0, Lio/agora/rtc2/internal/SurfaceEglRendererHelper$RenderConfig;->enableAlphaMask:Z

    .line 16
    .line 17
    return-void
.end method

.method public constructor <init>(Lio/agora/rtc2/internal/SurfaceEglRendererHelper;ZIZ)V
    .locals 0

    .line 18
    iput-object p1, p0, Lio/agora/rtc2/internal/SurfaceEglRendererHelper$RenderConfig;->this$0:Lio/agora/rtc2/internal/SurfaceEglRendererHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    iput-boolean p2, p0, Lio/agora/rtc2/internal/SurfaceEglRendererHelper$RenderConfig;->mirror:Z

    .line 20
    iput p3, p0, Lio/agora/rtc2/internal/SurfaceEglRendererHelper$RenderConfig;->renderMode:I

    .line 21
    iput-boolean p4, p0, Lio/agora/rtc2/internal/SurfaceEglRendererHelper$RenderConfig;->useVsync:Z

    return-void
.end method

.method public constructor <init>(Lio/agora/rtc2/internal/SurfaceEglRendererHelper;ZIZLandroid/graphics/Rect;)V
    .locals 0

    .line 22
    iput-object p1, p0, Lio/agora/rtc2/internal/SurfaceEglRendererHelper$RenderConfig;->this$0:Lio/agora/rtc2/internal/SurfaceEglRendererHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-boolean p2, p0, Lio/agora/rtc2/internal/SurfaceEglRendererHelper$RenderConfig;->mirror:Z

    .line 24
    iput p3, p0, Lio/agora/rtc2/internal/SurfaceEglRendererHelper$RenderConfig;->renderMode:I

    .line 25
    iput-boolean p4, p0, Lio/agora/rtc2/internal/SurfaceEglRendererHelper$RenderConfig;->useVsync:Z

    .line 26
    iput-object p5, p0, Lio/agora/rtc2/internal/SurfaceEglRendererHelper$RenderConfig;->rect:Landroid/graphics/Rect;

    return-void
.end method


# virtual methods
.method public enableAlphaMask(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lio/agora/rtc2/internal/SurfaceEglRendererHelper$RenderConfig;->enableAlphaMask:Z

    .line 2
    .line 3
    return-void
.end method

.method public getRect()Landroid/graphics/Rect;
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/rtc2/internal/SurfaceEglRendererHelper$RenderConfig;->rect:Landroid/graphics/Rect;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRenderMode()I
    .locals 0

    .line 1
    iget p0, p0, Lio/agora/rtc2/internal/SurfaceEglRendererHelper$RenderConfig;->renderMode:I

    .line 2
    .line 3
    return p0
.end method

.method public isEnableAlphaMask()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lio/agora/rtc2/internal/SurfaceEglRendererHelper$RenderConfig;->enableAlphaMask:Z

    .line 2
    .line 3
    return p0
.end method

.method public isMirror()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lio/agora/rtc2/internal/SurfaceEglRendererHelper$RenderConfig;->mirror:Z

    .line 2
    .line 3
    return p0
.end method

.method public isUseVsync()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lio/agora/rtc2/internal/SurfaceEglRendererHelper$RenderConfig;->useVsync:Z

    .line 2
    .line 3
    return p0
.end method

.method public setMirror(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lio/agora/rtc2/internal/SurfaceEglRendererHelper$RenderConfig;->mirror:Z

    .line 2
    .line 3
    return-void
.end method

.method public setRect(Landroid/graphics/Rect;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lio/agora/rtc2/internal/SurfaceEglRendererHelper$RenderConfig;->rect:Landroid/graphics/Rect;

    .line 2
    .line 3
    return-void
.end method

.method public setRenderMode(I)V
    .locals 0

    .line 1
    iput p1, p0, Lio/agora/rtc2/internal/SurfaceEglRendererHelper$RenderConfig;->renderMode:I

    .line 2
    .line 3
    return-void
.end method

.method public setUseVsync(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lio/agora/rtc2/internal/SurfaceEglRendererHelper$RenderConfig;->useVsync:Z

    .line 2
    .line 3
    return-void
.end method
