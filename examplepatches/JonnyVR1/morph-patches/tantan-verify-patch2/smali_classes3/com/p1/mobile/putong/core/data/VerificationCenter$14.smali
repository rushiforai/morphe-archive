.class Lcom/p1/mobile/putong/core/data/VerificationCenter$14;
.super Ll/vzf0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/VerificationCenter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/vzf0<",
        "Lcom/p1/mobile/putong/core/data/VerificationCenter;",
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
    const-string p1, " (_id INTEGER PRIMARY KEY,id_c TEXT,userId_c TEXT,verificationType_c TEXT,picVerificationInfo_media_c BLOB,picVerificationInfo_status_c INTEGER,idCard_c BLOB,ageVerificationInfo_status_c INTEGER,voiceAnchor_status_c TEXT,str_picVerificationInfo_status_c TEXT,str_ageVerificationInfo_status_c TEXT,str_ctdidVerificationInfo_status_c TEXT,ctdidVerificationInfo_media_c BLOB,ctdidVerificationInfo_status_c INTEGER)"

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
    const-class p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 2
    .line 3
    return-object p0
.end method

.method public init()Lcom/p1/mobile/putong/core/data/VerificationCenter;
    .locals 2

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/VerificationCenter;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->userId:Ljava/lang/String;

    .line 7
    .line 8
    const-string v1, ""

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->userId:Ljava/lang/String;

    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->verificationType:Ljava/lang/String;

    .line 15
    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->verificationType:Ljava/lang/String;

    .line 19
    .line 20
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 21
    .line 22
    if-nez v0, :cond_2

    .line 23
    .line 24
    invoke-static {}, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->new_()Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 29
    .line 30
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->ageVerificationInfo:Lcom/p1/mobile/putong/core/data/AgeVerificationInfo;

    .line 31
    .line 32
    if-nez v0, :cond_3

    .line 33
    .line 34
    invoke-static {}, Lcom/p1/mobile/putong/core/data/AgeVerificationInfo;->new_()Lcom/p1/mobile/putong/core/data/AgeVerificationInfo;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->ageVerificationInfo:Lcom/p1/mobile/putong/core/data/AgeVerificationInfo;

    .line 39
    .line 40
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->voiceAnchor:Lcom/p1/mobile/putong/core/data/VoiceAnchorVerifyResult;

    .line 41
    .line 42
    if-nez v0, :cond_4

    .line 43
    .line 44
    invoke-static {}, Lcom/p1/mobile/putong/core/data/VoiceAnchorVerifyResult;->new_()Lcom/p1/mobile/putong/core/data/VoiceAnchorVerifyResult;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->voiceAnchor:Lcom/p1/mobile/putong/core/data/VoiceAnchorVerifyResult;

    .line 49
    .line 50
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->ctdidVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 51
    .line 52
    if-nez v0, :cond_5

    .line 53
    .line 54
    invoke-static {}, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->new_()Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->ctdidVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 59
    .line 60
    :cond_5
    return-object p0
.end method

.method public bridge synthetic init()Ljava/lang/Object;
    .locals 0

    .line 61
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/VerificationCenter$14;->init()Lcom/p1/mobile/putong/core/data/VerificationCenter;

    move-result-object p0

    return-object p0
.end method

