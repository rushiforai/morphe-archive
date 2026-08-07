.class public Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/iliveroom/TXILiveRoomDefine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TXILiveRoomConfig"
.end annotation


# instance fields
.field public audioEncQuality:I

.field public autoSampleBufferSize:Z

.field public cdnVideoCodecType:I

.field public customModeType:I

.field public homeOrientation:I

.field public pauseFps:I

.field public pauseImg:Landroid/graphics/Bitmap;

.field public renderMode:I

.field public sampleBufferSize:Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveSize;

.field public videoBitrate:I

.field public videoFps:I

.field public videoResolution:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomConfig;->customModeType:I

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomConfig;->autoSampleBufferSize:Z

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    iput v1, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomConfig;->homeOrientation:I

    .line 11
    .line 12
    iput v0, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomConfig;->renderMode:I

    .line 13
    .line 14
    const/16 v0, 0xf

    .line 15
    .line 16
    iput v0, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomConfig;->videoFps:I

    .line 17
    .line 18
    const/16 v0, 0x258

    .line 19
    .line 20
    iput v0, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomConfig;->videoBitrate:I

    .line 21
    .line 22
    iput v1, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomConfig;->videoResolution:I

    .line 23
    .line 24
    const/4 v0, 0x2

    .line 25
    iput v0, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomConfig;->audioEncQuality:I

    .line 26
    .line 27
    const/4 v0, 0x5

    .line 28
    iput v0, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomConfig;->pauseFps:I

    .line 29
    .line 30
    const/4 v0, 0x0

    .line 31
    iput-object v0, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomConfig;->pauseImg:Landroid/graphics/Bitmap;

    .line 32
    .line 33
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "TXILiveRoomConfig{customModeType="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomConfig;->customModeType:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", sampleBufferSize="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomConfig;->sampleBufferSize:Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveSize;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ", autoSampleBufferSize="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-boolean v1, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomConfig;->autoSampleBufferSize:Z

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ", homeOrientation="

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget v1, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomConfig;->homeOrientation:I

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, ", renderMode="

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget v1, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomConfig;->renderMode:I

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, ", videoFps="

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget v1, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomConfig;->videoFps:I

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v1, ", videoBitrate="

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget v1, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomConfig;->videoBitrate:I

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string v1, ", videoResolution="

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    iget v1, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomConfig;->videoResolution:I

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string v1, ", audioEncQuality="

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    iget v1, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomConfig;->audioEncQuality:I

    .line 89
    .line 90
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    const-string v1, ", pauseFps="

    .line 94
    .line 95
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    iget v1, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomConfig;->pauseFps:I

    .line 99
    .line 100
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    const-string v1, ", pauseImg="

    .line 104
    .line 105
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    iget-object p0, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomConfig;->pauseImg:Landroid/graphics/Bitmap;

    .line 109
    .line 110
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    const/16 p0, 0x7d

    .line 114
    .line 115
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    return-object p0
.end method
