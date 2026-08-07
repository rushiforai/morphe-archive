.class public final enum Lcom/alibaba/fastjson/serializer/SerializerFeature;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/alibaba/fastjson/serializer/SerializerFeature;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/alibaba/fastjson/serializer/SerializerFeature;

.field public static final enum BeanToArray:Lcom/alibaba/fastjson/serializer/SerializerFeature;

.field public static final enum BrowserCompatible:Lcom/alibaba/fastjson/serializer/SerializerFeature;

.field public static final enum BrowserSecure:Lcom/alibaba/fastjson/serializer/SerializerFeature;

.field public static final enum DisableCheckSpecialChar:Lcom/alibaba/fastjson/serializer/SerializerFeature;

.field public static final enum DisableCircularReferenceDetect:Lcom/alibaba/fastjson/serializer/SerializerFeature;

.field public static final EMPTY:[Lcom/alibaba/fastjson/serializer/SerializerFeature;

.field public static final enum IgnoreErrorGetter:Lcom/alibaba/fastjson/serializer/SerializerFeature;

.field public static final enum IgnoreNonFieldGetter:Lcom/alibaba/fastjson/serializer/SerializerFeature;

.field public static final enum MapSortField:Lcom/alibaba/fastjson/serializer/SerializerFeature;

.field public static final enum NotWriteDefaultValue:Lcom/alibaba/fastjson/serializer/SerializerFeature;

.field public static final enum NotWriteRootClassName:Lcom/alibaba/fastjson/serializer/SerializerFeature;

.field public static final enum PrettyFormat:Lcom/alibaba/fastjson/serializer/SerializerFeature;

.field public static final enum QuoteFieldNames:Lcom/alibaba/fastjson/serializer/SerializerFeature;

.field public static final enum SkipTransientField:Lcom/alibaba/fastjson/serializer/SerializerFeature;

.field public static final enum SortField:Lcom/alibaba/fastjson/serializer/SerializerFeature;

.field public static final enum UseISO8601DateFormat:Lcom/alibaba/fastjson/serializer/SerializerFeature;

.field public static final enum UseSingleQuotes:Lcom/alibaba/fastjson/serializer/SerializerFeature;

.field public static final WRITE_MAP_NULL_FEATURES:I

.field public static final enum WriteBigDecimalAsPlain:Lcom/alibaba/fastjson/serializer/SerializerFeature;

.field public static final enum WriteClassName:Lcom/alibaba/fastjson/serializer/SerializerFeature;

.field public static final enum WriteDateUseDateFormat:Lcom/alibaba/fastjson/serializer/SerializerFeature;

.field public static final enum WriteEnumUsingName:Lcom/alibaba/fastjson/serializer/SerializerFeature;

.field public static final enum WriteEnumUsingToString:Lcom/alibaba/fastjson/serializer/SerializerFeature;

.field public static final enum WriteMapNullValue:Lcom/alibaba/fastjson/serializer/SerializerFeature;

.field public static final enum WriteNonStringKeyAsString:Lcom/alibaba/fastjson/serializer/SerializerFeature;

.field public static final enum WriteNonStringValueAsString:Lcom/alibaba/fastjson/serializer/SerializerFeature;

.field public static final enum WriteNullBooleanAsFalse:Lcom/alibaba/fastjson/serializer/SerializerFeature;

.field public static final enum WriteNullListAsEmpty:Lcom/alibaba/fastjson/serializer/SerializerFeature;

.field public static final enum WriteNullNumberAsZero:Lcom/alibaba/fastjson/serializer/SerializerFeature;

.field public static final enum WriteNullStringAsEmpty:Lcom/alibaba/fastjson/serializer/SerializerFeature;

.field public static final enum WriteSlashAsSpecial:Lcom/alibaba/fastjson/serializer/SerializerFeature;

.field public static final enum WriteTabAsSpecial:Lcom/alibaba/fastjson/serializer/SerializerFeature;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field


# instance fields
.field public final mask:I


# direct methods
.method static constructor <clinit>()V
    .locals 33

    .line 1
    new-instance v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 2
    .line 3
    const-string v0, "QuoteFieldNames"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v1, v0, v2}, Lcom/alibaba/fastjson/serializer/SerializerFeature;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->QuoteFieldNames:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 10
    .line 11
    move v0, v2

    .line 12
    new-instance v2, Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 13
    .line 14
    const-string v3, "UseSingleQuotes"

    .line 15
    .line 16
    const/4 v4, 0x1

    .line 17
    invoke-direct {v2, v3, v4}, Lcom/alibaba/fastjson/serializer/SerializerFeature;-><init>(Ljava/lang/String;I)V

    .line 18
    .line 19
    .line 20
    sput-object v2, Lcom/alibaba/fastjson/serializer/SerializerFeature;->UseSingleQuotes:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 21
    .line 22
    new-instance v3, Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 23
    .line 24
    const-string v4, "WriteMapNullValue"

    .line 25
    .line 26
    const/4 v5, 0x2

    .line 27
    invoke-direct {v3, v4, v5}, Lcom/alibaba/fastjson/serializer/SerializerFeature;-><init>(Ljava/lang/String;I)V

    .line 28
    .line 29
    .line 30
    sput-object v3, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteMapNullValue:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 31
    .line 32
    new-instance v4, Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 33
    .line 34
    const-string v5, "WriteEnumUsingToString"

    .line 35
    .line 36
    const/4 v6, 0x3

    .line 37
    invoke-direct {v4, v5, v6}, Lcom/alibaba/fastjson/serializer/SerializerFeature;-><init>(Ljava/lang/String;I)V

    .line 38
    .line 39
    .line 40
    sput-object v4, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteEnumUsingToString:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 41
    .line 42
    new-instance v5, Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 43
    .line 44
    const-string v6, "WriteEnumUsingName"

    .line 45
    .line 46
    const/4 v7, 0x4

    .line 47
    invoke-direct {v5, v6, v7}, Lcom/alibaba/fastjson/serializer/SerializerFeature;-><init>(Ljava/lang/String;I)V

    .line 48
    .line 49
    .line 50
    sput-object v5, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteEnumUsingName:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 51
    .line 52
    new-instance v6, Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 53
    .line 54
    const-string v7, "UseISO8601DateFormat"

    .line 55
    .line 56
    const/4 v8, 0x5

    .line 57
    invoke-direct {v6, v7, v8}, Lcom/alibaba/fastjson/serializer/SerializerFeature;-><init>(Ljava/lang/String;I)V

    .line 58
    .line 59
    .line 60
    sput-object v6, Lcom/alibaba/fastjson/serializer/SerializerFeature;->UseISO8601DateFormat:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 61
    .line 62
    new-instance v7, Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 63
    .line 64
    const-string v8, "WriteNullListAsEmpty"

    .line 65
    .line 66
    const/4 v9, 0x6

    .line 67
    invoke-direct {v7, v8, v9}, Lcom/alibaba/fastjson/serializer/SerializerFeature;-><init>(Ljava/lang/String;I)V

    .line 68
    .line 69
    .line 70
    sput-object v7, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteNullListAsEmpty:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 71
    .line 72
    new-instance v8, Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 73
    .line 74
    const-string v9, "WriteNullStringAsEmpty"

    .line 75
    .line 76
    const/4 v10, 0x7

    .line 77
    invoke-direct {v8, v9, v10}, Lcom/alibaba/fastjson/serializer/SerializerFeature;-><init>(Ljava/lang/String;I)V

    .line 78
    .line 79
    .line 80
    sput-object v8, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteNullStringAsEmpty:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 81
    .line 82
    new-instance v9, Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 83
    .line 84
    const-string v10, "WriteNullNumberAsZero"

    .line 85
    .line 86
    const/16 v11, 0x8

    .line 87
    .line 88
    invoke-direct {v9, v10, v11}, Lcom/alibaba/fastjson/serializer/SerializerFeature;-><init>(Ljava/lang/String;I)V

    .line 89
    .line 90
    .line 91
    sput-object v9, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteNullNumberAsZero:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 92
    .line 93
    new-instance v10, Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 94
    .line 95
    const-string v11, "WriteNullBooleanAsFalse"

    .line 96
    .line 97
    const/16 v12, 0x9

    .line 98
    .line 99
    invoke-direct {v10, v11, v12}, Lcom/alibaba/fastjson/serializer/SerializerFeature;-><init>(Ljava/lang/String;I)V

    .line 100
    .line 101
    .line 102
    sput-object v10, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteNullBooleanAsFalse:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 103
    .line 104
    new-instance v11, Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 105
    .line 106
    const-string v12, "SkipTransientField"

    .line 107
    .line 108
    const/16 v13, 0xa

    .line 109
    .line 110
    invoke-direct {v11, v12, v13}, Lcom/alibaba/fastjson/serializer/SerializerFeature;-><init>(Ljava/lang/String;I)V

    .line 111
    .line 112
    .line 113
    sput-object v11, Lcom/alibaba/fastjson/serializer/SerializerFeature;->SkipTransientField:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 114
    .line 115
    new-instance v12, Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 116
    .line 117
    const-string v13, "SortField"

    .line 118
    .line 119
    const/16 v14, 0xb

    .line 120
    .line 121
    invoke-direct {v12, v13, v14}, Lcom/alibaba/fastjson/serializer/SerializerFeature;-><init>(Ljava/lang/String;I)V

    .line 122
    .line 123
    .line 124
    sput-object v12, Lcom/alibaba/fastjson/serializer/SerializerFeature;->SortField:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 125
    .line 126
    new-instance v13, Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 127
    .line 128
    const-string v14, "WriteTabAsSpecial"

    .line 129
    .line 130
    const/16 v15, 0xc

    .line 131
    .line 132
    invoke-direct {v13, v14, v15}, Lcom/alibaba/fastjson/serializer/SerializerFeature;-><init>(Ljava/lang/String;I)V

    .line 133
    .line 134
    .line 135
    sput-object v13, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteTabAsSpecial:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 136
    .line 137
    new-instance v14, Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 138
    .line 139
    const-string v15, "PrettyFormat"

    .line 140
    .line 141
    const/16 v0, 0xd

    .line 142
    .line 143
    invoke-direct {v14, v15, v0}, Lcom/alibaba/fastjson/serializer/SerializerFeature;-><init>(Ljava/lang/String;I)V

    .line 144
    .line 145
    .line 146
    sput-object v14, Lcom/alibaba/fastjson/serializer/SerializerFeature;->PrettyFormat:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 147
    .line 148
    new-instance v15, Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 149
    .line 150
    const-string v0, "WriteClassName"

    .line 151
    .line 152
    move-object/from16 v17, v1

    .line 153
    .line 154
    const/16 v1, 0xe

    .line 155
    .line 156
    invoke-direct {v15, v0, v1}, Lcom/alibaba/fastjson/serializer/SerializerFeature;-><init>(Ljava/lang/String;I)V

    .line 157
    .line 158
    .line 159
    sput-object v15, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteClassName:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 160
    .line 161
    new-instance v0, Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 162
    .line 163
    const-string v1, "DisableCircularReferenceDetect"

    .line 164
    .line 165
    move-object/from16 v18, v2

    .line 166
    .line 167
    const/16 v2, 0xf

    .line 168
    .line 169
    invoke-direct {v0, v1, v2}, Lcom/alibaba/fastjson/serializer/SerializerFeature;-><init>(Ljava/lang/String;I)V

    .line 170
    .line 171
    .line 172
    sput-object v0, Lcom/alibaba/fastjson/serializer/SerializerFeature;->DisableCircularReferenceDetect:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 173
    .line 174
    new-instance v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 175
    .line 176
    const-string v2, "WriteSlashAsSpecial"

    .line 177
    .line 178
    move-object/from16 v19, v0

    .line 179
    .line 180
    const/16 v0, 0x10

    .line 181
    .line 182
    invoke-direct {v1, v2, v0}, Lcom/alibaba/fastjson/serializer/SerializerFeature;-><init>(Ljava/lang/String;I)V

    .line 183
    .line 184
    .line 185
    sput-object v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteSlashAsSpecial:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 186
    .line 187
    new-instance v0, Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 188
    .line 189
    const-string v2, "BrowserCompatible"

    .line 190
    .line 191
    move-object/from16 v20, v1

    .line 192
    .line 193
    const/16 v1, 0x11

    .line 194
    .line 195
    invoke-direct {v0, v2, v1}, Lcom/alibaba/fastjson/serializer/SerializerFeature;-><init>(Ljava/lang/String;I)V

    .line 196
    .line 197
    .line 198
    sput-object v0, Lcom/alibaba/fastjson/serializer/SerializerFeature;->BrowserCompatible:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 199
    .line 200
    new-instance v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 201
    .line 202
    const-string v2, "WriteDateUseDateFormat"

    .line 203
    .line 204
    move-object/from16 v21, v0

    .line 205
    .line 206
    const/16 v0, 0x12

    .line 207
    .line 208
    invoke-direct {v1, v2, v0}, Lcom/alibaba/fastjson/serializer/SerializerFeature;-><init>(Ljava/lang/String;I)V

    .line 209
    .line 210
    .line 211
    sput-object v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteDateUseDateFormat:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 212
    .line 213
    new-instance v0, Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 214
    .line 215
    const-string v2, "NotWriteRootClassName"

    .line 216
    .line 217
    move-object/from16 v22, v1

    .line 218
    .line 219
    const/16 v1, 0x13

    .line 220
    .line 221
    invoke-direct {v0, v2, v1}, Lcom/alibaba/fastjson/serializer/SerializerFeature;-><init>(Ljava/lang/String;I)V

    .line 222
    .line 223
    .line 224
    sput-object v0, Lcom/alibaba/fastjson/serializer/SerializerFeature;->NotWriteRootClassName:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 225
    .line 226
    new-instance v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 227
    .line 228
    const-string v2, "DisableCheckSpecialChar"

    .line 229
    .line 230
    move-object/from16 v23, v0

    .line 231
    .line 232
    const/16 v0, 0x14

    .line 233
    .line 234
    invoke-direct {v1, v2, v0}, Lcom/alibaba/fastjson/serializer/SerializerFeature;-><init>(Ljava/lang/String;I)V

    .line 235
    .line 236
    .line 237
    sput-object v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->DisableCheckSpecialChar:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 238
    .line 239
    new-instance v0, Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 240
    .line 241
    const-string v2, "BeanToArray"

    .line 242
    .line 243
    move-object/from16 v24, v1

    .line 244
    .line 245
    const/16 v1, 0x15

    .line 246
    .line 247
    invoke-direct {v0, v2, v1}, Lcom/alibaba/fastjson/serializer/SerializerFeature;-><init>(Ljava/lang/String;I)V

    .line 248
    .line 249
    .line 250
    sput-object v0, Lcom/alibaba/fastjson/serializer/SerializerFeature;->BeanToArray:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 251
    .line 252
    new-instance v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 253
    .line 254
    const-string v2, "WriteNonStringKeyAsString"

    .line 255
    .line 256
    move-object/from16 v25, v0

    .line 257
    .line 258
    const/16 v0, 0x16

    .line 259
    .line 260
    invoke-direct {v1, v2, v0}, Lcom/alibaba/fastjson/serializer/SerializerFeature;-><init>(Ljava/lang/String;I)V

    .line 261
    .line 262
    .line 263
    sput-object v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteNonStringKeyAsString:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 264
    .line 265
    new-instance v0, Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 266
    .line 267
    const-string v2, "NotWriteDefaultValue"

    .line 268
    .line 269
    move-object/from16 v26, v1

    .line 270
    .line 271
    const/16 v1, 0x17

    .line 272
    .line 273
    invoke-direct {v0, v2, v1}, Lcom/alibaba/fastjson/serializer/SerializerFeature;-><init>(Ljava/lang/String;I)V

    .line 274
    .line 275
    .line 276
    sput-object v0, Lcom/alibaba/fastjson/serializer/SerializerFeature;->NotWriteDefaultValue:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 277
    .line 278
    new-instance v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 279
    .line 280
    const-string v2, "BrowserSecure"

    .line 281
    .line 282
    move-object/from16 v27, v0

    .line 283
    .line 284
    const/16 v0, 0x18

    .line 285
    .line 286
    invoke-direct {v1, v2, v0}, Lcom/alibaba/fastjson/serializer/SerializerFeature;-><init>(Ljava/lang/String;I)V

    .line 287
    .line 288
    .line 289
    sput-object v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->BrowserSecure:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 290
    .line 291
    new-instance v0, Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 292
    .line 293
    const-string v2, "IgnoreNonFieldGetter"

    .line 294
    .line 295
    move-object/from16 v28, v1

    .line 296
    .line 297
    const/16 v1, 0x19

    .line 298
    .line 299
    invoke-direct {v0, v2, v1}, Lcom/alibaba/fastjson/serializer/SerializerFeature;-><init>(Ljava/lang/String;I)V

    .line 300
    .line 301
    .line 302
    sput-object v0, Lcom/alibaba/fastjson/serializer/SerializerFeature;->IgnoreNonFieldGetter:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 303
    .line 304
    new-instance v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 305
    .line 306
    const-string v2, "WriteNonStringValueAsString"

    .line 307
    .line 308
    move-object/from16 v29, v0

    .line 309
    .line 310
    const/16 v0, 0x1a

    .line 311
    .line 312
    invoke-direct {v1, v2, v0}, Lcom/alibaba/fastjson/serializer/SerializerFeature;-><init>(Ljava/lang/String;I)V

    .line 313
    .line 314
    .line 315
    sput-object v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteNonStringValueAsString:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 316
    .line 317
    new-instance v0, Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 318
    .line 319
    const-string v2, "IgnoreErrorGetter"

    .line 320
    .line 321
    move-object/from16 v30, v1

    .line 322
    .line 323
    const/16 v1, 0x1b

    .line 324
    .line 325
    invoke-direct {v0, v2, v1}, Lcom/alibaba/fastjson/serializer/SerializerFeature;-><init>(Ljava/lang/String;I)V

    .line 326
    .line 327
    .line 328
    sput-object v0, Lcom/alibaba/fastjson/serializer/SerializerFeature;->IgnoreErrorGetter:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 329
    .line 330
    new-instance v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 331
    .line 332
    const-string v2, "WriteBigDecimalAsPlain"

    .line 333
    .line 334
    move-object/from16 v31, v0

    .line 335
    .line 336
    const/16 v0, 0x1c

    .line 337
    .line 338
    invoke-direct {v1, v2, v0}, Lcom/alibaba/fastjson/serializer/SerializerFeature;-><init>(Ljava/lang/String;I)V

    .line 339
    .line 340
    .line 341
    sput-object v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteBigDecimalAsPlain:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 342
    .line 343
    new-instance v0, Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 344
    .line 345
    const-string v2, "MapSortField"

    .line 346
    .line 347
    move-object/from16 v32, v1

    .line 348
    .line 349
    const/16 v1, 0x1d

    .line 350
    .line 351
    invoke-direct {v0, v2, v1}, Lcom/alibaba/fastjson/serializer/SerializerFeature;-><init>(Ljava/lang/String;I)V

    .line 352
    .line 353
    .line 354
    sput-object v0, Lcom/alibaba/fastjson/serializer/SerializerFeature;->MapSortField:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 355
    .line 356
    move-object/from16 v1, v17

    .line 357
    .line 358
    move-object/from16 v2, v18

    .line 359
    .line 360
    move-object/from16 v16, v19

    .line 361
    .line 362
    move-object/from16 v17, v20

    .line 363
    .line 364
    move-object/from16 v18, v21

    .line 365
    .line 366
    move-object/from16 v19, v22

    .line 367
    .line 368
    move-object/from16 v20, v23

    .line 369
    .line 370
    move-object/from16 v21, v24

    .line 371
    .line 372
    move-object/from16 v22, v25

    .line 373
    .line 374
    move-object/from16 v23, v26

    .line 375
    .line 376
    move-object/from16 v24, v27

    .line 377
    .line 378
    move-object/from16 v25, v28

    .line 379
    .line 380
    move-object/from16 v26, v29

    .line 381
    .line 382
    move-object/from16 v27, v30

    .line 383
    .line 384
    move-object/from16 v28, v31

    .line 385
    .line 386
    move-object/from16 v29, v32

    .line 387
    .line 388
    move-object/from16 v30, v0

    .line 389
    .line 390
    const/4 v0, 0x0

    .line 391
    filled-new-array/range {v1 .. v30}, [Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 392
    .line 393
    .line 394
    move-result-object v1

    .line 395
    sput-object v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->$VALUES:[Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 396
    .line 397
    new-array v0, v0, [Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 398
    .line 399
    sput-object v0, Lcom/alibaba/fastjson/serializer/SerializerFeature;->EMPTY:[Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 400
    .line 401
    invoke-virtual {v3}, Lcom/alibaba/fastjson/serializer/SerializerFeature;->getMask()I

    .line 402
    .line 403
    .line 404
    move-result v0

    .line 405
    invoke-virtual {v10}, Lcom/alibaba/fastjson/serializer/SerializerFeature;->getMask()I

    .line 406
    .line 407
    .line 408
    move-result v1

    .line 409
    or-int/2addr v0, v1

    .line 410
    invoke-virtual {v7}, Lcom/alibaba/fastjson/serializer/SerializerFeature;->getMask()I

    .line 411
    .line 412
    .line 413
    move-result v1

    .line 414
    or-int/2addr v0, v1

    .line 415
    invoke-virtual {v9}, Lcom/alibaba/fastjson/serializer/SerializerFeature;->getMask()I

    .line 416
    .line 417
    .line 418
    move-result v1

    .line 419
    or-int/2addr v0, v1

    .line 420
    invoke-virtual {v8}, Lcom/alibaba/fastjson/serializer/SerializerFeature;->getMask()I

    .line 421
    .line 422
    .line 423
    move-result v1

    .line 424
    or-int/2addr v0, v1

    .line 425
    sput v0, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WRITE_MAP_NULL_FEATURES:I

    .line 426
    .line 427
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    shl-int/2addr p1, p2

    .line 10
    iput p1, p0, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    .line 11
    .line 12
    return-void
.end method

.method public static config(ILcom/alibaba/fastjson/serializer/SerializerFeature;Z)I
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    iget p1, p1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    .line 4
    .line 5
    or-int/2addr p0, p1

    .line 6
    return p0

    .line 7
    :cond_0
    iget p1, p1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    .line 8
    .line 9
    not-int p1, p1

    .line 10
    and-int/2addr p0, p1

    .line 11
    return p0
.end method

.method public static isEnabled(IILcom/alibaba/fastjson/serializer/SerializerFeature;)Z
    .locals 0

    .line 1
    iget p2, p2, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    .line 2
    .line 3
    and-int/2addr p0, p2

    .line 4
    if-nez p0, :cond_1

    .line 5
    .line 6
    and-int p0, p1, p2

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0

    .line 13
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 14
    return p0
.end method

.method public static isEnabled(ILcom/alibaba/fastjson/serializer/SerializerFeature;)Z
    .locals 0

    .line 15
    iget p1, p1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    and-int/2addr p0, p1

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static of([Lcom/alibaba/fastjson/serializer/SerializerFeature;)I
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    array-length v1, p0

    .line 6
    move v2, v0

    .line 7
    :goto_0
    if-ge v0, v1, :cond_1

    .line 8
    .line 9
    aget-object v3, p0, v0

    .line 10
    .line 11
    iget v3, v3, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    .line 12
    .line 13
    or-int/2addr v2, v3

    .line 14
    add-int/lit8 v0, v0, 0x1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    return v2
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/alibaba/fastjson/serializer/SerializerFeature;
    .locals 1

    .line 1
    const-class v0, Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/alibaba/fastjson/serializer/SerializerFeature;
    .locals 1

    .line 1
    sget-object v0, Lcom/alibaba/fastjson/serializer/SerializerFeature;->$VALUES:[Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/alibaba/fastjson/serializer/SerializerFeature;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public final getMask()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    .line 2
    .line 3
    return p0
.end method
