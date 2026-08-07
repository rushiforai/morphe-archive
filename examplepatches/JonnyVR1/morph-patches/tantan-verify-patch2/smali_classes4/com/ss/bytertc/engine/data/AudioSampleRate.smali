.class public final enum Lcom/ss/bytertc/engine/data/AudioSampleRate;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/ss/bytertc/engine/data/AudioSampleRate;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/ss/bytertc/engine/data/AudioSampleRate;

.field public static final enum AUDIO_SAMPLE_RATE_11025:Lcom/ss/bytertc/engine/data/AudioSampleRate;

.field public static final enum AUDIO_SAMPLE_RATE_16000:Lcom/ss/bytertc/engine/data/AudioSampleRate;

.field public static final enum AUDIO_SAMPLE_RATE_22050:Lcom/ss/bytertc/engine/data/AudioSampleRate;

.field public static final enum AUDIO_SAMPLE_RATE_24000:Lcom/ss/bytertc/engine/data/AudioSampleRate;

.field public static final enum AUDIO_SAMPLE_RATE_32000:Lcom/ss/bytertc/engine/data/AudioSampleRate;

.field public static final enum AUDIO_SAMPLE_RATE_44100:Lcom/ss/bytertc/engine/data/AudioSampleRate;

.field public static final enum AUDIO_SAMPLE_RATE_48000:Lcom/ss/bytertc/engine/data/AudioSampleRate;

.field public static final enum AUDIO_SAMPLE_RATE_8000:Lcom/ss/bytertc/engine/data/AudioSampleRate;

