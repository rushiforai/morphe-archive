.class Lcom/p1/mobile/putong/core/data/ChatGroupMember$27;
.super Ll/vzf0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/ChatGroupMember;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/vzf0<",
        "Lcom/p1/mobile/putong/core/data/ChatGroupMember;",
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
    const-string p1, " (_id INTEGER PRIMARY KEY,id_c TEXT,groupId_c TEXT,userId_c TEXT,nickName_c TEXT,userName_c TEXT,nickNamePinyin_c TEXT,avatar_c TEXT,searchIndices_c BLOB,searchCategory_c TEXT,status_c INTEGER,joinTime_c REAL,createdTime_c REAL,updatedTime_c REAL,silence_enable_c INTEGER,silence_duration_c INTEGER,silence_until_c REAL,operationSilence_enable_c INTEGER,operationSilence_duration_c INTEGER,operationSilence_until_c REAL,gender_c INTEGER,str_status_c TEXT,str_gender_c TEXT,inModeration_nickName_c TEXT,inModeration_name_c TEXT,inModeration_description_c TEXT)"

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
    const-class p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    .line 2
    .line 3
    return-object p0
.end method

.method public init()Lcom/p1/mobile/putong/core/data/ChatGroupMember;
    .locals 2

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/ChatGroupMember;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->groupId:Ljava/lang/String;

    .line 7
    .line 8
    const-string v1, ""

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->groupId:Ljava/lang/String;

    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userId:Ljava/lang/String;

    .line 15
    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userId:Ljava/lang/String;

    .line 19
    .line 20
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickName:Ljava/lang/String;

    .line 21
    .line 22
    if-nez v0, :cond_2

    .line 23
    .line 24
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickName:Ljava/lang/String;

    .line 25
    .line 26
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userName:Ljava/lang/String;

    .line 27
    .line 28
    if-nez v0, :cond_3

    .line 29
    .line 30
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userName:Ljava/lang/String;

    .line 31
    .line 32
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickNamePinyin:Ljava/lang/String;

    .line 33
    .line 34
    if-nez v0, :cond_4

    .line 35
    .line 36
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickNamePinyin:Ljava/lang/String;

    .line 37
    .line 38
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->avatar:Ljava/lang/String;

    .line 39
    .line 40
    if-nez v0, :cond_5

    .line 41
    .line 42
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->avatar:Ljava/lang/String;

    .line 43
    .line 44
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->searchIndices:Ljava/util/List;

    .line 45
    .line 46
    if-nez v0, :cond_6

    .line 47
    .line 48
    new-instance v0, Ljava/util/ArrayList;

    .line 49
    .line 50
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 51
    .line 52
    .line 53
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->searchIndices:Ljava/util/List;

    .line 54
    .line 55
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->searchCategory:Ljava/lang/String;

    .line 56
    .line 57
    if-nez v0, :cond_7

    .line 58
    .line 59
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->searchCategory:Ljava/lang/String;

    .line 60
    .line 61
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->status:Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;

    .line 62
    .line 63
    if-nez v0, :cond_8

    .line 64
    .line 65
    sget-object v0, Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 66
    .line 67
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    check-cast v0, Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;

    .line 72
    .line 73
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->status:Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;

    .line 74
    .line 75
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 76
    .line 77
    if-nez v0, :cond_9

    .line 78
    .line 79
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->new_()Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 84
    .line 85
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->operationSilence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 86
    .line 87
    if-nez v0, :cond_a

    .line 88
    .line 89
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->new_()Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->operationSilence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 94
    .line 95
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 96
    .line 97
    if-nez v0, :cond_b

    .line 98
    .line 99
    sget-object v0, Lcom/p1/mobile/putong/data/Gender;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 100
    .line 101
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    check-cast v0, Lcom/p1/mobile/putong/data/Gender;

    .line 106
    .line 107
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 108
    .line 109
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    .line 110
    .line 111
    if-nez v0, :cond_c

    .line 112
    .line 113
    invoke-static {}, Lcom/p1/mobile/putong/core/data/InModeration;->new_()Lcom/p1/mobile/putong/core/data/InModeration;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    .line 118
    .line 119
    :cond_c
    return-object p0
