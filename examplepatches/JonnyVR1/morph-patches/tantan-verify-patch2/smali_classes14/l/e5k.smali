.class public Ll/e5k;
.super Ll/nwl;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/nwl;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic r(Ll/e5k;Lcom/p1/mobile/android/app/Act;ZLl/kfn0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/e5k;->v(Lcom/p1/mobile/android/app/Act;ZLl/kfn0;)V

    return-void
.end method


# virtual methods
.method public e(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/abe0;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/mwl;->e(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/abe0;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1, p3}, Ll/e5k;->y(Lcom/p1/mobile/android/app/Act;Ll/abe0;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public l(Ljava/lang/String;)Z
    .locals 0

    .line 1
    const-string p0, "enterVoiceRoom"

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final s(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 9

    .line 1
    const-string p0, "manager-recall-invite-card"

    .line 2
    .line 3
    invoke-virtual {p0, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const-string v0, "audio_card_type"

    .line 8
    .line 9
    const-string v1, "p_chat_view"

    .line 10
    .line 11
    const-string v2, "e_live_audio_room_enter"

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const-string p0, "user_invite_room_admin"

    .line 16
    .line 17
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    filled-new-array {p0}, [Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {v2, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    const-string p0, "live-chat-tab-report"

    .line 30
    .line 31
    invoke-virtual {p0, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_1

    .line 36
    .line 37
    const-string p0, "anchorId"

    .line 38
    .line 39
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    const-string p0, "liveId"

    .line 44
    .line 45
    invoke-static {p0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    const-string p0, "audio_tab_id"

    .line 50
    .line 51
    const-string p1, "NA"

    .line 52
    .line 53
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object v5

    .line 57
    const-string p0, "profile_user_id"

    .line 58
    .line 59
    invoke-static {p0, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 60
    .line 61
    .line 62
    move-result-object v6

    .line 63
    const-string p0, "audio_room_type"

    .line 64
    .line 65
    const-string p1, "normal_audio"

    .line 66
    .line 67
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 68
    .line 69
    .line 70
    move-result-object v7

    .line 71
    invoke-static {v0, p4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 72
    .line 73
    .line 74
    move-result-object v8

    .line 75
    filled-new-array/range {v3 .. v8}, [Ll/pf60;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-static {v2, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 80
    .line 81
    .line 82
    :cond_1
    return-void
.end method

.method public t(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    .locals 1

    .line 1
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p3, "default"

    .line 8
    .line 9
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string v0, "voice-live"

    .line 14
    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->type:Ljava/lang/String;

    .line 16
    .line 17
    iput-object p2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 24
    .line 25
    const-string v0, "virtualAvatar"

    .line 26
    .line 27
    invoke-static {p6, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result p6

    .line 31
    if-eqz p6, :cond_2

    .line 32
    .line 33
    invoke-static {}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->getBuilder()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    const/4 p6, 0x1

    .line 38
    invoke-virtual {p0, p6}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->Q(Z)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->E(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->O(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p0, p4}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->v(Z)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-static {p5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 55
    .line 56
    .line 57
    move-result p2

    .line 58
    if-eqz p2, :cond_1

    .line 59
    .line 60
    const-string p5, ""

    .line 61
    .line 62
    :cond_1
    invoke-virtual {p0, p5}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->z(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->u()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    sget-object p2, Ll/tbs;->f:Ll/j6t;

    .line 71
    .line 72
    invoke-virtual {p2, p1, p0}, Ll/j6t;->f(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)Landroid/content/Intent;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    return-object p0

    .line 77
    :cond_2
    invoke-static {p0, p3}, Ll/r4u;->g(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Ljava/lang/String;)Landroid/os/Bundle;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-static {p5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 82
    .line 83
    .line 84
    move-result p2

    .line 85
    if-nez p2, :cond_3

    .line 86
    .line 87
    const-string p2, "live_push_voice_focus_user_id"

    .line 88
    .line 89
    invoke-virtual {p0, p2, p5}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    const-string p2, "live_push_voice"

    .line 93
    .line 94
    const-string p3, "live.schema.push.all"

    .line 95
    .line 96
    invoke-virtual {p0, p2, p3}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    :cond_3
    invoke-static {p1, p0}, Ll/bjo0;->c(Landroid/content/Context;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    return-object p0
.end method

.method public final u(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/mwl;->h(Lcom/p1/mobile/android/app/Act;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    invoke-static {}, Ll/mbs;->J()Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p2, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    const-string p0, "\u5df2\u5728\u81ea\u5df1\u7684\u7fa4\u804a\u4e2d"

    .line 20
    .line 21
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const-string p0, "\u6b63\u5728\u9ea6\u4e0a\uff0c\u65e0\u6cd5\u8fdb\u5165\u5176\u4ed6\u7fa4\u804a"

    .line 26
    .line 27
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    :cond_1
    :goto_0
    const-string p0, "scheme_fake_frag"

    .line 31
    .line 32
    const/4 p2, 0x0

    .line 33
    invoke-static {p1, p0, p2}, Lcom/p1/mobile/putong/live/external/page/setting/LiveIndependentSettingAct;->Z1(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 38
    .line 39
    .line 40
    const/4 p0, 0x0

    .line 41
    invoke-virtual {p1, p0, p0}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final synthetic v(Lcom/p1/mobile/android/app/Act;ZLl/kfn0;)V
    .locals 1

    .line 1
    invoke-static {p3}, Ll/v5k0;->n(Ll/kfn0;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p3, Ll/kfn0;->a:Ljava/util/List;

    .line 5
    .line 6
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    sget p0, Lcom/p1/mobile/putong/live/external/R$string;->D0:I

    .line 13
    .line 14
    invoke-static {p0}, Ll/r1j0;->f(I)V

    .line 15
    .line 16
    .line 17
    const-string p0, "tabId"

    .line 18
    .line 19
    invoke-static {p1, p0}, Ll/h3g0;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    iget-object p3, p3, Ll/kfn0;->a:Ljava/util/List;

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    invoke-interface {p3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p3

    .line 30
    check-cast p3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;

    .line 31
    .line 32
    iget-object p3, p3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->liveId:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {p0, p1, p3, p2}, Ll/e5k;->x(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public w(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7

    .line 1
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2
    const-string v1, "default"

    move-object v3, v1

    goto :goto_0

    :cond_0
    move-object v3, p4

    .line 3
    :goto_0
    const-string v1, "link-share-voice-live"

    invoke-static {p4, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 4
    invoke-static {}, Ll/mwl;->i()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 5
    invoke-virtual/range {p0 .. p2}, Ll/e5k;->u(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    return-void

    .line 6
    :cond_1
    invoke-virtual {p0, p2, p3, p8, p4}, Ll/e5k;->s(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    move-object v0, p0

    move-object v1, p1

    move-object v2, p3

    move v4, p5

    move-object v5, p8

    move-object/from16 v6, p10

    .line 7
    invoke-virtual/range {v0 .. v6}, Ll/e5k;->t(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 8
    const-string v1, "virtualAvatar"

    invoke-static {v6, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_4

    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->getBuilder()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    move-result-object v1

    const/4 v4, 0x1

    .line 10
    invoke-virtual {v1, v4}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->Q(Z)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    move-result-object v1

    .line 11
    invoke-virtual {v1, p3}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->E(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    move-result-object v1

    .line 12
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->O(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    move-result-object v1

    .line 13
    invoke-virtual {v1, p7}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->G(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    move-result-object v1

    .line 14
    invoke-static {p8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    const-string v3, ""

    if-eqz v2, :cond_2

    move-object v2, v3

    goto :goto_1

    :cond_2
    move-object v2, p8

    :goto_1
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->z(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    move-result-object v1

    .line 15
    invoke-static/range {p9 .. p9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_3

    goto :goto_2

    :cond_3
    move-object/from16 v3, p9

    .line 16
    :goto_2
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->A(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    move-result-object v1

    .line 17
    invoke-virtual {v1, p6}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->T(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    move-result-object v1

    .line 18
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->u()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    move-result-object v1

    .line 19
    const-string v2, "LIVE_AUDIENCE_START_DATA"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 20
    :cond_4
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public final x(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)V
    .locals 11

    .line 1
    const-string v9, ""

    .line 2
    .line 3
    const-string v10, ""

    .line 4
    .line 5
    const-string v2, ""

    .line 6
    .line 7
    const-string v4, "voice-chat-admin"

    .line 8
    .line 9
    const-string v6, "chatAssistantFixAnchor"

    .line 10
    .line 11
    const/4 v7, 0x0

    .line 12
    const-string v8, ""

    .line 13
    .line 14
    move-object v0, p0

    .line 15
    move-object v1, p1

    .line 16
    move-object v3, p2

    .line 17
    move v5, p3

    .line 18
    invoke-virtual/range {v0 .. v10}, Ll/e5k;->w(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final y(Lcom/p1/mobile/android/app/Act;Ll/abe0;)V
    .locals 13

    .line 1
    invoke-virtual {p2}, Ll/abe0;->f()Ljava/util/Map;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "liveId"

    .line 6
    .line 7
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/CharSequence;

    .line 12
    .line 13
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_7

    .line 18
    .line 19
    const-string v0, "anchorId"

    .line 20
    .line 21
    invoke-static {p2, v0}, Ll/v5k0;->j(Ll/abe0;Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v4

    .line 25
    const-string v0, "anchor"

    .line 26
    .line 27
    invoke-static {p2, v0}, Ll/v5k0;->j(Ll/abe0;Ljava/lang/String;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-static {p2, v1}, Ll/v5k0;->j(Ll/abe0;Ljava/lang/String;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v5

    .line 35
    const-string v0, "source"

    .line 36
    .line 37
    invoke-static {p2, v0}, Ll/v5k0;->j(Ll/abe0;Ljava/lang/String;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v6

    .line 41
    const-string v0, "autoJoinGame"

    .line 42
    .line 43
    invoke-static {p2, v0}, Ll/v5k0;->e(Ll/abe0;Ljava/lang/String;)Z

    .line 44
    .line 45
    .line 46
    move-result v7

    .line 47
    const-string v0, "recallSourceId"

    .line 48
    .line 49
    invoke-static {p2, v0}, Ll/v5k0;->j(Ll/abe0;Ljava/lang/String;)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-eqz v1, :cond_0

    .line 58
    .line 59
    const-string v0, "fromUserId"

    .line 60
    .line 61
    invoke-static {p2, v0}, Ll/v5k0;->j(Ll/abe0;Ljava/lang/String;)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    :cond_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    if-eqz v1, :cond_1

    .line 70
    .line 71
    const-string v0, "sourceUserId"

    .line 72
    .line 73
    invoke-static {p2, v0}, Ll/v5k0;->j(Ll/abe0;Ljava/lang/String;)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    :cond_1
    move-object v10, v0

    .line 78
    invoke-virtual {p2}, Ll/abe0;->c()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    const-string v3, ""

    .line 87
    .line 88
    if-nez v1, :cond_2

    .line 89
    .line 90
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    const-string v1, "toast"

    .line 95
    .line 96
    invoke-virtual {v0, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 101
    .line 102
    .line 103
    move-result v1

    .line 104
    if-nez v1, :cond_2

    .line 105
    .line 106
    :try_start_0
    new-instance v1, Ljava/lang/String;

    .line 107
    .line 108
    const/4 v8, 0x0

    .line 109
    invoke-static {v0, v8}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-direct {v1, v0}, Ljava/lang/String;-><init>([B)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 114
    .line 115
    .line 116
    move-object v11, v1

    .line 117
    goto :goto_0

    .line 118
    :catch_0
    move-exception v0

    .line 119
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 120
    .line 121
    .line 122
    :cond_2
    move-object v11, v3

    .line 123
    :goto_0
    const-string v0, "live_mode"

    .line 124
    .line 125
    invoke-static {p2, v0}, Ll/v5k0;->j(Ll/abe0;Ljava/lang/String;)Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 130
    .line 131
    .line 132
    move-result v1

    .line 133
    if-eqz v1, :cond_3

    .line 134
    .line 135
    const-string v0, "liveMode"

    .line 136
    .line 137
    invoke-static {p2, v0}, Ll/v5k0;->j(Ll/abe0;Ljava/lang/String;)Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    :cond_3
    move-object v12, v0

    .line 142
    const-string v0, "from"

    .line 143
    .line 144
    invoke-static {p2, v0}, Ll/v5k0;->j(Ll/abe0;Ljava/lang/String;)Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    const-string v0, "locateChat"

    .line 148
    .line 149
    invoke-static {p2, v0}, Ll/v5k0;->f(Ll/abe0;Ljava/lang/String;)I

    .line 150
    .line 151
    .line 152
    move-result p2

    .line 153
    const/4 v0, 0x1

    .line 154
    if-ne p2, v0, :cond_4

    .line 155
    .line 156
    const-string p2, "voiceSquare"

    .line 157
    .line 158
    const/4 v0, 0x0

    .line 159
    invoke-virtual {p0, p1, p2, v0}, Ll/mwl;->b(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 160
    .line 161
    .line 162
    :cond_4
    const-string p2, "my-fixed-room"

    .line 163
    .line 164
    invoke-static {v2, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 165
    .line 166
    .line 167
    move-result v0

    .line 168
    if-eqz v0, :cond_5

    .line 169
    .line 170
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/live/external/internal/api/LiveVoiceApi;->getVoiceDataByChatAssistant(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 171
    .line 172
    .line 173
    move-result-object p2

    .line 174
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 175
    .line 176
    .line 177
    move-result-object p2

    .line 178
    new-instance v0, Ll/d5k;

    .line 179
    .line 180
    invoke-direct {v0, p0, p1, v7}, Ll/d5k;-><init>(Ll/e5k;Lcom/p1/mobile/android/app/Act;Z)V

    .line 181
    .line 182
    .line 183
    invoke-static {v0}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 184
    .line 185
    .line 186
    move-result-object p0

    .line 187
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 188
    .line 189
    .line 190
    goto :goto_1

    .line 191
    :cond_5
    invoke-static {p2, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 192
    .line 193
    .line 194
    move-result p2

    .line 195
    if-eqz p2, :cond_6

    .line 196
    .line 197
    const-string v3, "chatAssistantFixAnchor"

    .line 198
    .line 199
    :cond_6
    move-object v8, v3

    .line 200
    const-string v9, ""

    .line 201
    .line 202
    move-object v2, p0

    .line 203
    move-object v3, p1

    .line 204
    invoke-virtual/range {v2 .. v12}, Ll/e5k;->w(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 205
    .line 206
    .line 207
    :cond_7
    :goto_1
    return-void
.end method
