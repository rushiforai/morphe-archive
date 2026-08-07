.class Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$OperateStorage;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "OperateStorage"
.end annotation


# instance fields
.field equalizerTypeParam:I

.field isKTVDeviceOpen:Z

.field listenRecordSameParam:I

.field micVolumeParam:I

.field mixSoundTypeParam:I

.field playFeedbackParam:I


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public synthetic constructor <init>(Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$1;)V
    .locals 0

    .line 5
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$OperateStorage;-><init>()V

    return-void
.end method


# virtual methods
.method public reset()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$OperateStorage;->listenRecordSameParam:I

    .line 3
    .line 4
    iput v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$OperateStorage;->playFeedbackParam:I

    .line 5
    .line 6
    const/4 v1, 0x6

    .line 7
    iput v1, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$OperateStorage;->micVolumeParam:I

    .line 8
    .line 9
    iput v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$OperateStorage;->mixSoundTypeParam:I

    .line 10
    .line 11
    iput v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$OperateStorage;->equalizerTypeParam:I

    .line 12
    .line 13
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "isKTVDeviceOpen: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-boolean v1, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$OperateStorage;->isKTVDeviceOpen:Z

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", recordSame: "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget v1, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$OperateStorage;->listenRecordSameParam:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ", playFeedback: "

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget v1, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$OperateStorage;->playFeedbackParam:I

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ", micVolume: "

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget v1, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$OperateStorage;->micVolumeParam:I

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, ", mix: "

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget v1, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$OperateStorage;->mixSoundTypeParam:I

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, ", eq: "

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget p0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$OperateStorage;->equalizerTypeParam:I

    .line 59
    .line 60
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    return-object p0
.end method
