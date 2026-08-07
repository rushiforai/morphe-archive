.class public Lcom/momo/momortc/media/HeadSetReceiver;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "HeadSetReceiver"

.field private static isFocus:Z = false

.field private static isVoip:Z = false

.field private static mAudioFocusListener:Landroid/media/AudioManager$OnAudioFocusChangeListener; = null

.field private static mBlueHeadSet:Z = false

.field private static mContext:Landroid/content/Context; = null

.field private static mEarBack:Z = false

.field private static mSpeakerphoneOn:Z = true


# instance fields
.field private audioManager:Landroid/media/AudioManager;

.field private mAudioRouterFix:Z

.field private mAudioRouterMedia:Z

.field private mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

.field private mHeadSet:Z

.field private mHeadSetMic:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/wzk;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/wzk;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/momo/momortc/media/HeadSetReceiver;->mAudioFocusListener:Landroid/media/AudioManager$OnAudioFocusChangeListener;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Landroid/media/AudioManager;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/momo/momortc/media/HeadSetReceiver;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-boolean v0, p0, Lcom/momo/momortc/media/HeadSetReceiver;->mHeadSet:Z

    .line 12
    .line 13
    iput-boolean v0, p0, Lcom/momo/momortc/media/HeadSetReceiver;->mAudioRouterMedia:Z

    .line 14
    .line 15
    iput-boolean v0, p0, Lcom/momo/momortc/media/HeadSetReceiver;->mAudioRouterFix:Z

    .line 16
    .line 17
    iput-boolean v0, p0, Lcom/momo/momortc/media/HeadSetReceiver;->mHeadSetMic:Z

    .line 18
    .line 19
    iput-object p1, p0, Lcom/momo/momortc/media/HeadSetReceiver;->audioManager:Landroid/media/AudioManager;

    .line 20
    .line 21
    invoke-static {p1}, Lcom/momo/rtcbase/voiceengine/WebRtcAudioRecord;->setAudioManager(Landroid/media/AudioManager;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static synthetic a(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public static abandonAudioFocus()V
    .locals 2

    .line 1
    sget-object v0, Lcom/momo/momortc/media/HeadSetReceiver;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    sget-boolean v1, Lcom/momo/momortc/media/HeadSetReceiver;->isFocus:Z

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string v1, "audio"

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Landroid/media/AudioManager;

    .line 17
    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    sget-object v1, Lcom/momo/momortc/media/HeadSetReceiver;->mAudioFocusListener:Landroid/media/AudioManager$OnAudioFocusChangeListener;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->abandonAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;)I

    .line 24
    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    sput-boolean v0, Lcom/momo/momortc/media/HeadSetReceiver;->isFocus:Z

    .line 28
    .line 29
    const-string v0, "--------"

    .line 30
    .line 31
    const-string v1, "abandonAudioFocus"

    .line 32
    .line 33
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    :cond_2
    :goto_0
    return-void
.end method

.method public static hasBluetoothHeadset()Z
    .locals 3

    .line 1
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-static {v0, v1}, Ll/jj5;->d(Landroid/bluetooth/BluetoothAdapter;I)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v2, 0x2

    .line 11
    if-ne v0, v2, :cond_0

    .line 12
    .line 13
    return v1

    .line 14
    :cond_0
    const/4 v0, 0x0

    .line 15
    return v0
.end method

.method public static hasWiredHeadset(Landroid/media/AudioManager;)Z
    .locals 7

    .line 1
    const/4 v0, 0x3

    .line 2
    invoke-virtual {p0, v0}, Landroid/media/AudioManager;->getDevices(I)[Landroid/media/AudioDeviceInfo;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    array-length v1, p0

    .line 7
    const/4 v2, 0x0

    .line 8
    move v3, v2

    .line 9
    :goto_0
    if-ge v3, v1, :cond_2

    .line 10
    .line 11
    aget-object v4, p0, v3

    .line 12
    .line 13
    invoke-virtual {v4}, Landroid/media/AudioDeviceInfo;->getType()I

    .line 14
    .line 15
    .line 16
    move-result v4

    .line 17
    const/4 v5, 0x1

    .line 18
    if-ne v4, v0, :cond_0

    .line 19
    .line 20
    return v5

    .line 21
    :cond_0
    const/16 v6, 0xb

    .line 22
    .line 23
    if-ne v4, v6, :cond_1

    .line 24
    .line 25
    return v5

    .line 26
    :cond_1
    add-int/lit8 v3, v3, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_2
    return v2
.end method

.method public static isHeadsetOn(Landroid/content/Context;)Z
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const-string v1, "audio"

    .line 6
    .line 7
    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Landroid/media/AudioManager;

    .line 12
    .line 13
    if-nez p0, :cond_1

    .line 14
    .line 15
    return v0

    .line 16
    :cond_1
    const/4 v1, 0x2

    .line 17
    invoke-virtual {p0, v1}, Landroid/media/AudioManager;->getDevices(I)[Landroid/media/AudioDeviceInfo;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    array-length v1, p0

    .line 22
    move v2, v0

    .line 23
    :goto_0
    if-ge v2, v1, :cond_4

    .line 24
    .line 25
    aget-object v3, p0, v2

    .line 26
    .line 27
    invoke-virtual {v3}, Landroid/media/AudioDeviceInfo;->getType()I

    .line 28
    .line 29
    .line 30
    move-result v4

    .line 31
    const/4 v5, 0x3

    .line 32
    if-eq v4, v5, :cond_3

    .line 33
    .line 34
    invoke-virtual {v3}, Landroid/media/AudioDeviceInfo;->getType()I

    .line 35
    .line 36
    .line 37
    move-result v4

    .line 38
    const/4 v5, 0x4

    .line 39
    if-eq v4, v5, :cond_3

    .line 40
    .line 41
    invoke-virtual {v3}, Landroid/media/AudioDeviceInfo;->getType()I

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    const/16 v5, 0x8

    .line 46
    .line 47
    if-eq v4, v5, :cond_3

    .line 48
    .line 49
    invoke-virtual {v3}, Landroid/media/AudioDeviceInfo;->getType()I

    .line 50
    .line 51
    .line 52
    move-result v4

    .line 53
    const/16 v5, 0xc

    .line 54
    .line 55
    if-eq v4, v5, :cond_3

    .line 56
    .line 57
    invoke-virtual {v3}, Landroid/media/AudioDeviceInfo;->getType()I

    .line 58
    .line 59
    .line 60
    move-result v4

    .line 61
    const/16 v5, 0xb

    .line 62
    .line 63
    if-eq v4, v5, :cond_3

    .line 64
    .line 65
    invoke-virtual {v3}, Landroid/media/AudioDeviceInfo;->getType()I

    .line 66
    .line 67
    .line 68
    move-result v3

    .line 69
    const/16 v4, 0x16

    .line 70
    .line 71
    if-ne v3, v4, :cond_2

    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_2
    add-int/lit8 v2, v2, 0x1

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_3
    :goto_1
    const/4 p0, 0x1

    .line 78
    return p0

    .line 79
    :cond_4
    return v0
.end method

.method public static requestAudioFocus(Landroid/content/Context;)V
    .locals 3

    .line 1
    if-eqz p0, :cond_2

    .line 2
    .line 3
    sget-boolean v0, Lcom/momo/momortc/media/HeadSetReceiver;->isFocus:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    sput-object p0, Lcom/momo/momortc/media/HeadSetReceiver;->mContext:Landroid/content/Context;

    .line 13
    .line 14
    const-string v0, "audio"

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Landroid/media/AudioManager;

    .line 21
    .line 22
    if-nez p0, :cond_1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    sget-object v0, Lcom/momo/momortc/media/HeadSetReceiver;->mAudioFocusListener:Landroid/media/AudioManager$OnAudioFocusChangeListener;

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    const/4 v2, 0x3

    .line 29
    invoke-virtual {p0, v0, v1, v2}, Landroid/media/AudioManager;->requestAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;II)I

    .line 30
    .line 31
    .line 32
    const/4 p0, 0x1

    .line 33
    sput-boolean p0, Lcom/momo/momortc/media/HeadSetReceiver;->isFocus:Z

    .line 34
    .line 35
    :cond_2
    :goto_0
    return-void
.end method


# virtual methods
.method public autoSetHeadsetOn(Landroid/media/AudioManager;ZZ)V
    .locals 11

    .line 1
    sput-boolean p2, Lcom/momo/momortc/media/HeadSetReceiver;->isVoip:Z

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    goto/16 :goto_6

    .line 6
    .line 7
    :cond_0
    const/4 v0, 0x2

    .line 8
    :try_start_0
    invoke-virtual {p1, v0}, Landroid/media/AudioManager;->getDevices(I)[Landroid/media/AudioDeviceInfo;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    array-length v1, v0

    .line 13
    const/4 v2, 0x0

    .line 14
    move v3, v2

    .line 15
    move v4, v3

    .line 16
    move v5, v4

    .line 17
    :goto_0
    const/4 v6, 0x1

    .line 18
    if-ge v3, v1, :cond_5

    .line 19
    .line 20
    aget-object v7, v0, v3

    .line 21
    .line 22
    invoke-virtual {v7}, Landroid/media/AudioDeviceInfo;->getType()I

    .line 23
    .line 24
    .line 25
    move-result v8

    .line 26
    const/4 v9, 0x3

    .line 27
    if-eq v8, v9, :cond_1

    .line 28
    .line 29
    invoke-virtual {v7}, Landroid/media/AudioDeviceInfo;->getType()I

    .line 30
    .line 31
    .line 32
    move-result v8

    .line 33
    const/4 v10, 0x4

    .line 34
    if-eq v8, v10, :cond_1

    .line 35
    .line 36
    invoke-virtual {v7}, Landroid/media/AudioDeviceInfo;->getType()I

    .line 37
    .line 38
    .line 39
    move-result v8

    .line 40
    const/16 v10, 0xc

    .line 41
    .line 42
    if-eq v8, v10, :cond_1

    .line 43
    .line 44
    invoke-virtual {v7}, Landroid/media/AudioDeviceInfo;->getType()I

    .line 45
    .line 46
    .line 47
    move-result v8

    .line 48
    const/16 v10, 0xb

    .line 49
    .line 50
    if-eq v8, v10, :cond_1

    .line 51
    .line 52
    invoke-virtual {v7}, Landroid/media/AudioDeviceInfo;->getType()I

    .line 53
    .line 54
    .line 55
    move-result v8

    .line 56
    const/16 v10, 0x16

    .line 57
    .line 58
    if-eq v8, v10, :cond_1

    .line 59
    .line 60
    invoke-virtual {v7}, Landroid/media/AudioDeviceInfo;->getType()I

    .line 61
    .line 62
    .line 63
    move-result v8

    .line 64
    if-ne v8, v9, :cond_2

    .line 65
    .line 66
    :cond_1
    move v5, v6

    .line 67
    :cond_2
    invoke-virtual {v7}, Landroid/media/AudioDeviceInfo;->getType()I

    .line 68
    .line 69
    .line 70
    move-result v8

    .line 71
    const/4 v9, 0x7

    .line 72
    if-eq v8, v9, :cond_3

    .line 73
    .line 74
    invoke-virtual {v7}, Landroid/media/AudioDeviceInfo;->getType()I

    .line 75
    .line 76
    .line 77
    move-result v7

    .line 78
    const/16 v8, 0x8

    .line 79
    .line 80
    if-ne v7, v8, :cond_4

    .line 81
    .line 82
    :cond_3
    move v4, v6

    .line 83
    :cond_4
    add-int/lit8 v3, v3, 0x1

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_5
    sget-boolean v0, Lcom/momo/momortc/media/HeadSetReceiver;->mBlueHeadSet:Z

    .line 87
    .line 88
    or-int v1, v4, v0

    .line 89
    .line 90
    or-int v3, v5, v1

    .line 91
    .line 92
    if-eqz p3, :cond_9

    .line 93
    .line 94
    if-nez v0, :cond_8

    .line 95
    .line 96
    iget-boolean p3, p0, Lcom/momo/momortc/media/HeadSetReceiver;->mHeadSet:Z

    .line 97
    .line 98
    if-nez p3, :cond_7

    .line 99
    .line 100
    iget-boolean p3, p0, Lcom/momo/momortc/media/HeadSetReceiver;->mAudioRouterMedia:Z

    .line 101
    .line 102
    if-eqz p3, :cond_6

    .line 103
    .line 104
    goto :goto_1

    .line 105
    :cond_6
    invoke-virtual {p0, p3}, Lcom/momo/momortc/media/HeadSetReceiver;->setMediaRouter_i(Z)V

    .line 106
    .line 107
    .line 108
    goto :goto_2

    .line 109
    :cond_7
    :goto_1
    iget-boolean p3, p0, Lcom/momo/momortc/media/HeadSetReceiver;->mAudioRouterFix:Z

    .line 110
    .line 111
    if-nez p3, :cond_9

    .line 112
    .line 113
    invoke-virtual {p0, v6}, Lcom/momo/momortc/media/HeadSetReceiver;->setMediaRouter_i(Z)V

    .line 114
    .line 115
    .line 116
    goto :goto_2

    .line 117
    :cond_8
    invoke-virtual {p0, v6}, Lcom/momo/momortc/media/HeadSetReceiver;->setMediaRouter_i(Z)V

    .line 118
    .line 119
    .line 120
    :cond_9
    :goto_2
    if-nez p2, :cond_a

    .line 121
    .line 122
    if-eqz v1, :cond_c

    .line 123
    .line 124
    :cond_a
    if-nez v3, :cond_b

    .line 125
    .line 126
    sget-boolean p0, Lcom/momo/momortc/media/HeadSetReceiver;->mSpeakerphoneOn:Z

    .line 127
    .line 128
    if-eqz p0, :cond_b

    .line 129
    .line 130
    move p0, v6

    .line 131
    goto :goto_3

    .line 132
    :cond_b
    move p0, v2

    .line 133
    :goto_3
    invoke-virtual {p1}, Landroid/media/AudioManager;->isSpeakerphoneOn()Z

    .line 134
    .line 135
    .line 136
    move-result p3

    .line 137
    if-eq p0, p3, :cond_c

    .line 138
    .line 139
    invoke-virtual {p1, p0}, Landroid/media/AudioManager;->setSpeakerphoneOn(Z)V

    .line 140
    .line 141
    .line 142
    :cond_c
    if-eqz v1, :cond_e

    .line 143
    .line 144
    if-eqz p2, :cond_d

    .line 145
    .line 146
    invoke-virtual {p1}, Landroid/media/AudioManager;->startBluetoothSco()V

    .line 147
    .line 148
    .line 149
    invoke-virtual {p1, v6}, Landroid/media/AudioManager;->setBluetoothScoOn(Z)V

    .line 150
    .line 151
    .line 152
    invoke-virtual {p1, v2}, Landroid/media/AudioManager;->setBluetoothA2dpOn(Z)V

    .line 153
    .line 154
    .line 155
    goto :goto_4

    .line 156
    :cond_d
    invoke-virtual {p1}, Landroid/media/AudioManager;->stopBluetoothSco()V

    .line 157
    .line 158
    .line 159
    invoke-virtual {p1, v2}, Landroid/media/AudioManager;->setBluetoothScoOn(Z)V

    .line 160
    .line 161
    .line 162
    invoke-virtual {p1, v6}, Landroid/media/AudioManager;->setBluetoothA2dpOn(Z)V

    .line 163
    .line 164
    .line 165
    :cond_e
    :goto_4
    if-nez v3, :cond_10

    .line 166
    .line 167
    if-eqz v1, :cond_f

    .line 168
    .line 169
    goto :goto_5

    .line 170
    :cond_f
    sget-boolean p0, Lcom/momo/momortc/media/HeadSetReceiver;->mSpeakerphoneOn:Z

    .line 171
    .line 172
    invoke-virtual {p1, p0}, Landroid/media/AudioManager;->setSpeakerphoneOn(Z)V

    .line 173
    .line 174
    .line 175
    invoke-virtual {p1, v6}, Landroid/media/AudioManager;->setWiredHeadsetOn(Z)V

    .line 176
    .line 177
    .line 178
    invoke-static {}, Lcom/momo/momortc/MMRtcEngine;->getInstance()Lcom/momo/momortc/MMRtcEngineImpl;

    .line 179
    .line 180
    .line 181
    move-result-object p0

    .line 182
    invoke-virtual {p0, v2}, Lcom/momo/momortc/MMRtcEngineImpl;->setEarBack(Z)V

    .line 183
    .line 184
    .line 185
    return-void

    .line 186
    :cond_10
    :goto_5
    invoke-virtual {p1, v2}, Landroid/media/AudioManager;->setSpeakerphoneOn(Z)V

    .line 187
    .line 188
    .line 189
    invoke-virtual {p1, v2}, Landroid/media/AudioManager;->setWiredHeadsetOn(Z)V

    .line 190
    .line 191
    .line 192
    sget-boolean p0, Lcom/momo/momortc/media/HeadSetReceiver;->mEarBack:Z

    .line 193
    .line 194
    if-eqz p0, :cond_11

    .line 195
    .line 196
    invoke-static {}, Lcom/momo/momortc/MMRtcEngine;->getInstance()Lcom/momo/momortc/MMRtcEngineImpl;

    .line 197
    .line 198
    .line 199
    move-result-object p0

    .line 200
    invoke-virtual {p0, v6}, Lcom/momo/momortc/MMRtcEngineImpl;->setEarBack(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 201
    .line 202
    .line 203
    :cond_11
    :goto_6
    return-void

    .line 204
    :catch_0
    move-exception p0

    .line 205
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 206
    .line 207
    .line 208
    return-void
.end method

.method public getHeadSetState()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/momortc/media/HeadSetReceiver;->mHeadSet:Z

    .line 2
    .line 3
    if-nez p0, :cond_1

    .line 4
    .line 5
    sget-boolean p0, Lcom/momo/momortc/media/HeadSetReceiver;->mBlueHeadSet:Z

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0

    .line 12
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 13
    return p0
.end method

.method public isEarBack()Z
    .locals 0

    .line 1
    sget-boolean p0, Lcom/momo/momortc/media/HeadSetReceiver;->mEarBack:Z

    .line 2
    .line 3
    return p0
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4

    .line 1
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "audio"

    .line 6
    .line 7
    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Landroid/media/AudioManager;

    .line 12
    .line 13
    const-string v1, "android.intent.action.HEADSET_PLUG"

    .line 14
    .line 15
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/4 v1, 0x1

    .line 20
    const/4 v2, 0x0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    const-string v0, "state"

    .line 24
    .line 25
    invoke-virtual {p2, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    if-eqz v3, :cond_1

    .line 30
    .line 31
    invoke-virtual {p2, v0, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-ne v0, v1, :cond_0

    .line 36
    .line 37
    iput-boolean v1, p0, Lcom/momo/momortc/media/HeadSetReceiver;->mHeadSet:Z

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    if-nez v0, :cond_1

    .line 41
    .line 42
    iput-boolean v2, p0, Lcom/momo/momortc/media/HeadSetReceiver;->mHeadSet:Z

    .line 43
    .line 44
    :cond_1
    :goto_0
    const-string v0, "microphone"

    .line 45
    .line 46
    invoke-virtual {p2, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    if-eqz v3, :cond_3

    .line 51
    .line 52
    invoke-virtual {p2, v0, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 53
    .line 54
    .line 55
    move-result p2

    .line 56
    if-ne p2, v1, :cond_2

    .line 57
    .line 58
    move p2, v1

    .line 59
    goto :goto_1

    .line 60
    :cond_2
    move p2, v2

    .line 61
    :goto_1
    iput-boolean p2, p0, Lcom/momo/momortc/media/HeadSetReceiver;->mHeadSetMic:Z

    .line 62
    .line 63
    :cond_3
    iget-object p2, p0, Lcom/momo/momortc/media/HeadSetReceiver;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    .line 64
    .line 65
    if-eqz p2, :cond_7

    .line 66
    .line 67
    invoke-virtual {p2}, Landroid/bluetooth/BluetoothAdapter;->isEnabled()Z

    .line 68
    .line 69
    .line 70
    move-result p2

    .line 71
    if-eqz p2, :cond_7

    .line 72
    .line 73
    iget-object p2, p0, Lcom/momo/momortc/media/HeadSetReceiver;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    .line 74
    .line 75
    invoke-static {p2, v1}, Ll/jj5;->d(Landroid/bluetooth/BluetoothAdapter;I)I

    .line 76
    .line 77
    .line 78
    move-result p2

    .line 79
    iget-object v0, p0, Lcom/momo/momortc/media/HeadSetReceiver;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    .line 80
    .line 81
    const/4 v3, 0x2

    .line 82
    invoke-static {v0, v3}, Ll/jj5;->d(Landroid/bluetooth/BluetoothAdapter;I)I

    .line 83
    .line 84
    .line 85
    if-eq p2, v3, :cond_5

    .line 86
    .line 87
    if-ne p2, v1, :cond_4

    .line 88
    .line 89
    goto :goto_2

    .line 90
    :cond_4
    sput-boolean v2, Lcom/momo/momortc/media/HeadSetReceiver;->mBlueHeadSet:Z

    .line 91
    .line 92
    goto :goto_3

    .line 93
    :cond_5
    :goto_2
    sput-boolean v1, Lcom/momo/momortc/media/HeadSetReceiver;->mBlueHeadSet:Z

    .line 94
    .line 95
    if-eqz p1, :cond_8

    .line 96
    .line 97
    invoke-virtual {p1, v2}, Landroid/media/AudioManager;->setSpeakerphoneOn(Z)V

    .line 98
    .line 99
    .line 100
    sget-boolean p2, Lcom/momo/momortc/media/HeadSetReceiver;->isVoip:Z

    .line 101
    .line 102
    if-eqz p2, :cond_6

    .line 103
    .line 104
    invoke-virtual {p1}, Landroid/media/AudioManager;->startBluetoothSco()V

    .line 105
    .line 106
    .line 107
    invoke-virtual {p1, v1}, Landroid/media/AudioManager;->setBluetoothScoOn(Z)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {p1, v2}, Landroid/media/AudioManager;->setBluetoothA2dpOn(Z)V

    .line 111
    .line 112
    .line 113
    goto :goto_3

    .line 114
    :cond_6
    invoke-virtual {p1}, Landroid/media/AudioManager;->stopBluetoothSco()V

    .line 115
    .line 116
    .line 117
    invoke-virtual {p1, v2}, Landroid/media/AudioManager;->setBluetoothScoOn(Z)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {p1, v1}, Landroid/media/AudioManager;->setBluetoothA2dpOn(Z)V

    .line 121
    .line 122
    .line 123
    goto :goto_3

    .line 124
    :cond_7
    sput-boolean v2, Lcom/momo/momortc/media/HeadSetReceiver;->mBlueHeadSet:Z

    .line 125
    .line 126
    :cond_8
    :goto_3
    :try_start_0
    iget-boolean p2, p0, Lcom/momo/momortc/media/HeadSetReceiver;->mHeadSet:Z

    .line 127
    .line 128
    if-nez p2, :cond_a

    .line 129
    .line 130
    sget-boolean p2, Lcom/momo/momortc/media/HeadSetReceiver;->mBlueHeadSet:Z

    .line 131
    .line 132
    if-eqz p2, :cond_9

    .line 133
    .line 134
    goto :goto_4

    .line 135
    :cond_9
    sget-boolean p2, Lcom/momo/momortc/media/HeadSetReceiver;->mSpeakerphoneOn:Z

    .line 136
    .line 137
    invoke-virtual {p1, p2}, Landroid/media/AudioManager;->setSpeakerphoneOn(Z)V

    .line 138
    .line 139
    .line 140
    iget-object p0, p0, Lcom/momo/momortc/media/HeadSetReceiver;->audioManager:Landroid/media/AudioManager;

    .line 141
    .line 142
    invoke-virtual {p0, v1}, Landroid/media/AudioManager;->setWiredHeadsetOn(Z)V

    .line 143
    .line 144
    .line 145
    invoke-static {}, Lcom/momo/momortc/MMRtcEngine;->getInstance()Lcom/momo/momortc/MMRtcEngineImpl;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    invoke-virtual {p0, v2}, Lcom/momo/momortc/MMRtcEngineImpl;->setHeadset(Z)I

    .line 150
    .line 151
    .line 152
    invoke-static {}, Lcom/momo/momortc/MMRtcEngine;->getInstance()Lcom/momo/momortc/MMRtcEngineImpl;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    invoke-virtual {p0, v2}, Lcom/momo/momortc/MMRtcEngineImpl;->setEarBack(Z)V

    .line 157
    .line 158
    .line 159
    return-void

    .line 160
    :cond_a
    :goto_4
    invoke-virtual {p1, v2}, Landroid/media/AudioManager;->setSpeakerphoneOn(Z)V

    .line 161
    .line 162
    .line 163
    iget-object p0, p0, Lcom/momo/momortc/media/HeadSetReceiver;->audioManager:Landroid/media/AudioManager;

    .line 164
    .line 165
    invoke-virtual {p0, v2}, Landroid/media/AudioManager;->setWiredHeadsetOn(Z)V

    .line 166
    .line 167
    .line 168
    invoke-static {}, Lcom/momo/momortc/MMRtcEngine;->getInstance()Lcom/momo/momortc/MMRtcEngineImpl;

    .line 169
    .line 170
    .line 171
    move-result-object p0

    .line 172
    invoke-virtual {p0, v1}, Lcom/momo/momortc/MMRtcEngineImpl;->setHeadset(Z)I

    .line 173
    .line 174
    .line 175
    sget-boolean p0, Lcom/momo/momortc/media/HeadSetReceiver;->mEarBack:Z

    .line 176
    .line 177
    if-eqz p0, :cond_b

    .line 178
    .line 179
    invoke-static {}, Lcom/momo/momortc/MMRtcEngine;->getInstance()Lcom/momo/momortc/MMRtcEngineImpl;

    .line 180
    .line 181
    .line 182
    move-result-object p0

    .line 183
    invoke-virtual {p0, v1}, Lcom/momo/momortc/MMRtcEngineImpl;->setEarBack(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 184
    .line 185
    .line 186
    :cond_b
    return-void

    .line 187
    :catch_0
    move-exception p0

    .line 188
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 189
    .line 190
    .line 191
    return-void
.end method

.method public release()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/momo/momortc/media/HeadSetReceiver;->audioManager:Landroid/media/AudioManager;

    .line 3
    .line 4
    return-void
.end method

.method public setEarBack(Z)V
    .locals 0

    .line 1
    sput-boolean p1, Lcom/momo/momortc/media/HeadSetReceiver;->mEarBack:Z

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/momortc/media/HeadSetReceiver;->getHeadSetState()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lcom/momo/momortc/MMRtcEngine;->getInstance()Lcom/momo/momortc/MMRtcEngineImpl;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0, p1}, Lcom/momo/momortc/MMRtcEngineImpl;->setEarBack(Z)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public setMediaRouter(ZZ)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/momortc/media/HeadSetReceiver;->mAudioRouterMedia:Z

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/momo/momortc/media/HeadSetReceiver;->mAudioRouterFix:Z

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/momortc/media/HeadSetReceiver;->setMediaRouter_i(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setMediaRouter_i(Z)V
    .locals 0

    return-void
.end method

.method public setSpeakerphoneOn(Z)V
    .locals 0

    .line 1
    sput-boolean p1, Lcom/momo/momortc/media/HeadSetReceiver;->mSpeakerphoneOn:Z

    .line 2
    .line 3
    return-void
.end method
