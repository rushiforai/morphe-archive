.class Lcom/p1/mobile/putong/data/User$191;
.super Ll/vzf0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/User;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/vzf0<",
        "Lcom/p1/mobile/putong/data/User;",
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
    const-string p1, " (_id INTEGER PRIMARY KEY,id_c TEXT,name_c TEXT,location_distance_c INTEGER,location_updatedTime_c REAL,location_region_district_c TEXT,location_region_city_c TEXT,location_region_country_c TEXT,location_passby_c BLOB,description_c TEXT,age_c INTEGER,pictures_c BLOB,createdTime_c REAL,profile_school_c TEXT,profile_hangouts_c TEXT,profile_hometown_c TEXT,profile_receivedLikes_c INTEGER,profile_tags_c BLOB,profile_job_c TEXT,profile_contactLookups_batchSize_c INTEGER,profile_contactLookups_lookups_c BLOB,profile_contactLookups_next_c TEXT,profile_social_c BLOB,profile_answers_c BLOB,profile_zodiac_c INTEGER,profile_occupation_c TEXT,status_c BLOB,settings_c BLOB,gender_c INTEGER,profile_work_industry_c TEXT,profile_work_department_c TEXT,profile_work_company_c TEXT,profile_work_active_c INTEGER,profile_studies_major_c TEXT,profile_studies_school_c TEXT,profile_studies_active_c INTEGER,profile_scenarios_c BLOB,profile_receivedLikesRank_c TEXT,localRelationship_c BLOB,membership_name_c INTEGER,membership_active_c INTEGER,membership_expiresTime_c REAL,source_c INTEGER,profile_studies_verified_c INTEGER,profile_studies_grade_c TEXT,profile_tbh_friends_c INTEGER,profile_tbh_receivedVotes_c INTEGER,profile_tbh_receivedVotedPolls_c INTEGER,profile_tbh_createdTime_c REAL,realName_c TEXT,profile_followships_counters_followings_c INTEGER,profile_followships_counters_followers_c INTEGER,profile_moments_hidePublicMoments_c INTEGER,profile_moments_counters_totalMoments_c INTEGER,profile_moments_counters_receiveMomentLikes_c INTEGER,localFollowship_c BLOB,membership_duration_c INTEGER,memberships_c BLOB,nameRemark_c TEXT,state_c BLOB,verifications_picVerificationResult_verified_c INTEGER,abGroups_c BLOB,privateAnswers_c BLOB,peepership_c BLOB,picksExpiredTimestamp_c INTEGER,picksSwipable_c INTEGER,picksTag_c TEXT,credit_c BLOB,goPlaceTimestamp_c REAL,isLord_c INTEGER,privateAnswersUpdatedTime_c REAL,sendLetter_c TEXT,sendLetterTimestamp_c INTEGER,receivedLetter_c TEXT,receivedLetterTimestamp_c INTEGER,popLevel_c INTEGER,voice_c BLOB,datingMode_c INTEGER,ussTags_c BLOB,membership_vipBadgeType_c INTEGER,abroad_c BLOB,fakeStatus_c BLOB,nameStatus_c BLOB,displayAudit_c INTEGER,visitPlace_c BLOB,publicId_c TEXT,soulSettings_c BLOB,richListPosition_c INTEGER,richListTracker_c TEXT,diamondVIPExpiresTime_c REAL,aiTag_c TEXT,friendCommentInfo_c BLOB,minRichListPosition_c INTEGER,membership_hideVIP_c INTEGER,ussTracker_c TEXT,profile_mood_c BLOB,verifications_idCard_verified_c INTEGER,membership_hideActivityTime_c INTEGER,profile_studies_qualification_c INTEGER,location_invisibleFields_c BLOB,profile_extensions_physical_bloodType_c BLOB,profile_extensions_business_cardType_c BLOB,profile_moodMoment_c BLOB,profile_bizAnswers_c BLOB,profile_extensions_interest_emoji_c BLOB,verifications_age_verified_c INTEGER,profile_extensions_basic_aboutMe_c BLOB,verifications_anchor_verified_c INTEGER,profile_extensions_basic_tickle_c BLOB,localLatestReceivedMessageTime_c INTEGER,verifications_others_otherDVIPSchool_verified_c INTEGER,verifications_others_otherDVIPCompany_verified_c INTEGER,verifications_others_otherDVIPJob_verified_c INTEGER,verifications_others_otherDVIPSalary_verified_c INTEGER,verifications_others_otherDVIPMembership_verified_c INTEGER,hierarchy_c BLOB,profile_extensions_basic_hobby_c BLOB,profile_extensions_basic_recent_c BLOB,profile_extensions_basic_together_c BLOB,profile_extensions_anonymity_id_c BLOB,profile_extensions_anonymity_identifier_c BLOB,localSoulShip_c BLOB,signupTime_c REAL,profile_extensions_headFrame_url_c BLOB,profile_extensions_headFrame_expiredTime_c BLOB,banStatus_c BLOB,profile_onlyShowAboutMeInside_c INTEGER,profile_extensions_basic_friendPurpose_c BLOB,profile_extensions_friendStatus_labelType_c BLOB,profile_extensions_friendStatus_labelName_c BLOB,profile_extensions_friendStatus_endTime_c BLOB,profile_extensions_friendStatus_status_c BLOB,localDiamondPrivateMatchTags_c BLOB,profile_extensions_basic_interest_c BLOB,anonymousLike_c BLOB,inactivated_c INTEGER,profile_extensions_basic_country_c BLOB,profile_extensions_basic_province_c BLOB,profile_extensions_basic_city_c BLOB,str_profile_zodiac_c TEXT,str_status_c BLOB,str_gender_c TEXT,str_membership_name_c TEXT,str_source_c TEXT,str_membership_vipBadgeType_c TEXT,str_profile_studies_qualification_c TEXT,str_location_invisibleFields_c BLOB,str_profile_extensions_physical_bloodType_c BLOB,str_profile_extensions_basic_friendPurpose_c BLOB,str_profile_extensions_friendStatus_status_c BLOB,profile_extensions_momentSwitch_noSyncMoment_c BLOB,profile_extensions_wealth_c BLOB,profile_extensions_basic_qualification_c BLOB,profile_extensions_physical_height_c BLOB,profile_extensions_profileCompletion_c BLOB,profile_extensions_voiceSignature_c BLOB,activityUser_action_c TEXT,activityUser_score_c INTEGER,matePlanUser_c INTEGER,matePlanAdUser_c INTEGER,regionTag_c TEXT,localLikeIdentifiers_c BLOB,deleted_c INTEGER,profile_extensions_interest_tags_c BLOB,profile_extensions_live_voiceImgId_c BLOB,profile_extensions_live_voiceImgUrl_c BLOB,profile_extensions_mate_c BLOB,profile_extensions_pet_c BLOB,profile_extensions_tailFrame_url_c BLOB,profile_extensions_tailFrame_expiredTime_c BLOB,profile_extensions_business_avatarID_c BLOB,profile_extensions_business_avatarExpireTime_c BLOB,profile_extensions_business_avatarClose_c BLOB,specialEffect_c BLOB,profile_extensions_basic_ethnicity_c BLOB,profile_extensions_basic_language_c BLOB,profile_extensions_voiceAvatarFrame_c BLOB,profile_extensions_physical_heightImg_c BLOB,profile_extensions_marriage_c BLOB,profile_extensions_basic_address_c BLOB,profile_extensions_basic_familyBackground_c BLOB,profile_extensions_physical_weight_c BLOB,verifications_others_otherCTDID_verified_c INTEGER,profile_extensions_game_c BLOB,profile_extensions_basic_facialFeature_c BLOB,verifications_idCard_age_c INTEGER,verifications_idCard_first4_c TEXT,profile_extensions_physical_fitness_c BLOB,profile_extensions_physical_drink_c BLOB,profile_extensions_physical_smoke_c BLOB,profile_extensions_basic_mbti_c BLOB,userActivityInfo_c BLOB,profile_extensions_basic_ideal_c BLOB,profile_extensions_basic_unideal_c BLOB,profile_moments_counters_totalNormalMoments_c INTEGER,profile_extensions_interest_taste_c BLOB,location_region_province_c TEXT,profile_extensions_basic_intlFriendPurpose_c BLOB,profile_extensions_basic_intlFriendPurposeV2_c BLOB)"

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
    const-class p0, Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    return-object p0
.end method

.method public init()Lcom/p1/mobile/putong/data/User;
    .locals 2

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/User;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 7
    .line 8
    const-string v1, ""

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iput-object v1, p0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 15
    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    invoke-static {}, Lcom/p1/mobile/putong/data/Location;->new_()Lcom/p1/mobile/putong/data/Location;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 23
    .line 24
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 25
    .line 26
    if-nez v0, :cond_2

    .line 27
    .line 28
    iput-object v1, p0, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 29
    .line 30
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 31
    .line 32
    if-nez v0, :cond_3

    .line 33
    .line 34
    const/4 v0, 0x0

    .line 35
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 40
    .line 41
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 42
    .line 43
    if-nez v0, :cond_4

    .line 44
    .line 45
    new-instance v0, Ljava/util/ArrayList;

    .line 46
    .line 47
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 48
    .line 49
    .line 50
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 51
    .line 52
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 53
    .line 54
    if-nez v0, :cond_5

    .line 55
    .line 56
    invoke-static {}, Lcom/p1/mobile/putong/data/Profile;->new_()Lcom/p1/mobile/putong/data/Profile;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 61
    .line 62
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 63
    .line 64
    if-nez v0, :cond_6

    .line 65
    .line 66
    new-instance v0, Ljava/util/ArrayList;

    .line 67
    .line 68
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 69
    .line 70
    .line 71
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 72
    .line 73
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 74
    .line 75
    if-nez v0, :cond_7

    .line 76
    .line 77
    sget-object v0, Lcom/p1/mobile/putong/data/Gender;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 78
    .line 79
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    check-cast v0, Lcom/p1/mobile/putong/data/Gender;

    .line 84
    .line 85
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 86
    .line 87
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->membership:Lcom/p1/mobile/putong/data/Membership;

    .line 88
    .line 89
    if-nez v0, :cond_8

    .line 90
    .line 91
    invoke-static {}, Lcom/p1/mobile/putong/data/Membership;->new_()Lcom/p1/mobile/putong/data/Membership;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->membership:Lcom/p1/mobile/putong/data/Membership;

    .line 96
    .line 97
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->realName:Ljava/lang/String;

    .line 98
    .line 99
    if-nez v0, :cond_9

    .line 100
    .line 101
    iput-object v1, p0, Lcom/p1/mobile/putong/data/User;->realName:Ljava/lang/String;

    .line 102
    .line 103
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->nameRemark:Ljava/lang/String;

    .line 104
    .line 105
    if-nez v0, :cond_a

    .line 106
    .line 107
    iput-object v1, p0, Lcom/p1/mobile/putong/data/User;->nameRemark:Ljava/lang/String;

    .line 108
    .line 109
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    .line 110
    .line 111
    if-nez v0, :cond_b

    .line 112
    .line 113
    invoke-static {}, Lcom/p1/mobile/putong/data/PicVerification;->new_()Lcom/p1/mobile/putong/data/PicVerification;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    .line 118
    .line 119
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->privateAnswers:Ljava/util/List;

    .line 120
    .line 121
    if-nez v0, :cond_c

    .line 122
    .line 123
    new-instance v0, Ljava/util/ArrayList;

    .line 124
    .line 125
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 126
    .line 127
    .line 128
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->privateAnswers:Ljava/util/List;

    .line 129
    .line 130
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->picksTag:Ljava/lang/String;

    .line 131
    .line 132
    if-nez v0, :cond_d

    .line 133
    .line 134
    iput-object v1, p0, Lcom/p1/mobile/putong/data/User;->picksTag:Ljava/lang/String;

    .line 135
    .line 136
    :cond_d
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->picksTracker:Ljava/lang/String;

    .line 137
    .line 138
    if-nez v0, :cond_e

    .line 139
    .line 140
    iput-object v1, p0, Lcom/p1/mobile/putong/data/User;->picksTracker:Ljava/lang/String;

    .line 141
    .line 142
    :cond_e
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->voice:Lcom/p1/mobile/putong/data/AudioSignature;

    .line 143
    .line 144
    if-nez v0, :cond_f

    .line 145
    .line 146
    invoke-static {}, Lcom/p1/mobile/putong/data/AudioSignature;->new_()Lcom/p1/mobile/putong/data/AudioSignature;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->voice:Lcom/p1/mobile/putong/data/AudioSignature;

    .line 151
    .line 152
    :cond_f
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->liveState:Lcom/p1/mobile/putong/data/UserLiveState;

    .line 153
    .line 154
    if-nez v0, :cond_10

    .line 155
    .line 156
    invoke-static {}, Lcom/p1/mobile/putong/data/UserLiveState;->new_()Lcom/p1/mobile/putong/data/UserLiveState;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->liveState:Lcom/p1/mobile/putong/data/UserLiveState;

    .line 161
    .line 162
    :cond_10
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->abroad:Lcom/p1/mobile/putong/data/UserAbroad;

    .line 163
    .line 164
    if-nez v0, :cond_11

    .line 165
    .line 166
    invoke-static {}, Lcom/p1/mobile/putong/data/UserAbroad;->new_()Lcom/p1/mobile/putong/data/UserAbroad;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->abroad:Lcom/p1/mobile/putong/data/UserAbroad;

    .line 171
    .line 172
    :cond_11
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->medal:Lcom/p1/mobile/putong/data/UserMedalWrapper;

    .line 173
    .line 174
    if-nez v0, :cond_12

    .line 175
    .line 176
    invoke-static {}, Lcom/p1/mobile/putong/data/UserMedalWrapper;->new_()Lcom/p1/mobile/putong/data/UserMedalWrapper;

    .line 177
    .line 178
    .line 179
    move-result-object v0

    .line 180
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->medal:Lcom/p1/mobile/putong/data/UserMedalWrapper;

    .line 181
    .line 182
    :cond_12
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->signupStage:Lcom/p1/mobile/putong/data/SignupStage;

    .line 183
    .line 184
    if-nez v0, :cond_13

    .line 185
    .line 186
    sget-object v0, Lcom/p1/mobile/putong/data/SignupStage;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 187
    .line 188
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    check-cast v0, Lcom/p1/mobile/putong/data/SignupStage;

    .line 193
    .line 194
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->signupStage:Lcom/p1/mobile/putong/data/SignupStage;

    .line 195
    .line 196
    :cond_13
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    .line 197
    .line 198
    if-nez v0, :cond_14

    .line 199
    .line 200
    iput-object v1, p0, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    .line 201
    .line 202
    :cond_14
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->soulSettings:Lcom/p1/mobile/putong/data/UserSoulSettings;

    .line 203
    .line 204
    if-nez v0, :cond_15

    .line 205
    .line 206
    invoke-static {}, Lcom/p1/mobile/putong/data/UserSoulSettings;->new_()Lcom/p1/mobile/putong/data/UserSoulSettings;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->soulSettings:Lcom/p1/mobile/putong/data/UserSoulSettings;

    .line 211
    .line 212
    :cond_15
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->richListTracker:Ljava/lang/String;

    .line 213
    .line 214
    if-nez v0, :cond_16

    .line 215
    .line 216
    iput-object v1, p0, Lcom/p1/mobile/putong/data/User;->richListTracker:Ljava/lang/String;

    .line 217
    .line 218
    :cond_16
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localRichListUsers:Lcom/p1/mobile/putong/data/RichListUsers;

    .line 219
    .line 220
    if-nez v0, :cond_17

    .line 221
    .line 222
    invoke-static {}, Lcom/p1/mobile/putong/data/RichListUsers;->new_()Lcom/p1/mobile/putong/data/RichListUsers;

    .line 223
    .line 224
    .line 225
    move-result-object v0

    .line 226
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->localRichListUsers:Lcom/p1/mobile/putong/data/RichListUsers;

    .line 227
    .line 228
    :cond_17
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->richListType:Ljava/lang/String;

    .line 229
    .line 230
    if-nez v0, :cond_18

    .line 231
    .line 232
    iput-object v1, p0, Lcom/p1/mobile/putong/data/User;->richListType:Ljava/lang/String;

    .line 233
    .line 234
    :cond_18
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->liveRevenueCampaignVip:Lcom/p1/mobile/putong/data/LiveRevenueCampaignVip;

    .line 235
    .line 236
    if-nez v0, :cond_19

    .line 237
    .line 238
    invoke-static {}, Lcom/p1/mobile/putong/data/LiveRevenueCampaignVip;->new_()Lcom/p1/mobile/putong/data/LiveRevenueCampaignVip;

    .line 239
    .line 240
    .line 241
    move-result-object v0

    .line 242
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->liveRevenueCampaignVip:Lcom/p1/mobile/putong/data/LiveRevenueCampaignVip;

    .line 243
    .line 244
    :cond_19
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->aiTag:Ljava/lang/String;

    .line 245
    .line 246
    if-nez v0, :cond_1a

    .line 247
    .line 248
    iput-object v1, p0, Lcom/p1/mobile/putong/data/User;->aiTag:Ljava/lang/String;

    .line 249
    .line 250
    :cond_1a
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->ussTracker:Ljava/lang/String;

    .line 251
    .line 252
    if-nez v0, :cond_1b

    .line 253
    .line 254
    iput-object v1, p0, Lcom/p1/mobile/putong/data/User;->ussTracker:Ljava/lang/String;

    .line 255
    .line 256
    :cond_1b
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->anchorHierarchy:Lcom/p1/mobile/putong/data/LiveAnchorLevel;

    .line 257
    .line 258
    if-nez v0, :cond_1c

    .line 259
    .line 260
    invoke-static {}, Lcom/p1/mobile/putong/data/LiveAnchorLevel;->new_()Lcom/p1/mobile/putong/data/LiveAnchorLevel;

    .line 261
    .line 262
    .line 263
    move-result-object v0

    .line 264
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->anchorHierarchy:Lcom/p1/mobile/putong/data/LiveAnchorLevel;

    .line 265
    .line 266
    :cond_1c
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->fanbaseHierarchy:Lcom/p1/mobile/putong/data/LiveFansClubLevel;

    .line 267
    .line 268
    if-nez v0, :cond_1d

    .line 269
    .line 270
    invoke-static {}, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->new_()Lcom/p1/mobile/putong/data/LiveFansClubLevel;

    .line 271
    .line 272
    .line 273
    move-result-object v0

    .line 274
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->fanbaseHierarchy:Lcom/p1/mobile/putong/data/LiveFansClubLevel;

    .line 275
    .line 276
    :cond_1d
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->avatarFrame:Lcom/p1/mobile/putong/data/AvatarFrame;

    .line 277
    .line 278
    if-nez v0, :cond_1e

    .line 279
    .line 280
    invoke-static {}, Lcom/p1/mobile/putong/data/AvatarFrame;->new_()Lcom/p1/mobile/putong/data/AvatarFrame;

    .line 281
    .line 282
    .line 283
    move-result-object v0

    .line 284
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->avatarFrame:Lcom/p1/mobile/putong/data/AvatarFrame;

    .line 285
    .line 286
    :cond_1e
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 287
    .line 288
    if-nez v0, :cond_1f

    .line 289
    .line 290
    invoke-static {}, Lcom/p1/mobile/putong/data/LiveUserLevel;->new_()Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 291
    .line 292
    .line 293
    move-result-object v0

    .line 294
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 295
    .line 296
    :cond_1f
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->banStatus:Lcom/p1/mobile/putong/data/BanStatus;

    .line 297
    .line 298
    if-nez v0, :cond_20

    .line 299
    .line 300
    invoke-static {}, Lcom/p1/mobile/putong/data/BanStatus;->new_()Lcom/p1/mobile/putong/data/BanStatus;

    .line 301
    .line 302
    .line 303
    move-result-object v0

    .line 304
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->banStatus:Lcom/p1/mobile/putong/data/BanStatus;

    .line 305
    .line 306
    :cond_20
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->finishedStages:Ljava/util/List;

    .line 307
    .line 308
    if-nez v0, :cond_21

    .line 309
    .line 310
    new-instance v0, Ljava/util/ArrayList;

    .line 311
    .line 312
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 313
    .line 314
    .line 315
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->finishedStages:Ljava/util/List;

    .line 316
    .line 317
    :cond_21
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->activityUser:Lcom/p1/mobile/putong/data/ActivityUser;

    .line 318
    .line 319
    if-nez v0, :cond_22

    .line 320
    .line 321
    invoke-static {}, Lcom/p1/mobile/putong/data/ActivityUser;->new_()Lcom/p1/mobile/putong/data/ActivityUser;

    .line 322
    .line 323
    .line 324
    move-result-object v0

    .line 325
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->activityUser:Lcom/p1/mobile/putong/data/ActivityUser;

    .line 326
    .line 327
    :cond_22
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->regionTag:Ljava/lang/String;

    .line 328
    .line 329
    if-nez v0, :cond_23

    .line 330
    .line 331
    iput-object v1, p0, Lcom/p1/mobile/putong/data/User;->regionTag:Ljava/lang/String;

    .line 332
    .line 333
    :cond_23
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localLikeIdentifiers:Ljava/util/List;

    .line 334
    .line 335
    if-nez v0, :cond_24

    .line 336
    .line 337
    new-instance v0, Ljava/util/ArrayList;

    .line 338
    .line 339
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 340
    .line 341
    .line 342
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->localLikeIdentifiers:Ljava/util/List;

    .line 343
    .line 344
    :cond_24
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->voiceLiveState:Lcom/p1/mobile/putong/data/VoiceLiveState;

    .line 345
    .line 346
    if-nez v0, :cond_25

    .line 347
    .line 348
    invoke-static {}, Lcom/p1/mobile/putong/data/VoiceLiveState;->new_()Lcom/p1/mobile/putong/data/VoiceLiveState;

    .line 349
    .line 350
    .line 351
    move-result-object v0

    .line 352
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->voiceLiveState:Lcom/p1/mobile/putong/data/VoiceLiveState;

    .line 353
    .line 354
    :cond_25
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localSeeReminderType:Ljava/lang/String;

    .line 355
    .line 356
    if-nez v0, :cond_26

    .line 357
    .line 358
    iput-object v1, p0, Lcom/p1/mobile/putong/data/User;->localSeeReminderType:Ljava/lang/String;

    .line 359
    .line 360
    :cond_26
    return-object p0
.end method

.method public bridge synthetic init()Ljava/lang/Object;
    .locals 0

    .line 361
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User$191;->init()Lcom/p1/mobile/putong/data/User;

    move-result-object p0

    return-object p0
.end method

