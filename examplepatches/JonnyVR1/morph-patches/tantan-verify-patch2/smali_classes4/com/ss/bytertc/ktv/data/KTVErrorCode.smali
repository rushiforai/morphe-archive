.class public final enum Lcom/ss/bytertc/ktv/data/KTVErrorCode;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/ss/bytertc/ktv/data/KTVErrorCode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/ss/bytertc/ktv/data/KTVErrorCode;

.field public static final enum APPID_INVALID:Lcom/ss/bytertc/ktv/data/KTVErrorCode;

.field public static final enum CLEAR_CACHE_FAILED:Lcom/ss/bytertc/ktv/data/KTVErrorCode;

.field public static final enum DOWNLOAD:Lcom/ss/bytertc/ktv/data/KTVErrorCode;

.field public static final enum DOWNLOADING:Lcom/ss/bytertc/ktv/data/KTVErrorCode;

.field public static final enum DOWNLOAD_CANCELED:Lcom/ss/bytertc/ktv/data/KTVErrorCode;

.field public static final enum DOWNLOAD_TIMEOUT:Lcom/ss/bytertc/ktv/data/KTVErrorCode;

.field public static final enum FILE_RENAME_FAILED:Lcom/ss/bytertc/ktv/data/KTVErrorCode;

.field public static final enum GET_LYRIC_FAILED:Lcom/ss/bytertc/ktv/data/KTVErrorCode;

.field public static final enum GET_MUSIC_FAILED:Lcom/ss/bytertc/ktv/data/KTVErrorCode;

.field public static final enum INSUFFICIENT_DISK_SPACE:Lcom/ss/bytertc/ktv/data/KTVErrorCode;

.field public static final enum INTERNAL_DOMAIN:Lcom/ss/bytertc/ktv/data/KTVErrorCode;

.field public static final enum MIDI_DOWNLOAD_FAILED:Lcom/ss/bytertc/ktv/data/KTVErrorCode;

.field public static final enum MUSIC_DECRYPTION_FAILED:Lcom/ss/bytertc/ktv/data/KTVErrorCode;

.field public static final enum MUSIC_DOWNLOAD:Lcom/ss/bytertc/ktv/data/KTVErrorCode;

.field public static final enum MUSIC_TAKEDOWN:Lcom/ss/bytertc/ktv/data/KTVErrorCode;

.field public static final enum NETWORK:Lcom/ss/bytertc/ktv/data/KTVErrorCode;

.field public static final enum NOT_JOIN_ROOM:Lcom/ss/bytertc/ktv/data/KTVErrorCode;

.field public static final enum OK:Lcom/ss/bytertc/ktv/data/KTVErrorCode;

.field public static final enum PARAS_INVALID:Lcom/ss/bytertc/ktv/data/KTVErrorCode;

.field public static final enum PARSE_DATA:Lcom/ss/bytertc/ktv/data/KTVErrorCode;

