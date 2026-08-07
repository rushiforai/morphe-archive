.class Ll/urh0$a;
.super Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/urh0;->T1()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field private a:Ljava/lang/Integer;

.field private b:Ljava/lang/Integer;

.field private c:Ljava/lang/Integer;

.field private d:Ljava/lang/Integer;

.field final synthetic e:Ll/urh0;


# direct methods
.method public constructor <init>(Ll/urh0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/urh0$a;->e:Ll/urh0;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, -0x1

    .line 7
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Ll/urh0$a;->a:Ljava/lang/Integer;

    .line 12
    .line 13
    iput-object p1, p0, Ll/urh0$a;->b:Ljava/lang/Integer;

    .line 14
    .line 15
    iput-object p1, p0, Ll/urh0$a;->c:Ljava/lang/Integer;

    .line 16
    .line 17
    iput-object p1, p0, Ll/urh0$a;->d:Ljava/lang/Integer;

    .line 18
    .line 19
    return-void
.end method

.method private a(Landroid/hardware/camera2/CaptureResult;)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/urh0$a;->e:Ll/urh0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/urh0;->e1(Ll/urh0;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x4

    .line 8
    const/4 v2, 0x2

    .line 9
    const/4 v3, 0x0

    .line 10
    const/4 v4, 0x1

    .line 11
    if-eqz v0, :cond_7

    .line 12
    .line 13
    if-eq v0, v4, :cond_0

    .line 14
    .line 15
    goto/16 :goto_6

    .line 16
    .line 17
    :cond_0
    sget-object v0, Landroid/hardware/camera2/CaptureResult;->CONTROL_AE_PRECAPTURE_TRIGGER:Landroid/hardware/camera2/CaptureResult$Key;

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ljava/lang/Integer;

    .line 24
    .line 25
    sget-object v5, Landroid/hardware/camera2/CaptureResult;->CONTROL_AE_STATE:Landroid/hardware/camera2/CaptureResult$Key;

    .line 26
    .line 27
    invoke-virtual {p1, v5}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    check-cast p1, Ljava/lang/Integer;

    .line 32
    .line 33
    const-string v5, "TEImage2Mode"

    .line 34
    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-ne v0, v4, :cond_1

    .line 42
    .line 43
    iget-object v0, p0, Ll/urh0$a;->e:Ll/urh0;

    .line 44
    .line 45
    invoke-static {v0, v4}, Ll/urh0;->D1(Ll/urh0;Z)Z

    .line 46
    .line 47
    .line 48
    const-string v0, "ae trigger start..."

    .line 49
    .line 50
    invoke-static {v5, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    :cond_1
    iget-object v0, p0, Ll/urh0$a;->e:Ll/urh0;

    .line 54
    .line 55
    invoke-static {v0}, Ll/urh0;->C1(Ll/urh0;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-eqz v0, :cond_5

    .line 60
    .line 61
    if-eqz p1, :cond_3

    .line 62
    .line 63
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-eq v0, v2, :cond_3

    .line 68
    .line 69
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-ne v0, v1, :cond_2

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_2
    move v4, v3

    .line 77
    goto :goto_1

    .line 78
    :cond_3
    :goto_0
    iget-object v0, p0, Ll/urh0$a;->e:Ll/urh0;

    .line 79
    .line 80
    invoke-static {v0, v3}, Ll/urh0;->D1(Ll/urh0;Z)Z

    .line 81
    .line 82
    .line 83
    const-string v0, "ae converge, is shot can do"

    .line 84
    .line 85
    invoke-static {v5, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    :goto_1
    iget-object v0, p0, Ll/urh0$a;->d:Ljava/lang/Integer;

    .line 89
    .line 90
    invoke-virtual {v0, p1}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    if-nez v0, :cond_4

    .line 95
    .line 96
    new-instance v0, Ljava/lang/StringBuilder;

    .line 97
    .line 98
    const-string v1, "ae state:"

    .line 99
    .line 100
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-static {v5, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    :cond_4
    iput-object p1, p0, Ll/urh0$a;->d:Ljava/lang/Integer;

    .line 114
    .line 115
    goto :goto_2

    .line 116
    :cond_5
    move v4, v3

    .line 117
    :goto_2
    if-eqz v4, :cond_d

    .line 118
    .line 119
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 120
    .line 121
    .line 122
    move-result-wide v0

    .line 123
    iget-object p1, p0, Ll/urh0$a;->e:Ll/urh0;

    .line 124
    .line 125
    invoke-static {p1}, Ll/urh0;->D0(Ll/urh0;)J

    .line 126
    .line 127
    .line 128
    move-result-wide v6

    .line 129
    sub-long/2addr v0, v6

    .line 130
    iget-object p1, p0, Ll/urh0$a;->e:Ll/urh0;

    .line 131
    .line 132
    invoke-static {p1, v3}, Ll/urh0;->g1(Ll/urh0;I)I

    .line 133
    .line 134
    .line 135
    iget-object p1, p0, Ll/urh0$a;->e:Ll/urh0;

    .line 136
    .line 137
    invoke-static {p1, v3}, Ll/urh0;->D1(Ll/urh0;Z)Z

    .line 138
    .line 139
    .line 140
    iget-object p1, p0, Ll/urh0$a;->e:Ll/urh0;

    .line 141
    .line 142
    invoke-static {p1}, Ll/urh0;->S0(Ll/urh0;)Ll/urh0$i;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    if-eqz p1, :cond_6

    .line 147
    .line 148
    iget-object p1, p0, Ll/urh0$a;->e:Ll/urh0;

    .line 149
    .line 150
    invoke-static {p1}, Ll/urh0;->S0(Ll/urh0;)Ll/urh0$i;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    const/16 v2, 0x3ef

    .line 155
    .line 156
    invoke-virtual {p1, v2}, Landroid/os/Handler;->removeMessages(I)V

    .line 157
    .line 158
    .line 159
    iget-object p1, p0, Ll/urh0$a;->e:Ll/urh0;

    .line 160
    .line 161
    invoke-static {p1}, Ll/urh0;->S0(Ll/urh0;)Ll/urh0$i;

    .line 162
    .line 163
    .line 164
    move-result-object p1

    .line 165
    const/16 v2, 0x3ee

    .line 166
    .line 167
    invoke-virtual {p1, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 168
    .line 169
    .line 170
    iget-object p0, p0, Ll/urh0$a;->e:Ll/urh0;

    .line 171
    .line 172
    invoke-static {p0}, Ll/urh0;->S0(Ll/urh0;)Ll/urh0$i;

    .line 173
    .line 174
    .line 175
    move-result-object p0

    .line 176
    const/16 p1, 0x3ed

    .line 177
    .line 178
    invoke-virtual {p0, p1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 179
    .line 180
    .line 181
    :cond_6
    new-instance p0, Ljava/lang/StringBuilder;

    .line 182
    .line 183
    const-string p1, "send-capture-command consume = "

    .line 184
    .line 185
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 186
    .line 187
    .line 188
    invoke-virtual {p0, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 189
    .line 190
    .line 191
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 192
    .line 193
    .line 194
    move-result-object p0

    .line 195
    invoke-static {v5, p0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 196
    .line 197
    .line 198
    return-void

    .line 199
    :cond_7
    sget-object v0, Landroid/hardware/camera2/CaptureResult;->CONTROL_AF_STATE:Landroid/hardware/camera2/CaptureResult$Key;

    .line 200
    .line 201
    invoke-virtual {p1, v0}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    .line 202
    .line 203
    .line 204
    move-result-object p1

    .line 205
    check-cast p1, Ljava/lang/Integer;

    .line 206
    .line 207
    const/4 v0, -0x1

    .line 208
    if-eqz p1, :cond_8

    .line 209
    .line 210
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 211
    .line 212
    .line 213
    move-result p1

    .line 214
    goto :goto_3

    .line 215
    :cond_8
    move p1, v0

    .line 216
    :goto_3
    iget-object v5, p0, Ll/urh0$a;->e:Ll/urh0;

    .line 217
    .line 218
    if-eq p1, v0, :cond_a

    .line 219
    .line 220
    if-eq p1, v2, :cond_a

    .line 221
    .line 222
    if-ne p1, v1, :cond_9

    .line 223
    .line 224
    goto :goto_4

    .line 225
    :cond_9
    move v6, v3

    .line 226
    goto :goto_5

    .line 227
    :cond_a
    :goto_4
    move v6, v4

    .line 228
    :goto_5
    invoke-static {v5, v6}, Ll/urh0;->s1(Ll/urh0;Z)Z

    .line 229
    .line 230
    .line 231
    iget-object v5, p0, Ll/urh0$a;->e:Ll/urh0;

    .line 232
    .line 233
    invoke-static {v5}, Ll/urh0;->B1(Ll/urh0;)Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 234
    .line 235
    .line 236
    move-result-object v5

    .line 237
    if-eqz v5, :cond_d

    .line 238
    .line 239
    sget-object v6, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 240
    .line 241
    invoke-virtual {v5, v6}, Landroid/hardware/camera2/CaptureRequest$Builder;->get(Landroid/hardware/camera2/CaptureRequest$Key;)Ljava/lang/Object;

    .line 242
    .line 243
    .line 244
    move-result-object v7

    .line 245
    check-cast v7, Ljava/lang/Integer;

    .line 246
    .line 247
    if-eqz v7, :cond_d

    .line 248
    .line 249
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    .line 250
    .line 251
    .line 252
    move-result v7

    .line 253
    if-ne v7, v4, :cond_d

    .line 254
    .line 255
    if-eq v1, p1, :cond_b

    .line 256
    .line 257
    const/4 v1, 0x5

    .line 258
    if-eq v1, p1, :cond_b

    .line 259
    .line 260
    if-ne v0, p1, :cond_c

    .line 261
    .line 262
    :cond_b
    move v3, v4

    .line 263
    :cond_c
    if-eqz v3, :cond_d

    .line 264
    .line 265
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 266
    .line 267
    .line 268
    move-result-object p1

    .line 269
    invoke-virtual {v5, v6, p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 270
    .line 271
    .line 272
    iget-object p1, p0, Ll/urh0$a;->e:Ll/urh0;

    .line 273
    .line 274
    invoke-static {p1}, Ll/urh0;->S0(Ll/urh0;)Ll/urh0$i;

    .line 275
    .line 276
    .line 277
    move-result-object p1

    .line 278
    if-eqz p1, :cond_d

    .line 279
    .line 280
    iget-object p0, p0, Ll/urh0$a;->e:Ll/urh0;

    .line 281
    .line 282
    invoke-static {p0}, Ll/urh0;->S0(Ll/urh0;)Ll/urh0$i;

    .line 283
    .line 284
    .line 285
    move-result-object p0

    .line 286
    const/16 p1, 0x3ec

    .line 287
    .line 288
    invoke-virtual {p0, p1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 289
    .line 290
    .line 291
    :cond_d
    :goto_6
    return-void
.end method

.method private b(Landroid/hardware/camera2/CaptureResult;)V
    .locals 10

    .line 1
    sget-object v0, Landroid/hardware/camera2/CaptureResult;->CONTROL_AF_MODE:Landroid/hardware/camera2/CaptureResult$Key;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Integer;

    .line 8
    .line 9
    sget-object v1, Landroid/hardware/camera2/CaptureResult;->CONTROL_AF_STATE:Landroid/hardware/camera2/CaptureResult$Key;

    .line 10
    .line 11
    invoke-virtual {p1, v1}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Ljava/lang/Integer;

    .line 16
    .line 17
    sget-object v2, Landroid/hardware/camera2/CaptureResult;->CONTROL_AE_MODE:Landroid/hardware/camera2/CaptureResult$Key;

    .line 18
    .line 19
    invoke-virtual {p1, v2}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    check-cast v2, Ljava/lang/Integer;

    .line 24
    .line 25
    sget-object v3, Landroid/hardware/camera2/CaptureResult;->CONTROL_AE_STATE:Landroid/hardware/camera2/CaptureResult$Key;

    .line 26
    .line 27
    invoke-virtual {p1, v3}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    check-cast v3, Ljava/lang/Integer;

    .line 32
    .line 33
    const/4 v4, -0x1

    .line 34
    if-eqz v0, :cond_0

    .line 35
    .line 36
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    goto :goto_0

    .line 41
    :cond_0
    move v0, v4

    .line 42
    :goto_0
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    if-eqz v1, :cond_1

    .line 47
    .line 48
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    goto :goto_1

    .line 53
    :cond_1
    move v1, v4

    .line 54
    :goto_1
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 55
    .line 56
    .line 57
    move-result-object v5

    .line 58
    if-eqz v2, :cond_2

    .line 59
    .line 60
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    goto :goto_2

    .line 65
    :cond_2
    move v2, v4

    .line 66
    :goto_2
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    if-eqz v3, :cond_3

    .line 71
    .line 72
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 73
    .line 74
    .line 75
    move-result v3

    .line 76
    goto :goto_3

    .line 77
    :cond_3
    move v3, v4

    .line 78
    :goto_3
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 79
    .line 80
    .line 81
    move-result-object v6

    .line 82
    iget-object v7, p0, Ll/urh0$a;->a:Ljava/lang/Integer;

    .line 83
    .line 84
    invoke-virtual {v7, v0}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    move-result v7

    .line 88
    const-string v8, "TEImage2Mode"

    .line 89
    .line 90
    if-eqz v7, :cond_4

    .line 91
    .line 92
    iget-object v7, p0, Ll/urh0$a;->b:Ljava/lang/Integer;

    .line 93
    .line 94
    invoke-virtual {v7, v5}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    move-result v7

    .line 98
    if-eqz v7, :cond_4

    .line 99
    .line 100
    iget-object v7, p0, Ll/urh0$a;->c:Ljava/lang/Integer;

    .line 101
    .line 102
    invoke-virtual {v7, v2}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    move-result v7

    .line 106
    if-eqz v7, :cond_4

    .line 107
    .line 108
    iget-object v7, p0, Ll/urh0$a;->d:Ljava/lang/Integer;

    .line 109
    .line 110
    invoke-virtual {v7, v6}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    move-result v7

    .line 114
    if-nez v7, :cond_5

    .line 115
    .line 116
    :cond_4
    new-instance v7, Ljava/lang/StringBuilder;

    .line 117
    .line 118
    const-string v9, "[afMode="

    .line 119
    .line 120
    invoke-direct {v7, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    const-string v9, ", afState="

    .line 127
    .line 128
    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    const-string v9, ",aeMode="

    .line 135
    .line 136
    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    const-string v9, ", aeState="

    .line 143
    .line 144
    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    const-string v9, "]"

    .line 151
    .line 152
    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object v7

    .line 159
    invoke-static {v8, v7}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 160
    .line 161
    .line 162
    :cond_5
    iput-object v0, p0, Ll/urh0$a;->a:Ljava/lang/Integer;

    .line 163
    .line 164
    iput-object v5, p0, Ll/urh0$a;->b:Ljava/lang/Integer;

    .line 165
    .line 166
    iput-object v2, p0, Ll/urh0$a;->c:Ljava/lang/Integer;

    .line 167
    .line 168
    iput-object v6, p0, Ll/urh0$a;->d:Ljava/lang/Integer;

    .line 169
    .line 170
    invoke-virtual {p1}, Landroid/hardware/camera2/CaptureResult;->getRequest()Landroid/hardware/camera2/CaptureRequest;

    .line 171
    .line 172
    .line 173
    move-result-object p1

    .line 174
    invoke-virtual {p1}, Landroid/hardware/camera2/CaptureRequest;->getTag()Ljava/lang/Object;

    .line 175
    .line 176
    .line 177
    move-result-object p1

    .line 178
    const-string v0, "CAPTURE_REQUEST_TAG_FOR_SHOT"

    .line 179
    .line 180
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 181
    .line 182
    .line 183
    move-result p1

    .line 184
    if-eqz p1, :cond_6

    .line 185
    .line 186
    iget-object p1, p0, Ll/urh0$a;->e:Ll/urh0;

    .line 187
    .line 188
    const/4 v0, 0x1

    .line 189
    invoke-static {p1, v0}, Ll/urh0;->C0(Ll/urh0;Z)Z

    .line 190
    .line 191
    .line 192
    const-string p1, "is shot can do"

    .line 193
    .line 194
    invoke-static {v8, p1}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 195
    .line 196
    .line 197
    :cond_6
    iget-object p1, p0, Ll/urh0$a;->e:Ll/urh0;

    .line 198
    .line 199
    invoke-static {p1}, Ll/urh0;->B0(Ll/urh0;)Z

    .line 200
    .line 201
    .line 202
    move-result p1

    .line 203
    if-nez p1, :cond_7

    .line 204
    .line 205
    const-string p0, "discard previous callback"

    .line 206
    .line 207
    invoke-static {v8, p0}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 208
    .line 209
    .line 210
    return-void

    .line 211
    :cond_7
    const/4 p1, 0x2

    .line 212
    const/4 v0, 0x4

    .line 213
    if-eq v1, v4, :cond_9

    .line 214
    .line 215
    if-eq v1, v0, :cond_9

    .line 216
    .line 217
    const/4 v2, 0x5

    .line 218
    if-eq v1, v2, :cond_9

    .line 219
    .line 220
    if-ne v1, p1, :cond_8

    .line 221
    .line 222
    goto :goto_4

    .line 223
    :cond_8
    return-void

    .line 224
    :cond_9
    :goto_4
    if-eq v3, v4, :cond_b

    .line 225
    .line 226
    if-eq v3, v0, :cond_b

    .line 227
    .line 228
    if-ne v3, p1, :cond_a

    .line 229
    .line 230
    goto :goto_5

    .line 231
    :cond_a
    return-void

    .line 232
    :cond_b
    :goto_5
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 233
    .line 234
    .line 235
    move-result-wide v0

    .line 236
    iget-object p1, p0, Ll/urh0$a;->e:Ll/urh0;

    .line 237
    .line 238
    invoke-static {p1}, Ll/urh0;->D0(Ll/urh0;)J

    .line 239
    .line 240
    .line 241
    move-result-wide v2

    .line 242
    sub-long/2addr v0, v2

    .line 243
    iget-object p1, p0, Ll/urh0$a;->e:Ll/urh0;

    .line 244
    .line 245
    invoke-static {p1}, Ll/urh0;->S0(Ll/urh0;)Ll/urh0$i;

    .line 246
    .line 247
    .line 248
    move-result-object p1

    .line 249
    const/16 v2, 0x3e9

    .line 250
    .line 251
    invoke-virtual {p1, v2}, Landroid/os/Handler;->removeMessages(I)V

    .line 252
    .line 253
    .line 254
    iget-object p1, p0, Ll/urh0$a;->e:Ll/urh0;

    .line 255
    .line 256
    invoke-static {p1}, Ll/urh0;->S0(Ll/urh0;)Ll/urh0$i;

    .line 257
    .line 258
    .line 259
    move-result-object p1

    .line 260
    const/16 v2, 0x3e8

    .line 261
    .line 262
    invoke-virtual {p1, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 263
    .line 264
    .line 265
    iget-object p0, p0, Ll/urh0$a;->e:Ll/urh0;

    .line 266
    .line 267
    const/4 p1, 0x0

    .line 268
    invoke-static {p0, p1}, Ll/urh0;->C0(Ll/urh0;Z)Z

    .line 269
    .line 270
    .line 271
    new-instance p0, Ljava/lang/StringBuilder;

    .line 272
    .line 273
    const-string p1, "send-capture-command consume = "

    .line 274
    .line 275
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 276
    .line 277
    .line 278
    invoke-virtual {p0, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 279
    .line 280
    .line 281
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 282
    .line 283
    .line 284
    move-result-object p0

    .line 285
    invoke-static {v8, p0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 286
    .line 287
    .line 288
    const-string p0, "te_record_send_capture_command_cost"

    .line 289
    .line 290
    invoke-static {p0, v0, v1}, Ll/hrh0;->b(Ljava/lang/String;J)V

    .line 291
    .line 292
    .line 293
    return-void
.end method


# virtual methods
.method public onCaptureBufferLost(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/view/Surface;J)V
    .locals 0
    .param p1    # Landroid/hardware/camera2/CameraCaptureSession;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/hardware/camera2/CaptureRequest;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroid/view/Surface;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p1, p0, Ll/urh0$a;->e:Ll/urh0;

    .line 2
    .line 3
    invoke-static {p1}, Ll/urh0;->e1(Ll/urh0;)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/4 p3, 0x2

    .line 8
    if-ne p1, p3, :cond_0

    .line 9
    .line 10
    const-string p1, "CAPTURE_REQUEST_TAG_FOR_SHOT"

    .line 11
    .line 12
    invoke-virtual {p2}, Landroid/hardware/camera2/CaptureRequest;->getTag()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    iget-object p0, p0, Ll/urh0$a;->e:Ll/urh0;

    .line 23
    .line 24
    const/4 p1, 0x1

    .line 25
    invoke-static {p0, p1}, Ll/urh0;->C0(Ll/urh0;Z)Z

    .line 26
    .line 27
    .line 28
    const-string p0, "TEImage2Mode"

    .line 29
    .line 30
    const-string p1, "onCaptureBufferLost: "

    .line 31
    .line 32
    invoke-static {p0, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public onCaptureCompleted(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/TotalCaptureResult;)V
    .locals 6
    .param p1    # Landroid/hardware/camera2/CameraCaptureSession;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/hardware/camera2/CaptureRequest;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroid/hardware/camera2/TotalCaptureResult;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide p1

    .line 5
    iget-object v0, p0, Ll/urh0$a;->e:Ll/urh0;

    .line 6
    .line 7
    invoke-static {v0}, Ll/urh0;->E1(Ll/urh0;)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    sub-long v0, p1, v0

    .line 12
    .line 13
    const-wide/16 v2, 0x3e8

    .line 14
    .line 15
    cmp-long v0, v0, v2

    .line 16
    .line 17
    iget-object v1, p0, Ll/urh0$a;->e:Ll/urh0;

    .line 18
    .line 19
    const-string v2, "TEImage2Mode"

    .line 20
    .line 21
    const/4 v3, 0x0

    .line 22
    if-lez v0, :cond_0

    .line 23
    .line 24
    new-instance v0, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    const-string v4, "on frame arrived fps: "

    .line 27
    .line 28
    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v1}, Ll/urh0;->G1(Ll/urh0;)I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-static {v2, v0}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Ll/urh0$a;->e:Ll/urh0;

    .line 46
    .line 47
    invoke-static {v0, v3}, Ll/urh0;->H1(Ll/urh0;I)I

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Ll/urh0$a;->e:Ll/urh0;

    .line 51
    .line 52
    invoke-static {v0, p1, p2}, Ll/urh0;->F1(Ll/urh0;J)J

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_0
    invoke-static {v1}, Ll/urh0;->I1(Ll/urh0;)I

    .line 57
    .line 58
    .line 59
    :goto_0
    invoke-direct {p0, p3}, Ll/urh0$a;->a(Landroid/hardware/camera2/CaptureResult;)V

    .line 60
    .line 61
    .line 62
    iget-object p1, p0, Ll/urh0$a;->e:Ll/urh0;

    .line 63
    .line 64
    invoke-static {p1}, Ll/urh0;->J1(Ll/urh0;)Z

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    if-nez p1, :cond_1

    .line 69
    .line 70
    iget-object p1, p0, Ll/urh0$a;->e:Ll/urh0;

    .line 71
    .line 72
    invoke-static {p1}, Ll/urh0;->E0(Ll/urh0;)V

    .line 73
    .line 74
    .line 75
    iget-object p1, p0, Ll/urh0$a;->e:Ll/urh0;

    .line 76
    .line 77
    const/4 p2, 0x1

    .line 78
    invoke-static {p1, p2}, Ll/urh0;->F0(Ll/urh0;Z)Z

    .line 79
    .line 80
    .line 81
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 82
    .line 83
    .line 84
    move-result-wide p1

    .line 85
    iget-object v0, p0, Ll/urh0$a;->e:Ll/urh0;

    .line 86
    .line 87
    invoke-static {v0}, Ll/urh0;->G0(Ll/urh0;)J

    .line 88
    .line 89
    .line 90
    move-result-wide v0

    .line 91
    sub-long/2addr p1, v0

    .line 92
    new-instance v0, Ljava/lang/StringBuilder;

    .line 93
    .line 94
    const-string v1, "first preview frame callback arrived! consume = "

    .line 95
    .line 96
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    const-string v1, ", session consume: "

    .line 103
    .line 104
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    iget-object v1, p0, Ll/urh0$a;->e:Ll/urh0;

    .line 108
    .line 109
    invoke-static {v1}, Ll/urh0;->H0(Ll/urh0;)J

    .line 110
    .line 111
    .line 112
    move-result-wide v4

    .line 113
    invoke-virtual {v0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    invoke-static {v2, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    const-string v0, "te_record_camera2_set_repeating_request_cost"

    .line 124
    .line 125
    invoke-static {v0, p1, p2}, Ll/hrh0;->b(Ljava/lang/String;J)V

    .line 126
    .line 127
    .line 128
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    invoke-static {v0, p1}, Lcom/ss/android/ttvecamera/g;->f(Ljava/lang/String;Ljava/lang/Object;)V

    .line 133
    .line 134
    .line 135
    :cond_1
    iget-object p1, p0, Ll/urh0$a;->e:Ll/urh0;

    .line 136
    .line 137
    invoke-static {p1}, Ll/urh0;->e1(Ll/urh0;)I

    .line 138
    .line 139
    .line 140
    move-result p1

    .line 141
    const/4 p2, 0x2

    .line 142
    if-ne p1, p2, :cond_2

    .line 143
    .line 144
    invoke-direct {p0, p3}, Ll/urh0$a;->b(Landroid/hardware/camera2/CaptureResult;)V

    .line 145
    .line 146
    .line 147
    :cond_2
    iget-object p1, p0, Ll/urh0$a;->e:Ll/urh0;

    .line 148
    .line 149
    invoke-static {p1}, Ll/urh0;->K0(Ll/urh0;)I

    .line 150
    .line 151
    .line 152
    iget-object p1, p0, Ll/urh0$a;->e:Ll/urh0;

    .line 153
    .line 154
    invoke-static {p1}, Ll/urh0;->L0(Ll/urh0;)I

    .line 155
    .line 156
    .line 157
    move-result p1

    .line 158
    if-eqz p1, :cond_3

    .line 159
    .line 160
    iget-object p1, p0, Ll/urh0$a;->e:Ll/urh0;

    .line 161
    .line 162
    invoke-static {p1}, Ll/urh0;->I0(Ll/urh0;)I

    .line 163
    .line 164
    .line 165
    move-result p1

    .line 166
    iget-object p2, p0, Ll/urh0$a;->e:Ll/urh0;

    .line 167
    .line 168
    invoke-static {p2}, Ll/urh0;->L0(Ll/urh0;)I

    .line 169
    .line 170
    .line 171
    move-result p2

    .line 172
    if-le p1, p2, :cond_3

    .line 173
    .line 174
    iget-object p1, p0, Ll/urh0$a;->e:Ll/urh0;

    .line 175
    .line 176
    invoke-static {p1, v3}, Ll/urh0;->J0(Ll/urh0;I)I

    .line 177
    .line 178
    .line 179
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    .line 180
    .line 181
    .line 182
    move-result-object p1

    .line 183
    invoke-virtual {p1}, Ljava/lang/Runtime;->gc()V

    .line 184
    .line 185
    .line 186
    :cond_3
    iget-object p1, p0, Ll/urh0$a;->e:Ll/urh0;

    .line 187
    .line 188
    invoke-static {p1}, Ll/urh0;->O0(Ll/urh0;)I

    .line 189
    .line 190
    .line 191
    iget-object p1, p0, Ll/urh0$a;->e:Ll/urh0;

    .line 192
    .line 193
    invoke-static {p1}, Ll/urh0;->M0(Ll/urh0;)I

    .line 194
    .line 195
    .line 196
    move-result p1

    .line 197
    rem-int/lit8 p1, p1, 0x5

    .line 198
    .line 199
    if-nez p1, :cond_4

    .line 200
    .line 201
    iget-object p1, p0, Ll/urh0$a;->e:Ll/urh0;

    .line 202
    .line 203
    invoke-static {p1, v3}, Ll/urh0;->N0(Ll/urh0;I)I

    .line 204
    .line 205
    .line 206
    :cond_4
    iget-object p1, p0, Ll/urh0$a;->e:Ll/urh0;

    .line 207
    .line 208
    invoke-static {p1}, Ll/urh0;->P0(Ll/urh0;)[Landroid/hardware/camera2/TotalCaptureResult;

    .line 209
    .line 210
    .line 211
    move-result-object p1

    .line 212
    if-eqz p1, :cond_5

    .line 213
    .line 214
    iget-object p1, p0, Ll/urh0$a;->e:Ll/urh0;

    .line 215
    .line 216
    invoke-static {p1}, Ll/urh0;->P0(Ll/urh0;)[Landroid/hardware/camera2/TotalCaptureResult;

    .line 217
    .line 218
    .line 219
    move-result-object p1

    .line 220
    iget-object p0, p0, Ll/urh0$a;->e:Ll/urh0;

    .line 221
    .line 222
    invoke-static {p0}, Ll/urh0;->M0(Ll/urh0;)I

    .line 223
    .line 224
    .line 225
    move-result p0

    .line 226
    aput-object p3, p1, p0

    .line 227
    .line 228
    :cond_5
    return-void
.end method

.method public onCaptureFailed(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CaptureFailure;)V
    .locals 0
    .param p1    # Landroid/hardware/camera2/CameraCaptureSession;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/hardware/camera2/CaptureRequest;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroid/hardware/camera2/CaptureFailure;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p1, p0, Ll/urh0$a;->e:Ll/urh0;

    .line 2
    .line 3
    invoke-static {p1}, Ll/urh0;->e1(Ll/urh0;)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/4 p3, 0x2

    .line 8
    if-ne p1, p3, :cond_0

    .line 9
    .line 10
    const-string p1, "CAPTURE_REQUEST_TAG_FOR_SHOT"

    .line 11
    .line 12
    invoke-virtual {p2}, Landroid/hardware/camera2/CaptureRequest;->getTag()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    iget-object p0, p0, Ll/urh0$a;->e:Ll/urh0;

    .line 23
    .line 24
    const/4 p1, 0x1

    .line 25
    invoke-static {p0, p1}, Ll/urh0;->C0(Ll/urh0;Z)Z

    .line 26
    .line 27
    .line 28
    const-string p0, "TEImage2Mode"

    .line 29
    .line 30
    const-string p1, "onCaptureFailed: "

    .line 31
    .line 32
    invoke-static {p0, p1}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public onCaptureProgressed(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CaptureResult;)V
    .locals 0
    .param p1    # Landroid/hardware/camera2/CameraCaptureSession;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/hardware/camera2/CaptureRequest;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroid/hardware/camera2/CaptureResult;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p3}, Ll/urh0$a;->a(Landroid/hardware/camera2/CaptureResult;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