.method public read(Landroid/database/Cursor;I)Lcom/p1/mobile/putong/data/User;
    .locals 27

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    .line 1
    const-string v3, "unknown_"

    const/4 v4, 0x0

    if-nez v2, :cond_0

    .line 2
    iput v4, v0, Ll/vzf0;->readIndex:I

    .line 3
    :cond_0
    new-instance v5, Lcom/p1/mobile/putong/data/User;

    invoke-direct {v5}, Lcom/p1/mobile/putong/data/User;-><init>()V

    .line 4
    :try_start_0
    new-instance v8, Lcom/p1/mobile/putong/data/Location;

    invoke-direct {v8}, Lcom/p1/mobile/putong/data/Location;-><init>()V

    iput-object v8, v5, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 5
    new-instance v8, Lcom/p1/mobile/putong/data/Profile;

    invoke-direct {v8}, Lcom/p1/mobile/putong/data/Profile;-><init>()V

    iput-object v8, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 6
    new-instance v8, Lcom/p1/mobile/putong/data/Membership;

    invoke-direct {v8}, Lcom/p1/mobile/putong/data/Membership;-><init>()V

    iput-object v8, v5, Lcom/p1/mobile/putong/data/User;->membership:Lcom/p1/mobile/putong/data/Membership;

    .line 7
    new-instance v8, Lcom/p1/mobile/putong/data/PicVerification;

    invoke-direct {v8}, Lcom/p1/mobile/putong/data/PicVerification;-><init>()V

    iput-object v8, v5, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    .line 8
    new-instance v8, Lcom/p1/mobile/putong/data/ActivityUser;

    invoke-direct {v8}, Lcom/p1/mobile/putong/data/ActivityUser;-><init>()V

    iput-object v8, v5, Lcom/p1/mobile/putong/data/User;->activityUser:Lcom/p1/mobile/putong/data/ActivityUser;

    .line 9
    iget-object v8, v5, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    new-instance v9, Lcom/p1/mobile/putong/data/Region;

    invoke-direct {v9}, Lcom/p1/mobile/putong/data/Region;-><init>()V

    iput-object v9, v8, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 10
    iget-object v8, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    new-instance v9, Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;

    invoke-direct {v9}, Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;-><init>()V

    iput-object v9, v8, Lcom/p1/mobile/putong/data/Profile;->contactLookups:Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;

    .line 11
    iget-object v8, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    new-instance v9, Lcom/p1/mobile/putong/data/Work;

    invoke-direct {v9}, Lcom/p1/mobile/putong/data/Work;-><init>()V

    iput-object v9, v8, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 12
    iget-object v8, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    new-instance v9, Lcom/p1/mobile/putong/data/Studies;

    invoke-direct {v9}, Lcom/p1/mobile/putong/data/Studies;-><init>()V

    iput-object v9, v8, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 13
    iget-object v8, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    new-instance v9, Lcom/p1/mobile/putong/data/ProfileTbh;

    invoke-direct {v9}, Lcom/p1/mobile/putong/data/ProfileTbh;-><init>()V

    iput-object v9, v8, Lcom/p1/mobile/putong/data/Profile;->tbh:Lcom/p1/mobile/putong/data/ProfileTbh;

    .line 14
    iget-object v8, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    new-instance v9, Lcom/p1/mobile/putong/data/FollowshipCounters;

    invoke-direct {v9}, Lcom/p1/mobile/putong/data/FollowshipCounters;-><init>()V

    iput-object v9, v8, Lcom/p1/mobile/putong/data/Profile;->followships:Lcom/p1/mobile/putong/data/FollowshipCounters;

    .line 15
    iget-object v8, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    new-instance v9, Lcom/p1/mobile/putong/data/Moments;

    invoke-direct {v9}, Lcom/p1/mobile/putong/data/Moments;-><init>()V

    iput-object v9, v8, Lcom/p1/mobile/putong/data/Profile;->moments:Lcom/p1/mobile/putong/data/Moments;

    .line 16
    iget-object v8, v5, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    new-instance v9, Lcom/p1/mobile/putong/data/PicVerificationResult;

    invoke-direct {v9}, Lcom/p1/mobile/putong/data/PicVerificationResult;-><init>()V

    iput-object v9, v8, Lcom/p1/mobile/putong/data/PicVerification;->picVerificationResult:Lcom/p1/mobile/putong/data/PicVerificationResult;

    .line 17
    iget-object v8, v5, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    new-instance v9, Lcom/p1/mobile/putong/data/IdVerificationResult;

    invoke-direct {v9}, Lcom/p1/mobile/putong/data/IdVerificationResult;-><init>()V

    iput-object v9, v8, Lcom/p1/mobile/putong/data/PicVerification;->idCard:Lcom/p1/mobile/putong/data/IdVerificationResult;

    .line 18
    iget-object v8, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    new-instance v9, Lcom/p1/mobile/putong/data/Extensions;

    invoke-direct {v9}, Lcom/p1/mobile/putong/data/Extensions;-><init>()V

    iput-object v9, v8, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 19
    iget-object v8, v5, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    new-instance v9, Lcom/p1/mobile/putong/data/VerificationResult;

    invoke-direct {v9}, Lcom/p1/mobile/putong/data/VerificationResult;-><init>()V

    iput-object v9, v8, Lcom/p1/mobile/putong/data/PicVerification;->age:Lcom/p1/mobile/putong/data/VerificationResult;

    .line 20
    iget-object v8, v5, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    new-instance v9, Lcom/p1/mobile/putong/data/VerificationResult;

    invoke-direct {v9}, Lcom/p1/mobile/putong/data/VerificationResult;-><init>()V

    iput-object v9, v8, Lcom/p1/mobile/putong/data/PicVerification;->anchor:Lcom/p1/mobile/putong/data/VerificationResult;

    .line 21
    iget-object v8, v5, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    new-instance v9, Lcom/p1/mobile/putong/data/OtherVerificationWrapper;

    invoke-direct {v9}, Lcom/p1/mobile/putong/data/OtherVerificationWrapper;-><init>()V

    iput-object v9, v8, Lcom/p1/mobile/putong/data/PicVerification;->others:Lcom/p1/mobile/putong/data/OtherVerificationWrapper;

    .line 22
    iget-object v8, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v8, v8, Lcom/p1/mobile/putong/data/Profile;->followships:Lcom/p1/mobile/putong/data/FollowshipCounters;

    new-instance v9, Lcom/p1/mobile/putong/data/FollowshipCounter;

    invoke-direct {v9}, Lcom/p1/mobile/putong/data/FollowshipCounter;-><init>()V

    iput-object v9, v8, Lcom/p1/mobile/putong/data/FollowshipCounters;->counters:Lcom/p1/mobile/putong/data/FollowshipCounter;

    .line 23
    iget-object v8, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v8, v8, Lcom/p1/mobile/putong/data/Profile;->moments:Lcom/p1/mobile/putong/data/Moments;

    new-instance v9, Lcom/p1/mobile/putong/data/MomentCounter;

    invoke-direct {v9}, Lcom/p1/mobile/putong/data/MomentCounter;-><init>()V

    iput-object v9, v8, Lcom/p1/mobile/putong/data/Moments;->counters:Lcom/p1/mobile/putong/data/MomentCounter;

    .line 24
    iget-object v8, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v8, v8, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    new-instance v9, Lcom/p1/mobile/putong/data/Physical;

    invoke-direct {v9}, Lcom/p1/mobile/putong/data/Physical;-><init>()V

    iput-object v9, v8, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 25
    iget-object v8, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v8, v8, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    new-instance v9, Lcom/p1/mobile/putong/data/Business;

    invoke-direct {v9}, Lcom/p1/mobile/putong/data/Business;-><init>()V

    iput-object v9, v8, Lcom/p1/mobile/putong/data/Extensions;->business:Lcom/p1/mobile/putong/data/Business;

    .line 26
    iget-object v8, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v8, v8, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    new-instance v9, Lcom/p1/mobile/putong/data/Interest;

    invoke-direct {v9}, Lcom/p1/mobile/putong/data/Interest;-><init>()V

    iput-object v9, v8, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 27
    iget-object v8, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v8, v8, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    new-instance v9, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    invoke-direct {v9}, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;-><init>()V

    iput-object v9, v8, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 28
    iget-object v8, v5, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    iget-object v8, v8, Lcom/p1/mobile/putong/data/PicVerification;->others:Lcom/p1/mobile/putong/data/OtherVerificationWrapper;

    new-instance v9, Lcom/p1/mobile/putong/data/VerificationResult;

    invoke-direct {v9}, Lcom/p1/mobile/putong/data/VerificationResult;-><init>()V

    iput-object v9, v8, Lcom/p1/mobile/putong/data/OtherVerificationWrapper;->otherDVIPSchool:Lcom/p1/mobile/putong/data/VerificationResult;

    .line 29
    iget-object v8, v5, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    iget-object v8, v8, Lcom/p1/mobile/putong/data/PicVerification;->others:Lcom/p1/mobile/putong/data/OtherVerificationWrapper;

    new-instance v9, Lcom/p1/mobile/putong/data/VerificationResult;

    invoke-direct {v9}, Lcom/p1/mobile/putong/data/VerificationResult;-><init>()V

    iput-object v9, v8, Lcom/p1/mobile/putong/data/OtherVerificationWrapper;->otherDVIPCompany:Lcom/p1/mobile/putong/data/VerificationResult;

    .line 30
    iget-object v8, v5, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    iget-object v8, v8, Lcom/p1/mobile/putong/data/PicVerification;->others:Lcom/p1/mobile/putong/data/OtherVerificationWrapper;

    new-instance v9, Lcom/p1/mobile/putong/data/VerificationResult;

    invoke-direct {v9}, Lcom/p1/mobile/putong/data/VerificationResult;-><init>()V

    iput-object v9, v8, Lcom/p1/mobile/putong/data/OtherVerificationWrapper;->otherDVIPJob:Lcom/p1/mobile/putong/data/VerificationResult;

    .line 31
    iget-object v8, v5, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    iget-object v8, v8, Lcom/p1/mobile/putong/data/PicVerification;->others:Lcom/p1/mobile/putong/data/OtherVerificationWrapper;

    new-instance v9, Lcom/p1/mobile/putong/data/VerificationResult;

    invoke-direct {v9}, Lcom/p1/mobile/putong/data/VerificationResult;-><init>()V

    iput-object v9, v8, Lcom/p1/mobile/putong/data/OtherVerificationWrapper;->otherDVIPSalary:Lcom/p1/mobile/putong/data/VerificationResult;

    .line 32
    iget-object v8, v5, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    iget-object v8, v8, Lcom/p1/mobile/putong/data/PicVerification;->others:Lcom/p1/mobile/putong/data/OtherVerificationWrapper;

    new-instance v9, Lcom/p1/mobile/putong/data/VerificationResult;

    invoke-direct {v9}, Lcom/p1/mobile/putong/data/VerificationResult;-><init>()V

    iput-object v9, v8, Lcom/p1/mobile/putong/data/OtherVerificationWrapper;->otherDVIPMembership:Lcom/p1/mobile/putong/data/VerificationResult;

    .line 33
    iget-object v8, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v8, v8, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    new-instance v9, Lcom/p1/mobile/putong/data/Anonymity;

    invoke-direct {v9}, Lcom/p1/mobile/putong/data/Anonymity;-><init>()V

    iput-object v9, v8, Lcom/p1/mobile/putong/data/Extensions;->anonymity:Lcom/p1/mobile/putong/data/Anonymity;

    .line 34
    iget-object v8, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v8, v8, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    new-instance v9, Lcom/p1/mobile/putong/data/HeadFrame;

    invoke-direct {v9}, Lcom/p1/mobile/putong/data/HeadFrame;-><init>()V

    iput-object v9, v8, Lcom/p1/mobile/putong/data/Extensions;->headFrame:Lcom/p1/mobile/putong/data/HeadFrame;

    .line 35
    iget-object v8, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v8, v8, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    new-instance v9, Lcom/p1/mobile/putong/data/FriendStatus;

    invoke-direct {v9}, Lcom/p1/mobile/putong/data/FriendStatus;-><init>()V

    iput-object v9, v8, Lcom/p1/mobile/putong/data/Extensions;->friendStatus:Lcom/p1/mobile/putong/data/FriendStatus;

    .line 36
    iget-object v8, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v8, v8, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    new-instance v9, Lcom/p1/mobile/putong/data/MomentSwitch;

    invoke-direct {v9}, Lcom/p1/mobile/putong/data/MomentSwitch;-><init>()V

    iput-object v9, v8, Lcom/p1/mobile/putong/data/Extensions;->momentSwitch:Lcom/p1/mobile/putong/data/MomentSwitch;

    .line 37
    iget-object v8, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v8, v8, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    new-instance v9, Lcom/p1/mobile/putong/data/VirtualVoiceLive;

    invoke-direct {v9}, Lcom/p1/mobile/putong/data/VirtualVoiceLive;-><init>()V

    iput-object v9, v8, Lcom/p1/mobile/putong/data/Extensions;->live:Lcom/p1/mobile/putong/data/VirtualVoiceLive;

    .line 38
    iget-object v8, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v8, v8, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    new-instance v9, Lcom/p1/mobile/putong/data/TailFrame;

    invoke-direct {v9}, Lcom/p1/mobile/putong/data/TailFrame;-><init>()V

    iput-object v9, v8, Lcom/p1/mobile/putong/data/Extensions;->tailFrame:Lcom/p1/mobile/putong/data/TailFrame;

    .line 39
    iget-object v8, v5, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    iget-object v8, v8, Lcom/p1/mobile/putong/data/PicVerification;->others:Lcom/p1/mobile/putong/data/OtherVerificationWrapper;

    new-instance v9, Lcom/p1/mobile/putong/data/VerificationResult;

    invoke-direct {v9}, Lcom/p1/mobile/putong/data/VerificationResult;-><init>()V

    iput-object v9, v8, Lcom/p1/mobile/putong/data/OtherVerificationWrapper;->otherCTDID:Lcom/p1/mobile/putong/data/VerificationResult;

    .line 40
    invoke-interface/range {p1 .. p2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v8

    iput-wide v8, v5, Lcom/tantanapp/common/data/DbObject;->_id:J

    add-int/lit8 v8, v2, 0x1

    .line 41
    invoke-interface {v1, v8}, Landroid/database/Cursor;->isNull(I)Z

    move-result v9

    if-eqz v9, :cond_1

    const/4 v8, 0x0

    goto :goto_0

    :cond_1
    invoke-interface {v1, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    :goto_0
    iput-object v8, v5, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    add-int/lit8 v8, v2, 0x2

    .line 42
    invoke-interface {v1, v8}, Landroid/database/Cursor;->isNull(I)Z

    move-result v9

    if-eqz v9, :cond_2

    const/4 v8, 0x0

    goto :goto_1

    :cond_2
    invoke-interface {v1, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    :goto_1
    iput-object v8, v5, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    add-int/lit8 v8, v2, 0x3

    .line 43
    iget-object v9, v5, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    invoke-interface {v1, v8}, Landroid/database/Cursor;->getInt(I)I

    move-result v8

    iput v8, v9, Lcom/p1/mobile/putong/data/Location;->distance:I

    add-int/lit8 v8, v2, 0x4

    .line 44
    iget-object v9, v5, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    invoke-interface {v1, v8}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v10

    iput-wide v10, v9, Lcom/p1/mobile/putong/data/Location;->updatedTime:D

    add-int/lit8 v8, v2, 0x5

    .line 45
    iget-object v9, v5, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    iget-object v9, v9, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 46
    invoke-interface {v1, v8}, Landroid/database/Cursor;->isNull(I)Z

    move-result v10

    if-eqz v10, :cond_3

    const/4 v8, 0x0

    goto :goto_2

    :cond_3
    invoke-interface {v1, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    :goto_2
    iput-object v8, v9, Lcom/p1/mobile/putong/data/Region;->district:Ljava/lang/String;

    add-int/lit8 v8, v2, 0x6

    .line 47
    iget-object v9, v5, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    iget-object v9, v9, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 48
    invoke-interface {v1, v8}, Landroid/database/Cursor;->isNull(I)Z

    move-result v10

    if-eqz v10, :cond_4

    const/4 v8, 0x0

    goto :goto_3

    :cond_4
    invoke-interface {v1, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    :goto_3
    iput-object v8, v9, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    add-int/lit8 v8, v2, 0x7

    .line 49
    iget-object v9, v5, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    iget-object v9, v9, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 50
    invoke-interface {v1, v8}, Landroid/database/Cursor;->isNull(I)Z

    move-result v10

    if-eqz v10, :cond_5

    const/4 v8, 0x0

    goto :goto_4

    :cond_5
    invoke-interface {v1, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    :goto_4
    iput-object v8, v9, Lcom/p1/mobile/putong/data/Region;->country:Ljava/lang/String;

    add-int/lit8 v8, v2, 0x8

    .line 51
    iget-object v9, v5, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 52
    invoke-interface {v1, v8}, Landroid/database/Cursor;->isNull(I)Z

    move-result v10

    if-eqz v10, :cond_6

    const/4 v8, 0x0

    goto :goto_5

    :cond_6
    sget-object v10, Lcom/p1/mobile/putong/data/Passby;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-interface {v1, v8}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v8

    invoke-virtual {v10, v8}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/p1/mobile/putong/data/Passby;

    :goto_5
    iput-object v8, v9, Lcom/p1/mobile/putong/data/Location;->passby:Lcom/p1/mobile/putong/data/Passby;

    add-int/lit8 v8, v2, 0x9

    .line 53
    invoke-interface {v1, v8}, Landroid/database/Cursor;->isNull(I)Z

    move-result v9

    if-eqz v9, :cond_7

    const/4 v8, 0x0

    goto :goto_6

    :cond_7
    invoke-interface {v1, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    :goto_6
    iput-object v8, v5, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    add-int/lit8 v8, v2, 0xa

    .line 54
    invoke-interface {v1, v8}, Landroid/database/Cursor;->isNull(I)Z

    move-result v9

    if-eqz v9, :cond_8

    const/4 v8, 0x0

    goto :goto_7

    :cond_8
    invoke-interface {v1, v8}, Landroid/database/Cursor;->getInt(I)I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    :goto_7
    iput-object v8, v5, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    add-int/lit8 v8, v2, 0xb

    .line 55
    invoke-interface {v1, v8}, Landroid/database/Cursor;->isNull(I)Z

    move-result v9

    if-eqz v9, :cond_9

    const/4 v8, 0x0

    goto :goto_8

    .line 56
    :cond_9
    sget-object v9, Lcom/p1/mobile/putong/data/Media;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v9}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v9

    invoke-interface {v1, v8}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v8

    invoke-virtual {v9, v8}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/List;

    :goto_8
    iput-object v8, v5, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    add-int/lit8 v8, v2, 0xc

    .line 57
    invoke-interface {v1, v8}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v8

    iput-wide v8, v5, Lcom/p1/mobile/putong/data/User;->createdTime:D

    add-int/lit8 v8, v2, 0xd

    .line 58
    iget-object v9, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 59
    invoke-interface {v1, v8}, Landroid/database/Cursor;->isNull(I)Z

    move-result v10

    if-eqz v10, :cond_a

    const/4 v8, 0x0

    goto :goto_9

    :cond_a
    invoke-interface {v1, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    :goto_9
    iput-object v8, v9, Lcom/p1/mobile/putong/data/Profile;->school:Ljava/lang/String;

    add-int/lit8 v8, v2, 0xe

    .line 60
    iget-object v9, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 61
    invoke-interface {v1, v8}, Landroid/database/Cursor;->isNull(I)Z

    move-result v10

    if-eqz v10, :cond_b

    const/4 v8, 0x0

    goto :goto_a

    :cond_b
    invoke-interface {v1, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    :goto_a
    iput-object v8, v9, Lcom/p1/mobile/putong/data/Profile;->hangouts:Ljava/lang/String;

    add-int/lit8 v8, v2, 0xf

    .line 62
    iget-object v9, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 63
    invoke-interface {v1, v8}, Landroid/database/Cursor;->isNull(I)Z

    move-result v10

    if-eqz v10, :cond_c

    const/4 v8, 0x0

    goto :goto_b

    :cond_c
    invoke-interface {v1, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    :goto_b
    iput-object v8, v9, Lcom/p1/mobile/putong/data/Profile;->hometown:Ljava/lang/String;

    add-int/lit8 v8, v2, 0x10

    .line 64
    iget-object v9, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 65
    invoke-interface {v1, v8}, Landroid/database/Cursor;->isNull(I)Z

    move-result v10

    if-eqz v10, :cond_d

    const/4 v8, 0x0

    goto :goto_c

    :cond_d
    invoke-interface {v1, v8}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v10

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    :goto_c
    iput-object v8, v9, Lcom/p1/mobile/putong/data/Profile;->receivedLikes:Ljava/lang/Long;

    add-int/lit8 v8, v2, 0x11

    .line 66
    iget-object v9, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 67
    invoke-interface {v1, v8}, Landroid/database/Cursor;->isNull(I)Z

    move-result v10

    if-eqz v10, :cond_e

    const/4 v8, 0x0

    goto :goto_d

    .line 68
    :cond_e
    sget-object v10, Lcom/p1/mobile/putong/data/Tag;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v10}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v10

    invoke-interface {v1, v8}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v8

    invoke-virtual {v10, v8}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/List;

    :goto_d
    iput-object v8, v9, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    add-int/lit8 v8, v2, 0x12

    .line 69
    iget-object v9, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    invoke-interface {v1, v8}, Landroid/database/Cursor;->isNull(I)Z

    move-result v10

    if-eqz v10, :cond_f

    const/4 v8, 0x0

    goto :goto_e

    :cond_f
    invoke-interface {v1, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    :goto_e
    iput-object v8, v9, Lcom/p1/mobile/putong/data/Profile;->job:Ljava/lang/String;

    add-int/lit8 v8, v2, 0x13

    .line 70
    iget-object v9, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v9, v9, Lcom/p1/mobile/putong/data/Profile;->contactLookups:Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;

    invoke-interface {v1, v8}, Landroid/database/Cursor;->getInt(I)I

    move-result v8

    iput v8, v9, Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;->batchSize:I

    add-int/lit8 v8, v2, 0x14

    .line 71
    iget-object v9, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v9, v9, Lcom/p1/mobile/putong/data/Profile;->contactLookups:Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;

    .line 72
    invoke-interface {v1, v8}, Landroid/database/Cursor;->isNull(I)Z

    move-result v10

    if-eqz v10, :cond_10

    const/4 v8, 0x0

    goto :goto_f

    .line 73
    :cond_10
    sget-object v10, Lcom/p1/mobile/putong/data/Contact;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v10}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v10

    invoke-interface {v1, v8}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v8

    invoke-virtual {v10, v8}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/List;

    :goto_f
    iput-object v8, v9, Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;->lookups:Ljava/util/List;

    add-int/lit8 v8, v2, 0x15

    .line 74
    iget-object v9, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v9, v9, Lcom/p1/mobile/putong/data/Profile;->contactLookups:Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;

    .line 75
    invoke-interface {v1, v8}, Landroid/database/Cursor;->isNull(I)Z

    move-result v10

    if-eqz v10, :cond_11

    const/4 v8, 0x0

    goto :goto_10

    :cond_11
    invoke-interface {v1, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    :goto_10
    iput-object v8, v9, Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;->next:Ljava/lang/String;

    add-int/lit8 v8, v2, 0x16

    .line 76
    iget-object v9, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 77
    invoke-interface {v1, v8}, Landroid/database/Cursor;->isNull(I)Z

    move-result v10

    if-eqz v10, :cond_12

    const/4 v8, 0x0

    goto :goto_11

    .line 78
    :cond_12
    sget-object v10, Lcom/p1/mobile/putong/data/Social;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v10}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v10

    invoke-interface {v1, v8}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v8

    invoke-virtual {v10, v8}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/List;

    :goto_11
    iput-object v8, v9, Lcom/p1/mobile/putong/data/Profile;->social:Ljava/util/List;

    add-int/lit8 v8, v2, 0x17

    .line 79
    iget-object v9, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 80
    invoke-interface {v1, v8}, Landroid/database/Cursor;->isNull(I)Z

    move-result v10

    if-eqz v10, :cond_13

    const/4 v8, 0x0

    goto :goto_12

    .line 81
    :cond_13
    sget-object v10, Lcom/p1/mobile/putong/data/Answer;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v10}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v10

    invoke-interface {v1, v8}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v8

    invoke-virtual {v10, v8}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/List;

    :goto_12
    iput-object v8, v9, Lcom/p1/mobile/putong/data/Profile;->answers:Ljava/util/List;

    add-int/lit8 v8, v2, 0x18

    .line 82
    invoke-interface {v1, v8}, Landroid/database/Cursor;->isNull(I)Z

    move-result v9

    if-eqz v9, :cond_14

    const/4 v8, -0x1

    goto :goto_13

    :cond_14
    invoke-interface {v1, v8}, Landroid/database/Cursor;->getInt(I)I

    move-result v8
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_16

    :goto_13
    add-int/lit8 v9, v2, 0x19

    .line 83
    :try_start_1
    iget-object v10, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 84
    invoke-interface {v1, v9}, Landroid/database/Cursor;->isNull(I)Z

    move-result v11

    if-eqz v11, :cond_15

    const/4 v9, 0x0

    goto :goto_14

    :cond_15
    invoke-interface {v1, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    :goto_14
    iput-object v9, v10, Lcom/p1/mobile/putong/data/Profile;->occupation:Ljava/lang/String;

    add-int/lit8 v9, v2, 0x1a

    .line 85
    invoke-interface {v1, v9}, Landroid/database/Cursor;->isNull(I)Z

    move-result v10

    if-eqz v10, :cond_16

    const/4 v9, 0x0

    goto :goto_15

    .line 86
    :cond_16
    sget-object v10, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 87
    invoke-virtual {v10}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v10

    .line 88
    invoke-interface {v1, v9}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v9

    invoke-virtual {v10, v9}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/List;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_15

    :goto_15
    add-int/lit8 v10, v2, 0x1b

    .line 89
    :try_start_2
    invoke-interface {v1, v10}, Landroid/database/Cursor;->isNull(I)Z

    move-result v11

    if-eqz v11, :cond_17

    const/4 v10, 0x0

    goto :goto_16

    .line 90
    :cond_17
    sget-object v11, Lcom/p1/mobile/putong/data/Settings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-interface {v1, v10}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v10

    invoke-virtual {v11, v10}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/p1/mobile/putong/data/Settings;

    :goto_16
    iput-object v10, v5, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    add-int/lit8 v10, v2, 0x1c

    .line 91
    invoke-interface {v1, v10}, Landroid/database/Cursor;->isNull(I)Z

    move-result v11

    if-eqz v11, :cond_18

    const/4 v10, -0x1

    goto :goto_17

    :cond_18
    invoke-interface {v1, v10}, Landroid/database/Cursor;->getInt(I)I

    move-result v10
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_14

    :goto_17
    add-int/lit8 v11, v2, 0x1d

    .line 92
    :try_start_3
    iget-object v12, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v12, v12, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 93
    invoke-interface {v1, v11}, Landroid/database/Cursor;->isNull(I)Z

    move-result v13

    if-eqz v13, :cond_19

    const/4 v11, 0x0

    goto :goto_18

    :cond_19
    invoke-interface {v1, v11}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    :goto_18
    iput-object v11, v12, Lcom/p1/mobile/putong/data/Work;->industry:Ljava/lang/String;

    add-int/lit8 v11, v2, 0x1e

    .line 94
    iget-object v12, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v12, v12, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 95
    invoke-interface {v1, v11}, Landroid/database/Cursor;->isNull(I)Z

    move-result v13

    if-eqz v13, :cond_1a

    const/4 v11, 0x0

    goto :goto_19

    :cond_1a
    invoke-interface {v1, v11}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    :goto_19
    iput-object v11, v12, Lcom/p1/mobile/putong/data/Work;->department:Ljava/lang/String;

    add-int/lit8 v11, v2, 0x1f

    .line 96
    iget-object v12, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v12, v12, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 97
    invoke-interface {v1, v11}, Landroid/database/Cursor;->isNull(I)Z

    move-result v13

    if-eqz v13, :cond_1b

    const/4 v11, 0x0

    goto :goto_1a

    :cond_1b
    invoke-interface {v1, v11}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    :goto_1a
    iput-object v11, v12, Lcom/p1/mobile/putong/data/Work;->company:Ljava/lang/String;

    add-int/lit8 v11, v2, 0x20

    .line 98
    iget-object v12, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v12, v12, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    invoke-interface {v1, v11}, Landroid/database/Cursor;->getInt(I)I

    move-result v11

    const/4 v13, 0x1

    if-ne v11, v13, :cond_1c

    move v11, v13

    goto :goto_1b

    :cond_1c
    move v11, v4

    :goto_1b
    iput-boolean v11, v12, Lcom/p1/mobile/putong/data/Work;->active:Z

    add-int/lit8 v11, v2, 0x21

    .line 99
    iget-object v12, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v12, v12, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 100
    invoke-interface {v1, v11}, Landroid/database/Cursor;->isNull(I)Z

    move-result v14

    if-eqz v14, :cond_1d

    const/4 v11, 0x0

    goto :goto_1c

    :cond_1d
    invoke-interface {v1, v11}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    :goto_1c
    iput-object v11, v12, Lcom/p1/mobile/putong/data/Studies;->major:Ljava/lang/String;

    add-int/lit8 v11, v2, 0x22

    .line 101
    iget-object v12, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v12, v12, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 102
    invoke-interface {v1, v11}, Landroid/database/Cursor;->isNull(I)Z

    move-result v14

    if-eqz v14, :cond_1e

    const/4 v11, 0x0

    goto :goto_1d

    :cond_1e
    invoke-interface {v1, v11}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    :goto_1d
    iput-object v11, v12, Lcom/p1/mobile/putong/data/Studies;->school:Ljava/lang/String;

    add-int/lit8 v11, v2, 0x23

    .line 103
    iget-object v12, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v12, v12, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    invoke-interface {v1, v11}, Landroid/database/Cursor;->getInt(I)I

    move-result v11

    if-ne v11, v13, :cond_1f

    move v11, v13

    goto :goto_1e

    :cond_1f
    move v11, v4

    :goto_1e
    iput-boolean v11, v12, Lcom/p1/mobile/putong/data/Studies;->active:Z

    add-int/lit8 v11, v2, 0x24

    .line 104
    iget-object v12, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 105
    invoke-interface {v1, v11}, Landroid/database/Cursor;->isNull(I)Z

    move-result v14

    if-eqz v14, :cond_20

    const/4 v11, 0x0

    goto :goto_1f

    .line 106
    :cond_20
    sget-object v14, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v14}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v14

    invoke-interface {v1, v11}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v11

    invoke-virtual {v14, v11}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/util/List;

    :goto_1f
    iput-object v11, v12, Lcom/p1/mobile/putong/data/Profile;->scenarios:Ljava/util/List;

    add-int/lit8 v11, v2, 0x25

    .line 107
    iget-object v12, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 108
    invoke-interface {v1, v11}, Landroid/database/Cursor;->isNull(I)Z

    move-result v14

    if-eqz v14, :cond_21

    const/4 v11, 0x0

    goto :goto_20

    :cond_21
    invoke-interface {v1, v11}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    :goto_20
    iput-object v11, v12, Lcom/p1/mobile/putong/data/Profile;->receivedLikesRank:Ljava/lang/String;

    add-int/lit8 v11, v2, 0x26

    .line 109
    invoke-interface {v1, v11}, Landroid/database/Cursor;->isNull(I)Z

    move-result v12

    if-eqz v12, :cond_22

    const/4 v11, 0x0

    goto :goto_21

    .line 110
    :cond_22
    sget-object v12, Lcom/p1/mobile/putong/data/Relationship;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-interface {v1, v11}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v11

    invoke-virtual {v12, v11}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/p1/mobile/putong/data/Relationship;

    :goto_21
    iput-object v11, v5, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    add-int/lit8 v11, v2, 0x27

    .line 111
    invoke-interface {v1, v11}, Landroid/database/Cursor;->isNull(I)Z

    move-result v12

    if-eqz v12, :cond_23

    const/4 v11, -0x1

    goto :goto_22

    :cond_23
    invoke-interface {v1, v11}, Landroid/database/Cursor;->getInt(I)I

    move-result v11
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_13

    :goto_22
    add-int/lit8 v12, v2, 0x28

    .line 112
    :try_start_4
    iget-object v14, v5, Lcom/p1/mobile/putong/data/User;->membership:Lcom/p1/mobile/putong/data/Membership;

    invoke-interface {v1, v12}, Landroid/database/Cursor;->getInt(I)I

    move-result v12

    if-ne v12, v13, :cond_24

    move v12, v13

    goto :goto_23

    :cond_24
    move v12, v4

    :goto_23
    iput-boolean v12, v14, Lcom/p1/mobile/putong/data/Membership;->active:Z

    add-int/lit8 v12, v2, 0x29

    .line 113
    iget-object v14, v5, Lcom/p1/mobile/putong/data/User;->membership:Lcom/p1/mobile/putong/data/Membership;

    invoke-interface {v1, v12}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v6

    iput-wide v6, v14, Lcom/p1/mobile/putong/data/Membership;->expiresTime:D

    add-int/lit8 v6, v2, 0x2a

    .line 114
    invoke-interface {v1, v6}, Landroid/database/Cursor;->isNull(I)Z

    move-result v7

    if-eqz v7, :cond_25

    const/4 v6, -0x1

    goto :goto_24

    :cond_25
    invoke-interface {v1, v6}, Landroid/database/Cursor;->getInt(I)I

    move-result v6
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_12

    :goto_24
    add-int/lit8 v7, v2, 0x2b

    .line 115
    :try_start_5
    iget-object v12, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v12, v12, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    invoke-interface {v1, v7}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    if-ne v7, v13, :cond_26

    move v7, v13

    goto :goto_25

    :cond_26
    move v7, v4

    :goto_25
    iput-boolean v7, v12, Lcom/p1/mobile/putong/data/Studies;->verified:Z

    add-int/lit8 v7, v2, 0x2c

    .line 116
    iget-object v12, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v12, v12, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 117
    invoke-interface {v1, v7}, Landroid/database/Cursor;->isNull(I)Z

    move-result v14

    if-eqz v14, :cond_27

    const/4 v7, 0x0

    goto :goto_26

    :cond_27
    invoke-interface {v1, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    :goto_26
    iput-object v7, v12, Lcom/p1/mobile/putong/data/Studies;->grade:Ljava/lang/String;

    add-int/lit8 v7, v2, 0x2d

    .line 118
    iget-object v12, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v12, v12, Lcom/p1/mobile/putong/data/Profile;->tbh:Lcom/p1/mobile/putong/data/ProfileTbh;

    invoke-interface {v1, v7}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    iput v7, v12, Lcom/p1/mobile/putong/data/ProfileTbh;->friends:I

    add-int/lit8 v7, v2, 0x2e

    .line 119
    iget-object v12, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v12, v12, Lcom/p1/mobile/putong/data/Profile;->tbh:Lcom/p1/mobile/putong/data/ProfileTbh;

    invoke-interface {v1, v7}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    iput v7, v12, Lcom/p1/mobile/putong/data/ProfileTbh;->receivedVotes:I

    add-int/lit8 v7, v2, 0x2f

    .line 120
    iget-object v12, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v12, v12, Lcom/p1/mobile/putong/data/Profile;->tbh:Lcom/p1/mobile/putong/data/ProfileTbh;

    invoke-interface {v1, v7}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    iput v7, v12, Lcom/p1/mobile/putong/data/ProfileTbh;->receivedVotedPolls:I

    add-int/lit8 v7, v2, 0x30

    .line 121
    iget-object v12, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v12, v12, Lcom/p1/mobile/putong/data/Profile;->tbh:Lcom/p1/mobile/putong/data/ProfileTbh;

    invoke-interface {v1, v7}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v13

    iput-wide v13, v12, Lcom/p1/mobile/putong/data/ProfileTbh;->createdTime:D

    add-int/lit8 v7, v2, 0x31

    .line 122
    invoke-interface {v1, v7}, Landroid/database/Cursor;->isNull(I)Z

    move-result v12

    if-eqz v12, :cond_28

    const/4 v7, 0x0

    goto :goto_27

    :cond_28
    invoke-interface {v1, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    :goto_27
    iput-object v7, v5, Lcom/p1/mobile/putong/data/User;->realName:Ljava/lang/String;

    add-int/lit8 v7, v2, 0x32

    .line 123
    iget-object v12, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v12, v12, Lcom/p1/mobile/putong/data/Profile;->followships:Lcom/p1/mobile/putong/data/FollowshipCounters;

    iget-object v12, v12, Lcom/p1/mobile/putong/data/FollowshipCounters;->counters:Lcom/p1/mobile/putong/data/FollowshipCounter;

    invoke-interface {v1, v7}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    iput v7, v12, Lcom/p1/mobile/putong/data/FollowshipCounter;->followings:I

    add-int/lit8 v7, v2, 0x33

    .line 124
    iget-object v12, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v12, v12, Lcom/p1/mobile/putong/data/Profile;->followships:Lcom/p1/mobile/putong/data/FollowshipCounters;

    iget-object v12, v12, Lcom/p1/mobile/putong/data/FollowshipCounters;->counters:Lcom/p1/mobile/putong/data/FollowshipCounter;

    invoke-interface {v1, v7}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    iput v7, v12, Lcom/p1/mobile/putong/data/FollowshipCounter;->followers:I

    add-int/lit8 v7, v2, 0x34

    .line 125
    iget-object v12, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v12, v12, Lcom/p1/mobile/putong/data/Profile;->moments:Lcom/p1/mobile/putong/data/Moments;

    invoke-interface {v1, v7}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    const/4 v13, 0x1

    if-ne v7, v13, :cond_29

    const/4 v7, 0x1

    goto :goto_28

    :cond_29
    move v7, v4

    :goto_28
    iput-boolean v7, v12, Lcom/p1/mobile/putong/data/Moments;->hidePublicMoments:Z

    add-int/lit8 v7, v2, 0x35

    .line 126
    iget-object v12, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v12, v12, Lcom/p1/mobile/putong/data/Profile;->moments:Lcom/p1/mobile/putong/data/Moments;

    iget-object v12, v12, Lcom/p1/mobile/putong/data/Moments;->counters:Lcom/p1/mobile/putong/data/MomentCounter;

    invoke-interface {v1, v7}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    iput v7, v12, Lcom/p1/mobile/putong/data/MomentCounter;->totalMoments:I

    add-int/lit8 v7, v2, 0x36

    .line 127
    iget-object v12, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v12, v12, Lcom/p1/mobile/putong/data/Profile;->moments:Lcom/p1/mobile/putong/data/Moments;

    iget-object v12, v12, Lcom/p1/mobile/putong/data/Moments;->counters:Lcom/p1/mobile/putong/data/MomentCounter;

    invoke-interface {v1, v7}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    iput v7, v12, Lcom/p1/mobile/putong/data/MomentCounter;->receiveMomentLikes:I

    add-int/lit8 v7, v2, 0x37

    .line 128
    invoke-interface {v1, v7}, Landroid/database/Cursor;->isNull(I)Z

    move-result v12

    if-eqz v12, :cond_2a

    const/4 v7, 0x0

    goto :goto_29

    .line 129
    :cond_2a
    sget-object v12, Lcom/p1/mobile/putong/data/Followship;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-interface {v1, v7}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v7

    invoke-virtual {v12, v7}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/p1/mobile/putong/data/Followship;

    :goto_29
    iput-object v7, v5, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    add-int/lit8 v7, v2, 0x38

    .line 130
    iget-object v12, v5, Lcom/p1/mobile/putong/data/User;->membership:Lcom/p1/mobile/putong/data/Membership;

    invoke-interface {v1, v7}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v13

    iput-wide v13, v12, Lcom/p1/mobile/putong/data/Membership;->duration:J

    add-int/lit8 v7, v2, 0x39

    .line 131
    invoke-interface {v1, v7}, Landroid/database/Cursor;->isNull(I)Z

    move-result v12

    if-eqz v12, :cond_2b

    const/4 v7, 0x0

    goto :goto_2a

    .line 132
    :cond_2b
    sget-object v12, Lcom/p1/mobile/putong/data/Membership;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v12}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v12

    invoke-interface {v1, v7}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v7

    invoke-virtual {v12, v7}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    :goto_2a
    iput-object v7, v5, Lcom/p1/mobile/putong/data/User;->memberships:Ljava/util/List;

    add-int/lit8 v7, v2, 0x3a

    .line 133
    invoke-interface {v1, v7}, Landroid/database/Cursor;->isNull(I)Z

    move-result v12

    if-eqz v12, :cond_2c

    const/4 v7, 0x0

    goto :goto_2b

    :cond_2c
    invoke-interface {v1, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    :goto_2b
    iput-object v7, v5, Lcom/p1/mobile/putong/data/User;->nameRemark:Ljava/lang/String;

    add-int/lit8 v7, v2, 0x3b

    .line 134
    invoke-interface {v1, v7}, Landroid/database/Cursor;->isNull(I)Z

    move-result v12

    if-eqz v12, :cond_2d

    const/4 v7, 0x0

    goto :goto_2c

    .line 135
    :cond_2d
    sget-object v12, Lcom/p1/mobile/putong/data/UserState;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-interface {v1, v7}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v7

    invoke-virtual {v12, v7}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/p1/mobile/putong/data/UserState;

    :goto_2c
    iput-object v7, v5, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    add-int/lit8 v7, v2, 0x3c

    .line 136
    iget-object v12, v5, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    iget-object v12, v12, Lcom/p1/mobile/putong/data/PicVerification;->picVerificationResult:Lcom/p1/mobile/putong/data/PicVerificationResult;

    .line 137
    invoke-interface {v1, v7}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    const/4 v13, 0x1

    if-ne v7, v13, :cond_2e

    const/4 v7, 0x1

    goto :goto_2d

    :cond_2e
    move v7, v4

    :goto_2d
    iput-boolean v7, v12, Lcom/p1/mobile/putong/data/PicVerificationResult;->verified:Z

    add-int/lit8 v7, v2, 0x3d

    .line 138
    invoke-interface {v1, v7}, Landroid/database/Cursor;->isNull(I)Z

    move-result v12

    if-eqz v12, :cond_2f

    const/4 v7, 0x0

    goto :goto_2e

    .line 139
    :cond_2f
    sget-object v12, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v12}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v12

    invoke-interface {v1, v7}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v7

    invoke-virtual {v12, v7}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    :goto_2e
    iput-object v7, v5, Lcom/p1/mobile/putong/data/User;->abGroups:Ljava/util/List;

    add-int/lit8 v7, v2, 0x3e

    .line 140
    invoke-interface {v1, v7}, Landroid/database/Cursor;->isNull(I)Z

    move-result v12

    if-eqz v12, :cond_30

    const/4 v7, 0x0

    goto :goto_2f

    .line 141
    :cond_30
    sget-object v12, Lcom/p1/mobile/putong/data/PrivateAnswer;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v12}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v12

    invoke-interface {v1, v7}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v7

    invoke-virtual {v12, v7}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    :goto_2f
    iput-object v7, v5, Lcom/p1/mobile/putong/data/User;->privateAnswers:Ljava/util/List;

    add-int/lit8 v7, v2, 0x3f

    .line 142
    invoke-interface {v1, v7}, Landroid/database/Cursor;->isNull(I)Z

    move-result v12

    if-eqz v12, :cond_31

    const/4 v7, 0x0

    goto :goto_30

    .line 143
    :cond_31
    sget-object v12, Lcom/p1/mobile/putong/data/Membership;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-interface {v1, v7}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v7

    invoke-virtual {v12, v7}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/p1/mobile/putong/data/Membership;

    :goto_30
    iput-object v7, v5, Lcom/p1/mobile/putong/data/User;->peepership:Lcom/p1/mobile/putong/data/Membership;

    add-int/lit8 v7, v2, 0x40

    .line 144
    invoke-interface {v1, v7}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v12

    iput-wide v12, v5, Lcom/p1/mobile/putong/data/User;->picksExpiredTimestamp:J

    add-int/lit8 v7, v2, 0x41

    .line 145
    invoke-interface {v1, v7}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    const/4 v13, 0x1

    if-ne v7, v13, :cond_32

    const/4 v7, 0x1

    goto :goto_31

    :cond_32
    move v7, v4

    :goto_31
    iput-boolean v7, v5, Lcom/p1/mobile/putong/data/User;->picksSwipable:Z

    add-int/lit8 v7, v2, 0x42

    .line 146
    invoke-interface {v1, v7}, Landroid/database/Cursor;->isNull(I)Z

    move-result v12

    if-eqz v12, :cond_33

    const/4 v7, 0x0

    goto :goto_32

    :cond_33
    invoke-interface {v1, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    :goto_32
    iput-object v7, v5, Lcom/p1/mobile/putong/data/User;->picksTag:Ljava/lang/String;

    add-int/lit8 v7, v2, 0x43

    .line 147
    invoke-interface {v1, v7}, Landroid/database/Cursor;->isNull(I)Z

    move-result v12

    if-eqz v12, :cond_34

    const/4 v7, 0x0

    goto :goto_33

    .line 148
    :cond_34
    sget-object v12, Lcom/p1/mobile/putong/data/UserCreditData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-interface {v1, v7}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v7

    invoke-virtual {v12, v7}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/p1/mobile/putong/data/UserCreditData;

    :goto_33
    iput-object v7, v5, Lcom/p1/mobile/putong/data/User;->credit:Lcom/p1/mobile/putong/data/UserCreditData;

    add-int/lit8 v7, v2, 0x44

    .line 149
    invoke-interface {v1, v7}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v12

    iput-wide v12, v5, Lcom/p1/mobile/putong/data/User;->goPlaceTimestamp:D

    add-int/lit8 v7, v2, 0x45

    .line 150
    invoke-interface {v1, v7}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    const/4 v13, 0x1

    if-ne v7, v13, :cond_35

    const/4 v7, 0x1

    goto :goto_34

    :cond_35
    move v7, v4

    :goto_34
    iput-boolean v7, v5, Lcom/p1/mobile/putong/data/User;->isLord:Z

    add-int/lit8 v7, v2, 0x46

    .line 151
    invoke-interface {v1, v7}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v12

    iput-wide v12, v5, Lcom/p1/mobile/putong/data/User;->privateAnswersUpdatedTime:D

    add-int/lit8 v7, v2, 0x47

    .line 152
    invoke-interface {v1, v7}, Landroid/database/Cursor;->isNull(I)Z

    move-result v12

    if-eqz v12, :cond_36

    const/4 v7, 0x0

    goto :goto_35

    :cond_36
    invoke-interface {v1, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    :goto_35
    iput-object v7, v5, Lcom/p1/mobile/putong/data/User;->sendLetter:Ljava/lang/String;

    add-int/lit8 v7, v2, 0x48

    .line 153
    invoke-interface {v1, v7}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v12

    iput-wide v12, v5, Lcom/p1/mobile/putong/data/User;->sendLetterTimestamp:J

    add-int/lit8 v7, v2, 0x49

    .line 154
    invoke-interface {v1, v7}, Landroid/database/Cursor;->isNull(I)Z

    move-result v12

    if-eqz v12, :cond_37

    const/4 v7, 0x0

    goto :goto_36

    :cond_37
    invoke-interface {v1, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    :goto_36
    iput-object v7, v5, Lcom/p1/mobile/putong/data/User;->receivedLetter:Ljava/lang/String;

    add-int/lit8 v7, v2, 0x4a

    .line 155
    invoke-interface {v1, v7}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v12

    iput-wide v12, v5, Lcom/p1/mobile/putong/data/User;->receivedLetterTimestamp:J

    add-int/lit8 v7, v2, 0x4b

    .line 156
    invoke-interface {v1, v7}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    iput v7, v5, Lcom/p1/mobile/putong/data/User;->popLevel:I

    add-int/lit8 v7, v2, 0x4c

    .line 157
    invoke-interface {v1, v7}, Landroid/database/Cursor;->isNull(I)Z

    move-result v12

    if-eqz v12, :cond_38

    const/4 v7, 0x0

    goto :goto_37

    .line 158
    :cond_38
    sget-object v12, Lcom/p1/mobile/putong/data/AudioSignature;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-interface {v1, v7}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v7

    invoke-virtual {v12, v7}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/p1/mobile/putong/data/AudioSignature;

    :goto_37
    iput-object v7, v5, Lcom/p1/mobile/putong/data/User;->voice:Lcom/p1/mobile/putong/data/AudioSignature;

    add-int/lit8 v7, v2, 0x4d

    .line 159
    invoke-interface {v1, v7}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    const/4 v13, 0x1

    if-ne v7, v13, :cond_39

    const/4 v7, 0x1

    goto :goto_38

    :cond_39
    move v7, v4

    :goto_38
    iput-boolean v7, v5, Lcom/p1/mobile/putong/data/User;->datingMode:Z

    add-int/lit8 v7, v2, 0x4e

    .line 160
    invoke-interface {v1, v7}, Landroid/database/Cursor;->isNull(I)Z

    move-result v12

    if-eqz v12, :cond_3a

    const/4 v7, 0x0

    goto :goto_39

    :cond_3a
    sget-object v12, Lcom/p1/mobile/putong/data/UssTags;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-interface {v1, v7}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v7

    invoke-virtual {v12, v7}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/p1/mobile/putong/data/UssTags;

    :goto_39
    iput-object v7, v5, Lcom/p1/mobile/putong/data/User;->ussTags:Lcom/p1/mobile/putong/data/UssTags;

    add-int/lit8 v7, v2, 0x4f

    .line 161
    invoke-interface {v1, v7}, Landroid/database/Cursor;->isNull(I)Z

    move-result v12

    if-eqz v12, :cond_3b

    const/4 v7, -0x1

    goto :goto_3a

    :cond_3b
    invoke-interface {v1, v7}, Landroid/database/Cursor;->getInt(I)I

    move-result v7
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_11

    :goto_3a
    add-int/lit8 v12, v2, 0x50

    .line 162
    :try_start_6
    invoke-interface {v1, v12}, Landroid/database/Cursor;->isNull(I)Z

    move-result v13

    if-eqz v13, :cond_3c

    const/4 v12, 0x0

    goto :goto_3b

    .line 163
    :cond_3c
    sget-object v13, Lcom/p1/mobile/putong/data/UserAbroad;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-interface {v1, v12}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v12

    invoke-virtual {v13, v12}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/p1/mobile/putong/data/UserAbroad;

    :goto_3b
    iput-object v12, v5, Lcom/p1/mobile/putong/data/User;->abroad:Lcom/p1/mobile/putong/data/UserAbroad;

    add-int/lit8 v12, v2, 0x51

    .line 164
    invoke-interface {v1, v12}, Landroid/database/Cursor;->isNull(I)Z

    move-result v13

    if-eqz v13, :cond_3d

    const/4 v12, 0x0

    goto :goto_3c

    .line 165
    :cond_3d
    sget-object v13, Lcom/p1/mobile/putong/data/StatusesItem;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-interface {v1, v12}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v12

    invoke-virtual {v13, v12}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/p1/mobile/putong/data/StatusesItem;

    :goto_3c
    iput-object v12, v5, Lcom/p1/mobile/putong/data/User;->fakeStatus:Lcom/p1/mobile/putong/data/StatusesItem;

    add-int/lit8 v12, v2, 0x52

    .line 166
    invoke-interface {v1, v12}, Landroid/database/Cursor;->isNull(I)Z

    move-result v13

    if-eqz v13, :cond_3e

    const/4 v12, 0x0

    goto :goto_3d

    .line 167
    :cond_3e
    sget-object v13, Lcom/p1/mobile/putong/data/StatusesItem;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-interface {v1, v12}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v12

    invoke-virtual {v13, v12}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/p1/mobile/putong/data/StatusesItem;

    :goto_3d
    iput-object v12, v5, Lcom/p1/mobile/putong/data/User;->nameStatus:Lcom/p1/mobile/putong/data/StatusesItem;

    add-int/lit8 v12, v2, 0x53

    .line 168
    invoke-interface {v1, v12}, Landroid/database/Cursor;->getInt(I)I

    move-result v12

    const/4 v13, 0x1

    if-ne v12, v13, :cond_3f

    const/4 v12, 0x1

    goto :goto_3e

    :cond_3f
    move v12, v4

    :goto_3e
    iput-boolean v12, v5, Lcom/p1/mobile/putong/data/User;->displayAudit:Z

    add-int/lit8 v12, v2, 0x54

    .line 169
    invoke-interface {v1, v12}, Landroid/database/Cursor;->isNull(I)Z

    move-result v13

    if-eqz v13, :cond_40

    const/4 v12, 0x0

    goto :goto_3f

    .line 170
    :cond_40
    sget-object v13, Lcom/p1/mobile/putong/data/VisitPlace;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-interface {v1, v12}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v12

    invoke-virtual {v13, v12}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/p1/mobile/putong/data/VisitPlace;

    :goto_3f
    iput-object v12, v5, Lcom/p1/mobile/putong/data/User;->visitPlace:Lcom/p1/mobile/putong/data/VisitPlace;

    add-int/lit8 v12, v2, 0x55

    .line 171
    invoke-interface {v1, v12}, Landroid/database/Cursor;->isNull(I)Z

    move-result v13

    if-eqz v13, :cond_41

    const/4 v12, 0x0

    goto :goto_40

    :cond_41
    invoke-interface {v1, v12}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v12

    :goto_40
    iput-object v12, v5, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    add-int/lit8 v12, v2, 0x56

    .line 172
    invoke-interface {v1, v12}, Landroid/database/Cursor;->isNull(I)Z

    move-result v13

    if-eqz v13, :cond_42

    const/4 v12, 0x0

    goto :goto_41

    .line 173
    :cond_42
    sget-object v13, Lcom/p1/mobile/putong/data/UserSoulSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-interface {v1, v12}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v12

    invoke-virtual {v13, v12}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/p1/mobile/putong/data/UserSoulSettings;

    :goto_41
    iput-object v12, v5, Lcom/p1/mobile/putong/data/User;->soulSettings:Lcom/p1/mobile/putong/data/UserSoulSettings;

    add-int/lit8 v12, v2, 0x57

    .line 174
    invoke-interface {v1, v12}, Landroid/database/Cursor;->getInt(I)I

    move-result v12

    iput v12, v5, Lcom/p1/mobile/putong/data/User;->richListPosition:I

    add-int/lit8 v12, v2, 0x58

    .line 175
    invoke-interface {v1, v12}, Landroid/database/Cursor;->isNull(I)Z

    move-result v13

    if-eqz v13, :cond_43

    const/4 v12, 0x0

    goto :goto_42

    :cond_43
    invoke-interface {v1, v12}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v12

    :goto_42
    iput-object v12, v5, Lcom/p1/mobile/putong/data/User;->richListTracker:Ljava/lang/String;

    add-int/lit8 v12, v2, 0x59

    .line 176
    invoke-interface {v1, v12}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v12

    iput-wide v12, v5, Lcom/p1/mobile/putong/data/User;->diamondVIPExpiresTime:D

    add-int/lit8 v12, v2, 0x5a

    .line 177
    invoke-interface {v1, v12}, Landroid/database/Cursor;->isNull(I)Z

    move-result v13

    if-eqz v13, :cond_44

    const/4 v12, 0x0

    goto :goto_43

    :cond_44
    invoke-interface {v1, v12}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v12

    :goto_43
    iput-object v12, v5, Lcom/p1/mobile/putong/data/User;->aiTag:Ljava/lang/String;

    add-int/lit8 v12, v2, 0x5b

    .line 178
    invoke-interface {v1, v12}, Landroid/database/Cursor;->isNull(I)Z

    move-result v13

    if-eqz v13, :cond_45

    const/4 v12, 0x0

    goto :goto_44

    .line 179
    :cond_45
    sget-object v13, Lcom/p1/mobile/putong/data/FriendCommentInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-interface {v1, v12}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v12

    invoke-virtual {v13, v12}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/p1/mobile/putong/data/FriendCommentInfo;

    :goto_44
    iput-object v12, v5, Lcom/p1/mobile/putong/data/User;->friendCommentInfo:Lcom/p1/mobile/putong/data/FriendCommentInfo;

    add-int/lit8 v12, v2, 0x5c

    .line 180
    invoke-interface {v1, v12}, Landroid/database/Cursor;->getInt(I)I

    move-result v12

    iput v12, v5, Lcom/p1/mobile/putong/data/User;->minRichListPosition:I

    add-int/lit8 v12, v2, 0x5d

    .line 181
    iget-object v13, v5, Lcom/p1/mobile/putong/data/User;->membership:Lcom/p1/mobile/putong/data/Membership;

    invoke-interface {v1, v12}, Landroid/database/Cursor;->getInt(I)I

    move-result v12

    const/4 v14, 0x1

    if-ne v12, v14, :cond_46

    const/4 v12, 0x1

    goto :goto_45

    :cond_46
    move v12, v4

    :goto_45
    iput-boolean v12, v13, Lcom/p1/mobile/putong/data/Membership;->hideVIP:Z

    add-int/lit8 v12, v2, 0x5e

    .line 182
    invoke-interface {v1, v12}, Landroid/database/Cursor;->isNull(I)Z

    move-result v13

    if-eqz v13, :cond_47

    const/4 v12, 0x0

    goto :goto_46

    :cond_47
    invoke-interface {v1, v12}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v12

    :goto_46
    iput-object v12, v5, Lcom/p1/mobile/putong/data/User;->ussTracker:Ljava/lang/String;

    add-int/lit8 v12, v2, 0x5f

    .line 183
    iget-object v13, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 184
    invoke-interface {v1, v12}, Landroid/database/Cursor;->isNull(I)Z

    move-result v14

    if-eqz v14, :cond_48

    const/4 v12, 0x0

    goto :goto_47

    .line 185
    :cond_48
    sget-object v14, Lcom/p1/mobile/putong/data/UserProfileMood;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-interface {v1, v12}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v12

    invoke-virtual {v14, v12}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/p1/mobile/putong/data/UserProfileMood;

    :goto_47
    iput-object v12, v13, Lcom/p1/mobile/putong/data/Profile;->mood:Lcom/p1/mobile/putong/data/UserProfileMood;

    add-int/lit8 v12, v2, 0x60

    .line 186
    iget-object v13, v5, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    iget-object v13, v13, Lcom/p1/mobile/putong/data/PicVerification;->idCard:Lcom/p1/mobile/putong/data/IdVerificationResult;

    invoke-interface {v1, v12}, Landroid/database/Cursor;->getInt(I)I

    move-result v12

    const/4 v14, 0x1

    if-ne v12, v14, :cond_49

    move v12, v14

    goto :goto_48

    :cond_49
    move v12, v4

    :goto_48
    iput-boolean v12, v13, Lcom/p1/mobile/putong/data/IdVerificationResult;->verified:Z

    add-int/lit8 v12, v2, 0x61

    .line 187
    iget-object v13, v5, Lcom/p1/mobile/putong/data/User;->membership:Lcom/p1/mobile/putong/data/Membership;

    invoke-interface {v1, v12}, Landroid/database/Cursor;->getInt(I)I

    move-result v12

    if-ne v12, v14, :cond_4a

    const/4 v12, 0x1

    goto :goto_49

    :cond_4a
    move v12, v4

    :goto_49
    iput-boolean v12, v13, Lcom/p1/mobile/putong/data/Membership;->hideActivityTime:Z

    add-int/lit8 v12, v2, 0x62

    .line 188
    invoke-interface {v1, v12}, Landroid/database/Cursor;->isNull(I)Z

    move-result v13

    if-eqz v13, :cond_4b

    const/4 v15, -0x1

    goto :goto_4a

    :cond_4b
    invoke-interface {v1, v12}, Landroid/database/Cursor;->getInt(I)I

    move-result v12
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_10

    move v15, v12

    :goto_4a
    add-int/lit8 v12, v2, 0x63

    .line 189
    :try_start_7
    invoke-interface {v1, v12}, Landroid/database/Cursor;->isNull(I)Z

    move-result v13

    if-eqz v13, :cond_4c

    const/4 v12, 0x0

    goto :goto_4b

    .line 190
    :cond_4c
    sget-object v13, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 191
    invoke-virtual {v13}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v13

    .line 192
    invoke-interface {v1, v12}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v12

    invoke-virtual {v13, v12}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/util/List;
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_f

    :goto_4b
    add-int/lit8 v13, v2, 0x64

    .line 193
    :try_start_8
    invoke-interface {v1, v13}, Landroid/database/Cursor;->isNull(I)Z

    move-result v14

    if-eqz v14, :cond_4d

    const/4 v13, 0x0

    goto :goto_4c

    .line 194
    :cond_4d
    sget-object v14, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 195
    invoke-virtual {v14}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v14

    .line 196
    invoke-interface {v1, v13}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v13

    invoke-virtual {v14, v13}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/util/List;
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_e

    :goto_4c
    add-int/lit8 v14, v2, 0x65

    move/from16 v17, v4

    .line 197
    :try_start_9
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Extensions;->business:Lcom/p1/mobile/putong/data/Business;

    .line 198
    invoke-interface {v1, v14}, Landroid/database/Cursor;->isNull(I)Z

    move-result v18

    if-eqz v18, :cond_4e

    move-object/from16 v19, v3

    const/4 v3, 0x0

    goto :goto_4d

    .line 199
    :cond_4e
    sget-object v18, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_d

    move-object/from16 v19, v3

    :try_start_a
    invoke-virtual/range {v18 .. v18}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v3

    invoke-interface {v1, v14}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v14

    invoke-virtual {v3, v14}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    :goto_4d
    iput-object v3, v4, Lcom/p1/mobile/putong/data/Business;->cardType:Ljava/util/List;

    add-int/lit8 v3, v2, 0x66

    .line 200
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 201
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v14

    if-eqz v14, :cond_4f

    const/4 v3, 0x0

    goto :goto_4e

    .line 202
    :cond_4f
    sget-object v14, Lcom/p1/mobile/putong/data/MoodMoment;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v14, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/p1/mobile/putong/data/MoodMoment;

    :goto_4e
    iput-object v3, v4, Lcom/p1/mobile/putong/data/Profile;->moodMoment:Lcom/p1/mobile/putong/data/MoodMoment;

    add-int/lit8 v3, v2, 0x67

    .line 203
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 204
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v14

    if-eqz v14, :cond_50

    const/4 v3, 0x0

    goto :goto_4f

    .line 205
    :cond_50
    sget-object v14, Lcom/p1/mobile/putong/data/BizAnswers;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v14, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/p1/mobile/putong/data/BizAnswers;

    :goto_4f
    iput-object v3, v4, Lcom/p1/mobile/putong/data/Profile;->bizAnswers:Lcom/p1/mobile/putong/data/BizAnswers;

    add-int/lit8 v3, v2, 0x68

    .line 206
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 207
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v14

    if-eqz v14, :cond_51

    const/4 v3, 0x0

    goto :goto_50

    .line 208
    :cond_51
    sget-object v14, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v14}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v14

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v14, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    :goto_50
    iput-object v3, v4, Lcom/p1/mobile/putong/data/Interest;->emoji:Ljava/util/List;

    add-int/lit8 v3, v2, 0x69

    .line 209
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/PicVerification;->age:Lcom/p1/mobile/putong/data/VerificationResult;

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    const/4 v14, 0x1

    if-ne v3, v14, :cond_52

    const/4 v3, 0x1

    goto :goto_51

    :cond_52
    move/from16 v3, v17

    :goto_51
    iput-boolean v3, v4, Lcom/p1/mobile/putong/data/VerificationResult;->verified:Z

    add-int/lit8 v3, v2, 0x6a

    .line 210
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 211
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v14

    if-eqz v14, :cond_53

    const/4 v3, 0x0

    goto :goto_52

    .line 212
    :cond_53
    sget-object v14, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v14}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v14

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v14, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    :goto_52
    iput-object v3, v4, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->aboutMe:Ljava/util/List;

    add-int/lit8 v3, v2, 0x6b

    .line 213
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/PicVerification;->anchor:Lcom/p1/mobile/putong/data/VerificationResult;

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    const/4 v14, 0x1

    if-ne v3, v14, :cond_54

    const/4 v3, 0x1

    goto :goto_53

    :cond_54
    move/from16 v3, v17

    :goto_53
    iput-boolean v3, v4, Lcom/p1/mobile/putong/data/VerificationResult;->verified:Z

    add-int/lit8 v3, v2, 0x6c

    .line 214
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 215
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v14

    if-eqz v14, :cond_55

    const/4 v3, 0x0

    goto :goto_54

    .line 216
    :cond_55
    sget-object v14, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v14}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v14

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v14, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    :goto_54
    iput-object v3, v4, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->tickle:Ljava/util/List;

    add-int/lit8 v3, v2, 0x6d

    .line 217
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    iput-wide v3, v5, Lcom/p1/mobile/putong/data/User;->localLatestReceivedMessageTime:J

    add-int/lit8 v3, v2, 0x6e

    .line 218
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/PicVerification;->others:Lcom/p1/mobile/putong/data/OtherVerificationWrapper;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/OtherVerificationWrapper;->otherDVIPSchool:Lcom/p1/mobile/putong/data/VerificationResult;

    .line 219
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    const/4 v14, 0x1

    if-ne v3, v14, :cond_56

    const/4 v3, 0x1

    goto :goto_55

    :cond_56
    move/from16 v3, v17

    :goto_55
    iput-boolean v3, v4, Lcom/p1/mobile/putong/data/VerificationResult;->verified:Z

    add-int/lit8 v3, v2, 0x6f

    .line 220
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/PicVerification;->others:Lcom/p1/mobile/putong/data/OtherVerificationWrapper;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/OtherVerificationWrapper;->otherDVIPCompany:Lcom/p1/mobile/putong/data/VerificationResult;

    .line 221
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    const/4 v14, 0x1

    if-ne v3, v14, :cond_57

    const/4 v3, 0x1

    goto :goto_56

    :cond_57
    move/from16 v3, v17

    :goto_56
    iput-boolean v3, v4, Lcom/p1/mobile/putong/data/VerificationResult;->verified:Z

    add-int/lit8 v3, v2, 0x70

    .line 222
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/PicVerification;->others:Lcom/p1/mobile/putong/data/OtherVerificationWrapper;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/OtherVerificationWrapper;->otherDVIPJob:Lcom/p1/mobile/putong/data/VerificationResult;

    .line 223
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    const/4 v14, 0x1

    if-ne v3, v14, :cond_58

    const/4 v3, 0x1

    goto :goto_57

    :cond_58
    move/from16 v3, v17

    :goto_57
    iput-boolean v3, v4, Lcom/p1/mobile/putong/data/VerificationResult;->verified:Z

    add-int/lit8 v3, v2, 0x71

    .line 224
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/PicVerification;->others:Lcom/p1/mobile/putong/data/OtherVerificationWrapper;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/OtherVerificationWrapper;->otherDVIPSalary:Lcom/p1/mobile/putong/data/VerificationResult;

    .line 225
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    const/4 v14, 0x1

    if-ne v3, v14, :cond_59

    const/4 v3, 0x1

    goto :goto_58

    :cond_59
    move/from16 v3, v17

    :goto_58
    iput-boolean v3, v4, Lcom/p1/mobile/putong/data/VerificationResult;->verified:Z

    add-int/lit8 v3, v2, 0x72

    .line 226
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/PicVerification;->others:Lcom/p1/mobile/putong/data/OtherVerificationWrapper;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/OtherVerificationWrapper;->otherDVIPMembership:Lcom/p1/mobile/putong/data/VerificationResult;

    .line 227
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    const/4 v14, 0x1

    if-ne v3, v14, :cond_5a

    const/4 v3, 0x1

    goto :goto_59

    :cond_5a
    move/from16 v3, v17

    :goto_59
    iput-boolean v3, v4, Lcom/p1/mobile/putong/data/VerificationResult;->verified:Z

    add-int/lit8 v3, v2, 0x73

    .line 228
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v4

    if-eqz v4, :cond_5b

    const/4 v3, 0x0

    goto :goto_5a

    .line 229
    :cond_5b
    sget-object v4, Lcom/p1/mobile/putong/data/LiveUserLevel;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v4, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/p1/mobile/putong/data/LiveUserLevel;

    :goto_5a
    iput-object v3, v5, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    add-int/lit8 v3, v2, 0x74

    .line 230
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 231
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v14

    if-eqz v14, :cond_5c

    const/4 v3, 0x0

    goto :goto_5b

    .line 232
    :cond_5c
    sget-object v14, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v14}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v14

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v14, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    :goto_5b
    iput-object v3, v4, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->hobby:Ljava/util/List;

    add-int/lit8 v3, v2, 0x75

    .line 233
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 234
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v14

    if-eqz v14, :cond_5d

    const/4 v3, 0x0

    goto :goto_5c

    .line 235
    :cond_5d
    sget-object v14, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v14}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v14

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v14, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    :goto_5c
    iput-object v3, v4, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->recent:Ljava/util/List;

    add-int/lit8 v3, v2, 0x76

    .line 236
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 237
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v14

    if-eqz v14, :cond_5e

    const/4 v3, 0x0

    goto :goto_5d

    .line 238
    :cond_5e
    sget-object v14, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v14}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v14

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v14, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    :goto_5d
    iput-object v3, v4, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->together:Ljava/util/List;

    add-int/lit8 v3, v2, 0x77

    .line 239
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Extensions;->anonymity:Lcom/p1/mobile/putong/data/Anonymity;

    .line 240
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v14

    if-eqz v14, :cond_5f

    const/4 v3, 0x0

    goto :goto_5e

    .line 241
    :cond_5f
    sget-object v14, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v14}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v14

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v14, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    :goto_5e
    iput-object v3, v4, Lcom/p1/mobile/putong/data/Anonymity;->id:Ljava/util/List;

    add-int/lit8 v3, v2, 0x78

    .line 242
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Extensions;->anonymity:Lcom/p1/mobile/putong/data/Anonymity;

    .line 243
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v14

    if-eqz v14, :cond_60

    const/4 v3, 0x0

    goto :goto_5f

    .line 244
    :cond_60
    sget-object v14, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v14}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v14

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v14, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    :goto_5f
    iput-object v3, v4, Lcom/p1/mobile/putong/data/Anonymity;->identifier:Ljava/util/List;

    add-int/lit8 v3, v2, 0x79

    .line 245
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v4

    if-eqz v4, :cond_61

    const/4 v3, 0x0

    goto :goto_60

    .line 246
    :cond_61
    sget-object v4, Lcom/p1/mobile/putong/data/SoulShip;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v4, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/p1/mobile/putong/data/SoulShip;

    :goto_60
    iput-object v3, v5, Lcom/p1/mobile/putong/data/User;->localSoulShip:Lcom/p1/mobile/putong/data/SoulShip;

    add-int/lit8 v3, v2, 0x7a

    .line 247
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v3

    iput-wide v3, v5, Lcom/p1/mobile/putong/data/User;->signupTime:D

    add-int/lit8 v3, v2, 0x7b

    .line 248
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Extensions;->headFrame:Lcom/p1/mobile/putong/data/HeadFrame;

    .line 249
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v14

    if-eqz v14, :cond_62

    const/4 v3, 0x0

    goto :goto_61

    .line 250
    :cond_62
    sget-object v14, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v14}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v14

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v14, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    :goto_61
    iput-object v3, v4, Lcom/p1/mobile/putong/data/HeadFrame;->url:Ljava/util/List;

    add-int/lit8 v3, v2, 0x7c

    .line 251
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Extensions;->headFrame:Lcom/p1/mobile/putong/data/HeadFrame;

    .line 252
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v14

    if-eqz v14, :cond_63

    const/4 v3, 0x0

    goto :goto_62

    .line 253
    :cond_63
    sget-object v14, Lcom/tantanapp/common/data/ProtobufAdapter;->DOUBLE_BOXED_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 254
    invoke-virtual {v14}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v14

    .line 255
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v14, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    :goto_62
    iput-object v3, v4, Lcom/p1/mobile/putong/data/HeadFrame;->expiredTime:Ljava/util/List;

    add-int/lit8 v3, v2, 0x7d

    .line 256
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v4

    if-eqz v4, :cond_64

    const/4 v3, 0x0

    goto :goto_63

    .line 257
    :cond_64
    sget-object v4, Lcom/p1/mobile/putong/data/BanStatus;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v4, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/p1/mobile/putong/data/BanStatus;

    :goto_63
    iput-object v3, v5, Lcom/p1/mobile/putong/data/User;->banStatus:Lcom/p1/mobile/putong/data/BanStatus;

    add-int/lit8 v3, v2, 0x7e

    .line 258
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    const/4 v14, 0x1

    if-ne v3, v14, :cond_65

    const/4 v3, 0x1

    goto :goto_64

    :cond_65
    move/from16 v3, v17

    :goto_64
    iput-boolean v3, v4, Lcom/p1/mobile/putong/data/Profile;->onlyShowAboutMeInside:Z

    add-int/lit8 v3, v2, 0x7f

    .line 259
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v4

    if-eqz v4, :cond_66

    const/4 v3, 0x0

    goto :goto_65

    .line 260
    :cond_66
    sget-object v4, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 261
    invoke-virtual {v4}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v4

    .line 262
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v4, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_c

    :goto_65
    add-int/lit16 v4, v2, 0x80

    .line 263
    :try_start_b
    iget-object v14, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v14, v14, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v14, v14, Lcom/p1/mobile/putong/data/Extensions;->friendStatus:Lcom/p1/mobile/putong/data/FriendStatus;

    .line 264
    invoke-interface {v1, v4}, Landroid/database/Cursor;->isNull(I)Z

    move-result v18

    if-eqz v18, :cond_67

    move-object/from16 v20, v3

    const/4 v3, 0x0

    goto :goto_66

    .line 265
    :cond_67
    sget-object v18, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_b

    move-object/from16 v20, v3

    :try_start_c
    invoke-virtual/range {v18 .. v18}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v3

    invoke-interface {v1, v4}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    :goto_66
    iput-object v3, v14, Lcom/p1/mobile/putong/data/FriendStatus;->labelType:Ljava/util/List;

    add-int/lit16 v3, v2, 0x81

    .line 266
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Extensions;->friendStatus:Lcom/p1/mobile/putong/data/FriendStatus;

    .line 267
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v14

    if-eqz v14, :cond_68

    const/4 v3, 0x0

    goto :goto_67

    .line 268
    :cond_68
    sget-object v14, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v14}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v14

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v14, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    :goto_67
    iput-object v3, v4, Lcom/p1/mobile/putong/data/FriendStatus;->labelName:Ljava/util/List;

    add-int/lit16 v3, v2, 0x82

    .line 269
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Extensions;->friendStatus:Lcom/p1/mobile/putong/data/FriendStatus;

    .line 270
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v14

    if-eqz v14, :cond_69

    const/4 v3, 0x0

    goto :goto_68

    .line 271
    :cond_69
    sget-object v14, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v14}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v14

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v14, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    :goto_68
    iput-object v3, v4, Lcom/p1/mobile/putong/data/FriendStatus;->endTime:Ljava/util/List;

    add-int/lit16 v3, v2, 0x83

    .line 272
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v4

    if-eqz v4, :cond_6a

    const/4 v3, 0x0

    goto :goto_69

    .line 273
    :cond_6a
    sget-object v4, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 274
    invoke-virtual {v4}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v4

    .line 275
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v4, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_a

    :goto_69
    add-int/lit16 v4, v2, 0x84

    .line 276
    :try_start_d
    invoke-interface {v1, v4}, Landroid/database/Cursor;->isNull(I)Z

    move-result v14

    if-eqz v14, :cond_6b

    const/4 v4, 0x0

    goto :goto_6a

    .line 277
    :cond_6b
    sget-object v14, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v14}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v14

    invoke-interface {v1, v4}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v4

    invoke-virtual {v14, v4}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    :goto_6a
    iput-object v4, v5, Lcom/p1/mobile/putong/data/User;->localDiamondPrivateMatchTags:Ljava/util/List;

    add-int/lit16 v4, v2, 0x85

    .line 278
    iget-object v14, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v14, v14, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v14, v14, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 279
    invoke-interface {v1, v4}, Landroid/database/Cursor;->isNull(I)Z

    move-result v18

    if-eqz v18, :cond_6c

    move-object/from16 v21, v3

    const/4 v3, 0x0

    goto :goto_6b

    .line 280
    :cond_6c
    sget-object v18, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_9

    move-object/from16 v21, v3

    :try_start_e
    invoke-virtual/range {v18 .. v18}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v3

    invoke-interface {v1, v4}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    :goto_6b
    iput-object v3, v14, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->interest:Ljava/util/List;

    add-int/lit16 v3, v2, 0x86

    .line 281
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v4

    if-eqz v4, :cond_6d

    const/4 v3, 0x0

    goto :goto_6c

    .line 282
    :cond_6d
    sget-object v4, Lcom/p1/mobile/putong/data/AnonymousLikeInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v4, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/p1/mobile/putong/data/AnonymousLikeInfo;

    :goto_6c
    iput-object v3, v5, Lcom/p1/mobile/putong/data/User;->anonymousLike:Lcom/p1/mobile/putong/data/AnonymousLikeInfo;

    add-int/lit16 v3, v2, 0x87

    .line 283
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    const/4 v14, 0x1

    if-ne v3, v14, :cond_6e

    const/4 v3, 0x1

    goto :goto_6d

    :cond_6e
    move/from16 v3, v17

    :goto_6d
    iput-boolean v3, v5, Lcom/p1/mobile/putong/data/User;->inactivated:Z

    add-int/lit16 v3, v2, 0x88

    .line 284
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 285
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v14

    if-eqz v14, :cond_6f

    const/4 v3, 0x0

    goto :goto_6e

    .line 286
    :cond_6f
    sget-object v14, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v14}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v14

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v14, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    :goto_6e
    iput-object v3, v4, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->country:Ljava/util/List;

    add-int/lit16 v3, v2, 0x89

    .line 287
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 288
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v14

    if-eqz v14, :cond_70

    const/4 v3, 0x0

    goto :goto_6f

    .line 289
    :cond_70
    sget-object v14, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v14}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v14

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v14, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    :goto_6f
    iput-object v3, v4, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->province:Ljava/util/List;

    add-int/lit16 v3, v2, 0x8a

    .line 290
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 291
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v14

    if-eqz v14, :cond_71

    const/4 v3, 0x0

    goto :goto_70

    .line 292
    :cond_71
    sget-object v14, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v14}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v14

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v14, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    :goto_70
    iput-object v3, v4, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->city:Ljava/util/List;

    add-int/lit16 v3, v2, 0x8b

    .line 293
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v4

    if-eqz v4, :cond_72

    const/4 v3, 0x0

    goto :goto_71

    :cond_72
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_8

    :goto_71
    add-int/lit16 v4, v2, 0x8c

    .line 294
    :try_start_f
    invoke-interface {v1, v4}, Landroid/database/Cursor;->isNull(I)Z

    move-result v14

    if-eqz v14, :cond_73

    const/4 v4, 0x0

    goto :goto_72

    .line 295
    :cond_73
    sget-object v14, Lcom/p1/mobile/putong/data/UserStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    invoke-virtual {v14}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v14

    invoke-interface {v1, v4}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v4

    invoke-virtual {v14, v4}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    :goto_72
    iput-object v4, v5, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    add-int/lit16 v4, v2, 0x8d

    .line 296
    invoke-interface {v1, v4}, Landroid/database/Cursor;->isNull(I)Z

    move-result v14

    if-eqz v14, :cond_74

    const/4 v4, 0x0

    goto :goto_73

    :cond_74
    invoke-interface {v1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_7

    :goto_73
    add-int/lit16 v14, v2, 0x8e

    .line 297
    :try_start_10
    invoke-interface {v1, v14}, Landroid/database/Cursor;->isNull(I)Z

    move-result v18

    if-eqz v18, :cond_75

    const/4 v14, 0x0

    goto :goto_74

    :cond_75
    invoke-interface {v1, v14}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v14
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_10} :catch_6

    :goto_74
    move-object/from16 v18, v3

    add-int/lit16 v3, v2, 0x8f

    .line 298
    :try_start_11
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v22

    if-eqz v22, :cond_76

    const/4 v3, 0x0

    goto :goto_75

    :cond_76
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_11} :catch_5

    :goto_75
    move-object/from16 v22, v3

    add-int/lit16 v3, v2, 0x90

    .line 299
    :try_start_12
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v23

    if-eqz v23, :cond_77

    const/4 v3, 0x0

    goto :goto_76

    :cond_77
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_12} :catch_4

    :goto_76
    move-object/from16 v23, v3

    add-int/lit16 v3, v2, 0x91

    .line 300
    :try_start_13
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v24

    if-eqz v24, :cond_78

    const/4 v3, 0x0

    goto :goto_77

    :cond_78
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_13} :catch_3

    :goto_77
    move-object/from16 v19, v3

    add-int/lit16 v3, v2, 0x92

    move-object/from16 v24, v4

    .line 301
    :try_start_14
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 302
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v25

    if-eqz v25, :cond_79

    move/from16 v26, v6

    const/4 v3, 0x0

    goto :goto_78

    .line 303
    :cond_79
    sget-object v25, Lcom/p1/mobile/putong/data/LocationInvisibleField;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_14} :catch_2

    move/from16 v26, v6

    .line 304
    :try_start_15
    invoke-virtual/range {v25 .. v25}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v6

    .line 305
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v6, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    :goto_78
    iput-object v3, v4, Lcom/p1/mobile/putong/data/Location;->invisibleFields:Ljava/util/List;

    add-int/lit16 v3, v2, 0x93

    .line 306
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 307
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_7a

    const/4 v3, 0x0

    goto :goto_79

    .line 308
    :cond_7a
    sget-object v6, Lcom/p1/mobile/putong/data/BloodType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    invoke-virtual {v6}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v6

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v6, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    :goto_79
    iput-object v3, v4, Lcom/p1/mobile/putong/data/Physical;->bloodType:Ljava/util/List;

    add-int/lit16 v3, v2, 0x94

    .line 309
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 310
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_7b

    const/4 v3, 0x0

    goto :goto_7a

    .line 311
    :cond_7b
    sget-object v6, Lcom/p1/mobile/putong/data/Purpose;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    invoke-virtual {v6}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v6

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v6, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    :goto_7a
    iput-object v3, v4, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->friendPurpose:Ljava/util/List;

    add-int/lit16 v3, v2, 0x95

    .line 312
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Extensions;->friendStatus:Lcom/p1/mobile/putong/data/FriendStatus;

    .line 313
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_7c

    const/4 v3, 0x0

    goto :goto_7b

    .line 314
    :cond_7c
    sget-object v6, Lcom/p1/mobile/putong/data/FriendState;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    invoke-virtual {v6}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v6

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v6, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    :goto_7b
    iput-object v3, v4, Lcom/p1/mobile/putong/data/FriendStatus;->status:Ljava/util/List;

    add-int/lit16 v3, v2, 0x96

    .line 315
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Extensions;->momentSwitch:Lcom/p1/mobile/putong/data/MomentSwitch;

    .line 316
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_7d

    const/4 v3, 0x0

    goto :goto_7c

    .line 317
    :cond_7d
    sget-object v6, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v6}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v6

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v6, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    :goto_7c
    iput-object v3, v4, Lcom/p1/mobile/putong/data/MomentSwitch;->noSyncMoment:Ljava/util/List;

    add-int/lit16 v3, v2, 0x97

    .line 318
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 319
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_7e

    const/4 v3, 0x0

    goto :goto_7d

    .line 320
    :cond_7e
    sget-object v6, Lcom/p1/mobile/putong/data/UserWealth;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v6, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/p1/mobile/putong/data/UserWealth;

    :goto_7d
    iput-object v3, v4, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    add-int/lit16 v3, v2, 0x98

    .line 321
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 322
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_7f

    const/4 v3, 0x0

    goto :goto_7e

    .line 323
    :cond_7f
    sget-object v6, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v6}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v6

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v6, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    :goto_7e
    iput-object v3, v4, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->qualification:Ljava/util/List;

    add-int/lit16 v3, v2, 0x99

    .line 324
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 325
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_80

    const/4 v3, 0x0

    goto :goto_7f

    .line 326
    :cond_80
    sget-object v6, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v6}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v6

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v6, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    :goto_7f
    iput-object v3, v4, Lcom/p1/mobile/putong/data/Physical;->height:Ljava/util/List;

    add-int/lit16 v3, v2, 0x9a

    .line 327
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 328
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_81

    const/4 v3, 0x0

    goto :goto_80

    .line 329
    :cond_81
    sget-object v6, Lcom/p1/mobile/putong/data/ProfileCompletion;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v6, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/p1/mobile/putong/data/ProfileCompletion;

    :goto_80
    iput-object v3, v4, Lcom/p1/mobile/putong/data/Extensions;->profileCompletion:Lcom/p1/mobile/putong/data/ProfileCompletion;

    add-int/lit16 v3, v2, 0x9b

    .line 330
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 331
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_82

    const/4 v3, 0x0

    goto :goto_81

    .line 332
    :cond_82
    sget-object v6, Lcom/p1/mobile/putong/data/VoiceSignature;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v6, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/p1/mobile/putong/data/VoiceSignature;

    :goto_81
    iput-object v3, v4, Lcom/p1/mobile/putong/data/Extensions;->voiceSignature:Lcom/p1/mobile/putong/data/VoiceSignature;

    add-int/lit16 v3, v2, 0x9c

    .line 333
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->activityUser:Lcom/p1/mobile/putong/data/ActivityUser;

    .line 334
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_83

    const/4 v3, 0x0

    goto :goto_82

    :cond_83
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    :goto_82
    iput-object v3, v4, Lcom/p1/mobile/putong/data/ActivityUser;->action:Ljava/lang/String;

    add-int/lit16 v3, v2, 0x9d

    .line 335
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->activityUser:Lcom/p1/mobile/putong/data/ActivityUser;
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_15} :catch_1

    move/from16 v25, v7

    :try_start_16
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v6

    iput-wide v6, v4, Lcom/p1/mobile/putong/data/ActivityUser;->score:J

    add-int/lit16 v3, v2, 0x9e

    .line 336
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_84

    move v3, v4

    goto :goto_83

    :cond_84
    move/from16 v3, v17

    :goto_83
    iput-boolean v3, v5, Lcom/p1/mobile/putong/data/User;->matePlanUser:Z

    add-int/lit16 v3, v2, 0x9f

    .line 337
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    if-ne v3, v4, :cond_85

    const/4 v3, 0x1

    goto :goto_84

    :cond_85
    move/from16 v3, v17

    :goto_84
    iput-boolean v3, v5, Lcom/p1/mobile/putong/data/User;->matePlanAdUser:Z

    add-int/lit16 v3, v2, 0xa0

    .line 338
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v4

    if-eqz v4, :cond_86

    const/4 v3, 0x0

    goto :goto_85

    :cond_86
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    :goto_85
    iput-object v3, v5, Lcom/p1/mobile/putong/data/User;->regionTag:Ljava/lang/String;

    add-int/lit16 v3, v2, 0xa1

    .line 339
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v4

    if-eqz v4, :cond_87

    const/4 v3, 0x0

    goto :goto_86

    .line 340
    :cond_87
    sget-object v4, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v4}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v4

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v4, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    :goto_86
    iput-object v3, v5, Lcom/p1/mobile/putong/data/User;->localLikeIdentifiers:Ljava/util/List;

    add-int/lit16 v3, v2, 0xa2

    .line 341
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_88

    const/4 v3, 0x1

    goto :goto_87

    :cond_88
    move/from16 v3, v17

    :goto_87
    iput-boolean v3, v5, Lcom/p1/mobile/putong/data/User;->deleted:Z

    add-int/lit16 v3, v2, 0xa3

    .line 342
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 343
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_89

    const/4 v3, 0x0

    goto :goto_88

    .line 344
    :cond_89
    sget-object v6, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v6}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v6

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v6, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    :goto_88
    iput-object v3, v4, Lcom/p1/mobile/putong/data/Interest;->tags:Ljava/util/List;

    add-int/lit16 v3, v2, 0xa4

    .line 345
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Extensions;->live:Lcom/p1/mobile/putong/data/VirtualVoiceLive;

    .line 346
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_8a

    const/4 v3, 0x0

    goto :goto_89

    .line 347
    :cond_8a
    sget-object v6, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v6}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v6

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v6, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    :goto_89
    iput-object v3, v4, Lcom/p1/mobile/putong/data/VirtualVoiceLive;->voiceImgId:Ljava/util/List;

    add-int/lit16 v3, v2, 0xa5

    .line 348
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Extensions;->live:Lcom/p1/mobile/putong/data/VirtualVoiceLive;

    .line 349
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_8b

    const/4 v3, 0x0

    goto :goto_8a

    .line 350
    :cond_8b
    sget-object v6, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v6}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v6

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v6, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    :goto_8a
    iput-object v3, v4, Lcom/p1/mobile/putong/data/VirtualVoiceLive;->voiceImgUrl:Ljava/util/List;

    add-int/lit16 v3, v2, 0xa6

    .line 351
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 352
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_8c

    const/4 v3, 0x0

    goto :goto_8b

    .line 353
    :cond_8c
    sget-object v6, Lcom/p1/mobile/putong/data/ProfileMate;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v6, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/p1/mobile/putong/data/ProfileMate;

    :goto_8b
    iput-object v3, v4, Lcom/p1/mobile/putong/data/Extensions;->mate:Lcom/p1/mobile/putong/data/ProfileMate;

    add-int/lit16 v3, v2, 0xa7

    .line 354
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 355
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_8d

    const/4 v3, 0x0

    goto :goto_8c

    :cond_8d
    sget-object v6, Lcom/p1/mobile/putong/data/PetInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v6, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/p1/mobile/putong/data/PetInfo;

    :goto_8c
    iput-object v3, v4, Lcom/p1/mobile/putong/data/Extensions;->pet:Lcom/p1/mobile/putong/data/PetInfo;

    add-int/lit16 v3, v2, 0xa8

    .line 356
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Extensions;->tailFrame:Lcom/p1/mobile/putong/data/TailFrame;

    .line 357
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_8e

    const/4 v3, 0x0

    goto :goto_8d

    .line 358
    :cond_8e
    sget-object v6, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v6}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v6

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v6, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    :goto_8d
    iput-object v3, v4, Lcom/p1/mobile/putong/data/TailFrame;->url:Ljava/util/List;

    add-int/lit16 v3, v2, 0xa9

    .line 359
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Extensions;->tailFrame:Lcom/p1/mobile/putong/data/TailFrame;

    .line 360
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_8f

    const/4 v3, 0x0

    goto :goto_8e

    .line 361
    :cond_8f
    sget-object v6, Lcom/tantanapp/common/data/ProtobufAdapter;->DOUBLE_BOXED_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 362
    invoke-virtual {v6}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v6

    .line 363
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v6, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    :goto_8e
    iput-object v3, v4, Lcom/p1/mobile/putong/data/TailFrame;->expiredTime:Ljava/util/List;

    add-int/lit16 v3, v2, 0xaa

    .line 364
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Extensions;->business:Lcom/p1/mobile/putong/data/Business;

    .line 365
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_90

    const/4 v3, 0x0

    goto :goto_8f

    .line 366
    :cond_90
    sget-object v6, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v6}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v6

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v6, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    :goto_8f
    iput-object v3, v4, Lcom/p1/mobile/putong/data/Business;->avatarID:Ljava/util/List;

    add-int/lit16 v3, v2, 0xab

    .line 367
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Extensions;->business:Lcom/p1/mobile/putong/data/Business;

    .line 368
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_91

    const/4 v3, 0x0

    goto :goto_90

    .line 369
    :cond_91
    sget-object v6, Lcom/tantanapp/common/data/ProtobufAdapter;->LONG_BOXED_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 370
    invoke-virtual {v6}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v6

    .line 371
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v6, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    :goto_90
    iput-object v3, v4, Lcom/p1/mobile/putong/data/Business;->avatarExpireTime:Ljava/util/List;

    add-int/lit16 v3, v2, 0xac

    .line 372
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Extensions;->business:Lcom/p1/mobile/putong/data/Business;

    .line 373
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_92

    const/4 v3, 0x0

    goto :goto_91

    .line 374
    :cond_92
    sget-object v6, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v6}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v6

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v6, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    :goto_91
    iput-object v3, v4, Lcom/p1/mobile/putong/data/Business;->avatarClose:Ljava/util/List;

    add-int/lit16 v3, v2, 0xad

    .line 375
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v4

    if-eqz v4, :cond_93

    const/4 v3, 0x0

    goto :goto_92

    .line 376
    :cond_93
    sget-object v4, Lcom/p1/mobile/putong/data/SpecialEffect;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v4, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/p1/mobile/putong/data/SpecialEffect;

    :goto_92
    iput-object v3, v5, Lcom/p1/mobile/putong/data/User;->specialEffect:Lcom/p1/mobile/putong/data/SpecialEffect;

    add-int/lit16 v3, v2, 0xae

    .line 377
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 378
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_94

    const/4 v3, 0x0

    goto :goto_93

    .line 379
    :cond_94
    sget-object v6, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v6}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v6

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v6, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    :goto_93
    iput-object v3, v4, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->ethnicity:Ljava/util/List;

    add-int/lit16 v3, v2, 0xaf

    .line 380
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 381
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_95

    const/4 v3, 0x0

    goto :goto_94

    .line 382
    :cond_95
    sget-object v6, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v6}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v6

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v6, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    :goto_94
    iput-object v3, v4, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->language:Ljava/util/List;

    add-int/lit16 v3, v2, 0xb0

    .line 383
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 384
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_96

    const/4 v3, 0x0

    goto :goto_95

    .line 385
    :cond_96
    sget-object v6, Lcom/p1/mobile/putong/data/VoiceAvatarFrame;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v6, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/p1/mobile/putong/data/VoiceAvatarFrame;

    :goto_95
    iput-object v3, v4, Lcom/p1/mobile/putong/data/Extensions;->voiceAvatarFrame:Lcom/p1/mobile/putong/data/VoiceAvatarFrame;

    add-int/lit16 v3, v2, 0xb1

    .line 386
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 387
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_97

    const/4 v3, 0x0

    goto :goto_96

    .line 388
    :cond_97
    sget-object v6, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v6}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v6

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v6, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    :goto_96
    iput-object v3, v4, Lcom/p1/mobile/putong/data/Physical;->heightImg:Ljava/util/List;

    add-int/lit16 v3, v2, 0xb2

    .line 389
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 390
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_98

    const/4 v3, 0x0

    goto :goto_97

    .line 391
    :cond_98
    sget-object v6, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v6, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    :goto_97
    iput-object v3, v4, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    add-int/lit16 v3, v2, 0xb3

    .line 392
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 393
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_99

    const/4 v3, 0x0

    goto :goto_98

    .line 394
    :cond_99
    sget-object v6, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v6}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v6

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v6, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    :goto_98
    iput-object v3, v4, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->address:Ljava/util/List;

    add-int/lit16 v3, v2, 0xb4

    .line 395
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 396
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_9a

    const/4 v3, 0x0

    goto :goto_99

    .line 397
    :cond_9a
    sget-object v6, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v6}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v6

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v6, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    :goto_99
    iput-object v3, v4, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->familyBackground:Ljava/util/List;

    add-int/lit16 v3, v2, 0xb5

    .line 398
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 399
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_9b

    const/4 v3, 0x0

    goto :goto_9a

    .line 400
    :cond_9b
    sget-object v6, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v6}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v6

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v6, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    :goto_9a
    iput-object v3, v4, Lcom/p1/mobile/putong/data/Physical;->weight:Ljava/util/List;

    add-int/lit16 v3, v2, 0xb6

    .line 401
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/PicVerification;->others:Lcom/p1/mobile/putong/data/OtherVerificationWrapper;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/OtherVerificationWrapper;->otherCTDID:Lcom/p1/mobile/putong/data/VerificationResult;

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    const/4 v6, 0x1

    if-ne v3, v6, :cond_9c

    goto :goto_9b

    :cond_9c
    move/from16 v6, v17

    :goto_9b
    iput-boolean v6, v4, Lcom/p1/mobile/putong/data/VerificationResult;->verified:Z

    add-int/lit16 v3, v2, 0xb7

    .line 402
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 403
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_9d

    const/4 v3, 0x0

    goto :goto_9c

    .line 404
    :cond_9d
    sget-object v6, Lcom/p1/mobile/putong/data/ExtensionGame;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v6, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/p1/mobile/putong/data/ExtensionGame;

    :goto_9c
    iput-object v3, v4, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    add-int/lit16 v3, v2, 0xb8

    .line 405
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 406
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_9e

    const/4 v3, 0x0

    goto :goto_9d

    .line 407
    :cond_9e
    sget-object v6, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v6}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v6

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v6, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    :goto_9d
    iput-object v3, v4, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->facialFeature:Ljava/util/List;

    add-int/lit16 v3, v2, 0xb9

    .line 408
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/PicVerification;->idCard:Lcom/p1/mobile/putong/data/IdVerificationResult;

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    iput v3, v4, Lcom/p1/mobile/putong/data/IdVerificationResult;->age:I

    add-int/lit16 v3, v2, 0xba

    .line 409
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/PicVerification;->idCard:Lcom/p1/mobile/putong/data/IdVerificationResult;

    .line 410
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_9f

    const/4 v3, 0x0

    goto :goto_9e

    :cond_9f
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    :goto_9e
    iput-object v3, v4, Lcom/p1/mobile/putong/data/IdVerificationResult;->first4:Ljava/lang/String;

    add-int/lit16 v3, v2, 0xbb

    .line 411
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 412
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_a0

    const/4 v3, 0x0

    goto :goto_9f

    .line 413
    :cond_a0
    sget-object v6, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v6}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v6

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v6, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    :goto_9f
    iput-object v3, v4, Lcom/p1/mobile/putong/data/Physical;->fitness:Ljava/util/List;

    add-int/lit16 v3, v2, 0xbc

    .line 414
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 415
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_a1

    const/4 v3, 0x0

    goto :goto_a0

    .line 416
    :cond_a1
    sget-object v6, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v6}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v6

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v6, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    :goto_a0
    iput-object v3, v4, Lcom/p1/mobile/putong/data/Physical;->drink:Ljava/util/List;

    add-int/lit16 v3, v2, 0xbd

    .line 417
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 418
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_a2

    const/4 v3, 0x0

    goto :goto_a1

    .line 419
    :cond_a2
    sget-object v6, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v6}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v6

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v6, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    :goto_a1
    iput-object v3, v4, Lcom/p1/mobile/putong/data/Physical;->smoke:Ljava/util/List;

    add-int/lit16 v3, v2, 0xbe

    .line 420
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 421
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_a3

    const/4 v3, 0x0

    goto :goto_a2

    .line 422
    :cond_a3
    sget-object v6, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v6}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v6

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v6, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    :goto_a2
    iput-object v3, v4, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->mbti:Ljava/util/List;

    add-int/lit16 v3, v2, 0xbf

    .line 423
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v4

    if-eqz v4, :cond_a4

    const/4 v3, 0x0

    goto :goto_a3

    .line 424
    :cond_a4
    sget-object v4, Lcom/p1/mobile/putong/data/UserActivityInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v4, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/p1/mobile/putong/data/UserActivityInfo;

    :goto_a3
    iput-object v3, v5, Lcom/p1/mobile/putong/data/User;->userActivityInfo:Lcom/p1/mobile/putong/data/UserActivityInfo;

    add-int/lit16 v3, v2, 0xc0

    .line 425
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 426
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_a5

    const/4 v3, 0x0

    goto :goto_a4

    .line 427
    :cond_a5
    sget-object v6, Lcom/p1/mobile/putong/data/IdealTag;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v6}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v6

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v6, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    :goto_a4
    iput-object v3, v4, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->ideal:Ljava/util/List;

    add-int/lit16 v3, v2, 0xc1

    .line 428
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 429
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_a6

    const/4 v3, 0x0

    goto :goto_a5

    .line 430
    :cond_a6
    sget-object v6, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v6}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v6

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v6, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    :goto_a5
    iput-object v3, v4, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->unideal:Ljava/util/List;

    add-int/lit16 v3, v2, 0xc2

    .line 431
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->moments:Lcom/p1/mobile/putong/data/Moments;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Moments;->counters:Lcom/p1/mobile/putong/data/MomentCounter;

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    iput v3, v4, Lcom/p1/mobile/putong/data/MomentCounter;->totalNormalMoments:I

    add-int/lit16 v3, v2, 0xc3

    .line 432
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 433
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_a7

    const/4 v3, 0x0

    goto :goto_a6

    .line 434
    :cond_a7
    sget-object v6, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v6}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v6

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v6, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    :goto_a6
    iput-object v3, v4, Lcom/p1/mobile/putong/data/Interest;->taste:Ljava/util/List;

    add-int/lit16 v3, v2, 0xc4

    .line 435
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 436
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_a8

    const/4 v3, 0x0

    goto :goto_a7

    :cond_a8
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    :goto_a7
    iput-object v3, v4, Lcom/p1/mobile/putong/data/Region;->province:Ljava/lang/String;

    add-int/lit16 v3, v2, 0xc5

    .line 437
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 438
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_a9

    const/4 v3, 0x0

    goto :goto_a8

    .line 439
    :cond_a9
    sget-object v6, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v6}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v6

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v6, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    :goto_a8
    iput-object v3, v4, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->intlFriendPurpose:Ljava/util/List;

    add-int/lit16 v3, v2, 0xc6

    .line 440
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v4, v4, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 441
    invoke-interface {v1, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_aa

    const/4 v7, 0x0

    goto :goto_a9

    .line 442
    :cond_aa
    sget-object v6, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v6}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v6

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v6, v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    move-result-object v3

    move-object v7, v3

    check-cast v7, Ljava/util/List;

    :goto_a9
    iput-object v7, v4, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->intlFriendPurposeV2:Ljava/util/List;

    add-int/lit16 v2, v2, 0xc7

    .line 443
    iput v2, v0, Ll/vzf0;->readIndex:I
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_16 .. :try_end_16} :catch_0

    move-object/from16 p0, v9

    move-object/from16 v3, v18

    move-object/from16 v2, v19

    move-object/from16 v16, v20

    move-object/from16 v4, v24

    :goto_aa
    move-object/from16 v0, v22

    move-object/from16 v1, v23

    move/from16 v7, v25

    move/from16 v6, v26

    goto/16 :goto_bc

    :catch_0
    move-exception v0

    :goto_ab
    move v6, v8

    move-object v7, v9

    move-object/from16 v3, v18

    move-object/from16 v2, v19

    :goto_ac
    move-object/from16 v16, v20

    move-object/from16 v19, v24

    goto/16 :goto_bb

    :catch_1
    move-exception v0

    :goto_ad
    move/from16 v25, v7

    goto :goto_ab

    :catch_2
    move-exception v0

    :goto_ae
    move/from16 v26, v6

    goto :goto_ad

    :catch_3
    move-exception v0

    move-object/from16 v24, v4

    goto :goto_ae

    :catch_4
    move-exception v0

    move-object/from16 v24, v4

    move/from16 v26, v6

    move/from16 v25, v7

    move v6, v8

    move-object v7, v9

    move-object/from16 v3, v18

    move-object/from16 v2, v19

    move-object/from16 v23, v2

    goto :goto_ac

    :catch_5
    move-exception v0

    move-object/from16 v24, v4

    move/from16 v26, v6

    move/from16 v25, v7

    move v6, v8

    move-object v7, v9

    move-object/from16 v3, v18

    move-object/from16 v2, v19

    move-object/from16 v22, v2

    :goto_af
    move-object/from16 v23, v22

    goto :goto_ac

    :catch_6
    move-exception v0

    move-object/from16 v18, v3

    move-object/from16 v24, v4

    move/from16 v26, v6

    move/from16 v25, v7

    move v6, v8

    move-object v7, v9

    move-object/from16 v2, v19

    move-object v14, v2

    move-object/from16 v22, v14

    goto :goto_af

    :catch_7
    move-exception v0

    move-object/from16 v18, v3

    move/from16 v26, v6

    move/from16 v25, v7

    move v6, v8

    move-object v7, v9

    move-object/from16 v2, v19

    move-object v14, v2

    :goto_b0
    move-object/from16 v22, v14

    move-object/from16 v23, v22

    move-object/from16 v16, v20

    goto/16 :goto_bb

    :catch_8
    move-exception v0

    :goto_b1
    move/from16 v26, v6

    move/from16 v25, v7

    move v6, v8

    move-object v7, v9

    move-object/from16 v2, v19

    move-object v3, v2

    move-object v14, v3

    goto :goto_b0

    :catch_9
    move-exception v0

    move-object/from16 v21, v3

    goto :goto_b1

    :catch_a
    move-exception v0

    :goto_b2
    move/from16 v26, v6

    move/from16 v25, v7

    move v6, v8

    move-object v7, v9

    move-object/from16 v2, v19

    move-object v3, v2

    move-object v14, v3

    move-object/from16 v22, v14

    move-object/from16 v23, v22

    move-object/from16 v16, v20

    :goto_b3
    const/16 v21, 0x0

    goto/16 :goto_bb

    :catch_b
    move-exception v0

    move-object/from16 v20, v3

    goto :goto_b2

    :catch_c
    move-exception v0

    :goto_b4
    move/from16 v26, v6

    move/from16 v25, v7

    move v6, v8

    move-object v7, v9

    move-object/from16 v2, v19

    move-object v3, v2

    move-object v14, v3

    move-object/from16 v22, v14

    move-object/from16 v23, v22

    :goto_b5
    const/16 v16, 0x0

    goto :goto_b3

    :catch_d
    move-exception v0

    move-object/from16 v19, v3

    goto :goto_b4

    :catch_e
    move-exception v0

    move-object/from16 v19, v3

    move/from16 v17, v4

    move/from16 v26, v6

    move/from16 v25, v7

    move v6, v8

    move-object v7, v9

    move-object/from16 v2, v19

    move-object v3, v2

    move-object v14, v3

    move-object/from16 v22, v14

    move-object/from16 v23, v22

    :goto_b6
    const/4 v13, 0x0

    goto :goto_b5

    :catch_f
    move-exception v0

    move-object/from16 v19, v3

    move/from16 v17, v4

    move/from16 v26, v6

    move/from16 v25, v7

    move v6, v8

    move-object v7, v9

    move-object/from16 v2, v19

    move-object v3, v2

    move-object v14, v3

    move-object/from16 v22, v14

    move-object/from16 v23, v22

    const/4 v12, 0x0

    goto :goto_b6

    :catch_10
    move-exception v0

    move-object/from16 v19, v3

    move/from16 v17, v4

    move/from16 v26, v6

    move/from16 v25, v7

    move v6, v8

    move-object v7, v9

    move-object/from16 v2, v19

    move-object v3, v2

    move-object v14, v3

    move-object/from16 v22, v14

    move-object/from16 v23, v22

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v15, -0x1

    goto :goto_b5

    :catch_11
    move-exception v0

    move-object/from16 v19, v3

    move/from16 v17, v4

    move/from16 v26, v6

    move v6, v8

    move-object v7, v9

    move-object/from16 v2, v19

    move-object v3, v2

    move-object v14, v3

    move-object/from16 v22, v14

    move-object/from16 v23, v22

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v15, -0x1

    const/16 v16, 0x0

    const/16 v21, 0x0

    const/16 v25, -0x1

    goto/16 :goto_bb

    :catch_12
    move-exception v0

    move-object/from16 v19, v3

    move/from16 v17, v4

    move v6, v8

    move-object v7, v9

    move-object/from16 v2, v19

    move-object v3, v2

    move-object v14, v3

    move-object/from16 v22, v14

    move-object/from16 v23, v22

    :goto_b7
    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v15, -0x1

    const/16 v16, 0x0

    const/16 v21, 0x0

    const/16 v25, -0x1

    const/16 v26, -0x1

    goto :goto_bb

    :catch_13
    move-exception v0

    move-object/from16 v19, v3

    move/from16 v17, v4

    move v6, v8

    move-object v7, v9

    move-object/from16 v2, v19

    move-object v3, v2

    move-object v14, v3

    move-object/from16 v22, v14

    move-object/from16 v23, v22

    :goto_b8
    const/4 v11, -0x1

    goto :goto_b7

    :catch_14
    move-exception v0

    move-object/from16 v19, v3

    move/from16 v17, v4

    move v6, v8

    move-object v7, v9

    move-object/from16 v2, v19

    move-object v3, v2

    move-object v14, v3

    move-object/from16 v22, v14

    move-object/from16 v23, v22

    :goto_b9
    const/4 v10, -0x1

    goto :goto_b8

    :catch_15
    move-exception v0

    move-object/from16 v19, v3

    move/from16 v17, v4

    move v6, v8

    move-object/from16 v2, v19

    move-object v3, v2

    move-object v14, v3

    move-object/from16 v22, v14

    move-object/from16 v23, v22

    :goto_ba
    const/4 v7, 0x0

    goto :goto_b9

    :catch_16
    move-exception v0

    move-object/from16 v19, v3

    move/from16 v17, v4

    move-object/from16 v2, v19

    move-object v3, v2

    move-object v14, v3

    move-object/from16 v22, v14

    move-object/from16 v23, v22

    const/4 v6, -0x1

    goto :goto_ba

    .line 444
    :goto_bb
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/MessageNano;->reportError(Ljava/lang/Exception;Landroid/database/Cursor;)V

    move v8, v6

    move-object/from16 p0, v7

    move-object/from16 v4, v19

    goto/16 :goto_aa

    .line 445
    :goto_bc
    iget-object v9, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    move-object/from16 p1, v12

    sget-object v12, Lcom/p1/mobile/putong/data/ProfileZodiac;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 446
    invoke-virtual {v12, v3, v8}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    move-result-object v3

    check-cast v3, Lcom/p1/mobile/putong/data/ProfileZodiac;

    iput-object v3, v9, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 447
    iget-object v3, v5, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    if-nez v3, :cond_ab

    if-eqz p0, :cond_ab

    .line 448
    invoke-static/range {p0 .. p0}, Lcom/p1/mobile/putong/data/UserStatus;->oldEnumCovertList(Ljava/util/List;)Ljava/util/List;

    move-result-object v3

    iput-object v3, v5, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 449
    :cond_ab
    sget-object v3, Lcom/p1/mobile/putong/data/Gender;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    invoke-virtual {v3, v4, v10}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    move-result-object v4

    check-cast v4, Lcom/p1/mobile/putong/data/Gender;

    iput-object v4, v5, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 450
    iget-object v4, v5, Lcom/p1/mobile/putong/data/User;->membership:Lcom/p1/mobile/putong/data/Membership;

    sget-object v8, Lcom/p1/mobile/putong/data/MembershipType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 451
    invoke-virtual {v8, v14, v11}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    move-result-object v8

    check-cast v8, Lcom/p1/mobile/putong/data/MembershipType;

    iput-object v8, v4, Lcom/p1/mobile/putong/data/Membership;->name:Lcom/p1/mobile/putong/data/MembershipType;

    .line 452
    sget-object v4, Lcom/p1/mobile/putong/data/UserSource;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    invoke-virtual {v4, v0, v6}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/data/UserSource;

    iput-object v0, v5, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 453
    iget-object v0, v5, Lcom/p1/mobile/putong/data/User;->membership:Lcom/p1/mobile/putong/data/Membership;

    sget-object v4, Lcom/p1/mobile/putong/data/VIPBadgeType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 454
    invoke-virtual {v4, v1, v7}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    move-result-object v1

    check-cast v1, Lcom/p1/mobile/putong/data/VIPBadgeType;

    iput-object v1, v0, Lcom/p1/mobile/putong/data/Membership;->vipBadgeType:Lcom/p1/mobile/putong/data/VIPBadgeType;

    .line 455
    iget-object v0, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    sget-object v1, Lcom/p1/mobile/putong/data/QualificationType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 456
    invoke-virtual {v1, v2, v15}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    move-result-object v1

    check-cast v1, Lcom/p1/mobile/putong/data/QualificationType;

    iput-object v1, v0, Lcom/p1/mobile/putong/data/Studies;->qualification:Lcom/p1/mobile/putong/data/QualificationType;

    .line 457
    iget-object v0, v5, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    iget-object v1, v0, Lcom/p1/mobile/putong/data/Location;->invisibleFields:Ljava/util/List;

    if-nez v1, :cond_ac

    if-eqz p1, :cond_ac

    .line 458
    invoke-static/range {p1 .. p1}, Lcom/p1/mobile/putong/data/LocationInvisibleField;->oldEnumCovertList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/data/Location;->invisibleFields:Ljava/util/List;

    .line 459
    :cond_ac
    iget-object v0, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    iget-object v1, v0, Lcom/p1/mobile/putong/data/Physical;->bloodType:Ljava/util/List;

    if-nez v1, :cond_ad

    if-eqz v13, :cond_ad

    .line 460
    invoke-static {v13}, Lcom/p1/mobile/putong/data/BloodType;->oldEnumCovertList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/data/Physical;->bloodType:Ljava/util/List;

    .line 461
    :cond_ad
    iget-object v0, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    iget-object v1, v0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->friendPurpose:Ljava/util/List;

    if-nez v1, :cond_ae

    if-eqz v16, :cond_ae

    .line 462
    invoke-static/range {v16 .. v16}, Lcom/p1/mobile/putong/data/Purpose;->oldEnumCovertList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->friendPurpose:Ljava/util/List;

    .line 463
    :cond_ae
    iget-object v0, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->friendStatus:Lcom/p1/mobile/putong/data/FriendStatus;

    iget-object v1, v0, Lcom/p1/mobile/putong/data/FriendStatus;->status:Ljava/util/List;

    if-nez v1, :cond_af

    if-eqz v21, :cond_af

    .line 464
    invoke-static/range {v21 .. v21}, Lcom/p1/mobile/putong/data/FriendState;->oldEnumCovertList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/p1/mobile/putong/data/FriendStatus;->status:Ljava/util/List;

    .line 465
    :cond_af
    iget-object v0, v5, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    const-string v1, ""

    if-nez v0, :cond_b0

    iput-object v1, v5, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 466
    :cond_b0
    iget-object v0, v5, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    if-nez v0, :cond_b1

    invoke-static {}, Lcom/p1/mobile/putong/data/Location;->new_()Lcom/p1/mobile/putong/data/Location;

    move-result-object v0

    iput-object v0, v5, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 467
    :cond_b1
    iget-object v0, v5, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    if-nez v0, :cond_b2

    iput-object v1, v5, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 468
    :cond_b2
    iget-object v0, v5, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    if-nez v0, :cond_b3

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, v5, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 469
    :cond_b3
    iget-object v0, v5, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    if-nez v0, :cond_b4

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, v5, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 470
    :cond_b4
    iget-object v0, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    if-nez v0, :cond_b5

    invoke-static {}, Lcom/p1/mobile/putong/data/Profile;->new_()Lcom/p1/mobile/putong/data/Profile;

    move-result-object v0

    iput-object v0, v5, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 471
    :cond_b5
    iget-object v0, v5, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    if-nez v0, :cond_b6

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, v5, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 472
    :cond_b6
    iget-object v0, v5, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    if-nez v0, :cond_b7

    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/data/Gender;

    iput-object v0, v5, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 473
    :cond_b7
    iget-object v0, v5, Lcom/p1/mobile/putong/data/User;->membership:Lcom/p1/mobile/putong/data/Membership;

    if-nez v0, :cond_b8

    invoke-static {}, Lcom/p1/mobile/putong/data/Membership;->new_()Lcom/p1/mobile/putong/data/Membership;

    move-result-object v0

    iput-object v0, v5, Lcom/p1/mobile/putong/data/User;->membership:Lcom/p1/mobile/putong/data/Membership;

    .line 474
    :cond_b8
    iget-object v0, v5, Lcom/p1/mobile/putong/data/User;->realName:Ljava/lang/String;

    if-nez v0, :cond_b9

    iput-object v1, v5, Lcom/p1/mobile/putong/data/User;->realName:Ljava/lang/String;

    .line 475
    :cond_b9
    iget-object v0, v5, Lcom/p1/mobile/putong/data/User;->nameRemark:Ljava/lang/String;

    if-nez v0, :cond_ba

    iput-object v1, v5, Lcom/p1/mobile/putong/data/User;->nameRemark:Ljava/lang/String;

    .line 476
    :cond_ba
    iget-object v0, v5, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    if-nez v0, :cond_bb

    invoke-static {}, Lcom/p1/mobile/putong/data/PicVerification;->new_()Lcom/p1/mobile/putong/data/PicVerification;

    move-result-object v0

    iput-object v0, v5, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    .line 477
    :cond_bb
    iget-object v0, v5, Lcom/p1/mobile/putong/data/User;->privateAnswers:Ljava/util/List;

    if-nez v0, :cond_bc

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, v5, Lcom/p1/mobile/putong/data/User;->privateAnswers:Ljava/util/List;

    .line 478
    :cond_bc
    iget-object v0, v5, Lcom/p1/mobile/putong/data/User;->picksTag:Ljava/lang/String;

    if-nez v0, :cond_bd

    iput-object v1, v5, Lcom/p1/mobile/putong/data/User;->picksTag:Ljava/lang/String;

    .line 479
    :cond_bd
    iget-object v0, v5, Lcom/p1/mobile/putong/data/User;->picksTracker:Ljava/lang/String;

    if-nez v0, :cond_be

    iput-object v1, v5, Lcom/p1/mobile/putong/data/User;->picksTracker:Ljava/lang/String;

    .line 480
    :cond_be
    iget-object v0, v5, Lcom/p1/mobile/putong/data/User;->voice:Lcom/p1/mobile/putong/data/AudioSignature;

    if-nez v0, :cond_bf

    invoke-static {}, Lcom/p1/mobile/putong/data/AudioSignature;->new_()Lcom/p1/mobile/putong/data/AudioSignature;

    move-result-object v0

    iput-object v0, v5, Lcom/p1/mobile/putong/data/User;->voice:Lcom/p1/mobile/putong/data/AudioSignature;

    .line 481
    :cond_bf
    iget-object v0, v5, Lcom/p1/mobile/putong/data/User;->liveState:Lcom/p1/mobile/putong/data/UserLiveState;

    if-nez v0, :cond_c0

    invoke-static {}, Lcom/p1/mobile/putong/data/UserLiveState;->new_()Lcom/p1/mobile/putong/data/UserLiveState;

    move-result-object v0

    iput-object v0, v5, Lcom/p1/mobile/putong/data/User;->liveState:Lcom/p1/mobile/putong/data/UserLiveState;

    .line 482
    :cond_c0
    iget-object v0, v5, Lcom/p1/mobile/putong/data/User;->abroad:Lcom/p1/mobile/putong/data/UserAbroad;

    if-nez v0, :cond_c1

    invoke-static {}, Lcom/p1/mobile/putong/data/UserAbroad;->new_()Lcom/p1/mobile/putong/data/UserAbroad;

    move-result-object v0

    iput-object v0, v5, Lcom/p1/mobile/putong/data/User;->abroad:Lcom/p1/mobile/putong/data/UserAbroad;

    .line 483
    :cond_c1
    iget-object v0, v5, Lcom/p1/mobile/putong/data/User;->medal:Lcom/p1/mobile/putong/data/UserMedalWrapper;

    if-nez v0, :cond_c2

    invoke-static {}, Lcom/p1/mobile/putong/data/UserMedalWrapper;->new_()Lcom/p1/mobile/putong/data/UserMedalWrapper;

    move-result-object v0

    iput-object v0, v5, Lcom/p1/mobile/putong/data/User;->medal:Lcom/p1/mobile/putong/data/UserMedalWrapper;

    .line 484
    :cond_c2
    iget-object v0, v5, Lcom/p1/mobile/putong/data/User;->signupStage:Lcom/p1/mobile/putong/data/SignupStage;

    if-nez v0, :cond_c3

    .line 485
    sget-object v0, Lcom/p1/mobile/putong/data/SignupStage;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/data/SignupStage;

    iput-object v0, v5, Lcom/p1/mobile/putong/data/User;->signupStage:Lcom/p1/mobile/putong/data/SignupStage;

    .line 486
    :cond_c3
    iget-object v0, v5, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    if-nez v0, :cond_c4

    iput-object v1, v5, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    .line 487
    :cond_c4
    iget-object v0, v5, Lcom/p1/mobile/putong/data/User;->soulSettings:Lcom/p1/mobile/putong/data/UserSoulSettings;

    if-nez v0, :cond_c5

    invoke-static {}, Lcom/p1/mobile/putong/data/UserSoulSettings;->new_()Lcom/p1/mobile/putong/data/UserSoulSettings;

    move-result-object v0

    iput-object v0, v5, Lcom/p1/mobile/putong/data/User;->soulSettings:Lcom/p1/mobile/putong/data/UserSoulSettings;

    .line 488
    :cond_c5
    iget-object v0, v5, Lcom/p1/mobile/putong/data/User;->richListTracker:Ljava/lang/String;

    if-nez v0, :cond_c6

    iput-object v1, v5, Lcom/p1/mobile/putong/data/User;->richListTracker:Ljava/lang/String;

    .line 489
    :cond_c6
    iget-object v0, v5, Lcom/p1/mobile/putong/data/User;->localRichListUsers:Lcom/p1/mobile/putong/data/RichListUsers;

    if-nez v0, :cond_c7

    .line 490
    invoke-static {}, Lcom/p1/mobile/putong/data/RichListUsers;->new_()Lcom/p1/mobile/putong/data/RichListUsers;

    move-result-object v0

    iput-object v0, v5, Lcom/p1/mobile/putong/data/User;->localRichListUsers:Lcom/p1/mobile/putong/data/RichListUsers;

    .line 491
    :cond_c7
    iget-object v0, v5, Lcom/p1/mobile/putong/data/User;->richListType:Ljava/lang/String;

    if-nez v0, :cond_c8

    iput-object v1, v5, Lcom/p1/mobile/putong/data/User;->richListType:Ljava/lang/String;

    .line 492
    :cond_c8
    iget-object v0, v5, Lcom/p1/mobile/putong/data/User;->liveRevenueCampaignVip:Lcom/p1/mobile/putong/data/LiveRevenueCampaignVip;

    if-nez v0, :cond_c9

    .line 493
    invoke-static {}, Lcom/p1/mobile/putong/data/LiveRevenueCampaignVip;->new_()Lcom/p1/mobile/putong/data/LiveRevenueCampaignVip;

    move-result-object v0

    iput-object v0, v5, Lcom/p1/mobile/putong/data/User;->liveRevenueCampaignVip:Lcom/p1/mobile/putong/data/LiveRevenueCampaignVip;

    .line 494
    :cond_c9
    iget-object v0, v5, Lcom/p1/mobile/putong/data/User;->aiTag:Ljava/lang/String;

    if-nez v0, :cond_ca

    iput-object v1, v5, Lcom/p1/mobile/putong/data/User;->aiTag:Ljava/lang/String;

    .line 495
    :cond_ca
    iget-object v0, v5, Lcom/p1/mobile/putong/data/User;->ussTracker:Ljava/lang/String;

    if-nez v0, :cond_cb

    iput-object v1, v5, Lcom/p1/mobile/putong/data/User;->ussTracker:Ljava/lang/String;

    .line 496
    :cond_cb
    iget-object v0, v5, Lcom/p1/mobile/putong/data/User;->anchorHierarchy:Lcom/p1/mobile/putong/data/LiveAnchorLevel;

    if-nez v0, :cond_cc

    invoke-static {}, Lcom/p1/mobile/putong/data/LiveAnchorLevel;->new_()Lcom/p1/mobile/putong/data/LiveAnchorLevel;

    move-result-object v0

    iput-object v0, v5, Lcom/p1/mobile/putong/data/User;->anchorHierarchy:Lcom/p1/mobile/putong/data/LiveAnchorLevel;

    .line 497
    :cond_cc
    iget-object v0, v5, Lcom/p1/mobile/putong/data/User;->fanbaseHierarchy:Lcom/p1/mobile/putong/data/LiveFansClubLevel;

    if-nez v0, :cond_cd

    .line 498
    invoke-static {}, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->new_()Lcom/p1/mobile/putong/data/LiveFansClubLevel;

    move-result-object v0

    iput-object v0, v5, Lcom/p1/mobile/putong/data/User;->fanbaseHierarchy:Lcom/p1/mobile/putong/data/LiveFansClubLevel;

    .line 499
    :cond_cd
    iget-object v0, v5, Lcom/p1/mobile/putong/data/User;->avatarFrame:Lcom/p1/mobile/putong/data/AvatarFrame;

    if-nez v0, :cond_ce

    invoke-static {}, Lcom/p1/mobile/putong/data/AvatarFrame;->new_()Lcom/p1/mobile/putong/data/AvatarFrame;

    move-result-object v0

    iput-object v0, v5, Lcom/p1/mobile/putong/data/User;->avatarFrame:Lcom/p1/mobile/putong/data/AvatarFrame;

    .line 500
    :cond_ce
    iget-object v0, v5, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    if-nez v0, :cond_cf

    invoke-static {}, Lcom/p1/mobile/putong/data/LiveUserLevel;->new_()Lcom/p1/mobile/putong/data/LiveUserLevel;

    move-result-object v0

    iput-object v0, v5, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 501
    :cond_cf
    iget-object v0, v5, Lcom/p1/mobile/putong/data/User;->banStatus:Lcom/p1/mobile/putong/data/BanStatus;

    if-nez v0, :cond_d0

    invoke-static {}, Lcom/p1/mobile/putong/data/BanStatus;->new_()Lcom/p1/mobile/putong/data/BanStatus;

    move-result-object v0

    iput-object v0, v5, Lcom/p1/mobile/putong/data/User;->banStatus:Lcom/p1/mobile/putong/data/BanStatus;

    .line 502
    :cond_d0
    iget-object v0, v5, Lcom/p1/mobile/putong/data/User;->finishedStages:Ljava/util/List;

    if-nez v0, :cond_d1

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, v5, Lcom/p1/mobile/putong/data/User;->finishedStages:Ljava/util/List;

    .line 503
    :cond_d1
    iget-object v0, v5, Lcom/p1/mobile/putong/data/User;->activityUser:Lcom/p1/mobile/putong/data/ActivityUser;

    if-nez v0, :cond_d2

    invoke-static {}, Lcom/p1/mobile/putong/data/ActivityUser;->new_()Lcom/p1/mobile/putong/data/ActivityUser;

    move-result-object v0

    iput-object v0, v5, Lcom/p1/mobile/putong/data/User;->activityUser:Lcom/p1/mobile/putong/data/ActivityUser;

    .line 504
    :cond_d2
    iget-object v0, v5, Lcom/p1/mobile/putong/data/User;->regionTag:Ljava/lang/String;

    if-nez v0, :cond_d3

    iput-object v1, v5, Lcom/p1/mobile/putong/data/User;->regionTag:Ljava/lang/String;

    .line 505
    :cond_d3
    iget-object v0, v5, Lcom/p1/mobile/putong/data/User;->localLikeIdentifiers:Ljava/util/List;

    if-nez v0, :cond_d4

    .line 506
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, v5, Lcom/p1/mobile/putong/data/User;->localLikeIdentifiers:Ljava/util/List;

    .line 507
    :cond_d4
    iget-object v0, v5, Lcom/p1/mobile/putong/data/User;->voiceLiveState:Lcom/p1/mobile/putong/data/VoiceLiveState;

    if-nez v0, :cond_d5

    invoke-static {}, Lcom/p1/mobile/putong/data/VoiceLiveState;->new_()Lcom/p1/mobile/putong/data/VoiceLiveState;

    move-result-object v0

    iput-object v0, v5, Lcom/p1/mobile/putong/data/User;->voiceLiveState:Lcom/p1/mobile/putong/data/VoiceLiveState;

    .line 508
    :cond_d5
    iget-object v0, v5, Lcom/p1/mobile/putong/data/User;->localSeeReminderType:Ljava/lang/String;

    if-nez v0, :cond_d6

    iput-object v1, v5, Lcom/p1/mobile/putong/data/User;->localSeeReminderType:Ljava/lang/String;

    :cond_d6
    return-object v5
