.class public Lcom/immomo/mediacore/audio/AudioProcess;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/immomo/mediacore/audio/AudioNcDynamic$AudioNcDynamicCallBack;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/mediacore/audio/AudioProcess$AudioProcessRunnable;
    }
.end annotation


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "AudioProcess"

.field private static volatile mIsLibLoaded:Z

.field private static volatile mIsNativeInitialized:Z

.field private static volatile mIsSabineLibLoaded:Z

.field private static sLocalLibLoader:Ll/wfm;


# instance fields
.field private final DENOISE_MODE:I

.field private final EQ_MODE:I

.field private final FEMALE_PITCH:I

.field private final FINISH_ID:I

.field private final GIFT_ROBOOT:I

.field private final MALE_PITCH:I

.field private final MINIONS:I

.field private final MIX_PROCESS:I

.field private final REVERB_DEPTH:I

.field private final REVERB_ECHO:I

.field private final REVERB_GAIN:I

.field private final REVERB_MODE:I

.field private final REVERB_VALUE:I

.field private final WAWA_PITCH:I

.field private mAudioFrames:Ljava/util/concurrent/LinkedBlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/LinkedBlockingQueue<",
            "Ll/oxd0;",
            ">;"
        }
    .end annotation
.end field

.field private mAudioProcessRunnable:Lcom/immomo/mediacore/audio/AudioProcess$AudioProcessRunnable;

.field private mAudioProcessThread:Ljava/lang/Thread;

.field private mChannal:I

.field private mElcEffect:Lcom/immomo/audioeffect/AudioEffect;

.field private mEnableAef:Z

.field private mEnableEQ:Z

.field private mEnableElcTune:Z

.field private mEnableTune:Z

.field private mFs:I

.field private mHavaRelease:Z

.field private mIgnoreSabine:Z

.field private mLenMs:I

.field private mMasterAudioLecel:F

.field private mMasterGain:F

.field private mMuteFilterEnable:Z

.field public mNativeAudioProcess:J

.field private mOpenSabineEf:Z

.field private mOutPutFrames:Ljava/util/concurrent/LinkedBlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/LinkedBlockingQueue<",
            "Ll/oxd0;",
            ">;"
        }
    .end annotation
.end field

.field private mParams_Aef:Lcom/immomo/mediacore/audio/Ctrl_Params_Eq;

.field private mParams_Eq:Lcom/immomo/mediacore/audio/Ctrl_Params_Eq;

.field private mParams_Tune:Lcom/immomo/mediacore/audio/Ctrl_Params_Tune;

.field private mProcessMethod:I

.field private volatile mProcessing:Z

.field private mSabineSdk:Lcom/momo/sabine/sabineSdk;

.field private mSabineSplitSwitch:Z

.field private mSlaveAudioLecel:F

.field private mSlaveGain:F

.field private mSurroundFrames:Ljava/util/concurrent/LinkedBlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/LinkedBlockingQueue<",
            "Ll/oxd0;",
            ">;"
        }
    .end annotation
.end field

.field private mSurroundFrames_Extra:Ljava/util/concurrent/LinkedBlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/LinkedBlockingQueue<",
            "Ll/oxd0;",
            ">;"
        }
    .end annotation
.end field

.field private mSurroundFrames_Extra2:Ljava/util/concurrent/LinkedBlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/LinkedBlockingQueue<",
            "Ll/oxd0;",
            ">;"
        }
    .end annotation
.end field

.field private mSync:Ljava/lang/Object;

.field mUnifiedGain:D

.field private final mUseAudioProcess:Z

.field private mUseSoxEffect:Z

.field private preDenoise:F

.field private preInIdx:I

.field private useSabin:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/immomo/mediacore/audio/AudioProcess$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/immomo/mediacore/audio/AudioProcess$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/immomo/mediacore/audio/AudioProcess;->sLocalLibLoader:Ll/wfm;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 8

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->MIX_PROCESS:I

    .line 6
    .line 7
    const/16 v1, -0x3039

    .line 8
    .line 9
    iput v1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->FINISH_ID:I

    .line 10
    .line 11
    new-instance v1, Ljava/util/concurrent/LinkedBlockingQueue;

    .line 12
    .line 13
    invoke-direct {v1}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mAudioFrames:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 17
    .line 18
    new-instance v1, Ljava/util/concurrent/LinkedBlockingQueue;

    .line 19
    .line 20
    invoke-direct {v1}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSurroundFrames:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 24
    .line 25
    new-instance v1, Ljava/util/concurrent/LinkedBlockingQueue;

    .line 26
    .line 27
    invoke-direct {v1}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mOutPutFrames:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 31
    .line 32
    new-instance v1, Ljava/util/concurrent/LinkedBlockingQueue;

    .line 33
    .line 34
    invoke-direct {v1}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object v1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSurroundFrames_Extra:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 38
    .line 39
    new-instance v1, Ljava/util/concurrent/LinkedBlockingQueue;

    .line 40
    .line 41
    invoke-direct {v1}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object v1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSurroundFrames_Extra2:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 45
    .line 46
    const/4 v1, 0x0

    .line 47
    iput v1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mProcessMethod:I

    .line 48
    .line 49
    new-instance v2, Lcom/immomo/mediacore/audio/AudioProcess$AudioProcessRunnable;

    .line 50
    .line 51
    const/4 v3, 0x0

    .line 52
    invoke-direct {v2, p0, v3}, Lcom/immomo/mediacore/audio/AudioProcess$AudioProcessRunnable;-><init>(Lcom/immomo/mediacore/audio/AudioProcess;Lcom/immomo/mediacore/audio/AudioProcess$1;)V

    .line 53
    .line 54
    .line 55
    iput-object v2, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mAudioProcessRunnable:Lcom/immomo/mediacore/audio/AudioProcess$AudioProcessRunnable;

    .line 56
    .line 57
    iput-object v3, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mAudioProcessThread:Ljava/lang/Thread;

    .line 58
    .line 59
    const/high16 v2, 0x3f800000    # 1.0f

    .line 60
    .line 61
    iput v2, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mMasterAudioLecel:F

    .line 62
    .line 63
    iput v2, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSlaveAudioLecel:F

    .line 64
    .line 65
    iput v2, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mMasterGain:F

    .line 66
    .line 67
    const v2, 0x3f333333    # 0.7f

    .line 68
    .line 69
    .line 70
    iput v2, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSlaveGain:F

    .line 71
    .line 72
    const-wide/high16 v4, 0x4000000000000000L    # 2.0

    .line 73
    .line 74
    invoke-static {v4, v5}, Ljava/lang/Math;->sqrt(D)D

    .line 75
    .line 76
    .line 77
    move-result-wide v6

    .line 78
    div-double/2addr v6, v4

    .line 79
    iput-wide v6, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mUnifiedGain:D

    .line 80
    .line 81
    const-wide/16 v4, 0x0

    .line 82
    .line 83
    iput-wide v4, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mNativeAudioProcess:J

    .line 84
    .line 85
    new-instance v2, Lcom/immomo/mediacore/audio/Ctrl_Params_Eq;

    .line 86
    .line 87
    invoke-direct {v2}, Lcom/immomo/mediacore/audio/Ctrl_Params_Eq;-><init>()V

    .line 88
    .line 89
    .line 90
    iput-object v2, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mParams_Eq:Lcom/immomo/mediacore/audio/Ctrl_Params_Eq;

    .line 91
    .line 92
    new-instance v2, Lcom/immomo/mediacore/audio/Ctrl_Params_Eq;

    .line 93
    .line 94
    invoke-direct {v2}, Lcom/immomo/mediacore/audio/Ctrl_Params_Eq;-><init>()V

    .line 95
    .line 96
    .line 97
    iput-object v2, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mParams_Aef:Lcom/immomo/mediacore/audio/Ctrl_Params_Eq;

    .line 98
    .line 99
    new-instance v2, Lcom/immomo/mediacore/audio/Ctrl_Params_Tune;

    .line 100
    .line 101
    invoke-direct {v2}, Lcom/immomo/mediacore/audio/Ctrl_Params_Tune;-><init>()V

    .line 102
    .line 103
    .line 104
    iput-object v2, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mParams_Tune:Lcom/immomo/mediacore/audio/Ctrl_Params_Tune;

    .line 105
    .line 106
    iput-boolean v1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mEnableEQ:Z

    .line 107
    .line 108
    iput-boolean v1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mEnableTune:Z

    .line 109
    .line 110
    iput-boolean v1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mEnableAef:Z

    .line 111
    .line 112
    iput-boolean v1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mOpenSabineEf:Z

    .line 113
    .line 114
    iput-boolean v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mIgnoreSabine:Z

    .line 115
    .line 116
    iput v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->DENOISE_MODE:I

    .line 117
    .line 118
    const/4 v2, 0x2

    .line 119
    iput v2, p0, Lcom/immomo/mediacore/audio/AudioProcess;->REVERB_MODE:I

    .line 120
    .line 121
    const/4 v4, 0x3

    .line 122
    iput v4, p0, Lcom/immomo/mediacore/audio/AudioProcess;->EQ_MODE:I

    .line 123
    .line 124
    iput v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->REVERB_VALUE:I

    .line 125
    .line 126
    iput v2, p0, Lcom/immomo/mediacore/audio/AudioProcess;->REVERB_DEPTH:I

    .line 127
    .line 128
    iput v4, p0, Lcom/immomo/mediacore/audio/AudioProcess;->REVERB_GAIN:I

    .line 129
    .line 130
    const/4 v4, 0x4

    .line 131
    iput v4, p0, Lcom/immomo/mediacore/audio/AudioProcess;->REVERB_ECHO:I

    .line 132
    .line 133
    iput-boolean v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mUseAudioProcess:Z

    .line 134
    .line 135
    iput-boolean v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mHavaRelease:Z

    .line 136
    .line 137
    new-instance v4, Ljava/lang/Object;

    .line 138
    .line 139
    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    .line 140
    .line 141
    .line 142
    iput-object v4, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSync:Ljava/lang/Object;

    .line 143
    .line 144
    const v4, 0xac44

    .line 145
    .line 146
    .line 147
    iput v4, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mFs:I

    .line 148
    .line 149
    iput v2, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mChannal:I

    .line 150
    .line 151
    const/16 v4, 0x400

    .line 152
    .line 153
    iput v4, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mLenMs:I

    .line 154
    .line 155
    iput-object v3, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSabineSdk:Lcom/momo/sabine/sabineSdk;

    .line 156
    .line 157
    iput-boolean v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSabineSplitSwitch:Z

    .line 158
    .line 159
    iput-boolean v1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mEnableElcTune:Z

    .line 160
    .line 161
    iput-object v3, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mElcEffect:Lcom/immomo/audioeffect/AudioEffect;

    .line 162
    .line 163
    iput-boolean v1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mMuteFilterEnable:Z

    .line 164
    .line 165
    iput-boolean v1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mUseSoxEffect:Z

    .line 166
    .line 167
    const v0, 0x3dcccccd    # 0.1f

    .line 168
    .line 169
    .line 170
    iput v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->preDenoise:F

    .line 171
    .line 172
    iput v2, p0, Lcom/immomo/mediacore/audio/AudioProcess;->preInIdx:I

    .line 173
    .line 174
    iput-boolean v1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->useSabin:Z

    .line 175
    .line 176
    iput-boolean v1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mProcessing:Z

    .line 177
    .line 178
    const/4 v0, -0x4

    .line 179
    iput v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->MALE_PITCH:I

    .line 180
    .line 181
    const/4 v2, 0x6

    .line 182
    iput v2, p0, Lcom/immomo/mediacore/audio/AudioProcess;->FEMALE_PITCH:I

    .line 183
    .line 184
    const/16 v2, 0x9

    .line 185
    .line 186
    iput v2, p0, Lcom/immomo/mediacore/audio/AudioProcess;->WAWA_PITCH:I

    .line 187
    .line 188
    const/4 v2, 0x7

    .line 189
    iput v2, p0, Lcom/immomo/mediacore/audio/AudioProcess;->MINIONS:I

    .line 190
    .line 191
    iput v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->GIFT_ROBOOT:I

    .line 192
    .line 193
    invoke-static {v3}, Ll/la;->b(Ll/wfm;)V

    .line 194
    .line 195
    .line 196
    invoke-static {}, Lcom/immomo/mediacore/audio/AudioProcess;->initNativeOnce()V

    .line 197
    .line 198
    .line 199
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 200
    .line 201
    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 202
    .line 203
    .line 204
    invoke-direct {p0, v0}, Lcom/immomo/mediacore/audio/AudioProcess;->processsound_native_setup(Ljava/lang/Object;)V

    .line 205
    .line 206
    .line 207
    iput-boolean v1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mOpenSabineEf:Z

    .line 208
    .line 209
    iget-boolean v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSabineSplitSwitch:Z

    .line 210
    .line 211
    if-eqz v0, :cond_1

    .line 212
    .line 213
    iget-object v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSabineSdk:Lcom/momo/sabine/sabineSdk;

    .line 214
    .line 215
    if-nez v0, :cond_0

    .line 216
    .line 217
    new-instance v0, Lcom/momo/sabine/sabineSdk;

    .line 218
    .line 219
    invoke-direct {v0}, Lcom/momo/sabine/sabineSdk;-><init>()V

    .line 220
    .line 221
    .line 222
    iput-object v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSabineSdk:Lcom/momo/sabine/sabineSdk;

    .line 223
    .line 224
    :cond_0
    iget-object v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSabineSdk:Lcom/momo/sabine/sabineSdk;

    .line 225
    .line 226
    if-eqz v0, :cond_2

    .line 227
    .line 228
    invoke-virtual {v0}, Lcom/momo/sabine/sabineSdk;->getSabineLoadedStaus()Z

    .line 229
    .line 230
    .line 231
    move-result v0

    .line 232
    sput-boolean v0, Lcom/immomo/mediacore/audio/AudioProcess;->mIsSabineLibLoaded:Z

    .line 233
    .line 234
    sget-boolean v0, Lcom/immomo/mediacore/audio/AudioProcess;->mIsSabineLibLoaded:Z

    .line 235
    .line 236
    if-nez v0, :cond_2

    .line 237
    .line 238
    iput-object v3, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSabineSdk:Lcom/momo/sabine/sabineSdk;

    .line 239
    .line 240
    goto :goto_0

    .line 241
    :cond_1
    sget-boolean v0, Lcom/immomo/mediacore/audio/AudioProcess;->mIsLibLoaded:Z

    .line 242
    .line 243
    sput-boolean v0, Lcom/immomo/mediacore/audio/AudioProcess;->mIsSabineLibLoaded:Z

    .line 244
    .line 245
    :cond_2
    :goto_0
    invoke-virtual {p0}, Lcom/immomo/mediacore/audio/AudioProcess;->SabineEffectReset()V

    .line 246
    .line 247
    .line 248
    return-void
