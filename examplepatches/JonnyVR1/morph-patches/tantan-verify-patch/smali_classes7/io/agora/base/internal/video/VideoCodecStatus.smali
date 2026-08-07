.class public final enum Lio/agora/base/internal/video/VideoCodecStatus;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/agora/base/internal/video/VideoCodecStatus;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/agora/base/internal/video/VideoCodecStatus;

.field public static final enum CODEC_RESET_DECODER:Lio/agora/base/internal/video/VideoCodecStatus;

.field public static final enum ERROR:Lio/agora/base/internal/video/VideoCodecStatus;

.field public static final enum ERROR_CODEC_OUTPUT_FAILURE:Lio/agora/base/internal/video/VideoCodecStatus;

.field public static final enum ERR_PARAMETER:Lio/agora/base/internal/video/VideoCodecStatus;

.field public static final enum ERR_REQUEST_SLI:Lio/agora/base/internal/video/VideoCodecStatus;

.field public static final enum ERR_SIZE:Lio/agora/base/internal/video/VideoCodecStatus;

.field public static final enum FALLBACK_DEFAULT_PROFILE:Lio/agora/base/internal/video/VideoCodecStatus;

.field public static final enum FALLBACK_SOFTWARE:Lio/agora/base/internal/video/VideoCodecStatus;

.field public static final enum LEVEL_EXCEEDED:Lio/agora/base/internal/video/VideoCodecStatus;

.field public static final enum MEMORY:Lio/agora/base/internal/video/VideoCodecStatus;

.field public static final enum NO_OUTPUT:Lio/agora/base/internal/video/VideoCodecStatus;

.field public static final enum OK:Lio/agora/base/internal/video/VideoCodecStatus;

.field public static final enum REQUEST_SLI:Lio/agora/base/internal/video/VideoCodecStatus;

.field public static final enum SIMULCAST_PARAMETERS_NOT_SUPPORTED:Lio/agora/base/internal/video/VideoCodecStatus;

.field public static final enum TARGET_BITRATE_OVERSHOOT:Lio/agora/base/internal/video/VideoCodecStatus;

.field public static final enum TIMEOUT:Lio/agora/base/internal/video/VideoCodecStatus;

.field public static final enum UNINITIALIZED:Lio/agora/base/internal/video/VideoCodecStatus;


# instance fields
.field private final number:I