.end method

.method public bridge synthetic read(Landroid/database/Cursor;I)Ljava/lang/Object;
    .locals 0

    .line 509
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/User$191;->read(Landroid/database/Cursor;I)Lcom/p1/mobile/putong/data/User;

    move-result-object p0

    return-object p0
.end method

.method public write(Lcom/p1/mobile/putong/data/User;Landroid/content/ContentValues;)V
    .locals 3

    const/4 p0, 0x0

    .line 1
    :try_start_0
    const-string v0, "id_c"

    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 2
    const-string v0, "name_c"

    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 3
    const-string v0, "location_distance_c"

    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    iget v1, v1, Lcom/p1/mobile/putong/data/Location;->distance:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 4
    const-string v0, "location_updatedTime_c"

    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    iget-wide v1, v1, Lcom/p1/mobile/putong/data/Location;->updatedTime:D

    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Double;)V

    .line 5
    const-string v0, "location_region_district_c"

    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Region;->district:Ljava/lang/String;

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    const-string v0, "location_region_city_c"

    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 7
    const-string v0, "location_region_country_c"

    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Region;->country:Ljava/lang/String;

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    const-string v0, "location_passby_c"

    .line 9
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Location;->passby:Lcom/p1/mobile/putong/data/Passby;

    if-nez v1, :cond_0

    move-object v1, p0

    goto :goto_0

    .line 10
    :cond_0
    sget-object v2, Lcom/p1/mobile/putong/data/Passby;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 11
    :goto_0
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 12
    const-string v0, "description_c"

    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    const-string v0, "age_c"

    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 14
    const-string v0, "pictures_c"

    .line 15
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    if-nez v1, :cond_1

    move-object v1, p0

    goto :goto_1

    .line 16
    :cond_1
    sget-object v1, Lcom/p1/mobile/putong/data/Media;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 17
    :goto_1
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 18
    const-string v0, "createdTime_c"

    iget-wide v1, p1, Lcom/p1/mobile/putong/data/User;->createdTime:D

    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Double;)V

    .line 19
    const-string v0, "profile_school_c"

    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->school:Ljava/lang/String;

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    const-string v0, "profile_hangouts_c"

    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->hangouts:Ljava/lang/String;

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    const-string v0, "profile_hometown_c"

    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->hometown:Ljava/lang/String;

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    const-string v0, "profile_receivedLikes_c"

    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->receivedLikes:Ljava/lang/Long;

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Long;)V

    .line 23
    const-string v0, "profile_tags_c"

    .line 24
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    if-nez v1, :cond_2

    move-object v1, p0

    goto :goto_2

    .line 25
    :cond_2
    sget-object v1, Lcom/p1/mobile/putong/data/Tag;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 26
    :goto_2
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 27
    const-string v0, "profile_job_c"

    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->job:Ljava/lang/String;

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    const-string v0, "profile_contactLookups_batchSize_c"

    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->contactLookups:Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;

    iget v1, v1, Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;->batchSize:I

    .line 29
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 30
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 31
    const-string v0, "profile_contactLookups_lookups_c"

    .line 32
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->contactLookups:Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;->lookups:Ljava/util/List;

    if-nez v1, :cond_3

    move-object v1, p0

    goto :goto_3

    .line 33
    :cond_3
    sget-object v1, Lcom/p1/mobile/putong/data/Contact;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 34
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->contactLookups:Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;->lookups:Ljava/util/List;

    .line 35
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 36
    :goto_3
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 37
    const-string v0, "profile_contactLookups_next_c"

    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->contactLookups:Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;->next:Ljava/lang/String;

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    const-string v0, "profile_social_c"

    .line 39
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->social:Ljava/util/List;

    if-nez v1, :cond_4

    move-object v1, p0

    goto :goto_4

    .line 40
    :cond_4
    sget-object v1, Lcom/p1/mobile/putong/data/Social;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->social:Ljava/util/List;

    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 41
    :goto_4
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 42
    const-string v0, "profile_answers_c"

    .line 43
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->answers:Ljava/util/List;

    if-nez v1, :cond_5

    move-object v1, p0

    goto :goto_5

    .line 44
    :cond_5
    sget-object v1, Lcom/p1/mobile/putong/data/Answer;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->answers:Ljava/util/List;

    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 45
    :goto_5
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 46
    const-string v0, "str_profile_zodiac_c"

    .line 47
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    if-nez v1, :cond_6

    move-object v1, p0

    goto :goto_6

    :cond_6
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    move-result-object v1

    .line 48
    :goto_6
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    const-string v0, "profile_zodiac_c"

    .line 50
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    if-nez v1, :cond_7

    move-object v1, p0

    goto :goto_7

    :cond_7
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 51
    :goto_7
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 52
    const-string v0, "profile_occupation_c"

    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->occupation:Ljava/lang/String;

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    const-string v0, "status_c"

    .line 54
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    if-nez v1, :cond_8

    move-object v1, p0

    goto :goto_8

    .line 55
    :cond_8
    sget-object v1, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 56
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 57
    invoke-static {v2}, Lcom/p1/mobile/putong/data/UserStatus;->covertToOldEnumList(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 58
    :goto_8
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 59
    const-string v0, "settings_c"

    .line 60
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    if-nez v1, :cond_9

    move-object v1, p0

    goto :goto_9

    .line 61
    :cond_9
    sget-object v2, Lcom/p1/mobile/putong/data/Settings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 62
    :goto_9
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 63
    const-string v0, "str_gender_c"

    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    if-nez v1, :cond_a

    move-object v1, p0

    goto :goto_a

    :cond_a
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_a
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    const-string v0, "gender_c"

    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    if-nez v1, :cond_b

    move-object v1, p0

    goto :goto_b

    :cond_b
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    :goto_b
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 65
    const-string v0, "profile_work_industry_c"

    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Work;->industry:Ljava/lang/String;

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    const-string v0, "profile_work_department_c"

    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Work;->department:Ljava/lang/String;

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    const-string v0, "profile_work_company_c"

    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Work;->company:Ljava/lang/String;

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    const-string v0, "profile_work_active_c"

    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    iget-boolean v1, v1, Lcom/p1/mobile/putong/data/Work;->active:Z

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 69
    const-string v0, "profile_studies_major_c"

    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Studies;->major:Ljava/lang/String;

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    const-string v0, "profile_studies_school_c"

    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Studies;->school:Ljava/lang/String;

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    const-string v0, "profile_studies_active_c"

    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    iget-boolean v1, v1, Lcom/p1/mobile/putong/data/Studies;->active:Z

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 72
    const-string v0, "profile_scenarios_c"

    .line 73
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->scenarios:Ljava/util/List;

    if-nez v1, :cond_c

    move-object v1, p0

    goto :goto_c

    .line 74
    :cond_c
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 75
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->scenarios:Ljava/util/List;

    .line 76
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 77
    :goto_c
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 78
    const-string v0, "profile_receivedLikesRank_c"

    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->receivedLikesRank:Ljava/lang/String;

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    const-string v0, "localRelationship_c"

    .line 80
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    if-nez v1, :cond_d

    move-object v1, p0

    goto :goto_d

    .line 81
    :cond_d
    sget-object v2, Lcom/p1/mobile/putong/data/Relationship;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 82
    :goto_d
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 83
    const-string v0, "str_membership_name_c"

    .line 84
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->membership:Lcom/p1/mobile/putong/data/Membership;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Membership;->name:Lcom/p1/mobile/putong/data/MembershipType;

    if-nez v1, :cond_e

    move-object v1, p0

    goto :goto_e

    :cond_e
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    move-result-object v1

    .line 85
    :goto_e
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    const-string v0, "membership_name_c"

    .line 87
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->membership:Lcom/p1/mobile/putong/data/Membership;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Membership;->name:Lcom/p1/mobile/putong/data/MembershipType;

    if-nez v1, :cond_f

    move-object v1, p0

    goto :goto_f

    :cond_f
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 88
    :goto_f
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 89
    const-string v0, "membership_active_c"

    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->membership:Lcom/p1/mobile/putong/data/Membership;

    iget-boolean v1, v1, Lcom/p1/mobile/putong/data/Membership;->active:Z

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 90
    const-string v0, "membership_expiresTime_c"

    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->membership:Lcom/p1/mobile/putong/data/Membership;

    iget-wide v1, v1, Lcom/p1/mobile/putong/data/Membership;->expiresTime:D

    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Double;)V

    .line 91
    const-string v0, "str_source_c"

    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    if-nez v1, :cond_10

    move-object v1, p0

    goto :goto_10

    :cond_10
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_10
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    const-string v0, "source_c"

    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    if-nez v1, :cond_11

    move-object v1, p0

    goto :goto_11

    :cond_11
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    :goto_11
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 93
    const-string v0, "profile_studies_verified_c"

    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    iget-boolean v1, v1, Lcom/p1/mobile/putong/data/Studies;->verified:Z

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 94
    const-string v0, "profile_studies_grade_c"

    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Studies;->grade:Ljava/lang/String;

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    const-string v0, "profile_tbh_friends_c"

    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->tbh:Lcom/p1/mobile/putong/data/ProfileTbh;

    iget v1, v1, Lcom/p1/mobile/putong/data/ProfileTbh;->friends:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 96
    const-string v0, "profile_tbh_receivedVotes_c"

    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->tbh:Lcom/p1/mobile/putong/data/ProfileTbh;

    iget v1, v1, Lcom/p1/mobile/putong/data/ProfileTbh;->receivedVotes:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 97
    const-string v0, "profile_tbh_receivedVotedPolls_c"

    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->tbh:Lcom/p1/mobile/putong/data/ProfileTbh;

    iget v1, v1, Lcom/p1/mobile/putong/data/ProfileTbh;->receivedVotedPolls:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 98
    const-string v0, "profile_tbh_createdTime_c"

    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->tbh:Lcom/p1/mobile/putong/data/ProfileTbh;

    iget-wide v1, v1, Lcom/p1/mobile/putong/data/ProfileTbh;->createdTime:D

    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Double;)V

    .line 99
    const-string v0, "realName_c"

    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->realName:Ljava/lang/String;

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 100
    const-string v0, "profile_followships_counters_followings_c"

    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->followships:Lcom/p1/mobile/putong/data/FollowshipCounters;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/FollowshipCounters;->counters:Lcom/p1/mobile/putong/data/FollowshipCounter;

    iget v1, v1, Lcom/p1/mobile/putong/data/FollowshipCounter;->followings:I

    .line 101
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 102
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 103
    const-string v0, "profile_followships_counters_followers_c"

    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->followships:Lcom/p1/mobile/putong/data/FollowshipCounters;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/FollowshipCounters;->counters:Lcom/p1/mobile/putong/data/FollowshipCounter;

    iget v1, v1, Lcom/p1/mobile/putong/data/FollowshipCounter;->followers:I

    .line 104
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 105
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 106
    const-string v0, "profile_moments_hidePublicMoments_c"

    .line 107
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->moments:Lcom/p1/mobile/putong/data/Moments;

    iget-boolean v1, v1, Lcom/p1/mobile/putong/data/Moments;->hidePublicMoments:Z

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 108
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 109
    const-string v0, "profile_moments_counters_totalMoments_c"

    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->moments:Lcom/p1/mobile/putong/data/Moments;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Moments;->counters:Lcom/p1/mobile/putong/data/MomentCounter;

    iget v1, v1, Lcom/p1/mobile/putong/data/MomentCounter;->totalMoments:I

    .line 110
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 111
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 112
    const-string v0, "profile_moments_counters_receiveMomentLikes_c"

    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->moments:Lcom/p1/mobile/putong/data/Moments;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Moments;->counters:Lcom/p1/mobile/putong/data/MomentCounter;

    iget v1, v1, Lcom/p1/mobile/putong/data/MomentCounter;->receiveMomentLikes:I

    .line 113
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 114
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 115
    const-string v0, "localFollowship_c"

    .line 116
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    if-nez v1, :cond_12

    move-object v1, p0

    goto :goto_12

    .line 117
    :cond_12
    sget-object v2, Lcom/p1/mobile/putong/data/Followship;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 118
    :goto_12
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 119
    const-string v0, "membership_duration_c"

    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->membership:Lcom/p1/mobile/putong/data/Membership;

    iget-wide v1, v1, Lcom/p1/mobile/putong/data/Membership;->duration:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Long;)V

    .line 120
    const-string v0, "memberships_c"

    .line 121
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->memberships:Ljava/util/List;

    if-nez v1, :cond_13

    move-object v1, p0

    goto :goto_13

    .line 122
    :cond_13
    sget-object v1, Lcom/p1/mobile/putong/data/Membership;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->memberships:Ljava/util/List;

    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 123
    :goto_13
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 124
    const-string v0, "nameRemark_c"

    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->nameRemark:Ljava/lang/String;

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 125
    const-string v0, "state_c"

    .line 126
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    if-nez v1, :cond_14

    move-object v1, p0

    goto :goto_14

    .line 127
    :cond_14
    sget-object v2, Lcom/p1/mobile/putong/data/UserState;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 128
    :goto_14
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 129
    const-string v0, "verifications_picVerificationResult_verified_c"

    .line 130
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/PicVerification;->picVerificationResult:Lcom/p1/mobile/putong/data/PicVerificationResult;

    iget-boolean v1, v1, Lcom/p1/mobile/putong/data/PicVerificationResult;->verified:Z

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 131
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 132
    const-string v0, "abGroups_c"

    .line 133
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->abGroups:Ljava/util/List;

    if-nez v1, :cond_15

    move-object v1, p0

    goto :goto_15

    .line 134
    :cond_15
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->abGroups:Ljava/util/List;

    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 135
    :goto_15
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 136
    const-string v0, "privateAnswers_c"

    .line 137
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->privateAnswers:Ljava/util/List;

    if-nez v1, :cond_16

    move-object v1, p0

    goto :goto_16

    .line 138
    :cond_16
    sget-object v1, Lcom/p1/mobile/putong/data/PrivateAnswer;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 139
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->privateAnswers:Ljava/util/List;

    .line 140
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 141
    :goto_16
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 142
    const-string v0, "peepership_c"

    .line 143
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->peepership:Lcom/p1/mobile/putong/data/Membership;

    if-nez v1, :cond_17

    move-object v1, p0

    goto :goto_17

    .line 144
    :cond_17
    sget-object v2, Lcom/p1/mobile/putong/data/Membership;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 145
    :goto_17
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 146
    const-string v0, "picksExpiredTimestamp_c"

    iget-wide v1, p1, Lcom/p1/mobile/putong/data/User;->picksExpiredTimestamp:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Long;)V

    .line 147
    const-string v0, "picksSwipable_c"

    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/User;->picksSwipable:Z

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 148
    const-string v0, "picksTag_c"

    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->picksTag:Ljava/lang/String;

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 149
    const-string v0, "credit_c"

    .line 150
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->credit:Lcom/p1/mobile/putong/data/UserCreditData;

    if-nez v1, :cond_18

    move-object v1, p0

    goto :goto_18

    .line 151
    :cond_18
    sget-object v2, Lcom/p1/mobile/putong/data/UserCreditData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 152
    :goto_18
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 153
    const-string v0, "goPlaceTimestamp_c"

    iget-wide v1, p1, Lcom/p1/mobile/putong/data/User;->goPlaceTimestamp:D

    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Double;)V

    .line 154
    const-string v0, "isLord_c"

    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/User;->isLord:Z

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 155
    const-string v0, "privateAnswersUpdatedTime_c"

    iget-wide v1, p1, Lcom/p1/mobile/putong/data/User;->privateAnswersUpdatedTime:D

    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Double;)V

    .line 156
    const-string v0, "sendLetter_c"

    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->sendLetter:Ljava/lang/String;

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 157
    const-string v0, "sendLetterTimestamp_c"

    iget-wide v1, p1, Lcom/p1/mobile/putong/data/User;->sendLetterTimestamp:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Long;)V

    .line 158
    const-string v0, "receivedLetter_c"

    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->receivedLetter:Ljava/lang/String;

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 159
    const-string v0, "receivedLetterTimestamp_c"

    iget-wide v1, p1, Lcom/p1/mobile/putong/data/User;->receivedLetterTimestamp:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Long;)V

    .line 160
    const-string v0, "popLevel_c"

    iget v1, p1, Lcom/p1/mobile/putong/data/User;->popLevel:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 161
    const-string v0, "voice_c"

    .line 162
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->voice:Lcom/p1/mobile/putong/data/AudioSignature;

    if-nez v1, :cond_19

    move-object v1, p0

    goto :goto_19

    .line 163
    :cond_19
    sget-object v2, Lcom/p1/mobile/putong/data/AudioSignature;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 164
    :goto_19
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 165
    const-string v0, "datingMode_c"

    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/User;->datingMode:Z

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 166
    const-string v0, "ussTags_c"

    .line 167
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->ussTags:Lcom/p1/mobile/putong/data/UssTags;

    if-nez v1, :cond_1a

    move-object v1, p0

    goto :goto_1a

    .line 168
    :cond_1a
    sget-object v2, Lcom/p1/mobile/putong/data/UssTags;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 169
    :goto_1a
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 170
    const-string v0, "str_membership_vipBadgeType_c"

    .line 171
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->membership:Lcom/p1/mobile/putong/data/Membership;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Membership;->vipBadgeType:Lcom/p1/mobile/putong/data/VIPBadgeType;

    if-nez v1, :cond_1b

    move-object v1, p0

    goto :goto_1b

    .line 172
    :cond_1b
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    move-result-object v1

    .line 173
    :goto_1b
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 174
    const-string v0, "membership_vipBadgeType_c"

    .line 175
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->membership:Lcom/p1/mobile/putong/data/Membership;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Membership;->vipBadgeType:Lcom/p1/mobile/putong/data/VIPBadgeType;

    if-nez v1, :cond_1c

    move-object v1, p0

    goto :goto_1c

    .line 176
    :cond_1c
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 177
    :goto_1c
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 178
    const-string v0, "abroad_c"

    .line 179
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->abroad:Lcom/p1/mobile/putong/data/UserAbroad;

    if-nez v1, :cond_1d

    move-object v1, p0

    goto :goto_1d

    .line 180
    :cond_1d
    sget-object v2, Lcom/p1/mobile/putong/data/UserAbroad;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 181
    :goto_1d
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 182
    const-string v0, "fakeStatus_c"

    .line 183
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->fakeStatus:Lcom/p1/mobile/putong/data/StatusesItem;

    if-nez v1, :cond_1e

    move-object v1, p0

    goto :goto_1e

    .line 184
    :cond_1e
    sget-object v2, Lcom/p1/mobile/putong/data/StatusesItem;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 185
    :goto_1e
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 186
    const-string v0, "nameStatus_c"

    .line 187
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->nameStatus:Lcom/p1/mobile/putong/data/StatusesItem;

    if-nez v1, :cond_1f

    move-object v1, p0

    goto :goto_1f

    .line 188
    :cond_1f
    sget-object v2, Lcom/p1/mobile/putong/data/StatusesItem;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 189
    :goto_1f
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 190
    const-string v0, "displayAudit_c"

    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/User;->displayAudit:Z

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 191
    const-string v0, "visitPlace_c"

    .line 192
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->visitPlace:Lcom/p1/mobile/putong/data/VisitPlace;

    if-nez v1, :cond_20

    move-object v1, p0

    goto :goto_20

    .line 193
    :cond_20
    sget-object v2, Lcom/p1/mobile/putong/data/VisitPlace;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 194
    :goto_20
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 195
    const-string v0, "publicId_c"

    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 196
    const-string v0, "soulSettings_c"

    .line 197
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->soulSettings:Lcom/p1/mobile/putong/data/UserSoulSettings;

    if-nez v1, :cond_21

    move-object v1, p0

    goto :goto_21

    .line 198
    :cond_21
    sget-object v2, Lcom/p1/mobile/putong/data/UserSoulSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 199
    :goto_21
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 200
    const-string v0, "richListPosition_c"

    iget v1, p1, Lcom/p1/mobile/putong/data/User;->richListPosition:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 201
    const-string v0, "richListTracker_c"

    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->richListTracker:Ljava/lang/String;

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 202
    const-string v0, "diamondVIPExpiresTime_c"

    iget-wide v1, p1, Lcom/p1/mobile/putong/data/User;->diamondVIPExpiresTime:D

    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Double;)V

    .line 203
    const-string v0, "aiTag_c"

    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->aiTag:Ljava/lang/String;

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 204
    const-string v0, "friendCommentInfo_c"

    .line 205
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->friendCommentInfo:Lcom/p1/mobile/putong/data/FriendCommentInfo;

    if-nez v1, :cond_22

    move-object v1, p0

    goto :goto_22

    .line 206
    :cond_22
    sget-object v2, Lcom/p1/mobile/putong/data/FriendCommentInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 207
    :goto_22
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 208
    const-string v0, "minRichListPosition_c"

    iget v1, p1, Lcom/p1/mobile/putong/data/User;->minRichListPosition:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 209
    const-string v0, "membership_hideVIP_c"

    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->membership:Lcom/p1/mobile/putong/data/Membership;

    iget-boolean v1, v1, Lcom/p1/mobile/putong/data/Membership;->hideVIP:Z

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 210
    const-string v0, "ussTracker_c"

    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->ussTracker:Ljava/lang/String;

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 211
    const-string v0, "profile_mood_c"

    .line 212
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->mood:Lcom/p1/mobile/putong/data/UserProfileMood;

    if-nez v1, :cond_23

    move-object v1, p0

    goto :goto_23

    .line 213
    :cond_23
    sget-object v2, Lcom/p1/mobile/putong/data/UserProfileMood;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 214
    :goto_23
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 215
    const-string v0, "verifications_idCard_verified_c"

    .line 216
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/PicVerification;->idCard:Lcom/p1/mobile/putong/data/IdVerificationResult;

    iget-boolean v1, v1, Lcom/p1/mobile/putong/data/IdVerificationResult;->verified:Z

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 217
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 218
    const-string v0, "membership_hideActivityTime_c"

    .line 219
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->membership:Lcom/p1/mobile/putong/data/Membership;

    iget-boolean v1, v1, Lcom/p1/mobile/putong/data/Membership;->hideActivityTime:Z

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 220
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 221
    const-string v0, "str_profile_studies_qualification_c"

    .line 222
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Studies;->qualification:Lcom/p1/mobile/putong/data/QualificationType;

    if-nez v1, :cond_24

    move-object v1, p0

    goto :goto_24

    .line 223
    :cond_24
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    move-result-object v1

    .line 224
    :goto_24
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 225
    const-string v0, "profile_studies_qualification_c"

    .line 226
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Studies;->qualification:Lcom/p1/mobile/putong/data/QualificationType;

    if-nez v1, :cond_25

    move-object v1, p0

    goto :goto_25

    .line 227
    :cond_25
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 228
    :goto_25
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 229
    const-string v0, "location_invisibleFields_c"

    .line 230
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Location;->invisibleFields:Ljava/util/List;

    if-nez v1, :cond_26

    move-object v1, p0

    goto :goto_26

    .line 231
    :cond_26
    sget-object v1, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 232
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Location;->invisibleFields:Ljava/util/List;

    .line 233
    invoke-static {v2}, Lcom/p1/mobile/putong/data/LocationInvisibleField;->covertToOldEnumList(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    .line 234
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 235
    :goto_26
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 236
    const-string v0, "profile_extensions_physical_bloodType_c"

    .line 237
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Physical;->bloodType:Ljava/util/List;

    if-nez v1, :cond_27

    move-object v1, p0

    goto :goto_27

    .line 238
    :cond_27
    sget-object v1, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 239
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Physical;->bloodType:Ljava/util/List;

    .line 240
    invoke-static {v2}, Lcom/p1/mobile/putong/data/BloodType;->covertToOldEnumList(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    .line 241
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 242
    :goto_27
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 243
    const-string v0, "profile_extensions_business_cardType_c"

    .line 244
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->business:Lcom/p1/mobile/putong/data/Business;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Business;->cardType:Ljava/util/List;

    if-nez v1, :cond_28

    move-object v1, p0

    goto :goto_28

    .line 245
    :cond_28
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 246
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->business:Lcom/p1/mobile/putong/data/Business;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Business;->cardType:Ljava/util/List;

    .line 247
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 248
    :goto_28
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 249
    const-string v0, "profile_moodMoment_c"

    .line 250
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->moodMoment:Lcom/p1/mobile/putong/data/MoodMoment;

    if-nez v1, :cond_29

    move-object v1, p0

    goto :goto_29

    .line 251
    :cond_29
    sget-object v2, Lcom/p1/mobile/putong/data/MoodMoment;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 252
    :goto_29
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 253
    const-string v0, "profile_bizAnswers_c"

    .line 254
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->bizAnswers:Lcom/p1/mobile/putong/data/BizAnswers;

    if-nez v1, :cond_2a

    move-object v1, p0

    goto :goto_2a

    .line 255
    :cond_2a
    sget-object v2, Lcom/p1/mobile/putong/data/BizAnswers;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 256
    :goto_2a
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 257
    const-string v0, "profile_extensions_interest_emoji_c"

    .line 258
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Interest;->emoji:Ljava/util/List;

    if-nez v1, :cond_2b

    move-object v1, p0

    goto :goto_2b

    .line 259
    :cond_2b
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 260
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Interest;->emoji:Ljava/util/List;

    .line 261
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 262
    :goto_2b
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 263
    const-string v0, "verifications_age_verified_c"

    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/PicVerification;->age:Lcom/p1/mobile/putong/data/VerificationResult;

    iget-boolean v1, v1, Lcom/p1/mobile/putong/data/VerificationResult;->verified:Z

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 264
    const-string v0, "profile_extensions_basic_aboutMe_c"

    .line 265
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->aboutMe:Ljava/util/List;

    if-nez v1, :cond_2c

    move-object v1, p0

    goto :goto_2c

    .line 266
    :cond_2c
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 267
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->aboutMe:Ljava/util/List;

    .line 268
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 269
    :goto_2c
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 270
    const-string v0, "verifications_anchor_verified_c"

    .line 271
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/PicVerification;->anchor:Lcom/p1/mobile/putong/data/VerificationResult;

    iget-boolean v1, v1, Lcom/p1/mobile/putong/data/VerificationResult;->verified:Z

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 272
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 273
    const-string v0, "profile_extensions_basic_tickle_c"

    .line 274
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->tickle:Ljava/util/List;

    if-nez v1, :cond_2d

    move-object v1, p0

    goto :goto_2d

    .line 275
    :cond_2d
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 276
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->tickle:Ljava/util/List;

    .line 277
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 278
    :goto_2d
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 279
    const-string v0, "localLatestReceivedMessageTime_c"

    iget-wide v1, p1, Lcom/p1/mobile/putong/data/User;->localLatestReceivedMessageTime:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Long;)V

    .line 280
    const-string v0, "verifications_others_otherDVIPSchool_verified_c"

    .line 281
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/PicVerification;->others:Lcom/p1/mobile/putong/data/OtherVerificationWrapper;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/OtherVerificationWrapper;->otherDVIPSchool:Lcom/p1/mobile/putong/data/VerificationResult;

    iget-boolean v1, v1, Lcom/p1/mobile/putong/data/VerificationResult;->verified:Z

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 282
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 283
    const-string v0, "verifications_others_otherDVIPCompany_verified_c"

    .line 284
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/PicVerification;->others:Lcom/p1/mobile/putong/data/OtherVerificationWrapper;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/OtherVerificationWrapper;->otherDVIPCompany:Lcom/p1/mobile/putong/data/VerificationResult;

    iget-boolean v1, v1, Lcom/p1/mobile/putong/data/VerificationResult;->verified:Z

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 285
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 286
    const-string v0, "verifications_others_otherDVIPJob_verified_c"

    .line 287
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/PicVerification;->others:Lcom/p1/mobile/putong/data/OtherVerificationWrapper;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/OtherVerificationWrapper;->otherDVIPJob:Lcom/p1/mobile/putong/data/VerificationResult;

    iget-boolean v1, v1, Lcom/p1/mobile/putong/data/VerificationResult;->verified:Z

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 288
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 289
    const-string v0, "verifications_others_otherDVIPSalary_verified_c"

    .line 290
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/PicVerification;->others:Lcom/p1/mobile/putong/data/OtherVerificationWrapper;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/OtherVerificationWrapper;->otherDVIPSalary:Lcom/p1/mobile/putong/data/VerificationResult;

    iget-boolean v1, v1, Lcom/p1/mobile/putong/data/VerificationResult;->verified:Z

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 291
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 292
    const-string v0, "verifications_others_otherDVIPMembership_verified_c"

    .line 293
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/PicVerification;->others:Lcom/p1/mobile/putong/data/OtherVerificationWrapper;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/OtherVerificationWrapper;->otherDVIPMembership:Lcom/p1/mobile/putong/data/VerificationResult;

    iget-boolean v1, v1, Lcom/p1/mobile/putong/data/VerificationResult;->verified:Z

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 294
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 295
    const-string v0, "hierarchy_c"

    .line 296
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    if-nez v1, :cond_2e

    move-object v1, p0

    goto :goto_2e

    .line 297
    :cond_2e
    sget-object v2, Lcom/p1/mobile/putong/data/LiveUserLevel;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 298
    :goto_2e
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 299
    const-string v0, "profile_extensions_basic_hobby_c"

    .line 300
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->hobby:Ljava/util/List;

    if-nez v1, :cond_2f

    move-object v1, p0

    goto :goto_2f

    .line 301
    :cond_2f
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 302
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->hobby:Ljava/util/List;

    .line 303
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 304
    :goto_2f
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 305
    const-string v0, "profile_extensions_basic_recent_c"

    .line 306
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->recent:Ljava/util/List;

    if-nez v1, :cond_30

    move-object v1, p0

    goto :goto_30

    .line 307
    :cond_30
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 308
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->recent:Ljava/util/List;

    .line 309
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 310
    :goto_30
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 311
    const-string v0, "profile_extensions_basic_together_c"

    .line 312
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->together:Ljava/util/List;

    if-nez v1, :cond_31

    move-object v1, p0

    goto :goto_31

    .line 313
    :cond_31
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 314
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->together:Ljava/util/List;

    .line 315
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 316
    :goto_31
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 317
    const-string v0, "profile_extensions_anonymity_id_c"

    .line 318
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->anonymity:Lcom/p1/mobile/putong/data/Anonymity;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Anonymity;->id:Ljava/util/List;

    if-nez v1, :cond_32

    move-object v1, p0

    goto :goto_32

    .line 319
    :cond_32
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 320
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->anonymity:Lcom/p1/mobile/putong/data/Anonymity;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Anonymity;->id:Ljava/util/List;

    .line 321
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 322
    :goto_32
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 323
    const-string v0, "profile_extensions_anonymity_identifier_c"

    .line 324
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->anonymity:Lcom/p1/mobile/putong/data/Anonymity;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Anonymity;->identifier:Ljava/util/List;

    if-nez v1, :cond_33

    move-object v1, p0

    goto :goto_33

    .line 325
    :cond_33
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 326
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->anonymity:Lcom/p1/mobile/putong/data/Anonymity;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Anonymity;->identifier:Ljava/util/List;

    .line 327
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 328
    :goto_33
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 329
    const-string v0, "localSoulShip_c"

    .line 330
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->localSoulShip:Lcom/p1/mobile/putong/data/SoulShip;

    if-nez v1, :cond_34

    move-object v1, p0

    goto :goto_34

    .line 331
    :cond_34
    sget-object v2, Lcom/p1/mobile/putong/data/SoulShip;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 332
    :goto_34
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 333
    const-string v0, "signupTime_c"

    iget-wide v1, p1, Lcom/p1/mobile/putong/data/User;->signupTime:D

    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Double;)V

    .line 334
    const-string v0, "profile_extensions_headFrame_url_c"

    .line 335
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->headFrame:Lcom/p1/mobile/putong/data/HeadFrame;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/HeadFrame;->url:Ljava/util/List;

    if-nez v1, :cond_35

    move-object v1, p0

    goto :goto_35

    .line 336
    :cond_35
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 337
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->headFrame:Lcom/p1/mobile/putong/data/HeadFrame;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/HeadFrame;->url:Ljava/util/List;

    .line 338
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 339
    :goto_35
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 340
    const-string v0, "profile_extensions_headFrame_expiredTime_c"

    .line 341
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->headFrame:Lcom/p1/mobile/putong/data/HeadFrame;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/HeadFrame;->expiredTime:Ljava/util/List;

    if-nez v1, :cond_36

    move-object v1, p0

    goto :goto_36

    .line 342
    :cond_36
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->DOUBLE_BOXED_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 343
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->headFrame:Lcom/p1/mobile/putong/data/HeadFrame;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/HeadFrame;->expiredTime:Ljava/util/List;

    .line 344
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 345
    :goto_36
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 346
    const-string v0, "banStatus_c"

    .line 347
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->banStatus:Lcom/p1/mobile/putong/data/BanStatus;

    if-nez v1, :cond_37

    move-object v1, p0

    goto :goto_37

    .line 348
    :cond_37
    sget-object v2, Lcom/p1/mobile/putong/data/BanStatus;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 349
    :goto_37
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 350
    const-string v0, "profile_onlyShowAboutMeInside_c"

    .line 351
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-boolean v1, v1, Lcom/p1/mobile/putong/data/Profile;->onlyShowAboutMeInside:Z

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 352
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 353
    const-string v0, "profile_extensions_basic_friendPurpose_c"

    .line 354
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->friendPurpose:Ljava/util/List;

    if-nez v1, :cond_38

    move-object v1, p0

    goto :goto_38

    .line 355
    :cond_38
    sget-object v1, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 356
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->friendPurpose:Ljava/util/List;

    .line 357
    invoke-static {v2}, Lcom/p1/mobile/putong/data/Purpose;->covertToOldEnumList(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    .line 358
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 359
    :goto_38
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 360
    const-string v0, "profile_extensions_friendStatus_labelType_c"

    .line 361
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->friendStatus:Lcom/p1/mobile/putong/data/FriendStatus;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/FriendStatus;->labelType:Ljava/util/List;

    if-nez v1, :cond_39

    move-object v1, p0

    goto :goto_39

    .line 362
    :cond_39
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 363
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->friendStatus:Lcom/p1/mobile/putong/data/FriendStatus;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/FriendStatus;->labelType:Ljava/util/List;

    .line 364
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 365
    :goto_39
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 366
    const-string v0, "profile_extensions_friendStatus_labelName_c"

    .line 367
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->friendStatus:Lcom/p1/mobile/putong/data/FriendStatus;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/FriendStatus;->labelName:Ljava/util/List;

    if-nez v1, :cond_3a

    move-object v1, p0

    goto :goto_3a

    .line 368
    :cond_3a
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 369
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->friendStatus:Lcom/p1/mobile/putong/data/FriendStatus;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/FriendStatus;->labelName:Ljava/util/List;

    .line 370
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 371
    :goto_3a
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 372
    const-string v0, "profile_extensions_friendStatus_endTime_c"

    .line 373
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->friendStatus:Lcom/p1/mobile/putong/data/FriendStatus;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/FriendStatus;->endTime:Ljava/util/List;

    if-nez v1, :cond_3b

    move-object v1, p0

    goto :goto_3b

    .line 374
    :cond_3b
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 375
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->friendStatus:Lcom/p1/mobile/putong/data/FriendStatus;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/FriendStatus;->endTime:Ljava/util/List;

    .line 376
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 377
    :goto_3b
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 378
    const-string v0, "profile_extensions_friendStatus_status_c"

    .line 379
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->friendStatus:Lcom/p1/mobile/putong/data/FriendStatus;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/FriendStatus;->status:Ljava/util/List;

    if-nez v1, :cond_3c

    move-object v1, p0

    goto :goto_3c

    .line 380
    :cond_3c
    sget-object v1, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 381
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->friendStatus:Lcom/p1/mobile/putong/data/FriendStatus;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/FriendStatus;->status:Ljava/util/List;

    .line 382
    invoke-static {v2}, Lcom/p1/mobile/putong/data/FriendState;->covertToOldEnumList(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    .line 383
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 384
    :goto_3c
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 385
    const-string v0, "localDiamondPrivateMatchTags_c"

    .line 386
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->localDiamondPrivateMatchTags:Ljava/util/List;

    if-nez v1, :cond_3d

    move-object v1, p0

    goto :goto_3d

    .line 387
    :cond_3d
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 388
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->localDiamondPrivateMatchTags:Ljava/util/List;

    .line 389
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 390
    :goto_3d
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 391
    const-string v0, "profile_extensions_basic_interest_c"

    .line 392
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->interest:Ljava/util/List;

    if-nez v1, :cond_3e

    move-object v1, p0

    goto :goto_3e

    .line 393
    :cond_3e
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 394
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->interest:Ljava/util/List;

    .line 395
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 396
    :goto_3e
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 397
    const-string v0, "anonymousLike_c"

    .line 398
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->anonymousLike:Lcom/p1/mobile/putong/data/AnonymousLikeInfo;

    if-nez v1, :cond_3f

    move-object v1, p0

    goto :goto_3f

    .line 399
    :cond_3f
    sget-object v2, Lcom/p1/mobile/putong/data/AnonymousLikeInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 400
    :goto_3f
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 401
    const-string v0, "inactivated_c"

    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/User;->inactivated:Z

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 402
    const-string v0, "profile_extensions_basic_country_c"

    .line 403
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->country:Ljava/util/List;

    if-nez v1, :cond_40

    move-object v1, p0

    goto :goto_40

    .line 404
    :cond_40
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 405
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->country:Ljava/util/List;

    .line 406
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 407
    :goto_40
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 408
    const-string v0, "profile_extensions_basic_province_c"

    .line 409
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->province:Ljava/util/List;

    if-nez v1, :cond_41

    move-object v1, p0

    goto :goto_41

    .line 410
    :cond_41
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 411
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->province:Ljava/util/List;

    .line 412
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 413
    :goto_41
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 414
    const-string v0, "profile_extensions_basic_city_c"

    .line 415
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->city:Ljava/util/List;

    if-nez v1, :cond_42

    move-object v1, p0

    goto :goto_42

    .line 416
    :cond_42
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 417
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->city:Ljava/util/List;

    .line 418
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 419
    :goto_42
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 420
    const-string v0, "str_status_c"

    .line 421
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    if-nez v1, :cond_43

    move-object v1, p0

    goto :goto_43

    .line 422
    :cond_43
    sget-object v1, Lcom/p1/mobile/putong/data/UserStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 423
    :goto_43
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 424
    const-string v0, "str_location_invisibleFields_c"

    .line 425
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Location;->invisibleFields:Ljava/util/List;

    if-nez v1, :cond_44

    move-object v1, p0

    goto :goto_44

    .line 426
    :cond_44
    sget-object v1, Lcom/p1/mobile/putong/data/LocationInvisibleField;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 427
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Location;->invisibleFields:Ljava/util/List;

    .line 428
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 429
    :goto_44
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 430
    const-string v0, "str_profile_extensions_physical_bloodType_c"

    .line 431
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Physical;->bloodType:Ljava/util/List;

    if-nez v1, :cond_45

    move-object v1, p0

    goto :goto_45

    .line 432
    :cond_45
    sget-object v1, Lcom/p1/mobile/putong/data/BloodType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 433
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Physical;->bloodType:Ljava/util/List;

    .line 434
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 435
    :goto_45
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 436
    const-string v0, "str_profile_extensions_basic_friendPurpose_c"

    .line 437
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->friendPurpose:Ljava/util/List;

    if-nez v1, :cond_46

    move-object v1, p0

    goto :goto_46

    .line 438
    :cond_46
    sget-object v1, Lcom/p1/mobile/putong/data/Purpose;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 439
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->friendPurpose:Ljava/util/List;

    .line 440
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 441
    :goto_46
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 442
    const-string v0, "str_profile_extensions_friendStatus_status_c"

    .line 443
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->friendStatus:Lcom/p1/mobile/putong/data/FriendStatus;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/FriendStatus;->status:Ljava/util/List;

    if-nez v1, :cond_47

    move-object v1, p0

    goto :goto_47

    .line 444
    :cond_47
    sget-object v1, Lcom/p1/mobile/putong/data/FriendState;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 445
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->friendStatus:Lcom/p1/mobile/putong/data/FriendStatus;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/FriendStatus;->status:Ljava/util/List;

    .line 446
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 447
    :goto_47
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 448
    const-string v0, "profile_extensions_momentSwitch_noSyncMoment_c"

    .line 449
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->momentSwitch:Lcom/p1/mobile/putong/data/MomentSwitch;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/MomentSwitch;->noSyncMoment:Ljava/util/List;

    if-nez v1, :cond_48

    move-object v1, p0

    goto :goto_48

    .line 450
    :cond_48
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 451
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->momentSwitch:Lcom/p1/mobile/putong/data/MomentSwitch;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/MomentSwitch;->noSyncMoment:Ljava/util/List;

    .line 452
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 453
    :goto_48
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 454
    const-string v0, "profile_extensions_wealth_c"

    .line 455
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    if-nez v1, :cond_49

    move-object v1, p0

    goto :goto_49

    .line 456
    :cond_49
    sget-object v2, Lcom/p1/mobile/putong/data/UserWealth;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 457
    :goto_49
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 458
    const-string v0, "profile_extensions_basic_qualification_c"

    .line 459
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->qualification:Ljava/util/List;

    if-nez v1, :cond_4a

    move-object v1, p0

    goto :goto_4a

    .line 460
    :cond_4a
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 461
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->qualification:Ljava/util/List;

    .line 462
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 463
    :goto_4a
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 464
    const-string v0, "profile_extensions_physical_height_c"

    .line 465
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Physical;->height:Ljava/util/List;

    if-nez v1, :cond_4b

    move-object v1, p0

    goto :goto_4b

    .line 466
    :cond_4b
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 467
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Physical;->height:Ljava/util/List;

    .line 468
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 469
    :goto_4b
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 470
    const-string v0, "profile_extensions_profileCompletion_c"

    .line 471
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->profileCompletion:Lcom/p1/mobile/putong/data/ProfileCompletion;

    if-nez v1, :cond_4c

    move-object v1, p0

    goto :goto_4c

    .line 472
    :cond_4c
    sget-object v2, Lcom/p1/mobile/putong/data/ProfileCompletion;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 473
    :goto_4c
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 474
    const-string v0, "profile_extensions_voiceSignature_c"

    .line 475
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->voiceSignature:Lcom/p1/mobile/putong/data/VoiceSignature;

    if-nez v1, :cond_4d

    move-object v1, p0

    goto :goto_4d

    .line 476
    :cond_4d
    sget-object v2, Lcom/p1/mobile/putong/data/VoiceSignature;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 477
    :goto_4d
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 478
    const-string v0, "activityUser_action_c"

    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->activityUser:Lcom/p1/mobile/putong/data/ActivityUser;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/ActivityUser;->action:Ljava/lang/String;

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 479
    const-string v0, "activityUser_score_c"

    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->activityUser:Lcom/p1/mobile/putong/data/ActivityUser;

    iget-wide v1, v1, Lcom/p1/mobile/putong/data/ActivityUser;->score:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Long;)V

    .line 480
    const-string v0, "matePlanUser_c"

    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/User;->matePlanUser:Z

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 481
    const-string v0, "matePlanAdUser_c"

    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/User;->matePlanAdUser:Z

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 482
    const-string v0, "regionTag_c"

    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->regionTag:Ljava/lang/String;

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 483
    const-string v0, "localLikeIdentifiers_c"

    .line 484
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->localLikeIdentifiers:Ljava/util/List;

    if-nez v1, :cond_4e

    move-object v1, p0

    goto :goto_4e

    .line 485
    :cond_4e
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 486
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->localLikeIdentifiers:Ljava/util/List;

    .line 487
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 488
    :goto_4e
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 489
    const-string v0, "deleted_c"

    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/User;->deleted:Z

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 490
    const-string v0, "profile_extensions_interest_tags_c"

    .line 491
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Interest;->tags:Ljava/util/List;

    if-nez v1, :cond_4f

    move-object v1, p0

    goto :goto_4f

    .line 492
    :cond_4f
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 493
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Interest;->tags:Ljava/util/List;

    .line 494
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 495
    :goto_4f
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 496
    const-string v0, "profile_extensions_live_voiceImgId_c"

    .line 497
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->live:Lcom/p1/mobile/putong/data/VirtualVoiceLive;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/VirtualVoiceLive;->voiceImgId:Ljava/util/List;

    if-nez v1, :cond_50

    move-object v1, p0

    goto :goto_50

    .line 498
    :cond_50
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 499
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->live:Lcom/p1/mobile/putong/data/VirtualVoiceLive;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/VirtualVoiceLive;->voiceImgId:Ljava/util/List;

    .line 500
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 501
    :goto_50
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 502
    const-string v0, "profile_extensions_live_voiceImgUrl_c"

    .line 503
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->live:Lcom/p1/mobile/putong/data/VirtualVoiceLive;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/VirtualVoiceLive;->voiceImgUrl:Ljava/util/List;

    if-nez v1, :cond_51

    move-object v1, p0

    goto :goto_51

    .line 504
    :cond_51
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 505
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->live:Lcom/p1/mobile/putong/data/VirtualVoiceLive;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/VirtualVoiceLive;->voiceImgUrl:Ljava/util/List;

    .line 506
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 507
    :goto_51
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 508
    const-string v0, "profile_extensions_mate_c"

    .line 509
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->mate:Lcom/p1/mobile/putong/data/ProfileMate;

    if-nez v1, :cond_52

    move-object v1, p0

    goto :goto_52

    .line 510
    :cond_52
    sget-object v2, Lcom/p1/mobile/putong/data/ProfileMate;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 511
    :goto_52
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 512
    const-string v0, "profile_extensions_pet_c"

    .line 513
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->pet:Lcom/p1/mobile/putong/data/PetInfo;

    if-nez v1, :cond_53

    move-object v1, p0

    goto :goto_53

    .line 514
    :cond_53
    sget-object v2, Lcom/p1/mobile/putong/data/PetInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 515
    :goto_53
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 516
    const-string v0, "profile_extensions_tailFrame_url_c"

    .line 517
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->tailFrame:Lcom/p1/mobile/putong/data/TailFrame;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/TailFrame;->url:Ljava/util/List;

    if-nez v1, :cond_54

    move-object v1, p0

    goto :goto_54

    .line 518
    :cond_54
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 519
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->tailFrame:Lcom/p1/mobile/putong/data/TailFrame;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/TailFrame;->url:Ljava/util/List;

    .line 520
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 521
    :goto_54
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 522
    const-string v0, "profile_extensions_tailFrame_expiredTime_c"

    .line 523
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->tailFrame:Lcom/p1/mobile/putong/data/TailFrame;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/TailFrame;->expiredTime:Ljava/util/List;

    if-nez v1, :cond_55

    move-object v1, p0

    goto :goto_55

    .line 524
    :cond_55
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->DOUBLE_BOXED_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 525
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->tailFrame:Lcom/p1/mobile/putong/data/TailFrame;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/TailFrame;->expiredTime:Ljava/util/List;

    .line 526
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 527
    :goto_55
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 528
    const-string v0, "profile_extensions_business_avatarID_c"

    .line 529
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->business:Lcom/p1/mobile/putong/data/Business;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Business;->avatarID:Ljava/util/List;

    if-nez v1, :cond_56

    move-object v1, p0

    goto :goto_56

    .line 530
    :cond_56
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 531
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->business:Lcom/p1/mobile/putong/data/Business;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Business;->avatarID:Ljava/util/List;

    .line 532
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 533
    :goto_56
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 534
    const-string v0, "profile_extensions_business_avatarExpireTime_c"

    .line 535
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->business:Lcom/p1/mobile/putong/data/Business;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Business;->avatarExpireTime:Ljava/util/List;

    if-nez v1, :cond_57

    move-object v1, p0

    goto :goto_57

    .line 536
    :cond_57
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->LONG_BOXED_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 537
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->business:Lcom/p1/mobile/putong/data/Business;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Business;->avatarExpireTime:Ljava/util/List;

    .line 538
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 539
    :goto_57
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 540
    const-string v0, "profile_extensions_business_avatarClose_c"

    .line 541
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->business:Lcom/p1/mobile/putong/data/Business;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Business;->avatarClose:Ljava/util/List;

    if-nez v1, :cond_58

    move-object v1, p0

    goto :goto_58

    .line 542
    :cond_58
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 543
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->business:Lcom/p1/mobile/putong/data/Business;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Business;->avatarClose:Ljava/util/List;

    .line 544
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 545
    :goto_58
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 546
    const-string v0, "specialEffect_c"

    .line 547
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->specialEffect:Lcom/p1/mobile/putong/data/SpecialEffect;

    if-nez v1, :cond_59

    move-object v1, p0

    goto :goto_59

    .line 548
    :cond_59
    sget-object v2, Lcom/p1/mobile/putong/data/SpecialEffect;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 549
    :goto_59
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 550
    const-string v0, "profile_extensions_basic_ethnicity_c"

    .line 551
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->ethnicity:Ljava/util/List;

    if-nez v1, :cond_5a

    move-object v1, p0

    goto :goto_5a

    .line 552
    :cond_5a
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 553
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->ethnicity:Ljava/util/List;

    .line 554
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 555
    :goto_5a
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 556
    const-string v0, "profile_extensions_basic_language_c"

    .line 557
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->language:Ljava/util/List;

    if-nez v1, :cond_5b

    move-object v1, p0

    goto :goto_5b

    .line 558
    :cond_5b
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 559
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->language:Ljava/util/List;

    .line 560
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 561
    :goto_5b
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 562
    const-string v0, "profile_extensions_voiceAvatarFrame_c"

    .line 563
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->voiceAvatarFrame:Lcom/p1/mobile/putong/data/VoiceAvatarFrame;

    if-nez v1, :cond_5c

    move-object v1, p0

    goto :goto_5c

    .line 564
    :cond_5c
    sget-object v2, Lcom/p1/mobile/putong/data/VoiceAvatarFrame;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 565
    :goto_5c
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 566
    const-string v0, "profile_extensions_physical_heightImg_c"

    .line 567
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Physical;->heightImg:Ljava/util/List;

    if-nez v1, :cond_5d

    move-object v1, p0

    goto :goto_5d

    .line 568
    :cond_5d
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 569
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Physical;->heightImg:Ljava/util/List;

    .line 570
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 571
    :goto_5d
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 572
    const-string v0, "profile_extensions_marriage_c"

    .line 573
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    if-nez v1, :cond_5e

    move-object v1, p0

    goto :goto_5e

    .line 574
    :cond_5e
    sget-object v2, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 575
    :goto_5e
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 576
    const-string v0, "profile_extensions_basic_address_c"

    .line 577
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->address:Ljava/util/List;

    if-nez v1, :cond_5f

    move-object v1, p0

    goto :goto_5f

    .line 578
    :cond_5f
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 579
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->address:Ljava/util/List;

    .line 580
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 581
    :goto_5f
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 582
    const-string v0, "profile_extensions_basic_familyBackground_c"

    .line 583
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->familyBackground:Ljava/util/List;

    if-nez v1, :cond_60

    move-object v1, p0

    goto :goto_60

    .line 584
    :cond_60
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 585
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->familyBackground:Ljava/util/List;

    .line 586
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 587
    :goto_60
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 588
    const-string v0, "profile_extensions_physical_weight_c"

    .line 589
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Physical;->weight:Ljava/util/List;

    if-nez v1, :cond_61

    move-object v1, p0

    goto :goto_61

    .line 590
    :cond_61
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 591
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Physical;->weight:Ljava/util/List;

    .line 592
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 593
    :goto_61
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 594
    const-string v0, "verifications_others_otherCTDID_verified_c"

    .line 595
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/PicVerification;->others:Lcom/p1/mobile/putong/data/OtherVerificationWrapper;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/OtherVerificationWrapper;->otherCTDID:Lcom/p1/mobile/putong/data/VerificationResult;

    iget-boolean v1, v1, Lcom/p1/mobile/putong/data/VerificationResult;->verified:Z

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 596
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 597
    const-string v0, "profile_extensions_game_c"

    .line 598
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    if-nez v1, :cond_62

    move-object v1, p0

    goto :goto_62

    .line 599
    :cond_62
    sget-object v2, Lcom/p1/mobile/putong/data/ExtensionGame;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 600
    :goto_62
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 601
    const-string v0, "profile_extensions_basic_facialFeature_c"

    .line 602
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->facialFeature:Ljava/util/List;

    if-nez v1, :cond_63

    move-object v1, p0

    goto :goto_63

    .line 603
    :cond_63
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 604
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->facialFeature:Ljava/util/List;

    .line 605
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 606
    :goto_63
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 607
    const-string v0, "verifications_idCard_age_c"

    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/PicVerification;->idCard:Lcom/p1/mobile/putong/data/IdVerificationResult;

    iget v1, v1, Lcom/p1/mobile/putong/data/IdVerificationResult;->age:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 608
    const-string v0, "verifications_idCard_first4_c"

    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/PicVerification;->idCard:Lcom/p1/mobile/putong/data/IdVerificationResult;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/IdVerificationResult;->first4:Ljava/lang/String;

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 609
    const-string v0, "profile_extensions_physical_fitness_c"

    .line 610
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Physical;->fitness:Ljava/util/List;

    if-nez v1, :cond_64

    move-object v1, p0

    goto :goto_64

    .line 611
    :cond_64
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 612
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Physical;->fitness:Ljava/util/List;

    .line 613
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 614
    :goto_64
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 615
    const-string v0, "profile_extensions_physical_drink_c"

    .line 616
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Physical;->drink:Ljava/util/List;

    if-nez v1, :cond_65

    move-object v1, p0

    goto :goto_65

    .line 617
    :cond_65
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 618
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Physical;->drink:Ljava/util/List;

    .line 619
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 620
    :goto_65
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 621
    const-string v0, "profile_extensions_physical_smoke_c"

    .line 622
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Physical;->smoke:Ljava/util/List;

    if-nez v1, :cond_66

    move-object v1, p0

    goto :goto_66

    .line 623
    :cond_66
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 624
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Physical;->smoke:Ljava/util/List;

    .line 625
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 626
    :goto_66
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 627
    const-string v0, "profile_extensions_basic_mbti_c"

    .line 628
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->mbti:Ljava/util/List;

    if-nez v1, :cond_67

    move-object v1, p0

    goto :goto_67

    .line 629
    :cond_67
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 630
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->mbti:Ljava/util/List;

    .line 631
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 632
    :goto_67
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 633
    const-string v0, "userActivityInfo_c"

    .line 634
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->userActivityInfo:Lcom/p1/mobile/putong/data/UserActivityInfo;

    if-nez v1, :cond_68

    move-object v1, p0

    goto :goto_68

    .line 635
    :cond_68
    sget-object v2, Lcom/p1/mobile/putong/data/UserActivityInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 636
    :goto_68
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 637
    const-string v0, "profile_extensions_basic_ideal_c"

    .line 638
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->ideal:Ljava/util/List;

    if-nez v1, :cond_69

    move-object v1, p0

    goto :goto_69

    .line 639
    :cond_69
    sget-object v1, Lcom/p1/mobile/putong/data/IdealTag;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 640
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->ideal:Ljava/util/List;

    .line 641
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 642
    :goto_69
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 643
    const-string v0, "profile_extensions_basic_unideal_c"

    .line 644
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->unideal:Ljava/util/List;

    if-nez v1, :cond_6a

    move-object v1, p0

    goto :goto_6a

    .line 645
    :cond_6a
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 646
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->unideal:Ljava/util/List;

    .line 647
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 648
    :goto_6a
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 649
    const-string v0, "profile_moments_counters_totalNormalMoments_c"

    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->moments:Lcom/p1/mobile/putong/data/Moments;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Moments;->counters:Lcom/p1/mobile/putong/data/MomentCounter;

    iget v1, v1, Lcom/p1/mobile/putong/data/MomentCounter;->totalNormalMoments:I

    .line 650
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 651
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 652
    const-string v0, "profile_extensions_interest_taste_c"

    .line 653
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Interest;->taste:Ljava/util/List;

    if-nez v1, :cond_6b

    move-object v1, p0

    goto :goto_6b

    .line 654
    :cond_6b
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 655
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Interest;->taste:Ljava/util/List;

    .line 656
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 657
    :goto_6b
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 658
    const-string v0, "location_region_province_c"

    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Region;->province:Ljava/lang/String;

    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 659
    const-string v0, "profile_extensions_basic_intlFriendPurpose_c"

    .line 660
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->intlFriendPurpose:Ljava/util/List;

    if-nez v1, :cond_6c

    move-object v1, p0

    goto :goto_6c

    .line 661
    :cond_6c
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 662
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->intlFriendPurpose:Ljava/util/List;

    .line 663
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object v1

    .line 664
    :goto_6c
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 665
    const-string v0, "profile_extensions_basic_intlFriendPurposeV2_c"

    .line 666
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->intlFriendPurposeV2:Ljava/util/List;

    if-nez v1, :cond_6d

    move-object p1, p0

    goto :goto_6d

    .line 667
    :cond_6d
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 668
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v1

    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    iget-object p1, p1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->intlFriendPurposeV2:Ljava/util/List;

    .line 669
    invoke-virtual {v1, p1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    move-result-object p1

    .line 670
    :goto_6d
    invoke-static {p2, v0, p1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 671
    invoke-static {p1, p0}, Lcom/google/protobuf/nano/MessageNano;->reportError(Ljava/lang/Exception;Landroid/database/Cursor;)V

    return-void
.end method

.method public bridge synthetic write(Ljava/lang/Object;Landroid/content/ContentValues;)V
    .locals 0

    .line 672
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/User$191;->write(Lcom/p1/mobile/putong/data/User;Landroid/content/ContentValues;)V

    return-void
.end method
