.class Ll/xmp0$g;
.super Ll/gjc0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/xmp0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/xmp0;


# direct methods
.method public constructor <init>(Ll/xmp0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/gjc0;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAudioSubscribeStateChanged(Ljava/lang/String;Ljava/lang/String;Lcom/ss/bytertc/engine/data/SubscribeState;Lcom/ss/bytertc/engine/data/SubscribeStateChangeReason;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Ll/gjc0;->onAudioSubscribeStateChanged(Ljava/lang/String;Ljava/lang/String;Lcom/ss/bytertc/engine/data/SubscribeState;Lcom/ss/bytertc/engine/data/SubscribeStateChangeReason;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onForwardStreamEvent([Lcom/ss/bytertc/engine/data/ForwardStreamEventInfo;)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/xmp0;->U2(Ll/xmp0;)Ll/evx;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v1, "eventInfos:"

    .line 10
    .line 11
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    aget-object p1, p1, v1

    .line 16
    .line 17
    iget-object p1, p1, Lcom/ss/bytertc/engine/data/ForwardStreamEventInfo;->event:Lcom/ss/bytertc/engine/data/ForwardStreamEventInfo$ForwardStreamEvent;

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    const-string v0, "onForwardStreamEvent"

    .line 27
    .line 28
    filled-new-array {v0, p1}, [Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p0, p1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public onForwardStreamStateChanged([Lcom/ss/bytertc/engine/data/ForwardStreamStateInfo;)V
    .locals 12

    .line 1
    iget-object v0, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/xmp0;->S2(Ll/xmp0;)Ll/evx;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v2, "stateInfo:"

    .line 10
    .line 11
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    aget-object v3, p1, v2

    .line 16
    .line 17
    iget-object v3, v3, Lcom/ss/bytertc/engine/data/ForwardStreamStateInfo;->state:Lcom/ss/bytertc/engine/data/ForwardStreamStateInfo$ForwardStreamState;

    .line 18
    .line 19
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    const-string v3, "onForwardStreamStateChanged"

    .line 27
    .line 28
    filled-new-array {v3, v1}, [Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    array-length v0, p1

    .line 36
    if-nez v0, :cond_0

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    sget-object v0, Ll/xmp0$c;->a:[I

    .line 40
    .line 41
    aget-object v1, p1, v2

    .line 42
    .line 43
    iget-object v1, v1, Lcom/ss/bytertc/engine/data/ForwardStreamStateInfo;->state:Lcom/ss/bytertc/engine/data/ForwardStreamStateInfo$ForwardStreamState;

    .line 44
    .line 45
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    aget v0, v0, v1

    .line 50
    .line 51
    const-wide/16 v3, 0x0

    .line 52
    .line 53
    const/4 v1, 0x1

    .line 54
    if-eq v0, v1, :cond_3

    .line 55
    .line 56
    const/4 v1, 0x2

    .line 57
    if-eq v0, v1, :cond_1

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_1
    iget-object v0, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 61
    .line 62
    invoke-static {v0}, Ll/xmp0;->r4(Ll/xmp0;)Ll/kod0;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    if-eqz v0, :cond_2

    .line 67
    .line 68
    iget-object v0, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 69
    .line 70
    invoke-static {v0}, Ll/xmp0;->r4(Ll/xmp0;)Ll/kod0;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    new-instance v1, Ljava/lang/StringBuilder;

    .line 75
    .line 76
    const-string v5, "connect_failed,code:"

    .line 77
    .line 78
    invoke-direct {v1, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    aget-object v5, p1, v2

    .line 82
    .line 83
    iget-object v5, v5, Lcom/ss/bytertc/engine/data/ForwardStreamStateInfo;->error:Lcom/ss/bytertc/engine/data/ForwardStreamStateInfo$ForwardStreamError;

    .line 84
    .line 85
    invoke-virtual {v5}, Lcom/ss/bytertc/engine/data/ForwardStreamStateInfo$ForwardStreamError;->value()I

    .line 86
    .line 87
    .line 88
    move-result v5

    .line 89
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    const/4 v5, 0x3

    .line 97
    invoke-virtual {v0, v3, v4, v5, v1}, Ll/kod0;->f(JILjava/lang/String;)V

    .line 98
    .line 99
    .line 100
    :cond_2
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 101
    .line 102
    .line 103
    move-result-object v6

    .line 104
    aget-object p1, p1, v2

    .line 105
    .line 106
    iget-object p1, p1, Lcom/ss/bytertc/engine/data/ForwardStreamStateInfo;->error:Lcom/ss/bytertc/engine/data/ForwardStreamStateInfo$ForwardStreamError;

    .line 107
    .line 108
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ForwardStreamStateInfo$ForwardStreamError;->value()I

    .line 109
    .line 110
    .line 111
    move-result v9

    .line 112
    sget-object p1, Lcom/immomo/medialog/LogLevel;->FATAL:Lcom/immomo/medialog/LogLevel;

    .line 113
    .line 114
    invoke-virtual {p1}, Lcom/immomo/medialog/LogLevel;->value()I

    .line 115
    .line 116
    .line 117
    move-result v11

    .line 118
    const-string v7, "ConnectOtherRoom"

    .line 119
    .line 120
    const-string v8, "volc"

    .line 121
    .line 122
    const-string v10, "strartForwardStreamToRoom failed"

    .line 123
    .line 124
    invoke-virtual/range {v6 .. v11}, Ll/b7y;->e(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)V

    .line 125
    .line 126
    .line 127
    iget-object p0, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 128
    .line 129
    invoke-static {p0, v2}, Ll/xmp0;->T2(Ll/xmp0;Z)Z

    .line 130
    .line 131
    .line 132
    return-void

    .line 133
    :cond_3
    iget-object p1, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 134
    .line 135
    invoke-static {p1}, Ll/xmp0;->r4(Ll/xmp0;)Ll/kod0;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    if-eqz p1, :cond_4

    .line 140
    .line 141
    iget-object p0, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 142
    .line 143
    invoke-static {p0}, Ll/xmp0;->r4(Ll/xmp0;)Ll/kod0;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    const-string p1, "connect_success"

    .line 148
    .line 149
    invoke-virtual {p0, v3, v4, v1, p1}, Ll/kod0;->f(JILjava/lang/String;)V

    .line 150
    .line 151
    .line 152
    :cond_4
    :goto_0
    return-void
.end method

.method public onLeaveRoom(Lcom/ss/bytertc/engine/type/RTCRoomStats;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/xmp0;->q5(Ll/xmp0;)Ll/evx;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "volc onLeaveRoom"

    .line 8
    .line 9
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 19
    .line 20
    invoke-static {v0}, Ll/xmp0;->r5(Ll/xmp0;)Ll/wvx;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-wide v1, p1, Lcom/ss/bytertc/engine/type/RTCRoomStats;->txBytes:J

    .line 25
    .line 26
    iput-wide v1, v0, Ll/wvx;->B:J

    .line 27
    .line 28
    :cond_0
    iget-object p1, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 29
    .line 30
    invoke-static {p1}, Ll/xmp0;->s5(Ll/xmp0;)Lcom/immomo/mediacore/coninf/MRtcExitRoomHandler;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    if-eqz p1, :cond_1

    .line 35
    .line 36
    iget-object p1, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 37
    .line 38
    invoke-static {p1}, Ll/xmp0;->s5(Ll/xmp0;)Lcom/immomo/mediacore/coninf/MRtcExitRoomHandler;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-interface {p1}, Lcom/immomo/mediacore/coninf/MRtcExitRoomHandler;->onExitRoom()V

    .line 43
    .line 44
    .line 45
    :cond_1
    iget-object p1, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 46
    .line 47
    invoke-static {p1}, Ll/xmp0;->v5(Ll/xmp0;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    if-eqz p1, :cond_2

    .line 52
    .line 53
    iget-object p1, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 54
    .line 55
    invoke-static {p1}, Ll/xmp0;->v5(Ll/xmp0;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {p1}, Ljava/util/AbstractMap;->isEmpty()Z

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    if-nez p1, :cond_2

    .line 64
    .line 65
    const-string p1, "onLeaveRoom"

    .line 66
    .line 67
    const-string v0, "lqdebug"

    .line 68
    .line 69
    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 70
    .line 71
    .line 72
    new-instance p1, Ljava/lang/StringBuilder;

    .line 73
    .line 74
    const-string v1, "stopRecord memberInfoMap "

    .line 75
    .line 76
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    iget-object v1, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 80
    .line 81
    invoke-static {v1}, Ll/xmp0;->v5(Ll/xmp0;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    invoke-virtual {v1}, Ljava/util/AbstractMap;->size()I

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    invoke-static {v0, p1}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 97
    .line 98
    .line 99
    iget-object p0, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 100
    .line 101
    invoke-static {p0}, Ll/xmp0;->v5(Ll/xmp0;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    invoke-virtual {p0}, Ljava/util/AbstractMap;->clear()V

    .line 106
    .line 107
    .line 108
    :cond_2
    return-void
.end method

.method public onLocalStreamStats(Lcom/ss/bytertc/engine/type/LocalStreamStats;)V
    .locals 3

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 4
    .line 5
    invoke-static {v0}, Ll/xmp0;->N2(Ll/xmp0;)Ll/wvx;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 10
    .line 11
    invoke-static {v1}, Ll/xmp0;->O2(Ll/xmp0;)Ll/uow;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iget-boolean v1, v1, Ll/uow;->H0:Z

    .line 16
    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    const-wide/16 v1, 0x2

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const-wide/16 v1, 0x0

    .line 23
    .line 24
    :goto_0
    iput-wide v1, v0, Ll/wvx;->g:J

    .line 25
    .line 26
    iget-object v0, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 27
    .line 28
    invoke-static {v0}, Ll/xmp0;->P2(Ll/xmp0;)Ll/wvx;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iget-object v1, p1, Lcom/ss/bytertc/engine/type/LocalStreamStats;->videoStats:Lcom/ss/bytertc/engine/type/LocalVideoStats;

    .line 33
    .line 34
    iget v1, v1, Lcom/ss/bytertc/engine/type/LocalVideoStats;->encodedFrameCount:I

    .line 35
    .line 36
    int-to-long v1, v1

    .line 37
    iput-wide v1, v0, Ll/wvx;->H:J

    .line 38
    .line 39
    iget-object p0, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 40
    .line 41
    invoke-static {p0}, Ll/xmp0;->Q2(Ll/xmp0;)Ll/wvx;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    iget-object p1, p1, Lcom/ss/bytertc/engine/type/LocalStreamStats;->videoStats:Lcom/ss/bytertc/engine/type/LocalVideoStats;

    .line 46
    .line 47
    iget p1, p1, Lcom/ss/bytertc/engine/type/LocalVideoStats;->encoderOutputFrameRate:I

    .line 48
    .line 49
    int-to-long v0, p1

    .line 50
    iput-wide v0, p0, Ll/wvx;->Q:J

    .line 51
    .line 52
    :cond_1
    return-void
.end method

.method public onNetworkQuality(Lcom/ss/bytertc/engine/type/NetworkQualityStats;[Lcom/ss/bytertc/engine/type/NetworkQualityStats;)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2}, Ll/gjc0;->onNetworkQuality(Lcom/ss/bytertc/engine/type/NetworkQualityStats;[Lcom/ss/bytertc/engine/type/NetworkQualityStats;)V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    iget-object p2, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 7
    .line 8
    invoke-static {p2}, Ll/xmp0;->X2(Ll/xmp0;)Ll/wvx;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    iget v0, p1, Lcom/ss/bytertc/engine/type/NetworkQualityStats;->txQuality:I

    .line 13
    .line 14
    iput v0, p2, Ll/wvx;->q0:I

    .line 15
    .line 16
    iget-object p2, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 17
    .line 18
    invoke-static {p2}, Ll/xmp0;->Y2(Ll/xmp0;)Ll/wvx;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    iget v0, p1, Lcom/ss/bytertc/engine/type/NetworkQualityStats;->rxQuality:I

    .line 23
    .line 24
    iput v0, p2, Ll/wvx;->r0:I

    .line 25
    .line 26
    :cond_0
    :try_start_0
    iget-object p2, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 27
    .line 28
    invoke-static {p2}, Ll/xmp0;->r4(Ll/xmp0;)Ll/kod0;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    if-eqz p2, :cond_1

    .line 33
    .line 34
    if-eqz p1, :cond_1

    .line 35
    .line 36
    iget-object p0, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 37
    .line 38
    invoke-static {p0}, Ll/xmp0;->r4(Ll/xmp0;)Ll/kod0;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    iget-object p2, p1, Lcom/ss/bytertc/engine/type/NetworkQualityStats;->uid:Ljava/lang/String;

    .line 43
    .line 44
    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 45
    .line 46
    .line 47
    move-result p2

    .line 48
    iget v0, p1, Lcom/ss/bytertc/engine/type/NetworkQualityStats;->txQuality:I

    .line 49
    .line 50
    iget p1, p1, Lcom/ss/bytertc/engine/type/NetworkQualityStats;->rxQuality:I

    .line 51
    .line 52
    invoke-virtual {p0, p2, v0, p1}, Ll/kod0;->l(III)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 53
    .line 54
    .line 55
    :catch_0
    :cond_1
    return-void
.end method

.method public onRemoteStreamStats(Lcom/ss/bytertc/engine/type/RemoteStreamStats;)V
    .locals 6

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object p0, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 4
    .line 5
    invoke-static {p0}, Ll/xmp0;->A4(Ll/xmp0;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object v0, p1, Lcom/ss/bytertc/engine/type/RemoteStreamStats;->uid:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Ll/iny;

    .line 20
    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    iget-object v0, p1, Lcom/ss/bytertc/engine/type/RemoteStreamStats;->audioStats:Lcom/ss/bytertc/engine/type/RemoteAudioStats;

    .line 24
    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    iget v1, v0, Lcom/ss/bytertc/engine/type/RemoteAudioStats;->receivedKBitrate:F

    .line 28
    .line 29
    float-to-long v2, v1

    .line 30
    iput-wide v2, p0, Ll/iny;->a:J

    .line 31
    .line 32
    iget v2, p0, Ll/iny;->t:I

    .line 33
    .line 34
    iget v3, v0, Lcom/ss/bytertc/engine/type/RemoteAudioStats;->concealmentEvent:I

    .line 35
    .line 36
    add-int/2addr v2, v3

    .line 37
    iput v2, p0, Ll/iny;->t:I

    .line 38
    .line 39
    iget v2, p0, Ll/iny;->u:I

    .line 40
    .line 41
    add-int/2addr v2, v3

    .line 42
    iput v2, p0, Ll/iny;->u:I

    .line 43
    .line 44
    iget v2, p0, Ll/iny;->z:I

    .line 45
    .line 46
    int-to-float v2, v2

    .line 47
    iget v3, v0, Lcom/ss/bytertc/engine/type/RemoteAudioStats;->audioLossRate:F

    .line 48
    .line 49
    const/high16 v4, 0x41200000    # 10.0f

    .line 50
    .line 51
    mul-float/2addr v4, v3

    .line 52
    add-float/2addr v2, v4

    .line 53
    float-to-int v2, v2

    .line 54
    iput v2, p0, Ll/iny;->z:I

    .line 55
    .line 56
    iget v2, p0, Ll/iny;->A:I

    .line 57
    .line 58
    iput v2, p0, Ll/iny;->A:I

    .line 59
    .line 60
    float-to-int v2, v3

    .line 61
    mul-int/lit8 v2, v2, 0x64

    .line 62
    .line 63
    iput v2, p0, Ll/iny;->k:I

    .line 64
    .line 65
    iget v2, p0, Ll/iny;->j:I

    .line 66
    .line 67
    int-to-long v2, v2

    .line 68
    iget-wide v4, v0, Lcom/ss/bytertc/engine/type/RemoteAudioStats;->e2eDelay:J

    .line 69
    .line 70
    add-long/2addr v2, v4

    .line 71
    long-to-int v2, v2

    .line 72
    iput v2, p0, Ll/iny;->j:I

    .line 73
    .line 74
    iget v2, p0, Ll/iny;->B:I

    .line 75
    .line 76
    add-int/lit8 v2, v2, 0x1

    .line 77
    .line 78
    iput v2, p0, Ll/iny;->B:I

    .line 79
    .line 80
    iget-wide v2, p0, Ll/iny;->f:J

    .line 81
    .line 82
    float-to-int v1, v1

    .line 83
    div-int/lit8 v1, v1, 0x8

    .line 84
    .line 85
    mul-int/lit16 v1, v1, 0x7d0

    .line 86
    .line 87
    int-to-long v4, v1

    .line 88
    add-long/2addr v2, v4

    .line 89
    iput-wide v2, p0, Ll/iny;->f:J

    .line 90
    .line 91
    iget v1, p0, Ll/iny;->F:I

    .line 92
    .line 93
    iget v0, v0, Lcom/ss/bytertc/engine/type/RemoteAudioStats;->stallDuration:I

    .line 94
    .line 95
    add-int/2addr v1, v0

    .line 96
    iput v1, p0, Ll/iny;->F:I

    .line 97
    .line 98
    :cond_0
    iget-object v0, p1, Lcom/ss/bytertc/engine/type/RemoteStreamStats;->videoStats:Lcom/ss/bytertc/engine/type/RemoteVideoStats;

    .line 99
    .line 100
    if-eqz v0, :cond_1

    .line 101
    .line 102
    iget v1, v0, Lcom/ss/bytertc/engine/type/RemoteVideoStats;->receivedKBitrate:F

    .line 103
    .line 104
    float-to-int v1, v1

    .line 105
    iget v2, v0, Lcom/ss/bytertc/engine/type/RemoteVideoStats;->rendererOutputFrameRate:I

    .line 106
    .line 107
    iget v3, v0, Lcom/ss/bytertc/engine/type/RemoteVideoStats;->width:I

    .line 108
    .line 109
    iget v0, v0, Lcom/ss/bytertc/engine/type/RemoteVideoStats;->height:I

    .line 110
    .line 111
    invoke-virtual {p0, v1, v2, v3, v0}, Ll/iny;->k(IIII)V

    .line 112
    .line 113
    .line 114
    iget-object p1, p1, Lcom/ss/bytertc/engine/type/RemoteStreamStats;->videoStats:Lcom/ss/bytertc/engine/type/RemoteVideoStats;

    .line 115
    .line 116
    iget v0, p1, Lcom/ss/bytertc/engine/type/RemoteVideoStats;->videoLossRate:F

    .line 117
    .line 118
    float-to-int v0, v0

    .line 119
    mul-int/lit8 v0, v0, 0x64

    .line 120
    .line 121
    iput v0, p0, Ll/iny;->m:I

    .line 122
    .line 123
    iget-wide v0, p0, Ll/iny;->e:J

    .line 124
    .line 125
    iget v2, p1, Lcom/ss/bytertc/engine/type/RemoteVideoStats;->receivedKBitrate:F

    .line 126
    .line 127
    float-to-int v2, v2

    .line 128
    div-int/lit8 v2, v2, 0x8

    .line 129
    .line 130
    mul-int/lit16 v2, v2, 0x7d0

    .line 131
    .line 132
    int-to-long v2, v2

    .line 133
    add-long/2addr v0, v2

    .line 134
    iput-wide v0, p0, Ll/iny;->e:J

    .line 135
    .line 136
    iget-wide v0, p0, Ll/iny;->c:J

    .line 137
    .line 138
    iget v2, p1, Lcom/ss/bytertc/engine/type/RemoteVideoStats;->decoderOutputFrameRate:I

    .line 139
    .line 140
    int-to-long v2, v2

    .line 141
    add-long/2addr v0, v2

    .line 142
    iput-wide v0, p0, Ll/iny;->c:J

    .line 143
    .line 144
    iget v0, p0, Ll/iny;->C:I

    .line 145
    .line 146
    add-int/lit8 v0, v0, 0x1

    .line 147
    .line 148
    iput v0, p0, Ll/iny;->C:I

    .line 149
    .line 150
    iget-wide v0, p1, Lcom/ss/bytertc/engine/type/RemoteVideoStats;->e2eDelay:J

    .line 151
    .line 152
    long-to-int v0, v0

    .line 153
    iput v0, p0, Ll/iny;->l:I

    .line 154
    .line 155
    iget v0, p0, Ll/iny;->G:I

    .line 156
    .line 157
    iget p1, p1, Lcom/ss/bytertc/engine/type/RemoteVideoStats;->stallDuration:I

    .line 158
    .line 159
    add-int/2addr v0, p1

    .line 160
    iput v0, p0, Ll/iny;->G:I

    .line 161
    .line 162
    :cond_1
    return-void
.end method

.method public onRoomBinaryMessageReceived(Ljava/lang/String;Ljava/nio/ByteBuffer;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Ll/gjc0;->onRoomBinaryMessageReceived(Ljava/lang/String;Ljava/nio/ByteBuffer;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onRoomMessageReceived(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2}, Ll/gjc0;->onRoomMessageReceived(Ljava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 5
    .line 6
    invoke-static {v0}, Ll/xmp0;->K4(Ll/xmp0;)Lcom/immomo/mediacore/coninf/MRtcChannelHandler;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 13
    .line 14
    invoke-static {p0}, Ll/xmp0;->K4(Ll/xmp0;)Lcom/immomo/mediacore/coninf/MRtcChannelHandler;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    const/4 v0, 0x0

    .line 27
    invoke-virtual {p2}, Ljava/lang/String;->getBytes()[B

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    invoke-interface {p0, p1, v0, p2}, Lcom/immomo/mediacore/coninf/MRtcChannelHandler;->onStreamMessage(II[B)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public onRoomMessageSendResult(JI)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/gjc0;->onRoomMessageSendResult(JI)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onRoomStateChanged(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V
    .locals 11

    .line 1
    iget-object v0, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/xmp0;->L4(Ll/xmp0;)Ll/evx;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v2, "roomId:"

    .line 10
    .line 11
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v2, ",enterRoomState:"

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v2, ", host\uff1a"

    .line 26
    .line 27
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    iget-object v2, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 31
    .line 32
    invoke-static {v2}, Ll/xmp0;->K3(Ll/xmp0;)Ll/ror;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    iget-boolean v2, v2, Ll/ror;->h1:Z

    .line 37
    .line 38
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    const-string v2, "onRoomStateChanged"

    .line 46
    .line 47
    filled-new-array {v2, v1}, [Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 55
    .line 56
    const/4 v1, 0x0

    .line 57
    if-eqz p3, :cond_3

    .line 58
    .line 59
    invoke-static {v0}, Ll/xmp0;->N4(Ll/xmp0;)Ll/evx;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    new-instance p2, Ljava/lang/StringBuilder;

    .line 64
    .line 65
    const-string p4, "\u8fdb\u623f\u5931\u8d25:roomState:"

    .line 66
    .line 67
    invoke-direct {p2, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p2

    .line 77
    filled-new-array {v2, p2}, [Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object p2

    .line 81
    invoke-virtual {p1, p2}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 82
    .line 83
    .line 84
    iget-object p1, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 85
    .line 86
    invoke-static {p1}, Ll/xmp0;->R2(Ll/xmp0;)Ll/q210$a;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    if-eqz p1, :cond_2

    .line 91
    .line 92
    const/16 p1, -0x43c

    .line 93
    .line 94
    if-eq p3, p1, :cond_1

    .line 95
    .line 96
    const/16 p1, -0x3f2

    .line 97
    .line 98
    if-eq p3, p1, :cond_1

    .line 99
    .line 100
    const/16 p1, -0x3f1

    .line 101
    .line 102
    if-eq p3, p1, :cond_1

    .line 103
    .line 104
    const/16 p1, -0x3ef

    .line 105
    .line 106
    if-eq p3, p1, :cond_1

    .line 107
    .line 108
    const/16 p1, -0x3ee

    .line 109
    .line 110
    if-eq p3, p1, :cond_0

    .line 111
    .line 112
    const/16 p1, -0x3e9

    .line 113
    .line 114
    if-eq p3, p1, :cond_1

    .line 115
    .line 116
    const/16 p1, -0x3e8

    .line 117
    .line 118
    if-eq p3, p1, :cond_1

    .line 119
    .line 120
    goto :goto_0

    .line 121
    :cond_0
    iget-object p1, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 122
    .line 123
    invoke-static {p1}, Ll/xmp0;->Q4(Ll/xmp0;)Ll/wvx;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    const-wide/16 v0, 0x32e

    .line 128
    .line 129
    iput-wide v0, p1, Ll/wvx;->y0:J

    .line 130
    .line 131
    iget-object p1, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 132
    .line 133
    invoke-static {p1}, Ll/xmp0;->R4(Ll/xmp0;)Ll/wvx;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    iput p3, p1, Ll/wvx;->k0:I

    .line 138
    .line 139
    iget-object p1, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 140
    .line 141
    invoke-static {p1}, Ll/xmp0;->r4(Ll/xmp0;)Ll/kod0;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    if-eqz p1, :cond_2

    .line 146
    .line 147
    iget-object p0, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 148
    .line 149
    invoke-static {p0}, Ll/xmp0;->r4(Ll/xmp0;)Ll/kod0;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    invoke-virtual {p0, p3}, Ll/kod0;->g(I)V

    .line 154
    .line 155
    .line 156
    return-void

    .line 157
    :cond_1
    invoke-static {p3}, Ll/b3f;->a(I)I

    .line 158
    .line 159
    .line 160
    move-result p1

    .line 161
    iget-object p2, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 162
    .line 163
    invoke-static {p2}, Ll/xmp0;->O4(Ll/xmp0;)Ll/wvx;

    .line 164
    .line 165
    .line 166
    move-result-object p2

    .line 167
    int-to-long v2, p1

    .line 168
    iput-wide v2, p2, Ll/wvx;->y0:J

    .line 169
    .line 170
    iget-object p2, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 171
    .line 172
    invoke-static {p2}, Ll/xmp0;->P4(Ll/xmp0;)Ll/wvx;

    .line 173
    .line 174
    .line 175
    move-result-object p2

    .line 176
    iput p3, p2, Ll/wvx;->k0:I

    .line 177
    .line 178
    iget-object p2, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 179
    .line 180
    invoke-static {p2}, Ll/xmp0;->R2(Ll/xmp0;)Ll/q210$a;

    .line 181
    .line 182
    .line 183
    move-result-object p2

    .line 184
    const/16 p3, 0x1100

    .line 185
    .line 186
    iget-object p0, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 187
    .line 188
    invoke-interface {p2, p3, p1, v1, p0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 189
    .line 190
    .line 191
    :cond_2
    :goto_0
    return-void

    .line 192
    :cond_3
    sget-object p3, Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;->START:Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;

    .line 193
    .line 194
    invoke-static {v0, p3}, Ll/xmp0;->S4(Ll/xmp0;Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;)Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;

    .line 195
    .line 196
    .line 197
    iget-object p3, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 198
    .line 199
    invoke-static {p3}, Ll/xmp0;->T4(Ll/xmp0;)Ll/wvx;

    .line 200
    .line 201
    .line 202
    move-result-object p3

    .line 203
    const/4 v2, 0x1

    .line 204
    iput-boolean v2, p3, Ll/wvx;->b:Z

    .line 205
    .line 206
    iget-object p3, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 207
    .line 208
    invoke-static {p3}, Ll/xmp0;->K3(Ll/xmp0;)Ll/ror;

    .line 209
    .line 210
    .line 211
    move-result-object p3

    .line 212
    iget-boolean p3, p3, Ll/ror;->h1:Z

    .line 213
    .line 214
    if-eqz p3, :cond_7

    .line 215
    .line 216
    iget-object p3, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 217
    .line 218
    invoke-static {p3}, Ll/xmp0;->U4(Ll/xmp0;)I

    .line 219
    .line 220
    .line 221
    move-result p3

    .line 222
    iget-object v0, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 223
    .line 224
    if-lez p3, :cond_4

    .line 225
    .line 226
    invoke-static {v0}, Ll/xmp0;->U4(Ll/xmp0;)I

    .line 227
    .line 228
    .line 229
    move-result p3

    .line 230
    :goto_1
    move v8, p3

    .line 231
    goto :goto_2

    .line 232
    :cond_4
    invoke-static {v0}, Ll/xmp0;->K3(Ll/xmp0;)Ll/ror;

    .line 233
    .line 234
    .line 235
    move-result-object p3

    .line 236
    iget p3, p3, Ll/uow;->S0:I

    .line 237
    .line 238
    if-eqz p3, :cond_5

    .line 239
    .line 240
    iget-object p3, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 241
    .line 242
    invoke-static {p3}, Ll/xmp0;->K3(Ll/xmp0;)Ll/ror;

    .line 243
    .line 244
    .line 245
    move-result-object p3

    .line 246
    iget p3, p3, Ll/uow;->S0:I

    .line 247
    .line 248
    goto :goto_1

    .line 249
    :cond_5
    const/16 p3, 0xf

    .line 250
    .line 251
    goto :goto_1

    .line 252
    :goto_2
    iget-object v3, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 253
    .line 254
    invoke-static {v3}, Ll/xmp0;->K3(Ll/xmp0;)Ll/ror;

    .line 255
    .line 256
    .line 257
    move-result-object p3

    .line 258
    iget-boolean v4, p3, Ll/ror;->h1:Z

    .line 259
    .line 260
    iget-object p3, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 261
    .line 262
    invoke-static {p3}, Ll/xmp0;->K3(Ll/xmp0;)Ll/ror;

    .line 263
    .line 264
    .line 265
    move-result-object p3

    .line 266
    iget v5, p3, Ll/tow;->k:I

    .line 267
    .line 268
    iget-object p3, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 269
    .line 270
    invoke-static {p3}, Ll/xmp0;->K3(Ll/xmp0;)Ll/ror;

    .line 271
    .line 272
    .line 273
    move-result-object p3

    .line 274
    iget v6, p3, Ll/tow;->l:I

    .line 275
    .line 276
    iget-object p3, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 277
    .line 278
    invoke-static {p3}, Ll/xmp0;->V4(Ll/xmp0;)I

    .line 279
    .line 280
    .line 281
    move-result v7

    .line 282
    iget-object p3, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 283
    .line 284
    invoke-static {p3}, Ll/xmp0;->K3(Ll/xmp0;)Ll/ror;

    .line 285
    .line 286
    .line 287
    move-result-object p3

    .line 288
    iget-object v9, p3, Ll/uow;->v0:Ljava/lang/String;

    .line 289
    .line 290
    move-object v10, p2

    .line 291
    invoke-static/range {v3 .. v10}, Ll/xmp0;->W4(Ll/xmp0;ZIIIILjava/lang/String;Ljava/lang/String;)V

    .line 292
    .line 293
    .line 294
    iget-object p2, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 295
    .line 296
    invoke-static {p2}, Ll/xmp0;->K3(Ll/xmp0;)Ll/ror;

    .line 297
    .line 298
    .line 299
    move-result-object p2

    .line 300
    iget-boolean p2, p2, Ll/ror;->h1:Z

    .line 301
    .line 302
    if-eqz p2, :cond_6

    .line 303
    .line 304
    iget-object p2, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 305
    .line 306
    invoke-static {p2}, Ll/xmp0;->Y4(Ll/xmp0;)Z

    .line 307
    .line 308
    .line 309
    move-result p2

    .line 310
    if-nez p2, :cond_6

    .line 311
    .line 312
    iget-object p2, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 313
    .line 314
    invoke-static {p2}, Ll/xmp0;->K3(Ll/xmp0;)Ll/ror;

    .line 315
    .line 316
    .line 317
    move-result-object p2

    .line 318
    iget-object p2, p2, Ll/uow;->v0:Ljava/lang/String;

    .line 319
    .line 320
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 321
    .line 322
    .line 323
    move-result p2

    .line 324
    if-nez p2, :cond_6

    .line 325
    .line 326
    iget-object p2, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 327
    .line 328
    invoke-static {p2}, Ll/xmp0;->K3(Ll/xmp0;)Ll/ror;

    .line 329
    .line 330
    .line 331
    move-result-object p3

    .line 332
    iget-object p3, p3, Ll/uow;->v0:Ljava/lang/String;

    .line 333
    .line 334
    invoke-static {p2, p3}, Ll/xmp0;->Z4(Ll/xmp0;Ljava/lang/String;)I

    .line 335
    .line 336
    .line 337
    :cond_6
    iget-object p2, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 338
    .line 339
    iget-object p3, p2, Ll/xmp0;->f2:Ljava/util/Timer;

    .line 340
    .line 341
    if-nez p3, :cond_7

    .line 342
    .line 343
    new-instance p3, Ljava/util/Timer;

    .line 344
    .line 345
    invoke-direct {p3}, Ljava/util/Timer;-><init>()V

    .line 346
    .line 347
    .line 348
    iput-object p3, p2, Ll/xmp0;->f2:Ljava/util/Timer;

    .line 349
    .line 350
    new-instance v4, Ll/xmp0$g$a;

    .line 351
    .line 352
    invoke-direct {v4, p0}, Ll/xmp0$g$a;-><init>(Ll/xmp0$g;)V

    .line 353
    .line 354
    .line 355
    iget-object p2, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 356
    .line 357
    iget-object v3, p2, Ll/xmp0;->f2:Ljava/util/Timer;

    .line 358
    .line 359
    const-wide/16 v5, 0x64

    .line 360
    .line 361
    const-wide/16 v7, 0x3e8

    .line 362
    .line 363
    invoke-virtual/range {v3 .. v8}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;JJ)V

    .line 364
    .line 365
    .line 366
    :cond_7
    iget-object p2, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 367
    .line 368
    invoke-static {p2}, Ll/xmp0;->d5(Ll/xmp0;)Z

    .line 369
    .line 370
    .line 371
    move-result p2

    .line 372
    if-nez p2, :cond_8

    .line 373
    .line 374
    iget-object p2, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 375
    .line 376
    invoke-static {p2}, Ll/xmp0;->e5(Ll/xmp0;)Z

    .line 377
    .line 378
    .line 379
    move-result p2

    .line 380
    if-eqz p2, :cond_9

    .line 381
    .line 382
    :cond_8
    iget-object p2, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 383
    .line 384
    invoke-static {p2}, Ll/xmp0;->f5(Ll/xmp0;)I

    .line 385
    .line 386
    .line 387
    move-result p2

    .line 388
    if-eqz p2, :cond_9

    .line 389
    .line 390
    iget-object p2, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 391
    .line 392
    invoke-static {p2}, Ll/xmp0;->g5(Ll/xmp0;)V

    .line 393
    .line 394
    .line 395
    :cond_9
    iget-object p2, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 396
    .line 397
    invoke-static {p2}, Ll/xmp0;->h5(Ll/xmp0;)Z

    .line 398
    .line 399
    .line 400
    move-result p2

    .line 401
    if-eqz p2, :cond_a

    .line 402
    .line 403
    iget-object p2, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 404
    .line 405
    invoke-static {p2}, Ll/xmp0;->k5(Ll/xmp0;)Ljava/lang/String;

    .line 406
    .line 407
    .line 408
    move-result-object p3

    .line 409
    iget-object v0, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 410
    .line 411
    invoke-static {v0}, Ll/xmp0;->l5(Ll/xmp0;)Ljava/lang/String;

    .line 412
    .line 413
    .line 414
    move-result-object v0

    .line 415
    invoke-static {p2, p3, v0}, Ll/xmp0;->m5(Ll/xmp0;Ljava/lang/String;Ljava/lang/String;)I

    .line 416
    .line 417
    .line 418
    iget-object p2, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 419
    .line 420
    invoke-static {p2, v1}, Ll/xmp0;->i5(Ll/xmp0;Z)Z

    .line 421
    .line 422
    .line 423
    :cond_a
    :try_start_0
    new-instance p2, Lorg/json/JSONObject;

    .line 424
    .line 425
    invoke-direct {p2, p4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 426
    .line 427
    .line 428
    const-string p3, "join_type"

    .line 429
    .line 430
    invoke-virtual {p2, p3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 431
    .line 432
    .line 433
    move-result p2

    .line 434
    if-nez p2, :cond_c

    .line 435
    .line 436
    iget-object p2, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 437
    .line 438
    invoke-static {p2}, Ll/xmp0;->c3(Ll/xmp0;)Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 439
    .line 440
    .line 441
    move-result-object p2

    .line 442
    if-eqz p2, :cond_b

    .line 443
    .line 444
    iget-object p2, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 445
    .line 446
    invoke-static {p2}, Ll/xmp0;->c3(Ll/xmp0;)Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 447
    .line 448
    .line 449
    move-result-object p2

    .line 450
    iget-object p3, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 451
    .line 452
    invoke-static {p3}, Ll/xmp0;->K3(Ll/xmp0;)Ll/ror;

    .line 453
    .line 454
    .line 455
    move-result-object p3

    .line 456
    iget p3, p3, Ll/uow;->B0:I

    .line 457
    .line 458
    int-to-long p3, p3

    .line 459
    invoke-interface {p2, p1, p3, p4, v1}, Lcom/immomo/mediacore/coninf/MRtcEventHandler;->onJoinChannelSuccess(Ljava/lang/String;JI)V

    .line 460
    .line 461
    .line 462
    goto :goto_3

    .line 463
    :catch_0
    move-exception v0

    .line 464
    move-object p1, v0

    .line 465
    goto :goto_4

    .line 466
    :cond_b
    :goto_3
    iget-object p1, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 467
    .line 468
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 469
    .line 470
    .line 471
    move-result-wide p2

    .line 472
    invoke-static {p1, p2, p3}, Ll/xmp0;->o5(Ll/xmp0;J)J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 473
    .line 474
    .line 475
    goto :goto_5

    .line 476
    :goto_4
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 477
    .line 478
    .line 479
    :cond_c
    :goto_5
    iget-object p1, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 480
    .line 481
    invoke-static {p1, v2}, Ll/xmp0;->p5(Ll/xmp0;Z)Z

    .line 482
    .line 483
    .line 484
    iget-object p1, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 485
    .line 486
    invoke-static {p1}, Ll/xmp0;->R2(Ll/xmp0;)Ll/q210$a;

    .line 487
    .line 488
    .line 489
    move-result-object p1

    .line 490
    const/16 p2, 0x2000

    .line 491
    .line 492
    iget-object p3, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 493
    .line 494
    invoke-interface {p1, p2, v1, v1, p3}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 495
    .line 496
    .line 497
    iget-object p0, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 498
    .line 499
    invoke-virtual {p0}, Ll/xmp0;->c2()V

    .line 500
    .line 501
    .line 502
    return-void
.end method

.method public onRoomStats(Lcom/ss/bytertc/engine/type/RTCRoomStats;)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Ll/gjc0;->onRoomStats(Lcom/ss/bytertc/engine/type/RTCRoomStats;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 5
    .line 6
    invoke-static {v0, p1}, Ll/xmp0;->A5(Ll/xmp0;Lcom/ss/bytertc/engine/type/RTCRoomStats;)Lcom/ss/bytertc/engine/type/RTCRoomStats;

    .line 7
    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 12
    .line 13
    invoke-static {p1}, Ll/xmp0;->B5(Ll/xmp0;)Ll/wvx;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iget-wide v0, p1, Ll/wvx;->B:J

    .line 18
    .line 19
    iget-object v2, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 20
    .line 21
    invoke-static {v2}, Ll/xmp0;->z5(Ll/xmp0;)Lcom/ss/bytertc/engine/type/RTCRoomStats;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    iget-wide v2, v2, Lcom/ss/bytertc/engine/type/RTCRoomStats;->txBytes:J

    .line 26
    .line 27
    add-long/2addr v0, v2

    .line 28
    iput-wide v0, p1, Ll/wvx;->B:J

    .line 29
    .line 30
    iget-object p1, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 31
    .line 32
    invoke-static {p1}, Ll/xmp0;->C5(Ll/xmp0;)Ll/wvx;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    iget-object v0, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 37
    .line 38
    invoke-static {v0}, Ll/xmp0;->z5(Ll/xmp0;)Lcom/ss/bytertc/engine/type/RTCRoomStats;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iget v0, v0, Lcom/ss/bytertc/engine/type/RTCRoomStats;->txAudioKBitRate:I

    .line 43
    .line 44
    int-to-long v0, v0

    .line 45
    iput-wide v0, p1, Ll/wvx;->O:J

    .line 46
    .line 47
    iget-object p1, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 48
    .line 49
    invoke-static {p1}, Ll/xmp0;->D5(Ll/xmp0;)Ll/wvx;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    iget-wide v0, p1, Ll/wvx;->j:J

    .line 54
    .line 55
    iget-object v2, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 56
    .line 57
    invoke-static {v2}, Ll/xmp0;->z5(Ll/xmp0;)Lcom/ss/bytertc/engine/type/RTCRoomStats;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    iget-wide v2, v2, Lcom/ss/bytertc/engine/type/RTCRoomStats;->rxBytes:J

    .line 62
    .line 63
    add-long/2addr v0, v2

    .line 64
    iput-wide v0, p1, Ll/wvx;->j:J

    .line 65
    .line 66
    iget-object p1, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 67
    .line 68
    invoke-static {p1}, Ll/xmp0;->E5(Ll/xmp0;)Ll/wvx;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    iget-wide v0, p1, Ll/wvx;->k:J

    .line 73
    .line 74
    iget-object v2, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 75
    .line 76
    invoke-static {v2}, Ll/xmp0;->z5(Ll/xmp0;)Lcom/ss/bytertc/engine/type/RTCRoomStats;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    iget v2, v2, Lcom/ss/bytertc/engine/type/RTCRoomStats;->rxVideoKBitRate:I

    .line 81
    .line 82
    mul-int/lit16 v2, v2, 0x7d0

    .line 83
    .line 84
    div-int/lit8 v2, v2, 0x8

    .line 85
    .line 86
    int-to-long v2, v2

    .line 87
    add-long/2addr v0, v2

    .line 88
    iput-wide v0, p1, Ll/wvx;->k:J

    .line 89
    .line 90
    iget-object p1, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 91
    .line 92
    invoke-static {p1}, Ll/xmp0;->F5(Ll/xmp0;)Ll/wvx;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    iget-wide v0, p1, Ll/wvx;->l:J

    .line 97
    .line 98
    iget-object v2, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 99
    .line 100
    invoke-static {v2}, Ll/xmp0;->z5(Ll/xmp0;)Lcom/ss/bytertc/engine/type/RTCRoomStats;

    .line 101
    .line 102
    .line 103
    move-result-object v2

    .line 104
    iget v2, v2, Lcom/ss/bytertc/engine/type/RTCRoomStats;->rxAudioKBitRate:I

    .line 105
    .line 106
    mul-int/lit16 v2, v2, 0x7d0

    .line 107
    .line 108
    div-int/lit8 v2, v2, 0x8

    .line 109
    .line 110
    int-to-long v2, v2

    .line 111
    add-long/2addr v0, v2

    .line 112
    iput-wide v0, p1, Ll/wvx;->l:J

    .line 113
    .line 114
    iget-object p1, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 115
    .line 116
    invoke-static {p1}, Ll/xmp0;->G5(Ll/xmp0;)Ll/wvx;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    iget-wide v0, p1, Ll/wvx;->J0:J

    .line 121
    .line 122
    iget-object v2, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 123
    .line 124
    invoke-static {v2}, Ll/xmp0;->z5(Ll/xmp0;)Lcom/ss/bytertc/engine/type/RTCRoomStats;

    .line 125
    .line 126
    .line 127
    move-result-object v2

    .line 128
    iget v2, v2, Lcom/ss/bytertc/engine/type/RTCRoomStats;->txVideoKBitRate:I

    .line 129
    .line 130
    mul-int/lit16 v2, v2, 0x7d0

    .line 131
    .line 132
    div-int/lit8 v2, v2, 0x8

    .line 133
    .line 134
    int-to-long v2, v2

    .line 135
    add-long/2addr v0, v2

    .line 136
    iput-wide v0, p1, Ll/wvx;->J0:J

    .line 137
    .line 138
    iget-object p1, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 139
    .line 140
    invoke-static {p1}, Ll/xmp0;->t2(Ll/xmp0;)Ll/wvx;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    iget-wide v0, p1, Ll/wvx;->I0:J

    .line 145
    .line 146
    iget-object v2, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 147
    .line 148
    invoke-static {v2}, Ll/xmp0;->z5(Ll/xmp0;)Lcom/ss/bytertc/engine/type/RTCRoomStats;

    .line 149
    .line 150
    .line 151
    move-result-object v2

    .line 152
    iget v2, v2, Lcom/ss/bytertc/engine/type/RTCRoomStats;->txAudioKBitRate:I

    .line 153
    .line 154
    mul-int/lit16 v2, v2, 0x7d0

    .line 155
    .line 156
    div-int/lit8 v2, v2, 0x8

    .line 157
    .line 158
    int-to-long v2, v2

    .line 159
    add-long/2addr v0, v2

    .line 160
    iput-wide v0, p1, Ll/wvx;->I0:J

    .line 161
    .line 162
    iget-object p1, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 163
    .line 164
    invoke-static {p1}, Ll/xmp0;->u2(Ll/xmp0;)J

    .line 165
    .line 166
    .line 167
    move-result-wide v0

    .line 168
    iget-object v2, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 169
    .line 170
    invoke-static {v2}, Ll/xmp0;->z5(Ll/xmp0;)Lcom/ss/bytertc/engine/type/RTCRoomStats;

    .line 171
    .line 172
    .line 173
    move-result-object v2

    .line 174
    iget v2, v2, Lcom/ss/bytertc/engine/type/RTCRoomStats;->txVideoKBitRate:I

    .line 175
    .line 176
    mul-int/lit16 v2, v2, 0x7d0

    .line 177
    .line 178
    div-int/lit8 v2, v2, 0x8

    .line 179
    .line 180
    int-to-long v2, v2

    .line 181
    add-long/2addr v0, v2

    .line 182
    invoke-static {p1, v0, v1}, Ll/xmp0;->v2(Ll/xmp0;J)J

    .line 183
    .line 184
    .line 185
    iget-object p1, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 186
    .line 187
    invoke-static {p1}, Ll/xmp0;->w2(Ll/xmp0;)J

    .line 188
    .line 189
    .line 190
    move-result-wide v0

    .line 191
    iget-object v2, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 192
    .line 193
    invoke-static {v2}, Ll/xmp0;->z5(Ll/xmp0;)Lcom/ss/bytertc/engine/type/RTCRoomStats;

    .line 194
    .line 195
    .line 196
    move-result-object v2

    .line 197
    iget v2, v2, Lcom/ss/bytertc/engine/type/RTCRoomStats;->txAudioKBitRate:I

    .line 198
    .line 199
    mul-int/lit16 v2, v2, 0x7d0

    .line 200
    .line 201
    div-int/lit8 v2, v2, 0x8

    .line 202
    .line 203
    int-to-long v2, v2

    .line 204
    add-long/2addr v0, v2

    .line 205
    invoke-static {p1, v0, v1}, Ll/xmp0;->x2(Ll/xmp0;J)J

    .line 206
    .line 207
    .line 208
    iget-object p1, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 209
    .line 210
    invoke-static {p1}, Ll/xmp0;->y2(Ll/xmp0;)I

    .line 211
    .line 212
    .line 213
    move-result v0

    .line 214
    iget-object p0, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 215
    .line 216
    invoke-static {p0}, Ll/xmp0;->z5(Ll/xmp0;)Lcom/ss/bytertc/engine/type/RTCRoomStats;

    .line 217
    .line 218
    .line 219
    move-result-object p0

    .line 220
    iget p0, p0, Lcom/ss/bytertc/engine/type/RTCRoomStats;->rxVideoKBitRate:I

    .line 221
    .line 222
    mul-int/lit16 p0, p0, 0x7d0

    .line 223
    .line 224
    div-int/lit8 p0, p0, 0x8

    .line 225
    .line 226
    add-int/2addr v0, p0

    .line 227
    invoke-static {p1, v0}, Ll/xmp0;->z2(Ll/xmp0;I)I

    .line 228
    .line 229
    .line 230
    :cond_0
    return-void
.end method

.method public onSubtitleMessageReceived([Lcom/ss/bytertc/engine/type/SubtitleMessage;)V
    .locals 11

    .line 1
    invoke-super {p0, p1}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onSubtitleMessageReceived([Lcom/ss/bytertc/engine/type/SubtitleMessage;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 5
    .line 6
    invoke-static {v0}, Ll/xmp0;->b3(Ll/xmp0;)Ll/f5m;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    goto/16 :goto_5

    .line 13
    .line 14
    :cond_0
    if-nez p1, :cond_1

    .line 15
    .line 16
    iget-object p0, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 17
    .line 18
    invoke-static {p0}, Ll/xmp0;->b3(Ll/xmp0;)Ll/f5m;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const/4 p1, 0x0

    .line 23
    invoke-interface {p0, p1}, Ll/f5m;->b(Ll/inw;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    array-length v0, p1

    .line 28
    const/4 v1, 0x0

    .line 29
    :goto_0
    if-ge v1, v0, :cond_5

    .line 30
    .line 31
    aget-object v2, p1, v1

    .line 32
    .line 33
    if-nez v2, :cond_2

    .line 34
    .line 35
    goto :goto_4

    .line 36
    :cond_2
    iget-object v4, v2, Lcom/ss/bytertc/engine/type/SubtitleMessage;->userId:Ljava/lang/String;

    .line 37
    .line 38
    iget-object v5, v2, Lcom/ss/bytertc/engine/type/SubtitleMessage;->text:Ljava/lang/String;

    .line 39
    .line 40
    iget-object v6, v2, Lcom/ss/bytertc/engine/type/SubtitleMessage;->language:Ljava/lang/String;

    .line 41
    .line 42
    iget-object v3, v2, Lcom/ss/bytertc/engine/type/SubtitleMessage;->mode:Lcom/ss/bytertc/engine/type/SubtitleMode;

    .line 43
    .line 44
    if-eqz v3, :cond_3

    .line 45
    .line 46
    invoke-virtual {v3}, Lcom/ss/bytertc/engine/type/SubtitleMode;->value()I

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    invoke-static {v3}, Lcom/momo/piplineext/bean/MMLiveSubtitleMode;->fromId(I)Lcom/momo/piplineext/bean/MMLiveSubtitleMode;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    :goto_1
    move-object v7, v3

    .line 55
    goto :goto_2

    .line 56
    :cond_3
    sget-object v3, Lcom/momo/piplineext/bean/MMLiveSubtitleMode;->SUBTITLE_MODE_RECOGNITION:Lcom/momo/piplineext/bean/MMLiveSubtitleMode;

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :goto_2
    iget v8, v2, Lcom/ss/bytertc/engine/type/SubtitleMessage;->sequence:I

    .line 60
    .line 61
    iget-boolean v9, v2, Lcom/ss/bytertc/engine/type/SubtitleMessage;->definite:Z

    .line 62
    .line 63
    iget-object v2, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 64
    .line 65
    invoke-static {v2}, Ll/xmp0;->d3(Ll/xmp0;)Ll/inw;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    iget-object v10, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 70
    .line 71
    if-nez v2, :cond_4

    .line 72
    .line 73
    new-instance v3, Ll/inw;

    .line 74
    .line 75
    invoke-direct/range {v3 .. v9}, Ll/inw;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/momo/piplineext/bean/MMLiveSubtitleMode;IZ)V

    .line 76
    .line 77
    .line 78
    invoke-static {v10, v3}, Ll/xmp0;->e3(Ll/xmp0;Ll/inw;)Ll/inw;

    .line 79
    .line 80
    .line 81
    goto :goto_3

    .line 82
    :cond_4
    invoke-static {v10}, Ll/xmp0;->d3(Ll/xmp0;)Ll/inw;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    iput-object v4, v2, Ll/inw;->a:Ljava/lang/String;

    .line 87
    .line 88
    iget-object v2, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 89
    .line 90
    invoke-static {v2}, Ll/xmp0;->d3(Ll/xmp0;)Ll/inw;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    iput-object v5, v2, Ll/inw;->b:Ljava/lang/String;

    .line 95
    .line 96
    iget-object v2, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 97
    .line 98
    invoke-static {v2}, Ll/xmp0;->d3(Ll/xmp0;)Ll/inw;

    .line 99
    .line 100
    .line 101
    move-result-object v2

    .line 102
    iput-object v6, v2, Ll/inw;->c:Ljava/lang/String;

    .line 103
    .line 104
    iget-object v2, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 105
    .line 106
    invoke-static {v2}, Ll/xmp0;->d3(Ll/xmp0;)Ll/inw;

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    iput-object v7, v2, Ll/inw;->d:Lcom/momo/piplineext/bean/MMLiveSubtitleMode;

    .line 111
    .line 112
    iget-object v2, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 113
    .line 114
    invoke-static {v2}, Ll/xmp0;->d3(Ll/xmp0;)Ll/inw;

    .line 115
    .line 116
    .line 117
    move-result-object v2

    .line 118
    iput v8, v2, Ll/inw;->e:I

    .line 119
    .line 120
    iget-object v2, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 121
    .line 122
    invoke-static {v2}, Ll/xmp0;->d3(Ll/xmp0;)Ll/inw;

    .line 123
    .line 124
    .line 125
    move-result-object v2

    .line 126
    iput-boolean v9, v2, Ll/inw;->f:Z

    .line 127
    .line 128
    :goto_3
    iget-object v2, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 129
    .line 130
    invoke-static {v2}, Ll/xmp0;->b3(Ll/xmp0;)Ll/f5m;

    .line 131
    .line 132
    .line 133
    move-result-object v2

    .line 134
    iget-object v3, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 135
    .line 136
    invoke-static {v3}, Ll/xmp0;->d3(Ll/xmp0;)Ll/inw;

    .line 137
    .line 138
    .line 139
    move-result-object v3

    .line 140
    invoke-interface {v2, v3}, Ll/f5m;->b(Ll/inw;)V

    .line 141
    .line 142
    .line 143
    :goto_4
    add-int/lit8 v1, v1, 0x1

    .line 144
    .line 145
    goto :goto_0

    .line 146
    :cond_5
    :goto_5
    return-void
.end method

.method public onSubtitleStateChanged(Lcom/ss/bytertc/engine/type/SubtitleState;Lcom/ss/bytertc/engine/type/SubtitleErrorCode;Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onSubtitleStateChanged(Lcom/ss/bytertc/engine/type/SubtitleState;Lcom/ss/bytertc/engine/type/SubtitleErrorCode;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    new-instance v1, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    const-string v2, "onSubtitleStateChanged state\uff1a"

    .line 11
    .line 12
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v2, " error code\uff1a"

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v2, " error message\uff1a"

    .line 27
    .line 28
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v0, v1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    sget-object v0, Lcom/ss/bytertc/engine/type/SubtitleState;->SUBTITLE_STATE_STARTED:Lcom/ss/bytertc/engine/type/SubtitleState;

    .line 46
    .line 47
    if-ne p1, v0, :cond_0

    .line 48
    .line 49
    iget-object v0, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 50
    .line 51
    invoke-static {v0}, Ll/xmp0;->Z2(Ll/xmp0;)Ll/wvx;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    const/4 v1, 0x1

    .line 56
    iput v1, v0, Ll/wvx;->p1:I

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_0
    sget-object v0, Lcom/ss/bytertc/engine/type/SubtitleState;->SUBTITLE_STATE_STOPED:Lcom/ss/bytertc/engine/type/SubtitleState;

    .line 60
    .line 61
    if-ne p1, v0, :cond_1

    .line 62
    .line 63
    iget-object v0, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 64
    .line 65
    invoke-static {v0}, Ll/xmp0;->a3(Ll/xmp0;)Ll/wvx;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    const/4 v1, 0x0

    .line 70
    iput v1, v0, Ll/wvx;->p1:I

    .line 71
    .line 72
    :cond_1
    :goto_0
    iget-object v0, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 73
    .line 74
    invoke-static {v0}, Ll/xmp0;->b3(Ll/xmp0;)Ll/f5m;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    if-eqz v0, :cond_2

    .line 79
    .line 80
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/type/SubtitleState;->value()I

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    invoke-static {v0}, Lcom/momo/piplineext/bean/MMLiveSubtitleState;->fromId(I)Lcom/momo/piplineext/bean/MMLiveSubtitleState;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-virtual {p2}, Lcom/ss/bytertc/engine/type/SubtitleErrorCode;->value()I

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    invoke-static {v1}, Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;->fromId(I)Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    iget-object p0, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 97
    .line 98
    invoke-static {p0}, Ll/xmp0;->b3(Ll/xmp0;)Ll/f5m;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    invoke-interface {p0, v0, v1, p3}, Ll/f5m;->a(Lcom/momo/piplineext/bean/MMLiveSubtitleState;Lcom/momo/piplineext/bean/MMLiveSubtitleErrorCode;Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    :cond_2
    sget-object p0, Lcom/ss/bytertc/engine/type/SubtitleState;->SUBTITLE_STATE_ERROR:Lcom/ss/bytertc/engine/type/SubtitleState;

    .line 106
    .line 107
    if-ne p1, p0, :cond_3

    .line 108
    .line 109
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    const-string p1, "volc"

    .line 114
    .line 115
    invoke-virtual {p2}, Lcom/ss/bytertc/engine/type/SubtitleErrorCode;->value()I

    .line 116
    .line 117
    .line 118
    move-result p2

    .line 119
    invoke-virtual {p0, p1, p2, p3}, Ll/b7y;->i(Ljava/lang/String;ILjava/lang/String;)V

    .line 120
    .line 121
    .line 122
    :cond_3
    return-void
.end method

.method public onTokenWillExpire()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/xmp0;->V2(Ll/xmp0;)Ll/evx;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "onTokenWillExpire"

    .line 8
    .line 9
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 17
    .line 18
    invoke-static {v0}, Ll/xmp0;->W2(Ll/xmp0;)Lcom/immomo/mediacore/coninf/MRtcTokenWillExpireHander;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iget-object v0, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 25
    .line 26
    invoke-static {v0}, Ll/xmp0;->W2(Ll/xmp0;)Lcom/immomo/mediacore/coninf/MRtcTokenWillExpireHander;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const-string v1, ""

    .line 31
    .line 32
    invoke-interface {v0, v1}, Lcom/immomo/mediacore/coninf/MRtcTokenWillExpireHander;->onTokenPrivilegeWillExpire(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    iget-object v0, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 36
    .line 37
    invoke-static {v0}, Ll/xmp0;->K4(Ll/xmp0;)Lcom/immomo/mediacore/coninf/MRtcChannelHandler;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    iget-object p0, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 44
    .line 45
    invoke-static {p0}, Ll/xmp0;->K4(Ll/xmp0;)Lcom/immomo/mediacore/coninf/MRtcChannelHandler;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-interface {p0}, Lcom/immomo/mediacore/coninf/MRtcChannelHandler;->onRequestChannelKey()V

    .line 50
    .line 51
    .line 52
    :cond_1
    return-void
.end method

.method public onUserJoined(Lcom/ss/bytertc/engine/UserInfo;)V
    .locals 14

    .line 1
    iget-object v0, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/xmp0;->t5(Ll/xmp0;)Ll/evx;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v2, "uid:"

    .line 10
    .line 11
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/UserInfo;->getUid()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const-string v2, "onUserJoined"

    .line 26
    .line 27
    filled-new-array {v2, v1}, [Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/UserInfo;->getUid()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-static {v0}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 43
    .line 44
    .line 45
    move-result-wide v6

    .line 46
    new-instance v1, Ll/xhy;

    .line 47
    .line 48
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/UserInfo;->getUid()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-static {p1}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 57
    .line 58
    .line 59
    move-result-wide v3

    .line 60
    iget-object p1, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 61
    .line 62
    invoke-virtual {p1}, Ll/xmp0;->w1()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    const-string v5, "S"

    .line 67
    .line 68
    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    const/4 v12, 0x1

    .line 73
    if-eqz p1, :cond_0

    .line 74
    .line 75
    move p1, v12

    .line 76
    goto :goto_0

    .line 77
    :cond_0
    const/4 p1, 0x2

    .line 78
    :goto_0
    invoke-direct {v1, v3, v4, p1}, Ll/xhy;-><init>(JI)V

    .line 79
    .line 80
    .line 81
    iget-object p1, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 82
    .line 83
    invoke-static {p1}, Ll/xmp0;->v5(Ll/xmp0;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    invoke-virtual {p1, v0, v1}, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    iget-object p1, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 91
    .line 92
    invoke-static {p1}, Ll/xmp0;->n5(Ll/xmp0;)J

    .line 93
    .line 94
    .line 95
    move-result-wide v3

    .line 96
    const-wide/16 v8, -0x1

    .line 97
    .line 98
    cmp-long p1, v3, v8

    .line 99
    .line 100
    if-eqz p1, :cond_1

    .line 101
    .line 102
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 103
    .line 104
    .line 105
    move-result-wide v3

    .line 106
    invoke-virtual {v1, v3, v4}, Ll/xhy;->j(J)V

    .line 107
    .line 108
    .line 109
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 110
    .line 111
    .line 112
    move-result-wide v3

    .line 113
    iget-object p1, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 114
    .line 115
    invoke-static {p1}, Ll/xmp0;->n5(Ll/xmp0;)J

    .line 116
    .line 117
    .line 118
    move-result-wide v8

    .line 119
    sub-long/2addr v3, v8

    .line 120
    invoke-virtual {v1, v3, v4}, Ll/xhy;->i(J)V

    .line 121
    .line 122
    .line 123
    :cond_1
    iget-object p1, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 124
    .line 125
    invoke-static {p1}, Ll/xmp0;->u5(Ll/xmp0;)Ll/wvx;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    iget-wide v3, p1, Ll/wvx;->c1:J

    .line 130
    .line 131
    const-wide/16 v8, 0x1

    .line 132
    .line 133
    cmp-long p1, v3, v8

    .line 134
    .line 135
    if-nez p1, :cond_2

    .line 136
    .line 137
    iget-object p1, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 138
    .line 139
    invoke-static {p1}, Ll/xmp0;->w5(Ll/xmp0;)Ll/evx;

    .line 140
    .line 141
    .line 142
    move-result-object v3

    .line 143
    invoke-virtual {v1}, Ll/xhy;->c()I

    .line 144
    .line 145
    .line 146
    move-result v5

    .line 147
    iget-object p1, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 148
    .line 149
    invoke-static {p1}, Ll/xmp0;->s2(Ll/xmp0;)J

    .line 150
    .line 151
    .line 152
    move-result-wide v8

    .line 153
    invoke-virtual {v1}, Ll/xhy;->a()J

    .line 154
    .line 155
    .line 156
    move-result-wide v10

    .line 157
    const/4 v4, 0x1

    .line 158
    invoke-virtual/range {v3 .. v11}, Ll/evx;->e(ZIJJJ)V

    .line 159
    .line 160
    .line 161
    :cond_2
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 162
    .line 163
    .line 164
    move-result-object p1

    .line 165
    new-instance v3, Ljava/lang/StringBuilder;

    .line 166
    .line 167
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 168
    .line 169
    .line 170
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 171
    .line 172
    .line 173
    move-result-object v4

    .line 174
    invoke-virtual {v4}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v4

    .line 178
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 179
    .line 180
    .line 181
    const-string v4, " onUserJoined:uid:"

    .line 182
    .line 183
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 184
    .line 185
    .line 186
    invoke-virtual {v3, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 187
    .line 188
    .line 189
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object v3

    .line 193
    const-string v4, "Pipeline_Normal_pip->PIPLINE->VOLC"

    .line 194
    .line 195
    invoke-virtual {p1, v4, v3}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 196
    .line 197
    .line 198
    iget-object p1, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 199
    .line 200
    invoke-static {p1}, Ll/xmp0;->x5(Ll/xmp0;)Ll/evx;

    .line 201
    .line 202
    .line 203
    move-result-object p1

    .line 204
    new-instance v3, Ljava/lang/StringBuilder;

    .line 205
    .line 206
    const-string v4, "isAudioOnly:"

    .line 207
    .line 208
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 209
    .line 210
    .line 211
    iget-object v4, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 212
    .line 213
    invoke-static {v4}, Ll/xmp0;->d5(Ll/xmp0;)Z

    .line 214
    .line 215
    .line 216
    move-result v4

    .line 217
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 218
    .line 219
    .line 220
    const-string v4, ",mIsAgnoreSET:"

    .line 221
    .line 222
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 223
    .line 224
    .line 225
    iget-object v4, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 226
    .line 227
    invoke-static {v4}, Ll/xmp0;->e5(Ll/xmp0;)Z

    .line 228
    .line 229
    .line 230
    move-result v4

    .line 231
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 232
    .line 233
    .line 234
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object v3

    .line 238
    filled-new-array {v2, v3}, [Ljava/lang/Object;

    .line 239
    .line 240
    .line 241
    move-result-object v2

    .line 242
    invoke-virtual {p1, v2}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 243
    .line 244
    .line 245
    iget-object p1, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 246
    .line 247
    invoke-static {p1}, Ll/xmp0;->d5(Ll/xmp0;)Z

    .line 248
    .line 249
    .line 250
    move-result p1

    .line 251
    const/4 v2, 0x0

    .line 252
    if-nez p1, :cond_3

    .line 253
    .line 254
    iget-object p1, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 255
    .line 256
    invoke-static {p1}, Ll/xmp0;->e5(Ll/xmp0;)Z

    .line 257
    .line 258
    .line 259
    move-result p1

    .line 260
    if-eqz p1, :cond_4

    .line 261
    .line 262
    :cond_3
    iget-object p1, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 263
    .line 264
    invoke-static {p1}, Ll/xmp0;->K3(Ll/xmp0;)Ll/ror;

    .line 265
    .line 266
    .line 267
    move-result-object p1

    .line 268
    iget p1, p1, Ll/ror;->i1:I

    .line 269
    .line 270
    int-to-long v3, p1

    .line 271
    cmp-long p1, v3, v6

    .line 272
    .line 273
    if-eqz p1, :cond_4

    .line 274
    .line 275
    invoke-virtual {v1, v12}, Ll/xhy;->f(Z)V

    .line 276
    .line 277
    .line 278
    invoke-virtual {v1, v12}, Ll/xhy;->g(Z)V

    .line 279
    .line 280
    .line 281
    iget-object p1, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 282
    .line 283
    invoke-static {p1}, Ll/xmp0;->y5(Ll/xmp0;)Ll/evx;

    .line 284
    .line 285
    .line 286
    move-result-object v3

    .line 287
    invoke-virtual {v1}, Ll/xhy;->c()I

    .line 288
    .line 289
    .line 290
    move-result v5

    .line 291
    iget-object p1, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 292
    .line 293
    invoke-static {p1}, Ll/xmp0;->s2(Ll/xmp0;)J

    .line 294
    .line 295
    .line 296
    move-result-wide v8

    .line 297
    invoke-virtual {v1}, Ll/xhy;->a()J

    .line 298
    .line 299
    .line 300
    move-result-wide v10

    .line 301
    const-wide/16 v12, -0x1

    .line 302
    .line 303
    const/4 v4, 0x1

    .line 304
    invoke-virtual/range {v3 .. v13}, Ll/evx;->c(ZIJJJJ)V

    .line 305
    .line 306
    .line 307
    iget-object p1, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 308
    .line 309
    invoke-static {p1}, Ll/xmp0;->R2(Ll/xmp0;)Ll/q210$a;

    .line 310
    .line 311
    .line 312
    move-result-object p1

    .line 313
    long-to-int v1, v6

    .line 314
    iget-object v3, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 315
    .line 316
    const/16 v4, 0x2006

    .line 317
    .line 318
    invoke-interface {p1, v4, v1, v2, v3}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 319
    .line 320
    .line 321
    iget-object p1, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 322
    .line 323
    invoke-static {p1}, Ll/xmp0;->g4(Ll/xmp0;)Landroid/os/Handler;

    .line 324
    .line 325
    .line 326
    move-result-object p1

    .line 327
    new-instance v1, Ll/xmp0$g$b;

    .line 328
    .line 329
    invoke-direct {v1, p0, v6, v7}, Ll/xmp0$g$b;-><init>(Ll/xmp0$g;J)V

    .line 330
    .line 331
    .line 332
    invoke-virtual {p1, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 333
    .line 334
    .line 335
    :cond_4
    iget-object p1, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 336
    .line 337
    invoke-static {p1}, Ll/xmp0;->A4(Ll/xmp0;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 338
    .line 339
    .line 340
    move-result-object p1

    .line 341
    new-instance v1, Ll/iny;

    .line 342
    .line 343
    invoke-direct {v1, v6, v7}, Ll/iny;-><init>(J)V

    .line 344
    .line 345
    .line 346
    invoke-virtual {p1, v0, v1}, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 347
    .line 348
    .line 349
    iget-object p1, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 350
    .line 351
    invoke-static {p1}, Ll/xmp0;->c3(Ll/xmp0;)Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 352
    .line 353
    .line 354
    move-result-object p1

    .line 355
    if-eqz p1, :cond_5

    .line 356
    .line 357
    iget-object p0, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 358
    .line 359
    invoke-static {p0}, Ll/xmp0;->c3(Ll/xmp0;)Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 360
    .line 361
    .line 362
    move-result-object p0

    .line 363
    const-string p1, ""

    .line 364
    .line 365
    invoke-interface {p0, p1, v6, v7, v2}, Lcom/immomo/mediacore/coninf/MRtcEventHandler;->onJoinChannelSuccess(Ljava/lang/String;JI)V

    .line 366
    .line 367
    .line 368
    :cond_5
    return-void
.end method

.method public onUserLeave(Ljava/lang/String;I)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move/from16 v7, p2

    .line 6
    .line 7
    iget-object v2, v0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 8
    .line 9
    invoke-static {v2}, Ll/xmp0;->C2(Ll/xmp0;)Ll/evx;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    new-instance v3, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v4, "onUserOffline uid:"

    .line 16
    .line 17
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v12, ",reason:"

    .line 24
    .line 25
    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    invoke-virtual {v2, v3}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    new-instance v2, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    const-string v3, "onUserLeave,userid:"

    .line 45
    .line 46
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    const-string v4, "lqdebug"

    .line 57
    .line 58
    invoke-static {v4, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    .line 60
    .line 61
    invoke-static {v1}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    .line 62
    .line 63
    .line 64
    move-result-object v13

    .line 65
    invoke-virtual {v13}, Ljava/lang/Long;->longValue()J

    .line 66
    .line 67
    .line 68
    move-result-wide v5

    .line 69
    iget-object v2, v0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 70
    .line 71
    invoke-static {v2}, Ll/xmp0;->A4(Ll/xmp0;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    const-wide/16 v8, 0x0

    .line 76
    .line 77
    if-eqz v2, :cond_1

    .line 78
    .line 79
    iget-object v2, v0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 80
    .line 81
    invoke-static {v2}, Ll/xmp0;->A4(Ll/xmp0;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    invoke-virtual {v2, v13}, Ljava/util/AbstractMap;->containsKey(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result v2

    .line 89
    if-eqz v2, :cond_1

    .line 90
    .line 91
    iget-object v2, v0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 92
    .line 93
    invoke-static {v2}, Ll/xmp0;->A4(Ll/xmp0;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    invoke-virtual {v2, v13}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    check-cast v2, Ll/iny;

    .line 102
    .line 103
    if-eqz v2, :cond_0

    .line 104
    .line 105
    iget-wide v8, v2, Ll/iny;->d:J

    .line 106
    .line 107
    :cond_0
    iget-object v2, v0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 108
    .line 109
    invoke-static {v2}, Ll/xmp0;->A4(Ll/xmp0;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 110
    .line 111
    .line 112
    move-result-object v2

    .line 113
    invoke-virtual {v2, v13}, Ljava/util/AbstractMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    :cond_1
    iget-object v2, v0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 117
    .line 118
    invoke-static {v2}, Ll/xmp0;->v5(Ll/xmp0;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 119
    .line 120
    .line 121
    move-result-object v2

    .line 122
    if-eqz v2, :cond_3

    .line 123
    .line 124
    iget-object v2, v0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 125
    .line 126
    invoke-static {v2}, Ll/xmp0;->v5(Ll/xmp0;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 127
    .line 128
    .line 129
    move-result-object v2

    .line 130
    invoke-virtual {v2, v13}, Ljava/util/AbstractMap;->containsKey(Ljava/lang/Object;)Z

    .line 131
    .line 132
    .line 133
    move-result v2

    .line 134
    if-eqz v2, :cond_3

    .line 135
    .line 136
    new-instance v2, Ljava/lang/StringBuilder;

    .line 137
    .line 138
    const-string v10, "onMemberExit userid "

    .line 139
    .line 140
    invoke-direct {v2, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    invoke-virtual {v2, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    const-string v10, " reason "

    .line 147
    .line 148
    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object v2

    .line 158
    const-string v10, "zhengjijian"

    .line 159
    .line 160
    invoke-static {v10, v2}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 161
    .line 162
    .line 163
    new-instance v2, Ljava/lang/StringBuilder;

    .line 164
    .line 165
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 166
    .line 167
    .line 168
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 169
    .line 170
    .line 171
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object v2

    .line 175
    invoke-static {v4, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 176
    .line 177
    .line 178
    iget-object v2, v0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 179
    .line 180
    invoke-static {v2}, Ll/xmp0;->D2(Ll/xmp0;)Ll/wvx;

    .line 181
    .line 182
    .line 183
    move-result-object v2

    .line 184
    iget-wide v2, v2, Ll/wvx;->c1:J

    .line 185
    .line 186
    const-wide/16 v10, 0x1

    .line 187
    .line 188
    cmp-long v2, v2, v10

    .line 189
    .line 190
    if-nez v2, :cond_2

    .line 191
    .line 192
    iget-object v2, v0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 193
    .line 194
    invoke-static {v2}, Ll/xmp0;->E2(Ll/xmp0;)Ll/evx;

    .line 195
    .line 196
    .line 197
    move-result-object v2

    .line 198
    iget-object v3, v0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 199
    .line 200
    invoke-static {v3}, Ll/xmp0;->v5(Ll/xmp0;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 201
    .line 202
    .line 203
    move-result-object v3

    .line 204
    invoke-virtual {v3, v13}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 205
    .line 206
    .line 207
    move-result-object v3

    .line 208
    check-cast v3, Ll/xhy;

    .line 209
    .line 210
    invoke-virtual {v3}, Ll/xhy;->c()I

    .line 211
    .line 212
    .line 213
    move-result v4

    .line 214
    const/4 v3, 0x1

    .line 215
    invoke-virtual/range {v2 .. v7}, Ll/evx;->d(ZIJI)V

    .line 216
    .line 217
    .line 218
    iget-object v2, v0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 219
    .line 220
    invoke-static {v2}, Ll/xmp0;->F2(Ll/xmp0;)Ll/evx;

    .line 221
    .line 222
    .line 223
    move-result-object v2

    .line 224
    iget-object v3, v0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 225
    .line 226
    invoke-static {v3}, Ll/xmp0;->v5(Ll/xmp0;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 227
    .line 228
    .line 229
    move-result-object v3

    .line 230
    invoke-virtual {v3, v13}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 231
    .line 232
    .line 233
    move-result-object v3

    .line 234
    check-cast v3, Ll/xhy;

    .line 235
    .line 236
    invoke-virtual {v3}, Ll/xhy;->c()I

    .line 237
    .line 238
    .line 239
    move-result v4

    .line 240
    move-wide v14, v8

    .line 241
    move-wide v9, v5

    .line 242
    move-wide v5, v14

    .line 243
    const-wide/16 v7, 0x0

    .line 244
    .line 245
    const/4 v3, 0x1

    .line 246
    move/from16 v11, p2

    .line 247
    .line 248
    invoke-virtual/range {v2 .. v11}, Ll/evx;->f(ZIJJJI)V

    .line 249
    .line 250
    .line 251
    move-wide v5, v9

    .line 252
    move v7, v11

    .line 253
    :cond_2
    iget-object v2, v0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 254
    .line 255
    invoke-static {v2}, Ll/xmp0;->R2(Ll/xmp0;)Ll/q210$a;

    .line 256
    .line 257
    .line 258
    move-result-object v2

    .line 259
    long-to-int v3, v5

    .line 260
    const/4 v4, 0x0

    .line 261
    iget-object v8, v0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 262
    .line 263
    const/16 v9, 0x2007

    .line 264
    .line 265
    invoke-interface {v2, v9, v3, v4, v8}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 266
    .line 267
    .line 268
    :cond_3
    iget-object v2, v0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 269
    .line 270
    invoke-static {v2}, Ll/xmp0;->W3(Ll/xmp0;)Ll/ebl0;

    .line 271
    .line 272
    .line 273
    move-result-object v2

    .line 274
    const-string v3, "Pipeline_Normal_pip->PIPLINE->VOLC"

    .line 275
    .line 276
    if-eqz v2, :cond_6

    .line 277
    .line 278
    iget-object v2, v0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 279
    .line 280
    invoke-static {v2}, Ll/xmp0;->o3(Ll/xmp0;)Z

    .line 281
    .line 282
    .line 283
    move-result v2

    .line 284
    if-eqz v2, :cond_4

    .line 285
    .line 286
    iget-object v2, v0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 287
    .line 288
    invoke-static {v2}, Ll/xmp0;->d5(Ll/xmp0;)Z

    .line 289
    .line 290
    .line 291
    move-result v2

    .line 292
    if-nez v2, :cond_4

    .line 293
    .line 294
    iget-object v2, v0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 295
    .line 296
    invoke-static {v2}, Ll/xmp0;->e5(Ll/xmp0;)Z

    .line 297
    .line 298
    .line 299
    move-result v2

    .line 300
    if-eqz v2, :cond_6

    .line 301
    .line 302
    :cond_4
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 303
    .line 304
    .line 305
    move-result-object v2

    .line 306
    new-instance v4, Ljava/lang/StringBuilder;

    .line 307
    .line 308
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 309
    .line 310
    .line 311
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 312
    .line 313
    .line 314
    move-result-object v8

    .line 315
    invoke-virtual {v8}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 316
    .line 317
    .line 318
    move-result-object v8

    .line 319
    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 320
    .line 321
    .line 322
    const-string v8, "----onVideoChannelRemove userID="

    .line 323
    .line 324
    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 325
    .line 326
    .line 327
    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 328
    .line 329
    .line 330
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 331
    .line 332
    .line 333
    move-result-object v4

    .line 334
    invoke-virtual {v2, v3, v4}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 335
    .line 336
    .line 337
    iget-object v2, v0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 338
    .line 339
    invoke-static {v2}, Ll/xmp0;->W3(Ll/xmp0;)Ll/ebl0;

    .line 340
    .line 341
    .line 342
    move-result-object v2

    .line 343
    invoke-interface {v2, v5, v6, v7}, Ll/ebl0;->b(JI)V

    .line 344
    .line 345
    .line 346
    iget-object v2, v0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 347
    .line 348
    iget-object v4, v2, Ll/xmp0;->U1:Lcom/ss/bytertc/engine/RTCEngineEx;

    .line 349
    .line 350
    if-eqz v4, :cond_5

    .line 351
    .line 352
    invoke-static {v2}, Ll/xmp0;->V3(Ll/xmp0;)Ljava/util/ArrayList;

    .line 353
    .line 354
    .line 355
    move-result-object v2

    .line 356
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 357
    .line 358
    .line 359
    move-result v2

    .line 360
    if-eqz v2, :cond_5

    .line 361
    .line 362
    iget-object v2, v0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 363
    .line 364
    invoke-static {v2}, Ll/xmp0;->H2(Ll/xmp0;)Ll/evx;

    .line 365
    .line 366
    .line 367
    move-result-object v2

    .line 368
    const-string v4, "setRemoteVideoCanvas 0531"

    .line 369
    .line 370
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 371
    .line 372
    .line 373
    move-result-object v4

    .line 374
    invoke-virtual {v2, v4}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 375
    .line 376
    .line 377
    new-instance v2, Lcom/ss/bytertc/engine/data/RemoteStreamKey;

    .line 378
    .line 379
    iget-object v4, v0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 380
    .line 381
    invoke-static {v4}, Ll/xmp0;->K3(Ll/xmp0;)Ll/ror;

    .line 382
    .line 383
    .line 384
    move-result-object v4

    .line 385
    iget-object v4, v4, Ll/ror;->g1:Ljava/lang/String;

    .line 386
    .line 387
    sget-object v8, Lcom/ss/bytertc/engine/data/StreamIndex;->STREAM_INDEX_MAIN:Lcom/ss/bytertc/engine/data/StreamIndex;

    .line 388
    .line 389
    invoke-direct {v2, v4, v1, v8}, Lcom/ss/bytertc/engine/data/RemoteStreamKey;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/ss/bytertc/engine/data/StreamIndex;)V

    .line 390
    .line 391
    .line 392
    iget-object v4, v0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 393
    .line 394
    iget-object v4, v4, Ll/xmp0;->U1:Lcom/ss/bytertc/engine/RTCEngineEx;

    .line 395
    .line 396
    const/4 v8, 0x0

    .line 397
    invoke-virtual {v4, v2, v8}, Lcom/ss/bytertc/engine/RTCEngine;->setRemoteVideoCanvas(Lcom/ss/bytertc/engine/data/RemoteStreamKey;Lcom/ss/bytertc/engine/VideoCanvas;)I

    .line 398
    .line 399
    .line 400
    iget-object v2, v0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 401
    .line 402
    invoke-static {v2}, Ll/xmp0;->V3(Ll/xmp0;)Ljava/util/ArrayList;

    .line 403
    .line 404
    .line 405
    move-result-object v2

    .line 406
    invoke-virtual {v2, v13}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 407
    .line 408
    .line 409
    :cond_5
    iget-object v2, v0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 410
    .line 411
    invoke-static {v2}, Ll/xmp0;->I2(Ll/xmp0;)Ll/evx;

    .line 412
    .line 413
    .line 414
    move-result-object v2

    .line 415
    new-instance v4, Ljava/lang/StringBuilder;

    .line 416
    .line 417
    const-string v8, "onVideoChannelRemove uid:"

    .line 418
    .line 419
    invoke-direct {v4, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 420
    .line 421
    .line 422
    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 423
    .line 424
    .line 425
    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 426
    .line 427
    .line 428
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 429
    .line 430
    .line 431
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 432
    .line 433
    .line 434
    move-result-object v4

    .line 435
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 436
    .line 437
    .line 438
    move-result-object v4

    .line 439
    invoke-virtual {v2, v4}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 440
    .line 441
    .line 442
    :cond_6
    iget-object v2, v0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 443
    .line 444
    invoke-static {v2}, Ll/xmp0;->J2(Ll/xmp0;)Ll/evx;

    .line 445
    .line 446
    .line 447
    move-result-object v2

    .line 448
    iget-object v4, v0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 449
    .line 450
    invoke-static {v4}, Ll/xmp0;->K3(Ll/xmp0;)Ll/ror;

    .line 451
    .line 452
    .line 453
    move-result-object v4

    .line 454
    iget-boolean v4, v4, Ll/uow;->Z0:Z

    .line 455
    .line 456
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 457
    .line 458
    .line 459
    move-result-object v4

    .line 460
    const-string v8, "isUseTextureView"

    .line 461
    .line 462
    filled-new-array {v8, v4}, [Ljava/lang/Object;

    .line 463
    .line 464
    .line 465
    move-result-object v4

    .line 466
    invoke-virtual {v2, v4}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 467
    .line 468
    .line 469
    iget-object v2, v0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 470
    .line 471
    invoke-static {v2}, Ll/xmp0;->K3(Ll/xmp0;)Ll/ror;

    .line 472
    .line 473
    .line 474
    move-result-object v2

    .line 475
    iget-boolean v2, v2, Ll/uow;->Z0:Z

    .line 476
    .line 477
    if-eqz v2, :cond_7

    .line 478
    .line 479
    iget-object v2, v0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 480
    .line 481
    iget-object v4, v2, Ll/xmp0;->U1:Lcom/ss/bytertc/engine/RTCEngineEx;

    .line 482
    .line 483
    if-eqz v4, :cond_7

    .line 484
    .line 485
    invoke-static {v2}, Ll/xmp0;->b4(Ll/xmp0;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 486
    .line 487
    .line 488
    move-result-object v2

    .line 489
    if-eqz v2, :cond_7

    .line 490
    .line 491
    iget-object v2, v0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 492
    .line 493
    invoke-static {v2}, Ll/xmp0;->b4(Ll/xmp0;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 494
    .line 495
    .line 496
    move-result-object v2

    .line 497
    invoke-virtual {v2, v1}, Ljava/util/AbstractMap;->containsKey(Ljava/lang/Object;)Z

    .line 498
    .line 499
    .line 500
    move-result v2

    .line 501
    if-eqz v2, :cond_7

    .line 502
    .line 503
    iget-object v2, v0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 504
    .line 505
    invoke-static {v2}, Ll/xmp0;->K2(Ll/xmp0;)Ll/evx;

    .line 506
    .line 507
    .line 508
    move-result-object v2

    .line 509
    const-string v4, "setupRemoteVideoview null"

    .line 510
    .line 511
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 512
    .line 513
    .line 514
    move-result-object v4

    .line 515
    invoke-virtual {v2, v4}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 516
    .line 517
    .line 518
    iget-object v2, v0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 519
    .line 520
    invoke-static {v2}, Ll/xmp0;->b4(Ll/xmp0;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 521
    .line 522
    .line 523
    move-result-object v2

    .line 524
    invoke-virtual {v2, v1}, Ljava/util/AbstractMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 525
    .line 526
    .line 527
    iget-object v1, v0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 528
    .line 529
    invoke-static {v1}, Ll/xmp0;->a4(Ll/xmp0;)Ll/gbl0;

    .line 530
    .line 531
    .line 532
    move-result-object v1

    .line 533
    if-eqz v1, :cond_7

    .line 534
    .line 535
    iget-object v1, v0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 536
    .line 537
    invoke-static {v1}, Ll/xmp0;->a4(Ll/xmp0;)Ll/gbl0;

    .line 538
    .line 539
    .line 540
    move-result-object v1

    .line 541
    invoke-interface {v1, v5, v6, v7}, Ll/gbl0;->b(JI)V

    .line 542
    .line 543
    .line 544
    :cond_7
    iget-object v1, v0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 545
    .line 546
    invoke-static {v1}, Ll/xmp0;->c3(Ll/xmp0;)Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 547
    .line 548
    .line 549
    move-result-object v1

    .line 550
    if-eqz v1, :cond_8

    .line 551
    .line 552
    iget-object v1, v0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 553
    .line 554
    invoke-static {v1}, Ll/xmp0;->c3(Ll/xmp0;)Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 555
    .line 556
    .line 557
    move-result-object v1

    .line 558
    invoke-interface {v1, v5, v6, v7}, Lcom/immomo/mediacore/coninf/MRtcEventHandler;->onUserOffline(JI)V

    .line 559
    .line 560
    .line 561
    :cond_8
    iget-object v1, v0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 562
    .line 563
    invoke-static {v1}, Ll/xmp0;->L2(Ll/xmp0;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 564
    .line 565
    .line 566
    move-result-object v1

    .line 567
    if-eqz v1, :cond_c

    .line 568
    .line 569
    iget-object v1, v0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 570
    .line 571
    invoke-static {v1}, Ll/xmp0;->L2(Ll/xmp0;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 572
    .line 573
    .line 574
    move-result-object v1

    .line 575
    invoke-virtual {v1, v13}, Ljava/util/AbstractMap;->containsKey(Ljava/lang/Object;)Z

    .line 576
    .line 577
    .line 578
    move-result v1

    .line 579
    if-nez v1, :cond_9

    .line 580
    .line 581
    iget-object v1, v0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 582
    .line 583
    invoke-static {v1}, Ll/xmp0;->K3(Ll/xmp0;)Ll/ror;

    .line 584
    .line 585
    .line 586
    move-result-object v1

    .line 587
    iget v1, v1, Ll/uow;->B0:I

    .line 588
    .line 589
    int-to-long v1, v1

    .line 590
    cmp-long v1, v5, v1

    .line 591
    .line 592
    if-nez v1, :cond_c

    .line 593
    .line 594
    :cond_9
    iget-object v1, v0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 595
    .line 596
    invoke-static {v1}, Ll/xmp0;->K3(Ll/xmp0;)Ll/ror;

    .line 597
    .line 598
    .line 599
    move-result-object v1

    .line 600
    iget v1, v1, Ll/uow;->B0:I

    .line 601
    .line 602
    int-to-long v1, v1

    .line 603
    cmp-long v1, v5, v1

    .line 604
    .line 605
    if-eqz v1, :cond_a

    .line 606
    .line 607
    iget-object v1, v0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 608
    .line 609
    invoke-static {v1}, Ll/xmp0;->L2(Ll/xmp0;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 610
    .line 611
    .line 612
    move-result-object v1

    .line 613
    invoke-virtual {v1, v13}, Ljava/util/AbstractMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 614
    .line 615
    .line 616
    :cond_a
    iget-object v1, v0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 617
    .line 618
    invoke-static {v1}, Ll/xmp0;->o3(Ll/xmp0;)Z

    .line 619
    .line 620
    .line 621
    move-result v1

    .line 622
    iget-object v2, v0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 623
    .line 624
    if-eqz v1, :cond_b

    .line 625
    .line 626
    invoke-static {v2}, Ll/xmp0;->M2(Ll/xmp0;)Ll/fbl0;

    .line 627
    .line 628
    .line 629
    move-result-object v1

    .line 630
    if-eqz v1, :cond_c

    .line 631
    .line 632
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 633
    .line 634
    .line 635
    move-result-object v1

    .line 636
    new-instance v2, Ljava/lang/StringBuilder;

    .line 637
    .line 638
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 639
    .line 640
    .line 641
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 642
    .line 643
    .line 644
    move-result-object v4

    .line 645
    invoke-virtual {v4}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 646
    .line 647
    .line 648
    move-result-object v4

    .line 649
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 650
    .line 651
    .line 652
    const-string v4, "----onVideoChannelRemoveExt userID="

    .line 653
    .line 654
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 655
    .line 656
    .line 657
    invoke-virtual {v2, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 658
    .line 659
    .line 660
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 661
    .line 662
    .line 663
    move-result-object v2

    .line 664
    invoke-virtual {v1, v3, v2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 665
    .line 666
    .line 667
    iget-object v0, v0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 668
    .line 669
    invoke-static {v0}, Ll/xmp0;->M2(Ll/xmp0;)Ll/fbl0;

    .line 670
    .line 671
    .line 672
    move-result-object v0

    .line 673
    invoke-interface {v0, v5, v6, v7}, Ll/fbl0;->b(JI)V

    .line 674
    .line 675
    .line 676
    return-void

    .line 677
    :cond_b
    invoke-static {v2}, Ll/xmp0;->z3(Ll/xmp0;)Ll/gkl0;

    .line 678
    .line 679
    .line 680
    move-result-object v1

    .line 681
    if-eqz v1, :cond_c

    .line 682
    .line 683
    iget-object v0, v0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 684
    .line 685
    invoke-static {v0}, Ll/xmp0;->z3(Ll/xmp0;)Ll/gkl0;

    .line 686
    .line 687
    .line 688
    move-result-object v0

    .line 689
    invoke-interface {v0, v5, v6, v7}, Ll/gkl0;->b(JI)V

    .line 690
    .line 691
    .line 692
    :cond_c
    return-void
.end method

.method public onUserPublishStreamAudio(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 2
    .line 3
    invoke-static {p1}, Ll/xmp0;->A2(Ll/xmp0;)Ll/evx;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v1, "uid:"

    .line 10
    .line 11
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v1, ",isPublish:"

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-string v1, "onUserPublishStreamAudio"

    .line 30
    .line 31
    filled-new-array {v1, v0}, [Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {p1, v0}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 39
    .line 40
    invoke-static {p1}, Ll/xmp0;->A4(Ll/xmp0;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-static {p2}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {p1, v0}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    check-cast p1, Ll/iny;

    .line 53
    .line 54
    if-eqz p1, :cond_0

    .line 55
    .line 56
    xor-int/lit8 v0, p3, 0x1

    .line 57
    .line 58
    invoke-virtual {p1, v0}, Ll/iny;->g(Z)V

    .line 59
    .line 60
    .line 61
    :cond_0
    iget-object p1, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 62
    .line 63
    invoke-static {p1}, Ll/xmp0;->c3(Ll/xmp0;)Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    if-eqz p1, :cond_1

    .line 68
    .line 69
    iget-object p0, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 70
    .line 71
    invoke-static {p0}, Ll/xmp0;->c3(Ll/xmp0;)Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    xor-int/lit8 p2, p3, 0x1

    .line 84
    .line 85
    invoke-interface {p0, p1, p2}, Lcom/immomo/mediacore/coninf/MRtcEventHandler;->onUserMuteAudio(IZ)V

    .line 86
    .line 87
    .line 88
    :cond_1
    return-void
.end method

.method public onUserPublishStreamVideo(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/gjc0;->onUserPublishStreamVideo(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 5
    .line 6
    invoke-static {p1}, Ll/xmp0;->B2(Ll/xmp0;)Ll/evx;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    new-instance v0, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    const-string v1, "uid:"

    .line 13
    .line 14
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string v1, ",isPublish:"

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const-string v1, "onUserPublishStreamVideo"

    .line 33
    .line 34
    filled-new-array {v1, v0}, [Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {p1, v0}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 42
    .line 43
    invoke-static {p1}, Ll/xmp0;->A4(Ll/xmp0;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-static {p2}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {p1, v0}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    check-cast p1, Ll/iny;

    .line 56
    .line 57
    if-eqz p1, :cond_0

    .line 58
    .line 59
    xor-int/lit8 v0, p3, 0x1

    .line 60
    .line 61
    invoke-virtual {p1, v0}, Ll/iny;->h(Z)V

    .line 62
    .line 63
    .line 64
    :cond_0
    iget-object p1, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 65
    .line 66
    invoke-static {p1}, Ll/xmp0;->c3(Ll/xmp0;)Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    if-eqz p1, :cond_1

    .line 71
    .line 72
    iget-object p0, p0, Ll/xmp0$g;->a:Ll/xmp0;

    .line 73
    .line 74
    invoke-static {p0}, Ll/xmp0;->c3(Ll/xmp0;)Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    xor-int/lit8 p2, p3, 0x1

    .line 87
    .line 88
    invoke-interface {p0, p1, p2}, Lcom/immomo/mediacore/coninf/MRtcEventHandler;->onUserMuteVideo(IZ)V

    .line 89
    .line 90
    .line 91
    :cond_1
    return-void
.end method
