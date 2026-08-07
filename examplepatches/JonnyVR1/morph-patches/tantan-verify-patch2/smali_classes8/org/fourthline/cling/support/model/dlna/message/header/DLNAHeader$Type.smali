.class public final enum Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Type"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

.field public static final enum AvailableRange:Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

.field public static final enum AvailableSeekRange:Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

.field public static final enum BufferInfo:Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

.field public static final enum ContentFeatures:Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

.field public static final enum EventType:Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

.field public static final enum FriendlyName:Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

.field public static final enum GetAvailableSeekRange:Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

.field public static final enum GetContentFeatures:Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

.field public static final enum MaxPrate:Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

.field public static final enum PRAGMA:Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

.field public static final enum PeerManager:Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

.field public static final enum PlaySpeed:Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

.field public static final enum RTPAACDeInterleaving:Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

.field public static final enum RTPAMRDeInterleaving:Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

.field public static final enum RTPAMRWBPlusDeInterleaving:Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

.field public static final enum RTPH264DeInterleaving:Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

.field public static final enum RealTimeInfo:Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

.field public static final enum SCID:Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

.field public static final enum ScmsFlag:Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

.field public static final enum Supported:Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

.field public static final enum TimeSeekRange:Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

.field public static final enum TransferMode:Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

.field public static final enum WCT:Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

.field public static final enum XSeekRange:Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

.field private static byName:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private headerTypes:[Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/lang/Class<",
            "+",
            "Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader;",
            ">;"
        }
    .end annotation
.end field