.method public read(Landroid/database/Cursor;I)Lcom/p1/mobile/putong/core/data/VerificationCenter;
    .locals 11

    .line 1
    const-string v0, "unknown_"

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    iput v1, p0, Ll/vzf0;->readIndex:I

    .line 7
    .line 8
    :cond_0
    new-instance v1, Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 9
    .line 10
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/data/VerificationCenter;-><init>()V

    .line 11
    .line 12
    .line 13
    const/4 v2, -0x1

    .line 14
    :try_start_0
    new-instance v3, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 15
    .line 16
    invoke-direct {v3}, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v3, v1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 20
    .line 21
    new-instance v3, Lcom/p1/mobile/putong/core/data/AgeVerificationInfo;

    .line 22
    .line 23
    invoke-direct {v3}, Lcom/p1/mobile/putong/core/data/AgeVerificationInfo;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v3, v1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->ageVerificationInfo:Lcom/p1/mobile/putong/core/data/AgeVerificationInfo;

    .line 27
    .line 28
    new-instance v3, Lcom/p1/mobile/putong/core/data/VoiceAnchorVerifyResult;

    .line 29
    .line 30
    invoke-direct {v3}, Lcom/p1/mobile/putong/core/data/VoiceAnchorVerifyResult;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object v3, v1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->voiceAnchor:Lcom/p1/mobile/putong/core/data/VoiceAnchorVerifyResult;

    .line 34
    .line 35
    new-instance v3, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 36
    .line 37
    invoke-direct {v3}, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;-><init>()V

    .line 38
    .line 39
    .line 40
    iput-object v3, v1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->ctdidVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 41
    .line 42
    invoke-interface {p1, p2}, Landroid/database/Cursor;->getLong(I)J

    .line 43
    .line 44
    .line 45
    move-result-wide v3

    .line 46
    iput-wide v3, v1, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 47
    .line 48
    add-int/lit8 v3, p2, 0x1

    .line 49
    .line 50
    invoke-interface {p1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 51
    .line 52
    .line 53
    move-result v4

    .line 54
    const/4 v5, 0x0

    .line 55
    if-eqz v4, :cond_1

    .line 56
    .line 57
    move-object v3, v5

    .line 58
    goto :goto_0

    .line 59
    :cond_1
    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    :goto_0
    iput-object v3, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 64
    .line 65
    add-int/lit8 v3, p2, 0x2

    .line 66
    .line 67
    invoke-interface {p1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 68
    .line 69
    .line 70
    move-result v4

    .line 71
    if-eqz v4, :cond_2

    .line 72
    .line 73
    move-object v3, v5

    .line 74
    goto :goto_1

    .line 75
    :cond_2
    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v3

    .line 79
    :goto_1
    iput-object v3, v1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->userId:Ljava/lang/String;

    .line 80
    .line 81
    add-int/lit8 v3, p2, 0x3

    .line 82
    .line 83
    invoke-interface {p1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 84
    .line 85
    .line 86
    move-result v4

    .line 87
    if-eqz v4, :cond_3

    .line 88
    .line 89
    move-object v3, v5

    .line 90
    goto :goto_2

    .line 91
    :cond_3
    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v3

    .line 95
    :goto_2
    iput-object v3, v1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->verificationType:Ljava/lang/String;

    .line 96
    .line 97
    add-int/lit8 v3, p2, 0x4

    .line 98
    .line 99
    iget-object v4, v1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 100
    .line 101
    invoke-interface {p1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 102
    .line 103
    .line 104
    move-result v6

    .line 105
    if-eqz v6, :cond_4

    .line 106
    .line 107
    move-object v3, v5

    .line 108
    goto :goto_3

    .line 109
    :cond_4
    sget-object v6, Lcom/p1/mobile/putong/data/Picture;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 110
    .line 111
    invoke-interface {p1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    .line 112
    .line 113
    .line 114
    move-result-object v3

    .line 115
    invoke-virtual {v6, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object v3

    .line 119
    check-cast v3, Lcom/p1/mobile/putong/data/Picture;

    .line 120
    .line 121
    :goto_3
    iput-object v3, v4, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->media:Lcom/p1/mobile/putong/data/Picture;

    .line 122
    .line 123
    add-int/lit8 v3, p2, 0x5

    .line 124
    .line 125
    invoke-interface {p1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 126
    .line 127
    .line 128
    move-result v4

    .line 129
    if-eqz v4, :cond_5

    .line 130
    .line 131
    move v3, v2

    .line 132
    goto :goto_4

    .line 133
    :cond_5
    invoke-interface {p1, v3}, Landroid/database/Cursor;->getInt(I)I

    .line 134
    .line 135
    .line 136
    move-result v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_4

    .line 137
    :goto_4
    add-int/lit8 v4, p2, 0x6

    .line 138
    .line 139
    :try_start_1
    invoke-interface {p1, v4}, Landroid/database/Cursor;->isNull(I)Z

    .line 140
    .line 141
    .line 142
    move-result v6

    .line 143
    if-eqz v6, :cond_6

    .line 144
    .line 145
    move-object v4, v5

    .line 146
    goto :goto_5

    .line 147
    :cond_6
    sget-object v6, Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 148
    .line 149
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getBlob(I)[B

    .line 150
    .line 151
    .line 152
    move-result-object v4

    .line 153
    invoke-virtual {v6, v4}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 154
    .line 155
    .line 156
    move-result-object v4

    .line 157
    check-cast v4, Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;

    .line 158
    .line 159
    :goto_5
    iput-object v4, v1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->idCard:Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;

    .line 160
    .line 161
    add-int/lit8 v4, p2, 0x7

    .line 162
    .line 163
    invoke-interface {p1, v4}, Landroid/database/Cursor;->isNull(I)Z

    .line 164
    .line 165
    .line 166
    move-result v6

    .line 167
    if-eqz v6, :cond_7

    .line 168
    .line 169
    move v4, v2

    .line 170
    goto :goto_6

    .line 171
    :cond_7
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getInt(I)I

    .line 172
    .line 173
    .line 174
    move-result v4
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3

    .line 175
    :goto_6
    add-int/lit8 v6, p2, 0x8

    .line 176
    .line 177
    :try_start_2
    iget-object v7, v1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->voiceAnchor:Lcom/p1/mobile/putong/core/data/VoiceAnchorVerifyResult;

    .line 178
    .line 179
    invoke-interface {p1, v6}, Landroid/database/Cursor;->isNull(I)Z

    .line 180
    .line 181
    .line 182
    move-result v8

    .line 183
    if-eqz v8, :cond_8

    .line 184
    .line 185
    move-object v6, v5

    .line 186
    goto :goto_7

    .line 187
    :cond_8
    invoke-interface {p1, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object v6

    .line 191
    :goto_7
    iput-object v6, v7, Lcom/p1/mobile/putong/core/data/VoiceAnchorVerifyResult;->status:Ljava/lang/String;

    .line 192
    .line 193
    add-int/lit8 v6, p2, 0x9

    .line 194
    .line 195
    invoke-interface {p1, v6}, Landroid/database/Cursor;->isNull(I)Z

    .line 196
    .line 197
    .line 198
    move-result v7

    .line 199
    if-eqz v7, :cond_9

    .line 200
    .line 201
    move-object v6, v5

    .line 202
    goto :goto_8

    .line 203
    :cond_9
    invoke-interface {p1, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object v6
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 207
    :goto_8
    add-int/lit8 v7, p2, 0xa

    .line 208
    .line 209
    :try_start_3
    invoke-interface {p1, v7}, Landroid/database/Cursor;->isNull(I)Z

    .line 210
    .line 211
    .line 212
    move-result v8

    .line 213
    if-eqz v8, :cond_a

    .line 214
    .line 215
    move-object v7, v5

    .line 216
    goto :goto_9

    .line 217
    :cond_a
    invoke-interface {p1, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object v7
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    .line 221
    :goto_9
    add-int/lit8 v8, p2, 0xb

    .line 222
    .line 223
    :try_start_4
    invoke-interface {p1, v8}, Landroid/database/Cursor;->isNull(I)Z

    .line 224
    .line 225
    .line 226
    move-result v9

    .line 227
    if-eqz v9, :cond_b

    .line 228
    .line 229
    move-object v0, v5

    .line 230
    goto :goto_a

    .line 231
    :cond_b
    invoke-interface {p1, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 232
    .line 233
    .line 234
    move-result-object v0

    .line 235
    :goto_a
    add-int/lit8 v8, p2, 0xc

    .line 236
    .line 237
    iget-object v9, v1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->ctdidVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 238
    .line 239
    invoke-interface {p1, v8}, Landroid/database/Cursor;->isNull(I)Z

    .line 240
    .line 241
    .line 242
    move-result v10

    .line 243
    if-eqz v10, :cond_c

    .line 244
    .line 245
    goto :goto_b

    .line 246
    :cond_c
    sget-object v5, Lcom/p1/mobile/putong/data/Picture;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 247
    .line 248
    invoke-interface {p1, v8}, Landroid/database/Cursor;->getBlob(I)[B

    .line 249
    .line 250
    .line 251
    move-result-object v8

    .line 252
    invoke-virtual {v5, v8}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 253
    .line 254
    .line 255
    move-result-object v5

    .line 256
    check-cast v5, Lcom/p1/mobile/putong/data/Picture;

    .line 257
    .line 258
    :goto_b
    iput-object v5, v9, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->media:Lcom/p1/mobile/putong/data/Picture;

    .line 259
    .line 260
    add-int/lit8 v5, p2, 0xd

    .line 261
    .line 262
    invoke-interface {p1, v5}, Landroid/database/Cursor;->isNull(I)Z

    .line 263
    .line 264
    .line 265
    move-result v8

    .line 266
    if-eqz v8, :cond_d

    .line 267
    .line 268
    goto :goto_c

    .line 269
    :cond_d
    invoke-interface {p1, v5}, Landroid/database/Cursor;->getInt(I)I

    .line 270
    .line 271
    .line 272
    move-result v2

    .line 273
    :goto_c
    add-int/lit8 p2, p2, 0xe

    .line 274
    .line 275
    iput p2, p0, Ll/vzf0;->readIndex:I
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 276
    .line 277
    goto :goto_f

    .line 278
    :catch_0
    move-exception p0

    .line 279
    move p2, v3

    .line 280
    move v3, v2

    .line 281
    move v2, p2

    .line 282
    move-object p2, v0

    .line 283
    :goto_d
    move-object v0, v6

    .line 284
    goto :goto_e

    .line 285
    :catch_1
    move-exception p0

    .line 286
    move p2, v3

    .line 287
    move v3, v2

    .line 288
    move v2, p2

    .line 289
    move-object p2, v0

    .line 290
    move-object v7, p2

    .line 291
    goto :goto_d

    .line 292
    :catch_2
    move-exception p0

    .line 293
    move p2, v3

    .line 294
    move v3, v2

    .line 295
    move v2, p2

    .line 296
    move-object p2, v0

    .line 297
    move-object v7, p2

    .line 298
    goto :goto_e

    .line 299
    :catch_3
    move-exception p0

    .line 300
    move-object p2, v0

    .line 301
    move-object v7, p2

    .line 302
    move v4, v2

    .line 303
    move v2, v3

    .line 304
    move v3, v4

    .line 305
    goto :goto_e

    .line 306
    :catch_4
    move-exception p0

    .line 307
    move-object p2, v0

    .line 308
    move-object v7, p2

    .line 309
    move v3, v2

    .line 310
    move v4, v3

    .line 311
    :goto_e
    invoke-static {p0, p1}, Lcom/google/protobuf/nano/MessageNano;->reportError(Ljava/lang/Exception;Landroid/database/Cursor;)V

    .line 312
    .line 313
    .line 314
    move v6, v3

    .line 315
    move v3, v2

    .line 316
    move v2, v6

    .line 317
    move-object v6, v0

    .line 318
    move-object v0, p2

    .line 319
    :goto_f
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 320
    .line 321
    sget-object p1, Lcom/p1/mobile/putong/data/StudentVerificationStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 322
    .line 323
    invoke-virtual {p1, v6, v3}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 324
    .line 325
    .line 326
    move-result-object p2

    .line 327
    check-cast p2, Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 328
    .line 329
    iput-object p2, p0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 330
    .line 331
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->ageVerificationInfo:Lcom/p1/mobile/putong/core/data/AgeVerificationInfo;

    .line 332
    .line 333
    invoke-virtual {p1, v7, v4}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 334
    .line 335
    .line 336
    move-result-object p2

    .line 337
    check-cast p2, Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 338
    .line 339
    iput-object p2, p0, Lcom/p1/mobile/putong/core/data/AgeVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 340
    .line 341
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->ctdidVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 342
    .line 343
    invoke-virtual {p1, v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 344
    .line 345
    .line 346
    move-result-object p1

    .line 347
    check-cast p1, Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 348
    .line 349
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 350
    .line 351
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->userId:Ljava/lang/String;

    .line 352
    .line 353
    const-string p1, ""

    .line 354
    .line 355
    if-nez p0, :cond_e

    .line 356
    .line 357
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->userId:Ljava/lang/String;

    .line 358
    .line 359
    :cond_e
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->verificationType:Ljava/lang/String;

    .line 360
    .line 361
    if-nez p0, :cond_f

    .line 362
    .line 363
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->verificationType:Ljava/lang/String;

    .line 364
    .line 365
    :cond_f
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 366
    .line 367
    if-nez p0, :cond_10

    .line 368
    .line 369
    invoke-static {}, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->new_()Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 370
    .line 371
    .line 372
    move-result-object p0

    .line 373
    iput-object p0, v1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 374
    .line 375
    :cond_10
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->ageVerificationInfo:Lcom/p1/mobile/putong/core/data/AgeVerificationInfo;

    .line 376
    .line 377
    if-nez p0, :cond_11

    .line 378
    .line 379
    invoke-static {}, Lcom/p1/mobile/putong/core/data/AgeVerificationInfo;->new_()Lcom/p1/mobile/putong/core/data/AgeVerificationInfo;

    .line 380
    .line 381
    .line 382
    move-result-object p0

    .line 383
    iput-object p0, v1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->ageVerificationInfo:Lcom/p1/mobile/putong/core/data/AgeVerificationInfo;

    .line 384
    .line 385
    :cond_11
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->voiceAnchor:Lcom/p1/mobile/putong/core/data/VoiceAnchorVerifyResult;

    .line 386
    .line 387
    if-nez p0, :cond_12

    .line 388
    .line 389
    invoke-static {}, Lcom/p1/mobile/putong/core/data/VoiceAnchorVerifyResult;->new_()Lcom/p1/mobile/putong/core/data/VoiceAnchorVerifyResult;

    .line 390
    .line 391
    .line 392
    move-result-object p0

    .line 393
    iput-object p0, v1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->voiceAnchor:Lcom/p1/mobile/putong/core/data/VoiceAnchorVerifyResult;

    .line 394
    .line 395
    :cond_12
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->ctdidVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 396
    .line 397
    if-nez p0, :cond_13

    .line 398
    .line 399
    invoke-static {}, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->new_()Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 400
    .line 401
    .line 402
    move-result-object p0

    .line 403
    iput-object p0, v1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->ctdidVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 404
    .line 405
    :cond_13
    return-object v1
.end method

.method public bridge synthetic read(Landroid/database/Cursor;I)Ljava/lang/Object;
    .locals 0

    .line 406
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/VerificationCenter$14;->read(Landroid/database/Cursor;I)Lcom/p1/mobile/putong/core/data/VerificationCenter;

    move-result-object p0

    return-object p0
.end method

.method public write(Lcom/p1/mobile/putong/core/data/VerificationCenter;Landroid/content/ContentValues;)V
    .locals 3

    .line 1
    const/4 p0, 0x0

    .line 2
    :try_start_0
    const-string v0, "id_c"

    .line 3
    .line 4
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 5
    .line 6
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    const-string v0, "userId_c"

    .line 10
    .line 11
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->userId:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "verificationType_c"

    .line 17
    .line 18
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->verificationType:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    const-string v0, "picVerificationInfo_media_c"

    .line 24
    .line 25
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 26
    .line 27
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->media:Lcom/p1/mobile/putong/data/Picture;

    .line 28
    .line 29
    if-nez v1, :cond_0

    .line 30
    .line 31
    move-object v1, p0

    .line 32
    goto :goto_0

    .line 33
    :cond_0
    sget-object v2, Lcom/p1/mobile/putong/data/Picture;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 34
    .line 35
    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    :goto_0
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 40
    .line 41
    .line 42
    const-string v0, "str_picVerificationInfo_status_c"

    .line 43
    .line 44
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 45
    .line 46
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 47
    .line 48
    if-nez v1, :cond_1

    .line 49
    .line 50
    move-object v1, p0

    .line 51
    goto :goto_1

    .line 52
    :cond_1
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    :goto_1
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    const-string v0, "picVerificationInfo_status_c"

    .line 60
    .line 61
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 62
    .line 63
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 64
    .line 65
    if-nez v1, :cond_2

    .line 66
    .line 67
    move-object v1, p0

    .line 68
    goto :goto_2

    .line 69
    :cond_2
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    :goto_2
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 78
    .line 79
    .line 80
    const-string v0, "idCard_c"

    .line 81
    .line 82
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->idCard:Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;

    .line 83
    .line 84
    if-nez v1, :cond_3

    .line 85
    .line 86
    move-object v1, p0

    .line 87
    goto :goto_3

    .line 88
    :cond_3
    sget-object v2, Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 89
    .line 90
    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    :goto_3
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 95
    .line 96
    .line 97
    const-string v0, "str_ageVerificationInfo_status_c"

    .line 98
    .line 99
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->ageVerificationInfo:Lcom/p1/mobile/putong/core/data/AgeVerificationInfo;

    .line 100
    .line 101
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/AgeVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 102
    .line 103
    if-nez v1, :cond_4

    .line 104
    .line 105
    move-object v1, p0

    .line 106
    goto :goto_4

    .line 107
    :cond_4
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    :goto_4
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    const-string v0, "ageVerificationInfo_status_c"

    .line 115
    .line 116
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->ageVerificationInfo:Lcom/p1/mobile/putong/core/data/AgeVerificationInfo;

    .line 117
    .line 118
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/AgeVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 119
    .line 120
    if-nez v1, :cond_5

    .line 121
    .line 122
    move-object v1, p0

    .line 123
    goto :goto_5

    .line 124
    :cond_5
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 125
    .line 126
    .line 127
    move-result v1

    .line 128
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    :goto_5
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 133
    .line 134
    .line 135
    const-string v0, "voiceAnchor_status_c"

    .line 136
    .line 137
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->voiceAnchor:Lcom/p1/mobile/putong/core/data/VoiceAnchorVerifyResult;

    .line 138
    .line 139
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/VoiceAnchorVerifyResult;->status:Ljava/lang/String;

    .line 140
    .line 141
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    const-string v0, "ctdidVerificationInfo_media_c"

    .line 145
    .line 146
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->ctdidVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 147
    .line 148
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->media:Lcom/p1/mobile/putong/data/Picture;

    .line 149
    .line 150
    if-nez v1, :cond_6

    .line 151
    .line 152
    move-object v1, p0

    .line 153
    goto :goto_6

    .line 154
    :cond_6
    sget-object v2, Lcom/p1/mobile/putong/data/Picture;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 155
    .line 156
    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 157
    .line 158
    .line 159
    move-result-object v1

    .line 160
    :goto_6
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 161
    .line 162
    .line 163
    const-string v0, "str_ctdidVerificationInfo_status_c"

    .line 164
    .line 165
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->ctdidVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 166
    .line 167
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 168
    .line 169
    if-nez v1, :cond_7

    .line 170
    .line 171
    move-object v1, p0

    .line 172
    goto :goto_7

    .line 173
    :cond_7
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object v1

    .line 177
    :goto_7
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 178
    .line 179
    .line 180
    const-string v0, "ctdidVerificationInfo_status_c"

    .line 181
    .line 182
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->ctdidVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 183
    .line 184
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 185
    .line 186
    if-nez p1, :cond_8

    .line 187
    .line 188
    move-object p1, p0

    .line 189
    goto :goto_8

    .line 190
    :cond_8
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 191
    .line 192
    .line 193
    move-result p1

    .line 194
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 195
    .line 196
    .line 197
    move-result-object p1

    .line 198
    :goto_8
    invoke-static {p2, v0, p1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 199
    .line 200
    .line 201
    return-void

    .line 202
    :catch_0
    move-exception p1

    .line 203
    invoke-static {p1, p0}, Lcom/google/protobuf/nano/MessageNano;->reportError(Ljava/lang/Exception;Landroid/database/Cursor;)V

    .line 204
    .line 205
    .line 206
    return-void
.end method

.method public bridge synthetic write(Ljava/lang/Object;Landroid/content/ContentValues;)V
    .locals 0

    .line 207
    check-cast p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/VerificationCenter$14;->write(Lcom/p1/mobile/putong/core/data/VerificationCenter;Landroid/content/ContentValues;)V

    return-void
.end method
