.class public Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;
.super Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveBaseFrag;
.source "SourceFile"


# instance fields
.field public A:Ll/rgd0;

.field public B:Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

.field public z:Ll/ogd0;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveBaseFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic E4(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/android/app/c$a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/android/app/c$a;

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/android/app/c$c;->p:Landroid/os/Bundle;

    .line 8
    .line 9
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;->O4(Landroid/os/Bundle;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public static synthetic M4(Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;->E4(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static N4(Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Landroid/os/Bundle;

    .line 7
    .line 8
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v2, "LIVE_AUDIENCE_START_DATA"

    .line 12
    .line 13
    invoke-virtual {v1, v2, p0}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 17
    .line 18
    .line 19
    return-object v0
.end method

.method private O4(Landroid/os/Bundle;)V
    .locals 7

    .line 1
    const-string v0, "context_square"

    .line 2
    .line 3
    invoke-static {v0}, Ll/r230;->o(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "context_common"

    .line 7
    .line 8
    invoke-static {v0}, Ll/r230;->o(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "context_live_activities"

    .line 12
    .line 13
    invoke-static {v0}, Ll/r230;->o(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "LIVE_AUDIENCE_START_DATA"

    .line 21
    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;->B:Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 31
    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    iget-boolean v0, v0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->fromFW:Z

    .line 35
    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    invoke-static {}, Ll/o5c;->a()Ll/o5c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Ll/o5c;->b()Ll/oo2;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    instance-of v2, v0, Ll/v91;

    .line 47
    .line 48
    if-eqz v2, :cond_0

    .line 49
    .line 50
    move-object v2, v0

    .line 51
    check-cast v2, Ll/v91;

    .line 52
    .line 53
    const/4 v3, 0x1

    .line 54
    invoke-interface {v2, v3}, Ll/v91;->a(Z)V

    .line 55
    .line 56
    .line 57
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;->B:Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 58
    .line 59
    invoke-virtual {v0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    iput-object v3, v2, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->live:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_1
    const/4 v0, 0x0

    .line 67
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;->B:Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 68
    .line 69
    if-nez v2, :cond_2

    .line 70
    .line 71
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    if-eqz v2, :cond_2

    .line 76
    .line 77
    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    check-cast p1, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 82
    .line 83
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;->B:Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 84
    .line 85
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;->B:Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 86
    .line 87
    if-eqz p1, :cond_4

    .line 88
    .line 89
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->live:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 90
    .line 91
    if-nez p1, :cond_3

    .line 92
    .line 93
    goto :goto_1

    .line 94
    :cond_3
    const/4 v1, 0x0

    .line 95
    invoke-static {p1, v1}, Ll/afu;->g(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Z)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;->B:Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 100
    .line 101
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->live:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 102
    .line 103
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 104
    .line 105
    const-string v2, "live_id"

    .line 106
    .line 107
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    const-string v2, "live_network_type"

    .line 112
    .line 113
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->d()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v3

    .line 117
    invoke-static {v2, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 118
    .line 119
    .line 120
    move-result-object v2

    .line 121
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;->B:Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 122
    .line 123
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->live:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 124
    .line 125
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 126
    .line 127
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 128
    .line 129
    const-string v4, "anchorId"

    .line 130
    .line 131
    invoke-static {v4, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 132
    .line 133
    .line 134
    move-result-object v3

    .line 135
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;->B:Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 136
    .line 137
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->category:Ljava/lang/String;

    .line 138
    .line 139
    const-string v5, "liveRecommendCategory"

    .line 140
    .line 141
    invoke-static {v5, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 142
    .line 143
    .line 144
    move-result-object v4

    .line 145
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;->B:Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 146
    .line 147
    iget-object v5, v5, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->source:Ljava/lang/String;

    .line 148
    .line 149
    const-string v6, "live_outside_source"

    .line 150
    .line 151
    invoke-static {v6, v5}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 152
    .line 153
    .line 154
    move-result-object v5

    .line 155
    filled-new-array {v1, v2, v3, v4, v5}, [Ll/pf60;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    const-string v2, "e_live_room_create"

    .line 160
    .line 161
    invoke-static {v2, p1, v1}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 162
    .line 163
    .line 164
    new-instance p1, Ll/ogd0;

    .line 165
    .line 166
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;->B:Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 167
    .line 168
    invoke-direct {p1, p0, v0, v1}, Ll/ogd0;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;Ll/oo2;Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)V

    .line 169
    .line 170
    .line 171
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;->z:Ll/ogd0;

    .line 172
    .line 173
    new-instance p1, Ll/rgd0;

    .line 174
    .line 175
    invoke-direct {p1}, Ll/rgd0;-><init>()V

    .line 176
    .line 177
    .line 178
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;->A:Ll/rgd0;

    .line 179
    .line 180
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;->z:Ll/ogd0;

    .line 181
    .line 182
    invoke-virtual {v0, p1}, Ll/ar2;->C(Ll/iam;)V

    .line 183
    .line 184
    .line 185
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;->z:Ll/ogd0;

    .line 186
    .line 187
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 188
    .line 189
    .line 190
    move-result-object p0

    .line 191
    invoke-virtual {p1, p0}, Ll/ogd0;->H0(Lcom/p1/mobile/android/app/Act;)V

    .line 192
    .line 193
    .line 194
    return-void

    .line 195
    :cond_4
    :goto_1
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->c3:I

    .line 196
    .line 197
    invoke-static {p1}, Ll/o1j0;->n(I)V

    .line 198
    .line 199
    .line 200
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 201
    .line 202
    .line 203
    move-result-object p0

    .line 204
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 205
    .line 206
    .line 207
    return-void
.end method


# virtual methods
.method public P4()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;->z:Ll/ogd0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;->z:Ll/ogd0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/ogd0;->j1()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public Q4()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;->R4()Ll/ogd0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;->R4()Ll/ogd0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/ogd0;->z0()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;->R4()Ll/ogd0;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ll/ogd0;->y0()Ll/x5;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_0

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v1}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-eqz v1, :cond_0

    .line 52
    .line 53
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    return-object p0

    .line 62
    :cond_0
    return-object v0

    .line 63
    :cond_1
    const/4 p0, 0x0

    .line 64
    return-object p0
.end method

.method public R4()Ll/ogd0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;->z:Ll/ogd0;

    .line 2
    .line 3
    return-object p0
.end method

.method public S4()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;->A:Ll/rgd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/rgd0;->p()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public T4(Z)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag$a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;Z)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public U4(Ll/agd0;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;->A:Ll/rgd0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/rgd0;->d:Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->z(Ll/agd0;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public V4(ZZ)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;->A:Ll/rgd0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/rgd0;->w(ZZ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public f4()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->f4()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->lifecycle()Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    new-instance v1, Ll/pfd0;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Ll/pfd0;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;)V

    .line 11
    .line 12
    .line 13
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;->A:Ll/rgd0;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p1, p0}, Ll/rgd0;->n(Lcom/p1/mobile/android/app/Act;)V

    .line 11
    .line 12
    .line 13
    const-string p0, "[live]scroll_view"

    .line 14
    .line 15
    const-string p1, "room init view finished"

    .line 16
    .line 17
    invoke-static {p0, p1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;->A:Ll/rgd0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance p0, Landroid/widget/FrameLayout;

    .line 6
    .line 7
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_0
    invoke-virtual {v0, p1, p2}, Ll/rgd0;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;->A:Ll/rgd0;

    .line 20
    .line 21
    iget-object p2, p2, Ll/rgd0;->d:Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;

    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;->z:Ll/ogd0;

    .line 24
    .line 25
    invoke-virtual {p2, p0, v0}, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->n(Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;Ll/ogd0;)V

    .line 26
    .line 27
    .line 28
    return-object p1
.end method

.method public o()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;->z:Ll/ogd0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;->z:Ll/ogd0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/ogd0;->f1()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method
