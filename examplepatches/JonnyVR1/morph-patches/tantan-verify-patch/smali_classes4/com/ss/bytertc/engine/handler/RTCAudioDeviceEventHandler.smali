.class public Lcom/ss/bytertc/engine/handler/RTCAudioDeviceEventHandler;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "RtcAudioDeviceEventHandler"


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


# virtual methods
.method public OnLoopbackAudioVolumeIndication(I)V
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    return-void
.end method

.method public onRecordingAudioVolumeIndication(I)V
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    invoke-static {}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->getAudioDeviceManagerEvent()Lcom/ss/bytertc/engine/IRTCAudioDeviceManagerEx$IRTCAudioDeviceEventHandler;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Lcom/ss/bytertc/engine/IRTCAudioDeviceManagerEx$IRTCAudioDeviceEventHandler;->onRecordingAudioVolumeIndication(I)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method
