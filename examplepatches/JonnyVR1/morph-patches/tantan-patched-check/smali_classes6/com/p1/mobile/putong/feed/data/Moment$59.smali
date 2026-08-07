.class Lcom/p1/mobile/putong/feed/data/Moment$59;
.super Ll/vzf0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/data/Moment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/vzf0<",
        "Lcom/p1/mobile/putong/feed/data/Moment;",
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
    const-string p1, " (_id INTEGER PRIMARY KEY,id_c TEXT,localCreatedSession_c INTEGER,localInFeed_c INTEGER,localInUserFeed_c INTEGER,value_c TEXT,createdTime_c REAL,owner_c TEXT,likes_count_c INTEGER,likes_ids_c BLOB,likes_links_previous_c TEXT,likes_links_next_c TEXT,haveLiked_c INTEGER,location_c BLOB,media_c BLOB,landingPage_c TEXT,messages_count_c INTEGER,messages_ids_c BLOB,messages_links_previous_c TEXT,messages_links_next_c TEXT,settings_visibility_c INTEGER,settings_muted_c INTEGER,dynamicType_c INTEGER,musicId_c TEXT,status_c TEXT,momentType_c INTEGER,topics_c BLOB,settings_userSetVisibility_c INTEGER,settings_anonymous_c INTEGER,hyperlink_c TEXT,str_settings_visibility_c TEXT,str_dynamicType_c TEXT,str_momentType_c TEXT,str_settings_userSetVisibility_c TEXT,userSetVisibility_c INTEGER,str_userSetVisibility_c TEXT,simpleActivity_id_c TEXT,simpleActivity_name_c TEXT,additionalData_sendFrom_id_c TEXT,additionalData_sendFrom_name_c TEXT,additionalData_sendFrom_sourceType_c TEXT,group_id_c TEXT,group_name_c TEXT,group_lastJoined_c INTEGER,additionalData_share_title_c TEXT,additionalData_share_description_c TEXT,additionalData_share_url_c TEXT,additionalData_share_landingPage_c TEXT,additionalData_share_name_c TEXT,additionalData_share_shareFrom_c TEXT,additionalData_share_testId_c TEXT,deeplink_c TEXT,thirdShareSource_sourceId_c TEXT,thirdShareSource_sourceType_c TEXT,attitudeId_c INTEGER,attitudes_count_c INTEGER,shareMyVote_c INTEGER,simpleActivity_url_c TEXT,allowForward_c TEXT,forwards_count_c INTEGER,isNewUserAIMoment_c INTEGER)"

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
    const-class p0, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    return-object p0
.end method

.method public init()Lcom/p1/mobile/putong/feed/data/Moment;
    .locals 2

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/data/Moment;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 7
    .line 8
    const-string v1, ""

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 15
    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 19
    .line 20
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 21
    .line 22
    if-nez v0, :cond_2

    .line 23
    .line 24
    invoke-static {}, Lcom/p1/mobile/putong/data/PartialIdList;->new_()Lcom/p1/mobile/putong/data/PartialIdList;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 29
    .line 30
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 31
    .line 32
    if-nez v0, :cond_3

    .line 33
    .line 34
    new-instance v0, Ljava/util/ArrayList;

    .line 35
    .line 36
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 37
    .line 38
    .line 39
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 40
    .line 41
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->landingPage:Ljava/lang/String;

    .line 42
    .line 43
    if-nez v0, :cond_4

    .line 44
    .line 45
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->landingPage:Ljava/lang/String;

    .line 46
    .line 47
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 48
    .line 49
    if-nez v0, :cond_5

    .line 50
    .line 51
    invoke-static {}, Lcom/p1/mobile/putong/data/PartialIdList;->new_()Lcom/p1/mobile/putong/data/PartialIdList;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 56
    .line 57
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->settings:Lcom/p1/mobile/putong/feed/data/MomentSettings;

    .line 58
    .line 59
    if-nez v0, :cond_6

    .line 60
    .line 61
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/MomentSettings;->new_()Lcom/p1/mobile/putong/feed/data/MomentSettings;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->settings:Lcom/p1/mobile/putong/feed/data/MomentSettings;

    .line 66
    .line 67
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->musicId:Ljava/lang/String;

    .line 68
    .line 69
    if-nez v0, :cond_7

    .line 70
    .line 71
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->musicId:Ljava/lang/String;

    .line 72
    .line 73
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->status:Ljava/lang/String;

    .line 74
    .line 75
    if-nez v0, :cond_8

    .line 76
    .line 77
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->status:Ljava/lang/String;

    .line 78
    .line 79
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->topics:Ljava/util/List;

    .line 80
    .line 81
    if-nez v0, :cond_9

    .line 82
    .line 83
    new-instance v0, Ljava/util/ArrayList;

    .line 84
    .line 85
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 86
    .line 87
    .line 88
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->topics:Ljava/util/List;

    .line 89
    .line 90
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 91
    .line 92
    if-nez v0, :cond_a

    .line 93
    .line 94
    invoke-static {}, Lcom/p1/mobile/putong/data/Live;->new_()Lcom/p1/mobile/putong/data/Live;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 99
    .line 100
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->voiceLive:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 101
    .line 102
    if-nez v0, :cond_b

    .line 103
    .line 104
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/VoiceLive;->new_()Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->voiceLive:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 109
    .line 110
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->liveState:Ljava/lang/String;

    .line 111
    .line 112
    if-nez v0, :cond_c

    .line 113
    .line 114
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->liveState:Ljava/lang/String;

    .line 115
    .line 116
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->iconTitle:Ljava/lang/String;

    .line 117
    .line 118
    if-nez v0, :cond_d

    .line 119
    .line 120
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->iconTitle:Ljava/lang/String;

    .line 121
    .line 122
    :cond_d
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->labels:Ljava/util/List;

    .line 123
    .line 124
    if-nez v0, :cond_e

    .line 125
    .line 126
    new-instance v0, Ljava/util/ArrayList;

    .line 127
    .line 128
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 129
    .line 130
    .line 131
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->labels:Ljava/util/List;

    .line 132
    .line 133
    :cond_e
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->hyperlink:Ljava/lang/String;

    .line 134
    .line 135
    if-nez v0, :cond_f

    .line 136
    .line 137
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->hyperlink:Ljava/lang/String;

    .line 138
    .line 139
    :cond_f
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->simpleActivity:Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;

    .line 140
    .line 141
    if-nez v0, :cond_10

    .line 142
    .line 143
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;->new_()Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->simpleActivity:Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;

    .line 148
    .line 149
    :cond_10
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->additionalData:Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;

    .line 150
    .line 151
    if-nez v0, :cond_11

    .line 152
    .line 153
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;->new_()Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->additionalData:Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;

    .line 158
    .line 159
    :cond_11
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->group:Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 160
    .line 161
    if-nez v0, :cond_12

    .line 162
    .line 163
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/GroupIdBox;->new_()Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->group:Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 168
    .line 169
    :cond_12
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->deeplink:Ljava/lang/String;

    .line 170
    .line 171
    if-nez v0, :cond_13

    .line 172
    .line 173
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->deeplink:Ljava/lang/String;

    .line 174
    .line 175
    :cond_13
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->thirdShareSource:Lcom/p1/mobile/putong/feed/data/ThirdShareSource;

    .line 176
    .line 177
    if-nez v0, :cond_14

    .line 178
    .line 179
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/ThirdShareSource;->new_()Lcom/p1/mobile/putong/feed/data/ThirdShareSource;

    .line 180
    .line 181
    .line 182
    move-result-object v0

    .line 183
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->thirdShareSource:Lcom/p1/mobile/putong/feed/data/ThirdShareSource;

    .line 184
    .line 185
    :cond_14
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->attitudes:Lcom/p1/mobile/putong/feed/data/Attitudes;

    .line 186
    .line 187
    if-nez v0, :cond_15

    .line 188
    .line 189
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/Attitudes;->new_()Lcom/p1/mobile/putong/feed/data/Attitudes;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->attitudes:Lcom/p1/mobile/putong/feed/data/Attitudes;

    .line 194
    .line 195
    :cond_15
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->allowForward:Lcom/p1/mobile/putong/feed/data/MomentAllowForwardState;

    .line 196
    .line 197
    if-nez v0, :cond_16

    .line 198
    .line 199
    sget-object v0, Lcom/p1/mobile/putong/feed/data/MomentAllowForwardState;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 200
    .line 201
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 202
    .line 203
    .line 204
    move-result-object v0

    .line 205
    check-cast v0, Lcom/p1/mobile/putong/feed/data/MomentAllowForwardState;

    .line 206
    .line 207
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->allowForward:Lcom/p1/mobile/putong/feed/data/MomentAllowForwardState;

    .line 208
    .line 209
    :cond_16
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->forwards:Lcom/p1/mobile/putong/feed/data/MomentForwards;

    .line 210
    .line 211
    if-nez v0, :cond_17

    .line 212
    .line 213
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/MomentForwards;->new_()Lcom/p1/mobile/putong/feed/data/MomentForwards;

    .line 214
    .line 215
    .line 216
    move-result-object v0

    .line 217
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->forwards:Lcom/p1/mobile/putong/feed/data/MomentForwards;

    .line 218
    .line 219
    :cond_17
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->momentViewer:Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 220
    .line 221
    if-nez v0, :cond_18

    .line 222
    .line 223
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/MomentViewerBox;->new_()Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 224
    .line 225
    .line 226
    move-result-object v0

    .line 227
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->momentViewer:Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 228
    .line 229
    :cond_18
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->notifyUsers:Ljava/util/List;

    .line 230
    .line 231
    if-nez v0, :cond_19

    .line 232
    .line 233
    new-instance v0, Ljava/util/ArrayList;

    .line 234
    .line 235
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 236
    .line 237
    .line 238
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->notifyUsers:Ljava/util/List;

    .line 239
    .line 240
    :cond_19
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->report:Ljava/lang/String;

    .line 241
    .line 242
    if-nez v0, :cond_1a

    .line 243
    .line 244
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->report:Ljava/lang/String;

    .line 245
    .line 246
    :cond_1a
    return-object p0
.end method

.method public bridge synthetic init()Ljava/lang/Object;
    .locals 0

    .line 247
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/Moment$59;->init()Lcom/p1/mobile/putong/feed/data/Moment;

    move-result-object p0

    return-object p0
.end method

