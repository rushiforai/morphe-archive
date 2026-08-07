.class final Lcom/tencent/rtmp/sharp/jni/AudioSessionDuplicate$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/rtmp/sharp/jni/TraeAudioSession$ITraeAudioCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/rtmp/sharp/jni/AudioSessionDuplicate;->NewAudioSessionDuplicate(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
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
    invoke-static {p1}, Lcom/tencent/rtmp/sharp/jni/AudioSessionDuplicate;->access$302([Ljava/lang/String;)[Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/AudioSessionDuplicate;->access$400()Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-static {p2}, Lcom/tencent/rtmp/sharp/jni/AudioSessionDuplicate;->access$500(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public onGetConnectedDeviceRes(ILjava/lang/String;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    invoke-static {p2}, Lcom/tencent/rtmp/sharp/jni/AudioSessionDuplicate;->access$500(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
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
    invoke-static {p2}, Lcom/tencent/rtmp/sharp/jni/AudioSessionDuplicate;->access$302([Ljava/lang/String;)[Ljava/lang/String;

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
    .locals 1

    .line 1
    if-nez p1, :cond_1

    .line 2
    .line 3
    :try_start_0
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/AudioSessionDuplicate;->access$000()Ljava/util/concurrent/locks/ReentrantLock;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    invoke-static {p0}, Lcom/tencent/rtmp/sharp/jni/AudioSessionDuplicate;->access$102(Z)Z

    .line 12
    .line 13
    .line 14
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    const-string p0, "TRAE"

    .line 21
    .line 22
    const-string p1, "onServiceStateUpdate signalAll"

    .line 23
    .line 24
    const/4 v0, 0x2

    .line 25
    invoke-static {p0, v0, p1}, Lcom/tencent/rtmp/sharp/jni/QLog;->e(Ljava/lang/String;ILjava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/AudioSessionDuplicate;->access$200()Ljava/util/concurrent/locks/Condition;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-interface {p0}, Ljava/util/concurrent/locks/Condition;->signalAll()V

    .line 33
    .line 34
    .line 35
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/AudioSessionDuplicate;->access$000()Ljava/util/concurrent/locks/ReentrantLock;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 40
    .line 41
    .line 42
    :catch_0
    :cond_1
    return-void
.end method

.method public onStreamTypeUpdate(I)V
    .locals 0

    return-void
.end method

.method public onVoicecallPreprocessRes(I)V
    .locals 1

    .line 1
    :try_start_0
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/AudioSessionDuplicate;->access$000()Ljava/util/concurrent/locks/ReentrantLock;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    invoke-static {p0}, Lcom/tencent/rtmp/sharp/jni/AudioSessionDuplicate;->access$102(Z)Z

    .line 10
    .line 11
    .line 12
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    const-string p0, "TRAE"

    .line 19
    .line 20
    const-string p1, "onVoicecallPreprocessRes signalAll"

    .line 21
    .line 22
    const/4 v0, 0x2

    .line 23
    invoke-static {p0, v0, p1}, Lcom/tencent/rtmp/sharp/jni/QLog;->e(Ljava/lang/String;ILjava/lang/String;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/AudioSessionDuplicate;->access$200()Ljava/util/concurrent/locks/Condition;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-interface {p0}, Ljava/util/concurrent/locks/Condition;->signalAll()V

    .line 31
    .line 32
    .line 33
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/AudioSessionDuplicate;->access$000()Ljava/util/concurrent/locks/ReentrantLock;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 38
    .line 39
    .line 40
    :catch_0
    return-void
.end method
