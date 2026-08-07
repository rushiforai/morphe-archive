.class public Lcom/ss/bytertc/engine/handler/RTCExternalVideoEncoderEventHandler;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "RTCExternalVideoEncoderEventHandler"


# instance fields
.field private mRtcVideoImpl:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/ss/bytertc/engine/handler/RTCExternalVideoEncoderEventHandler;->mRtcVideoImpl:Ljava/lang/ref/WeakReference;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public OnActiveVideoLayer(IIZ)V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/handler/RTCExternalVideoEncoderEventHandler;->mRtcVideoImpl:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->getExternalVideoEncoderEventHandler()Lcom/ss/bytertc/engine/handler/IExternalVideoEncoderEventHandler;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-static {p1}, Lcom/ss/bytertc/engine/data/StreamIndex;->fromId(I)Lcom/ss/bytertc/engine/data/StreamIndex;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1, p2, p3}, Lcom/ss/bytertc/engine/handler/IExternalVideoEncoderEventHandler;->onActiveVideoLayer(Lcom/ss/bytertc/engine/data/StreamIndex;IZ)V

    .line 24
    .line 25
    .line 26
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCExternalVideoEncoderEventHandler;->mRtcVideoImpl:Ljava/lang/ref/WeakReference;

    .line 27
    .line 28
    if-eqz p0, :cond_1

    .line 29
    .line 30
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    check-cast p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;

    .line 35
    .line 36
    if-eqz p0, :cond_1

    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->getExternalVideoEncoderEventHandler()Lcom/ss/bytertc/engine/handler/IExternalVideoEncoderEventHandler;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    if-eqz p0, :cond_1

    .line 43
    .line 44
    invoke-static {p1}, Lcom/ss/bytertc/engine/data/StreamIndex;->fromId(I)Lcom/ss/bytertc/engine/data/StreamIndex;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {p0, p1, p2, p3}, Lcom/ss/bytertc/engine/handler/IExternalVideoEncoderEventHandler;->onActiveVideoLayer(Lcom/ss/bytertc/engine/data/StreamIndex;IZ)V

    .line 49
    .line 50
    .line 51
    :cond_1
    return-void
.end method

.method public OnRateUpdate(IIII)V
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCExternalVideoEncoderEventHandler;->mRtcVideoImpl:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->getExternalVideoEncoderEventHandler()Lcom/ss/bytertc/engine/handler/IExternalVideoEncoderEventHandler;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    invoke-static {p1}, Lcom/ss/bytertc/engine/data/StreamIndex;->fromId(I)Lcom/ss/bytertc/engine/data/StreamIndex;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/ss/bytertc/engine/handler/IExternalVideoEncoderEventHandler;->onRateUpdate(Lcom/ss/bytertc/engine/data/StreamIndex;III)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public OnRequestKeyFrame(II)V
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCExternalVideoEncoderEventHandler;->mRtcVideoImpl:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->getExternalVideoEncoderEventHandler()Lcom/ss/bytertc/engine/handler/IExternalVideoEncoderEventHandler;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    invoke-static {p1}, Lcom/ss/bytertc/engine/data/StreamIndex;->fromId(I)Lcom/ss/bytertc/engine/data/StreamIndex;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0, p1, p2}, Lcom/ss/bytertc/engine/handler/IExternalVideoEncoderEventHandler;->onRequestKeyFrame(Lcom/ss/bytertc/engine/data/StreamIndex;I)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public OnStart(I)V
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCExternalVideoEncoderEventHandler;->mRtcVideoImpl:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->getExternalVideoEncoderEventHandler()Lcom/ss/bytertc/engine/handler/IExternalVideoEncoderEventHandler;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    invoke-static {p1}, Lcom/ss/bytertc/engine/data/StreamIndex;->fromId(I)Lcom/ss/bytertc/engine/data/StreamIndex;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0, p1}, Lcom/ss/bytertc/engine/handler/IExternalVideoEncoderEventHandler;->onStart(Lcom/ss/bytertc/engine/data/StreamIndex;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public OnStop(I)V
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCExternalVideoEncoderEventHandler;->mRtcVideoImpl:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->getExternalVideoEncoderEventHandler()Lcom/ss/bytertc/engine/handler/IExternalVideoEncoderEventHandler;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    invoke-static {p1}, Lcom/ss/bytertc/engine/data/StreamIndex;->fromId(I)Lcom/ss/bytertc/engine/data/StreamIndex;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0, p1}, Lcom/ss/bytertc/engine/handler/IExternalVideoEncoderEventHandler;->onStop(Lcom/ss/bytertc/engine/data/StreamIndex;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method
