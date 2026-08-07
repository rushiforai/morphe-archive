.class Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;


# direct methods
.method public constructor <init>(Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit$1;->this$0:Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit$1;->this$0:Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;

    .line 2
    .line 3
    invoke-static {p2}, Lcom/huawei/multimedia/liteav/audioengine/IHwAudioEngine$Stub;->asInterface(Landroid/os/IBinder;)Lcom/huawei/multimedia/liteav/audioengine/IHwAudioEngine;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p1, v0}, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->access$002(Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;Lcom/huawei/multimedia/liteav/audioengine/IHwAudioEngine;)Lcom/huawei/multimedia/liteav/audioengine/IHwAudioEngine;

    .line 8
    .line 9
    .line 10
    const-string p1, "onServiceConnected"

    .line 11
    .line 12
    const-string v0, "HwAudioKit.HwAudioKit"

    .line 13
    .line 14
    invoke-static {v0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit$1;->this$0:Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;

    .line 18
    .line 19
    invoke-static {p1}, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->access$000(Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;)Lcom/huawei/multimedia/liteav/audioengine/IHwAudioEngine;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    iget-object p1, p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit$1;->this$0:Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;

    .line 26
    .line 27
    const/4 v1, 0x1

    .line 28
    invoke-static {p1, v1}, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->access$102(Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;Z)Z

    .line 29
    .line 30
    .line 31
    const-string p1, "onServiceConnected, mIHwAudioEngine is not null"

    .line 32
    .line 33
    invoke-static {v0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit$1;->this$0:Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;

    .line 37
    .line 38
    invoke-static {p1}, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->access$200(Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;)Lcom/huawei/multimedia/liteav/audiokit/interfaces/FeatureKitManager;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    const/4 v0, 0x0

    .line 43
    invoke-virtual {p1, v0}, Lcom/huawei/multimedia/liteav/audiokit/interfaces/FeatureKitManager;->onCallBack(I)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit$1;->this$0:Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;

    .line 47
    .line 48
    invoke-static {p1}, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->access$300(Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;)Landroid/content/Context;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    const-string v1, "1.0.1"

    .line 57
    .line 58
    invoke-static {p1, v0, v1}, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->access$400(Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    iget-object p0, p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit$1;->this$0:Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;

    .line 62
    .line 63
    invoke-static {p0, p2}, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->access$500(Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;Landroid/os/IBinder;)V

    .line 64
    .line 65
    .line 66
    :cond_0
    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 1

    .line 1
    const-string p1, "HwAudioKit.HwAudioKit"

    .line 2
    .line 3
    const-string v0, "onServiceDisconnected"

    .line 4
    .line 5
    invoke-static {p1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit$1;->this$0:Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-static {p1, v0}, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->access$002(Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;Lcom/huawei/multimedia/liteav/audioengine/IHwAudioEngine;)Lcom/huawei/multimedia/liteav/audioengine/IHwAudioEngine;

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit$1;->this$0:Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    invoke-static {p1, v0}, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->access$102(Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;Z)Z

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit$1;->this$0:Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;

    .line 21
    .line 22
    invoke-static {p0}, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->access$200(Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;)Lcom/huawei/multimedia/liteav/audiokit/interfaces/FeatureKitManager;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const/4 p1, 0x4

    .line 27
    invoke-virtual {p0, p1}, Lcom/huawei/multimedia/liteav/audiokit/interfaces/FeatureKitManager;->onCallBack(I)V

    .line 28
    .line 29
    .line 30
    return-void
.end method
