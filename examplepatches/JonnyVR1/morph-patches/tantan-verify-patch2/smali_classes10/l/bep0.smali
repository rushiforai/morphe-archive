.class public Ll/bep0;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ll/rwn0;",
        ">",
        "Ll/i6t<",
        "TT;",
        "Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Z


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "TT;>;",
            "Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic J3(Ll/bep0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bep0;->U3(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic K3(Ll/bep0;Lcom/p1/mobile/putong/live/base/data/BLiveVoice;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bep0;->V3(Lcom/p1/mobile/putong/live/base/data/BLiveVoice;)V

    return-void
.end method

.method public static synthetic L3(Ll/bep0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bep0;->T3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;)V

    return-void
.end method

.method public static synthetic M3(Ll/bep0;Ll/hrk0$a;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/bep0;->P3(Ll/hrk0$a;)V

    return-void
.end method

.method public static synthetic N3(Ll/bep0;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceMemberUpdate;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/bep0;->S3(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceMemberUpdate;)V

    return-void
.end method

.method private P3(Ll/hrk0$a;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "handleDeputyModel:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget p1, p1, Ll/hrk0$a;->b:I

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    const-string v0, "[voice][call]"

    .line 18
    .line 19
    invoke-static {v0, p1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    check-cast p1, Ll/rwn0;

    .line 27
    .line 28
    invoke-virtual {p1}, Ll/rwn0;->P2()Ll/hrk0;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p1}, Ll/hrk0;->r()Ll/ado0;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p0, p1}, Ll/bep0;->X3(Ll/ado0;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method private S3(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceMemberUpdate;)V
    .locals 4

    .line 1
    const-string v0, "[voice][call]"

    .line 2
    .line 3
    const-string v1, "handleMemberUpdate"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceMemberUpdate;->getType()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceMemberUpdate$UpdateType;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sget-object v1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceMemberUpdate$UpdateType;->Count:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceMemberUpdate$UpdateType;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Ll/rwn0;

    .line 25
    .line 26
    invoke-virtual {v0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Ll/hrk0;->r()Ll/ado0;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceMemberUpdate;->getTotal()J

    .line 35
    .line 36
    .line 37
    move-result-wide v1

    .line 38
    invoke-virtual {v0, v1, v2}, Ll/ado0;->U(J)V

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 42
    .line 43
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;

    .line 44
    .line 45
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceMemberUpdate;->getTotal()J

    .line 46
    .line 47
    .line 48
    move-result-wide v0

    .line 49
    long-to-double v0, v0

    .line 50
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;->v(D)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceMemberUpdate;->getType()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceMemberUpdate$UpdateType;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    sget-object v1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceMemberUpdate$UpdateType;->Remove:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceMemberUpdate$UpdateType;

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-eqz v0, :cond_1

    .line 65
    .line 66
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    check-cast v0, Ll/rwn0;

    .line 71
    .line 72
    invoke-virtual {v0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceMemberUpdate;->getMemberId()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-virtual {v0, p1}, Ll/hrk0;->x(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_1
    new-instance v0, Ll/h64;

    .line 85
    .line 86
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceMemberUpdate;->getMemberId()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceMemberUpdate;->getUserMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getName()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceMemberUpdate;->getUserMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 99
    .line 100
    .line 101
    move-result-object v3

    .line 102
    invoke-virtual {v3}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getAvatar()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v3

    .line 106
    invoke-direct {v0, v1, v2, v3}, Ll/h64;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    invoke-static {v0}, Ll/nsv;->f(Ljava/lang/Object;)Ll/nsv;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceMemberUpdate;->getMemberId()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceMemberUpdate;->getUserMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 118
    .line 119
    .line 120
    move-result-object v2

    .line 121
    invoke-static {v2}, Ll/v6o0;->a(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 122
    .line 123
    .line 124
    move-result-object v2

    .line 125
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 126
    .line 127
    .line 128
    move-result-object v3

    .line 129
    check-cast v3, Ll/rwn0;

    .line 130
    .line 131
    invoke-virtual {v3}, Ll/rwn0;->W0()Z

    .line 132
    .line 133
    .line 134
    move-result v3

    .line 135
    invoke-virtual {v0, v1, v2, v3}, Ll/nsv;->c(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;Z)Ll/nsv;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    check-cast v1, Ll/rwn0;

    .line 144
    .line 145
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceMemberUpdate;->getMemberId()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    invoke-static {v1, p1}, Ll/i9o0;->f(Ll/rwn0;Ljava/lang/String;)Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 154
    .line 155
    .line 156
    move-result-object v1

    .line 157
    check-cast v1, Ll/rwn0;

    .line 158
    .line 159
    invoke-virtual {v1}, Ll/rwn0;->P2()Ll/hrk0;

    .line 160
    .line 161
    .line 162
    move-result-object v1

    .line 163
    invoke-virtual {v1, v0, p1}, Ll/hrk0;->g(Ll/nsv;Ljava/lang/String;)V

    .line 164
    .line 165
    .line 166
    :goto_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 167
    .line 168
    .line 169
    move-result-object p1

    .line 170
    check-cast p1, Ll/rwn0;

    .line 171
    .line 172
    invoke-virtual {p1}, Ll/rwn0;->P2()Ll/hrk0;

    .line 173
    .line 174
    .line 175
    move-result-object p1

    .line 176
    invoke-virtual {p1}, Ll/hrk0;->r()Ll/ado0;

    .line 177
    .line 178
    .line 179
    move-result-object p1

    .line 180
    invoke-virtual {p0, p1}, Ll/bep0;->X3(Ll/ado0;)V

    .line 181
    .line 182
    .line 183
    return-void
.end method

.method private Y3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTagBubble;)V
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
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;

    .line 15
    .line 16
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;->q(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTagBubble;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public O3()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;->p()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;->u(Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public R3()V
    .locals 2

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
    invoke-virtual {v0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Ll/rwn0;

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v0}, Ll/y6s;->a(Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-nez v0, :cond_0

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Ll/rwn0;

    .line 40
    .line 41
    invoke-virtual {v0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {v0}, Ll/y6s;->c(Ljava/lang/String;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_1

    .line 52
    .line 53
    :cond_0
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 54
    .line 55
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;

    .line 56
    .line 57
    const/4 v1, 0x1

    .line 58
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;->u(Z)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0}, Ll/bep0;->init()V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    check-cast v0, Ll/rwn0;

    .line 70
    .line 71
    invoke-virtual {v0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 76
    .line 77
    invoke-static {v0}, Ll/y6s;->d(Ljava/lang/String;)Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-eqz v0, :cond_2

    .line 82
    .line 83
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    check-cast v0, Ll/rwn0;

    .line 88
    .line 89
    invoke-virtual {v0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->template:Ljava/lang/String;

    .line 94
    .line 95
    const-string v1, "ktv"

    .line 96
    .line 97
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    if-eqz v0, :cond_2

    .line 102
    .line 103
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 104
    .line 105
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;

    .line 106
    .line 107
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;->n()V

    .line 108
    .line 109
    .line 110
    return-void

    .line 111
    :cond_2
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 112
    .line 113
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;

    .line 114
    .line 115
    const/4 v0, 0x0

    .line 116
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;->u(Z)V

    .line 117
    .line 118
    .line 119
    return-void
.end method

.method public final synthetic T3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;->bubble:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTagBubble;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Ll/bep0;->Y3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTagBubble;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic U3(Ljava/lang/String;)V
    .locals 2

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
    invoke-virtual {v0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0, p1}, Ll/hrk0;->n(Ljava/lang/String;)Ll/h64;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    const-string p0, "\u4f60\u7684\u670b\u53cb\u521a\u521a\u79bb\u5f00\u4e86\u623f\u95f4"

    .line 18
    .line 19
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Ll/rwn0;

    .line 28
    .line 29
    invoke-virtual {p1}, Ll/rwn0;->O2()Ll/szn0;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p1}, Ll/szn0;->e()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->voiceRoomTagInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;

    .line 38
    .line 39
    iget-object v0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 40
    .line 41
    new-instance v1, Ll/aep0;

    .line 42
    .line 43
    invoke-direct {v1, p0, p1}, Ll/aep0;-><init>(Ll/bep0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;)V

    .line 44
    .line 45
    .line 46
    invoke-static {v0, v1}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public final synthetic V3(Lcom/p1/mobile/putong/live/base/data/BLiveVoice;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/bep0;->R3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public W3()V
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

.method public final X3(Ll/ado0;)V
    .locals 2

    .line 1
    const-string v0, "[voice][call]"

    .line 2
    .line 3
    const-string v1, "setDataToView"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/fans/VoiceVirtualFansView;->setData(Ll/ado0;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public Z3()V
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

.method public init()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/bep0;->i:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Ll/bep0;->i:Z

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Ll/rwn0;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/rwn0;->Q2()Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ll/xdp0;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/xdp0;-><init>(Ll/bep0;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Ll/rwn0;

    .line 48
    .line 49
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v0}, Ll/aj1;->c1()Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    new-instance v1, Ll/ydp0;

    .line 62
    .line 63
    invoke-direct {v1, p0}, Ll/ydp0;-><init>(Ll/bep0;)V

    .line 64
    .line 65
    .line 66
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceVirtualLiveEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceVirtualLiveEvent;

    .line 78
    .line 79
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceVirtualLiveEvent;->showSayHiBubble()Ll/v3f$d;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    new-instance v1, Ll/zdp0;

    .line 84
    .line 85
    invoke-direct {v1, p0}, Ll/zdp0;-><init>(Ll/bep0;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0, v0, v1}, Ll/i6t;->h3(Ll/v3f$b;Ll/y20;)V

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/bep0;->O3()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

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
    invoke-virtual {v0}, Ll/szn0;->d()Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/wdp0;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/wdp0;-><init>(Ll/bep0;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    return-void
.end method
