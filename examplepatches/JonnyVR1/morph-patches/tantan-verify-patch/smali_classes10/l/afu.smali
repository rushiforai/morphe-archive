.class public Ll/afu;
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

.method public static a(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, -0x1

    .line 9
    sparse-switch v0, :sswitch_data_0

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :sswitch_0
    const-string v0, "chatReply"

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 v1, 0x6

    .line 23
    goto :goto_0

    .line 24
    :sswitch_1
    const-string v0, "jumpVoiceFlameMarket"

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    if-nez p0, :cond_1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    const/4 v1, 0x5

    .line 34
    goto :goto_0

    .line 35
    :sswitch_2
    const-string v0, "inviteVoiceCall"

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-nez p0, :cond_2

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_2
    const/4 v1, 0x4

    .line 45
    goto :goto_0

    .line 46
    :sswitch_3
    const-string v0, "buttonOpenProfile"

    .line 47
    .line 48
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    if-nez p0, :cond_3

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_3
    const/4 v1, 0x3

    .line 56
    goto :goto_0

    .line 57
    :sswitch_4
    const-string v0, "chat"

    .line 58
    .line 59
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    if-nez p0, :cond_4

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_4
    const/4 v1, 0x2

    .line 67
    goto :goto_0

    .line 68
    :sswitch_5
    const-string v0, "anchorInviteCall"

    .line 69
    .line 70
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    if-nez p0, :cond_5

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_5
    const/4 v1, 0x1

    .line 78
    goto :goto_0

    .line 79
    :sswitch_6
    const-string v0, "userApplyVoiceCall"

    .line 80
    .line 81
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    if-nez p0, :cond_6

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_6
    const/4 v1, 0x0

    .line 89
    :goto_0
    packed-switch v1, :pswitch_data_0

    .line 90
    .line 91
    .line 92
    const-string p0, ""

    .line 93
    .line 94
    return-object p0

    .line 95
    :pswitch_0
    const-string p0, "reply_msg"

    .line 96
    .line 97
    return-object p0

    .line 98
    :pswitch_1
    const-string p0, "rights_exchange"

    .line 99
    .line 100
    return-object p0

    .line 101
    :pswitch_2
    const-string p0, "enter_invite_voice_chat"

    .line 102
    .line 103
    return-object p0

    .line 104
    :pswitch_3
    const-string p0, "open_profile_card"

    .line 105
    .line 106
    return-object p0

    .line 107
    :pswitch_4
    const-string p0, "welcome_message"

    .line 108
    .line 109
    return-object p0

    .line 110
    :pswitch_5
    const-string p0, "invite_voice_chat"

    .line 111
    .line 112
    return-object p0

    .line 113
    :pswitch_6
    const-string p0, "enter_voice_chat"

    .line 114
    .line 115
    return-object p0

    .line 116
    nop

    .line 117
    :sswitch_data_0
    .sparse-switch
        -0x5888c873 -> :sswitch_6
        -0x4b620e64 -> :sswitch_5
        0x2e9358 -> :sswitch_4
        0x6fea16d -> :sswitch_3
        0x13d4b1a7 -> :sswitch_2
        0x21468d0b -> :sswitch_1
        0x5fd2e672 -> :sswitch_0
    .end sparse-switch

    .line 118
    .line 119
    .line 120
    .line 121
    .line 122
    .line 123
    .line 124
    .line 125
    .line 126
    .line 127
    .line 128
    .line 129
    .line 130
    .line 131
    .line 132
    .line 133
    .line 134
    .line 135
    .line 136
    .line 137
    .line 138
    .line 139
    .line 140
    .line 141
    .line 142
    .line 143
    .line 144
    .line 145
    .line 146
    .line 147
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static b(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "anchor_id"

    .line 2
    .line 3
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "live_id"

    .line 8
    .line 9
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    filled-new-array {p0, p1}, [Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string p1, "e_audio_quit_rtc_room_fail"

    .line 18
    .line 19
    const-string v0, ""

    .line 20
    .line 21
    invoke-static {p1, v0, p0}, Ll/i4g0;->B(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static c(Ljava/lang/String;Ll/tfs;)V
    .locals 1

    .line 1
    const-string v0, "e_follow"

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/tfs;->j()Ljava/util/Map;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {v0, p0, p1}, Ll/i4g0;->s(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static d(Ljava/lang/String;Ll/tfs;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v0, v0, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v0, v0, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Landroid/app/Activity;

    .line 26
    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    instance-of v1, v0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;

    .line 30
    .line 31
    if-eqz v1, :cond_0

    .line 32
    .line 33
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;

    .line 34
    .line 35
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    sget-object v1, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 40
    .line 41
    if-ne v0, v1, :cond_0

    .line 42
    .line 43
    const-string v0, "e_follow"

    .line 44
    .line 45
    invoke-virtual {p1}, Ll/tfs;->j()Ljava/util/Map;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-static {v0, p0, p1}, Ll/i4g0;->y(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 50
    .line 51
    .line 52
    :cond_0
    return-void
.end method

.method public static e(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Ll/zod;)V
    .locals 2

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->isErrorMessage:Z

    .line 4
    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->extInfo:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string v1, "otherFollowAnchor"

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->followType:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->extInfo:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;

    .line 23
    .line 24
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->followUserId:Ljava/lang/String;

    .line 25
    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 29
    .line 30
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-nez v0, :cond_1

    .line 39
    .line 40
    invoke-virtual {p1}, Ll/zod;->e()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-static {}, Ll/tfs;->k()Ll/tfs$a;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v1, p0, p1}, Ll/tfs$a;->c(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Ll/zod;)Ll/tfs$a;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p0}, Ll/tfs$a;->a()Ll/tfs;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-static {v0, p0}, Ll/afu;->d(Ljava/lang/String;Ll/tfs;)V

    .line 57
    .line 58
    .line 59
    :cond_1
    :goto_0
    return-void
.end method

.method public static f(Ll/ljt;Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ll/q4f;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/q4f;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->USER_BEHAVIOR_COMPLEMENT:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 7
    .line 8
    iput-object v1, v0, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 9
    .line 10
    const-string v1, "e_user_live_room_swipe"

    .line 11
    .line 12
    iput-object v1, v0, Ll/q4f;->s:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/ljt;->a()Lorg/json/JSONObject;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    iput-object p0, v0, Ll/q4f;->w:Lorg/json/JSONObject;

    .line 19
    .line 20
    iput-object p1, v0, Ll/q4f;->n:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {v0}, Ll/i4g0;->m(Ll/q4f;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static g(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Z)Ljava/lang/String;
    .locals 0

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const-string p0, ""

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    if-eqz p1, :cond_2

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->isVoiceLive()Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    const-string p0, "p_anchor_audio_room"

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_1
    const-string p0, "p_anchor_live_room"

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->isVoiceLive()Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-eqz p0, :cond_3

    .line 25
    .line 26
    const-string p0, "p_user_audio_room"

    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_3
    const-string p0, "p_user_live_room"

    .line 30
    .line 31
    return-object p0
.end method

.method public static h(Ll/kfd0;Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 2
    .line 3
    invoke-static {p0, p1, v0}, Ll/afu;->i(Ll/kfd0;Ljava/lang/String;Ljava/util/Map;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static i(Ll/kfd0;Ljava/lang/String;Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/kfd0;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "*>;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Ll/kfd0;->w(Ljava/util/Map;)Ljava/util/Map;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p1, p0}, Ll/bfu;->e(Ljava/lang/String;Ljava/util/Map;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static j(Ll/kfd0;Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 2
    .line 3
    invoke-static {p0, p1, v0}, Ll/afu;->k(Ll/kfd0;Ljava/lang/String;Ljava/util/Map;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static k(Ll/kfd0;Ljava/lang/String;Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/kfd0;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "*>;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Ll/kfd0;->w(Ljava/util/Map;)Ljava/util/Map;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p1, p0}, Ll/bfu;->f(Ljava/lang/String;Ljava/util/Map;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static l(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveState;)V
    .locals 2

    .line 1
    if-eqz p0, :cond_2

    .line 2
    .line 3
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->isErrorMessage:Z

    .line 4
    .line 5
    if-nez v0, :cond_2

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->extInfo:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;

    .line 8
    .line 9
    if-eqz v0, :cond_2

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->buttonUserInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAtUserInfo;

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    goto :goto_1

    .line 16
    :cond_0
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    const-string v0, "p_user_live_room"

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    const-string v0, "p_user_audio_room"

    .line 32
    .line 33
    :goto_0
    invoke-static {}, Ll/tfs;->k()Ll/tfs$a;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v1, p2}, Ll/tfs$a;->f(Ljava/lang/String;)Ll/tfs$a;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    invoke-virtual {p2, p1}, Ll/tfs$a;->d(Ljava/lang/String;)Ll/tfs$a;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {p1, p3}, Ll/tfs$a;->g(Lcom/p1/mobile/putong/live/base/data/BLiveState;)Ll/tfs$a;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->extInfo:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;

    .line 50
    .line 51
    iget-object p2, p2, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->buttonUserInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAtUserInfo;

    .line 52
    .line 53
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveAtUserInfo;->userId:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {p1, p2}, Ll/tfs$a;->h(Ljava/lang/String;)Ll/tfs$a;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->getVoiceFollowSource()I

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    invoke-static {p0}, Ll/afu;->p(I)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p1, p0}, Ll/tfs$a;->e(Ljava/lang/String;)Ll/tfs$a;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {p0}, Ll/tfs$a;->a()Ll/tfs;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-static {v0, p0}, Ll/afu;->d(Ljava/lang/String;Ll/tfs;)V

    .line 76
    .line 77
    .line 78
    :cond_2
    :goto_1
    return-void
.end method

.method public static m(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Ll/zod;)V
    .locals 3

    .line 1
    if-eqz p0, :cond_2

    .line 2
    .line 3
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->isErrorMessage:Z

    .line 4
    .line 5
    if-nez v0, :cond_2

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->extInfo:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p1}, Ll/zod;->a()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {v1}, Ll/y6s;->b(Ljava/lang/String;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    invoke-static {p0, p1}, Ll/gzl0;->a(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Ll/zod;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    invoke-virtual {p1}, Ll/zod;->e()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-static {}, Ll/tfs;->k()Ll/tfs$a;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {v1, v2}, Ll/tfs$a;->f(Ljava/lang/String;)Ll/tfs$a;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->state:Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 43
    .line 44
    invoke-virtual {v1, v2}, Ll/tfs$a;->g(Lcom/p1/mobile/putong/live/base/data/BLiveState;)Ll/tfs$a;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 49
    .line 50
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {v1, v0}, Ll/tfs$a;->d(Ljava/lang/String;)Ll/tfs$a;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->extInfo:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;

    .line 57
    .line 58
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->followUserId:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ll/tfs$a;->h(Ljava/lang/String;)Ll/tfs$a;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->getVoiceFollowSource()I

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    invoke-static {p0}, Ll/afu;->p(I)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {v0, p0}, Ll/tfs$a;->e(Ljava/lang/String;)Ll/tfs$a;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {p0}, Ll/tfs$a;->a()Ll/tfs;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-static {p1, p0}, Ll/afu;->d(Ljava/lang/String;Ll/tfs;)V

    .line 81
    .line 82
    .line 83
    :cond_2
    :goto_0
    return-void
.end method

.method public static n(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const-string v0, "p_anchor_audio_room"

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const-string v0, "p_user_audio_room"

    .line 17
    .line 18
    :goto_0
    invoke-static {p3}, Ll/afu;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p3

    .line 22
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_1

    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    new-instance v1, Ll/pf60;

    .line 30
    .line 31
    const-string v2, "audio_message_type"

    .line 32
    .line 33
    invoke-direct {v1, v2, p3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    new-instance p3, Ll/pf60;

    .line 37
    .line 38
    const-string v2, "anchorId"

    .line 39
    .line 40
    invoke-direct {p3, v2, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    new-instance p1, Ll/pf60;

    .line 44
    .line 45
    const-string v2, "liveId"

    .line 46
    .line 47
    invoke-direct {p1, v2, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    new-instance p0, Ll/pf60;

    .line 51
    .line 52
    const-string v2, "interact_user_id"

    .line 53
    .line 54
    invoke-direct {p0, v2, p2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    filled-new-array {v1, p3, p1, p0}, [Ll/pf60;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    const-string p1, "e_live_audio_auto_msg"

    .line 62
    .line 63
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public static o(Ll/i6t;Ll/oo2;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7

    .line 1
    const-string v0, "chatReply"

    .line 2
    .line 3
    invoke-virtual {v0, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p3

    .line 19
    if-nez p3, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-static {p4}, Ll/afu;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p3

    .line 26
    invoke-virtual {p1}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 27
    .line 28
    .line 29
    move-result-object p4

    .line 30
    iget-object p4, p4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    :goto_0
    return-void

    .line 39
    :cond_1
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 40
    .line 41
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_2

    .line 50
    .line 51
    const-string v0, "p_anchor_audio_room"

    .line 52
    .line 53
    goto :goto_1

    .line 54
    :cond_2
    const-string v0, "p_user_audio_room"

    .line 55
    .line 56
    :goto_1
    new-instance v1, Ll/pf60;

    .line 57
    .line 58
    const-string v2, "audio_message_type"

    .line 59
    .line 60
    invoke-direct {v1, v2, p3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 61
    .line 62
    .line 63
    new-instance v2, Ll/pf60;

    .line 64
    .line 65
    const-string p3, "anchorId"

    .line 66
    .line 67
    invoke-direct {v2, p3, p4}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 68
    .line 69
    .line 70
    new-instance v3, Ll/pf60;

    .line 71
    .line 72
    const-string p3, "liveId"

    .line 73
    .line 74
    invoke-virtual {p1}, Ll/vp20;->k()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p4

    .line 78
    invoke-direct {v3, p3, p4}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 79
    .line 80
    .line 81
    new-instance v4, Ll/pf60;

    .line 82
    .line 83
    const-string p3, "roomId"

    .line 84
    .line 85
    invoke-virtual {p1}, Ll/vp20;->o()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    invoke-direct {v4, p3, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 90
    .line 91
    .line 92
    new-instance v5, Ll/pf60;

    .line 93
    .line 94
    const-string p1, "user_type"

    .line 95
    .line 96
    invoke-static {p0}, Ll/i9o0;->l(Ll/i6t;)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-direct {v5, p1, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 101
    .line 102
    .line 103
    new-instance v6, Ll/pf60;

    .line 104
    .line 105
    const-string p0, "interact_user_id"

    .line 106
    .line 107
    invoke-direct {v6, p0, p2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 108
    .line 109
    .line 110
    filled-new-array/range {v1 .. v6}, [Ll/pf60;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    const-string p1, "e_live_audio_auto_msg"

    .line 115
    .line 116
    invoke-static {p1, v0, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 117
    .line 118
    .line 119
    return-void
.end method

.method public static p(I)Ljava/lang/String;
    .locals 1

    .line 1
    if-eqz p0, :cond_3

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p0, v0, :cond_2

    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    if-eq p0, v0, :cond_1

    .line 8
    .line 9
    const/4 v0, 0x3

    .line 10
    if-eq p0, v0, :cond_0

    .line 11
    .line 12
    const-string p0, "audio_message"

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_0
    const-string p0, "message_match_condition_someone_follow_anchor"

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_1
    const-string p0, "message_match_condition_send_gift"

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_2
    const-string p0, "message_match_condition_voice_call"

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_3
    const-string p0, "message_match_condition_stay_duration"

    .line 25
    .line 26
    return-object p0
.end method
