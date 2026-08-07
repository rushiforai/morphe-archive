.class Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "MyBluetoothDevice"
.end annotation


# instance fields
.field private a2dpConnected:Z

.field private bluetoothDevice:Landroid/bluetooth/BluetoothDevice;

.field private extraInfo:Ljava/lang/String;

.field private headsetConnected:Z

.field private name:Ljava/lang/String;

.field final synthetic this$0:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;Landroid/bluetooth/BluetoothDevice;)V
    .locals 0

    .line 18
    iput-object p1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;->this$0:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    const-string p1, ""

    iput-object p1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;->extraInfo:Ljava/lang/String;

    const/4 p1, 0x0

    .line 20
    iput-boolean p1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;->headsetConnected:Z

    .line 21
    iput-boolean p1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;->a2dpConnected:Z

    .line 22
    iput-object p2, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;->bluetoothDevice:Landroid/bluetooth/BluetoothDevice;

    return-void
.end method

.method public constructor <init>(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;->this$0:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string p1, ""

    .line 7
    .line 8
    iput-object p1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;->extraInfo:Ljava/lang/String;

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    iput-boolean p1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;->headsetConnected:Z

    .line 12
    .line 13
    iput-boolean p1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;->a2dpConnected:Z

    .line 14
    .line 15
    iput-object p2, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;->name:Ljava/lang/String;

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public appendDeviceInfo(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, " ,from:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string p1, " "

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iget-object p2, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;->extraInfo:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {p2, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    if-nez p2, :cond_0

    .line 30
    .line 31
    new-instance p2, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;->extraInfo:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    iput-object p1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;->extraInfo:Ljava/lang/String;

    .line 49
    .line 50
    :cond_0
    return-void
.end method

.method public getAttrsString()Ljava/lang/String;
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "name:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;->getName()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string v0, ", headset:"

    .line 28
    .line 29
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    iget-boolean v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;->headsetConnected:Z

    .line 33
    .line 34
    const-string v2, "false"

    .line 35
    .line 36
    const-string v3, "true"

    .line 37
    .line 38
    if-eqz v0, :cond_0

    .line 39
    .line 40
    move-object v0, v3

    .line 41
    goto :goto_0

    .line 42
    :cond_0
    move-object v0, v2

    .line 43
    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    new-instance v1, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    const-string v0, ", a2dp:"

    .line 59
    .line 60
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    iget-boolean v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;->a2dpConnected:Z

    .line 64
    .line 65
    if-eqz v0, :cond_1

    .line 66
    .line 67
    move-object v2, v3

    .line 68
    :cond_1
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    new-instance v1, Ljava/lang/StringBuilder;

    .line 76
    .line 77
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;->extraInfo:Ljava/lang/String;

    .line 84
    .line 85
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    return-object p0
.end method

.method public getBluetoothConnected(I)Z
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, v0, :cond_0

    .line 3
    .line 4
    iget-boolean p0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;->headsetConnected:Z

    .line 5
    .line 6
    return p0

    .line 7
    :cond_0
    const/4 v0, 0x2

    .line 8
    if-ne p1, v0, :cond_1

    .line 9
    .line 10
    iget-boolean p0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;->a2dpConnected:Z

    .line 11
    .line 12
    return p0

    .line 13
    :cond_1
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;->bluetoothDevice:Landroid/bluetooth/BluetoothDevice;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;->name:Ljava/lang/String;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    const-string p0, "bluetooth-headset"

    .line 9
    .line 10
    return-object p0
.end method

.method public setBluetoothConnected(IZ)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, v0, :cond_0

    .line 3
    .line 4
    iput-boolean p2, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;->headsetConnected:Z

    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    const/4 v0, 0x2

    .line 8
    if-ne p1, v0, :cond_1

    .line 9
    .line 10
    iput-boolean p2, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;->a2dpConnected:Z

    .line 11
    .line 12
    :cond_1
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;->getName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
