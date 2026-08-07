.class Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/IBinder$DeathRecipient;


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
    iput-object p1, p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit$2;->this$0:Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public binderDied()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit$2;->this$0:Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->access$700(Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;)Landroid/os/IBinder;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit$2;->this$0:Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;

    .line 8
    .line 9
    invoke-static {v1}, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->access$600(Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;)Landroid/os/IBinder$DeathRecipient;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-interface {v0, v1, v2}, Landroid/os/IBinder;->unlinkToDeath(Landroid/os/IBinder$DeathRecipient;I)Z

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit$2;->this$0:Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->access$200(Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;)Lcom/huawei/multimedia/liteav/audiokit/interfaces/FeatureKitManager;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const/4 v1, 0x6

    .line 24
    invoke-virtual {v0, v1}, Lcom/huawei/multimedia/liteav/audiokit/interfaces/FeatureKitManager;->onCallBack(I)V

    .line 25
    .line 26
    .line 27
    const-string v0, "HwAudioKit.HwAudioKit"

    .line 28
    .line 29
    const-string v1, "service binder died"

    .line 30
    .line 31
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit$2;->this$0:Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;

    .line 35
    .line 36
    const/4 v0, 0x0

    .line 37
    invoke-static {p0, v0}, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->access$702(Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;Landroid/os/IBinder;)Landroid/os/IBinder;

    .line 38
    .line 39
    .line 40
    return-void
.end method
