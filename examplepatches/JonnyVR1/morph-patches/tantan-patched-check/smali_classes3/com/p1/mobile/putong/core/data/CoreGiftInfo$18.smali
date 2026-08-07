.class Lcom/p1/mobile/putong/core/data/CoreGiftInfo$18;
.super Ll/vzf0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/CoreGiftInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/vzf0<",
        "Lcom/p1/mobile/putong/core/data/CoreGiftInfo;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/vzf0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public CREATE_TABLE(Ll/wzh0;)Ljava/lang/String;
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "CREATE TABLE IF NOT EXISTS "

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p1, Ll/wzh0;->d:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string p1, " (_id INTEGER PRIMARY KEY,id_c TEXT,name_c TEXT,url_c TEXT,unitCoinPrice_c REAL,unitLikes_c INTEGER,dynamicGift_c INTEGER,dynamicURL_c TEXT,dynamicMD5_c TEXT,quota_c INTEGER,extra_messageTips_c TEXT,extra_noQuotaToast_c TEXT,extra_shopGuide_c TEXT,extra_blessingText_c TEXT,extra_grayURL_c TEXT)"

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public getDataClass()Ljava/lang/Class;
    .locals 0

    .line 1
    const-class p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public init()Lcom/p1/mobile/putong/core/data/CoreGiftInfo;
    .locals 2

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->name:Ljava/lang/String;

    .line 7
    .line 8
    const-string v1, ""

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->name:Ljava/lang/String;

    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->url:Ljava/lang/String;

    .line 15
    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->url:Ljava/lang/String;

    .line 19
    .line 20
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->dynamicURL:Ljava/lang/String;

    .line 21
    .line 22
    if-nez v0, :cond_2

    .line 23
    .line 24
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->dynamicURL:Ljava/lang/String;

    .line 25
    .line 26
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->dynamicMD5:Ljava/lang/String;

    .line 27
    .line 28
    if-nez v0, :cond_3

    .line 29
    .line 30
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->dynamicMD5:Ljava/lang/String;

    .line 31
    .line 32
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 33
    .line 34
    if-nez v0, :cond_4

    .line 35
    .line 36
    invoke-static {}, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;->new_()Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 41
    .line 42
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->consumeType:Ljava/lang/String;

    .line 43
    .line 44
    if-nez v0, :cond_5

    .line 45
    .line 46
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->consumeType:Ljava/lang/String;

    .line 47
    .line 48
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->coinSign:Ljava/lang/String;

    .line 49
    .line 50
    if-nez v0, :cond_6

    .line 51
    .line 52
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->coinSign:Ljava/lang/String;

    .line 53
    .line 54
    :cond_6
    return-object p0
.end method

.method public bridge synthetic init()Ljava/lang/Object;
    .locals 0

    .line 55
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/CoreGiftInfo$18;->init()Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    move-result-object p0

    return-object p0
.end method

