.class Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$BluetoothConnectCallback;
.super Landroid/media/AudioDeviceCallback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "BluetoothConnectCallback"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;


# direct methods
.method private constructor <init>(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$BluetoothConnectCallback;->this$0:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/media/AudioDeviceCallback;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$1;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$BluetoothConnectCallback;-><init>(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;)V

    return-void
.end method


# virtual methods
.method public onAudioDevicesAdded([Landroid/media/AudioDeviceInfo;)V
    .locals 11

    .line 1
    array-length v0, p1

    .line 2
    const/4 v1, 0x0

    .line 3
    move v2, v1

    .line 4
    :goto_0
    if-ge v2, v0, :cond_5

    .line 5
    .line 6
    aget-object v3, p1, v2

    .line 7
    .line 8
    invoke-virtual {v3}, Landroid/media/AudioDeviceInfo;->isSource()Z

    .line 9
    .line 10
    .line 11
    move-result v4

    .line 12
    if-eqz v4, :cond_0

    .line 13
    .line 14
    goto/16 :goto_5

    .line 15
    .line 16
    :cond_0
    invoke-virtual {v3}, Landroid/media/AudioDeviceInfo;->getType()I

    .line 17
    .line 18
    .line 19
    move-result v4

    .line 20
    const/4 v5, 0x7

    .line 21
    const/16 v6, 0x8

    .line 22
    .line 23
    const/4 v7, 0x1

    .line 24
    if-ne v4, v5, :cond_2

    .line 25
    .line 26
    iget-object v5, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$BluetoothConnectCallback;->this$0:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;

    .line 27
    .line 28
    invoke-static {v5}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->access$200(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;)Lcom/ss/bytertc/audio/device/router/IAudioRouteCallback;

    .line 29
    .line 30
    .line 31
    move-result-object v5

    .line 32
    if-eqz v5, :cond_2

    .line 33
    .line 34
    invoke-virtual {v3}, Landroid/media/AudioDeviceInfo;->getProductName()Ljava/lang/CharSequence;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    const-string v5, "AudioRouteDeviceManager"

    .line 43
    .line 44
    new-instance v8, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    const-string v9, "AudioRouteDeviceManager: addedDevices: "

    .line 47
    .line 48
    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const-string v4, ", name: "

    .line 55
    .line 56
    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v4

    .line 66
    invoke-static {v5, v4}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    iget-object v4, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$BluetoothConnectCallback;->this$0:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;

    .line 70
    .line 71
    invoke-static {v4}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->access$300(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v5

    .line 75
    monitor-enter v5

    .line 76
    :try_start_0
    iget-object v4, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$BluetoothConnectCallback;->this$0:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;

    .line 77
    .line 78
    invoke-static {v4}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->access$400(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;)Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 79
    .line 80
    .line 81
    move-result-object v4

    .line 82
    if-nez v4, :cond_1

    .line 83
    .line 84
    iget-object v4, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$BluetoothConnectCallback;->this$0:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;

    .line 85
    .line 86
    new-instance v8, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 87
    .line 88
    const-string v9, "bluetooth-headset"

    .line 89
    .line 90
    invoke-direct {v8, v4, v9}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;-><init>(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    invoke-static {v4, v8}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->access$402(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;)Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 94
    .line 95
    .line 96
    goto :goto_1

    .line 97
    :catchall_0
    move-exception p0

    .line 98
    goto :goto_2

    .line 99
    :cond_1
    :goto_1
    iget-object v4, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$BluetoothConnectCallback;->this$0:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;

    .line 100
    .line 101
    invoke-static {v4}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->access$400(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;)Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 102
    .line 103
    .line 104
    move-result-object v4

    .line 105
    const-string v8, "callback"

    .line 106
    .line 107
    new-instance v9, Ljava/lang/StringBuilder;

    .line 108
    .line 109
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 110
    .line 111
    .line 112
    const-string v10, "[device:"

    .line 113
    .line 114
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    const-string v3, "] "

    .line 121
    .line 122
    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v3

    .line 129
    invoke-virtual {v4, v8, v3}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;->appendDeviceInfo(Ljava/lang/String;Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    iget-object v3, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$BluetoothConnectCallback;->this$0:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;

    .line 133
    .line 134
    invoke-static {v3}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->access$400(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;)Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 135
    .line 136
    .line 137
    move-result-object v3

    .line 138
    invoke-virtual {v3, v7, v7}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;->setBluetoothConnected(IZ)V

    .line 139
    .line 140
    .line 141
    iget-object v3, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$BluetoothConnectCallback;->this$0:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;

    .line 142
    .line 143
    invoke-static {v3}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->access$400(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;)Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 144
    .line 145
    .line 146
    move-result-object v3

    .line 147
    invoke-virtual {v3}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;->getAttrsString()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v3

    .line 151
    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 152
    iget-object v4, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$BluetoothConnectCallback;->this$0:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;

    .line 153
    .line 154
    invoke-static {v4, v1}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->access$502(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;I)I

    .line 155
    .line 156
    .line 157
    iget-object v4, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$BluetoothConnectCallback;->this$0:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;

    .line 158
    .line 159
    invoke-static {v4}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->access$200(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;)Lcom/ss/bytertc/audio/device/router/IAudioRouteCallback;

    .line 160
    .line 161
    .line 162
    move-result-object v4

    .line 163
    invoke-interface {v4, v6, v7, v3}, Lcom/ss/bytertc/audio/device/router/IAudioRouteCallback;->onDeviceEvent(IZLjava/lang/String;)V

    .line 164
    .line 165
    .line 166
    goto/16 :goto_5

    .line 167
    .line 168
    :goto_2
    :try_start_1
    monitor-exit v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 169
    throw p0

    .line 170
    :cond_2
    if-ne v4, v6, :cond_4

    .line 171
    .line 172
    iget-object v5, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$BluetoothConnectCallback;->this$0:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;

    .line 173
    .line 174
    invoke-static {v5}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->access$200(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;)Lcom/ss/bytertc/audio/device/router/IAudioRouteCallback;

    .line 175
    .line 176
    .line 177
    move-result-object v5

    .line 178
    if-eqz v5, :cond_4

    .line 179
    .line 180
    invoke-virtual {v3}, Landroid/media/AudioDeviceInfo;->getProductName()Ljava/lang/CharSequence;

    .line 181
    .line 182
    .line 183
    move-result-object v3

    .line 184
    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object v3

    .line 188
    const-string v5, "AudioRouteDeviceManager"

    .line 189
    .line 190
    new-instance v6, Ljava/lang/StringBuilder;

    .line 191
    .line 192
    const-string v8, "AudioRouteDeviceManager: addedDevices: "

    .line 193
    .line 194
    invoke-direct {v6, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 195
    .line 196
    .line 197
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 198
    .line 199
    .line 200
    const-string v4, ", name: "

    .line 201
    .line 202
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 203
    .line 204
    .line 205
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 206
    .line 207
    .line 208
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v4

    .line 212
    invoke-static {v5, v4}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 213
    .line 214
    .line 215
    iget-object v4, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$BluetoothConnectCallback;->this$0:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;

    .line 216
    .line 217
    invoke-static {v4}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->access$300(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;)Ljava/lang/Object;

    .line 218
    .line 219
    .line 220
    move-result-object v4

    .line 221
    monitor-enter v4

    .line 222
    :try_start_2
    iget-object v5, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$BluetoothConnectCallback;->this$0:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;

    .line 223
    .line 224
    invoke-static {v5}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->access$400(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;)Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 225
    .line 226
    .line 227
    move-result-object v5

    .line 228
    if-nez v5, :cond_3

    .line 229
    .line 230
    iget-object v5, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$BluetoothConnectCallback;->this$0:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;

    .line 231
    .line 232
    new-instance v6, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 233
    .line 234
    const-string v8, "bluetooth-headset"

    .line 235
    .line 236
    invoke-direct {v6, v5, v8}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;-><init>(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;Ljava/lang/String;)V

    .line 237
    .line 238
    .line 239
    invoke-static {v5, v6}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->access$402(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;)Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 240
    .line 241
    .line 242
    goto :goto_3

    .line 243
    :catchall_1
    move-exception p0

    .line 244
    goto :goto_4

    .line 245
    :cond_3
    :goto_3
    iget-object v5, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$BluetoothConnectCallback;->this$0:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;

    .line 246
    .line 247
    invoke-static {v5}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->access$400(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;)Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 248
    .line 249
    .line 250
    move-result-object v5

    .line 251
    const-string v6, "callback"

    .line 252
    .line 253
    new-instance v8, Ljava/lang/StringBuilder;

    .line 254
    .line 255
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 256
    .line 257
    .line 258
    const-string v9, "[device:"

    .line 259
    .line 260
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 261
    .line 262
    .line 263
    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 264
    .line 265
    .line 266
    const-string v3, "] "

    .line 267
    .line 268
    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 269
    .line 270
    .line 271
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 272
    .line 273
    .line 274
    move-result-object v3

    .line 275
    invoke-virtual {v5, v6, v3}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;->appendDeviceInfo(Ljava/lang/String;Ljava/lang/String;)V

    .line 276
    .line 277
    .line 278
    iget-object v3, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$BluetoothConnectCallback;->this$0:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;

    .line 279
    .line 280
    invoke-static {v3}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->access$400(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;)Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 281
    .line 282
    .line 283
    move-result-object v3

    .line 284
    const/4 v5, 0x2

    .line 285
    invoke-virtual {v3, v5, v7}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;->setBluetoothConnected(IZ)V

    .line 286
    .line 287
    .line 288
    iget-object v3, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$BluetoothConnectCallback;->this$0:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;

    .line 289
    .line 290
    invoke-static {v3}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->access$400(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;)Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 291
    .line 292
    .line 293
    move-result-object v3

    .line 294
    invoke-virtual {v3}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;->getAttrsString()Ljava/lang/String;

    .line 295
    .line 296
    .line 297
    move-result-object v3

    .line 298
    monitor-exit v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 299
    iget-object v4, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$BluetoothConnectCallback;->this$0:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;

    .line 300
    .line 301
    invoke-static {v4}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->access$200(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;)Lcom/ss/bytertc/audio/device/router/IAudioRouteCallback;

    .line 302
    .line 303
    .line 304
    move-result-object v4

    .line 305
    const/16 v5, 0x10

    .line 306
    .line 307
    invoke-interface {v4, v5, v7, v3}, Lcom/ss/bytertc/audio/device/router/IAudioRouteCallback;->onDeviceEvent(IZLjava/lang/String;)V

    .line 308
    .line 309
    .line 310
    goto :goto_5

    .line 311
    :goto_4
    :try_start_3
    monitor-exit v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 312
    throw p0

    .line 313
    :cond_4
    :goto_5
    add-int/lit8 v2, v2, 0x1

    .line 314
    .line 315
    goto/16 :goto_0

    .line 316
    .line 317
    :cond_5
    return-void
.end method

.method public onAudioDevicesRemoved([Landroid/media/AudioDeviceInfo;)V
    .locals 10

    .line 1
    array-length v0, p1

    .line 2
    const/4 v1, 0x0

    .line 3
    move v2, v1

    .line 4
    :goto_0
    if-ge v2, v0, :cond_5

    .line 5
    .line 6
    aget-object v3, p1, v2

    .line 7
    .line 8
    invoke-virtual {v3}, Landroid/media/AudioDeviceInfo;->isSource()Z

    .line 9
    .line 10
    .line 11
    move-result v4

    .line 12
    if-eqz v4, :cond_0

    .line 13
    .line 14
    goto/16 :goto_5

    .line 15
    .line 16
    :cond_0
    invoke-virtual {v3}, Landroid/media/AudioDeviceInfo;->getType()I

    .line 17
    .line 18
    .line 19
    move-result v4

    .line 20
    const/4 v5, 0x7

    .line 21
    const/16 v6, 0x8

    .line 22
    .line 23
    const/4 v7, 0x0

    .line 24
    const/4 v8, 0x2

    .line 25
    const/4 v9, 0x1

    .line 26
    if-ne v4, v5, :cond_2

    .line 27
    .line 28
    iget-object v5, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$BluetoothConnectCallback;->this$0:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;

    .line 29
    .line 30
    invoke-static {v5}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->access$200(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;)Lcom/ss/bytertc/audio/device/router/IAudioRouteCallback;

    .line 31
    .line 32
    .line 33
    move-result-object v5

    .line 34
    if-eqz v5, :cond_2

    .line 35
    .line 36
    const-string p1, "AudioRouteDeviceManager"

    .line 37
    .line 38
    new-instance v0, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    const-string v2, "AudioRouteDeviceManager: removedDevices: "

    .line 41
    .line 42
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    const-string v2, ", name: "

    .line 49
    .line 50
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v3}, Landroid/media/AudioDeviceInfo;->getProductName()Ljava/lang/CharSequence;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-static {p1, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    const-string p1, ""

    .line 68
    .line 69
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$BluetoothConnectCallback;->this$0:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;

    .line 70
    .line 71
    invoke-static {v0}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->access$300(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v5

    .line 75
    monitor-enter v5

    .line 76
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$BluetoothConnectCallback;->this$0:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;

    .line 77
    .line 78
    invoke-static {v0}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->access$400(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;)Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    if-eqz v0, :cond_1

    .line 83
    .line 84
    iget-object p1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$BluetoothConnectCallback;->this$0:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;

    .line 85
    .line 86
    invoke-static {p1}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->access$400(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;)Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    invoke-virtual {p1, v9, v1}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;->setBluetoothConnected(IZ)V

    .line 91
    .line 92
    .line 93
    iget-object p1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$BluetoothConnectCallback;->this$0:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;

    .line 94
    .line 95
    invoke-static {p1}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->access$400(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;)Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    invoke-virtual {p1}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;->getAttrsString()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$BluetoothConnectCallback;->this$0:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;

    .line 104
    .line 105
    invoke-static {v0}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->access$400(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;)Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-virtual {v0, v9}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;->getBluetoothConnected(I)Z

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    if-nez v0, :cond_1

    .line 114
    .line 115
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$BluetoothConnectCallback;->this$0:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;

    .line 116
    .line 117
    invoke-static {v0}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->access$400(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;)Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    invoke-virtual {v0, v8}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;->getBluetoothConnected(I)Z

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    if-nez v0, :cond_1

    .line 126
    .line 127
    const-string v0, "AudioRouteDeviceManager"

    .line 128
    .line 129
    const-string v2, "AudioRouteDeviceManager: destroy mBluetoothDevice due to headset & a2dp disconncected"

    .line 130
    .line 131
    invoke-static {v0, v2}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$BluetoothConnectCallback;->this$0:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;

    .line 135
    .line 136
    invoke-static {v0, v7}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->access$402(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;)Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 137
    .line 138
    .line 139
    goto :goto_1

    .line 140
    :catchall_0
    move-exception p0

    .line 141
    goto :goto_2

    .line 142
    :cond_1
    :goto_1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$BluetoothConnectCallback;->this$0:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;

    .line 143
    .line 144
    invoke-static {v0, v7}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->access$402(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;)Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 145
    .line 146
    .line 147
    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 148
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$BluetoothConnectCallback;->this$0:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;

    .line 149
    .line 150
    invoke-static {p0}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->access$200(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;)Lcom/ss/bytertc/audio/device/router/IAudioRouteCallback;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    invoke-interface {p0, v6, v1, p1}, Lcom/ss/bytertc/audio/device/router/IAudioRouteCallback;->onDeviceEvent(IZLjava/lang/String;)V

    .line 155
    .line 156
    .line 157
    return-void

    .line 158
    :goto_2
    :try_start_1
    monitor-exit v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 159
    throw p0

    .line 160
    :cond_2
    if-ne v4, v6, :cond_4

    .line 161
    .line 162
    iget-object v5, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$BluetoothConnectCallback;->this$0:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;

    .line 163
    .line 164
    invoke-static {v5}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->access$200(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;)Lcom/ss/bytertc/audio/device/router/IAudioRouteCallback;

    .line 165
    .line 166
    .line 167
    move-result-object v5

    .line 168
    if-eqz v5, :cond_4

    .line 169
    .line 170
    const-string p1, "AudioRouteDeviceManager"

    .line 171
    .line 172
    new-instance v0, Ljava/lang/StringBuilder;

    .line 173
    .line 174
    const-string v2, "AudioRouteDeviceManager: removedDevices: "

    .line 175
    .line 176
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 177
    .line 178
    .line 179
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 180
    .line 181
    .line 182
    const-string v2, ", name: "

    .line 183
    .line 184
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 185
    .line 186
    .line 187
    invoke-virtual {v3}, Landroid/media/AudioDeviceInfo;->getProductName()Ljava/lang/CharSequence;

    .line 188
    .line 189
    .line 190
    move-result-object v2

    .line 191
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 192
    .line 193
    .line 194
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    invoke-static {p1, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 199
    .line 200
    .line 201
    const-string p1, ""

    .line 202
    .line 203
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$BluetoothConnectCallback;->this$0:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;

    .line 204
    .line 205
    invoke-static {v0}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->access$300(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;)Ljava/lang/Object;

    .line 206
    .line 207
    .line 208
    move-result-object v3

    .line 209
    monitor-enter v3

    .line 210
    :try_start_2
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$BluetoothConnectCallback;->this$0:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;

    .line 211
    .line 212
    invoke-static {v0}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->access$400(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;)Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 213
    .line 214
    .line 215
    move-result-object v0

    .line 216
    if-eqz v0, :cond_3

    .line 217
    .line 218
    iget-object p1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$BluetoothConnectCallback;->this$0:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;

    .line 219
    .line 220
    invoke-static {p1}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->access$400(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;)Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 221
    .line 222
    .line 223
    move-result-object p1

    .line 224
    invoke-virtual {p1, v8, v1}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;->setBluetoothConnected(IZ)V

    .line 225
    .line 226
    .line 227
    iget-object p1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$BluetoothConnectCallback;->this$0:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;

    .line 228
    .line 229
    invoke-static {p1}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->access$400(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;)Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 230
    .line 231
    .line 232
    move-result-object p1

    .line 233
    invoke-virtual {p1}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;->getAttrsString()Ljava/lang/String;

    .line 234
    .line 235
    .line 236
    move-result-object p1

    .line 237
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$BluetoothConnectCallback;->this$0:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;

    .line 238
    .line 239
    invoke-static {v0}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->access$400(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;)Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 240
    .line 241
    .line 242
    move-result-object v0

    .line 243
    invoke-virtual {v0, v9}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;->getBluetoothConnected(I)Z

    .line 244
    .line 245
    .line 246
    move-result v0

    .line 247
    if-nez v0, :cond_3

    .line 248
    .line 249
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$BluetoothConnectCallback;->this$0:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;

    .line 250
    .line 251
    invoke-static {v0}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->access$400(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;)Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 252
    .line 253
    .line 254
    move-result-object v0

    .line 255
    invoke-virtual {v0, v8}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;->getBluetoothConnected(I)Z

    .line 256
    .line 257
    .line 258
    move-result v0

    .line 259
    if-nez v0, :cond_3

    .line 260
    .line 261
    const-string v0, "AudioRouteDeviceManager"

    .line 262
    .line 263
    const-string v2, "AudioRouteDeviceManager: destroy mBluetoothDevice due to headset & a2dp disconncected"

    .line 264
    .line 265
    invoke-static {v0, v2}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 266
    .line 267
    .line 268
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$BluetoothConnectCallback;->this$0:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;

    .line 269
    .line 270
    invoke-static {v0, v7}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->access$402(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;)Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 271
    .line 272
    .line 273
    goto :goto_3

    .line 274
    :catchall_1
    move-exception p0

    .line 275
    goto :goto_4

    .line 276
    :cond_3
    :goto_3
    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 277
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$BluetoothConnectCallback;->this$0:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;

    .line 278
    .line 279
    invoke-static {p0}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->access$200(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;)Lcom/ss/bytertc/audio/device/router/IAudioRouteCallback;

    .line 280
    .line 281
    .line 282
    move-result-object p0

    .line 283
    const/16 v0, 0x10

    .line 284
    .line 285
    invoke-interface {p0, v0, v1, p1}, Lcom/ss/bytertc/audio/device/router/IAudioRouteCallback;->onDeviceEvent(IZLjava/lang/String;)V

    .line 286
    .line 287
    .line 288
    return-void

    .line 289
    :goto_4
    :try_start_3
    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 290
    throw p0

    .line 291
    :cond_4
    :goto_5
    add-int/lit8 v2, v2, 0x1

    .line 292
    .line 293
    goto/16 :goto_0

    .line 294
    .line 295
    :cond_5
    return-void
.end method
