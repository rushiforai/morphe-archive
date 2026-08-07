.class Lcom/p1/mobile/putong/core/data/ChatGroup$62;
.super Ll/vzf0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/ChatGroup;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/vzf0<",
        "Lcom/p1/mobile/putong/core/data/ChatGroup;",
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
    const-string p1, " (_id INTEGER PRIMARY KEY,id_c TEXT,name_c TEXT,avatars_c BLOB,announcement_c TEXT,status_c INTEGER,localConId_c TEXT,ownerUserId_c TEXT,adminUserIds_c BLOB,creatorUserId_c TEXT,groupType_c INTEGER,memberIds_c BLOB,memberCount_c INTEGER,memberLimit_c INTEGER,memberStatistics_c BLOB,createdTime_c REAL,updatedTime_c REAL,localMembersLoaded_c INTEGER,publicId_c TEXT,category_id_c TEXT,category_name_c TEXT,category_backgroundColor_c TEXT,category_textColor_c TEXT,category_hidden_c INTEGER,description_c TEXT,tags_c BLOB,groupApply_id_c TEXT,groupApply_userId_c TEXT,groupApply_groupId_c TEXT,groupApply_reason_c TEXT,groupApply_status_c INTEGER,groupApply_createdTime_c REAL,groupApply_updatedTime_c REAL,silence_enable_c INTEGER,silence_duration_c INTEGER,silence_until_c REAL,punishment_sendMessage_active_c INTEGER,punishment_sendMessage_until_c REAL,punishment_sendRedPacket_active_c INTEGER,str_status_c TEXT,str_groupType_c TEXT,str_groupApply_status_c TEXT,expiredTime_c INTEGER,joinRemainedTime_c INTEGER,source_c TEXT,token_c TEXT,groupTopic_id_c TEXT,groupTopic_owner_c TEXT,groupTopic_value_c TEXT,groupTopic_medias_c BLOB,upgraded_c INTEGER,duration_c INTEGER,joinCondition_c TEXT,onlineCount_c INTEGER,adminLimit_c INTEGER,permissions_canShareToWeChat_c INTEGER,permissions_canShareToTantan_c INTEGER,permissions_canChangeJoinCondition_c INTEGER,inModeration_nickName_c TEXT,inModeration_name_c TEXT,inModeration_description_c TEXT,shareToken_c TEXT)"

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
    const-class p0, Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 2
    .line 3
    return-object p0
.end method

.method public init()Lcom/p1/mobile/putong/core/data/ChatGroup;
    .locals 2

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/ChatGroup;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->name:Ljava/lang/String;

    .line 7
    .line 8
    const-string v1, ""

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->name:Ljava/lang/String;

    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->avatars:Ljava/util/List;

    .line 15
    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    new-instance v0, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->avatars:Ljava/util/List;

    .line 24
    .line 25
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->announcement:Ljava/lang/String;

    .line 26
    .line 27
    if-nez v0, :cond_2

    .line 28
    .line 29
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->announcement:Ljava/lang/String;

    .line 30
    .line 31
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->status:Lcom/p1/mobile/putong/core/data/ChatGroupStatus;

    .line 32
    .line 33
    if-nez v0, :cond_3

    .line 34
    .line 35
    sget-object v0, Lcom/p1/mobile/putong/core/data/ChatGroupStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 36
    .line 37
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Lcom/p1/mobile/putong/core/data/ChatGroupStatus;

    .line 42
    .line 43
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->status:Lcom/p1/mobile/putong/core/data/ChatGroupStatus;

    .line 44
    .line 45
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->localConId:Ljava/lang/String;

    .line 46
    .line 47
    if-nez v0, :cond_4

    .line 48
    .line 49
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->localConId:Ljava/lang/String;

    .line 50
    .line 51
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->ownerUserId:Ljava/lang/String;

    .line 52
    .line 53
    if-nez v0, :cond_5

    .line 54
    .line 55
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->ownerUserId:Ljava/lang/String;

    .line 56
    .line 57
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->adminUserIds:Ljava/util/List;

    .line 58
    .line 59
    if-nez v0, :cond_6

    .line 60
    .line 61
    new-instance v0, Ljava/util/ArrayList;

    .line 62
    .line 63
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 64
    .line 65
    .line 66
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->adminUserIds:Ljava/util/List;

    .line 67
    .line 68
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->creatorUserId:Ljava/lang/String;

    .line 69
    .line 70
    if-nez v0, :cond_7

    .line 71
    .line 72
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->creatorUserId:Ljava/lang/String;

    .line 73
    .line 74
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupType:Lcom/p1/mobile/putong/core/data/ChatGroupType;

    .line 75
    .line 76
    if-nez v0, :cond_8

    .line 77
    .line 78
    sget-object v0, Lcom/p1/mobile/putong/core/data/ChatGroupType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 79
    .line 80
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    check-cast v0, Lcom/p1/mobile/putong/core/data/ChatGroupType;

    .line 85
    .line 86
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupType:Lcom/p1/mobile/putong/core/data/ChatGroupType;

    .line 87
    .line 88
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberIds:Ljava/util/List;

    .line 89
    .line 90
    if-nez v0, :cond_9

    .line 91
    .line 92
    new-instance v0, Ljava/util/ArrayList;

    .line 93
    .line 94
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 95
    .line 96
    .line 97
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberIds:Ljava/util/List;

    .line 98
    .line 99
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberStatistics:Ljava/util/List;

    .line 100
    .line 101
    if-nez v0, :cond_a

    .line 102
    .line 103
    new-instance v0, Ljava/util/ArrayList;

    .line 104
    .line 105
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 106
    .line 107
    .line 108
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberStatistics:Ljava/util/List;

    .line 109
    .line 110
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->publicId:Ljava/lang/String;

    .line 111
    .line 112
    if-nez v0, :cond_b

    .line 113
    .line 114
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->publicId:Ljava/lang/String;

    .line 115
    .line 116
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->category:Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;

    .line 117
    .line 118
    if-nez v0, :cond_c

    .line 119
    .line 120
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;->new_()Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->category:Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;

    .line 125
    .line 126
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->description:Ljava/lang/String;

    .line 127
    .line 128
    if-nez v0, :cond_d

    .line 129
    .line 130
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->description:Ljava/lang/String;

    .line 131
    .line 132
    :cond_d
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->tags:Ljava/util/List;

    .line 133
    .line 134
    if-nez v0, :cond_e

    .line 135
    .line 136
    new-instance v0, Ljava/util/ArrayList;

    .line 137
    .line 138
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 139
    .line 140
    .line 141
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->tags:Ljava/util/List;

    .line 142
    .line 143
    :cond_e
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupApply:Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 144
    .line 145
    if-nez v0, :cond_f

    .line 146
    .line 147
    invoke-static {}, Lcom/p1/mobile/putong/core/data/GroupApply;->new_()Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupApply:Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 152
    .line 153
    :cond_f
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 154
    .line 155
    if-nez v0, :cond_10

    .line 156
    .line 157
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->new_()Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 162
    .line 163
    :cond_10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->punishment:Lcom/p1/mobile/putong/core/data/ChatPunishment;

    .line 164
    .line 165
    if-nez v0, :cond_11

    .line 166
    .line 167
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatPunishment;->new_()Lcom/p1/mobile/putong/core/data/ChatPunishment;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->punishment:Lcom/p1/mobile/putong/core/data/ChatPunishment;

    .line 172
    .line 173
    :cond_11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->source:Ljava/lang/String;

    .line 174
    .line 175
    if-nez v0, :cond_12

    .line 176
    .line 177
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->source:Ljava/lang/String;

    .line 178
    .line 179
    :cond_12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->token:Ljava/lang/String;

    .line 180
    .line 181
    if-nez v0, :cond_13

    .line 182
    .line 183
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->token:Ljava/lang/String;

    .line 184
    .line 185
    :cond_13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupTopic:Lcom/p1/mobile/putong/core/data/ChatGroupTopic;

    .line 186
    .line 187
    if-nez v0, :cond_14

    .line 188
    .line 189
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatGroupTopic;->new_()Lcom/p1/mobile/putong/core/data/ChatGroupTopic;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupTopic:Lcom/p1/mobile/putong/core/data/ChatGroupTopic;

    .line 194
    .line 195
    :cond_14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->joinCondition:Lcom/p1/mobile/putong/core/data/JoinCondition;

    .line 196
    .line 197
    if-nez v0, :cond_15

    .line 198
    .line 199
    sget-object v0, Lcom/p1/mobile/putong/core/data/JoinCondition;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 200
    .line 201
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 202
    .line 203
    .line 204
    move-result-object v0

    .line 205
    check-cast v0, Lcom/p1/mobile/putong/core/data/JoinCondition;

    .line 206
    .line 207
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->joinCondition:Lcom/p1/mobile/putong/core/data/JoinCondition;

    .line 208
    .line 209
    :cond_15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->permissions:Lcom/p1/mobile/putong/core/data/Permissions;

    .line 210
    .line 211
    if-nez v0, :cond_16

    .line 212
    .line 213
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Permissions;->new_()Lcom/p1/mobile/putong/core/data/Permissions;

    .line 214
    .line 215
    .line 216
    move-result-object v0

    .line 217
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->permissions:Lcom/p1/mobile/putong/core/data/Permissions;

    .line 218
    .line 219
    :cond_16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    .line 220
    .line 221
    if-nez v0, :cond_17

    .line 222
    .line 223
    invoke-static {}, Lcom/p1/mobile/putong/core/data/InModeration;->new_()Lcom/p1/mobile/putong/core/data/InModeration;

    .line 224
    .line 225
    .line 226
    move-result-object v0

    .line 227
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    .line 228
    .line 229
    :cond_17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->shareToken:Ljava/lang/String;

    .line 230
    .line 231
    if-nez v0, :cond_18

    .line 232
    .line 233
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->shareToken:Ljava/lang/String;

    .line 234
    .line 235
    :cond_18
    return-object p0
.end method

.method public bridge synthetic init()Ljava/lang/Object;
    .locals 0

    .line 236
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ChatGroup$62;->init()Lcom/p1/mobile/putong/core/data/ChatGroup;

    move-result-object p0

    return-object p0
.end method

