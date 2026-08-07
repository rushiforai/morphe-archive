.class public Ll/d2m0;
.super Ll/s7m0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/s7m0<",
        "Ll/rwn0;",
        ">;"
    }
.end annotation


# instance fields
.field public k:I


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/VirtualVoiceMembersView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/s7m0;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/VirtualVoiceMembersView;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, -0x2

    .line 5
    iput p1, p0, Ll/d2m0;->k:I

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic p4(Ll/d2m0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d2m0;->r4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;)V

    return-void
.end method


# virtual methods
.method public R3(Ll/hrk0$a;)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Ll/m1m0;->R3(Ll/hrk0$a;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Ll/rwn0;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/rwn0;->O2()Ll/szn0;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/szn0;->e()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->voiceRoomTagInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    instance-of v1, v1, Ll/jqm0;

    .line 25
    .line 26
    if-nez v1, :cond_0

    .line 27
    .line 28
    goto :goto_1

    .line 29
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    check-cast v1, Ll/jqm0;

    .line 34
    .line 35
    invoke-virtual {v1}, Ll/jqm0;->b4()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->getFocusUser()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    iget p1, p1, Ll/hrk0$a;->b:I

    .line 44
    .line 45
    const/4 v3, 0x1

    .line 46
    if-ne p1, v3, :cond_5

    .line 47
    .line 48
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/view/SayHiBubbleView;->getGreetedToUserId()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-static {v2, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-nez p1, :cond_5

    .line 57
    .line 58
    invoke-virtual {v1}, Ll/jqm0;->b4()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->consumeFocusUserLeftToast()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    if-eqz v1, :cond_1

    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    check-cast v1, Ll/rwn0;

    .line 78
    .line 79
    invoke-virtual {v1}, Ll/rwn0;->P2()Ll/hrk0;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    invoke-virtual {v1}, Ll/hrk0;->r()Ll/ado0;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    invoke-virtual {v1, v2}, Ll/ado0;->G(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result v3

    .line 95
    if-eqz v3, :cond_2

    .line 96
    .line 97
    if-eqz v0, :cond_2

    .line 98
    .line 99
    iget-object p1, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 100
    .line 101
    new-instance v1, Ll/c2m0;

    .line 102
    .line 103
    invoke-direct {v1, p0, v0}, Ll/c2m0;-><init>(Ll/d2m0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;)V

    .line 104
    .line 105
    .line 106
    invoke-static {p1, v1}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 107
    .line 108
    .line 109
    goto :goto_0

    .line 110
    :cond_2
    if-nez v1, :cond_3

    .line 111
    .line 112
    const-string p1, "\u4f60\u7684\u670b\u53cb\u521a\u521a\u79bb\u5f00\u4e86\u623f\u95f4"

    .line 113
    .line 114
    invoke-static {p1}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_3
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 119
    .line 120
    .line 121
    move-result v1

    .line 122
    if-nez v1, :cond_4

    .line 123
    .line 124
    invoke-static {p1}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    :cond_4
    :goto_0
    invoke-static {v2}, Lcom/p1/mobile/putong/live/livingroom/view/SayHiBubbleView;->setGreetedToUserId(Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    :cond_5
    if-eqz v0, :cond_6

    .line 131
    .line 132
    iget-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;->bubble:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTagBubble;

    .line 133
    .line 134
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTagBubble;->fromUserId:Ljava/lang/String;

    .line 135
    .line 136
    invoke-virtual {p0, p1}, Ll/d2m0;->q4(Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    :cond_6
    :goto_1
    return-void
.end method

.method public n()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x2

    .line 5
    iput v0, p0, Ll/d2m0;->k:I

    .line 6
    .line 7
    return-void
.end method

.method public final q4(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/VirtualVoiceMembersView;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/VirtualVoiceMembersView;->p()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget v0, p0, Ll/d2m0;->k:I

    .line 13
    .line 14
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 15
    .line 16
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/VirtualVoiceMembersView;

    .line 17
    .line 18
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/VirtualVoiceMembersView;->q(Ljava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-ne v0, v1, :cond_2

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Ll/rwn0;

    .line 29
    .line 30
    invoke-virtual {v0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0, p1}, Ll/hrk0;->l(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    if-nez p1, :cond_1

    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_1
    :goto_0
    return-void

    .line 42
    :cond_2
    :goto_1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 43
    .line 44
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/VirtualVoiceMembersView;

    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/VirtualVoiceMembersView;->m()V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public final synthetic r4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;->bubble:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTagBubble;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/d2m0;->s4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTagBubble;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final s4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTagBubble;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTagBubble;->fromUserId:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTagBubble;->userName:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 13
    .line 14
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/VirtualVoiceMembersView;

    .line 15
    .line 16
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/VirtualVoiceMembersView;->x(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTagBubble;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
