.class public Lcom/ss/bytertc/audio/device/router/device/AudioDevicePlayoutLatency;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "AudioDevicePlayoutLatency"


# instance fields
.field private mAudioTrack:Landroid/media/AudioTrack;

.field private performanceMode:I

.field private playoutChannel:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/router/device/AudioDevicePlayoutLatency;->mAudioTrack:Landroid/media/AudioTrack;

    .line 6
    .line 7
    const/4 v0, 0x2

    .line 8
    iput v0, p0, Lcom/ss/bytertc/audio/device/router/device/AudioDevicePlayoutLatency;->performanceMode:I

    .line 9
    .line 10
    const/4 v0, 0x4

    .line 11
    iput v0, p0, Lcom/ss/bytertc/audio/device/router/device/AudioDevicePlayoutLatency;->playoutChannel:I

    .line 12
    .line 13
    const-string p0, "AudioDevicePlayoutLatency"

    .line 14
    .line 15
    const-string v0, "AudioDevicePlayoutLatency Created"

    .line 16
    .line 17
    invoke-static {p0, v0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public getPlayoutLatency(III)I
    .locals 11

    .line 1
    const/16 v0, 0x1f40

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eq p1, v0, :cond_0

    .line 5
    .line 6
    const/16 v0, 0x3e80

    .line 7
    .line 8
    if-eq p1, v0, :cond_0

    .line 9
    .line 10
    const/16 v0, 0x7d00

    .line 11
    .line 12
    if-eq p1, v0, :cond_0

    .line 13
    .line 14
    const v0, 0xac44

    .line 15
    .line 16
    .line 17
    if-eq p1, v0, :cond_0

    .line 18
    .line 19
    const v0, 0xbb80

    .line 20
    .line 21
    .line 22
    if-eq p1, v0, :cond_0

    .line 23
    .line 24
    return v1

    .line 25
    :cond_0
    const/4 v0, 0x3

    .line 26
    const/4 v2, 0x2

    .line 27
    const/4 v3, 0x1

    .line 28
    if-eq p3, v3, :cond_2

    .line 29
    .line 30
    if-eq p3, v0, :cond_1

    .line 31
    .line 32
    iput v3, p0, Lcom/ss/bytertc/audio/device/router/device/AudioDevicePlayoutLatency;->performanceMode:I

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    iput v2, p0, Lcom/ss/bytertc/audio/device/router/device/AudioDevicePlayoutLatency;->performanceMode:I

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_2
    iput v3, p0, Lcom/ss/bytertc/audio/device/router/device/AudioDevicePlayoutLatency;->performanceMode:I

    .line 39
    .line 40
    :goto_0
    const/4 p3, 0x4

    .line 41
    if-eq p2, v3, :cond_4

    .line 42
    .line 43
    if-eq p2, v2, :cond_3

    .line 44
    .line 45
    iput p3, p0, Lcom/ss/bytertc/audio/device/router/device/AudioDevicePlayoutLatency;->playoutChannel:I

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_3
    const/16 p3, 0xc

    .line 49
    .line 50
    iput p3, p0, Lcom/ss/bytertc/audio/device/router/device/AudioDevicePlayoutLatency;->playoutChannel:I

    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_4
    iput p3, p0, Lcom/ss/bytertc/audio/device/router/device/AudioDevicePlayoutLatency;->playoutChannel:I

    .line 54
    .line 55
    :goto_1
    int-to-double v4, p1

    .line 56
    const-wide/high16 v6, 0x4069000000000000L    # 200.0

    .line 57
    .line 58
    div-double/2addr v4, v6

    .line 59
    invoke-static {v4, v5}, Ljava/lang/Math;->ceil(D)D

    .line 60
    .line 61
    .line 62
    move-result-wide v4

    .line 63
    double-to-int p3, v4

    .line 64
    mul-int/2addr p3, v2

    .line 65
    mul-int v9, p3, p2

    .line 66
    .line 67
    if-gtz v9, :cond_5

    .line 68
    .line 69
    return v1

    .line 70
    :cond_5
    :try_start_0
    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 71
    .line 72
    const/16 p3, 0x1a

    .line 73
    .line 74
    if-lt p2, p3, :cond_6

    .line 75
    .line 76
    new-instance p2, Landroid/media/AudioTrack$Builder;

    .line 77
    .line 78
    invoke-direct {p2}, Landroid/media/AudioTrack$Builder;-><init>()V

    .line 79
    .line 80
    .line 81
    new-instance p3, Landroid/media/AudioAttributes$Builder;

    .line 82
    .line 83
    invoke-direct {p3}, Landroid/media/AudioAttributes$Builder;-><init>()V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p3, v3}, Landroid/media/AudioAttributes$Builder;->setUsage(I)Landroid/media/AudioAttributes$Builder;

    .line 87
    .line 88
    .line 89
    move-result-object p3

    .line 90
    invoke-virtual {p3, v2}, Landroid/media/AudioAttributes$Builder;->setContentType(I)Landroid/media/AudioAttributes$Builder;

    .line 91
    .line 92
    .line 93
    move-result-object p3

    .line 94
    invoke-virtual {p3, v0}, Landroid/media/AudioAttributes$Builder;->setLegacyStreamType(I)Landroid/media/AudioAttributes$Builder;

    .line 95
    .line 96
    .line 97
    move-result-object p3

    .line 98
    invoke-virtual {p3}, Landroid/media/AudioAttributes$Builder;->build()Landroid/media/AudioAttributes;

    .line 99
    .line 100
    .line 101
    move-result-object p3

    .line 102
    invoke-virtual {p2, p3}, Landroid/media/AudioTrack$Builder;->setAudioAttributes(Landroid/media/AudioAttributes;)Landroid/media/AudioTrack$Builder;

    .line 103
    .line 104
    .line 105
    move-result-object p2

    .line 106
    new-instance p3, Landroid/media/AudioFormat$Builder;

    .line 107
    .line 108
    invoke-direct {p3}, Landroid/media/AudioFormat$Builder;-><init>()V

    .line 109
    .line 110
    .line 111
    invoke-virtual {p3, v2}, Landroid/media/AudioFormat$Builder;->setEncoding(I)Landroid/media/AudioFormat$Builder;

    .line 112
    .line 113
    .line 114
    move-result-object p3

    .line 115
    invoke-virtual {p3, p1}, Landroid/media/AudioFormat$Builder;->setSampleRate(I)Landroid/media/AudioFormat$Builder;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    iget p3, p0, Lcom/ss/bytertc/audio/device/router/device/AudioDevicePlayoutLatency;->playoutChannel:I

    .line 120
    .line 121
    invoke-virtual {p1, p3}, Landroid/media/AudioFormat$Builder;->setChannelMask(I)Landroid/media/AudioFormat$Builder;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    invoke-virtual {p1}, Landroid/media/AudioFormat$Builder;->build()Landroid/media/AudioFormat;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    invoke-virtual {p2, p1}, Landroid/media/AudioTrack$Builder;->setAudioFormat(Landroid/media/AudioFormat;)Landroid/media/AudioTrack$Builder;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    invoke-virtual {p1, v3}, Landroid/media/AudioTrack$Builder;->setTransferMode(I)Landroid/media/AudioTrack$Builder;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    invoke-virtual {p1, v9}, Landroid/media/AudioTrack$Builder;->setBufferSizeInBytes(I)Landroid/media/AudioTrack$Builder;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    iget p2, p0, Lcom/ss/bytertc/audio/device/router/device/AudioDevicePlayoutLatency;->performanceMode:I

    .line 142
    .line 143
    invoke-static {p1, p2}, Ll/jsf0;->a(Landroid/media/AudioTrack$Builder;I)Landroid/media/AudioTrack$Builder;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    invoke-virtual {p1}, Landroid/media/AudioTrack$Builder;->build()Landroid/media/AudioTrack;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    iput-object p1, p0, Lcom/ss/bytertc/audio/device/router/device/AudioDevicePlayoutLatency;->mAudioTrack:Landroid/media/AudioTrack;

    .line 152
    .line 153
    goto :goto_2

    .line 154
    :cond_6
    new-instance v4, Landroid/media/AudioTrack;

    .line 155
    .line 156
    iget v7, p0, Lcom/ss/bytertc/audio/device/router/device/AudioDevicePlayoutLatency;->playoutChannel:I

    .line 157
    .line 158
    const/4 v8, 0x2

    .line 159
    const/4 v10, 0x1

    .line 160
    const/4 v5, 0x3

    .line 161
    move v6, p1

    .line 162
    invoke-direct/range {v4 .. v10}, Landroid/media/AudioTrack;-><init>(IIIIII)V

    .line 163
    .line 164
    .line 165
    iput-object v4, p0, Lcom/ss/bytertc/audio/device/router/device/AudioDevicePlayoutLatency;->mAudioTrack:Landroid/media/AudioTrack;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3

    .line 166
    .line 167
    :goto_2
    iget-object p1, p0, Lcom/ss/bytertc/audio/device/router/device/AudioDevicePlayoutLatency;->mAudioTrack:Landroid/media/AudioTrack;

    .line 168
    .line 169
    if-nez p1, :cond_7

    .line 170
    .line 171
    return v1

    .line 172
    :cond_7
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 173
    .line 174
    .line 175
    move-result-object p1

    .line 176
    :try_start_1
    const-string p2, "getLatency"

    .line 177
    .line 178
    const/4 p3, 0x0

    .line 179
    invoke-virtual {p1, p2, p3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 180
    .line 181
    .line 182
    move-result-object p1
    :try_end_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_1} :catch_2

    .line 183
    invoke-virtual {p1, v3}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    .line 184
    .line 185
    .line 186
    :try_start_2
    iget-object p2, p0, Lcom/ss/bytertc/audio/device/router/device/AudioDevicePlayoutLatency;->mAudioTrack:Landroid/media/AudioTrack;

    .line 187
    .line 188
    invoke-virtual {p1, p2, p3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 189
    .line 190
    .line 191
    move-result-object p1

    .line 192
    check-cast p1, Ljava/lang/Integer;

    .line 193
    .line 194
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 195
    .line 196
    .line 197
    move-result p1
    :try_end_2
    .catch Ljava/lang/IllegalAccessException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_2 .. :try_end_2} :catch_0

    .line 198
    invoke-static {p1, v1}, Ljava/lang/Math;->max(II)I

    .line 199
    .line 200
    .line 201
    move-result p1

    .line 202
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/device/AudioDevicePlayoutLatency;->mAudioTrack:Landroid/media/AudioTrack;

    .line 203
    .line 204
    invoke-virtual {p0}, Landroid/media/AudioTrack;->release()V

    .line 205
    .line 206
    .line 207
    return p1

    .line 208
    :catch_0
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/device/AudioDevicePlayoutLatency;->mAudioTrack:Landroid/media/AudioTrack;

    .line 209
    .line 210
    invoke-virtual {p0}, Landroid/media/AudioTrack;->release()V

    .line 211
    .line 212
    .line 213
    return v1

    .line 214
    :catch_1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/device/AudioDevicePlayoutLatency;->mAudioTrack:Landroid/media/AudioTrack;

    .line 215
    .line 216
    invoke-virtual {p0}, Landroid/media/AudioTrack;->release()V

    .line 217
    .line 218
    .line 219
    return v1

    .line 220
    :catch_2
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/device/AudioDevicePlayoutLatency;->mAudioTrack:Landroid/media/AudioTrack;

    .line 221
    .line 222
    invoke-virtual {p0}, Landroid/media/AudioTrack;->release()V

    .line 223
    .line 224
    .line 225
    :catch_3
    return v1
.end method
