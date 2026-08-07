.class Lcom/p1/mobile/putong/core/data/Conversation$129;
.super Ll/vzf0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/Conversation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/vzf0<",
        "Lcom/p1/mobile/putong/core/data/Conversation;",
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
    const-string p1, " (_id INTEGER PRIMARY KEY,id_c TEXT,localHasMessage_c INTEGER,read_c INTEGER,otherUser_c TEXT,readUntil_c TEXT,latestTime_c REAL,createdTime_c REAL,localMatchFrom_c INTEGER,localNotificationStatus_c INTEGER,localBotheringTime_c REAL,scenarios_c BLOB,localActiveTime_c REAL,unreadMessages_c INTEGER,localEverHasMessage_c INTEGER,reminder_c BLOB,localUserUpdatedTime_c REAL,importance_c INTEGER,localOnlineTabClick_c TEXT,follow_c INTEGER,localBotherWxTime_c REAL,localBotherCodeTime_c REAL,clearedUntil_c TEXT,status_c INTEGER,place_c TEXT,subtype_c INTEGER,myTalk_c BLOB,otherTalk_c BLOB,otherReadUntil_c TEXT,enterTimes_c INTEGER,updatedTime_c REAL,unmatchConversation_c INTEGER,remainedTime_c INTEGER,localSafetyReminderTime_c REAL,localSpoofingReminderTime_c REAL,forceSend_c INTEGER,conversationUserDistance_c INTEGER,conversationUserUpdatedTime_c REAL,level_c INTEGER,additional_quickChat_avatarBlurred_c INTEGER,additional_voiceCall_rejectedTime_c TEXT,additional_voiceCall_acceptedTime_c TEXT,additional_timeLimited_expiredTimestamp_c INTEGER,additional_timeLimited_participate_c TEXT,additional_timeLimited_allowExtension_c INTEGER,additional_timeLimited_extensionOperator_c TEXT,convType_c TEXT,property_c BLOB,userMessageCount_c INTEGER,latestFriendCommentCreatedTime_c REAL,heat_orderScore_c INTEGER,heat_showScore_c INTEGER,heat_marks_c TEXT,heat_mm_c INTEGER,heat_score_c INTEGER,localBusinessTypes_c BLOB,additional_oneSideNoMatch_selfSend_c INTEGER,localGreetDelete_c INTEGER,additional_timeLimited_hidden_c INTEGER,additional_timeLimited_newConversation_c INTEGER,additional_timeLimited_expiredSeconds_c INTEGER,suggestionScore_c REAL,localBotherStatus_c INTEGER,muted_c INTEGER,group_latestNotificationMsgId_c TEXT,group_joinedTime_c REAL,additional_oneSide_c BLOB,localDraft_c TEXT,localChatBg_c BLOB,localPlaceBan_c INTEGER,additional_kankan_contents_c BLOB,additional_kankan_resonance_c TEXT,additional_kankan_greetingSummaryDetail_unseen_c INTEGER,additional_kankan_greetingSummaryDetail_latestTime_c REAL,additional_kankan_greetingSummaryDetail_latestUserId_c TEXT,additional_kankan_greetingSummaryDetail_latestMessageId_c TEXT,additional_quickChat_bell_isInitiator_c INTEGER,additional_quickChat_bell_agree_c INTEGER,localMessageInsertReportHint_c TEXT,localNotifyMomentId_c TEXT,localInsertedMomentId_c TEXT,mm_c INTEGER,additional_quickChat_expire_c REAL,str_localMatchFrom_c TEXT,str_localNotificationStatus_c TEXT,str_importance_c TEXT,str_status_c TEXT,str_subtype_c TEXT,str_localBusinessTypes_c BLOB,str_localPlaceBan_c TEXT,intimacy_c INTEGER,quickChatProgress_c INTEGER,group_source_c TEXT,additional_quickChat_progress_c INTEGER,additional_feedStateCounter_c BLOB,additional_suggestedTimeLimitedMatch_c BLOB,additional_kankan_greetingSummaryDetail_iconURL_c TEXT,additional_kankan_greetingSummaryDetail_title_c TEXT,additional_kankan_greetingSummaryDetail_subtitle_c TEXT,additional_heartbeatMatch_c BLOB,hasLocalBreakIce_c INTEGER,additional_avatarSummary_c BLOB,additional_feedInteractionCounter_c BLOB,localSpoofingNewTime_c REAL,additional_liveVirtualVoice_c BLOB,clearedTime_c REAL,additional_localMomentInfo_c BLOB,localExtraInfo_c TEXT,lastActivityTime_c REAL,additional_liveActivity_c BLOB,additional_game_c BLOB,additional_tag_c BLOB,additional_chatAssistantQuestion_c BLOB,additional_quickChat_guideFakeToGood_c INTEGER,otherStatus_c TEXT,additional_continuousChat_c BLOB,additional_pinChat_c BLOB,additional_reSwipe_c BLOB,additional_blindbox_c BLOB,additional_previewTexts_c BLOB,additional_greetingInfo_c BLOB,additional_fateRadar_c BLOB,isFake_c INTEGER,additional_lowPayOneside_c BLOB,additional_matchInfo_c BLOB,additional_newMatch_labelExposureTime_c REAL,additional_loveLetter_c BLOB,localIsLimitedTrialSee_c INTEGER,additional_chatMM_c BLOB,additional_blackList_c BLOB,additional_messageRelate_c BLOB,additional_compliment_c BLOB,additional_swiper_c BLOB)"

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
    const-class p0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    return-object p0
.end method

.method public init()Lcom/p1/mobile/putong/core/data/Conversation;
    .locals 2

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/Conversation;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->read:Ljava/lang/Boolean;

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->read:Ljava/lang/Boolean;

    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 15
    .line 16
    const-string v1, ""

    .line 17
    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 21
    .line 22
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 23
    .line 24
    if-nez v0, :cond_2

    .line 25
    .line 26
    sget-object v0, Lcom/p1/mobile/putong/core/data/NotificationStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 33
    .line 34
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 35
    .line 36
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->importance:Lcom/p1/mobile/putong/core/data/StickStatus;

    .line 37
    .line 38
    if-nez v0, :cond_3

    .line 39
    .line 40
    sget-object v0, Lcom/p1/mobile/putong/core/data/StickStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Lcom/p1/mobile/putong/core/data/StickStatus;

    .line 47
    .line 48
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->importance:Lcom/p1/mobile/putong/core/data/StickStatus;

    .line 49
    .line 50
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 51
    .line 52
    if-nez v0, :cond_4

    .line 53
    .line 54
    sget-object v0, Lcom/p1/mobile/putong/data/ConversationStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 55
    .line 56
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    check-cast v0, Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 61
    .line 62
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 63
    .line 64
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->subtype:Lcom/p1/mobile/putong/core/data/ConversationType;

    .line 65
    .line 66
    if-nez v0, :cond_5

    .line 67
    .line 68
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConversationType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 69
    .line 70
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    check-cast v0, Lcom/p1/mobile/putong/core/data/ConversationType;

    .line 75
    .line 76
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->subtype:Lcom/p1/mobile/putong/core/data/ConversationType;

    .line 77
    .line 78
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->myTalk:Lcom/p1/mobile/putong/core/data/TalkInfo;

    .line 79
    .line 80
    if-nez v0, :cond_6

    .line 81
    .line 82
    invoke-static {}, Lcom/p1/mobile/putong/core/data/TalkInfo;->new_()Lcom/p1/mobile/putong/core/data/TalkInfo;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->myTalk:Lcom/p1/mobile/putong/core/data/TalkInfo;

    .line 87
    .line 88
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->otherTalk:Lcom/p1/mobile/putong/core/data/TalkInfo;

    .line 89
    .line 90
    if-nez v0, :cond_7

    .line 91
    .line 92
    invoke-static {}, Lcom/p1/mobile/putong/core/data/TalkInfo;->new_()Lcom/p1/mobile/putong/core/data/TalkInfo;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->otherTalk:Lcom/p1/mobile/putong/core/data/TalkInfo;

    .line 97
    .line 98
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 99
    .line 100
    if-nez v0, :cond_8

    .line 101
    .line 102
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->new_()Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 107
    .line 108
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 109
    .line 110
    if-nez v0, :cond_9

    .line 111
    .line 112
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 113
    .line 114
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 115
    .line 116
    if-nez v0, :cond_a

    .line 117
    .line 118
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConversationProperty;->new_()Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 123
    .line 124
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->heat:Lcom/p1/mobile/putong/core/data/FriendHeatScore;

    .line 125
    .line 126
    if-nez v0, :cond_b

    .line 127
    .line 128
    invoke-static {}, Lcom/p1/mobile/putong/core/data/FriendHeatScore;->new_()Lcom/p1/mobile/putong/core/data/FriendHeatScore;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->heat:Lcom/p1/mobile/putong/core/data/FriendHeatScore;

    .line 133
    .line 134
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localBusinessTypes:Ljava/util/List;

    .line 135
    .line 136
    if-nez v0, :cond_c

    .line 137
    .line 138
    new-instance v0, Ljava/util/ArrayList;

    .line 139
    .line 140
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 141
    .line 142
    .line 143
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localBusinessTypes:Ljava/util/List;

    .line 144
    .line 145
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->group:Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;

    .line 146
    .line 147
    if-nez v0, :cond_d

    .line 148
    .line 149
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;->new_()Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->group:Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;

    .line 154
    .line 155
    :cond_d
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localPlaceBan:Lcom/p1/mobile/putong/core/data/LocalPlaceBan;

    .line 156
    .line 157
    if-nez v0, :cond_e

    .line 158
    .line 159
    sget-object v0, Lcom/p1/mobile/putong/core/data/LocalPlaceBan;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 160
    .line 161
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    check-cast v0, Lcom/p1/mobile/putong/core/data/LocalPlaceBan;

    .line 166
    .line 167
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localPlaceBan:Lcom/p1/mobile/putong/core/data/LocalPlaceBan;

    .line 168
    .line 169
    :cond_e
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localNotifyMomentId:Ljava/lang/String;

    .line 170
    .line 171
    if-nez v0, :cond_f

    .line 172
    .line 173
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localNotifyMomentId:Ljava/lang/String;

    .line 174
    .line 175
    :cond_f
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localInsertedMomentId:Ljava/lang/String;

    .line 176
    .line 177
    if-nez v0, :cond_10

    .line 178
    .line 179
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->localInsertedMomentId:Ljava/lang/String;

    .line 180
    .line 181
    :cond_10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->otherStatus:Ljava/lang/String;

    .line 182
    .line 183
    if-nez v0, :cond_11

    .line 184
    .line 185
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->otherStatus:Ljava/lang/String;

    .line 186
    .line 187
    :cond_11
    return-object p0
.end method

.method public bridge synthetic init()Ljava/lang/Object;
    .locals 0

    .line 188
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Conversation$129;->init()Lcom/p1/mobile/putong/core/data/Conversation;

    move-result-object p0

    return-object p0
.end method

