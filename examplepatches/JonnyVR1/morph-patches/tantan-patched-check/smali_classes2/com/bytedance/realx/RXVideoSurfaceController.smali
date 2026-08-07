.class public Lcom/bytedance/realx/RXVideoSurfaceController;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bytedance/realx/RXVideoSurfaceController$RXSurfaceListener;
    }
.end annotation


# static fields
.field private static instance:Lcom/bytedance/realx/RXVideoSurfaceController;


# instance fields
.field private mSurfaceLisener:Lcom/bytedance/realx/RXVideoSurfaceController$RXSurfaceListener;

.field private usePassSurfaceMode:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/bytedance/realx/RXVideoSurfaceController;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/bytedance/realx/RXVideoSurfaceController;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/bytedance/realx/RXVideoSurfaceController;->instance:Lcom/bytedance/realx/RXVideoSurfaceController;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/bytedance/realx/RXVideoSurfaceController;->usePassSurfaceMode:Z

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-object v0, p0, Lcom/bytedance/realx/RXVideoSurfaceController;->mSurfaceLisener:Lcom/bytedance/realx/RXVideoSurfaceController$RXSurfaceListener;

    .line 9
    .line 10
    return-void
.end method

.method public static getInstance()Lcom/bytedance/realx/RXVideoSurfaceController;
    .locals 1
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    sget-object v0, Lcom/bytedance/realx/RXVideoSurfaceController;->instance:Lcom/bytedance/realx/RXVideoSurfaceController;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public setPassSurfaceMode(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/bytedance/realx/RXVideoSurfaceController;->usePassSurfaceMode:Z

    .line 2
    .line 3
    return-void
.end method

.method public setSurface(Landroid/view/Surface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/RXVideoSurfaceController;->mSurfaceLisener:Lcom/bytedance/realx/RXVideoSurfaceController$RXSurfaceListener;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/bytedance/realx/RXVideoSurfaceController$RXSurfaceListener;->onSurfaceAvailable(Landroid/view/Surface;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setSurfaceListener(Lcom/bytedance/realx/RXVideoSurfaceController$RXSurfaceListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/bytedance/realx/RXVideoSurfaceController;->mSurfaceLisener:Lcom/bytedance/realx/RXVideoSurfaceController$RXSurfaceListener;

    .line 2
    .line 3
    return-void
.end method

.method public usePassSurfaceMode()Z
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/bytedance/realx/RXVideoSurfaceController;->usePassSurfaceMode:Z

    .line 2
    .line 3
    return p0
.end method
