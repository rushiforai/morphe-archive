.class Lcom/tencent/rtmp/sharp/jni/AudioDeviceInterface$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/rtmp/sharp/jni/TraeAudioSession$ITraeAudioCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/rtmp/sharp/jni/AudioDeviceInterface;->initTRAEAudioManager()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tencent/rtmp/sharp/jni/AudioDeviceInterface;


# direct methods
.method public constructor <init>(Lcom/tencent/rtmp/sharp/jni/AudioDeviceInterface;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/rtmp/sharp/jni/AudioDeviceInterface$3;->this$0:Lcom/tencent/rtmp/sharp/jni/AudioDeviceInterface;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAudioRouteSwitchEnd(Ljava/lang/String;J)V
    .locals 0

    return-void
.end method

.method public onAudioRouteSwitchStart(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public onConnectDeviceRes(ILjava/lang/String;Z)V
    .locals 0

    return-void
.end method

.method public onDeviceChangabledUpdate(Z)V
    .locals 0

    return-void
.end method

.method public onDeviceListUpdate([Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tencent/rtmp/sharp/jni/AudioDeviceInterface;->access$302([Ljava/lang/String;)[Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/tencent/rtmp/sharp/jni/AudioDeviceInterface$3;->this$0:Lcom/tencent/rtmp/sharp/jni/AudioDeviceInterface;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/tencent/rtmp/sharp/jni/AudioDeviceInterface;->access$400(Lcom/tencent/rtmp/sharp/jni/AudioDeviceInterface;)Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/AudioDeviceInterface$3;->this$0:Lcom/tencent/rtmp/sharp/jni/AudioDeviceInterface;

    .line 13
    .line 14
    invoke-static {p0, p2}, Lcom/tencent/rtmp/sharp/jni/AudioDeviceInterface;->access$500(Lcom/tencent/rtmp/sharp/jni/AudioDeviceInterface;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public onGetConnectedDeviceRes(ILjava/lang/String;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/AudioDeviceInterface$3;->this$0:Lcom/tencent/rtmp/sharp/jni/AudioDeviceInterface;

    .line 4
    .line 5
    invoke-static {p0, p2}, Lcom/tencent/rtmp/sharp/jni/AudioDeviceInterface;->access$500(Lcom/tencent/rtmp/sharp/jni/AudioDeviceInterface;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public onGetConnectingDeviceRes(ILjava/lang/String;)V
    .locals 0

    return-void
.end method

.method public onGetDeviceListRes(I[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p2}, Lcom/tencent/rtmp/sharp/jni/AudioDeviceInterface;->access$302([Ljava/lang/String;)[Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onGetStreamTypeRes(II)V
    .locals 0

    return-void
.end method

.method public onIsDeviceChangabledRes(IZ)V
    .locals 0

    return-void
.end method

.method public onRingCompletion(ILjava/lang/String;)V
    .locals 0

    return-void
.end method

.method public onServiceStateUpdate(Z)V
    .locals 0

    return-void
.end method

.method public onStreamTypeUpdate(I)V
    .locals 0

    return-void
.end method

.method public onVoicecallPreprocessRes(I)V
    .locals 0

    return-void
.end method
