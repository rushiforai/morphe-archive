.class public Ll/dug;
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

.method public static a(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ZZ)V
    .locals 0

    .line 1
    instance-of p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVideoView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string p0, "video"

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const-string p0, "photo"

    .line 9
    .line 10
    :goto_0
    invoke-static {p0, p1, p2, p3, p4}, Ll/dug;->b(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ZZ)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static b(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ZZ)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, v0}, Ll/er60;->B(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/User;)[Ll/pf60;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    const-string v0, "p_user_moment_interactions_details_view"

    .line 7
    .line 8
    if-eqz p4, :cond_0

    .line 9
    .line 10
    move-object p3, v0

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-static {p2, p3}, Ll/ksg;->K(Ljava/lang/String;Z)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p3

    .line 16
    :goto_0
    invoke-static {p1}, Ll/ksg;->Z(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 17
    .line 18
    .line 19
    move-result p4

    .line 20
    if-eqz p4, :cond_1

    .line 21
    .line 22
    new-instance p4, Ll/pf60;

    .line 23
    .line 24
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->thirdShareSource:Lcom/p1/mobile/putong/feed/data/ThirdShareSource;

    .line 25
    .line 26
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/ThirdShareSource;->sourceId:Ljava/lang/String;

    .line 27
    .line 28
    const-string v1, "forwarding_video_id"

    .line 29
    .line 30
    invoke-direct {p4, v1, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    invoke-static {p4, p0}, Ll/ksg;->J(Ll/pf60;[Ll/pf60;)[Ll/pf60;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    :cond_1
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    const-string p4, "e_moment_preview"

    .line 42
    .line 43
    if-nez p1, :cond_2

    .line 44
    .line 45
    invoke-static {p2, p0}, Ll/ksg;->i(Ljava/lang/String;[Ll/pf60;)[Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-static {p4, p3, p0}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_2
    invoke-static {p4, v0, p0}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public static c(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->multiCallInfo:Lcom/p1/mobile/putong/feed/data/LiveMultiCallInfo;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/LiveMultiCallInfo;->role:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->multiCallInfo:Lcom/p1/mobile/putong/feed/data/LiveMultiCallInfo;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/LiveMultiCallInfo;->role:Ljava/lang/String;

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const-string p0, ""

    .line 19
    .line 20
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->M()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-interface {v0, p0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Dr(Ljava/lang/String;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public static d(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/data/LiveExtraInFeed;->getFromLive(Lcom/p1/mobile/putong/data/Live;)Lcom/p1/mobile/putong/feed/data/LiveExtraInFeed;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/LiveExtraInFeed;->isMultiCallType()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const-string p0, "video_living"

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    return-object p1
.end method

.method public static e(Z)V
    .locals 2

    .line 1
    new-instance v0, Ll/pf60;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string p0, "video_off"

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const-string p0, "video_living"

    .line 9
    .line 10
    :goto_0
    const-string v1, "module"

    .line 11
    .line 12
    invoke-direct {v0, v1, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    filled-new-array {v0}, [Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const-string v0, "e_video_room_meet"

    .line 20
    .line 21
    const-string v1, "p_nearby"

    .line 22
    .line 23
    invoke-static {v0, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static f(Z)V
    .locals 2

    .line 1
    new-instance v0, Ll/pf60;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string p0, "video_off"

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const-string p0, "video_living"

    .line 9
    .line 10
    :goto_0
    const-string v1, "module"

    .line 11
    .line 12
    invoke-direct {v0, v1, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    filled-new-array {v0}, [Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const-string v0, "e_video_room_meet"

    .line 20
    .line 21
    const-string v1, "p_nearby"

    .line 22
    .line 23
    invoke-static {v0, v1, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static g(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ZLcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static h(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;IZLl/n570;)V
    .locals 1

    .line 1
    const-string p0, "from_discover_dating"

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const-string v0, "page"

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    add-int/lit8 p3, p3, 0x1

    .line 12
    .line 13
    const-string p0, "p_discover_dating"

    .line 14
    .line 15
    invoke-static {p2, p3, v0, p0, p5}, Ll/dug;->j(Lcom/p1/mobile/putong/feed/data/Moment;ILjava/lang/String;Ljava/lang/String;Ll/n570;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    const-string p0, "from_discover_discussion"

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_1

    .line 26
    .line 27
    add-int/lit8 p3, p3, 0x1

    .line 28
    .line 29
    const-string p0, "p_discover_discussion"

    .line 30
    .line 31
    invoke-static {p2, p3, v0, p0, p5}, Ll/dug;->j(Lcom/p1/mobile/putong/feed/data/Moment;ILjava/lang/String;Ljava/lang/String;Ll/n570;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_1
    const-string p0, "from_nearby_focus"

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-eqz p0, :cond_2

    .line 42
    .line 43
    add-int/lit8 p3, p3, 0x1

    .line 44
    .line 45
    const-string p0, "p_follow"

    .line 46
    .line 47
    invoke-static {p2, p3, v0, p0, p5}, Ll/dug;->j(Lcom/p1/mobile/putong/feed/data/Moment;ILjava/lang/String;Ljava/lang/String;Ll/n570;)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_2
    const-string p0, "from_nearby_falls_feed"

    .line 52
    .line 53
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    if-eqz p0, :cond_3

    .line 58
    .line 59
    add-int/lit8 p3, p3, 0x1

    .line 60
    .line 61
    const-string p0, "p_nearby"

    .line 62
    .line 63
    invoke-static {p2, p3, v0, p0, p5}, Ll/dug;->j(Lcom/p1/mobile/putong/feed/data/Moment;ILjava/lang/String;Ljava/lang/String;Ll/n570;)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_3
    if-eqz p4, :cond_4

    .line 68
    .line 69
    add-int/lit8 p3, p3, 0x1

    .line 70
    .line 71
    const-string p0, "p_album"

    .line 72
    .line 73
    invoke-static {p2, p3, v0, p0, p5}, Ll/dug;->j(Lcom/p1/mobile/putong/feed/data/Moment;ILjava/lang/String;Ljava/lang/String;Ll/n570;)V

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :cond_4
    const-string p0, "from_activity_tab_one"

    .line 78
    .line 79
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result p4

    .line 83
    if-eqz p4, :cond_5

    .line 84
    .line 85
    add-int/lit8 p3, p3, 0x1

    .line 86
    .line 87
    invoke-static {p0}, Ll/pu20;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-static {p2, p3, v0, p0, p5}, Ll/dug;->j(Lcom/p1/mobile/putong/feed/data/Moment;ILjava/lang/String;Ljava/lang/String;Ll/n570;)V

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :cond_5
    const-string p0, "from_activity_tab_two"

    .line 96
    .line 97
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    if-eqz p1, :cond_6

    .line 102
    .line 103
    add-int/lit8 p3, p3, 0x1

    .line 104
    .line 105
    invoke-static {p0}, Ll/pu20;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-static {p2, p3, v0, p0, p5}, Ll/dug;->j(Lcom/p1/mobile/putong/feed/data/Moment;ILjava/lang/String;Ljava/lang/String;Ll/n570;)V

    .line 110
    .line 111
    .line 112
    :cond_6
    return-void
.end method

.method public static i(Lcom/p1/mobile/putong/feed/data/Moment;IZ)V
    .locals 3

    .line 1
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "liveId"

    .line 7
    .line 8
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 9
    .line 10
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Live;->id:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 13
    .line 14
    .line 15
    const-string v1, "anchorId"

    .line 16
    .line 17
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 18
    .line 19
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Live;->anchor:Lcom/p1/mobile/putong/data/Owner;

    .line 20
    .line 21
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 24
    .line 25
    .line 26
    const-string v1, "module"

    .line 27
    .line 28
    if-eqz p2, :cond_0

    .line 29
    .line 30
    const-string p2, "video_off"

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const-string p2, "video_living"

    .line 34
    .line 35
    :goto_0
    invoke-virtual {v0, v1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 36
    .line 37
    .line 38
    const-string p2, "index"

    .line 39
    .line 40
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {v0, p2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 45
    .line 46
    .line 47
    const-string p1, "right_recommend_type"

    .line 48
    .line 49
    const-string p2, ""

    .line 50
    .line 51
    invoke-virtual {v0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 52
    .line 53
    .line 54
    const-string p1, "live_status"

    .line 55
    .line 56
    iget-boolean p2, p0, Lcom/p1/mobile/putong/feed/data/Moment;->isLive:Z

    .line 57
    .line 58
    if-nez p2, :cond_2

    .line 59
    .line 60
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/data/Moment;->liveState:Ljava/lang/String;

    .line 61
    .line 62
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 63
    .line 64
    .line 65
    move-result p2

    .line 66
    if-nez p2, :cond_1

    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_1
    const-string p2, "off"

    .line 70
    .line 71
    goto :goto_2

    .line 72
    :cond_2
    :goto_1
    const-string p2, "on"

    .line 73
    .line 74
    :goto_2
    invoke-virtual {v0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 75
    .line 76
    .line 77
    const-string p1, "liveRecommendCategory"

    .line 78
    .line 79
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 80
    .line 81
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Live;->getRecommendCategory()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p2

    .line 85
    invoke-virtual {v0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 86
    .line 87
    .line 88
    const-string p1, "live_room_live_type"

    .line 89
    .line 90
    invoke-static {p0}, Ll/dug;->c(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-virtual {v0, p1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 95
    .line 96
    .line 97
    const-string p0, "e_live_room_enter"

    .line 98
    .line 99
    const-string p1, "p_nearby"

    .line 100
    .line 101
    invoke-static {p0, p1, v0}, Ll/i4g0;->t(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 102
    .line 103
    .line 104
    :catch_0
    return-void
.end method

.method public static j(Lcom/p1/mobile/putong/feed/data/Moment;ILjava/lang/String;Ljava/lang/String;Ll/n570;)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    move-object/from16 v2, p3

    .line 6
    .line 7
    move-object/from16 v3, p4

    .line 8
    .line 9
    if-nez v2, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-boolean v4, v0, Lcom/p1/mobile/putong/feed/data/Moment;->isVoiceLive:Z

    .line 13
    .line 14
    iget-object v5, v0, Lcom/p1/mobile/putong/feed/data/Moment;->momentVoiceLiveInfos:Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;

    .line 15
    .line 16
    const/4 v6, 0x0

    .line 17
    const/4 v7, 0x1

    .line 18
    if-nez v5, :cond_1

    .line 19
    .line 20
    move v5, v7

    .line 21
    goto :goto_0

    .line 22
    :cond_1
    move v5, v6

    .line 23
    :goto_0
    and-int/2addr v4, v5

    .line 24
    const-string v5, "index"

    .line 25
    .line 26
    const-string v8, "liveId"

    .line 27
    .line 28
    const-string v9, "anchorId"

    .line 29
    .line 30
    const-string v10, ""

    .line 31
    .line 32
    if-eqz v4, :cond_4

    .line 33
    .line 34
    new-instance v11, Ll/pf60;

    .line 35
    .line 36
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/data/Moment;->voiceLive:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 37
    .line 38
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->anchor:Lcom/p1/mobile/putong/data/Owner;

    .line 39
    .line 40
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 41
    .line 42
    invoke-direct {v11, v9, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    new-instance v12, Ll/pf60;

    .line 46
    .line 47
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/data/Moment;->voiceLive:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 48
    .line 49
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->id:Ljava/lang/String;

    .line 50
    .line 51
    invoke-direct {v12, v8, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    new-instance v13, Ll/pf60;

    .line 55
    .line 56
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/data/Moment;->voiceLive:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 57
    .line 58
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->voiceRoomInfo:Lcom/p1/mobile/putong/data/VoiceRoomInfo;

    .line 59
    .line 60
    iget-object v1, v1, Lcom/p1/mobile/putong/data/VoiceRoomInfo;->topics:Ljava/util/List;

    .line 61
    .line 62
    invoke-interface {v1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    check-cast v1, Lcom/p1/mobile/putong/data/VoiceRoomInfoTopic;

    .line 67
    .line 68
    iget-object v1, v1, Lcom/p1/mobile/putong/data/VoiceRoomInfoTopic;->id:Ljava/lang/String;

    .line 69
    .line 70
    const-string v3, "topic_id"

    .line 71
    .line 72
    invoke-direct {v13, v3, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 73
    .line 74
    .line 75
    new-instance v14, Ll/pf60;

    .line 76
    .line 77
    const-string v1, "p_nearby"

    .line 78
    .line 79
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    if-eqz v1, :cond_2

    .line 84
    .line 85
    const-string v1, "big_card"

    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_2
    const-string v1, "user_card"

    .line 89
    .line 90
    :goto_1
    const-string v3, "audio_card_type"

    .line 91
    .line 92
    invoke-direct {v14, v3, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 93
    .line 94
    .line 95
    new-instance v15, Ll/pf60;

    .line 96
    .line 97
    const-string v1, "audio_tab_id"

    .line 98
    .line 99
    invoke-direct {v15, v1, v10}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 100
    .line 101
    .line 102
    new-instance v1, Ll/pf60;

    .line 103
    .line 104
    invoke-static/range {p1 .. p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v3

    .line 108
    invoke-direct {v1, v5, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 109
    .line 110
    .line 111
    new-instance v3, Ll/pf60;

    .line 112
    .line 113
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->voiceLive:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 114
    .line 115
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->voiceRoomInfo:Lcom/p1/mobile/putong/data/VoiceRoomInfo;

    .line 116
    .line 117
    iget-boolean v0, v0, Lcom/p1/mobile/putong/data/VoiceRoomInfo;->maskMode:Z

    .line 118
    .line 119
    if-eqz v0, :cond_3

    .line 120
    .line 121
    const-string v0, "mask_audio"

    .line 122
    .line 123
    goto :goto_2

    .line 124
    :cond_3
    const-string v0, "normal_audio"

    .line 125
    .line 126
    :goto_2
    const-string v4, "audio_room_type"

    .line 127
    .line 128
    invoke-direct {v3, v4, v0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 129
    .line 130
    .line 131
    move-object/from16 v16, v1

    .line 132
    .line 133
    move-object/from16 v17, v3

    .line 134
    .line 135
    filled-new-array/range {v11 .. v17}, [Ll/pf60;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    const-string v1, "e_live_audio_room_enter"

    .line 140
    .line 141
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 142
    .line 143
    .line 144
    return-void

    .line 145
    :cond_4
    :try_start_0
    new-instance v4, Lorg/json/JSONObject;

    .line 146
    .line 147
    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 148
    .line 149
    .line 150
    iget-object v6, v0, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 151
    .line 152
    iget-object v6, v6, Lcom/p1/mobile/putong/data/Live;->id:Ljava/lang/String;

    .line 153
    .line 154
    invoke-virtual {v4, v8, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 155
    .line 156
    .line 157
    iget-object v6, v0, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 158
    .line 159
    iget-object v6, v6, Lcom/p1/mobile/putong/data/Live;->anchor:Lcom/p1/mobile/putong/data/Owner;

    .line 160
    .line 161
    iget-object v6, v6, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 162
    .line 163
    invoke-virtual {v4, v9, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 164
    .line 165
    .line 166
    const-string v6, "module"

    .line 167
    .line 168
    invoke-static {v0, v1}, Ll/dug;->d(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;)Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v8

    .line 172
    invoke-virtual {v4, v6, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 173
    .line 174
    .line 175
    invoke-static/range {p1 .. p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v6

    .line 179
    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 180
    .line 181
    .line 182
    const-string v5, "right_recommend_type"

    .line 183
    .line 184
    invoke-virtual {v4, v5, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 185
    .line 186
    .line 187
    const-string v5, "live_status"

    .line 188
    .line 189
    iget-boolean v6, v0, Lcom/p1/mobile/putong/feed/data/Moment;->isLive:Z

    .line 190
    .line 191
    if-nez v6, :cond_6

    .line 192
    .line 193
    iget-object v6, v0, Lcom/p1/mobile/putong/feed/data/Moment;->liveState:Ljava/lang/String;

    .line 194
    .line 195
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 196
    .line 197
    .line 198
    move-result v6

    .line 199
    if-nez v6, :cond_5

    .line 200
    .line 201
    goto :goto_3

    .line 202
    :cond_5
    const-string v6, "off"

    .line 203
    .line 204
    goto :goto_4

    .line 205
    :cond_6
    :goto_3
    const-string v6, "on"

    .line 206
    .line 207
    :goto_4
    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 208
    .line 209
    .line 210
    const-string v5, "trace_id"

    .line 211
    .line 212
    invoke-virtual {v4, v5, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 213
    .line 214
    .line 215
    const-string v5, "liveRecommendCategory"

    .line 216
    .line 217
    iget-object v6, v0, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 218
    .line 219
    invoke-virtual {v6}, Lcom/p1/mobile/putong/data/Live;->getRecommendCategory()Ljava/lang/String;

    .line 220
    .line 221
    .line 222
    move-result-object v6

    .line 223
    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 224
    .line 225
    .line 226
    const-string v5, "live_room_live_type"

    .line 227
    .line 228
    invoke-static {v0}, Ll/dug;->c(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object v6

    .line 232
    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 233
    .line 234
    .line 235
    const-string v5, "follow_photo"

    .line 236
    .line 237
    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 238
    .line 239
    .line 240
    move-result v5
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 241
    const-string v6, "show_label"

    .line 242
    .line 243
    if-nez v5, :cond_9

    .line 244
    .line 245
    :try_start_1
    const-string v5, "nearby_photo"

    .line 246
    .line 247
    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 248
    .line 249
    .line 250
    move-result v1

    .line 251
    if-eqz v1, :cond_7

    .line 252
    .line 253
    goto :goto_5

    .line 254
    :cond_7
    new-instance v1, Lorg/json/JSONObject;

    .line 255
    .line 256
    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 257
    .line 258
    .line 259
    iget-object v5, v0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 260
    .line 261
    invoke-virtual {v3, v5}, Ll/n570;->m(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 262
    .line 263
    .line 264
    move-result-object v5

    .line 265
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 266
    .line 267
    .line 268
    move-result v5

    .line 269
    if-eqz v5, :cond_8

    .line 270
    .line 271
    const-string v5, "distance"

    .line 272
    .line 273
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 274
    .line 275
    invoke-virtual {v3, v0}, Ll/n570;->m(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 276
    .line 277
    .line 278
    move-result-object v0

    .line 279
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 280
    .line 281
    iget v0, v0, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 282
    .line 283
    invoke-static {v0, v7}, Ll/q8g0;->p(IZ)Ljava/lang/String;

    .line 284
    .line 285
    .line 286
    move-result-object v0

    .line 287
    invoke-virtual {v1, v5, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 288
    .line 289
    .line 290
    :cond_8
    invoke-virtual {v4, v6, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 291
    .line 292
    .line 293
    goto :goto_6

    .line 294
    :cond_9
    :goto_5
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->iconTitle:Ljava/lang/String;

    .line 295
    .line 296
    invoke-virtual {v4, v6, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 297
    .line 298
    .line 299
    :goto_6
    const-string v0, "e_live_room_enter"

    .line 300
    .line 301
    invoke-static {v0, v2, v4}, Ll/i4g0;->t(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 302
    .line 303
    .line 304
    return-void

    .line 305
    :catch_0
    move-exception v0

    .line 306
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 307
    .line 308
    .line 309
    invoke-static {v0}, Ll/wu80;->b(Ljava/lang/Exception;)V

    .line 310
    .line 311
    .line 312
    return-void
.end method

.method public static k(Lcom/p1/mobile/putong/feed/data/Moment;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 23

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    iget-boolean v2, v0, Lcom/p1/mobile/putong/feed/data/Moment;->isVoiceLive:Z

    .line 6
    .line 7
    const-string v3, "index"

    .line 8
    .line 9
    const-string v4, ""

    .line 10
    .line 11
    const-string v5, "audio_tab_id"

    .line 12
    .line 13
    const-string v6, "user_card"

    .line 14
    .line 15
    const-string v7, "liveId"

    .line 16
    .line 17
    const-string v8, "anchorId"

    .line 18
    .line 19
    const-string v9, "e_live_audio_room_enter"

    .line 20
    .line 21
    const-string v10, "audio_card_type"

    .line 22
    .line 23
    if-eqz v2, :cond_1

    .line 24
    .line 25
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/data/Moment;->momentVoiceLiveInfos:Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;

    .line 26
    .line 27
    if-eqz v2, :cond_1

    .line 28
    .line 29
    iget-object v11, v2, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->momentVoiceUser:Lcom/p1/mobile/putong/feed/data/MomentVoiceUser;

    .line 30
    .line 31
    if-eqz v11, :cond_1

    .line 32
    .line 33
    new-instance v12, Ll/pf60;

    .line 34
    .line 35
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->anchorUserID:Ljava/lang/String;

    .line 36
    .line 37
    invoke-direct {v12, v8, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    new-instance v13, Ll/pf60;

    .line 41
    .line 42
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/data/Moment;->momentVoiceLiveInfos:Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;

    .line 43
    .line 44
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->liveID:Ljava/lang/String;

    .line 45
    .line 46
    invoke-direct {v13, v7, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 47
    .line 48
    .line 49
    new-instance v14, Ll/pf60;

    .line 50
    .line 51
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/data/Moment;->momentVoiceLiveInfos:Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;

    .line 52
    .line 53
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->topicID:Ljava/lang/String;

    .line 54
    .line 55
    const-string v7, "topic_id"

    .line 56
    .line 57
    invoke-direct {v14, v7, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 58
    .line 59
    .line 60
    new-instance v15, Ll/pf60;

    .line 61
    .line 62
    invoke-direct {v15, v10, v6}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 63
    .line 64
    .line 65
    new-instance v2, Ll/pf60;

    .line 66
    .line 67
    invoke-direct {v2, v5, v4}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 68
    .line 69
    .line 70
    new-instance v4, Ll/pf60;

    .line 71
    .line 72
    iget-object v5, v0, Lcom/p1/mobile/putong/feed/data/Moment;->momentVoiceLiveInfos:Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;

    .line 73
    .line 74
    iget-object v5, v5, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->topicName:Ljava/lang/String;

    .line 75
    .line 76
    const-string v6, "audio_room_label"

    .line 77
    .line 78
    invoke-direct {v4, v6, v5}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 79
    .line 80
    .line 81
    new-instance v5, Ll/pf60;

    .line 82
    .line 83
    invoke-static/range {p1 .. p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v6

    .line 87
    invoke-direct {v5, v3, v6}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 88
    .line 89
    .line 90
    new-instance v3, Ll/pf60;

    .line 91
    .line 92
    const-string v6, "enter_type"

    .line 93
    .line 94
    move-object/from16 v7, p4

    .line 95
    .line 96
    invoke-direct {v3, v6, v7}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 97
    .line 98
    .line 99
    new-instance v6, Ll/pf60;

    .line 100
    .line 101
    iget-object v7, v0, Lcom/p1/mobile/putong/feed/data/Moment;->momentVoiceLiveInfos:Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;

    .line 102
    .line 103
    iget-object v7, v7, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->momentVoiceUser:Lcom/p1/mobile/putong/feed/data/MomentVoiceUser;

    .line 104
    .line 105
    iget-object v7, v7, Lcom/p1/mobile/putong/feed/data/MomentVoiceUser;->momentVoiceTemplate:Ljava/lang/String;

    .line 106
    .line 107
    const-string v8, "voice_template"

    .line 108
    .line 109
    invoke-direct {v6, v8, v7}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 110
    .line 111
    .line 112
    new-instance v7, Ll/pf60;

    .line 113
    .line 114
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->momentVoiceLiveInfos:Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;

    .line 115
    .line 116
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->momentVoiceUser:Lcom/p1/mobile/putong/feed/data/MomentVoiceUser;

    .line 117
    .line 118
    iget-boolean v0, v0, Lcom/p1/mobile/putong/feed/data/MomentVoiceUser;->momentIsAnchor:Z

    .line 119
    .line 120
    if-eqz v0, :cond_0

    .line 121
    .line 122
    const-string v0, "discover_moment_anchor"

    .line 123
    .line 124
    goto :goto_0

    .line 125
    :cond_0
    const-string v0, "discover_moment_room"

    .line 126
    .line 127
    :goto_0
    invoke-direct {v7, v10, v0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 128
    .line 129
    .line 130
    new-instance v0, Ll/pf60;

    .line 131
    .line 132
    const-string v8, "audio_room_type"

    .line 133
    .line 134
    const-string v10, "normal_audio"

    .line 135
    .line 136
    invoke-direct {v0, v8, v10}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 137
    .line 138
    .line 139
    move-object/from16 v22, v0

    .line 140
    .line 141
    move-object/from16 v16, v2

    .line 142
    .line 143
    move-object/from16 v19, v3

    .line 144
    .line 145
    move-object/from16 v17, v4

    .line 146
    .line 147
    move-object/from16 v18, v5

    .line 148
    .line 149
    move-object/from16 v20, v6

    .line 150
    .line 151
    move-object/from16 v21, v7

    .line 152
    .line 153
    filled-new-array/range {v12 .. v22}, [Ll/pf60;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    invoke-static {v9, v1, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 158
    .line 159
    .line 160
    return-void

    .line 161
    :cond_1
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/data/Moment;->voiceLive:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 162
    .line 163
    if-eqz v2, :cond_3

    .line 164
    .line 165
    if-eqz v1, :cond_3

    .line 166
    .line 167
    if-nez p3, :cond_2

    .line 168
    .line 169
    goto :goto_1

    .line 170
    :cond_2
    new-instance v11, Ll/pf60;

    .line 171
    .line 172
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/VoiceLive;->anchor:Lcom/p1/mobile/putong/data/Owner;

    .line 173
    .line 174
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 175
    .line 176
    invoke-direct {v11, v8, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 177
    .line 178
    .line 179
    new-instance v2, Ll/pf60;

    .line 180
    .line 181
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->voiceLive:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 182
    .line 183
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->id:Ljava/lang/String;

    .line 184
    .line 185
    invoke-direct {v2, v7, v0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 186
    .line 187
    .line 188
    new-instance v0, Ll/pf60;

    .line 189
    .line 190
    invoke-direct {v0, v10, v6}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 191
    .line 192
    .line 193
    new-instance v6, Ll/pf60;

    .line 194
    .line 195
    invoke-direct {v6, v5, v4}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 196
    .line 197
    .line 198
    new-instance v4, Ll/pf60;

    .line 199
    .line 200
    invoke-static/range {p1 .. p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object v5

    .line 204
    invoke-direct {v4, v3, v5}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 205
    .line 206
    .line 207
    filled-new-array {v11, v2, v0, v6, v4}, [Ll/pf60;

    .line 208
    .line 209
    .line 210
    move-result-object v0

    .line 211
    invoke-static {v9, v1, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 212
    .line 213
    .line 214
    :cond_3
    :goto_1
    return-void
.end method
