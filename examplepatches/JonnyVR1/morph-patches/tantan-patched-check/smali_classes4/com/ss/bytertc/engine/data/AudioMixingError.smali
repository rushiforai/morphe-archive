.class public final enum Lcom/ss/bytertc/engine/data/AudioMixingError;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/ss/bytertc/engine/data/AudioMixingError;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/ss/bytertc/engine/data/AudioMixingError;

.field public static final enum AUDIO_MIXING_ERROR_ID_NOT_FOUND:Lcom/ss/bytertc/engine/data/AudioMixingError;

.field public static final enum AUDIO_MIXING_ERROR_ID_TYPE_INVALID_PITCH:Lcom/ss/bytertc/engine/data/AudioMixingError;

.field public static final enum AUDIO_MIXING_ERROR_ID_TYPE_NOT_MATCH:Lcom/ss/bytertc/engine/data/AudioMixingError;

.field public static final enum AUDIO_MIXING_ERROR_INVALID_AUDIO_TRACK:Lcom/ss/bytertc/engine/data/AudioMixingError;

.field public static final enum AUDIO_MIXING_ERROR_INVALID_PLAYBACK_SPEED:Lcom/ss/bytertc/engine/data/AudioMixingError;

.field public static final enum AUDIO_MIXING_ERROR_INVALID_VOLUME:Lcom/ss/bytertc/engine/data/AudioMixingError;

.field public static final enum AUDIO_MIXING_ERROR_IS_STARTING:Lcom/ss/bytertc/engine/data/AudioMixingError;

.field public static final enum AUDIO_MIXING_ERROR_LOAD_CONFLICT:Lcom/ss/bytertc/engine/data/AudioMixingError;

.field public static final enum AUDIO_MIXING_ERROR_OK:Lcom/ss/bytertc/engine/data/AudioMixingError;

.field public static final enum AUDIO_MIXING_ERROR_PRELOAD_FAILED:Lcom/ss/bytertc/engine/data/AudioMixingError;

.field public static final enum AUDIO_MIXING_ERROR_SET_POSITION_FAILED:Lcom/ss/bytertc/engine/data/AudioMixingError;

