.class public final enum Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;

.field public static final enum AUDIO_TRACK_ERROR:Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;

.field public static final enum AUDIO_VOLUME_ERROR:Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;

.field public static final enum FILE_ERROR:Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;

.field public static final enum FILE_NOT_EXIST:Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;

.field public static final enum MIX_ID_ERROR:Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;

.field public static final enum NOT_JOIN_ROOM:Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;

.field public static final enum OK:Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;

.field public static final enum PARAM:Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;

.field public static final enum PITCH_ERROR:Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;

.field public static final enum POSITION_ERROR:Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;

.field public static final enum STARTING_ERROR:Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;

.field public static final enum START_ERROR:Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;

.field public static final enum TYPE_ERROR:Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .locals 16

    .line 1
    new-instance v0, Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;

    .line 2
    .line 3
    const-string v1, "OK"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;->OK:Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;

    .line 10
    .line 11
    new-instance v1, Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;

    .line 12
    .line 13
    const/4 v2, 0x1

    .line 14
    const/16 v3, -0xbcc

    .line 15
    .line 16
    const-string v4, "FILE_NOT_EXIST"

    .line 17
    .line 18
    invoke-direct {v1, v4, v2, v3}, Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;-><init>(Ljava/lang/String;II)V

    .line 19
    .line 20
    .line 21
    sput-object v1, Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;->FILE_NOT_EXIST:Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;

    .line 22
    .line 23
    new-instance v2, Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;

    .line 24
    .line 25
    const/4 v3, 0x2

    .line 26
    const/16 v4, -0xbcd

    .line 27
    .line 28
    const-string v5, "FILE_ERROR"

    .line 29
    .line 30
    invoke-direct {v2, v5, v3, v4}, Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;-><init>(Ljava/lang/String;II)V

    .line 31
    .line 32
    .line 33
    sput-object v2, Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;->FILE_ERROR:Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;

    .line 34
    .line 35
    new-instance v3, Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;

    .line 36
    .line 37
    const/4 v4, 0x3

    .line 38
    const/16 v5, -0xbce

    .line 39
    .line 40
    const-string v6, "NOT_JOIN_ROOM"

    .line 41
    .line 42
    invoke-direct {v3, v6, v4, v5}, Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;-><init>(Ljava/lang/String;II)V

    .line 43
    .line 44
    .line 45
    sput-object v3, Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;->NOT_JOIN_ROOM:Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;

    .line 46
    .line 47
    new-instance v4, Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;

    .line 48
    .line 49
    const/4 v5, 0x4

    .line 50
    const/16 v6, -0xbcf

    .line 51
    .line 52
    const-string v7, "PARAM"

    .line 53
    .line 54
    invoke-direct {v4, v7, v5, v6}, Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;-><init>(Ljava/lang/String;II)V

    .line 55
    .line 56
    .line 57
    sput-object v4, Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;->PARAM:Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;

    .line 58
    .line 59
    new-instance v5, Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;

    .line 60
    .line 61
    const/4 v6, 0x5

    .line 62
    const/16 v7, -0xbd0

    .line 63
    .line 64
    const-string v8, "START_ERROR"

    .line 65
    .line 66
    invoke-direct {v5, v8, v6, v7}, Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;-><init>(Ljava/lang/String;II)V

    .line 67
    .line 68
    .line 69
    sput-object v5, Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;->START_ERROR:Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;

    .line 70
    .line 71
    new-instance v6, Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;

    .line 72
    .line 73
    const/4 v7, 0x6

    .line 74
    const/16 v8, -0xbd1

    .line 75
    .line 76
    const-string v9, "MIX_ID_ERROR"

    .line 77
    .line 78
    invoke-direct {v6, v9, v7, v8}, Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;-><init>(Ljava/lang/String;II)V

    .line 79
    .line 80
    .line 81
    sput-object v6, Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;->MIX_ID_ERROR:Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;

    .line 82
    .line 83
    new-instance v7, Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;

    .line 84
    .line 85
    const/4 v8, 0x7

    .line 86
    const/16 v9, -0xbd2

    .line 87
    .line 88
    const-string v10, "POSITION_ERROR"

    .line 89
    .line 90
    invoke-direct {v7, v10, v8, v9}, Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;-><init>(Ljava/lang/String;II)V

    .line 91
    .line 92
    .line 93
    sput-object v7, Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;->POSITION_ERROR:Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;

    .line 94
    .line 95
    new-instance v8, Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;

    .line 96
    .line 97
    const/16 v9, 0x8

    .line 98
    .line 99
    const/16 v10, -0xbd3

    .line 100
    .line 101
    const-string v11, "AUDIO_VOLUME_ERROR"

    .line 102
    .line 103
    invoke-direct {v8, v11, v9, v10}, Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;-><init>(Ljava/lang/String;II)V

    .line 104
    .line 105
    .line 106
    sput-object v8, Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;->AUDIO_VOLUME_ERROR:Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;

    .line 107
    .line 108
    new-instance v9, Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;

    .line 109
    .line 110
    const/16 v10, 0x9

    .line 111
    .line 112
    const/16 v11, -0xbd4

    .line 113
    .line 114
    const-string v12, "TYPE_ERROR"

    .line 115
    .line 116
    invoke-direct {v9, v12, v10, v11}, Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;-><init>(Ljava/lang/String;II)V

    .line 117
    .line 118
    .line 119
    sput-object v9, Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;->TYPE_ERROR:Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;

    .line 120
    .line 121
    new-instance v10, Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;

    .line 122
    .line 123
    const/16 v11, 0xa

    .line 124
    .line 125
    const/16 v12, -0xbd5

    .line 126
    .line 127
    const-string v13, "PITCH_ERROR"

    .line 128
    .line 129
    invoke-direct {v10, v13, v11, v12}, Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;-><init>(Ljava/lang/String;II)V

    .line 130
    .line 131
    .line 132
    sput-object v10, Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;->PITCH_ERROR:Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;

    .line 133
    .line 134
    new-instance v11, Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;

    .line 135
    .line 136
    const/16 v12, 0xb

    .line 137
    .line 138
    const/16 v13, -0xbd6

    .line 139
    .line 140
    const-string v14, "AUDIO_TRACK_ERROR"

    .line 141
    .line 142
    invoke-direct {v11, v14, v12, v13}, Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;-><init>(Ljava/lang/String;II)V

    .line 143
    .line 144
    .line 145
    sput-object v11, Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;->AUDIO_TRACK_ERROR:Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;

    .line 146
    .line 147
    new-instance v12, Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;

    .line 148
    .line 149
    const/16 v13, 0xc

    .line 150
    .line 151
    const/16 v14, -0xbd7

    .line 152
    .line 153
    const-string v15, "STARTING_ERROR"

    .line 154
    .line 155
    invoke-direct {v12, v15, v13, v14}, Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;-><init>(Ljava/lang/String;II)V

    .line 156
    .line 157
    .line 158
    sput-object v12, Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;->STARTING_ERROR:Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;

    .line 159
    .line 160
    filled-new-array/range {v0 .. v12}, [Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    sput-object v0, Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;->$VALUES:[Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;

    .line 165
    .line 166
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
    iput p3, p0, Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static fromId(I)Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;
    .locals 5
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    invoke-static {}, Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;->values()[Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;

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
    invoke-virtual {v3}, Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;->value()I

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

.method public static valueOf(Ljava/lang/String;)Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;
    .locals 1

    .line 1
    const-class v0, Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;->$VALUES:[Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode$1;->$SwitchMap$com$ss$bytertc$ktv$data$KTVPlayerErrorCode:[I

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
    const-string p0, "KTV_PLAYER_ERROR_CODE_STARTING_ERROR"

    .line 16
    .line 17
    return-object p0

    .line 18
    :pswitch_1
    const-string p0, "KTV_PLAYER_ERROR_CODE_AUDIO_TRACK_ERROR"

    .line 19
    .line 20
    return-object p0

    .line 21
    :pswitch_2
    const-string p0, "KTV_PLAYER_ERROR_CODE_PITCH_ERROR"

    .line 22
    .line 23
    return-object p0

    .line 24
    :pswitch_3
    const-string p0, "KTV_PLAYER_ERROR_CODE_TYPE_ERROR"

    .line 25
    .line 26
    return-object p0

    .line 27
    :pswitch_4
    const-string p0, "KTV_PLAYER_ERROR_CODE_AUDIO_VOLUME_ERROR"

    .line 28
    .line 29
    return-object p0

    .line 30
    :pswitch_5
    const-string p0, "KTV_PLAYER_ERROR_CODE_POSITION_ERROR"

    .line 31
    .line 32
    return-object p0

    .line 33
    :pswitch_6
    const-string p0, "KTV_PLAYER_ERROR_CODE_MIX_ID_ERROR"

    .line 34
    .line 35
    return-object p0

    .line 36
    :pswitch_7
    const-string p0, "KTV_PLAYER_ERROR_CODE_START_ERROR"

    .line 37
    .line 38
    return-object p0

    .line 39
    :pswitch_8
    const-string p0, "KTV_PLAYER_ERROR_CODE_PARAM"

    .line 40
    .line 41
    return-object p0

    .line 42
    :pswitch_9
    const-string p0, "KTV_PLAYER_ERROR_CODE_NOT_JOIN_ROOM"

    .line 43
    .line 44
    return-object p0

    .line 45
    :pswitch_a
    const-string p0, "KTV_PLAYER_ERROR_CODE_FILE_ERROR"

    .line 46
    .line 47
    return-object p0

    .line 48
    :pswitch_b
    const-string p0, "KTV_PLAYER_ERROR_CODE_FILE_NOT_EXIST"

    .line 49
    .line 50
    return-object p0

    .line 51
    :pswitch_c
    const-string p0, "KTV_PLAYER_ERROR_CODE_OK"

    .line 52
    .line 53
    return-object p0

    .line 54
    nop

    .line 55
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_c
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
    iget p0, p0, Lcom/ss/bytertc/ktv/data/KTVPlayerErrorCode;->value:I

    .line 2
    .line 3
    return p0
.end method
