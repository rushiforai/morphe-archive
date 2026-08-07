.class public Ll/ogd0;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/rgd0;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

.field public b:Ljava/lang/String;

.field public final c:Ll/ajt;

.field public final d:Ll/bjt;

.field public final e:Ljava/lang/String;

.field public final f:Ll/agd0;

.field public final g:Ll/ojd0;

.field public h:Ll/oo2;

.field public final i:Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

.field public j:Ll/bas;

.field public k:Ll/rvk;

.field public l:J

.field public m:Z

.field public n:Z

.field public o:Ll/u4j;

.field public final p:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;Ll/oo2;Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)V
    .locals 9

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ogd0;->i:Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

    .line 5
    .line 6
    iput-object p2, p0, Ll/ogd0;->h:Ll/oo2;

    .line 7
    .line 8
    iget-object v0, p3, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->live:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 9
    .line 10
    iput-object v0, p0, Ll/ogd0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 11
    .line 12
    iget-object v1, p3, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->category:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v1, p0, Ll/ogd0;->e:Ljava/lang/String;

    .line 15
    .line 16
    iget-object v2, p3, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->traceId:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v2, p0, Ll/ogd0;->b:Ljava/lang/String;

    .line 19
    .line 20
    iget-boolean v2, p3, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->handleEnterRoomResult:Z

    .line 21
    .line 22
    iput-boolean v2, p0, Ll/ogd0;->p:Z

    .line 23
    .line 24
    new-instance v7, Ll/ajt;

    .line 25
    .line 26
    iget-object v2, p3, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->source:Ljava/lang/String;

    .line 27
    .line 28
    invoke-direct {v7, v2}, Ll/ajt;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iput-object v7, p0, Ll/ogd0;->c:Ll/ajt;

    .line 32
    .line 33
    iget-boolean v2, p3, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->showSignInDialog:Z

    .line 34
    .line 35
    invoke-virtual {v7, v2}, Ll/ajt;->t(Z)V

    .line 36
    .line 37
    .line 38
    iget-object v2, p3, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->open:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v7, v2}, Ll/ajt;->q(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->getRecommendCategoryForTrack()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-virtual {v7, v2}, Ll/ajt;->r(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    iget-object v2, p3, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->voiceEnterType:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {v7, v2}, Ll/ajt;->w(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    iget-object v2, p3, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->liveSchema:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {v7, v2}, Ll/ajt;->n(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    iget-boolean v2, p3, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->isOfficialShowAnchor:Z

    .line 61
    .line 62
    invoke-virtual {v7, v2}, Ll/ajt;->p(Z)V

    .line 63
    .line 64
    .line 65
    new-instance v8, Ll/bjt;

    .line 66
    .line 67
    invoke-direct {v8}, Ll/bjt;-><init>()V

    .line 68
    .line 69
    .line 70
    iput-object v8, p0, Ll/ogd0;->d:Ll/bjt;

    .line 71
    .line 72
    new-instance v2, Ll/agd0;

    .line 73
    .line 74
    invoke-direct {v2, p1, v0, v7}, Ll/agd0;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Ll/ajt;)V

    .line 75
    .line 76
    .line 77
    iput-object v2, p0, Ll/ogd0;->f:Ll/agd0;

    .line 78
    .line 79
    new-instance v0, Ll/bas;

    .line 80
    .line 81
    invoke-direct {v0, p1, p0, v7}, Ll/bas;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;Ll/ogd0;Ll/ajt;)V

    .line 82
    .line 83
    .line 84
    iput-object v0, p0, Ll/ogd0;->j:Ll/bas;

    .line 85
    .line 86
    new-instance v0, Ll/rvk;

    .line 87
    .line 88
    invoke-direct {v0}, Ll/rvk;-><init>()V

    .line 89
    .line 90
    .line 91
    iput-object v0, p0, Ll/ogd0;->k:Ll/rvk;

    .line 92
    .line 93
    new-instance v0, Ll/u4j;

    .line 94
    .line 95
    invoke-direct {v0, p1, v1, p3}, Ll/u4j;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)V

    .line 96
    .line 97
    .line 98
    iput-object v0, p0, Ll/ogd0;->o:Ll/u4j;

    .line 99
    .line 100
    new-instance v3, Ll/ojd0;

    .line 101
    .line 102
    move-object v4, p0

    .line 103
    move-object v5, p1

    .line 104
    move-object v6, p3

    .line 105
    invoke-direct/range {v3 .. v8}, Ll/ojd0;-><init>(Ll/ogd0;Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveBaseFrag;Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;Ll/ajt;Ll/bjt;)V

    .line 106
    .line 107
    .line 108
    iput-object v3, v4, Ll/ogd0;->g:Ll/ojd0;

    .line 109
    .line 110
    invoke-virtual {v3, p2}, Ll/ojd0;->m(Ll/oo2;)V

    .line 111
    .line 112
    .line 113
    const-string p0, "[live]push"

    .line 114
    .line 115
    iget-object p1, v7, Ll/ajt;->b:Ljava/lang/String;

    .line 116
    .line 117
    invoke-static {p0, p1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    return-void
.end method

.method public static synthetic e0(Ll/ogd0;Ll/x5;Ll/jsv;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ogd0;->a1(Ll/x5;Ll/jsv;)V

    return-void
.end method

.method public static synthetic f0(Ll/ogd0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ogd0;->d1(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic g0(Ll/ogd0;Ll/ugd0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ogd0;->k1(Ll/ugd0;)V

    return-void
.end method

.method public static synthetic h0(Ll/ogd0;Ll/isv;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ogd0;->b1(Ll/isv;)V

    return-void
.end method

.method public static synthetic i0(Ll/ogd0;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ogd0;->c1(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic j0()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->h()Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->o()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic k0(Ll/ogd0;ZLl/ugd0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ogd0;->Y0(ZLl/ugd0;)V

    return-void
.end method

.method public static synthetic l0(Landroid/net/NetworkInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->j()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic m0(Ll/isv;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/isv;->n()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-lez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static synthetic n0(Ll/ogd0;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ogd0;->W0(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic o0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic p0(Ll/ogd0;Ll/ugd0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ogd0;->X0(Ll/ugd0;)V

    return-void
.end method


# virtual methods
.method public A0()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ogd0;->c:Ll/ajt;

    .line 2
    .line 3
    iget-object p0, p0, Ll/ajt;->b:Ljava/lang/String;

    .line 4
    .line 5
    return-object p0
.end method

.method public B1(ZLcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;ZLcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;)V
    .locals 4

    .line 1
    sget-object v0, Ll/lej0;->INSTANCE:Ll/lej0;

    .line 2
    .line 3
    const-string v1, "live_swipe_in_room_rtc"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/lej0;->d(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/ogd0;->j:Ll/bas;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/bas;->a()V

    .line 11
    .line 12
    .line 13
    if-eqz p4, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0, p4, p2}, Ll/ogd0;->z1(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;)Ll/x5;

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget-object p4, p0, Ll/ogd0;->f:Ll/agd0;

    .line 20
    .line 21
    invoke-virtual {p4}, Ll/agd0;->q()Ll/p5m;

    .line 22
    .line 23
    .line 24
    move-result-object p4

    .line 25
    invoke-interface {p4, p1}, Ll/p5m;->c(Z)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object p4

    .line 29
    iget-object v0, p0, Ll/ogd0;->f:Ll/agd0;

    .line 30
    .line 31
    invoke-virtual {v0}, Ll/agd0;->r()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iget-object v1, p4, Ll/pf60;->a:Ljava/lang/Object;

    .line 36
    .line 37
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 38
    .line 39
    if-nez v1, :cond_1

    .line 40
    .line 41
    goto/16 :goto_3

    .line 42
    .line 43
    :cond_1
    iget-object p4, p4, Ll/pf60;->b:Ljava/lang/Object;

    .line 44
    .line 45
    if-eqz p4, :cond_2

    .line 46
    .line 47
    check-cast p4, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;

    .line 48
    .line 49
    invoke-virtual {p0, p4, p2}, Ll/ogd0;->z1(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;)Ll/x5;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    goto :goto_0

    .line 54
    :cond_2
    new-instance p4, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 55
    .line 56
    invoke-direct {p4}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;-><init>()V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p4, v1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->o(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 60
    .line 61
    .line 62
    move-result-object p4

    .line 63
    iget-object v2, p0, Ll/ogd0;->c:Ll/ajt;

    .line 64
    .line 65
    invoke-virtual {v2}, Ll/ajt;->c()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    invoke-virtual {p4, v2}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->u(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 70
    .line 71
    .line 72
    move-result-object p4

    .line 73
    sget-object v2, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;->USER_SWIPE:Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;

    .line 74
    .line 75
    invoke-virtual {p4, v2}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->n(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 76
    .line 77
    .line 78
    move-result-object p4

    .line 79
    invoke-virtual {p4}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->m()Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;

    .line 80
    .line 81
    .line 82
    move-result-object p4

    .line 83
    invoke-virtual {p0, p4, p2}, Ll/ogd0;->z1(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;)Ll/x5;

    .line 84
    .line 85
    .line 86
    move-result-object p2

    .line 87
    :goto_0
    if-nez p3, :cond_6

    .line 88
    .line 89
    invoke-virtual {p2}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 90
    .line 91
    .line 92
    move-result-object p3

    .line 93
    iget-object p3, p3, Lcom/tantan/live/eventbus/LiveEventBus;->AvatarEvent:Lcom/tantan/live/eventbus/LiveEventBus$AvatarEvent;

    .line 94
    .line 95
    invoke-virtual {p3}, Lcom/tantan/live/eventbus/LiveEventBus$AvatarEvent;->onScrollNext()Ll/v3f$d;

    .line 96
    .line 97
    .line 98
    move-result-object p3

    .line 99
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 100
    .line 101
    .line 102
    move-result-object p4

    .line 103
    iget-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 104
    .line 105
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 106
    .line 107
    invoke-static {p4, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 108
    .line 109
    .line 110
    move-result-object p4

    .line 111
    invoke-virtual {p3, p4}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 112
    .line 113
    .line 114
    if-nez v0, :cond_3

    .line 115
    .line 116
    goto :goto_3

    .line 117
    :cond_3
    invoke-static {}, Ll/ljt;->c()Ll/ljt$a;

    .line 118
    .line 119
    .line 120
    move-result-object p3

    .line 121
    invoke-virtual {p3, v0, v1}, Ll/ljt$a;->m(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Ll/ljt$a;

    .line 122
    .line 123
    .line 124
    move-result-object p3

    .line 125
    iget-object p4, p0, Ll/ogd0;->c:Ll/ajt;

    .line 126
    .line 127
    invoke-virtual {p4}, Ll/ajt;->g()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object p4

    .line 131
    invoke-virtual {p3, p4}, Ll/ljt$a;->q(Ljava/lang/String;)Ll/ljt$a;

    .line 132
    .line 133
    .line 134
    move-result-object p3

    .line 135
    iget-object p4, p0, Ll/ogd0;->c:Ll/ajt;

    .line 136
    .line 137
    iget-object p4, p4, Ll/ajt;->b:Ljava/lang/String;

    .line 138
    .line 139
    invoke-virtual {p3, p4}, Ll/ljt$a;->s(Ljava/lang/String;)Ll/ljt$a;

    .line 140
    .line 141
    .line 142
    move-result-object p3

    .line 143
    iget-object p4, p0, Ll/ogd0;->c:Ll/ajt;

    .line 144
    .line 145
    invoke-virtual {p4}, Ll/ajt;->c()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object p4

    .line 149
    invoke-virtual {p3, p4}, Ll/ljt$a;->u(Ljava/lang/String;)Ll/ljt$a;

    .line 150
    .line 151
    .line 152
    move-result-object p3

    .line 153
    if-eqz p1, :cond_4

    .line 154
    .line 155
    const-string p4, "up"

    .line 156
    .line 157
    goto :goto_1

    .line 158
    :cond_4
    const-string p4, "down"

    .line 159
    .line 160
    :goto_1
    invoke-virtual {p3, p4}, Ll/ljt$a;->w(Ljava/lang/String;)Ll/ljt$a;

    .line 161
    .line 162
    .line 163
    move-result-object p3

    .line 164
    iget-object p4, p0, Ll/ogd0;->f:Ll/agd0;

    .line 165
    .line 166
    iget-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 167
    .line 168
    invoke-virtual {p4, v2}, Ll/agd0;->B(Ljava/lang/String;)I

    .line 169
    .line 170
    .line 171
    move-result p4

    .line 172
    invoke-virtual {p3, p4}, Ll/ljt$a;->r(I)Ll/ljt$a;

    .line 173
    .line 174
    .line 175
    move-result-object p3

    .line 176
    iget-object p4, p0, Ll/ogd0;->c:Ll/ajt;

    .line 177
    .line 178
    invoke-virtual {p4}, Ll/ajt;->j()J

    .line 179
    .line 180
    .line 181
    move-result-wide v2

    .line 182
    invoke-virtual {p3, v2, v3}, Ll/ljt$a;->x(J)Ll/ljt$a;

    .line 183
    .line 184
    .line 185
    move-result-object p3

    .line 186
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->getRecommendCategoryForTrack()Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object p4

    .line 190
    invoke-virtual {p3, p4}, Ll/ljt$a;->v(Ljava/lang/String;)Ll/ljt$a;

    .line 191
    .line 192
    .line 193
    move-result-object p3

    .line 194
    invoke-virtual {p3}, Ll/ljt$a;->l()Ll/ljt;

    .line 195
    .line 196
    .line 197
    move-result-object p3

    .line 198
    invoke-virtual {p0}, Ll/ogd0;->pageId()Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object p4

    .line 202
    invoke-static {p3, p4}, Ll/afu;->f(Ll/ljt;Ljava/lang/String;)V

    .line 203
    .line 204
    .line 205
    if-eqz p1, :cond_5

    .line 206
    .line 207
    const-string p1, "swipe_up"

    .line 208
    .line 209
    goto :goto_2

    .line 210
    :cond_5
    const-string p1, "swipe_down"

    .line 211
    .line 212
    :goto_2
    invoke-virtual {p2}, Ll/xzs;->R2()Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object p2

    .line 216
    invoke-virtual {p0, v1, p1, p2, v0}, Ll/ogd0;->D1(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 217
    .line 218
    .line 219
    :cond_6
    :goto_3
    return-void
.end method

.method public C0()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ogd0;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final C1(Ll/ugd0;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/ljt;->c()Ll/ljt$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Ll/ljt$a;->r(I)Ll/ljt$a;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object v1, p0, Ll/ogd0;->c:Ll/ajt;

    .line 11
    .line 12
    invoke-virtual {v1}, Ll/ajt;->j()J

    .line 13
    .line 14
    .line 15
    move-result-wide v1

    .line 16
    invoke-virtual {v0, v1, v2}, Ll/ljt$a;->x(J)Ll/ljt$a;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object v1, p1, Ll/mr2;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 21
    .line 22
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->getRecommendCategoryForTrack()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v0, v1}, Ll/ljt$a;->v(Ljava/lang/String;)Ll/ljt$a;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object v1, p0, Ll/ogd0;->c:Ll/ajt;

    .line 31
    .line 32
    iget-object v1, v1, Ll/ajt;->b:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ll/ljt$a;->s(Ljava/lang/String;)Ll/ljt$a;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iget-object v1, p0, Ll/ogd0;->c:Ll/ajt;

    .line 39
    .line 40
    invoke-virtual {v1}, Ll/ajt;->c()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v0, v1}, Ll/ljt$a;->u(Ljava/lang/String;)Ll/ljt$a;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iget-object v1, p1, Ll/mr2;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 49
    .line 50
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Ll/ljt$a;->t(Ljava/lang/String;)Ll/ljt$a;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iget-object p1, p1, Ll/mr2;->a:Lcom/p1/mobile/putong/data/User;

    .line 57
    .line 58
    if-nez p1, :cond_0

    .line 59
    .line 60
    const-string p1, ""

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_0
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 64
    .line 65
    :goto_0
    invoke-virtual {v0, p1}, Ll/ljt$a;->n(Ljava/lang/String;)Ll/ljt$a;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    iget-object v0, p0, Ll/ogd0;->c:Ll/ajt;

    .line 70
    .line 71
    invoke-virtual {v0}, Ll/ajt;->g()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {p1, v0}, Ll/ljt$a;->q(Ljava/lang/String;)Ll/ljt$a;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    const-string v0, "default"

    .line 80
    .line 81
    invoke-virtual {p1, v0}, Ll/ljt$a;->w(Ljava/lang/String;)Ll/ljt$a;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-virtual {p1}, Ll/ljt$a;->l()Ll/ljt;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    invoke-virtual {p0}, Ll/ogd0;->pageId()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-static {p1, p0}, Ll/afu;->f(Ll/ljt;Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public D0()Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/rgd0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/rgd0;->k()Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final D1(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/kfd0;->x()Ll/kfd0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Ll/kfd0$a;->b(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Ll/kfd0$a;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0, p2}, Ll/kfd0$a;->w(Ljava/lang/String;)Ll/kfd0$a;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    iget-object p0, p0, Ll/ogd0;->f:Ll/agd0;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ll/agd0;->B(Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    invoke-virtual {p2, p0}, Ll/kfd0$a;->l(I)Ll/kfd0$a;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    iget-object p1, p4, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 26
    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Ll/kfd0$a;->k(Ljava/lang/String;)Ll/kfd0$a;

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    .line 36
    .line 37
    const-string p2, "Null oldLive Anchor occurs in RoomFragPresenter.trackRoomEnter"

    .line 38
    .line 39
    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 43
    .line 44
    .line 45
    :goto_0
    invoke-virtual {p0}, Ll/kfd0$a;->a()Ll/kfd0;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-static {p0, p3}, Ll/afu;->h(Ll/kfd0;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public E0()Ll/agd0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ogd0;->f:Ll/agd0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final E1(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/rgd0;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {v0, v1}, Ll/rgd0;->v(Z)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast v0, Ll/rgd0;

    .line 12
    .line 13
    iget-object v0, v0, Ll/rgd0;->a:Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;

    .line 14
    .line 15
    new-instance v1, Ll/lgd0;

    .line 16
    .line 17
    invoke-direct {v1, p0, p1}, Ll/lgd0;-><init>(Ll/ogd0;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final F0()Ljava/lang/String;
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Ll/ogd0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->isVoiceLive()Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 19
    .line 20
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->n0:I

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0

    .line 27
    :cond_0
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 28
    .line 29
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->m0:I

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method

.method public F1()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ogd0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->isVoiceLive()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    iget-object v0, p0, Ll/ogd0;->k:Ll/rvk;

    .line 12
    .line 13
    iget-object p0, p0, Ll/ogd0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Ll/rvk;->e(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0
.end method

.method public G0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/rgd0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/rgd0;->m()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public H0(Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ogd0;->p1()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->m()Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Ll/hgd0;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/hgd0;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Ll/igd0;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Ll/igd0;-><init>(Ll/ogd0;)V

    .line 28
    .line 29
    .line 30
    new-instance v2, Ll/jgd0;

    .line 31
    .line 32
    invoke-direct {v2}, Ll/jgd0;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 40
    .line 41
    .line 42
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->j()Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_0

    .line 47
    .line 48
    invoke-virtual {p0}, Ll/ogd0;->F0()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    const/4 v1, 0x0

    .line 53
    const/4 v2, 0x1

    .line 54
    invoke-static {v0, v1, v2}, Ll/o1j0;->B(Ljava/lang/String;ZZ)V

    .line 55
    .line 56
    .line 57
    :cond_0
    new-instance v0, Ll/ogd0$a;

    .line 58
    .line 59
    invoke-direct {v0, p0}, Ll/ogd0$a;-><init>(Ll/ogd0;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->addSwipeBackListener(Ll/ujh0;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public I0()V
    .locals 11

    .line 1
    sget-object v0, Ll/lej0;->INSTANCE:Ll/lej0;

    .line 2
    .line 3
    const-string v1, "enter_live_room"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/lej0;->d(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const-string v2, "enter_voice_room"

    .line 9
    .line 10
    invoke-virtual {v0, v2}, Ll/lej0;->d(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ll/ogd0;->y0()Ll/x5;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    const/4 v4, 0x1

    .line 18
    invoke-virtual {v3, v4}, Ll/x5;->m(Z)V

    .line 19
    .line 20
    .line 21
    iget-object v3, p0, Ll/ogd0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 22
    .line 23
    invoke-virtual {v3}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->isVoiceLive()Z

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    if-eqz v3, :cond_0

    .line 28
    .line 29
    iget-object v3, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 30
    .line 31
    check-cast v3, Ll/rgd0;

    .line 32
    .line 33
    const/4 v5, 0x0

    .line 34
    invoke-virtual {v3, v5}, Ll/rgd0;->v(Z)V

    .line 35
    .line 36
    .line 37
    iget-object v3, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 38
    .line 39
    check-cast v3, Ll/rgd0;

    .line 40
    .line 41
    invoke-virtual {v3, v5, v5}, Ll/rgd0;->w(ZZ)V

    .line 42
    .line 43
    .line 44
    :cond_0
    invoke-virtual {p0}, Ll/ogd0;->y0()Ll/x5;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    invoke-virtual {v3}, Ll/xzs;->E2()Ll/oo2;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    invoke-virtual {v3}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    invoke-virtual {p0}, Ll/ogd0;->y0()Ll/x5;

    .line 57
    .line 58
    .line 59
    move-result-object v6

    .line 60
    iget-boolean v5, p0, Ll/ogd0;->n:Z

    .line 61
    .line 62
    if-nez v5, :cond_1

    .line 63
    .line 64
    iget-object v5, p0, Ll/ogd0;->b:Ljava/lang/String;

    .line 65
    .line 66
    invoke-virtual {v6, v5}, Ll/x5;->h4(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v6}, Ll/x5;->i4()V

    .line 70
    .line 71
    .line 72
    const-string v5, "roomPresenter.start()"

    .line 73
    .line 74
    invoke-virtual {v0, v1, v5}, Ll/lej0;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0, v2, v5}, Ll/lej0;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    :cond_1
    iput-boolean v4, p0, Ll/ogd0;->n:Z

    .line 81
    .line 82
    iget-object v8, p0, Ll/ogd0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 83
    .line 84
    if-eqz v3, :cond_2

    .line 85
    .line 86
    new-instance v0, Ll/fgd0;

    .line 87
    .line 88
    invoke-direct {v0, p0}, Ll/fgd0;-><init>(Ll/ogd0;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p0, v6, v8, v0}, Ll/ogd0;->O0(Ll/x5;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Ll/y20;)V

    .line 92
    .line 93
    .line 94
    move-object v5, p0

    .line 95
    goto :goto_0

    .line 96
    :cond_2
    new-instance v9, Ll/ggd0;

    .line 97
    .line 98
    invoke-direct {v9, p0}, Ll/ggd0;-><init>(Ll/ogd0;)V

    .line 99
    .line 100
    .line 101
    new-instance v10, Ll/fgd0;

    .line 102
    .line 103
    invoke-direct {v10, p0}, Ll/fgd0;-><init>(Ll/ogd0;)V

    .line 104
    .line 105
    .line 106
    const/4 v7, 0x1

    .line 107
    move-object v5, p0

    .line 108
    invoke-virtual/range {v5 .. v10}, Ll/ogd0;->N0(Ll/x5;ZLcom/p1/mobile/putong/live/base/data/BLiveAbsData;Ll/y20;Ll/y20;)V

    .line 109
    .line 110
    .line 111
    :goto_0
    invoke-virtual {v5}, Ll/ogd0;->q1()V

    .line 112
    .line 113
    .line 114
    return-void
.end method

.method public final J0(Ll/x5;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Ll/y20;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/x5;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;",
            "Ll/y20<",
            "Ll/ugd0;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v2, 0x0

    .line 2
    const/4 v4, 0x0

    .line 3
    move-object v0, p0

    .line 4
    move-object v1, p1

    .line 5
    move-object v3, p2

    .line 6
    move-object v5, p3

    .line 7
    invoke-virtual/range {v0 .. v5}, Ll/ogd0;->N0(Ll/x5;ZLcom/p1/mobile/putong/live/base/data/BLiveAbsData;Ll/y20;Ll/y20;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final L0(Ll/x5;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Z)V
    .locals 1

    .line 1
    new-instance v0, Ll/egd0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p3}, Ll/egd0;-><init>(Ll/ogd0;Z)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1, p2, v0}, Ll/ogd0;->J0(Ll/x5;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Ll/y20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final N0(Ll/x5;ZLcom/p1/mobile/putong/live/base/data/BLiveAbsData;Ll/y20;Ll/y20;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/x5;",
            "Z",
            "Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;",
            "Ll/y20<",
            "Ll/ugd0;",
            ">;",
            "Ll/y20<",
            "Ll/ugd0;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/lej0;->INSTANCE:Ll/lej0;

    .line 2
    .line 3
    const-string v1, "live_enter_room_rtc"

    .line 4
    .line 5
    const-string v2, "RoomFragPresenter:initRoomInfo"

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Ll/lej0;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const-string v1, "live_enter_room_cdn"

    .line 11
    .line 12
    invoke-virtual {v0, v1, v2}, Ll/lej0;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1, p3}, Ll/x5;->c4(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 16
    .line 17
    .line 18
    const-string v1, "enter_live_room"

    .line 19
    .line 20
    const-string v2, "roomPresenter.quickPlay(live)"

    .line 21
    .line 22
    invoke-virtual {v0, v1, v2}, Ll/lej0;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, p3}, Ll/ogd0;->u1(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 26
    .line 27
    .line 28
    iget-boolean p0, p0, Ll/ogd0;->p:Z

    .line 29
    .line 30
    move-object v3, p5

    .line 31
    move p5, p0

    .line 32
    move-object p0, p1

    .line 33
    move-object p1, p3

    .line 34
    move-object p3, p4

    .line 35
    move-object p4, v3

    .line 36
    invoke-virtual/range {p0 .. p5}, Ll/x5;->S3(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;ZLl/y20;Ll/y20;Z)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final O0(Ll/x5;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/x5;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;",
            "Ll/y20<",
            "Ll/ugd0;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1, p2}, Ll/x5;->c4(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1, p3}, Ll/x5;->T3(Ll/y20;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p2}, Ll/ogd0;->u1(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public P0(I)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ogd0;->y0()Ll/x5;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/x5;->U3(I)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public Q0()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ogd0;->y0()Ll/x5;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/x5;->V3()Z

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
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public R0()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/rgd0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/rgd0;->p()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public S0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/ogd0;->m:Z

    .line 2
    .line 3
    return p0
.end method

.method public U0()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ogd0;->f:Ll/agd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/agd0;->t()Ll/v5m;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ll/v5m;->g()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/vwt;->n5()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-ge p0, v0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public V0(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto/16 :goto_1

    .line 4
    .line 5
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->getJumpRoomType()Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;->CHANGE_SOURCE_WITH_BACK:Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;

    .line 10
    .line 11
    if-ne v0, v1, :cond_1

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->getOldSource()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/ogd0;->y0()Ll/x5;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Ll/oo2;->o0()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->setOldSource(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    :cond_1
    const/4 v0, 0x1

    .line 39
    invoke-virtual {p0, v0}, Ll/ogd0;->e1(I)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_2

    .line 44
    .line 45
    const-string v0, "chatHall"

    .line 46
    .line 47
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->getSource()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-nez v0, :cond_2

    .line 56
    .line 57
    goto/16 :goto_1

    .line 58
    .line 59
    :cond_2
    invoke-virtual {p0}, Ll/ogd0;->y0()Ll/x5;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {v0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->getLive()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    if-eqz v1, :cond_3

    .line 76
    .line 77
    if-eqz v0, :cond_3

    .line 78
    .line 79
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->getLive()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 84
    .line 85
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 86
    .line 87
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-eqz v0, :cond_3

    .line 92
    .line 93
    goto :goto_1

    .line 94
    :cond_3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->getLive()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    if-nez v0, :cond_6

    .line 99
    .line 100
    const-string v0, "voice-live"

    .line 101
    .line 102
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->getLiveType()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    if-eqz v0, :cond_4

    .line 111
    .line 112
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 113
    .line 114
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;-><init>()V

    .line 115
    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_4
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 119
    .line 120
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLive;-><init>()V

    .line 121
    .line 122
    .line 123
    :goto_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->getToLiveId()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 128
    .line 129
    new-instance v1, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 130
    .line 131
    invoke-direct {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;-><init>()V

    .line 132
    .line 133
    .line 134
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 135
    .line 136
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->getToRoomId()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v2

    .line 140
    iput-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 141
    .line 142
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->getSource()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object v1

    .line 146
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 147
    .line 148
    .line 149
    move-result v1

    .line 150
    if-eqz v1, :cond_5

    .line 151
    .line 152
    iget-object v1, p0, Ll/ogd0;->c:Ll/ajt;

    .line 153
    .line 154
    iget-object v1, v1, Ll/ajt;->b:Ljava/lang/String;

    .line 155
    .line 156
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->setSource(Ljava/lang/String;)V

    .line 157
    .line 158
    .line 159
    :cond_5
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->setLive(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 160
    .line 161
    .line 162
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 163
    .line 164
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 165
    .line 166
    .line 167
    move-result v1

    .line 168
    if-eqz v1, :cond_6

    .line 169
    .line 170
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 171
    .line 172
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 173
    .line 174
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 175
    .line 176
    .line 177
    move-result v0

    .line 178
    if-eqz v0, :cond_6

    .line 179
    .line 180
    :goto_1
    return-void

    .line 181
    :cond_6
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 182
    .line 183
    check-cast p0, Ll/rgd0;

    .line 184
    .line 185
    invoke-virtual {p0, p1}, Ll/rgd0;->s(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;)V

    .line 186
    .line 187
    .line 188
    return-void
.end method

.method public final synthetic W0(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ogd0;->F0()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/4 p1, 0x0

    .line 12
    const/4 v0, 0x1

    .line 13
    invoke-static {p0, p1, v0}, Ll/o1j0;->B(Ljava/lang/String;ZZ)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final synthetic X0(Ll/ugd0;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ogd0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Ll/ogd0;->g1(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Ll/ugd0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic Y0(ZLl/ugd0;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ogd0;->f:Ll/agd0;

    .line 2
    .line 3
    invoke-virtual {v0, p2, p1}, Ll/agd0;->y(Ll/ugd0;Z)V

    .line 4
    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p2}, Ll/ogd0;->C1(Ll/ugd0;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public final synthetic a1(Ll/x5;Ll/jsv;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->SchemeHandleEvent:Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;->handleScheme()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    new-instance p2, Ll/bae0$a;

    .line 12
    .line 13
    const/16 v0, 0xc8

    .line 14
    .line 15
    invoke-direct {p2, v0}, Ll/bae0$a;-><init>(I)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/ogd0;->c:Ll/ajt;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/ajt;->d()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p2, p0}, Ll/bae0$a;->e(Ljava/lang/String;)Ll/bae0$a;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Ll/bae0$a;->c()Ll/bae0;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p1, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final synthetic b1(Ll/isv;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ogd0;->f:Ll/agd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/agd0;->q()Ll/p5m;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ll/p5m;->d()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    add-int/lit8 v0, v0, 0x1

    .line 12
    .line 13
    if-ltz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p1}, Ll/isv;->n()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-ge v0, v1, :cond_0

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Ll/isv;->i(I)Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    new-instance v0, Ljava/util/HashSet;

    .line 27
    .line 28
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, Ll/ogd0;->f:Ll/agd0;

    .line 32
    .line 33
    invoke-virtual {v1}, Ll/agd0;->q()Ll/p5m;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-interface {v1}, Ll/p5m;->e()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 42
    .line 43
    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    iget-object v1, p0, Ll/ogd0;->f:Ll/agd0;

    .line 47
    .line 48
    invoke-virtual {v1}, Ll/agd0;->r()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    if-eqz v1, :cond_1

    .line 53
    .line 54
    iget-object v1, p0, Ll/ogd0;->f:Ll/agd0;

    .line 55
    .line 56
    invoke-virtual {v1}, Ll/agd0;->r()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 61
    .line 62
    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    :cond_1
    invoke-virtual {p1, v0}, Ll/isv;->l(Ljava/util/Collection;)Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    :goto_0
    if-nez p1, :cond_2

    .line 70
    .line 71
    return-void

    .line 72
    :cond_2
    iget-object p0, p0, Ll/ogd0;->j:Ll/bas;

    .line 73
    .line 74
    invoke-virtual {p0, p1}, Ll/bas;->b(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;)V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public final synthetic c1(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/ogd0;->h:Ll/oo2;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Ll/ogd0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p1}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    :goto_0
    iget-object v0, p0, Ll/ogd0;->g:Ll/ojd0;

    .line 13
    .line 14
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 15
    .line 16
    check-cast v1, Ll/rgd0;

    .line 17
    .line 18
    iget-object v1, v1, Ll/rgd0;->b:Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ll/ojd0;->n(Ll/pol;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/ogd0;->g:Ll/ojd0;

    .line 24
    .line 25
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 26
    .line 27
    check-cast v1, Ll/rgd0;

    .line 28
    .line 29
    invoke-virtual {v1}, Ll/rgd0;->j()Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, p1, v1}, Ll/ojd0;->j(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;)Ll/x5;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ll/ogd0;->I0()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final synthetic d1(Ljava/lang/String;)V
    .locals 3

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    const/4 v1, 0x0

    .line 7
    const/4 v2, 0x1

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    new-instance v0, Ll/ldp;

    .line 11
    .line 12
    invoke-direct {v0}, Ll/ldp;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, p1}, Ll/ldp;->c(Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_1

    .line 20
    .line 21
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 22
    .line 23
    check-cast p0, Ll/rgd0;

    .line 24
    .line 25
    invoke-virtual {p0, v2, v1}, Ll/rgd0;->w(ZZ)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ll/ldp;->a()V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    new-instance v0, Ll/m7f0;

    .line 33
    .line 34
    invoke-direct {v0}, Ll/m7f0;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, p1}, Ll/m7f0;->b(Ljava/lang/String;)Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-eqz p1, :cond_1

    .line 42
    .line 43
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 44
    .line 45
    check-cast p0, Ll/rgd0;

    .line 46
    .line 47
    invoke-virtual {p0, v2, v1}, Ll/rgd0;->w(ZZ)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0}, Ll/m7f0;->a()V

    .line 51
    .line 52
    .line 53
    :cond_1
    return-void
.end method

.method public destroy()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ogd0;->y0()Ll/x5;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/i6t;->n()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/ogd0;->o:Ll/u4j;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/u4j;->s2()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/ogd0;->j:Ll/bas;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/bas;->c()V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/ogd0;->k:Ll/rvk;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/rvk;->c()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public e1(I)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ogd0;->y0()Ll/x5;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/x5;->X3(I)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public f1()Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/ogd0;->y0()Ll/x5;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    invoke-virtual {v0}, Ll/njt;->K3()Ll/dum;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-static {v2}, Ll/bf10;->m(Ll/dum;)Z

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    const/4 v3, 0x1

    .line 18
    if-eqz v2, :cond_1

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->MultiCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->openMatchStayDlg()Ll/v3f$d;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    return v3

    .line 36
    :cond_1
    const/4 v2, 0x2

    .line 37
    invoke-virtual {p0, v2}, Ll/ogd0;->e1(I)Z

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    if-eqz v2, :cond_2

    .line 42
    .line 43
    return v3

    .line 44
    :cond_2
    iget-object v2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 45
    .line 46
    check-cast v2, Ll/rgd0;

    .line 47
    .line 48
    invoke-virtual {v2}, Ll/rgd0;->l()Z

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    if-eqz v2, :cond_3

    .line 53
    .line 54
    invoke-virtual {p0}, Ll/ogd0;->G0()V

    .line 55
    .line 56
    .line 57
    :cond_3
    invoke-virtual {p0}, Ll/ogd0;->F1()Z

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    if-eqz v2, :cond_4

    .line 62
    .line 63
    invoke-virtual {p0}, Ll/ogd0;->x1()V

    .line 64
    .line 65
    .line 66
    return v3

    .line 67
    :cond_4
    invoke-virtual {p0}, Ll/ogd0;->S0()Z

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    xor-int/2addr p0, v3

    .line 72
    invoke-virtual {v0, p0, v1}, Ll/x5;->Y3(ZZ)Z

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    return p0
.end method

.method public final g1(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Ll/ugd0;)V
    .locals 1

    .line 1
    iget-object v0, p2, Ll/mr2;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 2
    .line 3
    instance-of v0, v0, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 8
    .line 9
    const-string v0, "-1"

    .line 10
    .line 11
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Ll/ogd0;->c:Ll/ajt;

    .line 18
    .line 19
    iget-object p1, p2, Ll/mr2;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 20
    .line 21
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 22
    .line 23
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLive;->source:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Ll/ajt;->s(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public h1()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ogd0;->y0()Ll/x5;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/njt;->K3()Ll/dum;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Ll/bf10;->m(Ll/dum;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/ogd0;->y0()Ll/x5;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->MultiCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->openMatchStayDlg()Ll/v3f$d;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    const/4 v0, 0x2

    .line 36
    invoke-virtual {p0, v0}, Ll/ogd0;->e1(I)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    invoke-virtual {p0}, Ll/ogd0;->F1()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_2

    .line 48
    .line 49
    invoke-virtual {p0}, Ll/ogd0;->x1()V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_2
    invoke-virtual {p0}, Ll/ogd0;->y0()Ll/x5;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {p0}, Ll/ogd0;->S0()Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    const/4 v2, 0x1

    .line 62
    xor-int/2addr v1, v2

    .line 63
    invoke-virtual {v0, v1, v2}, Ll/x5;->Y3(ZZ)Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-eqz v0, :cond_3

    .line 68
    .line 69
    :goto_0
    return-void

    .line 70
    :cond_3
    invoke-virtual {p0}, Ll/ogd0;->y0()Ll/x5;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-static {v0}, Ll/bf10;->H(Ll/i6t;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0}, Ll/ogd0;->u0()V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public final i1(Ll/ugd0;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ogd0;->y0()Ll/x5;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p0, Ll/ogd0;->c:Ll/ajt;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/ajt;->f()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "DanmuChat"

    .line 12
    .line 13
    invoke-static {v1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v1, 0x1

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-virtual {p1}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->chatInputClick()Ll/v3f$d;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    new-instance p1, Ll/vv4;

    .line 31
    .line 32
    const-string v0, ""

    .line 33
    .line 34
    invoke-direct {p1, v1, v0}, Ll/vv4;-><init>(ZLjava/lang/String;)V

    .line 35
    .line 36
    .line 37
    const-string v0, "1"

    .line 38
    .line 39
    invoke-virtual {p1, v0}, Ll/vv4;->b(Ljava/lang/String;)Ll/vv4;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_0
    iget-object v0, p0, Ll/ogd0;->c:Ll/ajt;

    .line 48
    .line 49
    invoke-virtual {v0}, Ll/ajt;->d()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-nez v0, :cond_1

    .line 58
    .line 59
    invoke-virtual {p1}, Ll/xzs;->E2()Ll/oo2;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {v0}, Ll/vp20;->y()Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    new-instance v1, Ll/dgd0;

    .line 76
    .line 77
    invoke-direct {v1, p0, p1}, Ll/dgd0;-><init>(Ll/ogd0;Ll/x5;)V

    .line 78
    .line 79
    .line 80
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 85
    .line 86
    .line 87
    :cond_1
    return-void
.end method

.method public j1()V
    .locals 6

    .line 1
    invoke-virtual {p0}, Ll/ogd0;->Q0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-static {}, Ll/df80;->a()Ll/df80;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-virtual {v0, v1}, Ll/df80;->e(Z)V

    .line 14
    .line 15
    .line 16
    :goto_0
    invoke-virtual {p0}, Ll/ogd0;->y0()Ll/x5;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/ogd0;->y0()Ll/x5;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const-string v1, "exit"

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ll/x5;->d4(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    :cond_1
    iget-object v0, p0, Ll/ogd0;->o:Ll/u4j;

    .line 32
    .line 33
    invoke-virtual {v0}, Ll/l6t;->destroy()V

    .line 34
    .line 35
    .line 36
    invoke-static {}, Ll/pzi0;->o()J

    .line 37
    .line 38
    .line 39
    move-result-wide v0

    .line 40
    :try_start_0
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->h()Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    iget-wide v3, p0, Ll/ogd0;->l:J

    .line 45
    .line 46
    invoke-virtual {v2, v3, v4, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->e(JJ)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :catch_0
    move-exception v2

    .line 51
    new-instance v3, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    const-string v4, "startTime: "

    .line 54
    .line 55
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    iget-wide v4, p0, Ll/ogd0;->l:J

    .line 59
    .line 60
    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string p0, ",currentTime :"

    .line 64
    .line 65
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    const-string v0, "[live]leaveRoom"

    .line 76
    .line 77
    invoke-static {v0, p0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    invoke-static {v2}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public final k1(Ll/ugd0;)V
    .locals 4

    .line 1
    iget-object v0, p1, Ll/mr2;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->isNormalLive()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p1, Ll/mr2;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 10
    .line 11
    invoke-static {v0}, Ll/u9t;->d(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/ogd0;->c:Ll/ajt;

    .line 18
    .line 19
    iget-object v0, v0, Ll/ajt;->b:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {p0, v0, p1}, Ll/ogd0;->v1(Ljava/lang/String;Ll/ugd0;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/kgd0;

    .line 29
    .line 30
    invoke-direct {v1}, Ll/kgd0;-><init>()V

    .line 31
    .line 32
    .line 33
    const-wide/16 v2, 0xbb8

    .line 34
    .line 35
    invoke-static {v0, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 36
    .line 37
    .line 38
    :cond_0
    iget-object v0, p0, Ll/ogd0;->f:Ll/agd0;

    .line 39
    .line 40
    const/4 v1, 0x1

    .line 41
    invoke-virtual {v0, p1, v1}, Ll/agd0;->y(Ll/ugd0;Z)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0, p1}, Ll/ogd0;->i1(Ll/ugd0;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0, p1}, Ll/ogd0;->C1(Ll/ugd0;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public l1()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ogd0;->A0()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "group_profile_fans"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 15
    .line 16
    check-cast v0, Ll/rgd0;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/rgd0;->p()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    iget-object v0, p0, Ll/ogd0;->f:Ll/agd0;

    .line 25
    .line 26
    invoke-virtual {v0}, Ll/agd0;->p()Ll/o5m;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-interface {v0}, Ll/o5m;->g()Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    new-instance v1, Ll/mgd0;

    .line 39
    .line 40
    invoke-direct {v1}, Ll/mgd0;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    const/4 v1, 0x1

    .line 48
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    new-instance v1, Ll/ngd0;

    .line 61
    .line 62
    invoke-direct {v1, p0}, Ll/ngd0;-><init>(Ll/ogd0;)V

    .line 63
    .line 64
    .line 65
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 70
    .line 71
    .line 72
    :cond_1
    :goto_0
    return-void
.end method

.method public m1(Z)Ll/pf60;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Ll/pf60<",
            "Ljava/lang/Boolean;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ogd0;->f:Ll/agd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/agd0;->q()Ll/p5m;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0, p1}, Ll/p5m;->a(Z)Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public n1()V
    .locals 1

    .line 1
    new-instance v0, Ll/cgd0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/cgd0;-><init>(Ll/ogd0;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public o1(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ogd0;->f:Ll/agd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/agd0;->q()Ll/p5m;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0, p1}, Ll/p5m;->b(Z)Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_2

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->isLiving()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-nez v1, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 21
    .line 22
    check-cast v1, Ll/rgd0;

    .line 23
    .line 24
    invoke-virtual {v1}, Ll/rgd0;->i()Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;->getPresenter()Ll/x5;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    if-eqz v1, :cond_1

    .line 33
    .line 34
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 35
    .line 36
    check-cast v1, Ll/rgd0;

    .line 37
    .line 38
    invoke-virtual {v1}, Ll/rgd0;->i()Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;->getPresenter()Ll/x5;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v1}, Ll/x5;->W3()Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-eqz v1, :cond_1

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    iget-object v1, p0, Ll/ogd0;->g:Ll/ojd0;

    .line 54
    .line 55
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 56
    .line 57
    check-cast p0, Ll/rgd0;

    .line 58
    .line 59
    invoke-virtual {p0}, Ll/rgd0;->i()Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {v1, v0, p0}, Ll/ojd0;->i(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;)Ll/x5;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p0, p1, v0}, Ll/x5;->b4(ZLcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 68
    .line 69
    .line 70
    :cond_2
    :goto_0
    return-void
.end method

.method public final p1()V
    .locals 4

    .line 1
    iget-object p0, p0, Ll/ogd0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->isNormalLive()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    sget-object p0, Ll/htd0;->e:Ll/htd0;

    .line 12
    .line 13
    invoke-static {p0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/ifv;

    .line 18
    .line 19
    iget-object v0, v0, Ll/ifv;->b:Ll/byd0;

    .line 20
    .line 21
    invoke-static {}, Ll/pzi0;->o()J

    .line 22
    .line 23
    .line 24
    move-result-wide v1

    .line 25
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    invoke-static {p0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Ll/ifv;

    .line 37
    .line 38
    iget-object v0, v0, Ll/ifv;->c:Ll/byd0;

    .line 39
    .line 40
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    check-cast v0, Ljava/lang/Long;

    .line 45
    .line 46
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 47
    .line 48
    .line 49
    move-result-wide v0

    .line 50
    const-wide/16 v2, 0x0

    .line 51
    .line 52
    cmp-long v0, v0, v2

    .line 53
    .line 54
    if-nez v0, :cond_0

    .line 55
    .line 56
    invoke-static {p0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    check-cast p0, Ll/ifv;

    .line 61
    .line 62
    iget-object p0, p0, Ll/ifv;->c:Ll/byd0;

    .line 63
    .line 64
    invoke-static {}, Ll/pzi0;->o()J

    .line 65
    .line 66
    .line 67
    move-result-wide v0

    .line 68
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {p0, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    :cond_0
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ogd0;->c:Ll/ajt;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ajt;->e()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "live"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const-string p0, "p_user_live_room"

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    const-string p0, "p_user_audio_room"

    .line 19
    .line 20
    return-object p0
.end method

.method public q0(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$c;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/rgd0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/rgd0;->e(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$c;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final q1()V
    .locals 2

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iput-wide v0, p0, Ll/ogd0;->l:J

    .line 6
    .line 7
    return-void
.end method

.method public r0(Ll/ugd0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ogd0;->f:Ll/agd0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/agd0;->m(Ll/ugd0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public r1()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/rgd0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/rgd0;->i()Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;->getPresenter()Ll/x5;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/x5;->N3()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public s0()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/rgd0;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, v0}, Ll/rgd0;->s(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public s1(Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;Z)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;->getPresenter()Ll/x5;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;->getPresenter()Ll/x5;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    const-string p2, "click"

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const-string p2, "swipe"

    .line 17
    .line 18
    :goto_0
    invoke-virtual {p0, p2}, Ll/x5;->d4(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;->getPresenter()Ll/x5;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Ll/i6t;->n()V

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void
.end method

.method public t0()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ogd0;->y0()Ll/x5;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/x5;->O3()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public t1(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$c;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/rgd0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/rgd0;->u(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$c;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public u0()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ogd0;->y0()Ll/x5;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/x5;->P3()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/ogd0;->i:Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final u1(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V
    .locals 2

    .line 1
    invoke-static {p1}, Ll/u9t;->d(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast p1, Ll/rgd0;

    .line 11
    .line 12
    invoke-virtual {p1, v1, v1}, Ll/rgd0;->w(ZZ)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast p0, Ll/rgd0;

    .line 18
    .line 19
    invoke-virtual {p0, v1}, Ll/rgd0;->v(Z)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->isNormalLive()Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 28
    .line 29
    if-eqz p1, :cond_1

    .line 30
    .line 31
    check-cast v0, Ll/rgd0;

    .line 32
    .line 33
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    iget-object p0, p0, Ll/ogd0;->c:Ll/ajt;

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/ajt;->c()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p1, p0}, Ll/vwt;->mb(Ljava/lang/String;)Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    invoke-virtual {v0, p0}, Ll/rgd0;->v(Z)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_1
    check-cast v0, Ll/rgd0;

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Ll/rgd0;->v(Z)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public final v1(Ljava/lang/String;Ll/ugd0;)V
    .locals 2

    .line 1
    const-string v0, "default"

    .line 2
    .line 3
    invoke-virtual {p2}, Ll/ugd0;->b()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x0

    .line 12
    if-eqz v0, :cond_3

    .line 13
    .line 14
    const/4 v0, 0x2

    .line 15
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/ogd0;->U0()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 28
    .line 29
    check-cast p0, Ll/rgd0;

    .line 30
    .line 31
    invoke-virtual {p0, v1}, Ll/rgd0;->v(Z)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    iget-object v0, p2, Ll/mr2;->a:Lcom/p1/mobile/putong/data/User;

    .line 36
    .line 37
    iget-object p2, p2, Ll/mr2;->d:Lcom/p1/mobile/putong/data/Followship;

    .line 38
    .line 39
    invoke-static {v0, p2}, Ll/q0j;->b(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Followship;)Z

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    if-nez p2, :cond_2

    .line 44
    .line 45
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    invoke-virtual {p2, p1}, Ll/vwt;->mb(Ljava/lang/String;)Z

    .line 50
    .line 51
    .line 52
    move-result p2

    .line 53
    if-eqz p2, :cond_1

    .line 54
    .line 55
    invoke-virtual {p0}, Ll/ogd0;->y0()Ll/x5;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    invoke-virtual {p2}, Ll/xzs;->K2()Ll/t8s;

    .line 60
    .line 61
    .line 62
    move-result-object p2

    .line 63
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;->SIGN_IN:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 64
    .line 65
    filled-new-array {v0}, [Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {p2, v0}, Ll/t8s;->l([Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;)Z

    .line 70
    .line 71
    .line 72
    move-result p2

    .line 73
    if-nez p2, :cond_1

    .line 74
    .line 75
    invoke-virtual {p0, p1}, Ll/ogd0;->E1(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 80
    .line 81
    check-cast p0, Ll/rgd0;

    .line 82
    .line 83
    invoke-virtual {p0, v1}, Ll/rgd0;->v(Z)V

    .line 84
    .line 85
    .line 86
    :cond_2
    return-void

    .line 87
    :cond_3
    const-string p1, "display"

    .line 88
    .line 89
    invoke-virtual {p2}, Ll/ugd0;->b()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p2

    .line 93
    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 94
    .line 95
    .line 96
    move-result p1

    .line 97
    iget-object p2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 98
    .line 99
    const/4 v0, 0x1

    .line 100
    if-eqz p1, :cond_4

    .line 101
    .line 102
    check-cast p2, Ll/rgd0;

    .line 103
    .line 104
    invoke-virtual {p2, v0}, Ll/rgd0;->v(Z)V

    .line 105
    .line 106
    .line 107
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 108
    .line 109
    check-cast p0, Ll/rgd0;

    .line 110
    .line 111
    invoke-virtual {p0, v0, v1}, Ll/rgd0;->w(ZZ)V

    .line 112
    .line 113
    .line 114
    return-void

    .line 115
    :cond_4
    check-cast p2, Ll/rgd0;

    .line 116
    .line 117
    invoke-virtual {p2, v0}, Ll/rgd0;->v(Z)V

    .line 118
    .line 119
    .line 120
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 121
    .line 122
    check-cast p0, Ll/rgd0;

    .line 123
    .line 124
    invoke-virtual {p0, v1, v1}, Ll/rgd0;->w(ZZ)V

    .line 125
    .line 126
    .line 127
    return-void
.end method

.method public x0()Ll/u4j;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ogd0;->o:Ll/u4j;

    .line 2
    .line 3
    return-object p0
.end method

.method public x1()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/ogd0;->m:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast v0, Ll/rgd0;

    .line 7
    .line 8
    iget-object p0, p0, Ll/ogd0;->k:Ll/rvk;

    .line 9
    .line 10
    iget p0, p0, Ll/rvk;->b:I

    .line 11
    .line 12
    invoke-virtual {v0, p0}, Ll/rgd0;->y(I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public y0()Ll/x5;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ogd0;->g:Ll/ojd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ojd0;->g()Ll/x5;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public z0()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ogd0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 2
    .line 3
    return-object p0
.end method

.method public final z1(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;)Ll/x5;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ogd0;->c:Ll/ajt;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Ll/ajt;->t(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/ogd0;->c:Ll/ajt;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/ajt;->l()V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/ogd0;->g:Ll/ojd0;

    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->getLive()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v0, v2, p2}, Ll/ojd0;->j(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;)Ll/x5;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->getJumpRoomType()Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;->needChangeSource()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->getSource()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-eqz v1, :cond_0

    .line 41
    .line 42
    iget-object v0, p0, Ll/ogd0;->c:Ll/ajt;

    .line 43
    .line 44
    invoke-virtual {v0}, Ll/ajt;->c()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    :cond_0
    invoke-virtual {p2, p1}, Ll/x5;->e4(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;)V

    .line 49
    .line 50
    .line 51
    iget-object v1, p0, Ll/ogd0;->c:Ll/ajt;

    .line 52
    .line 53
    invoke-virtual {v1, v0}, Ll/ajt;->m(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {p2, v0}, Ll/x5;->h4(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p2}, Ll/x5;->i4()V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Ll/ogd0;->f:Ll/agd0;

    .line 71
    .line 72
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->getSource()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->getLive()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    invoke-virtual {v0, v1, v2}, Ll/agd0;->C(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Ll/ogd0;->i:Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

    .line 84
    .line 85
    iget-object v1, p0, Ll/ogd0;->f:Ll/agd0;

    .line 86
    .line 87
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->getSource()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;->U4(Ll/agd0;Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->getLive()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    const/4 v1, 0x1

    .line 99
    invoke-virtual {p0, p2, v0, v1}, Ll/ogd0;->L0(Ll/x5;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Z)V

    .line 100
    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_1
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    invoke-virtual {p2, v0}, Ll/x5;->h4(Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {p2}, Ll/x5;->i4()V

    .line 115
    .line 116
    .line 117
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->getLive()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    invoke-virtual {p0, p2, v0, v1}, Ll/ogd0;->L0(Ll/x5;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Z)V

    .line 122
    .line 123
    .line 124
    :goto_0
    iget-object p0, p0, Ll/ogd0;->f:Ll/agd0;

    .line 125
    .line 126
    invoke-virtual {p0, p1}, Ll/agd0;->z(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;)V

    .line 127
    .line 128
    .line 129
    return-object p2
.end method