.method public read(Landroid/database/Cursor;I)Lcom/p1/mobile/putong/core/data/ChatGroup;
    .locals 13

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
    new-instance v2, Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 9
    .line 10
    invoke-direct {v2}, Lcom/p1/mobile/putong/core/data/ChatGroup;-><init>()V

    .line 11
    .line 12
    .line 13
    const/4 v3, -0x1

    .line 14
    :try_start_0
    new-instance v4, Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;

    .line 15
    .line 16
    invoke-direct {v4}, Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v4, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->category:Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;

    .line 20
    .line 21
    new-instance v4, Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 22
    .line 23
    invoke-direct {v4}, Lcom/p1/mobile/putong/core/data/GroupApply;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v4, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupApply:Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 27
    .line 28
    new-instance v4, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 29
    .line 30
    invoke-direct {v4}, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object v4, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 34
    .line 35
    new-instance v4, Lcom/p1/mobile/putong/core/data/ChatPunishment;

    .line 36
    .line 37
    invoke-direct {v4}, Lcom/p1/mobile/putong/core/data/ChatPunishment;-><init>()V

    .line 38
    .line 39
    .line 40
    iput-object v4, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->punishment:Lcom/p1/mobile/putong/core/data/ChatPunishment;

    .line 41
    .line 42
    new-instance v4, Lcom/p1/mobile/putong/core/data/ChatGroupTopic;

    .line 43
    .line 44
    invoke-direct {v4}, Lcom/p1/mobile/putong/core/data/ChatGroupTopic;-><init>()V

    .line 45
    .line 46
    .line 47
    iput-object v4, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupTopic:Lcom/p1/mobile/putong/core/data/ChatGroupTopic;

    .line 48
    .line 49
    new-instance v4, Lcom/p1/mobile/putong/core/data/Permissions;

    .line 50
    .line 51
    invoke-direct {v4}, Lcom/p1/mobile/putong/core/data/Permissions;-><init>()V

    .line 52
    .line 53
    .line 54
    iput-object v4, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->permissions:Lcom/p1/mobile/putong/core/data/Permissions;

    .line 55
    .line 56
    new-instance v4, Lcom/p1/mobile/putong/core/data/InModeration;

    .line 57
    .line 58
    invoke-direct {v4}, Lcom/p1/mobile/putong/core/data/InModeration;-><init>()V

    .line 59
    .line 60
    .line 61
    iput-object v4, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    .line 62
    .line 63
    iget-object v4, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->punishment:Lcom/p1/mobile/putong/core/data/ChatPunishment;

    .line 64
    .line 65
    new-instance v5, Lcom/p1/mobile/putong/core/data/ChatSendMessage;

    .line 66
    .line 67
    invoke-direct {v5}, Lcom/p1/mobile/putong/core/data/ChatSendMessage;-><init>()V

    .line 68
    .line 69
    .line 70
    iput-object v5, v4, Lcom/p1/mobile/putong/core/data/ChatPunishment;->sendMessage:Lcom/p1/mobile/putong/core/data/ChatSendMessage;

    .line 71
    .line 72
    iget-object v4, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->punishment:Lcom/p1/mobile/putong/core/data/ChatPunishment;

    .line 73
    .line 74
    new-instance v5, Lcom/p1/mobile/putong/core/data/SendRedPacket;

    .line 75
    .line 76
    invoke-direct {v5}, Lcom/p1/mobile/putong/core/data/SendRedPacket;-><init>()V

    .line 77
    .line 78
    .line 79
    iput-object v5, v4, Lcom/p1/mobile/putong/core/data/ChatPunishment;->sendRedPacket:Lcom/p1/mobile/putong/core/data/SendRedPacket;

    .line 80
    .line 81
    invoke-interface {p1, p2}, Landroid/database/Cursor;->getLong(I)J

    .line 82
    .line 83
    .line 84
    move-result-wide v4

    .line 85
    iput-wide v4, v2, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 86
    .line 87
    add-int/lit8 v4, p2, 0x1

    .line 88
    .line 89
    invoke-interface {p1, v4}, Landroid/database/Cursor;->isNull(I)Z

    .line 90
    .line 91
    .line 92
    move-result v5

    .line 93
    const/4 v6, 0x0

    .line 94
    if-eqz v5, :cond_1

    .line 95
    .line 96
    move-object v4, v6

    .line 97
    goto :goto_0

    .line 98
    :cond_1
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v4

    .line 102
    :goto_0
    iput-object v4, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 103
    .line 104
    add-int/lit8 v4, p2, 0x2

    .line 105
    .line 106
    invoke-interface {p1, v4}, Landroid/database/Cursor;->isNull(I)Z

    .line 107
    .line 108
    .line 109
    move-result v5

    .line 110
    if-eqz v5, :cond_2

    .line 111
    .line 112
    move-object v4, v6

    .line 113
    goto :goto_1

    .line 114
    :cond_2
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v4

    .line 118
    :goto_1
    iput-object v4, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->name:Ljava/lang/String;

    .line 119
    .line 120
    add-int/lit8 v4, p2, 0x3

    .line 121
    .line 122
    invoke-interface {p1, v4}, Landroid/database/Cursor;->isNull(I)Z

    .line 123
    .line 124
    .line 125
    move-result v5

    .line 126
    if-eqz v5, :cond_3

    .line 127
    .line 128
    move-object v4, v6

    .line 129
    goto :goto_2

    .line 130
    :cond_3
    sget-object v5, Lcom/p1/mobile/putong/data/Picture;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 131
    .line 132
    invoke-virtual {v5}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 133
    .line 134
    .line 135
    move-result-object v5

    .line 136
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getBlob(I)[B

    .line 137
    .line 138
    .line 139
    move-result-object v4

    .line 140
    invoke-virtual {v5, v4}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 141
    .line 142
    .line 143
    move-result-object v4

    .line 144
    check-cast v4, Ljava/util/List;

    .line 145
    .line 146
    :goto_2
    iput-object v4, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->avatars:Ljava/util/List;

    .line 147
    .line 148
    add-int/lit8 v4, p2, 0x4

    .line 149
    .line 150
    invoke-interface {p1, v4}, Landroid/database/Cursor;->isNull(I)Z

    .line 151
    .line 152
    .line 153
    move-result v5

    .line 154
    if-eqz v5, :cond_4

    .line 155
    .line 156
    move-object v4, v6

    .line 157
    goto :goto_3

    .line 158
    :cond_4
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object v4

    .line 162
    :goto_3
    iput-object v4, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->announcement:Ljava/lang/String;

    .line 163
    .line 164
    add-int/lit8 v4, p2, 0x5

    .line 165
    .line 166
    invoke-interface {p1, v4}, Landroid/database/Cursor;->isNull(I)Z

    .line 167
    .line 168
    .line 169
    move-result v5

    .line 170
    if-eqz v5, :cond_5

    .line 171
    .line 172
    move v4, v3

    .line 173
    goto :goto_4

    .line 174
    :cond_5
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getInt(I)I

    .line 175
    .line 176
    .line 177
    move-result v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_4

    .line 178
    :goto_4
    add-int/lit8 v5, p2, 0x6

    .line 179
    .line 180
    :try_start_1
    invoke-interface {p1, v5}, Landroid/database/Cursor;->isNull(I)Z

    .line 181
    .line 182
    .line 183
    move-result v7

    .line 184
    if-eqz v7, :cond_6

    .line 185
    .line 186
    move-object v5, v6

    .line 187
    goto :goto_5

    .line 188
    :cond_6
    invoke-interface {p1, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object v5

    .line 192
    :goto_5
    iput-object v5, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->localConId:Ljava/lang/String;

    .line 193
    .line 194
    add-int/lit8 v5, p2, 0x7

    .line 195
    .line 196
    invoke-interface {p1, v5}, Landroid/database/Cursor;->isNull(I)Z

    .line 197
    .line 198
    .line 199
    move-result v7

    .line 200
    if-eqz v7, :cond_7

    .line 201
    .line 202
    move-object v5, v6

    .line 203
    goto :goto_6

    .line 204
    :cond_7
    invoke-interface {p1, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object v5

    .line 208
    :goto_6
    iput-object v5, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->ownerUserId:Ljava/lang/String;

    .line 209
    .line 210
    add-int/lit8 v5, p2, 0x8

    .line 211
    .line 212
    invoke-interface {p1, v5}, Landroid/database/Cursor;->isNull(I)Z

    .line 213
    .line 214
    .line 215
    move-result v7

    .line 216
    if-eqz v7, :cond_8

    .line 217
    .line 218
    move-object v5, v6

    .line 219
    goto :goto_7

    .line 220
    :cond_8
    sget-object v7, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 221
    .line 222
    invoke-virtual {v7}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 223
    .line 224
    .line 225
    move-result-object v7

    .line 226
    invoke-interface {p1, v5}, Landroid/database/Cursor;->getBlob(I)[B

    .line 227
    .line 228
    .line 229
    move-result-object v5

    .line 230
    invoke-virtual {v7, v5}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 231
    .line 232
    .line 233
    move-result-object v5

    .line 234
    check-cast v5, Ljava/util/List;

    .line 235
    .line 236
    :goto_7
    iput-object v5, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->adminUserIds:Ljava/util/List;

    .line 237
    .line 238
    add-int/lit8 v5, p2, 0x9

    .line 239
    .line 240
    invoke-interface {p1, v5}, Landroid/database/Cursor;->isNull(I)Z

    .line 241
    .line 242
    .line 243
    move-result v7

    .line 244
    if-eqz v7, :cond_9

    .line 245
    .line 246
    move-object v5, v6

    .line 247
    goto :goto_8

    .line 248
    :cond_9
    invoke-interface {p1, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 249
    .line 250
    .line 251
    move-result-object v5

    .line 252
    :goto_8
    iput-object v5, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->creatorUserId:Ljava/lang/String;

    .line 253
    .line 254
    add-int/lit8 v5, p2, 0xa

    .line 255
    .line 256
    invoke-interface {p1, v5}, Landroid/database/Cursor;->isNull(I)Z

    .line 257
    .line 258
    .line 259
    move-result v7

    .line 260
    if-eqz v7, :cond_a

    .line 261
    .line 262
    move v5, v3

    .line 263
    goto :goto_9

    .line 264
    :cond_a
    invoke-interface {p1, v5}, Landroid/database/Cursor;->getInt(I)I

    .line 265
    .line 266
    .line 267
    move-result v5
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3

    .line 268
    :goto_9
    add-int/lit8 v7, p2, 0xb

    .line 269
    .line 270
    :try_start_2
    invoke-interface {p1, v7}, Landroid/database/Cursor;->isNull(I)Z

    .line 271
    .line 272
    .line 273
    move-result v8

    .line 274
    if-eqz v8, :cond_b

    .line 275
    .line 276
    move-object v7, v6

    .line 277
    goto :goto_a

    .line 278
    :cond_b
    sget-object v8, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 279
    .line 280
    invoke-virtual {v8}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 281
    .line 282
    .line 283
    move-result-object v8

    .line 284
    invoke-interface {p1, v7}, Landroid/database/Cursor;->getBlob(I)[B

    .line 285
    .line 286
    .line 287
    move-result-object v7

    .line 288
    invoke-virtual {v8, v7}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 289
    .line 290
    .line 291
    move-result-object v7

    .line 292
    check-cast v7, Ljava/util/List;

    .line 293
    .line 294
    :goto_a
    iput-object v7, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberIds:Ljava/util/List;

    .line 295
    .line 296
    add-int/lit8 v7, p2, 0xc

    .line 297
    .line 298
    invoke-interface {p1, v7}, Landroid/database/Cursor;->getInt(I)I

    .line 299
    .line 300
    .line 301
    move-result v7

    .line 302
    iput v7, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberCount:I

    .line 303
    .line 304
    add-int/lit8 v7, p2, 0xd

    .line 305
    .line 306
    invoke-interface {p1, v7}, Landroid/database/Cursor;->getInt(I)I

    .line 307
    .line 308
    .line 309
    move-result v7

    .line 310
    iput v7, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberLimit:I

    .line 311
    .line 312
    add-int/lit8 v7, p2, 0xe

    .line 313
    .line 314
    invoke-interface {p1, v7}, Landroid/database/Cursor;->isNull(I)Z

    .line 315
    .line 316
    .line 317
    move-result v8

    .line 318
    if-eqz v8, :cond_c

    .line 319
    .line 320
    move-object v7, v6

    .line 321
    goto :goto_b

    .line 322
    :cond_c
    sget-object v8, Lcom/p1/mobile/putong/core/data/GroupMemberStatistic;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 323
    .line 324
    invoke-virtual {v8}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 325
    .line 326
    .line 327
    move-result-object v8

    .line 328
    invoke-interface {p1, v7}, Landroid/database/Cursor;->getBlob(I)[B

    .line 329
    .line 330
    .line 331
    move-result-object v7

    .line 332
    invoke-virtual {v8, v7}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 333
    .line 334
    .line 335
    move-result-object v7

    .line 336
    check-cast v7, Ljava/util/List;

    .line 337
    .line 338
    :goto_b
    iput-object v7, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberStatistics:Ljava/util/List;

    .line 339
    .line 340
    add-int/lit8 v7, p2, 0xf

    .line 341
    .line 342
    invoke-interface {p1, v7}, Landroid/database/Cursor;->getDouble(I)D

    .line 343
    .line 344
    .line 345
    move-result-wide v7

    .line 346
    iput-wide v7, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->createdTime:D

    .line 347
    .line 348
    add-int/lit8 v7, p2, 0x10

    .line 349
    .line 350
    invoke-interface {p1, v7}, Landroid/database/Cursor;->getDouble(I)D

    .line 351
    .line 352
    .line 353
    move-result-wide v7

    .line 354
    iput-wide v7, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->updatedTime:D

    .line 355
    .line 356
    add-int/lit8 v7, p2, 0x11

    .line 357
    .line 358
    invoke-interface {p1, v7}, Landroid/database/Cursor;->getInt(I)I

    .line 359
    .line 360
    .line 361
    move-result v7

    .line 362
    const/4 v8, 0x1

    .line 363
    if-ne v7, v8, :cond_d

    .line 364
    .line 365
    move v7, v8

    .line 366
    goto :goto_c

    .line 367
    :cond_d
    move v7, v1

    .line 368
    :goto_c
    iput-boolean v7, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->localMembersLoaded:Z

    .line 369
    .line 370
    add-int/lit8 v7, p2, 0x12

    .line 371
    .line 372
    invoke-interface {p1, v7}, Landroid/database/Cursor;->isNull(I)Z

    .line 373
    .line 374
    .line 375
    move-result v9

    .line 376
    if-eqz v9, :cond_e

    .line 377
    .line 378
    move-object v7, v6

    .line 379
    goto :goto_d

    .line 380
    :cond_e
    invoke-interface {p1, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 381
    .line 382
    .line 383
    move-result-object v7

    .line 384
    :goto_d
    iput-object v7, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->publicId:Ljava/lang/String;

    .line 385
    .line 386
    add-int/lit8 v7, p2, 0x13

    .line 387
    .line 388
    iget-object v9, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->category:Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;

    .line 389
    .line 390
    invoke-interface {p1, v7}, Landroid/database/Cursor;->isNull(I)Z

    .line 391
    .line 392
    .line 393
    move-result v10

    .line 394
    if-eqz v10, :cond_f

    .line 395
    .line 396
    move-object v7, v6

    .line 397
    goto :goto_e

    .line 398
    :cond_f
    invoke-interface {p1, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 399
    .line 400
    .line 401
    move-result-object v7

    .line 402
    :goto_e
    iput-object v7, v9, Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;->id:Ljava/lang/String;

    .line 403
    .line 404
    add-int/lit8 v7, p2, 0x14

    .line 405
    .line 406
    iget-object v9, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->category:Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;

    .line 407
    .line 408
    invoke-interface {p1, v7}, Landroid/database/Cursor;->isNull(I)Z

    .line 409
    .line 410
    .line 411
    move-result v10

    .line 412
    if-eqz v10, :cond_10

    .line 413
    .line 414
    move-object v7, v6

    .line 415
    goto :goto_f

    .line 416
    :cond_10
    invoke-interface {p1, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 417
    .line 418
    .line 419
    move-result-object v7

    .line 420
    :goto_f
    iput-object v7, v9, Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;->name:Ljava/lang/String;

    .line 421
    .line 422
    add-int/lit8 v7, p2, 0x15

    .line 423
    .line 424
    iget-object v9, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->category:Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;

    .line 425
    .line 426
    invoke-interface {p1, v7}, Landroid/database/Cursor;->isNull(I)Z

    .line 427
    .line 428
    .line 429
    move-result v10

    .line 430
    if-eqz v10, :cond_11

    .line 431
    .line 432
    move-object v7, v6

    .line 433
    goto :goto_10

    .line 434
    :cond_11
    invoke-interface {p1, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 435
    .line 436
    .line 437
    move-result-object v7

    .line 438
    :goto_10
    iput-object v7, v9, Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;->backgroundColor:Ljava/lang/String;

    .line 439
    .line 440
    add-int/lit8 v7, p2, 0x16

    .line 441
    .line 442
    iget-object v9, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->category:Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;

    .line 443
    .line 444
    invoke-interface {p1, v7}, Landroid/database/Cursor;->isNull(I)Z

    .line 445
    .line 446
    .line 447
    move-result v10

    .line 448
    if-eqz v10, :cond_12

    .line 449
    .line 450
    move-object v7, v6

    .line 451
    goto :goto_11

    .line 452
    :cond_12
    invoke-interface {p1, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 453
    .line 454
    .line 455
    move-result-object v7

    .line 456
    :goto_11
    iput-object v7, v9, Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;->textColor:Ljava/lang/String;

    .line 457
    .line 458
    add-int/lit8 v7, p2, 0x17

    .line 459
    .line 460
    iget-object v9, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->category:Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;

    .line 461
    .line 462
    invoke-interface {p1, v7}, Landroid/database/Cursor;->getInt(I)I

    .line 463
    .line 464
    .line 465
    move-result v7

    .line 466
    if-ne v7, v8, :cond_13

    .line 467
    .line 468
    move v7, v8

    .line 469
    goto :goto_12

    .line 470
    :cond_13
    move v7, v1

    .line 471
    :goto_12
    iput-boolean v7, v9, Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;->hidden:Z

    .line 472
    .line 473
    add-int/lit8 v7, p2, 0x18

    .line 474
    .line 475
    invoke-interface {p1, v7}, Landroid/database/Cursor;->isNull(I)Z

    .line 476
    .line 477
    .line 478
    move-result v9

    .line 479
    if-eqz v9, :cond_14

    .line 480
    .line 481
    move-object v7, v6

    .line 482
    goto :goto_13

    .line 483
    :cond_14
    invoke-interface {p1, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 484
    .line 485
    .line 486
    move-result-object v7

    .line 487
    :goto_13
    iput-object v7, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->description:Ljava/lang/String;

    .line 488
    .line 489
    add-int/lit8 v7, p2, 0x19

    .line 490
    .line 491
    invoke-interface {p1, v7}, Landroid/database/Cursor;->isNull(I)Z

    .line 492
    .line 493
    .line 494
    move-result v9

    .line 495
    if-eqz v9, :cond_15

    .line 496
    .line 497
    move-object v7, v6

    .line 498
    goto :goto_14

    .line 499
    :cond_15
    sget-object v9, Lcom/p1/mobile/putong/core/data/ChatGroupTag;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 500
    .line 501
    invoke-virtual {v9}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 502
    .line 503
    .line 504
    move-result-object v9

    .line 505
    invoke-interface {p1, v7}, Landroid/database/Cursor;->getBlob(I)[B

    .line 506
    .line 507
    .line 508
    move-result-object v7

    .line 509
    invoke-virtual {v9, v7}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 510
    .line 511
    .line 512
    move-result-object v7

    .line 513
    check-cast v7, Ljava/util/List;

    .line 514
    .line 515
    :goto_14
    iput-object v7, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->tags:Ljava/util/List;

    .line 516
    .line 517
    add-int/lit8 v7, p2, 0x1a

    .line 518
    .line 519
    iget-object v9, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupApply:Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 520
    .line 521
    invoke-interface {p1, v7}, Landroid/database/Cursor;->isNull(I)Z

    .line 522
    .line 523
    .line 524
    move-result v10

    .line 525
    if-eqz v10, :cond_16

    .line 526
    .line 527
    move-object v7, v6

    .line 528
    goto :goto_15

    .line 529
    :cond_16
    invoke-interface {p1, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 530
    .line 531
    .line 532
    move-result-object v7

    .line 533
    :goto_15
    iput-object v7, v9, Lcom/p1/mobile/putong/core/data/GroupApply;->id:Ljava/lang/String;

    .line 534
    .line 535
    add-int/lit8 v7, p2, 0x1b

    .line 536
    .line 537
    iget-object v9, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupApply:Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 538
    .line 539
    invoke-interface {p1, v7}, Landroid/database/Cursor;->isNull(I)Z

    .line 540
    .line 541
    .line 542
    move-result v10

    .line 543
    if-eqz v10, :cond_17

    .line 544
    .line 545
    move-object v7, v6

    .line 546
    goto :goto_16

    .line 547
    :cond_17
    invoke-interface {p1, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 548
    .line 549
    .line 550
    move-result-object v7

    .line 551
    :goto_16
    iput-object v7, v9, Lcom/p1/mobile/putong/core/data/GroupApply;->userId:Ljava/lang/String;

    .line 552
    .line 553
    add-int/lit8 v7, p2, 0x1c

    .line 554
    .line 555
    iget-object v9, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupApply:Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 556
    .line 557
    invoke-interface {p1, v7}, Landroid/database/Cursor;->isNull(I)Z

    .line 558
    .line 559
    .line 560
    move-result v10

    .line 561
    if-eqz v10, :cond_18

    .line 562
    .line 563
    move-object v7, v6

    .line 564
    goto :goto_17

    .line 565
    :cond_18
    invoke-interface {p1, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 566
    .line 567
    .line 568
    move-result-object v7

    .line 569
    :goto_17
    iput-object v7, v9, Lcom/p1/mobile/putong/core/data/GroupApply;->groupId:Ljava/lang/String;

    .line 570
    .line 571
    add-int/lit8 v7, p2, 0x1d

    .line 572
    .line 573
    iget-object v9, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupApply:Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 574
    .line 575
    invoke-interface {p1, v7}, Landroid/database/Cursor;->isNull(I)Z

    .line 576
    .line 577
    .line 578
    move-result v10

    .line 579
    if-eqz v10, :cond_19

    .line 580
    .line 581
    move-object v7, v6

    .line 582
    goto :goto_18

    .line 583
    :cond_19
    invoke-interface {p1, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 584
    .line 585
    .line 586
    move-result-object v7

    .line 587
    :goto_18
    iput-object v7, v9, Lcom/p1/mobile/putong/core/data/GroupApply;->reason:Ljava/lang/String;

    .line 588
    .line 589
    add-int/lit8 v7, p2, 0x1e

    .line 590
    .line 591
    invoke-interface {p1, v7}, Landroid/database/Cursor;->isNull(I)Z

    .line 592
    .line 593
    .line 594
    move-result v9

    .line 595
    if-eqz v9, :cond_1a

    .line 596
    .line 597
    goto :goto_19

    .line 598
    :cond_1a
    invoke-interface {p1, v7}, Landroid/database/Cursor;->getInt(I)I

    .line 599
    .line 600
    .line 601
    move-result v3

    .line 602
    :goto_19
    add-int/lit8 v7, p2, 0x1f

    .line 603
    .line 604
    iget-object v9, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupApply:Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 605
    .line 606
    invoke-interface {p1, v7}, Landroid/database/Cursor;->getDouble(I)D

    .line 607
    .line 608
    .line 609
    move-result-wide v10

    .line 610
    iput-wide v10, v9, Lcom/p1/mobile/putong/core/data/GroupApply;->createdTime:D

    .line 611
    .line 612
    add-int/lit8 v7, p2, 0x20

    .line 613
    .line 614
    iget-object v9, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupApply:Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 615
    .line 616
    invoke-interface {p1, v7}, Landroid/database/Cursor;->getDouble(I)D

    .line 617
    .line 618
    .line 619
    move-result-wide v10

    .line 620
    iput-wide v10, v9, Lcom/p1/mobile/putong/core/data/GroupApply;->updatedTime:D

    .line 621
    .line 622
    add-int/lit8 v7, p2, 0x21

    .line 623
    .line 624
    iget-object v9, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 625
    .line 626
    invoke-interface {p1, v7}, Landroid/database/Cursor;->getInt(I)I

    .line 627
    .line 628
    .line 629
    move-result v7

    .line 630
    if-ne v7, v8, :cond_1b

    .line 631
    .line 632
    move v7, v8

    .line 633
    goto :goto_1a

    .line 634
    :cond_1b
    move v7, v1

    .line 635
    :goto_1a
    iput-boolean v7, v9, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->enable:Z

    .line 636
    .line 637
    add-int/lit8 v7, p2, 0x22

    .line 638
    .line 639
    iget-object v9, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 640
    .line 641
    invoke-interface {p1, v7}, Landroid/database/Cursor;->getLong(I)J

    .line 642
    .line 643
    .line 644
    move-result-wide v10

    .line 645
    iput-wide v10, v9, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->duration:J

    .line 646
    .line 647
    add-int/lit8 v7, p2, 0x23

    .line 648
    .line 649
    iget-object v9, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 650
    .line 651
    invoke-interface {p1, v7}, Landroid/database/Cursor;->getDouble(I)D

    .line 652
    .line 653
    .line 654
    move-result-wide v10

    .line 655
    iput-wide v10, v9, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->until:D

    .line 656
    .line 657
    add-int/lit8 v7, p2, 0x24

    .line 658
    .line 659
    iget-object v9, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->punishment:Lcom/p1/mobile/putong/core/data/ChatPunishment;

    .line 660
    .line 661
    iget-object v9, v9, Lcom/p1/mobile/putong/core/data/ChatPunishment;->sendMessage:Lcom/p1/mobile/putong/core/data/ChatSendMessage;

    .line 662
    .line 663
    invoke-interface {p1, v7}, Landroid/database/Cursor;->getInt(I)I

    .line 664
    .line 665
    .line 666
    move-result v7

    .line 667
    if-ne v7, v8, :cond_1c

    .line 668
    .line 669
    move v7, v8

    .line 670
    goto :goto_1b

    .line 671
    :cond_1c
    move v7, v1

    .line 672
    :goto_1b
    iput-boolean v7, v9, Lcom/p1/mobile/putong/core/data/ChatSendMessage;->active:Z

    .line 673
    .line 674
    add-int/lit8 v7, p2, 0x25

    .line 675
    .line 676
    iget-object v9, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->punishment:Lcom/p1/mobile/putong/core/data/ChatPunishment;

    .line 677
    .line 678
    iget-object v9, v9, Lcom/p1/mobile/putong/core/data/ChatPunishment;->sendMessage:Lcom/p1/mobile/putong/core/data/ChatSendMessage;

    .line 679
    .line 680
    invoke-interface {p1, v7}, Landroid/database/Cursor;->getDouble(I)D

    .line 681
    .line 682
    .line 683
    move-result-wide v10

    .line 684
    iput-wide v10, v9, Lcom/p1/mobile/putong/core/data/ChatSendMessage;->until:D

    .line 685
    .line 686
    add-int/lit8 v7, p2, 0x26

    .line 687
    .line 688
    iget-object v9, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->punishment:Lcom/p1/mobile/putong/core/data/ChatPunishment;

    .line 689
    .line 690
    iget-object v9, v9, Lcom/p1/mobile/putong/core/data/ChatPunishment;->sendRedPacket:Lcom/p1/mobile/putong/core/data/SendRedPacket;

    .line 691
    .line 692
    invoke-interface {p1, v7}, Landroid/database/Cursor;->getInt(I)I

    .line 693
    .line 694
    .line 695
    move-result v7

    .line 696
    if-ne v7, v8, :cond_1d

    .line 697
    .line 698
    move v7, v8

    .line 699
    goto :goto_1c

    .line 700
    :cond_1d
    move v7, v1

    .line 701
    :goto_1c
    iput-boolean v7, v9, Lcom/p1/mobile/putong/core/data/SendRedPacket;->active:Z

    .line 702
    .line 703
    add-int/lit8 v7, p2, 0x27

    .line 704
    .line 705
    invoke-interface {p1, v7}, Landroid/database/Cursor;->isNull(I)Z

    .line 706
    .line 707
    .line 708
    move-result v9

    .line 709
    if-eqz v9, :cond_1e

    .line 710
    .line 711
    move-object v7, v6

    .line 712
    goto :goto_1d

    .line 713
    :cond_1e
    invoke-interface {p1, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 714
    .line 715
    .line 716
    move-result-object v7
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 717
    :goto_1d
    add-int/lit8 v9, p2, 0x28

    .line 718
    .line 719
    :try_start_3
    invoke-interface {p1, v9}, Landroid/database/Cursor;->isNull(I)Z

    .line 720
    .line 721
    .line 722
    move-result v10

    .line 723
    if-eqz v10, :cond_1f

    .line 724
    .line 725
    move-object v9, v6

    .line 726
    goto :goto_1e

    .line 727
    :cond_1f
    invoke-interface {p1, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 728
    .line 729
    .line 730
    move-result-object v9
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    .line 731
    :goto_1e
    add-int/lit8 v10, p2, 0x29

    .line 732
    .line 733
    :try_start_4
    invoke-interface {p1, v10}, Landroid/database/Cursor;->isNull(I)Z

    .line 734
    .line 735
    .line 736
    move-result v11

    .line 737
    if-eqz v11, :cond_20

    .line 738
    .line 739
    move-object v0, v6

    .line 740
    goto :goto_1f

    .line 741
    :cond_20
    invoke-interface {p1, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 742
    .line 743
    .line 744
    move-result-object v0

    .line 745
    :goto_1f
    add-int/lit8 v10, p2, 0x2a

    .line 746
    .line 747
    invoke-interface {p1, v10}, Landroid/database/Cursor;->getLong(I)J

    .line 748
    .line 749
    .line 750
    move-result-wide v10

    .line 751
    iput-wide v10, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->expiredTime:J

    .line 752
    .line 753
    add-int/lit8 v10, p2, 0x2b

    .line 754
    .line 755
    invoke-interface {p1, v10}, Landroid/database/Cursor;->getInt(I)I

    .line 756
    .line 757
    .line 758
    move-result v10

    .line 759
    iput v10, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->joinRemainedTime:I

    .line 760
    .line 761
    add-int/lit8 v10, p2, 0x2c

    .line 762
    .line 763
    invoke-interface {p1, v10}, Landroid/database/Cursor;->isNull(I)Z

    .line 764
    .line 765
    .line 766
    move-result v11

    .line 767
    if-eqz v11, :cond_21

    .line 768
    .line 769
    move-object v10, v6

    .line 770
    goto :goto_20

    .line 771
    :cond_21
    invoke-interface {p1, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 772
    .line 773
    .line 774
    move-result-object v10

    .line 775
    :goto_20
    iput-object v10, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->source:Ljava/lang/String;

    .line 776
    .line 777
    add-int/lit8 v10, p2, 0x2d

    .line 778
    .line 779
    invoke-interface {p1, v10}, Landroid/database/Cursor;->isNull(I)Z

    .line 780
    .line 781
    .line 782
    move-result v11

    .line 783
    if-eqz v11, :cond_22

    .line 784
    .line 785
    move-object v10, v6

    .line 786
    goto :goto_21

    .line 787
    :cond_22
    invoke-interface {p1, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 788
    .line 789
    .line 790
    move-result-object v10

    .line 791
    :goto_21
    iput-object v10, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->token:Ljava/lang/String;

    .line 792
    .line 793
    add-int/lit8 v10, p2, 0x2e

    .line 794
    .line 795
    iget-object v11, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupTopic:Lcom/p1/mobile/putong/core/data/ChatGroupTopic;

    .line 796
    .line 797
    invoke-interface {p1, v10}, Landroid/database/Cursor;->isNull(I)Z

    .line 798
    .line 799
    .line 800
    move-result v12

    .line 801
    if-eqz v12, :cond_23

    .line 802
    .line 803
    move-object v10, v6

    .line 804
    goto :goto_22

    .line 805
    :cond_23
    invoke-interface {p1, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 806
    .line 807
    .line 808
    move-result-object v10

    .line 809
    :goto_22
    iput-object v10, v11, Lcom/p1/mobile/putong/core/data/ChatGroupTopic;->id:Ljava/lang/String;

    .line 810
    .line 811
    add-int/lit8 v10, p2, 0x2f

    .line 812
    .line 813
    iget-object v11, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupTopic:Lcom/p1/mobile/putong/core/data/ChatGroupTopic;

    .line 814
    .line 815
    invoke-interface {p1, v10}, Landroid/database/Cursor;->isNull(I)Z

    .line 816
    .line 817
    .line 818
    move-result v12

    .line 819
    if-eqz v12, :cond_24

    .line 820
    .line 821
    move-object v10, v6

    .line 822
    goto :goto_23

    .line 823
    :cond_24
    invoke-interface {p1, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 824
    .line 825
    .line 826
    move-result-object v10

    .line 827
    :goto_23
    iput-object v10, v11, Lcom/p1/mobile/putong/core/data/ChatGroupTopic;->owner:Ljava/lang/String;

    .line 828
    .line 829
    add-int/lit8 v10, p2, 0x30

    .line 830
    .line 831
    iget-object v11, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupTopic:Lcom/p1/mobile/putong/core/data/ChatGroupTopic;

    .line 832
    .line 833
    invoke-interface {p1, v10}, Landroid/database/Cursor;->isNull(I)Z

    .line 834
    .line 835
    .line 836
    move-result v12

    .line 837
    if-eqz v12, :cond_25

    .line 838
    .line 839
    move-object v10, v6

    .line 840
    goto :goto_24

    .line 841
    :cond_25
    invoke-interface {p1, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 842
    .line 843
    .line 844
    move-result-object v10

    .line 845
    :goto_24
    iput-object v10, v11, Lcom/p1/mobile/putong/core/data/ChatGroupTopic;->value:Ljava/lang/String;

    .line 846
    .line 847
    add-int/lit8 v10, p2, 0x31

    .line 848
    .line 849
    iget-object v11, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupTopic:Lcom/p1/mobile/putong/core/data/ChatGroupTopic;

    .line 850
    .line 851
    invoke-interface {p1, v10}, Landroid/database/Cursor;->isNull(I)Z

    .line 852
    .line 853
    .line 854
    move-result v12

    .line 855
    if-eqz v12, :cond_26

    .line 856
    .line 857
    move-object v10, v6

    .line 858
    goto :goto_25

    .line 859
    :cond_26
    sget-object v12, Lcom/p1/mobile/putong/data/Media;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 860
    .line 861
    invoke-virtual {v12}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 862
    .line 863
    .line 864
    move-result-object v12

    .line 865
    invoke-interface {p1, v10}, Landroid/database/Cursor;->getBlob(I)[B

    .line 866
    .line 867
    .line 868
    move-result-object v10

    .line 869
    invoke-virtual {v12, v10}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 870
    .line 871
    .line 872
    move-result-object v10

    .line 873
    check-cast v10, Ljava/util/List;

    .line 874
    .line 875
    :goto_25
    iput-object v10, v11, Lcom/p1/mobile/putong/core/data/ChatGroupTopic;->medias:Ljava/util/List;

    .line 876
    .line 877
    add-int/lit8 v10, p2, 0x32

    .line 878
    .line 879
    invoke-interface {p1, v10}, Landroid/database/Cursor;->getInt(I)I

    .line 880
    .line 881
    .line 882
    move-result v10

    .line 883
    if-ne v10, v8, :cond_27

    .line 884
    .line 885
    move v10, v8

    .line 886
    goto :goto_26

    .line 887
    :cond_27
    move v10, v1

    .line 888
    :goto_26
    iput-boolean v10, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->upgraded:Z

    .line 889
    .line 890
    add-int/lit8 v10, p2, 0x33

    .line 891
    .line 892
    invoke-interface {p1, v10}, Landroid/database/Cursor;->getLong(I)J

    .line 893
    .line 894
    .line 895
    move-result-wide v10

    .line 896
    iput-wide v10, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->duration:J

    .line 897
    .line 898
    add-int/lit8 v10, p2, 0x34

    .line 899
    .line 900
    invoke-interface {p1, v10}, Landroid/database/Cursor;->isNull(I)Z

    .line 901
    .line 902
    .line 903
    move-result v11

    .line 904
    if-eqz v11, :cond_28

    .line 905
    .line 906
    move-object v10, v6

    .line 907
    goto :goto_27

    .line 908
    :cond_28
    invoke-interface {p1, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 909
    .line 910
    .line 911
    move-result-object v10

    .line 912
    invoke-static {v10}, Lcom/p1/mobile/putong/core/data/JoinCondition;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/JoinCondition;

    .line 913
    .line 914
    .line 915
    move-result-object v10

    .line 916
    :goto_27
    iput-object v10, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->joinCondition:Lcom/p1/mobile/putong/core/data/JoinCondition;

    .line 917
    .line 918
    add-int/lit8 v10, p2, 0x35

    .line 919
    .line 920
    invoke-interface {p1, v10}, Landroid/database/Cursor;->getInt(I)I

    .line 921
    .line 922
    .line 923
    move-result v10

    .line 924
    iput v10, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->onlineCount:I

    .line 925
    .line 926
    add-int/lit8 v10, p2, 0x36

    .line 927
    .line 928
    invoke-interface {p1, v10}, Landroid/database/Cursor;->getInt(I)I

    .line 929
    .line 930
    .line 931
    move-result v10

    .line 932
    iput v10, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->adminLimit:I

    .line 933
    .line 934
    add-int/lit8 v10, p2, 0x37

    .line 935
    .line 936
    iget-object v11, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->permissions:Lcom/p1/mobile/putong/core/data/Permissions;

    .line 937
    .line 938
    invoke-interface {p1, v10}, Landroid/database/Cursor;->getInt(I)I

    .line 939
    .line 940
    .line 941
    move-result v10

    .line 942
    if-ne v10, v8, :cond_29

    .line 943
    .line 944
    move v10, v8

    .line 945
    goto :goto_28

    .line 946
    :cond_29
    move v10, v1

    .line 947
    :goto_28
    iput-boolean v10, v11, Lcom/p1/mobile/putong/core/data/Permissions;->canShareToWeChat:Z

    .line 948
    .line 949
    add-int/lit8 v10, p2, 0x38

    .line 950
    .line 951
    iget-object v11, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->permissions:Lcom/p1/mobile/putong/core/data/Permissions;

    .line 952
    .line 953
    invoke-interface {p1, v10}, Landroid/database/Cursor;->getInt(I)I

    .line 954
    .line 955
    .line 956
    move-result v10

    .line 957
    if-ne v10, v8, :cond_2a

    .line 958
    .line 959
    move v10, v8

    .line 960
    goto :goto_29

    .line 961
    :cond_2a
    move v10, v1

    .line 962
    :goto_29
    iput-boolean v10, v11, Lcom/p1/mobile/putong/core/data/Permissions;->canShareToTantan:Z

    .line 963
    .line 964
    add-int/lit8 v10, p2, 0x39

    .line 965
    .line 966
    iget-object v11, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->permissions:Lcom/p1/mobile/putong/core/data/Permissions;

    .line 967
    .line 968
    invoke-interface {p1, v10}, Landroid/database/Cursor;->getInt(I)I

    .line 969
    .line 970
    .line 971
    move-result v10

    .line 972
    if-ne v10, v8, :cond_2b

    .line 973
    .line 974
    move v1, v8

    .line 975
    :cond_2b
    iput-boolean v1, v11, Lcom/p1/mobile/putong/core/data/Permissions;->canChangeJoinCondition:Z

    .line 976
    .line 977
    add-int/lit8 v1, p2, 0x3a

    .line 978
    .line 979
    iget-object v8, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    .line 980
    .line 981
    invoke-interface {p1, v1}, Landroid/database/Cursor;->isNull(I)Z

    .line 982
    .line 983
    .line 984
    move-result v10

    .line 985
    if-eqz v10, :cond_2c

    .line 986
    .line 987
    move-object v1, v6

    .line 988
    goto :goto_2a

    .line 989
    :cond_2c
    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 990
    .line 991
    .line 992
    move-result-object v1

    .line 993
    :goto_2a
    iput-object v1, v8, Lcom/p1/mobile/putong/core/data/InModeration;->nickName:Ljava/lang/String;

    .line 994
    .line 995
    add-int/lit8 v1, p2, 0x3b

    .line 996
    .line 997
    iget-object v8, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    .line 998
    .line 999
    invoke-interface {p1, v1}, Landroid/database/Cursor;->isNull(I)Z

    .line 1000
    .line 1001
    .line 1002
    move-result v10

    .line 1003
    if-eqz v10, :cond_2d

    .line 1004
    .line 1005
    move-object v1, v6

    .line 1006
    goto :goto_2b

    .line 1007
    :cond_2d
    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 1008
    .line 1009
    .line 1010
    move-result-object v1

    .line 1011
    :goto_2b
    iput-object v1, v8, Lcom/p1/mobile/putong/core/data/InModeration;->name:Ljava/lang/String;

    .line 1012
    .line 1013
    add-int/lit8 v1, p2, 0x3c

    .line 1014
    .line 1015
    iget-object v8, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    .line 1016
    .line 1017
    invoke-interface {p1, v1}, Landroid/database/Cursor;->isNull(I)Z

    .line 1018
    .line 1019
    .line 1020
    move-result v10

    .line 1021
    if-eqz v10, :cond_2e

    .line 1022
    .line 1023
    move-object v1, v6

    .line 1024
    goto :goto_2c

    .line 1025
    :cond_2e
    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 1026
    .line 1027
    .line 1028
    move-result-object v1

    .line 1029
    :goto_2c
    iput-object v1, v8, Lcom/p1/mobile/putong/core/data/InModeration;->description:Ljava/lang/String;

    .line 1030
    .line 1031
    add-int/lit8 v1, p2, 0x3d

    .line 1032
    .line 1033
    invoke-interface {p1, v1}, Landroid/database/Cursor;->isNull(I)Z

    .line 1034
    .line 1035
    .line 1036
    move-result v8

    .line 1037
    if-eqz v8, :cond_2f

    .line 1038
    .line 1039
    goto :goto_2d

    .line 1040
    :cond_2f
    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 1041
    .line 1042
    .line 1043
    move-result-object v6

    .line 1044
    :goto_2d
    iput-object v6, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->shareToken:Ljava/lang/String;

    .line 1045
    .line 1046
    add-int/lit8 p2, p2, 0x3e

    .line 1047
    .line 1048
    iput p2, p0, Ll/vzf0;->readIndex:I
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 1049
    .line 1050
    goto :goto_31

    .line 1051
    :catch_0
    move-exception p0

    .line 1052
    move-object p2, v0

    .line 1053
    :goto_2e
    move v1, v3

    .line 1054
    move v3, v4

    .line 1055
    move-object v0, v7

    .line 1056
    goto :goto_30

    .line 1057
    :catch_1
    move-exception p0

    .line 1058
    move-object p2, v0

    .line 1059
    move-object v9, p2

    .line 1060
    goto :goto_2e

    .line 1061
    :catch_2
    move-exception p0

    .line 1062
    move-object p2, v0

    .line 1063
    move-object v9, p2

    .line 1064
    move v1, v3

    .line 1065
    :goto_2f
    move v3, v4

    .line 1066
    goto :goto_30

    .line 1067
    :catch_3
    move-exception p0

    .line 1068
    move-object p2, v0

    .line 1069
    move-object v9, p2

    .line 1070
    move v1, v3

    .line 1071
    move v5, v1

    .line 1072
    goto :goto_2f

    .line 1073
    :catch_4
    move-exception p0

    .line 1074
    move-object p2, v0

    .line 1075
    move-object v9, p2

    .line 1076
    move v1, v3

    .line 1077
    move v5, v1

    .line 1078
    :goto_30
    invoke-static {p0, p1}, Lcom/google/protobuf/nano/MessageNano;->reportError(Ljava/lang/Exception;Landroid/database/Cursor;)V

    .line 1079
    .line 1080
    .line 1081
    move-object v7, v0

    .line 1082
    move v4, v3

    .line 1083
    move-object v0, p2

    .line 1084
    move v3, v1

    .line 1085
    :goto_31
    sget-object p0, Lcom/p1/mobile/putong/core/data/ChatGroupStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 1086
    .line 1087
    invoke-virtual {p0, v7, v4}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 1088
    .line 1089
    .line 1090
    move-result-object p1

    .line 1091
    check-cast p1, Lcom/p1/mobile/putong/core/data/ChatGroupStatus;

    .line 1092
    .line 1093
    iput-object p1, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->status:Lcom/p1/mobile/putong/core/data/ChatGroupStatus;

    .line 1094
    .line 1095
    sget-object p1, Lcom/p1/mobile/putong/core/data/ChatGroupType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 1096
    .line 1097
    invoke-virtual {p1, v9, v5}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 1098
    .line 1099
    .line 1100
    move-result-object p2

    .line 1101
    check-cast p2, Lcom/p1/mobile/putong/core/data/ChatGroupType;

    .line 1102
    .line 1103
    iput-object p2, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupType:Lcom/p1/mobile/putong/core/data/ChatGroupType;

    .line 1104
    .line 1105
    iget-object p2, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupApply:Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 1106
    .line 1107
    sget-object v1, Lcom/p1/mobile/putong/core/data/GroupApplyStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 1108
    .line 1109
    invoke-virtual {v1, v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 1110
    .line 1111
    .line 1112
    move-result-object v0

    .line 1113
    check-cast v0, Lcom/p1/mobile/putong/core/data/GroupApplyStatus;

    .line 1114
    .line 1115
    iput-object v0, p2, Lcom/p1/mobile/putong/core/data/GroupApply;->status:Lcom/p1/mobile/putong/core/data/GroupApplyStatus;

    .line 1116
    .line 1117
    iget-object p2, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->name:Ljava/lang/String;

    .line 1118
    .line 1119
    const-string v0, ""

    .line 1120
    .line 1121
    if-nez p2, :cond_30

    .line 1122
    .line 1123
    iput-object v0, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->name:Ljava/lang/String;

    .line 1124
    .line 1125
    :cond_30
    iget-object p2, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->avatars:Ljava/util/List;

    .line 1126
    .line 1127
    if-nez p2, :cond_31

    .line 1128
    .line 1129
    new-instance p2, Ljava/util/ArrayList;

    .line 1130
    .line 1131
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 1132
    .line 1133
    .line 1134
    iput-object p2, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->avatars:Ljava/util/List;

    .line 1135
    .line 1136
    :cond_31
    iget-object p2, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->announcement:Ljava/lang/String;

    .line 1137
    .line 1138
    if-nez p2, :cond_32

    .line 1139
    .line 1140
    iput-object v0, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->announcement:Ljava/lang/String;

    .line 1141
    .line 1142
    :cond_32
    iget-object p2, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->status:Lcom/p1/mobile/putong/core/data/ChatGroupStatus;

    .line 1143
    .line 1144
    if-nez p2, :cond_33

    .line 1145
    .line 1146
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 1147
    .line 1148
    .line 1149
    move-result-object p0

    .line 1150
    check-cast p0, Lcom/p1/mobile/putong/core/data/ChatGroupStatus;

    .line 1151
    .line 1152
    iput-object p0, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->status:Lcom/p1/mobile/putong/core/data/ChatGroupStatus;

    .line 1153
    .line 1154
    :cond_33
    iget-object p0, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->localConId:Ljava/lang/String;

    .line 1155
    .line 1156
    if-nez p0, :cond_34

    .line 1157
    .line 1158
    iput-object v0, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->localConId:Ljava/lang/String;

    .line 1159
    .line 1160
    :cond_34
    iget-object p0, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->ownerUserId:Ljava/lang/String;

    .line 1161
    .line 1162
    if-nez p0, :cond_35

    .line 1163
    .line 1164
    iput-object v0, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->ownerUserId:Ljava/lang/String;

    .line 1165
    .line 1166
    :cond_35
    iget-object p0, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->adminUserIds:Ljava/util/List;

    .line 1167
    .line 1168
    if-nez p0, :cond_36

    .line 1169
    .line 1170
    new-instance p0, Ljava/util/ArrayList;

    .line 1171
    .line 1172
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 1173
    .line 1174
    .line 1175
    iput-object p0, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->adminUserIds:Ljava/util/List;

    .line 1176
    .line 1177
    :cond_36
    iget-object p0, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->creatorUserId:Ljava/lang/String;

    .line 1178
    .line 1179
    if-nez p0, :cond_37

    .line 1180
    .line 1181
    iput-object v0, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->creatorUserId:Ljava/lang/String;

    .line 1182
    .line 1183
    :cond_37
    iget-object p0, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupType:Lcom/p1/mobile/putong/core/data/ChatGroupType;

    .line 1184
    .line 1185
    if-nez p0, :cond_38

    .line 1186
    .line 1187
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 1188
    .line 1189
    .line 1190
    move-result-object p0

    .line 1191
    check-cast p0, Lcom/p1/mobile/putong/core/data/ChatGroupType;

    .line 1192
    .line 1193
    iput-object p0, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupType:Lcom/p1/mobile/putong/core/data/ChatGroupType;

    .line 1194
    .line 1195
    :cond_38
    iget-object p0, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberIds:Ljava/util/List;

    .line 1196
    .line 1197
    if-nez p0, :cond_39

    .line 1198
    .line 1199
    new-instance p0, Ljava/util/ArrayList;

    .line 1200
    .line 1201
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 1202
    .line 1203
    .line 1204
    iput-object p0, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberIds:Ljava/util/List;

    .line 1205
    .line 1206
    :cond_39
    iget-object p0, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberStatistics:Ljava/util/List;

    .line 1207
    .line 1208
    if-nez p0, :cond_3a

    .line 1209
    .line 1210
    new-instance p0, Ljava/util/ArrayList;

    .line 1211
    .line 1212
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 1213
    .line 1214
    .line 1215
    iput-object p0, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberStatistics:Ljava/util/List;

    .line 1216
    .line 1217
    :cond_3a
    iget-object p0, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->publicId:Ljava/lang/String;

    .line 1218
    .line 1219
    if-nez p0, :cond_3b

    .line 1220
    .line 1221
    iput-object v0, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->publicId:Ljava/lang/String;

    .line 1222
    .line 1223
    :cond_3b
    iget-object p0, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->category:Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;

    .line 1224
    .line 1225
    if-nez p0, :cond_3c

    .line 1226
    .line 1227
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;->new_()Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;

    .line 1228
    .line 1229
    .line 1230
    move-result-object p0

    .line 1231
    iput-object p0, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->category:Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;

    .line 1232
    .line 1233
    :cond_3c
    iget-object p0, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->description:Ljava/lang/String;

    .line 1234
    .line 1235
    if-nez p0, :cond_3d

    .line 1236
    .line 1237
    iput-object v0, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->description:Ljava/lang/String;

    .line 1238
    .line 1239
    :cond_3d
    iget-object p0, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->tags:Ljava/util/List;

    .line 1240
    .line 1241
    if-nez p0, :cond_3e

    .line 1242
    .line 1243
    new-instance p0, Ljava/util/ArrayList;

    .line 1244
    .line 1245
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 1246
    .line 1247
    .line 1248
    iput-object p0, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->tags:Ljava/util/List;

    .line 1249
    .line 1250
    :cond_3e
    iget-object p0, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupApply:Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 1251
    .line 1252
    if-nez p0, :cond_3f

    .line 1253
    .line 1254
    invoke-static {}, Lcom/p1/mobile/putong/core/data/GroupApply;->new_()Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 1255
    .line 1256
    .line 1257
    move-result-object p0

    .line 1258
    iput-object p0, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupApply:Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 1259
    .line 1260
    :cond_3f
    iget-object p0, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 1261
    .line 1262
    if-nez p0, :cond_40

    .line 1263
    .line 1264
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->new_()Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 1265
    .line 1266
    .line 1267
    move-result-object p0

    .line 1268
    iput-object p0, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 1269
    .line 1270
    :cond_40
    iget-object p0, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->punishment:Lcom/p1/mobile/putong/core/data/ChatPunishment;

    .line 1271
    .line 1272
    if-nez p0, :cond_41

    .line 1273
    .line 1274
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatPunishment;->new_()Lcom/p1/mobile/putong/core/data/ChatPunishment;

    .line 1275
    .line 1276
    .line 1277
    move-result-object p0

    .line 1278
    iput-object p0, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->punishment:Lcom/p1/mobile/putong/core/data/ChatPunishment;

    .line 1279
    .line 1280
    :cond_41
    iget-object p0, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->source:Ljava/lang/String;

    .line 1281
    .line 1282
    if-nez p0, :cond_42

    .line 1283
    .line 1284
    iput-object v0, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->source:Ljava/lang/String;

    .line 1285
    .line 1286
    :cond_42
    iget-object p0, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->token:Ljava/lang/String;

    .line 1287
    .line 1288
    if-nez p0, :cond_43

    .line 1289
    .line 1290
    iput-object v0, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->token:Ljava/lang/String;

    .line 1291
    .line 1292
    :cond_43
    iget-object p0, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupTopic:Lcom/p1/mobile/putong/core/data/ChatGroupTopic;

    .line 1293
    .line 1294
    if-nez p0, :cond_44

    .line 1295
    .line 1296
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatGroupTopic;->new_()Lcom/p1/mobile/putong/core/data/ChatGroupTopic;

    .line 1297
    .line 1298
    .line 1299
    move-result-object p0

    .line 1300
    iput-object p0, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupTopic:Lcom/p1/mobile/putong/core/data/ChatGroupTopic;

    .line 1301
    .line 1302
    :cond_44
    iget-object p0, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->joinCondition:Lcom/p1/mobile/putong/core/data/JoinCondition;

    .line 1303
    .line 1304
    if-nez p0, :cond_45

    .line 1305
    .line 1306
    sget-object p0, Lcom/p1/mobile/putong/core/data/JoinCondition;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 1307
    .line 1308
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 1309
    .line 1310
    .line 1311
    move-result-object p0

    .line 1312
    check-cast p0, Lcom/p1/mobile/putong/core/data/JoinCondition;

    .line 1313
    .line 1314
    iput-object p0, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->joinCondition:Lcom/p1/mobile/putong/core/data/JoinCondition;

    .line 1315
    .line 1316
    :cond_45
    iget-object p0, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->permissions:Lcom/p1/mobile/putong/core/data/Permissions;

    .line 1317
    .line 1318
    if-nez p0, :cond_46

    .line 1319
    .line 1320
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Permissions;->new_()Lcom/p1/mobile/putong/core/data/Permissions;

    .line 1321
    .line 1322
    .line 1323
    move-result-object p0

    .line 1324
    iput-object p0, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->permissions:Lcom/p1/mobile/putong/core/data/Permissions;

    .line 1325
    .line 1326
    :cond_46
    iget-object p0, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    .line 1327
    .line 1328
    if-nez p0, :cond_47

    .line 1329
    .line 1330
    invoke-static {}, Lcom/p1/mobile/putong/core/data/InModeration;->new_()Lcom/p1/mobile/putong/core/data/InModeration;

    .line 1331
    .line 1332
    .line 1333
    move-result-object p0

    .line 1334
    iput-object p0, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    .line 1335
    .line 1336
    :cond_47
    iget-object p0, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->shareToken:Ljava/lang/String;

    .line 1337
    .line 1338
    if-nez p0, :cond_48

    .line 1339
    .line 1340
    iput-object v0, v2, Lcom/p1/mobile/putong/core/data/ChatGroup;->shareToken:Ljava/lang/String;

    .line 1341
    .line 1342
    :cond_48
    return-object v2
.end method

.method public bridge synthetic read(Landroid/database/Cursor;I)Ljava/lang/Object;
    .locals 0

    .line 1343
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/ChatGroup$62;->read(Landroid/database/Cursor;I)Lcom/p1/mobile/putong/core/data/ChatGroup;

    move-result-object p0

    return-object p0
.end method

.method public write(Lcom/p1/mobile/putong/core/data/ChatGroup;Landroid/content/ContentValues;)V
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
    const-string v0, "name_c"

    .line 10
    .line 11
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->name:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "avatars_c"

    .line 17
    .line 18
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->avatars:Ljava/util/List;

    .line 19
    .line 20
    if-nez v1, :cond_0

    .line 21
    .line 22
    move-object v1, p0

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/data/Picture;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 25
    .line 26
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->avatars:Ljava/util/List;

    .line 31
    .line 32
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    :goto_0
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 37
    .line 38
    .line 39
    const-string v0, "announcement_c"

    .line 40
    .line 41
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->announcement:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    const-string v0, "str_status_c"

    .line 47
    .line 48
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->status:Lcom/p1/mobile/putong/core/data/ChatGroupStatus;

    .line 49
    .line 50
    if-nez v1, :cond_1

    .line 51
    .line 52
    move-object v1, p0

    .line 53
    goto :goto_1

    .line 54
    :cond_1
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    :goto_1
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    const-string v0, "status_c"

    .line 62
    .line 63
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->status:Lcom/p1/mobile/putong/core/data/ChatGroupStatus;

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
    const-string v0, "localConId_c"

    .line 81
    .line 82
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->localConId:Ljava/lang/String;

    .line 83
    .line 84
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    const-string v0, "ownerUserId_c"

    .line 88
    .line 89
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->ownerUserId:Ljava/lang/String;

    .line 90
    .line 91
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    const-string v0, "adminUserIds_c"

    .line 95
    .line 96
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->adminUserIds:Ljava/util/List;

    .line 97
    .line 98
    if-nez v1, :cond_3

    .line 99
    .line 100
    move-object v1, p0

    .line 101
    goto :goto_3

    .line 102
    :cond_3
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 103
    .line 104
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->adminUserIds:Ljava/util/List;

    .line 109
    .line 110
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    :goto_3
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 115
    .line 116
    .line 117
    const-string v0, "creatorUserId_c"

    .line 118
    .line 119
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->creatorUserId:Ljava/lang/String;

    .line 120
    .line 121
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    const-string v0, "str_groupType_c"

    .line 125
    .line 126
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupType:Lcom/p1/mobile/putong/core/data/ChatGroupType;

    .line 127
    .line 128
    if-nez v1, :cond_4

    .line 129
    .line 130
    move-object v1, p0

    .line 131
    goto :goto_4

    .line 132
    :cond_4
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v1

    .line 136
    :goto_4
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    const-string v0, "groupType_c"

    .line 140
    .line 141
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupType:Lcom/p1/mobile/putong/core/data/ChatGroupType;

    .line 142
    .line 143
    if-nez v1, :cond_5

    .line 144
    .line 145
    move-object v1, p0

    .line 146
    goto :goto_5

    .line 147
    :cond_5
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 148
    .line 149
    .line 150
    move-result v1

    .line 151
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 152
    .line 153
    .line 154
    move-result-object v1

    .line 155
    :goto_5
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 156
    .line 157
    .line 158
    const-string v0, "memberIds_c"

    .line 159
    .line 160
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberIds:Ljava/util/List;

    .line 161
    .line 162
    if-nez v1, :cond_6

    .line 163
    .line 164
    move-object v1, p0

    .line 165
    goto :goto_6

    .line 166
    :cond_6
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 167
    .line 168
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 169
    .line 170
    .line 171
    move-result-object v1

    .line 172
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberIds:Ljava/util/List;

    .line 173
    .line 174
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 175
    .line 176
    .line 177
    move-result-object v1

    .line 178
    :goto_6
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 179
    .line 180
    .line 181
    const-string v0, "memberCount_c"

    .line 182
    .line 183
    iget v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberCount:I

    .line 184
    .line 185
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 186
    .line 187
    .line 188
    move-result-object v1

    .line 189
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 190
    .line 191
    .line 192
    const-string v0, "memberLimit_c"

    .line 193
    .line 194
    iget v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberLimit:I

    .line 195
    .line 196
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 197
    .line 198
    .line 199
    move-result-object v1

    .line 200
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 201
    .line 202
    .line 203
    const-string v0, "memberStatistics_c"

    .line 204
    .line 205
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberStatistics:Ljava/util/List;

    .line 206
    .line 207
    if-nez v1, :cond_7

    .line 208
    .line 209
    move-object v1, p0

    .line 210
    goto :goto_7

    .line 211
    :cond_7
    sget-object v1, Lcom/p1/mobile/putong/core/data/GroupMemberStatistic;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 212
    .line 213
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 214
    .line 215
    .line 216
    move-result-object v1

    .line 217
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberStatistics:Ljava/util/List;

    .line 218
    .line 219
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 220
    .line 221
    .line 222
    move-result-object v1

    .line 223
    :goto_7
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 224
    .line 225
    .line 226
    const-string v0, "createdTime_c"

    .line 227
    .line 228
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->createdTime:D

    .line 229
    .line 230
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 231
    .line 232
    .line 233
    move-result-object v1

    .line 234
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Double;)V

    .line 235
    .line 236
    .line 237
    const-string v0, "updatedTime_c"

    .line 238
    .line 239
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->updatedTime:D

    .line 240
    .line 241
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 242
    .line 243
    .line 244
    move-result-object v1

    .line 245
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Double;)V

    .line 246
    .line 247
    .line 248
    const-string v0, "localMembersLoaded_c"

    .line 249
    .line 250
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->localMembersLoaded:Z

    .line 251
    .line 252
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 253
    .line 254
    .line 255
    move-result-object v1

    .line 256
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 257
    .line 258
    .line 259
    const-string v0, "publicId_c"

    .line 260
    .line 261
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->publicId:Ljava/lang/String;

    .line 262
    .line 263
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 264
    .line 265
    .line 266
    const-string v0, "category_id_c"

    .line 267
    .line 268
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->category:Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;

    .line 269
    .line 270
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;->id:Ljava/lang/String;

    .line 271
    .line 272
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 273
    .line 274
    .line 275
    const-string v0, "category_name_c"

    .line 276
    .line 277
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->category:Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;

    .line 278
    .line 279
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;->name:Ljava/lang/String;

    .line 280
    .line 281
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 282
    .line 283
    .line 284
    const-string v0, "category_backgroundColor_c"

    .line 285
    .line 286
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->category:Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;

    .line 287
    .line 288
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;->backgroundColor:Ljava/lang/String;

    .line 289
    .line 290
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 291
    .line 292
    .line 293
    const-string v0, "category_textColor_c"

    .line 294
    .line 295
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->category:Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;

    .line 296
    .line 297
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;->textColor:Ljava/lang/String;

    .line 298
    .line 299
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 300
    .line 301
    .line 302
    const-string v0, "category_hidden_c"

    .line 303
    .line 304
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->category:Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;

    .line 305
    .line 306
    iget-boolean v1, v1, Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;->hidden:Z

    .line 307
    .line 308
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 309
    .line 310
    .line 311
    move-result-object v1

    .line 312
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 313
    .line 314
    .line 315
    const-string v0, "description_c"

    .line 316
    .line 317
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->description:Ljava/lang/String;

    .line 318
    .line 319
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 320
    .line 321
    .line 322
    const-string v0, "tags_c"

    .line 323
    .line 324
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->tags:Ljava/util/List;

    .line 325
    .line 326
    if-nez v1, :cond_8

    .line 327
    .line 328
    move-object v1, p0

    .line 329
    goto :goto_8

    .line 330
    :cond_8
    sget-object v1, Lcom/p1/mobile/putong/core/data/ChatGroupTag;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 331
    .line 332
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 333
    .line 334
    .line 335
    move-result-object v1

    .line 336
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->tags:Ljava/util/List;

    .line 337
    .line 338
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 339
    .line 340
    .line 341
    move-result-object v1

    .line 342
    :goto_8
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 343
    .line 344
    .line 345
    const-string v0, "groupApply_id_c"

    .line 346
    .line 347
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupApply:Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 348
    .line 349
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/GroupApply;->id:Ljava/lang/String;

    .line 350
    .line 351
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 352
    .line 353
    .line 354
    const-string v0, "groupApply_userId_c"

    .line 355
    .line 356
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupApply:Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 357
    .line 358
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/GroupApply;->userId:Ljava/lang/String;

    .line 359
    .line 360
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 361
    .line 362
    .line 363
    const-string v0, "groupApply_groupId_c"

    .line 364
    .line 365
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupApply:Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 366
    .line 367
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/GroupApply;->groupId:Ljava/lang/String;

    .line 368
    .line 369
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 370
    .line 371
    .line 372
    const-string v0, "groupApply_reason_c"

    .line 373
    .line 374
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupApply:Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 375
    .line 376
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/GroupApply;->reason:Ljava/lang/String;

    .line 377
    .line 378
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 379
    .line 380
    .line 381
    const-string v0, "str_groupApply_status_c"

    .line 382
    .line 383
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupApply:Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 384
    .line 385
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/GroupApply;->status:Lcom/p1/mobile/putong/core/data/GroupApplyStatus;

    .line 386
    .line 387
    if-nez v1, :cond_9

    .line 388
    .line 389
    move-object v1, p0

    .line 390
    goto :goto_9

    .line 391
    :cond_9
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 392
    .line 393
    .line 394
    move-result-object v1

    .line 395
    :goto_9
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 396
    .line 397
    .line 398
    const-string v0, "groupApply_status_c"

    .line 399
    .line 400
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupApply:Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 401
    .line 402
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/GroupApply;->status:Lcom/p1/mobile/putong/core/data/GroupApplyStatus;

    .line 403
    .line 404
    if-nez v1, :cond_a

    .line 405
    .line 406
    move-object v1, p0

    .line 407
    goto :goto_a

    .line 408
    :cond_a
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 409
    .line 410
    .line 411
    move-result v1

    .line 412
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 413
    .line 414
    .line 415
    move-result-object v1

    .line 416
    :goto_a
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 417
    .line 418
    .line 419
    const-string v0, "groupApply_createdTime_c"

    .line 420
    .line 421
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupApply:Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 422
    .line 423
    iget-wide v1, v1, Lcom/p1/mobile/putong/core/data/GroupApply;->createdTime:D

    .line 424
    .line 425
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 426
    .line 427
    .line 428
    move-result-object v1

    .line 429
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Double;)V

    .line 430
    .line 431
    .line 432
    const-string v0, "groupApply_updatedTime_c"

    .line 433
    .line 434
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupApply:Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 435
    .line 436
    iget-wide v1, v1, Lcom/p1/mobile/putong/core/data/GroupApply;->updatedTime:D

    .line 437
    .line 438
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 439
    .line 440
    .line 441
    move-result-object v1

    .line 442
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Double;)V

    .line 443
    .line 444
    .line 445
    const-string v0, "silence_enable_c"

    .line 446
    .line 447
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 448
    .line 449
    iget-boolean v1, v1, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->enable:Z

    .line 450
    .line 451
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 452
    .line 453
    .line 454
    move-result-object v1

    .line 455
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 456
    .line 457
    .line 458
    const-string v0, "silence_duration_c"

    .line 459
    .line 460
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 461
    .line 462
    iget-wide v1, v1, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->duration:J

    .line 463
    .line 464
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 465
    .line 466
    .line 467
    move-result-object v1

    .line 468
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Long;)V

    .line 469
    .line 470
    .line 471
    const-string v0, "silence_until_c"

    .line 472
    .line 473
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 474
    .line 475
    iget-wide v1, v1, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->until:D

    .line 476
    .line 477
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 478
    .line 479
    .line 480
    move-result-object v1

    .line 481
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Double;)V

    .line 482
    .line 483
    .line 484
    const-string v0, "punishment_sendMessage_active_c"

    .line 485
    .line 486
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->punishment:Lcom/p1/mobile/putong/core/data/ChatPunishment;

    .line 487
    .line 488
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ChatPunishment;->sendMessage:Lcom/p1/mobile/putong/core/data/ChatSendMessage;

    .line 489
    .line 490
    iget-boolean v1, v1, Lcom/p1/mobile/putong/core/data/ChatSendMessage;->active:Z

    .line 491
    .line 492
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 493
    .line 494
    .line 495
    move-result-object v1

    .line 496
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 497
    .line 498
    .line 499
    const-string v0, "punishment_sendMessage_until_c"

    .line 500
    .line 501
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->punishment:Lcom/p1/mobile/putong/core/data/ChatPunishment;

    .line 502
    .line 503
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ChatPunishment;->sendMessage:Lcom/p1/mobile/putong/core/data/ChatSendMessage;

    .line 504
    .line 505
    iget-wide v1, v1, Lcom/p1/mobile/putong/core/data/ChatSendMessage;->until:D

    .line 506
    .line 507
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 508
    .line 509
    .line 510
    move-result-object v1

    .line 511
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Double;)V

    .line 512
    .line 513
    .line 514
    const-string v0, "punishment_sendRedPacket_active_c"

    .line 515
    .line 516
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->punishment:Lcom/p1/mobile/putong/core/data/ChatPunishment;

    .line 517
    .line 518
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ChatPunishment;->sendRedPacket:Lcom/p1/mobile/putong/core/data/SendRedPacket;

    .line 519
    .line 520
    iget-boolean v1, v1, Lcom/p1/mobile/putong/core/data/SendRedPacket;->active:Z

    .line 521
    .line 522
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 523
    .line 524
    .line 525
    move-result-object v1

    .line 526
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 527
    .line 528
    .line 529
    const-string v0, "expiredTime_c"

    .line 530
    .line 531
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->expiredTime:J

    .line 532
    .line 533
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 534
    .line 535
    .line 536
    move-result-object v1

    .line 537
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Long;)V

    .line 538
    .line 539
    .line 540
    const-string v0, "joinRemainedTime_c"

    .line 541
    .line 542
    iget v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->joinRemainedTime:I

    .line 543
    .line 544
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 545
    .line 546
    .line 547
    move-result-object v1

    .line 548
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 549
    .line 550
    .line 551
    const-string v0, "source_c"

    .line 552
    .line 553
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->source:Ljava/lang/String;

    .line 554
    .line 555
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 556
    .line 557
    .line 558
    const-string v0, "token_c"

    .line 559
    .line 560
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->token:Ljava/lang/String;

    .line 561
    .line 562
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 563
    .line 564
    .line 565
    const-string v0, "groupTopic_id_c"

    .line 566
    .line 567
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupTopic:Lcom/p1/mobile/putong/core/data/ChatGroupTopic;

    .line 568
    .line 569
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ChatGroupTopic;->id:Ljava/lang/String;

    .line 570
    .line 571
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 572
    .line 573
    .line 574
    const-string v0, "groupTopic_owner_c"

    .line 575
    .line 576
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupTopic:Lcom/p1/mobile/putong/core/data/ChatGroupTopic;

    .line 577
    .line 578
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ChatGroupTopic;->owner:Ljava/lang/String;

    .line 579
    .line 580
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 581
    .line 582
    .line 583
    const-string v0, "groupTopic_value_c"

    .line 584
    .line 585
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupTopic:Lcom/p1/mobile/putong/core/data/ChatGroupTopic;

    .line 586
    .line 587
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ChatGroupTopic;->value:Ljava/lang/String;

    .line 588
    .line 589
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 590
    .line 591
    .line 592
    const-string v0, "groupTopic_medias_c"

    .line 593
    .line 594
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupTopic:Lcom/p1/mobile/putong/core/data/ChatGroupTopic;

    .line 595
    .line 596
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ChatGroupTopic;->medias:Ljava/util/List;

    .line 597
    .line 598
    if-nez v1, :cond_b

    .line 599
    .line 600
    move-object v1, p0

    .line 601
    goto :goto_b

    .line 602
    :cond_b
    sget-object v1, Lcom/p1/mobile/putong/data/Media;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 603
    .line 604
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 605
    .line 606
    .line 607
    move-result-object v1

    .line 608
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupTopic:Lcom/p1/mobile/putong/core/data/ChatGroupTopic;

    .line 609
    .line 610
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/ChatGroupTopic;->medias:Ljava/util/List;

    .line 611
    .line 612
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 613
    .line 614
    .line 615
    move-result-object v1

    .line 616
    :goto_b
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 617
    .line 618
    .line 619
    const-string v0, "upgraded_c"

    .line 620
    .line 621
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->upgraded:Z

    .line 622
    .line 623
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 624
    .line 625
    .line 626
    move-result-object v1

    .line 627
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 628
    .line 629
    .line 630
    const-string v0, "duration_c"

    .line 631
    .line 632
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->duration:J

    .line 633
    .line 634
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 635
    .line 636
    .line 637
    move-result-object v1

    .line 638
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Long;)V

    .line 639
    .line 640
    .line 641
    const-string v0, "joinCondition_c"

    .line 642
    .line 643
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->joinCondition:Lcom/p1/mobile/putong/core/data/JoinCondition;

    .line 644
    .line 645
    if-nez v1, :cond_c

    .line 646
    .line 647
    move-object v1, p0

    .line 648
    goto :goto_c

    .line 649
    :cond_c
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 650
    .line 651
    .line 652
    move-result-object v1

    .line 653
    :goto_c
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 654
    .line 655
    .line 656
    const-string v0, "onlineCount_c"

    .line 657
    .line 658
    iget v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->onlineCount:I

    .line 659
    .line 660
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 661
    .line 662
    .line 663
    move-result-object v1

    .line 664
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 665
    .line 666
    .line 667
    const-string v0, "adminLimit_c"

    .line 668
    .line 669
    iget v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->adminLimit:I

    .line 670
    .line 671
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 672
    .line 673
    .line 674
    move-result-object v1

    .line 675
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 676
    .line 677
    .line 678
    const-string v0, "permissions_canShareToWeChat_c"

    .line 679
    .line 680
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->permissions:Lcom/p1/mobile/putong/core/data/Permissions;

    .line 681
    .line 682
    iget-boolean v1, v1, Lcom/p1/mobile/putong/core/data/Permissions;->canShareToWeChat:Z

    .line 683
    .line 684
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 685
    .line 686
    .line 687
    move-result-object v1

    .line 688
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 689
    .line 690
    .line 691
    const-string v0, "permissions_canShareToTantan_c"

    .line 692
    .line 693
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->permissions:Lcom/p1/mobile/putong/core/data/Permissions;

    .line 694
    .line 695
    iget-boolean v1, v1, Lcom/p1/mobile/putong/core/data/Permissions;->canShareToTantan:Z

    .line 696
    .line 697
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 698
    .line 699
    .line 700
    move-result-object v1

    .line 701
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 702
    .line 703
    .line 704
    const-string v0, "permissions_canChangeJoinCondition_c"

    .line 705
    .line 706
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->permissions:Lcom/p1/mobile/putong/core/data/Permissions;

    .line 707
    .line 708
    iget-boolean v1, v1, Lcom/p1/mobile/putong/core/data/Permissions;->canChangeJoinCondition:Z

    .line 709
    .line 710
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 711
    .line 712
    .line 713
    move-result-object v1

    .line 714
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 715
    .line 716
    .line 717
    const-string v0, "inModeration_nickName_c"

    .line 718
    .line 719
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    .line 720
    .line 721
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/InModeration;->nickName:Ljava/lang/String;

    .line 722
    .line 723
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 724
    .line 725
    .line 726
    const-string v0, "inModeration_name_c"

    .line 727
    .line 728
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    .line 729
    .line 730
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/InModeration;->name:Ljava/lang/String;

    .line 731
    .line 732
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 733
    .line 734
    .line 735
    const-string v0, "inModeration_description_c"

    .line 736
    .line 737
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    .line 738
    .line 739
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/InModeration;->description:Ljava/lang/String;

    .line 740
    .line 741
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 742
    .line 743
    .line 744
    const-string v0, "shareToken_c"

    .line 745
    .line 746
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->shareToken:Ljava/lang/String;

    .line 747
    .line 748
    invoke-static {p2, v0, p1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 749
    .line 750
    .line 751
    return-void

    .line 752
    :catch_0
    move-exception p1

    .line 753
    invoke-static {p1, p0}, Lcom/google/protobuf/nano/MessageNano;->reportError(Ljava/lang/Exception;Landroid/database/Cursor;)V

    .line 754
    .line 755
    .line 756
    return-void
.end method

.method public bridge synthetic write(Ljava/lang/Object;Landroid/content/ContentValues;)V
    .locals 0

    .line 757
    check-cast p1, Lcom/p1/mobile/putong/core/data/ChatGroup;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/ChatGroup$62;->write(Lcom/p1/mobile/putong/core/data/ChatGroup;Landroid/content/ContentValues;)V

    return-void
.end method
