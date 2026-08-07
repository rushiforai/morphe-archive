.class Lcom/p1/mobile/putong/feed/data/MomentActivity$20;
.super Ll/vzf0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/data/MomentActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/vzf0<",
        "Lcom/p1/mobile/putong/feed/data/MomentActivity;",
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
    const-string p1, " (_id INTEGER PRIMARY KEY,id_c TEXT,value_c TEXT,owner_c TEXT,actors_c TEXT,action_c INTEGER,read_c INTEGER,reference_id_c TEXT,reference_type_c TEXT,createdTime_c REAL,messageid_c TEXT,settings_anonymous_c INTEGER,acceptGift_c INTEGER,str_action_c TEXT,parentMessageid_c TEXT,replyMessageId_c TEXT,userIds_c BLOB,count_c INTEGER)"

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
    const-class p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 2
    .line 3
    return-object p0
.end method

.method public init()Lcom/p1/mobile/putong/feed/data/MomentActivity;
    .locals 2

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/data/MomentActivity;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->value:Ljava/lang/String;

    .line 7
    .line 8
    const-string v1, ""

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->value:Ljava/lang/String;

    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->owner:Ljava/lang/String;

    .line 15
    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->owner:Ljava/lang/String;

    .line 19
    .line 20
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->actors:Ljava/lang/String;

    .line 21
    .line 22
    if-nez v0, :cond_2

    .line 23
    .line 24
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->actors:Ljava/lang/String;

    .line 25
    .line 26
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->action:Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    .line 27
    .line 28
    if-nez v0, :cond_3

    .line 29
    .line 30
    sget-object v0, Lcom/p1/mobile/putong/feed/data/ActivityActionApi;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 31
    .line 32
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    .line 37
    .line 38
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->action:Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    .line 39
    .line 40
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->reference:Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;

    .line 41
    .line 42
    if-nez v0, :cond_4

    .line 43
    .line 44
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;->new_()Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->reference:Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;

    .line 49
    .line 50
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->messageid:Ljava/lang/String;

    .line 51
    .line 52
    if-nez v0, :cond_5

    .line 53
    .line 54
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->messageid:Ljava/lang/String;

    .line 55
    .line 56
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->settings:Lcom/p1/mobile/putong/feed/data/ActivitySetting;

    .line 57
    .line 58
    if-nez v0, :cond_6

    .line 59
    .line 60
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/ActivitySetting;->new_()Lcom/p1/mobile/putong/feed/data/ActivitySetting;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->settings:Lcom/p1/mobile/putong/feed/data/ActivitySetting;

    .line 65
    .line 66
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->parentMessageid:Ljava/lang/String;

    .line 67
    .line 68
    if-nez v0, :cond_7

    .line 69
    .line 70
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->parentMessageid:Ljava/lang/String;

    .line 71
    .line 72
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->replyMessageId:Ljava/lang/String;

    .line 73
    .line 74
    if-nez v0, :cond_8

    .line 75
    .line 76
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->replyMessageId:Ljava/lang/String;

    .line 77
    .line 78
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->userIds:Ljava/util/List;

    .line 79
    .line 80
    if-nez v0, :cond_9

    .line 81
    .line 82
    new-instance v0, Ljava/util/ArrayList;

    .line 83
    .line 84
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 85
    .line 86
    .line 87
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->userIds:Ljava/util/List;

    .line 88
    .line 89
    :cond_9
    return-object p0
.end method

.method public bridge synthetic init()Ljava/lang/Object;
    .locals 0

    .line 90
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/MomentActivity$20;->init()Lcom/p1/mobile/putong/feed/data/MomentActivity;

    move-result-object p0

    return-object p0
.end method