.method public read(Landroid/database/Cursor;I)Lcom/p1/mobile/putong/feed/data/Moment;
    .locals 19

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
    new-instance v4, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 13
    .line 14
    invoke-direct {v4}, Lcom/p1/mobile/putong/feed/data/Moment;-><init>()V

    .line 15
    .line 16
    .line 17
    const/4 v5, -0x1

    .line 18
    :try_start_0
    new-instance v6, Lcom/p1/mobile/putong/data/PartialIdList;

    .line 19
    .line 20
    invoke-direct {v6}, Lcom/p1/mobile/putong/data/PartialIdList;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v6, v4, Lcom/p1/mobile/putong/feed/data/Moment;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 24
    .line 25
    new-instance v6, Lcom/p1/mobile/putong/data/PartialIdList;

    .line 26
    .line 27
    invoke-direct {v6}, Lcom/p1/mobile/putong/data/PartialIdList;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v6, v4, Lcom/p1/mobile/putong/feed/data/Moment;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 31
    .line 32
    new-instance v6, Lcom/p1/mobile/putong/feed/data/MomentSettings;

    .line 33
    .line 34
    invoke-direct {v6}, Lcom/p1/mobile/putong/feed/data/MomentSettings;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object v6, v4, Lcom/p1/mobile/putong/feed/data/Moment;->settings:Lcom/p1/mobile/putong/feed/data/MomentSettings;

    .line 38
    .line 39
    new-instance v6, Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;

    .line 40
    .line 41
    invoke-direct {v6}, Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object v6, v4, Lcom/p1/mobile/putong/feed/data/Moment;->simpleActivity:Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;

    .line 45
    .line 46
    new-instance v6, Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;

    .line 47
    .line 48
    invoke-direct {v6}, Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;-><init>()V

    .line 49
    .line 50
    .line 51
    iput-object v6, v4, Lcom/p1/mobile/putong/feed/data/Moment;->additionalData:Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;

    .line 52
    .line 53
    new-instance v6, Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 54
    .line 55
    invoke-direct {v6}, Lcom/p1/mobile/putong/feed/data/GroupIdBox;-><init>()V

    .line 56
    .line 57
    .line 58
    iput-object v6, v4, Lcom/p1/mobile/putong/feed/data/Moment;->group:Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 59
    .line 60
    new-instance v6, Lcom/p1/mobile/putong/feed/data/ThirdShareSource;

    .line 61
    .line 62
    invoke-direct {v6}, Lcom/p1/mobile/putong/feed/data/ThirdShareSource;-><init>()V

    .line 63
    .line 64
    .line 65
    iput-object v6, v4, Lcom/p1/mobile/putong/feed/data/Moment;->thirdShareSource:Lcom/p1/mobile/putong/feed/data/ThirdShareSource;

    .line 66
    .line 67
    new-instance v6, Lcom/p1/mobile/putong/feed/data/Attitudes;

    .line 68
    .line 69
    invoke-direct {v6}, Lcom/p1/mobile/putong/feed/data/Attitudes;-><init>()V

    .line 70
    .line 71
    .line 72
    iput-object v6, v4, Lcom/p1/mobile/putong/feed/data/Moment;->attitudes:Lcom/p1/mobile/putong/feed/data/Attitudes;

    .line 73
    .line 74
    new-instance v6, Lcom/p1/mobile/putong/feed/data/MomentForwards;

    .line 75
    .line 76
    invoke-direct {v6}, Lcom/p1/mobile/putong/feed/data/MomentForwards;-><init>()V

    .line 77
    .line 78
    .line 79
    iput-object v6, v4, Lcom/p1/mobile/putong/feed/data/Moment;->forwards:Lcom/p1/mobile/putong/feed/data/MomentForwards;

    .line 80
    .line 81
    iget-object v6, v4, Lcom/p1/mobile/putong/feed/data/Moment;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 82
    .line 83
    new-instance v7, Lcom/p1/mobile/putong/data/Links;

    .line 84
    .line 85
    invoke-direct {v7}, Lcom/p1/mobile/putong/data/Links;-><init>()V

    .line 86
    .line 87
    .line 88
    iput-object v7, v6, Lcom/p1/mobile/putong/data/PartialIdList;->links:Lcom/p1/mobile/putong/data/Links;

    .line 89
    .line 90
    iget-object v6, v4, Lcom/p1/mobile/putong/feed/data/Moment;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 91
    .line 92
    new-instance v7, Lcom/p1/mobile/putong/data/Links;

    .line 93
    .line 94
    invoke-direct {v7}, Lcom/p1/mobile/putong/data/Links;-><init>()V

    .line 95
    .line 96
    .line 97
    iput-object v7, v6, Lcom/p1/mobile/putong/data/PartialIdList;->links:Lcom/p1/mobile/putong/data/Links;

    .line 98
    .line 99
    iget-object v6, v4, Lcom/p1/mobile/putong/feed/data/Moment;->additionalData:Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;

    .line 100
    .line 101
    new-instance v7, Lcom/p1/mobile/putong/feed/data/MomentSendFrom;

    .line 102
    .line 103
    invoke-direct {v7}, Lcom/p1/mobile/putong/feed/data/MomentSendFrom;-><init>()V

    .line 104
    .line 105
    .line 106
    iput-object v7, v6, Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;->sendFrom:Lcom/p1/mobile/putong/feed/data/MomentSendFrom;

    .line 107
    .line 108
    iget-object v6, v4, Lcom/p1/mobile/putong/feed/data/Moment;->additionalData:Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;

    .line 109
    .line 110
    new-instance v7, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;

    .line 111
    .line 112
    invoke-direct {v7}, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;-><init>()V

    .line 113
    .line 114
    .line 115
    iput-object v7, v6, Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;->share:Lcom/p1/mobile/putong/feed/data/MomentShareInfo;

    .line 116
    .line 117
    invoke-interface/range {p1 .. p2}, Landroid/database/Cursor;->getLong(I)J

    .line 118
    .line 119
    .line 120
    move-result-wide v6

    .line 121
    iput-wide v6, v4, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 122
    .line 123
    add-int/lit8 v6, p2, 0x1

    .line 124
    .line 125
    invoke-interface {v1, v6}, Landroid/database/Cursor;->isNull(I)Z

    .line 126
    .line 127
    .line 128
    move-result v7

    .line 129
    if-eqz v7, :cond_1

    .line 130
    .line 131
    const/4 v6, 0x0

    .line 132
    goto :goto_0

    .line 133
    :cond_1
    invoke-interface {v1, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object v6

    .line 137
    :goto_0
    iput-object v6, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 138
    .line 139
    add-int/lit8 v6, p2, 0x2

    .line 140
    .line 141
    invoke-interface {v1, v6}, Landroid/database/Cursor;->getInt(I)I

    .line 142
    .line 143
    .line 144
    move-result v6

    .line 145
    iput v6, v4, Lcom/p1/mobile/putong/feed/data/Moment;->localCreatedSession:I

    .line 146
    .line 147
    add-int/lit8 v6, p2, 0x3

    .line 148
    .line 149
    invoke-interface {v1, v6}, Landroid/database/Cursor;->getInt(I)I

    .line 150
    .line 151
    .line 152
    move-result v6

    .line 153
    const/4 v7, 0x1

    .line 154
    if-ne v6, v7, :cond_2

    .line 155
    .line 156
    move v6, v7

    .line 157
    goto :goto_1

    .line 158
    :cond_2
    move v6, v3

    .line 159
    :goto_1
    iput-boolean v6, v4, Lcom/p1/mobile/putong/feed/data/Moment;->localInFeed:Z

    .line 160
    .line 161
    add-int/lit8 v6, p2, 0x4

    .line 162
    .line 163
    invoke-interface {v1, v6}, Landroid/database/Cursor;->getInt(I)I

    .line 164
    .line 165
    .line 166
    move-result v6

    .line 167
    if-ne v6, v7, :cond_3

    .line 168
    .line 169
    move v6, v7

    .line 170
    goto :goto_2

    .line 171
    :cond_3
    move v6, v3

    .line 172
    :goto_2
    iput-boolean v6, v4, Lcom/p1/mobile/putong/feed/data/Moment;->localInUserFeed:Z

    .line 173
    .line 174
    add-int/lit8 v6, p2, 0x5

    .line 175
    .line 176
    invoke-interface {v1, v6}, Landroid/database/Cursor;->isNull(I)Z

    .line 177
    .line 178
    .line 179
    move-result v9

    .line 180
    if-eqz v9, :cond_4

    .line 181
    .line 182
    const/4 v6, 0x0

    .line 183
    goto :goto_3

    .line 184
    :cond_4
    invoke-interface {v1, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object v6

    .line 188
    :goto_3
    iput-object v6, v4, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 189
    .line 190
    add-int/lit8 v6, p2, 0x6

    .line 191
    .line 192
    invoke-interface {v1, v6}, Landroid/database/Cursor;->getDouble(I)D

    .line 193
    .line 194
    .line 195
    move-result-wide v9

    .line 196
    iput-wide v9, v4, Lcom/p1/mobile/putong/feed/data/Moment;->createdTime:D

    .line 197
    .line 198
    add-int/lit8 v6, p2, 0x7

    .line 199
    .line 200
    invoke-interface {v1, v6}, Landroid/database/Cursor;->isNull(I)Z

    .line 201
    .line 202
    .line 203
    move-result v9

    .line 204
    if-eqz v9, :cond_5

    .line 205
    .line 206
    const/4 v6, 0x0

    .line 207
    goto :goto_4

    .line 208
    :cond_5
    invoke-interface {v1, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v6

    .line 212
    :goto_4
    iput-object v6, v4, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 213
    .line 214
    add-int/lit8 v6, p2, 0x8

    .line 215
    .line 216
    iget-object v9, v4, Lcom/p1/mobile/putong/feed/data/Moment;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 217
    .line 218
    invoke-interface {v1, v6}, Landroid/database/Cursor;->getInt(I)I

    .line 219
    .line 220
    .line 221
    move-result v6

    .line 222
    iput v6, v9, Lcom/p1/mobile/putong/data/PartialIdList;->count:I

    .line 223
    .line 224
    add-int/lit8 v6, p2, 0x9

    .line 225
    .line 226
    iget-object v9, v4, Lcom/p1/mobile/putong/feed/data/Moment;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 227
    .line 228
    invoke-interface {v1, v6}, Landroid/database/Cursor;->isNull(I)Z

    .line 229
    .line 230
    .line 231
    move-result v10

    .line 232
    if-eqz v10, :cond_6

    .line 233
    .line 234
    const/4 v6, 0x0

    .line 235
    goto :goto_5

    .line 236
    :cond_6
    sget-object v10, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 237
    .line 238
    invoke-virtual {v10}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 239
    .line 240
    .line 241
    move-result-object v10

    .line 242
    invoke-interface {v1, v6}, Landroid/database/Cursor;->getBlob(I)[B

    .line 243
    .line 244
    .line 245
    move-result-object v6

    .line 246
    invoke-virtual {v10, v6}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 247
    .line 248
    .line 249
    move-result-object v6

    .line 250
    check-cast v6, Ljava/util/List;

    .line 251
    .line 252
    :goto_5
    iput-object v6, v9, Lcom/p1/mobile/putong/data/PartialIdList;->ids:Ljava/util/List;

    .line 253
    .line 254
    add-int/lit8 v6, p2, 0xa

    .line 255
    .line 256
    iget-object v9, v4, Lcom/p1/mobile/putong/feed/data/Moment;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 257
    .line 258
    iget-object v9, v9, Lcom/p1/mobile/putong/data/PartialIdList;->links:Lcom/p1/mobile/putong/data/Links;

    .line 259
    .line 260
    invoke-interface {v1, v6}, Landroid/database/Cursor;->isNull(I)Z

    .line 261
    .line 262
    .line 263
    move-result v10

    .line 264
    if-eqz v10, :cond_7

    .line 265
    .line 266
    const/4 v6, 0x0

    .line 267
    goto :goto_6

    .line 268
    :cond_7
    invoke-interface {v1, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 269
    .line 270
    .line 271
    move-result-object v6

    .line 272
    :goto_6
    iput-object v6, v9, Lcom/p1/mobile/putong/data/Links;->previous:Ljava/lang/String;

    .line 273
    .line 274
    add-int/lit8 v6, p2, 0xb

    .line 275
    .line 276
    iget-object v9, v4, Lcom/p1/mobile/putong/feed/data/Moment;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 277
    .line 278
    iget-object v9, v9, Lcom/p1/mobile/putong/data/PartialIdList;->links:Lcom/p1/mobile/putong/data/Links;

    .line 279
    .line 280
    invoke-interface {v1, v6}, Landroid/database/Cursor;->isNull(I)Z

    .line 281
    .line 282
    .line 283
    move-result v10

    .line 284
    if-eqz v10, :cond_8

    .line 285
    .line 286
    const/4 v6, 0x0

    .line 287
    goto :goto_7

    .line 288
    :cond_8
    invoke-interface {v1, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 289
    .line 290
    .line 291
    move-result-object v6

    .line 292
    :goto_7
    iput-object v6, v9, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 293
    .line 294
    add-int/lit8 v6, p2, 0xc

    .line 295
    .line 296
    invoke-interface {v1, v6}, Landroid/database/Cursor;->getInt(I)I

    .line 297
    .line 298
    .line 299
    move-result v6

    .line 300
    if-ne v6, v7, :cond_9

    .line 301
    .line 302
    move v6, v7

    .line 303
    goto :goto_8

    .line 304
    :cond_9
    move v6, v3

    .line 305
    :goto_8
    iput-boolean v6, v4, Lcom/p1/mobile/putong/feed/data/Moment;->haveLiked:Z

    .line 306
    .line 307
    add-int/lit8 v6, p2, 0xd

    .line 308
    .line 309
    invoke-interface {v1, v6}, Landroid/database/Cursor;->isNull(I)Z

    .line 310
    .line 311
    .line 312
    move-result v9

    .line 313
    if-eqz v9, :cond_a

    .line 314
    .line 315
    const/4 v6, 0x0

    .line 316
    goto :goto_9

    .line 317
    :cond_a
    sget-object v9, Lcom/p1/mobile/putong/data/MessageLocation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 318
    .line 319
    invoke-interface {v1, v6}, Landroid/database/Cursor;->getBlob(I)[B

    .line 320
    .line 321
    .line 322
    move-result-object v6

    .line 323
    invoke-virtual {v9, v6}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 324
    .line 325
    .line 326
    move-result-object v6

    .line 327
    check-cast v6, Lcom/p1/mobile/putong/data/MessageLocation;

    .line 328
    .line 329
    :goto_9
    iput-object v6, v4, Lcom/p1/mobile/putong/feed/data/Moment;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 330
    .line 331
    add-int/lit8 v6, p2, 0xe

    .line 332
    .line 333
    invoke-interface {v1, v6}, Landroid/database/Cursor;->isNull(I)Z

    .line 334
    .line 335
    .line 336
    move-result v9

    .line 337
    if-eqz v9, :cond_b

    .line 338
    .line 339
    const/4 v6, 0x0

    .line 340
    goto :goto_a

    .line 341
    :cond_b
    sget-object v9, Lcom/p1/mobile/putong/data/Media;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 342
    .line 343
    invoke-virtual {v9}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 344
    .line 345
    .line 346
    move-result-object v9

    .line 347
    invoke-interface {v1, v6}, Landroid/database/Cursor;->getBlob(I)[B

    .line 348
    .line 349
    .line 350
    move-result-object v6

    .line 351
    invoke-virtual {v9, v6}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 352
    .line 353
    .line 354
    move-result-object v6

    .line 355
    check-cast v6, Ljava/util/List;

    .line 356
    .line 357
    :goto_a
    iput-object v6, v4, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 358
    .line 359
    add-int/lit8 v6, p2, 0xf

    .line 360
    .line 361
    invoke-interface {v1, v6}, Landroid/database/Cursor;->isNull(I)Z

    .line 362
    .line 363
    .line 364
    move-result v9

    .line 365
    if-eqz v9, :cond_c

    .line 366
    .line 367
    const/4 v6, 0x0

    .line 368
    goto :goto_b

    .line 369
    :cond_c
    invoke-interface {v1, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 370
    .line 371
    .line 372
    move-result-object v6

    .line 373
    :goto_b
    iput-object v6, v4, Lcom/p1/mobile/putong/feed/data/Moment;->landingPage:Ljava/lang/String;

    .line 374
    .line 375
    add-int/lit8 v6, p2, 0x10

    .line 376
    .line 377
    iget-object v9, v4, Lcom/p1/mobile/putong/feed/data/Moment;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 378
    .line 379
    invoke-interface {v1, v6}, Landroid/database/Cursor;->getInt(I)I

    .line 380
    .line 381
    .line 382
    move-result v6

    .line 383
    iput v6, v9, Lcom/p1/mobile/putong/data/PartialIdList;->count:I

    .line 384
    .line 385
    add-int/lit8 v6, p2, 0x11

    .line 386
    .line 387
    iget-object v9, v4, Lcom/p1/mobile/putong/feed/data/Moment;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 388
    .line 389
    invoke-interface {v1, v6}, Landroid/database/Cursor;->isNull(I)Z

    .line 390
    .line 391
    .line 392
    move-result v10

    .line 393
    if-eqz v10, :cond_d

    .line 394
    .line 395
    const/4 v6, 0x0

    .line 396
    goto :goto_c

    .line 397
    :cond_d
    sget-object v10, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 398
    .line 399
    invoke-virtual {v10}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 400
    .line 401
    .line 402
    move-result-object v10

    .line 403
    invoke-interface {v1, v6}, Landroid/database/Cursor;->getBlob(I)[B

    .line 404
    .line 405
    .line 406
    move-result-object v6

    .line 407
    invoke-virtual {v10, v6}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 408
    .line 409
    .line 410
    move-result-object v6

    .line 411
    check-cast v6, Ljava/util/List;

    .line 412
    .line 413
    :goto_c
    iput-object v6, v9, Lcom/p1/mobile/putong/data/PartialIdList;->ids:Ljava/util/List;

    .line 414
    .line 415
    add-int/lit8 v6, p2, 0x12

    .line 416
    .line 417
    iget-object v9, v4, Lcom/p1/mobile/putong/feed/data/Moment;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 418
    .line 419
    iget-object v9, v9, Lcom/p1/mobile/putong/data/PartialIdList;->links:Lcom/p1/mobile/putong/data/Links;

    .line 420
    .line 421
    invoke-interface {v1, v6}, Landroid/database/Cursor;->isNull(I)Z

    .line 422
    .line 423
    .line 424
    move-result v10

    .line 425
    if-eqz v10, :cond_e

    .line 426
    .line 427
    const/4 v6, 0x0

    .line 428
    goto :goto_d

    .line 429
    :cond_e
    invoke-interface {v1, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 430
    .line 431
    .line 432
    move-result-object v6

    .line 433
    :goto_d
    iput-object v6, v9, Lcom/p1/mobile/putong/data/Links;->previous:Ljava/lang/String;

    .line 434
    .line 435
    add-int/lit8 v6, p2, 0x13

    .line 436
    .line 437
    iget-object v9, v4, Lcom/p1/mobile/putong/feed/data/Moment;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 438
    .line 439
    iget-object v9, v9, Lcom/p1/mobile/putong/data/PartialIdList;->links:Lcom/p1/mobile/putong/data/Links;

    .line 440
    .line 441
    invoke-interface {v1, v6}, Landroid/database/Cursor;->isNull(I)Z

    .line 442
    .line 443
    .line 444
    move-result v10

    .line 445
    if-eqz v10, :cond_f

    .line 446
    .line 447
    const/4 v6, 0x0

    .line 448
    goto :goto_e

    .line 449
    :cond_f
    invoke-interface {v1, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 450
    .line 451
    .line 452
    move-result-object v6

    .line 453
    :goto_e
    iput-object v6, v9, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 454
    .line 455
    add-int/lit8 v6, p2, 0x14

    .line 456
    .line 457
    invoke-interface {v1, v6}, Landroid/database/Cursor;->isNull(I)Z

    .line 458
    .line 459
    .line 460
    move-result v9

    .line 461
    if-eqz v9, :cond_10

    .line 462
    .line 463
    move v6, v5

    .line 464
    goto :goto_f

    .line 465
    :cond_10
    invoke-interface {v1, v6}, Landroid/database/Cursor;->getInt(I)I

    .line 466
    .line 467
    .line 468
    move-result v6
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_8

    .line 469
    :goto_f
    add-int/lit8 v9, p2, 0x15

    .line 470
    .line 471
    :try_start_1
    iget-object v10, v4, Lcom/p1/mobile/putong/feed/data/Moment;->settings:Lcom/p1/mobile/putong/feed/data/MomentSettings;

    .line 472
    .line 473
    invoke-interface {v1, v9}, Landroid/database/Cursor;->getInt(I)I

    .line 474
    .line 475
    .line 476
    move-result v9

    .line 477
    if-ne v9, v7, :cond_11

    .line 478
    .line 479
    move v9, v7

    .line 480
    goto :goto_10

    .line 481
    :cond_11
    move v9, v3

    .line 482
    :goto_10
    iput-boolean v9, v10, Lcom/p1/mobile/putong/feed/data/MomentSettings;->muted:Z

    .line 483
    .line 484
    add-int/lit8 v9, p2, 0x16

    .line 485
    .line 486
    invoke-interface {v1, v9}, Landroid/database/Cursor;->isNull(I)Z

    .line 487
    .line 488
    .line 489
    move-result v10

    .line 490
    if-eqz v10, :cond_12

    .line 491
    .line 492
    move v9, v5

    .line 493
    goto :goto_11

    .line 494
    :cond_12
    invoke-interface {v1, v9}, Landroid/database/Cursor;->getInt(I)I

    .line 495
    .line 496
    .line 497
    move-result v9
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_7

    .line 498
    :goto_11
    add-int/lit8 v10, p2, 0x17

    .line 499
    .line 500
    :try_start_2
    invoke-interface {v1, v10}, Landroid/database/Cursor;->isNull(I)Z

    .line 501
    .line 502
    .line 503
    move-result v11

    .line 504
    if-eqz v11, :cond_13

    .line 505
    .line 506
    const/4 v10, 0x0

    .line 507
    goto :goto_12

    .line 508
    :cond_13
    invoke-interface {v1, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 509
    .line 510
    .line 511
    move-result-object v10

    .line 512
    :goto_12
    iput-object v10, v4, Lcom/p1/mobile/putong/feed/data/Moment;->musicId:Ljava/lang/String;

    .line 513
    .line 514
    add-int/lit8 v10, p2, 0x18

    .line 515
    .line 516
    invoke-interface {v1, v10}, Landroid/database/Cursor;->isNull(I)Z

    .line 517
    .line 518
    .line 519
    move-result v11

    .line 520
    if-eqz v11, :cond_14

    .line 521
    .line 522
    const/4 v10, 0x0

    .line 523
    goto :goto_13

    .line 524
    :cond_14
    invoke-interface {v1, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 525
    .line 526
    .line 527
    move-result-object v10

    .line 528
    :goto_13
    iput-object v10, v4, Lcom/p1/mobile/putong/feed/data/Moment;->status:Ljava/lang/String;

    .line 529
    .line 530
    add-int/lit8 v10, p2, 0x19

    .line 531
    .line 532
    invoke-interface {v1, v10}, Landroid/database/Cursor;->isNull(I)Z

    .line 533
    .line 534
    .line 535
    move-result v11

    .line 536
    if-eqz v11, :cond_15

    .line 537
    .line 538
    move v10, v5

    .line 539
    goto :goto_14

    .line 540
    :cond_15
    invoke-interface {v1, v10}, Landroid/database/Cursor;->getInt(I)I

    .line 541
    .line 542
    .line 543
    move-result v10
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_6

    .line 544
    :goto_14
    add-int/lit8 v11, p2, 0x1a

    .line 545
    .line 546
    :try_start_3
    invoke-interface {v1, v11}, Landroid/database/Cursor;->isNull(I)Z

    .line 547
    .line 548
    .line 549
    move-result v12

    .line 550
    if-eqz v12, :cond_16

    .line 551
    .line 552
    const/4 v11, 0x0

    .line 553
    goto :goto_15

    .line 554
    :cond_16
    sget-object v12, Lcom/p1/mobile/putong/data/TopicMomentIdBox;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 555
    .line 556
    invoke-virtual {v12}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 557
    .line 558
    .line 559
    move-result-object v12

    .line 560
    invoke-interface {v1, v11}, Landroid/database/Cursor;->getBlob(I)[B

    .line 561
    .line 562
    .line 563
    move-result-object v11

    .line 564
    invoke-virtual {v12, v11}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 565
    .line 566
    .line 567
    move-result-object v11

    .line 568
    check-cast v11, Ljava/util/List;

    .line 569
    .line 570
    :goto_15
    iput-object v11, v4, Lcom/p1/mobile/putong/feed/data/Moment;->topics:Ljava/util/List;

    .line 571
    .line 572
    add-int/lit8 v11, p2, 0x1b

    .line 573
    .line 574
    invoke-interface {v1, v11}, Landroid/database/Cursor;->isNull(I)Z

    .line 575
    .line 576
    .line 577
    move-result v12

    .line 578
    if-eqz v12, :cond_17

    .line 579
    .line 580
    move v11, v5

    .line 581
    goto :goto_16

    .line 582
    :cond_17
    invoke-interface {v1, v11}, Landroid/database/Cursor;->getInt(I)I

    .line 583
    .line 584
    .line 585
    move-result v11
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_5

    .line 586
    :goto_16
    add-int/lit8 v12, p2, 0x1c

    .line 587
    .line 588
    :try_start_4
    iget-object v13, v4, Lcom/p1/mobile/putong/feed/data/Moment;->settings:Lcom/p1/mobile/putong/feed/data/MomentSettings;

    .line 589
    .line 590
    invoke-interface {v1, v12}, Landroid/database/Cursor;->getInt(I)I

    .line 591
    .line 592
    .line 593
    move-result v12

    .line 594
    if-ne v12, v7, :cond_18

    .line 595
    .line 596
    move v12, v7

    .line 597
    goto :goto_17

    .line 598
    :cond_18
    move v12, v3

    .line 599
    :goto_17
    iput-boolean v12, v13, Lcom/p1/mobile/putong/feed/data/MomentSettings;->anonymous:Z

    .line 600
    .line 601
    add-int/lit8 v12, p2, 0x1d

    .line 602
    .line 603
    invoke-interface {v1, v12}, Landroid/database/Cursor;->isNull(I)Z

    .line 604
    .line 605
    .line 606
    move-result v13

    .line 607
    if-eqz v13, :cond_19

    .line 608
    .line 609
    const/4 v12, 0x0

    .line 610
    goto :goto_18

    .line 611
    :cond_19
    invoke-interface {v1, v12}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 612
    .line 613
    .line 614
    move-result-object v12

    .line 615
    :goto_18
    iput-object v12, v4, Lcom/p1/mobile/putong/feed/data/Moment;->hyperlink:Ljava/lang/String;

    .line 616
    .line 617
    add-int/lit8 v12, p2, 0x1e

    .line 618
    .line 619
    invoke-interface {v1, v12}, Landroid/database/Cursor;->isNull(I)Z

    .line 620
    .line 621
    .line 622
    move-result v13

    .line 623
    if-eqz v13, :cond_1a

    .line 624
    .line 625
    const/4 v12, 0x0

    .line 626
    goto :goto_19

    .line 627
    :cond_1a
    invoke-interface {v1, v12}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 628
    .line 629
    .line 630
    move-result-object v12
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4

    .line 631
    :goto_19
    add-int/lit8 v13, p2, 0x1f

    .line 632
    .line 633
    :try_start_5
    invoke-interface {v1, v13}, Landroid/database/Cursor;->isNull(I)Z

    .line 634
    .line 635
    .line 636
    move-result v14

    .line 637
    if-eqz v14, :cond_1b

    .line 638
    .line 639
    const/4 v13, 0x0

    .line 640
    goto :goto_1a

    .line 641
    :cond_1b
    invoke-interface {v1, v13}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 642
    .line 643
    .line 644
    move-result-object v13
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    .line 645
    :goto_1a
    add-int/lit8 v14, p2, 0x20

    .line 646
    .line 647
    :try_start_6
    invoke-interface {v1, v14}, Landroid/database/Cursor;->isNull(I)Z

    .line 648
    .line 649
    .line 650
    move-result v15

    .line 651
    if-eqz v15, :cond_1c

    .line 652
    .line 653
    const/4 v14, 0x0

    .line 654
    goto :goto_1b

    .line 655
    :cond_1c
    invoke-interface {v1, v14}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 656
    .line 657
    .line 658
    move-result-object v14
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2

    .line 659
    :goto_1b
    add-int/lit8 v15, p2, 0x21

    .line 660
    .line 661
    :try_start_7
    invoke-interface {v1, v15}, Landroid/database/Cursor;->isNull(I)Z

    .line 662
    .line 663
    .line 664
    move-result v16

    .line 665
    if-eqz v16, :cond_1d

    .line 666
    .line 667
    const/4 v15, 0x0

    .line 668
    goto :goto_1c

    .line 669
    :cond_1d
    invoke-interface {v1, v15}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 670
    .line 671
    .line 672
    move-result-object v15
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_1

    .line 673
    :goto_1c
    add-int/lit8 v3, p2, 0x22

    .line 674
    .line 675
    :try_start_8
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 676
    .line 677
    .line 678
    move-result v17

    .line 679
    if-eqz v17, :cond_1e

    .line 680
    .line 681
    goto :goto_1d

    .line 682
    :cond_1e
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getInt(I)I

    .line 683
    .line 684
    .line 685
    move-result v5

    .line 686
    :goto_1d
    add-int/lit8 v3, p2, 0x23

    .line 687
    .line 688
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 689
    .line 690
    .line 691
    move-result v17

    .line 692
    if-eqz v17, :cond_1f

    .line 693
    .line 694
    const/4 v2, 0x0

    .line 695
    goto :goto_1e

    .line 696
    :cond_1f
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 697
    .line 698
    .line 699
    move-result-object v2

    .line 700
    :goto_1e
    add-int/lit8 v3, p2, 0x24

    .line 701
    .line 702
    iget-object v8, v4, Lcom/p1/mobile/putong/feed/data/Moment;->simpleActivity:Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;

    .line 703
    .line 704
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 705
    .line 706
    .line 707
    move-result v18

    .line 708
    if-eqz v18, :cond_20

    .line 709
    .line 710
    const/4 v3, 0x0

    .line 711
    goto :goto_1f

    .line 712
    :cond_20
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 713
    .line 714
    .line 715
    move-result-object v3

    .line 716
    :goto_1f
    iput-object v3, v8, Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;->id:Ljava/lang/String;

    .line 717
    .line 718
    add-int/lit8 v3, p2, 0x25

    .line 719
    .line 720
    iget-object v8, v4, Lcom/p1/mobile/putong/feed/data/Moment;->simpleActivity:Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;

    .line 721
    .line 722
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 723
    .line 724
    .line 725
    move-result v18

    .line 726
    if-eqz v18, :cond_21

    .line 727
    .line 728
    const/4 v3, 0x0

    .line 729
    goto :goto_20

    .line 730
    :cond_21
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 731
    .line 732
    .line 733
    move-result-object v3

    .line 734
    :goto_20
    iput-object v3, v8, Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;->name:Ljava/lang/String;

    .line 735
    .line 736
    add-int/lit8 v3, p2, 0x26

    .line 737
    .line 738
    iget-object v8, v4, Lcom/p1/mobile/putong/feed/data/Moment;->additionalData:Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;

    .line 739
    .line 740
    iget-object v8, v8, Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;->sendFrom:Lcom/p1/mobile/putong/feed/data/MomentSendFrom;

    .line 741
    .line 742
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 743
    .line 744
    .line 745
    move-result v18

    .line 746
    if-eqz v18, :cond_22

    .line 747
    .line 748
    const/4 v3, 0x0

    .line 749
    goto :goto_21

    .line 750
    :cond_22
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 751
    .line 752
    .line 753
    move-result-object v3

    .line 754
    :goto_21
    iput-object v3, v8, Lcom/p1/mobile/putong/feed/data/MomentSendFrom;->id:Ljava/lang/String;

    .line 755
    .line 756
    add-int/lit8 v3, p2, 0x27

    .line 757
    .line 758
    iget-object v8, v4, Lcom/p1/mobile/putong/feed/data/Moment;->additionalData:Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;

    .line 759
    .line 760
    iget-object v8, v8, Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;->sendFrom:Lcom/p1/mobile/putong/feed/data/MomentSendFrom;

    .line 761
    .line 762
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 763
    .line 764
    .line 765
    move-result v18

    .line 766
    if-eqz v18, :cond_23

    .line 767
    .line 768
    const/4 v3, 0x0

    .line 769
    goto :goto_22

    .line 770
    :cond_23
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 771
    .line 772
    .line 773
    move-result-object v3

    .line 774
    :goto_22
    iput-object v3, v8, Lcom/p1/mobile/putong/feed/data/MomentSendFrom;->name:Ljava/lang/String;

    .line 775
    .line 776
    add-int/lit8 v3, p2, 0x28

    .line 777
    .line 778
    iget-object v8, v4, Lcom/p1/mobile/putong/feed/data/Moment;->additionalData:Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;

    .line 779
    .line 780
    iget-object v8, v8, Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;->sendFrom:Lcom/p1/mobile/putong/feed/data/MomentSendFrom;

    .line 781
    .line 782
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 783
    .line 784
    .line 785
    move-result v18

    .line 786
    if-eqz v18, :cond_24

    .line 787
    .line 788
    const/4 v3, 0x0

    .line 789
    goto :goto_23

    .line 790
    :cond_24
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 791
    .line 792
    .line 793
    move-result-object v3

    .line 794
    :goto_23
    iput-object v3, v8, Lcom/p1/mobile/putong/feed/data/MomentSendFrom;->sourceType:Ljava/lang/String;

    .line 795
    .line 796
    add-int/lit8 v3, p2, 0x29

    .line 797
    .line 798
    iget-object v8, v4, Lcom/p1/mobile/putong/feed/data/Moment;->group:Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 799
    .line 800
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 801
    .line 802
    .line 803
    move-result v18

    .line 804
    if-eqz v18, :cond_25

    .line 805
    .line 806
    const/4 v3, 0x0

    .line 807
    goto :goto_24

    .line 808
    :cond_25
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 809
    .line 810
    .line 811
    move-result-object v3

    .line 812
    :goto_24
    iput-object v3, v8, Lcom/p1/mobile/putong/feed/data/GroupIdBox;->id:Ljava/lang/String;

    .line 813
    .line 814
    add-int/lit8 v3, p2, 0x2a

    .line 815
    .line 816
    iget-object v8, v4, Lcom/p1/mobile/putong/feed/data/Moment;->group:Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 817
    .line 818
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 819
    .line 820
    .line 821
    move-result v18

    .line 822
    if-eqz v18, :cond_26

    .line 823
    .line 824
    const/4 v3, 0x0

    .line 825
    goto :goto_25

    .line 826
    :cond_26
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 827
    .line 828
    .line 829
    move-result-object v3

    .line 830
    :goto_25
    iput-object v3, v8, Lcom/p1/mobile/putong/feed/data/GroupIdBox;->name:Ljava/lang/String;

    .line 831
    .line 832
    add-int/lit8 v3, p2, 0x2b

    .line 833
    .line 834
    iget-object v8, v4, Lcom/p1/mobile/putong/feed/data/Moment;->group:Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 835
    .line 836
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getInt(I)I

    .line 837
    .line 838
    .line 839
    move-result v3

    .line 840
    if-ne v3, v7, :cond_27

    .line 841
    .line 842
    move v3, v7

    .line 843
    goto :goto_26

    .line 844
    :cond_27
    const/4 v3, 0x0

    .line 845
    :goto_26
    iput-boolean v3, v8, Lcom/p1/mobile/putong/feed/data/GroupIdBox;->lastJoined:Z

    .line 846
    .line 847
    add-int/lit8 v3, p2, 0x2c

    .line 848
    .line 849
    iget-object v8, v4, Lcom/p1/mobile/putong/feed/data/Moment;->additionalData:Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;

    .line 850
    .line 851
    iget-object v8, v8, Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;->share:Lcom/p1/mobile/putong/feed/data/MomentShareInfo;

    .line 852
    .line 853
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 854
    .line 855
    .line 856
    move-result v18

    .line 857
    if-eqz v18, :cond_28

    .line 858
    .line 859
    const/4 v3, 0x0

    .line 860
    goto :goto_27

    .line 861
    :cond_28
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 862
    .line 863
    .line 864
    move-result-object v3

    .line 865
    :goto_27
    iput-object v3, v8, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->title:Ljava/lang/String;

    .line 866
    .line 867
    add-int/lit8 v3, p2, 0x2d

    .line 868
    .line 869
    iget-object v8, v4, Lcom/p1/mobile/putong/feed/data/Moment;->additionalData:Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;

    .line 870
    .line 871
    iget-object v8, v8, Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;->share:Lcom/p1/mobile/putong/feed/data/MomentShareInfo;

    .line 872
    .line 873
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 874
    .line 875
    .line 876
    move-result v18

    .line 877
    if-eqz v18, :cond_29

    .line 878
    .line 879
    const/4 v3, 0x0

    .line 880
    goto :goto_28

    .line 881
    :cond_29
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 882
    .line 883
    .line 884
    move-result-object v3

    .line 885
    :goto_28
    iput-object v3, v8, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->description:Ljava/lang/String;

    .line 886
    .line 887
    add-int/lit8 v3, p2, 0x2e

    .line 888
    .line 889
    iget-object v8, v4, Lcom/p1/mobile/putong/feed/data/Moment;->additionalData:Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;

    .line 890
    .line 891
    iget-object v8, v8, Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;->share:Lcom/p1/mobile/putong/feed/data/MomentShareInfo;

    .line 892
    .line 893
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 894
    .line 895
    .line 896
    move-result v18

    .line 897
    if-eqz v18, :cond_2a

    .line 898
    .line 899
    const/4 v3, 0x0

    .line 900
    goto :goto_29

    .line 901
    :cond_2a
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 902
    .line 903
    .line 904
    move-result-object v3

    .line 905
    :goto_29
    iput-object v3, v8, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->url:Ljava/lang/String;

    .line 906
    .line 907
    add-int/lit8 v3, p2, 0x2f

    .line 908
    .line 909
    iget-object v8, v4, Lcom/p1/mobile/putong/feed/data/Moment;->additionalData:Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;

    .line 910
    .line 911
    iget-object v8, v8, Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;->share:Lcom/p1/mobile/putong/feed/data/MomentShareInfo;

    .line 912
    .line 913
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 914
    .line 915
    .line 916
    move-result v18

    .line 917
    if-eqz v18, :cond_2b

    .line 918
    .line 919
    const/4 v3, 0x0

    .line 920
    goto :goto_2a

    .line 921
    :cond_2b
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 922
    .line 923
    .line 924
    move-result-object v3

    .line 925
    :goto_2a
    iput-object v3, v8, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->landingPage:Ljava/lang/String;

    .line 926
    .line 927
    add-int/lit8 v3, p2, 0x30

    .line 928
    .line 929
    iget-object v8, v4, Lcom/p1/mobile/putong/feed/data/Moment;->additionalData:Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;

    .line 930
    .line 931
    iget-object v8, v8, Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;->share:Lcom/p1/mobile/putong/feed/data/MomentShareInfo;

    .line 932
    .line 933
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 934
    .line 935
    .line 936
    move-result v18

    .line 937
    if-eqz v18, :cond_2c

    .line 938
    .line 939
    const/4 v3, 0x0

    .line 940
    goto :goto_2b

    .line 941
    :cond_2c
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 942
    .line 943
    .line 944
    move-result-object v3

    .line 945
    :goto_2b
    iput-object v3, v8, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->name:Ljava/lang/String;

    .line 946
    .line 947
    add-int/lit8 v3, p2, 0x31

    .line 948
    .line 949
    iget-object v8, v4, Lcom/p1/mobile/putong/feed/data/Moment;->additionalData:Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;

    .line 950
    .line 951
    iget-object v8, v8, Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;->share:Lcom/p1/mobile/putong/feed/data/MomentShareInfo;

    .line 952
    .line 953
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 954
    .line 955
    .line 956
    move-result v18

    .line 957
    if-eqz v18, :cond_2d

    .line 958
    .line 959
    const/4 v3, 0x0

    .line 960
    goto :goto_2c

    .line 961
    :cond_2d
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 962
    .line 963
    .line 964
    move-result-object v3

    .line 965
    :goto_2c
    iput-object v3, v8, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->shareFrom:Ljava/lang/String;

    .line 966
    .line 967
    add-int/lit8 v3, p2, 0x32

    .line 968
    .line 969
    iget-object v8, v4, Lcom/p1/mobile/putong/feed/data/Moment;->additionalData:Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;

    .line 970
    .line 971
    iget-object v8, v8, Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;->share:Lcom/p1/mobile/putong/feed/data/MomentShareInfo;

    .line 972
    .line 973
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 974
    .line 975
    .line 976
    move-result v18

    .line 977
    if-eqz v18, :cond_2e

    .line 978
    .line 979
    const/4 v3, 0x0

    .line 980
    goto :goto_2d

    .line 981
    :cond_2e
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 982
    .line 983
    .line 984
    move-result-object v3

    .line 985
    :goto_2d
    iput-object v3, v8, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->testId:Ljava/lang/String;

    .line 986
    .line 987
    add-int/lit8 v3, p2, 0x33

    .line 988
    .line 989
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 990
    .line 991
    .line 992
    move-result v8

    .line 993
    if-eqz v8, :cond_2f

    .line 994
    .line 995
    const/4 v3, 0x0

    .line 996
    goto :goto_2e

    .line 997
    :cond_2f
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 998
    .line 999
    .line 1000
    move-result-object v3

    .line 1001
    :goto_2e
    iput-object v3, v4, Lcom/p1/mobile/putong/feed/data/Moment;->deeplink:Ljava/lang/String;

    .line 1002
    .line 1003
    add-int/lit8 v3, p2, 0x34

    .line 1004
    .line 1005
    iget-object v8, v4, Lcom/p1/mobile/putong/feed/data/Moment;->thirdShareSource:Lcom/p1/mobile/putong/feed/data/ThirdShareSource;

    .line 1006
    .line 1007
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 1008
    .line 1009
    .line 1010
    move-result v18

    .line 1011
    if-eqz v18, :cond_30

    .line 1012
    .line 1013
    const/4 v3, 0x0

    .line 1014
    goto :goto_2f

    .line 1015
    :cond_30
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 1016
    .line 1017
    .line 1018
    move-result-object v3

    .line 1019
    :goto_2f
    iput-object v3, v8, Lcom/p1/mobile/putong/feed/data/ThirdShareSource;->sourceId:Ljava/lang/String;

    .line 1020
    .line 1021
    add-int/lit8 v3, p2, 0x35

    .line 1022
    .line 1023
    iget-object v8, v4, Lcom/p1/mobile/putong/feed/data/Moment;->thirdShareSource:Lcom/p1/mobile/putong/feed/data/ThirdShareSource;

    .line 1024
    .line 1025
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 1026
    .line 1027
    .line 1028
    move-result v18

    .line 1029
    if-eqz v18, :cond_31

    .line 1030
    .line 1031
    const/4 v3, 0x0

    .line 1032
    goto :goto_30

    .line 1033
    :cond_31
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 1034
    .line 1035
    .line 1036
    move-result-object v3

    .line 1037
    :goto_30
    iput-object v3, v8, Lcom/p1/mobile/putong/feed/data/ThirdShareSource;->sourceType:Ljava/lang/String;

    .line 1038
    .line 1039
    add-int/lit8 v3, p2, 0x36

    .line 1040
    .line 1041
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getInt(I)I

    .line 1042
    .line 1043
    .line 1044
    move-result v3

    .line 1045
    iput v3, v4, Lcom/p1/mobile/putong/feed/data/Moment;->attitudeId:I

    .line 1046
    .line 1047
    add-int/lit8 v3, p2, 0x37

    .line 1048
    .line 1049
    iget-object v8, v4, Lcom/p1/mobile/putong/feed/data/Moment;->attitudes:Lcom/p1/mobile/putong/feed/data/Attitudes;

    .line 1050
    .line 1051
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getInt(I)I

    .line 1052
    .line 1053
    .line 1054
    move-result v3

    .line 1055
    iput v3, v8, Lcom/p1/mobile/putong/feed/data/Attitudes;->count:I

    .line 1056
    .line 1057
    add-int/lit8 v3, p2, 0x38

    .line 1058
    .line 1059
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getInt(I)I

    .line 1060
    .line 1061
    .line 1062
    move-result v3

    .line 1063
    if-ne v3, v7, :cond_32

    .line 1064
    .line 1065
    move v3, v7

    .line 1066
    goto :goto_31

    .line 1067
    :cond_32
    const/4 v3, 0x0

    .line 1068
    :goto_31
    iput-boolean v3, v4, Lcom/p1/mobile/putong/feed/data/Moment;->shareMyVote:Z

    .line 1069
    .line 1070
    add-int/lit8 v3, p2, 0x39

    .line 1071
    .line 1072
    iget-object v8, v4, Lcom/p1/mobile/putong/feed/data/Moment;->simpleActivity:Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;

    .line 1073
    .line 1074
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 1075
    .line 1076
    .line 1077
    move-result v18

    .line 1078
    if-eqz v18, :cond_33

    .line 1079
    .line 1080
    const/4 v3, 0x0

    .line 1081
    goto :goto_32

    .line 1082
    :cond_33
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 1083
    .line 1084
    .line 1085
    move-result-object v3

    .line 1086
    :goto_32
    iput-object v3, v8, Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;->url:Ljava/lang/String;

    .line 1087
    .line 1088
    add-int/lit8 v3, p2, 0x3a

    .line 1089
    .line 1090
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 1091
    .line 1092
    .line 1093
    move-result v8

    .line 1094
    if-eqz v8, :cond_34

    .line 1095
    .line 1096
    const/4 v8, 0x0

    .line 1097
    goto :goto_33

    .line 1098
    :cond_34
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 1099
    .line 1100
    .line 1101
    move-result-object v3

    .line 1102
    invoke-static {v3}, Lcom/p1/mobile/putong/feed/data/MomentAllowForwardState;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/MomentAllowForwardState;

    .line 1103
    .line 1104
    .line 1105
    move-result-object v8

    .line 1106
    :goto_33
    iput-object v8, v4, Lcom/p1/mobile/putong/feed/data/Moment;->allowForward:Lcom/p1/mobile/putong/feed/data/MomentAllowForwardState;

    .line 1107
    .line 1108
    add-int/lit8 v3, p2, 0x3b

    .line 1109
    .line 1110
    iget-object v8, v4, Lcom/p1/mobile/putong/feed/data/Moment;->forwards:Lcom/p1/mobile/putong/feed/data/MomentForwards;

    .line 1111
    .line 1112
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getInt(I)I

    .line 1113
    .line 1114
    .line 1115
    move-result v3

    .line 1116
    iput v3, v8, Lcom/p1/mobile/putong/feed/data/MomentForwards;->count:I

    .line 1117
    .line 1118
    add-int/lit8 v3, p2, 0x3c

    .line 1119
    .line 1120
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getInt(I)I

    .line 1121
    .line 1122
    .line 1123
    move-result v3

    .line 1124
    if-ne v3, v7, :cond_35

    .line 1125
    .line 1126
    move v3, v7

    .line 1127
    goto :goto_34

    .line 1128
    :cond_35
    const/4 v3, 0x0

    .line 1129
    :goto_34
    iput-boolean v3, v4, Lcom/p1/mobile/putong/feed/data/Moment;->isNewUserAIMoment:Z

    .line 1130
    .line 1131
    add-int/lit8 v3, p2, 0x3d

    .line 1132
    .line 1133
    iput v3, v0, Ll/vzf0;->readIndex:I
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_0

    .line 1134
    .line 1135
    goto/16 :goto_3a

    .line 1136
    .line 1137
    :catch_0
    move-exception v0

    .line 1138
    move v3, v6

    .line 1139
    move v6, v5

    .line 1140
    move v5, v3

    .line 1141
    move-object v3, v2

    .line 1142
    :goto_35
    move-object v2, v12

    .line 1143
    goto/16 :goto_39

    .line 1144
    .line 1145
    :catch_1
    move-exception v0

    .line 1146
    move v3, v6

    .line 1147
    move v6, v5

    .line 1148
    move v5, v3

    .line 1149
    move-object v3, v2

    .line 1150
    move-object v15, v3

    .line 1151
    goto :goto_35

    .line 1152
    :catch_2
    move-exception v0

    .line 1153
    move v3, v6

    .line 1154
    move v6, v5

    .line 1155
    move v5, v3

    .line 1156
    move-object v3, v2

    .line 1157
    move-object v14, v3

    .line 1158
    :goto_36
    move-object v15, v14

    .line 1159
    goto :goto_35

    .line 1160
    :catch_3
    move-exception v0

    .line 1161
    move v3, v6

    .line 1162
    move v6, v5

    .line 1163
    move v5, v3

    .line 1164
    move-object v3, v2

    .line 1165
    move-object v13, v3

    .line 1166
    move-object v14, v13

    .line 1167
    goto :goto_36

    .line 1168
    :catch_4
    move-exception v0

    .line 1169
    move v3, v6

    .line 1170
    move v6, v5

    .line 1171
    move v5, v3

    .line 1172
    move-object v3, v2

    .line 1173
    move-object v13, v3

    .line 1174
    move-object v14, v13

    .line 1175
    move-object v15, v14

    .line 1176
    goto :goto_39

    .line 1177
    :catch_5
    move-exception v0

    .line 1178
    move-object v3, v2

    .line 1179
    move-object v13, v3

    .line 1180
    move-object v14, v13

    .line 1181
    move-object v15, v14

    .line 1182
    move v11, v5

    .line 1183
    :goto_37
    move v5, v6

    .line 1184
    move v6, v11

    .line 1185
    goto :goto_39

    .line 1186
    :catch_6
    move-exception v0

    .line 1187
    move-object v3, v2

    .line 1188
    move-object v13, v3

    .line 1189
    move-object v14, v13

    .line 1190
    move-object v15, v14

    .line 1191
    move v10, v5

    .line 1192
    :goto_38
    move v11, v10

    .line 1193
    goto :goto_37

    .line 1194
    :catch_7
    move-exception v0

    .line 1195
    move-object v3, v2

    .line 1196
    move-object v13, v3

    .line 1197
    move-object v14, v13

    .line 1198
    move-object v15, v14

    .line 1199
    move v9, v5

    .line 1200
    move v10, v9

    .line 1201
    goto :goto_38

    .line 1202
    :catch_8
    move-exception v0

    .line 1203
    move-object v3, v2

    .line 1204
    move-object v13, v3

    .line 1205
    move-object v14, v13

    .line 1206
    move-object v15, v14

    .line 1207
    move v6, v5

    .line 1208
    move v9, v6

    .line 1209
    move v10, v9

    .line 1210
    move v11, v10

    .line 1211
    :goto_39
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/MessageNano;->reportError(Ljava/lang/Exception;Landroid/database/Cursor;)V

    .line 1212
    .line 1213
    .line 1214
    move v12, v6

    .line 1215
    move v6, v5

    .line 1216
    move v5, v12

    .line 1217
    move-object v12, v2

    .line 1218
    move-object v2, v3

    .line 1219
    :goto_3a
    iget-object v0, v4, Lcom/p1/mobile/putong/feed/data/Moment;->settings:Lcom/p1/mobile/putong/feed/data/MomentSettings;

    .line 1220
    .line 1221
    sget-object v1, Lcom/p1/mobile/putong/feed/data/MomentVisibilityStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 1222
    .line 1223
    invoke-virtual {v1, v12, v6}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 1224
    .line 1225
    .line 1226
    move-result-object v1

    .line 1227
    check-cast v1, Lcom/p1/mobile/putong/feed/data/MomentVisibilityStatus;

    .line 1228
    .line 1229
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/MomentSettings;->visibility:Lcom/p1/mobile/putong/feed/data/MomentVisibilityStatus;

    .line 1230
    .line 1231
    sget-object v0, Lcom/p1/mobile/putong/data/DyMomentSource;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 1232
    .line 1233
    invoke-virtual {v0, v13, v9}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 1234
    .line 1235
    .line 1236
    move-result-object v0

    .line 1237
    check-cast v0, Lcom/p1/mobile/putong/data/DyMomentSource;

    .line 1238
    .line 1239
    iput-object v0, v4, Lcom/p1/mobile/putong/feed/data/Moment;->dynamicType:Lcom/p1/mobile/putong/data/DyMomentSource;

    .line 1240
    .line 1241
    sget-object v0, Lcom/p1/mobile/putong/data/MomentType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 1242
    .line 1243
    invoke-virtual {v0, v14, v10}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 1244
    .line 1245
    .line 1246
    move-result-object v0

    .line 1247
    check-cast v0, Lcom/p1/mobile/putong/data/MomentType;

    .line 1248
    .line 1249
    iput-object v0, v4, Lcom/p1/mobile/putong/feed/data/Moment;->momentType:Lcom/p1/mobile/putong/data/MomentType;

    .line 1250
    .line 1251
    iget-object v0, v4, Lcom/p1/mobile/putong/feed/data/Moment;->settings:Lcom/p1/mobile/putong/feed/data/MomentSettings;

    .line 1252
    .line 1253
    sget-object v1, Lcom/p1/mobile/putong/feed/data/MomentVisibleState;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 1254
    .line 1255
    invoke-virtual {v1, v15, v11}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 1256
    .line 1257
    .line 1258
    move-result-object v1

    .line 1259
    check-cast v1, Lcom/p1/mobile/putong/feed/data/MomentVisibleState;

    .line 1260
    .line 1261
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/MomentSettings;->userSetVisibility:Lcom/p1/mobile/putong/feed/data/MomentVisibleState;

    .line 1262
    .line 1263
    sget-object v0, Lcom/p1/mobile/putong/feed/data/UserSetVisibility;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 1264
    .line 1265
    invoke-virtual {v0, v2, v5}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 1266
    .line 1267
    .line 1268
    move-result-object v0

    .line 1269
    check-cast v0, Lcom/p1/mobile/putong/feed/data/UserSetVisibility;

    .line 1270
    .line 1271
    iput-object v0, v4, Lcom/p1/mobile/putong/feed/data/Moment;->userSetVisibility:Lcom/p1/mobile/putong/feed/data/UserSetVisibility;

    .line 1272
    .line 1273
    iget-object v0, v4, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 1274
    .line 1275
    const-string v1, ""

    .line 1276
    .line 1277
    if-nez v0, :cond_36

    .line 1278
    .line 1279
    iput-object v1, v4, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 1280
    .line 1281
    :cond_36
    iget-object v0, v4, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 1282
    .line 1283
    if-nez v0, :cond_37

    .line 1284
    .line 1285
    iput-object v1, v4, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 1286
    .line 1287
    :cond_37
    iget-object v0, v4, Lcom/p1/mobile/putong/feed/data/Moment;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 1288
    .line 1289
    if-nez v0, :cond_38

    .line 1290
    .line 1291
    invoke-static {}, Lcom/p1/mobile/putong/data/PartialIdList;->new_()Lcom/p1/mobile/putong/data/PartialIdList;

    .line 1292
    .line 1293
    .line 1294
    move-result-object v0

    .line 1295
    iput-object v0, v4, Lcom/p1/mobile/putong/feed/data/Moment;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 1296
    .line 1297
    :cond_38
    iget-object v0, v4, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 1298
    .line 1299
    if-nez v0, :cond_39

    .line 1300
    .line 1301
    new-instance v0, Ljava/util/ArrayList;

    .line 1302
    .line 1303
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1304
    .line 1305
    .line 1306
    iput-object v0, v4, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 1307
    .line 1308
    :cond_39
    iget-object v0, v4, Lcom/p1/mobile/putong/feed/data/Moment;->landingPage:Ljava/lang/String;

    .line 1309
    .line 1310
    if-nez v0, :cond_3a

    .line 1311
    .line 1312
    iput-object v1, v4, Lcom/p1/mobile/putong/feed/data/Moment;->landingPage:Ljava/lang/String;

    .line 1313
    .line 1314
    :cond_3a
    iget-object v0, v4, Lcom/p1/mobile/putong/feed/data/Moment;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 1315
    .line 1316
    if-nez v0, :cond_3b

    .line 1317
    .line 1318
    invoke-static {}, Lcom/p1/mobile/putong/data/PartialIdList;->new_()Lcom/p1/mobile/putong/data/PartialIdList;

    .line 1319
    .line 1320
    .line 1321
    move-result-object v0

    .line 1322
    iput-object v0, v4, Lcom/p1/mobile/putong/feed/data/Moment;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 1323
    .line 1324
    :cond_3b
    iget-object v0, v4, Lcom/p1/mobile/putong/feed/data/Moment;->settings:Lcom/p1/mobile/putong/feed/data/MomentSettings;

    .line 1325
    .line 1326
    if-nez v0, :cond_3c

    .line 1327
    .line 1328
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/MomentSettings;->new_()Lcom/p1/mobile/putong/feed/data/MomentSettings;

    .line 1329
    .line 1330
    .line 1331
    move-result-object v0

    .line 1332
    iput-object v0, v4, Lcom/p1/mobile/putong/feed/data/Moment;->settings:Lcom/p1/mobile/putong/feed/data/MomentSettings;

    .line 1333
    .line 1334
    :cond_3c
    iget-object v0, v4, Lcom/p1/mobile/putong/feed/data/Moment;->musicId:Ljava/lang/String;

    .line 1335
    .line 1336
    if-nez v0, :cond_3d

    .line 1337
    .line 1338
    iput-object v1, v4, Lcom/p1/mobile/putong/feed/data/Moment;->musicId:Ljava/lang/String;

    .line 1339
    .line 1340
    :cond_3d
    iget-object v0, v4, Lcom/p1/mobile/putong/feed/data/Moment;->status:Ljava/lang/String;

    .line 1341
    .line 1342
    if-nez v0, :cond_3e

    .line 1343
    .line 1344
    iput-object v1, v4, Lcom/p1/mobile/putong/feed/data/Moment;->status:Ljava/lang/String;

    .line 1345
    .line 1346
    :cond_3e
    iget-object v0, v4, Lcom/p1/mobile/putong/feed/data/Moment;->topics:Ljava/util/List;

    .line 1347
    .line 1348
    if-nez v0, :cond_3f

    .line 1349
    .line 1350
    new-instance v0, Ljava/util/ArrayList;

    .line 1351
    .line 1352
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1353
    .line 1354
    .line 1355
    iput-object v0, v4, Lcom/p1/mobile/putong/feed/data/Moment;->topics:Ljava/util/List;

    .line 1356
    .line 1357
    :cond_3f
    iget-object v0, v4, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 1358
    .line 1359
    if-nez v0, :cond_40

    .line 1360
    .line 1361
    invoke-static {}, Lcom/p1/mobile/putong/data/Live;->new_()Lcom/p1/mobile/putong/data/Live;

    .line 1362
    .line 1363
    .line 1364
    move-result-object v0

    .line 1365
    iput-object v0, v4, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 1366
    .line 1367
    :cond_40
    iget-object v0, v4, Lcom/p1/mobile/putong/feed/data/Moment;->voiceLive:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 1368
    .line 1369
    if-nez v0, :cond_41

    .line 1370
    .line 1371
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/VoiceLive;->new_()Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 1372
    .line 1373
    .line 1374
    move-result-object v0

    .line 1375
    iput-object v0, v4, Lcom/p1/mobile/putong/feed/data/Moment;->voiceLive:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 1376
    .line 1377
    :cond_41
    iget-object v0, v4, Lcom/p1/mobile/putong/feed/data/Moment;->liveState:Ljava/lang/String;

    .line 1378
    .line 1379
    if-nez v0, :cond_42

    .line 1380
    .line 1381
    iput-object v1, v4, Lcom/p1/mobile/putong/feed/data/Moment;->liveState:Ljava/lang/String;

    .line 1382
    .line 1383
    :cond_42
    iget-object v0, v4, Lcom/p1/mobile/putong/feed/data/Moment;->iconTitle:Ljava/lang/String;

    .line 1384
    .line 1385
    if-nez v0, :cond_43

    .line 1386
    .line 1387
    iput-object v1, v4, Lcom/p1/mobile/putong/feed/data/Moment;->iconTitle:Ljava/lang/String;

    .line 1388
    .line 1389
    :cond_43
    iget-object v0, v4, Lcom/p1/mobile/putong/feed/data/Moment;->labels:Ljava/util/List;

    .line 1390
    .line 1391
    if-nez v0, :cond_44

    .line 1392
    .line 1393
    new-instance v0, Ljava/util/ArrayList;

    .line 1394
    .line 1395
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1396
    .line 1397
    .line 1398
    iput-object v0, v4, Lcom/p1/mobile/putong/feed/data/Moment;->labels:Ljava/util/List;

    .line 1399
    .line 1400
    :cond_44
    iget-object v0, v4, Lcom/p1/mobile/putong/feed/data/Moment;->hyperlink:Ljava/lang/String;

    .line 1401
    .line 1402
    if-nez v0, :cond_45

    .line 1403
    .line 1404
    iput-object v1, v4, Lcom/p1/mobile/putong/feed/data/Moment;->hyperlink:Ljava/lang/String;

    .line 1405
    .line 1406
    :cond_45
    iget-object v0, v4, Lcom/p1/mobile/putong/feed/data/Moment;->simpleActivity:Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;

    .line 1407
    .line 1408
    if-nez v0, :cond_46

    .line 1409
    .line 1410
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;->new_()Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;

    .line 1411
    .line 1412
    .line 1413
    move-result-object v0

    .line 1414
    iput-object v0, v4, Lcom/p1/mobile/putong/feed/data/Moment;->simpleActivity:Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;

    .line 1415
    .line 1416
    :cond_46
    iget-object v0, v4, Lcom/p1/mobile/putong/feed/data/Moment;->additionalData:Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;

    .line 1417
    .line 1418
    if-nez v0, :cond_47

    .line 1419
    .line 1420
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;->new_()Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;

    .line 1421
    .line 1422
    .line 1423
    move-result-object v0

    .line 1424
    iput-object v0, v4, Lcom/p1/mobile/putong/feed/data/Moment;->additionalData:Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;

    .line 1425
    .line 1426
    :cond_47
    iget-object v0, v4, Lcom/p1/mobile/putong/feed/data/Moment;->group:Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 1427
    .line 1428
    if-nez v0, :cond_48

    .line 1429
    .line 1430
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/GroupIdBox;->new_()Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 1431
    .line 1432
    .line 1433
    move-result-object v0

    .line 1434
    iput-object v0, v4, Lcom/p1/mobile/putong/feed/data/Moment;->group:Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 1435
    .line 1436
    :cond_48
    iget-object v0, v4, Lcom/p1/mobile/putong/feed/data/Moment;->deeplink:Ljava/lang/String;

    .line 1437
    .line 1438
    if-nez v0, :cond_49

    .line 1439
    .line 1440
    iput-object v1, v4, Lcom/p1/mobile/putong/feed/data/Moment;->deeplink:Ljava/lang/String;

    .line 1441
    .line 1442
    :cond_49
    iget-object v0, v4, Lcom/p1/mobile/putong/feed/data/Moment;->thirdShareSource:Lcom/p1/mobile/putong/feed/data/ThirdShareSource;

    .line 1443
    .line 1444
    if-nez v0, :cond_4a

    .line 1445
    .line 1446
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/ThirdShareSource;->new_()Lcom/p1/mobile/putong/feed/data/ThirdShareSource;

    .line 1447
    .line 1448
    .line 1449
    move-result-object v0

    .line 1450
    iput-object v0, v4, Lcom/p1/mobile/putong/feed/data/Moment;->thirdShareSource:Lcom/p1/mobile/putong/feed/data/ThirdShareSource;

    .line 1451
    .line 1452
    :cond_4a
    iget-object v0, v4, Lcom/p1/mobile/putong/feed/data/Moment;->attitudes:Lcom/p1/mobile/putong/feed/data/Attitudes;

    .line 1453
    .line 1454
    if-nez v0, :cond_4b

    .line 1455
    .line 1456
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/Attitudes;->new_()Lcom/p1/mobile/putong/feed/data/Attitudes;

    .line 1457
    .line 1458
    .line 1459
    move-result-object v0

    .line 1460
    iput-object v0, v4, Lcom/p1/mobile/putong/feed/data/Moment;->attitudes:Lcom/p1/mobile/putong/feed/data/Attitudes;

    .line 1461
    .line 1462
    :cond_4b
    iget-object v0, v4, Lcom/p1/mobile/putong/feed/data/Moment;->allowForward:Lcom/p1/mobile/putong/feed/data/MomentAllowForwardState;

    .line 1463
    .line 1464
    if-nez v0, :cond_4c

    .line 1465
    .line 1466
    sget-object v0, Lcom/p1/mobile/putong/feed/data/MomentAllowForwardState;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 1467
    .line 1468
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 1469
    .line 1470
    .line 1471
    move-result-object v0

    .line 1472
    check-cast v0, Lcom/p1/mobile/putong/feed/data/MomentAllowForwardState;

    .line 1473
    .line 1474
    iput-object v0, v4, Lcom/p1/mobile/putong/feed/data/Moment;->allowForward:Lcom/p1/mobile/putong/feed/data/MomentAllowForwardState;

    .line 1475
    .line 1476
    :cond_4c
    iget-object v0, v4, Lcom/p1/mobile/putong/feed/data/Moment;->forwards:Lcom/p1/mobile/putong/feed/data/MomentForwards;

    .line 1477
    .line 1478
    if-nez v0, :cond_4d

    .line 1479
    .line 1480
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/MomentForwards;->new_()Lcom/p1/mobile/putong/feed/data/MomentForwards;

    .line 1481
    .line 1482
    .line 1483
    move-result-object v0

    .line 1484
    iput-object v0, v4, Lcom/p1/mobile/putong/feed/data/Moment;->forwards:Lcom/p1/mobile/putong/feed/data/MomentForwards;

    .line 1485
    .line 1486
    :cond_4d
    iget-object v0, v4, Lcom/p1/mobile/putong/feed/data/Moment;->momentViewer:Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 1487
    .line 1488
    if-nez v0, :cond_4e

    .line 1489
    .line 1490
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/MomentViewerBox;->new_()Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 1491
    .line 1492
    .line 1493
    move-result-object v0

    .line 1494
    iput-object v0, v4, Lcom/p1/mobile/putong/feed/data/Moment;->momentViewer:Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 1495
    .line 1496
    :cond_4e
    iget-object v0, v4, Lcom/p1/mobile/putong/feed/data/Moment;->notifyUsers:Ljava/util/List;

    .line 1497
    .line 1498
    if-nez v0, :cond_4f

    .line 1499
    .line 1500
    new-instance v0, Ljava/util/ArrayList;

    .line 1501
    .line 1502
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1503
    .line 1504
    .line 1505
    iput-object v0, v4, Lcom/p1/mobile/putong/feed/data/Moment;->notifyUsers:Ljava/util/List;

    .line 1506
    .line 1507
    :cond_4f
    iget-object v0, v4, Lcom/p1/mobile/putong/feed/data/Moment;->report:Ljava/lang/String;

    .line 1508
    .line 1509
    if-nez v0, :cond_50

    .line 1510
    .line 1511
    iput-object v1, v4, Lcom/p1/mobile/putong/feed/data/Moment;->report:Ljava/lang/String;

    .line 1512
    .line 1513
    :cond_50
    return-object v4
.end method

.method public bridge synthetic read(Landroid/database/Cursor;I)Ljava/lang/Object;
    .locals 0

    .line 1514
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/data/Moment$59;->read(Landroid/database/Cursor;I)Lcom/p1/mobile/putong/feed/data/Moment;

    move-result-object p0

    return-object p0
.end method

.method public write(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/content/ContentValues;)V
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
    const-string v0, "localCreatedSession_c"

    .line 10
    .line 11
    iget v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->localCreatedSession:I

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
    const-string v0, "localInFeed_c"

    .line 21
    .line 22
    iget-boolean v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->localInFeed:Z

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
    const-string v0, "localInUserFeed_c"

    .line 32
    .line 33
    iget-boolean v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->localInUserFeed:Z

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
    const-string v0, "value_c"

    .line 43
    .line 44
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 45
    .line 46
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    const-string v0, "createdTime_c"

    .line 50
    .line 51
    iget-wide v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->createdTime:D

    .line 52
    .line 53
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Double;)V

    .line 58
    .line 59
    .line 60
    const-string v0, "owner_c"

    .line 61
    .line 62
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 63
    .line 64
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    const-string v0, "likes_count_c"

    .line 68
    .line 69
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 70
    .line 71
    iget v1, v1, Lcom/p1/mobile/putong/data/PartialIdList;->count:I

    .line 72
    .line 73
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 78
    .line 79
    .line 80
    const-string v0, "likes_ids_c"

    .line 81
    .line 82
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 83
    .line 84
    iget-object v1, v1, Lcom/p1/mobile/putong/data/PartialIdList;->ids:Ljava/util/List;

    .line 85
    .line 86
    if-nez v1, :cond_0

    .line 87
    .line 88
    move-object v1, p0

    .line 89
    goto :goto_0

    .line 90
    :cond_0
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 91
    .line 92
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/data/Moment;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 97
    .line 98
    iget-object v2, v2, Lcom/p1/mobile/putong/data/PartialIdList;->ids:Ljava/util/List;

    .line 99
    .line 100
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    :goto_0
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 105
    .line 106
    .line 107
    const-string v0, "likes_links_previous_c"

    .line 108
    .line 109
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 110
    .line 111
    iget-object v1, v1, Lcom/p1/mobile/putong/data/PartialIdList;->links:Lcom/p1/mobile/putong/data/Links;

    .line 112
    .line 113
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Links;->previous:Ljava/lang/String;

    .line 114
    .line 115
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    const-string v0, "likes_links_next_c"

    .line 119
    .line 120
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 121
    .line 122
    iget-object v1, v1, Lcom/p1/mobile/putong/data/PartialIdList;->links:Lcom/p1/mobile/putong/data/Links;

    .line 123
    .line 124
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 125
    .line 126
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    const-string v0, "haveLiked_c"

    .line 130
    .line 131
    iget-boolean v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->haveLiked:Z

    .line 132
    .line 133
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 138
    .line 139
    .line 140
    const-string v0, "location_c"

    .line 141
    .line 142
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 143
    .line 144
    if-nez v1, :cond_1

    .line 145
    .line 146
    move-object v1, p0

    .line 147
    goto :goto_1

    .line 148
    :cond_1
    sget-object v2, Lcom/p1/mobile/putong/data/MessageLocation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 149
    .line 150
    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 151
    .line 152
    .line 153
    move-result-object v1

    .line 154
    :goto_1
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 155
    .line 156
    .line 157
    const-string v0, "media_c"

    .line 158
    .line 159
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 160
    .line 161
    if-nez v1, :cond_2

    .line 162
    .line 163
    move-object v1, p0

    .line 164
    goto :goto_2

    .line 165
    :cond_2
    sget-object v1, Lcom/p1/mobile/putong/data/Media;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 166
    .line 167
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 168
    .line 169
    .line 170
    move-result-object v1

    .line 171
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 172
    .line 173
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 174
    .line 175
    .line 176
    move-result-object v1

    .line 177
    :goto_2
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 178
    .line 179
    .line 180
    const-string v0, "landingPage_c"

    .line 181
    .line 182
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->landingPage:Ljava/lang/String;

    .line 183
    .line 184
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 185
    .line 186
    .line 187
    const-string v0, "messages_count_c"

    .line 188
    .line 189
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 190
    .line 191
    iget v1, v1, Lcom/p1/mobile/putong/data/PartialIdList;->count:I

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
    const-string v0, "messages_ids_c"

    .line 201
    .line 202
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 203
    .line 204
    iget-object v1, v1, Lcom/p1/mobile/putong/data/PartialIdList;->ids:Ljava/util/List;

    .line 205
    .line 206
    if-nez v1, :cond_3

    .line 207
    .line 208
    move-object v1, p0

    .line 209
    goto :goto_3

    .line 210
    :cond_3
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 211
    .line 212
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 213
    .line 214
    .line 215
    move-result-object v1

    .line 216
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/data/Moment;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 217
    .line 218
    iget-object v2, v2, Lcom/p1/mobile/putong/data/PartialIdList;->ids:Ljava/util/List;

    .line 219
    .line 220
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 221
    .line 222
    .line 223
    move-result-object v1

    .line 224
    :goto_3
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 225
    .line 226
    .line 227
    const-string v0, "messages_links_previous_c"

    .line 228
    .line 229
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 230
    .line 231
    iget-object v1, v1, Lcom/p1/mobile/putong/data/PartialIdList;->links:Lcom/p1/mobile/putong/data/Links;

    .line 232
    .line 233
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Links;->previous:Ljava/lang/String;

    .line 234
    .line 235
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 236
    .line 237
    .line 238
    const-string v0, "messages_links_next_c"

    .line 239
    .line 240
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 241
    .line 242
    iget-object v1, v1, Lcom/p1/mobile/putong/data/PartialIdList;->links:Lcom/p1/mobile/putong/data/Links;

    .line 243
    .line 244
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 245
    .line 246
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 247
    .line 248
    .line 249
    const-string v0, "str_settings_visibility_c"

    .line 250
    .line 251
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->settings:Lcom/p1/mobile/putong/feed/data/MomentSettings;

    .line 252
    .line 253
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/MomentSettings;->visibility:Lcom/p1/mobile/putong/feed/data/MomentVisibilityStatus;

    .line 254
    .line 255
    if-nez v1, :cond_4

    .line 256
    .line 257
    move-object v1, p0

    .line 258
    goto :goto_4

    .line 259
    :cond_4
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 260
    .line 261
    .line 262
    move-result-object v1

    .line 263
    :goto_4
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 264
    .line 265
    .line 266
    const-string v0, "settings_visibility_c"

    .line 267
    .line 268
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->settings:Lcom/p1/mobile/putong/feed/data/MomentSettings;

    .line 269
    .line 270
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/MomentSettings;->visibility:Lcom/p1/mobile/putong/feed/data/MomentVisibilityStatus;

    .line 271
    .line 272
    if-nez v1, :cond_5

    .line 273
    .line 274
    move-object v1, p0

    .line 275
    goto :goto_5

    .line 276
    :cond_5
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 277
    .line 278
    .line 279
    move-result v1

    .line 280
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 281
    .line 282
    .line 283
    move-result-object v1

    .line 284
    :goto_5
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 285
    .line 286
    .line 287
    const-string v0, "settings_muted_c"

    .line 288
    .line 289
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->settings:Lcom/p1/mobile/putong/feed/data/MomentSettings;

    .line 290
    .line 291
    iget-boolean v1, v1, Lcom/p1/mobile/putong/feed/data/MomentSettings;->muted:Z

    .line 292
    .line 293
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 294
    .line 295
    .line 296
    move-result-object v1

    .line 297
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 298
    .line 299
    .line 300
    const-string v0, "str_dynamicType_c"

    .line 301
    .line 302
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->dynamicType:Lcom/p1/mobile/putong/data/DyMomentSource;

    .line 303
    .line 304
    if-nez v1, :cond_6

    .line 305
    .line 306
    move-object v1, p0

    .line 307
    goto :goto_6

    .line 308
    :cond_6
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 309
    .line 310
    .line 311
    move-result-object v1

    .line 312
    :goto_6
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 313
    .line 314
    .line 315
    const-string v0, "dynamicType_c"

    .line 316
    .line 317
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->dynamicType:Lcom/p1/mobile/putong/data/DyMomentSource;

    .line 318
    .line 319
    if-nez v1, :cond_7

    .line 320
    .line 321
    move-object v1, p0

    .line 322
    goto :goto_7

    .line 323
    :cond_7
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 324
    .line 325
    .line 326
    move-result v1

    .line 327
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 328
    .line 329
    .line 330
    move-result-object v1

    .line 331
    :goto_7
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 332
    .line 333
    .line 334
    const-string v0, "musicId_c"

    .line 335
    .line 336
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->musicId:Ljava/lang/String;

    .line 337
    .line 338
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 339
    .line 340
    .line 341
    const-string v0, "status_c"

    .line 342
    .line 343
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->status:Ljava/lang/String;

    .line 344
    .line 345
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 346
    .line 347
    .line 348
    const-string v0, "str_momentType_c"

    .line 349
    .line 350
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->momentType:Lcom/p1/mobile/putong/data/MomentType;

    .line 351
    .line 352
    if-nez v1, :cond_8

    .line 353
    .line 354
    move-object v1, p0

    .line 355
    goto :goto_8

    .line 356
    :cond_8
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 357
    .line 358
    .line 359
    move-result-object v1

    .line 360
    :goto_8
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 361
    .line 362
    .line 363
    const-string v0, "momentType_c"

    .line 364
    .line 365
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->momentType:Lcom/p1/mobile/putong/data/MomentType;

    .line 366
    .line 367
    if-nez v1, :cond_9

    .line 368
    .line 369
    move-object v1, p0

    .line 370
    goto :goto_9

    .line 371
    :cond_9
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 372
    .line 373
    .line 374
    move-result v1

    .line 375
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 376
    .line 377
    .line 378
    move-result-object v1

    .line 379
    :goto_9
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 380
    .line 381
    .line 382
    const-string v0, "topics_c"

    .line 383
    .line 384
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->topics:Ljava/util/List;

    .line 385
    .line 386
    if-nez v1, :cond_a

    .line 387
    .line 388
    move-object v1, p0

    .line 389
    goto :goto_a

    .line 390
    :cond_a
    sget-object v1, Lcom/p1/mobile/putong/data/TopicMomentIdBox;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 391
    .line 392
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 393
    .line 394
    .line 395
    move-result-object v1

    .line 396
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/data/Moment;->topics:Ljava/util/List;

    .line 397
    .line 398
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 399
    .line 400
    .line 401
    move-result-object v1

    .line 402
    :goto_a
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 403
    .line 404
    .line 405
    const-string v0, "str_settings_userSetVisibility_c"

    .line 406
    .line 407
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->settings:Lcom/p1/mobile/putong/feed/data/MomentSettings;

    .line 408
    .line 409
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/MomentSettings;->userSetVisibility:Lcom/p1/mobile/putong/feed/data/MomentVisibleState;

    .line 410
    .line 411
    if-nez v1, :cond_b

    .line 412
    .line 413
    move-object v1, p0

    .line 414
    goto :goto_b

    .line 415
    :cond_b
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 416
    .line 417
    .line 418
    move-result-object v1

    .line 419
    :goto_b
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 420
    .line 421
    .line 422
    const-string v0, "settings_userSetVisibility_c"

    .line 423
    .line 424
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->settings:Lcom/p1/mobile/putong/feed/data/MomentSettings;

    .line 425
    .line 426
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/MomentSettings;->userSetVisibility:Lcom/p1/mobile/putong/feed/data/MomentVisibleState;

    .line 427
    .line 428
    if-nez v1, :cond_c

    .line 429
    .line 430
    move-object v1, p0

    .line 431
    goto :goto_c

    .line 432
    :cond_c
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 433
    .line 434
    .line 435
    move-result v1

    .line 436
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 437
    .line 438
    .line 439
    move-result-object v1

    .line 440
    :goto_c
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 441
    .line 442
    .line 443
    const-string v0, "settings_anonymous_c"

    .line 444
    .line 445
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->settings:Lcom/p1/mobile/putong/feed/data/MomentSettings;

    .line 446
    .line 447
    iget-boolean v1, v1, Lcom/p1/mobile/putong/feed/data/MomentSettings;->anonymous:Z

    .line 448
    .line 449
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 450
    .line 451
    .line 452
    move-result-object v1

    .line 453
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 454
    .line 455
    .line 456
    const-string v0, "hyperlink_c"

    .line 457
    .line 458
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->hyperlink:Ljava/lang/String;

    .line 459
    .line 460
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 461
    .line 462
    .line 463
    const-string v0, "str_userSetVisibility_c"

    .line 464
    .line 465
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->userSetVisibility:Lcom/p1/mobile/putong/feed/data/UserSetVisibility;

    .line 466
    .line 467
    if-nez v1, :cond_d

    .line 468
    .line 469
    move-object v1, p0

    .line 470
    goto :goto_d

    .line 471
    :cond_d
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 472
    .line 473
    .line 474
    move-result-object v1

    .line 475
    :goto_d
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 476
    .line 477
    .line 478
    const-string v0, "userSetVisibility_c"

    .line 479
    .line 480
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->userSetVisibility:Lcom/p1/mobile/putong/feed/data/UserSetVisibility;

    .line 481
    .line 482
    if-nez v1, :cond_e

    .line 483
    .line 484
    move-object v1, p0

    .line 485
    goto :goto_e

    .line 486
    :cond_e
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 487
    .line 488
    .line 489
    move-result v1

    .line 490
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 491
    .line 492
    .line 493
    move-result-object v1

    .line 494
    :goto_e
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 495
    .line 496
    .line 497
    const-string v0, "simpleActivity_id_c"

    .line 498
    .line 499
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->simpleActivity:Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;

    .line 500
    .line 501
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;->id:Ljava/lang/String;

    .line 502
    .line 503
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 504
    .line 505
    .line 506
    const-string v0, "simpleActivity_name_c"

    .line 507
    .line 508
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->simpleActivity:Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;

    .line 509
    .line 510
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;->name:Ljava/lang/String;

    .line 511
    .line 512
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 513
    .line 514
    .line 515
    const-string v0, "additionalData_sendFrom_id_c"

    .line 516
    .line 517
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->additionalData:Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;

    .line 518
    .line 519
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;->sendFrom:Lcom/p1/mobile/putong/feed/data/MomentSendFrom;

    .line 520
    .line 521
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/MomentSendFrom;->id:Ljava/lang/String;

    .line 522
    .line 523
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 524
    .line 525
    .line 526
    const-string v0, "additionalData_sendFrom_name_c"

    .line 527
    .line 528
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->additionalData:Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;

    .line 529
    .line 530
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;->sendFrom:Lcom/p1/mobile/putong/feed/data/MomentSendFrom;

    .line 531
    .line 532
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/MomentSendFrom;->name:Ljava/lang/String;

    .line 533
    .line 534
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 535
    .line 536
    .line 537
    const-string v0, "additionalData_sendFrom_sourceType_c"

    .line 538
    .line 539
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->additionalData:Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;

    .line 540
    .line 541
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;->sendFrom:Lcom/p1/mobile/putong/feed/data/MomentSendFrom;

    .line 542
    .line 543
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/MomentSendFrom;->sourceType:Ljava/lang/String;

    .line 544
    .line 545
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 546
    .line 547
    .line 548
    const-string v0, "group_id_c"

    .line 549
    .line 550
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->group:Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 551
    .line 552
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/GroupIdBox;->id:Ljava/lang/String;

    .line 553
    .line 554
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 555
    .line 556
    .line 557
    const-string v0, "group_name_c"

    .line 558
    .line 559
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->group:Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 560
    .line 561
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/GroupIdBox;->name:Ljava/lang/String;

    .line 562
    .line 563
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 564
    .line 565
    .line 566
    const-string v0, "group_lastJoined_c"

    .line 567
    .line 568
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->group:Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 569
    .line 570
    iget-boolean v1, v1, Lcom/p1/mobile/putong/feed/data/GroupIdBox;->lastJoined:Z

    .line 571
    .line 572
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 573
    .line 574
    .line 575
    move-result-object v1

    .line 576
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 577
    .line 578
    .line 579
    const-string v0, "additionalData_share_title_c"

    .line 580
    .line 581
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->additionalData:Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;

    .line 582
    .line 583
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;->share:Lcom/p1/mobile/putong/feed/data/MomentShareInfo;

    .line 584
    .line 585
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->title:Ljava/lang/String;

    .line 586
    .line 587
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 588
    .line 589
    .line 590
    const-string v0, "additionalData_share_description_c"

    .line 591
    .line 592
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->additionalData:Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;

    .line 593
    .line 594
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;->share:Lcom/p1/mobile/putong/feed/data/MomentShareInfo;

    .line 595
    .line 596
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->description:Ljava/lang/String;

    .line 597
    .line 598
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 599
    .line 600
    .line 601
    const-string v0, "additionalData_share_url_c"

    .line 602
    .line 603
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->additionalData:Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;

    .line 604
    .line 605
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;->share:Lcom/p1/mobile/putong/feed/data/MomentShareInfo;

    .line 606
    .line 607
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->url:Ljava/lang/String;

    .line 608
    .line 609
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 610
    .line 611
    .line 612
    const-string v0, "additionalData_share_landingPage_c"

    .line 613
    .line 614
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->additionalData:Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;

    .line 615
    .line 616
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;->share:Lcom/p1/mobile/putong/feed/data/MomentShareInfo;

    .line 617
    .line 618
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->landingPage:Ljava/lang/String;

    .line 619
    .line 620
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 621
    .line 622
    .line 623
    const-string v0, "additionalData_share_name_c"

    .line 624
    .line 625
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->additionalData:Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;

    .line 626
    .line 627
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;->share:Lcom/p1/mobile/putong/feed/data/MomentShareInfo;

    .line 628
    .line 629
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->name:Ljava/lang/String;

    .line 630
    .line 631
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 632
    .line 633
    .line 634
    const-string v0, "additionalData_share_shareFrom_c"

    .line 635
    .line 636
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->additionalData:Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;

    .line 637
    .line 638
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;->share:Lcom/p1/mobile/putong/feed/data/MomentShareInfo;

    .line 639
    .line 640
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->shareFrom:Ljava/lang/String;

    .line 641
    .line 642
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 643
    .line 644
    .line 645
    const-string v0, "additionalData_share_testId_c"

    .line 646
    .line 647
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->additionalData:Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;

    .line 648
    .line 649
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;->share:Lcom/p1/mobile/putong/feed/data/MomentShareInfo;

    .line 650
    .line 651
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->testId:Ljava/lang/String;

    .line 652
    .line 653
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 654
    .line 655
    .line 656
    const-string v0, "deeplink_c"

    .line 657
    .line 658
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->deeplink:Ljava/lang/String;

    .line 659
    .line 660
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 661
    .line 662
    .line 663
    const-string v0, "thirdShareSource_sourceId_c"

    .line 664
    .line 665
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->thirdShareSource:Lcom/p1/mobile/putong/feed/data/ThirdShareSource;

    .line 666
    .line 667
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/ThirdShareSource;->sourceId:Ljava/lang/String;

    .line 668
    .line 669
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 670
    .line 671
    .line 672
    const-string v0, "thirdShareSource_sourceType_c"

    .line 673
    .line 674
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->thirdShareSource:Lcom/p1/mobile/putong/feed/data/ThirdShareSource;

    .line 675
    .line 676
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/ThirdShareSource;->sourceType:Ljava/lang/String;

    .line 677
    .line 678
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 679
    .line 680
    .line 681
    const-string v0, "attitudeId_c"

    .line 682
    .line 683
    iget v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->attitudeId:I

    .line 684
    .line 685
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 686
    .line 687
    .line 688
    move-result-object v1

    .line 689
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 690
    .line 691
    .line 692
    const-string v0, "attitudes_count_c"

    .line 693
    .line 694
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->attitudes:Lcom/p1/mobile/putong/feed/data/Attitudes;

    .line 695
    .line 696
    iget v1, v1, Lcom/p1/mobile/putong/feed/data/Attitudes;->count:I

    .line 697
    .line 698
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 699
    .line 700
    .line 701
    move-result-object v1

    .line 702
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 703
    .line 704
    .line 705
    const-string v0, "shareMyVote_c"

    .line 706
    .line 707
    iget-boolean v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->shareMyVote:Z

    .line 708
    .line 709
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 710
    .line 711
    .line 712
    move-result-object v1

    .line 713
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 714
    .line 715
    .line 716
    const-string v0, "simpleActivity_url_c"

    .line 717
    .line 718
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->simpleActivity:Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;

    .line 719
    .line 720
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;->url:Ljava/lang/String;

    .line 721
    .line 722
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 723
    .line 724
    .line 725
    const-string v0, "allowForward_c"

    .line 726
    .line 727
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->allowForward:Lcom/p1/mobile/putong/feed/data/MomentAllowForwardState;

    .line 728
    .line 729
    if-nez v1, :cond_f

    .line 730
    .line 731
    move-object v1, p0

    .line 732
    goto :goto_f

    .line 733
    :cond_f
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 734
    .line 735
    .line 736
    move-result-object v1

    .line 737
    :goto_f
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 738
    .line 739
    .line 740
    const-string v0, "forwards_count_c"

    .line 741
    .line 742
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->forwards:Lcom/p1/mobile/putong/feed/data/MomentForwards;

    .line 743
    .line 744
    iget v1, v1, Lcom/p1/mobile/putong/feed/data/MomentForwards;->count:I

    .line 745
    .line 746
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 747
    .line 748
    .line 749
    move-result-object v1

    .line 750
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 751
    .line 752
    .line 753
    const-string v0, "isNewUserAIMoment_c"

    .line 754
    .line 755
    iget-boolean p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->isNewUserAIMoment:Z

    .line 756
    .line 757
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 758
    .line 759
    .line 760
    move-result-object p1

    .line 761
    invoke-static {p2, v0, p1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 762
    .line 763
    .line 764
    return-void

    .line 765
    :catch_0
    move-exception p1

    .line 766
    invoke-static {p1, p0}, Lcom/google/protobuf/nano/MessageNano;->reportError(Ljava/lang/Exception;Landroid/database/Cursor;)V

    .line 767
    .line 768
    .line 769
    return-void
.end method

.method public bridge synthetic write(Ljava/lang/Object;Landroid/content/ContentValues;)V
    .locals 0

    .line 770
    check-cast p1, Lcom/p1/mobile/putong/feed/data/Moment;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/data/Moment$59;->write(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/content/ContentValues;)V

    return-void
.end method