.field public static final enum SYSTEM_BUSY:Lcom/ss/bytertc/ktv/data/KTVErrorCode;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .locals 24

    .line 1
    new-instance v1, Lcom/ss/bytertc/ktv/data/KTVErrorCode;

    .line 2
    .line 3
    const-string v0, "OK"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v1, v0, v2, v2}, Lcom/ss/bytertc/ktv/data/KTVErrorCode;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v1, Lcom/ss/bytertc/ktv/data/KTVErrorCode;->OK:Lcom/ss/bytertc/ktv/data/KTVErrorCode;

    .line 10
    .line 11
    new-instance v2, Lcom/ss/bytertc/ktv/data/KTVErrorCode;

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    const/16 v3, -0xbb8

    .line 15
    .line 16
    const-string v4, "APPID_INVALID"

    .line 17
    .line 18
    invoke-direct {v2, v4, v0, v3}, Lcom/ss/bytertc/ktv/data/KTVErrorCode;-><init>(Ljava/lang/String;II)V

    .line 19
    .line 20
    .line 21
    sput-object v2, Lcom/ss/bytertc/ktv/data/KTVErrorCode;->APPID_INVALID:Lcom/ss/bytertc/ktv/data/KTVErrorCode;

    .line 22
    .line 23
    new-instance v3, Lcom/ss/bytertc/ktv/data/KTVErrorCode;

    .line 24
    .line 25
    const/4 v0, 0x2

    .line 26
    const/16 v4, -0xbb9

    .line 27
    .line 28
    const-string v5, "PARAS_INVALID"

    .line 29
    .line 30
    invoke-direct {v3, v5, v0, v4}, Lcom/ss/bytertc/ktv/data/KTVErrorCode;-><init>(Ljava/lang/String;II)V

    .line 31
    .line 32
    .line 33
    sput-object v3, Lcom/ss/bytertc/ktv/data/KTVErrorCode;->PARAS_INVALID:Lcom/ss/bytertc/ktv/data/KTVErrorCode;

    .line 34
    .line 35
    new-instance v4, Lcom/ss/bytertc/ktv/data/KTVErrorCode;

    .line 36
    .line 37
    const/4 v0, 0x3

    .line 38
    const/16 v5, -0xbba

    .line 39
    .line 40
    const-string v6, "GET_MUSIC_FAILED"

    .line 41
    .line 42
    invoke-direct {v4, v6, v0, v5}, Lcom/ss/bytertc/ktv/data/KTVErrorCode;-><init>(Ljava/lang/String;II)V

    .line 43
    .line 44
    .line 45
    sput-object v4, Lcom/ss/bytertc/ktv/data/KTVErrorCode;->GET_MUSIC_FAILED:Lcom/ss/bytertc/ktv/data/KTVErrorCode;

    .line 46
    .line 47
    new-instance v5, Lcom/ss/bytertc/ktv/data/KTVErrorCode;

    .line 48
    .line 49
    const/4 v0, 0x4

    .line 50
    const/16 v6, -0xbbb

    .line 51
    .line 52
    const-string v7, "GET_LYRIC_FAILED"

    .line 53
    .line 54
    invoke-direct {v5, v7, v0, v6}, Lcom/ss/bytertc/ktv/data/KTVErrorCode;-><init>(Ljava/lang/String;II)V

    .line 55
    .line 56
    .line 57
    sput-object v5, Lcom/ss/bytertc/ktv/data/KTVErrorCode;->GET_LYRIC_FAILED:Lcom/ss/bytertc/ktv/data/KTVErrorCode;

    .line 58
    .line 59
    new-instance v6, Lcom/ss/bytertc/ktv/data/KTVErrorCode;

    .line 60
    .line 61
    const/4 v0, 0x5

    .line 62
    const/16 v7, -0xbbc

    .line 63
    .line 64
    const-string v8, "MUSIC_TAKEDOWN"

    .line 65
    .line 66
    invoke-direct {v6, v8, v0, v7}, Lcom/ss/bytertc/ktv/data/KTVErrorCode;-><init>(Ljava/lang/String;II)V

    .line 67
    .line 68
    .line 69
    sput-object v6, Lcom/ss/bytertc/ktv/data/KTVErrorCode;->MUSIC_TAKEDOWN:Lcom/ss/bytertc/ktv/data/KTVErrorCode;

    .line 70
    .line 71
    new-instance v7, Lcom/ss/bytertc/ktv/data/KTVErrorCode;

    .line 72
    .line 73
    const/4 v0, 0x6

    .line 74
    const/16 v8, -0xbbd

    .line 75
    .line 76
    const-string v9, "MUSIC_DOWNLOAD"

    .line 77
    .line 78
    invoke-direct {v7, v9, v0, v8}, Lcom/ss/bytertc/ktv/data/KTVErrorCode;-><init>(Ljava/lang/String;II)V

    .line 79
    .line 80
    .line 81
    sput-object v7, Lcom/ss/bytertc/ktv/data/KTVErrorCode;->MUSIC_DOWNLOAD:Lcom/ss/bytertc/ktv/data/KTVErrorCode;

    .line 82
    .line 83
    new-instance v8, Lcom/ss/bytertc/ktv/data/KTVErrorCode;

    .line 84
    .line 85
    const/4 v0, 0x7

    .line 86
    const/16 v9, -0xbbe

    .line 87
    .line 88
    const-string v10, "MIDI_DOWNLOAD_FAILED"

    .line 89
    .line 90
    invoke-direct {v8, v10, v0, v9}, Lcom/ss/bytertc/ktv/data/KTVErrorCode;-><init>(Ljava/lang/String;II)V

    .line 91
    .line 92
    .line 93
    sput-object v8, Lcom/ss/bytertc/ktv/data/KTVErrorCode;->MIDI_DOWNLOAD_FAILED:Lcom/ss/bytertc/ktv/data/KTVErrorCode;

    .line 94
    .line 95
    new-instance v9, Lcom/ss/bytertc/ktv/data/KTVErrorCode;

    .line 96
    .line 97
    const/16 v0, 0x8

    .line 98
    .line 99
    const/16 v10, -0xbbf

    .line 100
    .line 101
    const-string v11, "SYSTEM_BUSY"

    .line 102
    .line 103
    invoke-direct {v9, v11, v0, v10}, Lcom/ss/bytertc/ktv/data/KTVErrorCode;-><init>(Ljava/lang/String;II)V

    .line 104
    .line 105
    .line 106
    sput-object v9, Lcom/ss/bytertc/ktv/data/KTVErrorCode;->SYSTEM_BUSY:Lcom/ss/bytertc/ktv/data/KTVErrorCode;

    .line 107
    .line 108
    new-instance v10, Lcom/ss/bytertc/ktv/data/KTVErrorCode;

    .line 109
    .line 110
    const/16 v0, 0x9

    .line 111
    .line 112
    const/16 v11, -0xbc0

    .line 113
    .line 114
    const-string v12, "NETWORK"

    .line 115
    .line 116
    invoke-direct {v10, v12, v0, v11}, Lcom/ss/bytertc/ktv/data/KTVErrorCode;-><init>(Ljava/lang/String;II)V

    .line 117
    .line 118
    .line 119
    sput-object v10, Lcom/ss/bytertc/ktv/data/KTVErrorCode;->NETWORK:Lcom/ss/bytertc/ktv/data/KTVErrorCode;

    .line 120
    .line 121
    new-instance v11, Lcom/ss/bytertc/ktv/data/KTVErrorCode;

    .line 122
    .line 123
    const/16 v0, 0xa

    .line 124
    .line 125
    const/16 v12, -0xbc1

    .line 126
    .line 127
    const-string v13, "NOT_JOIN_ROOM"

    .line 128
    .line 129
    invoke-direct {v11, v13, v0, v12}, Lcom/ss/bytertc/ktv/data/KTVErrorCode;-><init>(Ljava/lang/String;II)V

    .line 130
    .line 131
    .line 132
    sput-object v11, Lcom/ss/bytertc/ktv/data/KTVErrorCode;->NOT_JOIN_ROOM:Lcom/ss/bytertc/ktv/data/KTVErrorCode;

    .line 133
    .line 134
    new-instance v12, Lcom/ss/bytertc/ktv/data/KTVErrorCode;

    .line 135
    .line 136
    const/16 v0, 0xb

    .line 137
    .line 138
    const/16 v13, -0xbc2

    .line 139
    .line 140
    const-string v14, "PARSE_DATA"

    .line 141
    .line 142
    invoke-direct {v12, v14, v0, v13}, Lcom/ss/bytertc/ktv/data/KTVErrorCode;-><init>(Ljava/lang/String;II)V

    .line 143
    .line 144
    .line 145
    sput-object v12, Lcom/ss/bytertc/ktv/data/KTVErrorCode;->PARSE_DATA:Lcom/ss/bytertc/ktv/data/KTVErrorCode;

    .line 146
    .line 147
    new-instance v13, Lcom/ss/bytertc/ktv/data/KTVErrorCode;

    .line 148
    .line 149
    const/16 v0, 0xc

    .line 150
    .line 151
    const/16 v14, -0xbc3

    .line 152
    .line 153
    const-string v15, "DOWNLOAD"

    .line 154
    .line 155
    invoke-direct {v13, v15, v0, v14}, Lcom/ss/bytertc/ktv/data/KTVErrorCode;-><init>(Ljava/lang/String;II)V

    .line 156
    .line 157
    .line 158
    sput-object v13, Lcom/ss/bytertc/ktv/data/KTVErrorCode;->DOWNLOAD:Lcom/ss/bytertc/ktv/data/KTVErrorCode;

    .line 159
    .line 160
    new-instance v14, Lcom/ss/bytertc/ktv/data/KTVErrorCode;

    .line 161
    .line 162
    const/16 v0, 0xd

    .line 163
    .line 164
    const/16 v15, -0xbc4

    .line 165
    .line 166
    move-object/from16 v16, v1

    .line 167
    .line 168
    const-string v1, "DOWNLOADING"

    .line 169
    .line 170
    invoke-direct {v14, v1, v0, v15}, Lcom/ss/bytertc/ktv/data/KTVErrorCode;-><init>(Ljava/lang/String;II)V

    .line 171
    .line 172
    .line 173
    sput-object v14, Lcom/ss/bytertc/ktv/data/KTVErrorCode;->DOWNLOADING:Lcom/ss/bytertc/ktv/data/KTVErrorCode;

    .line 174
    .line 175
    new-instance v15, Lcom/ss/bytertc/ktv/data/KTVErrorCode;

    .line 176
    .line 177
    const/16 v0, 0xe

    .line 178
    .line 179
    const/16 v1, -0xbc5

    .line 180
    .line 181
    move-object/from16 v17, v2

    .line 182
    .line 183
    const-string v2, "INTERNAL_DOMAIN"

    .line 184
    .line 185
    invoke-direct {v15, v2, v0, v1}, Lcom/ss/bytertc/ktv/data/KTVErrorCode;-><init>(Ljava/lang/String;II)V

    .line 186
    .line 187
    .line 188
    sput-object v15, Lcom/ss/bytertc/ktv/data/KTVErrorCode;->INTERNAL_DOMAIN:Lcom/ss/bytertc/ktv/data/KTVErrorCode;

    .line 189
    .line 190
    new-instance v0, Lcom/ss/bytertc/ktv/data/KTVErrorCode;

    .line 191
    .line 192
    const/16 v1, 0xf

    .line 193
    .line 194
    const/16 v2, -0xbc6

    .line 195
    .line 196
    move-object/from16 v18, v3

    .line 197
    .line 198
    const-string v3, "INSUFFICIENT_DISK_SPACE"

    .line 199
    .line 200
    invoke-direct {v0, v3, v1, v2}, Lcom/ss/bytertc/ktv/data/KTVErrorCode;-><init>(Ljava/lang/String;II)V

    .line 201
    .line 202
    .line 203
    sput-object v0, Lcom/ss/bytertc/ktv/data/KTVErrorCode;->INSUFFICIENT_DISK_SPACE:Lcom/ss/bytertc/ktv/data/KTVErrorCode;

    .line 204
    .line 205
    new-instance v1, Lcom/ss/bytertc/ktv/data/KTVErrorCode;

    .line 206
    .line 207
    const/16 v2, 0x10

    .line 208
    .line 209
    const/16 v3, -0xbc7

    .line 210
    .line 211
    move-object/from16 v19, v0

    .line 212
    .line 213
    const-string v0, "MUSIC_DECRYPTION_FAILED"

    .line 214
    .line 215
    invoke-direct {v1, v0, v2, v3}, Lcom/ss/bytertc/ktv/data/KTVErrorCode;-><init>(Ljava/lang/String;II)V

    .line 216
    .line 217
    .line 218
    sput-object v1, Lcom/ss/bytertc/ktv/data/KTVErrorCode;->MUSIC_DECRYPTION_FAILED:Lcom/ss/bytertc/ktv/data/KTVErrorCode;

    .line 219
    .line 220
    new-instance v0, Lcom/ss/bytertc/ktv/data/KTVErrorCode;

    .line 221
    .line 222
    const/16 v2, 0x11

    .line 223
    .line 224
    const/16 v3, -0xbc8

    .line 225
    .line 226
    move-object/from16 v20, v1

    .line 227
    .line 228
    const-string v1, "FILE_RENAME_FAILED"

    .line 229
    .line 230
    invoke-direct {v0, v1, v2, v3}, Lcom/ss/bytertc/ktv/data/KTVErrorCode;-><init>(Ljava/lang/String;II)V

    .line 231
    .line 232
    .line 233
    sput-object v0, Lcom/ss/bytertc/ktv/data/KTVErrorCode;->FILE_RENAME_FAILED:Lcom/ss/bytertc/ktv/data/KTVErrorCode;

    .line 234
    .line 235
    new-instance v1, Lcom/ss/bytertc/ktv/data/KTVErrorCode;

    .line 236
    .line 237
    const/16 v2, 0x12

    .line 238
    .line 239
    const/16 v3, -0xbc9

    .line 240
    .line 241
    move-object/from16 v21, v0

    .line 242
    .line 243
    const-string v0, "DOWNLOAD_TIMEOUT"

    .line 244
    .line 245
    invoke-direct {v1, v0, v2, v3}, Lcom/ss/bytertc/ktv/data/KTVErrorCode;-><init>(Ljava/lang/String;II)V

    .line 246
    .line 247
    .line 248
    sput-object v1, Lcom/ss/bytertc/ktv/data/KTVErrorCode;->DOWNLOAD_TIMEOUT:Lcom/ss/bytertc/ktv/data/KTVErrorCode;

    .line 249
    .line 250
    new-instance v0, Lcom/ss/bytertc/ktv/data/KTVErrorCode;

    .line 251
    .line 252
    const/16 v2, 0x13

    .line 253
    .line 254
    const/16 v3, -0xbca

    .line 255
    .line 256
    move-object/from16 v22, v1

    .line 257
    .line 258
    const-string v1, "CLEAR_CACHE_FAILED"

    .line 259
    .line 260
    invoke-direct {v0, v1, v2, v3}, Lcom/ss/bytertc/ktv/data/KTVErrorCode;-><init>(Ljava/lang/String;II)V

    .line 261
    .line 262
    .line 263
    sput-object v0, Lcom/ss/bytertc/ktv/data/KTVErrorCode;->CLEAR_CACHE_FAILED:Lcom/ss/bytertc/ktv/data/KTVErrorCode;

    .line 264
    .line 265
    new-instance v1, Lcom/ss/bytertc/ktv/data/KTVErrorCode;

    .line 266
    .line 267
    const/16 v2, 0x14

    .line 268
    .line 269
    const/16 v3, -0xbcb

    .line 270
    .line 271
    move-object/from16 v23, v0

    .line 272
    .line 273
    const-string v0, "DOWNLOAD_CANCELED"

    .line 274
    .line 275
    invoke-direct {v1, v0, v2, v3}, Lcom/ss/bytertc/ktv/data/KTVErrorCode;-><init>(Ljava/lang/String;II)V

    .line 276
    .line 277
    .line 278
    sput-object v1, Lcom/ss/bytertc/ktv/data/KTVErrorCode;->DOWNLOAD_CANCELED:Lcom/ss/bytertc/ktv/data/KTVErrorCode;

    .line 279
    .line 280
    move-object/from16 v2, v17

    .line 281
    .line 282
    move-object/from16 v3, v18

    .line 283
    .line 284
    move-object/from16 v17, v20

    .line 285
    .line 286
    move-object/from16 v18, v21

    .line 287
    .line 288
    move-object/from16 v20, v23

    .line 289
    .line 290
    move-object/from16 v21, v1

    .line 291
    .line 292
    move-object/from16 v1, v16

    .line 293
    .line 294
    move-object/from16 v16, v19

    .line 295
    .line 296
    move-object/from16 v19, v22

    .line 297
    .line 298
    filled-new-array/range {v1 .. v21}, [Lcom/ss/bytertc/ktv/data/KTVErrorCode;

    .line 299
    .line 300
    .line 301
    move-result-object v0

    .line 302
    sput-object v0, Lcom/ss/bytertc/ktv/data/KTVErrorCode;->$VALUES:[Lcom/ss/bytertc/ktv/data/KTVErrorCode;

    .line 303
    .line 304
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
    iput p3, p0, Lcom/ss/bytertc/ktv/data/KTVErrorCode;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static fromId(I)Lcom/ss/bytertc/ktv/data/KTVErrorCode;
    .locals 5
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    invoke-static {}, Lcom/ss/bytertc/ktv/data/KTVErrorCode;->values()[Lcom/ss/bytertc/ktv/data/KTVErrorCode;

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
    invoke-virtual {v3}, Lcom/ss/bytertc/ktv/data/KTVErrorCode;->value()I

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

.method public static valueOf(Ljava/lang/String;)Lcom/ss/bytertc/ktv/data/KTVErrorCode;
    .locals 1

    .line 1
    const-class v0, Lcom/ss/bytertc/ktv/data/KTVErrorCode;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/ss/bytertc/ktv/data/KTVErrorCode;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/ss/bytertc/ktv/data/KTVErrorCode;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/ktv/data/KTVErrorCode;->$VALUES:[Lcom/ss/bytertc/ktv/data/KTVErrorCode;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/ss/bytertc/ktv/data/KTVErrorCode;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/ss/bytertc/ktv/data/KTVErrorCode;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/ktv/data/KTVErrorCode$1;->$SwitchMap$com$ss$bytertc$ktv$data$KTVErrorCode:[I

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
    const-string p0, "KTV_ERROR_CODE_DOWNLOAD_CANCELED"

    .line 16
    .line 17
    return-object p0

    .line 18
    :pswitch_1
    const-string p0, "KTV_ERROR_CODE_CLEAR_CACHE_FAILED"

    .line 19
    .line 20
    return-object p0

    .line 21
    :pswitch_2
    const-string p0, "KTV_ERROR_CODE_DOWNLOAD_TIMEOUT"

    .line 22
    .line 23
    return-object p0

    .line 24
    :pswitch_3
    const-string p0, "KTV_ERROR_CODE_FILE_RENAME_FAILED"

    .line 25
    .line 26
    return-object p0

    .line 27
    :pswitch_4
    const-string p0, "KTV_ERROR_CODE_MUSIC_DECRYPTION_FAILED"

    .line 28
    .line 29
    return-object p0

    .line 30
    :pswitch_5
    const-string p0, "KTV_ERROR_CODE_INSUFFICIENT_DISK_SPACE"

    .line 31
    .line 32
    return-object p0

    .line 33
    :pswitch_6
    const-string p0, "KTV_ERROR_CODE_INTERNAL_DOMAIN"

    .line 34
    .line 35
    return-object p0

    .line 36
    :pswitch_7
    const-string p0, "KTV_ERROR_CODE_DOWNLOADING"

    .line 37
    .line 38
    return-object p0

    .line 39
    :pswitch_8
    const-string p0, "KTV_ERROR_CODE_DOWNLOAD"

    .line 40
    .line 41
    return-object p0

    .line 42
    :pswitch_9
    const-string p0, "KTV_ERROR_CODE_PARSE_DATA"

    .line 43
    .line 44
    return-object p0

    .line 45
    :pswitch_a
    const-string p0, "KTV_ERROR_CODE_NOT_JOIN_ROOM"

    .line 46
    .line 47
    return-object p0

    .line 48
    :pswitch_b
    const-string p0, "KTV_ERROR_CODE_NETWORK"

    .line 49
    .line 50
    return-object p0

    .line 51
    :pswitch_c
    const-string p0, "ERROR_CODE_KTV_SYSTEM_BUSY"

    .line 52
    .line 53
    return-object p0

    .line 54
    :pswitch_d
    const-string p0, "KTV_ERROR_CODE_MIDI_DOWNLOAD_FAILED"

    .line 55
    .line 56
    return-object p0

    .line 57
    :pswitch_e
    const-string p0, "KTV_ERROR_CODE_MUSIC_DOWNLOAD"

    .line 58
    .line 59
    return-object p0

    .line 60
    :pswitch_f
    const-string p0, "KTV_ERROR_CODE_MUSIC_TAKEDOWN"

    .line 61
    .line 62
    return-object p0

    .line 63
    :pswitch_10
    const-string p0, "KTV_ERROR_CODE_GET_LYRIC_FAILED"

    .line 64
    .line 65
    return-object p0

    .line 66
    :pswitch_11
    const-string p0, "KTV_ERROR_CODE_GET_MUSIC_FAILED"

    .line 67
    .line 68
    return-object p0

    .line 69
    :pswitch_12
    const-string p0, "KTV_ERROR_CODE_PARAS_INVALID"

    .line 70
    .line 71
    return-object p0

    .line 72
    :pswitch_13
    const-string p0, "KTV_ERROR_CODE_APPID_INVALID"

    .line 73
    .line 74
    return-object p0

    .line 75
    :pswitch_14
    const-string p0, "KTV_ERROR_CODE_OK"

    .line 76
    .line 77
    return-object p0

    .line 78
    nop

    .line 79
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
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
    iget p0, p0, Lcom/ss/bytertc/ktv/data/KTVErrorCode;->value:I

    .line 2
    .line 3
    return p0
.end method
