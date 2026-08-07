.class public Ll/gbk0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowcaseItem;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowcaseItem;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Lcom/p1/mobile/putong/live/base/data/BLiveFakeUserProfile;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fakeUserProfiles:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0

    .line 13
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fakeUserProfiles:Ljava/util/List;

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveFakeUserProfile;

    .line 23
    .line 24
    return-object p0
.end method

.method public static synthetic c(Ll/gbk0;Ljava/lang/String;ZLcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ll/vak0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/gbk0;->m(Ljava/lang/String;ZLcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ll/vak0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic d(Ll/gbk0;Ljava/lang/String;ZLcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ll/vak0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/gbk0;->n(Ljava/lang/String;ZLcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ll/vak0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileBanners;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;ZLjava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileBanners;->users:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {p1, p2, p3}, Ll/w6o0;->j(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;ZLjava/lang/String;)Ll/nsv;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic f(Ll/gbk0;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ll/vak0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/gbk0;->l(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ll/vak0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;Ljava/util/ArrayList;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftShowcaseItems:Ljava/util/List;

    .line 4
    .line 5
    new-instance v0, Ll/ebk0;

    .line 6
    .line 7
    invoke-direct {v0, p2}, Ll/ebk0;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowcaseItem;

    .line 15
    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;ZLcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileBanners;)V
    .locals 2

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileBanners;->userIds:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/dbk0;

    .line 4
    .line 5
    invoke-direct {v1, p2, p0, p1}, Ll/dbk0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileBanners;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;Z)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final i(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;Ljava/lang/String;)Ll/vak0;
    .locals 7
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-static {p1, p2}, Ll/f3t;->g(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    return-object v0

    .line 9
    :cond_0
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->followships:Ljava/util/List;

    .line 12
    .line 13
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    const/4 v2, 0x0

    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    invoke-static {}, Lcom/p1/mobile/putong/data/Followship;->new_()Lcom/p1/mobile/putong/data/Followship;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    goto :goto_0

    .line 25
    :cond_1
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 26
    .line 27
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->followships:Ljava/util/List;

    .line 28
    .line 29
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    check-cast v1, Lcom/p1/mobile/putong/data/Followship;

    .line 34
    .line 35
    :goto_0
    iput-object v1, p0, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 36
    .line 37
    sget-object v1, Ll/htd0;->b:Ll/htd0;

    .line 38
    .line 39
    invoke-static {v1}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    check-cast v1, Ll/jfv;

    .line 44
    .line 45
    invoke-virtual {v1, p0}, Ll/jfv;->a(Lcom/p1/mobile/putong/data/User;)V

    .line 46
    .line 47
    .line 48
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 49
    .line 50
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userProfileConfig:Ljava/util/List;

    .line 51
    .line 52
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    if-eqz v1, :cond_2

    .line 57
    .line 58
    return-object v0

    .line 59
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 60
    .line 61
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->userProfileConfig:Ljava/util/List;

    .line 62
    .line 63
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    move-object v3, v0

    .line 68
    check-cast v3, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;

    .line 69
    .line 70
    invoke-static {p1, p2}, Ll/f3t;->f(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;Ljava/lang/String;)Ll/nsv;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    sget-object p2, Ll/htd0;->c:Ll/htd0;

    .line 75
    .line 76
    invoke-static {p2}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    check-cast v0, Ll/hiv;

    .line 81
    .line 82
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 83
    .line 84
    iget-wide v4, v1, Lcom/p1/mobile/putong/data/LiveUserLevel;->grade:J

    .line 85
    .line 86
    invoke-virtual {v0, v4, v5}, Ll/hiv;->v(J)Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 87
    .line 88
    .line 89
    move-result-object v4

    .line 90
    invoke-static {p2}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object p2

    .line 94
    check-cast p2, Ll/hiv;

    .line 95
    .line 96
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->anchorHierarchy:Lcom/p1/mobile/putong/data/LiveAnchorLevel;

    .line 97
    .line 98
    iget-wide v0, v0, Lcom/p1/mobile/putong/data/LiveAnchorLevel;->grade:J

    .line 99
    .line 100
    invoke-virtual {p2, v0, v1}, Ll/hiv;->f(J)Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLevel;

    .line 101
    .line 102
    .line 103
    move-result-object v5

    .line 104
    new-instance v1, Ll/vak0;

    .line 105
    .line 106
    iget-object v6, p0, Lcom/p1/mobile/putong/data/User;->fanbaseHierarchy:Lcom/p1/mobile/putong/data/LiveFansClubLevel;

    .line 107
    .line 108
    invoke-direct/range {v1 .. v6}, Ll/vak0;-><init>(Ll/nsv;Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLevel;Lcom/p1/mobile/putong/data/LiveFansClubLevel;)V

    .line 109
    .line 110
    .line 111
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 112
    .line 113
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->weekCpInfo:Lcom/p1/mobile/putong/live/base/data/BLiveWeekCpInfo;

    .line 114
    .line 115
    invoke-virtual {v1, p0}, Ll/vak0;->G(Lcom/p1/mobile/putong/live/base/data/BLiveWeekCpInfo;)V

    .line 116
    .line 117
    .line 118
    iget-object p0, v3, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->familyCard:Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;

    .line 119
    .line 120
    invoke-virtual {v1, p0}, Ll/vak0;->z(Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;)V

    .line 121
    .line 122
    .line 123
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 124
    .line 125
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->guard:Lcom/p1/mobile/putong/live/base/data/BLiveBoardGuard;

    .line 126
    .line 127
    invoke-virtual {v1, p0}, Ll/vak0;->x(Lcom/p1/mobile/putong/live/base/data/BLiveBoardGuard;)V

    .line 128
    .line 129
    .line 130
    return-object v1
.end method

.method public final j(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;Ljava/lang/String;Z)Ll/vak0;
    .locals 18
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    move/from16 v1, p3

    .line 4
    .line 5
    invoke-static/range {p1 .. p2}, Ll/f3t;->g(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    const/4 v3, 0x0

    .line 10
    if-nez v2, :cond_0

    .line 11
    .line 12
    return-object v3

    .line 13
    :cond_0
    iget-object v4, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 14
    .line 15
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveData;->followships:Ljava/util/List;

    .line 16
    .line 17
    invoke-static {v4}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    const/4 v5, 0x0

    .line 22
    if-eqz v4, :cond_1

    .line 23
    .line 24
    invoke-static {}, Lcom/p1/mobile/putong/data/Followship;->new_()Lcom/p1/mobile/putong/data/Followship;

    .line 25
    .line 26
    .line 27
    move-result-object v4

    .line 28
    goto :goto_0

    .line 29
    :cond_1
    iget-object v4, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 30
    .line 31
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveData;->followships:Ljava/util/List;

    .line 32
    .line 33
    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v4

    .line 37
    check-cast v4, Lcom/p1/mobile/putong/data/Followship;

    .line 38
    .line 39
    :goto_0
    iput-object v4, v2, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 40
    .line 41
    iget-object v4, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 42
    .line 43
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveData;->relationships:Ljava/util/List;

    .line 44
    .line 45
    invoke-static {v4}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    if-eqz v4, :cond_2

    .line 50
    .line 51
    invoke-static {}, Lcom/p1/mobile/putong/data/Relationship;->new_()Lcom/p1/mobile/putong/data/Relationship;

    .line 52
    .line 53
    .line 54
    move-result-object v4

    .line 55
    goto :goto_1

    .line 56
    :cond_2
    iget-object v4, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 57
    .line 58
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveData;->relationships:Ljava/util/List;

    .line 59
    .line 60
    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v4

    .line 64
    check-cast v4, Lcom/p1/mobile/putong/data/Relationship;

    .line 65
    .line 66
    :goto_1
    iput-object v4, v2, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 67
    .line 68
    sget-object v4, Ll/htd0;->b:Ll/htd0;

    .line 69
    .line 70
    invoke-static {v4}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v4

    .line 74
    check-cast v4, Ll/jfv;

    .line 75
    .line 76
    invoke-virtual {v4, v2}, Ll/jfv;->a(Lcom/p1/mobile/putong/data/User;)V

    .line 77
    .line 78
    .line 79
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 80
    .line 81
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceUserProfileConfigs:Ljava/util/List;

    .line 82
    .line 83
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    if-eqz v2, :cond_3

    .line 88
    .line 89
    return-object v3

    .line 90
    :cond_3
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 91
    .line 92
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceUserProfileConfigs:Ljava/util/List;

    .line 93
    .line 94
    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    move-object v8, v2

    .line 99
    check-cast v8, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    .line 100
    .line 101
    move-object/from16 v2, p2

    .line 102
    .line 103
    invoke-static {v0, v1, v2}, Ll/w6o0;->i(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;ZLjava/lang/String;)Ll/nsv;

    .line 104
    .line 105
    .line 106
    move-result-object v7

    .line 107
    iget-object v2, v8, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->hierarchy:Ljava/util/List;

    .line 108
    .line 109
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 110
    .line 111
    .line 112
    move-result v2

    .line 113
    if-nez v2, :cond_8

    .line 114
    .line 115
    iget-object v2, v8, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->hierarchy:Ljava/util/List;

    .line 116
    .line 117
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 118
    .line 119
    .line 120
    move-result-object v2

    .line 121
    move-object v4, v3

    .line 122
    move-object v6, v4

    .line 123
    move-object v9, v6

    .line 124
    move-object v10, v9

    .line 125
    :cond_4
    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 126
    .line 127
    .line 128
    move-result v11

    .line 129
    if-eqz v11, :cond_7

    .line 130
    .line 131
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    move-result-object v11

    .line 135
    check-cast v11, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;

    .line 136
    .line 137
    const-string v12, "user"

    .line 138
    .line 139
    iget-object v13, v11, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;->type:Ljava/lang/String;

    .line 140
    .line 141
    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 142
    .line 143
    .line 144
    move-result v12

    .line 145
    if-eqz v12, :cond_5

    .line 146
    .line 147
    sget-object v3, Ll/htd0;->c:Ll/htd0;

    .line 148
    .line 149
    invoke-static {v3}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 150
    .line 151
    .line 152
    move-result-object v3

    .line 153
    check-cast v3, Ll/hiv;

    .line 154
    .line 155
    iget-wide v12, v11, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;->grade:J

    .line 156
    .line 157
    invoke-virtual {v3, v12, v13}, Ll/hiv;->v(J)Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 158
    .line 159
    .line 160
    move-result-object v3

    .line 161
    move-object v6, v11

    .line 162
    goto :goto_2

    .line 163
    :cond_5
    const-string v12, "anchor"

    .line 164
    .line 165
    iget-object v13, v11, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;->type:Ljava/lang/String;

    .line 166
    .line 167
    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 168
    .line 169
    .line 170
    move-result v12

    .line 171
    if-eqz v12, :cond_6

    .line 172
    .line 173
    sget-object v4, Ll/htd0;->c:Ll/htd0;

    .line 174
    .line 175
    invoke-static {v4}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 176
    .line 177
    .line 178
    move-result-object v4

    .line 179
    check-cast v4, Ll/hiv;

    .line 180
    .line 181
    iget-wide v12, v11, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;->grade:J

    .line 182
    .line 183
    invoke-virtual {v4, v12, v13}, Ll/hiv;->f(J)Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLevel;

    .line 184
    .line 185
    .line 186
    move-result-object v4

    .line 187
    move-object v9, v11

    .line 188
    goto :goto_2

    .line 189
    :cond_6
    const-string v12, "starlight"

    .line 190
    .line 191
    iget-object v13, v11, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;->type:Ljava/lang/String;

    .line 192
    .line 193
    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 194
    .line 195
    .line 196
    move-result v12

    .line 197
    if-eqz v12, :cond_4

    .line 198
    .line 199
    move-object v10, v11

    .line 200
    goto :goto_2

    .line 201
    :cond_7
    move-object v14, v6

    .line 202
    move-object v15, v9

    .line 203
    move-object/from16 v17, v10

    .line 204
    .line 205
    move-object v9, v3

    .line 206
    move-object v10, v4

    .line 207
    goto :goto_3

    .line 208
    :cond_8
    move-object v9, v3

    .line 209
    move-object v10, v9

    .line 210
    move-object v14, v10

    .line 211
    move-object v15, v14

    .line 212
    move-object/from16 v17, v15

    .line 213
    .line 214
    :goto_3
    iget-object v2, v8, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->banners:Ljava/util/List;

    .line 215
    .line 216
    new-instance v3, Ll/abk0;

    .line 217
    .line 218
    invoke-direct {v3, v0, v1}, Ll/abk0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;Z)V

    .line 219
    .line 220
    .line 221
    invoke-static {v2, v3}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 222
    .line 223
    .line 224
    new-instance v6, Ll/vak0;

    .line 225
    .line 226
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 227
    .line 228
    iget-object v11, v1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftShowcaseItems:Ljava/util/List;

    .line 229
    .line 230
    iget-object v12, v1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->users:Ljava/util/List;

    .line 231
    .line 232
    iget-object v13, v1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceCallInvites:Ljava/util/List;

    .line 233
    .line 234
    iget-object v1, v8, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->banners:Ljava/util/List;

    .line 235
    .line 236
    move-object/from16 v16, v1

    .line 237
    .line 238
    invoke-direct/range {v6 .. v17}, Ll/vak0;-><init>(Ll/nsv;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLevel;Ljava/util/List;Ljava/util/List;Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;)V

    .line 239
    .line 240
    .line 241
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 242
    .line 243
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceHouseRankUpgradeInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHouseRankUpgradeInfo;

    .line 244
    .line 245
    invoke-virtual {v6, v1}, Ll/vak0;->y(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHouseRankUpgradeInfo;)V

    .line 246
    .line 247
    .line 248
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 249
    .line 250
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceFollowships:Ljava/util/List;

    .line 251
    .line 252
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 253
    .line 254
    .line 255
    move-result v1

    .line 256
    if-nez v1, :cond_9

    .line 257
    .line 258
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 259
    .line 260
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceFollowships:Ljava/util/List;

    .line 261
    .line 262
    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 263
    .line 264
    .line 265
    move-result-object v1

    .line 266
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFollowship;

    .line 267
    .line 268
    invoke-virtual {v6, v1}, Ll/vak0;->E(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFollowship;)Ll/vak0;

    .line 269
    .line 270
    .line 271
    :cond_9
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 272
    .line 273
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceGiftWallBriefInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBrief;

    .line 274
    .line 275
    invoke-virtual {v6, v1}, Ll/vak0;->F(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBrief;)V

    .line 276
    .line 277
    .line 278
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 279
    .line 280
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceFanbase:Lcom/p1/mobile/putong/live/base/data/BLiveFansMemberNum;

    .line 281
    .line 282
    invoke-virtual {v6, v1}, Ll/vak0;->D(Lcom/p1/mobile/putong/live/base/data/BLiveFansMemberNum;)V

    .line 283
    .line 284
    .line 285
    iget-object v1, v8, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->giftShowCaseItemIds:Ljava/util/List;

    .line 286
    .line 287
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 288
    .line 289
    .line 290
    move-result v1

    .line 291
    if-nez v1, :cond_a

    .line 292
    .line 293
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 294
    .line 295
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftShowcaseItems:Ljava/util/List;

    .line 296
    .line 297
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 298
    .line 299
    .line 300
    move-result v1

    .line 301
    if-nez v1, :cond_a

    .line 302
    .line 303
    new-instance v1, Ljava/util/ArrayList;

    .line 304
    .line 305
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 306
    .line 307
    .line 308
    iget-object v2, v8, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->giftShowCaseItemIds:Ljava/util/List;

    .line 309
    .line 310
    new-instance v3, Ll/bbk0;

    .line 311
    .line 312
    invoke-direct {v3, v0, v1}, Ll/bbk0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;Ljava/util/ArrayList;)V

    .line 313
    .line 314
    .line 315
    invoke-static {v2, v3}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 316
    .line 317
    .line 318
    invoke-virtual {v6, v1}, Ll/vak0;->A(Ljava/util/List;)V

    .line 319
    .line 320
    .line 321
    :cond_a
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 322
    .line 323
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->intlMedalWall:Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallInUserCard;

    .line 324
    .line 325
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallInUserCard;->title:Ljava/lang/String;

    .line 326
    .line 327
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 328
    .line 329
    .line 330
    move-result v1

    .line 331
    if-nez v1, :cond_b

    .line 332
    .line 333
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 334
    .line 335
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->intlMedalWall:Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallInUserCard;

    .line 336
    .line 337
    invoke-virtual {v6, v1}, Ll/vak0;->C(Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallInUserCard;)V

    .line 338
    .line 339
    .line 340
    :cond_b
    iget-object v1, v8, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->familyCard:Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;

    .line 341
    .line 342
    invoke-virtual {v6, v1}, Ll/vak0;->z(Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;)V

    .line 343
    .line 344
    .line 345
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 346
    .line 347
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->guard:Lcom/p1/mobile/putong/live/base/data/BLiveBoardGuard;

    .line 348
    .line 349
    invoke-virtual {v6, v1}, Ll/vak0;->x(Lcom/p1/mobile/putong/live/base/data/BLiveBoardGuard;)V

    .line 350
    .line 351
    .line 352
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 353
    .line 354
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->giftWallV3Briefs:Ljava/util/List;

    .line 355
    .line 356
    invoke-virtual {v6, v0}, Ll/vak0;->B(Ljava/util/List;)V

    .line 357
    .line 358
    .line 359
    return-object v6
.end method

.method public k(Ljava/lang/String;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveFakeUserProfile;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->g7(Ljava/lang/String;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance p1, Ll/fbk0;

    .line 6
    .line 7
    invoke-direct {p1}, Ll/fbk0;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public final synthetic l(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ll/vak0;
    .locals 0

    .line 1
    invoke-virtual {p0, p2, p1}, Ll/gbk0;->i(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;Ljava/lang/String;)Ll/vak0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic m(Ljava/lang/String;ZLcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ll/vak0;
    .locals 0

    .line 1
    invoke-virtual {p0, p3, p1, p2}, Ll/gbk0;->j(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;Ljava/lang/String;Z)Ll/vak0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic n(Ljava/lang/String;ZLcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ll/vak0;
    .locals 0

    .line 1
    invoke-virtual {p0, p3, p1, p2}, Ll/gbk0;->j(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;Ljava/lang/String;Z)Ll/vak0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public o(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)Lrx/c;
    .locals 0
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p9    # Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;",
            ")",
            "Lrx/c<",
            "Ll/vak0;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static/range {p1 .. p9}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->u7(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    new-instance p3, Ll/yak0;

    .line 6
    .line 7
    invoke-direct {p3, p0, p1}, Ll/yak0;-><init>(Ll/gbk0;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p2, p3}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public p(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lrx/c;
    .locals 8
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z)",
            "Lrx/c<",
            "Ll/vak0;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v7, ""

    .line 2
    .line 3
    move-object v0, p1

    .line 4
    move-object v1, p2

    .line 5
    move-object v2, p3

    .line 6
    move-object v3, p4

    .line 7
    move-object v4, p5

    .line 8
    move-object v5, p6

    .line 9
    move-object v6, p7

    .line 10
    invoke-static/range {v0 .. v7}, Ll/itv;->P(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    new-instance p3, Ll/zak0;

    .line 15
    .line 16
    move/from16 p4, p8

    .line 17
    .line 18
    invoke-direct {p3, p0, p1, p4}, Ll/zak0;-><init>(Ll/gbk0;Ljava/lang/String;Z)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p2, p3}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public q(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Lrx/c;
    .locals 8
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/vak0;",
            ">;"
        }
    .end annotation

    .line 1
    move-object v0, p1

    .line 2
    move-object v1, p2

    .line 3
    move-object v2, p3

    .line 4
    move-object v3, p4

    .line 5
    move-object v4, p5

    .line 6
    move-object v5, p6

    .line 7
    move-object v6, p7

    .line 8
    move-object/from16 v7, p9

    .line 9
    .line 10
    invoke-static/range {v0 .. v7}, Ll/itv;->P(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    new-instance p3, Ll/cbk0;

    .line 15
    .line 16
    move/from16 p4, p8

    .line 17
    .line 18
    invoke-direct {p3, p0, p1, p4}, Ll/cbk0;-><init>(Ll/gbk0;Ljava/lang/String;Z)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p2, p3}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method
