.class Ll/tc0$g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lio/agora/rtc2/IMetadataObserver;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/tc0;->V5(J)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:J

.field final synthetic b:Ll/tc0;


# direct methods
.method public constructor <init>(Ll/tc0;J)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/tc0$g;->b:Ll/tc0;

    .line 2
    .line 3
    iput-wide p2, p0, Ll/tc0$g;->a:J

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public getMaxMetadataSize()I
    .locals 2

    .line 1
    iget-object v0, p0, Ll/tc0$g;->b:Ll/tc0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/tc0;->j3(Ll/tc0;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    iget-object v0, p0, Ll/tc0$g;->b:Ll/tc0;

    .line 12
    .line 13
    invoke-static {v0}, Ll/tc0;->k3(Ll/tc0;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iget-object v1, p0, Ll/tc0$g;->b:Ll/tc0;

    .line 18
    .line 19
    if-nez v0, :cond_2

    .line 20
    .line 21
    invoke-static {v1}, Ll/tc0;->b3(Ll/tc0;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object v1, p0, Ll/tc0$g;->b:Ll/tc0;

    .line 26
    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    invoke-static {v1}, Ll/tc0;->b3(Ll/tc0;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-static {v1, p0}, Ll/tc0;->c3(Ll/tc0;Ljava/lang/String;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    array-length p0, p0

    .line 42
    goto :goto_0

    .line 43
    :cond_1
    invoke-static {v1}, Ll/tc0;->d3(Ll/tc0;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    if-eqz v0, :cond_3

    .line 48
    .line 49
    iget-object p0, p0, Ll/tc0$g;->b:Ll/tc0;

    .line 50
    .line 51
    invoke-static {p0}, Ll/tc0;->d3(Ll/tc0;)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    array-length p0, p0

    .line 60
    goto :goto_0

    .line 61
    :cond_2
    invoke-static {v1}, Ll/tc0;->m3(Ll/tc0;)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-nez v0, :cond_3

    .line 70
    .line 71
    iget-object p0, p0, Ll/tc0$g;->b:Ll/tc0;

    .line 72
    .line 73
    invoke-static {p0}, Ll/tc0;->m3(Ll/tc0;)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 78
    .line 79
    .line 80
    :cond_3
    :goto_0
    const/16 p0, 0x400

    .line 81
    .line 82
    return p0
.end method

.method public onMetadataReceived(Lio/agora/rtc2/video/AgoraMetadata;)V
    .locals 8

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    const-string v1, "ts"

    .line 4
    .line 5
    const-string v2, "bType"

    .line 6
    .line 7
    const-string v3, "onReceiveSEI getbType: "

    .line 8
    .line 9
    if-eqz p1, :cond_2

    .line 10
    .line 11
    iget-object v4, p1, Lio/agora/rtc2/video/AgoraMetadata;->data:[B

    .line 12
    .line 13
    if-eqz v4, :cond_2

    .line 14
    .line 15
    :try_start_0
    new-instance v4, Lorg/json/JSONObject;

    .line 16
    .line 17
    new-instance v5, Ljava/lang/String;

    .line 18
    .line 19
    iget-object v6, p1, Lio/agora/rtc2/video/AgoraMetadata;->data:[B

    .line 20
    .line 21
    invoke-direct {v5, v6}, Ljava/lang/String;-><init>([B)V

    .line 22
    .line 23
    .line 24
    invoke-direct {v4, v5}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v4, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    move-result v5

    .line 31
    if-eqz v5, :cond_0

    .line 32
    .line 33
    invoke-virtual {v4, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    iget-object v5, p0, Ll/tc0$g;->b:Ll/tc0;

    .line 38
    .line 39
    invoke-static {v5}, Ll/tc0;->v3(Ll/tc0;)Ll/wvx;

    .line 40
    .line 41
    .line 42
    move-result-object v5

    .line 43
    int-to-long v6, v2

    .line 44
    iput-wide v6, v5, Ll/wvx;->s:J

    .line 45
    .line 46
    const-string v5, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 47
    .line 48
    new-instance v6, Ljava/lang/StringBuilder;

    .line 49
    .line 50
    invoke-direct {v6, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    invoke-static {v5, v2}, Ll/esx;->d(Ljava/lang/String;Ljava/lang/Object;)I

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :catch_0
    move-exception v1

    .line 65
    goto :goto_1

    .line 66
    :cond_0
    :goto_0
    invoke-virtual {v4, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    if-eqz v2, :cond_1

    .line 71
    .line 72
    invoke-virtual {v4, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    invoke-virtual {v2}, Ll/csx;->X()J

    .line 81
    .line 82
    .line 83
    move-result-wide v2

    .line 84
    invoke-static {v1}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 89
    .line 90
    .line 91
    move-result-wide v4

    .line 92
    sub-long/2addr v2, v4

    .line 93
    iget-object v1, p0, Ll/tc0$g;->b:Ll/tc0;

    .line 94
    .line 95
    invoke-static {v1}, Ll/tc0;->s2(Ll/tc0;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    iget-wide v4, p0, Ll/tc0$g;->a:J

    .line 100
    .line 101
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 102
    .line 103
    .line 104
    move-result-object v4

    .line 105
    invoke-virtual {v1, v4}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    check-cast v1, Ll/iny;

    .line 110
    .line 111
    if-eqz v1, :cond_1

    .line 112
    .line 113
    iget v4, v1, Ll/iny;->E:I

    .line 114
    .line 115
    add-int/lit8 v4, v4, 0x1

    .line 116
    .line 117
    iput v4, v1, Ll/iny;->E:I

    .line 118
    .line 119
    iget v4, v1, Ll/iny;->D:I

    .line 120
    .line 121
    int-to-long v4, v4

    .line 122
    add-long/2addr v4, v2

    .line 123
    long-to-int v2, v4

    .line 124
    iput v2, v1, Ll/iny;->D:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 125
    .line 126
    goto :goto_2

    .line 127
    :goto_1
    iget-object v2, p0, Ll/tc0$g;->b:Ll/tc0;

    .line 128
    .line 129
    invoke-static {v2}, Ll/tc0;->w3(Ll/tc0;)Ll/evx;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    new-instance v3, Ljava/lang/StringBuilder;

    .line 134
    .line 135
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v1

    .line 142
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object v1

    .line 149
    const-string v3, "onMetadataReceived error"

    .line 150
    .line 151
    filled-new-array {v3, v1}, [Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    move-result-object v1

    .line 155
    invoke-virtual {v2, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 156
    .line 157
    .line 158
    :cond_1
    :goto_2
    iget-object v1, p0, Ll/tc0$g;->b:Ll/tc0;

    .line 159
    .line 160
    iget-object v2, v1, Ll/tc0;->G2:Lcom/immomo/mediacore/coninf/MRtcReceiveSeiHandler;

    .line 161
    .line 162
    if-eqz v2, :cond_2

    .line 163
    .line 164
    invoke-static {v1}, Ll/tc0;->b5(Ll/tc0;)Ll/ror;

    .line 165
    .line 166
    .line 167
    move-result-object v1

    .line 168
    if-eqz v1, :cond_2

    .line 169
    .line 170
    iget-object p0, p0, Ll/tc0$g;->b:Ll/tc0;

    .line 171
    .line 172
    iget-object v1, p0, Ll/tc0;->G2:Lcom/immomo/mediacore/coninf/MRtcReceiveSeiHandler;

    .line 173
    .line 174
    iget-object p1, p1, Lio/agora/rtc2/video/AgoraMetadata;->data:[B

    .line 175
    .line 176
    invoke-static {p0}, Ll/tc0;->b5(Ll/tc0;)Ll/ror;

    .line 177
    .line 178
    .line 179
    move-result-object p0

    .line 180
    iget p0, p0, Ll/uow;->B0:I

    .line 181
    .line 182
    int-to-long v2, p0

    .line 183
    invoke-interface {v1, p1, v2, v3, v0}, Lcom/immomo/mediacore/coninf/MRtcReceiveSeiHandler;->OnReceiveH264Sei([BJLjava/lang/String;)V

    .line 184
    .line 185
    .line 186
    :cond_2
    return-void
.end method

.method public onReadyToSendMetadata(JI)[B
    .locals 4

    .line 1
    iget-object p1, p0, Ll/tc0$g;->b:Ll/tc0;

    .line 2
    .line 3
    invoke-static {p1}, Ll/tc0;->Y2(Ll/tc0;)J

    .line 4
    .line 5
    .line 6
    move-result-wide p1

    .line 7
    const-wide/high16 v0, -0x8000000000000000L

    .line 8
    .line 9
    cmp-long p1, p1, v0

    .line 10
    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Ll/tc0$g;->b:Ll/tc0;

    .line 14
    .line 15
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 16
    .line 17
    .line 18
    move-result-wide p2

    .line 19
    invoke-static {p1, p2, p3}, Ll/tc0;->Z2(Ll/tc0;J)J

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object p1, p0, Ll/tc0$g;->b:Ll/tc0;

    .line 23
    .line 24
    invoke-static {p1}, Ll/tc0;->j3(Ll/tc0;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    const/4 p2, 0x0

    .line 29
    if-nez p1, :cond_1

    .line 30
    .line 31
    goto/16 :goto_2

    .line 32
    .line 33
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 34
    .line 35
    .line 36
    move-result-wide v0

    .line 37
    iget-object p1, p0, Ll/tc0$g;->b:Ll/tc0;

    .line 38
    .line 39
    invoke-static {p1}, Ll/tc0;->Y2(Ll/tc0;)J

    .line 40
    .line 41
    .line 42
    move-result-wide v2

    .line 43
    sub-long/2addr v0, v2

    .line 44
    iget-object p1, p0, Ll/tc0$g;->b:Ll/tc0;

    .line 45
    .line 46
    invoke-static {p1}, Ll/tc0;->o3(Ll/tc0;)J

    .line 47
    .line 48
    .line 49
    move-result-wide v2

    .line 50
    cmp-long p1, v0, v2

    .line 51
    .line 52
    if-lez p1, :cond_8

    .line 53
    .line 54
    iget-object p1, p0, Ll/tc0$g;->b:Ll/tc0;

    .line 55
    .line 56
    invoke-static {p1}, Ll/tc0;->w2(Ll/tc0;)Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    iget-object p3, p0, Ll/tc0$g;->b:Ll/tc0;

    .line 61
    .line 62
    if-eqz p1, :cond_4

    .line 63
    .line 64
    new-instance p1, Ljava/lang/StringBuilder;

    .line 65
    .line 66
    const-string v0, ""

    .line 67
    .line 68
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    invoke-static {p3}, Ll/tc0;->b3(Ll/tc0;)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p3

    .line 75
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    :try_start_0
    new-instance p3, Lorg/json/JSONObject;

    .line 83
    .line 84
    invoke-direct {p3, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    new-instance p1, Lorg/json/JSONObject;

    .line 88
    .line 89
    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    .line 90
    .line 91
    .line 92
    const-string v0, "asr"

    .line 93
    .line 94
    const v1, 0xac44

    .line 95
    .line 96
    .line 97
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 98
    .line 99
    .line 100
    iget-object v0, p0, Ll/tc0$g;->b:Ll/tc0;

    .line 101
    .line 102
    invoke-static {v0}, Ll/tc0;->v2(Ll/tc0;)Lio/agora/rtc2/live/LiveTranscoding;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    iget v0, v0, Lio/agora/rtc2/live/LiveTranscoding;->audioBitrate:I

    .line 107
    .line 108
    const/16 v1, 0x3e8

    .line 109
    .line 110
    if-ge v0, v1, :cond_2

    .line 111
    .line 112
    mul-int/lit16 v0, v0, 0x3e8

    .line 113
    .line 114
    :cond_2
    const-string v1, "abr"

    .line 115
    .line 116
    invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 117
    .line 118
    .line 119
    const-string v0, "achl"

    .line 120
    .line 121
    iget-object v1, p0, Ll/tc0$g;->b:Ll/tc0;

    .line 122
    .line 123
    invoke-static {v1}, Ll/tc0;->v2(Ll/tc0;)Lio/agora/rtc2/live/LiveTranscoding;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    iget v1, v1, Lio/agora/rtc2/live/LiveTranscoding;->audioChannels:I

    .line 128
    .line 129
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 130
    .line 131
    .line 132
    const-string v0, "acpf"

    .line 133
    .line 134
    iget-object v1, p0, Ll/tc0$g;->b:Ll/tc0;

    .line 135
    .line 136
    invoke-static {v1}, Ll/tc0;->v2(Ll/tc0;)Lio/agora/rtc2/live/LiveTranscoding;

    .line 137
    .line 138
    .line 139
    move-result-object v1

    .line 140
    iget-object v1, v1, Lio/agora/rtc2/live/LiveTranscoding;->audioCodecProfile:Lio/agora/rtc2/live/LiveTranscoding$AudioCodecProfileType;

    .line 141
    .line 142
    invoke-static {v1}, Lio/agora/rtc2/live/LiveTranscoding$AudioCodecProfileType;->getValue(Lio/agora/rtc2/live/LiveTranscoding$AudioCodecProfileType;)I

    .line 143
    .line 144
    .line 145
    move-result v1

    .line 146
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 147
    .line 148
    .line 149
    const-string v0, "w"

    .line 150
    .line 151
    iget-object v1, p0, Ll/tc0$g;->b:Ll/tc0;

    .line 152
    .line 153
    invoke-static {v1}, Ll/tc0;->p3(Ll/tc0;)Ll/uow;

    .line 154
    .line 155
    .line 156
    move-result-object v1

    .line 157
    iget v1, v1, Ll/tow;->k:I

    .line 158
    .line 159
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 160
    .line 161
    .line 162
    const-string v0, "h"

    .line 163
    .line 164
    iget-object v1, p0, Ll/tc0$g;->b:Ll/tc0;

    .line 165
    .line 166
    invoke-static {v1}, Ll/tc0;->q3(Ll/tc0;)Ll/uow;

    .line 167
    .line 168
    .line 169
    move-result-object v1

    .line 170
    iget v1, v1, Ll/tow;->l:I

    .line 171
    .line 172
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 173
    .line 174
    .line 175
    const-string v0, "gop"

    .line 176
    .line 177
    iget-object v1, p0, Ll/tc0$g;->b:Ll/tc0;

    .line 178
    .line 179
    invoke-static {v1}, Ll/tc0;->r3(Ll/tc0;)Ll/uow;

    .line 180
    .line 181
    .line 182
    move-result-object v1

    .line 183
    iget v1, v1, Ll/tow;->G:I

    .line 184
    .line 185
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 186
    .line 187
    .line 188
    const-string v0, "fps"

    .line 189
    .line 190
    iget-object v1, p0, Ll/tc0$g;->b:Ll/tc0;

    .line 191
    .line 192
    invoke-static {v1}, Ll/tc0;->s3(Ll/tc0;)Ll/uow;

    .line 193
    .line 194
    .line 195
    move-result-object v1

    .line 196
    iget v1, v1, Ll/tow;->F:I

    .line 197
    .line 198
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 199
    .line 200
    .line 201
    const-string v0, "vbr"

    .line 202
    .line 203
    iget-object v1, p0, Ll/tc0$g;->b:Ll/tc0;

    .line 204
    .line 205
    invoke-static {v1}, Ll/tc0;->t3(Ll/tc0;)Ll/uow;

    .line 206
    .line 207
    .line 208
    move-result-object v1

    .line 209
    iget v1, v1, Ll/tow;->H:I

    .line 210
    .line 211
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 212
    .line 213
    .line 214
    const-string v0, "vcpf"

    .line 215
    .line 216
    iget-object v1, p0, Ll/tc0$g;->b:Ll/tc0;

    .line 217
    .line 218
    invoke-static {v1}, Ll/tc0;->u3(Ll/tc0;)Ll/uow;

    .line 219
    .line 220
    .line 221
    move-result-object v1

    .line 222
    iget-boolean v1, v1, Ll/uow;->H0:Z

    .line 223
    .line 224
    if-eqz v1, :cond_3

    .line 225
    .line 226
    const/4 v1, 0x2

    .line 227
    goto :goto_0

    .line 228
    :cond_3
    const/4 v1, 0x1

    .line 229
    :goto_0
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 230
    .line 231
    .line 232
    const-string v0, "mixInfo"

    .line 233
    .line 234
    invoke-virtual {p3, v0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 235
    .line 236
    .line 237
    invoke-virtual {p3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 238
    .line 239
    .line 240
    move-result-object p1

    .line 241
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    .line 242
    .line 243
    .line 244
    move-result-object p2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 245
    goto :goto_1

    .line 246
    :catch_0
    move-exception p1

    .line 247
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 248
    .line 249
    .line 250
    goto :goto_1

    .line 251
    :cond_4
    invoke-static {p3}, Ll/tc0;->k3(Ll/tc0;)Z

    .line 252
    .line 253
    .line 254
    move-result p1

    .line 255
    iget-object p3, p0, Ll/tc0$g;->b:Ll/tc0;

    .line 256
    .line 257
    if-eqz p1, :cond_5

    .line 258
    .line 259
    invoke-static {p3}, Ll/tc0;->m3(Ll/tc0;)Ljava/lang/String;

    .line 260
    .line 261
    .line 262
    move-result-object p1

    .line 263
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 264
    .line 265
    .line 266
    move-result p1

    .line 267
    if-nez p1, :cond_7

    .line 268
    .line 269
    iget-object p1, p0, Ll/tc0$g;->b:Ll/tc0;

    .line 270
    .line 271
    invoke-static {p1}, Ll/tc0;->m3(Ll/tc0;)Ljava/lang/String;

    .line 272
    .line 273
    .line 274
    move-result-object p1

    .line 275
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    .line 276
    .line 277
    .line 278
    move-result-object p2

    .line 279
    goto :goto_1

    .line 280
    :cond_5
    invoke-static {p3}, Ll/tc0;->b3(Ll/tc0;)Ljava/lang/String;

    .line 281
    .line 282
    .line 283
    move-result-object p1

    .line 284
    iget-object p3, p0, Ll/tc0$g;->b:Ll/tc0;

    .line 285
    .line 286
    if-eqz p1, :cond_6

    .line 287
    .line 288
    invoke-static {p3}, Ll/tc0;->b3(Ll/tc0;)Ljava/lang/String;

    .line 289
    .line 290
    .line 291
    move-result-object p1

    .line 292
    invoke-static {p3, p1}, Ll/tc0;->c3(Ll/tc0;Ljava/lang/String;)Ljava/lang/String;

    .line 293
    .line 294
    .line 295
    move-result-object p1

    .line 296
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    .line 297
    .line 298
    .line 299
    move-result-object p2

    .line 300
    goto :goto_1

    .line 301
    :cond_6
    invoke-static {p3}, Ll/tc0;->d3(Ll/tc0;)Ljava/lang/String;

    .line 302
    .line 303
    .line 304
    move-result-object p1

    .line 305
    if-eqz p1, :cond_7

    .line 306
    .line 307
    iget-object p1, p0, Ll/tc0$g;->b:Ll/tc0;

    .line 308
    .line 309
    invoke-static {p1}, Ll/tc0;->d3(Ll/tc0;)Ljava/lang/String;

    .line 310
    .line 311
    .line 312
    move-result-object p1

    .line 313
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    .line 314
    .line 315
    .line 316
    move-result-object p2

    .line 317
    :cond_7
    :goto_1
    iget-object p0, p0, Ll/tc0$g;->b:Ll/tc0;

    .line 318
    .line 319
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 320
    .line 321
    .line 322
    move-result-wide v0

    .line 323
    invoke-static {p0, v0, v1}, Ll/tc0;->Z2(Ll/tc0;J)J

    .line 324
    .line 325
    .line 326
    :cond_8
    :goto_2
    return-object p2
.end method