.method public read(Landroid/database/Cursor;I)Lcom/p1/mobile/putong/core/data/CoreGiftInfo;
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p2, :cond_0

    .line 3
    .line 4
    iput v0, p0, Ll/vzf0;->readIndex:I

    .line 5
    .line 6
    :cond_0
    new-instance v1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 7
    .line 8
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;-><init>()V

    .line 9
    .line 10
    .line 11
    :try_start_0
    new-instance v2, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 12
    .line 13
    invoke-direct {v2}, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 17
    .line 18
    invoke-interface {p1, p2}, Landroid/database/Cursor;->getLong(I)J

    .line 19
    .line 20
    .line 21
    move-result-wide v2

    .line 22
    iput-wide v2, v1, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 23
    .line 24
    add-int/lit8 v2, p2, 0x1

    .line 25
    .line 26
    invoke-interface {p1, v2}, Landroid/database/Cursor;->isNull(I)Z

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    const/4 v4, 0x0

    .line 31
    if-eqz v3, :cond_1

    .line 32
    .line 33
    move-object v2, v4

    .line 34
    goto :goto_0

    .line 35
    :cond_1
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    :goto_0
    iput-object v2, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 40
    .line 41
    add-int/lit8 v2, p2, 0x2

    .line 42
    .line 43
    invoke-interface {p1, v2}, Landroid/database/Cursor;->isNull(I)Z

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    if-eqz v3, :cond_2

    .line 48
    .line 49
    move-object v2, v4

    .line 50
    goto :goto_1

    .line 51
    :cond_2
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    :goto_1
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->name:Ljava/lang/String;

    .line 56
    .line 57
    add-int/lit8 v2, p2, 0x3

    .line 58
    .line 59
    invoke-interface {p1, v2}, Landroid/database/Cursor;->isNull(I)Z

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    if-eqz v3, :cond_3

    .line 64
    .line 65
    move-object v2, v4

    .line 66
    goto :goto_2

    .line 67
    :cond_3
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    :goto_2
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->url:Ljava/lang/String;

    .line 72
    .line 73
    add-int/lit8 v2, p2, 0x4

    .line 74
    .line 75
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getDouble(I)D

    .line 76
    .line 77
    .line 78
    move-result-wide v2

    .line 79
    iput-wide v2, v1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->unitCoinPrice:D

    .line 80
    .line 81
    add-int/lit8 v2, p2, 0x5

    .line 82
    .line 83
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getInt(I)I

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    iput v2, v1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->unitLikes:I

    .line 88
    .line 89
    add-int/lit8 v2, p2, 0x6

    .line 90
    .line 91
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getInt(I)I

    .line 92
    .line 93
    .line 94
    move-result v2

    .line 95
    const/4 v3, 0x1

    .line 96
    if-ne v2, v3, :cond_4

    .line 97
    .line 98
    move v0, v3

    .line 99
    :cond_4
    iput-boolean v0, v1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->dynamicGift:Z

    .line 100
    .line 101
    add-int/lit8 v0, p2, 0x7

    .line 102
    .line 103
    invoke-interface {p1, v0}, Landroid/database/Cursor;->isNull(I)Z

    .line 104
    .line 105
    .line 106
    move-result v2

    .line 107
    if-eqz v2, :cond_5

    .line 108
    .line 109
    move-object v0, v4

    .line 110
    goto :goto_3

    .line 111
    :cond_5
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    :goto_3
    iput-object v0, v1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->dynamicURL:Ljava/lang/String;

    .line 116
    .line 117
    add-int/lit8 v0, p2, 0x8

    .line 118
    .line 119
    invoke-interface {p1, v0}, Landroid/database/Cursor;->isNull(I)Z

    .line 120
    .line 121
    .line 122
    move-result v2

    .line 123
    if-eqz v2, :cond_6

    .line 124
    .line 125
    move-object v0, v4

    .line 126
    goto :goto_4

    .line 127
    :cond_6
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    :goto_4
    iput-object v0, v1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->dynamicMD5:Ljava/lang/String;

    .line 132
    .line 133
    add-int/lit8 v0, p2, 0x9

    .line 134
    .line 135
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 136
    .line 137
    .line 138
    move-result v0

    .line 139
    iput v0, v1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->quota:I

    .line 140
    .line 141
    add-int/lit8 v0, p2, 0xa

    .line 142
    .line 143
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 144
    .line 145
    invoke-interface {p1, v0}, Landroid/database/Cursor;->isNull(I)Z

    .line 146
    .line 147
    .line 148
    move-result v3

    .line 149
    if-eqz v3, :cond_7

    .line 150
    .line 151
    move-object v0, v4

    .line 152
    goto :goto_5

    .line 153
    :cond_7
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    :goto_5
    iput-object v0, v2, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;->messageTips:Ljava/lang/String;

    .line 158
    .line 159
    add-int/lit8 v0, p2, 0xb

    .line 160
    .line 161
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 162
    .line 163
    invoke-interface {p1, v0}, Landroid/database/Cursor;->isNull(I)Z

    .line 164
    .line 165
    .line 166
    move-result v3

    .line 167
    if-eqz v3, :cond_8

    .line 168
    .line 169
    move-object v0, v4

    .line 170
    goto :goto_6

    .line 171
    :cond_8
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    :goto_6
    iput-object v0, v2, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;->noQuotaToast:Ljava/lang/String;

    .line 176
    .line 177
    add-int/lit8 v0, p2, 0xc

    .line 178
    .line 179
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 180
    .line 181
    invoke-interface {p1, v0}, Landroid/database/Cursor;->isNull(I)Z

    .line 182
    .line 183
    .line 184
    move-result v3

    .line 185
    if-eqz v3, :cond_9

    .line 186
    .line 187
    move-object v0, v4

    .line 188
    goto :goto_7

    .line 189
    :cond_9
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    :goto_7
    iput-object v0, v2, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;->shopGuide:Ljava/lang/String;

    .line 194
    .line 195
    add-int/lit8 v0, p2, 0xd

    .line 196
    .line 197
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 198
    .line 199
    invoke-interface {p1, v0}, Landroid/database/Cursor;->isNull(I)Z

    .line 200
    .line 201
    .line 202
    move-result v3

    .line 203
    if-eqz v3, :cond_a

    .line 204
    .line 205
    move-object v0, v4

    .line 206
    goto :goto_8

    .line 207
    :cond_a
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 208
    .line 209
    .line 210
    move-result-object v0

    .line 211
    :goto_8
    iput-object v0, v2, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;->blessingText:Ljava/lang/String;

    .line 212
    .line 213
    add-int/lit8 v0, p2, 0xe

    .line 214
    .line 215
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 216
    .line 217
    invoke-interface {p1, v0}, Landroid/database/Cursor;->isNull(I)Z

    .line 218
    .line 219
    .line 220
    move-result v3

    .line 221
    if-eqz v3, :cond_b

    .line 222
    .line 223
    goto :goto_9

    .line 224
    :cond_b
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 225
    .line 226
    .line 227
    move-result-object v4

    .line 228
    :goto_9
    iput-object v4, v2, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;->grayURL:Ljava/lang/String;

    .line 229
    .line 230
    add-int/lit8 p2, p2, 0xf

    .line 231
    .line 232
    iput p2, p0, Ll/vzf0;->readIndex:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 233
    .line 234
    goto :goto_a

    .line 235
    :catch_0
    move-exception p0

    .line 236
    invoke-static {p0, p1}, Lcom/google/protobuf/nano/MessageNano;->reportError(Ljava/lang/Exception;Landroid/database/Cursor;)V

    .line 237
    .line 238
    .line 239
    :goto_a
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->name:Ljava/lang/String;

    .line 240
    .line 241
    const-string p1, ""

    .line 242
    .line 243
    if-nez p0, :cond_c

    .line 244
    .line 245
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->name:Ljava/lang/String;

    .line 246
    .line 247
    :cond_c
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->url:Ljava/lang/String;

    .line 248
    .line 249
    if-nez p0, :cond_d

    .line 250
    .line 251
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->url:Ljava/lang/String;

    .line 252
    .line 253
    :cond_d
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->dynamicURL:Ljava/lang/String;

    .line 254
    .line 255
    if-nez p0, :cond_e

    .line 256
    .line 257
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->dynamicURL:Ljava/lang/String;

    .line 258
    .line 259
    :cond_e
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->dynamicMD5:Ljava/lang/String;

    .line 260
    .line 261
    if-nez p0, :cond_f

    .line 262
    .line 263
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->dynamicMD5:Ljava/lang/String;

    .line 264
    .line 265
    :cond_f
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 266
    .line 267
    if-nez p0, :cond_10

    .line 268
    .line 269
    invoke-static {}, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;->new_()Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 270
    .line 271
    .line 272
    move-result-object p0

    .line 273
    iput-object p0, v1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 274
    .line 275
    :cond_10
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->consumeType:Ljava/lang/String;

    .line 276
    .line 277
    if-nez p0, :cond_11

    .line 278
    .line 279
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->consumeType:Ljava/lang/String;

    .line 280
    .line 281
    :cond_11
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->coinSign:Ljava/lang/String;

    .line 282
    .line 283
    if-nez p0, :cond_12

    .line 284
    .line 285
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->coinSign:Ljava/lang/String;

    .line 286
    .line 287
    :cond_12
    return-object v1
