.class public Lcom/bef/effectsdk/EffectSDKBuildConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static ENABLE_AUDIO_EFFECT:I = 0x0

.field private static ENABLE_BORINGSSL:I = 0x0

.field private static ENABLE_BYTEBENCH:I = 0x0

.field private static ENABLE_FFMPEG:I = 0x0

.field private static ENABLE_IES_APPLOGGER:I = 0x0

.field private static ENABLE_JAZZ:I = 0x1

.field private static ENABLE_LENS:I

.field private static ENABLE_SPEECH_ASR:I

.field private static ENABLE_SPEECH_CAPT:I

.field private static ENABLE_VC0:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static getAarVersion()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/bef/effectsdk/BuildConfig;->FULL_VERSION:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static getEffectLibs()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "c++_shared"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    sget v1, Lcom/bef/effectsdk/EffectSDKBuildConfig;->ENABLE_BYTEBENCH:I

    .line 12
    .line 13
    const/4 v2, 0x1

    .line 14
    if-ne v1, v2, :cond_0

    .line 15
    .line 16
    const-string v1, "bytebench"

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    :cond_0
    sget v1, Lcom/bef/effectsdk/EffectSDKBuildConfig;->ENABLE_BORINGSSL:I

    .line 22
    .line 23
    if-eq v1, v2, :cond_1

    .line 24
    .line 25
    sget v1, Lcom/bef/effectsdk/EffectSDKBuildConfig;->ENABLE_FFMPEG:I

    .line 26
    .line 27
    if-ne v1, v2, :cond_2

    .line 28
    .line 29
    :cond_1
    const-string v1, "ttcrypto"

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    const-string v1, "ttboringssl"

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    :cond_2
    sget v1, Lcom/bef/effectsdk/EffectSDKBuildConfig;->ENABLE_FFMPEG:I

    .line 40
    .line 41
    if-ne v1, v2, :cond_3

    .line 42
    .line 43
    const-string v1, "ttffmpeg"

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    :cond_3
    sget v1, Lcom/bef/effectsdk/EffectSDKBuildConfig;->ENABLE_IES_APPLOGGER:I

    .line 49
    .line 50
    if-ne v1, v2, :cond_4

    .line 51
    .line 52
    const-string v1, "iesapplogger"

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    :cond_4
    const-string v1, "bytenn"

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    sget v1, Lcom/bef/effectsdk/EffectSDKBuildConfig;->ENABLE_AUDIO_EFFECT:I

    .line 63
    .line 64
    if-ne v1, v2, :cond_5

    .line 65
    .line 66
    const-string v1, "audioeffect"

    .line 67
    .line 68
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    :cond_5
    sget v1, Lcom/bef/effectsdk/EffectSDKBuildConfig;->ENABLE_SPEECH_CAPT:I

    .line 72
    .line 73
    if-eq v1, v2, :cond_6

    .line 74
    .line 75
    sget v1, Lcom/bef/effectsdk/EffectSDKBuildConfig;->ENABLE_SPEECH_ASR:I

    .line 76
    .line 77
    if-ne v1, v2, :cond_7

    .line 78
    .line 79
    :cond_6
    const-string v1, "speechsdk"

    .line 80
    .line 81
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    :cond_7
    const-string v1, "gaia_lib"

    .line 85
    .line 86
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    const-string v1, "AGFX"

    .line 90
    .line 91
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    sget v1, Lcom/bef/effectsdk/EffectSDKBuildConfig;->ENABLE_LENS:I

    .line 95
    .line 96
    if-ne v1, v2, :cond_8

    .line 97
    .line 98
    const-string v1, "lens"

    .line 99
    .line 100
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    :cond_8
    sget v1, Lcom/bef/effectsdk/EffectSDKBuildConfig;->ENABLE_JAZZ:I

    .line 104
    .line 105
    if-ne v1, v2, :cond_9

    .line 106
    .line 107
    const-string v1, "napi"

    .line 108
    .line 109
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    const-string v1, "quick"

    .line 113
    .line 114
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    const-string v1, "jazz"

    .line 118
    .line 119
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    :cond_9
    sget v1, Lcom/bef/effectsdk/EffectSDKBuildConfig;->ENABLE_VC0:I

    .line 123
    .line 124
    if-ne v1, v2, :cond_a

    .line 125
    .line 126
    const-string v1, "bytevc0"

    .line 127
    .line 128
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 129
    .line 130
    .line 131
    :cond_a
    const-string v1, "effect"

    .line 132
    .line 133
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    return-object v0
.end method

.method public static getSdkVersion()Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "16.8.0"

    .line 2
    .line 3
    return-object v0
.end method
