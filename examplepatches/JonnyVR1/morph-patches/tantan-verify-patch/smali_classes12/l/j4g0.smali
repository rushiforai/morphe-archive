.class public Ll/j4g0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Lcom/immomo/components/interfaces/IProcessOutput$ProcessType;Ljava/lang/String;)Ljava/lang/String;
    .locals 8

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_9

    .line 7
    .line 8
    const-string v0, "makeup"

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    if-eqz v2, :cond_9

    .line 15
    .line 16
    const-string v2, "/"

    .line 17
    .line 18
    invoke-virtual {p1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    array-length v3, v2

    .line 23
    const/4 v4, 0x1

    .line 24
    if-le v3, v4, :cond_9

    .line 25
    .line 26
    const-string v3, "makeup_style"

    .line 27
    .line 28
    invoke-virtual {p1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    const/4 v5, 0x3

    .line 33
    const/4 v6, 0x2

    .line 34
    if-eqz p1, :cond_3

    .line 35
    .line 36
    array-length p1, v2

    .line 37
    sub-int/2addr p1, v6

    .line 38
    aget-object p1, v2, p1

    .line 39
    .line 40
    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    if-eqz p1, :cond_3

    .line 45
    .line 46
    array-length p1, v2

    .line 47
    sub-int/2addr p1, v4

    .line 48
    aget-object p1, v2, p1

    .line 49
    .line 50
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-nez v0, :cond_9

    .line 55
    .line 56
    sget-object v0, Ll/j4g0$a;->a:[I

    .line 57
    .line 58
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    aget p0, v0, p0

    .line 63
    .line 64
    if-eq p0, v4, :cond_2

    .line 65
    .line 66
    if-eq p0, v6, :cond_1

    .line 67
    .line 68
    if-eq p0, v5, :cond_0

    .line 69
    .line 70
    goto/16 :goto_1

    .line 71
    .line 72
    :cond_0
    invoke-static {}, Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;->getInstance()Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 77
    .line 78
    .line 79
    move-result-wide v0

    .line 80
    sget-object v2, Lcom/momo/xengine/mestatistics/ReportType;->COUNT:Lcom/momo/xengine/mestatistics/ReportType;

    .line 81
    .line 82
    const-string v3, "sdk-camera-video-adapter-use-makeup-style"

    .line 83
    .line 84
    invoke-virtual {p0, v3, v0, v1, v2}, Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;->realTimeReport(Ljava/lang/String;JLcom/momo/xengine/mestatistics/ReportType;)V

    .line 85
    .line 86
    .line 87
    new-instance p0, Ljava/lang/StringBuilder;

    .line 88
    .line 89
    const-string v0, "sdk-camera-video-adapter-makeup-style-"

    .line 90
    .line 91
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    return-object p0

    .line 102
    :cond_1
    invoke-static {}, Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;->getInstance()Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 107
    .line 108
    .line 109
    move-result-wide v0

    .line 110
    sget-object v2, Lcom/momo/xengine/mestatistics/ReportType;->COUNT:Lcom/momo/xengine/mestatistics/ReportType;

    .line 111
    .line 112
    const-string v3, "sdk-camera-image-adapter-use-makeup-style"

    .line 113
    .line 114
    invoke-virtual {p0, v3, v0, v1, v2}, Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;->realTimeReport(Ljava/lang/String;JLcom/momo/xengine/mestatistics/ReportType;)V

    .line 115
    .line 116
    .line 117
    new-instance p0, Ljava/lang/StringBuilder;

    .line 118
    .line 119
    const-string v0, "sdk-camera-image-adapter-makeup-style-"

    .line 120
    .line 121
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    return-object p0

    .line 132
    :cond_2
    invoke-static {}, Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;->getInstance()Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 137
    .line 138
    .line 139
    move-result-wide v0

    .line 140
    sget-object v2, Lcom/momo/xengine/mestatistics/ReportType;->COUNT:Lcom/momo/xengine/mestatistics/ReportType;

    .line 141
    .line 142
    const-string v3, "sdk-camera-engine-use-makeup-style"

    .line 143
    .line 144
    invoke-virtual {p0, v3, v0, v1, v2}, Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;->realTimeReport(Ljava/lang/String;JLcom/momo/xengine/mestatistics/ReportType;)V

    .line 145
    .line 146
    .line 147
    new-instance p0, Ljava/lang/StringBuilder;

    .line 148
    .line 149
    const-string v0, "sdk-camera-engine-makeup-style-"

    .line 150
    .line 151
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 152
    .line 153
    .line 154
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object p0

    .line 161
    return-object p0

    .line 162
    :cond_3
    array-length p1, v2

    .line 163
    sub-int/2addr p1, v4

    .line 164
    move-object v3, v1

    .line 165
    :goto_0
    if-ltz p1, :cond_5

    .line 166
    .line 167
    aget-object v7, v2, p1

    .line 168
    .line 169
    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 170
    .line 171
    .line 172
    move-result v7

    .line 173
    if-eqz v7, :cond_4

    .line 174
    .line 175
    array-length v7, v2

    .line 176
    sub-int/2addr v7, v6

    .line 177
    if-ge p1, v7, :cond_4

    .line 178
    .line 179
    add-int/lit8 v3, p1, 0x1

    .line 180
    .line 181
    aget-object v3, v2, v3

    .line 182
    .line 183
    :cond_4
    add-int/lit8 p1, p1, -0x1

    .line 184
    .line 185
    goto :goto_0

    .line 186
    :cond_5
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 187
    .line 188
    .line 189
    move-result p1

    .line 190
    if-nez p1, :cond_9

    .line 191
    .line 192
    sget-object p1, Ll/j4g0$a;->a:[I

    .line 193
    .line 194
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 195
    .line 196
    .line 197
    move-result p0

    .line 198
    aget p0, p1, p0

    .line 199
    .line 200
    if-eq p0, v4, :cond_8

    .line 201
    .line 202
    if-eq p0, v6, :cond_7

    .line 203
    .line 204
    if-eq p0, v5, :cond_6

    .line 205
    .line 206
    goto :goto_1

    .line 207
    :cond_6
    invoke-static {}, Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;->getInstance()Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;

    .line 208
    .line 209
    .line 210
    move-result-object p0

    .line 211
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 212
    .line 213
    .line 214
    move-result-wide v0

    .line 215
    sget-object p1, Lcom/momo/xengine/mestatistics/ReportType;->COUNT:Lcom/momo/xengine/mestatistics/ReportType;

    .line 216
    .line 217
    const-string v2, "sdk-camera-video-adapter-use-makeup"

    .line 218
    .line 219
    invoke-virtual {p0, v2, v0, v1, p1}, Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;->realTimeReport(Ljava/lang/String;JLcom/momo/xengine/mestatistics/ReportType;)V

    .line 220
    .line 221
    .line 222
    new-instance p0, Ljava/lang/StringBuilder;

    .line 223
    .line 224
    const-string p1, "sdk-camera-video-adapter-"

    .line 225
    .line 226
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 227
    .line 228
    .line 229
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 230
    .line 231
    .line 232
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 233
    .line 234
    .line 235
    move-result-object p0

    .line 236
    return-object p0

    .line 237
    :cond_7
    invoke-static {}, Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;->getInstance()Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;

    .line 238
    .line 239
    .line 240
    move-result-object p0

    .line 241
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 242
    .line 243
    .line 244
    move-result-wide v0

    .line 245
    sget-object p1, Lcom/momo/xengine/mestatistics/ReportType;->COUNT:Lcom/momo/xengine/mestatistics/ReportType;

    .line 246
    .line 247
    const-string v2, "sdk-camera-image-adapter-use-makeup"

    .line 248
    .line 249
    invoke-virtual {p0, v2, v0, v1, p1}, Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;->realTimeReport(Ljava/lang/String;JLcom/momo/xengine/mestatistics/ReportType;)V

    .line 250
    .line 251
    .line 252
    new-instance p0, Ljava/lang/StringBuilder;

    .line 253
    .line 254
    const-string p1, "sdk-camera-image-adapter-"

    .line 255
    .line 256
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 257
    .line 258
    .line 259
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 260
    .line 261
    .line 262
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 263
    .line 264
    .line 265
    move-result-object p0

    .line 266
    return-object p0

    .line 267
    :cond_8
    invoke-static {}, Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;->getInstance()Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;

    .line 268
    .line 269
    .line 270
    move-result-object p0

    .line 271
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 272
    .line 273
    .line 274
    move-result-wide v0

    .line 275
    sget-object p1, Lcom/momo/xengine/mestatistics/ReportType;->COUNT:Lcom/momo/xengine/mestatistics/ReportType;

    .line 276
    .line 277
    const-string v2, "sdk-camera-engine-use-makeup"

    .line 278
    .line 279
    invoke-virtual {p0, v2, v0, v1, p1}, Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;->realTimeReport(Ljava/lang/String;JLcom/momo/xengine/mestatistics/ReportType;)V

    .line 280
    .line 281
    .line 282
    new-instance p0, Ljava/lang/StringBuilder;

    .line 283
    .line 284
    const-string p1, "sdk-camera-engine-"

    .line 285
    .line 286
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 287
    .line 288
    .line 289
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 290
    .line 291
    .line 292
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 293
    .line 294
    .line 295
    move-result-object p0

    .line 296
    return-object p0

    .line 297
    :cond_9
    :goto_1
    return-object v1
.end method

.method public static b(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string p0, ""

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v1, -0x1

    .line 18
    sparse-switch v0, :sswitch_data_0

    .line 19
    .line 20
    .line 21
    goto/16 :goto_0

    .line 22
    .line 23
    :sswitch_0
    const-string v0, "beauty_noseRidgeWidthValue"

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    goto/16 :goto_0

    .line 32
    .line 33
    :cond_1
    const/16 v1, 0x1d

    .line 34
    .line 35
    goto/16 :goto_0

    .line 36
    .line 37
    :sswitch_1
    const-string v0, "beauty_skinWhitenValue"

    .line 38
    .line 39
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_2

    .line 44
    .line 45
    goto/16 :goto_0

    .line 46
    .line 47
    :cond_2
    const/16 v1, 0x1c

    .line 48
    .line 49
    goto/16 :goto_0

    .line 50
    .line 51
    :sswitch_2
    const-string v0, "beauty_teethWhtienValue"

    .line 52
    .line 53
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-nez v0, :cond_3

    .line 58
    .line 59
    goto/16 :goto_0

    .line 60
    .line 61
    :cond_3
    const/16 v1, 0x1b

    .line 62
    .line 63
    goto/16 :goto_0

    .line 64
    .line 65
    :sswitch_3
    const-string v0, "beauty_shortenFaceValue"

    .line 66
    .line 67
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-nez v0, :cond_4

    .line 72
    .line 73
    goto/16 :goto_0

    .line 74
    .line 75
    :cond_4
    const/16 v1, 0x1a

    .line 76
    .line 77
    goto/16 :goto_0

    .line 78
    .line 79
    :sswitch_4
    const-string v0, "beauty_smallFaceValue"

    .line 80
    .line 81
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    if-nez v0, :cond_5

    .line 86
    .line 87
    goto/16 :goto_0

    .line 88
    .line 89
    :cond_5
    const/16 v1, 0x19

    .line 90
    .line 91
    goto/16 :goto_0

    .line 92
    .line 93
    :sswitch_5
    const-string v0, "beauty_noseSizetValue"

    .line 94
    .line 95
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    if-nez v0, :cond_6

    .line 100
    .line 101
    goto/16 :goto_0

    .line 102
    .line 103
    :cond_6
    const/16 v1, 0x18

    .line 104
    .line 105
    goto/16 :goto_0

    .line 106
    .line 107
    :sswitch_6
    const-string v0, "beauty_noseLiftValue"

    .line 108
    .line 109
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    if-nez v0, :cond_7

    .line 114
    .line 115
    goto/16 :goto_0

    .line 116
    .line 117
    :cond_7
    const/16 v1, 0x17

    .line 118
    .line 119
    goto/16 :goto_0

    .line 120
    .line 121
    :sswitch_7
    const-string v0, "beauty_nasolabiaFoldslValue"

    .line 122
    .line 123
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    if-nez v0, :cond_8

    .line 128
    .line 129
    goto/16 :goto_0

    .line 130
    .line 131
    :cond_8
    const/16 v1, 0x16

    .line 132
    .line 133
    goto/16 :goto_0

    .line 134
    .line 135
    :sswitch_8
    const-string v0, "beauty_removePouchValue"

    .line 136
    .line 137
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    if-nez v0, :cond_9

    .line 142
    .line 143
    goto/16 :goto_0

    .line 144
    .line 145
    :cond_9
    const/16 v1, 0x15

    .line 146
    .line 147
    goto/16 :goto_0

    .line 148
    .line 149
    :sswitch_9
    const-string v0, "beauty_jaw2WidthValue"

    .line 150
    .line 151
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 152
    .line 153
    .line 154
    move-result v0

    .line 155
    if-nez v0, :cond_a

    .line 156
    .line 157
    goto/16 :goto_0

    .line 158
    .line 159
    :cond_a
    const/16 v1, 0x14

    .line 160
    .line 161
    goto/16 :goto_0

    .line 162
    .line 163
    :sswitch_a
    const-string v0, "beauty_bigEyeValue"

    .line 164
    .line 165
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 166
    .line 167
    .line 168
    move-result v0

    .line 169
    if-nez v0, :cond_b

    .line 170
    .line 171
    goto/16 :goto_0

    .line 172
    .line 173
    :cond_b
    const/16 v1, 0x13

    .line 174
    .line 175
    goto/16 :goto_0

    .line 176
    .line 177
    :sswitch_b
    const-string v0, "beauty_eyeTiltValue"

    .line 178
    .line 179
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 180
    .line 181
    .line 182
    move-result v0

    .line 183
    if-nez v0, :cond_c

    .line 184
    .line 185
    goto/16 :goto_0

    .line 186
    .line 187
    :cond_c
    const/16 v1, 0x12

    .line 188
    .line 189
    goto/16 :goto_0

    .line 190
    .line 191
    :sswitch_c
    const-string v0, "beauty_chinLengthlValue"

    .line 192
    .line 193
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 194
    .line 195
    .line 196
    move-result v0

    .line 197
    if-nez v0, :cond_d

    .line 198
    .line 199
    goto/16 :goto_0

    .line 200
    .line 201
    :cond_d
    const/16 v1, 0x11

    .line 202
    .line 203
    goto/16 :goto_0

    .line 204
    .line 205
    :sswitch_d
    const-string v0, "beauty_thinFaceValue"

    .line 206
    .line 207
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 208
    .line 209
    .line 210
    move-result v0

    .line 211
    if-nez v0, :cond_e

    .line 212
    .line 213
    goto/16 :goto_0

    .line 214
    .line 215
    :cond_e
    const/16 v1, 0x10

    .line 216
    .line 217
    goto/16 :goto_0

    .line 218
    .line 219
    :sswitch_e
    const-string v0, "beauty_skinSmoothingValue"

    .line 220
    .line 221
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 222
    .line 223
    .line 224
    move-result v0

    .line 225
    if-nez v0, :cond_f

    .line 226
    .line 227
    goto/16 :goto_0

    .line 228
    .line 229
    :cond_f
    const/16 v1, 0xf

    .line 230
    .line 231
    goto/16 :goto_0

    .line 232
    .line 233
    :sswitch_f
    const-string v0, "beauty_eyeBrightenValue"

    .line 234
    .line 235
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 236
    .line 237
    .line 238
    move-result v0

    .line 239
    if-nez v0, :cond_10

    .line 240
    .line 241
    goto/16 :goto_0

    .line 242
    .line 243
    :cond_10
    const/16 v1, 0xe

    .line 244
    .line 245
    goto/16 :goto_0

    .line 246
    .line 247
    :sswitch_10
    const-string v0, "beauty_cheekboneWidthValue"

    .line 248
    .line 249
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 250
    .line 251
    .line 252
    move-result v0

    .line 253
    if-nez v0, :cond_11

    .line 254
    .line 255
    goto/16 :goto_0

    .line 256
    .line 257
    :cond_11
    const/16 v1, 0xd

    .line 258
    .line 259
    goto/16 :goto_0

    .line 260
    .line 261
    :sswitch_11
    const-string v0, "beauty_mouthSizeValue"

    .line 262
    .line 263
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 264
    .line 265
    .line 266
    move-result v0

    .line 267
    if-nez v0, :cond_12

    .line 268
    .line 269
    goto/16 :goto_0

    .line 270
    .line 271
    :cond_12
    const/16 v1, 0xc

    .line 272
    .line 273
    goto/16 :goto_0

    .line 274
    .line 275
    :sswitch_12
    const-string v0, "beauty_noseWidthlValue"

    .line 276
    .line 277
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 278
    .line 279
    .line 280
    move-result v0

    .line 281
    if-nez v0, :cond_13

    .line 282
    .line 283
    goto/16 :goto_0

    .line 284
    .line 285
    :cond_13
    const/16 v1, 0xb

    .line 286
    .line 287
    goto/16 :goto_0

    .line 288
    .line 289
    :sswitch_13
    const-string v0, "beauty_skinRuddyValue"

    .line 290
    .line 291
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 292
    .line 293
    .line 294
    move-result v0

    .line 295
    if-nez v0, :cond_14

    .line 296
    .line 297
    goto/16 :goto_0

    .line 298
    .line 299
    :cond_14
    const/16 v1, 0xa

    .line 300
    .line 301
    goto/16 :goto_0

    .line 302
    .line 303
    :sswitch_14
    const-string v0, "beauty_faceWidthlValue"

    .line 304
    .line 305
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 306
    .line 307
    .line 308
    move-result v0

    .line 309
    if-nez v0, :cond_15

    .line 310
    .line 311
    goto/16 :goto_0

    .line 312
    .line 313
    :cond_15
    const/16 v1, 0x9

    .line 314
    .line 315
    goto/16 :goto_0

    .line 316
    .line 317
    :sswitch_15
    const-string v0, "beauty_skinSharpenValue"

    .line 318
    .line 319
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 320
    .line 321
    .line 322
    move-result v0

    .line 323
    if-nez v0, :cond_16

    .line 324
    .line 325
    goto/16 :goto_0

    .line 326
    .line 327
    :cond_16
    const/16 v1, 0x8

    .line 328
    .line 329
    goto/16 :goto_0

    .line 330
    .line 331
    :sswitch_16
    const-string v0, "beauty_eyeDistanceValue"

    .line 332
    .line 333
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 334
    .line 335
    .line 336
    move-result v0

    .line 337
    if-nez v0, :cond_17

    .line 338
    .line 339
    goto :goto_0

    .line 340
    :cond_17
    const/4 v1, 0x7

    .line 341
    goto :goto_0

    .line 342
    :sswitch_17
    const-string v0, "beauty_longLegValue"

    .line 343
    .line 344
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 345
    .line 346
    .line 347
    move-result v0

    .line 348
    if-nez v0, :cond_18

    .line 349
    .line 350
    goto :goto_0

    .line 351
    :cond_18
    const/4 v1, 0x6

    .line 352
    goto :goto_0

    .line 353
    :sswitch_18
    const-string v0, "beauty_jawShapelValue"

    .line 354
    .line 355
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 356
    .line 357
    .line 358
    move-result v0

    .line 359
    if-nez v0, :cond_19

    .line 360
    .line 361
    goto :goto_0

    .line 362
    :cond_19
    const/4 v1, 0x5

    .line 363
    goto :goto_0

    .line 364
    :sswitch_19
    const-string v0, "beauty_foreheadValue"

    .line 365
    .line 366
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 367
    .line 368
    .line 369
    move-result v0

    .line 370
    if-nez v0, :cond_1a

    .line 371
    .line 372
    goto :goto_0

    .line 373
    :cond_1a
    const/4 v1, 0x4

    .line 374
    goto :goto_0

    .line 375
    :sswitch_1a
    const-string v0, "beauty_thinBodyValue"

    .line 376
    .line 377
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 378
    .line 379
    .line 380
    move-result v0

    .line 381
    if-nez v0, :cond_1b

    .line 382
    .line 383
    goto :goto_0

    .line 384
    :cond_1b
    const/4 v1, 0x3

    .line 385
    goto :goto_0

    .line 386
    :sswitch_1b
    const-string v0, "beauty_noseTipSizeValue"

    .line 387
    .line 388
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 389
    .line 390
    .line 391
    move-result v0

    .line 392
    if-nez v0, :cond_1c

    .line 393
    .line 394
    goto :goto_0

    .line 395
    :cond_1c
    const/4 v1, 0x2

    .line 396
    goto :goto_0

    .line 397
    :sswitch_1c
    const-string v0, "beauty_lipThicknessValue"

    .line 398
    .line 399
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 400
    .line 401
    .line 402
    move-result v0

    .line 403
    if-nez v0, :cond_1d

    .line 404
    .line 405
    goto :goto_0

    .line 406
    :cond_1d
    const/4 v1, 0x1

    .line 407
    goto :goto_0

    .line 408
    :sswitch_1d
    const-string v0, "beauty_eyeHeightValue"

    .line 409
    .line 410
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 411
    .line 412
    .line 413
    move-result v0

    .line 414
    if-nez v0, :cond_1e

    .line 415
    .line 416
    goto :goto_0

    .line 417
    :cond_1e
    const/4 v1, 0x0

    .line 418
    :goto_0
    packed-switch v1, :pswitch_data_0

    .line 419
    .line 420
    .line 421
    return-object p0

    .line 422
    :pswitch_0
    const-string p0, "noseRidgeWidth"

    .line 423
    .line 424
    return-object p0

    .line 425
    :pswitch_1
    const-string p0, "white"

    .line 426
    .line 427
    return-object p0

    .line 428
    :pswitch_2
    const-string p0, "teeth-whiten"

    .line 429
    .line 430
    return-object p0

    .line 431
    :pswitch_3
    const-string p0, "shortenFace"

    .line 432
    .line 433
    return-object p0

    .line 434
    :pswitch_4
    const-string p0, "smallFace"

    .line 435
    .line 436
    return-object p0

    .line 437
    :pswitch_5
    const-string p0, "noseSize"

    .line 438
    .line 439
    return-object p0

    .line 440
    :pswitch_6
    const-string p0, "noseLift"

    .line 441
    .line 442
    return-object p0

    .line 443
    :pswitch_7
    const-string p0, "remove-nasolabial-floads"

    .line 444
    .line 445
    return-object p0

    .line 446
    :pswitch_8
    const-string p0, "remove-pouch"

    .line 447
    .line 448
    return-object p0

    .line 449
    :pswitch_9
    const-string p0, "jaw2Width"

    .line 450
    .line 451
    return-object p0

    .line 452
    :pswitch_a
    const-string p0, "eyeSize"

    .line 453
    .line 454
    return-object p0

    .line 455
    :pswitch_b
    const-string p0, "eyeTilt"

    .line 456
    .line 457
    return-object p0

    .line 458
    :pswitch_c
    const-string p0, "chinLength"

    .line 459
    .line 460
    return-object p0

    .line 461
    :pswitch_d
    const-string p0, "thinFace"

    .line 462
    .line 463
    return-object p0

    .line 464
    :pswitch_e
    const-string p0, "smooth"

    .line 465
    .line 466
    return-object p0

    .line 467
    :pswitch_f
    const-string p0, "eye-brighten"

    .line 468
    .line 469
    return-object p0

    .line 470
    :pswitch_10
    const-string p0, "cheekboneWidth"

    .line 471
    .line 472
    return-object p0

    .line 473
    :pswitch_11
    const-string p0, "mouthSize"

    .line 474
    .line 475
    return-object p0

    .line 476
    :pswitch_12
    const-string p0, "noseWidth"

    .line 477
    .line 478
    return-object p0

    .line 479
    :pswitch_13
    const-string p0, "redden"

    .line 480
    .line 481
    return-object p0

    .line 482
    :pswitch_14
    const-string p0, "faceWidth"

    .line 483
    .line 484
    return-object p0

    .line 485
    :pswitch_15
    const-string p0, "sharpen"

    .line 486
    .line 487
    return-object p0

    .line 488
    :pswitch_16
    const-string p0, "eyeDistance"

    .line 489
    .line 490
    return-object p0

    .line 491
    :pswitch_17
    const-string p0, "legLength"

    .line 492
    .line 493
    return-object p0

    .line 494
    :pswitch_18
    const-string p0, "jawShape"

    .line 495
    .line 496
    return-object p0

    .line 497
    :pswitch_19
    const-string p0, "forehead"

    .line 498
    .line 499
    return-object p0

    .line 500
    :pswitch_1a
    const-string p0, "bodyWidth"

    .line 501
    .line 502
    return-object p0

    .line 503
    :pswitch_1b
    const-string p0, "noseTipSize"

    .line 504
    .line 505
    return-object p0

    .line 506
    :pswitch_1c
    const-string p0, "lipThickness"

    .line 507
    .line 508
    return-object p0

    .line 509
    :pswitch_1d
    const-string p0, "eyeHeight"

    .line 510
    .line 511
    return-object p0

    .line 512
    nop

    .line 513
    :sswitch_data_0
    .sparse-switch
        -0x7c26f444 -> :sswitch_1d
        -0x76f28933 -> :sswitch_1c
        -0x5a3fcf95 -> :sswitch_1b
        -0x584e5c2d -> :sswitch_1a
        -0x5753a04e -> :sswitch_19
        -0x497f58d7 -> :sswitch_18
        -0x3bc2f67e -> :sswitch_17
        -0x38b762d2 -> :sswitch_16
        -0x32dc5562 -> :sswitch_15
        -0x322ea6b5 -> :sswitch_14
        -0x25699445 -> :sswitch_13
        -0x2101e5eb -> :sswitch_12
        -0x1e993cf4 -> :sswitch_11
        -0x1624b44e -> :sswitch_10
        -0x12da2f40 -> :sswitch_f
        -0x12639223 -> :sswitch_e
        -0xc943c08 -> :sswitch_d
        -0xa7e6268 -> :sswitch_c
        0x14a3fc66 -> :sswitch_b
        0x16be439d -> :sswitch_a
        0x22648d20 -> :sswitch_9
        0x32b185fd -> :sswitch_8
        0x39fcb804 -> :sswitch_7
        0x3d7e8810 -> :sswitch_6
        0x56ffdaf4 -> :sswitch_5
        0x588055f0 -> :sswitch_4
        0x60a66dd2 -> :sswitch_3
        0x60f1793d -> :sswitch_2
        0x62b44f8c -> :sswitch_1
        0x7a9b27c0 -> :sswitch_0
    .end sparse-switch

    .line 514
    .line 515
    .line 516
    .line 517
    .line 518
    .line 519
    .line 520
    .line 521
    .line 522
    .line 523
    .line 524
    .line 525
    .line 526
    .line 527
    .line 528
    .line 529
    .line 530
    .line 531
    .line 532
    .line 533
    .line 534
    .line 535
    .line 536
    .line 537
    .line 538
    .line 539
    .line 540
    .line 541
    .line 542
    .line 543
    .line 544
    .line 545
    .line 546
    .line 547
    .line 548
    .line 549
    .line 550
    .line 551
    .line 552
    .line 553
    .line 554
    .line 555
    .line 556
    .line 557
    .line 558
    .line 559
    .line 560
    .line 561
    .line 562
    .line 563
    .line 564
    .line 565
    .line 566
    .line 567
    .line 568
    .line 569
    .line 570
    .line 571
    .line 572
    .line 573
    .line 574
    .line 575
    .line 576
    .line 577
    .line 578
    .line 579
    .line 580
    .line 581
    .line 582
    .line 583
    .line 584
    .line 585
    .line 586
    .line 587
    .line 588
    .line 589
    .line 590
    .line 591
    .line 592
    .line 593
    .line 594
    .line 595
    .line 596
    .line 597
    .line 598
    .line 599
    .line 600
    .line 601
    .line 602
    .line 603
    .line 604
    .line 605
    .line 606
    .line 607
    .line 608
    .line 609
    .line 610
    .line 611
    .line 612
    .line 613
    .line 614
    .line 615
    .line 616
    .line 617
    .line 618
    .line 619
    .line 620
    .line 621
    .line 622
    .line 623
    .line 624
    .line 625
    .line 626
    .line 627
    .line 628
    .line 629
    .line 630
    .line 631
    .line 632
    .line 633
    .line 634
    .line 635
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