.method public read(Landroid/database/Cursor;I)Lcom/p1/mobile/putong/core/data/Conversation;
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
    new-instance v4, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 13
    .line 14
    invoke-direct {v4}, Lcom/p1/mobile/putong/core/data/Conversation;-><init>()V

    .line 15
    .line 16
    .line 17
    :try_start_0
    new-instance v7, Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 18
    .line 19
    invoke-direct {v7}, Lcom/p1/mobile/putong/core/data/ConversationAdditional;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v7, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 23
    .line 24
    new-instance v7, Lcom/p1/mobile/putong/core/data/FriendHeatScore;

    .line 25
    .line 26
    invoke-direct {v7}, Lcom/p1/mobile/putong/core/data/FriendHeatScore;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object v7, v4, Lcom/p1/mobile/putong/core/data/Conversation;->heat:Lcom/p1/mobile/putong/core/data/FriendHeatScore;

    .line 30
    .line 31
    new-instance v7, Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;

    .line 32
    .line 33
    invoke-direct {v7}, Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object v7, v4, Lcom/p1/mobile/putong/core/data/Conversation;->group:Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;

    .line 37
    .line 38
    iget-object v7, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 39
    .line 40
    new-instance v8, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;

    .line 41
    .line 42
    invoke-direct {v8}, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;-><init>()V

    .line 43
    .line 44
    .line 45
    iput-object v8, v7, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->quickChat:Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;

    .line 46
    .line 47
    iget-object v7, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 48
    .line 49
    new-instance v8, Lcom/p1/mobile/putong/core/data/VoiceCallAdditional;

    .line 50
    .line 51
    invoke-direct {v8}, Lcom/p1/mobile/putong/core/data/VoiceCallAdditional;-><init>()V

    .line 52
    .line 53
    .line 54
    iput-object v8, v7, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->voiceCall:Lcom/p1/mobile/putong/core/data/VoiceCallAdditional;

    .line 55
    .line 56
    iget-object v7, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 57
    .line 58
    new-instance v8, Lcom/p1/mobile/putong/core/data/TimeLimited;

    .line 59
    .line 60
    invoke-direct {v8}, Lcom/p1/mobile/putong/core/data/TimeLimited;-><init>()V

    .line 61
    .line 62
    .line 63
    iput-object v8, v7, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->timeLimited:Lcom/p1/mobile/putong/core/data/TimeLimited;

    .line 64
    .line 65
    iget-object v7, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 66
    .line 67
    new-instance v8, Lcom/p1/mobile/putong/core/data/OneSideNoMatchConversation;

    .line 68
    .line 69
    invoke-direct {v8}, Lcom/p1/mobile/putong/core/data/OneSideNoMatchConversation;-><init>()V

    .line 70
    .line 71
    .line 72
    iput-object v8, v7, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->oneSideNoMatch:Lcom/p1/mobile/putong/core/data/OneSideNoMatchConversation;

    .line 73
    .line 74
    iget-object v7, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 75
    .line 76
    new-instance v8, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;

    .line 77
    .line 78
    invoke-direct {v8}, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;-><init>()V

    .line 79
    .line 80
    .line 81
    iput-object v8, v7, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->kankan:Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;

    .line 82
    .line 83
    iget-object v7, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 84
    .line 85
    new-instance v8, Lcom/p1/mobile/putong/core/data/ExposureNewMatch;

    .line 86
    .line 87
    invoke-direct {v8}, Lcom/p1/mobile/putong/core/data/ExposureNewMatch;-><init>()V

    .line 88
    .line 89
    .line 90
    iput-object v8, v7, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->newMatch:Lcom/p1/mobile/putong/core/data/ExposureNewMatch;

    .line 91
    .line 92
    iget-object v7, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 93
    .line 94
    iget-object v7, v7, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->kankan:Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;

    .line 95
    .line 96
    new-instance v8, Lcom/p1/mobile/putong/core/data/GreetingSummary;

    .line 97
    .line 98
    invoke-direct {v8}, Lcom/p1/mobile/putong/core/data/GreetingSummary;-><init>()V

    .line 99
    .line 100
    .line 101
    iput-object v8, v7, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;->greetingSummaryDetail:Lcom/p1/mobile/putong/core/data/GreetingSummary;

    .line 102
    .line 103
    iget-object v7, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 104
    .line 105
    iget-object v7, v7, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->quickChat:Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;

    .line 106
    .line 107
    new-instance v8, Lcom/p1/mobile/putong/core/data/QuickChatBell;

    .line 108
    .line 109
    invoke-direct {v8}, Lcom/p1/mobile/putong/core/data/QuickChatBell;-><init>()V

    .line 110
    .line 111
    .line 112
    iput-object v8, v7, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->bell:Lcom/p1/mobile/putong/core/data/QuickChatBell;

    .line 113
    .line 114
    invoke-interface/range {p1 .. p2}, Landroid/database/Cursor;->getLong(I)J

    .line 115
    .line 116
    .line 117
    move-result-wide v7

    .line 118
    iput-wide v7, v4, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 119
    .line 120
    add-int/lit8 v7, p2, 0x1

    .line 121
    .line 122
    invoke-interface {v1, v7}, Landroid/database/Cursor;->isNull(I)Z

    .line 123
    .line 124
    .line 125
    move-result v8

    .line 126
    if-eqz v8, :cond_1

    .line 127
    .line 128
    const/4 v7, 0x0

    .line 129
    goto :goto_0

    .line 130
    :cond_1
    invoke-interface {v1, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v7

    .line 134
    :goto_0
    iput-object v7, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 135
    .line 136
    add-int/lit8 v7, p2, 0x2

    .line 137
    .line 138
    invoke-interface {v1, v7}, Landroid/database/Cursor;->getInt(I)I

    .line 139
    .line 140
    .line 141
    move-result v7

    .line 142
    const/4 v8, 0x1

    .line 143
    if-ne v7, v8, :cond_2

    .line 144
    .line 145
    move v7, v8

    .line 146
    goto :goto_1

    .line 147
    :cond_2
    move v7, v3

    .line 148
    :goto_1
    iput-boolean v7, v4, Lcom/p1/mobile/putong/core/data/Conversation;->localHasMessage:Z

    .line 149
    .line 150
    add-int/lit8 v7, p2, 0x3

    .line 151
    .line 152
    invoke-interface {v1, v7}, Landroid/database/Cursor;->isNull(I)Z

    .line 153
    .line 154
    .line 155
    move-result v9

    .line 156
    if-eqz v9, :cond_3

    .line 157
    .line 158
    const/4 v7, 0x0

    .line 159
    goto :goto_3

    .line 160
    :cond_3
    invoke-interface {v1, v7}, Landroid/database/Cursor;->getInt(I)I

    .line 161
    .line 162
    .line 163
    move-result v7

    .line 164
    if-ne v7, v8, :cond_4

    .line 165
    .line 166
    move v7, v8

    .line 167
    goto :goto_2

    .line 168
    :cond_4
    move v7, v3

    .line 169
    :goto_2
    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 170
    .line 171
    .line 172
    move-result-object v7

    .line 173
    :goto_3
    iput-object v7, v4, Lcom/p1/mobile/putong/core/data/Conversation;->read:Ljava/lang/Boolean;

    .line 174
    .line 175
    add-int/lit8 v7, p2, 0x4

    .line 176
    .line 177
    invoke-interface {v1, v7}, Landroid/database/Cursor;->isNull(I)Z

    .line 178
    .line 179
    .line 180
    move-result v9

    .line 181
    if-eqz v9, :cond_5

    .line 182
    .line 183
    const/4 v7, 0x0

    .line 184
    goto :goto_4

    .line 185
    :cond_5
    invoke-interface {v1, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object v7

    .line 189
    :goto_4
    iput-object v7, v4, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 190
    .line 191
    add-int/lit8 v7, p2, 0x5

    .line 192
    .line 193
    invoke-interface {v1, v7}, Landroid/database/Cursor;->isNull(I)Z

    .line 194
    .line 195
    .line 196
    move-result v9

    .line 197
    if-eqz v9, :cond_6

    .line 198
    .line 199
    const/4 v7, 0x0

    .line 200
    goto :goto_5

    .line 201
    :cond_6
    invoke-interface {v1, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object v7

    .line 205
    :goto_5
    iput-object v7, v4, Lcom/p1/mobile/putong/core/data/Conversation;->readUntil:Ljava/lang/String;

    .line 206
    .line 207
    add-int/lit8 v7, p2, 0x6

    .line 208
    .line 209
    invoke-interface {v1, v7}, Landroid/database/Cursor;->getDouble(I)D

    .line 210
    .line 211
    .line 212
    move-result-wide v9

    .line 213
    iput-wide v9, v4, Lcom/p1/mobile/putong/core/data/Conversation;->latestTime:D

    .line 214
    .line 215
    add-int/lit8 v7, p2, 0x7

    .line 216
    .line 217
    invoke-interface {v1, v7}, Landroid/database/Cursor;->getDouble(I)D

    .line 218
    .line 219
    .line 220
    move-result-wide v9

    .line 221
    iput-wide v9, v4, Lcom/p1/mobile/putong/core/data/Conversation;->createdTime:D

    .line 222
    .line 223
    add-int/lit8 v7, p2, 0x8

    .line 224
    .line 225
    invoke-interface {v1, v7}, Landroid/database/Cursor;->isNull(I)Z

    .line 226
    .line 227
    .line 228
    move-result v9

    .line 229
    if-eqz v9, :cond_7

    .line 230
    .line 231
    const/4 v7, -0x1

    .line 232
    goto :goto_6

    .line 233
    :cond_7
    invoke-interface {v1, v7}, Landroid/database/Cursor;->getInt(I)I

    .line 234
    .line 235
    .line 236
    move-result v7
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_e

    .line 237
    :goto_6
    add-int/lit8 v9, p2, 0x9

    .line 238
    .line 239
    :try_start_1
    invoke-interface {v1, v9}, Landroid/database/Cursor;->isNull(I)Z

    .line 240
    .line 241
    .line 242
    move-result v10

    .line 243
    if-eqz v10, :cond_8

    .line 244
    .line 245
    const/4 v9, -0x1

    .line 246
    goto :goto_7

    .line 247
    :cond_8
    invoke-interface {v1, v9}, Landroid/database/Cursor;->getInt(I)I

    .line 248
    .line 249
    .line 250
    move-result v9
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_d

    .line 251
    :goto_7
    add-int/lit8 v10, p2, 0xa

    .line 252
    .line 253
    :try_start_2
    invoke-interface {v1, v10}, Landroid/database/Cursor;->getDouble(I)D

    .line 254
    .line 255
    .line 256
    move-result-wide v10

    .line 257
    iput-wide v10, v4, Lcom/p1/mobile/putong/core/data/Conversation;->localBotheringTime:D

    .line 258
    .line 259
    add-int/lit8 v10, p2, 0xb

    .line 260
    .line 261
    invoke-interface {v1, v10}, Landroid/database/Cursor;->isNull(I)Z

    .line 262
    .line 263
    .line 264
    move-result v11

    .line 265
    if-eqz v11, :cond_9

    .line 266
    .line 267
    const/4 v10, 0x0

    .line 268
    goto :goto_8

    .line 269
    :cond_9
    sget-object v11, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 270
    .line 271
    invoke-virtual {v11}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 272
    .line 273
    .line 274
    move-result-object v11

    .line 275
    invoke-interface {v1, v10}, Landroid/database/Cursor;->getBlob(I)[B

    .line 276
    .line 277
    .line 278
    move-result-object v10

    .line 279
    invoke-virtual {v11, v10}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 280
    .line 281
    .line 282
    move-result-object v10

    .line 283
    check-cast v10, Ljava/util/List;

    .line 284
    .line 285
    :goto_8
    iput-object v10, v4, Lcom/p1/mobile/putong/core/data/Conversation;->scenarios:Ljava/util/List;

    .line 286
    .line 287
    add-int/lit8 v10, p2, 0xc

    .line 288
    .line 289
    invoke-interface {v1, v10}, Landroid/database/Cursor;->getDouble(I)D

    .line 290
    .line 291
    .line 292
    move-result-wide v10

    .line 293
    iput-wide v10, v4, Lcom/p1/mobile/putong/core/data/Conversation;->localActiveTime:D

    .line 294
    .line 295
    add-int/lit8 v10, p2, 0xd

    .line 296
    .line 297
    invoke-interface {v1, v10}, Landroid/database/Cursor;->getInt(I)I

    .line 298
    .line 299
    .line 300
    move-result v10

    .line 301
    iput v10, v4, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 302
    .line 303
    add-int/lit8 v10, p2, 0xe

    .line 304
    .line 305
    invoke-interface {v1, v10}, Landroid/database/Cursor;->getInt(I)I

    .line 306
    .line 307
    .line 308
    move-result v10

    .line 309
    if-ne v10, v8, :cond_a

    .line 310
    .line 311
    move v10, v8

    .line 312
    goto :goto_9

    .line 313
    :cond_a
    move v10, v3

    .line 314
    :goto_9
    iput-boolean v10, v4, Lcom/p1/mobile/putong/core/data/Conversation;->localEverHasMessage:Z

    .line 315
    .line 316
    add-int/lit8 v10, p2, 0xf

    .line 317
    .line 318
    invoke-interface {v1, v10}, Landroid/database/Cursor;->isNull(I)Z

    .line 319
    .line 320
    .line 321
    move-result v11

    .line 322
    if-eqz v11, :cond_b

    .line 323
    .line 324
    const/4 v10, 0x0

    .line 325
    goto :goto_a

    .line 326
    :cond_b
    sget-object v11, Lcom/p1/mobile/putong/core/data/Reminder;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 327
    .line 328
    invoke-interface {v1, v10}, Landroid/database/Cursor;->getBlob(I)[B

    .line 329
    .line 330
    .line 331
    move-result-object v10

    .line 332
    invoke-virtual {v11, v10}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 333
    .line 334
    .line 335
    move-result-object v10

    .line 336
    check-cast v10, Lcom/p1/mobile/putong/core/data/Reminder;

    .line 337
    .line 338
    :goto_a
    iput-object v10, v4, Lcom/p1/mobile/putong/core/data/Conversation;->reminder:Lcom/p1/mobile/putong/core/data/Reminder;

    .line 339
    .line 340
    add-int/lit8 v10, p2, 0x10

    .line 341
    .line 342
    invoke-interface {v1, v10}, Landroid/database/Cursor;->getDouble(I)D

    .line 343
    .line 344
    .line 345
    move-result-wide v10

    .line 346
    iput-wide v10, v4, Lcom/p1/mobile/putong/core/data/Conversation;->localUserUpdatedTime:D

    .line 347
    .line 348
    add-int/lit8 v10, p2, 0x11

    .line 349
    .line 350
    invoke-interface {v1, v10}, Landroid/database/Cursor;->isNull(I)Z

    .line 351
    .line 352
    .line 353
    move-result v11

    .line 354
    if-eqz v11, :cond_c

    .line 355
    .line 356
    const/4 v10, -0x1

    .line 357
    goto :goto_b

    .line 358
    :cond_c
    invoke-interface {v1, v10}, Landroid/database/Cursor;->getInt(I)I

    .line 359
    .line 360
    .line 361
    move-result v10
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_c

    .line 362
    :goto_b
    add-int/lit8 v11, p2, 0x12

    .line 363
    .line 364
    :try_start_3
    invoke-interface {v1, v11}, Landroid/database/Cursor;->isNull(I)Z

    .line 365
    .line 366
    .line 367
    move-result v12

    .line 368
    if-eqz v12, :cond_d

    .line 369
    .line 370
    const/4 v11, 0x0

    .line 371
    goto :goto_c

    .line 372
    :cond_d
    invoke-interface {v1, v11}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 373
    .line 374
    .line 375
    move-result-object v11

    .line 376
    :goto_c
    iput-object v11, v4, Lcom/p1/mobile/putong/core/data/Conversation;->localOnlineTabClick:Ljava/lang/String;

    .line 377
    .line 378
    add-int/lit8 v11, p2, 0x13

    .line 379
    .line 380
    invoke-interface {v1, v11}, Landroid/database/Cursor;->getInt(I)I

    .line 381
    .line 382
    .line 383
    move-result v11

    .line 384
    if-ne v11, v8, :cond_e

    .line 385
    .line 386
    move v11, v8

    .line 387
    goto :goto_d

    .line 388
    :cond_e
    move v11, v3

    .line 389
    :goto_d
    iput-boolean v11, v4, Lcom/p1/mobile/putong/core/data/Conversation;->follow:Z

    .line 390
    .line 391
    add-int/lit8 v11, p2, 0x14

    .line 392
    .line 393
    invoke-interface {v1, v11}, Landroid/database/Cursor;->getDouble(I)D

    .line 394
    .line 395
    .line 396
    move-result-wide v11

    .line 397
    iput-wide v11, v4, Lcom/p1/mobile/putong/core/data/Conversation;->localBotherWxTime:D

    .line 398
    .line 399
    add-int/lit8 v11, p2, 0x15

    .line 400
    .line 401
    invoke-interface {v1, v11}, Landroid/database/Cursor;->getDouble(I)D

    .line 402
    .line 403
    .line 404
    move-result-wide v11

    .line 405
    iput-wide v11, v4, Lcom/p1/mobile/putong/core/data/Conversation;->localBotherCodeTime:D

    .line 406
    .line 407
    add-int/lit8 v11, p2, 0x16

    .line 408
    .line 409
    invoke-interface {v1, v11}, Landroid/database/Cursor;->isNull(I)Z

    .line 410
    .line 411
    .line 412
    move-result v12

    .line 413
    if-eqz v12, :cond_f

    .line 414
    .line 415
    const/4 v11, 0x0

    .line 416
    goto :goto_e

    .line 417
    :cond_f
    invoke-interface {v1, v11}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 418
    .line 419
    .line 420
    move-result-object v11

    .line 421
    :goto_e
    iput-object v11, v4, Lcom/p1/mobile/putong/core/data/Conversation;->clearedUntil:Ljava/lang/String;

    .line 422
    .line 423
    add-int/lit8 v11, p2, 0x17

    .line 424
    .line 425
    invoke-interface {v1, v11}, Landroid/database/Cursor;->isNull(I)Z

    .line 426
    .line 427
    .line 428
    move-result v12

    .line 429
    if-eqz v12, :cond_10

    .line 430
    .line 431
    const/4 v11, -0x1

    .line 432
    goto :goto_f

    .line 433
    :cond_10
    invoke-interface {v1, v11}, Landroid/database/Cursor;->getInt(I)I

    .line 434
    .line 435
    .line 436
    move-result v11
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_b

    .line 437
    :goto_f
    add-int/lit8 v12, p2, 0x18

    .line 438
    .line 439
    :try_start_4
    invoke-interface {v1, v12}, Landroid/database/Cursor;->isNull(I)Z

    .line 440
    .line 441
    .line 442
    move-result v13

    .line 443
    if-eqz v13, :cond_11

    .line 444
    .line 445
    const/4 v12, 0x0

    .line 446
    goto :goto_10

    .line 447
    :cond_11
    invoke-interface {v1, v12}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 448
    .line 449
    .line 450
    move-result-object v12

    .line 451
    :goto_10
    iput-object v12, v4, Lcom/p1/mobile/putong/core/data/Conversation;->place:Ljava/lang/String;

    .line 452
    .line 453
    add-int/lit8 v12, p2, 0x19

    .line 454
    .line 455
    invoke-interface {v1, v12}, Landroid/database/Cursor;->isNull(I)Z

    .line 456
    .line 457
    .line 458
    move-result v13

    .line 459
    if-eqz v13, :cond_12

    .line 460
    .line 461
    const/4 v12, -0x1

    .line 462
    goto :goto_11

    .line 463
    :cond_12
    invoke-interface {v1, v12}, Landroid/database/Cursor;->getInt(I)I

    .line 464
    .line 465
    .line 466
    move-result v12
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_a

    .line 467
    :goto_11
    add-int/lit8 v13, p2, 0x1a

    .line 468
    .line 469
    :try_start_5
    invoke-interface {v1, v13}, Landroid/database/Cursor;->isNull(I)Z

    .line 470
    .line 471
    .line 472
    move-result v14

    .line 473
    if-eqz v14, :cond_13

    .line 474
    .line 475
    const/4 v13, 0x0

    .line 476
    goto :goto_12

    .line 477
    :cond_13
    sget-object v14, Lcom/p1/mobile/putong/core/data/TalkInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 478
    .line 479
    invoke-interface {v1, v13}, Landroid/database/Cursor;->getBlob(I)[B

    .line 480
    .line 481
    .line 482
    move-result-object v13

    .line 483
    invoke-virtual {v14, v13}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 484
    .line 485
    .line 486
    move-result-object v13

    .line 487
    check-cast v13, Lcom/p1/mobile/putong/core/data/TalkInfo;

    .line 488
    .line 489
    :goto_12
    iput-object v13, v4, Lcom/p1/mobile/putong/core/data/Conversation;->myTalk:Lcom/p1/mobile/putong/core/data/TalkInfo;

    .line 490
    .line 491
    add-int/lit8 v13, p2, 0x1b

    .line 492
    .line 493
    invoke-interface {v1, v13}, Landroid/database/Cursor;->isNull(I)Z

    .line 494
    .line 495
    .line 496
    move-result v14

    .line 497
    if-eqz v14, :cond_14

    .line 498
    .line 499
    const/4 v13, 0x0

    .line 500
    goto :goto_13

    .line 501
    :cond_14
    sget-object v14, Lcom/p1/mobile/putong/core/data/TalkInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 502
    .line 503
    invoke-interface {v1, v13}, Landroid/database/Cursor;->getBlob(I)[B

    .line 504
    .line 505
    .line 506
    move-result-object v13

    .line 507
    invoke-virtual {v14, v13}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 508
    .line 509
    .line 510
    move-result-object v13

    .line 511
    check-cast v13, Lcom/p1/mobile/putong/core/data/TalkInfo;

    .line 512
    .line 513
    :goto_13
    iput-object v13, v4, Lcom/p1/mobile/putong/core/data/Conversation;->otherTalk:Lcom/p1/mobile/putong/core/data/TalkInfo;

    .line 514
    .line 515
    add-int/lit8 v13, p2, 0x1c

    .line 516
    .line 517
    invoke-interface {v1, v13}, Landroid/database/Cursor;->isNull(I)Z

    .line 518
    .line 519
    .line 520
    move-result v14

    .line 521
    if-eqz v14, :cond_15

    .line 522
    .line 523
    const/4 v13, 0x0

    .line 524
    goto :goto_14

    .line 525
    :cond_15
    invoke-interface {v1, v13}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 526
    .line 527
    .line 528
    move-result-object v13

    .line 529
    :goto_14
    iput-object v13, v4, Lcom/p1/mobile/putong/core/data/Conversation;->otherReadUntil:Ljava/lang/String;

    .line 530
    .line 531
    add-int/lit8 v13, p2, 0x1d

    .line 532
    .line 533
    invoke-interface {v1, v13}, Landroid/database/Cursor;->getInt(I)I

    .line 534
    .line 535
    .line 536
    move-result v13

    .line 537
    iput v13, v4, Lcom/p1/mobile/putong/core/data/Conversation;->enterTimes:I

    .line 538
    .line 539
    add-int/lit8 v13, p2, 0x1e

    .line 540
    .line 541
    invoke-interface {v1, v13}, Landroid/database/Cursor;->getDouble(I)D

    .line 542
    .line 543
    .line 544
    move-result-wide v13

    .line 545
    iput-wide v13, v4, Lcom/p1/mobile/putong/core/data/Conversation;->updatedTime:D

    .line 546
    .line 547
    add-int/lit8 v13, p2, 0x1f

    .line 548
    .line 549
    invoke-interface {v1, v13}, Landroid/database/Cursor;->getInt(I)I

    .line 550
    .line 551
    .line 552
    move-result v13

    .line 553
    if-ne v13, v8, :cond_16

    .line 554
    .line 555
    move v13, v8

    .line 556
    goto :goto_15

    .line 557
    :cond_16
    move v13, v3

    .line 558
    :goto_15
    iput-boolean v13, v4, Lcom/p1/mobile/putong/core/data/Conversation;->unmatchConversation:Z

    .line 559
    .line 560
    add-int/lit8 v13, p2, 0x20

    .line 561
    .line 562
    invoke-interface {v1, v13}, Landroid/database/Cursor;->getLong(I)J

    .line 563
    .line 564
    .line 565
    move-result-wide v13

    .line 566
    iput-wide v13, v4, Lcom/p1/mobile/putong/core/data/Conversation;->remainedTime:J

    .line 567
    .line 568
    add-int/lit8 v13, p2, 0x21

    .line 569
    .line 570
    invoke-interface {v1, v13}, Landroid/database/Cursor;->getDouble(I)D

    .line 571
    .line 572
    .line 573
    move-result-wide v13

    .line 574
    iput-wide v13, v4, Lcom/p1/mobile/putong/core/data/Conversation;->localSafetyReminderTime:D

    .line 575
    .line 576
    add-int/lit8 v13, p2, 0x22

    .line 577
    .line 578
    invoke-interface {v1, v13}, Landroid/database/Cursor;->getDouble(I)D

    .line 579
    .line 580
    .line 581
    move-result-wide v13

    .line 582
    iput-wide v13, v4, Lcom/p1/mobile/putong/core/data/Conversation;->localSpoofingReminderTime:D

    .line 583
    .line 584
    add-int/lit8 v13, p2, 0x23

    .line 585
    .line 586
    invoke-interface {v1, v13}, Landroid/database/Cursor;->getInt(I)I

    .line 587
    .line 588
    .line 589
    move-result v13

    .line 590
    if-ne v13, v8, :cond_17

    .line 591
    .line 592
    move v13, v8

    .line 593
    goto :goto_16

    .line 594
    :cond_17
    move v13, v3

    .line 595
    :goto_16
    iput-boolean v13, v4, Lcom/p1/mobile/putong/core/data/Conversation;->forceSend:Z

    .line 596
    .line 597
    add-int/lit8 v13, p2, 0x24

    .line 598
    .line 599
    invoke-interface {v1, v13}, Landroid/database/Cursor;->getInt(I)I

    .line 600
    .line 601
    .line 602
    move-result v13

    .line 603
    iput v13, v4, Lcom/p1/mobile/putong/core/data/Conversation;->conversationUserDistance:I

    .line 604
    .line 605
    add-int/lit8 v13, p2, 0x25

    .line 606
    .line 607
    invoke-interface {v1, v13}, Landroid/database/Cursor;->getDouble(I)D

    .line 608
    .line 609
    .line 610
    move-result-wide v13

    .line 611
    iput-wide v13, v4, Lcom/p1/mobile/putong/core/data/Conversation;->conversationUserUpdatedTime:D

    .line 612
    .line 613
    add-int/lit8 v13, p2, 0x26

    .line 614
    .line 615
    invoke-interface {v1, v13}, Landroid/database/Cursor;->getInt(I)I

    .line 616
    .line 617
    .line 618
    move-result v13

    .line 619
    iput v13, v4, Lcom/p1/mobile/putong/core/data/Conversation;->level:I

    .line 620
    .line 621
    add-int/lit8 v13, p2, 0x27

    .line 622
    .line 623
    iget-object v14, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 624
    .line 625
    iget-object v14, v14, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->quickChat:Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;

    .line 626
    .line 627
    invoke-interface {v1, v13}, Landroid/database/Cursor;->getInt(I)I

    .line 628
    .line 629
    .line 630
    move-result v13

    .line 631
    if-ne v13, v8, :cond_18

    .line 632
    .line 633
    move v13, v8

    .line 634
    goto :goto_17

    .line 635
    :cond_18
    move v13, v3

    .line 636
    :goto_17
    iput-boolean v13, v14, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->avatarBlurred:Z

    .line 637
    .line 638
    add-int/lit8 v13, p2, 0x28

    .line 639
    .line 640
    iget-object v14, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 641
    .line 642
    iget-object v14, v14, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->voiceCall:Lcom/p1/mobile/putong/core/data/VoiceCallAdditional;

    .line 643
    .line 644
    invoke-interface {v1, v13}, Landroid/database/Cursor;->isNull(I)Z

    .line 645
    .line 646
    .line 647
    move-result v15

    .line 648
    if-eqz v15, :cond_19

    .line 649
    .line 650
    const/4 v13, 0x0

    .line 651
    goto :goto_18

    .line 652
    :cond_19
    invoke-interface {v1, v13}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 653
    .line 654
    .line 655
    move-result-object v13

    .line 656
    :goto_18
    iput-object v13, v14, Lcom/p1/mobile/putong/core/data/VoiceCallAdditional;->rejectedTime:Ljava/lang/String;

    .line 657
    .line 658
    add-int/lit8 v13, p2, 0x29

    .line 659
    .line 660
    iget-object v14, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 661
    .line 662
    iget-object v14, v14, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->voiceCall:Lcom/p1/mobile/putong/core/data/VoiceCallAdditional;

    .line 663
    .line 664
    invoke-interface {v1, v13}, Landroid/database/Cursor;->isNull(I)Z

    .line 665
    .line 666
    .line 667
    move-result v15

    .line 668
    if-eqz v15, :cond_1a

    .line 669
    .line 670
    const/4 v13, 0x0

    .line 671
    goto :goto_19

    .line 672
    :cond_1a
    invoke-interface {v1, v13}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 673
    .line 674
    .line 675
    move-result-object v13

    .line 676
    :goto_19
    iput-object v13, v14, Lcom/p1/mobile/putong/core/data/VoiceCallAdditional;->acceptedTime:Ljava/lang/String;

    .line 677
    .line 678
    add-int/lit8 v13, p2, 0x2a

    .line 679
    .line 680
    iget-object v14, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 681
    .line 682
    iget-object v14, v14, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->timeLimited:Lcom/p1/mobile/putong/core/data/TimeLimited;

    .line 683
    .line 684
    invoke-interface {v1, v13}, Landroid/database/Cursor;->getLong(I)J

    .line 685
    .line 686
    .line 687
    move-result-wide v5

    .line 688
    iput-wide v5, v14, Lcom/p1/mobile/putong/core/data/TimeLimited;->expiredTimestamp:J

    .line 689
    .line 690
    add-int/lit8 v5, p2, 0x2b

    .line 691
    .line 692
    iget-object v6, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 693
    .line 694
    iget-object v6, v6, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->timeLimited:Lcom/p1/mobile/putong/core/data/TimeLimited;

    .line 695
    .line 696
    invoke-interface {v1, v5}, Landroid/database/Cursor;->isNull(I)Z

    .line 697
    .line 698
    .line 699
    move-result v13

    .line 700
    if-eqz v13, :cond_1b

    .line 701
    .line 702
    const/4 v5, 0x0

    .line 703
    goto :goto_1a

    .line 704
    :cond_1b
    invoke-interface {v1, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 705
    .line 706
    .line 707
    move-result-object v5

    .line 708
    :goto_1a
    iput-object v5, v6, Lcom/p1/mobile/putong/core/data/TimeLimited;->participate:Ljava/lang/String;

    .line 709
    .line 710
    add-int/lit8 v5, p2, 0x2c

    .line 711
    .line 712
    iget-object v6, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 713
    .line 714
    iget-object v6, v6, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->timeLimited:Lcom/p1/mobile/putong/core/data/TimeLimited;

    .line 715
    .line 716
    invoke-interface {v1, v5}, Landroid/database/Cursor;->getInt(I)I

    .line 717
    .line 718
    .line 719
    move-result v5

    .line 720
    if-ne v5, v8, :cond_1c

    .line 721
    .line 722
    move v5, v8

    .line 723
    goto :goto_1b

    .line 724
    :cond_1c
    move v5, v3

    .line 725
    :goto_1b
    iput-boolean v5, v6, Lcom/p1/mobile/putong/core/data/TimeLimited;->allowExtension:Z

    .line 726
    .line 727
    add-int/lit8 v5, p2, 0x2d

    .line 728
    .line 729
    iget-object v6, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 730
    .line 731
    iget-object v6, v6, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->timeLimited:Lcom/p1/mobile/putong/core/data/TimeLimited;

    .line 732
    .line 733
    invoke-interface {v1, v5}, Landroid/database/Cursor;->isNull(I)Z

    .line 734
    .line 735
    .line 736
    move-result v13

    .line 737
    if-eqz v13, :cond_1d

    .line 738
    .line 739
    const/4 v5, 0x0

    .line 740
    goto :goto_1c

    .line 741
    :cond_1d
    invoke-interface {v1, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 742
    .line 743
    .line 744
    move-result-object v5

    .line 745
    :goto_1c
    iput-object v5, v6, Lcom/p1/mobile/putong/core/data/TimeLimited;->extensionOperator:Ljava/lang/String;

    .line 746
    .line 747
    add-int/lit8 v5, p2, 0x2e

    .line 748
    .line 749
    invoke-interface {v1, v5}, Landroid/database/Cursor;->isNull(I)Z

    .line 750
    .line 751
    .line 752
    move-result v6

    .line 753
    if-eqz v6, :cond_1e

    .line 754
    .line 755
    const/4 v5, 0x0

    .line 756
    goto :goto_1d

    .line 757
    :cond_1e
    invoke-interface {v1, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 758
    .line 759
    .line 760
    move-result-object v5

    .line 761
    :goto_1d
    iput-object v5, v4, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 762
    .line 763
    add-int/lit8 v5, p2, 0x2f

    .line 764
    .line 765
    invoke-interface {v1, v5}, Landroid/database/Cursor;->isNull(I)Z

    .line 766
    .line 767
    .line 768
    move-result v6

    .line 769
    if-eqz v6, :cond_1f

    .line 770
    .line 771
    const/4 v5, 0x0

    .line 772
    goto :goto_1e

    .line 773
    :cond_1f
    sget-object v6, Lcom/p1/mobile/putong/core/data/ConversationProperty;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 774
    .line 775
    invoke-interface {v1, v5}, Landroid/database/Cursor;->getBlob(I)[B

    .line 776
    .line 777
    .line 778
    move-result-object v5

    .line 779
    invoke-virtual {v6, v5}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 780
    .line 781
    .line 782
    move-result-object v5

    .line 783
    check-cast v5, Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 784
    .line 785
    :goto_1e
    iput-object v5, v4, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 786
    .line 787
    add-int/lit8 v5, p2, 0x30

    .line 788
    .line 789
    invoke-interface {v1, v5}, Landroid/database/Cursor;->getInt(I)I

    .line 790
    .line 791
    .line 792
    move-result v5

    .line 793
    iput v5, v4, Lcom/p1/mobile/putong/core/data/Conversation;->userMessageCount:I

    .line 794
    .line 795
    add-int/lit8 v5, p2, 0x31

    .line 796
    .line 797
    invoke-interface {v1, v5}, Landroid/database/Cursor;->getDouble(I)D

    .line 798
    .line 799
    .line 800
    move-result-wide v5

    .line 801
    iput-wide v5, v4, Lcom/p1/mobile/putong/core/data/Conversation;->latestFriendCommentCreatedTime:D

    .line 802
    .line 803
    add-int/lit8 v5, p2, 0x32

    .line 804
    .line 805
    iget-object v6, v4, Lcom/p1/mobile/putong/core/data/Conversation;->heat:Lcom/p1/mobile/putong/core/data/FriendHeatScore;

    .line 806
    .line 807
    invoke-interface {v1, v5}, Landroid/database/Cursor;->getInt(I)I

    .line 808
    .line 809
    .line 810
    move-result v5

    .line 811
    iput v5, v6, Lcom/p1/mobile/putong/core/data/FriendHeatScore;->orderScore:I

    .line 812
    .line 813
    add-int/lit8 v5, p2, 0x33

    .line 814
    .line 815
    iget-object v6, v4, Lcom/p1/mobile/putong/core/data/Conversation;->heat:Lcom/p1/mobile/putong/core/data/FriendHeatScore;

    .line 816
    .line 817
    invoke-interface {v1, v5}, Landroid/database/Cursor;->getInt(I)I

    .line 818
    .line 819
    .line 820
    move-result v5

    .line 821
    iput v5, v6, Lcom/p1/mobile/putong/core/data/FriendHeatScore;->showScore:I

    .line 822
    .line 823
    add-int/lit8 v5, p2, 0x34

    .line 824
    .line 825
    iget-object v6, v4, Lcom/p1/mobile/putong/core/data/Conversation;->heat:Lcom/p1/mobile/putong/core/data/FriendHeatScore;

    .line 826
    .line 827
    invoke-interface {v1, v5}, Landroid/database/Cursor;->isNull(I)Z

    .line 828
    .line 829
    .line 830
    move-result v13

    .line 831
    if-eqz v13, :cond_20

    .line 832
    .line 833
    const/4 v5, 0x0

    .line 834
    goto :goto_1f

    .line 835
    :cond_20
    invoke-interface {v1, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 836
    .line 837
    .line 838
    move-result-object v5

    .line 839
    :goto_1f
    iput-object v5, v6, Lcom/p1/mobile/putong/core/data/FriendHeatScore;->marks:Ljava/lang/String;

    .line 840
    .line 841
    add-int/lit8 v5, p2, 0x35

    .line 842
    .line 843
    iget-object v6, v4, Lcom/p1/mobile/putong/core/data/Conversation;->heat:Lcom/p1/mobile/putong/core/data/FriendHeatScore;

    .line 844
    .line 845
    invoke-interface {v1, v5}, Landroid/database/Cursor;->getInt(I)I

    .line 846
    .line 847
    .line 848
    move-result v5

    .line 849
    iput v5, v6, Lcom/p1/mobile/putong/core/data/FriendHeatScore;->mm:I

    .line 850
    .line 851
    add-int/lit8 v5, p2, 0x36

    .line 852
    .line 853
    iget-object v6, v4, Lcom/p1/mobile/putong/core/data/Conversation;->heat:Lcom/p1/mobile/putong/core/data/FriendHeatScore;

    .line 854
    .line 855
    invoke-interface {v1, v5}, Landroid/database/Cursor;->getInt(I)I

    .line 856
    .line 857
    .line 858
    move-result v5

    .line 859
    iput v5, v6, Lcom/p1/mobile/putong/core/data/FriendHeatScore;->score:I

    .line 860
    .line 861
    add-int/lit8 v5, p2, 0x37

    .line 862
    .line 863
    invoke-interface {v1, v5}, Landroid/database/Cursor;->isNull(I)Z

    .line 864
    .line 865
    .line 866
    move-result v6

    .line 867
    if-eqz v6, :cond_21

    .line 868
    .line 869
    const/4 v5, 0x0

    .line 870
    goto :goto_20

    .line 871
    :cond_21
    sget-object v6, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 872
    .line 873
    invoke-virtual {v6}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 874
    .line 875
    .line 876
    move-result-object v6

    .line 877
    invoke-interface {v1, v5}, Landroid/database/Cursor;->getBlob(I)[B

    .line 878
    .line 879
    .line 880
    move-result-object v5

    .line 881
    invoke-virtual {v6, v5}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 882
    .line 883
    .line 884
    move-result-object v5

    .line 885
    check-cast v5, Ljava/util/List;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_9

    .line 886
    .line 887
    :goto_20
    add-int/lit8 v6, p2, 0x38

    .line 888
    .line 889
    :try_start_6
    iget-object v13, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 890
    .line 891
    iget-object v13, v13, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->oneSideNoMatch:Lcom/p1/mobile/putong/core/data/OneSideNoMatchConversation;

    .line 892
    .line 893
    invoke-interface {v1, v6}, Landroid/database/Cursor;->isNull(I)Z

    .line 894
    .line 895
    .line 896
    move-result v14

    .line 897
    if-eqz v14, :cond_22

    .line 898
    .line 899
    const/4 v6, 0x0

    .line 900
    goto :goto_22

    .line 901
    :cond_22
    invoke-interface {v1, v6}, Landroid/database/Cursor;->getInt(I)I

    .line 902
    .line 903
    .line 904
    move-result v6

    .line 905
    if-ne v6, v8, :cond_23

    .line 906
    .line 907
    move v6, v8

    .line 908
    goto :goto_21

    .line 909
    :cond_23
    move v6, v3

    .line 910
    :goto_21
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 911
    .line 912
    .line 913
    move-result-object v6

    .line 914
    :goto_22
    iput-object v6, v13, Lcom/p1/mobile/putong/core/data/OneSideNoMatchConversation;->selfSend:Ljava/lang/Boolean;

    .line 915
    .line 916
    add-int/lit8 v6, p2, 0x39

    .line 917
    .line 918
    invoke-interface {v1, v6}, Landroid/database/Cursor;->getInt(I)I

    .line 919
    .line 920
    .line 921
    move-result v6

    .line 922
    if-ne v6, v8, :cond_24

    .line 923
    .line 924
    move v6, v8

    .line 925
    goto :goto_23

    .line 926
    :cond_24
    move v6, v3

    .line 927
    :goto_23
    iput-boolean v6, v4, Lcom/p1/mobile/putong/core/data/Conversation;->localGreetDelete:Z

    .line 928
    .line 929
    add-int/lit8 v6, p2, 0x3a

    .line 930
    .line 931
    iget-object v13, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 932
    .line 933
    iget-object v13, v13, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->timeLimited:Lcom/p1/mobile/putong/core/data/TimeLimited;

    .line 934
    .line 935
    invoke-interface {v1, v6}, Landroid/database/Cursor;->getInt(I)I

    .line 936
    .line 937
    .line 938
    move-result v6

    .line 939
    if-ne v6, v8, :cond_25

    .line 940
    .line 941
    move v6, v8

    .line 942
    goto :goto_24

    .line 943
    :cond_25
    move v6, v3

    .line 944
    :goto_24
    iput-boolean v6, v13, Lcom/p1/mobile/putong/core/data/TimeLimited;->hidden:Z

    .line 945
    .line 946
    add-int/lit8 v6, p2, 0x3b

    .line 947
    .line 948
    iget-object v13, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 949
    .line 950
    iget-object v13, v13, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->timeLimited:Lcom/p1/mobile/putong/core/data/TimeLimited;

    .line 951
    .line 952
    invoke-interface {v1, v6}, Landroid/database/Cursor;->getInt(I)I

    .line 953
    .line 954
    .line 955
    move-result v6

    .line 956
    if-ne v6, v8, :cond_26

    .line 957
    .line 958
    move v6, v8

    .line 959
    goto :goto_25

    .line 960
    :cond_26
    move v6, v3

    .line 961
    :goto_25
    iput-boolean v6, v13, Lcom/p1/mobile/putong/core/data/TimeLimited;->newConversation:Z

    .line 962
    .line 963
    add-int/lit8 v6, p2, 0x3c

    .line 964
    .line 965
    iget-object v13, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 966
    .line 967
    iget-object v13, v13, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->timeLimited:Lcom/p1/mobile/putong/core/data/TimeLimited;
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_8

    .line 968
    .line 969
    move/from16 v17, v9

    .line 970
    .line 971
    :try_start_7
    invoke-interface {v1, v6}, Landroid/database/Cursor;->getLong(I)J

    .line 972
    .line 973
    .line 974
    move-result-wide v8

    .line 975
    iput-wide v8, v13, Lcom/p1/mobile/putong/core/data/TimeLimited;->expiredSeconds:J

    .line 976
    .line 977
    add-int/lit8 v6, p2, 0x3d

    .line 978
    .line 979
    invoke-interface {v1, v6}, Landroid/database/Cursor;->getDouble(I)D

    .line 980
    .line 981
    .line 982
    move-result-wide v8

    .line 983
    iput-wide v8, v4, Lcom/p1/mobile/putong/core/data/Conversation;->suggestionScore:D

    .line 984
    .line 985
    add-int/lit8 v6, p2, 0x3e

    .line 986
    .line 987
    invoke-interface {v1, v6}, Landroid/database/Cursor;->getInt(I)I

    .line 988
    .line 989
    .line 990
    move-result v6

    .line 991
    iput v6, v4, Lcom/p1/mobile/putong/core/data/Conversation;->localBotherStatus:I

    .line 992
    .line 993
    add-int/lit8 v6, p2, 0x3f

    .line 994
    .line 995
    invoke-interface {v1, v6}, Landroid/database/Cursor;->getInt(I)I

    .line 996
    .line 997
    .line 998
    move-result v6

    .line 999
    const/4 v14, 0x1

    .line 1000
    if-ne v6, v14, :cond_27

    .line 1001
    .line 1002
    const/4 v6, 0x1

    .line 1003
    goto :goto_26

    .line 1004
    :cond_27
    move v6, v3

    .line 1005
    :goto_26
    iput-boolean v6, v4, Lcom/p1/mobile/putong/core/data/Conversation;->muted:Z

    .line 1006
    .line 1007
    add-int/lit8 v6, p2, 0x40

    .line 1008
    .line 1009
    iget-object v8, v4, Lcom/p1/mobile/putong/core/data/Conversation;->group:Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;

    .line 1010
    .line 1011
    invoke-interface {v1, v6}, Landroid/database/Cursor;->isNull(I)Z

    .line 1012
    .line 1013
    .line 1014
    move-result v9

    .line 1015
    if-eqz v9, :cond_28

    .line 1016
    .line 1017
    const/4 v6, 0x0

    .line 1018
    goto :goto_27

    .line 1019
    :cond_28
    invoke-interface {v1, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 1020
    .line 1021
    .line 1022
    move-result-object v6

    .line 1023
    :goto_27
    iput-object v6, v8, Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;->latestNotificationMsgId:Ljava/lang/String;

    .line 1024
    .line 1025
    add-int/lit8 v6, p2, 0x41

    .line 1026
    .line 1027
    iget-object v8, v4, Lcom/p1/mobile/putong/core/data/Conversation;->group:Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;

    .line 1028
    .line 1029
    invoke-interface {v1, v6}, Landroid/database/Cursor;->getDouble(I)D

    .line 1030
    .line 1031
    .line 1032
    move-result-wide v14

    .line 1033
    iput-wide v14, v8, Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;->joinedTime:D

    .line 1034
    .line 1035
    add-int/lit8 v6, p2, 0x42

    .line 1036
    .line 1037
    iget-object v8, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1038
    .line 1039
    invoke-interface {v1, v6}, Landroid/database/Cursor;->isNull(I)Z

    .line 1040
    .line 1041
    .line 1042
    move-result v14

    .line 1043
    if-eqz v14, :cond_29

    .line 1044
    .line 1045
    const/4 v6, 0x0

    .line 1046
    goto :goto_28

    .line 1047
    :cond_29
    sget-object v14, Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1048
    .line 1049
    invoke-interface {v1, v6}, Landroid/database/Cursor;->getBlob(I)[B

    .line 1050
    .line 1051
    .line 1052
    move-result-object v6

    .line 1053
    invoke-virtual {v14, v6}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 1054
    .line 1055
    .line 1056
    move-result-object v6

    .line 1057
    check-cast v6, Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;

    .line 1058
    .line 1059
    :goto_28
    iput-object v6, v8, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->oneSide:Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;

    .line 1060
    .line 1061
    add-int/lit8 v6, p2, 0x43

    .line 1062
    .line 1063
    invoke-interface {v1, v6}, Landroid/database/Cursor;->isNull(I)Z

    .line 1064
    .line 1065
    .line 1066
    move-result v8

    .line 1067
    if-eqz v8, :cond_2a

    .line 1068
    .line 1069
    const/4 v6, 0x0

    .line 1070
    goto :goto_29

    .line 1071
    :cond_2a
    invoke-interface {v1, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 1072
    .line 1073
    .line 1074
    move-result-object v6

    .line 1075
    :goto_29
    iput-object v6, v4, Lcom/p1/mobile/putong/core/data/Conversation;->localDraft:Ljava/lang/String;

    .line 1076
    .line 1077
    add-int/lit8 v6, p2, 0x44

    .line 1078
    .line 1079
    invoke-interface {v1, v6}, Landroid/database/Cursor;->isNull(I)Z

    .line 1080
    .line 1081
    .line 1082
    move-result v8

    .line 1083
    if-eqz v8, :cond_2b

    .line 1084
    .line 1085
    const/4 v6, 0x0

    .line 1086
    goto :goto_2a

    .line 1087
    :cond_2b
    sget-object v8, Lcom/p1/mobile/putong/data/Picture;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1088
    .line 1089
    invoke-virtual {v8}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1090
    .line 1091
    .line 1092
    move-result-object v8

    .line 1093
    invoke-interface {v1, v6}, Landroid/database/Cursor;->getBlob(I)[B

    .line 1094
    .line 1095
    .line 1096
    move-result-object v6

    .line 1097
    invoke-virtual {v8, v6}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 1098
    .line 1099
    .line 1100
    move-result-object v6

    .line 1101
    check-cast v6, Ljava/util/List;

    .line 1102
    .line 1103
    :goto_2a
    iput-object v6, v4, Lcom/p1/mobile/putong/core/data/Conversation;->localChatBg:Ljava/util/List;

    .line 1104
    .line 1105
    add-int/lit8 v6, p2, 0x45

    .line 1106
    .line 1107
    invoke-interface {v1, v6}, Landroid/database/Cursor;->isNull(I)Z

    .line 1108
    .line 1109
    .line 1110
    move-result v8

    .line 1111
    if-eqz v8, :cond_2c

    .line 1112
    .line 1113
    const/4 v6, -0x1

    .line 1114
    goto :goto_2b

    .line 1115
    :cond_2c
    invoke-interface {v1, v6}, Landroid/database/Cursor;->getInt(I)I

    .line 1116
    .line 1117
    .line 1118
    move-result v6
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_7

    .line 1119
    :goto_2b
    add-int/lit8 v8, p2, 0x46

    .line 1120
    .line 1121
    :try_start_8
    iget-object v9, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1122
    .line 1123
    iget-object v9, v9, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->kankan:Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;

    .line 1124
    .line 1125
    invoke-interface {v1, v8}, Landroid/database/Cursor;->isNull(I)Z

    .line 1126
    .line 1127
    .line 1128
    move-result v14

    .line 1129
    if-eqz v14, :cond_2d

    .line 1130
    .line 1131
    const/4 v8, 0x0

    .line 1132
    goto :goto_2c

    .line 1133
    :cond_2d
    sget-object v14, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContentIdWrapper;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1134
    .line 1135
    invoke-virtual {v14}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1136
    .line 1137
    .line 1138
    move-result-object v14

    .line 1139
    invoke-interface {v1, v8}, Landroid/database/Cursor;->getBlob(I)[B

    .line 1140
    .line 1141
    .line 1142
    move-result-object v8

    .line 1143
    invoke-virtual {v14, v8}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 1144
    .line 1145
    .line 1146
    move-result-object v8

    .line 1147
    check-cast v8, Ljava/util/List;

    .line 1148
    .line 1149
    :goto_2c
    iput-object v8, v9, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;->contents:Ljava/util/List;

    .line 1150
    .line 1151
    add-int/lit8 v8, p2, 0x47

    .line 1152
    .line 1153
    iget-object v9, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1154
    .line 1155
    iget-object v9, v9, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->kankan:Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;

    .line 1156
    .line 1157
    invoke-interface {v1, v8}, Landroid/database/Cursor;->isNull(I)Z

    .line 1158
    .line 1159
    .line 1160
    move-result v14

    .line 1161
    if-eqz v14, :cond_2e

    .line 1162
    .line 1163
    const/4 v8, 0x0

    .line 1164
    goto :goto_2d

    .line 1165
    :cond_2e
    invoke-interface {v1, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 1166
    .line 1167
    .line 1168
    move-result-object v8

    .line 1169
    :goto_2d
    iput-object v8, v9, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;->resonance:Ljava/lang/String;

    .line 1170
    .line 1171
    add-int/lit8 v8, p2, 0x48

    .line 1172
    .line 1173
    iget-object v9, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1174
    .line 1175
    iget-object v9, v9, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->kankan:Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;

    .line 1176
    .line 1177
    iget-object v9, v9, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;->greetingSummaryDetail:Lcom/p1/mobile/putong/core/data/GreetingSummary;

    .line 1178
    .line 1179
    invoke-interface {v1, v8}, Landroid/database/Cursor;->getInt(I)I

    .line 1180
    .line 1181
    .line 1182
    move-result v8

    .line 1183
    iput v8, v9, Lcom/p1/mobile/putong/core/data/GreetingSummary;->unseen:I

    .line 1184
    .line 1185
    add-int/lit8 v8, p2, 0x49

    .line 1186
    .line 1187
    iget-object v9, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1188
    .line 1189
    iget-object v9, v9, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->kankan:Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;

    .line 1190
    .line 1191
    iget-object v9, v9, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;->greetingSummaryDetail:Lcom/p1/mobile/putong/core/data/GreetingSummary;

    .line 1192
    .line 1193
    invoke-interface {v1, v8}, Landroid/database/Cursor;->getDouble(I)D

    .line 1194
    .line 1195
    .line 1196
    move-result-wide v14

    .line 1197
    iput-wide v14, v9, Lcom/p1/mobile/putong/core/data/GreetingSummary;->latestTime:D

    .line 1198
    .line 1199
    add-int/lit8 v8, p2, 0x4a

    .line 1200
    .line 1201
    iget-object v9, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1202
    .line 1203
    iget-object v9, v9, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->kankan:Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;

    .line 1204
    .line 1205
    iget-object v9, v9, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;->greetingSummaryDetail:Lcom/p1/mobile/putong/core/data/GreetingSummary;

    .line 1206
    .line 1207
    invoke-interface {v1, v8}, Landroid/database/Cursor;->isNull(I)Z

    .line 1208
    .line 1209
    .line 1210
    move-result v14

    .line 1211
    if-eqz v14, :cond_2f

    .line 1212
    .line 1213
    const/4 v8, 0x0

    .line 1214
    goto :goto_2e

    .line 1215
    :cond_2f
    invoke-interface {v1, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 1216
    .line 1217
    .line 1218
    move-result-object v8

    .line 1219
    :goto_2e
    iput-object v8, v9, Lcom/p1/mobile/putong/core/data/GreetingSummary;->latestUserId:Ljava/lang/String;

    .line 1220
    .line 1221
    add-int/lit8 v8, p2, 0x4b

    .line 1222
    .line 1223
    iget-object v9, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1224
    .line 1225
    iget-object v9, v9, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->kankan:Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;

    .line 1226
    .line 1227
    iget-object v9, v9, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;->greetingSummaryDetail:Lcom/p1/mobile/putong/core/data/GreetingSummary;

    .line 1228
    .line 1229
    invoke-interface {v1, v8}, Landroid/database/Cursor;->isNull(I)Z

    .line 1230
    .line 1231
    .line 1232
    move-result v14

    .line 1233
    if-eqz v14, :cond_30

    .line 1234
    .line 1235
    const/4 v8, 0x0

    .line 1236
    goto :goto_2f

    .line 1237
    :cond_30
    invoke-interface {v1, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 1238
    .line 1239
    .line 1240
    move-result-object v8

    .line 1241
    :goto_2f
    iput-object v8, v9, Lcom/p1/mobile/putong/core/data/GreetingSummary;->latestMessageId:Ljava/lang/String;

    .line 1242
    .line 1243
    add-int/lit8 v8, p2, 0x4c

    .line 1244
    .line 1245
    iget-object v9, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1246
    .line 1247
    iget-object v9, v9, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->quickChat:Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;

    .line 1248
    .line 1249
    iget-object v9, v9, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->bell:Lcom/p1/mobile/putong/core/data/QuickChatBell;

    .line 1250
    .line 1251
    invoke-interface {v1, v8}, Landroid/database/Cursor;->getInt(I)I

    .line 1252
    .line 1253
    .line 1254
    move-result v8

    .line 1255
    const/4 v14, 0x1

    .line 1256
    if-ne v8, v14, :cond_31

    .line 1257
    .line 1258
    const/4 v8, 0x1

    .line 1259
    goto :goto_30

    .line 1260
    :cond_31
    move v8, v3

    .line 1261
    :goto_30
    iput-boolean v8, v9, Lcom/p1/mobile/putong/core/data/QuickChatBell;->isInitiator:Z

    .line 1262
    .line 1263
    add-int/lit8 v8, p2, 0x4d

    .line 1264
    .line 1265
    iget-object v9, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1266
    .line 1267
    iget-object v9, v9, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->quickChat:Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;

    .line 1268
    .line 1269
    iget-object v9, v9, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->bell:Lcom/p1/mobile/putong/core/data/QuickChatBell;

    .line 1270
    .line 1271
    invoke-interface {v1, v8}, Landroid/database/Cursor;->getInt(I)I

    .line 1272
    .line 1273
    .line 1274
    move-result v8

    .line 1275
    const/4 v14, 0x1

    .line 1276
    if-ne v8, v14, :cond_32

    .line 1277
    .line 1278
    const/4 v8, 0x1

    .line 1279
    goto :goto_31

    .line 1280
    :cond_32
    move v8, v3

    .line 1281
    :goto_31
    iput-boolean v8, v9, Lcom/p1/mobile/putong/core/data/QuickChatBell;->agree:Z

    .line 1282
    .line 1283
    add-int/lit8 v8, p2, 0x4e

    .line 1284
    .line 1285
    invoke-interface {v1, v8}, Landroid/database/Cursor;->isNull(I)Z

    .line 1286
    .line 1287
    .line 1288
    move-result v9

    .line 1289
    if-eqz v9, :cond_33

    .line 1290
    .line 1291
    const/4 v8, 0x0

    .line 1292
    goto :goto_32

    .line 1293
    :cond_33
    invoke-interface {v1, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 1294
    .line 1295
    .line 1296
    move-result-object v8

    .line 1297
    :goto_32
    iput-object v8, v4, Lcom/p1/mobile/putong/core/data/Conversation;->localMessageInsertReportHint:Ljava/lang/String;

    .line 1298
    .line 1299
    add-int/lit8 v8, p2, 0x4f

    .line 1300
    .line 1301
    invoke-interface {v1, v8}, Landroid/database/Cursor;->isNull(I)Z

    .line 1302
    .line 1303
    .line 1304
    move-result v9

    .line 1305
    if-eqz v9, :cond_34

    .line 1306
    .line 1307
    const/4 v8, 0x0

    .line 1308
    goto :goto_33

    .line 1309
    :cond_34
    invoke-interface {v1, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 1310
    .line 1311
    .line 1312
    move-result-object v8

    .line 1313
    :goto_33
    iput-object v8, v4, Lcom/p1/mobile/putong/core/data/Conversation;->localNotifyMomentId:Ljava/lang/String;

    .line 1314
    .line 1315
    add-int/lit8 v8, p2, 0x50

    .line 1316
    .line 1317
    invoke-interface {v1, v8}, Landroid/database/Cursor;->isNull(I)Z

    .line 1318
    .line 1319
    .line 1320
    move-result v9

    .line 1321
    if-eqz v9, :cond_35

    .line 1322
    .line 1323
    const/4 v8, 0x0

    .line 1324
    goto :goto_34

    .line 1325
    :cond_35
    invoke-interface {v1, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 1326
    .line 1327
    .line 1328
    move-result-object v8

    .line 1329
    :goto_34
    iput-object v8, v4, Lcom/p1/mobile/putong/core/data/Conversation;->localInsertedMomentId:Ljava/lang/String;

    .line 1330
    .line 1331
    add-int/lit8 v8, p2, 0x51

    .line 1332
    .line 1333
    invoke-interface {v1, v8}, Landroid/database/Cursor;->getInt(I)I

    .line 1334
    .line 1335
    .line 1336
    move-result v8

    .line 1337
    iput v8, v4, Lcom/p1/mobile/putong/core/data/Conversation;->mm:I

    .line 1338
    .line 1339
    add-int/lit8 v8, p2, 0x52

    .line 1340
    .line 1341
    iget-object v9, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1342
    .line 1343
    iget-object v9, v9, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->quickChat:Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;

    .line 1344
    .line 1345
    invoke-interface {v1, v8}, Landroid/database/Cursor;->getDouble(I)D

    .line 1346
    .line 1347
    .line 1348
    move-result-wide v14

    .line 1349
    iput-wide v14, v9, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->expire:D

    .line 1350
    .line 1351
    add-int/lit8 v8, p2, 0x53

    .line 1352
    .line 1353
    invoke-interface {v1, v8}, Landroid/database/Cursor;->isNull(I)Z

    .line 1354
    .line 1355
    .line 1356
    move-result v9

    .line 1357
    if-eqz v9, :cond_36

    .line 1358
    .line 1359
    const/4 v8, 0x0

    .line 1360
    goto :goto_35

    .line 1361
    :cond_36
    invoke-interface {v1, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 1362
    .line 1363
    .line 1364
    move-result-object v8
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_6

    .line 1365
    :goto_35
    add-int/lit8 v9, p2, 0x54

    .line 1366
    .line 1367
    :try_start_9
    invoke-interface {v1, v9}, Landroid/database/Cursor;->isNull(I)Z

    .line 1368
    .line 1369
    .line 1370
    move-result v14

    .line 1371
    if-eqz v14, :cond_37

    .line 1372
    .line 1373
    const/4 v9, 0x0

    .line 1374
    goto :goto_36

    .line 1375
    :cond_37
    invoke-interface {v1, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 1376
    .line 1377
    .line 1378
    move-result-object v9
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_5

    .line 1379
    :goto_36
    add-int/lit8 v14, p2, 0x55

    .line 1380
    .line 1381
    :try_start_a
    invoke-interface {v1, v14}, Landroid/database/Cursor;->isNull(I)Z

    .line 1382
    .line 1383
    .line 1384
    move-result v15

    .line 1385
    if-eqz v15, :cond_38

    .line 1386
    .line 1387
    const/4 v15, 0x0

    .line 1388
    goto :goto_37

    .line 1389
    :cond_38
    invoke-interface {v1, v14}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 1390
    .line 1391
    .line 1392
    move-result-object v14
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_4

    .line 1393
    move-object v15, v14

    .line 1394
    :goto_37
    add-int/lit8 v14, p2, 0x56

    .line 1395
    .line 1396
    :try_start_b
    invoke-interface {v1, v14}, Landroid/database/Cursor;->isNull(I)Z

    .line 1397
    .line 1398
    .line 1399
    move-result v18

    .line 1400
    if-eqz v18, :cond_39

    .line 1401
    .line 1402
    const/16 v18, 0x0

    .line 1403
    .line 1404
    goto :goto_38

    .line 1405
    :cond_39
    invoke-interface {v1, v14}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 1406
    .line 1407
    .line 1408
    move-result-object v14
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_3

    .line 1409
    move-object/from16 v18, v14

    .line 1410
    .line 1411
    :goto_38
    add-int/lit8 v14, p2, 0x57

    .line 1412
    .line 1413
    :try_start_c
    invoke-interface {v1, v14}, Landroid/database/Cursor;->isNull(I)Z

    .line 1414
    .line 1415
    .line 1416
    move-result v19

    .line 1417
    if-eqz v19, :cond_3a

    .line 1418
    .line 1419
    const/16 v19, 0x0

    .line 1420
    .line 1421
    goto :goto_39

    .line 1422
    :cond_3a
    invoke-interface {v1, v14}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 1423
    .line 1424
    .line 1425
    move-result-object v14
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_2

    .line 1426
    move-object/from16 v19, v14

    .line 1427
    .line 1428
    :goto_39
    add-int/lit8 v14, p2, 0x58

    .line 1429
    .line 1430
    :try_start_d
    invoke-interface {v1, v14}, Landroid/database/Cursor;->isNull(I)Z

    .line 1431
    .line 1432
    .line 1433
    move-result v20

    .line 1434
    if-eqz v20, :cond_3b

    .line 1435
    .line 1436
    const/4 v3, 0x0

    .line 1437
    goto :goto_3a

    .line 1438
    :cond_3b
    sget-object v20, Lcom/p1/mobile/putong/core/data/LocalBusinessType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 1439
    .line 1440
    invoke-virtual/range {v20 .. v20}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1441
    .line 1442
    .line 1443
    move-result-object v3

    .line 1444
    invoke-interface {v1, v14}, Landroid/database/Cursor;->getBlob(I)[B

    .line 1445
    .line 1446
    .line 1447
    move-result-object v14

    .line 1448
    invoke-virtual {v3, v14}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 1449
    .line 1450
    .line 1451
    move-result-object v3

    .line 1452
    check-cast v3, Ljava/util/List;

    .line 1453
    .line 1454
    :goto_3a
    iput-object v3, v4, Lcom/p1/mobile/putong/core/data/Conversation;->localBusinessTypes:Ljava/util/List;

    .line 1455
    .line 1456
    add-int/lit8 v3, p2, 0x59

    .line 1457
    .line 1458
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 1459
    .line 1460
    .line 1461
    move-result v14

    .line 1462
    if-eqz v14, :cond_3c

    .line 1463
    .line 1464
    const/4 v2, 0x0

    .line 1465
    goto :goto_3b

    .line 1466
    :cond_3c
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 1467
    .line 1468
    .line 1469
    move-result-object v2

    .line 1470
    :goto_3b
    add-int/lit8 v3, p2, 0x5a

    .line 1471
    .line 1472
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getInt(I)I

    .line 1473
    .line 1474
    .line 1475
    move-result v3

    .line 1476
    iput v3, v4, Lcom/p1/mobile/putong/core/data/Conversation;->intimacy:I

    .line 1477
    .line 1478
    add-int/lit8 v3, p2, 0x5b

    .line 1479
    .line 1480
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getInt(I)I

    .line 1481
    .line 1482
    .line 1483
    move-result v3

    .line 1484
    iput v3, v4, Lcom/p1/mobile/putong/core/data/Conversation;->quickChatProgress:I

    .line 1485
    .line 1486
    add-int/lit8 v3, p2, 0x5c

    .line 1487
    .line 1488
    iget-object v14, v4, Lcom/p1/mobile/putong/core/data/Conversation;->group:Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;

    .line 1489
    .line 1490
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 1491
    .line 1492
    .line 1493
    move-result v20

    .line 1494
    if-eqz v20, :cond_3d

    .line 1495
    .line 1496
    const/4 v3, 0x0

    .line 1497
    goto :goto_3c

    .line 1498
    :cond_3d
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 1499
    .line 1500
    .line 1501
    move-result-object v3

    .line 1502
    :goto_3c
    iput-object v3, v14, Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;->source:Ljava/lang/String;

    .line 1503
    .line 1504
    add-int/lit8 v3, p2, 0x5d

    .line 1505
    .line 1506
    iget-object v14, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1507
    .line 1508
    iget-object v14, v14, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->quickChat:Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;

    .line 1509
    .line 1510
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getInt(I)I

    .line 1511
    .line 1512
    .line 1513
    move-result v3

    .line 1514
    iput v3, v14, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->progress:I

    .line 1515
    .line 1516
    add-int/lit8 v3, p2, 0x5e

    .line 1517
    .line 1518
    iget-object v14, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1519
    .line 1520
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 1521
    .line 1522
    .line 1523
    move-result v20

    .line 1524
    if-eqz v20, :cond_3e

    .line 1525
    .line 1526
    const/4 v3, 0x0

    .line 1527
    goto :goto_3d

    .line 1528
    :cond_3e
    sget-object v13, Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1529
    .line 1530
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    .line 1531
    .line 1532
    .line 1533
    move-result-object v3

    .line 1534
    invoke-virtual {v13, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 1535
    .line 1536
    .line 1537
    move-result-object v3

    .line 1538
    check-cast v3, Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;

    .line 1539
    .line 1540
    :goto_3d
    iput-object v3, v14, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->feedStateCounter:Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;

    .line 1541
    .line 1542
    add-int/lit8 v3, p2, 0x5f

    .line 1543
    .line 1544
    iget-object v13, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1545
    .line 1546
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 1547
    .line 1548
    .line 1549
    move-result v14

    .line 1550
    if-eqz v14, :cond_3f

    .line 1551
    .line 1552
    const/4 v3, 0x0

    .line 1553
    goto :goto_3e

    .line 1554
    :cond_3f
    sget-object v14, Lcom/p1/mobile/putong/core/data/SuggestedTimeLimitedMatch;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1555
    .line 1556
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    .line 1557
    .line 1558
    .line 1559
    move-result-object v3

    .line 1560
    invoke-virtual {v14, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 1561
    .line 1562
    .line 1563
    move-result-object v3

    .line 1564
    check-cast v3, Lcom/p1/mobile/putong/core/data/SuggestedTimeLimitedMatch;

    .line 1565
    .line 1566
    :goto_3e
    iput-object v3, v13, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->suggestedTimeLimitedMatch:Lcom/p1/mobile/putong/core/data/SuggestedTimeLimitedMatch;

    .line 1567
    .line 1568
    add-int/lit8 v3, p2, 0x60

    .line 1569
    .line 1570
    iget-object v13, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1571
    .line 1572
    iget-object v13, v13, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->kankan:Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;

    .line 1573
    .line 1574
    iget-object v13, v13, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;->greetingSummaryDetail:Lcom/p1/mobile/putong/core/data/GreetingSummary;

    .line 1575
    .line 1576
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 1577
    .line 1578
    .line 1579
    move-result v14

    .line 1580
    if-eqz v14, :cond_40

    .line 1581
    .line 1582
    const/4 v3, 0x0

    .line 1583
    goto :goto_3f

    .line 1584
    :cond_40
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 1585
    .line 1586
    .line 1587
    move-result-object v3

    .line 1588
    :goto_3f
    iput-object v3, v13, Lcom/p1/mobile/putong/core/data/GreetingSummary;->iconURL:Ljava/lang/String;

    .line 1589
    .line 1590
    add-int/lit8 v3, p2, 0x61

    .line 1591
    .line 1592
    iget-object v13, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1593
    .line 1594
    iget-object v13, v13, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->kankan:Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;

    .line 1595
    .line 1596
    iget-object v13, v13, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;->greetingSummaryDetail:Lcom/p1/mobile/putong/core/data/GreetingSummary;

    .line 1597
    .line 1598
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 1599
    .line 1600
    .line 1601
    move-result v14

    .line 1602
    if-eqz v14, :cond_41

    .line 1603
    .line 1604
    const/4 v3, 0x0

    .line 1605
    goto :goto_40

    .line 1606
    :cond_41
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 1607
    .line 1608
    .line 1609
    move-result-object v3

    .line 1610
    :goto_40
    iput-object v3, v13, Lcom/p1/mobile/putong/core/data/GreetingSummary;->title:Ljava/lang/String;

    .line 1611
    .line 1612
    add-int/lit8 v3, p2, 0x62

    .line 1613
    .line 1614
    iget-object v13, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1615
    .line 1616
    iget-object v13, v13, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->kankan:Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;

    .line 1617
    .line 1618
    iget-object v13, v13, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;->greetingSummaryDetail:Lcom/p1/mobile/putong/core/data/GreetingSummary;

    .line 1619
    .line 1620
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 1621
    .line 1622
    .line 1623
    move-result v14

    .line 1624
    if-eqz v14, :cond_42

    .line 1625
    .line 1626
    const/4 v3, 0x0

    .line 1627
    goto :goto_41

    .line 1628
    :cond_42
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 1629
    .line 1630
    .line 1631
    move-result-object v3

    .line 1632
    :goto_41
    iput-object v3, v13, Lcom/p1/mobile/putong/core/data/GreetingSummary;->subtitle:Ljava/lang/String;

    .line 1633
    .line 1634
    add-int/lit8 v3, p2, 0x63

    .line 1635
    .line 1636
    iget-object v13, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1637
    .line 1638
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 1639
    .line 1640
    .line 1641
    move-result v14

    .line 1642
    if-eqz v14, :cond_43

    .line 1643
    .line 1644
    const/4 v3, 0x0

    .line 1645
    goto :goto_42

    .line 1646
    :cond_43
    sget-object v14, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1647
    .line 1648
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    .line 1649
    .line 1650
    .line 1651
    move-result-object v3

    .line 1652
    invoke-virtual {v14, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 1653
    .line 1654
    .line 1655
    move-result-object v3

    .line 1656
    check-cast v3, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    .line 1657
    .line 1658
    :goto_42
    iput-object v3, v13, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    .line 1659
    .line 1660
    add-int/lit8 v3, p2, 0x64

    .line 1661
    .line 1662
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getInt(I)I

    .line 1663
    .line 1664
    .line 1665
    move-result v3

    .line 1666
    const/4 v14, 0x1

    .line 1667
    if-ne v3, v14, :cond_44

    .line 1668
    .line 1669
    const/4 v3, 0x1

    .line 1670
    goto :goto_43

    .line 1671
    :cond_44
    const/4 v3, 0x0

    .line 1672
    :goto_43
    iput-boolean v3, v4, Lcom/p1/mobile/putong/core/data/Conversation;->hasLocalBreakIce:Z

    .line 1673
    .line 1674
    add-int/lit8 v3, p2, 0x65

    .line 1675
    .line 1676
    iget-object v13, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1677
    .line 1678
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 1679
    .line 1680
    .line 1681
    move-result v20

    .line 1682
    if-eqz v20, :cond_45

    .line 1683
    .line 1684
    const/4 v3, 0x0

    .line 1685
    goto :goto_44

    .line 1686
    :cond_45
    sget-object v14, Lcom/p1/mobile/putong/core/data/AvatarSummaryCounter;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1687
    .line 1688
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    .line 1689
    .line 1690
    .line 1691
    move-result-object v3

    .line 1692
    invoke-virtual {v14, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 1693
    .line 1694
    .line 1695
    move-result-object v3

    .line 1696
    check-cast v3, Lcom/p1/mobile/putong/core/data/AvatarSummaryCounter;

    .line 1697
    .line 1698
    :goto_44
    iput-object v3, v13, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->avatarSummary:Lcom/p1/mobile/putong/core/data/AvatarSummaryCounter;

    .line 1699
    .line 1700
    add-int/lit8 v3, p2, 0x66

    .line 1701
    .line 1702
    iget-object v13, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1703
    .line 1704
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 1705
    .line 1706
    .line 1707
    move-result v14

    .line 1708
    if-eqz v14, :cond_46

    .line 1709
    .line 1710
    const/4 v3, 0x0

    .line 1711
    goto :goto_45

    .line 1712
    :cond_46
    sget-object v14, Lcom/p1/mobile/putong/core/data/CoreInteractionMessageCounter;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1713
    .line 1714
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    .line 1715
    .line 1716
    .line 1717
    move-result-object v3

    .line 1718
    invoke-virtual {v14, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 1719
    .line 1720
    .line 1721
    move-result-object v3

    .line 1722
    check-cast v3, Lcom/p1/mobile/putong/core/data/CoreInteractionMessageCounter;

    .line 1723
    .line 1724
    :goto_45
    iput-object v3, v13, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->feedInteractionCounter:Lcom/p1/mobile/putong/core/data/CoreInteractionMessageCounter;

    .line 1725
    .line 1726
    add-int/lit8 v3, p2, 0x67

    .line 1727
    .line 1728
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getDouble(I)D

    .line 1729
    .line 1730
    .line 1731
    move-result-wide v13

    .line 1732
    iput-wide v13, v4, Lcom/p1/mobile/putong/core/data/Conversation;->localSpoofingNewTime:D

    .line 1733
    .line 1734
    add-int/lit8 v3, p2, 0x68

    .line 1735
    .line 1736
    const/16 v13, 0x68

    .line 1737
    .line 1738
    invoke-interface {v1, v13}, Landroid/database/Cursor;->getColumnName(I)Ljava/lang/String;

    .line 1739
    .line 1740
    .line 1741
    move-result-object v13

    .line 1742
    const-string v14, "clearedTime_c"

    .line 1743
    .line 1744
    invoke-static {v13, v14}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 1745
    .line 1746
    .line 1747
    move-result v13

    .line 1748
    if-eqz v13, :cond_48

    .line 1749
    .line 1750
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getDouble(I)D

    .line 1751
    .line 1752
    .line 1753
    move-result-wide v13

    .line 1754
    iput-wide v13, v4, Lcom/p1/mobile/putong/core/data/Conversation;->clearedTime:D

    .line 1755
    .line 1756
    add-int/lit8 v3, p2, 0x69

    .line 1757
    .line 1758
    iget-object v13, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1759
    .line 1760
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 1761
    .line 1762
    .line 1763
    move-result v14

    .line 1764
    if-eqz v14, :cond_47

    .line 1765
    .line 1766
    move-object/from16 v21, v2

    .line 1767
    .line 1768
    const/4 v2, 0x0

    .line 1769
    goto :goto_46

    .line 1770
    :cond_47
    sget-object v14, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_1

    .line 1771
    .line 1772
    move-object/from16 v21, v2

    .line 1773
    .line 1774
    :try_start_e
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    .line 1775
    .line 1776
    .line 1777
    move-result-object v2

    .line 1778
    invoke-virtual {v14, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 1779
    .line 1780
    .line 1781
    move-result-object v2

    .line 1782
    check-cast v2, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

    .line 1783
    .line 1784
    :goto_46
    iput-object v2, v13, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->liveVirtualVoice:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

    .line 1785
    .line 1786
    goto :goto_49

    .line 1787
    :catch_0
    move-exception v0

    .line 1788
    :goto_47
    move-object/from16 v16, v5

    .line 1789
    .line 1790
    move v5, v7

    .line 1791
    move-object v2, v8

    .line 1792
    goto/16 :goto_6b

    .line 1793
    .line 1794
    :catch_1
    move-exception v0

    .line 1795
    move-object/from16 v21, v2

    .line 1796
    .line 1797
    goto :goto_47

    .line 1798
    :cond_48
    move-object/from16 v21, v2

    .line 1799
    .line 1800
    iget-object v2, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1801
    .line 1802
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 1803
    .line 1804
    .line 1805
    move-result v13

    .line 1806
    if-eqz v13, :cond_49

    .line 1807
    .line 1808
    const/4 v3, 0x0

    .line 1809
    goto :goto_48

    .line 1810
    :cond_49
    sget-object v13, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1811
    .line 1812
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    .line 1813
    .line 1814
    .line 1815
    move-result-object v3

    .line 1816
    invoke-virtual {v13, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 1817
    .line 1818
    .line 1819
    move-result-object v3

    .line 1820
    check-cast v3, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

    .line 1821
    .line 1822
    :goto_48
    iput-object v3, v2, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->liveVirtualVoice:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

    .line 1823
    .line 1824
    add-int/lit8 v3, p2, 0x69

    .line 1825
    .line 1826
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getDouble(I)D

    .line 1827
    .line 1828
    .line 1829
    move-result-wide v13

    .line 1830
    iput-wide v13, v4, Lcom/p1/mobile/putong/core/data/Conversation;->clearedTime:D

    .line 1831
    .line 1832
    :goto_49
    add-int/lit8 v2, v3, 0x1

    .line 1833
    .line 1834
    iget-object v13, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1835
    .line 1836
    invoke-interface {v1, v2}, Landroid/database/Cursor;->isNull(I)Z

    .line 1837
    .line 1838
    .line 1839
    move-result v14

    .line 1840
    if-eqz v14, :cond_4a

    .line 1841
    .line 1842
    const/4 v2, 0x0

    .line 1843
    goto :goto_4a

    .line 1844
    :cond_4a
    sget-object v14, Lcom/p1/mobile/putong/core/data/ConversationMomentInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1845
    .line 1846
    invoke-interface {v1, v2}, Landroid/database/Cursor;->getBlob(I)[B

    .line 1847
    .line 1848
    .line 1849
    move-result-object v2

    .line 1850
    invoke-virtual {v14, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 1851
    .line 1852
    .line 1853
    move-result-object v2

    .line 1854
    check-cast v2, Lcom/p1/mobile/putong/core/data/ConversationMomentInfo;

    .line 1855
    .line 1856
    :goto_4a
    iput-object v2, v13, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->localMomentInfo:Lcom/p1/mobile/putong/core/data/ConversationMomentInfo;

    .line 1857
    .line 1858
    add-int/lit8 v2, v3, 0x2

    .line 1859
    .line 1860
    invoke-interface {v1, v2}, Landroid/database/Cursor;->isNull(I)Z

    .line 1861
    .line 1862
    .line 1863
    move-result v13

    .line 1864
    if-eqz v13, :cond_4b

    .line 1865
    .line 1866
    const/4 v2, 0x0

    .line 1867
    goto :goto_4b

    .line 1868
    :cond_4b
    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 1869
    .line 1870
    .line 1871
    move-result-object v2

    .line 1872
    :goto_4b
    iput-object v2, v4, Lcom/p1/mobile/putong/core/data/Conversation;->localExtraInfo:Ljava/lang/String;

    .line 1873
    .line 1874
    add-int/lit8 v2, v3, 0x3

    .line 1875
    .line 1876
    invoke-interface {v1, v2}, Landroid/database/Cursor;->getDouble(I)D

    .line 1877
    .line 1878
    .line 1879
    move-result-wide v13

    .line 1880
    iput-wide v13, v4, Lcom/p1/mobile/putong/core/data/Conversation;->lastActivityTime:D

    .line 1881
    .line 1882
    add-int/lit8 v2, v3, 0x4

    .line 1883
    .line 1884
    iget-object v13, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1885
    .line 1886
    invoke-interface {v1, v2}, Landroid/database/Cursor;->isNull(I)Z

    .line 1887
    .line 1888
    .line 1889
    move-result v14

    .line 1890
    if-eqz v14, :cond_4c

    .line 1891
    .line 1892
    const/4 v2, 0x0

    .line 1893
    goto :goto_4c

    .line 1894
    :cond_4c
    sget-object v14, Lcom/p1/mobile/putong/data/LiveActivityConversation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1895
    .line 1896
    invoke-interface {v1, v2}, Landroid/database/Cursor;->getBlob(I)[B

    .line 1897
    .line 1898
    .line 1899
    move-result-object v2

    .line 1900
    invoke-virtual {v14, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 1901
    .line 1902
    .line 1903
    move-result-object v2

    .line 1904
    check-cast v2, Lcom/p1/mobile/putong/data/LiveActivityConversation;

    .line 1905
    .line 1906
    :goto_4c
    iput-object v2, v13, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->liveActivity:Lcom/p1/mobile/putong/data/LiveActivityConversation;

    .line 1907
    .line 1908
    add-int/lit8 v2, v3, 0x5

    .line 1909
    .line 1910
    iget-object v13, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1911
    .line 1912
    invoke-interface {v1, v2}, Landroid/database/Cursor;->isNull(I)Z

    .line 1913
    .line 1914
    .line 1915
    move-result v14

    .line 1916
    if-eqz v14, :cond_4d

    .line 1917
    .line 1918
    const/4 v2, 0x0

    .line 1919
    goto :goto_4d

    .line 1920
    :cond_4d
    sget-object v14, Lcom/p1/mobile/putong/core/data/ConversationGame;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1921
    .line 1922
    invoke-interface {v1, v2}, Landroid/database/Cursor;->getBlob(I)[B

    .line 1923
    .line 1924
    .line 1925
    move-result-object v2

    .line 1926
    invoke-virtual {v14, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 1927
    .line 1928
    .line 1929
    move-result-object v2

    .line 1930
    check-cast v2, Lcom/p1/mobile/putong/core/data/ConversationGame;

    .line 1931
    .line 1932
    :goto_4d
    iput-object v2, v13, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->game:Lcom/p1/mobile/putong/core/data/ConversationGame;

    .line 1933
    .line 1934
    add-int/lit8 v2, v3, 0x6

    .line 1935
    .line 1936
    iget-object v13, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1937
    .line 1938
    invoke-interface {v1, v2}, Landroid/database/Cursor;->isNull(I)Z

    .line 1939
    .line 1940
    .line 1941
    move-result v14

    .line 1942
    if-eqz v14, :cond_4e

    .line 1943
    .line 1944
    const/4 v2, 0x0

    .line 1945
    goto :goto_4e

    .line 1946
    :cond_4e
    sget-object v14, Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1947
    .line 1948
    invoke-interface {v1, v2}, Landroid/database/Cursor;->getBlob(I)[B

    .line 1949
    .line 1950
    .line 1951
    move-result-object v2

    .line 1952
    invoke-virtual {v14, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 1953
    .line 1954
    .line 1955
    move-result-object v2

    .line 1956
    check-cast v2, Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;

    .line 1957
    .line 1958
    :goto_4e
    iput-object v2, v13, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->tag:Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;

    .line 1959
    .line 1960
    add-int/lit8 v2, v3, 0x7

    .line 1961
    .line 1962
    iget-object v13, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1963
    .line 1964
    invoke-interface {v1, v2}, Landroid/database/Cursor;->isNull(I)Z

    .line 1965
    .line 1966
    .line 1967
    move-result v14

    .line 1968
    if-eqz v14, :cond_4f

    .line 1969
    .line 1970
    const/4 v2, 0x0

    .line 1971
    goto :goto_4f

    .line 1972
    :cond_4f
    sget-object v14, Lcom/p1/mobile/putong/core/data/ConversationAdditionalChatAssistantQuestion;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1973
    .line 1974
    invoke-interface {v1, v2}, Landroid/database/Cursor;->getBlob(I)[B

    .line 1975
    .line 1976
    .line 1977
    move-result-object v2

    .line 1978
    invoke-virtual {v14, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 1979
    .line 1980
    .line 1981
    move-result-object v2

    .line 1982
    check-cast v2, Lcom/p1/mobile/putong/core/data/ConversationAdditionalChatAssistantQuestion;

    .line 1983
    .line 1984
    :goto_4f
    iput-object v2, v13, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->chatAssistantQuestion:Lcom/p1/mobile/putong/core/data/ConversationAdditionalChatAssistantQuestion;

    .line 1985
    .line 1986
    add-int/lit8 v2, v3, 0x8

    .line 1987
    .line 1988
    iget-object v13, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1989
    .line 1990
    iget-object v13, v13, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->quickChat:Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;

    .line 1991
    .line 1992
    invoke-interface {v1, v2}, Landroid/database/Cursor;->getInt(I)I

    .line 1993
    .line 1994
    .line 1995
    move-result v2

    .line 1996
    const/4 v14, 0x1

    .line 1997
    if-ne v2, v14, :cond_50

    .line 1998
    .line 1999
    const/4 v2, 0x1

    .line 2000
    goto :goto_50

    .line 2001
    :cond_50
    const/4 v2, 0x0

    .line 2002
    :goto_50
    iput-boolean v2, v13, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->guideFakeToGood:Z

    .line 2003
    .line 2004
    add-int/lit8 v2, v3, 0x9

    .line 2005
    .line 2006
    invoke-interface {v1, v2}, Landroid/database/Cursor;->isNull(I)Z

    .line 2007
    .line 2008
    .line 2009
    move-result v13

    .line 2010
    if-eqz v13, :cond_51

    .line 2011
    .line 2012
    const/4 v2, 0x0

    .line 2013
    goto :goto_51

    .line 2014
    :cond_51
    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 2015
    .line 2016
    .line 2017
    move-result-object v2

    .line 2018
    :goto_51
    iput-object v2, v4, Lcom/p1/mobile/putong/core/data/Conversation;->otherStatus:Ljava/lang/String;

    .line 2019
    .line 2020
    add-int/lit8 v2, v3, 0xa

    .line 2021
    .line 2022
    iget-object v13, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 2023
    .line 2024
    invoke-interface {v1, v2}, Landroid/database/Cursor;->isNull(I)Z

    .line 2025
    .line 2026
    .line 2027
    move-result v20

    .line 2028
    if-eqz v20, :cond_52

    .line 2029
    .line 2030
    const/4 v2, 0x0

    .line 2031
    goto :goto_52

    .line 2032
    :cond_52
    sget-object v14, Lcom/p1/mobile/putong/core/data/ContinuousChat;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2033
    .line 2034
    invoke-interface {v1, v2}, Landroid/database/Cursor;->getBlob(I)[B

    .line 2035
    .line 2036
    .line 2037
    move-result-object v2

    .line 2038
    invoke-virtual {v14, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 2039
    .line 2040
    .line 2041
    move-result-object v2

    .line 2042
    check-cast v2, Lcom/p1/mobile/putong/core/data/ContinuousChat;

    .line 2043
    .line 2044
    :goto_52
    iput-object v2, v13, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->continuousChat:Lcom/p1/mobile/putong/core/data/ContinuousChat;

    .line 2045
    .line 2046
    add-int/lit8 v2, v3, 0xb

    .line 2047
    .line 2048
    iget-object v13, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 2049
    .line 2050
    invoke-interface {v1, v2}, Landroid/database/Cursor;->isNull(I)Z

    .line 2051
    .line 2052
    .line 2053
    move-result v14

    .line 2054
    if-eqz v14, :cond_53

    .line 2055
    .line 2056
    const/4 v2, 0x0

    .line 2057
    goto :goto_53

    .line 2058
    :cond_53
    sget-object v14, Lcom/p1/mobile/putong/core/data/PlatinumPinChat;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2059
    .line 2060
    invoke-interface {v1, v2}, Landroid/database/Cursor;->getBlob(I)[B

    .line 2061
    .line 2062
    .line 2063
    move-result-object v2

    .line 2064
    invoke-virtual {v14, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 2065
    .line 2066
    .line 2067
    move-result-object v2

    .line 2068
    check-cast v2, Lcom/p1/mobile/putong/core/data/PlatinumPinChat;

    .line 2069
    .line 2070
    :goto_53
    iput-object v2, v13, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->pinChat:Lcom/p1/mobile/putong/core/data/PlatinumPinChat;

    .line 2071
    .line 2072
    add-int/lit8 v2, v3, 0xc

    .line 2073
    .line 2074
    iget-object v13, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 2075
    .line 2076
    invoke-interface {v1, v2}, Landroid/database/Cursor;->isNull(I)Z

    .line 2077
    .line 2078
    .line 2079
    move-result v14

    .line 2080
    if-eqz v14, :cond_54

    .line 2081
    .line 2082
    const/4 v2, 0x0

    .line 2083
    goto :goto_54

    .line 2084
    :cond_54
    sget-object v14, Lcom/p1/mobile/putong/core/data/ReSwipeInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2085
    .line 2086
    invoke-interface {v1, v2}, Landroid/database/Cursor;->getBlob(I)[B

    .line 2087
    .line 2088
    .line 2089
    move-result-object v2

    .line 2090
    invoke-virtual {v14, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 2091
    .line 2092
    .line 2093
    move-result-object v2

    .line 2094
    check-cast v2, Lcom/p1/mobile/putong/core/data/ReSwipeInfo;

    .line 2095
    .line 2096
    :goto_54
    iput-object v2, v13, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->reSwipe:Lcom/p1/mobile/putong/core/data/ReSwipeInfo;

    .line 2097
    .line 2098
    add-int/lit8 v2, v3, 0xd

    .line 2099
    .line 2100
    iget-object v13, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 2101
    .line 2102
    invoke-interface {v1, v2}, Landroid/database/Cursor;->isNull(I)Z

    .line 2103
    .line 2104
    .line 2105
    move-result v14

    .line 2106
    if-eqz v14, :cond_55

    .line 2107
    .line 2108
    const/4 v2, 0x0

    .line 2109
    goto :goto_55

    .line 2110
    :cond_55
    sget-object v14, Lcom/p1/mobile/putong/core/data/GrowthConversationBlindBox;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2111
    .line 2112
    invoke-interface {v1, v2}, Landroid/database/Cursor;->getBlob(I)[B

    .line 2113
    .line 2114
    .line 2115
    move-result-object v2

    .line 2116
    invoke-virtual {v14, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 2117
    .line 2118
    .line 2119
    move-result-object v2

    .line 2120
    check-cast v2, Lcom/p1/mobile/putong/core/data/GrowthConversationBlindBox;

    .line 2121
    .line 2122
    :goto_55
    iput-object v2, v13, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->blindbox:Lcom/p1/mobile/putong/core/data/GrowthConversationBlindBox;

    .line 2123
    .line 2124
    add-int/lit8 v2, v3, 0xe

    .line 2125
    .line 2126
    iget-object v13, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 2127
    .line 2128
    invoke-interface {v1, v2}, Landroid/database/Cursor;->isNull(I)Z

    .line 2129
    .line 2130
    .line 2131
    move-result v14

    .line 2132
    if-eqz v14, :cond_56

    .line 2133
    .line 2134
    const/4 v2, 0x0

    .line 2135
    goto :goto_56

    .line 2136
    :cond_56
    sget-object v14, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2137
    .line 2138
    invoke-virtual {v14}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2139
    .line 2140
    .line 2141
    move-result-object v14

    .line 2142
    invoke-interface {v1, v2}, Landroid/database/Cursor;->getBlob(I)[B

    .line 2143
    .line 2144
    .line 2145
    move-result-object v2

    .line 2146
    invoke-virtual {v14, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 2147
    .line 2148
    .line 2149
    move-result-object v2

    .line 2150
    check-cast v2, Ljava/util/List;

    .line 2151
    .line 2152
    :goto_56
    iput-object v2, v13, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->previewTexts:Ljava/util/List;

    .line 2153
    .line 2154
    add-int/lit8 v2, v3, 0xf

    .line 2155
    .line 2156
    iget-object v13, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 2157
    .line 2158
    invoke-interface {v1, v2}, Landroid/database/Cursor;->isNull(I)Z

    .line 2159
    .line 2160
    .line 2161
    move-result v14

    .line 2162
    if-eqz v14, :cond_57

    .line 2163
    .line 2164
    const/4 v2, 0x0

    .line 2165
    goto :goto_57

    .line 2166
    :cond_57
    sget-object v14, Lcom/p1/mobile/putong/core/data/GreetingInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2167
    .line 2168
    invoke-interface {v1, v2}, Landroid/database/Cursor;->getBlob(I)[B

    .line 2169
    .line 2170
    .line 2171
    move-result-object v2

    .line 2172
    invoke-virtual {v14, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 2173
    .line 2174
    .line 2175
    move-result-object v2

    .line 2176
    check-cast v2, Lcom/p1/mobile/putong/core/data/GreetingInfo;

    .line 2177
    .line 2178
    :goto_57
    iput-object v2, v13, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->greetingInfo:Lcom/p1/mobile/putong/core/data/GreetingInfo;

    .line 2179
    .line 2180
    add-int/lit8 v2, v3, 0x10

    .line 2181
    .line 2182
    iget-object v13, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 2183
    .line 2184
    invoke-interface {v1, v2}, Landroid/database/Cursor;->isNull(I)Z

    .line 2185
    .line 2186
    .line 2187
    move-result v14

    .line 2188
    if-eqz v14, :cond_58

    .line 2189
    .line 2190
    const/4 v2, 0x0

    .line 2191
    goto :goto_58

    .line 2192
    :cond_58
    sget-object v14, Lcom/p1/mobile/putong/core/data/ConversationAdditionalFateRadar;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2193
    .line 2194
    invoke-interface {v1, v2}, Landroid/database/Cursor;->getBlob(I)[B

    .line 2195
    .line 2196
    .line 2197
    move-result-object v2

    .line 2198
    invoke-virtual {v14, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 2199
    .line 2200
    .line 2201
    move-result-object v2

    .line 2202
    check-cast v2, Lcom/p1/mobile/putong/core/data/ConversationAdditionalFateRadar;

    .line 2203
    .line 2204
    :goto_58
    iput-object v2, v13, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->fateRadar:Lcom/p1/mobile/putong/core/data/ConversationAdditionalFateRadar;

    .line 2205
    .line 2206
    add-int/lit8 v2, v3, 0x11

    .line 2207
    .line 2208
    invoke-interface {v1, v2}, Landroid/database/Cursor;->getInt(I)I

    .line 2209
    .line 2210
    .line 2211
    move-result v2

    .line 2212
    const/4 v14, 0x1

    .line 2213
    if-ne v2, v14, :cond_59

    .line 2214
    .line 2215
    goto :goto_59

    .line 2216
    :cond_59
    const/4 v14, 0x0

    .line 2217
    :goto_59
    iput-boolean v14, v4, Lcom/p1/mobile/putong/core/data/Conversation;->isFake:Z

    .line 2218
    .line 2219
    add-int/lit8 v2, v3, 0x12

    .line 2220
    .line 2221
    iget-object v13, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 2222
    .line 2223
    invoke-interface {v1, v2}, Landroid/database/Cursor;->isNull(I)Z

    .line 2224
    .line 2225
    .line 2226
    move-result v14

    .line 2227
    if-eqz v14, :cond_5a

    .line 2228
    .line 2229
    const/4 v2, 0x0

    .line 2230
    goto :goto_5a

    .line 2231
    :cond_5a
    sget-object v14, Lcom/p1/mobile/putong/core/data/LowPayOneside;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2232
    .line 2233
    invoke-interface {v1, v2}, Landroid/database/Cursor;->getBlob(I)[B

    .line 2234
    .line 2235
    .line 2236
    move-result-object v2

    .line 2237
    invoke-virtual {v14, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 2238
    .line 2239
    .line 2240
    move-result-object v2

    .line 2241
    check-cast v2, Lcom/p1/mobile/putong/core/data/LowPayOneside;

    .line 2242
    .line 2243
    :goto_5a
    iput-object v2, v13, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->lowPayOneside:Lcom/p1/mobile/putong/core/data/LowPayOneside;

    .line 2244
    .line 2245
    add-int/lit8 v2, v3, 0x13

    .line 2246
    .line 2247
    iget-object v13, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 2248
    .line 2249
    invoke-interface {v1, v2}, Landroid/database/Cursor;->isNull(I)Z

    .line 2250
    .line 2251
    .line 2252
    move-result v14

    .line 2253
    if-eqz v14, :cond_5b

    .line 2254
    .line 2255
    const/4 v2, 0x0

    .line 2256
    goto :goto_5b

    .line 2257
    :cond_5b
    sget-object v14, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2258
    .line 2259
    invoke-interface {v1, v2}, Landroid/database/Cursor;->getBlob(I)[B

    .line 2260
    .line 2261
    .line 2262
    move-result-object v2

    .line 2263
    invoke-virtual {v14, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 2264
    .line 2265
    .line 2266
    move-result-object v2

    .line 2267
    check-cast v2, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;

    .line 2268
    .line 2269
    :goto_5b
    iput-object v2, v13, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->matchInfo:Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;

    .line 2270
    .line 2271
    add-int/lit8 v2, v3, 0x14

    .line 2272
    .line 2273
    iget-object v13, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 2274
    .line 2275
    iget-object v13, v13, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->newMatch:Lcom/p1/mobile/putong/core/data/ExposureNewMatch;

    .line 2276
    .line 2277
    move/from16 p2, v3

    .line 2278
    .line 2279
    invoke-interface {v1, v2}, Landroid/database/Cursor;->getDouble(I)D

    .line 2280
    .line 2281
    .line 2282
    move-result-wide v2

    .line 2283
    iput-wide v2, v13, Lcom/p1/mobile/putong/core/data/ExposureNewMatch;->labelExposureTime:D

    .line 2284
    .line 2285
    add-int/lit8 v3, p2, 0x15

    .line 2286
    .line 2287
    iget-object v2, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 2288
    .line 2289
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 2290
    .line 2291
    .line 2292
    move-result v13

    .line 2293
    if-eqz v13, :cond_5c

    .line 2294
    .line 2295
    const/4 v3, 0x0

    .line 2296
    goto :goto_5c

    .line 2297
    :cond_5c
    sget-object v13, Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2298
    .line 2299
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    .line 2300
    .line 2301
    .line 2302
    move-result-object v3

    .line 2303
    invoke-virtual {v13, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 2304
    .line 2305
    .line 2306
    move-result-object v3

    .line 2307
    check-cast v3, Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;

    .line 2308
    .line 2309
    :goto_5c
    iput-object v3, v2, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->loveLetter:Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;

    .line 2310
    .line 2311
    add-int/lit8 v3, p2, 0x16

    .line 2312
    .line 2313
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getInt(I)I

    .line 2314
    .line 2315
    .line 2316
    move-result v2

    .line 2317
    iput v2, v4, Lcom/p1/mobile/putong/core/data/Conversation;->localIsLimitedTrialSee:I

    .line 2318
    .line 2319
    add-int/lit8 v3, p2, 0x17

    .line 2320
    .line 2321
    iget-object v2, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 2322
    .line 2323
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 2324
    .line 2325
    .line 2326
    move-result v13

    .line 2327
    if-eqz v13, :cond_5d

    .line 2328
    .line 2329
    const/4 v3, 0x0

    .line 2330
    goto :goto_5d

    .line 2331
    :cond_5d
    sget-object v13, Lcom/p1/mobile/putong/core/data/ChatMM;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2332
    .line 2333
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    .line 2334
    .line 2335
    .line 2336
    move-result-object v3

    .line 2337
    invoke-virtual {v13, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 2338
    .line 2339
    .line 2340
    move-result-object v3

    .line 2341
    check-cast v3, Lcom/p1/mobile/putong/core/data/ChatMM;

    .line 2342
    .line 2343
    :goto_5d
    iput-object v3, v2, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->chatMM:Lcom/p1/mobile/putong/core/data/ChatMM;

    .line 2344
    .line 2345
    add-int/lit8 v3, p2, 0x18

    .line 2346
    .line 2347
    iget-object v2, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 2348
    .line 2349
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 2350
    .line 2351
    .line 2352
    move-result v13

    .line 2353
    if-eqz v13, :cond_5e

    .line 2354
    .line 2355
    const/4 v3, 0x0

    .line 2356
    goto :goto_5e

    .line 2357
    :cond_5e
    sget-object v13, Lcom/p1/mobile/putong/core/data/BlackList;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2358
    .line 2359
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    .line 2360
    .line 2361
    .line 2362
    move-result-object v3

    .line 2363
    invoke-virtual {v13, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 2364
    .line 2365
    .line 2366
    move-result-object v3

    .line 2367
    check-cast v3, Lcom/p1/mobile/putong/core/data/BlackList;

    .line 2368
    .line 2369
    :goto_5e
    iput-object v3, v2, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->blackList:Lcom/p1/mobile/putong/core/data/BlackList;

    .line 2370
    .line 2371
    add-int/lit8 v3, p2, 0x19

    .line 2372
    .line 2373
    iget-object v2, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 2374
    .line 2375
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 2376
    .line 2377
    .line 2378
    move-result v13

    .line 2379
    if-eqz v13, :cond_5f

    .line 2380
    .line 2381
    const/4 v3, 0x0

    .line 2382
    goto :goto_5f

    .line 2383
    :cond_5f
    sget-object v13, Lcom/p1/mobile/putong/core/data/MessageRelate;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2384
    .line 2385
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    .line 2386
    .line 2387
    .line 2388
    move-result-object v3

    .line 2389
    invoke-virtual {v13, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 2390
    .line 2391
    .line 2392
    move-result-object v3

    .line 2393
    check-cast v3, Lcom/p1/mobile/putong/core/data/MessageRelate;

    .line 2394
    .line 2395
    :goto_5f
    iput-object v3, v2, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->messageRelate:Lcom/p1/mobile/putong/core/data/MessageRelate;

    .line 2396
    .line 2397
    add-int/lit8 v3, p2, 0x1a

    .line 2398
    .line 2399
    iget-object v2, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 2400
    .line 2401
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 2402
    .line 2403
    .line 2404
    move-result v13

    .line 2405
    if-eqz v13, :cond_60

    .line 2406
    .line 2407
    const/4 v3, 0x0

    .line 2408
    goto :goto_60

    .line 2409
    :cond_60
    sget-object v13, Lcom/p1/mobile/putong/core/data/ConvAdditionalCompliment;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2410
    .line 2411
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    .line 2412
    .line 2413
    .line 2414
    move-result-object v3

    .line 2415
    invoke-virtual {v13, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 2416
    .line 2417
    .line 2418
    move-result-object v3

    .line 2419
    check-cast v3, Lcom/p1/mobile/putong/core/data/ConvAdditionalCompliment;

    .line 2420
    .line 2421
    :goto_60
    iput-object v3, v2, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->compliment:Lcom/p1/mobile/putong/core/data/ConvAdditionalCompliment;

    .line 2422
    .line 2423
    add-int/lit8 v3, p2, 0x1b

    .line 2424
    .line 2425
    iget-object v2, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 2426
    .line 2427
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 2428
    .line 2429
    .line 2430
    move-result v13

    .line 2431
    if-eqz v13, :cond_61

    .line 2432
    .line 2433
    const/4 v3, 0x0

    .line 2434
    goto :goto_61

    .line 2435
    :cond_61
    sget-object v13, Lcom/p1/mobile/putong/core/data/ConvAdditionalSwiper;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2436
    .line 2437
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    .line 2438
    .line 2439
    .line 2440
    move-result-object v3

    .line 2441
    invoke-virtual {v13, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 2442
    .line 2443
    .line 2444
    move-result-object v3

    .line 2445
    check-cast v3, Lcom/p1/mobile/putong/core/data/ConvAdditionalSwiper;

    .line 2446
    .line 2447
    :goto_61
    iput-object v3, v2, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->swiper:Lcom/p1/mobile/putong/core/data/ConvAdditionalSwiper;

    .line 2448
    .line 2449
    add-int/lit8 v3, p2, 0x1c

    .line 2450
    .line 2451
    iput v3, v0, Ll/vzf0;->readIndex:I
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_0

    .line 2452
    .line 2453
    :goto_62
    move/from16 v0, v17

    .line 2454
    .line 2455
    move-object/from16 v1, v18

    .line 2456
    .line 2457
    move-object/from16 v3, v19

    .line 2458
    .line 2459
    move-object/from16 v2, v21

    .line 2460
    .line 2461
    goto/16 :goto_6c

    .line 2462
    .line 2463
    :catch_2
    move-exception v0

    .line 2464
    move-object/from16 v19, v2

    .line 2465
    .line 2466
    :goto_63
    move-object/from16 v21, v19

    .line 2467
    .line 2468
    goto/16 :goto_47

    .line 2469
    .line 2470
    :catch_3
    move-exception v0

    .line 2471
    move-object/from16 v18, v2

    .line 2472
    .line 2473
    :goto_64
    move-object/from16 v19, v18

    .line 2474
    .line 2475
    goto :goto_63

    .line 2476
    :catch_4
    move-exception v0

    .line 2477
    move-object v15, v2

    .line 2478
    :goto_65
    move-object/from16 v18, v15

    .line 2479
    .line 2480
    goto :goto_64

    .line 2481
    :catch_5
    move-exception v0

    .line 2482
    move-object v9, v2

    .line 2483
    move-object v15, v9

    .line 2484
    goto :goto_65

    .line 2485
    :catch_6
    move-exception v0

    .line 2486
    move-object v9, v2

    .line 2487
    move-object v15, v9

    .line 2488
    move-object/from16 v18, v15

    .line 2489
    .line 2490
    move-object/from16 v19, v18

    .line 2491
    .line 2492
    move-object/from16 v21, v19

    .line 2493
    .line 2494
    move-object/from16 v16, v5

    .line 2495
    .line 2496
    move v5, v7

    .line 2497
    goto/16 :goto_6b

    .line 2498
    .line 2499
    :catch_7
    move-exception v0

    .line 2500
    :goto_66
    move-object v9, v2

    .line 2501
    move-object v15, v9

    .line 2502
    move-object/from16 v18, v15

    .line 2503
    .line 2504
    move-object/from16 v19, v18

    .line 2505
    .line 2506
    move-object/from16 v21, v19

    .line 2507
    .line 2508
    move-object/from16 v16, v5

    .line 2509
    .line 2510
    move v5, v7

    .line 2511
    const/4 v6, -0x1

    .line 2512
    goto/16 :goto_6b

    .line 2513
    .line 2514
    :catch_8
    move-exception v0

    .line 2515
    move/from16 v17, v9

    .line 2516
    .line 2517
    goto :goto_66

    .line 2518
    :catch_9
    move-exception v0

    .line 2519
    move/from16 v17, v9

    .line 2520
    .line 2521
    move-object v9, v2

    .line 2522
    move-object v15, v9

    .line 2523
    move-object/from16 v18, v15

    .line 2524
    .line 2525
    move-object/from16 v19, v18

    .line 2526
    .line 2527
    move-object/from16 v21, v19

    .line 2528
    .line 2529
    move v5, v7

    .line 2530
    const/4 v6, -0x1

    .line 2531
    :goto_67
    const/16 v16, 0x0

    .line 2532
    .line 2533
    goto/16 :goto_6b

    .line 2534
    .line 2535
    :catch_a
    move-exception v0

    .line 2536
    move/from16 v17, v9

    .line 2537
    .line 2538
    move-object v9, v2

    .line 2539
    move-object v15, v9

    .line 2540
    move-object/from16 v18, v15

    .line 2541
    .line 2542
    move-object/from16 v19, v18

    .line 2543
    .line 2544
    move-object/from16 v21, v19

    .line 2545
    .line 2546
    move v5, v7

    .line 2547
    const/4 v6, -0x1

    .line 2548
    :goto_68
    const/4 v12, -0x1

    .line 2549
    goto :goto_67

    .line 2550
    :catch_b
    move-exception v0

    .line 2551
    move/from16 v17, v9

    .line 2552
    .line 2553
    move-object v9, v2

    .line 2554
    move-object v15, v9

    .line 2555
    move-object/from16 v18, v15

    .line 2556
    .line 2557
    move-object/from16 v19, v18

    .line 2558
    .line 2559
    move-object/from16 v21, v19

    .line 2560
    .line 2561
    move v5, v7

    .line 2562
    const/4 v6, -0x1

    .line 2563
    :goto_69
    const/4 v11, -0x1

    .line 2564
    goto :goto_68

    .line 2565
    :catch_c
    move-exception v0

    .line 2566
    move/from16 v17, v9

    .line 2567
    .line 2568
    move-object v9, v2

    .line 2569
    move-object v15, v9

    .line 2570
    move-object/from16 v18, v15

    .line 2571
    .line 2572
    move-object/from16 v19, v18

    .line 2573
    .line 2574
    move-object/from16 v21, v19

    .line 2575
    .line 2576
    move v5, v7

    .line 2577
    const/4 v6, -0x1

    .line 2578
    const/4 v10, -0x1

    .line 2579
    goto :goto_69

    .line 2580
    :catch_d
    move-exception v0

    .line 2581
    move-object v9, v2

    .line 2582
    move-object v15, v9

    .line 2583
    move-object/from16 v18, v15

    .line 2584
    .line 2585
    move-object/from16 v19, v18

    .line 2586
    .line 2587
    move-object/from16 v21, v19

    .line 2588
    .line 2589
    move v5, v7

    .line 2590
    :goto_6a
    const/4 v6, -0x1

    .line 2591
    const/4 v10, -0x1

    .line 2592
    const/4 v11, -0x1

    .line 2593
    const/4 v12, -0x1

    .line 2594
    const/16 v16, 0x0

    .line 2595
    .line 2596
    const/16 v17, -0x1

    .line 2597
    .line 2598
    goto :goto_6b

    .line 2599
    :catch_e
    move-exception v0

    .line 2600
    move-object v9, v2

    .line 2601
    move-object v15, v9

    .line 2602
    move-object/from16 v18, v15

    .line 2603
    .line 2604
    move-object/from16 v19, v18

    .line 2605
    .line 2606
    move-object/from16 v21, v19

    .line 2607
    .line 2608
    const/4 v5, -0x1

    .line 2609
    goto :goto_6a

    .line 2610
    :goto_6b
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/MessageNano;->reportError(Ljava/lang/Exception;Landroid/database/Cursor;)V

    .line 2611
    .line 2612
    .line 2613
    move-object v8, v2

    .line 2614
    move v7, v5

    .line 2615
    move-object/from16 v5, v16

    .line 2616
    .line 2617
    goto/16 :goto_62

    .line 2618
    .line 2619
    :goto_6c
    sget-object v13, Lcom/p1/mobile/putong/data/MatchFrom;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 2620
    .line 2621
    invoke-virtual {v13, v8, v7}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 2622
    .line 2623
    .line 2624
    move-result-object v7

    .line 2625
    check-cast v7, Lcom/p1/mobile/putong/data/MatchFrom;

    .line 2626
    .line 2627
    iput-object v7, v4, Lcom/p1/mobile/putong/core/data/Conversation;->localMatchFrom:Lcom/p1/mobile/putong/data/MatchFrom;

    .line 2628
    .line 2629
    sget-object v7, Lcom/p1/mobile/putong/core/data/NotificationStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 2630
    .line 2631
    invoke-virtual {v7, v9, v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 2632
    .line 2633
    .line 2634
    move-result-object v0

    .line 2635
    check-cast v0, Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 2636
    .line 2637
    iput-object v0, v4, Lcom/p1/mobile/putong/core/data/Conversation;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 2638
    .line 2639
    sget-object v0, Lcom/p1/mobile/putong/core/data/StickStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 2640
    .line 2641
    invoke-virtual {v0, v15, v10}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 2642
    .line 2643
    .line 2644
    move-result-object v8

    .line 2645
    check-cast v8, Lcom/p1/mobile/putong/core/data/StickStatus;

    .line 2646
    .line 2647
    iput-object v8, v4, Lcom/p1/mobile/putong/core/data/Conversation;->importance:Lcom/p1/mobile/putong/core/data/StickStatus;

    .line 2648
    .line 2649
    sget-object v8, Lcom/p1/mobile/putong/data/ConversationStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 2650
    .line 2651
    invoke-virtual {v8, v1, v11}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 2652
    .line 2653
    .line 2654
    move-result-object v1

    .line 2655
    check-cast v1, Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 2656
    .line 2657
    iput-object v1, v4, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 2658
    .line 2659
    sget-object v1, Lcom/p1/mobile/putong/core/data/ConversationType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 2660
    .line 2661
    invoke-virtual {v1, v3, v12}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 2662
    .line 2663
    .line 2664
    move-result-object v3

    .line 2665
    check-cast v3, Lcom/p1/mobile/putong/core/data/ConversationType;

    .line 2666
    .line 2667
    iput-object v3, v4, Lcom/p1/mobile/putong/core/data/Conversation;->subtype:Lcom/p1/mobile/putong/core/data/ConversationType;

    .line 2668
    .line 2669
    iget-object v3, v4, Lcom/p1/mobile/putong/core/data/Conversation;->localBusinessTypes:Ljava/util/List;

    .line 2670
    .line 2671
    if-nez v3, :cond_62

    .line 2672
    .line 2673
    if-eqz v5, :cond_62

    .line 2674
    .line 2675
    invoke-static {v5}, Lcom/p1/mobile/putong/core/data/LocalBusinessType;->oldEnumCovertList(Ljava/util/List;)Ljava/util/List;

    .line 2676
    .line 2677
    .line 2678
    move-result-object v3

    .line 2679
    iput-object v3, v4, Lcom/p1/mobile/putong/core/data/Conversation;->localBusinessTypes:Ljava/util/List;

    .line 2680
    .line 2681
    :cond_62
    sget-object v3, Lcom/p1/mobile/putong/core/data/LocalPlaceBan;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 2682
    .line 2683
    invoke-virtual {v3, v2, v6}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 2684
    .line 2685
    .line 2686
    move-result-object v2

    .line 2687
    check-cast v2, Lcom/p1/mobile/putong/core/data/LocalPlaceBan;

    .line 2688
    .line 2689
    iput-object v2, v4, Lcom/p1/mobile/putong/core/data/Conversation;->localPlaceBan:Lcom/p1/mobile/putong/core/data/LocalPlaceBan;

    .line 2690
    .line 2691
    iget-object v2, v4, Lcom/p1/mobile/putong/core/data/Conversation;->read:Ljava/lang/Boolean;

    .line 2692
    .line 2693
    if-nez v2, :cond_63

    .line 2694
    .line 2695
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 2696
    .line 2697
    iput-object v2, v4, Lcom/p1/mobile/putong/core/data/Conversation;->read:Ljava/lang/Boolean;

    .line 2698
    .line 2699
    :cond_63
    iget-object v2, v4, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 2700
    .line 2701
    const-string v5, ""

    .line 2702
    .line 2703
    if-nez v2, :cond_64

    .line 2704
    .line 2705
    iput-object v5, v4, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 2706
    .line 2707
    :cond_64
    iget-object v2, v4, Lcom/p1/mobile/putong/core/data/Conversation;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 2708
    .line 2709
    if-nez v2, :cond_65

    .line 2710
    .line 2711
    invoke-virtual {v7}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 2712
    .line 2713
    .line 2714
    move-result-object v2

    .line 2715
    check-cast v2, Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 2716
    .line 2717
    iput-object v2, v4, Lcom/p1/mobile/putong/core/data/Conversation;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 2718
    .line 2719
    :cond_65
    iget-object v2, v4, Lcom/p1/mobile/putong/core/data/Conversation;->importance:Lcom/p1/mobile/putong/core/data/StickStatus;

    .line 2720
    .line 2721
    if-nez v2, :cond_66

    .line 2722
    .line 2723
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 2724
    .line 2725
    .line 2726
    move-result-object v0

    .line 2727
    check-cast v0, Lcom/p1/mobile/putong/core/data/StickStatus;

    .line 2728
    .line 2729
    iput-object v0, v4, Lcom/p1/mobile/putong/core/data/Conversation;->importance:Lcom/p1/mobile/putong/core/data/StickStatus;

    .line 2730
    .line 2731
    :cond_66
    iget-object v0, v4, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 2732
    .line 2733
    if-nez v0, :cond_67

    .line 2734
    .line 2735
    invoke-virtual {v8}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 2736
    .line 2737
    .line 2738
    move-result-object v0

    .line 2739
    check-cast v0, Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 2740
    .line 2741
    iput-object v0, v4, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 2742
    .line 2743
    :cond_67
    iget-object v0, v4, Lcom/p1/mobile/putong/core/data/Conversation;->subtype:Lcom/p1/mobile/putong/core/data/ConversationType;

    .line 2744
    .line 2745
    if-nez v0, :cond_68

    .line 2746
    .line 2747
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 2748
    .line 2749
    .line 2750
    move-result-object v0

    .line 2751
    check-cast v0, Lcom/p1/mobile/putong/core/data/ConversationType;

    .line 2752
    .line 2753
    iput-object v0, v4, Lcom/p1/mobile/putong/core/data/Conversation;->subtype:Lcom/p1/mobile/putong/core/data/ConversationType;

    .line 2754
    .line 2755
    :cond_68
    iget-object v0, v4, Lcom/p1/mobile/putong/core/data/Conversation;->myTalk:Lcom/p1/mobile/putong/core/data/TalkInfo;

    .line 2756
    .line 2757
    if-nez v0, :cond_69

    .line 2758
    .line 2759
    invoke-static {}, Lcom/p1/mobile/putong/core/data/TalkInfo;->new_()Lcom/p1/mobile/putong/core/data/TalkInfo;

    .line 2760
    .line 2761
    .line 2762
    move-result-object v0

    .line 2763
    iput-object v0, v4, Lcom/p1/mobile/putong/core/data/Conversation;->myTalk:Lcom/p1/mobile/putong/core/data/TalkInfo;

    .line 2764
    .line 2765
    :cond_69
    iget-object v0, v4, Lcom/p1/mobile/putong/core/data/Conversation;->otherTalk:Lcom/p1/mobile/putong/core/data/TalkInfo;

    .line 2766
    .line 2767
    if-nez v0, :cond_6a

    .line 2768
    .line 2769
    invoke-static {}, Lcom/p1/mobile/putong/core/data/TalkInfo;->new_()Lcom/p1/mobile/putong/core/data/TalkInfo;

    .line 2770
    .line 2771
    .line 2772
    move-result-object v0

    .line 2773
    iput-object v0, v4, Lcom/p1/mobile/putong/core/data/Conversation;->otherTalk:Lcom/p1/mobile/putong/core/data/TalkInfo;

    .line 2774
    .line 2775
    :cond_6a
    iget-object v0, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 2776
    .line 2777
    if-nez v0, :cond_6b

    .line 2778
    .line 2779
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->new_()Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 2780
    .line 2781
    .line 2782
    move-result-object v0

    .line 2783
    iput-object v0, v4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 2784
    .line 2785
    :cond_6b
    iget-object v0, v4, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 2786
    .line 2787
    if-nez v0, :cond_6c

    .line 2788
    .line 2789
    iput-object v5, v4, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 2790
    .line 2791
    :cond_6c
    iget-object v0, v4, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 2792
    .line 2793
    if-nez v0, :cond_6d

    .line 2794
    .line 2795
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConversationProperty;->new_()Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 2796
    .line 2797
    .line 2798
    move-result-object v0

    .line 2799
    iput-object v0, v4, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 2800
    .line 2801
    :cond_6d
    iget-object v0, v4, Lcom/p1/mobile/putong/core/data/Conversation;->heat:Lcom/p1/mobile/putong/core/data/FriendHeatScore;

    .line 2802
    .line 2803
    if-nez v0, :cond_6e

    .line 2804
    .line 2805
    invoke-static {}, Lcom/p1/mobile/putong/core/data/FriendHeatScore;->new_()Lcom/p1/mobile/putong/core/data/FriendHeatScore;

    .line 2806
    .line 2807
    .line 2808
    move-result-object v0

    .line 2809
    iput-object v0, v4, Lcom/p1/mobile/putong/core/data/Conversation;->heat:Lcom/p1/mobile/putong/core/data/FriendHeatScore;

    .line 2810
    .line 2811
    :cond_6e
    iget-object v0, v4, Lcom/p1/mobile/putong/core/data/Conversation;->localBusinessTypes:Ljava/util/List;

    .line 2812
    .line 2813
    if-nez v0, :cond_6f

    .line 2814
    .line 2815
    new-instance v0, Ljava/util/ArrayList;

    .line 2816
    .line 2817
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2818
    .line 2819
    .line 2820
    iput-object v0, v4, Lcom/p1/mobile/putong/core/data/Conversation;->localBusinessTypes:Ljava/util/List;

    .line 2821
    .line 2822
    :cond_6f
    iget-object v0, v4, Lcom/p1/mobile/putong/core/data/Conversation;->group:Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;

    .line 2823
    .line 2824
    if-nez v0, :cond_70

    .line 2825
    .line 2826
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;->new_()Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;

    .line 2827
    .line 2828
    .line 2829
    move-result-object v0

    .line 2830
    iput-object v0, v4, Lcom/p1/mobile/putong/core/data/Conversation;->group:Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;

    .line 2831
    .line 2832
    :cond_70
    iget-object v0, v4, Lcom/p1/mobile/putong/core/data/Conversation;->localPlaceBan:Lcom/p1/mobile/putong/core/data/LocalPlaceBan;

    .line 2833
    .line 2834
    if-nez v0, :cond_71

    .line 2835
    .line 2836
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 2837
    .line 2838
    .line 2839
    move-result-object v0

    .line 2840
    check-cast v0, Lcom/p1/mobile/putong/core/data/LocalPlaceBan;

    .line 2841
    .line 2842
    iput-object v0, v4, Lcom/p1/mobile/putong/core/data/Conversation;->localPlaceBan:Lcom/p1/mobile/putong/core/data/LocalPlaceBan;

    .line 2843
    .line 2844
    :cond_71
    iget-object v0, v4, Lcom/p1/mobile/putong/core/data/Conversation;->localNotifyMomentId:Ljava/lang/String;

    .line 2845
    .line 2846
    if-nez v0, :cond_72

    .line 2847
    .line 2848
    iput-object v5, v4, Lcom/p1/mobile/putong/core/data/Conversation;->localNotifyMomentId:Ljava/lang/String;

    .line 2849
    .line 2850
    :cond_72
    iget-object v0, v4, Lcom/p1/mobile/putong/core/data/Conversation;->localInsertedMomentId:Ljava/lang/String;

    .line 2851
    .line 2852
    if-nez v0, :cond_73

    .line 2853
    .line 2854
    iput-object v5, v4, Lcom/p1/mobile/putong/core/data/Conversation;->localInsertedMomentId:Ljava/lang/String;

    .line 2855
    .line 2856
    :cond_73
    iget-object v0, v4, Lcom/p1/mobile/putong/core/data/Conversation;->otherStatus:Ljava/lang/String;

    .line 2857
    .line 2858
    if-nez v0, :cond_74

    .line 2859
    .line 2860
    iput-object v5, v4, Lcom/p1/mobile/putong/core/data/Conversation;->otherStatus:Ljava/lang/String;

    .line 2861
    .line 2862
    :cond_74
    return-object v4
.end method

.method public bridge synthetic read(Landroid/database/Cursor;I)Ljava/lang/Object;
    .locals 0

    .line 2863
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/Conversation$129;->read(Landroid/database/Cursor;I)Lcom/p1/mobile/putong/core/data/Conversation;

    move-result-object p0

    return-object p0
.end method

.method public write(Lcom/p1/mobile/putong/core/data/Conversation;Landroid/content/ContentValues;)V
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
    const-string v0, "localHasMessage_c"

    .line 10
    .line 11
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localHasMessage:Z

    .line 12
    .line 13
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 18
    .line 19
    .line 20
    const-string v0, "read_c"

    .line 21
    .line 22
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->read:Ljava/lang/Boolean;

    .line 23
    .line 24
    if-nez v1, :cond_0

    .line 25
    .line 26
    move-object v1, p0

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    :goto_0
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 37
    .line 38
    .line 39
    const-string v0, "otherUser_c"

    .line 40
    .line 41
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    const-string v0, "readUntil_c"

    .line 47
    .line 48
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->readUntil:Ljava/lang/String;

    .line 49
    .line 50
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    const-string v0, "latestTime_c"

    .line 54
    .line 55
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->latestTime:D

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
    const-string v0, "createdTime_c"

    .line 65
    .line 66
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->createdTime:D

    .line 67
    .line 68
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Double;)V

    .line 73
    .line 74
    .line 75
    const-string v0, "str_localMatchFrom_c"

    .line 76
    .line 77
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localMatchFrom:Lcom/p1/mobile/putong/data/MatchFrom;

    .line 78
    .line 79
    if-nez v1, :cond_1

    .line 80
    .line 81
    move-object v1, p0

    .line 82
    goto :goto_1

    .line 83
    :cond_1
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    :goto_1
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    const-string v0, "localMatchFrom_c"

    .line 91
    .line 92
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localMatchFrom:Lcom/p1/mobile/putong/data/MatchFrom;

    .line 93
    .line 94
    if-nez v1, :cond_2

    .line 95
    .line 96
    move-object v1, p0

    .line 97
    goto :goto_2

    .line 98
    :cond_2
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    :goto_2
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 107
    .line 108
    .line 109
    const-string v0, "str_localNotificationStatus_c"

    .line 110
    .line 111
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 112
    .line 113
    if-nez v1, :cond_3

    .line 114
    .line 115
    move-object v1, p0

    .line 116
    goto :goto_3

    .line 117
    :cond_3
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    :goto_3
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    const-string v0, "localNotificationStatus_c"

    .line 125
    .line 126
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

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
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 133
    .line 134
    .line 135
    move-result v1

    .line 136
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 137
    .line 138
    .line 139
    move-result-object v1

    .line 140
    :goto_4
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 141
    .line 142
    .line 143
    const-string v0, "localBotheringTime_c"

    .line 144
    .line 145
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localBotheringTime:D

    .line 146
    .line 147
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Double;)V

    .line 152
    .line 153
    .line 154
    const-string v0, "scenarios_c"

    .line 155
    .line 156
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->scenarios:Ljava/util/List;

    .line 157
    .line 158
    if-nez v1, :cond_5

    .line 159
    .line 160
    move-object v1, p0

    .line 161
    goto :goto_5

    .line 162
    :cond_5
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 163
    .line 164
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 165
    .line 166
    .line 167
    move-result-object v1

    .line 168
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/Conversation;->scenarios:Ljava/util/List;

    .line 169
    .line 170
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 171
    .line 172
    .line 173
    move-result-object v1

    .line 174
    :goto_5
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 175
    .line 176
    .line 177
    const-string v0, "localActiveTime_c"

    .line 178
    .line 179
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localActiveTime:D

    .line 180
    .line 181
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 182
    .line 183
    .line 184
    move-result-object v1

    .line 185
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Double;)V

    .line 186
    .line 187
    .line 188
    const-string v0, "unreadMessages_c"

    .line 189
    .line 190
    iget v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 191
    .line 192
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 193
    .line 194
    .line 195
    move-result-object v1

    .line 196
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 197
    .line 198
    .line 199
    const-string v0, "localEverHasMessage_c"

    .line 200
    .line 201
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localEverHasMessage:Z

    .line 202
    .line 203
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 204
    .line 205
    .line 206
    move-result-object v1

    .line 207
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 208
    .line 209
    .line 210
    const-string v0, "reminder_c"

    .line 211
    .line 212
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->reminder:Lcom/p1/mobile/putong/core/data/Reminder;

    .line 213
    .line 214
    if-nez v1, :cond_6

    .line 215
    .line 216
    move-object v1, p0

    .line 217
    goto :goto_6

    .line 218
    :cond_6
    sget-object v2, Lcom/p1/mobile/putong/core/data/Reminder;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 219
    .line 220
    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 221
    .line 222
    .line 223
    move-result-object v1

    .line 224
    :goto_6
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 225
    .line 226
    .line 227
    const-string v0, "localUserUpdatedTime_c"

    .line 228
    .line 229
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localUserUpdatedTime:D

    .line 230
    .line 231
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 232
    .line 233
    .line 234
    move-result-object v1

    .line 235
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Double;)V

    .line 236
    .line 237
    .line 238
    const-string v0, "str_importance_c"

    .line 239
    .line 240
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->importance:Lcom/p1/mobile/putong/core/data/StickStatus;

    .line 241
    .line 242
    if-nez v1, :cond_7

    .line 243
    .line 244
    move-object v1, p0

    .line 245
    goto :goto_7

    .line 246
    :cond_7
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 247
    .line 248
    .line 249
    move-result-object v1

    .line 250
    :goto_7
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 251
    .line 252
    .line 253
    const-string v0, "importance_c"

    .line 254
    .line 255
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->importance:Lcom/p1/mobile/putong/core/data/StickStatus;

    .line 256
    .line 257
    if-nez v1, :cond_8

    .line 258
    .line 259
    move-object v1, p0

    .line 260
    goto :goto_8

    .line 261
    :cond_8
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 262
    .line 263
    .line 264
    move-result v1

    .line 265
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 266
    .line 267
    .line 268
    move-result-object v1

    .line 269
    :goto_8
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 270
    .line 271
    .line 272
    const-string v0, "localOnlineTabClick_c"

    .line 273
    .line 274
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localOnlineTabClick:Ljava/lang/String;

    .line 275
    .line 276
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 277
    .line 278
    .line 279
    const-string v0, "follow_c"

    .line 280
    .line 281
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->follow:Z

    .line 282
    .line 283
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 284
    .line 285
    .line 286
    move-result-object v1

    .line 287
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 288
    .line 289
    .line 290
    const-string v0, "localBotherWxTime_c"

    .line 291
    .line 292
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localBotherWxTime:D

    .line 293
    .line 294
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 295
    .line 296
    .line 297
    move-result-object v1

    .line 298
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Double;)V

    .line 299
    .line 300
    .line 301
    const-string v0, "localBotherCodeTime_c"

    .line 302
    .line 303
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localBotherCodeTime:D

    .line 304
    .line 305
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 306
    .line 307
    .line 308
    move-result-object v1

    .line 309
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Double;)V

    .line 310
    .line 311
    .line 312
    const-string v0, "clearedUntil_c"

    .line 313
    .line 314
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->clearedUntil:Ljava/lang/String;

    .line 315
    .line 316
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 317
    .line 318
    .line 319
    const-string v0, "str_status_c"

    .line 320
    .line 321
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 322
    .line 323
    if-nez v1, :cond_9

    .line 324
    .line 325
    move-object v1, p0

    .line 326
    goto :goto_9

    .line 327
    :cond_9
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 328
    .line 329
    .line 330
    move-result-object v1

    .line 331
    :goto_9
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 332
    .line 333
    .line 334
    const-string v0, "status_c"

    .line 335
    .line 336
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 337
    .line 338
    if-nez v1, :cond_a

    .line 339
    .line 340
    move-object v1, p0

    .line 341
    goto :goto_a

    .line 342
    :cond_a
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 343
    .line 344
    .line 345
    move-result v1

    .line 346
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 347
    .line 348
    .line 349
    move-result-object v1

    .line 350
    :goto_a
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 351
    .line 352
    .line 353
    const-string v0, "place_c"

    .line 354
    .line 355
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->place:Ljava/lang/String;

    .line 356
    .line 357
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 358
    .line 359
    .line 360
    const-string v0, "str_subtype_c"

    .line 361
    .line 362
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->subtype:Lcom/p1/mobile/putong/core/data/ConversationType;

    .line 363
    .line 364
    if-nez v1, :cond_b

    .line 365
    .line 366
    move-object v1, p0

    .line 367
    goto :goto_b

    .line 368
    :cond_b
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 369
    .line 370
    .line 371
    move-result-object v1

    .line 372
    :goto_b
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 373
    .line 374
    .line 375
    const-string v0, "subtype_c"

    .line 376
    .line 377
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->subtype:Lcom/p1/mobile/putong/core/data/ConversationType;

    .line 378
    .line 379
    if-nez v1, :cond_c

    .line 380
    .line 381
    move-object v1, p0

    .line 382
    goto :goto_c

    .line 383
    :cond_c
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 384
    .line 385
    .line 386
    move-result v1

    .line 387
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 388
    .line 389
    .line 390
    move-result-object v1

    .line 391
    :goto_c
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 392
    .line 393
    .line 394
    const-string v0, "myTalk_c"

    .line 395
    .line 396
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->myTalk:Lcom/p1/mobile/putong/core/data/TalkInfo;

    .line 397
    .line 398
    if-nez v1, :cond_d

    .line 399
    .line 400
    move-object v1, p0

    .line 401
    goto :goto_d

    .line 402
    :cond_d
    sget-object v2, Lcom/p1/mobile/putong/core/data/TalkInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 403
    .line 404
    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 405
    .line 406
    .line 407
    move-result-object v1

    .line 408
    :goto_d
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 409
    .line 410
    .line 411
    const-string v0, "otherTalk_c"

    .line 412
    .line 413
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->otherTalk:Lcom/p1/mobile/putong/core/data/TalkInfo;

    .line 414
    .line 415
    if-nez v1, :cond_e

    .line 416
    .line 417
    move-object v1, p0

    .line 418
    goto :goto_e

    .line 419
    :cond_e
    sget-object v2, Lcom/p1/mobile/putong/core/data/TalkInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 420
    .line 421
    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 422
    .line 423
    .line 424
    move-result-object v1

    .line 425
    :goto_e
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 426
    .line 427
    .line 428
    const-string v0, "otherReadUntil_c"

    .line 429
    .line 430
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->otherReadUntil:Ljava/lang/String;

    .line 431
    .line 432
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 433
    .line 434
    .line 435
    const-string v0, "enterTimes_c"

    .line 436
    .line 437
    iget v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->enterTimes:I

    .line 438
    .line 439
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 440
    .line 441
    .line 442
    move-result-object v1

    .line 443
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 444
    .line 445
    .line 446
    const-string v0, "updatedTime_c"

    .line 447
    .line 448
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->updatedTime:D

    .line 449
    .line 450
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 451
    .line 452
    .line 453
    move-result-object v1

    .line 454
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Double;)V

    .line 455
    .line 456
    .line 457
    const-string v0, "unmatchConversation_c"

    .line 458
    .line 459
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->unmatchConversation:Z

    .line 460
    .line 461
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 462
    .line 463
    .line 464
    move-result-object v1

    .line 465
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 466
    .line 467
    .line 468
    const-string v0, "remainedTime_c"

    .line 469
    .line 470
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->remainedTime:J

    .line 471
    .line 472
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 473
    .line 474
    .line 475
    move-result-object v1

    .line 476
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Long;)V

    .line 477
    .line 478
    .line 479
    const-string v0, "localSafetyReminderTime_c"

    .line 480
    .line 481
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localSafetyReminderTime:D

    .line 482
    .line 483
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 484
    .line 485
    .line 486
    move-result-object v1

    .line 487
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Double;)V

    .line 488
    .line 489
    .line 490
    const-string v0, "localSpoofingReminderTime_c"

    .line 491
    .line 492
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localSpoofingReminderTime:D

    .line 493
    .line 494
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 495
    .line 496
    .line 497
    move-result-object v1

    .line 498
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Double;)V

    .line 499
    .line 500
    .line 501
    const-string v0, "forceSend_c"

    .line 502
    .line 503
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->forceSend:Z

    .line 504
    .line 505
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 506
    .line 507
    .line 508
    move-result-object v1

    .line 509
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 510
    .line 511
    .line 512
    const-string v0, "conversationUserDistance_c"

    .line 513
    .line 514
    iget v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->conversationUserDistance:I

    .line 515
    .line 516
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 517
    .line 518
    .line 519
    move-result-object v1

    .line 520
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 521
    .line 522
    .line 523
    const-string v0, "conversationUserUpdatedTime_c"

    .line 524
    .line 525
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->conversationUserUpdatedTime:D

    .line 526
    .line 527
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 528
    .line 529
    .line 530
    move-result-object v1

    .line 531
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Double;)V

    .line 532
    .line 533
    .line 534
    const-string v0, "level_c"

    .line 535
    .line 536
    iget v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->level:I

    .line 537
    .line 538
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 539
    .line 540
    .line 541
    move-result-object v1

    .line 542
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 543
    .line 544
    .line 545
    const-string v0, "additional_quickChat_avatarBlurred_c"

    .line 546
    .line 547
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 548
    .line 549
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->quickChat:Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;

    .line 550
    .line 551
    iget-boolean v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->avatarBlurred:Z

    .line 552
    .line 553
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 554
    .line 555
    .line 556
    move-result-object v1

    .line 557
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 558
    .line 559
    .line 560
    const-string v0, "additional_voiceCall_rejectedTime_c"

    .line 561
    .line 562
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 563
    .line 564
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->voiceCall:Lcom/p1/mobile/putong/core/data/VoiceCallAdditional;

    .line 565
    .line 566
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/VoiceCallAdditional;->rejectedTime:Ljava/lang/String;

    .line 567
    .line 568
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 569
    .line 570
    .line 571
    const-string v0, "additional_voiceCall_acceptedTime_c"

    .line 572
    .line 573
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 574
    .line 575
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->voiceCall:Lcom/p1/mobile/putong/core/data/VoiceCallAdditional;

    .line 576
    .line 577
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/VoiceCallAdditional;->acceptedTime:Ljava/lang/String;

    .line 578
    .line 579
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 580
    .line 581
    .line 582
    const-string v0, "additional_timeLimited_expiredTimestamp_c"

    .line 583
    .line 584
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 585
    .line 586
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->timeLimited:Lcom/p1/mobile/putong/core/data/TimeLimited;

    .line 587
    .line 588
    iget-wide v1, v1, Lcom/p1/mobile/putong/core/data/TimeLimited;->expiredTimestamp:J

    .line 589
    .line 590
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 591
    .line 592
    .line 593
    move-result-object v1

    .line 594
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Long;)V

    .line 595
    .line 596
    .line 597
    const-string v0, "additional_timeLimited_participate_c"

    .line 598
    .line 599
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 600
    .line 601
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->timeLimited:Lcom/p1/mobile/putong/core/data/TimeLimited;

    .line 602
    .line 603
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/TimeLimited;->participate:Ljava/lang/String;

    .line 604
    .line 605
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 606
    .line 607
    .line 608
    const-string v0, "additional_timeLimited_allowExtension_c"

    .line 609
    .line 610
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 611
    .line 612
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->timeLimited:Lcom/p1/mobile/putong/core/data/TimeLimited;

    .line 613
    .line 614
    iget-boolean v1, v1, Lcom/p1/mobile/putong/core/data/TimeLimited;->allowExtension:Z

    .line 615
    .line 616
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 617
    .line 618
    .line 619
    move-result-object v1

    .line 620
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 621
    .line 622
    .line 623
    const-string v0, "additional_timeLimited_extensionOperator_c"

    .line 624
    .line 625
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 626
    .line 627
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->timeLimited:Lcom/p1/mobile/putong/core/data/TimeLimited;

    .line 628
    .line 629
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/TimeLimited;->extensionOperator:Ljava/lang/String;

    .line 630
    .line 631
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 632
    .line 633
    .line 634
    const-string v0, "convType_c"

    .line 635
    .line 636
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 637
    .line 638
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 639
    .line 640
    .line 641
    const-string v0, "property_c"

    .line 642
    .line 643
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->property:Lcom/p1/mobile/putong/core/data/ConversationProperty;

    .line 644
    .line 645
    if-nez v1, :cond_f

    .line 646
    .line 647
    move-object v1, p0

    .line 648
    goto :goto_f

    .line 649
    :cond_f
    sget-object v2, Lcom/p1/mobile/putong/core/data/ConversationProperty;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 650
    .line 651
    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 652
    .line 653
    .line 654
    move-result-object v1

    .line 655
    :goto_f
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 656
    .line 657
    .line 658
    const-string v0, "userMessageCount_c"

    .line 659
    .line 660
    iget v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->userMessageCount:I

    .line 661
    .line 662
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 663
    .line 664
    .line 665
    move-result-object v1

    .line 666
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 667
    .line 668
    .line 669
    const-string v0, "latestFriendCommentCreatedTime_c"

    .line 670
    .line 671
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->latestFriendCommentCreatedTime:D

    .line 672
    .line 673
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 674
    .line 675
    .line 676
    move-result-object v1

    .line 677
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Double;)V

    .line 678
    .line 679
    .line 680
    const-string v0, "heat_orderScore_c"

    .line 681
    .line 682
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->heat:Lcom/p1/mobile/putong/core/data/FriendHeatScore;

    .line 683
    .line 684
    iget v1, v1, Lcom/p1/mobile/putong/core/data/FriendHeatScore;->orderScore:I

    .line 685
    .line 686
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 687
    .line 688
    .line 689
    move-result-object v1

    .line 690
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 691
    .line 692
    .line 693
    const-string v0, "heat_showScore_c"

    .line 694
    .line 695
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->heat:Lcom/p1/mobile/putong/core/data/FriendHeatScore;

    .line 696
    .line 697
    iget v1, v1, Lcom/p1/mobile/putong/core/data/FriendHeatScore;->showScore:I

    .line 698
    .line 699
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 700
    .line 701
    .line 702
    move-result-object v1

    .line 703
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 704
    .line 705
    .line 706
    const-string v0, "heat_marks_c"

    .line 707
    .line 708
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->heat:Lcom/p1/mobile/putong/core/data/FriendHeatScore;

    .line 709
    .line 710
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/FriendHeatScore;->marks:Ljava/lang/String;

    .line 711
    .line 712
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 713
    .line 714
    .line 715
    const-string v0, "heat_mm_c"

    .line 716
    .line 717
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->heat:Lcom/p1/mobile/putong/core/data/FriendHeatScore;

    .line 718
    .line 719
    iget v1, v1, Lcom/p1/mobile/putong/core/data/FriendHeatScore;->mm:I

    .line 720
    .line 721
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 722
    .line 723
    .line 724
    move-result-object v1

    .line 725
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 726
    .line 727
    .line 728
    const-string v0, "heat_score_c"

    .line 729
    .line 730
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->heat:Lcom/p1/mobile/putong/core/data/FriendHeatScore;

    .line 731
    .line 732
    iget v1, v1, Lcom/p1/mobile/putong/core/data/FriendHeatScore;->score:I

    .line 733
    .line 734
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 735
    .line 736
    .line 737
    move-result-object v1

    .line 738
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 739
    .line 740
    .line 741
    const-string v0, "localBusinessTypes_c"

    .line 742
    .line 743
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localBusinessTypes:Ljava/util/List;

    .line 744
    .line 745
    if-nez v1, :cond_10

    .line 746
    .line 747
    move-object v1, p0

    .line 748
    goto :goto_10

    .line 749
    :cond_10
    sget-object v1, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 750
    .line 751
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 752
    .line 753
    .line 754
    move-result-object v1

    .line 755
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localBusinessTypes:Ljava/util/List;

    .line 756
    .line 757
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/LocalBusinessType;->covertToOldEnumList(Ljava/util/List;)Ljava/util/List;

    .line 758
    .line 759
    .line 760
    move-result-object v2

    .line 761
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 762
    .line 763
    .line 764
    move-result-object v1

    .line 765
    :goto_10
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 766
    .line 767
    .line 768
    const-string v0, "additional_oneSideNoMatch_selfSend_c"

    .line 769
    .line 770
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 771
    .line 772
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->oneSideNoMatch:Lcom/p1/mobile/putong/core/data/OneSideNoMatchConversation;

    .line 773
    .line 774
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/OneSideNoMatchConversation;->selfSend:Ljava/lang/Boolean;

    .line 775
    .line 776
    if-nez v1, :cond_11

    .line 777
    .line 778
    move-object v1, p0

    .line 779
    goto :goto_11

    .line 780
    :cond_11
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 781
    .line 782
    .line 783
    move-result v1

    .line 784
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 785
    .line 786
    .line 787
    move-result-object v1

    .line 788
    :goto_11
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 789
    .line 790
    .line 791
    const-string v0, "localGreetDelete_c"

    .line 792
    .line 793
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localGreetDelete:Z

    .line 794
    .line 795
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 796
    .line 797
    .line 798
    move-result-object v1

    .line 799
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 800
    .line 801
    .line 802
    const-string v0, "additional_timeLimited_hidden_c"

    .line 803
    .line 804
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 805
    .line 806
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->timeLimited:Lcom/p1/mobile/putong/core/data/TimeLimited;

    .line 807
    .line 808
    iget-boolean v1, v1, Lcom/p1/mobile/putong/core/data/TimeLimited;->hidden:Z

    .line 809
    .line 810
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 811
    .line 812
    .line 813
    move-result-object v1

    .line 814
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 815
    .line 816
    .line 817
    const-string v0, "additional_timeLimited_newConversation_c"

    .line 818
    .line 819
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 820
    .line 821
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->timeLimited:Lcom/p1/mobile/putong/core/data/TimeLimited;

    .line 822
    .line 823
    iget-boolean v1, v1, Lcom/p1/mobile/putong/core/data/TimeLimited;->newConversation:Z

    .line 824
    .line 825
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 826
    .line 827
    .line 828
    move-result-object v1

    .line 829
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 830
    .line 831
    .line 832
    const-string v0, "additional_timeLimited_expiredSeconds_c"

    .line 833
    .line 834
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 835
    .line 836
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->timeLimited:Lcom/p1/mobile/putong/core/data/TimeLimited;

    .line 837
    .line 838
    iget-wide v1, v1, Lcom/p1/mobile/putong/core/data/TimeLimited;->expiredSeconds:J

    .line 839
    .line 840
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 841
    .line 842
    .line 843
    move-result-object v1

    .line 844
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Long;)V

    .line 845
    .line 846
    .line 847
    const-string v0, "suggestionScore_c"

    .line 848
    .line 849
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->suggestionScore:D

    .line 850
    .line 851
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 852
    .line 853
    .line 854
    move-result-object v1

    .line 855
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Double;)V

    .line 856
    .line 857
    .line 858
    const-string v0, "localBotherStatus_c"

    .line 859
    .line 860
    iget v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localBotherStatus:I

    .line 861
    .line 862
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 863
    .line 864
    .line 865
    move-result-object v1

    .line 866
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 867
    .line 868
    .line 869
    const-string v0, "muted_c"

    .line 870
    .line 871
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->muted:Z

    .line 872
    .line 873
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 874
    .line 875
    .line 876
    move-result-object v1

    .line 877
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 878
    .line 879
    .line 880
    const-string v0, "group_latestNotificationMsgId_c"

    .line 881
    .line 882
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->group:Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;

    .line 883
    .line 884
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;->latestNotificationMsgId:Ljava/lang/String;

    .line 885
    .line 886
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 887
    .line 888
    .line 889
    const-string v0, "group_joinedTime_c"

    .line 890
    .line 891
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->group:Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;

    .line 892
    .line 893
    iget-wide v1, v1, Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;->joinedTime:D

    .line 894
    .line 895
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 896
    .line 897
    .line 898
    move-result-object v1

    .line 899
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Double;)V

    .line 900
    .line 901
    .line 902
    const-string v0, "additional_oneSide_c"

    .line 903
    .line 904
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 905
    .line 906
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->oneSide:Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;

    .line 907
    .line 908
    if-nez v1, :cond_12

    .line 909
    .line 910
    move-object v1, p0

    .line 911
    goto :goto_12

    .line 912
    :cond_12
    sget-object v2, Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 913
    .line 914
    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 915
    .line 916
    .line 917
    move-result-object v1

    .line 918
    :goto_12
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 919
    .line 920
    .line 921
    const-string v0, "localDraft_c"

    .line 922
    .line 923
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localDraft:Ljava/lang/String;

    .line 924
    .line 925
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 926
    .line 927
    .line 928
    const-string v0, "localChatBg_c"

    .line 929
    .line 930
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localChatBg:Ljava/util/List;

    .line 931
    .line 932
    if-nez v1, :cond_13

    .line 933
    .line 934
    move-object v1, p0

    .line 935
    goto :goto_13

    .line 936
    :cond_13
    sget-object v1, Lcom/p1/mobile/putong/data/Picture;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 937
    .line 938
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 939
    .line 940
    .line 941
    move-result-object v1

    .line 942
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localChatBg:Ljava/util/List;

    .line 943
    .line 944
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 945
    .line 946
    .line 947
    move-result-object v1

    .line 948
    :goto_13
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 949
    .line 950
    .line 951
    const-string v0, "str_localPlaceBan_c"

    .line 952
    .line 953
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localPlaceBan:Lcom/p1/mobile/putong/core/data/LocalPlaceBan;

    .line 954
    .line 955
    if-nez v1, :cond_14

    .line 956
    .line 957
    move-object v1, p0

    .line 958
    goto :goto_14

    .line 959
    :cond_14
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 960
    .line 961
    .line 962
    move-result-object v1

    .line 963
    :goto_14
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 964
    .line 965
    .line 966
    const-string v0, "localPlaceBan_c"

    .line 967
    .line 968
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localPlaceBan:Lcom/p1/mobile/putong/core/data/LocalPlaceBan;

    .line 969
    .line 970
    if-nez v1, :cond_15

    .line 971
    .line 972
    move-object v1, p0

    .line 973
    goto :goto_15

    .line 974
    :cond_15
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 975
    .line 976
    .line 977
    move-result v1

    .line 978
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 979
    .line 980
    .line 981
    move-result-object v1

    .line 982
    :goto_15
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 983
    .line 984
    .line 985
    const-string v0, "additional_kankan_contents_c"

    .line 986
    .line 987
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 988
    .line 989
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->kankan:Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;

    .line 990
    .line 991
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;->contents:Ljava/util/List;

    .line 992
    .line 993
    if-nez v1, :cond_16

    .line 994
    .line 995
    move-object v1, p0

    .line 996
    goto :goto_16

    .line 997
    :cond_16
    sget-object v1, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContentIdWrapper;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 998
    .line 999
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1000
    .line 1001
    .line 1002
    move-result-object v1

    .line 1003
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1004
    .line 1005
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->kankan:Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;

    .line 1006
    .line 1007
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;->contents:Ljava/util/List;

    .line 1008
    .line 1009
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 1010
    .line 1011
    .line 1012
    move-result-object v1

    .line 1013
    :goto_16
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 1014
    .line 1015
    .line 1016
    const-string v0, "additional_kankan_resonance_c"

    .line 1017
    .line 1018
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1019
    .line 1020
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->kankan:Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;

    .line 1021
    .line 1022
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;->resonance:Ljava/lang/String;

    .line 1023
    .line 1024
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 1025
    .line 1026
    .line 1027
    const-string v0, "additional_kankan_greetingSummaryDetail_unseen_c"

    .line 1028
    .line 1029
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1030
    .line 1031
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->kankan:Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;

    .line 1032
    .line 1033
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;->greetingSummaryDetail:Lcom/p1/mobile/putong/core/data/GreetingSummary;

    .line 1034
    .line 1035
    iget v1, v1, Lcom/p1/mobile/putong/core/data/GreetingSummary;->unseen:I

    .line 1036
    .line 1037
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1038
    .line 1039
    .line 1040
    move-result-object v1

    .line 1041
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1042
    .line 1043
    .line 1044
    const-string v0, "additional_kankan_greetingSummaryDetail_latestTime_c"

    .line 1045
    .line 1046
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1047
    .line 1048
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->kankan:Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;

    .line 1049
    .line 1050
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;->greetingSummaryDetail:Lcom/p1/mobile/putong/core/data/GreetingSummary;

    .line 1051
    .line 1052
    iget-wide v1, v1, Lcom/p1/mobile/putong/core/data/GreetingSummary;->latestTime:D

    .line 1053
    .line 1054
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 1055
    .line 1056
    .line 1057
    move-result-object v1

    .line 1058
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Double;)V

    .line 1059
    .line 1060
    .line 1061
    const-string v0, "additional_kankan_greetingSummaryDetail_latestUserId_c"

    .line 1062
    .line 1063
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1064
    .line 1065
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->kankan:Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;

    .line 1066
    .line 1067
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;->greetingSummaryDetail:Lcom/p1/mobile/putong/core/data/GreetingSummary;

    .line 1068
    .line 1069
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/GreetingSummary;->latestUserId:Ljava/lang/String;

    .line 1070
    .line 1071
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 1072
    .line 1073
    .line 1074
    const-string v0, "additional_kankan_greetingSummaryDetail_latestMessageId_c"

    .line 1075
    .line 1076
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1077
    .line 1078
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->kankan:Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;

    .line 1079
    .line 1080
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;->greetingSummaryDetail:Lcom/p1/mobile/putong/core/data/GreetingSummary;

    .line 1081
    .line 1082
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/GreetingSummary;->latestMessageId:Ljava/lang/String;

    .line 1083
    .line 1084
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 1085
    .line 1086
    .line 1087
    const-string v0, "additional_quickChat_bell_isInitiator_c"

    .line 1088
    .line 1089
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1090
    .line 1091
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->quickChat:Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;

    .line 1092
    .line 1093
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->bell:Lcom/p1/mobile/putong/core/data/QuickChatBell;

    .line 1094
    .line 1095
    iget-boolean v1, v1, Lcom/p1/mobile/putong/core/data/QuickChatBell;->isInitiator:Z

    .line 1096
    .line 1097
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1098
    .line 1099
    .line 1100
    move-result-object v1

    .line 1101
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1102
    .line 1103
    .line 1104
    const-string v0, "additional_quickChat_bell_agree_c"

    .line 1105
    .line 1106
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1107
    .line 1108
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->quickChat:Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;

    .line 1109
    .line 1110
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->bell:Lcom/p1/mobile/putong/core/data/QuickChatBell;

    .line 1111
    .line 1112
    iget-boolean v1, v1, Lcom/p1/mobile/putong/core/data/QuickChatBell;->agree:Z

    .line 1113
    .line 1114
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1115
    .line 1116
    .line 1117
    move-result-object v1

    .line 1118
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1119
    .line 1120
    .line 1121
    const-string v0, "localMessageInsertReportHint_c"

    .line 1122
    .line 1123
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localMessageInsertReportHint:Ljava/lang/String;

    .line 1124
    .line 1125
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 1126
    .line 1127
    .line 1128
    const-string v0, "localNotifyMomentId_c"

    .line 1129
    .line 1130
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localNotifyMomentId:Ljava/lang/String;

    .line 1131
    .line 1132
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 1133
    .line 1134
    .line 1135
    const-string v0, "localInsertedMomentId_c"

    .line 1136
    .line 1137
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localInsertedMomentId:Ljava/lang/String;

    .line 1138
    .line 1139
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 1140
    .line 1141
    .line 1142
    const-string v0, "mm_c"

    .line 1143
    .line 1144
    iget v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->mm:I

    .line 1145
    .line 1146
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1147
    .line 1148
    .line 1149
    move-result-object v1

    .line 1150
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1151
    .line 1152
    .line 1153
    const-string v0, "additional_quickChat_expire_c"

    .line 1154
    .line 1155
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1156
    .line 1157
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->quickChat:Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;

    .line 1158
    .line 1159
    iget-wide v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->expire:D

    .line 1160
    .line 1161
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 1162
    .line 1163
    .line 1164
    move-result-object v1

    .line 1165
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Double;)V

    .line 1166
    .line 1167
    .line 1168
    const-string v0, "str_localBusinessTypes_c"

    .line 1169
    .line 1170
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localBusinessTypes:Ljava/util/List;

    .line 1171
    .line 1172
    if-nez v1, :cond_17

    .line 1173
    .line 1174
    move-object v1, p0

    .line 1175
    goto :goto_17

    .line 1176
    :cond_17
    sget-object v1, Lcom/p1/mobile/putong/core/data/LocalBusinessType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 1177
    .line 1178
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1179
    .line 1180
    .line 1181
    move-result-object v1

    .line 1182
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localBusinessTypes:Ljava/util/List;

    .line 1183
    .line 1184
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 1185
    .line 1186
    .line 1187
    move-result-object v1

    .line 1188
    :goto_17
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 1189
    .line 1190
    .line 1191
    const-string v0, "intimacy_c"

    .line 1192
    .line 1193
    iget v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->intimacy:I

    .line 1194
    .line 1195
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1196
    .line 1197
    .line 1198
    move-result-object v1

    .line 1199
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1200
    .line 1201
    .line 1202
    const-string v0, "quickChatProgress_c"

    .line 1203
    .line 1204
    iget v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->quickChatProgress:I

    .line 1205
    .line 1206
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1207
    .line 1208
    .line 1209
    move-result-object v1

    .line 1210
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1211
    .line 1212
    .line 1213
    const-string v0, "group_source_c"

    .line 1214
    .line 1215
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->group:Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;

    .line 1216
    .line 1217
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationGroupProperty;->source:Ljava/lang/String;

    .line 1218
    .line 1219
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 1220
    .line 1221
    .line 1222
    const-string v0, "additional_quickChat_progress_c"

    .line 1223
    .line 1224
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1225
    .line 1226
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->quickChat:Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;

    .line 1227
    .line 1228
    iget v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->progress:I

    .line 1229
    .line 1230
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1231
    .line 1232
    .line 1233
    move-result-object v1

    .line 1234
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1235
    .line 1236
    .line 1237
    const-string v0, "additional_feedStateCounter_c"

    .line 1238
    .line 1239
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1240
    .line 1241
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->feedStateCounter:Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;

    .line 1242
    .line 1243
    if-nez v1, :cond_18

    .line 1244
    .line 1245
    move-object v1, p0

    .line 1246
    goto :goto_18

    .line 1247
    :cond_18
    sget-object v2, Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1248
    .line 1249
    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 1250
    .line 1251
    .line 1252
    move-result-object v1

    .line 1253
    :goto_18
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 1254
    .line 1255
    .line 1256
    const-string v0, "additional_suggestedTimeLimitedMatch_c"

    .line 1257
    .line 1258
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1259
    .line 1260
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->suggestedTimeLimitedMatch:Lcom/p1/mobile/putong/core/data/SuggestedTimeLimitedMatch;

    .line 1261
    .line 1262
    if-nez v1, :cond_19

    .line 1263
    .line 1264
    move-object v1, p0

    .line 1265
    goto :goto_19

    .line 1266
    :cond_19
    sget-object v2, Lcom/p1/mobile/putong/core/data/SuggestedTimeLimitedMatch;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1267
    .line 1268
    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 1269
    .line 1270
    .line 1271
    move-result-object v1

    .line 1272
    :goto_19
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 1273
    .line 1274
    .line 1275
    const-string v0, "additional_kankan_greetingSummaryDetail_iconURL_c"

    .line 1276
    .line 1277
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1278
    .line 1279
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->kankan:Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;

    .line 1280
    .line 1281
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;->greetingSummaryDetail:Lcom/p1/mobile/putong/core/data/GreetingSummary;

    .line 1282
    .line 1283
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/GreetingSummary;->iconURL:Ljava/lang/String;

    .line 1284
    .line 1285
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 1286
    .line 1287
    .line 1288
    const-string v0, "additional_kankan_greetingSummaryDetail_title_c"

    .line 1289
    .line 1290
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1291
    .line 1292
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->kankan:Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;

    .line 1293
    .line 1294
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;->greetingSummaryDetail:Lcom/p1/mobile/putong/core/data/GreetingSummary;

    .line 1295
    .line 1296
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/GreetingSummary;->title:Ljava/lang/String;

    .line 1297
    .line 1298
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 1299
    .line 1300
    .line 1301
    const-string v0, "additional_kankan_greetingSummaryDetail_subtitle_c"

    .line 1302
    .line 1303
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1304
    .line 1305
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->kankan:Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;

    .line 1306
    .line 1307
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;->greetingSummaryDetail:Lcom/p1/mobile/putong/core/data/GreetingSummary;

    .line 1308
    .line 1309
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/GreetingSummary;->subtitle:Ljava/lang/String;

    .line 1310
    .line 1311
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 1312
    .line 1313
    .line 1314
    const-string v0, "additional_heartbeatMatch_c"

    .line 1315
    .line 1316
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1317
    .line 1318
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    .line 1319
    .line 1320
    if-nez v1, :cond_1a

    .line 1321
    .line 1322
    move-object v1, p0

    .line 1323
    goto :goto_1a

    .line 1324
    :cond_1a
    sget-object v2, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1325
    .line 1326
    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 1327
    .line 1328
    .line 1329
    move-result-object v1

    .line 1330
    :goto_1a
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 1331
    .line 1332
    .line 1333
    const-string v0, "hasLocalBreakIce_c"

    .line 1334
    .line 1335
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->hasLocalBreakIce:Z

    .line 1336
    .line 1337
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1338
    .line 1339
    .line 1340
    move-result-object v1

    .line 1341
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1342
    .line 1343
    .line 1344
    const-string v0, "additional_avatarSummary_c"

    .line 1345
    .line 1346
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1347
    .line 1348
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->avatarSummary:Lcom/p1/mobile/putong/core/data/AvatarSummaryCounter;

    .line 1349
    .line 1350
    if-nez v1, :cond_1b

    .line 1351
    .line 1352
    move-object v1, p0

    .line 1353
    goto :goto_1b

    .line 1354
    :cond_1b
    sget-object v2, Lcom/p1/mobile/putong/core/data/AvatarSummaryCounter;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1355
    .line 1356
    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 1357
    .line 1358
    .line 1359
    move-result-object v1

    .line 1360
    :goto_1b
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 1361
    .line 1362
    .line 1363
    const-string v0, "additional_feedInteractionCounter_c"

    .line 1364
    .line 1365
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1366
    .line 1367
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->feedInteractionCounter:Lcom/p1/mobile/putong/core/data/CoreInteractionMessageCounter;

    .line 1368
    .line 1369
    if-nez v1, :cond_1c

    .line 1370
    .line 1371
    move-object v1, p0

    .line 1372
    goto :goto_1c

    .line 1373
    :cond_1c
    sget-object v2, Lcom/p1/mobile/putong/core/data/CoreInteractionMessageCounter;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1374
    .line 1375
    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 1376
    .line 1377
    .line 1378
    move-result-object v1

    .line 1379
    :goto_1c
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 1380
    .line 1381
    .line 1382
    const-string v0, "localSpoofingNewTime_c"

    .line 1383
    .line 1384
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localSpoofingNewTime:D

    .line 1385
    .line 1386
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 1387
    .line 1388
    .line 1389
    move-result-object v1

    .line 1390
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Double;)V

    .line 1391
    .line 1392
    .line 1393
    const-string v0, "additional_liveVirtualVoice_c"

    .line 1394
    .line 1395
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1396
    .line 1397
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->liveVirtualVoice:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

    .line 1398
    .line 1399
    if-nez v1, :cond_1d

    .line 1400
    .line 1401
    move-object v1, p0

    .line 1402
    goto :goto_1d

    .line 1403
    :cond_1d
    sget-object v2, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1404
    .line 1405
    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 1406
    .line 1407
    .line 1408
    move-result-object v1

    .line 1409
    :goto_1d
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 1410
    .line 1411
    .line 1412
    const-string v0, "clearedTime_c"

    .line 1413
    .line 1414
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->clearedTime:D

    .line 1415
    .line 1416
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 1417
    .line 1418
    .line 1419
    move-result-object v1

    .line 1420
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Double;)V

    .line 1421
    .line 1422
    .line 1423
    const-string v0, "additional_localMomentInfo_c"

    .line 1424
    .line 1425
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1426
    .line 1427
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->localMomentInfo:Lcom/p1/mobile/putong/core/data/ConversationMomentInfo;

    .line 1428
    .line 1429
    if-nez v1, :cond_1e

    .line 1430
    .line 1431
    move-object v1, p0

    .line 1432
    goto :goto_1e

    .line 1433
    :cond_1e
    sget-object v2, Lcom/p1/mobile/putong/core/data/ConversationMomentInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1434
    .line 1435
    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 1436
    .line 1437
    .line 1438
    move-result-object v1

    .line 1439
    :goto_1e
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 1440
    .line 1441
    .line 1442
    const-string v0, "localExtraInfo_c"

    .line 1443
    .line 1444
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localExtraInfo:Ljava/lang/String;

    .line 1445
    .line 1446
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 1447
    .line 1448
    .line 1449
    const-string v0, "lastActivityTime_c"

    .line 1450
    .line 1451
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->lastActivityTime:D

    .line 1452
    .line 1453
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 1454
    .line 1455
    .line 1456
    move-result-object v1

    .line 1457
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Double;)V

    .line 1458
    .line 1459
    .line 1460
    const-string v0, "additional_liveActivity_c"

    .line 1461
    .line 1462
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1463
    .line 1464
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->liveActivity:Lcom/p1/mobile/putong/data/LiveActivityConversation;

    .line 1465
    .line 1466
    if-nez v1, :cond_1f

    .line 1467
    .line 1468
    move-object v1, p0

    .line 1469
    goto :goto_1f

    .line 1470
    :cond_1f
    sget-object v2, Lcom/p1/mobile/putong/data/LiveActivityConversation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1471
    .line 1472
    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 1473
    .line 1474
    .line 1475
    move-result-object v1

    .line 1476
    :goto_1f
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 1477
    .line 1478
    .line 1479
    const-string v0, "additional_game_c"

    .line 1480
    .line 1481
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1482
    .line 1483
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->game:Lcom/p1/mobile/putong/core/data/ConversationGame;

    .line 1484
    .line 1485
    if-nez v1, :cond_20

    .line 1486
    .line 1487
    move-object v1, p0

    .line 1488
    goto :goto_20

    .line 1489
    :cond_20
    sget-object v2, Lcom/p1/mobile/putong/core/data/ConversationGame;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1490
    .line 1491
    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 1492
    .line 1493
    .line 1494
    move-result-object v1

    .line 1495
    :goto_20
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 1496
    .line 1497
    .line 1498
    const-string v0, "additional_tag_c"

    .line 1499
    .line 1500
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1501
    .line 1502
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->tag:Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;

    .line 1503
    .line 1504
    if-nez v1, :cond_21

    .line 1505
    .line 1506
    move-object v1, p0

    .line 1507
    goto :goto_21

    .line 1508
    :cond_21
    sget-object v2, Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1509
    .line 1510
    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 1511
    .line 1512
    .line 1513
    move-result-object v1

    .line 1514
    :goto_21
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 1515
    .line 1516
    .line 1517
    const-string v0, "additional_chatAssistantQuestion_c"

    .line 1518
    .line 1519
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1520
    .line 1521
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->chatAssistantQuestion:Lcom/p1/mobile/putong/core/data/ConversationAdditionalChatAssistantQuestion;

    .line 1522
    .line 1523
    if-nez v1, :cond_22

    .line 1524
    .line 1525
    move-object v1, p0

    .line 1526
    goto :goto_22

    .line 1527
    :cond_22
    sget-object v2, Lcom/p1/mobile/putong/core/data/ConversationAdditionalChatAssistantQuestion;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1528
    .line 1529
    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 1530
    .line 1531
    .line 1532
    move-result-object v1

    .line 1533
    :goto_22
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 1534
    .line 1535
    .line 1536
    const-string v0, "additional_quickChat_guideFakeToGood_c"

    .line 1537
    .line 1538
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1539
    .line 1540
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->quickChat:Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;

    .line 1541
    .line 1542
    iget-boolean v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->guideFakeToGood:Z

    .line 1543
    .line 1544
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1545
    .line 1546
    .line 1547
    move-result-object v1

    .line 1548
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1549
    .line 1550
    .line 1551
    const-string v0, "otherStatus_c"

    .line 1552
    .line 1553
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->otherStatus:Ljava/lang/String;

    .line 1554
    .line 1555
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 1556
    .line 1557
    .line 1558
    const-string v0, "additional_continuousChat_c"

    .line 1559
    .line 1560
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1561
    .line 1562
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->continuousChat:Lcom/p1/mobile/putong/core/data/ContinuousChat;

    .line 1563
    .line 1564
    if-nez v1, :cond_23

    .line 1565
    .line 1566
    move-object v1, p0

    .line 1567
    goto :goto_23

    .line 1568
    :cond_23
    sget-object v2, Lcom/p1/mobile/putong/core/data/ContinuousChat;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1569
    .line 1570
    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 1571
    .line 1572
    .line 1573
    move-result-object v1

    .line 1574
    :goto_23
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 1575
    .line 1576
    .line 1577
    const-string v0, "additional_pinChat_c"

    .line 1578
    .line 1579
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1580
    .line 1581
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->pinChat:Lcom/p1/mobile/putong/core/data/PlatinumPinChat;

    .line 1582
    .line 1583
    if-nez v1, :cond_24

    .line 1584
    .line 1585
    move-object v1, p0

    .line 1586
    goto :goto_24

    .line 1587
    :cond_24
    sget-object v2, Lcom/p1/mobile/putong/core/data/PlatinumPinChat;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1588
    .line 1589
    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 1590
    .line 1591
    .line 1592
    move-result-object v1

    .line 1593
    :goto_24
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 1594
    .line 1595
    .line 1596
    const-string v0, "additional_reSwipe_c"

    .line 1597
    .line 1598
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1599
    .line 1600
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->reSwipe:Lcom/p1/mobile/putong/core/data/ReSwipeInfo;

    .line 1601
    .line 1602
    if-nez v1, :cond_25

    .line 1603
    .line 1604
    move-object v1, p0

    .line 1605
    goto :goto_25

    .line 1606
    :cond_25
    sget-object v2, Lcom/p1/mobile/putong/core/data/ReSwipeInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1607
    .line 1608
    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 1609
    .line 1610
    .line 1611
    move-result-object v1

    .line 1612
    :goto_25
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 1613
    .line 1614
    .line 1615
    const-string v0, "additional_blindbox_c"

    .line 1616
    .line 1617
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1618
    .line 1619
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->blindbox:Lcom/p1/mobile/putong/core/data/GrowthConversationBlindBox;

    .line 1620
    .line 1621
    if-nez v1, :cond_26

    .line 1622
    .line 1623
    move-object v1, p0

    .line 1624
    goto :goto_26

    .line 1625
    :cond_26
    sget-object v2, Lcom/p1/mobile/putong/core/data/GrowthConversationBlindBox;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1626
    .line 1627
    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 1628
    .line 1629
    .line 1630
    move-result-object v1

    .line 1631
    :goto_26
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 1632
    .line 1633
    .line 1634
    const-string v0, "additional_previewTexts_c"

    .line 1635
    .line 1636
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1637
    .line 1638
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->previewTexts:Ljava/util/List;

    .line 1639
    .line 1640
    if-nez v1, :cond_27

    .line 1641
    .line 1642
    move-object v1, p0

    .line 1643
    goto :goto_27

    .line 1644
    :cond_27
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1645
    .line 1646
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1647
    .line 1648
    .line 1649
    move-result-object v1

    .line 1650
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1651
    .line 1652
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->previewTexts:Ljava/util/List;

    .line 1653
    .line 1654
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 1655
    .line 1656
    .line 1657
    move-result-object v1

    .line 1658
    :goto_27
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 1659
    .line 1660
    .line 1661
    const-string v0, "additional_greetingInfo_c"

    .line 1662
    .line 1663
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1664
    .line 1665
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->greetingInfo:Lcom/p1/mobile/putong/core/data/GreetingInfo;

    .line 1666
    .line 1667
    if-nez v1, :cond_28

    .line 1668
    .line 1669
    move-object v1, p0

    .line 1670
    goto :goto_28

    .line 1671
    :cond_28
    sget-object v2, Lcom/p1/mobile/putong/core/data/GreetingInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1672
    .line 1673
    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 1674
    .line 1675
    .line 1676
    move-result-object v1

    .line 1677
    :goto_28
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 1678
    .line 1679
    .line 1680
    const-string v0, "additional_fateRadar_c"

    .line 1681
    .line 1682
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1683
    .line 1684
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->fateRadar:Lcom/p1/mobile/putong/core/data/ConversationAdditionalFateRadar;

    .line 1685
    .line 1686
    if-nez v1, :cond_29

    .line 1687
    .line 1688
    move-object v1, p0

    .line 1689
    goto :goto_29

    .line 1690
    :cond_29
    sget-object v2, Lcom/p1/mobile/putong/core/data/ConversationAdditionalFateRadar;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1691
    .line 1692
    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 1693
    .line 1694
    .line 1695
    move-result-object v1

    .line 1696
    :goto_29
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 1697
    .line 1698
    .line 1699
    const-string v0, "isFake_c"

    .line 1700
    .line 1701
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->isFake:Z

    .line 1702
    .line 1703
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1704
    .line 1705
    .line 1706
    move-result-object v1

    .line 1707
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1708
    .line 1709
    .line 1710
    const-string v0, "additional_lowPayOneside_c"

    .line 1711
    .line 1712
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1713
    .line 1714
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->lowPayOneside:Lcom/p1/mobile/putong/core/data/LowPayOneside;

    .line 1715
    .line 1716
    if-nez v1, :cond_2a

    .line 1717
    .line 1718
    move-object v1, p0

    .line 1719
    goto :goto_2a

    .line 1720
    :cond_2a
    sget-object v2, Lcom/p1/mobile/putong/core/data/LowPayOneside;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1721
    .line 1722
    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 1723
    .line 1724
    .line 1725
    move-result-object v1

    .line 1726
    :goto_2a
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 1727
    .line 1728
    .line 1729
    const-string v0, "additional_matchInfo_c"

    .line 1730
    .line 1731
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1732
    .line 1733
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->matchInfo:Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;

    .line 1734
    .line 1735
    if-nez v1, :cond_2b

    .line 1736
    .line 1737
    move-object v1, p0

    .line 1738
    goto :goto_2b

    .line 1739
    :cond_2b
    sget-object v2, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1740
    .line 1741
    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 1742
    .line 1743
    .line 1744
    move-result-object v1

    .line 1745
    :goto_2b
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 1746
    .line 1747
    .line 1748
    const-string v0, "additional_newMatch_labelExposureTime_c"

    .line 1749
    .line 1750
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1751
    .line 1752
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->newMatch:Lcom/p1/mobile/putong/core/data/ExposureNewMatch;

    .line 1753
    .line 1754
    iget-wide v1, v1, Lcom/p1/mobile/putong/core/data/ExposureNewMatch;->labelExposureTime:D

    .line 1755
    .line 1756
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 1757
    .line 1758
    .line 1759
    move-result-object v1

    .line 1760
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Double;)V

    .line 1761
    .line 1762
    .line 1763
    const-string v0, "additional_loveLetter_c"

    .line 1764
    .line 1765
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1766
    .line 1767
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->loveLetter:Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;

    .line 1768
    .line 1769
    if-nez v1, :cond_2c

    .line 1770
    .line 1771
    move-object v1, p0

    .line 1772
    goto :goto_2c

    .line 1773
    :cond_2c
    sget-object v2, Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1774
    .line 1775
    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 1776
    .line 1777
    .line 1778
    move-result-object v1

    .line 1779
    :goto_2c
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 1780
    .line 1781
    .line 1782
    const-string v0, "localIsLimitedTrialSee_c"

    .line 1783
    .line 1784
    iget v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->localIsLimitedTrialSee:I

    .line 1785
    .line 1786
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1787
    .line 1788
    .line 1789
    move-result-object v1

    .line 1790
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1791
    .line 1792
    .line 1793
    const-string v0, "additional_chatMM_c"

    .line 1794
    .line 1795
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1796
    .line 1797
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->chatMM:Lcom/p1/mobile/putong/core/data/ChatMM;

    .line 1798
    .line 1799
    if-nez v1, :cond_2d

    .line 1800
    .line 1801
    move-object v1, p0

    .line 1802
    goto :goto_2d

    .line 1803
    :cond_2d
    sget-object v2, Lcom/p1/mobile/putong/core/data/ChatMM;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1804
    .line 1805
    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 1806
    .line 1807
    .line 1808
    move-result-object v1

    .line 1809
    :goto_2d
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 1810
    .line 1811
    .line 1812
    const-string v0, "additional_blackList_c"

    .line 1813
    .line 1814
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1815
    .line 1816
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->blackList:Lcom/p1/mobile/putong/core/data/BlackList;

    .line 1817
    .line 1818
    if-nez v1, :cond_2e

    .line 1819
    .line 1820
    move-object v1, p0

    .line 1821
    goto :goto_2e

    .line 1822
    :cond_2e
    sget-object v2, Lcom/p1/mobile/putong/core/data/BlackList;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1823
    .line 1824
    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 1825
    .line 1826
    .line 1827
    move-result-object v1

    .line 1828
    :goto_2e
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 1829
    .line 1830
    .line 1831
    const-string v0, "additional_messageRelate_c"

    .line 1832
    .line 1833
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1834
    .line 1835
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->messageRelate:Lcom/p1/mobile/putong/core/data/MessageRelate;

    .line 1836
    .line 1837
    if-nez v1, :cond_2f

    .line 1838
    .line 1839
    move-object v1, p0

    .line 1840
    goto :goto_2f

    .line 1841
    :cond_2f
    sget-object v2, Lcom/p1/mobile/putong/core/data/MessageRelate;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1842
    .line 1843
    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 1844
    .line 1845
    .line 1846
    move-result-object v1

    .line 1847
    :goto_2f
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 1848
    .line 1849
    .line 1850
    const-string v0, "additional_compliment_c"

    .line 1851
    .line 1852
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1853
    .line 1854
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->compliment:Lcom/p1/mobile/putong/core/data/ConvAdditionalCompliment;

    .line 1855
    .line 1856
    if-nez v1, :cond_30

    .line 1857
    .line 1858
    move-object v1, p0

    .line 1859
    goto :goto_30

    .line 1860
    :cond_30
    sget-object v2, Lcom/p1/mobile/putong/core/data/ConvAdditionalCompliment;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1861
    .line 1862
    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 1863
    .line 1864
    .line 1865
    move-result-object v1

    .line 1866
    :goto_30
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 1867
    .line 1868
    .line 1869
    const-string v0, "additional_swiper_c"

    .line 1870
    .line 1871
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1872
    .line 1873
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->swiper:Lcom/p1/mobile/putong/core/data/ConvAdditionalSwiper;

    .line 1874
    .line 1875
    if-nez p1, :cond_31

    .line 1876
    .line 1877
    move-object p1, p0

    .line 1878
    goto :goto_31

    .line 1879
    :cond_31
    sget-object v1, Lcom/p1/mobile/putong/core/data/ConvAdditionalSwiper;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1880
    .line 1881
    invoke-virtual {v1, p1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 1882
    .line 1883
    .line 1884
    move-result-object p1

    .line 1885
    :goto_31
    invoke-static {p2, v0, p1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1886
    .line 1887
    .line 1888
    return-void

    .line 1889
    :catch_0
    move-exception p1

    .line 1890
    invoke-static {p1, p0}, Lcom/google/protobuf/nano/MessageNano;->reportError(Ljava/lang/Exception;Landroid/database/Cursor;)V

    .line 1891
    .line 1892
    .line 1893
    return-void
.end method

.method public bridge synthetic write(Ljava/lang/Object;Landroid/content/ContentValues;)V
    .locals 0

    .line 1894
    check-cast p1, Lcom/p1/mobile/putong/core/data/Conversation;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/Conversation$129;->write(Lcom/p1/mobile/putong/core/data/Conversation;Landroid/content/ContentValues;)V

    return-void
.end method
