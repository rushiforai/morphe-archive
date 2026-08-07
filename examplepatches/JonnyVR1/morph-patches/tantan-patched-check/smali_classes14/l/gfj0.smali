.class public Ll/gfj0;
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

.method public static a(Lcom/p1/mobile/putong/live/base/data/BLive;)Ljava/lang/String;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLive;->multiCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;

    .line 2
    .line 3
    const-string v0, "onlive"

    .line 4
    .line 5
    invoke-static {p0, v0}, Ll/mfd0;->a(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static b(Lcom/p1/mobile/putong/live/base/data/BLive;Lcom/p1/mobile/putong/live/base/data/BLiveActivity;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveActivity;->multiCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;

    .line 2
    .line 3
    const-string p1, "onlive"

    .line 4
    .line 5
    invoke-static {p0, p1}, Ll/mfd0;->a(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static c(ZLjava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveState;Ljava/lang/String;)V
    .locals 6

    .line 1
    const-string v5, ""

    .line 2
    .line 3
    move v0, p0

    .line 4
    move-object v1, p1

    .line 5
    move-object v2, p2

    .line 6
    move-object v3, p3

    .line 7
    move-object v4, p4

    .line 8
    invoke-static/range {v0 .. v5}, Ll/gfj0;->d(ZLjava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveState;Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static d(ZLjava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveState;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "anchorId"

    .line 7
    .line 8
    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    const-string p1, "index"

    .line 12
    .line 13
    const-string v1, "NA"

    .line 14
    .line 15
    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const-string v2, "is_gif"

    .line 24
    .line 25
    invoke-interface {v0, v2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    const-string p1, "liveId"

    .line 29
    .line 30
    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    const-string p1, "liveRecommendCategory"

    .line 34
    .line 35
    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    const-string p1, "stopped"

    .line 39
    .line 40
    invoke-static {p3, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    if-nez p1, :cond_0

    .line 45
    .line 46
    const-string p1, "on"

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    const-string p1, "off"

    .line 50
    .line 51
    :goto_0
    const-string p2, "live_status"

    .line 52
    .line 53
    invoke-interface {v0, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    const-string p1, "module"

    .line 57
    .line 58
    const-string p2, "my_room"

    .line 59
    .line 60
    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    const-string p1, "live_room_live_type"

    .line 64
    .line 65
    invoke-interface {v0, p1, p4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    invoke-static {p5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    if-nez p1, :cond_1

    .line 73
    .line 74
    const-string p1, "home_card"

    .line 75
    .line 76
    invoke-static {p1, p5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    if-eqz p1, :cond_1

    .line 81
    .line 82
    const-string p1, "live_enter_source"

    .line 83
    .line 84
    const-string p2, "suggest_live_card_profile"

    .line 85
    .line 86
    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    :cond_1
    const-string p1, "p_suggest_user_profile_info_view"

    .line 90
    .line 91
    if-eqz p0, :cond_2

    .line 92
    .line 93
    invoke-static {p1, v0}, Ll/bfu;->f(Ljava/lang/String;Ljava/util/Map;)V

    .line 94
    .line 95
    .line 96
    return-void

    .line 97
    :cond_2
    invoke-static {p1, v0}, Ll/bfu;->e(Ljava/lang/String;Ljava/util/Map;)V

    .line 98
    .line 99
    .line 100
    return-void
.end method

.method public static e(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "anchorId"

    .line 7
    .line 8
    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    const-string p1, "index"

    .line 12
    .line 13
    const-string v1, "NA"

    .line 14
    .line 15
    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const-string v2, "is_gif"

    .line 24
    .line 25
    invoke-interface {v0, v2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    const-string p1, "liveId"

    .line 29
    .line 30
    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    const-string p1, "liveRecommendCategory"

    .line 34
    .line 35
    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    const-string p1, "stopped"

    .line 39
    .line 40
    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    if-eqz p1, :cond_0

    .line 45
    .line 46
    const-string p1, "on"

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    const-string p1, "off"

    .line 50
    .line 51
    :goto_0
    const-string p2, "live_status"

    .line 52
    .line 53
    invoke-interface {v0, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    const-string p1, "module"

    .line 57
    .line 58
    const-string p2, "my_room"

    .line 59
    .line 60
    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    const-string p1, "live_room_live_type"

    .line 64
    .line 65
    invoke-static {p4, p3}, Ll/mfd0;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p2

    .line 69
    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    invoke-static {p5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    if-nez p1, :cond_1

    .line 77
    .line 78
    const-string p1, "home_card"

    .line 79
    .line 80
    invoke-static {p1, p5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 81
    .line 82
    .line 83
    move-result p1

    .line 84
    if-eqz p1, :cond_1

    .line 85
    .line 86
    const-string p1, "live_enter_source"

    .line 87
    .line 88
    const-string p2, "suggest_live_card_profile"

    .line 89
    .line 90
    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    :cond_1
    const-string p1, "p_suggest_user_profile_info_view"

    .line 94
    .line 95
    if-eqz p0, :cond_2

    .line 96
    .line 97
    invoke-static {p1, v0}, Ll/bfu;->f(Ljava/lang/String;Ljava/util/Map;)V

    .line 98
    .line 99
    .line 100
    return-void

    .line 101
    :cond_2
    invoke-static {p1, v0}, Ll/bfu;->e(Ljava/lang/String;Ljava/util/Map;)V

    .line 102
    .line 103
    .line 104
    return-void
.end method

.method public static f(Ll/i420;ZLjava/lang/String;)V
    .locals 6

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/i420;->a()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 8
    .line 9
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/i420;->a()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/i420;->b()Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->isMaskMode()Z

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    invoke-virtual {p0}, Ll/i420;->b()Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 32
    .line 33
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->topics:Ljava/util/List;

    .line 34
    .line 35
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_0

    .line 40
    .line 41
    const-string p0, ""

    .line 42
    .line 43
    :goto_0
    move-object v4, p0

    .line 44
    goto :goto_1

    .line 45
    :cond_0
    invoke-virtual {p0}, Ll/i420;->b()Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->topics:Ljava/util/List;

    .line 52
    .line 53
    const/4 p1, 0x0

    .line 54
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTopic;

    .line 59
    .line 60
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTopic;->id:Ljava/lang/String;

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :goto_1
    const/4 v5, 0x0

    .line 64
    const/4 v0, 0x0

    .line 65
    invoke-static/range {v0 .. v5}, Ll/gfj0;->h(ZLjava/lang/String;Ljava/lang/String;ZLjava/lang/String;Z)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_1
    invoke-virtual {p0}, Ll/i420;->a()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 74
    .line 75
    invoke-static {p1}, Ll/gfj0;->a(Lcom/p1/mobile/putong/live/base/data/BLive;)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v4

    .line 79
    invoke-virtual {p0}, Ll/i420;->a()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 84
    .line 85
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 86
    .line 87
    invoke-virtual {p0}, Ll/i420;->a()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 92
    .line 93
    invoke-virtual {p0}, Ll/i420;->a()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->state:Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 98
    .line 99
    const/4 v0, 0x0

    .line 100
    move-object v5, p2

    .line 101
    invoke-static/range {v0 .. v5}, Ll/gfj0;->d(ZLjava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveState;Ljava/lang/String;Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    return-void
.end method

.method public static g(Ll/i420;Z)V
    .locals 6

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/i420;->a()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 8
    .line 9
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/i420;->a()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/i420;->b()Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->isMaskMode()Z

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    invoke-virtual {p0}, Ll/i420;->b()Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 32
    .line 33
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->topics:Ljava/util/List;

    .line 34
    .line 35
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_0

    .line 40
    .line 41
    const-string p0, ""

    .line 42
    .line 43
    :goto_0
    move-object v4, p0

    .line 44
    goto :goto_1

    .line 45
    :cond_0
    invoke-virtual {p0}, Ll/i420;->b()Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->topics:Ljava/util/List;

    .line 52
    .line 53
    const/4 p1, 0x0

    .line 54
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTopic;

    .line 59
    .line 60
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTopic;->id:Ljava/lang/String;

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :goto_1
    const/4 v5, 0x0

    .line 64
    const/4 v0, 0x1

    .line 65
    invoke-static/range {v0 .. v5}, Ll/gfj0;->h(ZLjava/lang/String;Ljava/lang/String;ZLjava/lang/String;Z)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_1
    invoke-virtual {p0}, Ll/i420;->a()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 74
    .line 75
    invoke-static {p1}, Ll/gfj0;->a(Lcom/p1/mobile/putong/live/base/data/BLive;)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-virtual {p0}, Ll/i420;->a()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 84
    .line 85
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 86
    .line 87
    invoke-virtual {p0}, Ll/i420;->a()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 92
    .line 93
    invoke-virtual {p0}, Ll/i420;->a()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->state:Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 98
    .line 99
    const/4 v2, 0x1

    .line 100
    invoke-static {v2, v0, v1, p0, p1}, Ll/gfj0;->c(ZLjava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveState;Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method public static h(ZLjava/lang/String;Ljava/lang/String;ZLjava/lang/String;Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "anchorId"

    .line 7
    .line 8
    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    if-eqz p3, :cond_0

    .line 12
    .line 13
    const-string p1, "mask_audio"

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const-string p1, "normal_audio"

    .line 17
    .line 18
    :goto_0
    const-string p3, "audio_room_type"

    .line 19
    .line 20
    invoke-interface {v0, p3, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    const-string p1, "liveId"

    .line 24
    .line 25
    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    const-string p1, "topic_id"

    .line 29
    .line 30
    invoke-interface {v0, p1, p4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    const-string p1, "index"

    .line 34
    .line 35
    const-string p2, "NA"

    .line 36
    .line 37
    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    if-eqz p5, :cond_1

    .line 41
    .line 42
    const-string p1, "audio_card_type"

    .line 43
    .line 44
    const-string p2, "profile_settled_room"

    .line 45
    .line 46
    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    :cond_1
    const-string p1, "p_suggest_user_profile_info_view"

    .line 50
    .line 51
    const-string p2, "e_live_audio_room_enter"

    .line 52
    .line 53
    if-eqz p0, :cond_2

    .line 54
    .line 55
    invoke-static {p2, p1, v0}, Ll/i4g0;->y(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_2
    invoke-static {p2, p1, v0}, Ll/i4g0;->s(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method
