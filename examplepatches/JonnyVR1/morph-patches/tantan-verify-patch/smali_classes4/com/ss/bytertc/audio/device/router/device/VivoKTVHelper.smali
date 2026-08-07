.class public Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final EQCustomGain:[[I

.field private static final EchoCustomParams:[[I

.field private static final KEY_EXT_SPKR:Ljava/lang/String; = "vivo_ktv_ext_speaker"

.field private static final KEY_KTV_MODE:Ljava/lang/String; = "vivo_ktv_mode"

.field private static final KEY_MIC_SRC:Ljava/lang/String; = "vivo_ktv_rec_source"

.field private static final KEY_MIC_TYPE:Ljava/lang/String; = "vivo_ktv_mic_type"

.field private static final KEY_PLAY_SRC:Ljava/lang/String; = "vivo_ktv_play_source"

.field private static final KEY_PRESET:Ljava/lang/String; = "vivo_ktv_preset_effect"

.field private static final KEY_VOL_MIC:Ljava/lang/String; = "vivo_ktv_volume_mic"

.field public static final MODE_CUSTOM_3DDRAEMY:I = 0x6

.field public static final MODE_CUSTOM_AIRY:I = 0x4

.field public static final MODE_CUSTOM_ATTRACTIVE:I = 0x3

.field public static final MODE_CUSTOM_DISTANT:I = 0x5

.field public static final MODE_CUSTOM_GRAMOPHONE:I = 0x7

.field public static final MODE_CUSTOM_KTV:I = 0x1

.field public static final MODE_CUSTOM_NOEFFECT:I = 0x8

.field public static final MODE_CUSTOM_RECSTUDIO:I = 0x0

.field public static final MODE_CUSTOM_WARM:I = 0x2

.field private static final ReverbCustomParams:[[I

.field private static final TAG:Ljava/lang/String; = "VivoKTVHelper"

.field private static final TAG_ECHO_DELAY:Ljava/lang/String; = "vivo_ktv_echo_delay"

.field private static final TAG_ECHO_DRY:Ljava/lang/String; = "vivo_ktv_echo_dry"

.field private static final TAG_ECHO_ENABLE:Ljava/lang/String; = "vivo_ktv_echo_enable"

.field private static final TAG_ECHO_GAIN:Ljava/lang/String; = "vivo_ktv_echo_feedback"

.field private static final TAG_ECHO_WET:Ljava/lang/String; = "vivo_ktv_echo_wet"

.field private static final TAG_MEQ_BAND_1:Ljava/lang/String; = "vivo_ktv_miceq_band1"

.field private static final TAG_MEQ_BAND_2:Ljava/lang/String; = "vivo_ktv_miceq_band2"

.field private static final TAG_MEQ_BAND_3:Ljava/lang/String; = "vivo_ktv_miceq_band3"

.field private static final TAG_MEQ_BAND_4:Ljava/lang/String; = "vivo_ktv_miceq_band4"

.field private static final TAG_MEQ_BAND_5:Ljava/lang/String; = "vivo_ktv_miceq_band5"

.field private static final TAG_RB_DAMP:Ljava/lang/String; = "vivo_ktv_rb_damp"

.field private static final TAG_RB_DRY:Ljava/lang/String; = "vivo_ktv_rb_dry"

.field private static final TAG_RB_GAIN:Ljava/lang/String; = "vivo_ktv_rb_gain"

.field private static final TAG_RB_ROOMSIZE:Ljava/lang/String; = "vivo_ktv_rb_roomsize"

.field private static final TAG_RB_WET:Ljava/lang/String; = "vivo_ktv_rb_wet"

.field private static final TAG_RB_WIDTH:Ljava/lang/String; = "vivo_ktv_rb_width"

.field private static final TAG_REVERB:Ljava/lang/String; = "vivo_ktv_reverb_preset"

.field private static final effect_size:I

.field private static mVivoKTVHelper:Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;


# instance fields
.field private mAudioManager:Landroid/media/AudioManager;

.field private mContext:Landroid/content/Context;

.field private final mParamLock:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 12

    .line 1
    const/4 v0, 0x6

    .line 2
    new-array v1, v0, [I

    .line 3
    .line 4
    fill-array-data v1, :array_0

    .line 5
    .line 6
    .line 7
    new-array v2, v0, [I

    .line 8
    .line 9
    fill-array-data v2, :array_1

    .line 10
    .line 11
    .line 12
    new-array v3, v0, [I

    .line 13
    .line 14
    fill-array-data v3, :array_2

    .line 15
    .line 16
    .line 17
    new-array v4, v0, [I

    .line 18
    .line 19
    fill-array-data v4, :array_3

    .line 20
    .line 21
    .line 22
    new-array v5, v0, [I

    .line 23
    .line 24
    fill-array-data v5, :array_4

    .line 25
    .line 26
    .line 27
    new-array v6, v0, [I

    .line 28
    .line 29
    fill-array-data v6, :array_5

    .line 30
    .line 31
    .line 32
    new-array v7, v0, [I

    .line 33
    .line 34
    fill-array-data v7, :array_6

    .line 35
    .line 36
    .line 37
    new-array v8, v0, [I

    .line 38
    .line 39
    fill-array-data v8, :array_7

    .line 40
    .line 41
    .line 42
    new-array v9, v0, [I

    .line 43
    .line 44
    fill-array-data v9, :array_8

    .line 45
    .line 46
    .line 47
    filled-new-array/range {v1 .. v9}, [[I

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    sput-object v0, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->ReverbCustomParams:[[I

    .line 52
    .line 53
    array-length v0, v0

    .line 54
    sput v0, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->effect_size:I

    .line 55
    .line 56
    const/4 v0, 0x0

    .line 57
    const/4 v1, 0x2

    .line 58
    filled-new-array {v0, v0, v0, v1, v1}, [I

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    filled-new-array {v0, v0, v0, v0, v0}, [I

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    const/4 v4, 0x3

    .line 67
    const/4 v5, 0x4

    .line 68
    const/4 v6, -0x3

    .line 69
    filled-new-array {v4, v5, v1, v0, v6}, [I

    .line 70
    .line 71
    .line 72
    move-result-object v5

    .line 73
    move v7, v4

    .line 74
    move-object v4, v5

    .line 75
    filled-new-array {v7, v1, v0, v0, v1}, [I

    .line 76
    .line 77
    .line 78
    move-result-object v5

    .line 79
    const/4 v8, -0x1

    .line 80
    filled-new-array {v7, v1, v0, v8, v6}, [I

    .line 81
    .line 82
    .line 83
    move-result-object v6

    .line 84
    move v8, v7

    .line 85
    filled-new-array {v1, v1, v1, v0, v0}, [I

    .line 86
    .line 87
    .line 88
    move-result-object v7

    .line 89
    const/4 v9, 0x5

    .line 90
    const/4 v10, -0x2

    .line 91
    const/4 v11, 0x1

    .line 92
    filled-new-array {v9, v1, v10, v11, v8}, [I

    .line 93
    .line 94
    .line 95
    move-result-object v8

    .line 96
    filled-new-array {v10, v0, v11, v1, v11}, [I

    .line 97
    .line 98
    .line 99
    move-result-object v9

    .line 100
    filled-new-array {v0, v0, v0, v0, v0}, [I

    .line 101
    .line 102
    .line 103
    move-result-object v10

    .line 104
    filled-new-array/range {v2 .. v10}, [[I

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    sput-object v0, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->EQCustomGain:[[I

    .line 109
    .line 110
    const/16 v0, 0x96

    .line 111
    .line 112
    const/16 v1, 0x7d0

    .line 113
    .line 114
    const/16 v2, 0xc80

    .line 115
    .line 116
    const/16 v3, 0x5dc

    .line 117
    .line 118
    filled-new-array {v2, v0, v3, v1}, [I

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    filled-new-array {v0}, [[I

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    sput-object v0, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->EchoCustomParams:[[I

    .line 127
    .line 128
    return-void

    .line 129
    :array_0
    .array-data 4
        0xc8
        0x3e8
        0x1f4
        0x1194
        0x3e8
        0x5dc
    .end array-data

    .line 130
    .line 131
    .line 132
    .line 133
    .line 134
    .line 135
    .line 136
    .line 137
    .line 138
    .line 139
    .line 140
    .line 141
    .line 142
    .line 143
    .line 144
    .line 145
    :array_1
    .array-data 4
        0x1388
        0x1194
        0x4b0
        0x1194
        0x1964
        0x4b0
    .end array-data

    .line 146
    .line 147
    .line 148
    .line 149
    .line 150
    .line 151
    .line 152
    .line 153
    .line 154
    .line 155
    .line 156
    .line 157
    .line 158
    .line 159
    .line 160
    .line 161
    :array_2
    .array-data 4
        0x1194
        0x1f40
        0x3e8
        0xfa0
        0x1964
        0x5dc
    .end array-data

    .line 162
    .line 163
    .line 164
    .line 165
    .line 166
    .line 167
    .line 168
    .line 169
    .line 170
    .line 171
    .line 172
    .line 173
    .line 174
    .line 175
    .line 176
    .line 177
    :array_3
    .array-data 4
        0x9c4
        0xbb8
        0x5dc
        0xfa0
        0x1388
        0x5dc
    .end array-data

    .line 178
    .line 179
    .line 180
    .line 181
    .line 182
    .line 183
    .line 184
    .line 185
    .line 186
    .line 187
    .line 188
    .line 189
    .line 190
    .line 191
    .line 192
    .line 193
    :array_4
    .array-data 4
        0xdac
        0x157c
        0x5dc
        0x1388
        0x157c
        0x5dc
    .end array-data

    .line 194
    .line 195
    .line 196
    .line 197
    .line 198
    .line 199
    .line 200
    .line 201
    .line 202
    .line 203
    .line 204
    .line 205
    .line 206
    .line 207
    .line 208
    .line 209
    :array_5
    .array-data 4
        0xfa0
        0xbb8
        0x3e8
        0x9c4
        0x157c
        0x4b0
    .end array-data

    .line 210
    .line 211
    .line 212
    .line 213
    .line 214
    .line 215
    .line 216
    .line 217
    .line 218
    .line 219
    .line 220
    .line 221
    .line 222
    .line 223
    .line 224
    .line 225
    :array_6
    .array-data 4
        0x1f4
        0x1388
        0x320
        0x1194
        0xbb8
        0x4b0
    .end array-data

    .line 226
    :array_7
    .array-data 4
        0x14
        0x1f4
        0x3c
        0x1194
        0x1388
        0x5dc
    .end array-data

    :array_8
    .array-data 4
        0x0
        0x0
        0x0
        0xfa0
        0x0
        0x4b0
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/Object;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->mParamLock:Ljava/lang/Object;

    .line 10
    .line 11
    iput-object p1, p0, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->mContext:Landroid/content/Context;

    .line 12
    .line 13
    const-string v0, "audio"

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    check-cast p1, Landroid/media/AudioManager;

    .line 20
    .line 21
    iput-object p1, p0, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->mAudioManager:Landroid/media/AudioManager;

    .line 22
    .line 23
    return-void
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->mVivoKTVHelper:Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->mVivoKTVHelper:Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;

    .line 11
    .line 12
    :cond_0
    sget-object p0, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->mVivoKTVHelper:Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;

    .line 13
    .line 14
    return-object p0
.end method

.method private getKTVParam(Ljava/lang/String;)I
    .locals 3

    .line 1
    sget-object v0, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "vivo"

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->mAudioManager:Landroid/media/AudioManager;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Landroid/media/AudioManager;->getParameters(Ljava/lang/String;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    new-instance v0, Ljava/util/StringTokenizer;

    .line 22
    .line 23
    const-string v1, "="

    .line 24
    .line 25
    invoke-direct {v0, p0, v1}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/util/StringTokenizer;->countTokens()I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    const/4 v2, 0x2

    .line 33
    if-eq v1, v2, :cond_0

    .line 34
    .line 35
    new-instance p1, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    const-string v0, "getKTVParam: malformated string "

    .line 38
    .line 39
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    const-string p1, "VivoKTVHelper"

    .line 50
    .line 51
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_0
    invoke-virtual {v0}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    if-eqz p0, :cond_1

    .line 64
    .line 65
    invoke-virtual {v0}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    return p0

    .line 78
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 79
    return p0
.end method

.method private setEQParams(I)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->mAudioManager:Landroid/media/AudioManager;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "vivo_ktv_miceq_band1="

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    sget-object v2, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->EQCustomGain:[[I

    .line 11
    .line 12
    aget-object v3, v2, p1

    .line 13
    .line 14
    const/4 v4, 0x0

    .line 15
    aget v3, v3, v4

    .line 16
    .line 17
    add-int/lit8 v3, v3, 0x8

    .line 18
    .line 19
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->setParameters(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->mAudioManager:Landroid/media/AudioManager;

    .line 30
    .line 31
    new-instance v1, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    const-string v3, "vivo_ktv_miceq_band2="

    .line 34
    .line 35
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    aget-object v3, v2, p1

    .line 39
    .line 40
    const/4 v4, 0x1

    .line 41
    aget v3, v3, v4

    .line 42
    .line 43
    add-int/lit8 v3, v3, 0x8

    .line 44
    .line 45
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->setParameters(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->mAudioManager:Landroid/media/AudioManager;

    .line 56
    .line 57
    new-instance v1, Ljava/lang/StringBuilder;

    .line 58
    .line 59
    const-string v3, "vivo_ktv_miceq_band3="

    .line 60
    .line 61
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    aget-object v3, v2, p1

    .line 65
    .line 66
    const/4 v4, 0x2

    .line 67
    aget v3, v3, v4

    .line 68
    .line 69
    add-int/lit8 v3, v3, 0x8

    .line 70
    .line 71
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->setParameters(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->mAudioManager:Landroid/media/AudioManager;

    .line 82
    .line 83
    new-instance v1, Ljava/lang/StringBuilder;

    .line 84
    .line 85
    const-string v3, "vivo_ktv_miceq_band4="

    .line 86
    .line 87
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    aget-object v3, v2, p1

    .line 91
    .line 92
    const/4 v4, 0x3

    .line 93
    aget v3, v3, v4

    .line 94
    .line 95
    add-int/lit8 v3, v3, 0x8

    .line 96
    .line 97
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->setParameters(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->mAudioManager:Landroid/media/AudioManager;

    .line 108
    .line 109
    new-instance v0, Ljava/lang/StringBuilder;

    .line 110
    .line 111
    const-string v1, "vivo_ktv_miceq_band5="

    .line 112
    .line 113
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    aget-object p1, v2, p1

    .line 117
    .line 118
    const/4 v1, 0x4

    .line 119
    aget p1, p1, v1

    .line 120
    .line 121
    add-int/lit8 p1, p1, 0x8

    .line 122
    .line 123
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    invoke-virtual {p0, p1}, Landroid/media/AudioManager;->setParameters(Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    return-void
.end method

.method private setEchoParams(I)V
    .locals 5

    .line 1
    const/4 v0, 0x4

    .line 2
    if-ne p1, v0, :cond_0

    .line 3
    .line 4
    iget-object p1, p0, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->mAudioManager:Landroid/media/AudioManager;

    .line 5
    .line 6
    const-string v0, "vivo_ktv_echo_enable=1"

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Landroid/media/AudioManager;->setParameters(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->mAudioManager:Landroid/media/AudioManager;

    .line 12
    .line 13
    new-instance v0, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v1, "vivo_ktv_echo_feedback="

    .line 16
    .line 17
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    sget-object v1, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->EchoCustomParams:[[I

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    aget-object v3, v1, v2

    .line 24
    .line 25
    aget v3, v3, v2

    .line 26
    .line 27
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {p1, v0}, Landroid/media/AudioManager;->setParameters(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->mAudioManager:Landroid/media/AudioManager;

    .line 38
    .line 39
    new-instance v0, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    const-string v3, "vivo_ktv_echo_delay="

    .line 42
    .line 43
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    aget-object v3, v1, v2

    .line 47
    .line 48
    const/4 v4, 0x1

    .line 49
    aget v3, v3, v4

    .line 50
    .line 51
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {p1, v0}, Landroid/media/AudioManager;->setParameters(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    iget-object p1, p0, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->mAudioManager:Landroid/media/AudioManager;

    .line 62
    .line 63
    new-instance v0, Ljava/lang/StringBuilder;

    .line 64
    .line 65
    const-string v3, "vivo_ktv_echo_wet="

    .line 66
    .line 67
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    aget-object v3, v1, v2

    .line 71
    .line 72
    const/4 v4, 0x2

    .line 73
    aget v3, v3, v4

    .line 74
    .line 75
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {p1, v0}, Landroid/media/AudioManager;->setParameters(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->mAudioManager:Landroid/media/AudioManager;

    .line 86
    .line 87
    new-instance p1, Ljava/lang/StringBuilder;

    .line 88
    .line 89
    const-string v0, "vivo_ktv_echo_dry="

    .line 90
    .line 91
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    aget-object v0, v1, v2

    .line 95
    .line 96
    const/4 v1, 0x3

    .line 97
    aget v0, v0, v1

    .line 98
    .line 99
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    invoke-virtual {p0, p1}, Landroid/media/AudioManager;->setParameters(Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    :cond_0
    return-void
.end method

.method private setGramophoneParams(I)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->mAudioManager:Landroid/media/AudioManager;

    .line 2
    .line 3
    const/4 v0, 0x7

    .line 4
    if-ne p1, v0, :cond_0

    .line 5
    .line 6
    const-string p1, "vivo_ktv_reverb_preset=4"

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Landroid/media/AudioManager;->setParameters(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    const-string p1, "vivo_ktv_reverb_preset=0"

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Landroid/media/AudioManager;->setParameters(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method private setReverbParams(I)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->mAudioManager:Landroid/media/AudioManager;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "vivo_ktv_rb_roomsize="

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    sget-object v2, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->ReverbCustomParams:[[I

    .line 11
    .line 12
    aget-object v3, v2, p1

    .line 13
    .line 14
    const/4 v4, 0x0

    .line 15
    aget v3, v3, v4

    .line 16
    .line 17
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->setParameters(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->mAudioManager:Landroid/media/AudioManager;

    .line 28
    .line 29
    new-instance v1, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    const-string v3, "vivo_ktv_rb_damp="

    .line 32
    .line 33
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    aget-object v3, v2, p1

    .line 37
    .line 38
    const/4 v4, 0x1

    .line 39
    aget v3, v3, v4

    .line 40
    .line 41
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->setParameters(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->mAudioManager:Landroid/media/AudioManager;

    .line 52
    .line 53
    new-instance v1, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    const-string v3, "vivo_ktv_rb_wet="

    .line 56
    .line 57
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    aget-object v3, v2, p1

    .line 61
    .line 62
    const/4 v4, 0x2

    .line 63
    aget v3, v3, v4

    .line 64
    .line 65
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->setParameters(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->mAudioManager:Landroid/media/AudioManager;

    .line 76
    .line 77
    new-instance v1, Ljava/lang/StringBuilder;

    .line 78
    .line 79
    const-string v3, "vivo_ktv_rb_dry="

    .line 80
    .line 81
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    aget-object v3, v2, p1

    .line 85
    .line 86
    const/4 v4, 0x3

    .line 87
    aget v3, v3, v4

    .line 88
    .line 89
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->setParameters(Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->mAudioManager:Landroid/media/AudioManager;

    .line 100
    .line 101
    new-instance v1, Ljava/lang/StringBuilder;

    .line 102
    .line 103
    const-string v3, "vivo_ktv_rb_width="

    .line 104
    .line 105
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    aget-object v3, v2, p1

    .line 109
    .line 110
    const/4 v4, 0x4

    .line 111
    aget v3, v3, v4

    .line 112
    .line 113
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->setParameters(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->mAudioManager:Landroid/media/AudioManager;

    .line 124
    .line 125
    new-instance v1, Ljava/lang/StringBuilder;

    .line 126
    .line 127
    const-string v3, "vivo_ktv_rb_gain="

    .line 128
    .line 129
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    aget-object p1, v2, p1

    .line 133
    .line 134
    const/4 v2, 0x5

    .line 135
    aget p1, p1, v2

    .line 136
    .line 137
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    invoke-virtual {v0, p1}, Landroid/media/AudioManager;->setParameters(Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->mAudioManager:Landroid/media/AudioManager;

    .line 148
    .line 149
    const-string p1, "vivo_ktv_echo_enable=0"

    .line 150
    .line 151
    invoke-virtual {p0, p1}, Landroid/media/AudioManager;->setParameters(Ljava/lang/String;)V

    .line 152
    .line 153
    .line 154
    return-void
.end method


# virtual methods
.method public closeKTVDevice()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->mAudioManager:Landroid/media/AudioManager;

    .line 2
    .line 3
    const-string v0, "vivo_ktv_mode=0"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/media/AudioManager;->setParameters(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public getEffectSize()I
    .locals 0

    .line 1
    sget p0, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->effect_size:I

    .line 2
    .line 3
    return p0
.end method

.method public getExtSpeakerParam()I
    .locals 1

    .line 1
    const-string v0, "vivo_ktv_ext_speaker"

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->getKTVParam(Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getMicTypeParam()I
    .locals 1

    .line 1
    const-string v0, "vivo_ktv_mic_type"

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->getKTVParam(Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getMicVolParam()I
    .locals 1

    .line 1
    const-string v0, "vivo_ktv_volume_mic"

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->getKTVParam(Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getPlayFeedbackParam()I
    .locals 1

    .line 1
    const-string v0, "vivo_ktv_play_source"

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->getKTVParam(Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getPreModeParam()I
    .locals 1

    .line 1
    const-string v0, "vivo_ktv_preset_effect"

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->getKTVParam(Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getVoiceOutParam()I
    .locals 1

    .line 1
    const-string v0, "vivo_ktv_rec_source"

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->getKTVParam(Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isDeviceSupportKaraoke()Z
    .locals 4

    .line 1
    sget-object v0, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "vivo"

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    if-eqz v0, :cond_2

    .line 15
    .line 16
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->mAudioManager:Landroid/media/AudioManager;

    .line 17
    .line 18
    const-string v0, "vivo_ktv_mic_type"

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Landroid/media/AudioManager;->getParameters(Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    new-instance v2, Ljava/util/StringTokenizer;

    .line 25
    .line 26
    const-string v3, "="

    .line 27
    .line 28
    invoke-direct {v2, p0, v3}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->countTokens()I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    const/4 v3, 0x2

    .line 36
    if-eq p0, v3, :cond_0

    .line 37
    .line 38
    return v1

    .line 39
    :cond_0
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-eqz p0, :cond_2

    .line 48
    .line 49
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    const/4 v0, 0x1

    .line 58
    if-eq p0, v0, :cond_1

    .line 59
    .line 60
    if-nez p0, :cond_2

    .line 61
    .line 62
    :cond_1
    return v0

    .line 63
    :cond_2
    return v1
.end method

.method public openKTVDevice()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->mAudioManager:Landroid/media/AudioManager;

    .line 2
    .line 3
    const-string v0, "vivo_ktv_mode=1"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/media/AudioManager;->setParameters(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setCustomMode(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->mParamLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/4 v1, 0x0

    .line 5
    :try_start_0
    invoke-virtual {p0, v1}, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->setExtSpeakerParam(I)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0, p1}, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->setGramophoneParams(I)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0, p1}, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->setReverbParams(I)V

    .line 12
    .line 13
    .line 14
    invoke-direct {p0, p1}, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->setEQParams(I)V

    .line 15
    .line 16
    .line 17
    invoke-direct {p0, p1}, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->setEchoParams(I)V

    .line 18
    .line 19
    .line 20
    monitor-exit v0

    .line 21
    return-void

    .line 22
    :catchall_0
    move-exception p0

    .line 23
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    throw p0
.end method

.method public setExtSpeakerParam(I)V
    .locals 3

    .line 1
    const-string v0, "vivo_ktv_ext_speaker="

    .line 2
    .line 3
    iget-object v1, p0, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->mParamLock:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    :try_start_0
    iget-object v2, p0, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->mAudioManager:Landroid/media/AudioManager;

    .line 7
    .line 8
    if-eqz v2, :cond_0

    .line 9
    .line 10
    new-instance v2, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->mAudioManager:Landroid/media/AudioManager;

    .line 19
    .line 20
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p0, p1}, Landroid/media/AudioManager;->setParameters(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :catchall_0
    move-exception p0

    .line 29
    goto :goto_1

    .line 30
    :cond_0
    :goto_0
    monitor-exit v1

    .line 31
    return-void

    .line 32
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    throw p0
.end method

.method public setMicVolParam(I)V
    .locals 3

    .line 1
    const-string v0, "vivo_ktv_volume_mic="

    .line 2
    .line 3
    iget-object v1, p0, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->mParamLock:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    :try_start_0
    iget-object v2, p0, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->mAudioManager:Landroid/media/AudioManager;

    .line 7
    .line 8
    if-eqz v2, :cond_0

    .line 9
    .line 10
    new-instance v2, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->mAudioManager:Landroid/media/AudioManager;

    .line 19
    .line 20
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p0, p1}, Landroid/media/AudioManager;->setParameters(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :catchall_0
    move-exception p0

    .line 29
    goto :goto_1

    .line 30
    :cond_0
    :goto_0
    monitor-exit v1

    .line 31
    return-void

    .line 32
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    throw p0
.end method

.method public setPlayFeedbackParam(I)V
    .locals 3

    .line 1
    const-string v0, "vivo_ktv_play_source="

    .line 2
    .line 3
    iget-object v1, p0, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->mParamLock:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    :try_start_0
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->mAudioManager:Landroid/media/AudioManager;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    new-instance v2, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p0, p1}, Landroid/media/AudioManager;->setParameters(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :catchall_0
    move-exception p0

    .line 27
    goto :goto_1

    .line 28
    :cond_0
    :goto_0
    monitor-exit v1

    .line 29
    return-void

    .line 30
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    throw p0
.end method

.method public setVoiceOutParam(I)V
    .locals 3

    .line 1
    const-string v0, "vivo_ktv_rec_source="

    .line 2
    .line 3
    iget-object v1, p0, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->mParamLock:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    :try_start_0
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/device/VivoKTVHelper;->mAudioManager:Landroid/media/AudioManager;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    new-instance v2, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p0, p1}, Landroid/media/AudioManager;->setParameters(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :catchall_0
    move-exception p0

    .line 27
    goto :goto_1

    .line 28
    :cond_0
    :goto_0
    monitor-exit v1

    .line 29
    return-void

    .line 30
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    throw p0
.end method
