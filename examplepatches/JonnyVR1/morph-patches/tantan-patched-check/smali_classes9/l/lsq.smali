.class public Ll/lsq;
.super Ll/o2e0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/o2e0<",
        "Ll/zit;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/o2e0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/hyr;Ll/gae0;Ll/bae0$b;)V
    .locals 0

    .line 1
    check-cast p1, Ll/zit;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/lsq;->b(Ll/zit;Ll/gae0;Ll/bae0$b;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b(Ll/zit;Ll/gae0;Ll/bae0$b;)V
    .locals 4

    .line 1
    const-string p0, "liveId"

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ll/zit;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string p3, "roomId"

    .line 8
    .line 9
    invoke-virtual {p1, p3}, Ll/zit;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p3

    .line 13
    const-string v0, "source"

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Ll/zit;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "liveMode"

    .line 20
    .line 21
    invoke-virtual {p1, v1}, Ll/zit;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    invoke-static {}, Ll/kfd0;->x()Ll/kfd0$a;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    const/4 v2, 0x0

    .line 29
    invoke-virtual {v1, v2}, Ll/kfd0$a;->l(I)Ll/kfd0$a;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v1, v0}, Ll/kfd0$a;->w(Ljava/lang/String;)Ll/kfd0$a;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v1, p0}, Ll/kfd0$a;->r(Ljava/lang/String;)Ll/kfd0$a;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    const-string v2, ""

    .line 42
    .line 43
    invoke-virtual {v1, v2}, Ll/kfd0$a;->s(Ljava/lang/String;)Ll/kfd0$a;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {v1, v2}, Ll/kfd0$a;->A(Ljava/lang/Object;)Ll/kfd0$a;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    const-string v2, "onlive"

    .line 52
    .line 53
    invoke-virtual {v1, v2}, Ll/kfd0$a;->u(Ljava/lang/String;)Ll/kfd0$a;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v1}, Ll/kfd0$a;->a()Ll/kfd0;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    const-string v2, "p_user_live_room"

    .line 62
    .line 63
    invoke-static {v1, v2}, Ll/afu;->h(Ll/kfd0;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    iget-object v1, p1, Ll/hyr;->b:Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {p1, v1}, Ll/zit;->h(Ljava/lang/String;)Z

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    if-eqz p1, :cond_0

    .line 73
    .line 74
    const-string v1, "voice-live"

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_0
    const-string v1, "live"

    .line 78
    .line 79
    :goto_0
    new-instance v2, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 80
    .line 81
    invoke-direct {v2}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;-><init>()V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p2}, Ll/xzs;->E2()Ll/oo2;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    invoke-virtual {v3}, Ll/oo2;->o0()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v3

    .line 92
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->t(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    invoke-virtual {p2}, Ll/xzs;->E2()Ll/oo2;

    .line 97
    .line 98
    .line 99
    move-result-object v3

    .line 100
    invoke-virtual {v3}, Ll/vp20;->k()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v3

    .line 104
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->r(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    invoke-virtual {p2}, Ll/xzs;->E2()Ll/oo2;

    .line 109
    .line 110
    .line 111
    move-result-object v3

    .line 112
    invoke-virtual {v3}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 113
    .line 114
    .line 115
    move-result-object v3

    .line 116
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 117
    .line 118
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 119
    .line 120
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->s(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 121
    .line 122
    .line 123
    move-result-object v2

    .line 124
    invoke-virtual {p2}, Ll/xzs;->E2()Ll/oo2;

    .line 125
    .line 126
    .line 127
    move-result-object v3

    .line 128
    invoke-virtual {v3}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 129
    .line 130
    .line 131
    move-result-object v3

    .line 132
    iget-object v3, v3, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 133
    .line 134
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->q(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 135
    .line 136
    .line 137
    move-result-object v2

    .line 138
    invoke-virtual {v2, p0}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->v(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->w(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 143
    .line 144
    .line 145
    move-result-object p0

    .line 146
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->u(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    if-eqz p1, :cond_1

    .line 151
    .line 152
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;->CHANGE_SOURCE_NO_BACK:Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;

    .line 153
    .line 154
    goto :goto_1

    .line 155
    :cond_1
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;->CHANGE_SOURCE_WITH_BACK:Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;

    .line 156
    .line 157
    :goto_1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->n(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 158
    .line 159
    .line 160
    move-result-object p0

    .line 161
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->p(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->m()Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;

    .line 166
    .line 167
    .line 168
    move-result-object p0

    .line 169
    invoke-virtual {p2}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 170
    .line 171
    .line 172
    move-result-object p1

    .line 173
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->JumpRoomEvent:Lcom/tantan/live/eventbus/LiveEventBus$JumpRoomEvent;

    .line 174
    .line 175
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$JumpRoomEvent;->jumpRoom()Ll/v3f$d;

    .line 176
    .line 177
    .line 178
    move-result-object p1

    .line 179
    invoke-virtual {p1, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 180
    .line 181
    .line 182
    return-void
.end method
