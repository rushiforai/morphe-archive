.class Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->uninitialize()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit$2;->a:Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    const-string v0, "HuaweiAudioKit"

    .line 2
    .line 3
    const-string v1, "uninitialize"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit$2;->a:Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->access$300(Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;)Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKaraokeFeatureKit;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const/4 v1, 0x0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit$2;->a:Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->access$300(Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;)Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKaraokeFeatureKit;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKaraokeFeatureKit;->destroy()V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit$2;->a:Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;

    .line 27
    .line 28
    invoke-static {v0, v1}, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->access$302(Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKaraokeFeatureKit;)Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKaraokeFeatureKit;

    .line 29
    .line 30
    .line 31
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit$2;->a:Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;

    .line 32
    .line 33
    invoke-static {v0}, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->access$000(Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;)Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    iget-object v0, p0, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit$2;->a:Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;

    .line 40
    .line 41
    invoke-static {v0}, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->access$000(Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;)Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0}, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->destroy()V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit$2;->a:Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;

    .line 49
    .line 50
    invoke-static {v0, v1}, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->access$002(Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;)Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;

    .line 51
    .line 52
    .line 53
    :cond_1
    iget-object p0, p0, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit$2;->a:Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;

    .line 54
    .line 55
    const/4 v0, 0x0

    .line 56
    invoke-static {p0, v0}, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->access$102(Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;Z)Z

    .line 57
    .line 58
    .line 59
    return-void
.end method