.end method

.method public static synthetic access$100(Lcom/immomo/mediacore/audio/AudioProcess;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mProcessing:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$102(Lcom/immomo/mediacore/audio/AudioProcess;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mProcessing:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$200(Lcom/immomo/mediacore/audio/AudioProcess;)Ljava/util/concurrent/LinkedBlockingQueue;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mAudioFrames:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$300(Lcom/immomo/mediacore/audio/AudioProcess;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mMasterGain:F

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$400(Lcom/immomo/mediacore/audio/AudioProcess;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mMasterAudioLecel:F

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$500(Lcom/immomo/mediacore/audio/AudioProcess;)Ljava/util/concurrent/LinkedBlockingQueue;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mOutPutFrames:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 2
    .line 3
    return-object p0
.end method

.method private byteToShortArray([BI)[S
    .locals 3

    .line 1
    new-array p0, p2, [S

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    :goto_0
    if-ge v0, p2, :cond_0

    .line 5
    .line 6
    mul-int/lit8 v1, v0, 0x2

    .line 7
    .line 8
    aget-byte v2, p1, v1

    .line 9
    .line 10
    and-int/lit16 v2, v2, 0xff

    .line 11
    .line 12
    add-int/lit8 v1, v1, 0x1

    .line 13
    .line 14
    aget-byte v1, p1, v1

    .line 15
    .line 16
    and-int/lit16 v1, v1, 0xff

    .line 17
    .line 18
    shl-int/lit8 v1, v1, 0x8

    .line 19
    .line 20
    or-int/2addr v1, v2

    .line 21
    int-to-short v1, v1

    .line 22
    aput-short v1, p0, v0

    .line 23
    .line 24
    add-int/lit8 v0, v0, 0x1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    return-object p0
.end method

.method private static initNativeOnce()V
    .locals 2

    .line 1
    const-class v0, Lcom/immomo/mediacore/audio/AudioProcess;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-boolean v1, Lcom/immomo/mediacore/audio/AudioProcess;->mIsNativeInitialized:Z

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    sget-boolean v1, Lcom/immomo/mediacore/audio/AudioProcess;->mIsLibLoaded:Z

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-static {}, Lcom/immomo/mediacore/audio/AudioProcess;->native_init()V

    .line 13
    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    sput-boolean v1, Lcom/immomo/mediacore/audio/AudioProcess;->mIsNativeInitialized:Z

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :catchall_0
    move-exception v1

    .line 20
    goto :goto_1

    .line 21
    :cond_0
    :goto_0
    monitor-exit v0

    .line 22
    return-void

    .line 23
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    throw v1
.end method

.method private static loadLibrariesOnce(Ll/wfm;)V
    .locals 4

    .line 1
    const-class v0, Lcom/immomo/mediacore/audio/AudioProcess;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-boolean v1, Lcom/immomo/mediacore/audio/AudioProcess;->mIsLibLoaded:Z

    .line 5
    .line 6
    if-nez v1, :cond_1

    .line 7
    .line 8
    if-nez p0, :cond_0

    .line 9
    .line 10
    sget-object p0, Lcom/immomo/mediacore/audio/AudioProcess;->sLocalLibLoader:Ll/wfm;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :catchall_0
    move-exception p0

    .line 14
    goto :goto_2

    .line 15
    :cond_0
    :goto_0
    const/4 v1, 0x0

    .line 16
    :try_start_1
    const-string v2, "AudioProcess"

    .line 17
    .line 18
    const-string v3, "load so start"

    .line 19
    .line 20
    invoke-static {v2, v3}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    const-string v2, "ijkaudioprocess"

    .line 24
    .line 25
    invoke-interface {p0, v2}, Ll/wfm;->loadLibrary(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    const/4 p0, 0x1

    .line 29
    sput-boolean p0, Lcom/immomo/mediacore/audio/AudioProcess;->mIsLibLoaded:Z

    .line 30
    .line 31
    const-string p0, "AudioProcess"

    .line 32
    .line 33
    const-string v2, "load so success"

    .line 34
    .line 35
    invoke-static {p0, v2}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Error; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 36
    .line 37
    .line 38
    :try_start_2
    monitor-exit v0

    .line 39
    return-void

    .line 40
    :catch_0
    sput-boolean v1, Lcom/immomo/mediacore/audio/AudioProcess;->mIsLibLoaded:Z

    .line 41
    .line 42
    goto :goto_1

    .line 43
    :catch_1
    sput-boolean v1, Lcom/immomo/mediacore/audio/AudioProcess;->mIsLibLoaded:Z

    .line 44
    .line 45
    :goto_1
    const-string p0, "AudioProcess"

    .line 46
    .line 47
    const-string v1, "load so failed"

    .line 48
    .line 49
    invoke-static {p0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 50
    .line 51
    .line 52
    monitor-exit v0

    .line 53
    return-void

    .line 54
    :cond_1
    const-string p0, "AudioProcess"

    .line 55
    .line 56
    const-string v1, "load so already"

    .line 57
    .line 58
    invoke-static {p0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    .line 60
    .line 61
    monitor-exit v0

    .line 62
    return-void

    .line 63
    :goto_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 64
    throw p0
.end method

.method private static final native native_init()V
.end method

.method private native native_release()V
.end method

.method private final native native_setup(Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation
.end method

.method private openSabineEfHandle()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mOpenSabineEf:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    :try_start_0
    sget-boolean v0, Lcom/immomo/mediacore/audio/AudioProcess;->mIsSabineLibLoaded:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mFs:I

    .line 10
    .line 11
    iget v1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mChannal:I

    .line 12
    .line 13
    iget v2, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mLenMs:I

    .line 14
    .line 15
    invoke-direct {p0, v0, v1, v2}, Lcom/immomo/mediacore/audio/AudioProcess;->processsound_opensabineef_H(III)V

    .line 16
    .line 17
    .line 18
    :cond_0
    const/4 v0, 0x1

    .line 19
    iput-boolean v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mOpenSabineEf:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    .line 21
    :catch_0
    :cond_1
    return-void
.end method

.method private native processsound_aef(Ljava/nio/ByteBuffer;ILjava/lang/Object;Ljava/nio/ByteBuffer;)V
.end method

.method private processsound_aef_H(Ljava/nio/ByteBuffer;ILjava/lang/Object;Ljava/nio/ByteBuffer;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-boolean v1, Lcom/immomo/mediacore/audio/AudioProcess;->mIsLibLoaded:Z

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    iget-boolean v1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mHavaRelease:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    :try_start_1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/immomo/mediacore/audio/AudioProcess;->processsound_aef(Ljava/nio/ByteBuffer;ILjava/lang/Object;Ljava/nio/ByteBuffer;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception p0

    .line 17
    goto :goto_1

    .line 18
    :catch_0
    :cond_0
    :goto_0
    :try_start_2
    monitor-exit v0

    .line 19
    return-void

    .line 20
    :goto_1
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 21
    throw p0
.end method

.method private native processsound_ans(Ljava/nio/ByteBuffer;ILjava/lang/Object;)V
.end method

.method private processsound_ans_H(Ljava/nio/ByteBuffer;ILjava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-boolean v1, Lcom/immomo/mediacore/audio/AudioProcess;->mIsLibLoaded:Z

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    iget-boolean v1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mHavaRelease:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    :try_start_1
    invoke-direct {p0, p1, p2, p3}, Lcom/immomo/mediacore/audio/AudioProcess;->processsound_ans(Ljava/nio/ByteBuffer;ILjava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception p0

    .line 17
    goto :goto_1

    .line 18
    :catch_0
    :cond_0
    :goto_0
    :try_start_2
    monitor-exit v0

    .line 19
    return-void

    .line 20
    :goto_1
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 21
    throw p0
.end method

.method private native processsound_eq(Ljava/nio/ByteBuffer;ILjava/lang/Object;Ljava/nio/ByteBuffer;)V
.end method

.method private processsound_eq_H(Ljava/nio/ByteBuffer;ILjava/lang/Object;Ljava/nio/ByteBuffer;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-boolean v1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mHavaRelease:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    :try_start_1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/immomo/mediacore/audio/AudioProcess;->processsound_eq(Ljava/nio/ByteBuffer;ILjava/lang/Object;Ljava/nio/ByteBuffer;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :catchall_0
    move-exception p0

    .line 13
    goto :goto_1

    .line 14
    :catch_0
    :cond_0
    :goto_0
    :try_start_2
    monitor-exit v0

    .line 15
    return-void

    .line 16
    :goto_1
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 17
    throw p0
.end method

.method private native processsound_mix(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;)V
.end method

.method private processsound_mix_H(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-boolean v1, Lcom/immomo/mediacore/audio/AudioProcess;->mIsLibLoaded:Z

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    iget-boolean v1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mHavaRelease:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    :try_start_1
    invoke-direct {p0, p1, p2, p3}, Lcom/immomo/mediacore/audio/AudioProcess;->processsound_mix(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception p0

    .line 17
    goto :goto_1

    .line 18
    :catch_0
    :cond_0
    :goto_0
    :try_start_2
    monitor-exit v0

    .line 19
    return-void

    .line 20
    :goto_1
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 21
    throw p0
.end method

.method private final processsound_native_release()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-boolean v1, Lcom/immomo/mediacore/audio/AudioProcess;->mIsLibLoaded:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    .line 6
    if-eqz v1, :cond_1

    .line 7
    .line 8
    :try_start_1
    iget-boolean v1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSabineSplitSwitch:Z

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    sget-boolean v1, Lcom/immomo/mediacore/audio/AudioProcess;->mIsSabineLibLoaded:Z

    .line 13
    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    iget-object v1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSabineSdk:Lcom/momo/sabine/sabineSdk;

    .line 17
    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    invoke-virtual {v1}, Lcom/momo/sabine/sabineSdk;->sabineClose()V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :catchall_0
    move-exception p0

    .line 25
    goto :goto_1

    .line 26
    :cond_0
    :goto_0
    invoke-direct {p0}, Lcom/immomo/mediacore/audio/AudioProcess;->native_release()V

    .line 27
    .line 28
    .line 29
    const/4 v1, 0x1

    .line 30
    iput-boolean v1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mHavaRelease:Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 31
    .line 32
    :catch_0
    :cond_1
    :try_start_2
    monitor-exit v0

    .line 33
    return-void

    .line 34
    :goto_1
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 35
    throw p0
.end method

.method private final processsound_native_setup(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-boolean v1, Lcom/immomo/mediacore/audio/AudioProcess;->mIsLibLoaded:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    :try_start_1
    invoke-direct {p0, p1}, Lcom/immomo/mediacore/audio/AudioProcess;->native_setup(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput-boolean p1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mHavaRelease:Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :catchall_0
    move-exception p0

    .line 16
    goto :goto_1

    .line 17
    :catch_0
    :cond_0
    :goto_0
    :try_start_2
    monitor-exit v0

    .line 18
    return-void

    .line 19
    :goto_1
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 20
    throw p0
.end method

.method private native processsound_opensabineef(III)V
.end method

.method private processsound_opensabineef_H(III)V
    .locals 4

    .line 1
    const-string v0, "open:samplerate="

    .line 2
    .line 3
    iget-object v1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSync:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    :try_start_0
    iget-boolean v2, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mHavaRelease:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    .line 8
    if-nez v2, :cond_2

    .line 9
    .line 10
    :try_start_1
    const-string v2, "AudioProcess"

    .line 11
    .line 12
    new-instance v3, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string v0, ";chanal="

    .line 21
    .line 22
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string v0, ";framLenMs="

    .line 29
    .line 30
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string v0, ";mSabineSdk="

    .line 37
    .line 38
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSabineSdk:Lcom/momo/sabine/sabineSdk;

    .line 42
    .line 43
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-static {v2, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 51
    .line 52
    .line 53
    iget-boolean v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSabineSplitSwitch:Z

    .line 54
    .line 55
    if-nez v0, :cond_0

    .line 56
    .line 57
    invoke-direct {p0, p1, p2, p3}, Lcom/immomo/mediacore/audio/AudioProcess;->processsound_opensabineef(III)V

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :catchall_0
    move-exception p0

    .line 62
    goto :goto_1

    .line 63
    :cond_0
    iget-object v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSabineSdk:Lcom/momo/sabine/sabineSdk;

    .line 64
    .line 65
    if-eqz v0, :cond_1

    .line 66
    .line 67
    invoke-virtual {v0, p1, p2, p3}, Lcom/momo/sabine/sabineSdk;->sabineOpen(III)V

    .line 68
    .line 69
    .line 70
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSabineSdk:Lcom/momo/sabine/sabineSdk;

    .line 71
    .line 72
    invoke-virtual {p0}, Lcom/momo/sabine/sabineSdk;->SabineEffectReset_ex()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 73
    .line 74
    .line 75
    :catch_0
    :cond_2
    :try_start_2
    monitor-exit v1

    .line 76
    return-void

    .line 77
    :goto_1
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 78
    throw p0
.end method

.method private native processsound_sabineef(Ljava/nio/ByteBuffer;ILjava/lang/Object;)V
.end method

.method private processsound_sabineef_H(Ljava/nio/ByteBuffer;ILjava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-boolean v1, Lcom/immomo/mediacore/audio/AudioProcess;->mIsSabineLibLoaded:Z

    .line 5
    .line 6
    if-eqz v1, :cond_1

    .line 7
    .line 8
    iget-boolean v1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mHavaRelease:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    .line 10
    if-nez v1, :cond_1

    .line 11
    .line 12
    :try_start_1
    iget-boolean v1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSabineSplitSwitch:Z

    .line 13
    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    invoke-direct {p0, p1, p2, p3}, Lcom/immomo/mediacore/audio/AudioProcess;->processsound_sabineef(Ljava/nio/ByteBuffer;ILjava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception p0

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    iget-object p0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSabineSdk:Lcom/momo/sabine/sabineSdk;

    .line 23
    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0, p1, p2, p3}, Lcom/momo/sabine/sabineSdk;->sabineEff(Ljava/nio/ByteBuffer;ILjava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 27
    .line 28
    .line 29
    :catch_0
    :cond_1
    :goto_0
    :try_start_2
    monitor-exit v0

    .line 30
    return-void

    .line 31
    :goto_1
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 32
    throw p0
.end method

.method private native processsound_sabineeffectreset()V
.end method

.method private processsound_sabineeffectreset_H()V
    .locals 4

    .line 1
    const-string v0, "reset;mSabineSdk="

    .line 2
    .line 3
    iget-object v1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSync:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    :try_start_0
    sget-boolean v2, Lcom/immomo/mediacore/audio/AudioProcess;->mIsSabineLibLoaded:Z

    .line 7
    .line 8
    if-eqz v2, :cond_1

    .line 9
    .line 10
    iget-boolean v2, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mHavaRelease:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    if-nez v2, :cond_1

    .line 13
    .line 14
    :try_start_1
    const-string v2, "AudioProcess"

    .line 15
    .line 16
    new-instance v3, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSabineSdk:Lcom/momo/sabine/sabineSdk;

    .line 22
    .line 23
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-static {v2, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    iget-boolean v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSabineSplitSwitch:Z

    .line 34
    .line 35
    if-nez v0, :cond_0

    .line 36
    .line 37
    invoke-direct {p0}, Lcom/immomo/mediacore/audio/AudioProcess;->processsound_sabineeffectreset()V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :catchall_0
    move-exception p0

    .line 42
    goto :goto_1

    .line 43
    :cond_0
    iget-object p0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSabineSdk:Lcom/momo/sabine/sabineSdk;

    .line 44
    .line 45
    if-eqz p0, :cond_1

    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/momo/sabine/sabineSdk;->sabineReset()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 48
    .line 49
    .line 50
    :catch_0
    :cond_1
    :goto_0
    :try_start_2
    monitor-exit v1

    .line 51
    return-void

    .line 52
    :goto_1
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 53
    throw p0
.end method

.method private native processsound_sabineeffectset(IIF)V
.end method

.method private processsound_sabineeffectset_H(IIF)V
    .locals 4

    .line 1
    const-string v0, "set:nMode="

    .line 2
    .line 3
    iget-object v1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSync:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    :try_start_0
    sget-boolean v2, Lcom/immomo/mediacore/audio/AudioProcess;->mIsSabineLibLoaded:Z

    .line 7
    .line 8
    if-eqz v2, :cond_1

    .line 9
    .line 10
    iget-boolean v2, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mHavaRelease:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    if-nez v2, :cond_1

    .line 13
    .line 14
    :try_start_1
    const-string v2, "AudioProcess"

    .line 15
    .line 16
    new-instance v3, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string v0, ";inIdx="

    .line 25
    .line 26
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    const-string v0, ";inValue="

    .line 33
    .line 34
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string v0, ";mSabineSdk="

    .line 41
    .line 42
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSabineSdk:Lcom/momo/sabine/sabineSdk;

    .line 46
    .line 47
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-static {v2, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    iget-boolean v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSabineSplitSwitch:Z

    .line 58
    .line 59
    if-nez v0, :cond_0

    .line 60
    .line 61
    invoke-direct {p0, p1, p2, p3}, Lcom/immomo/mediacore/audio/AudioProcess;->processsound_sabineeffectset(IIF)V

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :catchall_0
    move-exception p0

    .line 66
    goto :goto_1

    .line 67
    :cond_0
    iget-object p0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSabineSdk:Lcom/momo/sabine/sabineSdk;

    .line 68
    .line 69
    if-eqz p0, :cond_1

    .line 70
    .line 71
    invoke-virtual {p0, p1, p2, p3}, Lcom/momo/sabine/sabineSdk;->sabineSet(IIF)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 72
    .line 73
    .line 74
    :catch_0
    :cond_1
    :goto_0
    :try_start_2
    monitor-exit v1

    .line 75
    return-void

    .line 76
    :goto_1
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 77
    throw p0
.end method

.method private native processsound_tune(Ljava/nio/ByteBuffer;ILjava/lang/Object;Ljava/nio/ByteBuffer;)V
.end method

.method private processsound_tune_H(Ljava/nio/ByteBuffer;ILjava/lang/Object;Ljava/nio/ByteBuffer;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-boolean v1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mHavaRelease:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    :try_start_1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/immomo/mediacore/audio/AudioProcess;->processsound_tune(Ljava/nio/ByteBuffer;ILjava/lang/Object;Ljava/nio/ByteBuffer;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :catchall_0
    move-exception p0

    .line 13
    goto :goto_1

    .line 14
    :catch_0
    :cond_0
    :goto_0
    :try_start_2
    monitor-exit v0

    .line 15
    return-void

    .line 16
    :goto_1
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 17
    throw p0
.end method

.method private sabineMcEQ()V
    .locals 4

    .line 1
    const/high16 v0, 0x41fa0000    # 31.25f

    .line 2
    .line 3
    const/16 v1, 0x10

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-virtual {p0, v2, v0, v1}, Lcom/immomo/mediacore/audio/AudioProcess;->SabineEffectSet_peq_fliter(IFI)V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    const/high16 v1, 0x427a0000    # 62.5f

    .line 11
    .line 12
    const/high16 v2, 0x41000000    # 8.0f

    .line 13
    .line 14
    invoke-virtual {p0, v0, v1, v2}, Lcom/immomo/mediacore/audio/AudioProcess;->SabineEffectSet_peq_Shelving(IFF)V

    .line 15
    .line 16
    .line 17
    const/4 v0, 0x2

    .line 18
    const/high16 v1, 0x42fa0000    # 125.0f

    .line 19
    .line 20
    const/high16 v3, 0x40000000    # 2.0f

    .line 21
    .line 22
    invoke-virtual {p0, v0, v1, v3, v2}, Lcom/immomo/mediacore/audio/AudioProcess;->SabineEffectSet_peq_peak(IFFF)V

    .line 23
    .line 24
    .line 25
    const/4 v0, 0x3

    .line 26
    const/high16 v1, 0x437a0000    # 250.0f

    .line 27
    .line 28
    invoke-virtual {p0, v0, v1, v3, v2}, Lcom/immomo/mediacore/audio/AudioProcess;->SabineEffectSet_peq_peak(IFFF)V

    .line 29
    .line 30
    .line 31
    const/4 v0, 0x4

    .line 32
    const/high16 v1, 0x43fa0000    # 500.0f

    .line 33
    .line 34
    invoke-virtual {p0, v0, v1, v3, v2}, Lcom/immomo/mediacore/audio/AudioProcess;->SabineEffectSet_peq_peak(IFFF)V

    .line 35
    .line 36
    .line 37
    const/4 v0, 0x5

    .line 38
    const/high16 v1, 0x447a0000    # 1000.0f

    .line 39
    .line 40
    invoke-virtual {p0, v0, v1, v3, v2}, Lcom/immomo/mediacore/audio/AudioProcess;->SabineEffectSet_peq_peak(IFFF)V

    .line 41
    .line 42
    .line 43
    const/4 v0, 0x6

    .line 44
    const/high16 v1, 0x44fa0000    # 2000.0f

    .line 45
    .line 46
    const/high16 v2, -0x3f000000    # -8.0f

    .line 47
    .line 48
    invoke-virtual {p0, v0, v1, v3, v2}, Lcom/immomo/mediacore/audio/AudioProcess;->SabineEffectSet_peq_peak(IFFF)V

    .line 49
    .line 50
    .line 51
    const/4 v0, 0x7

    .line 52
    const/high16 v1, 0x457a0000    # 4000.0f

    .line 53
    .line 54
    invoke-virtual {p0, v0, v1, v3, v2}, Lcom/immomo/mediacore/audio/AudioProcess;->SabineEffectSet_peq_peak(IFFF)V

    .line 55
    .line 56
    .line 57
    const/16 v0, 0x8

    .line 58
    .line 59
    const/high16 v1, 0x45fa0000    # 8000.0f

    .line 60
    .line 61
    invoke-virtual {p0, v0, v1, v2}, Lcom/immomo/mediacore/audio/AudioProcess;->SabineEffectSet_peq_Shelving(IFF)V

    .line 62
    .line 63
    .line 64
    const/high16 v0, 0x467a0000    # 16000.0f

    .line 65
    .line 66
    const/16 v1, 0x21

    .line 67
    .line 68
    const/16 v2, 0x9

    .line 69
    .line 70
    invoke-virtual {p0, v2, v0, v1}, Lcom/immomo/mediacore/audio/AudioProcess;->SabineEffectSet_peq_fliter(IFI)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method private safeProcesssound_sabineef([BILjava/lang/Object;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    invoke-virtual {p3}, Ll/csx;->L0()Z

    .line 6
    .line 7
    .line 8
    move-result p3

    .line 9
    if-nez p3, :cond_0

    .line 10
    .line 11
    :try_start_0
    iget-boolean p3, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mIgnoreSabine:Z

    .line 12
    .line 13
    if-nez p3, :cond_0

    .line 14
    .line 15
    sget-boolean p3, Lcom/immomo/mediacore/audio/AudioProcess;->mIsSabineLibLoaded:Z

    .line 16
    .line 17
    if-eqz p3, :cond_0

    .line 18
    .line 19
    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const/4 p3, 0x0

    .line 24
    invoke-direct {p0, p1, p2, p3}, Lcom/immomo/mediacore/audio/AudioProcess;->processsound_sabineef_H(Ljava/nio/ByteBuffer;ILjava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 25
    .line 26
    .line 27
    :catch_0
    :cond_0
    return-void
.end method

.method private setDefaultEf()V
    .locals 3

    .line 1
    const/4 v0, 0x2

    .line 2
    const/4 v1, 0x1

    .line 3
    const/high16 v2, 0x3f000000    # 0.5f

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1, v2}, Lcom/immomo/mediacore/audio/AudioProcess;->SabineEffectSet(IIF)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0, v0, v2}, Lcom/immomo/mediacore/audio/AudioProcess;->SabineEffectSet(IIF)V

    .line 9
    .line 10
    .line 11
    const/4 v1, 0x3

    .line 12
    const v2, 0x3d4ccccd    # 0.05f

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v0, v1, v2}, Lcom/immomo/mediacore/audio/AudioProcess;->SabineEffectSet(IIF)V

    .line 16
    .line 17
    .line 18
    const/4 v1, 0x4

    .line 19
    const/4 v2, 0x0

    .line 20
    invoke-virtual {p0, v0, v1, v2}, Lcom/immomo/mediacore/audio/AudioProcess;->SabineEffectSet(IIF)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method private setIntangibleEf()V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    const v1, 0x3e8f5c29    # 0.28f

    .line 3
    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    invoke-virtual {p0, v2, v0, v1}, Lcom/immomo/mediacore/audio/AudioProcess;->SabineEffectSet(IIF)V

    .line 7
    .line 8
    .line 9
    const v0, 0x3f0f5c29    # 0.56f

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v2, v2, v0}, Lcom/immomo/mediacore/audio/AudioProcess;->SabineEffectSet(IIF)V

    .line 13
    .line 14
    .line 15
    const/4 v0, 0x3

    .line 16
    const v1, 0x3f63d70a    # 0.89f

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v2, v0, v1}, Lcom/immomo/mediacore/audio/AudioProcess;->SabineEffectSet(IIF)V

    .line 20
    .line 21
    .line 22
    const/4 v0, 0x4

    .line 23
    const v1, 0x3e6b851f    # 0.23f

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, v2, v0, v1}, Lcom/immomo/mediacore/audio/AudioProcess;->SabineEffectSet(IIF)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method private setMelodiousEf()V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    const v1, 0x3f35c28f    # 0.71f

    .line 3
    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    invoke-virtual {p0, v2, v0, v1}, Lcom/immomo/mediacore/audio/AudioProcess;->SabineEffectSet(IIF)V

    .line 7
    .line 8
    .line 9
    const v0, 0x3f028f5c    # 0.51f

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v2, v2, v0}, Lcom/immomo/mediacore/audio/AudioProcess;->SabineEffectSet(IIF)V

    .line 13
    .line 14
    .line 15
    const/4 v0, 0x3

    .line 16
    const v1, 0x3f333333    # 0.7f

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v2, v0, v1}, Lcom/immomo/mediacore/audio/AudioProcess;->SabineEffectSet(IIF)V

    .line 20
    .line 21
    .line 22
    const/4 v0, 0x4

    .line 23
    const v1, 0x3ea3d70a    # 0.32f

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, v2, v0, v1}, Lcom/immomo/mediacore/audio/AudioProcess;->SabineEffectSet(IIF)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method private setMildEf()V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    const v1, 0x3e4ccccd    # 0.2f

    .line 3
    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    invoke-virtual {p0, v2, v0, v1}, Lcom/immomo/mediacore/audio/AudioProcess;->SabineEffectSet(IIF)V

    .line 7
    .line 8
    .line 9
    const/high16 v0, 0x3f000000    # 0.5f

    .line 10
    .line 11
    invoke-virtual {p0, v2, v2, v0}, Lcom/immomo/mediacore/audio/AudioProcess;->SabineEffectSet(IIF)V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x3

    .line 15
    const v1, 0x3e99999a    # 0.3f

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v2, v0, v1}, Lcom/immomo/mediacore/audio/AudioProcess;->SabineEffectSet(IIF)V

    .line 19
    .line 20
    .line 21
    const/4 v0, 0x4

    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-virtual {p0, v2, v0, v1}, Lcom/immomo/mediacore/audio/AudioProcess;->SabineEffectSet(IIF)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method private setPopEf()V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    const/high16 v1, 0x3f000000    # 0.5f

    .line 3
    .line 4
    const/4 v2, 0x2

    .line 5
    invoke-virtual {p0, v2, v0, v1}, Lcom/immomo/mediacore/audio/AudioProcess;->SabineEffectSet(IIF)V

    .line 6
    .line 7
    .line 8
    const v0, 0x3f19999a    # 0.6f

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v2, v2, v0}, Lcom/immomo/mediacore/audio/AudioProcess;->SabineEffectSet(IIF)V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x3

    .line 15
    const v1, 0x3e99999a    # 0.3f

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v2, v0, v1}, Lcom/immomo/mediacore/audio/AudioProcess;->SabineEffectSet(IIF)V

    .line 19
    .line 20
    .line 21
    const/4 v0, 0x4

    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-virtual {p0, v2, v0, v1}, Lcom/immomo/mediacore/audio/AudioProcess;->SabineEffectSet(IIF)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method private setProcessMethod(I)V
    .locals 1

    .line 1
    iput p1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mProcessMethod:I

    .line 2
    .line 3
    new-instance p1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v0, "setmProcessMethod"

    .line 6
    .line 7
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget p0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mProcessMethod:I

    .line 11
    .line 12
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const-string p1, "AudioProcess"

    .line 20
    .line 21
    invoke-static {p1, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method private shortToByteArray(S)[B
    .locals 3

    .line 1
    const/4 p0, 0x2

    .line 2
    new-array v0, p0, [B

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    :goto_0
    if-ge v1, p0, :cond_0

    .line 6
    .line 7
    mul-int/lit8 v2, v1, 0x8

    .line 8
    .line 9
    ushr-int v2, p1, v2

    .line 10
    .line 11
    and-int/lit16 v2, v2, 0xff

    .line 12
    .line 13
    int-to-byte v2, v2

    .line 14
    aput-byte v2, v0, v1

    .line 15
    .line 16
    add-int/lit8 v1, v1, 0x1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    return-object v0
.end method


# virtual methods
.method public SabineEffectReset()V
    .locals 8

    .line 1
    :try_start_0
    iget-boolean v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mOpenSabineEf:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/immomo/mediacore/audio/AudioProcess;->openSabineEfHandle()V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-direct {p0}, Lcom/immomo/mediacore/audio/AudioProcess;->processsound_sabineeffectreset_H()V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/csx;->L0()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/4 v1, 0x0

    .line 20
    const/4 v2, 0x0

    .line 21
    const/4 v3, 0x1

    .line 22
    const/4 v4, 0x2

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    invoke-virtual {p0, v3, v2, v1}, Lcom/immomo/mediacore/audio/AudioProcess;->SabineEffectSet(IIF)V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    iget v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->preDenoise:F

    .line 30
    .line 31
    invoke-virtual {p0, v3, v4, v0}, Lcom/immomo/mediacore/audio/AudioProcess;->SabineEffectSet(IIF)V

    .line 32
    .line 33
    .line 34
    :goto_0
    const v0, 0x3d4ccccd    # 0.05f

    .line 35
    .line 36
    .line 37
    const/4 v5, 0x3

    .line 38
    invoke-virtual {p0, v4, v5, v0}, Lcom/immomo/mediacore/audio/AudioProcess;->SabineEffectSet(IIF)V

    .line 39
    .line 40
    .line 41
    const/4 v0, 0x4

    .line 42
    invoke-virtual {p0, v4, v0, v1}, Lcom/immomo/mediacore/audio/AudioProcess;->SabineEffectSet(IIF)V

    .line 43
    .line 44
    .line 45
    const/high16 v6, 0x40c00000    # 6.0f

    .line 46
    .line 47
    invoke-virtual {p0, v5, v2, v6}, Lcom/immomo/mediacore/audio/AudioProcess;->SabineEffectSet(IIF)V

    .line 48
    .line 49
    .line 50
    const/high16 v7, 0x40400000    # 3.0f

    .line 51
    .line 52
    invoke-virtual {p0, v5, v3, v7}, Lcom/immomo/mediacore/audio/AudioProcess;->SabineEffectSet(IIF)V

    .line 53
    .line 54
    .line 55
    const/high16 v3, -0x40800000    # -1.0f

    .line 56
    .line 57
    invoke-virtual {p0, v5, v4, v3}, Lcom/immomo/mediacore/audio/AudioProcess;->SabineEffectSet(IIF)V

    .line 58
    .line 59
    .line 60
    const/high16 v3, -0x3fc00000    # -3.0f

    .line 61
    .line 62
    invoke-virtual {p0, v5, v5, v3}, Lcom/immomo/mediacore/audio/AudioProcess;->SabineEffectSet(IIF)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0, v5, v0, v1}, Lcom/immomo/mediacore/audio/AudioProcess;->SabineEffectSet(IIF)V

    .line 66
    .line 67
    .line 68
    const/4 v0, 0x5

    .line 69
    const/high16 v1, 0x41000000    # 8.0f

    .line 70
    .line 71
    invoke-virtual {p0, v5, v0, v1}, Lcom/immomo/mediacore/audio/AudioProcess;->SabineEffectSet(IIF)V

    .line 72
    .line 73
    .line 74
    const/4 v0, 0x6

    .line 75
    invoke-virtual {p0, v5, v0, v6}, Lcom/immomo/mediacore/audio/AudioProcess;->SabineEffectSet(IIF)V

    .line 76
    .line 77
    .line 78
    iput-boolean v2, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mIgnoreSabine:Z

    .line 79
    .line 80
    invoke-static {}, Lcom/immomo/mediacore/audio/AudioNcDynamic;->getInstance()Lcom/immomo/mediacore/audio/AudioNcDynamic;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-virtual {v0, p0}, Lcom/immomo/mediacore/audio/AudioNcDynamic;->setAudioNcDynamicCallBack(Lcom/immomo/mediacore/audio/AudioNcDynamic$AudioNcDynamicCallBack;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 85
    .line 86
    .line 87
    :catch_0
    return-void
.end method

.method public SabineEffectReset_ex()V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/immomo/mediacore/audio/AudioProcess;->mIsSabineLibLoaded:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mHavaRelease:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    :try_start_0
    iget-object p0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSabineSdk:Lcom/momo/sabine/sabineSdk;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/momo/sabine/sabineSdk;->SabineEffectReset_ex()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    .line 15
    .line 16
    :catch_0
    :cond_0
    return-void
.end method

.method public SabineEffectSet(IIF)V
    .locals 1

    .line 1
    const/4 v0, 0x3

    .line 2
    if-ne p1, v0, :cond_0

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    cmpl-float v0, p3, v0

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-boolean v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mOpenSabineEf:Z

    .line 11
    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    invoke-direct {p0}, Lcom/immomo/mediacore/audio/AudioProcess;->openSabineEfHandle()V

    .line 15
    .line 16
    .line 17
    :cond_1
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ll/csx;->y0()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    const/4 v0, 0x1

    .line 28
    if-eq p1, v0, :cond_2

    .line 29
    .line 30
    :goto_0
    return-void

    .line 31
    :cond_2
    :try_start_0
    invoke-direct {p0, p1, p2, p3}, Lcom/immomo/mediacore/audio/AudioProcess;->processsound_sabineeffectset_H(IIF)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 32
    .line 33
    .line 34
    goto :goto_1

    .line 35
    :catch_0
    move-exception p1

    .line 36
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 37
    .line 38
    .line 39
    :goto_1
    const/4 p1, 0x0

    .line 40
    iput-boolean p1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mIgnoreSabine:Z

    .line 41
    .line 42
    return-void
.end method

.method public SabineEffectSet_ans(F)V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/immomo/mediacore/audio/AudioProcess;->mIsSabineLibLoaded:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mHavaRelease:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    :try_start_0
    iget-object p0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSabineSdk:Lcom/momo/sabine/sabineSdk;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/momo/sabine/sabineSdk;->SabineEffectSet_ans(F)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    .line 15
    .line 16
    :catch_0
    :cond_0
    return-void
.end method

.method public SabineEffectSet_peq_Shelving(IFF)V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/immomo/mediacore/audio/AudioProcess;->mIsSabineLibLoaded:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mHavaRelease:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    :try_start_0
    iget-object p0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSabineSdk:Lcom/momo/sabine/sabineSdk;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, p1, p2, p3}, Lcom/momo/sabine/sabineSdk;->SabineEffectSet_peq_Shelving(IFF)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    .line 15
    .line 16
    :catch_0
    :cond_0
    return-void
.end method

.method public SabineEffectSet_peq_fliter(IFI)V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/immomo/mediacore/audio/AudioProcess;->mIsSabineLibLoaded:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mHavaRelease:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    :try_start_0
    iget-object p0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSabineSdk:Lcom/momo/sabine/sabineSdk;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, p1, p2, p3}, Lcom/momo/sabine/sabineSdk;->SabineEffectSet_peq_fliter(IFI)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    .line 15
    .line 16
    :catch_0
    :cond_0
    return-void
.end method

.method public SabineEffectSet_peq_peak(IFFF)V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/immomo/mediacore/audio/AudioProcess;->mIsSabineLibLoaded:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mHavaRelease:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    :try_start_0
    iget-object p0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSabineSdk:Lcom/momo/sabine/sabineSdk;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/momo/sabine/sabineSdk;->SabineEffectSet_peq_peak(IFFF)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    .line 15
    .line 16
    :catch_0
    :cond_0
    return-void
.end method

.method public SabineEffectSet_reverb(IF)V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/immomo/mediacore/audio/AudioProcess;->mIsSabineLibLoaded:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mHavaRelease:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    :try_start_0
    iget-object p0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSabineSdk:Lcom/momo/sabine/sabineSdk;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, p1, p2}, Lcom/momo/sabine/sabineSdk;->SabineEffectSet_reverb(IF)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    .line 15
    .line 16
    :catch_0
    :cond_0
    return-void
.end method

.method public adjustAef(IZ)V
    .locals 0

    .line 1
    iput-boolean p2, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mEnableAef:Z

    .line 2
    .line 3
    iget-object p0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mParams_Aef:Lcom/immomo/mediacore/audio/Ctrl_Params_Eq;

    .line 4
    .line 5
    iput p1, p0, Lcom/immomo/mediacore/audio/Ctrl_Params_Eq;->sndMode:I

    .line 6
    .line 7
    return-void
.end method

.method public adjustEQ(IZ)V
    .locals 0

    .line 1
    iput-boolean p2, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mEnableEQ:Z

    .line 2
    .line 3
    iget-object p0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mParams_Eq:Lcom/immomo/mediacore/audio/Ctrl_Params_Eq;

    .line 4
    .line 5
    iput p1, p0, Lcom/immomo/mediacore/audio/Ctrl_Params_Eq;->sndMode:I

    .line 6
    .line 7
    return-void
.end method

.method public adjustEf(II)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mOpenSabineEf:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/immomo/mediacore/audio/AudioProcess;->openSabineEfHandle()V

    .line 6
    .line 7
    .line 8
    :cond_0
    if-eqz p1, :cond_1

    .line 9
    .line 10
    return-void

    .line 11
    :cond_1
    if-eqz p2, :cond_6

    .line 12
    .line 13
    const/4 p1, 0x1

    .line 14
    if-eq p2, p1, :cond_5

    .line 15
    .line 16
    const/4 p1, 0x2

    .line 17
    if-eq p2, p1, :cond_4

    .line 18
    .line 19
    const/4 p1, 0x3

    .line 20
    if-eq p2, p1, :cond_3

    .line 21
    .line 22
    const/4 p1, 0x5

    .line 23
    if-eq p2, p1, :cond_2

    .line 24
    .line 25
    return-void

    .line 26
    :cond_2
    invoke-direct {p0}, Lcom/immomo/mediacore/audio/AudioProcess;->setMelodiousEf()V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_3
    invoke-direct {p0}, Lcom/immomo/mediacore/audio/AudioProcess;->setIntangibleEf()V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_4
    invoke-direct {p0}, Lcom/immomo/mediacore/audio/AudioProcess;->setPopEf()V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_5
    invoke-direct {p0}, Lcom/immomo/mediacore/audio/AudioProcess;->setMildEf()V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_6
    invoke-direct {p0}, Lcom/immomo/mediacore/audio/AudioProcess;->setDefaultEf()V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public adjustTune(IZ)V
    .locals 0

    .line 1
    iput-boolean p2, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mEnableTune:Z

    .line 2
    .line 3
    iget-object p0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mParams_Tune:Lcom/immomo/mediacore/audio/Ctrl_Params_Tune;

    .line 4
    .line 5
    iput p1, p0, Lcom/immomo/mediacore/audio/Ctrl_Params_Tune;->pitch:I

    .line 6
    .line 7
    return-void
.end method

.method public alsa_mix_16(SSS)V
    .locals 0

    return-void
.end method

.method public clear()V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mAudioFrames:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/LinkedBlockingQueue;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSurroundFrames:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/util/concurrent/LinkedBlockingQueue;->clear()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSurroundFrames_Extra:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/util/concurrent/LinkedBlockingQueue;->clear()V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSurroundFrames_Extra2:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/util/concurrent/LinkedBlockingQueue;->clear()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :catch_0
    move-exception p0

    .line 23
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public clearSurroundExtraFrames()V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSurroundFrames_Extra:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/LinkedBlockingQueue;->clear()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :catch_0
    move-exception p0

    .line 8
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public clearSurroundExtraFrames2()V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSurroundFrames_Extra2:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/LinkedBlockingQueue;->clear()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :catch_0
    move-exception p0

    .line 8
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public clearSurroundFrames()V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSurroundFrames:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/LinkedBlockingQueue;->clear()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :catch_0
    move-exception p0

    .line 8
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public enableMuteFilter(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mMuteFilterEnable:Z

    .line 2
    .line 3
    return-void
.end method

.method public getAudioFrames()J
    .locals 4

    .line 1
    iget-object p0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mAudioFrames:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/util/concurrent/LinkedBlockingQueue;->size()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    int-to-long v0, p0

    .line 10
    const-wide/16 v2, 0x400

    .line 11
    .line 12
    mul-long/2addr v0, v2

    .line 13
    return-wide v0

    .line 14
    :cond_0
    const-wide/16 v0, 0x0

    .line 15
    .line 16
    return-wide v0
.end method

.method public getMasterAudioLevel()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mMasterAudioLecel:F

    .line 2
    .line 3
    return p0
.end method

.method public getMixedSurroundData()Ll/oxd0;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSurroundFrames:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/LinkedBlockingQueue;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-lez v0, :cond_0

    .line 9
    .line 10
    :try_start_0
    iget-object v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSurroundFrames:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/util/concurrent/LinkedBlockingQueue;->take()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ll/oxd0;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :catch_0
    :cond_0
    move-object v0, v1

    .line 20
    :goto_0
    invoke-virtual {p0}, Lcom/immomo/mediacore/audio/AudioProcess;->getSurroundExtraData()Ll/oxd0;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    if-eqz v0, :cond_3

    .line 25
    .line 26
    if-eqz v2, :cond_3

    .line 27
    .line 28
    invoke-virtual {v0}, Ll/oxd0;->e()I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    invoke-virtual {v2}, Ll/oxd0;->e()I

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    if-eq v1, v3, :cond_2

    .line 37
    .line 38
    new-instance p0, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    const-string v1, "getMixedSurroundData: Surround and  SurroundExtra data size not eaqule,drop frame, surround size:"

    .line 41
    .line 42
    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0}, Ll/oxd0;->e()I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    const-string v1, ", Extra size: "

    .line 53
    .line 54
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v2}, Ll/oxd0;->e()I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    const-string v1, "HUOHL_AudioProcess"

    .line 69
    .line 70
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0}, Ll/oxd0;->e()I

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    invoke-virtual {v2}, Ll/oxd0;->e()I

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    if-le p0, v1, :cond_1

    .line 82
    .line 83
    return-object v0

    .line 84
    :cond_1
    return-object v2

    .line 85
    :cond_2
    invoke-virtual {v0}, Ll/oxd0;->c()[B

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    invoke-virtual {v2}, Ll/oxd0;->c()[B

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    iget v3, v0, Ll/oxd0;->e:I

    .line 94
    .line 95
    invoke-virtual {p0, v1, v2, v3}, Lcom/immomo/mediacore/audio/AudioProcess;->normalize_mix2([B[BI)Ljava/nio/ByteBuffer;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    new-instance v1, Ll/oxd0;

    .line 100
    .line 101
    invoke-virtual {v0}, Ll/oxd0;->d()J

    .line 102
    .line 103
    .line 104
    move-result-wide v2

    .line 105
    const/4 v0, 0x0

    .line 106
    invoke-direct {v1, p0, v2, v3, v0}, Ll/oxd0;-><init>(Ljava/nio/ByteBuffer;JI)V

    .line 107
    .line 108
    .line 109
    return-object v1

    .line 110
    :cond_3
    if-eqz v0, :cond_4

    .line 111
    .line 112
    return-object v0

    .line 113
    :cond_4
    if-eqz v2, :cond_5

    .line 114
    .line 115
    return-object v2

    .line 116
    :cond_5
    return-object v1
.end method

.method public getSlaveAudioLevel()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSlaveAudioLecel:F

    .line 2
    .line 3
    return p0
.end method

.method public getSurroundData()Ll/oxd0;
    .locals 0

    .line 1
    :try_start_0
    invoke-virtual {p0}, Lcom/immomo/mediacore/audio/AudioProcess;->getMixedSurroundData()Ll/oxd0;

    .line 2
    .line 3
    .line 4
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    return-object p0

    .line 6
    :catch_0
    move-exception p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public getSurroundExtraData()Ll/oxd0;
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    iget-object v1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSurroundFrames_Extra:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 3
    .line 4
    invoke-virtual {v1}, Ljava/util/concurrent/LinkedBlockingQueue;->size()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-lez v1, :cond_0

    .line 9
    .line 10
    iget-object v1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSurroundFrames_Extra:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 11
    .line 12
    invoke-virtual {v1}, Ljava/util/concurrent/LinkedBlockingQueue;->take()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Ll/oxd0;

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :catch_0
    move-exception p0

    .line 20
    goto :goto_2

    .line 21
    :cond_0
    move-object v1, v0

    .line 22
    :goto_0
    iget-object v2, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSurroundFrames_Extra2:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 23
    .line 24
    invoke-virtual {v2}, Ljava/util/concurrent/LinkedBlockingQueue;->size()I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    if-lez v2, :cond_1

    .line 29
    .line 30
    iget-object v2, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSurroundFrames_Extra2:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 31
    .line 32
    invoke-virtual {v2}, Ljava/util/concurrent/LinkedBlockingQueue;->take()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    check-cast v2, Ll/oxd0;

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_1
    move-object v2, v0

    .line 40
    :goto_1
    if-eqz v1, :cond_2

    .line 41
    .line 42
    if-eqz v2, :cond_2

    .line 43
    .line 44
    invoke-virtual {v1}, Ll/oxd0;->c()[B

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    invoke-virtual {v2}, Ll/oxd0;->c()[B

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    iget v4, v1, Ll/oxd0;->e:I

    .line 53
    .line 54
    invoke-virtual {p0, v3, v2, v4}, Lcom/immomo/mediacore/audio/AudioProcess;->normalize_mix2([B[BI)Ljava/nio/ByteBuffer;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    new-instance v2, Ll/oxd0;

    .line 59
    .line 60
    invoke-virtual {v1}, Ll/oxd0;->d()J

    .line 61
    .line 62
    .line 63
    move-result-wide v3

    .line 64
    iget v1, v1, Ll/oxd0;->f:I

    .line 65
    .line 66
    invoke-direct {v2, p0, v3, v4, v1}, Ll/oxd0;-><init>(Ljava/nio/ByteBuffer;JI)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 67
    .line 68
    .line 69
    return-object v2

    .line 70
    :cond_2
    if-eqz v1, :cond_3

    .line 71
    .line 72
    return-object v1

    .line 73
    :cond_3
    if-eqz v2, :cond_4

    .line 74
    .line 75
    return-object v2

    .line 76
    :cond_4
    return-object v0

    .line 77
    :goto_2
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 78
    .line 79
    .line 80
    return-object v0
.end method

.method public getSurroundExtraData2()Ll/oxd0;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    iget-object v1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSurroundFrames_Extra2:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 3
    .line 4
    invoke-virtual {v1}, Ljava/util/concurrent/LinkedBlockingQueue;->size()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-lez v1, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSurroundFrames_Extra2:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 11
    .line 12
    invoke-virtual {p0}, Ljava/util/concurrent/LinkedBlockingQueue;->take()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Ll/oxd0;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    .line 18
    return-object p0

    .line 19
    :catch_0
    move-exception p0

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    return-object v0

    .line 22
    :goto_0
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 23
    .line 24
    .line 25
    return-object v0
.end method

.method public getSurroundExtraFrameSize()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSurroundFrames_Extra:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/LinkedBlockingQueue;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getSurroundExtraFrameSize2()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSurroundFrames_Extra2:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/LinkedBlockingQueue;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getSurroundFrameSize()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSurroundFrames:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/LinkedBlockingQueue;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public normalize_mix([B[BI)Ljava/nio/ByteBuffer;
    .locals 9

    .line 1
    if-eqz p1, :cond_3

    .line 2
    .line 3
    if-eqz p2, :cond_3

    .line 4
    .line 5
    if-nez p3, :cond_0

    .line 6
    .line 7
    goto :goto_3

    .line 8
    :cond_0
    invoke-static {p3}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 13
    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    move v2, v1

    .line 17
    :goto_0
    div-int/lit8 v3, p3, 0x2

    .line 18
    .line 19
    if-ge v2, v3, :cond_2

    .line 20
    .line 21
    mul-int/lit8 v3, v2, 0x2

    .line 22
    .line 23
    add-int/lit8 v4, v3, 0x1

    .line 24
    .line 25
    aget-byte v5, p1, v4

    .line 26
    .line 27
    int-to-short v5, v5

    .line 28
    aget-byte v6, p1, v3

    .line 29
    .line 30
    int-to-short v6, v6

    .line 31
    shl-int/lit8 v5, v5, 0x8

    .line 32
    .line 33
    const v7, 0xff00

    .line 34
    .line 35
    .line 36
    and-int/2addr v5, v7

    .line 37
    and-int/lit16 v6, v6, 0xff

    .line 38
    .line 39
    or-int/2addr v5, v6

    .line 40
    int-to-short v5, v5

    .line 41
    int-to-float v5, v5

    .line 42
    iget v6, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mMasterGain:F

    .line 43
    .line 44
    mul-float/2addr v5, v6

    .line 45
    iget v6, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mMasterAudioLecel:F

    .line 46
    .line 47
    mul-float/2addr v5, v6

    .line 48
    aget-byte v6, p2, v4

    .line 49
    .line 50
    int-to-short v6, v6

    .line 51
    aget-byte v8, p2, v3

    .line 52
    .line 53
    int-to-short v8, v8

    .line 54
    shl-int/lit8 v6, v6, 0x8

    .line 55
    .line 56
    and-int/2addr v6, v7

    .line 57
    and-int/lit16 v7, v8, 0xff

    .line 58
    .line 59
    or-int/2addr v6, v7

    .line 60
    int-to-short v6, v6

    .line 61
    int-to-float v6, v6

    .line 62
    iget v7, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSlaveGain:F

    .line 63
    .line 64
    mul-float/2addr v6, v7

    .line 65
    iget v7, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSlaveAudioLecel:F

    .line 66
    .line 67
    mul-float/2addr v6, v7

    .line 68
    const/4 v7, 0x0

    .line 69
    cmpg-float v8, v5, v7

    .line 70
    .line 71
    if-gez v8, :cond_1

    .line 72
    .line 73
    cmpg-float v7, v6, v7

    .line 74
    .line 75
    if-gez v7, :cond_1

    .line 76
    .line 77
    add-float v7, v5, v6

    .line 78
    .line 79
    mul-float/2addr v5, v6

    .line 80
    const v6, -0x39000200    # -32767.0f

    .line 81
    .line 82
    .line 83
    :goto_1
    div-float/2addr v5, v6

    .line 84
    sub-float/2addr v7, v5

    .line 85
    float-to-int v5, v7

    .line 86
    int-to-short v5, v5

    .line 87
    goto :goto_2

    .line 88
    :cond_1
    add-float v7, v5, v6

    .line 89
    .line 90
    mul-float/2addr v5, v6

    .line 91
    const v6, 0x46fffe00    # 32767.0f

    .line 92
    .line 93
    .line 94
    goto :goto_1

    .line 95
    :goto_2
    shr-int/lit8 v6, v5, 0x8

    .line 96
    .line 97
    and-int/lit16 v6, v6, 0xff

    .line 98
    .line 99
    int-to-byte v6, v6

    .line 100
    aput-byte v6, p1, v4

    .line 101
    .line 102
    and-int/lit16 v4, v5, 0xff

    .line 103
    .line 104
    int-to-byte v4, v4

    .line 105
    aput-byte v4, p1, v3

    .line 106
    .line 107
    add-int/lit8 v2, v2, 0x1

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :cond_2
    invoke-virtual {v0, p1, v1, p3}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 111
    .line 112
    .line 113
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 114
    .line 115
    .line 116
    return-object v0

    .line 117
    :cond_3
    :goto_3
    new-instance p0, Ljava/lang/StringBuilder;

    .line 118
    .line 119
    const-string v0, "normalize_mix:frameAudio="

    .line 120
    .line 121
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    const-string p1, "; soundAudio="

    .line 128
    .line 129
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    const-string p1, ";framelen="

    .line 136
    .line 137
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    const-string p1, "AudioProcess"

    .line 148
    .line 149
    invoke-static {p1, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 150
    .line 151
    .line 152
    const/4 p0, 0x0

    .line 153
    return-object p0
.end method

.method public normalize_mix2([B[BI)Ljava/nio/ByteBuffer;
    .locals 8

    .line 1
    if-eqz p1, :cond_3

    .line 2
    .line 3
    if-eqz p2, :cond_3

    .line 4
    .line 5
    if-nez p3, :cond_0

    .line 6
    .line 7
    goto :goto_3

    .line 8
    :cond_0
    invoke-static {p3}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 13
    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    move v1, v0

    .line 17
    :goto_0
    div-int/lit8 v2, p3, 0x2

    .line 18
    .line 19
    if-ge v1, v2, :cond_2

    .line 20
    .line 21
    mul-int/lit8 v2, v1, 0x2

    .line 22
    .line 23
    add-int/lit8 v3, v2, 0x1

    .line 24
    .line 25
    aget-byte v4, p1, v3

    .line 26
    .line 27
    int-to-short v4, v4

    .line 28
    aget-byte v5, p1, v2

    .line 29
    .line 30
    int-to-short v5, v5

    .line 31
    shl-int/lit8 v4, v4, 0x8

    .line 32
    .line 33
    const v6, 0xff00

    .line 34
    .line 35
    .line 36
    and-int/2addr v4, v6

    .line 37
    and-int/lit16 v5, v5, 0xff

    .line 38
    .line 39
    or-int/2addr v4, v5

    .line 40
    int-to-short v4, v4

    .line 41
    aget-byte v5, p2, v3

    .line 42
    .line 43
    int-to-short v5, v5

    .line 44
    aget-byte v7, p2, v2

    .line 45
    .line 46
    int-to-short v7, v7

    .line 47
    shl-int/lit8 v5, v5, 0x8

    .line 48
    .line 49
    and-int/2addr v5, v6

    .line 50
    and-int/lit16 v6, v7, 0xff

    .line 51
    .line 52
    or-int/2addr v5, v6

    .line 53
    int-to-short v5, v5

    .line 54
    if-gez v4, :cond_1

    .line 55
    .line 56
    if-gez v5, :cond_1

    .line 57
    .line 58
    add-int v6, v4, v5

    .line 59
    .line 60
    mul-int/2addr v4, v5

    .line 61
    div-int/lit16 v4, v4, -0x7fff

    .line 62
    .line 63
    :goto_1
    sub-int/2addr v6, v4

    .line 64
    int-to-short v4, v6

    .line 65
    goto :goto_2

    .line 66
    :cond_1
    add-int v6, v4, v5

    .line 67
    .line 68
    mul-int/2addr v4, v5

    .line 69
    div-int/lit16 v4, v4, 0x7fff

    .line 70
    .line 71
    goto :goto_1

    .line 72
    :goto_2
    shr-int/lit8 v5, v4, 0x8

    .line 73
    .line 74
    and-int/lit16 v5, v5, 0xff

    .line 75
    .line 76
    int-to-byte v5, v5

    .line 77
    aput-byte v5, p1, v3

    .line 78
    .line 79
    and-int/lit16 v3, v4, 0xff

    .line 80
    .line 81
    int-to-byte v3, v3

    .line 82
    aput-byte v3, p1, v2

    .line 83
    .line 84
    add-int/lit8 v1, v1, 0x1

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_2
    invoke-virtual {p0, p1, v0, p3}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 88
    .line 89
    .line 90
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 91
    .line 92
    .line 93
    return-object p0

    .line 94
    :cond_3
    :goto_3
    new-instance p0, Ljava/lang/StringBuilder;

    .line 95
    .line 96
    const-string v0, "normalize_mix:frameAudio="

    .line 97
    .line 98
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    const-string p1, "; soundAudio="

    .line 105
    .line 106
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    const-string p1, ";framelen="

    .line 113
    .line 114
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    const-string p1, "AudioProcess"

    .line 125
    .line 126
    invoke-static {p1, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 127
    .line 128
    .line 129
    const/4 p0, 0x0

    .line 130
    return-object p0
.end method

.method public normalize_mixGame([B[BI)[B
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    if-eqz p2, :cond_1

    .line 4
    .line 5
    if-nez p3, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p0, p1, p3, p2}, Lcom/immomo/mediacore/audio/AudioProcess;->processAudioMix([BI[B)V

    .line 9
    .line 10
    .line 11
    return-object p1

    .line 12
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 13
    return-object p0
.end method

.method public onAudioDynamic(I)V
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    const/16 v1, 0x3c

    .line 3
    .line 4
    if-le p1, v1, :cond_0

    .line 5
    .line 6
    iget v2, p0, Lcom/immomo/mediacore/audio/AudioProcess;->preDenoise:F

    .line 7
    .line 8
    const v3, 0x3e4ccccd    # 0.2f

    .line 9
    .line 10
    .line 11
    cmpl-float v2, v2, v3

    .line 12
    .line 13
    if-eqz v2, :cond_0

    .line 14
    .line 15
    iput v3, p0, Lcom/immomo/mediacore/audio/AudioProcess;->preDenoise:F

    .line 16
    .line 17
    iput v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->preInIdx:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/16 v2, 0x28

    .line 21
    .line 22
    if-le p1, v2, :cond_1

    .line 23
    .line 24
    if-gt p1, v1, :cond_1

    .line 25
    .line 26
    iget v1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->preDenoise:F

    .line 27
    .line 28
    const v3, 0x3ecccccd    # 0.4f

    .line 29
    .line 30
    .line 31
    cmpl-float v1, v1, v3

    .line 32
    .line 33
    if-eqz v1, :cond_1

    .line 34
    .line 35
    iput v3, p0, Lcom/immomo/mediacore/audio/AudioProcess;->preDenoise:F

    .line 36
    .line 37
    iput v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->preInIdx:I

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    if-gt p1, v2, :cond_2

    .line 41
    .line 42
    iget p1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->preDenoise:F

    .line 43
    .line 44
    const v1, 0x3f19999a    # 0.6f

    .line 45
    .line 46
    .line 47
    cmpl-float p1, p1, v1

    .line 48
    .line 49
    if-eqz p1, :cond_2

    .line 50
    .line 51
    iput v1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->preDenoise:F

    .line 52
    .line 53
    iput v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->preInIdx:I

    .line 54
    .line 55
    :goto_0
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {p1}, Ll/csx;->L0()Z

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    if-nez p1, :cond_2

    .line 64
    .line 65
    iget p1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->preInIdx:I

    .line 66
    .line 67
    iget v1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->preDenoise:F

    .line 68
    .line 69
    invoke-virtual {p0, v0, p1, v1}, Lcom/immomo/mediacore/audio/AudioProcess;->SabineEffectSet(IIF)V

    .line 70
    .line 71
    .line 72
    new-instance p1, Ljava/lang/StringBuilder;

    .line 73
    .line 74
    const-string v0, "SabineEffectSet "

    .line 75
    .line 76
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    iget v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->preInIdx:I

    .line 80
    .line 81
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    const-string v0, " / "

    .line 85
    .line 86
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    iget p0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->preDenoise:F

    .line 90
    .line 91
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    const-string p1, "AudioNcDynamic"

    .line 99
    .line 100
    invoke-static {p1, p0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 101
    .line 102
    .line 103
    :cond_2
    return-void
.end method

.method public openSabineEf(III)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mFs:I

    .line 2
    .line 3
    iput p2, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mChannal:I

    .line 4
    .line 5
    iput p3, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mLenMs:I

    .line 6
    .line 7
    return-void
.end method

.method public processAudioData([BI)[B
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mMuteFilterEnable:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-array p0, p2, [B

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    invoke-direct {p0, p1, p2, v0}, Lcom/immomo/mediacore/audio/AudioProcess;->safeProcesssound_sabineef([BILjava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    iget-boolean v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mEnableEQ:Z

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    iget-boolean v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mEnableTune:Z

    .line 17
    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    iget-boolean v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mEnableAef:Z

    .line 21
    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    iget-boolean v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mEnableElcTune:Z

    .line 25
    .line 26
    if-nez v0, :cond_1

    .line 27
    .line 28
    iget-boolean v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mUseSoxEffect:Z

    .line 29
    .line 30
    if-nez v0, :cond_1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    iget-boolean v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mEnableTune:Z

    .line 34
    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    iget-object v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mParams_Tune:Lcom/immomo/mediacore/audio/Ctrl_Params_Tune;

    .line 38
    .line 39
    iget v1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mChannal:I

    .line 40
    .line 41
    iput v1, v0, Lcom/immomo/mediacore/audio/Ctrl_Params_Tune;->nChannels:I

    .line 42
    .line 43
    iget v1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mFs:I

    .line 44
    .line 45
    iput v1, v0, Lcom/immomo/mediacore/audio/Ctrl_Params_Tune;->rate:I

    .line 46
    .line 47
    sget-boolean v0, Lcom/immomo/mediacore/audio/AudioProcess;->mIsLibLoaded:Z

    .line 48
    .line 49
    if-eqz v0, :cond_2

    .line 50
    .line 51
    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    iget-object v1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mParams_Tune:Lcom/immomo/mediacore/audio/Ctrl_Params_Tune;

    .line 56
    .line 57
    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    invoke-direct {p0, v0, p2, v1, v2}, Lcom/immomo/mediacore/audio/AudioProcess;->processsound_tune_H(Ljava/nio/ByteBuffer;ILjava/lang/Object;Ljava/nio/ByteBuffer;)V

    .line 62
    .line 63
    .line 64
    :cond_2
    iget-boolean v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mEnableEQ:Z

    .line 65
    .line 66
    if-eqz v0, :cond_3

    .line 67
    .line 68
    iget-object v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mParams_Eq:Lcom/immomo/mediacore/audio/Ctrl_Params_Eq;

    .line 69
    .line 70
    iget v1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mChannal:I

    .line 71
    .line 72
    iput v1, v0, Lcom/immomo/mediacore/audio/Ctrl_Params_Eq;->nChannels:I

    .line 73
    .line 74
    iget v1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mFs:I

    .line 75
    .line 76
    iput v1, v0, Lcom/immomo/mediacore/audio/Ctrl_Params_Eq;->rate:I

    .line 77
    .line 78
    sget-boolean v0, Lcom/immomo/mediacore/audio/AudioProcess;->mIsLibLoaded:Z

    .line 79
    .line 80
    if-eqz v0, :cond_3

    .line 81
    .line 82
    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    iget-object v1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mParams_Eq:Lcom/immomo/mediacore/audio/Ctrl_Params_Eq;

    .line 87
    .line 88
    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    invoke-direct {p0, v0, p2, v1, v2}, Lcom/immomo/mediacore/audio/AudioProcess;->processsound_eq_H(Ljava/nio/ByteBuffer;ILjava/lang/Object;Ljava/nio/ByteBuffer;)V

    .line 93
    .line 94
    .line 95
    :cond_3
    iget-boolean v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mEnableAef:Z

    .line 96
    .line 97
    if-eqz v0, :cond_4

    .line 98
    .line 99
    iget-object v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mParams_Aef:Lcom/immomo/mediacore/audio/Ctrl_Params_Eq;

    .line 100
    .line 101
    iget v1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mChannal:I

    .line 102
    .line 103
    iput v1, v0, Lcom/immomo/mediacore/audio/Ctrl_Params_Eq;->nChannels:I

    .line 104
    .line 105
    iget v1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mFs:I

    .line 106
    .line 107
    iput v1, v0, Lcom/immomo/mediacore/audio/Ctrl_Params_Eq;->rate:I

    .line 108
    .line 109
    sget-boolean v0, Lcom/immomo/mediacore/audio/AudioProcess;->mIsLibLoaded:Z

    .line 110
    .line 111
    if-eqz v0, :cond_4

    .line 112
    .line 113
    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    iget-object v1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mParams_Aef:Lcom/immomo/mediacore/audio/Ctrl_Params_Eq;

    .line 118
    .line 119
    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 120
    .line 121
    .line 122
    move-result-object v2

    .line 123
    invoke-direct {p0, v0, p2, v1, v2}, Lcom/immomo/mediacore/audio/AudioProcess;->processsound_aef_H(Ljava/nio/ByteBuffer;ILjava/lang/Object;Ljava/nio/ByteBuffer;)V

    .line 124
    .line 125
    .line 126
    :cond_4
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 127
    .line 128
    .line 129
    move-result-object p2

    .line 130
    invoke-virtual {p2}, Ll/csx;->y0()Z

    .line 131
    .line 132
    .line 133
    move-result p2

    .line 134
    if-eqz p2, :cond_5

    .line 135
    .line 136
    iget-object p0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mElcEffect:Lcom/immomo/audioeffect/AudioEffect;

    .line 137
    .line 138
    if-eqz p0, :cond_5

    .line 139
    .line 140
    array-length p2, p1

    .line 141
    invoke-virtual {p0, p1, p2}, Lcom/immomo/audioeffect/AudioEffect;->d([BI)[B

    .line 142
    .line 143
    .line 144
    move-result-object p0

    .line 145
    return-object p0

    .line 146
    :cond_5
    :goto_0
    return-object p1
.end method

.method public processAudioMix([BI[B)V
    .locals 1

    .line 1
    :try_start_0
    sget-boolean v0, Lcom/immomo/mediacore/audio/AudioProcess;->mIsLibLoaded:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p3}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 10
    .line 11
    .line 12
    move-result-object p3

    .line 13
    invoke-direct {p0, p1, p2, p3}, Lcom/immomo/mediacore/audio/AudioProcess;->processsound_mix_H(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void

    .line 17
    :catch_0
    move-exception p0

    .line 18
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public processAudioPitch([BII)[B
    .locals 2

    .line 1
    new-instance v0, Lcom/immomo/mediacore/audio/Ctrl_Params_Tune;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/immomo/mediacore/audio/Ctrl_Params_Tune;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x2

    .line 7
    iput v1, v0, Lcom/immomo/mediacore/audio/Ctrl_Params_Tune;->nChannels:I

    .line 8
    .line 9
    iget v1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mFs:I

    .line 10
    .line 11
    iput v1, v0, Lcom/immomo/mediacore/audio/Ctrl_Params_Tune;->rate:I

    .line 12
    .line 13
    iput p3, v0, Lcom/immomo/mediacore/audio/Ctrl_Params_Tune;->pitch:I

    .line 14
    .line 15
    sget-boolean p3, Lcom/immomo/mediacore/audio/AudioProcess;->mIsLibLoaded:Z

    .line 16
    .line 17
    if-eqz p3, :cond_0

    .line 18
    .line 19
    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 20
    .line 21
    .line 22
    move-result-object p3

    .line 23
    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-direct {p0, p3, p2, v0, v1}, Lcom/immomo/mediacore/audio/AudioProcess;->processsound_tune_H(Ljava/nio/ByteBuffer;ILjava/lang/Object;Ljava/nio/ByteBuffer;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-object p1
.end method

.method public processStereoAudioData([BI)[B
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mMuteFilterEnable:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-array p0, p2, [B

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    invoke-direct {p0, p1, p2, v0}, Lcom/immomo/mediacore/audio/AudioProcess;->safeProcesssound_sabineef([BILjava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    iget-boolean v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mEnableEQ:Z

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    iget-boolean v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mEnableTune:Z

    .line 17
    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    iget-boolean v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mEnableAef:Z

    .line 21
    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    iget-boolean v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mEnableElcTune:Z

    .line 25
    .line 26
    if-nez v0, :cond_1

    .line 27
    .line 28
    iget-boolean v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mUseSoxEffect:Z

    .line 29
    .line 30
    if-nez v0, :cond_1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    iget-boolean v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mEnableTune:Z

    .line 34
    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    iget-object v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mParams_Tune:Lcom/immomo/mediacore/audio/Ctrl_Params_Tune;

    .line 38
    .line 39
    iget v1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mChannal:I

    .line 40
    .line 41
    iput v1, v0, Lcom/immomo/mediacore/audio/Ctrl_Params_Tune;->nChannels:I

    .line 42
    .line 43
    iget v1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mFs:I

    .line 44
    .line 45
    iput v1, v0, Lcom/immomo/mediacore/audio/Ctrl_Params_Tune;->rate:I

    .line 46
    .line 47
    sget-boolean v0, Lcom/immomo/mediacore/audio/AudioProcess;->mIsLibLoaded:Z

    .line 48
    .line 49
    if-eqz v0, :cond_2

    .line 50
    .line 51
    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    iget-object v1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mParams_Tune:Lcom/immomo/mediacore/audio/Ctrl_Params_Tune;

    .line 56
    .line 57
    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    invoke-direct {p0, v0, p2, v1, v2}, Lcom/immomo/mediacore/audio/AudioProcess;->processsound_tune_H(Ljava/nio/ByteBuffer;ILjava/lang/Object;Ljava/nio/ByteBuffer;)V

    .line 62
    .line 63
    .line 64
    :cond_2
    iget-boolean v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mEnableEQ:Z

    .line 65
    .line 66
    if-eqz v0, :cond_3

    .line 67
    .line 68
    iget-object v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mParams_Eq:Lcom/immomo/mediacore/audio/Ctrl_Params_Eq;

    .line 69
    .line 70
    iget v1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mChannal:I

    .line 71
    .line 72
    iput v1, v0, Lcom/immomo/mediacore/audio/Ctrl_Params_Eq;->nChannels:I

    .line 73
    .line 74
    iget v1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mFs:I

    .line 75
    .line 76
    iput v1, v0, Lcom/immomo/mediacore/audio/Ctrl_Params_Eq;->rate:I

    .line 77
    .line 78
    sget-boolean v0, Lcom/immomo/mediacore/audio/AudioProcess;->mIsLibLoaded:Z

    .line 79
    .line 80
    if-eqz v0, :cond_3

    .line 81
    .line 82
    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    iget-object v1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mParams_Eq:Lcom/immomo/mediacore/audio/Ctrl_Params_Eq;

    .line 87
    .line 88
    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    invoke-direct {p0, v0, p2, v1, v2}, Lcom/immomo/mediacore/audio/AudioProcess;->processsound_eq_H(Ljava/nio/ByteBuffer;ILjava/lang/Object;Ljava/nio/ByteBuffer;)V

    .line 93
    .line 94
    .line 95
    :cond_3
    iget-boolean v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mEnableAef:Z

    .line 96
    .line 97
    if-eqz v0, :cond_4

    .line 98
    .line 99
    iget-object v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mParams_Aef:Lcom/immomo/mediacore/audio/Ctrl_Params_Eq;

    .line 100
    .line 101
    iget v1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mChannal:I

    .line 102
    .line 103
    iput v1, v0, Lcom/immomo/mediacore/audio/Ctrl_Params_Eq;->nChannels:I

    .line 104
    .line 105
    iget v1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mFs:I

    .line 106
    .line 107
    iput v1, v0, Lcom/immomo/mediacore/audio/Ctrl_Params_Eq;->rate:I

    .line 108
    .line 109
    sget-boolean v0, Lcom/immomo/mediacore/audio/AudioProcess;->mIsLibLoaded:Z

    .line 110
    .line 111
    if-eqz v0, :cond_4

    .line 112
    .line 113
    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    iget-object v1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mParams_Aef:Lcom/immomo/mediacore/audio/Ctrl_Params_Eq;

    .line 118
    .line 119
    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 120
    .line 121
    .line 122
    move-result-object v2

    .line 123
    invoke-direct {p0, v0, p2, v1, v2}, Lcom/immomo/mediacore/audio/AudioProcess;->processsound_aef_H(Ljava/nio/ByteBuffer;ILjava/lang/Object;Ljava/nio/ByteBuffer;)V

    .line 124
    .line 125
    .line 126
    :cond_4
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    invoke-virtual {v0}, Ll/csx;->y0()Z

    .line 131
    .line 132
    .line 133
    move-result v0

    .line 134
    if-eqz v0, :cond_5

    .line 135
    .line 136
    iget-object p0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mElcEffect:Lcom/immomo/audioeffect/AudioEffect;

    .line 137
    .line 138
    if-eqz p0, :cond_5

    .line 139
    .line 140
    invoke-virtual {p0, p1, p2}, Lcom/immomo/audioeffect/AudioEffect;->d([BI)[B

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    return-object p0

    .line 145
    :cond_5
    :goto_0
    return-object p1
.end method

.method public putAudioData(Ll/oxd0;)V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mAudioFrames:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/concurrent/LinkedBlockingQueue;->offer(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :catch_0
    move-exception p0

    .line 8
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public putSurroundData(Ll/oxd0;)V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSurroundFrames:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/concurrent/LinkedBlockingQueue;->offer(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :catch_0
    move-exception p0

    .line 8
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public putSurroundExtraData(Ll/oxd0;)V
    .locals 2

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSurroundFrames_Extra:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/LinkedBlockingQueue;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/16 v1, 0xc8

    .line 8
    .line 9
    if-lt v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSurroundFrames_Extra:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/util/concurrent/LinkedBlockingQueue;->poll()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object p0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSurroundFrames_Extra:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ljava/util/concurrent/LinkedBlockingQueue;->offer(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :catch_0
    move-exception p0

    .line 23
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public putSurroundExtraData2(Ll/oxd0;)V
    .locals 2

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSurroundFrames_Extra2:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/LinkedBlockingQueue;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/16 v1, 0xc8

    .line 8
    .line 9
    if-lt v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSurroundFrames_Extra2:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/util/concurrent/LinkedBlockingQueue;->poll()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object p0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSurroundFrames_Extra2:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ljava/util/concurrent/LinkedBlockingQueue;->offer(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :catch_0
    move-exception p0

    .line 23
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public release()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/immomo/mediacore/audio/AudioProcess;->processsound_native_release()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mElcEffect:Lcom/immomo/audioeffect/AudioEffect;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/immomo/audioeffect/AudioEffect;->b()V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mElcEffect:Lcom/immomo/audioeffect/AudioEffect;

    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public setAudioEffectType(I)V
    .locals 3

    .line 1
    const/4 v0, -0x4

    .line 2
    const/4 v1, 0x0

    .line 3
    const/4 v2, 0x1

    .line 4
    packed-switch p1, :pswitch_data_0

    .line 5
    .line 6
    .line 7
    :pswitch_0
    return-void

    .line 8
    :pswitch_1
    invoke-virtual {p0, v0, v2}, Lcom/immomo/mediacore/audio/AudioProcess;->adjustTune(IZ)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :pswitch_2
    invoke-virtual {p0, v2}, Lcom/immomo/mediacore/audio/AudioProcess;->enableMuteFilter(Z)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :pswitch_3
    const/4 p1, 0x7

    .line 17
    invoke-virtual {p0, p1, v2}, Lcom/immomo/mediacore/audio/AudioProcess;->adjustTune(IZ)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :pswitch_4
    invoke-virtual {p0, v1, v1}, Lcom/immomo/mediacore/audio/AudioProcess;->adjustTune(IZ)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/immomo/mediacore/audio/AudioProcess;->SabineEffectReset_ex()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, v1}, Lcom/immomo/mediacore/audio/AudioProcess;->setElcEffect(Z)V

    .line 28
    .line 29
    .line 30
    invoke-direct {p0}, Lcom/immomo/mediacore/audio/AudioProcess;->sabineMcEQ()V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :pswitch_5
    const/16 p1, 0x9

    .line 35
    .line 36
    invoke-virtual {p0, p1, v2}, Lcom/immomo/mediacore/audio/AudioProcess;->adjustTune(IZ)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :pswitch_6
    const/4 p1, 0x6

    .line 41
    invoke-virtual {p0, p1, v2}, Lcom/immomo/mediacore/audio/AudioProcess;->adjustTune(IZ)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :pswitch_7
    invoke-virtual {p0, v0, v2}, Lcom/immomo/mediacore/audio/AudioProcess;->adjustTune(IZ)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :pswitch_8
    const/4 p1, 0x4

    .line 50
    invoke-virtual {p0, p1, v2}, Lcom/immomo/mediacore/audio/AudioProcess;->adjustAef(IZ)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :pswitch_9
    const/4 p1, 0x3

    .line 55
    invoke-virtual {p0, p1, v2}, Lcom/immomo/mediacore/audio/AudioProcess;->adjustAef(IZ)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :pswitch_a
    const/4 p1, 0x2

    .line 60
    invoke-virtual {p0, p1, v2}, Lcom/immomo/mediacore/audio/AudioProcess;->adjustAef(IZ)V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :pswitch_b
    invoke-virtual {p0, v2, v2}, Lcom/immomo/mediacore/audio/AudioProcess;->adjustAef(IZ)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :pswitch_c
    iput-boolean v1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mEnableElcTune:Z

    .line 69
    .line 70
    iput-boolean v1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mEnableEQ:Z

    .line 71
    .line 72
    iput-boolean v1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mEnableTune:Z

    .line 73
    .line 74
    iput-boolean v1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mEnableAef:Z

    .line 75
    .line 76
    iput-boolean v1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mMuteFilterEnable:Z

    .line 77
    .line 78
    return-void

    .line 79
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_0
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public setElcEffect(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mEnableElcTune:Z

    .line 2
    .line 3
    return-void
.end method

.method public setMasterAudioLevel(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mMasterAudioLecel:F

    .line 2
    .line 3
    return-void
.end method

.method public setMasterGain(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mMasterGain:F

    .line 2
    .line 3
    return-void
.end method

.method public setSabindenoiseLevel(I)V
    .locals 1

    .line 1
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/csx;->L0()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    int-to-float p1, p1

    .line 12
    const v0, 0x3e4ccccd    # 0.2f

    .line 13
    .line 14
    .line 15
    mul-float/2addr p1, v0

    .line 16
    const/4 v0, 0x1

    .line 17
    invoke-virtual {p0, v0, v0, p1}, Lcom/immomo/mediacore/audio/AudioProcess;->SabineEffectSet(IIF)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public setSlaveAudioGain(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSlaveGain:F

    .line 2
    .line 3
    return-void
.end method

.method public setSlaveAudioLevel(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mSlaveAudioLecel:F

    .line 2
    .line 3
    return-void
.end method

.method public setSoundEffect(I)V
    .locals 4

    .line 1
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/csx;->y0()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mElcEffect:Lcom/immomo/audioeffect/AudioEffect;

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    new-instance v0, Lcom/immomo/audioeffect/AudioEffect;

    .line 16
    .line 17
    invoke-direct {v0}, Lcom/immomo/audioeffect/AudioEffect;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mElcEffect:Lcom/immomo/audioeffect/AudioEffect;

    .line 21
    .line 22
    iget v1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mFs:I

    .line 23
    .line 24
    iget v2, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mChannal:I

    .line 25
    .line 26
    iget v3, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mLenMs:I

    .line 27
    .line 28
    invoke-virtual {v0, v1, v2, v3}, Lcom/immomo/audioeffect/AudioEffect;->e(III)V

    .line 29
    .line 30
    .line 31
    :cond_0
    iget-object v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mElcEffect:Lcom/immomo/audioeffect/AudioEffect;

    .line 32
    .line 33
    invoke-virtual {v0, p1}, Lcom/immomo/audioeffect/AudioEffect;->g(I)V

    .line 34
    .line 35
    .line 36
    const/4 p1, 0x1

    .line 37
    iput-boolean p1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mUseSoxEffect:Z

    .line 38
    .line 39
    :cond_1
    return-void
.end method

.method public startAudioProcessding()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/immomo/mediacore/audio/AudioProcess;->stopAudioProcessding()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mProcessing:Z

    .line 6
    .line 7
    new-instance v0, Ljava/lang/Thread;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mAudioProcessRunnable:Lcom/immomo/mediacore/audio/AudioProcess$AudioProcessRunnable;

    .line 10
    .line 11
    const-string v2, "live-media-AudioPro"

    .line 12
    .line 13
    invoke-direct {v0, v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mAudioProcessThread:Ljava/lang/Thread;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 19
    .line 20
    .line 21
    const-string p0, "AudioProcess"

    .line 22
    .line 23
    const-string v0, "startAudioProcessding"

    .line 24
    .line 25
    invoke-static {p0, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public stopAudioProcessding()V
    .locals 6

    .line 1
    const-string v0, "stopAudioProcessding begin"

    .line 2
    .line 3
    const-string v1, "AudioProcess"

    .line 4
    .line 5
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mAudioProcessThread:Ljava/lang/Thread;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    const/4 v2, 0x0

    .line 14
    :try_start_0
    iput-boolean v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mProcessing:Z

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/immomo/mediacore/audio/AudioProcess;->clear()V

    .line 17
    .line 18
    .line 19
    new-instance v0, Ll/oxd0;

    .line 20
    .line 21
    iget v3, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mChannal:I

    .line 22
    .line 23
    const-wide/16 v4, -0x3039

    .line 24
    .line 25
    invoke-direct {v0, v2, v4, v5, v3}, Ll/oxd0;-><init>([BJI)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, v0}, Lcom/immomo/mediacore/audio/AudioProcess;->putAudioData(Ll/oxd0;)V

    .line 29
    .line 30
    .line 31
    new-instance v0, Ll/oxd0;

    .line 32
    .line 33
    iget v3, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mChannal:I

    .line 34
    .line 35
    invoke-direct {v0, v2, v4, v5, v3}, Ll/oxd0;-><init>([BJI)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0, v0}, Lcom/immomo/mediacore/audio/AudioProcess;->putSurroundData(Ll/oxd0;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mAudioProcessThread:Ljava/lang/Thread;

    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/lang/Thread;->join()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :catch_0
    move-exception v0

    .line 48
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 49
    .line 50
    .line 51
    :goto_0
    iput-object v2, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mAudioProcessThread:Ljava/lang/Thread;

    .line 52
    .line 53
    :cond_0
    const-string p0, "stopAudioProcessding end"

    .line 54
    .line 55
    invoke-static {v1, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public take()Ll/oxd0;
    .locals 2

    .line 1
    const-string v0, "AudioProcess"

    .line 2
    .line 3
    const-string v1, "take"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mAudioProcessThread:Ljava/lang/Thread;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Lcom/immomo/mediacore/audio/AudioProcess;->mAudioProcessRunnable:Lcom/immomo/mediacore/audio/AudioProcess$AudioProcessRunnable;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/immomo/mediacore/audio/AudioProcess$AudioProcessRunnable;->take()Ll/oxd0;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return-object p0
.end method