.field public static final enum AUDIO_SAMPLE_RATE_AUTO:Lcom/ss/bytertc/engine/data/AudioSampleRate;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .locals 12

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/data/AudioSampleRate;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, -0x1

    .line 5
    const-string v3, "AUDIO_SAMPLE_RATE_AUTO"

    .line 6
    .line 7
    invoke-direct {v0, v3, v1, v2}, Lcom/ss/bytertc/engine/data/AudioSampleRate;-><init>(Ljava/lang/String;II)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/ss/bytertc/engine/data/AudioSampleRate;->AUDIO_SAMPLE_RATE_AUTO:Lcom/ss/bytertc/engine/data/AudioSampleRate;

    .line 11
    .line 12
    new-instance v1, Lcom/ss/bytertc/engine/data/AudioSampleRate;

    .line 13
    .line 14
    const/4 v2, 0x1

    .line 15
    const/16 v3, 0x1f40

    .line 16
    .line 17
    const-string v4, "AUDIO_SAMPLE_RATE_8000"

    .line 18
    .line 19
    invoke-direct {v1, v4, v2, v3}, Lcom/ss/bytertc/engine/data/AudioSampleRate;-><init>(Ljava/lang/String;II)V

    .line 20
    .line 21
    .line 22
    sput-object v1, Lcom/ss/bytertc/engine/data/AudioSampleRate;->AUDIO_SAMPLE_RATE_8000:Lcom/ss/bytertc/engine/data/AudioSampleRate;

    .line 23
    .line 24
    new-instance v2, Lcom/ss/bytertc/engine/data/AudioSampleRate;

    .line 25
    .line 26
    const/4 v3, 0x2

    .line 27
    const/16 v4, 0x2b11

    .line 28
    .line 29
    const-string v5, "AUDIO_SAMPLE_RATE_11025"

    .line 30
    .line 31
    invoke-direct {v2, v5, v3, v4}, Lcom/ss/bytertc/engine/data/AudioSampleRate;-><init>(Ljava/lang/String;II)V

    .line 32
    .line 33
    .line 34
    sput-object v2, Lcom/ss/bytertc/engine/data/AudioSampleRate;->AUDIO_SAMPLE_RATE_11025:Lcom/ss/bytertc/engine/data/AudioSampleRate;

    .line 35
    .line 36
    new-instance v3, Lcom/ss/bytertc/engine/data/AudioSampleRate;

    .line 37
    .line 38
    const/4 v4, 0x3

    .line 39
    const/16 v5, 0x3e80

    .line 40
    .line 41
    const-string v6, "AUDIO_SAMPLE_RATE_16000"

    .line 42
    .line 43
    invoke-direct {v3, v6, v4, v5}, Lcom/ss/bytertc/engine/data/AudioSampleRate;-><init>(Ljava/lang/String;II)V

    .line 44
    .line 45
    .line 46
    sput-object v3, Lcom/ss/bytertc/engine/data/AudioSampleRate;->AUDIO_SAMPLE_RATE_16000:Lcom/ss/bytertc/engine/data/AudioSampleRate;

    .line 47
    .line 48
    new-instance v4, Lcom/ss/bytertc/engine/data/AudioSampleRate;

    .line 49
    .line 50
    const/4 v5, 0x4

    .line 51
    const/16 v6, 0x5622

    .line 52
    .line 53
    const-string v7, "AUDIO_SAMPLE_RATE_22050"

    .line 54
    .line 55
    invoke-direct {v4, v7, v5, v6}, Lcom/ss/bytertc/engine/data/AudioSampleRate;-><init>(Ljava/lang/String;II)V

    .line 56
    .line 57
    .line 58
    sput-object v4, Lcom/ss/bytertc/engine/data/AudioSampleRate;->AUDIO_SAMPLE_RATE_22050:Lcom/ss/bytertc/engine/data/AudioSampleRate;

    .line 59
    .line 60
    new-instance v5, Lcom/ss/bytertc/engine/data/AudioSampleRate;

    .line 61
    .line 62
    const/4 v6, 0x5

    .line 63
    const/16 v7, 0x5dc0

    .line 64
    .line 65
    const-string v8, "AUDIO_SAMPLE_RATE_24000"

    .line 66
    .line 67
    invoke-direct {v5, v8, v6, v7}, Lcom/ss/bytertc/engine/data/AudioSampleRate;-><init>(Ljava/lang/String;II)V

    .line 68
    .line 69
    .line 70
    sput-object v5, Lcom/ss/bytertc/engine/data/AudioSampleRate;->AUDIO_SAMPLE_RATE_24000:Lcom/ss/bytertc/engine/data/AudioSampleRate;

    .line 71
    .line 72
    new-instance v6, Lcom/ss/bytertc/engine/data/AudioSampleRate;

    .line 73
    .line 74
    const/4 v7, 0x6

    .line 75
    const/16 v8, 0x7d00

    .line 76
    .line 77
    const-string v9, "AUDIO_SAMPLE_RATE_32000"

    .line 78
    .line 79
    invoke-direct {v6, v9, v7, v8}, Lcom/ss/bytertc/engine/data/AudioSampleRate;-><init>(Ljava/lang/String;II)V

    .line 80
    .line 81
    .line 82
    sput-object v6, Lcom/ss/bytertc/engine/data/AudioSampleRate;->AUDIO_SAMPLE_RATE_32000:Lcom/ss/bytertc/engine/data/AudioSampleRate;

    .line 83
    .line 84
    new-instance v7, Lcom/ss/bytertc/engine/data/AudioSampleRate;

    .line 85
    .line 86
    const/4 v8, 0x7

    .line 87
    const v9, 0xac44

    .line 88
    .line 89
    .line 90
    const-string v10, "AUDIO_SAMPLE_RATE_44100"

    .line 91
    .line 92
    invoke-direct {v7, v10, v8, v9}, Lcom/ss/bytertc/engine/data/AudioSampleRate;-><init>(Ljava/lang/String;II)V

    .line 93
    .line 94
    .line 95
    sput-object v7, Lcom/ss/bytertc/engine/data/AudioSampleRate;->AUDIO_SAMPLE_RATE_44100:Lcom/ss/bytertc/engine/data/AudioSampleRate;

    .line 96
    .line 97
    new-instance v8, Lcom/ss/bytertc/engine/data/AudioSampleRate;

    .line 98
    .line 99
    const/16 v9, 0x8

    .line 100
    .line 101
    const v10, 0xbb80

    .line 102
    .line 103
    .line 104
    const-string v11, "AUDIO_SAMPLE_RATE_48000"

    .line 105
    .line 106
    invoke-direct {v8, v11, v9, v10}, Lcom/ss/bytertc/engine/data/AudioSampleRate;-><init>(Ljava/lang/String;II)V

    .line 107
    .line 108
    .line 109
    sput-object v8, Lcom/ss/bytertc/engine/data/AudioSampleRate;->AUDIO_SAMPLE_RATE_48000:Lcom/ss/bytertc/engine/data/AudioSampleRate;

    .line 110
    .line 111
    filled-new-array/range {v0 .. v8}, [Lcom/ss/bytertc/engine/data/AudioSampleRate;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    sput-object v0, Lcom/ss/bytertc/engine/data/AudioSampleRate;->$VALUES:[Lcom/ss/bytertc/engine/data/AudioSampleRate;

    .line 116
    .line 117
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput p3, p0, Lcom/ss/bytertc/engine/data/AudioSampleRate;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static fromId(I)Lcom/ss/bytertc/engine/data/AudioSampleRate;
    .locals 5
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    invoke-static {}, Lcom/ss/bytertc/engine/data/AudioSampleRate;->values()[Lcom/ss/bytertc/engine/data/AudioSampleRate;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    array-length v1, v0

    .line 6
    const/4 v2, 0x0

    .line 7
    :goto_0
    if-ge v2, v1, :cond_1

    .line 8
    .line 9
    aget-object v3, v0, v2

    .line 10
    .line 11
    invoke-virtual {v3}, Lcom/ss/bytertc/engine/data/AudioSampleRate;->value()I

    .line 12
    .line 13
    .line 14
    move-result v4

    .line 15
    if-ne v4, p0, :cond_0

    .line 16
    .line 17
    return-object v3

    .line 18
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    const/4 p0, 0x0

    .line 22
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/ss/bytertc/engine/data/AudioSampleRate;
    .locals 1

    .line 1
    const-class v0, Lcom/ss/bytertc/engine/data/AudioSampleRate;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/ss/bytertc/engine/data/AudioSampleRate;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/ss/bytertc/engine/data/AudioSampleRate;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/data/AudioSampleRate;->$VALUES:[Lcom/ss/bytertc/engine/data/AudioSampleRate;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/ss/bytertc/engine/data/AudioSampleRate;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/ss/bytertc/engine/data/AudioSampleRate;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/data/AudioSampleRate$1;->$SwitchMap$com$ss$bytertc$engine$data$AudioSampleRate:[I

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    aget p0, v0, p0

    .line 8
    .line 9
    packed-switch p0, :pswitch_data_0

    .line 10
    .line 11
    .line 12
    const-string p0, ""

    .line 13
    .line 14
    return-object p0

    .line 15
    :pswitch_0
    const-string p0, "kAudioSampleRate48000"

    .line 16
    .line 17
    return-object p0

    .line 18
    :pswitch_1
    const-string p0, "kAudioSampleRate44100"

    .line 19
    .line 20
    return-object p0

    .line 21
    :pswitch_2
    const-string p0, "kAudioSampleRate32000"

    .line 22
    .line 23
    return-object p0

    .line 24
    :pswitch_3
    const-string p0, "kAudioSampleRate24000"

    .line 25
    .line 26
    return-object p0

    .line 27
    :pswitch_4
    const-string p0, "kAudioSampleRate22050"

    .line 28
    .line 29
    return-object p0

    .line 30
    :pswitch_5
    const-string p0, "kAudioSampleRate16000"

    .line 31
    .line 32
    return-object p0

    .line 33
    :pswitch_6
    const-string p0, "kAudioSampleRate11025"

    .line 34
    .line 35
    return-object p0

    .line 36
    :pswitch_7
    const-string p0, "kAudioSampleRate8000"

    .line 37
    .line 38
    return-object p0

    .line 39
    :pswitch_8
    const-string p0, "kAudioSampleRateAuto"

    .line 40
    .line 41
    return-object p0

    .line 42
    nop

    .line 43
    :pswitch_data_0
    .packed-switch 0x1
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

.method public value()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/data/AudioSampleRate;->value:I

    .line 2
    .line 3
    return p0
.end method
