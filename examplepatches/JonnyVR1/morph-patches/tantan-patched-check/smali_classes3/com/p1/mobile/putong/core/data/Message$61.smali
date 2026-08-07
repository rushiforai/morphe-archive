.class Lcom/p1/mobile/putong/core/data/Message$61;
.super Ll/vzf0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/Message;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/vzf0<",
        "Lcom/p1/mobile/putong/core/data/Message;",
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
    const-string p1, " (_id INTEGER PRIMARY KEY,id_c TEXT,localCreatedTime_c INTEGER,localCreatedSession_c INTEGER,localInMoment_c INTEGER,localInConversation_c INTEGER,createdTime_c REAL,cid_c TEXT,media_c BLOB,sticker_c TEXT,question_c TEXT,sentFrom_c INTEGER,moment_c TEXT,answerOfMessage_c TEXT,owner_c TEXT,location_c BLOB,recalled_c INTEGER,value_c TEXT,localNotificationStatus_c INTEGER,likeOfMoment_c TEXT,localAnimationKey_c TEXT,api_only_accessory_c BLOB,giftRecords_c BLOB,call_c BLOB,localCallType_c TEXT,localCallStatus_c INTEGER,localCallHandledStatus_c INTEGER,localPrivateQuestions_c BLOB,letter_c BLOB,chatTyping_c INTEGER,localFailType_c INTEGER,recalledReason_c TEXT,recalledHint_c TEXT,msgType_c INTEGER,messageType_c INTEGER,additionalData_c BLOB,localSafetyReminder_c INTEGER,localSensitiveWordReminder_c INTEGER,msgData_c TEXT,localBusinessTypes_c BLOB,settings_anonymous_c INTEGER,channel_c INTEGER,notifiedUsers_c BLOB,status_c INTEGER,referenceMsgId_c TEXT,hostId_c TEXT,localRedPacketType_c TEXT,localAudioText_c BLOB,localGreetingId_c TEXT,read_c INTEGER,needRead_c INTEGER,extData_c BLOB,fromConvType_c TEXT,localExtraInfo_c TEXT,str_sentFrom_c TEXT,str_localNotificationStatus_c TEXT,str_localCallHandledStatus_c TEXT,str_msgType_c TEXT,str_messageType_c TEXT,str_localBusinessTypes_c BLOB,str_channel_c TEXT,str_status_c TEXT,incTempInfo_c TEXT,riskTags_c BLOB,localMyVisitorCount_c INTEGER,localMyVisitorHidden_c INTEGER)"

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
    const-class p0, Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    return-object p0
.end method

.method public init()Lcom/p1/mobile/putong/core/data/Message;
    .locals 2

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/Message;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->api_only_otherUser:Ljava/lang/String;

    .line 7
    .line 8
    const-string v1, ""

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->api_only_otherUser:Ljava/lang/String;

    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 15
    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 19
    .line 20
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 21
    .line 22
    if-nez v0, :cond_2

    .line 23
    .line 24
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 25
    .line 26
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 27
    .line 28
    if-nez v0, :cond_3

    .line 29
    .line 30
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 31
    .line 32
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 33
    .line 34
    if-nez v0, :cond_4

    .line 35
    .line 36
    sget-object v0, Lcom/p1/mobile/putong/core/data/NotificationStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 37
    .line 38
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 43
    .line 44
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 45
    .line 46
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->localCallHandledStatus:Lcom/p1/mobile/putong/core/data/CallHandledStatus;

    .line 47
    .line 48
    if-nez v0, :cond_5

    .line 49
    .line 50
    sget-object v0, Lcom/p1/mobile/putong/core/data/CallHandledStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 51
    .line 52
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    check-cast v0, Lcom/p1/mobile/putong/core/data/CallHandledStatus;

    .line 57
    .line 58
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->localCallHandledStatus:Lcom/p1/mobile/putong/core/data/CallHandledStatus;

    .line 59
    .line 60
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->localPrivateQuestions:Ljava/util/List;

    .line 61
    .line 62
    if-nez v0, :cond_6

    .line 63
    .line 64
    new-instance v0, Ljava/util/ArrayList;

    .line 65
    .line 66
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 67
    .line 68
    .line 69
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->localPrivateQuestions:Ljava/util/List;

    .line 70
    .line 71
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->commentInfo:Lcom/p1/mobile/putong/core/data/CommentInfo;

    .line 72
    .line 73
    if-nez v0, :cond_7

    .line 74
    .line 75
    invoke-static {}, Lcom/p1/mobile/putong/core/data/CommentInfo;->new_()Lcom/p1/mobile/putong/core/data/CommentInfo;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->commentInfo:Lcom/p1/mobile/putong/core/data/CommentInfo;

    .line 80
    .line 81
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->parentCommentId:Ljava/lang/String;

    .line 82
    .line 83
    if-nez v0, :cond_8

    .line 84
    .line 85
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->parentCommentId:Ljava/lang/String;

    .line 86
    .line 87
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->subCommentIds:Ljava/util/List;

    .line 88
    .line 89
    if-nez v0, :cond_9

    .line 90
    .line 91
    new-instance v0, Ljava/util/ArrayList;

    .line 92
    .line 93
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 94
    .line 95
    .line 96
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->subCommentIds:Ljava/util/List;

    .line 97
    .line 98
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->moreSubComments:Ljava/lang/String;

    .line 99
    .line 100
    if-nez v0, :cond_a

    .line 101
    .line 102
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->moreSubComments:Ljava/lang/String;

    .line 103
    .line 104
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->localBusinessTypes:Ljava/util/List;

    .line 105
    .line 106
    if-nez v0, :cond_b

    .line 107
    .line 108
    new-instance v0, Ljava/util/ArrayList;

    .line 109
    .line 110
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 111
    .line 112
    .line 113
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->localBusinessTypes:Ljava/util/List;

    .line 114
    .line 115
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->settings:Lcom/p1/mobile/putong/core/data/MessageSetting;

    .line 116
    .line 117
    if-nez v0, :cond_c

    .line 118
    .line 119
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MessageSetting;->new_()Lcom/p1/mobile/putong/core/data/MessageSetting;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->settings:Lcom/p1/mobile/putong/core/data/MessageSetting;

    .line 124
    .line 125
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->channel:Lcom/p1/mobile/putong/core/data/MessageChannel;

    .line 126
    .line 127
    if-nez v0, :cond_d

    .line 128
    .line 129
    sget-object v0, Lcom/p1/mobile/putong/core/data/MessageChannel;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 130
    .line 131
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    check-cast v0, Lcom/p1/mobile/putong/core/data/MessageChannel;

    .line 136
    .line 137
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->channel:Lcom/p1/mobile/putong/core/data/MessageChannel;

    .line 138
    .line 139
    :cond_d
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->notifiedUsers:Ljava/util/List;

    .line 140
    .line 141
    if-nez v0, :cond_e

    .line 142
    .line 143
    new-instance v0, Ljava/util/ArrayList;

    .line 144
    .line 145
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 146
    .line 147
    .line 148
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->notifiedUsers:Ljava/util/List;

    .line 149
    .line 150
    :cond_e
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->status:Lcom/p1/mobile/putong/core/data/MessageStatus;

    .line 151
    .line 152
    if-nez v0, :cond_f

    .line 153
    .line 154
    sget-object v0, Lcom/p1/mobile/putong/core/data/MessageStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 155
    .line 156
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    check-cast v0, Lcom/p1/mobile/putong/core/data/MessageStatus;

    .line 161
    .line 162
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->status:Lcom/p1/mobile/putong/core/data/MessageStatus;

    .line 163
    .line 164
    :cond_f
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->referenceMsgId:Ljava/lang/String;

    .line 165
    .line 166
    if-nez v0, :cond_10

    .line 167
    .line 168
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->referenceMsgId:Ljava/lang/String;

    .line 169
    .line 170
    :cond_10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->hostId:Ljava/lang/String;

    .line 171
    .line 172
    if-nez v0, :cond_11

    .line 173
    .line 174
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->hostId:Ljava/lang/String;

    .line 175
    .line 176
    :cond_11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->localAudioText:Lcom/p1/mobile/putong/core/data/AudioText;

    .line 177
    .line 178
    if-nez v0, :cond_12

    .line 179
    .line 180
    invoke-static {}, Lcom/p1/mobile/putong/core/data/AudioText;->new_()Lcom/p1/mobile/putong/core/data/AudioText;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->localAudioText:Lcom/p1/mobile/putong/core/data/AudioText;

    .line 185
    .line 186
    :cond_12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->consumeType:Ljava/lang/String;

    .line 187
    .line 188
    if-nez v0, :cond_13

    .line 189
    .line 190
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->consumeType:Ljava/lang/String;

    .line 191
    .line 192
    :cond_13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->coinSign:Ljava/lang/String;

    .line 193
    .line 194
    if-nez v0, :cond_14

    .line 195
    .line 196
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->coinSign:Ljava/lang/String;

    .line 197
    .line 198
    :cond_14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->action:Ljava/lang/String;

    .line 199
    .line 200
    if-nez v0, :cond_15

    .line 201
    .line 202
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->action:Ljava/lang/String;

    .line 203
    .line 204
    :cond_15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->riskTags:Ljava/util/List;

    .line 205
    .line 206
    if-nez v0, :cond_16

    .line 207
    .line 208
    new-instance v0, Ljava/util/ArrayList;

    .line 209
    .line 210
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 211
    .line 212
    .line 213
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->riskTags:Ljava/util/List;

    .line 214
    .line 215
    :cond_16
    return-object p0
.end method

.method public bridge synthetic init()Ljava/lang/Object;
    .locals 0

    .line 216
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Message$61;->init()Lcom/p1/mobile/putong/core/data/Message;

    move-result-object p0

    return-object p0
.end method