.end method

.method public bridge synthetic read(Landroid/database/Cursor;I)Ljava/lang/Object;
    .locals 0

    .line 288
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/CoreGiftInfo$18;->read(Landroid/database/Cursor;I)Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    move-result-object p0

    return-object p0
.end method

.method public write(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Landroid/content/ContentValues;)V
    .locals 2

    .line 1
    :try_start_0
    const-string p0, "id_c"

    .line 2
    .line 3
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p2, p0, v0}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "name_c"

    .line 9
    .line 10
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->name:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {p2, p0, v0}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    const-string p0, "url_c"

    .line 16
    .line 17
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->url:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {p2, p0, v0}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const-string p0, "unitCoinPrice_c"

    .line 23
    .line 24
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->unitCoinPrice:D

    .line 25
    .line 26
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-static {p2, p0, v0}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Double;)V

    .line 31
    .line 32
    .line 33
    const-string p0, "unitLikes_c"

    .line 34
    .line 35
    iget v0, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->unitLikes:I

    .line 36
    .line 37
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-static {p2, p0, v0}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 42
    .line 43
    .line 44
    const-string p0, "dynamicGift_c"

    .line 45
    .line 46
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->dynamicGift:Z

    .line 47
    .line 48
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-static {p2, p0, v0}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 53
    .line 54
    .line 55
    const-string p0, "dynamicURL_c"

    .line 56
    .line 57
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->dynamicURL:Ljava/lang/String;

    .line 58
    .line 59
    invoke-static {p2, p0, v0}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    const-string p0, "dynamicMD5_c"

    .line 63
    .line 64
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->dynamicMD5:Ljava/lang/String;

    .line 65
    .line 66
    invoke-static {p2, p0, v0}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    const-string p0, "quota_c"

    .line 70
    .line 71
    iget v0, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->quota:I

    .line 72
    .line 73
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-static {p2, p0, v0}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 78
    .line 79
    .line 80
    const-string p0, "extra_messageTips_c"

    .line 81
    .line 82
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 83
    .line 84
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;->messageTips:Ljava/lang/String;

    .line 85
    .line 86
    invoke-static {p2, p0, v0}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    const-string p0, "extra_noQuotaToast_c"

    .line 90
    .line 91
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 92
    .line 93
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;->noQuotaToast:Ljava/lang/String;

    .line 94
    .line 95
    invoke-static {p2, p0, v0}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    const-string p0, "extra_shopGuide_c"

    .line 99
    .line 100
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 101
    .line 102
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;->shopGuide:Ljava/lang/String;

    .line 103
    .line 104
    invoke-static {p2, p0, v0}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    const-string p0, "extra_blessingText_c"

    .line 108
    .line 109
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 110
    .line 111
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;->blessingText:Ljava/lang/String;

    .line 112
    .line 113
    invoke-static {p2, p0, v0}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    const-string p0, "extra_grayURL_c"

    .line 117
    .line 118
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 119
    .line 120
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;->grayURL:Ljava/lang/String;

    .line 121
    .line 122
    invoke-static {p2, p0, p1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 123
    .line 124
    .line 125
    return-void

    .line 126
    :catch_0
    move-exception p0

    .line 127
    const/4 p1, 0x0

    .line 128
    invoke-static {p0, p1}, Lcom/google/protobuf/nano/MessageNano;->reportError(Ljava/lang/Exception;Landroid/database/Cursor;)V

    .line 129
    .line 130
    .line 131
    return-void
.end method

.method public bridge synthetic write(Ljava/lang/Object;Landroid/content/ContentValues;)V
    .locals 0

    .line 132
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/CoreGiftInfo$18;->write(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Landroid/content/ContentValues;)V

    return-void
.end method