.method public read(Landroid/database/Cursor;I)Lcom/p1/mobile/putong/feed/data/MomentActivity;
    .locals 9

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
    new-instance v1, Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 7
    .line 8
    invoke-direct {v1}, Lcom/p1/mobile/putong/feed/data/MomentActivity;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v2, "unknown_"

    .line 12
    .line 13
    const/4 v3, -0x1

    .line 14
    :try_start_0
    new-instance v4, Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;

    .line 15
    .line 16
    invoke-direct {v4}, Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v4, v1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->reference:Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;

    .line 20
    .line 21
    new-instance v4, Lcom/p1/mobile/putong/feed/data/ActivitySetting;

    .line 22
    .line 23
    invoke-direct {v4}, Lcom/p1/mobile/putong/feed/data/ActivitySetting;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v4, v1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->settings:Lcom/p1/mobile/putong/feed/data/ActivitySetting;

    .line 27
    .line 28
    invoke-interface {p1, p2}, Landroid/database/Cursor;->getLong(I)J

    .line 29
    .line 30
    .line 31
    move-result-wide v4

    .line 32
    iput-wide v4, v1, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 33
    .line 34
    add-int/lit8 v4, p2, 0x1

    .line 35
    .line 36
    invoke-interface {p1, v4}, Landroid/database/Cursor;->isNull(I)Z

    .line 37
    .line 38
    .line 39
    move-result v5

    .line 40
    const/4 v6, 0x0

    .line 41
    if-eqz v5, :cond_1

    .line 42
    .line 43
    move-object v4, v6

    .line 44
    goto :goto_0

    .line 45
    :cond_1
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    :goto_0
    iput-object v4, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 50
    .line 51
    add-int/lit8 v4, p2, 0x2

    .line 52
    .line 53
    invoke-interface {p1, v4}, Landroid/database/Cursor;->isNull(I)Z

    .line 54
    .line 55
    .line 56
    move-result v5

    .line 57
    if-eqz v5, :cond_2

    .line 58
    .line 59
    move-object v4, v6

    .line 60
    goto :goto_1

    .line 61
    :cond_2
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v4

    .line 65
    :goto_1
    iput-object v4, v1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->value:Ljava/lang/String;

    .line 66
    .line 67
    add-int/lit8 v4, p2, 0x3

    .line 68
    .line 69
    invoke-interface {p1, v4}, Landroid/database/Cursor;->isNull(I)Z

    .line 70
    .line 71
    .line 72
    move-result v5

    .line 73
    if-eqz v5, :cond_3

    .line 74
    .line 75
    move-object v4, v6

    .line 76
    goto :goto_2

    .line 77
    :cond_3
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v4

    .line 81
    :goto_2
    iput-object v4, v1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->owner:Ljava/lang/String;

    .line 82
    .line 83
    add-int/lit8 v4, p2, 0x4

    .line 84
    .line 85
    invoke-interface {p1, v4}, Landroid/database/Cursor;->isNull(I)Z

    .line 86
    .line 87
    .line 88
    move-result v5

    .line 89
    if-eqz v5, :cond_4

    .line 90
    .line 91
    move-object v4, v6

    .line 92
    goto :goto_3

    .line 93
    :cond_4
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v4

    .line 97
    :goto_3
    iput-object v4, v1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->actors:Ljava/lang/String;

    .line 98
    .line 99
    add-int/lit8 v4, p2, 0x5

    .line 100
    .line 101
    invoke-interface {p1, v4}, Landroid/database/Cursor;->isNull(I)Z

    .line 102
    .line 103
    .line 104
    move-result v5

    .line 105
    if-eqz v5, :cond_5

    .line 106
    .line 107
    goto :goto_4

    .line 108
    :cond_5
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getInt(I)I

    .line 109
    .line 110
    .line 111
    move-result v3

    .line 112
    :goto_4
    add-int/lit8 v4, p2, 0x6

    .line 113
    .line 114
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getInt(I)I

    .line 115
    .line 116
    .line 117
    move-result v4

    .line 118
    const/4 v5, 0x1

    .line 119
    if-ne v4, v5, :cond_6

    .line 120
    .line 121
    move v4, v5

    .line 122
    goto :goto_5

    .line 123
    :cond_6
    move v4, v0

    .line 124
    :goto_5
    iput-boolean v4, v1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->read:Z

    .line 125
    .line 126
    add-int/lit8 v4, p2, 0x7

    .line 127
    .line 128
    iget-object v7, v1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->reference:Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;

    .line 129
    .line 130
    invoke-interface {p1, v4}, Landroid/database/Cursor;->isNull(I)Z

    .line 131
    .line 132
    .line 133
    move-result v8

    .line 134
    if-eqz v8, :cond_7

    .line 135
    .line 136
    move-object v4, v6

    .line 137
    goto :goto_6

    .line 138
    :cond_7
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v4

    .line 142
    :goto_6
    iput-object v4, v7, Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;->id:Ljava/lang/String;

    .line 143
    .line 144
    add-int/lit8 v4, p2, 0x8

    .line 145
    .line 146
    iget-object v7, v1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->reference:Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;

    .line 147
    .line 148
    invoke-interface {p1, v4}, Landroid/database/Cursor;->isNull(I)Z

    .line 149
    .line 150
    .line 151
    move-result v8

    .line 152
    if-eqz v8, :cond_8

    .line 153
    .line 154
    move-object v4, v6

    .line 155
    goto :goto_7

    .line 156
    :cond_8
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object v4

    .line 160
    :goto_7
    iput-object v4, v7, Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;->type:Ljava/lang/String;

    .line 161
    .line 162
    add-int/lit8 v4, p2, 0x9

    .line 163
    .line 164
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getDouble(I)D

    .line 165
    .line 166
    .line 167
    move-result-wide v7

    .line 168
    iput-wide v7, v1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->createdTime:D

    .line 169
    .line 170
    add-int/lit8 v4, p2, 0xa

    .line 171
    .line 172
    invoke-interface {p1, v4}, Landroid/database/Cursor;->isNull(I)Z

    .line 173
    .line 174
    .line 175
    move-result v7

    .line 176
    if-eqz v7, :cond_9

    .line 177
    .line 178
    move-object v4, v6

    .line 179
    goto :goto_8

    .line 180
    :cond_9
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object v4

    .line 184
    :goto_8
    iput-object v4, v1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->messageid:Ljava/lang/String;

    .line 185
    .line 186
    add-int/lit8 v4, p2, 0xb

    .line 187
    .line 188
    iget-object v7, v1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->settings:Lcom/p1/mobile/putong/feed/data/ActivitySetting;

    .line 189
    .line 190
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getInt(I)I

    .line 191
    .line 192
    .line 193
    move-result v4

    .line 194
    if-ne v4, v5, :cond_a

    .line 195
    .line 196
    move v4, v5

    .line 197
    goto :goto_9

    .line 198
    :cond_a
    move v4, v0

    .line 199
    :goto_9
    iput-boolean v4, v7, Lcom/p1/mobile/putong/feed/data/ActivitySetting;->anonymous:Z

    .line 200
    .line 201
    add-int/lit8 v4, p2, 0xc

    .line 202
    .line 203
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getInt(I)I

    .line 204
    .line 205
    .line 206
    move-result v4

    .line 207
    if-ne v4, v5, :cond_b

    .line 208
    .line 209
    move v0, v5

    .line 210
    :cond_b
    iput-boolean v0, v1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->acceptGift:Z

    .line 211
    .line 212
    add-int/lit8 v0, p2, 0xd

    .line 213
    .line 214
    invoke-interface {p1, v0}, Landroid/database/Cursor;->isNull(I)Z

    .line 215
    .line 216
    .line 217
    move-result v4

    .line 218
    if-eqz v4, :cond_c

    .line 219
    .line 220
    move-object v2, v6

    .line 221
    goto :goto_a

    .line 222
    :cond_c
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 223
    .line 224
    .line 225
    move-result-object v0

    .line 226
    move-object v2, v0

    .line 227
    :goto_a
    add-int/lit8 v0, p2, 0xe

    .line 228
    .line 229
    invoke-interface {p1, v0}, Landroid/database/Cursor;->isNull(I)Z

    .line 230
    .line 231
    .line 232
    move-result v4

    .line 233
    if-eqz v4, :cond_d

    .line 234
    .line 235
    move-object v0, v6

    .line 236
    goto :goto_b

    .line 237
    :cond_d
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 238
    .line 239
    .line 240
    move-result-object v0

    .line 241
    :goto_b
    iput-object v0, v1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->parentMessageid:Ljava/lang/String;

    .line 242
    .line 243
    add-int/lit8 v0, p2, 0xf

    .line 244
    .line 245
    invoke-interface {p1, v0}, Landroid/database/Cursor;->isNull(I)Z

    .line 246
    .line 247
    .line 248
    move-result v4

    .line 249
    if-eqz v4, :cond_e

    .line 250
    .line 251
    move-object v0, v6

    .line 252
    goto :goto_c

    .line 253
    :cond_e
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 254
    .line 255
    .line 256
    move-result-object v0

    .line 257
    :goto_c
    iput-object v0, v1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->replyMessageId:Ljava/lang/String;

    .line 258
    .line 259
    add-int/lit8 v0, p2, 0x10

    .line 260
    .line 261
    invoke-interface {p1, v0}, Landroid/database/Cursor;->isNull(I)Z

    .line 262
    .line 263
    .line 264
    move-result v4

    .line 265
    if-eqz v4, :cond_f

    .line 266
    .line 267
    goto :goto_d

    .line 268
    :cond_f
    sget-object v4, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 269
    .line 270
    invoke-virtual {v4}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 271
    .line 272
    .line 273
    move-result-object v4

    .line 274
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getBlob(I)[B

    .line 275
    .line 276
    .line 277
    move-result-object v0

    .line 278
    invoke-virtual {v4, v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 279
    .line 280
    .line 281
    move-result-object v0

    .line 282
    move-object v6, v0

    .line 283
    check-cast v6, Ljava/util/List;

    .line 284
    .line 285
    :goto_d
    iput-object v6, v1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->userIds:Ljava/util/List;

    .line 286
    .line 287
    add-int/lit8 v0, p2, 0x11

    .line 288
    .line 289
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 290
    .line 291
    .line 292
    move-result v0

    .line 293
    iput v0, v1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->count:I

    .line 294
    .line 295
    add-int/lit8 p2, p2, 0x12

    .line 296
    .line 297
    iput p2, p0, Ll/vzf0;->readIndex:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 298
    .line 299
    goto :goto_e

    .line 300
    :catch_0
    move-exception p0

    .line 301
    invoke-static {p0, p1}, Lcom/google/protobuf/nano/MessageNano;->reportError(Ljava/lang/Exception;Landroid/database/Cursor;)V

    .line 302
    .line 303
    .line 304
    :goto_e
    sget-object p0, Lcom/p1/mobile/putong/feed/data/ActivityActionApi;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 305
    .line 306
    invoke-virtual {p0, v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 307
    .line 308
    .line 309
    move-result-object p1

    .line 310
    check-cast p1, Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    .line 311
    .line 312
    iput-object p1, v1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->action:Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    .line 313
    .line 314
    iget-object p2, v1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->value:Ljava/lang/String;

    .line 315
    .line 316
    const-string v0, ""

    .line 317
    .line 318
    if-nez p2, :cond_10

    .line 319
    .line 320
    iput-object v0, v1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->value:Ljava/lang/String;

    .line 321
    .line 322
    :cond_10
    iget-object p2, v1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->owner:Ljava/lang/String;

    .line 323
    .line 324
    if-nez p2, :cond_11

    .line 325
    .line 326
    iput-object v0, v1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->owner:Ljava/lang/String;

    .line 327
    .line 328
    :cond_11
    iget-object p2, v1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->actors:Ljava/lang/String;

    .line 329
    .line 330
    if-nez p2, :cond_12

    .line 331
    .line 332
    iput-object v0, v1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->actors:Ljava/lang/String;

    .line 333
    .line 334
    :cond_12
    if-nez p1, :cond_13

    .line 335
    .line 336
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 337
    .line 338
    .line 339
    move-result-object p0

    .line 340
    check-cast p0, Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    .line 341
    .line 342
    iput-object p0, v1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->action:Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    .line 343
    .line 344
    :cond_13
    iget-object p0, v1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->reference:Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;

    .line 345
    .line 346
    if-nez p0, :cond_14

    .line 347
    .line 348
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;->new_()Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;

    .line 349
    .line 350
    .line 351
    move-result-object p0

    .line 352
    iput-object p0, v1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->reference:Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;

    .line 353
    .line 354
    :cond_14
    iget-object p0, v1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->messageid:Ljava/lang/String;

    .line 355
    .line 356
    if-nez p0, :cond_15

    .line 357
    .line 358
    iput-object v0, v1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->messageid:Ljava/lang/String;

    .line 359
    .line 360
    :cond_15
    iget-object p0, v1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->settings:Lcom/p1/mobile/putong/feed/data/ActivitySetting;

    .line 361
    .line 362
    if-nez p0, :cond_16

    .line 363
    .line 364
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/ActivitySetting;->new_()Lcom/p1/mobile/putong/feed/data/ActivitySetting;

    .line 365
    .line 366
    .line 367
    move-result-object p0

    .line 368
    iput-object p0, v1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->settings:Lcom/p1/mobile/putong/feed/data/ActivitySetting;

    .line 369
    .line 370
    :cond_16
    iget-object p0, v1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->parentMessageid:Ljava/lang/String;

    .line 371
    .line 372
    if-nez p0, :cond_17

    .line 373
    .line 374
    iput-object v0, v1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->parentMessageid:Ljava/lang/String;

    .line 375
    .line 376
    :cond_17
    iget-object p0, v1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->replyMessageId:Ljava/lang/String;

    .line 377
    .line 378
    if-nez p0, :cond_18

    .line 379
    .line 380
    iput-object v0, v1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->replyMessageId:Ljava/lang/String;

    .line 381
    .line 382
    :cond_18
    iget-object p0, v1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->userIds:Ljava/util/List;

    .line 383
    .line 384
    if-nez p0, :cond_19

    .line 385
    .line 386
    new-instance p0, Ljava/util/ArrayList;

    .line 387
    .line 388
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 389
    .line 390
    .line 391
    iput-object p0, v1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->userIds:Ljava/util/List;

    .line 392
    .line 393
    :cond_19
    return-object v1
.end method

.method public bridge synthetic read(Landroid/database/Cursor;I)Ljava/lang/Object;
    .locals 0

    .line 394
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/data/MomentActivity$20;->read(Landroid/database/Cursor;I)Lcom/p1/mobile/putong/feed/data/MomentActivity;

    move-result-object p0

    return-object p0
.end method

.method public write(Lcom/p1/mobile/putong/feed/data/MomentActivity;Landroid/content/ContentValues;)V
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
    const-string v0, "value_c"

    .line 10
    .line 11
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->value:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "owner_c"

    .line 17
    .line 18
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->owner:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    const-string v0, "actors_c"

    .line 24
    .line 25
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->actors:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    const-string v0, "str_action_c"

    .line 31
    .line 32
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->action:Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    .line 33
    .line 34
    if-nez v1, :cond_0

    .line 35
    .line 36
    move-object v1, p0

    .line 37
    goto :goto_0

    .line 38
    :cond_0
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    :goto_0
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    const-string v0, "action_c"

    .line 46
    .line 47
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->action:Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    .line 48
    .line 49
    if-nez v1, :cond_1

    .line 50
    .line 51
    move-object v1, p0

    .line 52
    goto :goto_1

    .line 53
    :cond_1
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    :goto_1
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 62
    .line 63
    .line 64
    const-string v0, "read_c"

    .line 65
    .line 66
    iget-boolean v1, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->read:Z

    .line 67
    .line 68
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 73
    .line 74
    .line 75
    const-string v0, "reference_id_c"

    .line 76
    .line 77
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->reference:Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;

    .line 78
    .line 79
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;->id:Ljava/lang/String;

    .line 80
    .line 81
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    const-string v0, "reference_type_c"

    .line 85
    .line 86
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->reference:Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;

    .line 87
    .line 88
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;->type:Ljava/lang/String;

    .line 89
    .line 90
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    const-string v0, "createdTime_c"

    .line 94
    .line 95
    iget-wide v1, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->createdTime:D

    .line 96
    .line 97
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Double;)V

    .line 102
    .line 103
    .line 104
    const-string v0, "messageid_c"

    .line 105
    .line 106
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->messageid:Ljava/lang/String;

    .line 107
    .line 108
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    const-string v0, "settings_anonymous_c"

    .line 112
    .line 113
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->settings:Lcom/p1/mobile/putong/feed/data/ActivitySetting;

    .line 114
    .line 115
    iget-boolean v1, v1, Lcom/p1/mobile/putong/feed/data/ActivitySetting;->anonymous:Z

    .line 116
    .line 117
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 122
    .line 123
    .line 124
    const-string v0, "acceptGift_c"

    .line 125
    .line 126
    iget-boolean v1, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->acceptGift:Z

    .line 127
    .line 128
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 133
    .line 134
    .line 135
    const-string v0, "parentMessageid_c"

    .line 136
    .line 137
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->parentMessageid:Ljava/lang/String;

    .line 138
    .line 139
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    const-string v0, "replyMessageId_c"

    .line 143
    .line 144
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->replyMessageId:Ljava/lang/String;

    .line 145
    .line 146
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    const-string v0, "userIds_c"

    .line 150
    .line 151
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->userIds:Ljava/util/List;

    .line 152
    .line 153
    if-nez v1, :cond_2

    .line 154
    .line 155
    move-object v1, p0

    .line 156
    goto :goto_2

    .line 157
    :cond_2
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 158
    .line 159
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 160
    .line 161
    .line 162
    move-result-object v1

    .line 163
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->userIds:Ljava/util/List;

    .line 164
    .line 165
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 166
    .line 167
    .line 168
    move-result-object v1

    .line 169
    :goto_2
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 170
    .line 171
    .line 172
    const-string v0, "count_c"

    .line 173
    .line 174
    iget p1, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->count:I

    .line 175
    .line 176
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 177
    .line 178
    .line 179
    move-result-object p1

    .line 180
    invoke-static {p2, v0, p1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 181
    .line 182
    .line 183
    return-void

    .line 184
    :catch_0
    move-exception p1

    .line 185
    invoke-static {p1, p0}, Lcom/google/protobuf/nano/MessageNano;->reportError(Ljava/lang/Exception;Landroid/database/Cursor;)V

    .line 186
    .line 187
    .line 188
    return-void
.end method

.method public bridge synthetic write(Ljava/lang/Object;Landroid/content/ContentValues;)V
    .locals 0

    .line 189
    check-cast p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/data/MomentActivity$20;->write(Lcom/p1/mobile/putong/feed/data/MomentActivity;Landroid/content/ContentValues;)V

    return-void
.end method
