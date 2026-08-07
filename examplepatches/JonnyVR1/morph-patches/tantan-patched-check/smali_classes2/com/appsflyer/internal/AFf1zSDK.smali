.class public final enum Lcom/appsflyer/internal/AFf1zSDK;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/appsflyer/internal/AFf1zSDK;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum AFAdRevenueData:Lcom/appsflyer/internal/AFf1zSDK;

.field public static final enum AFInAppEventParameterName:Lcom/appsflyer/internal/AFf1zSDK;

.field public static final enum AFInAppEventType:Lcom/appsflyer/internal/AFf1zSDK;

.field public static final enum AFKeystoreWrapper:Lcom/appsflyer/internal/AFf1zSDK;

.field public static final enum AFLogger:Lcom/appsflyer/internal/AFf1zSDK;

.field public static final enum areAllFieldsValid:Lcom/appsflyer/internal/AFf1zSDK;

.field public static final enum component1:Lcom/appsflyer/internal/AFf1zSDK;

.field public static final enum component2:Lcom/appsflyer/internal/AFf1zSDK;

.field public static final enum component3:Lcom/appsflyer/internal/AFf1zSDK;

.field public static final enum component4:Lcom/appsflyer/internal/AFf1zSDK;

.field public static final enum copy:Lcom/appsflyer/internal/AFf1zSDK;

.field public static final enum copydefault:Lcom/appsflyer/internal/AFf1zSDK;

