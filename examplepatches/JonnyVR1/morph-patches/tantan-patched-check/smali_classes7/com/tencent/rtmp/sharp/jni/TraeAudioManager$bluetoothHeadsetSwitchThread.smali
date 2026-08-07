.class Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$bluetoothHeadsetSwitchThread;
.super Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$switchThread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "bluetoothHeadsetSwitchThread"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;


# direct methods
.method public constructor <init>(Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$bluetoothHeadsetSwitchThread;->this$0:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$switchThread;-><init>(Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public _quit()V
    .locals 1
    .annotation build Landroid/annotation/TargetApi;
        value = 0x8
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$bluetoothHeadsetSwitchThread;->this$0:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->_am:Landroid/media/AudioManager;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$bluetoothHeadsetSwitchThread;->_stopBluetoothSco()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public _run()V
    .locals 9

    .line 1
    sget-boolean v0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->IsMusicScene:Z

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    const-string v2, "TRAE"

    .line 5
    .line 6
    if-nez v0, :cond_8

    .line 7
    .line 8
    sget-boolean v0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->IsUpdateSceneFlag:Z

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    goto/16 :goto_3

    .line 13
    .line 14
    :cond_0
    sget-boolean v0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->enableDeviceSwitchFlag:Z

    .line 15
    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-eqz p0, :cond_7

    .line 23
    .line 24
    const-string p0, "connect bluetoothHeadset: disableDeviceSwitchFlag"

    .line 25
    .line 26
    invoke-static {v2, v1, p0}, Lcom/tencent/rtmp/sharp/jni/QLog;->w(Ljava/lang/String;ILjava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    const-wide/16 v3, 0x3e8

    .line 31
    .line 32
    :try_start_0
    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 33
    .line 34
    .line 35
    :catch_0
    invoke-virtual {p0}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$bluetoothHeadsetSwitchThread;->_startBluetoothSco()V

    .line 36
    .line 37
    .line 38
    const/4 v0, 0x0

    .line 39
    move v5, v0

    .line 40
    :goto_0
    iget-boolean v6, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$switchThread;->_running:Z

    .line 41
    .line 42
    const/16 v7, 0xa

    .line 43
    .line 44
    const/4 v8, 0x1

    .line 45
    if-ne v6, v8, :cond_5

    .line 46
    .line 47
    add-int/lit8 v6, v5, 0x1

    .line 48
    .line 49
    if-ge v5, v7, :cond_5

    .line 50
    .line 51
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    .line 52
    .line 53
    .line 54
    move-result v5

    .line 55
    if-eqz v5, :cond_3

    .line 56
    .line 57
    new-instance v5, Ljava/lang/StringBuilder;

    .line 58
    .line 59
    const-string v8, "bluetoothHeadsetSwitchThread i:"

    .line 60
    .line 61
    invoke-direct {v5, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    const-string v8, " sco:"

    .line 68
    .line 69
    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    iget-object v8, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$bluetoothHeadsetSwitchThread;->this$0:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;

    .line 73
    .line 74
    iget-object v8, v8, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->_am:Landroid/media/AudioManager;

    .line 75
    .line 76
    invoke-virtual {v8}, Landroid/media/AudioManager;->isBluetoothScoOn()Z

    .line 77
    .line 78
    .line 79
    move-result v8

    .line 80
    if-eqz v8, :cond_2

    .line 81
    .line 82
    const-string v8, "Y"

    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_2
    const-string v8, "N"

    .line 86
    .line 87
    :goto_1
    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    const-string v8, " :"

    .line 91
    .line 92
    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    iget-object v8, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$bluetoothHeadsetSwitchThread;->this$0:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;

    .line 96
    .line 97
    iget-object v8, v8, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->_deviceConfigManager:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$DeviceConfigManager;

    .line 98
    .line 99
    invoke-virtual {v8}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$DeviceConfigManager;->getBluetoothName()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v8

    .line 103
    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v5

    .line 110
    invoke-static {v2, v1, v5}, Lcom/tencent/rtmp/sharp/jni/QLog;->w(Ljava/lang/String;ILjava/lang/String;)V

    .line 111
    .line 112
    .line 113
    :cond_3
    iget-object v5, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$bluetoothHeadsetSwitchThread;->this$0:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;

    .line 114
    .line 115
    iget-object v5, v5, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->_am:Landroid/media/AudioManager;

    .line 116
    .line 117
    invoke-virtual {v5}, Landroid/media/AudioManager;->isBluetoothScoOn()Z

    .line 118
    .line 119
    .line 120
    move-result v5

    .line 121
    if-eqz v5, :cond_4

    .line 122
    .line 123
    invoke-virtual {p0}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$switchThread;->updateStatus()V

    .line 124
    .line 125
    .line 126
    goto :goto_2

    .line 127
    :cond_4
    :try_start_1
    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1

    .line 128
    .line 129
    .line 130
    :catch_1
    move v5, v6

    .line 131
    goto :goto_0

    .line 132
    :cond_5
    :goto_2
    iget-object v3, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$bluetoothHeadsetSwitchThread;->this$0:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;

    .line 133
    .line 134
    iget-object v3, v3, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->_am:Landroid/media/AudioManager;

    .line 135
    .line 136
    invoke-virtual {v3}, Landroid/media/AudioManager;->isBluetoothScoOn()Z

    .line 137
    .line 138
    .line 139
    move-result v3

    .line 140
    if-nez v3, :cond_7

    .line 141
    .line 142
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    .line 143
    .line 144
    .line 145
    move-result v3

    .line 146
    if-eqz v3, :cond_6

    .line 147
    .line 148
    const-string v3, "bluetoothHeadsetSwitchThread sco fail,remove btheadset"

    .line 149
    .line 150
    invoke-static {v2, v1, v3}, Lcom/tencent/rtmp/sharp/jni/QLog;->e(Ljava/lang/String;ILjava/lang/String;)V

    .line 151
    .line 152
    .line 153
    :cond_6
    iget-object v1, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$bluetoothHeadsetSwitchThread;->this$0:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;

    .line 154
    .line 155
    iget-object v1, v1, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->_deviceConfigManager:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$DeviceConfigManager;

    .line 156
    .line 157
    invoke-virtual {p0}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$bluetoothHeadsetSwitchThread;->getDeviceName()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v2

    .line 161
    invoke-virtual {v1, v2, v0}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$DeviceConfigManager;->setVisible(Ljava/lang/String;Z)Z

    .line 162
    .line 163
    .line 164
    invoke-virtual {p0, v7}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$switchThread;->processDeviceConnectRes(I)V

    .line 165
    .line 166
    .line 167
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$bluetoothHeadsetSwitchThread;->this$0:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;

    .line 168
    .line 169
    invoke-virtual {p0}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->checkAutoDeviceListUpdate()V

    .line 170
    .line 171
    .line 172
    :cond_7
    return-void

    .line 173
    :cond_8
    :goto_3
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    .line 174
    .line 175
    .line 176
    move-result v0

    .line 177
    if-eqz v0, :cond_9

    .line 178
    .line 179
    new-instance v0, Ljava/lang/StringBuilder;

    .line 180
    .line 181
    const-string v3, "connect bluetoothHeadset: do nothing, IsMusicScene:"

    .line 182
    .line 183
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 184
    .line 185
    .line 186
    sget-boolean v3, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->IsMusicScene:Z

    .line 187
    .line 188
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 189
    .line 190
    .line 191
    const-string v3, " ,IsUpdateSceneFlag:"

    .line 192
    .line 193
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 194
    .line 195
    .line 196
    sget-boolean v3, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->IsUpdateSceneFlag:Z

    .line 197
    .line 198
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 199
    .line 200
    .line 201
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object v0

    .line 205
    invoke-static {v2, v1, v0}, Lcom/tencent/rtmp/sharp/jni/QLog;->w(Ljava/lang/String;ILjava/lang/String;)V

    .line 206
    .line 207
    .line 208
    :cond_9
    invoke-virtual {p0}, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$switchThread;->updateStatus()V

    .line 209
    .line 210
    .line 211
    return-void
.end method

.method public _startBluetoothSco()V
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x8
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$bluetoothHeadsetSwitchThread;->this$0:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->_am:Landroid/media/AudioManager;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->setBluetoothScoOn(Z)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$bluetoothHeadsetSwitchThread;->this$0:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->_am:Landroid/media/AudioManager;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/media/AudioManager;->startBluetoothSco()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public _stopBluetoothSco()V
    .locals 1
    .annotation build Landroid/annotation/TargetApi;
        value = 0x8
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$bluetoothHeadsetSwitchThread;->this$0:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->_am:Landroid/media/AudioManager;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/media/AudioManager;->stopBluetoothSco()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager$bluetoothHeadsetSwitchThread;->this$0:Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/TraeAudioManager;->_am:Landroid/media/AudioManager;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-virtual {p0, v0}, Landroid/media/AudioManager;->setBluetoothScoOn(Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public getDeviceName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "DEVICE_BLUETOOTHHEADSET"

    .line 2
    .line 3
    return-object p0
.end method
