.class public Ll/st10;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/oo2;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Ll/kcg0;

.field public j:Ll/kcg0;

.field public k:Ll/kcg0;

.field public l:Ll/zt10;

.field public m:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/multiPkPlaying/MultiPkTimerView;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/wt10;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Ll/wt10;-><init>(Ll/dum;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 10
    .line 11
    .line 12
    new-instance v0, Ll/zt10;

    .line 13
    .line 14
    invoke-direct {v0, p1, p2}, Ll/zt10;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/multiPkPlaying/MultiPkTimerView;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    check-cast p1, Ll/zt10;

    .line 22
    .line 23
    iput-object p1, p0, Ll/st10;->l:Ll/zt10;

    .line 24
    .line 25
    return-void
.end method

.method public static synthetic J3(Ll/st10;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkInviteAccepted;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/st10;->o4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkInviteAccepted;)V

    return-void
.end method

.method public static synthetic K3(Ll/st10;Ll/ss10;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/st10;->f4(Ll/ss10;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic L3(Ll/st10;Ll/at10;)Ljava/util/List;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/st10;->h4(Ll/at10;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic M3(Ll/st10;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPoints;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/st10;->t4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPoints;)V

    return-void
.end method

.method public static synthetic N3(Ll/st10;Ll/ugd0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/st10;->m4(Ll/ugd0;)V

    return-void
.end method

.method public static synthetic O3(Ll/st10;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkAnimation;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/st10;->p4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkAnimation;)V

    return-void
.end method

.method public static synthetic P3(Ll/st10;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/st10;->l4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic R3(Ll/st10;Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkDetail;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/st10;->i4(Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkDetail;)V

    return-void
.end method

.method public static synthetic S3(Ll/st10;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkStageChange;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/st10;->s4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkStageChange;)V

    return-void
.end method

.method public static synthetic T3(Ll/st10;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkInviteRejected;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/st10;->q4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkInviteRejected;)V

    return-void
.end method

.method public static synthetic U3(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPlayer;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPlayer;->getRole()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "player"

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic V3(Ll/st10;Ll/ts10;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/st10;->g4(Ll/ts10;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic W3(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPlayer;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPlayer;->getUserId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPlayer;->getRole()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string p1, "player"

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method public static synthetic X3(Ll/st10;Ljava/lang/String;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/st10;->j4(Ljava/lang/String;Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic Y3(Ll/st10;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkInviteNotify;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/st10;->r4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkInviteNotify;)V

    return-void
.end method

.method public static synthetic Z3(Ll/st10;Ljava/lang/String;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/st10;->k4(Ljava/lang/String;Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic a4(Ll/st10;Ll/rs10;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/st10;->e4(Ll/rs10;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v0, v0, Ll/aj1;->h1:Lrx/subjects/b;

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/bt10;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/bt10;-><init>(Ll/st10;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iget-object v0, v0, Ll/aj1;->g1:Lrx/subjects/b;

    .line 39
    .line 40
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    new-instance v1, Ll/jt10;

    .line 45
    .line 46
    invoke-direct {v1, p0}, Ll/jt10;-><init>(Ll/st10;)V

    .line 47
    .line 48
    .line 49
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    iget-object v0, v0, Ll/aj1;->c1:Lrx/subjects/b;

    .line 65
    .line 66
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    new-instance v1, Ll/kt10;

    .line 71
    .line 72
    invoke-direct {v1, p0}, Ll/kt10;-><init>(Ll/st10;)V

    .line 73
    .line 74
    .line 75
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    iget-object v0, v0, Ll/aj1;->e1:Lrx/subjects/b;

    .line 91
    .line 92
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    new-instance v1, Ll/lt10;

    .line 97
    .line 98
    invoke-direct {v1, p0}, Ll/lt10;-><init>(Ll/st10;)V

    .line 99
    .line 100
    .line 101
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 106
    .line 107
    .line 108
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    iget-object v0, v0, Ll/aj1;->d1:Lrx/subjects/b;

    .line 117
    .line 118
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    new-instance v1, Ll/mt10;

    .line 123
    .line 124
    invoke-direct {v1, p0}, Ll/mt10;-><init>(Ll/st10;)V

    .line 125
    .line 126
    .line 127
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 132
    .line 133
    .line 134
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    iget-object v0, v0, Ll/aj1;->f1:Lrx/subjects/b;

    .line 143
    .line 144
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    new-instance v1, Ll/nt10;

    .line 149
    .line 150
    invoke-direct {v1, p0}, Ll/nt10;-><init>(Ll/st10;)V

    .line 151
    .line 152
    .line 153
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 154
    .line 155
    .line 156
    move-result-object v1

    .line 157
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 158
    .line 159
    .line 160
    new-instance v0, Ll/ot10;

    .line 161
    .line 162
    invoke-direct {v0, p0}, Ll/ot10;-><init>(Ll/st10;)V

    .line 163
    .line 164
    .line 165
    const-class v1, Ll/rs10;

    .line 166
    .line 167
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 168
    .line 169
    .line 170
    new-instance v0, Ll/pt10;

    .line 171
    .line 172
    invoke-direct {v0, p0}, Ll/pt10;-><init>(Ll/st10;)V

    .line 173
    .line 174
    .line 175
    const-class v1, Ll/ss10;

    .line 176
    .line 177
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 178
    .line 179
    .line 180
    new-instance v0, Ll/qt10;

    .line 181
    .line 182
    invoke-direct {v0, p0}, Ll/qt10;-><init>(Ll/st10;)V

    .line 183
    .line 184
    .line 185
    const-class v1, Ll/ts10;

    .line 186
    .line 187
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 188
    .line 189
    .line 190
    new-instance v0, Ll/rt10;

    .line 191
    .line 192
    invoke-direct {v0, p0}, Ll/rt10;-><init>(Ll/st10;)V

    .line 193
    .line 194
    .line 195
    const-class v1, Ll/at10;

    .line 196
    .line 197
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 198
    .line 199
    .line 200
    return-void
.end method

.method public final b4(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->s6(Ljava/lang/String;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    new-instance v0, Ll/ft10;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/ft10;-><init>(Ll/st10;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v0}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final c4()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPlayer;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/st10;->m:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;->getPlayersList()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/st10;->m:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;->getPlayersList()Ljava/util/List;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    new-instance v0, Ll/dt10;

    .line 20
    .line 21
    invoke-direct {v0}, Ll/dt10;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-static {p0, v0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0

    .line 29
    :cond_0
    new-instance p0, Ljava/util/ArrayList;

    .line 30
    .line 31
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 32
    .line 33
    .line 34
    return-object p0
.end method

.method public d4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;->getPlayersList()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;->getPlayersList()Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance p1, Ll/gt10;

    .line 16
    .line 17
    invoke-direct {p1, p2}, Ll/gt10;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-static {p0, p1}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public final synthetic e4(Ll/rs10;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/st10;->m:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;->getId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const-string p0, ""

    .line 11
    .line 12
    return-object p0
.end method

.method public final synthetic f4(Ll/ss10;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/st10;->m:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p1, p1, Ll/ss10;->c:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0, v0, p1}, Ll/st10;->d4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public final synthetic g4(Ll/ts10;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/st10;->m:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;

    .line 2
    .line 3
    invoke-static {p0}, Ll/bu10;->c(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;)Z

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

.method public final synthetic h4(Ll/at10;)Ljava/util/List;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/st10;->c4()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic i4(Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkDetail;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-static {p1}, Ll/bu10;->e(Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkDetail;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/st10;->m:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;

    .line 9
    .line 10
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkDetail;->stage:Ljava/lang/String;

    .line 11
    .line 12
    const-string v1, "playing"

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->MultiPkEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$MultiPkEventGroup;

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$MultiPkEventGroup;->multiPkOnStart()Ll/v3f$d;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iget-object v0, p0, Ll/st10;->m:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;

    .line 31
    .line 32
    invoke-virtual {p1, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Ll/st10;->m:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Ll/st10;->w4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkDetail;->stage:Ljava/lang/String;

    .line 42
    .line 43
    const-string v0, "punishing"

    .line 44
    .line 45
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-eqz p1, :cond_2

    .line 50
    .line 51
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->MultiPkEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$MultiPkEventGroup;

    .line 56
    .line 57
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$MultiPkEventGroup;->multiPkOnPunishing()Ll/v3f$d;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    iget-object v0, p0, Ll/st10;->m:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;

    .line 62
    .line 63
    invoke-virtual {p1, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 64
    .line 65
    .line 66
    iget-object p1, p0, Ll/st10;->m:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;

    .line 67
    .line 68
    invoke-virtual {p0, p1}, Ll/st10;->w4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;)V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_2
    const/4 p1, 0x0

    .line 73
    iput-object p1, p0, Ll/st10;->m:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;

    .line 74
    .line 75
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->MultiPkEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$MultiPkEventGroup;

    .line 80
    .line 81
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$MultiPkEventGroup;->multiPkOnEnd()Ll/v3f$c;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public final synthetic j4(Ljava/lang/String;Ljava/lang/Long;)V
    .locals 4

    .line 1
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x3

    .line 6
    .line 7
    cmp-long p2, v0, v2

    .line 8
    .line 9
    if-nez p2, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/st10;->b4(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final synthetic k4(Ljava/lang/String;Ljava/lang/Long;)V
    .locals 4

    .line 1
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x3

    .line 6
    .line 7
    cmp-long p2, v0, v2

    .line 8
    .line 9
    if-nez p2, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/st10;->b4(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final synthetic l4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/st10;->x4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic m4(Ll/ugd0;)V
    .locals 1

    .line 1
    iget-object p1, p1, Ll/mr2;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 2
    .line 3
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLive;->pkInfo:Lcom/p1/mobile/putong/live/base/data/BLivePkInfo;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkInfo;->ongoingMultiId:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLive;->pkInfo:Lcom/p1/mobile/putong/live/base/data/BLivePkInfo;

    .line 20
    .line 21
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkInfo;->ongoingMultiId:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Ll/st10;->b4(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public final n4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;)V
    .locals 1

    .line 1
    invoke-static {p1}, Ll/bu10;->b(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;->getId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0, p1}, Ll/st10;->v4(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-static {p1}, Ll/bu10;->d(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;->getId()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p0, p1}, Ll/st10;->u4(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void
.end method

.method public final o4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkInviteAccepted;)V
    .locals 0

    .line 1
    const-string p0, "\u4e3b\u64ad\u5747\u63a5\u53d7\u4e86\u4f60\u7684\u9080\u8bf7\uff0cPK\u91cd\u65b0\u5f00\u59cb\u3002"

    .line 2
    .line 3
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final p4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkAnimation;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->MultiPkEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$MultiPkEventGroup;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$MultiPkEventGroup;->multiPkOnPlayEffect()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final q4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkInviteRejected;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkInviteRejected;->getRejectUser()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPlayer;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    new-instance p0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkInviteRejected;->getRejectUser()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPlayer;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPlayer;->getUserName()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string p1, "\u62d2\u7edd \u53d1\u8d77\u591a\u4ebaPK\u5931\u8d25"

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public final r4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkInviteNotify;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->MultiPkEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$MultiPkEventGroup;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$MultiPkEventGroup;->multiPkOnRestartRequest()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final s4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkStageChange;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkStageChange;->hasMultiPk()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_4

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkStageChange;->getMultiPk()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Ll/st10;->m:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;->getToast()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-nez p1, :cond_0

    .line 22
    .line 23
    iget-object p1, p0, Ll/st10;->m:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;

    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;->getToast()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-static {p1}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    iget-object p1, p0, Ll/st10;->m:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;

    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;->getAnimationUrl()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-nez p1, :cond_1

    .line 43
    .line 44
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->MultiPkEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$MultiPkEventGroup;

    .line 49
    .line 50
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$MultiPkEventGroup;->multiPkOnPlayEffect()Ll/v3f$d;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkAnimation;->newBuilder()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkAnimation$Builder;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    iget-object v1, p0, Ll/st10;->m:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;

    .line 59
    .line 60
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;->getAnimationUrl()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {v0, v1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkAnimation$Builder;->setAnimationUrl(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkAnimation$Builder;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkAnimation;

    .line 73
    .line 74
    invoke-virtual {p1, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 75
    .line 76
    .line 77
    :cond_1
    iget-object p1, p0, Ll/st10;->m:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;

    .line 78
    .line 79
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;->getStage()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 84
    .line 85
    .line 86
    const-string v0, "punishing"

    .line 87
    .line 88
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-nez v0, :cond_3

    .line 93
    .line 94
    const-string v0, "playing"

    .line 95
    .line 96
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    move-result p1

    .line 100
    if-nez p1, :cond_2

    .line 101
    .line 102
    iget-object p1, p0, Ll/st10;->j:Ll/kcg0;

    .line 103
    .line 104
    invoke-static {p1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 105
    .line 106
    .line 107
    const/4 p1, 0x0

    .line 108
    iput-object p1, p0, Ll/st10;->m:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;

    .line 109
    .line 110
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->MultiPkEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$MultiPkEventGroup;

    .line 115
    .line 116
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$MultiPkEventGroup;->multiPkOnEnd()Ll/v3f$c;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 121
    .line 122
    .line 123
    return-void

    .line 124
    :cond_2
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->MultiPkEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$MultiPkEventGroup;

    .line 129
    .line 130
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$MultiPkEventGroup;->multiPkOnStart()Ll/v3f$d;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    iget-object v0, p0, Ll/st10;->m:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;

    .line 135
    .line 136
    invoke-virtual {p1, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 137
    .line 138
    .line 139
    iget-object p1, p0, Ll/st10;->m:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;

    .line 140
    .line 141
    invoke-virtual {p0, p1}, Ll/st10;->w4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;)V

    .line 142
    .line 143
    .line 144
    return-void

    .line 145
    :cond_3
    iget-object p1, p0, Ll/st10;->i:Ll/kcg0;

    .line 146
    .line 147
    invoke-static {p1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->MultiPkEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$MultiPkEventGroup;

    .line 155
    .line 156
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$MultiPkEventGroup;->multiPkOnPunishing()Ll/v3f$d;

    .line 157
    .line 158
    .line 159
    move-result-object p1

    .line 160
    iget-object v0, p0, Ll/st10;->m:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;

    .line 161
    .line 162
    invoke-virtual {p1, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 163
    .line 164
    .line 165
    iget-object p1, p0, Ll/st10;->m:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;

    .line 166
    .line 167
    invoke-virtual {p0, p1}, Ll/st10;->w4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;)V

    .line 168
    .line 169
    .line 170
    :cond_4
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
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->h5(Ljava/lang/String;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/ct10;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/ct10;-><init>(Ll/st10;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final t4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPoints;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->MultiPkEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$MultiPkEventGroup;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$MultiPkEventGroup;->multiPkOnUpdatePoints()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final u4(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/oo2;->i2(Ljava/util/concurrent/TimeUnit;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Ll/i6t;->H3(Lrx/c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {p0, v0, v1}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const/4 v1, 0x3

    .line 21
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Ll/it10;

    .line 26
    .line 27
    invoke-direct {v1, p0, p1}, Ll/it10;-><init>(Ll/st10;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {v0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iput-object p1, p0, Ll/st10;->j:Ll/kcg0;

    .line 39
    .line 40
    return-void
.end method

.method public final v4(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/oo2;->i2(Ljava/util/concurrent/TimeUnit;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Ll/i6t;->H3(Lrx/c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {p0, v0, v1}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const/4 v1, 0x3

    .line 21
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Ll/ht10;

    .line 26
    .line 27
    invoke-direct {v1, p0, p1}, Ll/ht10;-><init>(Ll/st10;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {v0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iput-object p1, p0, Ll/st10;->i:Ll/kcg0;

    .line 39
    .line 40
    return-void
.end method

.method public final w4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/st10;->k:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ll/oo2;->i2(Ljava/util/concurrent/TimeUnit;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Ll/i6t;->H3(Lrx/c;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/et10;

    .line 21
    .line 22
    invoke-direct {v1, p0, p1}, Ll/et10;-><init>(Ll/st10;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {v0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iput-object p1, p0, Ll/st10;->k:Ll/kcg0;

    .line 34
    .line 35
    return-void
.end method

.method public final x4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;)V
    .locals 7

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_1

    .line 4
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;->getStartTs()J

    .line 10
    .line 11
    .line 12
    move-result-wide v1

    .line 13
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, ""

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {}, Ll/pzi0;->o()J

    .line 26
    .line 27
    .line 28
    move-result-wide v1

    .line 29
    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 30
    .line 31
    .line 32
    move-result-wide v3

    .line 33
    const-wide/16 v5, 0x3e8

    .line 34
    .line 35
    mul-long/2addr v3, v5

    .line 36
    sub-long/2addr v1, v3

    .line 37
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;->getDuration()I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    int-to-long v3, v0

    .line 42
    div-long/2addr v1, v5

    .line 43
    sub-long/2addr v3, v1

    .line 44
    long-to-int v0, v3

    .line 45
    if-gez v0, :cond_1

    .line 46
    .line 47
    iget-object v1, p0, Ll/st10;->k:Ll/kcg0;

    .line 48
    .line 49
    invoke-static {v1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 50
    .line 51
    .line 52
    iget-object v1, p0, Ll/st10;->l:Ll/zt10;

    .line 53
    .line 54
    iget-object v1, v1, Ll/zt10;->i:Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/multiPkPlaying/MultiPkTimerView;

    .line 55
    .line 56
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/multiPkPlaying/MultiPkTimerView;->j:Landroid/widget/TextView;

    .line 57
    .line 58
    const-string v2, "00:00"

    .line 59
    .line 60
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0, p1}, Ll/st10;->n4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;)V

    .line 64
    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_1
    iget-object v1, p0, Ll/st10;->l:Ll/zt10;

    .line 68
    .line 69
    invoke-static {p1}, Ll/bu10;->d(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;)Z

    .line 70
    .line 71
    .line 72
    move-result v2

    .line 73
    invoke-virtual {v1, v0, v2}, Ll/zt10;->P3(IZ)V

    .line 74
    .line 75
    .line 76
    :goto_0
    invoke-static {p1}, Ll/bu10;->b(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;)Z

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    if-eqz p1, :cond_2

    .line 81
    .line 82
    const/16 p1, 0xa

    .line 83
    .line 84
    if-gt v0, p1, :cond_2

    .line 85
    .line 86
    iget-object p0, p0, Ll/st10;->l:Ll/zt10;

    .line 87
    .line 88
    iget-object p0, p0, Ll/zt10;->i:Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/multiPkPlaying/MultiPkTimerView;

    .line 89
    .line 90
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/multiPkPlaying/MultiPkTimerView;->k0(I)V

    .line 91
    .line 92
    .line 93
    :cond_2
    :goto_1
    return-void
.end method
