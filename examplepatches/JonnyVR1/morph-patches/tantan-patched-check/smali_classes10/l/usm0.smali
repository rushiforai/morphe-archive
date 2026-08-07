.class public Ll/usm0;
.super Ll/m1m0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/rwn0;",
        ">",
        "Ll/m1m0<",
        "TD;",
        "Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMembersView;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/m1m0;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d4(Ll/usm0;Ll/nfn0;)Lkotlin/Pair;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/usm0;->f4(Ll/nfn0;)Lkotlin/Pair;

    move-result-object p0

    return-object p0
.end method

.method private f4(Ll/nfn0;)Lkotlin/Pair;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nfn0;",
            ")",
            "Lkotlin/Pair<",
            "[I",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMembersView;

    .line 4
    .line 5
    iget-object v1, p1, Ll/nfn0;->d:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMembersView;->w0(Ljava/lang/String;)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Ll/rwn0;

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Ll/hrk0;->r()Ll/ado0;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object p1, p1, Ll/nfn0;->d:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v0, p1}, Ll/ado0;->C(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    if-eqz p1, :cond_0

    .line 36
    .line 37
    new-instance p1, Lkotlin/Pair;

    .line 38
    .line 39
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 40
    .line 41
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMembersView;

    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMembersView;->g:Lv/VText;

    .line 44
    .line 45
    invoke-static {p0}, Ll/i0k;->b(Landroid/view/View;)[I

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    const/high16 v0, 0x42480000    # 50.0f

    .line 50
    .line 51
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-direct {p1, p0, v0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    return-object p1

    .line 63
    :cond_0
    new-instance p0, Lkotlin/Pair;

    .line 64
    .line 65
    const/4 p1, 0x2

    .line 66
    new-array p1, p1, [I

    .line 67
    .line 68
    const/4 v0, 0x0

    .line 69
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-direct {p0, p1, v0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 74
    .line 75
    .line 76
    return-object p0

    .line 77
    :cond_1
    new-instance p0, Lkotlin/Pair;

    .line 78
    .line 79
    iget-object p1, v0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->e:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 80
    .line 81
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->getRealAvatarView()Lcom/p1/mobile/putong/live/livingroom/common/avatar/MysteryAvatarView;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-static {p1}, Ll/i0k;->b(Landroid/view/View;)[I

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMemberItemView;->e:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 90
    .line 91
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->getRealAvatarView()Lcom/p1/mobile/putong/live/livingroom/common/avatar/MysteryAvatarView;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-direct {p0, p1, v0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 104
    .line 105
    .line 106
    return-object p0
.end method


# virtual methods
.method public N1(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMembersView;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMembersView;->N1(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public U3(Ll/nsv;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nsv<",
            "Ll/h64;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMembersView;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMembersView;->I0(Ll/nsv;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public V1(Ll/nsv;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nsv<",
            "Ll/h64;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMembersView;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMembersView;->L0(Ll/nsv;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public V3(Ll/nsv;Ll/nsv;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;ZLjava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nsv<",
            "Ll/h64;",
            ">;",
            "Ll/nsv<",
            "Ll/h64;",
            ">;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;",
            "Z",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ll/rwn0;

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/rwn0;->P2()Ll/hrk0;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1}, Ll/hrk0;->r()Ll/ado0;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMembersView;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMembersView;->setData(Ll/ado0;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public W3(J)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMembersView;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMembersView;->setMemberCount(J)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public X3(Ll/ado0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMembersView;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMembersView;->setData(Ll/ado0;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public e4(Ljava/lang/String;)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/rwn0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto/16 :goto_3

    .line 14
    .line 15
    :cond_0
    const-string v0, "guideGoCallUser"

    .line 16
    .line 17
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_4

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Ll/rwn0;

    .line 28
    .line 29
    invoke-virtual {p1}, Ll/rwn0;->Y2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-static {p1}, Ll/guk0;->h(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-nez p1, :cond_2

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    check-cast p1, Ll/rwn0;

    .line 44
    .line 45
    invoke-virtual {p1}, Ll/rwn0;->p()Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-eqz p1, :cond_1

    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;

    .line 57
    .line 58
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;->callApplyEvent()Ll/v3f$d;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    new-instance v0, Ll/bzm0;

    .line 63
    .line 64
    invoke-direct {v0}, Ll/bzm0;-><init>()V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p1, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 68
    .line 69
    .line 70
    const-string p1, "apply"

    .line 71
    .line 72
    :goto_0
    move-object v3, p1

    .line 73
    goto :goto_2

    .line 74
    :cond_2
    :goto_1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->MemberManagerEvent:Lcom/tantan/live/eventbus/LiveEventBus$MemberManagerEvent;

    .line 79
    .line 80
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$MemberManagerEvent;->showMemberManagerDialog()Ll/v3f$d;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    const/4 v0, 0x0

    .line 85
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    invoke-virtual {p1, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 90
    .line 91
    .line 92
    const-string p1, "invite"

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :goto_2
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    check-cast p1, Ll/rwn0;

    .line 100
    .line 101
    invoke-virtual {p1}, Ll/rwn0;->P2()Ll/hrk0;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    invoke-virtual {p1}, Ll/hrk0;->r()Ll/ado0;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 110
    .line 111
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-virtual {p1, v0}, Ll/ado0;->G(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    if-eqz p1, :cond_3

    .line 120
    .line 121
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    check-cast v0, Ll/rwn0;

    .line 126
    .line 127
    invoke-virtual {v0}, Ll/rwn0;->p()Z

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    check-cast v1, Ll/rwn0;

    .line 136
    .line 137
    invoke-virtual {v1}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 138
    .line 139
    .line 140
    move-result-object v1

    .line 141
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 142
    .line 143
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 144
    .line 145
    .line 146
    move-result-object v2

    .line 147
    check-cast v2, Ll/rwn0;

    .line 148
    .line 149
    invoke-virtual {v2}, Ll/vp20;->k()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v2

    .line 153
    iget-boolean v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->isManager:Z

    .line 154
    .line 155
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    check-cast p0, Ll/rwn0;

    .line 160
    .line 161
    invoke-virtual {p0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    iget-object v5, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->template:Ljava/lang/String;

    .line 166
    .line 167
    invoke-static/range {v0 .. v5}, Ll/jkp0;->d(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V

    .line 168
    .line 169
    .line 170
    :cond_3
    :goto_3
    return-void

    .line 171
    :cond_4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    check-cast v0, Ll/rwn0;

    .line 176
    .line 177
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 182
    .line 183
    invoke-static {p0, v0, p1}, Ll/ydn0;->k(Ll/i6t;Ljava/lang/String;Ljava/lang/String;)V

    .line 184
    .line 185
    .line 186
    return-void
.end method

.method public g4()V
    .locals 6

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/rwn0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/rwn0;->p()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const-string v0, "anchor"

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Ll/rwn0;

    .line 21
    .line 22
    invoke-virtual {v0}, Ll/rwn0;->Y2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {v0}, Ll/guk0;->h(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    const-string v0, "audience_voicechat"

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    const-string v0, "audience"

    .line 36
    .line 37
    :goto_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    check-cast v1, Ll/rwn0;

    .line 42
    .line 43
    invoke-virtual {v1}, Ll/rwn0;->p()Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-eqz v1, :cond_2

    .line 48
    .line 49
    const-string v1, "p_anchor_audio_room"

    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_2
    const-string v1, "p_user_audio_room"

    .line 53
    .line 54
    :goto_1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    check-cast v2, Ll/rwn0;

    .line 59
    .line 60
    invoke-virtual {v2}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 65
    .line 66
    const-string v3, "anchorId"

    .line 67
    .line 68
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    check-cast v3, Ll/rwn0;

    .line 77
    .line 78
    invoke-virtual {v3}, Ll/vp20;->k()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    const-string v4, "liveId"

    .line 83
    .line 84
    invoke-static {v4, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    const-string v4, "user_type"

    .line 89
    .line 90
    invoke-static {v4, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    iget-object v4, p0, Ll/xzs;->e:Ll/dum;

    .line 95
    .line 96
    invoke-static {v4}, Ll/f2m0;->c(Ll/dum;)Z

    .line 97
    .line 98
    .line 99
    move-result v4

    .line 100
    if-eqz v4, :cond_3

    .line 101
    .line 102
    const-string v4, "karaoke_room"

    .line 103
    .line 104
    goto :goto_2

    .line 105
    :cond_3
    const-string v4, "normal_room"

    .line 106
    .line 107
    :goto_2
    const-string v5, "voice_template"

    .line 108
    .line 109
    invoke-static {v5, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 110
    .line 111
    .line 112
    move-result-object v4

    .line 113
    filled-new-array {v2, v3, v0, v4}, [Ll/pf60;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    const-string v2, "e_audio_shareroom_button"

    .line 118
    .line 119
    invoke-static {v2, v1, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceVirtualLiveEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceVirtualLiveEvent;

    .line 127
    .line 128
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceVirtualLiveEvent;->openSharePanelDialog()Ll/v3f$c;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 133
    .line 134
    .line 135
    return-void
.end method

.method public h4()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->MemberManagerEvent:Lcom/tantan/live/eventbus/LiveEventBus$MemberManagerEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$MemberManagerEvent;->showMemberManagerDialog()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public k0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMembersView;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/rightcall/VoiceMembersView;->K0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/m1m0;->t()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/tsm0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/tsm0;-><init>(Ll/usm0;)V

    .line 7
    .line 8
    .line 9
    const-class v1, Ll/nfn0;

    .line 10
    .line 11
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
