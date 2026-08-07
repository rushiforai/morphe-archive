.class public Ll/b2g0;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/oo2;",
        "Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryView;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Ll/kcg0;

.field public j:Ll/kcg0;

.field public k:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryState;

.field public l:Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarBoard;

.field public m:I

.field public final n:I

.field public o:Z

.field public p:Z

.field public q:Z


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryState;->close:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryState;

    .line 5
    .line 6
    iput-object p1, p0, Ll/b2g0;->k:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryState;

    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarBoard;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarBoard;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Ll/b2g0;->l:Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarBoard;

    .line 13
    .line 14
    const/4 p1, 0x5

    .line 15
    iput p1, p0, Ll/b2g0;->m:I

    .line 16
    .line 17
    iput p1, p0, Ll/b2g0;->n:I

    .line 18
    .line 19
    const/4 p1, 0x0

    .line 20
    iput-boolean p1, p0, Ll/b2g0;->q:Z

    .line 21
    .line 22
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static synthetic J3(Ll/b2g0;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/b2g0;->Y3(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic K3(Ll/b2g0;Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/b2g0;->c4(Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData;)V

    return-void
.end method

.method public static synthetic L3(Ll/b2g0;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/b2g0;->Z3(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic M3(Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarInfo;Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarOther;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarOther;->giftId:I

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarInfo;->giftId:I

    .line 4
    .line 5
    if-ne p1, p0, :cond_0

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

.method public static synthetic N3(Ll/b2g0;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/b2g0;->X3(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic O3(Ll/b2g0;Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarBoard;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/b2g0;->a4(Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarBoard;)V

    return-void
.end method

.method public static synthetic P3(Ll/b2g0;Lcom/p1/mobile/longlink/msg/live/leaderboard/LongLinkLeaderboard$GiftStarLeaderboardChangeMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/b2g0;->b4(Lcom/p1/mobile/longlink/msg/live/leaderboard/LongLinkLeaderboard$GiftStarLeaderboardChangeMessage;)V

    return-void
.end method

.method private U3()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/b2g0;->l:Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarBoard;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarBoard;->current:Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarInfo;

    .line 4
    .line 5
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryState;->playOwn:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryState;

    .line 6
    .line 7
    iput-object v1, p0, Ll/b2g0;->k:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryState;

    .line 8
    .line 9
    new-instance v1, Ll/t1g0;

    .line 10
    .line 11
    invoke-direct {v1}, Ll/t1g0;-><init>()V

    .line 12
    .line 13
    .line 14
    iget v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarInfo;->rank:I

    .line 15
    .line 16
    if-lez v2, :cond_1

    .line 17
    .line 18
    iget v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarInfo;->rankShowLimit:I

    .line 19
    .line 20
    if-le v2, v3, :cond_0

    .line 21
    .line 22
    sget-object v2, Ll/zrv;->e:Landroid/app/Application;

    .line 23
    .line 24
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->ae:I

    .line 25
    .line 26
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    iget v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarInfo;->rankShowLimit:I

    .line 31
    .line 32
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    iput-object v2, v1, Ll/t1g0;->b:Ljava/lang/String;

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    sget-object v2, Ll/zrv;->e:Landroid/app/Application;

    .line 48
    .line 49
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->Yd:I

    .line 50
    .line 51
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    iget v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarInfo;->rank:I

    .line 56
    .line 57
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    iput-object v2, v1, Ll/t1g0;->b:Ljava/lang/String;

    .line 70
    .line 71
    :goto_0
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarInfo;->giftIcon:Ljava/lang/String;

    .line 72
    .line 73
    iput-object v0, v1, Ll/t1g0;->a:Ljava/lang/String;

    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_1
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 77
    .line 78
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Zd:I

    .line 79
    .line 80
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    iput-object v0, v1, Ll/t1g0;->b:Ljava/lang/String;

    .line 85
    .line 86
    iget-object v0, p0, Ll/b2g0;->l:Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarBoard;

    .line 87
    .line 88
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarBoard;->leaderboards:Ljava/util/List;

    .line 89
    .line 90
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    if-eqz v0, :cond_2

    .line 95
    .line 96
    new-instance v0, Landroid/net/Uri$Builder;

    .line 97
    .line 98
    invoke-direct {v0}, Landroid/net/Uri$Builder;-><init>()V

    .line 99
    .line 100
    .line 101
    const-string v2, "res"

    .line 102
    .line 103
    invoke-virtual {v0, v2}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    sget v2, Ll/obc0;->l2:I

    .line 108
    .line 109
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v2

    .line 113
    invoke-virtual {v0, v2}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    iput-object v0, v1, Ll/t1g0;->a:Ljava/lang/String;

    .line 126
    .line 127
    goto :goto_1

    .line 128
    :cond_2
    iget-object v0, p0, Ll/b2g0;->l:Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarBoard;

    .line 129
    .line 130
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarBoard;->leaderboards:Ljava/util/List;

    .line 131
    .line 132
    const/4 v2, 0x0

    .line 133
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarOther;

    .line 138
    .line 139
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarOther;->giftIcon:Ljava/lang/String;

    .line 140
    .line 141
    iput-object v0, v1, Ll/t1g0;->a:Ljava/lang/String;

    .line 142
    .line 143
    :goto_1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 144
    .line 145
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryView;

    .line 146
    .line 147
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryView;->m0(Ll/t1g0;)V

    .line 148
    .line 149
    .line 150
    return-void
.end method

.method private V3()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryView;

    .line 4
    .line 5
    iget-boolean v1, p0, Ll/b2g0;->o:Z

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-boolean p0, p0, Ll/b2g0;->p:Z

    .line 10
    .line 11
    if-nez p0, :cond_0

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
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryView;->o0(Z)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method private d4()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->r7(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method private f4()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/b2g0;->j:Ll/kcg0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ll/kcg0;->isUnsubscribed()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget v1, p0, Ll/b2g0;->m:I

    .line 17
    .line 18
    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 19
    .line 20
    invoke-virtual {v0, v1, v2}, Ll/oo2;->h2(ILjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const/4 v1, 0x1

    .line 25
    invoke-virtual {p0, v0, v1}, Ll/i6t;->I3(Lrx/c;Z)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    new-instance v1, Ll/a2g0;

    .line 38
    .line 39
    invoke-direct {v1, p0}, Ll/a2g0;-><init>(Ll/b2g0;)V

    .line 40
    .line 41
    .line 42
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iput-object v0, p0, Ll/b2g0;->j:Ll/kcg0;

    .line 51
    .line 52
    return-void
.end method

.method private g4(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/b2g0;->i:Ll/kcg0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ll/kcg0;->isUnsubscribed()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 17
    .line 18
    invoke-virtual {v0, p1, v1}, Ll/oo2;->h2(ILjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const/4 v0, 0x1

    .line 23
    invoke-virtual {p0, p1, v0}, Ll/i6t;->I3(Lrx/c;Z)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    new-instance v0, Ll/z1g0;

    .line 28
    .line 29
    invoke-direct {v0, p0}, Ll/z1g0;-><init>(Ll/b2g0;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v0}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    iput-object p1, p0, Ll/b2g0;->i:Ll/kcg0;

    .line 41
    .line 42
    return-void
.end method


# virtual methods
.method public final R3(Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryState;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryState;->intro:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryState;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/b2g0;->S3(Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryState;)V

    .line 6
    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryState;->playOwn:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryState;

    .line 10
    .line 11
    if-ne p1, v0, :cond_1

    .line 12
    .line 13
    invoke-direct {p0}, Ll/b2g0;->U3()V

    .line 14
    .line 15
    .line 16
    :cond_1
    :goto_0
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryState;->playOther:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryState;

    .line 17
    .line 18
    if-ne p1, v0, :cond_2

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/b2g0;->T3()V

    .line 21
    .line 22
    .line 23
    :cond_2
    return-void
.end method

.method public final S3(Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryState;)V
    .locals 2

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryState;->intro:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryState;

    .line 2
    .line 3
    iput-object p1, p0, Ll/b2g0;->k:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryState;

    .line 4
    .line 5
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryView;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryView;->n0()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    const/4 v0, 0x5

    .line 17
    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 18
    .line 19
    invoke-virtual {p1, v0, v1}, Ll/oo2;->h2(ILjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const/4 v0, 0x1

    .line 24
    invoke-virtual {p0, p1, v0}, Ll/i6t;->I3(Lrx/c;Z)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p1, v0}, Lrx/c;->take(I)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {p1, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    new-instance v0, Ll/y1g0;

    .line 41
    .line 42
    invoke-direct {v0, p0}, Ll/y1g0;-><init>(Ll/b2g0;)V

    .line 43
    .line 44
    .line 45
    invoke-static {v0}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 50
    .line 51
    .line 52
    const-string p1, "e_live_giftstar_rank"

    .line 53
    .line 54
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-static {p1, p0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public final T3()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/b2g0;->l:Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarBoard;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarBoard;->current:Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarInfo;

    .line 4
    .line 5
    sget-object v2, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryState;->playOther:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryState;

    .line 6
    .line 7
    iput-object v2, p0, Ll/b2g0;->k:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryState;

    .line 8
    .line 9
    iget v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarInfo;->rank:I

    .line 10
    .line 11
    if-lez v2, :cond_0

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarBoard;->leaderboards:Ljava/util/List;

    .line 14
    .line 15
    new-instance v2, Ll/x1g0;

    .line 16
    .line 17
    invoke-direct {v2, v1}, Ll/x1g0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarInfo;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v0, v2}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarOther;

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const/4 v0, 0x0

    .line 28
    :goto_0
    if-nez v0, :cond_1

    .line 29
    .line 30
    iget-object v1, p0, Ll/b2g0;->l:Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarBoard;

    .line 31
    .line 32
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarBoard;->leaderboards:Ljava/util/List;

    .line 33
    .line 34
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-nez v1, :cond_1

    .line 39
    .line 40
    iget-object v0, p0, Ll/b2g0;->l:Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarBoard;

    .line 41
    .line 42
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarBoard;->leaderboards:Ljava/util/List;

    .line 43
    .line 44
    const/4 v1, 0x0

    .line 45
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarOther;

    .line 50
    .line 51
    :cond_1
    if-nez v0, :cond_2

    .line 52
    .line 53
    return-void

    .line 54
    :cond_2
    new-instance v1, Ll/t1g0;

    .line 55
    .line 56
    invoke-direct {v1}, Ll/t1g0;-><init>()V

    .line 57
    .line 58
    .line 59
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarOther;->giftIcon:Ljava/lang/String;

    .line 60
    .line 61
    iput-object v2, v1, Ll/t1g0;->a:Ljava/lang/String;

    .line 62
    .line 63
    new-instance v2, Ljava/util/ArrayList;

    .line 64
    .line 65
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 66
    .line 67
    .line 68
    iput-object v2, v1, Ll/t1g0;->c:Ljava/util/List;

    .line 69
    .line 70
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarOther;->topN:Ljava/util/List;

    .line 71
    .line 72
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    if-eqz v2, :cond_3

    .line 81
    .line 82
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarInfo;

    .line 87
    .line 88
    iget-object v3, v1, Ll/t1g0;->c:Ljava/util/List;

    .line 89
    .line 90
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarInfo;->userImage:Ljava/lang/String;

    .line 91
    .line 92
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    goto :goto_1

    .line 96
    :cond_3
    iget-object v0, v1, Ll/t1g0;->c:Ljava/util/List;

    .line 97
    .line 98
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    if-eqz v0, :cond_4

    .line 103
    .line 104
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 105
    .line 106
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Wd:I

    .line 107
    .line 108
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    iput-object v0, v1, Ll/t1g0;->b:Ljava/lang/String;

    .line 113
    .line 114
    goto :goto_2

    .line 115
    :cond_4
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 116
    .line 117
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Xd:I

    .line 118
    .line 119
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    iput-object v0, v1, Ll/t1g0;->b:Ljava/lang/String;

    .line 124
    .line 125
    :goto_2
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 126
    .line 127
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryView;

    .line 128
    .line 129
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryView;->m0(Ll/t1g0;)V

    .line 130
    .line 131
    .line 132
    return-void
.end method

.method public final W3(Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarBoard;)Z
    .locals 3

    .line 1
    iget-object v0, p0, Ll/b2g0;->k:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryState;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryState;->playOwn:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryState;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-eq v0, v1, :cond_1

    .line 7
    .line 8
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryState;->playOther:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryState;

    .line 9
    .line 10
    if-ne v0, v1, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    return v2

    .line 14
    :cond_1
    :goto_0
    iget-object p0, p0, Ll/b2g0;->l:Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarBoard;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarBoard;->current:Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarInfo;

    .line 17
    .line 18
    iget v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarInfo;->giftId:I

    .line 19
    .line 20
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarBoard;->current:Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarInfo;

    .line 21
    .line 22
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarInfo;->giftId:I

    .line 23
    .line 24
    if-ne v0, v1, :cond_3

    .line 25
    .line 26
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarInfo;->rank:I

    .line 27
    .line 28
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarInfo;->rank:I

    .line 29
    .line 30
    if-eq p0, p1, :cond_2

    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_2
    return v2

    .line 34
    :cond_3
    :goto_1
    const/4 p0, 0x1

    .line 35
    return p0
.end method

.method public final synthetic X3(Ljava/lang/Long;)V
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryState;->playOwn:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryState;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/b2g0;->R3(Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryState;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ll/b2g0;->f4()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic Y3(Ljava/lang/Long;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/b2g0;->k:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryState;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryState;->intro:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryState;

    .line 4
    .line 5
    if-ne p1, v0, :cond_0

    .line 6
    .line 7
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryState;->playOwn:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryState;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/b2g0;->R3(Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryState;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryState;->playOwn:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryState;

    .line 14
    .line 15
    if-ne p1, v0, :cond_1

    .line 16
    .line 17
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryState;->playOther:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryState;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ll/b2g0;->R3(Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryState;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryState;->playOther:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryState;

    .line 24
    .line 25
    if-ne p1, v1, :cond_2

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Ll/b2g0;->R3(Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryState;)V

    .line 28
    .line 29
    .line 30
    :cond_2
    return-void
.end method

.method public final synthetic Z3(Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/b2g0;->d4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic a4(Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarBoard;)V
    .locals 2

    .line 1
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarBoard;->open:Z

    .line 2
    .line 3
    iput-boolean v0, p0, Ll/b2g0;->o:Z

    .line 4
    .line 5
    invoke-direct {p0}, Ll/b2g0;->V3()V

    .line 6
    .line 7
    .line 8
    iget-boolean v0, p0, Ll/b2g0;->o:Z

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Ll/b2g0;->i:Ll/kcg0;

    .line 13
    .line 14
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarBoard;->config:Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarConfig;

    .line 19
    .line 20
    iget v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarConfig;->pollingIntervalInSeconds:I

    .line 21
    .line 22
    if-lez v0, :cond_1

    .line 23
    .line 24
    invoke-direct {p0, v0}, Ll/b2g0;->g4(I)V

    .line 25
    .line 26
    .line 27
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarBoard;->config:Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarConfig;

    .line 28
    .line 29
    iget v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarConfig;->scrollIntervalInSeconds:I

    .line 30
    .line 31
    const/4 v1, 0x5

    .line 32
    if-le v0, v1, :cond_2

    .line 33
    .line 34
    iput v0, p0, Ll/b2g0;->m:I

    .line 35
    .line 36
    :cond_2
    iget-object v0, p0, Ll/b2g0;->k:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryState;

    .line 37
    .line 38
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryState;->close:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryState;

    .line 39
    .line 40
    if-ne v0, v1, :cond_3

    .line 41
    .line 42
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryState;->intro:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryState;

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Ll/b2g0;->R3(Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryState;)V

    .line 45
    .line 46
    .line 47
    :cond_3
    invoke-virtual {p0, p1}, Ll/b2g0;->W3(Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarBoard;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    iput-object p1, p0, Ll/b2g0;->l:Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarBoard;

    .line 52
    .line 53
    if-eqz v0, :cond_4

    .line 54
    .line 55
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryState;->playOwn:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryState;

    .line 56
    .line 57
    invoke-virtual {p0, p1}, Ll/b2g0;->R3(Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryState;)V

    .line 58
    .line 59
    .line 60
    :cond_4
    return-void
.end method

.method public final synthetic b4(Lcom/p1/mobile/longlink/msg/live/leaderboard/LongLinkLeaderboard$GiftStarLeaderboardChangeMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/b2g0;->d4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic c4(Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData;->b()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iput-boolean p1, p0, Ll/b2g0;->p:Z

    .line 6
    .line 7
    invoke-direct {p0}, Ll/b2g0;->V3()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public e4()V
    .locals 4

    .line 1
    const-string v0, "e_live_giftstar_rank"

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;

    .line 11
    .line 12
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;-><init>()V

    .line 13
    .line 14
    .line 15
    sget-object v1, Ll/efv;->n:Ljava/lang/String;

    .line 16
    .line 17
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->detailUrl:Ljava/lang/String;

    .line 18
    .line 19
    const-wide/high16 v1, 0x3ff0000000000000L    # 1.0

    .line 20
    .line 21
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const-wide/high16 v2, 0x3fe8000000000000L    # 0.75

    .line 26
    .line 27
    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    filled-new-array {v1, v2}, [Ljava/lang/Double;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->detailInset:Ljava/util/List;

    .line 40
    .line 41
    sget-object v1, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;->TRAN_BG:Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;

    .line 42
    .line 43
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->webBgType:Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;

    .line 44
    .line 45
    const/4 v1, 0x1

    .line 46
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->detailGravity:I

    .line 47
    .line 48
    const/4 v1, 0x0

    .line 49
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->isNeedCloseBtn:Z

    .line 50
    .line 51
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->OpenH5Event:Lcom/tantan/live/eventbus/LiveEventBus$OpenH5Event;

    .line 56
    .line 57
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$OpenH5Event;->open()Ll/v3f$d;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    const/16 v1, 0x11f8

    .line 62
    .line 63
    invoke-static {v1}, Ll/px50;->c(I)Ll/px50$a;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    invoke-virtual {v1, v0}, Ll/px50$a;->r(Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;)Ll/px50$a;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {v0}, Ll/px50$a;->q()Ll/px50;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public n()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryState;->close:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryState;

    .line 5
    .line 6
    iput-object v0, p0, Ll/b2g0;->k:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/starboard/StarBoardEntryState;

    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarBoard;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarBoard;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Ll/b2g0;->l:Lcom/p1/mobile/putong/live/base/data/BLiveGiftStarBoard;

    .line 13
    .line 14
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->S4()Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Ll/u1g0;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Ll/u1g0;-><init>(Ll/b2g0;)V

    .line 15
    .line 16
    .line 17
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Ll/oo2;->x0()Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    new-instance v1, Ll/v1g0;

    .line 37
    .line 38
    invoke-direct {v1, p0}, Ll/v1g0;-><init>(Ll/b2g0;)V

    .line 39
    .line 40
    .line 41
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 46
    .line 47
    .line 48
    invoke-direct {p0}, Ll/b2g0;->d4()V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->KeyboardEvent:Lcom/tantan/live/eventbus/LiveEventBus$KeyboardEvent;

    .line 56
    .line 57
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$KeyboardEvent;->show()Ll/v3f$d;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    check-cast v0, Lrx/c;

    .line 66
    .line 67
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    new-instance v1, Ll/w1g0;

    .line 72
    .line 73
    invoke-direct {v1, p0}, Ll/w1g0;-><init>(Ll/b2g0;)V

    .line 74
    .line 75
    .line 76
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 81
    .line 82
    .line 83
    return-void
.end method
