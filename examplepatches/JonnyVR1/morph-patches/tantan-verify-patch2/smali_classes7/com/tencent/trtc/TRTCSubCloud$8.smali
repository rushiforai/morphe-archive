.class Lcom/tencent/trtc/TRTCSubCloud$8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/trtc/TRTCSubCloud;->callExperimentalAPI(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Lorg/json/JSONObject;

.field final synthetic c:Ljava/lang/String;

.field final synthetic d:Lcom/tencent/trtc/TRTCSubCloud;


# direct methods
.method public constructor <init>(Lcom/tencent/trtc/TRTCSubCloud;Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/trtc/TRTCSubCloud$8;->d:Lcom/tencent/trtc/TRTCSubCloud;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/trtc/TRTCSubCloud$8;->a:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/tencent/trtc/TRTCSubCloud$8;->b:Lorg/json/JSONObject;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/tencent/trtc/TRTCSubCloud$8;->c:Ljava/lang/String;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    const-string v0, "callExperimentalAPI[illegal api]: "

    .line 2
    .line 3
    :try_start_0
    iget-object v1, p0, Lcom/tencent/trtc/TRTCSubCloud$8;->a:Ljava/lang/String;

    .line 4
    .line 5
    const-string v2, "setSEIPayloadType"

    .line 6
    .line 7
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/tencent/trtc/TRTCSubCloud$8;->d:Lcom/tencent/trtc/TRTCSubCloud;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/tencent/trtc/TRTCSubCloud$8;->b:Lorg/json/JSONObject;

    .line 16
    .line 17
    invoke-static {v0, v1}, Lcom/tencent/trtc/TRTCSubCloud;->access$6900(Lcom/tencent/trtc/TRTCSubCloud;Lorg/json/JSONObject;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    iget-object v1, p0, Lcom/tencent/trtc/TRTCSubCloud$8;->a:Ljava/lang/String;

    .line 22
    .line 23
    const-string v2, "setLocalAudioMuteMode"

    .line 24
    .line 25
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_1

    .line 30
    .line 31
    goto/16 :goto_0

    .line 32
    .line 33
    :cond_1
    iget-object v1, p0, Lcom/tencent/trtc/TRTCSubCloud$8;->a:Ljava/lang/String;

    .line 34
    .line 35
    const-string v2, "setVideoEncodeParamEx"

    .line 36
    .line 37
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_2

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_2
    iget-object v1, p0, Lcom/tencent/trtc/TRTCSubCloud$8;->a:Ljava/lang/String;

    .line 45
    .line 46
    const-string v2, "setAudioSampleRate"

    .line 47
    .line 48
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-eqz v1, :cond_3

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_3
    iget-object v1, p0, Lcom/tencent/trtc/TRTCSubCloud$8;->a:Ljava/lang/String;

    .line 56
    .line 57
    const-string v2, "muteRemoteAudioInSpeaker"

    .line 58
    .line 59
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-eqz v1, :cond_4

    .line 64
    .line 65
    iget-object v0, p0, Lcom/tencent/trtc/TRTCSubCloud$8;->d:Lcom/tencent/trtc/TRTCSubCloud;

    .line 66
    .line 67
    iget-object v1, p0, Lcom/tencent/trtc/TRTCSubCloud$8;->b:Lorg/json/JSONObject;

    .line 68
    .line 69
    invoke-static {v0, v1}, Lcom/tencent/trtc/TRTCSubCloud;->access$7000(Lcom/tencent/trtc/TRTCSubCloud;Lorg/json/JSONObject;)V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_4
    iget-object v1, p0, Lcom/tencent/trtc/TRTCSubCloud$8;->a:Ljava/lang/String;

    .line 74
    .line 75
    const-string v2, "enableAudioAGC"

    .line 76
    .line 77
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    if-eqz v1, :cond_5

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_5
    iget-object v1, p0, Lcom/tencent/trtc/TRTCSubCloud$8;->a:Ljava/lang/String;

    .line 85
    .line 86
    const-string v2, "enableAudioAEC"

    .line 87
    .line 88
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    if-eqz v1, :cond_6

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_6
    iget-object v1, p0, Lcom/tencent/trtc/TRTCSubCloud$8;->a:Ljava/lang/String;

    .line 96
    .line 97
    const-string v2, "enableAudioANS"

    .line 98
    .line 99
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    if-eqz v1, :cond_7

    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_7
    iget-object v1, p0, Lcom/tencent/trtc/TRTCSubCloud$8;->a:Ljava/lang/String;

    .line 107
    .line 108
    const-string v2, "setPerformanceMode"

    .line 109
    .line 110
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    move-result v1

    .line 114
    if-eqz v1, :cond_8

    .line 115
    .line 116
    iget-object v0, p0, Lcom/tencent/trtc/TRTCSubCloud$8;->d:Lcom/tencent/trtc/TRTCSubCloud;

    .line 117
    .line 118
    iget-object v1, p0, Lcom/tencent/trtc/TRTCSubCloud$8;->b:Lorg/json/JSONObject;

    .line 119
    .line 120
    invoke-static {v0, v1}, Lcom/tencent/trtc/TRTCSubCloud;->access$7100(Lcom/tencent/trtc/TRTCSubCloud;Lorg/json/JSONObject;)V

    .line 121
    .line 122
    .line 123
    return-void

    .line 124
    :cond_8
    iget-object v1, p0, Lcom/tencent/trtc/TRTCSubCloud$8;->a:Ljava/lang/String;

    .line 125
    .line 126
    const-string v2, "setCustomRenderMode"

    .line 127
    .line 128
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 129
    .line 130
    .line 131
    move-result v1

    .line 132
    if-eqz v1, :cond_9

    .line 133
    .line 134
    goto :goto_0

    .line 135
    :cond_9
    iget-object v1, p0, Lcom/tencent/trtc/TRTCSubCloud$8;->a:Ljava/lang/String;

    .line 136
    .line 137
    const-string v2, "setMediaCodecConfig"

    .line 138
    .line 139
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 140
    .line 141
    .line 142
    move-result v1

    .line 143
    if-eqz v1, :cond_a

    .line 144
    .line 145
    :goto_0
    return-void

    .line 146
    :cond_a
    iget-object v1, p0, Lcom/tencent/trtc/TRTCSubCloud$8;->a:Ljava/lang/String;

    .line 147
    .line 148
    const-string v2, "sendJsonCMD"

    .line 149
    .line 150
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 151
    .line 152
    .line 153
    move-result v1

    .line 154
    if-eqz v1, :cond_b

    .line 155
    .line 156
    iget-object v0, p0, Lcom/tencent/trtc/TRTCSubCloud$8;->d:Lcom/tencent/trtc/TRTCSubCloud;

    .line 157
    .line 158
    iget-object v1, p0, Lcom/tencent/trtc/TRTCSubCloud$8;->b:Lorg/json/JSONObject;

    .line 159
    .line 160
    iget-object v2, p0, Lcom/tencent/trtc/TRTCSubCloud$8;->c:Ljava/lang/String;

    .line 161
    .line 162
    invoke-static {v0, v1, v2}, Lcom/tencent/trtc/TRTCSubCloud;->access$7200(Lcom/tencent/trtc/TRTCSubCloud;Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 163
    .line 164
    .line 165
    return-void

    .line 166
    :cond_b
    iget-object v1, p0, Lcom/tencent/trtc/TRTCSubCloud$8;->a:Ljava/lang/String;

    .line 167
    .line 168
    const-string v2, "updatePrivateMapKey"

    .line 169
    .line 170
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 171
    .line 172
    .line 173
    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 174
    iget-object v2, p0, Lcom/tencent/trtc/TRTCSubCloud$8;->d:Lcom/tencent/trtc/TRTCSubCloud;

    .line 175
    .line 176
    if-eqz v1, :cond_c

    .line 177
    .line 178
    :try_start_1
    iget-object v0, p0, Lcom/tencent/trtc/TRTCSubCloud$8;->b:Lorg/json/JSONObject;

    .line 179
    .line 180
    invoke-static {v2, v0}, Lcom/tencent/trtc/TRTCSubCloud;->access$7300(Lcom/tencent/trtc/TRTCSubCloud;Lorg/json/JSONObject;)V

    .line 181
    .line 182
    .line 183
    return-void

    .line 184
    :cond_c
    new-instance v1, Ljava/lang/StringBuilder;

    .line 185
    .line 186
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 187
    .line 188
    .line 189
    iget-object v0, p0, Lcom/tencent/trtc/TRTCSubCloud$8;->a:Ljava/lang/String;

    .line 190
    .line 191
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 192
    .line 193
    .line 194
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    invoke-static {v2, v0}, Lcom/tencent/trtc/TRTCSubCloud;->access$7400(Lcom/tencent/trtc/TRTCSubCloud;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 199
    .line 200
    .line 201
    return-void

    .line 202
    :catch_0
    iget-object v0, p0, Lcom/tencent/trtc/TRTCSubCloud$8;->d:Lcom/tencent/trtc/TRTCSubCloud;

    .line 203
    .line 204
    new-instance v1, Ljava/lang/StringBuilder;

    .line 205
    .line 206
    const-string v2, "callExperimentalAPI[failed]: "

    .line 207
    .line 208
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 209
    .line 210
    .line 211
    iget-object p0, p0, Lcom/tencent/trtc/TRTCSubCloud$8;->c:Ljava/lang/String;

    .line 212
    .line 213
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 214
    .line 215
    .line 216
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object p0

    .line 220
    invoke-static {v0, p0}, Lcom/tencent/trtc/TRTCSubCloud;->access$7500(Lcom/tencent/trtc/TRTCSubCloud;Ljava/lang/String;)V

    .line 221
    .line 222
    .line 223
    return-void
.end method