.method public read(Landroid/database/Cursor;I)Lcom/p1/mobile/putong/core/data/Message;
    .locals 22

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    const-string v2, "unknown_"

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    if-nez p2, :cond_0

    .line 9
    .line 10
    iput v3, v0, Ll/vzf0;->readIndex:I

    .line 11
    .line 12
    :cond_0
    new-instance v4, Lcom/p1/mobile/putong/core/data/Message;

    .line 13
    .line 14
    invoke-direct {v4}, Lcom/p1/mobile/putong/core/data/Message;-><init>()V

    .line 15
    .line 16
    .line 17
    const/4 v5, -0x1

    .line 18
    :try_start_0
    new-instance v7, Lcom/p1/mobile/putong/core/data/MessageSetting;

    .line 19
    .line 20
    invoke-direct {v7}, Lcom/p1/mobile/putong/core/data/MessageSetting;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v7, v4, Lcom/p1/mobile/putong/core/data/Message;->settings:Lcom/p1/mobile/putong/core/data/MessageSetting;

    .line 24
    .line 25
    invoke-interface/range {p1 .. p2}, Landroid/database/Cursor;->getLong(I)J

    .line 26
    .line 27
    .line 28
    move-result-wide v7

    .line 29
    iput-wide v7, v4, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 30
    .line 31
    add-int/lit8 v7, p2, 0x1

    .line 32
    .line 33
    invoke-interface {v1, v7}, Landroid/database/Cursor;->isNull(I)Z

    .line 34
    .line 35
    .line 36
    move-result v8

    .line 37
    if-eqz v8, :cond_1

    .line 38
    .line 39
    const/4 v7, 0x0

    .line 40
    goto :goto_0

    .line 41
    :cond_1
    invoke-interface {v1, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v7

    .line 45
    :goto_0
    iput-object v7, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 46
    .line 47
    add-int/lit8 v7, p2, 0x2

    .line 48
    .line 49
    invoke-interface {v1, v7}, Landroid/database/Cursor;->getLong(I)J

    .line 50
    .line 51
    .line 52
    move-result-wide v7

    .line 53
    iput-wide v7, v4, Lcom/p1/mobile/putong/core/data/Message;->localCreatedTime:J

    .line 54
    .line 55
    add-int/lit8 v7, p2, 0x3

    .line 56
    .line 57
    invoke-interface {v1, v7}, Landroid/database/Cursor;->getInt(I)I

    .line 58
    .line 59
    .line 60
    move-result v7

    .line 61
    iput v7, v4, Lcom/p1/mobile/putong/core/data/Message;->localCreatedSession:I

    .line 62
    .line 63
    add-int/lit8 v7, p2, 0x4

    .line 64
    .line 65
    invoke-interface {v1, v7}, Landroid/database/Cursor;->getInt(I)I

    .line 66
    .line 67
    .line 68
    move-result v7

    .line 69
    const/4 v8, 0x1

    .line 70
    if-ne v7, v8, :cond_2

    .line 71
    .line 72
    move v7, v8

    .line 73
    goto :goto_1

    .line 74
    :cond_2
    move v7, v3

    .line 75
    :goto_1
    iput-boolean v7, v4, Lcom/p1/mobile/putong/core/data/Message;->localInMoment:Z

    .line 76
    .line 77
    add-int/lit8 v7, p2, 0x5

    .line 78
    .line 79
    invoke-interface {v1, v7}, Landroid/database/Cursor;->getInt(I)I

    .line 80
    .line 81
    .line 82
    move-result v7

    .line 83
    if-ne v7, v8, :cond_3

    .line 84
    .line 85
    move v7, v8

    .line 86
    goto :goto_2

    .line 87
    :cond_3
    move v7, v3

    .line 88
    :goto_2
    iput-boolean v7, v4, Lcom/p1/mobile/putong/core/data/Message;->localInConversation:Z

    .line 89
    .line 90
    add-int/lit8 v7, p2, 0x6

    .line 91
    .line 92
    invoke-interface {v1, v7}, Landroid/database/Cursor;->getDouble(I)D

    .line 93
    .line 94
    .line 95
    move-result-wide v9

    .line 96
    iput-wide v9, v4, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 97
    .line 98
    add-int/lit8 v7, p2, 0x7

    .line 99
    .line 100
    invoke-interface {v1, v7}, Landroid/database/Cursor;->isNull(I)Z

    .line 101
    .line 102
    .line 103
    move-result v9

    .line 104
    if-eqz v9, :cond_4

    .line 105
    .line 106
    const/4 v7, 0x0

    .line 107
    goto :goto_3

    .line 108
    :cond_4
    invoke-interface {v1, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v7

    .line 112
    :goto_3
    iput-object v7, v4, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 113
    .line 114
    add-int/lit8 v7, p2, 0x8

    .line 115
    .line 116
    invoke-interface {v1, v7}, Landroid/database/Cursor;->isNull(I)Z

    .line 117
    .line 118
    .line 119
    move-result v9

    .line 120
    if-eqz v9, :cond_5

    .line 121
    .line 122
    const/4 v7, 0x0

    .line 123
    goto :goto_4

    .line 124
    :cond_5
    sget-object v9, Lcom/p1/mobile/putong/data/Media;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 125
    .line 126
    invoke-virtual {v9}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 127
    .line 128
    .line 129
    move-result-object v9

    .line 130
    invoke-interface {v1, v7}, Landroid/database/Cursor;->getBlob(I)[B

    .line 131
    .line 132
    .line 133
    move-result-object v7

    .line 134
    invoke-virtual {v9, v7}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 135
    .line 136
    .line 137
    move-result-object v7

    .line 138
    check-cast v7, Ljava/util/List;

    .line 139
    .line 140
    :goto_4
    iput-object v7, v4, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 141
    .line 142
    add-int/lit8 v7, p2, 0x9

    .line 143
    .line 144
    invoke-interface {v1, v7}, Landroid/database/Cursor;->isNull(I)Z

    .line 145
    .line 146
    .line 147
    move-result v9

    .line 148
    if-eqz v9, :cond_6

    .line 149
    .line 150
    const/4 v7, 0x0

    .line 151
    goto :goto_5

    .line 152
    :cond_6
    invoke-interface {v1, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v7

    .line 156
    :goto_5
    iput-object v7, v4, Lcom/p1/mobile/putong/core/data/Message;->sticker:Ljava/lang/String;

    .line 157
    .line 158
    add-int/lit8 v7, p2, 0xa

    .line 159
    .line 160
    invoke-interface {v1, v7}, Landroid/database/Cursor;->isNull(I)Z

    .line 161
    .line 162
    .line 163
    move-result v9

    .line 164
    if-eqz v9, :cond_7

    .line 165
    .line 166
    const/4 v7, 0x0

    .line 167
    goto :goto_6

    .line 168
    :cond_7
    invoke-interface {v1, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v7

    .line 172
    :goto_6
    iput-object v7, v4, Lcom/p1/mobile/putong/core/data/Message;->question:Ljava/lang/String;

    .line 173
    .line 174
    add-int/lit8 v7, p2, 0xb

    .line 175
    .line 176
    invoke-interface {v1, v7}, Landroid/database/Cursor;->isNull(I)Z

    .line 177
    .line 178
    .line 179
    move-result v9

    .line 180
    if-eqz v9, :cond_8

    .line 181
    .line 182
    move v7, v5

    .line 183
    goto :goto_7

    .line 184
    :cond_8
    invoke-interface {v1, v7}, Landroid/database/Cursor;->getInt(I)I

    .line 185
    .line 186
    .line 187
    move-result v7
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_10

    .line 188
    :goto_7
    add-int/lit8 v9, p2, 0xc

    .line 189
    .line 190
    :try_start_1
    invoke-interface {v1, v9}, Landroid/database/Cursor;->isNull(I)Z

    .line 191
    .line 192
    .line 193
    move-result v10

    .line 194
    if-eqz v10, :cond_9

    .line 195
    .line 196
    const/4 v9, 0x0

    .line 197
    goto :goto_8

    .line 198
    :cond_9
    invoke-interface {v1, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object v9

    .line 202
    :goto_8
    iput-object v9, v4, Lcom/p1/mobile/putong/core/data/Message;->moment:Ljava/lang/String;

    .line 203
    .line 204
    add-int/lit8 v9, p2, 0xd

    .line 205
    .line 206
    invoke-interface {v1, v9}, Landroid/database/Cursor;->isNull(I)Z

    .line 207
    .line 208
    .line 209
    move-result v10

    .line 210
    if-eqz v10, :cond_a

    .line 211
    .line 212
    const/4 v9, 0x0

    .line 213
    goto :goto_9

    .line 214
    :cond_a
    invoke-interface {v1, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 215
    .line 216
    .line 217
    move-result-object v9

    .line 218
    :goto_9
    iput-object v9, v4, Lcom/p1/mobile/putong/core/data/Message;->answerOfMessage:Ljava/lang/String;

    .line 219
    .line 220
    add-int/lit8 v9, p2, 0xe

    .line 221
    .line 222
    invoke-interface {v1, v9}, Landroid/database/Cursor;->isNull(I)Z

    .line 223
    .line 224
    .line 225
    move-result v10

    .line 226
    if-eqz v10, :cond_b

    .line 227
    .line 228
    const/4 v9, 0x0

    .line 229
    goto :goto_a

    .line 230
    :cond_b
    invoke-interface {v1, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 231
    .line 232
    .line 233
    move-result-object v9

    .line 234
    :goto_a
    iput-object v9, v4, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 235
    .line 236
    add-int/lit8 v9, p2, 0xf

    .line 237
    .line 238
    invoke-interface {v1, v9}, Landroid/database/Cursor;->isNull(I)Z

    .line 239
    .line 240
    .line 241
    move-result v10

    .line 242
    if-eqz v10, :cond_c

    .line 243
    .line 244
    const/4 v9, 0x0

    .line 245
    goto :goto_b

    .line 246
    :cond_c
    sget-object v10, Lcom/p1/mobile/putong/data/MessageLocation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 247
    .line 248
    invoke-interface {v1, v9}, Landroid/database/Cursor;->getBlob(I)[B

    .line 249
    .line 250
    .line 251
    move-result-object v9

    .line 252
    invoke-virtual {v10, v9}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 253
    .line 254
    .line 255
    move-result-object v9

    .line 256
    check-cast v9, Lcom/p1/mobile/putong/data/MessageLocation;

    .line 257
    .line 258
    :goto_b
    iput-object v9, v4, Lcom/p1/mobile/putong/core/data/Message;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 259
    .line 260
    add-int/lit8 v9, p2, 0x10

    .line 261
    .line 262
    invoke-interface {v1, v9}, Landroid/database/Cursor;->isNull(I)Z

    .line 263
    .line 264
    .line 265
    move-result v10

    .line 266
    if-eqz v10, :cond_d

    .line 267
    .line 268
    const/4 v9, 0x0

    .line 269
    goto :goto_d

    .line 270
    :cond_d
    invoke-interface {v1, v9}, Landroid/database/Cursor;->getInt(I)I

    .line 271
    .line 272
    .line 273
    move-result v9

    .line 274
    if-ne v9, v8, :cond_e

    .line 275
    .line 276
    move v9, v8

    .line 277
    goto :goto_c

    .line 278
    :cond_e
    move v9, v3

    .line 279
    :goto_c
    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 280
    .line 281
    .line 282
    move-result-object v9

    .line 283
    :goto_d
    iput-object v9, v4, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    .line 284
    .line 285
    add-int/lit8 v9, p2, 0x11

    .line 286
    .line 287
    invoke-interface {v1, v9}, Landroid/database/Cursor;->isNull(I)Z

    .line 288
    .line 289
    .line 290
    move-result v10

    .line 291
    if-eqz v10, :cond_f

    .line 292
    .line 293
    const/4 v9, 0x0

    .line 294
    goto :goto_e

    .line 295
    :cond_f
    invoke-interface {v1, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 296
    .line 297
    .line 298
    move-result-object v9

    .line 299
    :goto_e
    iput-object v9, v4, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 300
    .line 301
    add-int/lit8 v9, p2, 0x12

    .line 302
    .line 303
    invoke-interface {v1, v9}, Landroid/database/Cursor;->isNull(I)Z

    .line 304
    .line 305
    .line 306
    move-result v10

    .line 307
    if-eqz v10, :cond_10

    .line 308
    .line 309
    move v9, v5

    .line 310
    goto :goto_f

    .line 311
    :cond_10
    invoke-interface {v1, v9}, Landroid/database/Cursor;->getInt(I)I

    .line 312
    .line 313
    .line 314
    move-result v9
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_f

    .line 315
    :goto_f
    add-int/lit8 v10, p2, 0x13

    .line 316
    .line 317
    :try_start_2
    invoke-interface {v1, v10}, Landroid/database/Cursor;->isNull(I)Z

    .line 318
    .line 319
    .line 320
    move-result v11

    .line 321
    if-eqz v11, :cond_11

    .line 322
    .line 323
    const/4 v10, 0x0

    .line 324
    goto :goto_10

    .line 325
    :cond_11
    invoke-interface {v1, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 326
    .line 327
    .line 328
    move-result-object v10

    .line 329
    :goto_10
    iput-object v10, v4, Lcom/p1/mobile/putong/core/data/Message;->likeOfMoment:Ljava/lang/String;

    .line 330
    .line 331
    add-int/lit8 v10, p2, 0x14

    .line 332
    .line 333
    invoke-interface {v1, v10}, Landroid/database/Cursor;->isNull(I)Z

    .line 334
    .line 335
    .line 336
    move-result v11

    .line 337
    if-eqz v11, :cond_12

    .line 338
    .line 339
    const/4 v10, 0x0

    .line 340
    goto :goto_11

    .line 341
    :cond_12
    invoke-interface {v1, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 342
    .line 343
    .line 344
    move-result-object v10

    .line 345
    :goto_11
    iput-object v10, v4, Lcom/p1/mobile/putong/core/data/Message;->localAnimationKey:Ljava/lang/String;

    .line 346
    .line 347
    add-int/lit8 v10, p2, 0x15

    .line 348
    .line 349
    invoke-interface {v1, v10}, Landroid/database/Cursor;->isNull(I)Z

    .line 350
    .line 351
    .line 352
    move-result v11

    .line 353
    if-eqz v11, :cond_13

    .line 354
    .line 355
    const/4 v10, 0x0

    .line 356
    goto :goto_12

    .line 357
    :cond_13
    sget-object v11, Lcom/p1/mobile/putong/core/data/MessageAccessory;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 358
    .line 359
    invoke-interface {v1, v10}, Landroid/database/Cursor;->getBlob(I)[B

    .line 360
    .line 361
    .line 362
    move-result-object v10

    .line 363
    invoke-virtual {v11, v10}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 364
    .line 365
    .line 366
    move-result-object v10

    .line 367
    check-cast v10, Lcom/p1/mobile/putong/core/data/MessageAccessory;

    .line 368
    .line 369
    :goto_12
    iput-object v10, v4, Lcom/p1/mobile/putong/core/data/Message;->api_only_accessory:Lcom/p1/mobile/putong/core/data/MessageAccessory;

    .line 370
    .line 371
    add-int/lit8 v10, p2, 0x16

    .line 372
    .line 373
    invoke-interface {v1, v10}, Landroid/database/Cursor;->isNull(I)Z

    .line 374
    .line 375
    .line 376
    move-result v11

    .line 377
    if-eqz v11, :cond_14

    .line 378
    .line 379
    const/4 v10, 0x0

    .line 380
    goto :goto_13

    .line 381
    :cond_14
    sget-object v11, Lcom/p1/mobile/putong/core/data/GiftRecord;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 382
    .line 383
    invoke-virtual {v11}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 384
    .line 385
    .line 386
    move-result-object v11

    .line 387
    invoke-interface {v1, v10}, Landroid/database/Cursor;->getBlob(I)[B

    .line 388
    .line 389
    .line 390
    move-result-object v10

    .line 391
    invoke-virtual {v11, v10}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 392
    .line 393
    .line 394
    move-result-object v10

    .line 395
    check-cast v10, Ljava/util/List;

    .line 396
    .line 397
    :goto_13
    iput-object v10, v4, Lcom/p1/mobile/putong/core/data/Message;->giftRecords:Ljava/util/List;

    .line 398
    .line 399
    add-int/lit8 v10, p2, 0x17

    .line 400
    .line 401
    invoke-interface {v1, v10}, Landroid/database/Cursor;->isNull(I)Z

    .line 402
    .line 403
    .line 404
    move-result v11

    .line 405
    if-eqz v11, :cond_15

    .line 406
    .line 407
    const/4 v10, 0x0

    .line 408
    goto :goto_14

    .line 409
    :cond_15
    sget-object v11, Lcom/p1/mobile/putong/core/data/CallRecord;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 410
    .line 411
    invoke-interface {v1, v10}, Landroid/database/Cursor;->getBlob(I)[B

    .line 412
    .line 413
    .line 414
    move-result-object v10

    .line 415
    invoke-virtual {v11, v10}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 416
    .line 417
    .line 418
    move-result-object v10

    .line 419
    check-cast v10, Lcom/p1/mobile/putong/core/data/CallRecord;

    .line 420
    .line 421
    :goto_14
    iput-object v10, v4, Lcom/p1/mobile/putong/core/data/Message;->call:Lcom/p1/mobile/putong/core/data/CallRecord;

    .line 422
    .line 423
    add-int/lit8 v10, p2, 0x18

    .line 424
    .line 425
    invoke-interface {v1, v10}, Landroid/database/Cursor;->isNull(I)Z

    .line 426
    .line 427
    .line 428
    move-result v11

    .line 429
    if-eqz v11, :cond_16

    .line 430
    .line 431
    const/4 v10, 0x0

    .line 432
    goto :goto_15

    .line 433
    :cond_16
    invoke-interface {v1, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 434
    .line 435
    .line 436
    move-result-object v10

    .line 437
    :goto_15
    iput-object v10, v4, Lcom/p1/mobile/putong/core/data/Message;->localCallType:Ljava/lang/String;

    .line 438
    .line 439
    add-int/lit8 v10, p2, 0x19

    .line 440
    .line 441
    invoke-interface {v1, v10}, Landroid/database/Cursor;->getInt(I)I

    .line 442
    .line 443
    .line 444
    move-result v10

    .line 445
    iput v10, v4, Lcom/p1/mobile/putong/core/data/Message;->localCallStatus:I

    .line 446
    .line 447
    add-int/lit8 v10, p2, 0x1a

    .line 448
    .line 449
    invoke-interface {v1, v10}, Landroid/database/Cursor;->isNull(I)Z

    .line 450
    .line 451
    .line 452
    move-result v11

    .line 453
    if-eqz v11, :cond_17

    .line 454
    .line 455
    move v10, v5

    .line 456
    goto :goto_16

    .line 457
    :cond_17
    invoke-interface {v1, v10}, Landroid/database/Cursor;->getInt(I)I

    .line 458
    .line 459
    .line 460
    move-result v10
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_e

    .line 461
    :goto_16
    add-int/lit8 v11, p2, 0x1b

    .line 462
    .line 463
    :try_start_3
    invoke-interface {v1, v11}, Landroid/database/Cursor;->isNull(I)Z

    .line 464
    .line 465
    .line 466
    move-result v12

    .line 467
    if-eqz v12, :cond_18

    .line 468
    .line 469
    const/4 v11, 0x0

    .line 470
    goto :goto_17

    .line 471
    :cond_18
    sget-object v12, Lcom/p1/mobile/putong/core/data/PrivateQuestion;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 472
    .line 473
    invoke-virtual {v12}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 474
    .line 475
    .line 476
    move-result-object v12

    .line 477
    invoke-interface {v1, v11}, Landroid/database/Cursor;->getBlob(I)[B

    .line 478
    .line 479
    .line 480
    move-result-object v11

    .line 481
    invoke-virtual {v12, v11}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 482
    .line 483
    .line 484
    move-result-object v11

    .line 485
    check-cast v11, Ljava/util/List;

    .line 486
    .line 487
    :goto_17
    iput-object v11, v4, Lcom/p1/mobile/putong/core/data/Message;->localPrivateQuestions:Ljava/util/List;

    .line 488
    .line 489
    add-int/lit8 v11, p2, 0x1c

    .line 490
    .line 491
    invoke-interface {v1, v11}, Landroid/database/Cursor;->isNull(I)Z

    .line 492
    .line 493
    .line 494
    move-result v12

    .line 495
    if-eqz v12, :cond_19

    .line 496
    .line 497
    const/4 v11, 0x0

    .line 498
    goto :goto_18

    .line 499
    :cond_19
    sget-object v12, Lcom/p1/mobile/putong/core/data/Letter;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 500
    .line 501
    invoke-interface {v1, v11}, Landroid/database/Cursor;->getBlob(I)[B

    .line 502
    .line 503
    .line 504
    move-result-object v11

    .line 505
    invoke-virtual {v12, v11}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 506
    .line 507
    .line 508
    move-result-object v11

    .line 509
    check-cast v11, Lcom/p1/mobile/putong/core/data/Letter;

    .line 510
    .line 511
    :goto_18
    iput-object v11, v4, Lcom/p1/mobile/putong/core/data/Message;->letter:Lcom/p1/mobile/putong/core/data/Letter;

    .line 512
    .line 513
    add-int/lit8 v11, p2, 0x1d

    .line 514
    .line 515
    invoke-interface {v1, v11}, Landroid/database/Cursor;->getInt(I)I

    .line 516
    .line 517
    .line 518
    move-result v11

    .line 519
    if-ne v11, v8, :cond_1a

    .line 520
    .line 521
    move v11, v8

    .line 522
    goto :goto_19

    .line 523
    :cond_1a
    move v11, v3

    .line 524
    :goto_19
    iput-boolean v11, v4, Lcom/p1/mobile/putong/core/data/Message;->chatTyping:Z

    .line 525
    .line 526
    add-int/lit8 v11, p2, 0x1e

    .line 527
    .line 528
    invoke-interface {v1, v11}, Landroid/database/Cursor;->getInt(I)I

    .line 529
    .line 530
    .line 531
    move-result v11

    .line 532
    iput v11, v4, Lcom/p1/mobile/putong/core/data/Message;->localFailType:I

    .line 533
    .line 534
    add-int/lit8 v11, p2, 0x1f

    .line 535
    .line 536
    invoke-interface {v1, v11}, Landroid/database/Cursor;->isNull(I)Z

    .line 537
    .line 538
    .line 539
    move-result v12

    .line 540
    if-eqz v12, :cond_1b

    .line 541
    .line 542
    const/4 v11, 0x0

    .line 543
    goto :goto_1a

    .line 544
    :cond_1b
    invoke-interface {v1, v11}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 545
    .line 546
    .line 547
    move-result-object v11

    .line 548
    :goto_1a
    iput-object v11, v4, Lcom/p1/mobile/putong/core/data/Message;->recalledReason:Ljava/lang/String;

    .line 549
    .line 550
    add-int/lit8 v11, p2, 0x20

    .line 551
    .line 552
    invoke-interface {v1, v11}, Landroid/database/Cursor;->isNull(I)Z

    .line 553
    .line 554
    .line 555
    move-result v12

    .line 556
    if-eqz v12, :cond_1c

    .line 557
    .line 558
    const/4 v11, 0x0

    .line 559
    goto :goto_1b

    .line 560
    :cond_1c
    invoke-interface {v1, v11}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 561
    .line 562
    .line 563
    move-result-object v11

    .line 564
    :goto_1b
    iput-object v11, v4, Lcom/p1/mobile/putong/core/data/Message;->recalledHint:Ljava/lang/String;

    .line 565
    .line 566
    add-int/lit8 v11, p2, 0x21

    .line 567
    .line 568
    invoke-interface {v1, v11}, Landroid/database/Cursor;->isNull(I)Z

    .line 569
    .line 570
    .line 571
    move-result v12

    .line 572
    if-eqz v12, :cond_1d

    .line 573
    .line 574
    move v11, v5

    .line 575
    goto :goto_1c

    .line 576
    :cond_1d
    invoke-interface {v1, v11}, Landroid/database/Cursor;->getInt(I)I

    .line 577
    .line 578
    .line 579
    move-result v11
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_d

    .line 580
    :goto_1c
    add-int/lit8 v12, p2, 0x22

    .line 581
    .line 582
    :try_start_4
    invoke-interface {v1, v12}, Landroid/database/Cursor;->isNull(I)Z

    .line 583
    .line 584
    .line 585
    move-result v13

    .line 586
    if-eqz v13, :cond_1e

    .line 587
    .line 588
    move v12, v5

    .line 589
    goto :goto_1d

    .line 590
    :cond_1e
    invoke-interface {v1, v12}, Landroid/database/Cursor;->getInt(I)I

    .line 591
    .line 592
    .line 593
    move-result v12
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_c

    .line 594
    :goto_1d
    add-int/lit8 v13, p2, 0x23

    .line 595
    .line 596
    :try_start_5
    invoke-interface {v1, v13}, Landroid/database/Cursor;->isNull(I)Z

    .line 597
    .line 598
    .line 599
    move-result v14

    .line 600
    if-eqz v14, :cond_1f

    .line 601
    .line 602
    const/4 v13, 0x0

    .line 603
    goto :goto_1e

    .line 604
    :cond_1f
    sget-object v14, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 605
    .line 606
    invoke-interface {v1, v13}, Landroid/database/Cursor;->getBlob(I)[B

    .line 607
    .line 608
    .line 609
    move-result-object v13

    .line 610
    invoke-virtual {v14, v13}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 611
    .line 612
    .line 613
    move-result-object v13

    .line 614
    check-cast v13, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 615
    .line 616
    :goto_1e
    iput-object v13, v4, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 617
    .line 618
    add-int/lit8 v13, p2, 0x24

    .line 619
    .line 620
    invoke-interface {v1, v13}, Landroid/database/Cursor;->getInt(I)I

    .line 621
    .line 622
    .line 623
    move-result v13

    .line 624
    if-ne v13, v8, :cond_20

    .line 625
    .line 626
    move v13, v8

    .line 627
    goto :goto_1f

    .line 628
    :cond_20
    move v13, v3

    .line 629
    :goto_1f
    iput-boolean v13, v4, Lcom/p1/mobile/putong/core/data/Message;->localSafetyReminder:Z

    .line 630
    .line 631
    add-int/lit8 v13, p2, 0x25

    .line 632
    .line 633
    invoke-interface {v1, v13}, Landroid/database/Cursor;->getInt(I)I

    .line 634
    .line 635
    .line 636
    move-result v13

    .line 637
    if-ne v13, v8, :cond_21

    .line 638
    .line 639
    move v13, v8

    .line 640
    goto :goto_20

    .line 641
    :cond_21
    move v13, v3

    .line 642
    :goto_20
    iput-boolean v13, v4, Lcom/p1/mobile/putong/core/data/Message;->localSensitiveWordReminder:Z

    .line 643
    .line 644
    add-int/lit8 v13, p2, 0x26

    .line 645
    .line 646
    invoke-interface {v1, v13}, Landroid/database/Cursor;->isNull(I)Z

    .line 647
    .line 648
    .line 649
    move-result v14

    .line 650
    if-eqz v14, :cond_22

    .line 651
    .line 652
    const/4 v13, 0x0

    .line 653
    goto :goto_21

    .line 654
    :cond_22
    invoke-interface {v1, v13}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 655
    .line 656
    .line 657
    move-result-object v13

    .line 658
    :goto_21
    iput-object v13, v4, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 659
    .line 660
    add-int/lit8 v13, p2, 0x27

    .line 661
    .line 662
    invoke-interface {v1, v13}, Landroid/database/Cursor;->isNull(I)Z

    .line 663
    .line 664
    .line 665
    move-result v14

    .line 666
    if-eqz v14, :cond_23

    .line 667
    .line 668
    const/4 v13, 0x0

    .line 669
    goto :goto_22

    .line 670
    :cond_23
    sget-object v14, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 671
    .line 672
    invoke-virtual {v14}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 673
    .line 674
    .line 675
    move-result-object v14

    .line 676
    invoke-interface {v1, v13}, Landroid/database/Cursor;->getBlob(I)[B

    .line 677
    .line 678
    .line 679
    move-result-object v13

    .line 680
    invoke-virtual {v14, v13}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 681
    .line 682
    .line 683
    move-result-object v13

    .line 684
    check-cast v13, Ljava/util/List;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_b

    .line 685
    .line 686
    :goto_22
    add-int/lit8 v14, p2, 0x28

    .line 687
    .line 688
    :try_start_6
    iget-object v15, v4, Lcom/p1/mobile/putong/core/data/Message;->settings:Lcom/p1/mobile/putong/core/data/MessageSetting;

    .line 689
    .line 690
    invoke-interface {v1, v14}, Landroid/database/Cursor;->getInt(I)I

    .line 691
    .line 692
    .line 693
    move-result v14

    .line 694
    if-ne v14, v8, :cond_24

    .line 695
    .line 696
    move v14, v8

    .line 697
    goto :goto_23

    .line 698
    :cond_24
    move v14, v3

    .line 699
    :goto_23
    iput-boolean v14, v15, Lcom/p1/mobile/putong/core/data/MessageSetting;->anonymous:Z

    .line 700
    .line 701
    add-int/lit8 v14, p2, 0x29

    .line 702
    .line 703
    invoke-interface {v1, v14}, Landroid/database/Cursor;->isNull(I)Z

    .line 704
    .line 705
    .line 706
    move-result v15

    .line 707
    if-eqz v15, :cond_25

    .line 708
    .line 709
    move v14, v5

    .line 710
    goto :goto_24

    .line 711
    :cond_25
    invoke-interface {v1, v14}, Landroid/database/Cursor;->getInt(I)I

    .line 712
    .line 713
    .line 714
    move-result v14
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_a

    .line 715
    :goto_24
    add-int/lit8 v15, p2, 0x2a

    .line 716
    .line 717
    :try_start_7
    invoke-interface {v1, v15}, Landroid/database/Cursor;->isNull(I)Z

    .line 718
    .line 719
    .line 720
    move-result v16

    .line 721
    if-eqz v16, :cond_26

    .line 722
    .line 723
    const/4 v3, 0x0

    .line 724
    goto :goto_25

    .line 725
    :cond_26
    sget-object v16, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 726
    .line 727
    invoke-virtual/range {v16 .. v16}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 728
    .line 729
    .line 730
    move-result-object v3

    .line 731
    invoke-interface {v1, v15}, Landroid/database/Cursor;->getBlob(I)[B

    .line 732
    .line 733
    .line 734
    move-result-object v15

    .line 735
    invoke-virtual {v3, v15}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 736
    .line 737
    .line 738
    move-result-object v3

    .line 739
    check-cast v3, Ljava/util/List;

    .line 740
    .line 741
    :goto_25
    iput-object v3, v4, Lcom/p1/mobile/putong/core/data/Message;->notifiedUsers:Ljava/util/List;

    .line 742
    .line 743
    add-int/lit8 v3, p2, 0x2b

    .line 744
    .line 745
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 746
    .line 747
    .line 748
    move-result v15

    .line 749
    if-eqz v15, :cond_27

    .line 750
    .line 751
    goto :goto_26

    .line 752
    :cond_27
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getInt(I)I

    .line 753
    .line 754
    .line 755
    move-result v5

    .line 756
    :goto_26
    add-int/lit8 v3, p2, 0x2c

    .line 757
    .line 758
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 759
    .line 760
    .line 761
    move-result v15

    .line 762
    if-eqz v15, :cond_28

    .line 763
    .line 764
    const/4 v3, 0x0

    .line 765
    goto :goto_27

    .line 766
    :cond_28
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 767
    .line 768
    .line 769
    move-result-object v3

    .line 770
    :goto_27
    iput-object v3, v4, Lcom/p1/mobile/putong/core/data/Message;->referenceMsgId:Ljava/lang/String;

    .line 771
    .line 772
    add-int/lit8 v3, p2, 0x2d

    .line 773
    .line 774
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 775
    .line 776
    .line 777
    move-result v15

    .line 778
    if-eqz v15, :cond_29

    .line 779
    .line 780
    const/4 v3, 0x0

    .line 781
    goto :goto_28

    .line 782
    :cond_29
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 783
    .line 784
    .line 785
    move-result-object v3

    .line 786
    :goto_28
    iput-object v3, v4, Lcom/p1/mobile/putong/core/data/Message;->hostId:Ljava/lang/String;

    .line 787
    .line 788
    add-int/lit8 v3, p2, 0x2e

    .line 789
    .line 790
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 791
    .line 792
    .line 793
    move-result v15

    .line 794
    if-eqz v15, :cond_2a

    .line 795
    .line 796
    const/4 v3, 0x0

    .line 797
    goto :goto_29

    .line 798
    :cond_2a
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 799
    .line 800
    .line 801
    move-result-object v3

    .line 802
    :goto_29
    iput-object v3, v4, Lcom/p1/mobile/putong/core/data/Message;->localRedPacketType:Ljava/lang/String;

    .line 803
    .line 804
    add-int/lit8 v3, p2, 0x2f

    .line 805
    .line 806
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 807
    .line 808
    .line 809
    move-result v15

    .line 810
    if-eqz v15, :cond_2b

    .line 811
    .line 812
    const/4 v3, 0x0

    .line 813
    goto :goto_2a

    .line 814
    :cond_2b
    sget-object v15, Lcom/p1/mobile/putong/core/data/AudioText;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 815
    .line 816
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    .line 817
    .line 818
    .line 819
    move-result-object v3

    .line 820
    invoke-virtual {v15, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 821
    .line 822
    .line 823
    move-result-object v3

    .line 824
    check-cast v3, Lcom/p1/mobile/putong/core/data/AudioText;

    .line 825
    .line 826
    :goto_2a
    iput-object v3, v4, Lcom/p1/mobile/putong/core/data/Message;->localAudioText:Lcom/p1/mobile/putong/core/data/AudioText;

    .line 827
    .line 828
    add-int/lit8 v3, p2, 0x30

    .line 829
    .line 830
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 831
    .line 832
    .line 833
    move-result v15

    .line 834
    if-eqz v15, :cond_2c

    .line 835
    .line 836
    const/4 v3, 0x0

    .line 837
    goto :goto_2b

    .line 838
    :cond_2c
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 839
    .line 840
    .line 841
    move-result-object v3

    .line 842
    :goto_2b
    iput-object v3, v4, Lcom/p1/mobile/putong/core/data/Message;->localGreetingId:Ljava/lang/String;

    .line 843
    .line 844
    add-int/lit8 v3, p2, 0x31

    .line 845
    .line 846
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getInt(I)I

    .line 847
    .line 848
    .line 849
    move-result v3

    .line 850
    if-ne v3, v8, :cond_2d

    .line 851
    .line 852
    move v3, v8

    .line 853
    goto :goto_2c

    .line 854
    :cond_2d
    const/4 v3, 0x0

    .line 855
    :goto_2c
    iput-boolean v3, v4, Lcom/p1/mobile/putong/core/data/Message;->read:Z

    .line 856
    .line 857
    add-int/lit8 v3, p2, 0x32

    .line 858
    .line 859
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getInt(I)I

    .line 860
    .line 861
    .line 862
    move-result v3

    .line 863
    if-ne v3, v8, :cond_2e

    .line 864
    .line 865
    move v3, v8

    .line 866
    goto :goto_2d

    .line 867
    :cond_2e
    const/4 v3, 0x0

    .line 868
    :goto_2d
    iput-boolean v3, v4, Lcom/p1/mobile/putong/core/data/Message;->needRead:Z

    .line 869
    .line 870
    add-int/lit8 v3, p2, 0x33

    .line 871
    .line 872
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 873
    .line 874
    .line 875
    move-result v15

    .line 876
    if-eqz v15, :cond_2f

    .line 877
    .line 878
    const/4 v3, 0x0

    .line 879
    goto :goto_2e

    .line 880
    :cond_2f
    sget-object v15, Lcom/p1/mobile/putong/core/data/MessageExtData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 881
    .line 882
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    .line 883
    .line 884
    .line 885
    move-result-object v3

    .line 886
    invoke-virtual {v15, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 887
    .line 888
    .line 889
    move-result-object v3

    .line 890
    check-cast v3, Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 891
    .line 892
    :goto_2e
    iput-object v3, v4, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 893
    .line 894
    add-int/lit8 v3, p2, 0x34

    .line 895
    .line 896
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 897
    .line 898
    .line 899
    move-result v15

    .line 900
    if-eqz v15, :cond_30

    .line 901
    .line 902
    const/4 v3, 0x0

    .line 903
    goto :goto_2f

    .line 904
    :cond_30
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 905
    .line 906
    .line 907
    move-result-object v3

    .line 908
    :goto_2f
    iput-object v3, v4, Lcom/p1/mobile/putong/core/data/Message;->fromConvType:Ljava/lang/String;

    .line 909
    .line 910
    add-int/lit8 v3, p2, 0x35

    .line 911
    .line 912
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 913
    .line 914
    .line 915
    move-result v15

    .line 916
    if-eqz v15, :cond_31

    .line 917
    .line 918
    const/4 v3, 0x0

    .line 919
    goto :goto_30

    .line 920
    :cond_31
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 921
    .line 922
    .line 923
    move-result-object v3

    .line 924
    :goto_30
    iput-object v3, v4, Lcom/p1/mobile/putong/core/data/Message;->localExtraInfo:Ljava/lang/String;

    .line 925
    .line 926
    add-int/lit8 v3, p2, 0x36

    .line 927
    .line 928
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 929
    .line 930
    .line 931
    move-result v15

    .line 932
    if-eqz v15, :cond_32

    .line 933
    .line 934
    const/4 v3, 0x0

    .line 935
    goto :goto_31

    .line 936
    :cond_32
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 937
    .line 938
    .line 939
    move-result-object v3
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_9

    .line 940
    :goto_31
    add-int/lit8 v15, p2, 0x37

    .line 941
    .line 942
    :try_start_8
    invoke-interface {v1, v15}, Landroid/database/Cursor;->isNull(I)Z

    .line 943
    .line 944
    .line 945
    move-result v16

    .line 946
    if-eqz v16, :cond_33

    .line 947
    .line 948
    const/4 v15, 0x0

    .line 949
    goto :goto_32

    .line 950
    :cond_33
    invoke-interface {v1, v15}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 951
    .line 952
    .line 953
    move-result-object v15
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_8

    .line 954
    :goto_32
    add-int/lit8 v6, p2, 0x38

    .line 955
    .line 956
    :try_start_9
    invoke-interface {v1, v6}, Landroid/database/Cursor;->isNull(I)Z

    .line 957
    .line 958
    .line 959
    move-result v17

    .line 960
    if-eqz v17, :cond_34

    .line 961
    .line 962
    const/4 v6, 0x0

    .line 963
    goto :goto_33

    .line 964
    :cond_34
    invoke-interface {v1, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 965
    .line 966
    .line 967
    move-result-object v6
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_7

    .line 968
    :goto_33
    add-int/lit8 v8, p2, 0x39

    .line 969
    .line 970
    :try_start_a
    invoke-interface {v1, v8}, Landroid/database/Cursor;->isNull(I)Z

    .line 971
    .line 972
    .line 973
    move-result v18

    .line 974
    if-eqz v18, :cond_35

    .line 975
    .line 976
    const/4 v8, 0x0

    .line 977
    goto :goto_34

    .line 978
    :cond_35
    invoke-interface {v1, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 979
    .line 980
    .line 981
    move-result-object v8
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_6

    .line 982
    :goto_34
    move-object/from16 v18, v2

    .line 983
    .line 984
    add-int/lit8 v2, p2, 0x3a

    .line 985
    .line 986
    :try_start_b
    invoke-interface {v1, v2}, Landroid/database/Cursor;->isNull(I)Z

    .line 987
    .line 988
    .line 989
    move-result v19

    .line 990
    if-eqz v19, :cond_36

    .line 991
    .line 992
    const/4 v2, 0x0

    .line 993
    goto :goto_35

    .line 994
    :cond_36
    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 995
    .line 996
    .line 997
    move-result-object v2
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_5

    .line 998
    :goto_35
    move-object/from16 v19, v2

    .line 999
    .line 1000
    add-int/lit8 v2, p2, 0x3b

    .line 1001
    .line 1002
    :try_start_c
    invoke-interface {v1, v2}, Landroid/database/Cursor;->isNull(I)Z

    .line 1003
    .line 1004
    .line 1005
    move-result v20

    .line 1006
    if-eqz v20, :cond_37

    .line 1007
    .line 1008
    move-object/from16 v21, v3

    .line 1009
    .line 1010
    const/4 v2, 0x0

    .line 1011
    goto :goto_36

    .line 1012
    :cond_37
    sget-object v20, Lcom/p1/mobile/putong/core/data/LocalBusinessType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_4

    .line 1013
    .line 1014
    move-object/from16 v21, v3

    .line 1015
    .line 1016
    :try_start_d
    invoke-virtual/range {v20 .. v20}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1017
    .line 1018
    .line 1019
    move-result-object v3

    .line 1020
    invoke-interface {v1, v2}, Landroid/database/Cursor;->getBlob(I)[B

    .line 1021
    .line 1022
    .line 1023
    move-result-object v2

    .line 1024
    invoke-virtual {v3, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 1025
    .line 1026
    .line 1027
    move-result-object v2

    .line 1028
    check-cast v2, Ljava/util/List;

    .line 1029
    .line 1030
    :goto_36
    iput-object v2, v4, Lcom/p1/mobile/putong/core/data/Message;->localBusinessTypes:Ljava/util/List;

    .line 1031
    .line 1032
    add-int/lit8 v2, p2, 0x3c

    .line 1033
    .line 1034
    invoke-interface {v1, v2}, Landroid/database/Cursor;->isNull(I)Z

    .line 1035
    .line 1036
    .line 1037
    move-result v3

    .line 1038
    if-eqz v3, :cond_38

    .line 1039
    .line 1040
    const/4 v2, 0x0

    .line 1041
    goto :goto_37

    .line 1042
    :cond_38
    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 1043
    .line 1044
    .line 1045
    move-result-object v2
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_3

    .line 1046
    :goto_37
    add-int/lit8 v3, p2, 0x3d

    .line 1047
    .line 1048
    :try_start_e
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 1049
    .line 1050
    .line 1051
    move-result v20

    .line 1052
    if-eqz v20, :cond_39

    .line 1053
    .line 1054
    const/4 v3, 0x0

    .line 1055
    goto :goto_38

    .line 1056
    :cond_39
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 1057
    .line 1058
    .line 1059
    move-result-object v3
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_2

    .line 1060
    :goto_38
    move-object/from16 v20, v2

    .line 1061
    .line 1062
    add-int/lit8 v2, p2, 0x3e

    .line 1063
    .line 1064
    :try_start_f
    invoke-interface {v1, v2}, Landroid/database/Cursor;->isNull(I)Z

    .line 1065
    .line 1066
    .line 1067
    move-result v18

    .line 1068
    if-eqz v18, :cond_3a

    .line 1069
    .line 1070
    const/4 v2, 0x0

    .line 1071
    goto :goto_39

    .line 1072
    :cond_3a
    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 1073
    .line 1074
    .line 1075
    move-result-object v2

    .line 1076
    :goto_39
    iput-object v2, v4, Lcom/p1/mobile/putong/core/data/Message;->incTempInfo:Ljava/lang/String;

    .line 1077
    .line 1078
    add-int/lit8 v2, p2, 0x3f

    .line 1079
    .line 1080
    invoke-interface {v1, v2}, Landroid/database/Cursor;->isNull(I)Z

    .line 1081
    .line 1082
    .line 1083
    move-result v18

    .line 1084
    if-eqz v18, :cond_3b

    .line 1085
    .line 1086
    move-object/from16 v18, v3

    .line 1087
    .line 1088
    const/4 v2, 0x0

    .line 1089
    goto :goto_3a

    .line 1090
    :cond_3b
    sget-object v16, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_1

    .line 1091
    .line 1092
    move-object/from16 v18, v3

    .line 1093
    .line 1094
    :try_start_10
    invoke-virtual/range {v16 .. v16}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1095
    .line 1096
    .line 1097
    move-result-object v3

    .line 1098
    invoke-interface {v1, v2}, Landroid/database/Cursor;->getBlob(I)[B

    .line 1099
    .line 1100
    .line 1101
    move-result-object v2

    .line 1102
    invoke-virtual {v3, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 1103
    .line 1104
    .line 1105
    move-result-object v2

    .line 1106
    check-cast v2, Ljava/util/List;

    .line 1107
    .line 1108
    :goto_3a
    iput-object v2, v4, Lcom/p1/mobile/putong/core/data/Message;->riskTags:Ljava/util/List;

    .line 1109
    .line 1110
    add-int/lit8 v2, p2, 0x40

    .line 1111
    .line 1112
    invoke-interface {v1, v2}, Landroid/database/Cursor;->getInt(I)I

    .line 1113
    .line 1114
    .line 1115
    move-result v2

    .line 1116
    iput v2, v4, Lcom/p1/mobile/putong/core/data/Message;->localMyVisitorCount:I

    .line 1117
    .line 1118
    add-int/lit8 v2, p2, 0x41

    .line 1119
    .line 1120
    invoke-interface {v1, v2}, Landroid/database/Cursor;->getInt(I)I

    .line 1121
    .line 1122
    .line 1123
    move-result v2

    .line 1124
    const/4 v3, 0x1

    .line 1125
    if-ne v2, v3, :cond_3c

    .line 1126
    .line 1127
    goto :goto_3b

    .line 1128
    :cond_3c
    const/4 v3, 0x0

    .line 1129
    :goto_3b
    iput-boolean v3, v4, Lcom/p1/mobile/putong/core/data/Message;->localMyVisitorHidden:Z

    .line 1130
    .line 1131
    add-int/lit8 v2, p2, 0x42

    .line 1132
    .line 1133
    iput v2, v0, Ll/vzf0;->readIndex:I
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_10} :catch_0

    .line 1134
    .line 1135
    move-object/from16 p0, v13

    .line 1136
    .line 1137
    move-object/from16 v1, v18

    .line 1138
    .line 1139
    move-object/from16 v3, v21

    .line 1140
    .line 1141
    move-object/from16 v2, v19

    .line 1142
    .line 1143
    move-object/from16 v0, v20

    .line 1144
    .line 1145
    goto/16 :goto_47

    .line 1146
    .line 1147
    :catch_0
    move-exception v0

    .line 1148
    :goto_3c
    move v2, v7

    .line 1149
    move v7, v5

    .line 1150
    move v5, v2

    .line 1151
    move-object/from16 v16, v13

    .line 1152
    .line 1153
    move-object/from16 v3, v18

    .line 1154
    .line 1155
    :goto_3d
    move-object/from16 v2, v21

    .line 1156
    .line 1157
    move-object/from16 v18, v15

    .line 1158
    .line 1159
    goto/16 :goto_46

    .line 1160
    .line 1161
    :catch_1
    move-exception v0

    .line 1162
    move-object/from16 v18, v3

    .line 1163
    .line 1164
    move v2, v7

    .line 1165
    move v7, v5

    .line 1166
    move v5, v2

    .line 1167
    move-object/from16 v16, v13

    .line 1168
    .line 1169
    goto :goto_3d

    .line 1170
    :catch_2
    move-exception v0

    .line 1171
    move-object/from16 v20, v2

    .line 1172
    .line 1173
    goto :goto_3c

    .line 1174
    :catch_3
    move-exception v0

    .line 1175
    :goto_3e
    move v2, v7

    .line 1176
    move v7, v5

    .line 1177
    move v5, v2

    .line 1178
    move-object/from16 v16, v13

    .line 1179
    .line 1180
    move-object/from16 v3, v18

    .line 1181
    .line 1182
    move-object/from16 v20, v3

    .line 1183
    .line 1184
    goto :goto_3d

    .line 1185
    :catch_4
    move-exception v0

    .line 1186
    move-object/from16 v21, v3

    .line 1187
    .line 1188
    goto :goto_3e

    .line 1189
    :catch_5
    move-exception v0

    .line 1190
    move-object/from16 v21, v3

    .line 1191
    .line 1192
    move v2, v7

    .line 1193
    move v7, v5

    .line 1194
    move v5, v2

    .line 1195
    move-object/from16 v16, v13

    .line 1196
    .line 1197
    move-object/from16 v3, v18

    .line 1198
    .line 1199
    move-object/from16 v19, v3

    .line 1200
    .line 1201
    :goto_3f
    move-object/from16 v20, v19

    .line 1202
    .line 1203
    goto :goto_3d

    .line 1204
    :catch_6
    move-exception v0

    .line 1205
    move-object/from16 v18, v2

    .line 1206
    .line 1207
    move-object/from16 v21, v3

    .line 1208
    .line 1209
    move v2, v7

    .line 1210
    move v7, v5

    .line 1211
    move v5, v2

    .line 1212
    move-object/from16 v16, v13

    .line 1213
    .line 1214
    move-object/from16 v3, v18

    .line 1215
    .line 1216
    move-object v8, v3

    .line 1217
    :goto_40
    move-object/from16 v19, v8

    .line 1218
    .line 1219
    goto :goto_3f

    .line 1220
    :catch_7
    move-exception v0

    .line 1221
    move-object/from16 v18, v2

    .line 1222
    .line 1223
    move-object/from16 v21, v3

    .line 1224
    .line 1225
    move v2, v7

    .line 1226
    move v7, v5

    .line 1227
    move v5, v2

    .line 1228
    move-object/from16 v16, v13

    .line 1229
    .line 1230
    move-object/from16 v3, v18

    .line 1231
    .line 1232
    move-object v6, v3

    .line 1233
    move-object v8, v6

    .line 1234
    goto :goto_40

    .line 1235
    :catch_8
    move-exception v0

    .line 1236
    move-object/from16 v18, v2

    .line 1237
    .line 1238
    move-object/from16 v21, v3

    .line 1239
    .line 1240
    move v2, v7

    .line 1241
    move v7, v5

    .line 1242
    move v5, v2

    .line 1243
    move-object/from16 v16, v13

    .line 1244
    .line 1245
    move-object/from16 v3, v18

    .line 1246
    .line 1247
    move-object v6, v3

    .line 1248
    move-object v8, v6

    .line 1249
    move-object/from16 v19, v8

    .line 1250
    .line 1251
    move-object/from16 v20, v19

    .line 1252
    .line 1253
    move-object/from16 v2, v21

    .line 1254
    .line 1255
    goto/16 :goto_46

    .line 1256
    .line 1257
    :catch_9
    move-exception v0

    .line 1258
    move-object/from16 v18, v2

    .line 1259
    .line 1260
    move v2, v7

    .line 1261
    move v7, v5

    .line 1262
    move v5, v2

    .line 1263
    move-object/from16 v16, v13

    .line 1264
    .line 1265
    move-object/from16 v2, v18

    .line 1266
    .line 1267
    move-object v3, v2

    .line 1268
    move-object v6, v3

    .line 1269
    move-object v8, v6

    .line 1270
    move-object/from16 v19, v8

    .line 1271
    .line 1272
    move-object/from16 v20, v19

    .line 1273
    .line 1274
    goto/16 :goto_46

    .line 1275
    .line 1276
    :catch_a
    move-exception v0

    .line 1277
    move-object/from16 v18, v2

    .line 1278
    .line 1279
    move v14, v5

    .line 1280
    move-object/from16 v16, v13

    .line 1281
    .line 1282
    move-object v3, v2

    .line 1283
    move-object v6, v3

    .line 1284
    move-object v8, v6

    .line 1285
    move-object/from16 v19, v8

    .line 1286
    .line 1287
    move-object/from16 v20, v19

    .line 1288
    .line 1289
    :goto_41
    move v5, v7

    .line 1290
    move v7, v14

    .line 1291
    goto :goto_46

    .line 1292
    :catch_b
    move-exception v0

    .line 1293
    move-object/from16 v18, v2

    .line 1294
    .line 1295
    move v14, v5

    .line 1296
    :goto_42
    move-object v3, v2

    .line 1297
    move-object v6, v3

    .line 1298
    move-object v8, v6

    .line 1299
    move-object/from16 v19, v8

    .line 1300
    .line 1301
    move-object/from16 v20, v19

    .line 1302
    .line 1303
    const/16 v16, 0x0

    .line 1304
    .line 1305
    goto :goto_41

    .line 1306
    :catch_c
    move-exception v0

    .line 1307
    move-object/from16 v18, v2

    .line 1308
    .line 1309
    move v12, v5

    .line 1310
    :goto_43
    move v14, v12

    .line 1311
    goto :goto_42

    .line 1312
    :catch_d
    move-exception v0

    .line 1313
    move-object/from16 v18, v2

    .line 1314
    .line 1315
    move v11, v5

    .line 1316
    :goto_44
    move v12, v11

    .line 1317
    goto :goto_43

    .line 1318
    :catch_e
    move-exception v0

    .line 1319
    move-object/from16 v18, v2

    .line 1320
    .line 1321
    move v10, v5

    .line 1322
    :goto_45
    move v11, v10

    .line 1323
    goto :goto_44

    .line 1324
    :catch_f
    move-exception v0

    .line 1325
    move-object/from16 v18, v2

    .line 1326
    .line 1327
    move v9, v5

    .line 1328
    move v10, v9

    .line 1329
    goto :goto_45

    .line 1330
    :catch_10
    move-exception v0

    .line 1331
    move-object/from16 v18, v2

    .line 1332
    .line 1333
    move v7, v5

    .line 1334
    move v9, v7

    .line 1335
    move v10, v9

    .line 1336
    move v11, v10

    .line 1337
    move v12, v11

    .line 1338
    move v14, v12

    .line 1339
    move-object v3, v2

    .line 1340
    move-object v6, v3

    .line 1341
    move-object v8, v6

    .line 1342
    move-object/from16 v19, v8

    .line 1343
    .line 1344
    move-object/from16 v20, v19

    .line 1345
    .line 1346
    const/16 v16, 0x0

    .line 1347
    .line 1348
    :goto_46
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/MessageNano;->reportError(Ljava/lang/Exception;Landroid/database/Cursor;)V

    .line 1349
    .line 1350
    .line 1351
    move/from16 p0, v7

    .line 1352
    .line 1353
    move v7, v5

    .line 1354
    move/from16 v5, p0

    .line 1355
    .line 1356
    move-object v1, v3

    .line 1357
    move-object/from16 p0, v16

    .line 1358
    .line 1359
    move-object/from16 v15, v18

    .line 1360
    .line 1361
    move-object v3, v2

    .line 1362
    move-object/from16 v0, v20

    .line 1363
    .line 1364
    move-object/from16 v2, v19

    .line 1365
    .line 1366
    :goto_47
    sget-object v13, Lcom/p1/mobile/putong/core/data/MessageSentFrom;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 1367
    .line 1368
    invoke-virtual {v13, v3, v7}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 1369
    .line 1370
    .line 1371
    move-result-object v3

    .line 1372
    check-cast v3, Lcom/p1/mobile/putong/core/data/MessageSentFrom;

    .line 1373
    .line 1374
    iput-object v3, v4, Lcom/p1/mobile/putong/core/data/Message;->sentFrom:Lcom/p1/mobile/putong/core/data/MessageSentFrom;

    .line 1375
    .line 1376
    sget-object v3, Lcom/p1/mobile/putong/core/data/NotificationStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 1377
    .line 1378
    invoke-virtual {v3, v15, v9}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 1379
    .line 1380
    .line 1381
    move-result-object v7

    .line 1382
    check-cast v7, Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 1383
    .line 1384
    iput-object v7, v4, Lcom/p1/mobile/putong/core/data/Message;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 1385
    .line 1386
    sget-object v7, Lcom/p1/mobile/putong/core/data/CallHandledStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 1387
    .line 1388
    invoke-virtual {v7, v6, v10}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 1389
    .line 1390
    .line 1391
    move-result-object v6

    .line 1392
    check-cast v6, Lcom/p1/mobile/putong/core/data/CallHandledStatus;

    .line 1393
    .line 1394
    iput-object v6, v4, Lcom/p1/mobile/putong/core/data/Message;->localCallHandledStatus:Lcom/p1/mobile/putong/core/data/CallHandledStatus;

    .line 1395
    .line 1396
    sget-object v6, Lcom/p1/mobile/putong/core/data/MessageType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 1397
    .line 1398
    invoke-virtual {v6, v8, v11}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 1399
    .line 1400
    .line 1401
    move-result-object v8

    .line 1402
    check-cast v8, Lcom/p1/mobile/putong/core/data/MessageType;

    .line 1403
    .line 1404
    iput-object v8, v4, Lcom/p1/mobile/putong/core/data/Message;->msgType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 1405
    .line 1406
    invoke-virtual {v6, v2, v12}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 1407
    .line 1408
    .line 1409
    move-result-object v2

    .line 1410
    check-cast v2, Lcom/p1/mobile/putong/core/data/MessageType;

    .line 1411
    .line 1412
    iput-object v2, v4, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 1413
    .line 1414
    iget-object v2, v4, Lcom/p1/mobile/putong/core/data/Message;->localBusinessTypes:Ljava/util/List;

    .line 1415
    .line 1416
    if-nez v2, :cond_3d

    .line 1417
    .line 1418
    if-eqz p0, :cond_3d

    .line 1419
    .line 1420
    invoke-static/range {p0 .. p0}, Lcom/p1/mobile/putong/core/data/LocalBusinessType;->oldEnumCovertList(Ljava/util/List;)Ljava/util/List;

    .line 1421
    .line 1422
    .line 1423
    move-result-object v2

    .line 1424
    iput-object v2, v4, Lcom/p1/mobile/putong/core/data/Message;->localBusinessTypes:Ljava/util/List;

    .line 1425
    .line 1426
    :cond_3d
    sget-object v2, Lcom/p1/mobile/putong/core/data/MessageChannel;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 1427
    .line 1428
    invoke-virtual {v2, v0, v14}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 1429
    .line 1430
    .line 1431
    move-result-object v0

    .line 1432
    check-cast v0, Lcom/p1/mobile/putong/core/data/MessageChannel;

    .line 1433
    .line 1434
    iput-object v0, v4, Lcom/p1/mobile/putong/core/data/Message;->channel:Lcom/p1/mobile/putong/core/data/MessageChannel;

    .line 1435
    .line 1436
    sget-object v0, Lcom/p1/mobile/putong/core/data/MessageStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 1437
    .line 1438
    invoke-virtual {v0, v1, v5}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 1439
    .line 1440
    .line 1441
    move-result-object v1

    .line 1442
    check-cast v1, Lcom/p1/mobile/putong/core/data/MessageStatus;

    .line 1443
    .line 1444
    iput-object v1, v4, Lcom/p1/mobile/putong/core/data/Message;->status:Lcom/p1/mobile/putong/core/data/MessageStatus;

    .line 1445
    .line 1446
    iget-object v1, v4, Lcom/p1/mobile/putong/core/data/Message;->api_only_otherUser:Ljava/lang/String;

    .line 1447
    .line 1448
    const-string v5, ""

    .line 1449
    .line 1450
    if-nez v1, :cond_3e

    .line 1451
    .line 1452
    iput-object v5, v4, Lcom/p1/mobile/putong/core/data/Message;->api_only_otherUser:Ljava/lang/String;

    .line 1453
    .line 1454
    :cond_3e
    iget-object v1, v4, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 1455
    .line 1456
    if-nez v1, :cond_3f

    .line 1457
    .line 1458
    iput-object v5, v4, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 1459
    .line 1460
    :cond_3f
    iget-object v1, v4, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 1461
    .line 1462
    if-nez v1, :cond_40

    .line 1463
    .line 1464
    iput-object v5, v4, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 1465
    .line 1466
    :cond_40
    iget-object v1, v4, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 1467
    .line 1468
    if-nez v1, :cond_41

    .line 1469
    .line 1470
    iput-object v5, v4, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 1471
    .line 1472
    :cond_41
    iget-object v1, v4, Lcom/p1/mobile/putong/core/data/Message;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 1473
    .line 1474
    if-nez v1, :cond_42

    .line 1475
    .line 1476
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 1477
    .line 1478
    .line 1479
    move-result-object v1

    .line 1480
    check-cast v1, Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 1481
    .line 1482
    iput-object v1, v4, Lcom/p1/mobile/putong/core/data/Message;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 1483
    .line 1484
    :cond_42
    iget-object v1, v4, Lcom/p1/mobile/putong/core/data/Message;->localCallHandledStatus:Lcom/p1/mobile/putong/core/data/CallHandledStatus;

    .line 1485
    .line 1486
    if-nez v1, :cond_43

    .line 1487
    .line 1488
    invoke-virtual {v7}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 1489
    .line 1490
    .line 1491
    move-result-object v1

    .line 1492
    check-cast v1, Lcom/p1/mobile/putong/core/data/CallHandledStatus;

    .line 1493
    .line 1494
    iput-object v1, v4, Lcom/p1/mobile/putong/core/data/Message;->localCallHandledStatus:Lcom/p1/mobile/putong/core/data/CallHandledStatus;

    .line 1495
    .line 1496
    :cond_43
    iget-object v1, v4, Lcom/p1/mobile/putong/core/data/Message;->localPrivateQuestions:Ljava/util/List;

    .line 1497
    .line 1498
    if-nez v1, :cond_44

    .line 1499
    .line 1500
    new-instance v1, Ljava/util/ArrayList;

    .line 1501
    .line 1502
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 1503
    .line 1504
    .line 1505
    iput-object v1, v4, Lcom/p1/mobile/putong/core/data/Message;->localPrivateQuestions:Ljava/util/List;

    .line 1506
    .line 1507
    :cond_44
    iget-object v1, v4, Lcom/p1/mobile/putong/core/data/Message;->commentInfo:Lcom/p1/mobile/putong/core/data/CommentInfo;

    .line 1508
    .line 1509
    if-nez v1, :cond_45

    .line 1510
    .line 1511
    invoke-static {}, Lcom/p1/mobile/putong/core/data/CommentInfo;->new_()Lcom/p1/mobile/putong/core/data/CommentInfo;

    .line 1512
    .line 1513
    .line 1514
    move-result-object v1

    .line 1515
    iput-object v1, v4, Lcom/p1/mobile/putong/core/data/Message;->commentInfo:Lcom/p1/mobile/putong/core/data/CommentInfo;

    .line 1516
    .line 1517
    :cond_45
    iget-object v1, v4, Lcom/p1/mobile/putong/core/data/Message;->parentCommentId:Ljava/lang/String;

    .line 1518
    .line 1519
    if-nez v1, :cond_46

    .line 1520
    .line 1521
    iput-object v5, v4, Lcom/p1/mobile/putong/core/data/Message;->parentCommentId:Ljava/lang/String;

    .line 1522
    .line 1523
    :cond_46
    iget-object v1, v4, Lcom/p1/mobile/putong/core/data/Message;->subCommentIds:Ljava/util/List;

    .line 1524
    .line 1525
    if-nez v1, :cond_47

    .line 1526
    .line 1527
    new-instance v1, Ljava/util/ArrayList;

    .line 1528
    .line 1529
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 1530
    .line 1531
    .line 1532
    iput-object v1, v4, Lcom/p1/mobile/putong/core/data/Message;->subCommentIds:Ljava/util/List;

    .line 1533
    .line 1534
    :cond_47
    iget-object v1, v4, Lcom/p1/mobile/putong/core/data/Message;->moreSubComments:Ljava/lang/String;

    .line 1535
    .line 1536
    if-nez v1, :cond_48

    .line 1537
    .line 1538
    iput-object v5, v4, Lcom/p1/mobile/putong/core/data/Message;->moreSubComments:Ljava/lang/String;

    .line 1539
    .line 1540
    :cond_48
    iget-object v1, v4, Lcom/p1/mobile/putong/core/data/Message;->localBusinessTypes:Ljava/util/List;

    .line 1541
    .line 1542
    if-nez v1, :cond_49

    .line 1543
    .line 1544
    new-instance v1, Ljava/util/ArrayList;

    .line 1545
    .line 1546
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 1547
    .line 1548
    .line 1549
    iput-object v1, v4, Lcom/p1/mobile/putong/core/data/Message;->localBusinessTypes:Ljava/util/List;

    .line 1550
    .line 1551
    :cond_49
    iget-object v1, v4, Lcom/p1/mobile/putong/core/data/Message;->settings:Lcom/p1/mobile/putong/core/data/MessageSetting;

    .line 1552
    .line 1553
    if-nez v1, :cond_4a

    .line 1554
    .line 1555
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MessageSetting;->new_()Lcom/p1/mobile/putong/core/data/MessageSetting;

    .line 1556
    .line 1557
    .line 1558
    move-result-object v1

    .line 1559
    iput-object v1, v4, Lcom/p1/mobile/putong/core/data/Message;->settings:Lcom/p1/mobile/putong/core/data/MessageSetting;

    .line 1560
    .line 1561
    :cond_4a
    iget-object v1, v4, Lcom/p1/mobile/putong/core/data/Message;->channel:Lcom/p1/mobile/putong/core/data/MessageChannel;

    .line 1562
    .line 1563
    if-nez v1, :cond_4b

    .line 1564
    .line 1565
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 1566
    .line 1567
    .line 1568
    move-result-object v1

    .line 1569
    check-cast v1, Lcom/p1/mobile/putong/core/data/MessageChannel;

    .line 1570
    .line 1571
    iput-object v1, v4, Lcom/p1/mobile/putong/core/data/Message;->channel:Lcom/p1/mobile/putong/core/data/MessageChannel;

    .line 1572
    .line 1573
    :cond_4b
    iget-object v1, v4, Lcom/p1/mobile/putong/core/data/Message;->notifiedUsers:Ljava/util/List;

    .line 1574
    .line 1575
    if-nez v1, :cond_4c

    .line 1576
    .line 1577
    new-instance v1, Ljava/util/ArrayList;

    .line 1578
    .line 1579
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 1580
    .line 1581
    .line 1582
    iput-object v1, v4, Lcom/p1/mobile/putong/core/data/Message;->notifiedUsers:Ljava/util/List;

    .line 1583
    .line 1584
    :cond_4c
    iget-object v1, v4, Lcom/p1/mobile/putong/core/data/Message;->status:Lcom/p1/mobile/putong/core/data/MessageStatus;

    .line 1585
    .line 1586
    if-nez v1, :cond_4d

    .line 1587
    .line 1588
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 1589
    .line 1590
    .line 1591
    move-result-object v0

    .line 1592
    check-cast v0, Lcom/p1/mobile/putong/core/data/MessageStatus;

    .line 1593
    .line 1594
    iput-object v0, v4, Lcom/p1/mobile/putong/core/data/Message;->status:Lcom/p1/mobile/putong/core/data/MessageStatus;

    .line 1595
    .line 1596
    :cond_4d
    iget-object v0, v4, Lcom/p1/mobile/putong/core/data/Message;->referenceMsgId:Ljava/lang/String;

    .line 1597
    .line 1598
    if-nez v0, :cond_4e

    .line 1599
    .line 1600
    iput-object v5, v4, Lcom/p1/mobile/putong/core/data/Message;->referenceMsgId:Ljava/lang/String;

    .line 1601
    .line 1602
    :cond_4e
    iget-object v0, v4, Lcom/p1/mobile/putong/core/data/Message;->hostId:Ljava/lang/String;

    .line 1603
    .line 1604
    if-nez v0, :cond_4f

    .line 1605
    .line 1606
    iput-object v5, v4, Lcom/p1/mobile/putong/core/data/Message;->hostId:Ljava/lang/String;

    .line 1607
    .line 1608
    :cond_4f
    iget-object v0, v4, Lcom/p1/mobile/putong/core/data/Message;->localAudioText:Lcom/p1/mobile/putong/core/data/AudioText;

    .line 1609
    .line 1610
    if-nez v0, :cond_50

    .line 1611
    .line 1612
    invoke-static {}, Lcom/p1/mobile/putong/core/data/AudioText;->new_()Lcom/p1/mobile/putong/core/data/AudioText;

    .line 1613
    .line 1614
    .line 1615
    move-result-object v0

    .line 1616
    iput-object v0, v4, Lcom/p1/mobile/putong/core/data/Message;->localAudioText:Lcom/p1/mobile/putong/core/data/AudioText;

    .line 1617
    .line 1618
    :cond_50
    iget-object v0, v4, Lcom/p1/mobile/putong/core/data/Message;->consumeType:Ljava/lang/String;

    .line 1619
    .line 1620
    if-nez v0, :cond_51

    .line 1621
    .line 1622
    iput-object v5, v4, Lcom/p1/mobile/putong/core/data/Message;->consumeType:Ljava/lang/String;

    .line 1623
    .line 1624
    :cond_51
    iget-object v0, v4, Lcom/p1/mobile/putong/core/data/Message;->coinSign:Ljava/lang/String;

    .line 1625
    .line 1626
    if-nez v0, :cond_52

    .line 1627
    .line 1628
    iput-object v5, v4, Lcom/p1/mobile/putong/core/data/Message;->coinSign:Ljava/lang/String;

    .line 1629
    .line 1630
    :cond_52
    iget-object v0, v4, Lcom/p1/mobile/putong/core/data/Message;->action:Ljava/lang/String;

    .line 1631
    .line 1632
    if-nez v0, :cond_53

    .line 1633
    .line 1634
    iput-object v5, v4, Lcom/p1/mobile/putong/core/data/Message;->action:Ljava/lang/String;

    .line 1635
    .line 1636
    :cond_53
    iget-object v0, v4, Lcom/p1/mobile/putong/core/data/Message;->riskTags:Ljava/util/List;

    .line 1637
    .line 1638
    if-nez v0, :cond_54

    .line 1639
    .line 1640
    new-instance v0, Ljava/util/ArrayList;

    .line 1641
    .line 1642
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1643
    .line 1644
    .line 1645
    iput-object v0, v4, Lcom/p1/mobile/putong/core/data/Message;->riskTags:Ljava/util/List;

    .line 1646
    .line 1647
    :cond_54
    return-object v4
.end method

.method public bridge synthetic read(Landroid/database/Cursor;I)Ljava/lang/Object;
    .locals 0

    .line 1648
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/Message$61;->read(Landroid/database/Cursor;I)Lcom/p1/mobile/putong/core/data/Message;

    move-result-object p0

    return-object p0
.end method

.method public write(Lcom/p1/mobile/putong/core/data/Message;Landroid/content/ContentValues;)V
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
    const-string v0, "localCreatedTime_c"

    .line 10
    .line 11
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Message;->localCreatedTime:J

    .line 12
    .line 13
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Long;)V

    .line 18
    .line 19
    .line 20
    const-string v0, "localCreatedSession_c"

    .line 21
    .line 22
    iget v1, p1, Lcom/p1/mobile/putong/core/data/Message;->localCreatedSession:I

    .line 23
    .line 24
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 29
    .line 30
    .line 31
    const-string v0, "localInMoment_c"

    .line 32
    .line 33
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/Message;->localInMoment:Z

    .line 34
    .line 35
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 40
    .line 41
    .line 42
    const-string v0, "localInConversation_c"

    .line 43
    .line 44
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/Message;->localInConversation:Z

    .line 45
    .line 46
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 51
    .line 52
    .line 53
    const-string v0, "createdTime_c"

    .line 54
    .line 55
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 56
    .line 57
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Double;)V

    .line 62
    .line 63
    .line 64
    const-string v0, "cid_c"

    .line 65
    .line 66
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 67
    .line 68
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    const-string v0, "media_c"

    .line 72
    .line 73
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 74
    .line 75
    if-nez v1, :cond_0

    .line 76
    .line 77
    move-object v1, p0

    .line 78
    goto :goto_0

    .line 79
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/data/Media;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 80
    .line 81
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 86
    .line 87
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    :goto_0
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 92
    .line 93
    .line 94
    const-string v0, "sticker_c"

    .line 95
    .line 96
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->sticker:Ljava/lang/String;

    .line 97
    .line 98
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    const-string v0, "question_c"

    .line 102
    .line 103
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->question:Ljava/lang/String;

    .line 104
    .line 105
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    const-string v0, "str_sentFrom_c"

    .line 109
    .line 110
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->sentFrom:Lcom/p1/mobile/putong/core/data/MessageSentFrom;

    .line 111
    .line 112
    if-nez v1, :cond_1

    .line 113
    .line 114
    move-object v1, p0

    .line 115
    goto :goto_1

    .line 116
    :cond_1
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    :goto_1
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    const-string v0, "sentFrom_c"

    .line 124
    .line 125
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->sentFrom:Lcom/p1/mobile/putong/core/data/MessageSentFrom;

    .line 126
    .line 127
    if-nez v1, :cond_2

    .line 128
    .line 129
    move-object v1, p0

    .line 130
    goto :goto_2

    .line 131
    :cond_2
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 132
    .line 133
    .line 134
    move-result v1

    .line 135
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    :goto_2
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 140
    .line 141
    .line 142
    const-string v0, "moment_c"

    .line 143
    .line 144
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->moment:Ljava/lang/String;

    .line 145
    .line 146
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    const-string v0, "answerOfMessage_c"

    .line 150
    .line 151
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->answerOfMessage:Ljava/lang/String;

    .line 152
    .line 153
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    const-string v0, "owner_c"

    .line 157
    .line 158
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 159
    .line 160
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 161
    .line 162
    .line 163
    const-string v0, "location_c"

    .line 164
    .line 165
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 166
    .line 167
    if-nez v1, :cond_3

    .line 168
    .line 169
    move-object v1, p0

    .line 170
    goto :goto_3

    .line 171
    :cond_3
    sget-object v2, Lcom/p1/mobile/putong/data/MessageLocation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 172
    .line 173
    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 174
    .line 175
    .line 176
    move-result-object v1

    .line 177
    :goto_3
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 178
    .line 179
    .line 180
    const-string v0, "recalled_c"

    .line 181
    .line 182
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    .line 183
    .line 184
    if-nez v1, :cond_4

    .line 185
    .line 186
    move-object v1, p0

    .line 187
    goto :goto_4

    .line 188
    :cond_4
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 189
    .line 190
    .line 191
    move-result v1

    .line 192
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 193
    .line 194
    .line 195
    move-result-object v1

    .line 196
    :goto_4
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 197
    .line 198
    .line 199
    const-string v0, "value_c"

    .line 200
    .line 201
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 202
    .line 203
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 204
    .line 205
    .line 206
    const-string v0, "str_localNotificationStatus_c"

    .line 207
    .line 208
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 209
    .line 210
    if-nez v1, :cond_5

    .line 211
    .line 212
    move-object v1, p0

    .line 213
    goto :goto_5

    .line 214
    :cond_5
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 215
    .line 216
    .line 217
    move-result-object v1

    .line 218
    :goto_5
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 219
    .line 220
    .line 221
    const-string v0, "localNotificationStatus_c"

    .line 222
    .line 223
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 224
    .line 225
    if-nez v1, :cond_6

    .line 226
    .line 227
    move-object v1, p0

    .line 228
    goto :goto_6

    .line 229
    :cond_6
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 230
    .line 231
    .line 232
    move-result v1

    .line 233
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 234
    .line 235
    .line 236
    move-result-object v1

    .line 237
    :goto_6
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 238
    .line 239
    .line 240
    const-string v0, "likeOfMoment_c"

    .line 241
    .line 242
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->likeOfMoment:Ljava/lang/String;

    .line 243
    .line 244
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 245
    .line 246
    .line 247
    const-string v0, "localAnimationKey_c"

    .line 248
    .line 249
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->localAnimationKey:Ljava/lang/String;

    .line 250
    .line 251
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 252
    .line 253
    .line 254
    const-string v0, "api_only_accessory_c"

    .line 255
    .line 256
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->api_only_accessory:Lcom/p1/mobile/putong/core/data/MessageAccessory;

    .line 257
    .line 258
    if-nez v1, :cond_7

    .line 259
    .line 260
    move-object v1, p0

    .line 261
    goto :goto_7

    .line 262
    :cond_7
    sget-object v2, Lcom/p1/mobile/putong/core/data/MessageAccessory;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 263
    .line 264
    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 265
    .line 266
    .line 267
    move-result-object v1

    .line 268
    :goto_7
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 269
    .line 270
    .line 271
    const-string v0, "giftRecords_c"

    .line 272
    .line 273
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->giftRecords:Ljava/util/List;

    .line 274
    .line 275
    if-nez v1, :cond_8

    .line 276
    .line 277
    move-object v1, p0

    .line 278
    goto :goto_8

    .line 279
    :cond_8
    sget-object v1, Lcom/p1/mobile/putong/core/data/GiftRecord;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 280
    .line 281
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 282
    .line 283
    .line 284
    move-result-object v1

    .line 285
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/Message;->giftRecords:Ljava/util/List;

    .line 286
    .line 287
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 288
    .line 289
    .line 290
    move-result-object v1

    .line 291
    :goto_8
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 292
    .line 293
    .line 294
    const-string v0, "call_c"

    .line 295
    .line 296
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->call:Lcom/p1/mobile/putong/core/data/CallRecord;

    .line 297
    .line 298
    if-nez v1, :cond_9

    .line 299
    .line 300
    move-object v1, p0

    .line 301
    goto :goto_9

    .line 302
    :cond_9
    sget-object v2, Lcom/p1/mobile/putong/core/data/CallRecord;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 303
    .line 304
    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 305
    .line 306
    .line 307
    move-result-object v1

    .line 308
    :goto_9
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 309
    .line 310
    .line 311
    const-string v0, "localCallType_c"

    .line 312
    .line 313
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->localCallType:Ljava/lang/String;

    .line 314
    .line 315
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 316
    .line 317
    .line 318
    const-string v0, "localCallStatus_c"

    .line 319
    .line 320
    iget v1, p1, Lcom/p1/mobile/putong/core/data/Message;->localCallStatus:I

    .line 321
    .line 322
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 323
    .line 324
    .line 325
    move-result-object v1

    .line 326
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 327
    .line 328
    .line 329
    const-string v0, "str_localCallHandledStatus_c"

    .line 330
    .line 331
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->localCallHandledStatus:Lcom/p1/mobile/putong/core/data/CallHandledStatus;

    .line 332
    .line 333
    if-nez v1, :cond_a

    .line 334
    .line 335
    move-object v1, p0

    .line 336
    goto :goto_a

    .line 337
    :cond_a
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 338
    .line 339
    .line 340
    move-result-object v1

    .line 341
    :goto_a
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 342
    .line 343
    .line 344
    const-string v0, "localCallHandledStatus_c"

    .line 345
    .line 346
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->localCallHandledStatus:Lcom/p1/mobile/putong/core/data/CallHandledStatus;

    .line 347
    .line 348
    if-nez v1, :cond_b

    .line 349
    .line 350
    move-object v1, p0

    .line 351
    goto :goto_b

    .line 352
    :cond_b
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 353
    .line 354
    .line 355
    move-result v1

    .line 356
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 357
    .line 358
    .line 359
    move-result-object v1

    .line 360
    :goto_b
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 361
    .line 362
    .line 363
    const-string v0, "localPrivateQuestions_c"

    .line 364
    .line 365
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->localPrivateQuestions:Ljava/util/List;

    .line 366
    .line 367
    if-nez v1, :cond_c

    .line 368
    .line 369
    move-object v1, p0

    .line 370
    goto :goto_c

    .line 371
    :cond_c
    sget-object v1, Lcom/p1/mobile/putong/core/data/PrivateQuestion;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 372
    .line 373
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 374
    .line 375
    .line 376
    move-result-object v1

    .line 377
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/Message;->localPrivateQuestions:Ljava/util/List;

    .line 378
    .line 379
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 380
    .line 381
    .line 382
    move-result-object v1

    .line 383
    :goto_c
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 384
    .line 385
    .line 386
    const-string v0, "letter_c"

    .line 387
    .line 388
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->letter:Lcom/p1/mobile/putong/core/data/Letter;

    .line 389
    .line 390
    if-nez v1, :cond_d

    .line 391
    .line 392
    move-object v1, p0

    .line 393
    goto :goto_d

    .line 394
    :cond_d
    sget-object v2, Lcom/p1/mobile/putong/core/data/Letter;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 395
    .line 396
    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 397
    .line 398
    .line 399
    move-result-object v1

    .line 400
    :goto_d
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 401
    .line 402
    .line 403
    const-string v0, "chatTyping_c"

    .line 404
    .line 405
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/Message;->chatTyping:Z

    .line 406
    .line 407
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 408
    .line 409
    .line 410
    move-result-object v1

    .line 411
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 412
    .line 413
    .line 414
    const-string v0, "localFailType_c"

    .line 415
    .line 416
    iget v1, p1, Lcom/p1/mobile/putong/core/data/Message;->localFailType:I

    .line 417
    .line 418
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 419
    .line 420
    .line 421
    move-result-object v1

    .line 422
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 423
    .line 424
    .line 425
    const-string v0, "recalledReason_c"

    .line 426
    .line 427
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->recalledReason:Ljava/lang/String;

    .line 428
    .line 429
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 430
    .line 431
    .line 432
    const-string v0, "recalledHint_c"

    .line 433
    .line 434
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->recalledHint:Ljava/lang/String;

    .line 435
    .line 436
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 437
    .line 438
    .line 439
    const-string v0, "str_msgType_c"

    .line 440
    .line 441
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->msgType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 442
    .line 443
    if-nez v1, :cond_e

    .line 444
    .line 445
    move-object v1, p0

    .line 446
    goto :goto_e

    .line 447
    :cond_e
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 448
    .line 449
    .line 450
    move-result-object v1

    .line 451
    :goto_e
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 452
    .line 453
    .line 454
    const-string v0, "msgType_c"

    .line 455
    .line 456
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->msgType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 457
    .line 458
    if-nez v1, :cond_f

    .line 459
    .line 460
    move-object v1, p0

    .line 461
    goto :goto_f

    .line 462
    :cond_f
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 463
    .line 464
    .line 465
    move-result v1

    .line 466
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 467
    .line 468
    .line 469
    move-result-object v1

    .line 470
    :goto_f
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 471
    .line 472
    .line 473
    const-string v0, "str_messageType_c"

    .line 474
    .line 475
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 476
    .line 477
    if-nez v1, :cond_10

    .line 478
    .line 479
    move-object v1, p0

    .line 480
    goto :goto_10

    .line 481
    :cond_10
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 482
    .line 483
    .line 484
    move-result-object v1

    .line 485
    :goto_10
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 486
    .line 487
    .line 488
    const-string v0, "messageType_c"

    .line 489
    .line 490
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 491
    .line 492
    if-nez v1, :cond_11

    .line 493
    .line 494
    move-object v1, p0

    .line 495
    goto :goto_11

    .line 496
    :cond_11
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 497
    .line 498
    .line 499
    move-result v1

    .line 500
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 501
    .line 502
    .line 503
    move-result-object v1

    .line 504
    :goto_11
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 505
    .line 506
    .line 507
    const-string v0, "additionalData_c"

    .line 508
    .line 509
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 510
    .line 511
    if-nez v1, :cond_12

    .line 512
    .line 513
    move-object v1, p0

    .line 514
    goto :goto_12

    .line 515
    :cond_12
    sget-object v2, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 516
    .line 517
    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 518
    .line 519
    .line 520
    move-result-object v1

    .line 521
    :goto_12
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 522
    .line 523
    .line 524
    const-string v0, "localSafetyReminder_c"

    .line 525
    .line 526
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/Message;->localSafetyReminder:Z

    .line 527
    .line 528
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 529
    .line 530
    .line 531
    move-result-object v1

    .line 532
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 533
    .line 534
    .line 535
    const-string v0, "localSensitiveWordReminder_c"

    .line 536
    .line 537
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/Message;->localSensitiveWordReminder:Z

    .line 538
    .line 539
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 540
    .line 541
    .line 542
    move-result-object v1

    .line 543
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 544
    .line 545
    .line 546
    const-string v0, "msgData_c"

    .line 547
    .line 548
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 549
    .line 550
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 551
    .line 552
    .line 553
    const-string v0, "localBusinessTypes_c"

    .line 554
    .line 555
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->localBusinessTypes:Ljava/util/List;

    .line 556
    .line 557
    if-nez v1, :cond_13

    .line 558
    .line 559
    move-object v1, p0

    .line 560
    goto :goto_13

    .line 561
    :cond_13
    sget-object v1, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 562
    .line 563
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 564
    .line 565
    .line 566
    move-result-object v1

    .line 567
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/Message;->localBusinessTypes:Ljava/util/List;

    .line 568
    .line 569
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/LocalBusinessType;->covertToOldEnumList(Ljava/util/List;)Ljava/util/List;

    .line 570
    .line 571
    .line 572
    move-result-object v2

    .line 573
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 574
    .line 575
    .line 576
    move-result-object v1

    .line 577
    :goto_13
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 578
    .line 579
    .line 580
    const-string v0, "settings_anonymous_c"

    .line 581
    .line 582
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->settings:Lcom/p1/mobile/putong/core/data/MessageSetting;

    .line 583
    .line 584
    iget-boolean v1, v1, Lcom/p1/mobile/putong/core/data/MessageSetting;->anonymous:Z

    .line 585
    .line 586
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 587
    .line 588
    .line 589
    move-result-object v1

    .line 590
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 591
    .line 592
    .line 593
    const-string v0, "str_channel_c"

    .line 594
    .line 595
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->channel:Lcom/p1/mobile/putong/core/data/MessageChannel;

    .line 596
    .line 597
    if-nez v1, :cond_14

    .line 598
    .line 599
    move-object v1, p0

    .line 600
    goto :goto_14

    .line 601
    :cond_14
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 602
    .line 603
    .line 604
    move-result-object v1

    .line 605
    :goto_14
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 606
    .line 607
    .line 608
    const-string v0, "channel_c"

    .line 609
    .line 610
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->channel:Lcom/p1/mobile/putong/core/data/MessageChannel;

    .line 611
    .line 612
    if-nez v1, :cond_15

    .line 613
    .line 614
    move-object v1, p0

    .line 615
    goto :goto_15

    .line 616
    :cond_15
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 617
    .line 618
    .line 619
    move-result v1

    .line 620
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 621
    .line 622
    .line 623
    move-result-object v1

    .line 624
    :goto_15
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 625
    .line 626
    .line 627
    const-string v0, "notifiedUsers_c"

    .line 628
    .line 629
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->notifiedUsers:Ljava/util/List;

    .line 630
    .line 631
    if-nez v1, :cond_16

    .line 632
    .line 633
    move-object v1, p0

    .line 634
    goto :goto_16

    .line 635
    :cond_16
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 636
    .line 637
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 638
    .line 639
    .line 640
    move-result-object v1

    .line 641
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/Message;->notifiedUsers:Ljava/util/List;

    .line 642
    .line 643
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 644
    .line 645
    .line 646
    move-result-object v1

    .line 647
    :goto_16
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 648
    .line 649
    .line 650
    const-string v0, "str_status_c"

    .line 651
    .line 652
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->status:Lcom/p1/mobile/putong/core/data/MessageStatus;

    .line 653
    .line 654
    if-nez v1, :cond_17

    .line 655
    .line 656
    move-object v1, p0

    .line 657
    goto :goto_17

    .line 658
    :cond_17
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 659
    .line 660
    .line 661
    move-result-object v1

    .line 662
    :goto_17
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 663
    .line 664
    .line 665
    const-string v0, "status_c"

    .line 666
    .line 667
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->status:Lcom/p1/mobile/putong/core/data/MessageStatus;

    .line 668
    .line 669
    if-nez v1, :cond_18

    .line 670
    .line 671
    move-object v1, p0

    .line 672
    goto :goto_18

    .line 673
    :cond_18
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 674
    .line 675
    .line 676
    move-result v1

    .line 677
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 678
    .line 679
    .line 680
    move-result-object v1

    .line 681
    :goto_18
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 682
    .line 683
    .line 684
    const-string v0, "referenceMsgId_c"

    .line 685
    .line 686
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->referenceMsgId:Ljava/lang/String;

    .line 687
    .line 688
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 689
    .line 690
    .line 691
    const-string v0, "hostId_c"

    .line 692
    .line 693
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->hostId:Ljava/lang/String;

    .line 694
    .line 695
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 696
    .line 697
    .line 698
    const-string v0, "localRedPacketType_c"

    .line 699
    .line 700
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->localRedPacketType:Ljava/lang/String;

    .line 701
    .line 702
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 703
    .line 704
    .line 705
    const-string v0, "localAudioText_c"

    .line 706
    .line 707
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->localAudioText:Lcom/p1/mobile/putong/core/data/AudioText;

    .line 708
    .line 709
    if-nez v1, :cond_19

    .line 710
    .line 711
    move-object v1, p0

    .line 712
    goto :goto_19

    .line 713
    :cond_19
    sget-object v2, Lcom/p1/mobile/putong/core/data/AudioText;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 714
    .line 715
    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 716
    .line 717
    .line 718
    move-result-object v1

    .line 719
    :goto_19
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 720
    .line 721
    .line 722
    const-string v0, "localGreetingId_c"

    .line 723
    .line 724
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->localGreetingId:Ljava/lang/String;

    .line 725
    .line 726
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 727
    .line 728
    .line 729
    const-string v0, "read_c"

    .line 730
    .line 731
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/Message;->read:Z

    .line 732
    .line 733
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 734
    .line 735
    .line 736
    move-result-object v1

    .line 737
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 738
    .line 739
    .line 740
    const-string v0, "needRead_c"

    .line 741
    .line 742
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/Message;->needRead:Z

    .line 743
    .line 744
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 745
    .line 746
    .line 747
    move-result-object v1

    .line 748
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 749
    .line 750
    .line 751
    const-string v0, "extData_c"

    .line 752
    .line 753
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 754
    .line 755
    if-nez v1, :cond_1a

    .line 756
    .line 757
    move-object v1, p0

    .line 758
    goto :goto_1a

    .line 759
    :cond_1a
    sget-object v2, Lcom/p1/mobile/putong/core/data/MessageExtData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 760
    .line 761
    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 762
    .line 763
    .line 764
    move-result-object v1

    .line 765
    :goto_1a
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 766
    .line 767
    .line 768
    const-string v0, "fromConvType_c"

    .line 769
    .line 770
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->fromConvType:Ljava/lang/String;

    .line 771
    .line 772
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 773
    .line 774
    .line 775
    const-string v0, "localExtraInfo_c"

    .line 776
    .line 777
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->localExtraInfo:Ljava/lang/String;

    .line 778
    .line 779
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 780
    .line 781
    .line 782
    const-string v0, "str_localBusinessTypes_c"

    .line 783
    .line 784
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->localBusinessTypes:Ljava/util/List;

    .line 785
    .line 786
    if-nez v1, :cond_1b

    .line 787
    .line 788
    move-object v1, p0

    .line 789
    goto :goto_1b

    .line 790
    :cond_1b
    sget-object v1, Lcom/p1/mobile/putong/core/data/LocalBusinessType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 791
    .line 792
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 793
    .line 794
    .line 795
    move-result-object v1

    .line 796
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/Message;->localBusinessTypes:Ljava/util/List;

    .line 797
    .line 798
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 799
    .line 800
    .line 801
    move-result-object v1

    .line 802
    :goto_1b
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 803
    .line 804
    .line 805
    const-string v0, "incTempInfo_c"

    .line 806
    .line 807
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->incTempInfo:Ljava/lang/String;

    .line 808
    .line 809
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 810
    .line 811
    .line 812
    const-string v0, "riskTags_c"

    .line 813
    .line 814
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->riskTags:Ljava/util/List;

    .line 815
    .line 816
    if-nez v1, :cond_1c

    .line 817
    .line 818
    move-object v1, p0

    .line 819
    goto :goto_1c

    .line 820
    :cond_1c
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 821
    .line 822
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 823
    .line 824
    .line 825
    move-result-object v1

    .line 826
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/Message;->riskTags:Ljava/util/List;

    .line 827
    .line 828
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 829
    .line 830
    .line 831
    move-result-object v1

    .line 832
    :goto_1c
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 833
    .line 834
    .line 835
    const-string v0, "localMyVisitorCount_c"

    .line 836
    .line 837
    iget v1, p1, Lcom/p1/mobile/putong/core/data/Message;->localMyVisitorCount:I

    .line 838
    .line 839
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 840
    .line 841
    .line 842
    move-result-object v1

    .line 843
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 844
    .line 845
    .line 846
    const-string v0, "localMyVisitorHidden_c"

    .line 847
    .line 848
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/Message;->localMyVisitorHidden:Z

    .line 849
    .line 850
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 851
    .line 852
    .line 853
    move-result-object p1

    .line 854
    invoke-static {p2, v0, p1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 855
    .line 856
    .line 857
    return-void

    .line 858
    :catch_0
    move-exception p1

    .line 859
    invoke-static {p1, p0}, Lcom/google/protobuf/nano/MessageNano;->reportError(Ljava/lang/Exception;Landroid/database/Cursor;)V

    .line 860
    .line 861
    .line 862
    return-void
.end method

.method public bridge synthetic write(Ljava/lang/Object;Landroid/content/ContentValues;)V
    .locals 0

    .line 863
    check-cast p1, Lcom/p1/mobile/putong/core/data/Message;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/Message$61;->write(Lcom/p1/mobile/putong/core/data/Message;Landroid/content/ContentValues;)V

    return-void
.end method
