.class Lcom/immomo/utils/sensors/SensorInfo$MyBroadcastReceiver;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/utils/sensors/SensorInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "MyBroadcastReceiver"
.end annotation


# instance fields
.field final synthetic a:Lcom/immomo/utils/sensors/SensorInfo;


# direct methods
.method private constructor <init>(Lcom/immomo/utils/sensors/SensorInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/utils/sensors/SensorInfo$MyBroadcastReceiver;->a:Lcom/immomo/utils/sensors/SensorInfo;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lcom/immomo/utils/sensors/SensorInfo;Lcom/immomo/utils/sensors/SensorInfo$a;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lcom/immomo/utils/sensors/SensorInfo$MyBroadcastReceiver;-><init>(Lcom/immomo/utils/sensors/SensorInfo;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1

    .line 1
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const/16 v0, 0x25

    .line 6
    .line 7
    new-array v0, v0, [B

    .line 8
    .line 9
    fill-array-data v0, :array_0

    .line 10
    .line 11
    .line 12
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    const/16 p2, 0x9

    .line 27
    .line 28
    new-array p2, p2, [B

    .line 29
    .line 30
    fill-array-data p2, :array_1

    .line 31
    .line 32
    .line 33
    invoke-static {p2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    invoke-virtual {p1, p2}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-eqz p1, :cond_0

    .line 42
    .line 43
    iget-object p0, p0, Lcom/immomo/utils/sensors/SensorInfo$MyBroadcastReceiver;->a:Lcom/immomo/utils/sensors/SensorInfo;

    .line 44
    .line 45
    const/4 p1, 0x1

    .line 46
    invoke-static {p0, p1}, Lcom/immomo/utils/sensors/SensorInfo;->c(Lcom/immomo/utils/sensors/SensorInfo;I)I

    .line 47
    .line 48
    .line 49
    :cond_0
    return-void

    .line 50
    nop

    .line 51
    :array_0
    .array-data 1
        0x51t
        0x8t
        0x55t
        0x45t
        0xet
        0xft
        0x54t
        0x48t
        0x59t
        0x56t
        0x13t
        0x2t
        0x47t
        0x7t
        0x43t
        0x52t
        0x4ft
        0x13t
        0x43t
        0x4t
        0x1ft
        0x56t
        0x2t
        0x12t
        0x59t
        0x9t
        0x5ft
        0x19t
        0x34t
        0x35t
        0x72t
        0x39t
        0x62t
        0x63t
        0x20t
        0x32t
        0x75t
    .end array-data

    .line 52
    .line 53
    .line 54
    .line 55
    .line 56
    .line 57
    .line 58
    .line 59
    .line 60
    .line 61
    .line 62
    .line 63
    .line 64
    .line 65
    .line 66
    .line 67
    .line 68
    .line 69
    .line 70
    .line 71
    .line 72
    .line 73
    .line 74
    nop

    .line 75
    :array_1
    .array-data 1
        0x53t
        0x9t
        0x5ft
        0x59t
        0x4t
        0x5t
        0x44t
        0x3t
        0x55t
    .end array-data
.end method
