.class public Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMEarback;
.super Lcom/ss/bytertc/audio/device/hwearback/BaseEarback;
.source "SourceFile"


# static fields
.field private static final EVENT_KEY_RECORDING_START:I = 0x44c

.field private static final EVENT_KEY_RECORDING_STOP:I = 0x44f

.field private static final TAG:Ljava/lang/String; = "OVMEarback"


# instance fields
.field private final client:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;

.field private isAudioParamsSupported:Z

.field private isRecordingStarted:Z

.field private final slientPlayer:Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/ss/bytertc/audio/device/hwearback/BaseEarback;-><init>(Landroid/content/Context;Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;)V

    .line 2
    .line 3
    .line 4
    const/4 p2, 0x1

    .line 5
    iput-boolean p2, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMEarback;->isRecordingStarted:Z

    .line 6
    .line 7
    const/4 p2, 0x0

    .line 8
    iput-boolean p2, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMEarback;->isAudioParamsSupported:Z

    .line 9
    .line 10
    invoke-static {p1}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->initialize(Landroid/content/Context;)Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMEarback;->client:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;

    .line 15
    .line 16
    new-instance p1, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;

    .line 17
    .line 18
    invoke-direct {p1}, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object p1, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMEarback;->slientPlayer:Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;

    .line 22
    .line 23
    return-void
.end method

