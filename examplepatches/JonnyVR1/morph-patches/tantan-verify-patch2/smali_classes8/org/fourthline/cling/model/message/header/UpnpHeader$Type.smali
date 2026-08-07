.class public final enum Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/fourthline/cling/model/message/header/UpnpHeader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Type"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

.field public static final enum CALLBACK:Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

.field public static final enum CONTENT_RANGE:Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

.field public static final enum CONTENT_TYPE:Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

.field public static final enum EXT:Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

.field public static final enum EXT_AV_CLIENT_INFO:Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

.field public static final enum EXT_IFACE_MAC:Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

.field public static final enum HOST:Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

.field public static final enum LOCATION:Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

.field public static final enum MAN:Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

.field public static final enum MAX_AGE:Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

.field public static final enum MX:Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

.field public static final enum NT:Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

.field public static final enum NTS:Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

.field public static final enum PRAGMA:Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

.field public static final enum RANGE:Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

.field public static final enum SEQ:Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

.field public static final enum SERVER:Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

.field public static final enum SID:Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

.field public static final enum SOAPACTION:Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

.field public static final enum ST:Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

.field public static final enum TIMEOUT:Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

.field public static final enum USER_AGENT:Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

.field public static final enum USN:Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

.field private static byName:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;",
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
            "Lorg/fourthline/cling/model/message/header/UpnpHeader;",
            ">;"
        }
    .end annotation
.end field

