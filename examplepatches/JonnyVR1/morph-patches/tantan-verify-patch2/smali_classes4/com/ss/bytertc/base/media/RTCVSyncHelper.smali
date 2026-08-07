.class public Lcom/ss/bytertc/base/media/RTCVSyncHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/bytertc/base/media/RTCVSyncHelper$ChoreographerFrameCallback;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Lcom/ss/bytertc/base/media/RTCVSyncHelper$ChoreographerFrameCallback;)V
    .locals 1

    .line 1
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    const-string p0, "RTCVSyncHelper"

    .line 12
    .line 13
    const-string v0, "Choreographer.getInstance() return null"

    .line 14
    .line 15
    invoke-static {p0, v0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static registerVSyncCallback(JLjava/lang/String;)Ljava/lang/Object;
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p0, v0

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    new-instance v0, Lcom/ss/bytertc/base/media/RTCVSyncHelper$ChoreographerFrameCallback;

    .line 10
    .line 11
    invoke-direct {v0}, Lcom/ss/bytertc/base/media/RTCVSyncHelper$ChoreographerFrameCallback;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-wide p0, v0, Lcom/ss/bytertc/base/media/RTCVSyncHelper$ChoreographerFrameCallback;->nativeCallbackHandle:J

    .line 15
    .line 16
    iput-object p2, v0, Lcom/ss/bytertc/base/media/RTCVSyncHelper$ChoreographerFrameCallback;->renderTaskUUID:Ljava/lang/String;

    .line 17
    .line 18
    new-instance p0, Landroid/os/Handler;

    .line 19
    .line 20
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-direct {p0, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 25
    .line 26
    .line 27
    new-instance p1, Lcom/ss/bytertc/base/media/a;

    .line 28
    .line 29
    invoke-direct {p1, v0}, Lcom/ss/bytertc/base/media/a;-><init>(Lcom/ss/bytertc/base/media/RTCVSyncHelper$ChoreographerFrameCallback;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 33
    .line 34
    .line 35
    return-object v0
.end method

.method public static unregisterVSyncCallback(Ljava/lang/Object;)V
    .locals 1
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    instance-of v0, p0, Lcom/ss/bytertc/base/media/RTCVSyncHelper$ChoreographerFrameCallback;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/ss/bytertc/base/media/RTCVSyncHelper$ChoreographerFrameCallback;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/ss/bytertc/base/media/RTCVSyncHelper$ChoreographerFrameCallback;->resetCallback()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method
