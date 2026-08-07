.class Lcom/tencent/rtmp/sharp/jni/AudioDeviceInterface$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/rtmp/sharp/jni/TraeAudioSession$ITraeAudioCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/rtmp/sharp/jni/AudioDeviceInterface;->call_preprocess()I
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
    iput-object p1, p0, Lcom/tencent/rtmp/sharp/jni/AudioDeviceInterface$1;->this$0:Lcom/tencent/rtmp/sharp/jni/AudioDeviceInterface;

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
    iget-object p1, p0, Lcom/tencent/rtmp/sharp/jni/AudioDeviceInterface$1;->this$0:Lcom/tencent/rtmp/sharp/jni/AudioDeviceInterface;

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
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/AudioDeviceInterface$1;->this$0:Lcom/tencent/rtmp/sharp/jni/AudioDeviceInterface;

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
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/AudioDeviceInterface$1;->this$0:Lcom/tencent/rtmp/sharp/jni/AudioDeviceInterface;

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
    .locals 2

    .line 1
    if-nez p1, :cond_1

    .line 2
    .line 3
    :try_start_0
    iget-object p1, p0, Lcom/tencent/rtmp/sharp/jni/AudioDeviceInterface$1;->this$0:Lcom/tencent/rtmp/sharp/jni/AudioDeviceInterface;

    .line 4
    .line 5
    invoke-static {p1}, Lcom/tencent/rtmp/sharp/jni/AudioDeviceInterface;->access$000(Lcom/tencent/rtmp/sharp/jni/AudioDeviceInterface;)Ljava/util/concurrent/locks/ReentrantLock;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Lcom/tencent/rtmp/sharp/jni/AudioDeviceInterface$1;->this$0:Lcom/tencent/rtmp/sharp/jni/AudioDeviceInterface;

    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    invoke-static {p1, v0}, Lcom/tencent/rtmp/sharp/jni/AudioDeviceInterface;->access$102(Lcom/tencent/rtmp/sharp/jni/AudioDeviceInterface;Z)Z

    .line 16
    .line 17
    .line 18
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    const-string p1, "TRAE"

    .line 25
    .line 26
    const-string v0, "onServiceStateUpdate signalAll"

    .line 27
    .line 28
    const/4 v1, 0x2

    .line 29
    invoke-static {p1, v1, v0}, Lcom/tencent/rtmp/sharp/jni/QLog;->e(Ljava/lang/String;ILjava/lang/String;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    iget-object p1, p0, Lcom/tencent/rtmp/sharp/jni/AudioDeviceInterface$1;->this$0:Lcom/tencent/rtmp/sharp/jni/AudioDeviceInterface;

    .line 33
    .line 34
    invoke-static {p1}, Lcom/tencent/rtmp/sharp/jni/AudioDeviceInterface;->access$200(Lcom/tencent/rtmp/sharp/jni/AudioDeviceInterface;)Ljava/util/concurrent/locks/Condition;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-interface {p1}, Ljava/util/concurrent/locks/Condition;->signalAll()V

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/AudioDeviceInterface$1;->this$0:Lcom/tencent/rtmp/sharp/jni/AudioDeviceInterface;

    .line 42
    .line 43
    invoke-static {p0}, Lcom/tencent/rtmp/sharp/jni/AudioDeviceInterface;->access$000(Lcom/tencent/rtmp/sharp/jni/AudioDeviceInterface;)Ljava/util/concurrent/locks/ReentrantLock;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 48
    .line 49
    .line 50
    :catch_0
    :cond_1
    return-void
.end method

.method public onStreamTypeUpdate(I)V
    .locals 0

    return-void
.end method

.method public onVoicecallPreprocessRes(I)V
    .locals 2

    .line 1
    :try_start_0
    iget-object p1, p0, Lcom/tencent/rtmp/sharp/jni/AudioDeviceInterface$1;->this$0:Lcom/tencent/rtmp/sharp/jni/AudioDeviceInterface;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tencent/rtmp/sharp/jni/AudioDeviceInterface;->access$000(Lcom/tencent/rtmp/sharp/jni/AudioDeviceInterface;)Ljava/util/concurrent/locks/ReentrantLock;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/tencent/rtmp/sharp/jni/AudioDeviceInterface$1;->this$0:Lcom/tencent/rtmp/sharp/jni/AudioDeviceInterface;

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    invoke-static {p1, v0}, Lcom/tencent/rtmp/sharp/jni/AudioDeviceInterface;->access$102(Lcom/tencent/rtmp/sharp/jni/AudioDeviceInterface;Z)Z

    .line 14
    .line 15
    .line 16
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    const-string p1, "TRAE"

    .line 23
    .line 24
    const-string v0, "onVoicecallPreprocessRes signalAll"

    .line 25
    .line 26
    const/4 v1, 0x2

    .line 27
    invoke-static {p1, v1, v0}, Lcom/tencent/rtmp/sharp/jni/QLog;->e(Ljava/lang/String;ILjava/lang/String;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    iget-object p1, p0, Lcom/tencent/rtmp/sharp/jni/AudioDeviceInterface$1;->this$0:Lcom/tencent/rtmp/sharp/jni/AudioDeviceInterface;

    .line 31
    .line 32
    invoke-static {p1}, Lcom/tencent/rtmp/sharp/jni/AudioDeviceInterface;->access$200(Lcom/tencent/rtmp/sharp/jni/AudioDeviceInterface;)Ljava/util/concurrent/locks/Condition;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-interface {p1}, Ljava/util/concurrent/locks/Condition;->signalAll()V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/AudioDeviceInterface$1;->this$0:Lcom/tencent/rtmp/sharp/jni/AudioDeviceInterface;

    .line 40
    .line 41
    invoke-static {p0}, Lcom/tencent/rtmp/sharp/jni/AudioDeviceInterface;->access$000(Lcom/tencent/rtmp/sharp/jni/AudioDeviceInterface;)Ljava/util/concurrent/locks/ReentrantLock;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 46
    .line 47
    .line 48
    :catch_0
    return-void
.end method
