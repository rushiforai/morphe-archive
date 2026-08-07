.class Lio/agora/rtc2/internal/SurfaceEglRendererHelper$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/agora/rtc2/internal/SurfaceEglRendererHelper;->initImpl(Lio/agora/base/internal/video/EglBase$Context;Lio/agora/rtc2/internal/SurfaceEglRendererHelper$RenderConfig;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/agora/rtc2/internal/SurfaceEglRendererHelper;


# direct methods
.method public constructor <init>(Lio/agora/rtc2/internal/SurfaceEglRendererHelper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lio/agora/rtc2/internal/SurfaceEglRendererHelper$1;->this$0:Lio/agora/rtc2/internal/SurfaceEglRendererHelper;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    const-string v0, "SurfaceEglRendererHelper"

    .line 2
    .line 3
    const-string v1, "run check Surface."

    .line 4
    .line 5
    invoke-static {v0, v1}, Lio/agora/base/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lio/agora/rtc2/internal/SurfaceEglRendererHelper$1;->this$0:Lio/agora/rtc2/internal/SurfaceEglRendererHelper;

    .line 9
    .line 10
    invoke-virtual {p0}, Lio/agora/rtc2/internal/SurfaceEglRendererHelper;->checkAndSetExistSurface()V

    .line 11
    .line 12
    .line 13
    return-void
.end method