# direct methods
.method static constructor <clinit>()V
    .locals 20

    .line 1
    new-instance v1, Lio/agora/base/internal/video/VideoCodecStatus;

    .line 2
    .line 3
    const-string v0, "REQUEST_SLI"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x2

    .line 7
    invoke-direct {v1, v0, v2, v3}, Lio/agora/base/internal/video/VideoCodecStatus;-><init>(Ljava/lang/String;II)V

    .line 8
    .line 9
    .line 10
    sput-object v1, Lio/agora/base/internal/video/VideoCodecStatus;->REQUEST_SLI:Lio/agora/base/internal/video/VideoCodecStatus;

    .line 11
    .line 12
    new-instance v0, Lio/agora/base/internal/video/VideoCodecStatus;

    .line 13
    .line 14
    const-string v4, "NO_OUTPUT"

    .line 15
    .line 16
    const/4 v5, 0x1

    .line 17
    invoke-direct {v0, v4, v5, v5}, Lio/agora/base/internal/video/VideoCodecStatus;-><init>(Ljava/lang/String;II)V

    .line 18
    .line 19
    .line 20
    sput-object v0, Lio/agora/base/internal/video/VideoCodecStatus;->NO_OUTPUT:Lio/agora/base/internal/video/VideoCodecStatus;

    .line 21
    .line 22
    new-instance v4, Lio/agora/base/internal/video/VideoCodecStatus;

    .line 23
    .line 24
    const-string v5, "OK"

    .line 25
    .line 26
    invoke-direct {v4, v5, v3, v2}, Lio/agora/base/internal/video/VideoCodecStatus;-><init>(Ljava/lang/String;II)V

    .line 27
    .line 28
    .line 29
    sput-object v4, Lio/agora/base/internal/video/VideoCodecStatus;->OK:Lio/agora/base/internal/video/VideoCodecStatus;

    .line 30
    .line 31
    move-object v3, v4

    .line 32
    new-instance v4, Lio/agora/base/internal/video/VideoCodecStatus;

    .line 33
    .line 34
    const/4 v2, 0x3

    .line 35
    const/4 v5, -0x1

    .line 36
    const-string v6, "ERROR"

    .line 37
    .line 38
    invoke-direct {v4, v6, v2, v5}, Lio/agora/base/internal/video/VideoCodecStatus;-><init>(Ljava/lang/String;II)V

    .line 39
    .line 40
    .line 41
    sput-object v4, Lio/agora/base/internal/video/VideoCodecStatus;->ERROR:Lio/agora/base/internal/video/VideoCodecStatus;

    .line 42
    .line 43
    new-instance v5, Lio/agora/base/internal/video/VideoCodecStatus;

    .line 44
    .line 45
    const/4 v2, 0x4

    .line 46
    const/4 v6, -0x2

    .line 47
    const-string v7, "LEVEL_EXCEEDED"

    .line 48
    .line 49
    invoke-direct {v5, v7, v2, v6}, Lio/agora/base/internal/video/VideoCodecStatus;-><init>(Ljava/lang/String;II)V

    .line 50
    .line 51
    .line 52
    sput-object v5, Lio/agora/base/internal/video/VideoCodecStatus;->LEVEL_EXCEEDED:Lio/agora/base/internal/video/VideoCodecStatus;

    .line 53
    .line 54
    new-instance v6, Lio/agora/base/internal/video/VideoCodecStatus;

    .line 55
    .line 56
    const/4 v2, 0x5

    .line 57
    const/4 v7, -0x3

    .line 58
    const-string v8, "MEMORY"

    .line 59
    .line 60
    invoke-direct {v6, v8, v2, v7}, Lio/agora/base/internal/video/VideoCodecStatus;-><init>(Ljava/lang/String;II)V

    .line 61
    .line 62
    .line 63
    sput-object v6, Lio/agora/base/internal/video/VideoCodecStatus;->MEMORY:Lio/agora/base/internal/video/VideoCodecStatus;

    .line 64
    .line 65
    new-instance v7, Lio/agora/base/internal/video/VideoCodecStatus;

    .line 66
    .line 67
    const/4 v2, 0x6

    .line 68
    const/4 v8, -0x4

    .line 69
    const-string v9, "ERR_PARAMETER"

    .line 70
    .line 71
    invoke-direct {v7, v9, v2, v8}, Lio/agora/base/internal/video/VideoCodecStatus;-><init>(Ljava/lang/String;II)V

    .line 72
    .line 73
    .line 74
    sput-object v7, Lio/agora/base/internal/video/VideoCodecStatus;->ERR_PARAMETER:Lio/agora/base/internal/video/VideoCodecStatus;

    .line 75
    .line 76
    new-instance v8, Lio/agora/base/internal/video/VideoCodecStatus;

    .line 77
    .line 78
    const/4 v2, 0x7

    .line 79
    const/4 v9, -0x5

    .line 80
    const-string v10, "ERR_SIZE"

    .line 81
    .line 82
    invoke-direct {v8, v10, v2, v9}, Lio/agora/base/internal/video/VideoCodecStatus;-><init>(Ljava/lang/String;II)V

    .line 83
    .line 84
    .line 85
    sput-object v8, Lio/agora/base/internal/video/VideoCodecStatus;->ERR_SIZE:Lio/agora/base/internal/video/VideoCodecStatus;

    .line 86
    .line 87
    new-instance v9, Lio/agora/base/internal/video/VideoCodecStatus;

    .line 88
    .line 89
    const/16 v2, 0x8

    .line 90
    .line 91
    const/4 v10, -0x6

    .line 92
    const-string v11, "TIMEOUT"

    .line 93
    .line 94
    invoke-direct {v9, v11, v2, v10}, Lio/agora/base/internal/video/VideoCodecStatus;-><init>(Ljava/lang/String;II)V

    .line 95
    .line 96
    .line 97
    sput-object v9, Lio/agora/base/internal/video/VideoCodecStatus;->TIMEOUT:Lio/agora/base/internal/video/VideoCodecStatus;

    .line 98
    .line 99
    new-instance v10, Lio/agora/base/internal/video/VideoCodecStatus;

    .line 100
    .line 101
    const/16 v2, 0x9

    .line 102
    .line 103
    const/4 v11, -0x7

    .line 104
    const-string v12, "UNINITIALIZED"

    .line 105
    .line 106
    invoke-direct {v10, v12, v2, v11}, Lio/agora/base/internal/video/VideoCodecStatus;-><init>(Ljava/lang/String;II)V

    .line 107
    .line 108
    .line 109
    sput-object v10, Lio/agora/base/internal/video/VideoCodecStatus;->UNINITIALIZED:Lio/agora/base/internal/video/VideoCodecStatus;

    .line 110
    .line 111
    new-instance v11, Lio/agora/base/internal/video/VideoCodecStatus;

    .line 112
    .line 113
    const/16 v2, 0xa

    .line 114
    .line 115
    const/16 v12, -0xc

    .line 116
    .line 117
    const-string v13, "ERR_REQUEST_SLI"

    .line 118
    .line 119
    invoke-direct {v11, v13, v2, v12}, Lio/agora/base/internal/video/VideoCodecStatus;-><init>(Ljava/lang/String;II)V

    .line 120
    .line 121
    .line 122
    sput-object v11, Lio/agora/base/internal/video/VideoCodecStatus;->ERR_REQUEST_SLI:Lio/agora/base/internal/video/VideoCodecStatus;

    .line 123
    .line 124
    new-instance v12, Lio/agora/base/internal/video/VideoCodecStatus;

    .line 125
    .line 126
    const/16 v2, 0xb

    .line 127
    .line 128
    const/16 v13, -0xd

    .line 129
    .line 130
    const-string v14, "FALLBACK_SOFTWARE"

    .line 131
    .line 132
    invoke-direct {v12, v14, v2, v13}, Lio/agora/base/internal/video/VideoCodecStatus;-><init>(Ljava/lang/String;II)V

    .line 133
    .line 134
    .line 135
    sput-object v12, Lio/agora/base/internal/video/VideoCodecStatus;->FALLBACK_SOFTWARE:Lio/agora/base/internal/video/VideoCodecStatus;

    .line 136
    .line 137
    new-instance v13, Lio/agora/base/internal/video/VideoCodecStatus;

    .line 138
    .line 139
    const/16 v2, 0xc

    .line 140
    .line 141
    const/16 v14, -0xe

    .line 142
    .line 143
    const-string v15, "TARGET_BITRATE_OVERSHOOT"

    .line 144
    .line 145
    invoke-direct {v13, v15, v2, v14}, Lio/agora/base/internal/video/VideoCodecStatus;-><init>(Ljava/lang/String;II)V

    .line 146
    .line 147
    .line 148
    sput-object v13, Lio/agora/base/internal/video/VideoCodecStatus;->TARGET_BITRATE_OVERSHOOT:Lio/agora/base/internal/video/VideoCodecStatus;

    .line 149
    .line 150
    new-instance v14, Lio/agora/base/internal/video/VideoCodecStatus;

    .line 151
    .line 152
    const/16 v2, 0xd

    .line 153
    .line 154
    const/16 v15, -0xf

    .line 155
    .line 156
    move-object/from16 v16, v0

    .line 157
    .line 158
    const-string v0, "SIMULCAST_PARAMETERS_NOT_SUPPORTED"

    .line 159
    .line 160
    invoke-direct {v14, v0, v2, v15}, Lio/agora/base/internal/video/VideoCodecStatus;-><init>(Ljava/lang/String;II)V

    .line 161
    .line 162
    .line 163
    sput-object v14, Lio/agora/base/internal/video/VideoCodecStatus;->SIMULCAST_PARAMETERS_NOT_SUPPORTED:Lio/agora/base/internal/video/VideoCodecStatus;

    .line 164
    .line 165
    new-instance v15, Lio/agora/base/internal/video/VideoCodecStatus;

    .line 166
    .line 167
    const/16 v0, 0xe

    .line 168
    .line 169
    const/16 v2, -0x10

    .line 170
    .line 171
    move-object/from16 v17, v1

    .line 172
    .line 173
    const-string v1, "FALLBACK_DEFAULT_PROFILE"

    .line 174
    .line 175
    invoke-direct {v15, v1, v0, v2}, Lio/agora/base/internal/video/VideoCodecStatus;-><init>(Ljava/lang/String;II)V

    .line 176
    .line 177
    .line 178
    sput-object v15, Lio/agora/base/internal/video/VideoCodecStatus;->FALLBACK_DEFAULT_PROFILE:Lio/agora/base/internal/video/VideoCodecStatus;

    .line 179
    .line 180
    new-instance v0, Lio/agora/base/internal/video/VideoCodecStatus;

    .line 181
    .line 182
    const/16 v1, 0xf

    .line 183
    .line 184
    const/16 v2, -0x14

    .line 185
    .line 186
    move-object/from16 v18, v3

    .line 187
    .line 188
    const-string v3, "CODEC_RESET_DECODER"

    .line 189
    .line 190
    invoke-direct {v0, v3, v1, v2}, Lio/agora/base/internal/video/VideoCodecStatus;-><init>(Ljava/lang/String;II)V

    .line 191
    .line 192
    .line 193
    sput-object v0, Lio/agora/base/internal/video/VideoCodecStatus;->CODEC_RESET_DECODER:Lio/agora/base/internal/video/VideoCodecStatus;

    .line 194
    .line 195
    new-instance v1, Lio/agora/base/internal/video/VideoCodecStatus;

    .line 196
    .line 197
    const/16 v2, 0x10

    .line 198
    .line 199
    const/16 v3, -0x16

    .line 200
    .line 201
    move-object/from16 v19, v0

    .line 202
    .line 203
    const-string v0, "ERROR_CODEC_OUTPUT_FAILURE"

    .line 204
    .line 205
    invoke-direct {v1, v0, v2, v3}, Lio/agora/base/internal/video/VideoCodecStatus;-><init>(Ljava/lang/String;II)V

    .line 206
    .line 207
    .line 208
    sput-object v1, Lio/agora/base/internal/video/VideoCodecStatus;->ERROR_CODEC_OUTPUT_FAILURE:Lio/agora/base/internal/video/VideoCodecStatus;

    .line 209
    .line 210
    move-object/from16 v2, v17

    .line 211
    .line 212
    move-object/from16 v17, v1

    .line 213
    .line 214
    move-object v1, v2

    .line 215
    move-object/from16 v2, v16

    .line 216
    .line 217
    move-object/from16 v3, v18

    .line 218
    .line 219
    move-object/from16 v16, v19

    .line 220
    .line 221
    filled-new-array/range {v1 .. v17}, [Lio/agora/base/internal/video/VideoCodecStatus;

    .line 222
    .line 223
    .line 224
    move-result-object v0

    .line 225
    sput-object v0, Lio/agora/base/internal/video/VideoCodecStatus;->$VALUES:[Lio/agora/base/internal/video/VideoCodecStatus;

    .line 226
    .line 227
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
    iput p3, p0, Lio/agora/base/internal/video/VideoCodecStatus;->number:I

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lio/agora/base/internal/video/VideoCodecStatus;
    .locals 1

    .line 1
    const-class v0, Lio/agora/base/internal/video/VideoCodecStatus;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lio/agora/base/internal/video/VideoCodecStatus;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lio/agora/base/internal/video/VideoCodecStatus;
    .locals 1

    .line 1
    sget-object v0, Lio/agora/base/internal/video/VideoCodecStatus;->$VALUES:[Lio/agora/base/internal/video/VideoCodecStatus;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lio/agora/base/internal/video/VideoCodecStatus;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lio/agora/base/internal/video/VideoCodecStatus;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getNumber()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lio/agora/base/internal/video/VideoCodecStatus;->number:I

    .line 2
    .line 3
    return p0
.end method
