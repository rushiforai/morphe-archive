.class public Lcom/immomo/momomediaext/utils/MMLiveRoomParams;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;,
        Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMRenderViewType;,
        Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioScenario;,
        Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;,
        Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveClientRole;,
        Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveRoomMode;
    }
.end annotation


# instance fields
.field public agoraRtcKeepAlive:I

.field public audioProfile:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;

.field public audioScenario:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioScenario;

.field public blueToothType:I

.field public channel:Ljava/lang/String;

.field public channelKey:Ljava/lang/String;

.field public confId:Ljava/lang/String;

.field public degradationPrefer:I

.field public enableConferenceReconnect:Z

.field public enableFullTimeMode:Z

.field public enableRtcPlaybackCallback:Z

.field public isHost:Z

.field public linkType:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

.field public onlyAudio:Z

.field public renderViewType:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMRenderViewType;

.field public role:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveClientRole;

.field public sourceLanguage:Ljava/lang/String;

.field public userId:Ljava/lang/String;

.field public userSig:Ljava/lang/String;

.field public volcRtcKeepAlive:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeConfNONE:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->linkType:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput v0, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->degradationPrefer:I

    .line 10
    .line 11
    sget-object v1, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMRenderViewType;->SurfaceViewOut:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMRenderViewType;

    .line 12
    .line 13
    iput-object v1, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->renderViewType:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMRenderViewType;

    .line 14
    .line 15
    iput v0, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->blueToothType:I

    .line 16
    .line 17
    sget-object v1, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioScenario;->MMLiveAudioScenarioNone:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioScenario;

    .line 18
    .line 19
    iput-object v1, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->audioScenario:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioScenario;

    .line 20
    .line 21
    sget-object v1, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;->MMLiveAudioProfileNone:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;

    .line 22
    .line 23
    iput-object v1, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->audioProfile:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;

    .line 24
    .line 25
    iput-boolean v0, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->onlyAudio:Z

    .line 26
    .line 27
    iput-boolean v0, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->enableFullTimeMode:Z

    .line 28
    .line 29
    const/4 v0, 0x1

    .line 30
    iput-boolean v0, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->enableConferenceReconnect:Z

    .line 31
    .line 32
    const-string v1, ""

    .line 33
    .line 34
    iput-object v1, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->sourceLanguage:Ljava/lang/String;

    .line 35
    .line 36
    const/4 v1, -0x1

    .line 37
    iput v1, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->agoraRtcKeepAlive:I

    .line 38
    .line 39
    iput v1, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->volcRtcKeepAlive:I

    .line 40
    .line 41
    iput-boolean v0, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->enableRtcPlaybackCallback:Z

    .line 42
    .line 43
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "<type:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->linkType:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ",appid:"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->confId:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ","

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-object v2, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->role:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveClientRole;

    .line 29
    .line 30
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v2, ",isHost:"

    .line 34
    .line 35
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-boolean v2, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->isHost:Z

    .line 39
    .line 40
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v2, ",userid"

    .line 44
    .line 45
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-object v2, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->userId:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v2, ",roomid:"

    .line 54
    .line 55
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget-object v2, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->channel:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v2, ",token:"

    .line 64
    .line 65
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget-object v2, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->channelKey:Ljava/lang/String;

    .line 69
    .line 70
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    iget-object v1, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->userSig:Ljava/lang/String;

    .line 77
    .line 78
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    const-string v1, ",blueTooth:"

    .line 82
    .line 83
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    iget v1, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->blueToothType:I

    .line 87
    .line 88
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    const-string v1, ",renderMode:"

    .line 92
    .line 93
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    iget-object v1, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->renderViewType:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMRenderViewType;

    .line 97
    .line 98
    invoke-virtual {v1}, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMRenderViewType;->value()I

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    const-string v1, ",audioProfile"

    .line 106
    .line 107
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    iget-object v1, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->audioProfile:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;

    .line 111
    .line 112
    invoke-virtual {v1}, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioProfile;->value()I

    .line 113
    .line 114
    .line 115
    move-result v1

    .line 116
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    const-string v1, ",audioScenario:"

    .line 120
    .line 121
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    iget-object v1, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->audioScenario:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioScenario;

    .line 125
    .line 126
    invoke-virtual {v1}, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveAudioScenario;->value()I

    .line 127
    .line 128
    .line 129
    move-result v1

    .line 130
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    const-string v1, "audioOnly:"

    .line 134
    .line 135
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    iget-boolean v1, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->onlyAudio:Z

    .line 139
    .line 140
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    const-string v1, "fullTimeMode"

    .line 144
    .line 145
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    iget-boolean v1, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->enableFullTimeMode:Z

    .line 149
    .line 150
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    const-string v1, "degradationPrefer:"

    .line 154
    .line 155
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    iget v1, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->degradationPrefer:I

    .line 159
    .line 160
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    const-string v1, "agoraRtcKeepAlive:"

    .line 164
    .line 165
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    iget v1, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->agoraRtcKeepAlive:I

    .line 169
    .line 170
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    const-string v1, "volcRtcKeepAlive:"

    .line 174
    .line 175
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 176
    .line 177
    .line 178
    iget v1, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->volcRtcKeepAlive:I

    .line 179
    .line 180
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    const-string v1, "enableRtcPlaybackCallback:"

    .line 184
    .line 185
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    iget-boolean p0, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->enableRtcPlaybackCallback:Z

    .line 189
    .line 190
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 191
    .line 192
    .line 193
    const/16 p0, 0x3e

    .line 194
    .line 195
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 196
    .line 197
    .line 198
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object p0

    .line 202
    return-object p0
.end method
