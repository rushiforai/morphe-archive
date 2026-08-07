.class Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager$AuthCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$2;->this$0:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onResult(I)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "onRestartListener result: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "OVMClient"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-static {}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager;->getInstance()Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0, p0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager;->removeCallback(Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager$AuthCallback;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$2;->this$0:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;

    .line 28
    .line 29
    invoke-static {v0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->access$400(Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;)Landroid/os/Handler;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-object v2, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$2;->this$0:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;

    .line 34
    .line 35
    invoke-static {v2}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->access$300(Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;)Ljava/lang/Runnable;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$2;->this$0:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;

    .line 43
    .line 44
    invoke-static {v0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->access$500(Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;)Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$OperateStorage;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iget-boolean v0, v0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$OperateStorage;->isKTVDeviceOpen:Z

    .line 49
    .line 50
    if-eqz v0, :cond_0

    .line 51
    .line 52
    const/16 v0, 0x3e9

    .line 53
    .line 54
    if-ne p1, v0, :cond_0

    .line 55
    .line 56
    iget-object p1, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$2;->this$0:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;

    .line 57
    .line 58
    invoke-static {p1}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->access$600(Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;)Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMKaraokeMediaHelper;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    if-eqz p1, :cond_0

    .line 63
    .line 64
    const-string v0, "openKTVDevice duration restart."

    .line 65
    .line 66
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p1}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMKaraokeMediaHelper;->openKTVDevice()V

    .line 70
    .line 71
    .line 72
    iget-object p1, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$2;->this$0:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;

    .line 73
    .line 74
    invoke-static {p1}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->access$400(Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;)Landroid/os/Handler;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$2;->this$0:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;

    .line 79
    .line 80
    invoke-static {p0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->access$300(Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;)Ljava/lang/Runnable;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    const-wide/16 v0, 0xc8

    .line 85
    .line 86
    invoke-virtual {p1, p0, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 87
    .line 88
    .line 89
    :cond_0
    return-void
.end method
