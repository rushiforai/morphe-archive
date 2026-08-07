.class Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->initialize(Landroid/content/Context;Lcom/tencent/liteav/audio/impl/earmonitor/a;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/liteav/audio/impl/earmonitor/a;

.field final synthetic b:Landroid/content/Context;

.field final synthetic c:Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;Lcom/tencent/liteav/audio/impl/earmonitor/a;Landroid/content/Context;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit$1;->c:Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit$1;->a:Lcom/tencent/liteav/audio/impl/earmonitor/a;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit$1;->b:Landroid/content/Context;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit$1;->c:Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->access$000(Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;)Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "HuaweiAudioKit"

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const-string p0, "it\'s already initialized."

    .line 12
    .line 13
    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    const-string v0, "start initialize audio kit"

    .line 18
    .line 19
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit$1;->c:Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;

    .line 23
    .line 24
    const/4 v1, 0x1

    .line 25
    invoke-static {v0, v1}, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->access$102(Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;Z)Z

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit$1;->c:Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;

    .line 29
    .line 30
    iget-object v1, p0, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit$1;->a:Lcom/tencent/liteav/audio/impl/earmonitor/a;

    .line 31
    .line 32
    invoke-static {v0, v1}, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->access$202(Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;Lcom/tencent/liteav/audio/impl/earmonitor/a;)Lcom/tencent/liteav/audio/impl/earmonitor/a;

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit$1;->c:Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;

    .line 36
    .line 37
    new-instance v1, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;

    .line 38
    .line 39
    iget-object v2, p0, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit$1;->b:Landroid/content/Context;

    .line 40
    .line 41
    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    iget-object v3, p0, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit$1;->c:Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;

    .line 46
    .line 47
    invoke-direct {v1, v2, v3}, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;-><init>(Landroid/content/Context;Lcom/huawei/multimedia/liteav/audiokit/interfaces/IAudioKitCallback;)V

    .line 48
    .line 49
    .line 50
    invoke-static {v0, v1}, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->access$002(Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;)Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;

    .line 51
    .line 52
    .line 53
    iget-object p0, p0, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit$1;->c:Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;

    .line 54
    .line 55
    invoke-static {p0}, Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;->access$000(Lcom/tencent/liteav/audio/impl/earmonitor/HuaweiAudioKit;)Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {p0}, Lcom/huawei/multimedia/liteav/audiokit/interfaces/HwAudioKit;->initialize()V

    .line 60
    .line 61
    .line 62
    return-void
.end method