.field private static final synthetic e:[Lcom/appsflyer/internal/AFf1zSDK;

.field public static final enum equals:Lcom/appsflyer/internal/AFf1zSDK;

.field public static final enum getCurrencyIso4217Code:Lcom/appsflyer/internal/AFf1zSDK;

.field public static final enum getMediationNetwork:Lcom/appsflyer/internal/AFf1zSDK;

.field public static final enum getMonetizationNetwork:Lcom/appsflyer/internal/AFf1zSDK;

.field public static final enum getRevenue:Lcom/appsflyer/internal/AFf1zSDK;

.field public static final enum hashCode:Lcom/appsflyer/internal/AFf1zSDK;

.field public static final enum toString:Lcom/appsflyer/internal/AFf1zSDK;

.field public static final enum valueOf:Lcom/appsflyer/internal/AFf1zSDK;

.field public static final enum values:Lcom/appsflyer/internal/AFf1zSDK;


# instance fields
.field public final unregisterClient:I


# direct methods
.method static constructor <clinit>()V
    .locals 24

    .line 1
    new-instance v1, Lcom/appsflyer/internal/AFf1zSDK;

    .line 2
    .line 3
    const-string v0, "RC_CDN"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x1

    .line 7
    invoke-direct {v1, v0, v2, v3}, Lcom/appsflyer/internal/AFf1zSDK;-><init>(Ljava/lang/String;II)V

    .line 8
    .line 9
    .line 10
    sput-object v1, Lcom/appsflyer/internal/AFf1zSDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFf1zSDK;

    .line 11
    .line 12
    new-instance v2, Lcom/appsflyer/internal/AFf1zSDK;

    .line 13
    .line 14
    const-string v0, "FETCH_ADVERTISING_ID"

    .line 15
    .line 16
    invoke-direct {v2, v0, v3, v3}, Lcom/appsflyer/internal/AFf1zSDK;-><init>(Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    sput-object v2, Lcom/appsflyer/internal/AFf1zSDK;->getRevenue:Lcom/appsflyer/internal/AFf1zSDK;

    .line 20
    .line 21
    new-instance v0, Lcom/appsflyer/internal/AFf1zSDK;

    .line 22
    .line 23
    const-string v4, "PLAY_INTEGRITY_API"

    .line 24
    .line 25
    const/4 v5, 0x2

    .line 26
    invoke-direct {v0, v4, v5, v3}, Lcom/appsflyer/internal/AFf1zSDK;-><init>(Ljava/lang/String;II)V

    .line 27
    .line 28
    .line 29
    sput-object v0, Lcom/appsflyer/internal/AFf1zSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFf1zSDK;

    .line 30
    .line 31
    new-instance v4, Lcom/appsflyer/internal/AFf1zSDK;

    .line 32
    .line 33
    const-string v3, "LOAD_CACHE"

    .line 34
    .line 35
    const/4 v6, 0x3

    .line 36
    invoke-direct {v4, v3, v6, v5}, Lcom/appsflyer/internal/AFf1zSDK;-><init>(Ljava/lang/String;II)V

    .line 37
    .line 38
    .line 39
    sput-object v4, Lcom/appsflyer/internal/AFf1zSDK;->getMediationNetwork:Lcom/appsflyer/internal/AFf1zSDK;

    .line 40
    .line 41
    new-instance v3, Lcom/appsflyer/internal/AFf1zSDK;

    .line 42
    .line 43
    const-string v7, "CACHED_EVENT"

    .line 44
    .line 45
    const/4 v8, 0x4

    .line 46
    invoke-direct {v3, v7, v8, v5}, Lcom/appsflyer/internal/AFf1zSDK;-><init>(Ljava/lang/String;II)V

    .line 47
    .line 48
    .line 49
    sput-object v3, Lcom/appsflyer/internal/AFf1zSDK;->getMonetizationNetwork:Lcom/appsflyer/internal/AFf1zSDK;

    .line 50
    .line 51
    new-instance v7, Lcom/appsflyer/internal/AFf1zSDK;

    .line 52
    .line 53
    const-string v9, "CONVERSION"

    .line 54
    .line 55
    const/4 v10, 0x5

    .line 56
    invoke-direct {v7, v9, v10, v5}, Lcom/appsflyer/internal/AFf1zSDK;-><init>(Ljava/lang/String;II)V

    .line 57
    .line 58
    .line 59
    sput-object v7, Lcom/appsflyer/internal/AFf1zSDK;->areAllFieldsValid:Lcom/appsflyer/internal/AFf1zSDK;

    .line 60
    .line 61
    move-object v9, v7

    .line 62
    new-instance v7, Lcom/appsflyer/internal/AFf1zSDK;

    .line 63
    .line 64
    const-string v10, "REGISTER_TRIGGER"

    .line 65
    .line 66
    const/4 v11, 0x6

    .line 67
    invoke-direct {v7, v10, v11, v5}, Lcom/appsflyer/internal/AFf1zSDK;-><init>(Ljava/lang/String;II)V

    .line 68
    .line 69
    .line 70
    sput-object v7, Lcom/appsflyer/internal/AFf1zSDK;->component2:Lcom/appsflyer/internal/AFf1zSDK;

    .line 71
    .line 72
    new-instance v10, Lcom/appsflyer/internal/AFf1zSDK;

    .line 73
    .line 74
    const-string v11, "ONELINK"

    .line 75
    .line 76
    const/4 v12, 0x7

    .line 77
    invoke-direct {v10, v11, v12, v5}, Lcom/appsflyer/internal/AFf1zSDK;-><init>(Ljava/lang/String;II)V

    .line 78
    .line 79
    .line 80
    sput-object v10, Lcom/appsflyer/internal/AFf1zSDK;->component1:Lcom/appsflyer/internal/AFf1zSDK;

    .line 81
    .line 82
    move-object v11, v9

    .line 83
    new-instance v9, Lcom/appsflyer/internal/AFf1zSDK;

    .line 84
    .line 85
    const-string v12, "DLSDK"

    .line 86
    .line 87
    const/16 v13, 0x8

    .line 88
    .line 89
    invoke-direct {v9, v12, v13, v5}, Lcom/appsflyer/internal/AFf1zSDK;-><init>(Ljava/lang/String;II)V

    .line 90
    .line 91
    .line 92
    sput-object v9, Lcom/appsflyer/internal/AFf1zSDK;->component3:Lcom/appsflyer/internal/AFf1zSDK;

    .line 93
    .line 94
    move-object v12, v10

    .line 95
    new-instance v10, Lcom/appsflyer/internal/AFf1zSDK;

    .line 96
    .line 97
    const-string v13, "RESOLVE_ESP"

    .line 98
    .line 99
    const/16 v14, 0x9

    .line 100
    .line 101
    invoke-direct {v10, v13, v14, v5}, Lcom/appsflyer/internal/AFf1zSDK;-><init>(Ljava/lang/String;II)V

    .line 102
    .line 103
    .line 104
    sput-object v10, Lcom/appsflyer/internal/AFf1zSDK;->component4:Lcom/appsflyer/internal/AFf1zSDK;

    .line 105
    .line 106
    move-object v13, v11

    .line 107
    new-instance v11, Lcom/appsflyer/internal/AFf1zSDK;

    .line 108
    .line 109
    const-string v14, "ATTR"

    .line 110
    .line 111
    const/16 v15, 0xa

    .line 112
    .line 113
    invoke-direct {v11, v14, v15, v5}, Lcom/appsflyer/internal/AFf1zSDK;-><init>(Ljava/lang/String;II)V

    .line 114
    .line 115
    .line 116
    sput-object v11, Lcom/appsflyer/internal/AFf1zSDK;->copy:Lcom/appsflyer/internal/AFf1zSDK;

    .line 117
    .line 118
    move-object v5, v12

    .line 119
    new-instance v12, Lcom/appsflyer/internal/AFf1zSDK;

    .line 120
    .line 121
    const-string v14, "GCDSDK"

    .line 122
    .line 123
    const/16 v15, 0xb

    .line 124
    .line 125
    invoke-direct {v12, v14, v15, v6}, Lcom/appsflyer/internal/AFf1zSDK;-><init>(Ljava/lang/String;II)V

    .line 126
    .line 127
    .line 128
    sput-object v12, Lcom/appsflyer/internal/AFf1zSDK;->equals:Lcom/appsflyer/internal/AFf1zSDK;

    .line 129
    .line 130
    move-object v6, v13

    .line 131
    new-instance v13, Lcom/appsflyer/internal/AFf1zSDK;

    .line 132
    .line 133
    const-string v14, "REGISTER"

    .line 134
    .line 135
    const/16 v15, 0xc

    .line 136
    .line 137
    invoke-direct {v13, v14, v15, v8}, Lcom/appsflyer/internal/AFf1zSDK;-><init>(Ljava/lang/String;II)V

    .line 138
    .line 139
    .line 140
    sput-object v13, Lcom/appsflyer/internal/AFf1zSDK;->toString:Lcom/appsflyer/internal/AFf1zSDK;

    .line 141
    .line 142
    new-instance v14, Lcom/appsflyer/internal/AFf1zSDK;

    .line 143
    .line 144
    const-string v15, "LAUNCH"

    .line 145
    .line 146
    move-object/from16 v16, v0

    .line 147
    .line 148
    const/16 v0, 0xd

    .line 149
    .line 150
    invoke-direct {v14, v15, v0, v8}, Lcom/appsflyer/internal/AFf1zSDK;-><init>(Ljava/lang/String;II)V

    .line 151
    .line 152
    .line 153
    sput-object v14, Lcom/appsflyer/internal/AFf1zSDK;->hashCode:Lcom/appsflyer/internal/AFf1zSDK;

    .line 154
    .line 155
    new-instance v15, Lcom/appsflyer/internal/AFf1zSDK;

    .line 156
    .line 157
    const-string v0, "INAPP"

    .line 158
    .line 159
    move-object/from16 v17, v1

    .line 160
    .line 161
    const/16 v1, 0xe

    .line 162
    .line 163
    invoke-direct {v15, v0, v1, v8}, Lcom/appsflyer/internal/AFf1zSDK;-><init>(Ljava/lang/String;II)V

    .line 164
    .line 165
    .line 166
    sput-object v15, Lcom/appsflyer/internal/AFf1zSDK;->copydefault:Lcom/appsflyer/internal/AFf1zSDK;

    .line 167
    .line 168
    new-instance v0, Lcom/appsflyer/internal/AFf1zSDK;

    .line 169
    .line 170
    const-string v1, "MANUAL_PURCHASE_VALIDATION"

    .line 171
    .line 172
    move-object/from16 v18, v2

    .line 173
    .line 174
    const/16 v2, 0xf

    .line 175
    .line 176
    invoke-direct {v0, v1, v2, v8}, Lcom/appsflyer/internal/AFf1zSDK;-><init>(Ljava/lang/String;II)V

    .line 177
    .line 178
    .line 179
    sput-object v0, Lcom/appsflyer/internal/AFf1zSDK;->AFInAppEventType:Lcom/appsflyer/internal/AFf1zSDK;

    .line 180
    .line 181
    new-instance v1, Lcom/appsflyer/internal/AFf1zSDK;

    .line 182
    .line 183
    const-string v2, "PURCHASE_VALIDATE"

    .line 184
    .line 185
    move-object/from16 v19, v0

    .line 186
    .line 187
    const/16 v0, 0x10

    .line 188
    .line 189
    invoke-direct {v1, v2, v0, v8}, Lcom/appsflyer/internal/AFf1zSDK;-><init>(Ljava/lang/String;II)V

    .line 190
    .line 191
    .line 192
    sput-object v1, Lcom/appsflyer/internal/AFf1zSDK;->AFInAppEventParameterName:Lcom/appsflyer/internal/AFf1zSDK;

    .line 193
    .line 194
    new-instance v0, Lcom/appsflyer/internal/AFf1zSDK;

    .line 195
    .line 196
    const-string v2, "SDK_SERVICES"

    .line 197
    .line 198
    move-object/from16 v20, v1

    .line 199
    .line 200
    const/16 v1, 0x11

    .line 201
    .line 202
    invoke-direct {v0, v2, v1, v8}, Lcom/appsflyer/internal/AFf1zSDK;-><init>(Ljava/lang/String;II)V

    .line 203
    .line 204
    .line 205
    sput-object v0, Lcom/appsflyer/internal/AFf1zSDK;->values:Lcom/appsflyer/internal/AFf1zSDK;

    .line 206
    .line 207
    new-instance v1, Lcom/appsflyer/internal/AFf1zSDK;

    .line 208
    .line 209
    const-string v2, "IMPRESSIONS"

    .line 210
    .line 211
    move-object/from16 v21, v0

    .line 212
    .line 213
    const/16 v0, 0x12

    .line 214
    .line 215
    invoke-direct {v1, v2, v0, v8}, Lcom/appsflyer/internal/AFf1zSDK;-><init>(Ljava/lang/String;II)V

    .line 216
    .line 217
    .line 218
    sput-object v1, Lcom/appsflyer/internal/AFf1zSDK;->valueOf:Lcom/appsflyer/internal/AFf1zSDK;

    .line 219
    .line 220
    new-instance v0, Lcom/appsflyer/internal/AFf1zSDK;

    .line 221
    .line 222
    const-string v2, "ARS_VALIDATE"

    .line 223
    .line 224
    move-object/from16 v22, v1

    .line 225
    .line 226
    const/16 v1, 0x13

    .line 227
    .line 228
    invoke-direct {v0, v2, v1, v8}, Lcom/appsflyer/internal/AFf1zSDK;-><init>(Ljava/lang/String;II)V

    .line 229
    .line 230
    .line 231
    sput-object v0, Lcom/appsflyer/internal/AFf1zSDK;->AFKeystoreWrapper:Lcom/appsflyer/internal/AFf1zSDK;

    .line 232
    .line 233
    new-instance v1, Lcom/appsflyer/internal/AFf1zSDK;

    .line 234
    .line 235
    const-string v2, "ADREVENUE"

    .line 236
    .line 237
    move-object/from16 v23, v0

    .line 238
    .line 239
    const/16 v0, 0x14

    .line 240
    .line 241
    invoke-direct {v1, v2, v0, v8}, Lcom/appsflyer/internal/AFf1zSDK;-><init>(Ljava/lang/String;II)V

    .line 242
    .line 243
    .line 244
    sput-object v1, Lcom/appsflyer/internal/AFf1zSDK;->AFLogger:Lcom/appsflyer/internal/AFf1zSDK;

    .line 245
    .line 246
    move-object v8, v5

    .line 247
    move-object/from16 v2, v18

    .line 248
    .line 249
    move-object/from16 v18, v21

    .line 250
    .line 251
    move-object/from16 v21, v1

    .line 252
    .line 253
    move-object v5, v3

    .line 254
    move-object/from16 v3, v16

    .line 255
    .line 256
    move-object/from16 v1, v17

    .line 257
    .line 258
    move-object/from16 v16, v19

    .line 259
    .line 260
    move-object/from16 v17, v20

    .line 261
    .line 262
    move-object/from16 v19, v22

    .line 263
    .line 264
    move-object/from16 v20, v23

    .line 265
    .line 266
    filled-new-array/range {v1 .. v21}, [Lcom/appsflyer/internal/AFf1zSDK;

    .line 267
    .line 268
    .line 269
    move-result-object v0

    .line 270
    sput-object v0, Lcom/appsflyer/internal/AFf1zSDK;->e:[Lcom/appsflyer/internal/AFf1zSDK;

    .line 271
    .line 272
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
    iput p3, p0, Lcom/appsflyer/internal/AFf1zSDK;->unregisterClient:I

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/appsflyer/internal/AFf1zSDK;
    .locals 1

    .line 1
    const-class v0, Lcom/appsflyer/internal/AFf1zSDK;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/appsflyer/internal/AFf1zSDK;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/appsflyer/internal/AFf1zSDK;
    .locals 1

    .line 1
    sget-object v0, Lcom/appsflyer/internal/AFf1zSDK;->e:[Lcom/appsflyer/internal/AFf1zSDK;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/appsflyer/internal/AFf1zSDK;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/appsflyer/internal/AFf1zSDK;

    .line 8
    .line 9
    return-object v0
.end method