.field private httpName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 27

    .line 1
    new-instance v1, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

    .line 2
    .line 3
    const-class v0, Lorg/fourthline/cling/model/message/header/ServiceUSNHeader;

    .line 4
    .line 5
    const-class v2, Lorg/fourthline/cling/model/message/header/UDNHeader;

    .line 6
    .line 7
    const-class v3, Lorg/fourthline/cling/model/message/header/USNRootDeviceHeader;

    .line 8
    .line 9
    const-class v4, Lorg/fourthline/cling/model/message/header/DeviceUSNHeader;

    .line 10
    .line 11
    filled-new-array {v3, v4, v0, v2}, [Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v2, "USN"

    .line 16
    .line 17
    const/4 v3, 0x0

    .line 18
    invoke-direct {v1, v2, v3, v2, v0}, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;-><init>(Ljava/lang/String;ILjava/lang/String;[Ljava/lang/Class;)V

    .line 19
    .line 20
    .line 21
    sput-object v1, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;->USN:Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

    .line 22
    .line 23
    new-instance v2, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

    .line 24
    .line 25
    const-class v8, Lorg/fourthline/cling/model/message/header/UDNHeader;

    .line 26
    .line 27
    const-class v9, Lorg/fourthline/cling/model/message/header/NTEventHeader;

    .line 28
    .line 29
    const-class v3, Lorg/fourthline/cling/model/message/header/RootDeviceHeader;

    .line 30
    .line 31
    const-class v4, Lorg/fourthline/cling/model/message/header/UDADeviceTypeHeader;

    .line 32
    .line 33
    const-class v5, Lorg/fourthline/cling/model/message/header/UDAServiceTypeHeader;

    .line 34
    .line 35
    const-class v6, Lorg/fourthline/cling/model/message/header/DeviceTypeHeader;

    .line 36
    .line 37
    const-class v7, Lorg/fourthline/cling/model/message/header/ServiceTypeHeader;

    .line 38
    .line 39
    filled-new-array/range {v3 .. v9}, [Ljava/lang/Class;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    const-string v3, "NT"

    .line 44
    .line 45
    const/4 v4, 0x1

    .line 46
    invoke-direct {v2, v3, v4, v3, v0}, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;-><init>(Ljava/lang/String;ILjava/lang/String;[Ljava/lang/Class;)V

    .line 47
    .line 48
    .line 49
    sput-object v2, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;->NT:Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

    .line 50
    .line 51
    new-instance v3, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

    .line 52
    .line 53
    const-class v0, Lorg/fourthline/cling/model/message/header/NTSHeader;

    .line 54
    .line 55
    filled-new-array {v0}, [Ljava/lang/Class;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    const-string v4, "NTS"

    .line 60
    .line 61
    const/4 v5, 0x2

    .line 62
    invoke-direct {v3, v4, v5, v4, v0}, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;-><init>(Ljava/lang/String;ILjava/lang/String;[Ljava/lang/Class;)V

    .line 63
    .line 64
    .line 65
    sput-object v3, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;->NTS:Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

    .line 66
    .line 67
    new-instance v4, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

    .line 68
    .line 69
    const-class v0, Lorg/fourthline/cling/model/message/header/HostHeader;

    .line 70
    .line 71
    filled-new-array {v0}, [Ljava/lang/Class;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    const-string v5, "HOST"

    .line 76
    .line 77
    const/4 v6, 0x3

    .line 78
    invoke-direct {v4, v5, v6, v5, v0}, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;-><init>(Ljava/lang/String;ILjava/lang/String;[Ljava/lang/Class;)V

    .line 79
    .line 80
    .line 81
    sput-object v4, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;->HOST:Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

    .line 82
    .line 83
    new-instance v5, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

    .line 84
    .line 85
    const-class v0, Lorg/fourthline/cling/model/message/header/ServerHeader;

    .line 86
    .line 87
    filled-new-array {v0}, [Ljava/lang/Class;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    const-string v6, "SERVER"

    .line 92
    .line 93
    const/4 v7, 0x4

    .line 94
    invoke-direct {v5, v6, v7, v6, v0}, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;-><init>(Ljava/lang/String;ILjava/lang/String;[Ljava/lang/Class;)V

    .line 95
    .line 96
    .line 97
    sput-object v5, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;->SERVER:Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

    .line 98
    .line 99
    new-instance v6, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

    .line 100
    .line 101
    const-class v0, Lorg/fourthline/cling/model/message/header/LocationHeader;

    .line 102
    .line 103
    filled-new-array {v0}, [Ljava/lang/Class;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    const-string v7, "LOCATION"

    .line 108
    .line 109
    const/4 v8, 0x5

    .line 110
    invoke-direct {v6, v7, v8, v7, v0}, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;-><init>(Ljava/lang/String;ILjava/lang/String;[Ljava/lang/Class;)V

    .line 111
    .line 112
    .line 113
    sput-object v6, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;->LOCATION:Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

    .line 114
    .line 115
    new-instance v7, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

    .line 116
    .line 117
    const-class v0, Lorg/fourthline/cling/model/message/header/MaxAgeHeader;

    .line 118
    .line 119
    filled-new-array {v0}, [Ljava/lang/Class;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    const-string v8, "MAX_AGE"

    .line 124
    .line 125
    const/4 v9, 0x6

    .line 126
    const-string v10, "CACHE-CONTROL"

    .line 127
    .line 128
    invoke-direct {v7, v8, v9, v10, v0}, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;-><init>(Ljava/lang/String;ILjava/lang/String;[Ljava/lang/Class;)V

    .line 129
    .line 130
    .line 131
    sput-object v7, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;->MAX_AGE:Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

    .line 132
    .line 133
    new-instance v8, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

    .line 134
    .line 135
    const-class v0, Lorg/fourthline/cling/model/message/header/UserAgentHeader;

    .line 136
    .line 137
    filled-new-array {v0}, [Ljava/lang/Class;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    const-string v9, "USER_AGENT"

    .line 142
    .line 143
    const/4 v10, 0x7

    .line 144
    const-string v11, "USER-AGENT"

    .line 145
    .line 146
    invoke-direct {v8, v9, v10, v11, v0}, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;-><init>(Ljava/lang/String;ILjava/lang/String;[Ljava/lang/Class;)V

    .line 147
    .line 148
    .line 149
    sput-object v8, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;->USER_AGENT:Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

    .line 150
    .line 151
    new-instance v9, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

    .line 152
    .line 153
    const-class v0, Lorg/fourthline/cling/model/message/header/ContentTypeHeader;

    .line 154
    .line 155
    filled-new-array {v0}, [Ljava/lang/Class;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    const-string v10, "CONTENT_TYPE"

    .line 160
    .line 161
    const/16 v11, 0x8

    .line 162
    .line 163
    const-string v12, "CONTENT-TYPE"

    .line 164
    .line 165
    invoke-direct {v9, v10, v11, v12, v0}, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;-><init>(Ljava/lang/String;ILjava/lang/String;[Ljava/lang/Class;)V

    .line 166
    .line 167
    .line 168
    sput-object v9, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;->CONTENT_TYPE:Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

    .line 169
    .line 170
    new-instance v10, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

    .line 171
    .line 172
    const-class v0, Lorg/fourthline/cling/model/message/header/MANHeader;

    .line 173
    .line 174
    filled-new-array {v0}, [Ljava/lang/Class;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    const-string v11, "MAN"

    .line 179
    .line 180
    const/16 v12, 0x9

    .line 181
    .line 182
    invoke-direct {v10, v11, v12, v11, v0}, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;-><init>(Ljava/lang/String;ILjava/lang/String;[Ljava/lang/Class;)V

    .line 183
    .line 184
    .line 185
    sput-object v10, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;->MAN:Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

    .line 186
    .line 187
    new-instance v11, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

    .line 188
    .line 189
    const-class v0, Lorg/fourthline/cling/model/message/header/MXHeader;

    .line 190
    .line 191
    filled-new-array {v0}, [Ljava/lang/Class;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    const-string v12, "MX"

    .line 196
    .line 197
    const/16 v13, 0xa

    .line 198
    .line 199
    invoke-direct {v11, v12, v13, v12, v0}, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;-><init>(Ljava/lang/String;ILjava/lang/String;[Ljava/lang/Class;)V

    .line 200
    .line 201
    .line 202
    sput-object v11, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;->MX:Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

    .line 203
    .line 204
    new-instance v12, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

    .line 205
    .line 206
    const-class v18, Lorg/fourthline/cling/model/message/header/ServiceTypeHeader;

    .line 207
    .line 208
    const-class v19, Lorg/fourthline/cling/model/message/header/UDNHeader;

    .line 209
    .line 210
    const-class v13, Lorg/fourthline/cling/model/message/header/STAllHeader;

    .line 211
    .line 212
    const-class v14, Lorg/fourthline/cling/model/message/header/RootDeviceHeader;

    .line 213
    .line 214
    const-class v15, Lorg/fourthline/cling/model/message/header/UDADeviceTypeHeader;

    .line 215
    .line 216
    const-class v16, Lorg/fourthline/cling/model/message/header/UDAServiceTypeHeader;

    .line 217
    .line 218
    const-class v17, Lorg/fourthline/cling/model/message/header/DeviceTypeHeader;

    .line 219
    .line 220
    filled-new-array/range {v13 .. v19}, [Ljava/lang/Class;

    .line 221
    .line 222
    .line 223
    move-result-object v0

    .line 224
    const-string v13, "ST"

    .line 225
    .line 226
    const/16 v14, 0xb

    .line 227
    .line 228
    invoke-direct {v12, v13, v14, v13, v0}, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;-><init>(Ljava/lang/String;ILjava/lang/String;[Ljava/lang/Class;)V

    .line 229
    .line 230
    .line 231
    sput-object v12, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;->ST:Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

    .line 232
    .line 233
    new-instance v13, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

    .line 234
    .line 235
    const-class v0, Lorg/fourthline/cling/model/message/header/EXTHeader;

    .line 236
    .line 237
    filled-new-array {v0}, [Ljava/lang/Class;

    .line 238
    .line 239
    .line 240
    move-result-object v0

    .line 241
    const-string v14, "EXT"

    .line 242
    .line 243
    const/16 v15, 0xc

    .line 244
    .line 245
    invoke-direct {v13, v14, v15, v14, v0}, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;-><init>(Ljava/lang/String;ILjava/lang/String;[Ljava/lang/Class;)V

    .line 246
    .line 247
    .line 248
    sput-object v13, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;->EXT:Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

    .line 249
    .line 250
    new-instance v14, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

    .line 251
    .line 252
    const-class v0, Lorg/fourthline/cling/model/message/header/SoapActionHeader;

    .line 253
    .line 254
    filled-new-array {v0}, [Ljava/lang/Class;

    .line 255
    .line 256
    .line 257
    move-result-object v0

    .line 258
    const-string v15, "SOAPACTION"

    .line 259
    .line 260
    move-object/from16 v16, v1

    .line 261
    .line 262
    const/16 v1, 0xd

    .line 263
    .line 264
    invoke-direct {v14, v15, v1, v15, v0}, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;-><init>(Ljava/lang/String;ILjava/lang/String;[Ljava/lang/Class;)V

    .line 265
    .line 266
    .line 267
    sput-object v14, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;->SOAPACTION:Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

    .line 268
    .line 269
    new-instance v15, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

    .line 270
    .line 271
    const-class v0, Lorg/fourthline/cling/model/message/header/TimeoutHeader;

    .line 272
    .line 273
    filled-new-array {v0}, [Ljava/lang/Class;

    .line 274
    .line 275
    .line 276
    move-result-object v0

    .line 277
    const-string v1, "TIMEOUT"

    .line 278
    .line 279
    move-object/from16 v17, v2

    .line 280
    .line 281
    const/16 v2, 0xe

    .line 282
    .line 283
    invoke-direct {v15, v1, v2, v1, v0}, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;-><init>(Ljava/lang/String;ILjava/lang/String;[Ljava/lang/Class;)V

    .line 284
    .line 285
    .line 286
    sput-object v15, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;->TIMEOUT:Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

    .line 287
    .line 288
    new-instance v0, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

    .line 289
    .line 290
    const-class v1, Lorg/fourthline/cling/model/message/header/CallbackHeader;

    .line 291
    .line 292
    filled-new-array {v1}, [Ljava/lang/Class;

    .line 293
    .line 294
    .line 295
    move-result-object v1

    .line 296
    const-string v2, "CALLBACK"

    .line 297
    .line 298
    move-object/from16 v18, v3

    .line 299
    .line 300
    const/16 v3, 0xf

    .line 301
    .line 302
    invoke-direct {v0, v2, v3, v2, v1}, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;-><init>(Ljava/lang/String;ILjava/lang/String;[Ljava/lang/Class;)V

    .line 303
    .line 304
    .line 305
    sput-object v0, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;->CALLBACK:Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

    .line 306
    .line 307
    new-instance v1, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

    .line 308
    .line 309
    const-class v2, Lorg/fourthline/cling/model/message/header/SubscriptionIdHeader;

    .line 310
    .line 311
    filled-new-array {v2}, [Ljava/lang/Class;

    .line 312
    .line 313
    .line 314
    move-result-object v2

    .line 315
    const-string v3, "SID"

    .line 316
    .line 317
    move-object/from16 v19, v0

    .line 318
    .line 319
    const/16 v0, 0x10

    .line 320
    .line 321
    invoke-direct {v1, v3, v0, v3, v2}, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;-><init>(Ljava/lang/String;ILjava/lang/String;[Ljava/lang/Class;)V

    .line 322
    .line 323
    .line 324
    sput-object v1, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;->SID:Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

    .line 325
    .line 326
    new-instance v0, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

    .line 327
    .line 328
    const-class v2, Lorg/fourthline/cling/model/message/header/EventSequenceHeader;

    .line 329
    .line 330
    filled-new-array {v2}, [Ljava/lang/Class;

    .line 331
    .line 332
    .line 333
    move-result-object v2

    .line 334
    const-string v3, "SEQ"

    .line 335
    .line 336
    move-object/from16 v20, v1

    .line 337
    .line 338
    const/16 v1, 0x11

    .line 339
    .line 340
    invoke-direct {v0, v3, v1, v3, v2}, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;-><init>(Ljava/lang/String;ILjava/lang/String;[Ljava/lang/Class;)V

    .line 341
    .line 342
    .line 343
    sput-object v0, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;->SEQ:Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

    .line 344
    .line 345
    new-instance v1, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

    .line 346
    .line 347
    const-class v2, Lorg/fourthline/cling/model/message/header/RangeHeader;

    .line 348
    .line 349
    filled-new-array {v2}, [Ljava/lang/Class;

    .line 350
    .line 351
    .line 352
    move-result-object v2

    .line 353
    const-string v3, "RANGE"

    .line 354
    .line 355
    move-object/from16 v21, v0

    .line 356
    .line 357
    const/16 v0, 0x12

    .line 358
    .line 359
    invoke-direct {v1, v3, v0, v3, v2}, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;-><init>(Ljava/lang/String;ILjava/lang/String;[Ljava/lang/Class;)V

    .line 360
    .line 361
    .line 362
    sput-object v1, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;->RANGE:Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

    .line 363
    .line 364
    new-instance v0, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

    .line 365
    .line 366
    const-class v2, Lorg/fourthline/cling/model/message/header/ContentRangeHeader;

    .line 367
    .line 368
    filled-new-array {v2}, [Ljava/lang/Class;

    .line 369
    .line 370
    .line 371
    move-result-object v2

    .line 372
    const-string v3, "CONTENT_RANGE"

    .line 373
    .line 374
    move-object/from16 v22, v1

    .line 375
    .line 376
    const/16 v1, 0x13

    .line 377
    .line 378
    move-object/from16 v23, v4

    .line 379
    .line 380
    const-string v4, "CONTENT-RANGE"

    .line 381
    .line 382
    invoke-direct {v0, v3, v1, v4, v2}, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;-><init>(Ljava/lang/String;ILjava/lang/String;[Ljava/lang/Class;)V

    .line 383
    .line 384
    .line 385
    sput-object v0, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;->CONTENT_RANGE:Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

    .line 386
    .line 387
    new-instance v1, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

    .line 388
    .line 389
    const-class v2, Lorg/fourthline/cling/model/message/header/PragmaHeader;

    .line 390
    .line 391
    filled-new-array {v2}, [Ljava/lang/Class;

    .line 392
    .line 393
    .line 394
    move-result-object v2

    .line 395
    const-string v3, "PRAGMA"

    .line 396
    .line 397
    const/16 v4, 0x14

    .line 398
    .line 399
    invoke-direct {v1, v3, v4, v3, v2}, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;-><init>(Ljava/lang/String;ILjava/lang/String;[Ljava/lang/Class;)V

    .line 400
    .line 401
    .line 402
    sput-object v1, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;->PRAGMA:Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

    .line 403
    .line 404
    new-instance v2, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

    .line 405
    .line 406
    const-class v3, Lorg/fourthline/cling/model/message/header/InterfaceMacHeader;

    .line 407
    .line 408
    filled-new-array {v3}, [Ljava/lang/Class;

    .line 409
    .line 410
    .line 411
    move-result-object v3

    .line 412
    const-string v4, "EXT_IFACE_MAC"

    .line 413
    .line 414
    move-object/from16 v24, v0

    .line 415
    .line 416
    const/16 v0, 0x15

    .line 417
    .line 418
    move-object/from16 v25, v1

    .line 419
    .line 420
    const-string v1, "X-CLING-IFACE-MAC"

    .line 421
    .line 422
    invoke-direct {v2, v4, v0, v1, v3}, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;-><init>(Ljava/lang/String;ILjava/lang/String;[Ljava/lang/Class;)V

    .line 423
    .line 424
    .line 425
    sput-object v2, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;->EXT_IFACE_MAC:Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

    .line 426
    .line 427
    new-instance v0, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

    .line 428
    .line 429
    const-class v1, Lorg/fourthline/cling/model/message/header/AVClientInfoHeader;

    .line 430
    .line 431
    filled-new-array {v1}, [Ljava/lang/Class;

    .line 432
    .line 433
    .line 434
    move-result-object v1

    .line 435
    const-string v3, "EXT_AV_CLIENT_INFO"

    .line 436
    .line 437
    const/16 v4, 0x16

    .line 438
    .line 439
    move-object/from16 v26, v2

    .line 440
    .line 441
    const-string v2, "X-AV-CLIENT-INFO"

    .line 442
    .line 443
    invoke-direct {v0, v3, v4, v2, v1}, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;-><init>(Ljava/lang/String;ILjava/lang/String;[Ljava/lang/Class;)V

    .line 444
    .line 445
    .line 446
    sput-object v0, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;->EXT_AV_CLIENT_INFO:Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

    .line 447
    .line 448
    move-object/from16 v1, v16

    .line 449
    .line 450
    move-object/from16 v2, v17

    .line 451
    .line 452
    move-object/from16 v3, v18

    .line 453
    .line 454
    move-object/from16 v16, v19

    .line 455
    .line 456
    move-object/from16 v17, v20

    .line 457
    .line 458
    move-object/from16 v18, v21

    .line 459
    .line 460
    move-object/from16 v19, v22

    .line 461
    .line 462
    move-object/from16 v4, v23

    .line 463
    .line 464
    move-object/from16 v20, v24

    .line 465
    .line 466
    move-object/from16 v21, v25

    .line 467
    .line 468
    move-object/from16 v22, v26

    .line 469
    .line 470
    move-object/from16 v23, v0

    .line 471
    .line 472
    filled-new-array/range {v1 .. v23}, [Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

    .line 473
    .line 474
    .line 475
    move-result-object v0

    .line 476
    sput-object v0, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;->$VALUES:[Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

    .line 477
    .line 478
    new-instance v0, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type$1;

    .line 479
    .line 480
    invoke-direct {v0}, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type$1;-><init>()V

    .line 481
    .line 482
    .line 483
    sput-object v0, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;->byName:Ljava/util/Map;

    .line 484
    .line 485
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
            "Lorg/fourthline/cling/model/message/header/UpnpHeader;",
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
    iput-object p3, p0, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;->httpName:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p4, p0, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;->headerTypes:[Ljava/lang/Class;

    .line 7
    .line 8
    return-void
.end method

.method public static getByHttpName(Ljava/lang/String;)Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;
    .locals 2

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    sget-object v0, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;->byName:Ljava/util/Map;

    .line 6
    .line 7
    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    .line 8
    .line 9
    invoke-virtual {p0, v1}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

    .line 18
    .line 19
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;
    .locals 1

    .line 1
    const-class v0, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;
    .locals 1

    .line 1
    sget-object v0, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;->$VALUES:[Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;

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
            "Lorg/fourthline/cling/model/message/header/UpnpHeader;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;->headerTypes:[Ljava/lang/Class;

    .line 2
    .line 3
    return-object p0
.end method

.method public getHttpName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;->httpName:Ljava/lang/String;

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
            "Lorg/fourthline/cling/model/message/header/UpnpHeader;",
            ">;)Z"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lorg/fourthline/cling/model/message/header/UpnpHeader$Type;->getHeaderTypes()[Ljava/lang/Class;

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