.end method

.method public bridge synthetic init()Ljava/lang/Object;
    .locals 0

    .line 120
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ChatGroupMember$27;->init()Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    move-result-object p0

    return-object p0
.end method

.method public read(Landroid/database/Cursor;I)Lcom/p1/mobile/putong/core/data/ChatGroupMember;
    .locals 11

    .line 1
    const-string v0, "unknown_"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez p2, :cond_0

    .line 5
    .line 6
    iput v1, p0, Ll/vzf0;->readIndex:I

    .line 7
    .line 8
    :cond_0
    new-instance v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    .line 9
    .line 10
    invoke-direct {v2}, Lcom/p1/mobile/putong/core/data/ChatGroupMember;-><init>()V

    .line 11
    .line 12
    .line 13
    const/4 v3, -0x1

    .line 14
    :try_start_0
    new-instance v4, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 15
    .line 16
    invoke-direct {v4}, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v4, v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 20
    .line 21
    new-instance v4, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 22
    .line 23
    invoke-direct {v4}, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v4, v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->operationSilence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 27
    .line 28
    new-instance v4, Lcom/p1/mobile/putong/core/data/InModeration;

    .line 29
    .line 30
    invoke-direct {v4}, Lcom/p1/mobile/putong/core/data/InModeration;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object v4, v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    .line 34
    .line 35
    invoke-interface {p1, p2}, Landroid/database/Cursor;->getLong(I)J

    .line 36
    .line 37
    .line 38
    move-result-wide v4

    .line 39
    iput-wide v4, v2, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 40
    .line 41
    add-int/lit8 v4, p2, 0x1

    .line 42
    .line 43
    invoke-interface {p1, v4}, Landroid/database/Cursor;->isNull(I)Z

    .line 44
    .line 45
    .line 46
    move-result v5

    .line 47
    const/4 v6, 0x0

    .line 48
    if-eqz v5, :cond_1

    .line 49
    .line 50
    move-object v4, v6

    .line 51
    goto :goto_0

    .line 52
    :cond_1
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v4

    .line 56
    :goto_0
    iput-object v4, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 57
    .line 58
    add-int/lit8 v4, p2, 0x2

    .line 59
    .line 60
    invoke-interface {p1, v4}, Landroid/database/Cursor;->isNull(I)Z

    .line 61
    .line 62
    .line 63
    move-result v5

    .line 64
    if-eqz v5, :cond_2

    .line 65
    .line 66
    move-object v4, v6

    .line 67
    goto :goto_1

    .line 68
    :cond_2
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v4

    .line 72
    :goto_1
    iput-object v4, v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->groupId:Ljava/lang/String;

    .line 73
    .line 74
    add-int/lit8 v4, p2, 0x3

    .line 75
    .line 76
    invoke-interface {p1, v4}, Landroid/database/Cursor;->isNull(I)Z

    .line 77
    .line 78
    .line 79
    move-result v5

    .line 80
    if-eqz v5, :cond_3

    .line 81
    .line 82
    move-object v4, v6

    .line 83
    goto :goto_2

    .line 84
    :cond_3
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v4

    .line 88
    :goto_2
    iput-object v4, v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userId:Ljava/lang/String;

    .line 89
    .line 90
    add-int/lit8 v4, p2, 0x4

    .line 91
    .line 92
    invoke-interface {p1, v4}, Landroid/database/Cursor;->isNull(I)Z

    .line 93
    .line 94
    .line 95
    move-result v5

    .line 96
    if-eqz v5, :cond_4

    .line 97
    .line 98
    move-object v4, v6

    .line 99
    goto :goto_3

    .line 100
    :cond_4
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v4

    .line 104
    :goto_3
    iput-object v4, v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickName:Ljava/lang/String;

    .line 105
    .line 106
    add-int/lit8 v4, p2, 0x5

    .line 107
    .line 108
    invoke-interface {p1, v4}, Landroid/database/Cursor;->isNull(I)Z

    .line 109
    .line 110
    .line 111
    move-result v5

    .line 112
    if-eqz v5, :cond_5

    .line 113
    .line 114
    move-object v4, v6

    .line 115
    goto :goto_4

    .line 116
    :cond_5
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v4

    .line 120
    :goto_4
    iput-object v4, v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userName:Ljava/lang/String;

    .line 121
    .line 122
    add-int/lit8 v4, p2, 0x6

    .line 123
    .line 124
    invoke-interface {p1, v4}, Landroid/database/Cursor;->isNull(I)Z

    .line 125
    .line 126
    .line 127
    move-result v5

    .line 128
    if-eqz v5, :cond_6

    .line 129
    .line 130
    move-object v4, v6

    .line 131
    goto :goto_5

    .line 132
    :cond_6
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v4

    .line 136
    :goto_5
    iput-object v4, v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickNamePinyin:Ljava/lang/String;

    .line 137
    .line 138
    add-int/lit8 v4, p2, 0x7

    .line 139
    .line 140
    invoke-interface {p1, v4}, Landroid/database/Cursor;->isNull(I)Z

    .line 141
    .line 142
    .line 143
    move-result v5

    .line 144
    if-eqz v5, :cond_7

    .line 145
    .line 146
    move-object v4, v6

    .line 147
    goto :goto_6

    .line 148
    :cond_7
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v4

    .line 152
    :goto_6
    iput-object v4, v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->avatar:Ljava/lang/String;

    .line 153
    .line 154
    add-int/lit8 v4, p2, 0x8

    .line 155
    .line 156
    invoke-interface {p1, v4}, Landroid/database/Cursor;->isNull(I)Z

    .line 157
    .line 158
    .line 159
    move-result v5

    .line 160
    if-eqz v5, :cond_8

    .line 161
    .line 162
    move-object v4, v6

    .line 163
    goto :goto_7

    .line 164
    :cond_8
    sget-object v5, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 165
    .line 166
    invoke-virtual {v5}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 167
    .line 168
    .line 169
    move-result-object v5

    .line 170
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getBlob(I)[B

    .line 171
    .line 172
    .line 173
    move-result-object v4

    .line 174
    invoke-virtual {v5, v4}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 175
    .line 176
    .line 177
    move-result-object v4

    .line 178
    check-cast v4, Ljava/util/List;

    .line 179
    .line 180
    :goto_7
    iput-object v4, v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->searchIndices:Ljava/util/List;

    .line 181
    .line 182
    add-int/lit8 v4, p2, 0x9

    .line 183
    .line 184
    invoke-interface {p1, v4}, Landroid/database/Cursor;->isNull(I)Z

    .line 185
    .line 186
    .line 187
    move-result v5

    .line 188
    if-eqz v5, :cond_9

    .line 189
    .line 190
    move-object v4, v6

    .line 191
    goto :goto_8

    .line 192
    :cond_9
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object v4

    .line 196
    :goto_8
    iput-object v4, v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->searchCategory:Ljava/lang/String;

    .line 197
    .line 198
    add-int/lit8 v4, p2, 0xa

    .line 199
    .line 200
    invoke-interface {p1, v4}, Landroid/database/Cursor;->isNull(I)Z

    .line 201
    .line 202
    .line 203
    move-result v5

    .line 204
    if-eqz v5, :cond_a

    .line 205
    .line 206
    move v4, v3

    .line 207
    goto :goto_9

    .line 208
    :cond_a
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getInt(I)I

    .line 209
    .line 210
    .line 211
    move-result v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    .line 212
    :goto_9
    add-int/lit8 v5, p2, 0xb

    .line 213
    .line 214
    :try_start_1
    invoke-interface {p1, v5}, Landroid/database/Cursor;->getDouble(I)D

    .line 215
    .line 216
    .line 217
    move-result-wide v7

    .line 218
    iput-wide v7, v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->joinTime:D

    .line 219
    .line 220
    add-int/lit8 v5, p2, 0xc

    .line 221
    .line 222
    invoke-interface {p1, v5}, Landroid/database/Cursor;->getDouble(I)D

    .line 223
    .line 224
    .line 225
    move-result-wide v7

    .line 226
    iput-wide v7, v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->createdTime:D

    .line 227
    .line 228
    add-int/lit8 v5, p2, 0xd

    .line 229
    .line 230
    invoke-interface {p1, v5}, Landroid/database/Cursor;->getDouble(I)D

    .line 231
    .line 232
    .line 233
    move-result-wide v7

    .line 234
    iput-wide v7, v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->updatedTime:D

    .line 235
    .line 236
    add-int/lit8 v5, p2, 0xe

    .line 237
    .line 238
    iget-object v7, v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 239
    .line 240
    invoke-interface {p1, v5}, Landroid/database/Cursor;->getInt(I)I

    .line 241
    .line 242
    .line 243
    move-result v5

    .line 244
    const/4 v8, 0x1

    .line 245
    if-ne v5, v8, :cond_b

    .line 246
    .line 247
    move v5, v8

    .line 248
    goto :goto_a

    .line 249
    :cond_b
    move v5, v1

    .line 250
    :goto_a
    iput-boolean v5, v7, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->enable:Z

    .line 251
    .line 252
    add-int/lit8 v5, p2, 0xf

    .line 253
    .line 254
    iget-object v7, v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 255
    .line 256
    invoke-interface {p1, v5}, Landroid/database/Cursor;->getLong(I)J

    .line 257
    .line 258
    .line 259
    move-result-wide v9

    .line 260
    iput-wide v9, v7, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->duration:J

    .line 261
    .line 262
    add-int/lit8 v5, p2, 0x10

    .line 263
    .line 264
    iget-object v7, v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 265
    .line 266
    invoke-interface {p1, v5}, Landroid/database/Cursor;->getDouble(I)D

    .line 267
    .line 268
    .line 269
    move-result-wide v9

    .line 270
    iput-wide v9, v7, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->until:D

    .line 271
    .line 272
    add-int/lit8 v5, p2, 0x11

    .line 273
    .line 274
    iget-object v7, v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->operationSilence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 275
    .line 276
    invoke-interface {p1, v5}, Landroid/database/Cursor;->getInt(I)I

    .line 277
    .line 278
    .line 279
    move-result v5

    .line 280
    if-ne v5, v8, :cond_c

    .line 281
    .line 282
    move v1, v8

    .line 283
    :cond_c
    iput-boolean v1, v7, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->enable:Z

    .line 284
    .line 285
    add-int/lit8 v1, p2, 0x12

    .line 286
    .line 287
    iget-object v5, v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->operationSilence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 288
    .line 289
    invoke-interface {p1, v1}, Landroid/database/Cursor;->getLong(I)J

    .line 290
    .line 291
    .line 292
    move-result-wide v7

    .line 293
    iput-wide v7, v5, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->duration:J

    .line 294
    .line 295
    add-int/lit8 v1, p2, 0x13

    .line 296
    .line 297
    iget-object v5, v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->operationSilence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 298
    .line 299
    invoke-interface {p1, v1}, Landroid/database/Cursor;->getDouble(I)D

    .line 300
    .line 301
    .line 302
    move-result-wide v7

    .line 303
    iput-wide v7, v5, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->until:D

    .line 304
    .line 305
    add-int/lit8 v1, p2, 0x14

    .line 306
    .line 307
    invoke-interface {p1, v1}, Landroid/database/Cursor;->isNull(I)Z

    .line 308
    .line 309
    .line 310
    move-result v5

    .line 311
    if-eqz v5, :cond_d

    .line 312
    .line 313
    goto :goto_b

    .line 314
    :cond_d
    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    .line 315
    .line 316
    .line 317
    move-result v3

    .line 318
    :goto_b
    add-int/lit8 v1, p2, 0x15

    .line 319
    .line 320
    invoke-interface {p1, v1}, Landroid/database/Cursor;->isNull(I)Z

    .line 321
    .line 322
    .line 323
    move-result v5

    .line 324
    if-eqz v5, :cond_e

    .line 325
    .line 326
    move-object v1, v6

    .line 327
    goto :goto_c

    .line 328
    :cond_e
    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 329
    .line 330
    .line 331
    move-result-object v1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 332
    :goto_c
    add-int/lit8 v5, p2, 0x16

    .line 333
    .line 334
    :try_start_2
    invoke-interface {p1, v5}, Landroid/database/Cursor;->isNull(I)Z

    .line 335
    .line 336
    .line 337
    move-result v7

    .line 338
    if-eqz v7, :cond_f

    .line 339
    .line 340
    move-object v0, v6

    .line 341
    goto :goto_d

    .line 342
    :cond_f
    invoke-interface {p1, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 343
    .line 344
    .line 345
    move-result-object v0

    .line 346
    :goto_d
    add-int/lit8 v5, p2, 0x17

    .line 347
    .line 348
    iget-object v7, v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    .line 349
    .line 350
    invoke-interface {p1, v5}, Landroid/database/Cursor;->isNull(I)Z

    .line 351
    .line 352
    .line 353
    move-result v8

    .line 354
    if-eqz v8, :cond_10

    .line 355
    .line 356
    move-object v5, v6

    .line 357
    goto :goto_e

    .line 358
    :cond_10
    invoke-interface {p1, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 359
    .line 360
    .line 361
    move-result-object v5

    .line 362
    :goto_e
    iput-object v5, v7, Lcom/p1/mobile/putong/core/data/InModeration;->nickName:Ljava/lang/String;

    .line 363
    .line 364
    add-int/lit8 v5, p2, 0x18

    .line 365
    .line 366
    iget-object v7, v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    .line 367
    .line 368
    invoke-interface {p1, v5}, Landroid/database/Cursor;->isNull(I)Z

    .line 369
    .line 370
    .line 371
    move-result v8

    .line 372
    if-eqz v8, :cond_11

    .line 373
    .line 374
    move-object v5, v6

    .line 375
    goto :goto_f

    .line 376
    :cond_11
    invoke-interface {p1, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 377
    .line 378
    .line 379
    move-result-object v5

    .line 380
    :goto_f
    iput-object v5, v7, Lcom/p1/mobile/putong/core/data/InModeration;->name:Ljava/lang/String;

    .line 381
    .line 382
    add-int/lit8 v5, p2, 0x19

    .line 383
    .line 384
    iget-object v7, v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    .line 385
    .line 386
    invoke-interface {p1, v5}, Landroid/database/Cursor;->isNull(I)Z

    .line 387
    .line 388
    .line 389
    move-result v8

    .line 390
    if-eqz v8, :cond_12

    .line 391
    .line 392
    goto :goto_10

    .line 393
    :cond_12
    invoke-interface {p1, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 394
    .line 395
    .line 396
    move-result-object v6

    .line 397
    :goto_10
    iput-object v6, v7, Lcom/p1/mobile/putong/core/data/InModeration;->description:Ljava/lang/String;

    .line 398
    .line 399
    add-int/lit8 p2, p2, 0x1a

    .line 400
    .line 401
    iput p2, p0, Ll/vzf0;->readIndex:I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 402
    .line 403
    goto :goto_13

    .line 404
    :catch_0
    move-exception p0

    .line 405
    move-object p2, v0

    .line 406
    move-object v0, v1

    .line 407
    :goto_11
    move v1, v3

    .line 408
    move v3, v4

    .line 409
    goto :goto_12

    .line 410
    :catch_1
    move-exception p0

    .line 411
    move-object p2, v0

    .line 412
    goto :goto_11

    .line 413
    :catch_2
    move-exception p0

    .line 414
    move-object p2, v0

    .line 415
    move v1, v3

    .line 416
    :goto_12
    invoke-static {p0, p1}, Lcom/google/protobuf/nano/MessageNano;->reportError(Ljava/lang/Exception;Landroid/database/Cursor;)V

    .line 417
    .line 418
    .line 419
    move v4, v3

    .line 420
    move v3, v1

    .line 421
    move-object v1, v0

    .line 422
    move-object v0, p2

    .line 423
    :goto_13
    sget-object p0, Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 424
    .line 425
    invoke-virtual {p0, v1, v4}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 426
    .line 427
    .line 428
    move-result-object p1

    .line 429
    check-cast p1, Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;

    .line 430
    .line 431
    iput-object p1, v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->status:Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;

    .line 432
    .line 433
    sget-object p1, Lcom/p1/mobile/putong/data/Gender;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 434
    .line 435
    invoke-virtual {p1, v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 436
    .line 437
    .line 438
    move-result-object p2

    .line 439
    check-cast p2, Lcom/p1/mobile/putong/data/Gender;

    .line 440
    .line 441
    iput-object p2, v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 442
    .line 443
    iget-object p2, v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->groupId:Ljava/lang/String;

    .line 444
    .line 445
    const-string v0, ""

    .line 446
    .line 447
    if-nez p2, :cond_13

    .line 448
    .line 449
    iput-object v0, v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->groupId:Ljava/lang/String;

    .line 450
    .line 451
    :cond_13
    iget-object p2, v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userId:Ljava/lang/String;

    .line 452
    .line 453
    if-nez p2, :cond_14

    .line 454
    .line 455
    iput-object v0, v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userId:Ljava/lang/String;

    .line 456
    .line 457
    :cond_14
    iget-object p2, v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickName:Ljava/lang/String;

    .line 458
    .line 459
    if-nez p2, :cond_15

    .line 460
    .line 461
    iput-object v0, v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickName:Ljava/lang/String;

    .line 462
    .line 463
    :cond_15
    iget-object p2, v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userName:Ljava/lang/String;

    .line 464
    .line 465
    if-nez p2, :cond_16

    .line 466
    .line 467
    iput-object v0, v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userName:Ljava/lang/String;

    .line 468
    .line 469
    :cond_16
    iget-object p2, v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickNamePinyin:Ljava/lang/String;

    .line 470
    .line 471
    if-nez p2, :cond_17

    .line 472
    .line 473
    iput-object v0, v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickNamePinyin:Ljava/lang/String;

    .line 474
    .line 475
    :cond_17
    iget-object p2, v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->avatar:Ljava/lang/String;

    .line 476
    .line 477
    if-nez p2, :cond_18

    .line 478
    .line 479
    iput-object v0, v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->avatar:Ljava/lang/String;

    .line 480
    .line 481
    :cond_18
    iget-object p2, v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->searchIndices:Ljava/util/List;

    .line 482
    .line 483
    if-nez p2, :cond_19

    .line 484
    .line 485
    new-instance p2, Ljava/util/ArrayList;

    .line 486
    .line 487
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 488
    .line 489
    .line 490
    iput-object p2, v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->searchIndices:Ljava/util/List;

    .line 491
    .line 492
    :cond_19
    iget-object p2, v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->searchCategory:Ljava/lang/String;

    .line 493
    .line 494
    if-nez p2, :cond_1a

    .line 495
    .line 496
    iput-object v0, v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->searchCategory:Ljava/lang/String;

    .line 497
    .line 498
    :cond_1a
    iget-object p2, v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->status:Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;

    .line 499
    .line 500
    if-nez p2, :cond_1b

    .line 501
    .line 502
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 503
    .line 504
    .line 505
    move-result-object p0

    .line 506
    check-cast p0, Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;

    .line 507
    .line 508
    iput-object p0, v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->status:Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;

    .line 509
    .line 510
    :cond_1b
    iget-object p0, v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 511
    .line 512
    if-nez p0, :cond_1c

    .line 513
    .line 514
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->new_()Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 515
    .line 516
    .line 517
    move-result-object p0

    .line 518
    iput-object p0, v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 519
    .line 520
    :cond_1c
    iget-object p0, v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->operationSilence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 521
    .line 522
    if-nez p0, :cond_1d

    .line 523
    .line 524
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->new_()Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 525
    .line 526
    .line 527
    move-result-object p0

    .line 528
    iput-object p0, v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->operationSilence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 529
    .line 530
    :cond_1d
    iget-object p0, v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 531
    .line 532
    if-nez p0, :cond_1e

    .line 533
    .line 534
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 535
    .line 536
    .line 537
    move-result-object p0

    .line 538
    check-cast p0, Lcom/p1/mobile/putong/data/Gender;

    .line 539
    .line 540
    iput-object p0, v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 541
    .line 542
    :cond_1e
    iget-object p0, v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    .line 543
    .line 544
    if-nez p0, :cond_1f

    .line 545
    .line 546
    invoke-static {}, Lcom/p1/mobile/putong/core/data/InModeration;->new_()Lcom/p1/mobile/putong/core/data/InModeration;

    .line 547
    .line 548
    .line 549
    move-result-object p0

    .line 550
    iput-object p0, v2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    .line 551
    .line 552
    :cond_1f
    return-object v2
.end method

.method public bridge synthetic read(Landroid/database/Cursor;I)Ljava/lang/Object;
    .locals 0

    .line 553
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/ChatGroupMember$27;->read(Landroid/database/Cursor;I)Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    move-result-object p0

    return-object p0
.end method

.method public write(Lcom/p1/mobile/putong/core/data/ChatGroupMember;Landroid/content/ContentValues;)V
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
    const-string v0, "groupId_c"

    .line 10
    .line 11
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->groupId:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "userId_c"

    .line 17
    .line 18
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userId:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    const-string v0, "nickName_c"

    .line 24
    .line 25
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickName:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    const-string v0, "userName_c"

    .line 31
    .line 32
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userName:Ljava/lang/String;

    .line 33
    .line 34
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    const-string v0, "nickNamePinyin_c"

    .line 38
    .line 39
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickNamePinyin:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    const-string v0, "avatar_c"

    .line 45
    .line 46
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->avatar:Ljava/lang/String;

    .line 47
    .line 48
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    const-string v0, "searchIndices_c"

    .line 52
    .line 53
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->searchIndices:Ljava/util/List;

    .line 54
    .line 55
    if-nez v1, :cond_0

    .line 56
    .line 57
    move-object v1, p0

    .line 58
    goto :goto_0

    .line 59
    :cond_0
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 60
    .line 61
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->searchIndices:Ljava/util/List;

    .line 66
    .line 67
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    :goto_0
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 72
    .line 73
    .line 74
    const-string v0, "searchCategory_c"

    .line 75
    .line 76
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->searchCategory:Ljava/lang/String;

    .line 77
    .line 78
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    const-string v0, "str_status_c"

    .line 82
    .line 83
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->status:Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;

    .line 84
    .line 85
    if-nez v1, :cond_1

    .line 86
    .line 87
    move-object v1, p0

    .line 88
    goto :goto_1

    .line 89
    :cond_1
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    :goto_1
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    const-string v0, "status_c"

    .line 97
    .line 98
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->status:Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;

    .line 99
    .line 100
    if-nez v1, :cond_2

    .line 101
    .line 102
    move-object v1, p0

    .line 103
    goto :goto_2

    .line 104
    :cond_2
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    :goto_2
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 113
    .line 114
    .line 115
    const-string v0, "joinTime_c"

    .line 116
    .line 117
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->joinTime:D

    .line 118
    .line 119
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Double;)V

    .line 124
    .line 125
    .line 126
    const-string v0, "createdTime_c"

    .line 127
    .line 128
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->createdTime:D

    .line 129
    .line 130
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Double;)V

    .line 135
    .line 136
    .line 137
    const-string v0, "updatedTime_c"

    .line 138
    .line 139
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->updatedTime:D

    .line 140
    .line 141
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 142
    .line 143
    .line 144
    move-result-object v1

    .line 145
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Double;)V

    .line 146
    .line 147
    .line 148
    const-string v0, "silence_enable_c"

    .line 149
    .line 150
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 151
    .line 152
    iget-boolean v1, v1, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->enable:Z

    .line 153
    .line 154
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 155
    .line 156
    .line 157
    move-result-object v1

    .line 158
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 159
    .line 160
    .line 161
    const-string v0, "silence_duration_c"

    .line 162
    .line 163
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 164
    .line 165
    iget-wide v1, v1, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->duration:J

    .line 166
    .line 167
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 168
    .line 169
    .line 170
    move-result-object v1

    .line 171
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Long;)V

    .line 172
    .line 173
    .line 174
    const-string v0, "silence_until_c"

    .line 175
    .line 176
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 177
    .line 178
    iget-wide v1, v1, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->until:D

    .line 179
    .line 180
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 181
    .line 182
    .line 183
    move-result-object v1

    .line 184
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Double;)V

    .line 185
    .line 186
    .line 187
    const-string v0, "operationSilence_enable_c"

    .line 188
    .line 189
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->operationSilence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 190
    .line 191
    iget-boolean v1, v1, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->enable:Z

    .line 192
    .line 193
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 194
    .line 195
    .line 196
    move-result-object v1

    .line 197
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 198
    .line 199
    .line 200
    const-string v0, "operationSilence_duration_c"

    .line 201
    .line 202
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->operationSilence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 203
    .line 204
    iget-wide v1, v1, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->duration:J

    .line 205
    .line 206
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 207
    .line 208
    .line 209
    move-result-object v1

    .line 210
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Long;)V

    .line 211
    .line 212
    .line 213
    const-string v0, "operationSilence_until_c"

    .line 214
    .line 215
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->operationSilence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 216
    .line 217
    iget-wide v1, v1, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->until:D

    .line 218
    .line 219
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 220
    .line 221
    .line 222
    move-result-object v1

    .line 223
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Double;)V

    .line 224
    .line 225
    .line 226
    const-string v0, "str_gender_c"

    .line 227
    .line 228
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 229
    .line 230
    if-nez v1, :cond_3

    .line 231
    .line 232
    move-object v1, p0

    .line 233
    goto :goto_3

    .line 234
    :cond_3
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object v1

    .line 238
    :goto_3
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 239
    .line 240
    .line 241
    const-string v0, "gender_c"

    .line 242
    .line 243
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 244
    .line 245
    if-nez v1, :cond_4

    .line 246
    .line 247
    move-object v1, p0

    .line 248
    goto :goto_4

    .line 249
    :cond_4
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 250
    .line 251
    .line 252
    move-result v1

    .line 253
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 254
    .line 255
    .line 256
    move-result-object v1

    .line 257
    :goto_4
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 258
    .line 259
    .line 260
    const-string v0, "inModeration_nickName_c"

    .line 261
    .line 262
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    .line 263
    .line 264
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/InModeration;->nickName:Ljava/lang/String;

    .line 265
    .line 266
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 267
    .line 268
    .line 269
    const-string v0, "inModeration_name_c"

    .line 270
    .line 271
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    .line 272
    .line 273
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/InModeration;->name:Ljava/lang/String;

    .line 274
    .line 275
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 276
    .line 277
    .line 278
    const-string v0, "inModeration_description_c"

    .line 279
    .line 280
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    .line 281
    .line 282
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/InModeration;->description:Ljava/lang/String;

    .line 283
    .line 284
    invoke-static {p2, v0, p1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 285
    .line 286
    .line 287
    return-void

    .line 288
    :catch_0
    move-exception p1

    .line 289
    invoke-static {p1, p0}, Lcom/google/protobuf/nano/MessageNano;->reportError(Ljava/lang/Exception;Landroid/database/Cursor;)V

    .line 290
    .line 291
    .line 292
    return-void
.end method

.method public bridge synthetic write(Ljava/lang/Object;Landroid/content/ContentValues;)V
    .locals 0

    .line 293
    check-cast p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/ChatGroupMember$27;->write(Lcom/p1/mobile/putong/core/data/ChatGroupMember;Landroid/content/ContentValues;)V

    return-void
.end method