.field private httpName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 27

    .line 1
    new-instance v1, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

    .line 2
    .line 3
    const-class v0, Lorg/fourthline/cling/support/model/dlna/message/header/TimeSeekRangeHeader;

    .line 4
    .line 5
    filled-new-array {v0}, [Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    const-string v3, "TimeSeekRange"

    .line 10
    .line 11
    const/4 v4, 0x0

    .line 12
    const-string v5, "TimeSeekRange.dlna.org"

    .line 13
    .line 14
    invoke-direct {v1, v3, v4, v5, v2}, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;-><init>(Ljava/lang/String;ILjava/lang/String;[Ljava/lang/Class;)V

    .line 15
    .line 16
    .line 17
    sput-object v1, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;->TimeSeekRange:Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

    .line 18
    .line 19
    new-instance v2, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

    .line 20
    .line 21
    const-string v3, "X-Seek-Range"

    .line 22
    .line 23
    filled-new-array {v0}, [Ljava/lang/Class;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v4, "XSeekRange"

    .line 28
    .line 29
    const/4 v5, 0x1

    .line 30
    invoke-direct {v2, v4, v5, v3, v0}, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;-><init>(Ljava/lang/String;ILjava/lang/String;[Ljava/lang/Class;)V

    .line 31
    .line 32
    .line 33
    sput-object v2, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;->XSeekRange:Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

    .line 34
    .line 35
    new-instance v3, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

    .line 36
    .line 37
    const-class v0, Lorg/fourthline/cling/support/model/dlna/message/header/PlaySpeedHeader;

    .line 38
    .line 39
    filled-new-array {v0}, [Ljava/lang/Class;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    const-string v4, "PlaySpeed"

    .line 44
    .line 45
    const/4 v5, 0x2

    .line 46
    const-string v6, "PlaySpeed.dlna.org"

    .line 47
    .line 48
    invoke-direct {v3, v4, v5, v6, v0}, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;-><init>(Ljava/lang/String;ILjava/lang/String;[Ljava/lang/Class;)V

    .line 49
    .line 50
    .line 51
    sput-object v3, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;->PlaySpeed:Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

    .line 52
    .line 53
    new-instance v4, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

    .line 54
    .line 55
    const-class v0, Lorg/fourthline/cling/support/model/dlna/message/header/AvailableSeekRangeHeader;

    .line 56
    .line 57
    filled-new-array {v0}, [Ljava/lang/Class;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    const-string v5, "AvailableSeekRange"

    .line 62
    .line 63
    const/4 v6, 0x3

    .line 64
    const-string v7, "availableSeekRange.dlna.org"

    .line 65
    .line 66
    invoke-direct {v4, v5, v6, v7, v0}, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;-><init>(Ljava/lang/String;ILjava/lang/String;[Ljava/lang/Class;)V

    .line 67
    .line 68
    .line 69
    sput-object v4, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;->AvailableSeekRange:Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

    .line 70
    .line 71
    new-instance v5, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

    .line 72
    .line 73
    const-class v0, Lorg/fourthline/cling/support/model/dlna/message/header/GetAvailableSeekRangeHeader;

    .line 74
    .line 75
    filled-new-array {v0}, [Ljava/lang/Class;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    const-string v6, "GetAvailableSeekRange"

    .line 80
    .line 81
    const/4 v7, 0x4

    .line 82
    const-string v8, "getAvailableSeekRange.dlna.org"

    .line 83
    .line 84
    invoke-direct {v5, v6, v7, v8, v0}, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;-><init>(Ljava/lang/String;ILjava/lang/String;[Ljava/lang/Class;)V

    .line 85
    .line 86
    .line 87
    sput-object v5, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;->GetAvailableSeekRange:Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

    .line 88
    .line 89
    new-instance v6, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

    .line 90
    .line 91
    const-class v0, Lorg/fourthline/cling/support/model/dlna/message/header/GetContentFeaturesHeader;

    .line 92
    .line 93
    filled-new-array {v0}, [Ljava/lang/Class;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    const-string v7, "GetContentFeatures"

    .line 98
    .line 99
    const/4 v8, 0x5

    .line 100
    const-string v9, "getcontentFeatures.dlna.org"

    .line 101
    .line 102
    invoke-direct {v6, v7, v8, v9, v0}, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;-><init>(Ljava/lang/String;ILjava/lang/String;[Ljava/lang/Class;)V

    .line 103
    .line 104
    .line 105
    sput-object v6, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;->GetContentFeatures:Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

    .line 106
    .line 107
    new-instance v7, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

    .line 108
    .line 109
    const-class v0, Lorg/fourthline/cling/support/model/dlna/message/header/ContentFeaturesHeader;

    .line 110
    .line 111
    filled-new-array {v0}, [Ljava/lang/Class;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    const-string v8, "ContentFeatures"

    .line 116
    .line 117
    const/4 v9, 0x6

    .line 118
    const-string v10, "contentFeatures.dlna.org"

    .line 119
    .line 120
    invoke-direct {v7, v8, v9, v10, v0}, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;-><init>(Ljava/lang/String;ILjava/lang/String;[Ljava/lang/Class;)V

    .line 121
    .line 122
    .line 123
    sput-object v7, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;->ContentFeatures:Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

    .line 124
    .line 125
    new-instance v8, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

    .line 126
    .line 127
    const-class v0, Lorg/fourthline/cling/support/model/dlna/message/header/TransferModeHeader;

    .line 128
    .line 129
    filled-new-array {v0}, [Ljava/lang/Class;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    const-string v9, "TransferMode"

    .line 134
    .line 135
    const/4 v10, 0x7

    .line 136
    const-string v11, "transferMode.dlna.org"

    .line 137
    .line 138
    invoke-direct {v8, v9, v10, v11, v0}, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;-><init>(Ljava/lang/String;ILjava/lang/String;[Ljava/lang/Class;)V

    .line 139
    .line 140
    .line 141
    sput-object v8, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;->TransferMode:Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

    .line 142
    .line 143
    new-instance v9, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

    .line 144
    .line 145
    const-class v0, Lorg/fourthline/cling/support/model/dlna/message/header/FriendlyNameHeader;

    .line 146
    .line 147
    filled-new-array {v0}, [Ljava/lang/Class;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    const-string v10, "FriendlyName"

    .line 152
    .line 153
    const/16 v11, 0x8

    .line 154
    .line 155
    const-string v12, "friendlyName.dlna.org"

    .line 156
    .line 157
    invoke-direct {v9, v10, v11, v12, v0}, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;-><init>(Ljava/lang/String;ILjava/lang/String;[Ljava/lang/Class;)V

    .line 158
    .line 159
    .line 160
    sput-object v9, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;->FriendlyName:Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

    .line 161
    .line 162
    new-instance v10, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

    .line 163
    .line 164
    const-class v0, Lorg/fourthline/cling/support/model/dlna/message/header/PeerManagerHeader;

    .line 165
    .line 166
    filled-new-array {v0}, [Ljava/lang/Class;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    const-string v11, "PeerManager"

    .line 171
    .line 172
    const/16 v12, 0x9

    .line 173
    .line 174
    const-string v13, "peerManager.dlna.org"

    .line 175
    .line 176
    invoke-direct {v10, v11, v12, v13, v0}, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;-><init>(Ljava/lang/String;ILjava/lang/String;[Ljava/lang/Class;)V

    .line 177
    .line 178
    .line 179
    sput-object v10, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;->PeerManager:Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

    .line 180
    .line 181
    new-instance v11, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

    .line 182
    .line 183
    const-class v0, Lorg/fourthline/cling/support/model/dlna/message/header/AvailableRangeHeader;

    .line 184
    .line 185
    filled-new-array {v0}, [Ljava/lang/Class;

    .line 186
    .line 187
    .line 188
    move-result-object v0

    .line 189
    const-string v12, "AvailableRange"

    .line 190
    .line 191
    const/16 v13, 0xa

    .line 192
    .line 193
    const-string v14, "Available-Range.dlna.org"

    .line 194
    .line 195
    invoke-direct {v11, v12, v13, v14, v0}, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;-><init>(Ljava/lang/String;ILjava/lang/String;[Ljava/lang/Class;)V

    .line 196
    .line 197
    .line 198
    sput-object v11, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;->AvailableRange:Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

    .line 199
    .line 200
    new-instance v12, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

    .line 201
    .line 202
    const-class v0, Lorg/fourthline/cling/support/model/dlna/message/header/SCIDHeader;

    .line 203
    .line 204
    filled-new-array {v0}, [Ljava/lang/Class;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    const-string v13, "SCID"

    .line 209
    .line 210
    const/16 v14, 0xb

    .line 211
    .line 212
    const-string v15, "scid.dlna.org"

    .line 213
    .line 214
    invoke-direct {v12, v13, v14, v15, v0}, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;-><init>(Ljava/lang/String;ILjava/lang/String;[Ljava/lang/Class;)V

    .line 215
    .line 216
    .line 217
    sput-object v12, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;->SCID:Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

    .line 218
    .line 219
    new-instance v13, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

    .line 220
    .line 221
    const-class v0, Lorg/fourthline/cling/support/model/dlna/message/header/RealTimeInfoHeader;

    .line 222
    .line 223
    filled-new-array {v0}, [Ljava/lang/Class;

    .line 224
    .line 225
    .line 226
    move-result-object v0

    .line 227
    const-string v14, "RealTimeInfo"

    .line 228
    .line 229
    const/16 v15, 0xc

    .line 230
    .line 231
    move-object/from16 v16, v1

    .line 232
    .line 233
    const-string v1, "realTimeInfo.dlna.org"

    .line 234
    .line 235
    invoke-direct {v13, v14, v15, v1, v0}, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;-><init>(Ljava/lang/String;ILjava/lang/String;[Ljava/lang/Class;)V

    .line 236
    .line 237
    .line 238
    sput-object v13, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;->RealTimeInfo:Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

    .line 239
    .line 240
    new-instance v14, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

    .line 241
    .line 242
    const-class v0, Lorg/fourthline/cling/support/model/dlna/message/header/ScmsFlagHeader;

    .line 243
    .line 244
    filled-new-array {v0}, [Ljava/lang/Class;

    .line 245
    .line 246
    .line 247
    move-result-object v0

    .line 248
    const-string v1, "ScmsFlag"

    .line 249
    .line 250
    const/16 v15, 0xd

    .line 251
    .line 252
    move-object/from16 v17, v2

    .line 253
    .line 254
    const-string v2, "scmsFlag.dlna.org"

    .line 255
    .line 256
    invoke-direct {v14, v1, v15, v2, v0}, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;-><init>(Ljava/lang/String;ILjava/lang/String;[Ljava/lang/Class;)V

    .line 257
    .line 258
    .line 259
    sput-object v14, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;->ScmsFlag:Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

    .line 260
    .line 261
    new-instance v15, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

    .line 262
    .line 263
    const-class v0, Lorg/fourthline/cling/support/model/dlna/message/header/WCTHeader;

    .line 264
    .line 265
    filled-new-array {v0}, [Ljava/lang/Class;

    .line 266
    .line 267
    .line 268
    move-result-object v0

    .line 269
    const-string v1, "WCT"

    .line 270
    .line 271
    const/16 v2, 0xe

    .line 272
    .line 273
    move-object/from16 v18, v3

    .line 274
    .line 275
    const-string v3, "WCT.dlna.org"

    .line 276
    .line 277
    invoke-direct {v15, v1, v2, v3, v0}, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;-><init>(Ljava/lang/String;ILjava/lang/String;[Ljava/lang/Class;)V

    .line 278
    .line 279
    .line 280
    sput-object v15, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;->WCT:Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

    .line 281
    .line 282
    new-instance v0, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

    .line 283
    .line 284
    const-class v1, Lorg/fourthline/cling/support/model/dlna/message/header/MaxPrateHeader;

    .line 285
    .line 286
    filled-new-array {v1}, [Ljava/lang/Class;

    .line 287
    .line 288
    .line 289
    move-result-object v1

    .line 290
    const-string v2, "MaxPrate"

    .line 291
    .line 292
    const/16 v3, 0xf

    .line 293
    .line 294
    move-object/from16 v19, v4

    .line 295
    .line 296
    const-string v4, "Max-Prate.dlna.org"

    .line 297
    .line 298
    invoke-direct {v0, v2, v3, v4, v1}, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;-><init>(Ljava/lang/String;ILjava/lang/String;[Ljava/lang/Class;)V

    .line 299
    .line 300
    .line 301
    sput-object v0, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;->MaxPrate:Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

    .line 302
    .line 303
    new-instance v1, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

    .line 304
    .line 305
    const-class v2, Lorg/fourthline/cling/support/model/dlna/message/header/EventTypeHeader;

    .line 306
    .line 307
    filled-new-array {v2}, [Ljava/lang/Class;

    .line 308
    .line 309
    .line 310
    move-result-object v2

    .line 311
    const-string v3, "EventType"

    .line 312
    .line 313
    const/16 v4, 0x10

    .line 314
    .line 315
    move-object/from16 v20, v0

    .line 316
    .line 317
    const-string v0, "Event-Type.dlna.org"

    .line 318
    .line 319
    invoke-direct {v1, v3, v4, v0, v2}, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;-><init>(Ljava/lang/String;ILjava/lang/String;[Ljava/lang/Class;)V

    .line 320
    .line 321
    .line 322
    sput-object v1, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;->EventType:Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

    .line 323
    .line 324
    new-instance v0, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

    .line 325
    .line 326
    const-class v2, Lorg/fourthline/cling/support/model/dlna/message/header/SupportedHeader;

    .line 327
    .line 328
    filled-new-array {v2}, [Ljava/lang/Class;

    .line 329
    .line 330
    .line 331
    move-result-object v2

    .line 332
    const-string v3, "Supported"

    .line 333
    .line 334
    const/16 v4, 0x11

    .line 335
    .line 336
    invoke-direct {v0, v3, v4, v3, v2}, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;-><init>(Ljava/lang/String;ILjava/lang/String;[Ljava/lang/Class;)V

    .line 337
    .line 338
    .line 339
    sput-object v0, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;->Supported:Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

    .line 340
    .line 341
    new-instance v2, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

    .line 342
    .line 343
    const-class v3, Lorg/fourthline/cling/support/model/dlna/message/header/BufferInfoHeader;

    .line 344
    .line 345
    filled-new-array {v3}, [Ljava/lang/Class;

    .line 346
    .line 347
    .line 348
    move-result-object v3

    .line 349
    const-string v4, "BufferInfo"

    .line 350
    .line 351
    move-object/from16 v21, v0

    .line 352
    .line 353
    const/16 v0, 0x12

    .line 354
    .line 355
    move-object/from16 v22, v1

    .line 356
    .line 357
    const-string v1, "Buffer-Info.dlna.org"

    .line 358
    .line 359
    invoke-direct {v2, v4, v0, v1, v3}, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;-><init>(Ljava/lang/String;ILjava/lang/String;[Ljava/lang/Class;)V

    .line 360
    .line 361
    .line 362
    sput-object v2, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;->BufferInfo:Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

    .line 363
    .line 364
    new-instance v0, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

    .line 365
    .line 366
    const-class v1, Lorg/fourthline/cling/support/model/dlna/message/header/BufferBytesHeader;

    .line 367
    .line 368
    filled-new-array {v1}, [Ljava/lang/Class;

    .line 369
    .line 370
    .line 371
    move-result-object v3

    .line 372
    const-string v4, "RTPH264DeInterleaving"

    .line 373
    .line 374
    move-object/from16 v23, v1

    .line 375
    .line 376
    const/16 v1, 0x13

    .line 377
    .line 378
    move-object/from16 v24, v2

    .line 379
    .line 380
    const-string v2, "rtp-h264-deint-buf-cap.dlna.org"

    .line 381
    .line 382
    invoke-direct {v0, v4, v1, v2, v3}, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;-><init>(Ljava/lang/String;ILjava/lang/String;[Ljava/lang/Class;)V

    .line 383
    .line 384
    .line 385
    sput-object v0, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;->RTPH264DeInterleaving:Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

    .line 386
    .line 387
    new-instance v1, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

    .line 388
    .line 389
    const-string v2, "rtp-aac-deint-buf-cap.dlna.org"

    .line 390
    .line 391
    filled-new-array/range {v23 .. v23}, [Ljava/lang/Class;

    .line 392
    .line 393
    .line 394
    move-result-object v3

    .line 395
    const-string v4, "RTPAACDeInterleaving"

    .line 396
    .line 397
    move-object/from16 v25, v0

    .line 398
    .line 399
    const/16 v0, 0x14

    .line 400
    .line 401
    invoke-direct {v1, v4, v0, v2, v3}, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;-><init>(Ljava/lang/String;ILjava/lang/String;[Ljava/lang/Class;)V

    .line 402
    .line 403
    .line 404
    sput-object v1, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;->RTPAACDeInterleaving:Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

    .line 405
    .line 406
    new-instance v0, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

    .line 407
    .line 408
    const-string v2, "rtp-amr-deint-buf-cap.dlna.org"

    .line 409
    .line 410
    filled-new-array/range {v23 .. v23}, [Ljava/lang/Class;

    .line 411
    .line 412
    .line 413
    move-result-object v3

    .line 414
    const-string v4, "RTPAMRDeInterleaving"

    .line 415
    .line 416
    move-object/from16 v26, v1

    .line 417
    .line 418
    const/16 v1, 0x15

    .line 419
    .line 420
    invoke-direct {v0, v4, v1, v2, v3}, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;-><init>(Ljava/lang/String;ILjava/lang/String;[Ljava/lang/Class;)V

    .line 421
    .line 422
    .line 423
    sput-object v0, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;->RTPAMRDeInterleaving:Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

    .line 424
    .line 425
    new-instance v1, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

    .line 426
    .line 427
    const-string v2, "rtp-amrwbplus-deint-buf-cap.dlna.org"

    .line 428
    .line 429
    filled-new-array/range {v23 .. v23}, [Ljava/lang/Class;

    .line 430
    .line 431
    .line 432
    move-result-object v3

    .line 433
    const-string v4, "RTPAMRWBPlusDeInterleaving"

    .line 434
    .line 435
    move-object/from16 v23, v0

    .line 436
    .line 437
    const/16 v0, 0x16

    .line 438
    .line 439
    invoke-direct {v1, v4, v0, v2, v3}, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;-><init>(Ljava/lang/String;ILjava/lang/String;[Ljava/lang/Class;)V

    .line 440
    .line 441
    .line 442
    sput-object v1, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;->RTPAMRWBPlusDeInterleaving:Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

    .line 443
    .line 444
    new-instance v0, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

    .line 445
    .line 446
    const-class v2, Lorg/fourthline/cling/support/model/dlna/message/header/PragmaHeader;

    .line 447
    .line 448
    filled-new-array {v2}, [Ljava/lang/Class;

    .line 449
    .line 450
    .line 451
    move-result-object v2

    .line 452
    const-string v3, "PRAGMA"

    .line 453
    .line 454
    const/16 v4, 0x17

    .line 455
    .line 456
    invoke-direct {v0, v3, v4, v3, v2}, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;-><init>(Ljava/lang/String;ILjava/lang/String;[Ljava/lang/Class;)V

    .line 457
    .line 458
    .line 459
    sput-object v0, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;->PRAGMA:Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

    .line 460
    .line 461
    move-object/from16 v2, v17

    .line 462
    .line 463
    move-object/from16 v3, v18

    .line 464
    .line 465
    move-object/from16 v4, v19

    .line 466
    .line 467
    move-object/from16 v18, v21

    .line 468
    .line 469
    move-object/from16 v17, v22

    .line 470
    .line 471
    move-object/from16 v22, v23

    .line 472
    .line 473
    move-object/from16 v19, v24

    .line 474
    .line 475
    move-object/from16 v21, v26

    .line 476
    .line 477
    move-object/from16 v24, v0

    .line 478
    .line 479
    move-object/from16 v23, v1

    .line 480
    .line 481
    move-object/from16 v1, v16

    .line 482
    .line 483
    move-object/from16 v16, v20

    .line 484
    .line 485
    move-object/from16 v20, v25

    .line 486
    .line 487
    filled-new-array/range {v1 .. v24}, [Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

    .line 488
    .line 489
    .line 490
    move-result-object v0

    .line 491
    sput-object v0, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;->$VALUES:[Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

    .line 492
    .line 493
    new-instance v0, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type$1;

    .line 494
    .line 495
    invoke-direct {v0}, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type$1;-><init>()V

    .line 496
    .line 497
    .line 498
    sput-object v0, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;->byName:Ljava/util/Map;

    .line 499
    .line 500
    return-void
.end method

.method private varargs constructor <init>(Ljava/lang/String;ILjava/lang/String;[Ljava/lang/Class;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Class<",
            "+",
            "Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader;",
            ">;)V"
        }
    .end annotation

    .annotation runtime Ljava/lang/SafeVarargs;
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;->httpName:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p4, p0, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;->headerTypes:[Ljava/lang/Class;

    .line 7
    .line 8
    return-void
.end method

.method public static getByHttpName(Ljava/lang/String;)Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;
    .locals 1

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    sget-object v0, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;->byName:Ljava/util/Map;

    .line 6
    .line 7
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

    .line 12
    .line 13
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;
    .locals 1

    .line 1
    const-class v0, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;
    .locals 1

    .line 1
    sget-object v0, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;->$VALUES:[Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getHeaderTypes()[Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()[",
            "Ljava/lang/Class<",
            "+",
            "Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;->headerTypes:[Ljava/lang/Class;

    .line 2
    .line 3
    return-object p0
.end method

.method public getHttpName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;->httpName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public isValidHeaderType(Ljava/lang/Class;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "+",
            "Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader;",
            ">;)Z"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lorg/fourthline/cling/support/model/dlna/message/header/DLNAHeader$Type;->getHeaderTypes()[Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    array-length v0, p0

    .line 6
    const/4 v1, 0x0

    .line 7
    move v2, v1

    .line 8
    :goto_0
    if-ge v2, v0, :cond_1

    .line 9
    .line 10
    aget-object v3, p0, v2

    .line 11
    .line 12
    invoke-virtual {v3, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 13
    .line 14
    .line 15
    move-result v3

    .line 16
    if-eqz v3, :cond_0

    .line 17
    .line 18
    const/4 p0, 0x1

    .line 19
    return p0

    .line 20
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    return v1
.end method
