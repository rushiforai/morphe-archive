.class public Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$DeviceConfigManager$DeviceConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$DeviceConfigManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "DeviceConfig"
.end annotation


# instance fields
.field deviceName:Ljava/lang/String;

.field priority:I

.field final synthetic this$1:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$DeviceConfigManager;

.field visible:Z


# direct methods
.method public constructor <init>(Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$DeviceConfigManager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$DeviceConfigManager$DeviceConfig;->this$1:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$DeviceConfigManager;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string p1, "DEVICE_NONE"

    .line 7
    .line 8
    iput-object p1, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$DeviceConfigManager$DeviceConfig;->deviceName:Ljava/lang/String;

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    iput-boolean p1, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$DeviceConfigManager$DeviceConfig;->visible:Z

    .line 12
    .line 13
    iput p1, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$DeviceConfigManager$DeviceConfig;->priority:I

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public getDeviceName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$DeviceConfigManager$DeviceConfig;->deviceName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPriority()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$DeviceConfigManager$DeviceConfig;->priority:I

    .line 2
    .line 3
    return p0
.end method

.method public getVisible()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$DeviceConfigManager$DeviceConfig;->visible:Z

    .line 2
    .line 3
    return p0
.end method

.method public init(Ljava/lang/String;I)Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_2

    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-gtz v1, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    invoke-static {p1}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->checkDevName(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const/4 v2, 0x1

    .line 16
    if-eq v1, v2, :cond_1

    .line 17
    .line 18
    return v0

    .line 19
    :cond_1
    iput-object p1, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$DeviceConfigManager$DeviceConfig;->deviceName:Ljava/lang/String;

    .line 20
    .line 21
    iput p2, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$DeviceConfigManager$DeviceConfig;->priority:I

    .line 22
    .line 23
    return v2

    .line 24
    :cond_2
    :goto_0
    return v0
.end method

.method public setVisible(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$DeviceConfigManager$DeviceConfig;->visible:Z

    .line 2
    .line 3
    return-void
.end method