.field public static final enum AUDIO_MIXING_ERROR_START_FAILED:Lcom/ss/bytertc/engine/data/AudioMixingError;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .locals 14

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/data/AudioMixingError;

    .line 2
    .line 3
    const-string v1, "AUDIO_MIXING_ERROR_OK"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lcom/ss/bytertc/engine/data/AudioMixingError;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/ss/bytertc/engine/data/AudioMixingError;->AUDIO_MIXING_ERROR_OK:Lcom/ss/bytertc/engine/data/AudioMixingError;

    .line 10
    .line 11
    new-instance v1, Lcom/ss/bytertc/engine/data/AudioMixingError;

    .line 12
    .line 13
    const-string v2, "AUDIO_MIXING_ERROR_PRELOAD_FAILED"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v1, v2, v3, v3}, Lcom/ss/bytertc/engine/data/AudioMixingError;-><init>(Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    sput-object v1, Lcom/ss/bytertc/engine/data/AudioMixingError;->AUDIO_MIXING_ERROR_PRELOAD_FAILED:Lcom/ss/bytertc/engine/data/AudioMixingError;

    .line 20
    .line 21
    new-instance v2, Lcom/ss/bytertc/engine/data/AudioMixingError;

    .line 22
    .line 23
    const-string v3, "AUDIO_MIXING_ERROR_START_FAILED"

    .line 24
    .line 25
    const/4 v4, 0x2

    .line 26
    invoke-direct {v2, v3, v4, v4}, Lcom/ss/bytertc/engine/data/AudioMixingError;-><init>(Ljava/lang/String;II)V

    .line 27
    .line 28
    .line 29
    sput-object v2, Lcom/ss/bytertc/engine/data/AudioMixingError;->AUDIO_MIXING_ERROR_START_FAILED:Lcom/ss/bytertc/engine/data/AudioMixingError;

    .line 30
    .line 31
    new-instance v3, Lcom/ss/bytertc/engine/data/AudioMixingError;

    .line 32
    .line 33
    const-string v4, "AUDIO_MIXING_ERROR_ID_NOT_FOUND"

    .line 34
    .line 35
    const/4 v5, 0x3

    .line 36
    invoke-direct {v3, v4, v5, v5}, Lcom/ss/bytertc/engine/data/AudioMixingError;-><init>(Ljava/lang/String;II)V

    .line 37
    .line 38
    .line 39
    sput-object v3, Lcom/ss/bytertc/engine/data/AudioMixingError;->AUDIO_MIXING_ERROR_ID_NOT_FOUND:Lcom/ss/bytertc/engine/data/AudioMixingError;

    .line 40
    .line 41
    new-instance v4, Lcom/ss/bytertc/engine/data/AudioMixingError;

    .line 42
    .line 43
    const-string v5, "AUDIO_MIXING_ERROR_SET_POSITION_FAILED"

    .line 44
    .line 45
    const/4 v6, 0x4

    .line 46
    invoke-direct {v4, v5, v6, v6}, Lcom/ss/bytertc/engine/data/AudioMixingError;-><init>(Ljava/lang/String;II)V

    .line 47
    .line 48
    .line 49
    sput-object v4, Lcom/ss/bytertc/engine/data/AudioMixingError;->AUDIO_MIXING_ERROR_SET_POSITION_FAILED:Lcom/ss/bytertc/engine/data/AudioMixingError;

    .line 50
    .line 51
    new-instance v5, Lcom/ss/bytertc/engine/data/AudioMixingError;

    .line 52
    .line 53
    const-string v6, "AUDIO_MIXING_ERROR_INVALID_VOLUME"

    .line 54
    .line 55
    const/4 v7, 0x5

    .line 56
    invoke-direct {v5, v6, v7, v7}, Lcom/ss/bytertc/engine/data/AudioMixingError;-><init>(Ljava/lang/String;II)V

    .line 57
    .line 58
    .line 59
    sput-object v5, Lcom/ss/bytertc/engine/data/AudioMixingError;->AUDIO_MIXING_ERROR_INVALID_VOLUME:Lcom/ss/bytertc/engine/data/AudioMixingError;

    .line 60
    .line 61
    new-instance v6, Lcom/ss/bytertc/engine/data/AudioMixingError;

    .line 62
    .line 63
    const-string v7, "AUDIO_MIXING_ERROR_LOAD_CONFLICT"

    .line 64
    .line 65
    const/4 v8, 0x6

    .line 66
    invoke-direct {v6, v7, v8, v8}, Lcom/ss/bytertc/engine/data/AudioMixingError;-><init>(Ljava/lang/String;II)V

    .line 67
    .line 68
    .line 69
    sput-object v6, Lcom/ss/bytertc/engine/data/AudioMixingError;->AUDIO_MIXING_ERROR_LOAD_CONFLICT:Lcom/ss/bytertc/engine/data/AudioMixingError;

    .line 70
    .line 71
    new-instance v7, Lcom/ss/bytertc/engine/data/AudioMixingError;

    .line 72
    .line 73
    const-string v8, "AUDIO_MIXING_ERROR_ID_TYPE_NOT_MATCH"

    .line 74
    .line 75
    const/4 v9, 0x7

    .line 76
    invoke-direct {v7, v8, v9, v9}, Lcom/ss/bytertc/engine/data/AudioMixingError;-><init>(Ljava/lang/String;II)V

    .line 77
    .line 78
    .line 79
    sput-object v7, Lcom/ss/bytertc/engine/data/AudioMixingError;->AUDIO_MIXING_ERROR_ID_TYPE_NOT_MATCH:Lcom/ss/bytertc/engine/data/AudioMixingError;

    .line 80
    .line 81
    new-instance v8, Lcom/ss/bytertc/engine/data/AudioMixingError;

    .line 82
    .line 83
    const-string v9, "AUDIO_MIXING_ERROR_ID_TYPE_INVALID_PITCH"

    .line 84
    .line 85
    const/16 v10, 0x8

    .line 86
    .line 87
    invoke-direct {v8, v9, v10, v10}, Lcom/ss/bytertc/engine/data/AudioMixingError;-><init>(Ljava/lang/String;II)V

    .line 88
    .line 89
    .line 90
    sput-object v8, Lcom/ss/bytertc/engine/data/AudioMixingError;->AUDIO_MIXING_ERROR_ID_TYPE_INVALID_PITCH:Lcom/ss/bytertc/engine/data/AudioMixingError;

    .line 91
    .line 92
    new-instance v9, Lcom/ss/bytertc/engine/data/AudioMixingError;

    .line 93
    .line 94
    const-string v10, "AUDIO_MIXING_ERROR_INVALID_AUDIO_TRACK"

    .line 95
    .line 96
    const/16 v11, 0x9

    .line 97
    .line 98
    invoke-direct {v9, v10, v11, v11}, Lcom/ss/bytertc/engine/data/AudioMixingError;-><init>(Ljava/lang/String;II)V

    .line 99
    .line 100
    .line 101
    sput-object v9, Lcom/ss/bytertc/engine/data/AudioMixingError;->AUDIO_MIXING_ERROR_INVALID_AUDIO_TRACK:Lcom/ss/bytertc/engine/data/AudioMixingError;

    .line 102
    .line 103
    new-instance v10, Lcom/ss/bytertc/engine/data/AudioMixingError;

    .line 104
    .line 105
    const-string v11, "AUDIO_MIXING_ERROR_IS_STARTING"

    .line 106
    .line 107
    const/16 v12, 0xa

    .line 108
    .line 109
    invoke-direct {v10, v11, v12, v12}, Lcom/ss/bytertc/engine/data/AudioMixingError;-><init>(Ljava/lang/String;II)V

    .line 110
    .line 111
    .line 112
    sput-object v10, Lcom/ss/bytertc/engine/data/AudioMixingError;->AUDIO_MIXING_ERROR_IS_STARTING:Lcom/ss/bytertc/engine/data/AudioMixingError;

    .line 113
    .line 114
    new-instance v11, Lcom/ss/bytertc/engine/data/AudioMixingError;

    .line 115
    .line 116
    const-string v12, "AUDIO_MIXING_ERROR_INVALID_PLAYBACK_SPEED"

    .line 117
    .line 118
    const/16 v13, 0xb

    .line 119
    .line 120
    invoke-direct {v11, v12, v13, v13}, Lcom/ss/bytertc/engine/data/AudioMixingError;-><init>(Ljava/lang/String;II)V

    .line 121
    .line 122
    .line 123
    sput-object v11, Lcom/ss/bytertc/engine/data/AudioMixingError;->AUDIO_MIXING_ERROR_INVALID_PLAYBACK_SPEED:Lcom/ss/bytertc/engine/data/AudioMixingError;

    .line 124
    .line 125
    filled-new-array/range {v0 .. v11}, [Lcom/ss/bytertc/engine/data/AudioMixingError;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    sput-object v0, Lcom/ss/bytertc/engine/data/AudioMixingError;->$VALUES:[Lcom/ss/bytertc/engine/data/AudioMixingError;

    .line 130
    .line 131
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
    iput p3, p0, Lcom/ss/bytertc/engine/data/AudioMixingError;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static fromId(I)Lcom/ss/bytertc/engine/data/AudioMixingError;
    .locals 5
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    invoke-static {}, Lcom/ss/bytertc/engine/data/AudioMixingError;->values()[Lcom/ss/bytertc/engine/data/AudioMixingError;

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
    invoke-virtual {v3}, Lcom/ss/bytertc/engine/data/AudioMixingError;->value()I

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

.method public static valueOf(Ljava/lang/String;)Lcom/ss/bytertc/engine/data/AudioMixingError;
    .locals 1

    .line 1
    const-class v0, Lcom/ss/bytertc/engine/data/AudioMixingError;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/ss/bytertc/engine/data/AudioMixingError;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/ss/bytertc/engine/data/AudioMixingError;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/data/AudioMixingError;->$VALUES:[Lcom/ss/bytertc/engine/data/AudioMixingError;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/ss/bytertc/engine/data/AudioMixingError;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/ss/bytertc/engine/data/AudioMixingError;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/data/AudioMixingError$1;->$SwitchMap$com$ss$bytertc$engine$data$AudioMixingError:[I

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
    const-string p0, "AUDIO_MIXING_ERROR_INVALID_PLAYBACK_SPEED"

    .line 16
    .line 17
    return-object p0

    .line 18
    :pswitch_1
    const-string p0, "AUDIO_MIXING_ERROR_IS_STARTING"

    .line 19
    .line 20
    return-object p0

    .line 21
    :pswitch_2
    const-string p0, "AUDIO_MIXING_ERROR_INVALID_AUDIO_TRACK"

    .line 22
    .line 23
    return-object p0

    .line 24
    :pswitch_3
    const-string p0, "AUDIO_MIXING_ERROR_ID_TYPE_INVALID_PITCH"

    .line 25
    .line 26
    return-object p0

    .line 27
    :pswitch_4
    const-string p0, "AUDIO_MIXING_ERROR_ID_TYPE_NOT_MATCH"

    .line 28
    .line 29
    return-object p0

    .line 30
    :pswitch_5
    const-string p0, "AUDIO_MIXING_ERROR_LOAD_CONFLICT"

    .line 31
    .line 32
    return-object p0

    .line 33
    :pswitch_6
    const-string p0, "AUDIO_MIXING_ERROR_INVALID_VOLUME"

    .line 34
    .line 35
    return-object p0

    .line 36
    :pswitch_7
    const-string p0, "AUDIO_MIXING_ERROR_SET_POSITION_FAILED"

    .line 37
    .line 38
    return-object p0

    .line 39
    :pswitch_8
    const-string p0, "AUDIO_MIXING_ERROR_ID_NOT_FOUND"

    .line 40
    .line 41
    return-object p0

    .line 42
    :pswitch_9
    const-string p0, "AUDIO_MIXING_ERROR_START_FAILED"

    .line 43
    .line 44
    return-object p0

    .line 45
    :pswitch_a
    const-string p0, "AUDIO_MIXING_ERROR_PRELOAD_FAILED"

    .line 46
    .line 47
    return-object p0

    .line 48
    :pswitch_b
    const-string p0, "AUDIO_MIXING_ERROR_OK"

    .line 49
    .line 50
    return-object p0

    .line 51
    :pswitch_data_0
    .packed-switch 0x1
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

.method public value()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/data/AudioMixingError;->value:I

    .line 2
    .line 3
    return p0
.end method