.method public static synthetic a(Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMEarback;I)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v1, "connection result: "

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "OVMEarback"

    .line 19
    .line 20
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    const/16 v0, 0x3e9

    .line 24
    .line 25
    if-ne p1, v0, :cond_0

    .line 26
    .line 27
    iget-object p1, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMEarback;->client:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;

    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->openKTVDevice()V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMEarback;->client:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;

    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->resetKTVParamsAndUpdate()V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Lcom/ss/bytertc/audio/device/hwearback/BaseEarback;->webRtcAudioEarBack:Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;

    .line 38
    .line 39
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMEarback;->getReportParameters()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p1, v0}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioEarBack;->onHardwareEarbackSupportParamsGet(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMEarback;->checkAudioParams()Z

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    iput-boolean p1, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMEarback;->isAudioParamsSupported:Z

    .line 51
    .line 52
    const/4 p1, 0x1

    .line 53
    invoke-virtual {p0, p1}, Lcom/ss/bytertc/audio/device/hwearback/BaseEarback;->onInitResult(Z)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_0
    const/4 p1, 0x0

    .line 58
    invoke-virtual {p0, p1}, Lcom/ss/bytertc/audio/device/hwearback/BaseEarback;->onInitResult(Z)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method private checkAudioParams()Z
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuffer;

    .line 4
    .line 5
    const-string v2, "parse params: "

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v2, v0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMEarback;->client:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;

    .line 11
    .line 12
    invoke-virtual {v2}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->getKaraokeSupportParameters()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    iget-object v3, v0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMEarback;->client:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;

    .line 17
    .line 18
    invoke-virtual {v3}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->getKaraokeSupportParameters()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 23
    .line 24
    .line 25
    new-instance v3, Lcom/ss/bytertc/audio/device/hwearback/ovm/DefaultHardwareParamsParser;

    .line 26
    .line 27
    invoke-direct {v3}, Lcom/ss/bytertc/audio/device/hwearback/ovm/DefaultHardwareParamsParser;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-interface {v3, v2}, Lcom/ss/bytertc/audio/device/hwearback/ovm/IHardwareParamsParser;->parse(Ljava/lang/String;)Lcom/ss/bytertc/audio/device/hwearback/ovm/HardwareEarbackParams;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    const-string v3, "OVMEarback"

    .line 35
    .line 36
    if-eqz v2, :cond_10

    .line 37
    .line 38
    iget-object v5, v2, Lcom/ss/bytertc/audio/device/hwearback/ovm/HardwareEarbackParams;->playParamsList:Ljava/util/List;

    .line 39
    .line 40
    const v6, 0xbb80

    .line 41
    .line 42
    .line 43
    const/4 v7, 0x2

    .line 44
    const-string v8, "}"

    .line 45
    .line 46
    const-string v9, ", flags: "

    .line 47
    .line 48
    const-string v10, ", format: "

    .line 49
    .line 50
    const/4 v11, 0x1

    .line 51
    if-eqz v5, :cond_7

    .line 52
    .line 53
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 54
    .line 55
    .line 56
    move-result v5

    .line 57
    if-lez v5, :cond_7

    .line 58
    .line 59
    const-string v5, ", playout params size: "

    .line 60
    .line 61
    invoke-virtual {v1, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 62
    .line 63
    .line 64
    iget-object v5, v2, Lcom/ss/bytertc/audio/device/hwearback/ovm/HardwareEarbackParams;->playParamsList:Ljava/util/List;

    .line 65
    .line 66
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 67
    .line 68
    .line 69
    move-result v5

    .line 70
    invoke-virtual {v1, v5}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 71
    .line 72
    .line 73
    iget-object v5, v2, Lcom/ss/bytertc/audio/device/hwearback/ovm/HardwareEarbackParams;->playParamsList:Ljava/util/List;

    .line 74
    .line 75
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 76
    .line 77
    .line 78
    move-result-object v5

    .line 79
    const/4 v12, 0x0

    .line 80
    :cond_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 81
    .line 82
    .line 83
    move-result v13

    .line 84
    if-eqz v13, :cond_8

    .line 85
    .line 86
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object v13

    .line 90
    check-cast v13, Lcom/ss/bytertc/audio/device/hwearback/ovm/HardwareEarbackParams$Play;

    .line 91
    .line 92
    const-string v14, "{streamType: "

    .line 93
    .line 94
    invoke-virtual {v1, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 95
    .line 96
    .line 97
    iget v14, v13, Lcom/ss/bytertc/audio/device/hwearback/ovm/HardwareEarbackParams$Play;->streamType:I

    .line 98
    .line 99
    invoke-virtual {v1, v14}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 100
    .line 101
    .line 102
    const-string v14, ", sampleRate: "

    .line 103
    .line 104
    invoke-virtual {v1, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 105
    .line 106
    .line 107
    iget v14, v13, Lcom/ss/bytertc/audio/device/hwearback/ovm/HardwareEarbackParams$Play;->sampleRate:I

    .line 108
    .line 109
    invoke-virtual {v1, v14}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 110
    .line 111
    .line 112
    invoke-virtual {v1, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 113
    .line 114
    .line 115
    iget v14, v13, Lcom/ss/bytertc/audio/device/hwearback/ovm/HardwareEarbackParams$Play;->format:I

    .line 116
    .line 117
    invoke-virtual {v1, v14}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 118
    .line 119
    .line 120
    invoke-virtual {v1, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 121
    .line 122
    .line 123
    iget v14, v13, Lcom/ss/bytertc/audio/device/hwearback/ovm/HardwareEarbackParams$Play;->flags:I

    .line 124
    .line 125
    invoke-virtual {v1, v14}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 126
    .line 127
    .line 128
    invoke-virtual {v1, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 129
    .line 130
    .line 131
    iget v14, v13, Lcom/ss/bytertc/audio/device/hwearback/ovm/HardwareEarbackParams$Play;->streamType:I

    .line 132
    .line 133
    const/4 v15, 0x3

    .line 134
    if-ne v14, v15, :cond_2

    .line 135
    .line 136
    iget v14, v13, Lcom/ss/bytertc/audio/device/hwearback/ovm/HardwareEarbackParams$Play;->format:I

    .line 137
    .line 138
    if-ne v14, v7, :cond_2

    .line 139
    .line 140
    iget v14, v13, Lcom/ss/bytertc/audio/device/hwearback/ovm/HardwareEarbackParams$Play;->sampleRate:I

    .line 141
    .line 142
    const v15, 0xac44

    .line 143
    .line 144
    .line 145
    if-eq v14, v15, :cond_1

    .line 146
    .line 147
    if-ne v14, v6, :cond_2

    .line 148
    .line 149
    :cond_1
    move v14, v11

    .line 150
    goto :goto_0

    .line 151
    :cond_2
    const/4 v14, 0x0

    .line 152
    :goto_0
    invoke-static {}, Lcom/ss/bytertc/audio/device/base/ManufacturerChecker;->getManufacturerType()Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;

    .line 153
    .line 154
    .line 155
    move-result-object v15

    .line 156
    sget-object v4, Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;->XM:Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;

    .line 157
    .line 158
    if-eq v15, v4, :cond_3

    .line 159
    .line 160
    invoke-static {}, Lcom/ss/bytertc/audio/device/base/ManufacturerChecker;->getManufacturerType()Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;

    .line 161
    .line 162
    .line 163
    move-result-object v4

    .line 164
    sget-object v15, Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;->RM:Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;

    .line 165
    .line 166
    if-ne v4, v15, :cond_5

    .line 167
    .line 168
    :cond_3
    iget v4, v13, Lcom/ss/bytertc/audio/device/hwearback/ovm/HardwareEarbackParams$Play;->version:I

    .line 169
    .line 170
    if-lez v4, :cond_4

    .line 171
    .line 172
    move v4, v11

    .line 173
    goto :goto_1

    .line 174
    :cond_4
    const/4 v4, 0x0

    .line 175
    :goto_1
    and-int/2addr v14, v4

    .line 176
    :cond_5
    or-int/2addr v12, v14

    .line 177
    if-eqz v12, :cond_0

    .line 178
    .line 179
    new-instance v4, Ljava/lang/StringBuilder;

    .line 180
    .line 181
    const-string v5, "updating slientPlayer params: "

    .line 182
    .line 183
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 184
    .line 185
    .line 186
    iget v5, v13, Lcom/ss/bytertc/audio/device/hwearback/ovm/HardwareEarbackParams$Play;->sampleRate:I

    .line 187
    .line 188
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 189
    .line 190
    .line 191
    const-string v5, ", "

    .line 192
    .line 193
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 194
    .line 195
    .line 196
    iget v5, v13, Lcom/ss/bytertc/audio/device/hwearback/ovm/HardwareEarbackParams$Play;->flags:I

    .line 197
    .line 198
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 199
    .line 200
    .line 201
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object v4

    .line 205
    invoke-static {v3, v4}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 206
    .line 207
    .line 208
    iget-object v4, v0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMEarback;->slientPlayer:Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;

    .line 209
    .line 210
    iget v5, v13, Lcom/ss/bytertc/audio/device/hwearback/ovm/HardwareEarbackParams$Play;->sampleRate:I

    .line 211
    .line 212
    invoke-virtual {v4, v5}, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;->setSampleRate(I)V

    .line 213
    .line 214
    .line 215
    iget-object v0, v0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMEarback;->slientPlayer:Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;

    .line 216
    .line 217
    iget v4, v13, Lcom/ss/bytertc/audio/device/hwearback/ovm/HardwareEarbackParams$Play;->flags:I

    .line 218
    .line 219
    const/16 v5, 0x8

    .line 220
    .line 221
    and-int/2addr v4, v5

    .line 222
    if-ne v4, v5, :cond_6

    .line 223
    .line 224
    move v4, v11

    .line 225
    goto :goto_2

    .line 226
    :cond_6
    const/4 v4, 0x0

    .line 227
    :goto_2
    invoke-virtual {v0, v4}, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;->setRequireDeepBuffer(Z)V

    .line 228
    .line 229
    .line 230
    goto :goto_3

    .line 231
    :cond_7
    const-string v0, ", playout params parsed null."

    .line 232
    .line 233
    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 234
    .line 235
    .line 236
    const/4 v12, 0x0

    .line 237
    :cond_8
    :goto_3
    iget-object v0, v2, Lcom/ss/bytertc/audio/device/hwearback/ovm/HardwareEarbackParams;->recordParamsList:Ljava/util/List;

    .line 238
    .line 239
    if-eqz v0, :cond_f

    .line 240
    .line 241
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 242
    .line 243
    .line 244
    move-result v0

    .line 245
    if-lez v0, :cond_f

    .line 246
    .line 247
    const-string v0, ", record params size: "

    .line 248
    .line 249
    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 250
    .line 251
    .line 252
    iget-object v0, v2, Lcom/ss/bytertc/audio/device/hwearback/ovm/HardwareEarbackParams;->recordParamsList:Ljava/util/List;

    .line 253
    .line 254
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 255
    .line 256
    .line 257
    move-result v0

    .line 258
    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 259
    .line 260
    .line 261
    iget-object v0, v2, Lcom/ss/bytertc/audio/device/hwearback/ovm/HardwareEarbackParams;->recordParamsList:Ljava/util/List;

    .line 262
    .line 263
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 264
    .line 265
    .line 266
    move-result-object v0

    .line 267
    const/4 v2, 0x0

    .line 268
    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 269
    .line 270
    .line 271
    move-result v4

    .line 272
    if-eqz v4, :cond_e

    .line 273
    .line 274
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 275
    .line 276
    .line 277
    move-result-object v4

    .line 278
    check-cast v4, Lcom/ss/bytertc/audio/device/hwearback/ovm/HardwareEarbackParams$Record;

    .line 279
    .line 280
    const-string v5, "{sampleRate: "

    .line 281
    .line 282
    invoke-virtual {v1, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 283
    .line 284
    .line 285
    iget v5, v4, Lcom/ss/bytertc/audio/device/hwearback/ovm/HardwareEarbackParams$Record;->sampleRate:I

    .line 286
    .line 287
    invoke-virtual {v1, v5}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 288
    .line 289
    .line 290
    invoke-virtual {v1, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 291
    .line 292
    .line 293
    iget v5, v4, Lcom/ss/bytertc/audio/device/hwearback/ovm/HardwareEarbackParams$Record;->format:I

    .line 294
    .line 295
    invoke-virtual {v1, v5}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 296
    .line 297
    .line 298
    const-string v5, ", audioSource: "

    .line 299
    .line 300
    invoke-virtual {v1, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 301
    .line 302
    .line 303
    iget v5, v4, Lcom/ss/bytertc/audio/device/hwearback/ovm/HardwareEarbackParams$Record;->source:I

    .line 304
    .line 305
    invoke-virtual {v1, v5}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 306
    .line 307
    .line 308
    invoke-virtual {v1, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 309
    .line 310
    .line 311
    iget v5, v4, Lcom/ss/bytertc/audio/device/hwearback/ovm/HardwareEarbackParams$Record;->flags:I

    .line 312
    .line 313
    invoke-virtual {v1, v5}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 314
    .line 315
    .line 316
    invoke-virtual {v1, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 317
    .line 318
    .line 319
    iget v5, v4, Lcom/ss/bytertc/audio/device/hwearback/ovm/HardwareEarbackParams$Record;->format:I

    .line 320
    .line 321
    if-ne v5, v7, :cond_a

    .line 322
    .line 323
    iget v5, v4, Lcom/ss/bytertc/audio/device/hwearback/ovm/HardwareEarbackParams$Record;->sampleRate:I

    .line 324
    .line 325
    if-ne v5, v6, :cond_a

    .line 326
    .line 327
    iget v5, v4, Lcom/ss/bytertc/audio/device/hwearback/ovm/HardwareEarbackParams$Record;->source:I

    .line 328
    .line 329
    if-eq v5, v11, :cond_9

    .line 330
    .line 331
    if-nez v5, :cond_a

    .line 332
    .line 333
    :cond_9
    iget v5, v4, Lcom/ss/bytertc/audio/device/hwearback/ovm/HardwareEarbackParams$Record;->flags:I

    .line 334
    .line 335
    and-int/2addr v5, v11

    .line 336
    if-ne v5, v11, :cond_a

    .line 337
    .line 338
    move v5, v11

    .line 339
    goto :goto_5

    .line 340
    :cond_a
    const/4 v5, 0x0

    .line 341
    :goto_5
    invoke-static {}, Lcom/ss/bytertc/audio/device/base/ManufacturerChecker;->getManufacturerType()Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;

    .line 342
    .line 343
    .line 344
    move-result-object v13

    .line 345
    sget-object v14, Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;->XM:Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;

    .line 346
    .line 347
    if-eq v13, v14, :cond_b

    .line 348
    .line 349
    invoke-static {}, Lcom/ss/bytertc/audio/device/base/ManufacturerChecker;->getManufacturerType()Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;

    .line 350
    .line 351
    .line 352
    move-result-object v13

    .line 353
    sget-object v14, Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;->RM:Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;

    .line 354
    .line 355
    if-ne v13, v14, :cond_d

    .line 356
    .line 357
    :cond_b
    iget v4, v4, Lcom/ss/bytertc/audio/device/hwearback/ovm/HardwareEarbackParams$Record;->version:I

    .line 358
    .line 359
    if-lez v4, :cond_c

    .line 360
    .line 361
    move v4, v11

    .line 362
    goto :goto_6

    .line 363
    :cond_c
    const/4 v4, 0x0

    .line 364
    :goto_6
    and-int/2addr v5, v4

    .line 365
    :cond_d
    or-int/2addr v2, v5

    .line 366
    goto :goto_4

    .line 367
    :cond_e
    and-int v4, v12, v2

    .line 368
    .line 369
    goto :goto_7

    .line 370
    :cond_f
    const-string v0, ", record params parsed null."

    .line 371
    .line 372
    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 373
    .line 374
    .line 375
    :cond_10
    const/4 v4, 0x0

    .line 376
    :goto_7
    const-string v0, ", canOpenEarback: "

    .line 377
    .line 378
    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 379
    .line 380
    .line 381
    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->append(Z)Ljava/lang/StringBuffer;

    .line 382
    .line 383
    .line 384
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 385
    .line 386
    .line 387
    move-result-object v0

    .line 388
    invoke-static {v3, v0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 389
    .line 390
    .line 391
    return v4
.end method

.method private getReportParameters()Ljava/lang/String;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMEarback;->client:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->getKaraokeSupportParameters()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    .line 8
    .line 9
    invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    const-string v2, "version"

    .line 13
    .line 14
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMEarback;->client:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->getVersion()I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    invoke-virtual {v1, v2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    return-object p0

    .line 28
    :catchall_0
    const-string p0, "OVMEarback"

    .line 29
    .line 30
    const-string v1, "parse report params error, not json format"

    .line 31
    .line 32
    invoke-static {p0, v1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-object v0
.end method

.method private declared-synchronized updatePlayerState()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMEarback;->slientPlayer:Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    monitor-exit p0

    .line 7
    return-void

    .line 8
    :cond_0
    :try_start_1
    invoke-virtual {v0}, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;->isPlaying()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    iget-boolean v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMEarback;->isRecordingStarted:Z

    .line 15
    .line 16
    if-nez v0, :cond_2

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :catchall_0
    move-exception v0

    .line 20
    goto :goto_2

    .line 21
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/ss/bytertc/audio/device/hwearback/BaseEarback;->getState()Lcom/ss/bytertc/audio/device/hwearback/BaseEarback$EarbackState;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sget-object v1, Lcom/ss/bytertc/audio/device/hwearback/BaseEarback$EarbackState;->RUNNING:Lcom/ss/bytertc/audio/device/hwearback/BaseEarback$EarbackState;

    .line 26
    .line 27
    if-ne v0, v1, :cond_3

    .line 28
    .line 29
    :cond_2
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMEarback;->slientPlayer:Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;

    .line 30
    .line 31
    invoke-virtual {v0}, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;->play()V

    .line 32
    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_3
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMEarback;->slientPlayer:Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;

    .line 36
    .line 37
    invoke-virtual {v0}, Lcom/ss/bytertc/audio/device/hwearback/SlientPlayer;->stop()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 38
    .line 39
    .line 40
    :goto_1
    monitor-exit p0

    .line 41
    return-void

    .line 42
    :goto_2
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 43
    throw v0
.end method


# virtual methods
.method public getLatency()I
    .locals 0

    const/4 p0, -0x1

    return p0
.end method

.method public onClose()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMEarback;->client:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->setPlayFeedbackParam(I)V

    .line 5
    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0
.end method

.method public onEvent(II)V
    .locals 0

    .line 1
    const/16 p2, 0x44c

    .line 2
    .line 3
    if-ne p1, p2, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x1

    .line 6
    iput-boolean p1, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMEarback;->isRecordingStarted:Z

    .line 7
    .line 8
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMEarback;->updatePlayerState()V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    const/16 p2, 0x44f

    .line 13
    .line 14
    if-ne p1, p2, :cond_1

    .line 15
    .line 16
    const/4 p1, 0x0

    .line 17
    iput-boolean p1, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMEarback;->isRecordingStarted:Z

    .line 18
    .line 19
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMEarback;->updatePlayerState()V

    .line 20
    .line 21
    .line 22
    :cond_1
    return-void
.end method

.method public onInit()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMEarback;->client:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;

    .line 2
    .line 3
    new-instance v1, Ll/t850;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/t850;-><init>(Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMEarback;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->setAuthCallback(Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager$AuthCallback;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onIsSupportCall()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMEarback;->client:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->isSupportedAndAuth()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMEarback;->isAudioParamsSupported:Z

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public onOpen()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMEarback;->client:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, v0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->setPlayFeedbackParam(I)V

    .line 5
    .line 6
    .line 7
    return v0
.end method

.method public onRelease()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMEarback;->client:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->setPlayFeedbackParam(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMEarback;->client:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->setMixerSoundType(I)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMEarback;->client:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->setEqualizerType(I)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMEarback;->client:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->closeKTVDevice()V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMEarback;->client:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->release()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public declared-synchronized onStateChanged(Lcom/ss/bytertc/audio/device/hwearback/BaseEarback$EarbackState;Lcom/ss/bytertc/audio/device/hwearback/BaseEarback$EarbackState;)V
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-super {p0, p1, p2}, Lcom/ss/bytertc/audio/device/hwearback/BaseEarback;->onStateChanged(Lcom/ss/bytertc/audio/device/hwearback/BaseEarback$EarbackState;Lcom/ss/bytertc/audio/device/hwearback/BaseEarback$EarbackState;)V

    .line 3
    .line 4
    .line 5
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMEarback;->updatePlayerState()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 6
    .line 7
    .line 8
    monitor-exit p0

    .line 9
    return-void

    .line 10
    :catchall_0
    move-exception p1

    .line 11
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 12
    throw p1
.end method

.method public setEffect(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMEarback;->client:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->setMixerSoundType(I)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    return p0
.end method

.method public setEqualizer(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMEarback;->client:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->setEqualizerType(I)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    return p0
.end method

.method public setVolume(I)I
    .locals 2

    .line 1
    invoke-static {}, Lcom/ss/bytertc/audio/device/base/ManufacturerChecker;->getManufacturerType()Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;->OP:Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;

    .line 6
    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    const/16 v0, 0xc

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/16 v0, 0xf

    .line 13
    .line 14
    :goto_0
    int-to-float p1, p1

    .line 15
    const/high16 v1, 0x42c80000    # 100.0f

    .line 16
    .line 17
    div-float/2addr p1, v1

    .line 18
    int-to-float v1, v0

    .line 19
    mul-float/2addr p1, v1

    .line 20
    float-to-int p1, p1

    .line 21
    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    const/4 v0, 0x0

    .line 26
    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMEarback;->client:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->setMicVolParam(I)V

    .line 33
    .line 34
    .line 35
    return v0
.end method
