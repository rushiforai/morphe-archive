.class public Lcom/immomo/momomediaext/utils/MMLiveTranscoding;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;,
        Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveHasMember;
    }
.end annotation


# instance fields
.field public canvasColorB:I

.field public canvasColorG:I

.field public canvasColorR:I

.field public canvasHeight:I

.field public canvasWidth:I

.field public confMembers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;",
            ">;"
        }
    .end annotation
.end field

.field public ctyp:I

.field public extString:Ljava/lang/String;

.field public hasMembers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;",
            ">;"
        }
    .end annotation
.end field

.field public infoInv:J

.field public infoMembers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;",
            ">;"
        }
    .end annotation
.end field

.field public inv:Ljava/lang/String;

.field public mid:Ljava/lang/String;

.field public shortSei:I

.field public styp:I

.field public ts:J

.field public userid:Ljava/lang/String;

.field public videoBitrate:I

.field public videoFps:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 570
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0xf

    .line 571
    iput v0, p0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->videoFps:I

    .line 572
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->confMembers:Ljava/util/List;

    .line 573
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->infoMembers:Ljava/util/List;

    .line 574
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->hasMembers:Ljava/util/List;

    const-wide/16 v0, 0x0

    .line 575
    iput-wide v0, p0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->infoInv:J

    const/4 v0, 0x0

    .line 576
    iput v0, p0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->shortSei:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 17
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/16 v1, 0xf

    .line 7
    .line 8
    iput v1, v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->videoFps:I

    .line 9
    .line 10
    new-instance v1, Ljava/util/LinkedList;

    .line 11
    .line 12
    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v1, v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->confMembers:Ljava/util/List;

    .line 16
    .line 17
    new-instance v1, Ljava/util/LinkedList;

    .line 18
    .line 19
    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v1, v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->infoMembers:Ljava/util/List;

    .line 23
    .line 24
    new-instance v1, Ljava/util/LinkedList;

    .line 25
    .line 26
    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object v1, v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->hasMembers:Ljava/util/List;

    .line 30
    .line 31
    const-wide/16 v1, 0x0

    .line 32
    .line 33
    iput-wide v1, v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->infoInv:J

    .line 34
    .line 35
    const/4 v1, 0x0

    .line 36
    iput v1, v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->shortSei:I

    .line 37
    .line 38
    invoke-static/range {p1 .. p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    if-eqz v2, :cond_0

    .line 43
    .line 44
    goto/16 :goto_3

    .line 45
    .line 46
    :cond_0
    new-instance v2, Lorg/json/JSONObject;

    .line 47
    .line 48
    move-object/from16 v3, p1

    .line 49
    .line 50
    invoke-direct {v2, v3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    const-string v3, "inv"

    .line 54
    .line 55
    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    iput-object v3, v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->inv:Ljava/lang/String;

    .line 60
    .line 61
    const-string v3, "mid"

    .line 62
    .line 63
    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v3

    .line 67
    iput-object v3, v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->mid:Ljava/lang/String;

    .line 68
    .line 69
    const-string v3, "ext"

    .line 70
    .line 71
    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    iput-object v3, v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->extString:Ljava/lang/String;

    .line 76
    .line 77
    const-string v3, "ts"

    .line 78
    .line 79
    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    .line 80
    .line 81
    .line 82
    move-result-wide v3

    .line 83
    iput-wide v3, v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->ts:J

    .line 84
    .line 85
    const-string v3, "canvas"

    .line 86
    .line 87
    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    const-string v4, "h"

    .line 92
    .line 93
    const-string v5, "w"

    .line 94
    .line 95
    if-eqz v3, :cond_1

    .line 96
    .line 97
    invoke-virtual {v3, v5, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 98
    .line 99
    .line 100
    move-result v6

    .line 101
    iput v6, v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->canvasWidth:I

    .line 102
    .line 103
    invoke-virtual {v3, v4, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 104
    .line 105
    .line 106
    move-result v6

    .line 107
    iput v6, v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->canvasHeight:I

    .line 108
    .line 109
    const-string v6, "bgrgb"

    .line 110
    .line 111
    invoke-virtual {v3, v6}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 112
    .line 113
    .line 114
    move-result-object v7

    .line 115
    if-eqz v7, :cond_1

    .line 116
    .line 117
    invoke-virtual {v3, v6}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 118
    .line 119
    .line 120
    move-result-object v7

    .line 121
    invoke-virtual {v7, v1}, Lorg/json/JSONArray;->optInt(I)I

    .line 122
    .line 123
    .line 124
    move-result v7

    .line 125
    iput v7, v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->canvasColorR:I

    .line 126
    .line 127
    invoke-virtual {v3, v6}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 128
    .line 129
    .line 130
    move-result-object v7

    .line 131
    const/4 v8, 0x1

    .line 132
    invoke-virtual {v7, v8}, Lorg/json/JSONArray;->optInt(I)I

    .line 133
    .line 134
    .line 135
    move-result v7

    .line 136
    iput v7, v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->canvasColorG:I

    .line 137
    .line 138
    invoke-virtual {v3, v6}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 139
    .line 140
    .line 141
    move-result-object v3

    .line 142
    const/4 v6, 0x2

    .line 143
    invoke-virtual {v3, v6}, Lorg/json/JSONArray;->optInt(I)I

    .line 144
    .line 145
    .line 146
    move-result v3

    .line 147
    iput v3, v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->canvasColorB:I

    .line 148
    .line 149
    :cond_1
    const-string v3, "conf"

    .line 150
    .line 151
    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 152
    .line 153
    .line 154
    move-result-object v3

    .line 155
    const-string v6, "z"

    .line 156
    .line 157
    const-string v7, "y"

    .line 158
    .line 159
    const-string v8, "x"

    .line 160
    .line 161
    const-string v9, "id"

    .line 162
    .line 163
    const-string v10, "ol"

    .line 164
    .line 165
    const-string v11, "mu"

    .line 166
    .line 167
    const-string v12, "vo"

    .line 168
    .line 169
    if-eqz v3, :cond_2

    .line 170
    .line 171
    move v13, v1

    .line 172
    :goto_0
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    .line 173
    .line 174
    .line 175
    move-result v14

    .line 176
    if-ge v13, v14, :cond_2

    .line 177
    .line 178
    new-instance v14, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;

    .line 179
    .line 180
    invoke-direct {v14}, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;-><init>()V

    .line 181
    .line 182
    .line 183
    invoke-virtual {v3, v13}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    .line 184
    .line 185
    .line 186
    move-result-object v15

    .line 187
    move-object/from16 v16, v2

    .line 188
    .line 189
    invoke-virtual {v15, v12}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;)D

    .line 190
    .line 191
    .line 192
    move-result-wide v1

    .line 193
    double-to-float v1, v1

    .line 194
    iput v1, v14, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->volume:F

    .line 195
    .line 196
    invoke-virtual {v3, v13}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    .line 197
    .line 198
    .line 199
    move-result-object v1

    .line 200
    invoke-virtual {v1, v11}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 201
    .line 202
    .line 203
    move-result v1

    .line 204
    iput v1, v14, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->muteFlag:I

    .line 205
    .line 206
    invoke-virtual {v3, v13}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    .line 207
    .line 208
    .line 209
    move-result-object v1

    .line 210
    invoke-virtual {v1, v10}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 211
    .line 212
    .line 213
    move-result v1

    .line 214
    iput v1, v14, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->offlineFlag:I

    .line 215
    .line 216
    invoke-virtual {v3, v13}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    .line 217
    .line 218
    .line 219
    move-result-object v1

    .line 220
    invoke-virtual {v1, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object v1

    .line 224
    iput-object v1, v14, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->userid:Ljava/lang/String;

    .line 225
    .line 226
    invoke-virtual {v3, v13}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    .line 227
    .line 228
    .line 229
    move-result-object v1

    .line 230
    invoke-virtual {v1, v5}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;)D

    .line 231
    .line 232
    .line 233
    move-result-wide v1

    .line 234
    double-to-float v1, v1

    .line 235
    iput v1, v14, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->w:F

    .line 236
    .line 237
    invoke-virtual {v3, v13}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    .line 238
    .line 239
    .line 240
    move-result-object v1

    .line 241
    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;)D

    .line 242
    .line 243
    .line 244
    move-result-wide v1

    .line 245
    double-to-float v1, v1

    .line 246
    iput v1, v14, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->h:F

    .line 247
    .line 248
    invoke-virtual {v3, v13}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    .line 249
    .line 250
    .line 251
    move-result-object v1

    .line 252
    invoke-virtual {v1, v8}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;)D

    .line 253
    .line 254
    .line 255
    move-result-wide v1

    .line 256
    double-to-float v1, v1

    .line 257
    iput v1, v14, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->x:F

    .line 258
    .line 259
    invoke-virtual {v3, v13}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    .line 260
    .line 261
    .line 262
    move-result-object v1

    .line 263
    invoke-virtual {v1, v7}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;)D

    .line 264
    .line 265
    .line 266
    move-result-wide v1

    .line 267
    double-to-float v1, v1

    .line 268
    iput v1, v14, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->y:F

    .line 269
    .line 270
    invoke-virtual {v3, v13}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    .line 271
    .line 272
    .line 273
    move-result-object v1

    .line 274
    invoke-virtual {v1, v6}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 275
    .line 276
    .line 277
    move-result v1

    .line 278
    iput v1, v14, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->z:I

    .line 279
    .line 280
    iget-object v1, v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->confMembers:Ljava/util/List;

    .line 281
    .line 282
    invoke-interface {v1, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 283
    .line 284
    .line 285
    add-int/lit8 v13, v13, 0x1

    .line 286
    .line 287
    move-object/from16 v2, v16

    .line 288
    .line 289
    const/4 v1, 0x0

    .line 290
    goto :goto_0

    .line 291
    :cond_2
    move-object/from16 v16, v2

    .line 292
    .line 293
    const-string v1, "info"

    .line 294
    .line 295
    move-object/from16 v2, v16

    .line 296
    .line 297
    invoke-virtual {v2, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 298
    .line 299
    .line 300
    move-result-object v3

    .line 301
    if-eqz v3, :cond_3

    .line 302
    .line 303
    invoke-virtual {v2, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 304
    .line 305
    .line 306
    move-result-object v1

    .line 307
    if-eqz v1, :cond_3

    .line 308
    .line 309
    const-string v3, "ctyp"

    .line 310
    .line 311
    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 312
    .line 313
    .line 314
    move-result v3

    .line 315
    iput v3, v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->ctyp:I

    .line 316
    .line 317
    const-string v3, "cuids"

    .line 318
    .line 319
    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 320
    .line 321
    .line 322
    move-result-object v1

    .line 323
    if-eqz v1, :cond_3

    .line 324
    .line 325
    const/4 v3, 0x0

    .line 326
    :goto_1
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    .line 327
    .line 328
    .line 329
    move-result v13

    .line 330
    if-ge v3, v13, :cond_3

    .line 331
    .line 332
    new-instance v13, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;

    .line 333
    .line 334
    invoke-direct {v13}, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;-><init>()V

    .line 335
    .line 336
    .line 337
    invoke-virtual {v1, v3}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    .line 338
    .line 339
    .line 340
    move-result-object v14

    .line 341
    invoke-virtual {v14, v12}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;)D

    .line 342
    .line 343
    .line 344
    move-result-wide v14

    .line 345
    double-to-float v14, v14

    .line 346
    iput v14, v13, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->volume:F

    .line 347
    .line 348
    invoke-virtual {v1, v3}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    .line 349
    .line 350
    .line 351
    move-result-object v14

    .line 352
    invoke-virtual {v14, v11}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 353
    .line 354
    .line 355
    move-result v14

    .line 356
    iput v14, v13, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->muteFlag:I

    .line 357
    .line 358
    invoke-virtual {v1, v3}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    .line 359
    .line 360
    .line 361
    move-result-object v14

    .line 362
    invoke-virtual {v14, v10}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 363
    .line 364
    .line 365
    move-result v14

    .line 366
    iput v14, v13, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->offlineFlag:I

    .line 367
    .line 368
    invoke-virtual {v1, v3}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    .line 369
    .line 370
    .line 371
    move-result-object v14

    .line 372
    invoke-virtual {v14, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 373
    .line 374
    .line 375
    move-result-object v14

    .line 376
    iput-object v14, v13, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->userid:Ljava/lang/String;

    .line 377
    .line 378
    invoke-virtual {v1, v3}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    .line 379
    .line 380
    .line 381
    move-result-object v14

    .line 382
    invoke-virtual {v14, v5}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;)D

    .line 383
    .line 384
    .line 385
    move-result-wide v14

    .line 386
    double-to-float v14, v14

    .line 387
    iput v14, v13, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->w:F

    .line 388
    .line 389
    invoke-virtual {v1, v3}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    .line 390
    .line 391
    .line 392
    move-result-object v14

    .line 393
    invoke-virtual {v14, v4}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;)D

    .line 394
    .line 395
    .line 396
    move-result-wide v14

    .line 397
    double-to-float v14, v14

    .line 398
    iput v14, v13, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->h:F

    .line 399
    .line 400
    invoke-virtual {v1, v3}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    .line 401
    .line 402
    .line 403
    move-result-object v14

    .line 404
    invoke-virtual {v14, v8}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;)D

    .line 405
    .line 406
    .line 407
    move-result-wide v14

    .line 408
    double-to-float v14, v14

    .line 409
    iput v14, v13, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->x:F

    .line 410
    .line 411
    invoke-virtual {v1, v3}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    .line 412
    .line 413
    .line 414
    move-result-object v14

    .line 415
    invoke-virtual {v14, v7}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;)D

    .line 416
    .line 417
    .line 418
    move-result-wide v14

    .line 419
    double-to-float v14, v14

    .line 420
    iput v14, v13, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->y:F

    .line 421
    .line 422
    invoke-virtual {v1, v3}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    .line 423
    .line 424
    .line 425
    move-result-object v14

    .line 426
    invoke-virtual {v14, v6}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 427
    .line 428
    .line 429
    move-result v14

    .line 430
    iput v14, v13, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->z:I

    .line 431
    .line 432
    iget-object v14, v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->infoMembers:Ljava/util/List;

    .line 433
    .line 434
    invoke-interface {v14, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 435
    .line 436
    .line 437
    add-int/lit8 v3, v3, 0x1

    .line 438
    .line 439
    goto :goto_1

    .line 440
    :cond_3
    const-string v1, "has"

    .line 441
    .line 442
    invoke-virtual {v2, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 443
    .line 444
    .line 445
    move-result-object v3

    .line 446
    if-eqz v3, :cond_4

    .line 447
    .line 448
    invoke-virtual {v2, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 449
    .line 450
    .line 451
    move-result-object v1

    .line 452
    if-eqz v1, :cond_4

    .line 453
    .line 454
    const/4 v2, 0x0

    .line 455
    :goto_2
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    .line 456
    .line 457
    .line 458
    move-result v3

    .line 459
    if-ge v2, v3, :cond_4

    .line 460
    .line 461
    new-instance v3, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;

    .line 462
    .line 463
    invoke-direct {v3}, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;-><init>()V

    .line 464
    .line 465
    .line 466
    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    .line 467
    .line 468
    .line 469
    move-result-object v13

    .line 470
    invoke-virtual {v13, v12}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;)D

    .line 471
    .line 472
    .line 473
    move-result-wide v13

    .line 474
    double-to-float v13, v13

    .line 475
    iput v13, v3, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->volume:F

    .line 476
    .line 477
    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    .line 478
    .line 479
    .line 480
    move-result-object v13

    .line 481
    invoke-virtual {v13, v11}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 482
    .line 483
    .line 484
    move-result v13

    .line 485
    iput v13, v3, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->muteFlag:I

    .line 486
    .line 487
    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    .line 488
    .line 489
    .line 490
    move-result-object v13

    .line 491
    invoke-virtual {v13, v10}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 492
    .line 493
    .line 494
    move-result v13

    .line 495
    iput v13, v3, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->offlineFlag:I

    .line 496
    .line 497
    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    .line 498
    .line 499
    .line 500
    move-result-object v13

    .line 501
    invoke-virtual {v13, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 502
    .line 503
    .line 504
    move-result-object v13

    .line 505
    iput-object v13, v3, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->userid:Ljava/lang/String;

    .line 506
    .line 507
    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    .line 508
    .line 509
    .line 510
    move-result-object v13

    .line 511
    invoke-virtual {v13, v5}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;)D

    .line 512
    .line 513
    .line 514
    move-result-wide v13

    .line 515
    double-to-float v13, v13

    .line 516
    iput v13, v3, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->w:F

    .line 517
    .line 518
    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    .line 519
    .line 520
    .line 521
    move-result-object v13

    .line 522
    invoke-virtual {v13, v4}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;)D

    .line 523
    .line 524
    .line 525
    move-result-wide v13

    .line 526
    double-to-float v13, v13

    .line 527
    iput v13, v3, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->h:F

    .line 528
    .line 529
    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    .line 530
    .line 531
    .line 532
    move-result-object v13

    .line 533
    invoke-virtual {v13, v8}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;)D

    .line 534
    .line 535
    .line 536
    move-result-wide v13

    .line 537
    double-to-float v13, v13

    .line 538
    iput v13, v3, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->x:F

    .line 539
    .line 540
    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    .line 541
    .line 542
    .line 543
    move-result-object v13

    .line 544
    invoke-virtual {v13, v7}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;)D

    .line 545
    .line 546
    .line 547
    move-result-wide v13

    .line 548
    double-to-float v13, v13

    .line 549
    iput v13, v3, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->y:F

    .line 550
    .line 551
    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    .line 552
    .line 553
    .line 554
    move-result-object v13

    .line 555
    invoke-virtual {v13, v6}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 556
    .line 557
    .line 558
    move-result v13

    .line 559
    iput v13, v3, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->z:I

    .line 560
    .line 561
    iget-object v13, v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->hasMembers:Ljava/util/List;

    .line 562
    .line 563
    invoke-interface {v13, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 564
    .line 565
    .line 566
    add-int/lit8 v2, v2, 0x1

    .line 567
    .line 568
    goto :goto_2

    .line 569
    :cond_4
    :goto_3
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 6
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    new-instance v0, Lcom/immomo/momomediaext/sei/BaseSei;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/immomo/momomediaext/sei/BaseSei;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->inv:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/immomo/momomediaext/sei/BaseSei;->setInv(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->mid:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/immomo/momomediaext/sei/BaseSei;->setMid(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget v1, p0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->shortSei:I

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lcom/immomo/momomediaext/sei/BaseSei;->setShortSei(I)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/immomo/momomediaext/sei/BaseSei;->getInfo()Lcom/immomo/momomediaext/sei/BaseSei$InfoBean;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    iget v2, p0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->ctyp:I

    .line 26
    .line 27
    invoke-virtual {v1, v2}, Lcom/immomo/momomediaext/sei/BaseSei$InfoBean;->setCtyp(I)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/immomo/momomediaext/sei/BaseSei;->getInfo()Lcom/immomo/momomediaext/sei/BaseSei$InfoBean;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iget v2, p0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->styp:I

    .line 35
    .line 36
    invoke-virtual {v1, v2}, Lcom/immomo/momomediaext/sei/BaseSei$InfoBean;->setStyp(I)V

    .line 37
    .line 38
    .line 39
    iget v1, p0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->ctyp:I

    .line 40
    .line 41
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v0, v1}, Lcom/immomo/momomediaext/sei/BaseSei;->setCtyp(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    iget v1, p0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->styp:I

    .line 49
    .line 50
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v0, v1}, Lcom/immomo/momomediaext/sei/BaseSei;->setStyp(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    iget-wide v1, p0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->infoInv:J

    .line 58
    .line 59
    const-wide/16 v3, 0x0

    .line 60
    .line 61
    cmp-long v1, v1, v3

    .line 62
    .line 63
    if-eqz v1, :cond_0

    .line 64
    .line 65
    invoke-virtual {v0}, Lcom/immomo/momomediaext/sei/BaseSei;->getInfo()Lcom/immomo/momomediaext/sei/BaseSei$InfoBean;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    iget-wide v2, p0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->infoInv:J

    .line 70
    .line 71
    invoke-virtual {v1, v2, v3}, Lcom/immomo/momomediaext/sei/BaseSei$InfoBean;->setInv(J)V

    .line 72
    .line 73
    .line 74
    :cond_0
    invoke-virtual {v0}, Lcom/immomo/momomediaext/sei/BaseSei;->getCanvas()Lcom/immomo/momomediaext/sei/BaseSei$CanvasBean;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    iget v2, p0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->canvasWidth:I

    .line 79
    .line 80
    invoke-virtual {v1, v2}, Lcom/immomo/momomediaext/sei/BaseSei$CanvasBean;->setW(I)V

    .line 81
    .line 82
    .line 83
    iget v2, p0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->canvasHeight:I

    .line 84
    .line 85
    invoke-virtual {v1, v2}, Lcom/immomo/momomediaext/sei/BaseSei$CanvasBean;->setH(I)V

    .line 86
    .line 87
    .line 88
    new-instance v2, Ljava/util/LinkedList;

    .line 89
    .line 90
    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    .line 91
    .line 92
    .line 93
    iget v3, p0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->canvasColorR:I

    .line 94
    .line 95
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 96
    .line 97
    .line 98
    move-result-object v3

    .line 99
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    iget v3, p0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->canvasColorG:I

    .line 103
    .line 104
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 105
    .line 106
    .line 107
    move-result-object v3

    .line 108
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    iget v3, p0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->canvasColorB:I

    .line 112
    .line 113
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 114
    .line 115
    .line 116
    move-result-object v3

    .line 117
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    invoke-virtual {v1, v2}, Lcom/immomo/momomediaext/sei/BaseSei$CanvasBean;->setBgrgb(Ljava/util/List;)V

    .line 121
    .line 122
    .line 123
    iget-object v1, p0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->extString:Ljava/lang/String;

    .line 124
    .line 125
    invoke-virtual {v0, v1}, Lcom/immomo/momomediaext/sei/BaseSei;->setExt(Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    const/4 v1, 0x0

    .line 129
    move v2, v1

    .line 130
    :goto_0
    iget-object v3, p0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->confMembers:Ljava/util/List;

    .line 131
    .line 132
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 133
    .line 134
    .line 135
    move-result v3

    .line 136
    if-ge v2, v3, :cond_2

    .line 137
    .line 138
    new-instance v3, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;

    .line 139
    .line 140
    invoke-direct {v3}, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;-><init>()V

    .line 141
    .line 142
    .line 143
    iget-object v4, p0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->confMembers:Ljava/util/List;

    .line 144
    .line 145
    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 146
    .line 147
    .line 148
    move-result-object v4

    .line 149
    check-cast v4, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;

    .line 150
    .line 151
    iget-object v5, v4, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->userid:Ljava/lang/String;

    .line 152
    .line 153
    invoke-virtual {v3, v5}, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->setId(Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    iget v5, v4, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->x:F

    .line 157
    .line 158
    invoke-virtual {v3, v5}, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->setX(F)V

    .line 159
    .line 160
    .line 161
    iget v5, v4, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->y:F

    .line 162
    .line 163
    invoke-virtual {v3, v5}, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->setY(F)V

    .line 164
    .line 165
    .line 166
    iget v5, v4, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->w:F

    .line 167
    .line 168
    invoke-virtual {v3, v5}, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->setW(F)V

    .line 169
    .line 170
    .line 171
    iget v5, v4, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->h:F

    .line 172
    .line 173
    invoke-virtual {v3, v5}, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->setH(F)V

    .line 174
    .line 175
    .line 176
    iget v5, v4, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->z:I

    .line 177
    .line 178
    invoke-virtual {v3, v5}, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->setZ(I)V

    .line 179
    .line 180
    .line 181
    iget v5, v4, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->muteFlag:I

    .line 182
    .line 183
    invoke-virtual {v3, v5}, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->setMu(I)V

    .line 184
    .line 185
    .line 186
    iget v5, v4, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->volume:F

    .line 187
    .line 188
    invoke-virtual {v3, v5}, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->setVo(F)V

    .line 189
    .line 190
    .line 191
    iget v5, v4, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->offlineFlag:I

    .line 192
    .line 193
    invoke-virtual {v3, v5}, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->setOl(I)V

    .line 194
    .line 195
    .line 196
    iget-boolean v4, v4, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->isMuteAudio:Z

    .line 197
    .line 198
    if-eqz v4, :cond_1

    .line 199
    .line 200
    const/4 v4, 0x2

    .line 201
    goto :goto_1

    .line 202
    :cond_1
    move v4, v1

    .line 203
    :goto_1
    invoke-virtual {v3, v4}, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->setPkmu(I)V

    .line 204
    .line 205
    .line 206
    invoke-virtual {v0}, Lcom/immomo/momomediaext/sei/BaseSei;->getConf()Ljava/util/List;

    .line 207
    .line 208
    .line 209
    move-result-object v4

    .line 210
    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 211
    .line 212
    .line 213
    add-int/lit8 v2, v2, 0x1

    .line 214
    .line 215
    goto :goto_0

    .line 216
    :cond_2
    move v2, v1

    .line 217
    :goto_2
    iget-object v3, p0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->infoMembers:Ljava/util/List;

    .line 218
    .line 219
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 220
    .line 221
    .line 222
    move-result v3

    .line 223
    if-ge v2, v3, :cond_3

    .line 224
    .line 225
    new-instance v3, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;

    .line 226
    .line 227
    invoke-direct {v3}, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;-><init>()V

    .line 228
    .line 229
    .line 230
    iget-object v4, p0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->infoMembers:Ljava/util/List;

    .line 231
    .line 232
    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 233
    .line 234
    .line 235
    move-result-object v4

    .line 236
    check-cast v4, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;

    .line 237
    .line 238
    iget-object v5, v4, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->userid:Ljava/lang/String;

    .line 239
    .line 240
    invoke-virtual {v3, v5}, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->setId(Ljava/lang/String;)V

    .line 241
    .line 242
    .line 243
    iget v5, v4, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->x:F

    .line 244
    .line 245
    invoke-virtual {v3, v5}, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->setX(F)V

    .line 246
    .line 247
    .line 248
    iget v5, v4, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->y:F

    .line 249
    .line 250
    invoke-virtual {v3, v5}, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->setY(F)V

    .line 251
    .line 252
    .line 253
    iget v5, v4, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->w:F

    .line 254
    .line 255
    invoke-virtual {v3, v5}, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->setW(F)V

    .line 256
    .line 257
    .line 258
    iget v5, v4, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->h:F

    .line 259
    .line 260
    invoke-virtual {v3, v5}, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->setH(F)V

    .line 261
    .line 262
    .line 263
    iget v5, v4, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->z:I

    .line 264
    .line 265
    invoke-virtual {v3, v5}, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->setZ(I)V

    .line 266
    .line 267
    .line 268
    iget v5, v4, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->muteFlag:I

    .line 269
    .line 270
    invoke-virtual {v3, v5}, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->setMu(I)V

    .line 271
    .line 272
    .line 273
    iget v5, v4, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->volume:F

    .line 274
    .line 275
    invoke-virtual {v3, v5}, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->setVo(F)V

    .line 276
    .line 277
    .line 278
    iget v4, v4, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->offlineFlag:I

    .line 279
    .line 280
    invoke-virtual {v3, v4}, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->setOl(I)V

    .line 281
    .line 282
    .line 283
    invoke-virtual {v0}, Lcom/immomo/momomediaext/sei/BaseSei;->getInfo()Lcom/immomo/momomediaext/sei/BaseSei$InfoBean;

    .line 284
    .line 285
    .line 286
    move-result-object v4

    .line 287
    invoke-virtual {v4}, Lcom/immomo/momomediaext/sei/BaseSei$InfoBean;->getCuids()Ljava/util/List;

    .line 288
    .line 289
    .line 290
    move-result-object v4

    .line 291
    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 292
    .line 293
    .line 294
    add-int/lit8 v2, v2, 0x1

    .line 295
    .line 296
    goto :goto_2

    .line 297
    :cond_3
    :goto_3
    iget-object v2, p0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->hasMembers:Ljava/util/List;

    .line 298
    .line 299
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 300
    .line 301
    .line 302
    move-result v2

    .line 303
    if-ge v1, v2, :cond_4

    .line 304
    .line 305
    new-instance v2, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;

    .line 306
    .line 307
    invoke-direct {v2}, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;-><init>()V

    .line 308
    .line 309
    .line 310
    iget-object v3, p0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->hasMembers:Ljava/util/List;

    .line 311
    .line 312
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 313
    .line 314
    .line 315
    move-result-object v3

    .line 316
    check-cast v3, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;

    .line 317
    .line 318
    iget-object v4, v3, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->userid:Ljava/lang/String;

    .line 319
    .line 320
    invoke-virtual {v2, v4}, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->setId(Ljava/lang/String;)V

    .line 321
    .line 322
    .line 323
    iget v4, v3, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->x:F

    .line 324
    .line 325
    invoke-virtual {v2, v4}, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->setX(F)V

    .line 326
    .line 327
    .line 328
    iget v4, v3, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->y:F

    .line 329
    .line 330
    invoke-virtual {v2, v4}, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->setY(F)V

    .line 331
    .line 332
    .line 333
    iget v4, v3, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->w:F

    .line 334
    .line 335
    invoke-virtual {v2, v4}, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->setW(F)V

    .line 336
    .line 337
    .line 338
    iget v4, v3, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->h:F

    .line 339
    .line 340
    invoke-virtual {v2, v4}, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->setH(F)V

    .line 341
    .line 342
    .line 343
    iget v4, v3, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->z:I

    .line 344
    .line 345
    invoke-virtual {v2, v4}, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->setZ(I)V

    .line 346
    .line 347
    .line 348
    iget v4, v3, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->muteFlag:I

    .line 349
    .line 350
    invoke-virtual {v2, v4}, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->setMu(I)V

    .line 351
    .line 352
    .line 353
    iget v4, v3, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->volume:F

    .line 354
    .line 355
    invoke-virtual {v2, v4}, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->setVo(F)V

    .line 356
    .line 357
    .line 358
    iget v3, v3, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->offlineFlag:I

    .line 359
    .line 360
    invoke-virtual {v2, v3}, Lcom/immomo/momomediaext/sei/BaseSei$SeiBean;->setOl(I)V

    .line 361
    .line 362
    .line 363
    invoke-virtual {v0}, Lcom/immomo/momomediaext/sei/BaseSei;->getHas()Ljava/util/List;

    .line 364
    .line 365
    .line 366
    move-result-object v3

    .line 367
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 368
    .line 369
    .line 370
    add-int/lit8 v1, v1, 0x1

    .line 371
    .line 372
    goto :goto_3

    .line 373
    :cond_4
    invoke-static {v0}, Lcom/immomo/momomediaext/sei/JsonHelper;->toJsonString(Ljava/lang/Object;)Ljava/lang/String;

    .line 374
    .line 375
    .line 376
    move-result-object p0

    .line 377
    return-object p0
.end method

.method public toString2()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "<uid:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->userid:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ",r:"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget v1, p0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->canvasColorR:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ",g:"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget v1, p0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->canvasColorG:I

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ",b:"

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget v1, p0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->canvasColorB:I

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, ",cw:"

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget v1, p0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->canvasWidth:I

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, ",ch:"

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget v1, p0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->canvasHeight:I

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v1, ",vb:"

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget v1, p0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->videoBitrate:I

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string v1, ",cb:"

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    iget-object v1, p0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->confMembers:Ljava/util/List;

    .line 79
    .line 80
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    const-string v1, ",in:"

    .line 88
    .line 89
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    iget-object v1, p0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->infoMembers:Ljava/util/List;

    .line 93
    .line 94
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    const-string v1, ",inv:"

    .line 102
    .line 103
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    iget-object v1, p0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->inv:Ljava/lang/String;

    .line 107
    .line 108
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    const-string v1, "\',mid:"

    .line 112
    .line 113
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    iget-object v1, p0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->mid:Ljava/lang/String;

    .line 117
    .line 118
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    const-string v1, "\',cty:"

    .line 122
    .line 123
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    iget v1, p0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->ctyp:I

    .line 127
    .line 128
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    const-string v1, ","

    .line 132
    .line 133
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    iget-object v1, p0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->extString:Ljava/lang/String;

    .line 137
    .line 138
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    const-string v1, "\',ts:"

    .line 142
    .line 143
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    iget-wide v1, p0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->ts:J

    .line 147
    .line 148
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    const-string v1, ",videoFps:"

    .line 152
    .line 153
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    iget p0, p0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->videoFps:I

    .line 157
    .line 158
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    const/16 p0, 0x3e

    .line 162
    .line 163
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 164
    .line 165
    .line 166
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object p0

    .line 170
    return-object p0
.end method
