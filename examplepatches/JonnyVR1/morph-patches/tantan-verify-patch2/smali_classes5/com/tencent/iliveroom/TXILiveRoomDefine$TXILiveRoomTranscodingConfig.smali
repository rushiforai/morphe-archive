.class public Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/iliveroom/TXILiveRoomDefine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TXILiveRoomTranscodingConfig"
.end annotation


# instance fields
.field public audioBitrate:I

.field public audioChannels:I

.field public audioSampleRate:I

.field public backgroundPicUrl:Ljava/lang/String;

.field public enableBFrame:Z

.field public mixExtraInfo:Ljava/lang/String;

.field public mixUsers:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomMixUser;",
            ">;"
        }
    .end annotation
.end field

.field public videoBitrate:I

.field public videoCodecType:I

.field public videoFramerate:I

.field public videoGOP:I

.field public videoHeight:I

.field public videoWidth:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 93
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    iget v0, p1, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;->videoWidth:I

    .line 7
    .line 8
    iput v0, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;->videoWidth:I

    .line 9
    .line 10
    iget v0, p1, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;->videoHeight:I

    .line 11
    .line 12
    iput v0, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;->videoHeight:I

    .line 13
    .line 14
    iget v0, p1, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;->videoBitrate:I

    .line 15
    .line 16
    iput v0, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;->videoBitrate:I

    .line 17
    .line 18
    iget v0, p1, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;->videoFramerate:I

    .line 19
    .line 20
    iput v0, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;->videoFramerate:I

    .line 21
    .line 22
    iget v0, p1, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;->videoGOP:I

    .line 23
    .line 24
    iput v0, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;->videoGOP:I

    .line 25
    .line 26
    iget v0, p1, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;->videoCodecType:I

    .line 27
    .line 28
    iput v0, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;->videoCodecType:I

    .line 29
    .line 30
    iget-boolean v0, p1, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;->enableBFrame:Z

    .line 31
    .line 32
    iput-boolean v0, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;->enableBFrame:Z

    .line 33
    .line 34
    iget v0, p1, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;->audioSampleRate:I

    .line 35
    .line 36
    iput v0, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;->audioSampleRate:I

    .line 37
    .line 38
    iget v0, p1, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;->audioBitrate:I

    .line 39
    .line 40
    iput v0, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;->audioBitrate:I

    .line 41
    .line 42
    iget v0, p1, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;->audioChannels:I

    .line 43
    .line 44
    iput v0, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;->audioChannels:I

    .line 45
    .line 46
    iget-object v0, p1, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;->backgroundPicUrl:Ljava/lang/String;

    .line 47
    .line 48
    iput-object v0, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;->backgroundPicUrl:Ljava/lang/String;

    .line 49
    .line 50
    iget-object v0, p1, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;->mixExtraInfo:Ljava/lang/String;

    .line 51
    .line 52
    iput-object v0, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;->mixExtraInfo:Ljava/lang/String;

    .line 53
    .line 54
    new-instance v0, Ljava/util/ArrayList;

    .line 55
    .line 56
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 57
    .line 58
    .line 59
    iput-object v0, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;->mixUsers:Ljava/util/ArrayList;

    .line 60
    .line 61
    iget-object p1, p1, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;->mixUsers:Ljava/util/ArrayList;

    .line 62
    .line 63
    if-eqz p1, :cond_0

    .line 64
    .line 65
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-eqz v0, :cond_0

    .line 74
    .line 75
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    check-cast v0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomMixUser;

    .line 80
    .line 81
    iget-object v1, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;->mixUsers:Ljava/util/ArrayList;

    .line 82
    .line 83
    new-instance v2, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomMixUser;

    .line 84
    .line 85
    invoke-direct {v2, v0}, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomMixUser;-><init>(Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomMixUser;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_0
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "TXILiveRoomTranscodingConfig{videoWidth="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;->videoWidth:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", videoHeight="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget v1, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;->videoHeight:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ", videoBitrate="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget v1, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;->videoBitrate:I

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ", videoFramerate="

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget v1, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;->videoFramerate:I

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, ", videoGOP="

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget v1, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;->videoGOP:I

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, ", videoCodecType="

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget v1, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;->videoCodecType:I

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v1, ", enableBFrame="

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget-boolean v1, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;->enableBFrame:Z

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string v1, ", audioSampleRate="

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    iget v1, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;->audioSampleRate:I

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string v1, ", audioBitrate="

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    iget v1, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;->audioBitrate:I

    .line 89
    .line 90
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    const-string v1, ", audioChannels="

    .line 94
    .line 95
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    iget v1, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;->audioChannels:I

    .line 99
    .line 100
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    const-string v1, ", backgroundPicUrl=\'"

    .line 104
    .line 105
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    iget-object v1, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;->backgroundPicUrl:Ljava/lang/String;

    .line 109
    .line 110
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    const-string v1, "\', mixExtraInfo=\'"

    .line 114
    .line 115
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    iget-object v1, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;->mixExtraInfo:Ljava/lang/String;

    .line 119
    .line 120
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    const-string v1, "\', mixUsers="

    .line 124
    .line 125
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    iget-object p0, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;->mixUsers:Ljava/util/ArrayList;

    .line 129
    .line 130
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    const/16 p0, 0x7d

    .line 134
    .line 135
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    return-object p0
.end method
