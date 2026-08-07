.class Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->InternalNotifyDeviceListUpdate()I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;

.field final synthetic val$_bluetoothName:Ljava/lang/String;

.field final synthetic val$con:Ljava/lang/String;

.field final synthetic val$list:Ljava/util/ArrayList;

.field final synthetic val$prevCon:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$2;->this$0:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$2;->val$list:Ljava/util/ArrayList;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$2;->val$con:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$2;->val$prevCon:Ljava/lang/String;

    .line 8
    .line 9
    iput-object p5, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$2;->val$_bluetoothName:Ljava/lang/String;

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "com.tencent.sharp.ACTION_TRAEAUDIOMANAGER_NOTIFY"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 9
    .line 10
    .line 11
    const-string v1, "PARAM_OPERATION"

    .line 12
    .line 13
    const-string v2, "NOTIFY_DEVICELISTUPDATE"

    .line 14
    .line 15
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$2;->val$list:Ljava/util/ArrayList;

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    new-array v2, v2, [Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, [Ljava/lang/String;

    .line 28
    .line 29
    const-string v2, "EXTRA_DATA_AVAILABLEDEVICE_LIST"

    .line 30
    .line 31
    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;

    .line 32
    .line 33
    .line 34
    const-string v1, "EXTRA_DATA_CONNECTEDDEVICE"

    .line 35
    .line 36
    iget-object v2, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$2;->val$con:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 39
    .line 40
    .line 41
    const-string v1, "EXTRA_DATA_PREV_CONNECTEDDEVICE"

    .line 42
    .line 43
    iget-object v2, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$2;->val$prevCon:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 46
    .line 47
    .line 48
    const-string v1, "EXTRA_DATA_IF_HAS_BLUETOOTH_THIS_IS_NAME"

    .line 49
    .line 50
    iget-object v2, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$2;->val$_bluetoothName:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 53
    .line 54
    .line 55
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$2;->this$0:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;

    .line 56
    .line 57
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->_context:Landroid/content/Context;

    .line 58
    .line 59
    if-eqz p0, :cond_0

    .line 60
    .line 61
    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 62
    .line 63
    .line 64
    :cond_0
    return-void
.end method
