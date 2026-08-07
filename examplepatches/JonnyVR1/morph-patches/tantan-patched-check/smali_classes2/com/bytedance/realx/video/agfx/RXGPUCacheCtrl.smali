.class public Lcom/bytedance/realx/video/agfx/RXGPUCacheCtrl;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static instance:Lcom/bytedance/realx/video/agfx/RXGPUCacheCtrl;


# instance fields
.field private nativeHandle:J


# direct methods
.method private constructor <init>(J)V
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, Lcom/bytedance/realx/video/agfx/RXGPUCacheCtrl;->nativeHandle:J

    .line 5
    .line 6
    return-void
.end method

.method public static getInstance()Lcom/bytedance/realx/video/agfx/RXGPUCacheCtrl;
    .locals 1

    .line 1
    invoke-static {}, Lcom/bytedance/realx/video/agfx/RXGPUCacheCtrl;->nativeGetInstance()Lcom/bytedance/realx/video/agfx/RXGPUCacheCtrl;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Lcom/bytedance/realx/video/agfx/RXGPUCacheCtrl;->instance:Lcom/bytedance/realx/video/agfx/RXGPUCacheCtrl;

    .line 6
    .line 7
    return-object v0
.end method

.method private static native nativeBind(J)V
.end method

.method private static native nativeGetInstance()Lcom/bytedance/realx/video/agfx/RXGPUCacheCtrl;
.end method

.method private static native nativeUnBind(J)V
.end method


# virtual methods
.method public bind()V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/bytedance/realx/video/agfx/RXGPUCacheCtrl;->nativeHandle:J

    .line 2
    .line 3
    invoke-static {v0, v1}, Lcom/bytedance/realx/video/agfx/RXGPUCacheCtrl;->nativeBind(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public unbind()V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/bytedance/realx/video/agfx/RXGPUCacheCtrl;->nativeHandle:J

    .line 2
    .line 3
    invoke-static {v0, v1}, Lcom/bytedance/realx/video/agfx/RXGPUCacheCtrl;->nativeUnBind(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
