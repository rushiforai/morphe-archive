.class public Lcom/ss/bytertc/base/media/ChoreographerFrameCallback;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/Choreographer$FrameCallback;


# instance fields
.field public currentSurface:Landroid/view/Surface;

.field public nativeCallbackHandle:J

.field public renderTaskUUID:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/ss/bytertc/base/media/ChoreographerFrameCallback;->nativeCallbackHandle:J

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public doFrame(J)V
    .locals 2

    .line 1
    iget-wide p1, p0, Lcom/ss/bytertc/base/media/ChoreographerFrameCallback;->nativeCallbackHandle:J

    .line 2
    .line 3
    const-wide/16 v0, 0x0

    .line 4
    .line 5
    cmp-long p1, p1, v0

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p1, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/ss/bytertc/base/media/ChoreographerFrameCallback;->currentSurface:Landroid/view/Surface;

    .line 17
    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    iget-wide v0, p0, Lcom/ss/bytertc/base/media/ChoreographerFrameCallback;->nativeCallbackHandle:J

    .line 21
    .line 22
    iget-object p0, p0, Lcom/ss/bytertc/base/media/ChoreographerFrameCallback;->renderTaskUUID:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {v0, v1, p1, p0}, Lcom/ss/bytertc/base/media/RTCNativeFunctions;->nativeNotifyChoreographerDoFrame(JLjava/lang/Object;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public resetCallback()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/ss/bytertc/base/media/ChoreographerFrameCallback;->nativeCallbackHandle:J

    .line 4
    .line 5
    return-void
.end method
