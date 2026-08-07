.class public Ll/eao;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/oo2;",
        "Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryView;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Ll/kcg0;

.field public j:Ll/kcg0;

.field public k:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryState;

.field public l:Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboard;

.field public m:I

.field public final n:I

.field public o:Z

.field public p:Z

.field public q:I


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryState;->close:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryState;

    .line 5
    .line 6
    iput-object p1, p0, Ll/eao;->k:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryState;

    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboard;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboard;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Ll/eao;->l:Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboard;

    .line 13
    .line 14
    const/4 p1, 0x5

    .line 15
    iput p1, p0, Ll/eao;->m:I

    .line 16
    .line 17
    iput p1, p0, Ll/eao;->n:I

    .line 18
    .line 19
    const/4 p1, 0x0

    .line 20
    iput p1, p0, Ll/eao;->q:I

    .line 21
    .line 22
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static synthetic J3(Ll/eao;Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboard;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/eao;->U3(Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboard;)V

    return-void
.end method

.method public static synthetic K3(Ll/eao;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/eao;->X3(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic L3(Ll/eao;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/eao;->W3(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic M3(Ll/eao;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/eao;->Y3(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic N3(Ll/eao;Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/eao;->Z3(Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData;)V

    return-void
.end method

.method private T3()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryView;

    .line 4
    .line 5
    iget-boolean v1, p0, Ll/eao;->o:Z

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-boolean p0, p0, Ll/eao;->p:Z

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
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryView;->p0(Z)V

    .line 17
    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public final O3(Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryState;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryState;->intro:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryState;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/eao;->P3()V

    .line 6
    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryState;->playOwn:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryState;

    .line 10
    .line 11
    if-ne p1, v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/eao;->R3()V

    .line 14
    .line 15
    .line 16
    :cond_1
    :goto_0
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryState;->playStretch:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryState;

    .line 17
    .line 18
    if-ne p1, v0, :cond_2

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/eao;->S3()V

    .line 21
    .line 22
    .line 23
    :cond_2
    return-void
.end method

.method public final P3()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryState;->intro:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryState;

    .line 2
    .line 3
    iput-object v0, p0, Ll/eao;->k:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryState;

    .line 4
    .line 5
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryView;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryView;->n0()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const/4 v1, 0x5

    .line 17
    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 18
    .line 19
    invoke-virtual {v0, v1, v2}, Ll/oo2;->h2(ILjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const/4 v1, 0x1

    .line 24
    invoke-virtual {p0, v0, v1}, Ll/i6t;->I3(Lrx/c;Z)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    new-instance v1, Ll/dao;

    .line 41
    .line 42
    invoke-direct {v1, p0}, Ll/dao;-><init>(Ll/eao;)V

    .line 43
    .line 44
    .line 45
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final R3()V
    .locals 7
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "StringFormatMatches"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryState;->playOwn:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryState;

    .line 2
    .line 3
    iput-object v0, p0, Ll/eao;->k:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryState;

    .line 4
    .line 5
    iget-object v0, p0, Ll/eao;->l:Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboard;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboard;->current:Ljava/util/List;

    .line 8
    .line 9
    new-instance v1, Ll/y9o;

    .line 10
    .line 11
    invoke-direct {v1}, Ll/y9o;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-nez v2, :cond_2

    .line 19
    .line 20
    iget v2, p0, Ll/eao;->q:I

    .line 21
    .line 22
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    rem-int/2addr v2, v3

    .line 27
    if-ltz v2, :cond_1

    .line 28
    .line 29
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    if-lt v2, v3, :cond_0

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    iget v3, p0, Ll/eao;->q:I

    .line 37
    .line 38
    add-int/lit8 v3, v3, 0x1

    .line 39
    .line 40
    iput v3, p0, Ll/eao;->q:I

    .line 41
    .line 42
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftStarInfo;

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_1
    :goto_0
    const/4 v2, 0x0

    .line 50
    iput v2, p0, Ll/eao;->q:I

    .line 51
    .line 52
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftStarInfo;

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_2
    const/4 v0, 0x0

    .line 60
    :goto_1
    if-eqz v0, :cond_5

    .line 61
    .line 62
    iget-wide v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftStarInfo;->rank:J

    .line 63
    .line 64
    const-wide/16 v4, 0x0

    .line 65
    .line 66
    cmp-long v4, v2, v4

    .line 67
    .line 68
    if-lez v4, :cond_4

    .line 69
    .line 70
    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v4

    .line 74
    const-wide/16 v5, 0x63

    .line 75
    .line 76
    cmp-long v2, v2, v5

    .line 77
    .line 78
    if-lez v2, :cond_3

    .line 79
    .line 80
    const-string v4, "99+"

    .line 81
    .line 82
    :cond_3
    sget-object v2, Ll/zrv;->e:Landroid/app/Application;

    .line 83
    .line 84
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->Yd:I

    .line 85
    .line 86
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object v3

    .line 94
    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    iput-object v2, v1, Ll/y9o;->b:Ljava/lang/String;

    .line 99
    .line 100
    goto :goto_2

    .line 101
    :cond_4
    sget-object v2, Ll/zrv;->e:Landroid/app/Application;

    .line 102
    .line 103
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->Zd:I

    .line 104
    .line 105
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    iput-object v2, v1, Ll/y9o;->b:Ljava/lang/String;

    .line 110
    .line 111
    :goto_2
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftStarInfo;->giftIcon:Ljava/lang/String;

    .line 112
    .line 113
    iput-object v2, v1, Ll/y9o;->a:Ljava/lang/String;

    .line 114
    .line 115
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftStarInfo;->giftId:Ljava/lang/String;

    .line 116
    .line 117
    iput-object v0, v1, Ll/y9o;->c:Ljava/lang/String;

    .line 118
    .line 119
    goto :goto_3

    .line 120
    :cond_5
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 121
    .line 122
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Zd:I

    .line 123
    .line 124
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    iput-object v0, v1, Ll/y9o;->b:Ljava/lang/String;

    .line 129
    .line 130
    const-string v0, ""

    .line 131
    .line 132
    iput-object v0, v1, Ll/y9o;->a:Ljava/lang/String;

    .line 133
    .line 134
    :goto_3
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 135
    .line 136
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryView;

    .line 137
    .line 138
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryView;->m0(Ll/y9o;)V

    .line 139
    .line 140
    .line 141
    return-void
.end method

.method public final S3()V
    .locals 9

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryState;->playStretch:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryState;

    .line 2
    .line 3
    iput-object v0, p0, Ll/eao;->k:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryState;

    .line 4
    .line 5
    iget-object v0, p0, Ll/eao;->l:Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboard;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboard;->current:Ljava/util/List;

    .line 8
    .line 9
    new-instance v1, Ll/y9o;

    .line 10
    .line 11
    invoke-direct {v1}, Ll/y9o;-><init>()V

    .line 12
    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    iput v2, p0, Ll/eao;->q:I

    .line 16
    .line 17
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    if-nez v3, :cond_5

    .line 22
    .line 23
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftStarInfo;

    .line 28
    .line 29
    if-eqz v0, :cond_5

    .line 30
    .line 31
    iget-wide v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftStarInfo;->rank:J

    .line 32
    .line 33
    const-wide/16 v4, 0x14

    .line 34
    .line 35
    cmp-long v4, v2, v4

    .line 36
    .line 37
    const-wide/16 v5, 0xa

    .line 38
    .line 39
    if-gtz v4, :cond_0

    .line 40
    .line 41
    cmp-long v4, v2, v5

    .line 42
    .line 43
    if-lez v4, :cond_0

    .line 44
    .line 45
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->t7:I

    .line 46
    .line 47
    iget-wide v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftStarInfo;->gap:J

    .line 48
    .line 49
    long-to-double v3, v3

    .line 50
    invoke-static {v3, v4}, Ll/yau;->c(D)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    const-string v4, "10"

    .line 55
    .line 56
    filled-new-array {v4, v3}, [Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    invoke-static {v2, v3}, Ll/xau;->v(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    iput-object v2, v1, Ll/y9o;->b:Ljava/lang/String;

    .line 65
    .line 66
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftStarInfo;->giftIcon:Ljava/lang/String;

    .line 67
    .line 68
    iput-object v0, v1, Ll/y9o;->a:Ljava/lang/String;

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_0
    const-wide/16 v7, 0x2

    .line 72
    .line 73
    cmp-long v4, v2, v7

    .line 74
    .line 75
    if-ltz v4, :cond_1

    .line 76
    .line 77
    cmp-long v4, v2, v5

    .line 78
    .line 79
    if-gtz v4, :cond_1

    .line 80
    .line 81
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->u7:I

    .line 82
    .line 83
    iget-wide v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftStarInfo;->gap:J

    .line 84
    .line 85
    long-to-double v3, v3

    .line 86
    invoke-static {v3, v4}, Ll/yau;->c(D)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    invoke-static {v2, v3}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    iput-object v2, v1, Ll/y9o;->b:Ljava/lang/String;

    .line 95
    .line 96
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftStarInfo;->giftIcon:Ljava/lang/String;

    .line 97
    .line 98
    iput-object v0, v1, Ll/y9o;->a:Ljava/lang/String;

    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_1
    const-wide/16 v4, 0x1

    .line 102
    .line 103
    cmp-long v4, v2, v4

    .line 104
    .line 105
    if-nez v4, :cond_2

    .line 106
    .line 107
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->v7:I

    .line 108
    .line 109
    iget-wide v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftStarInfo;->gap:J

    .line 110
    .line 111
    long-to-double v3, v3

    .line 112
    invoke-static {v3, v4}, Ll/yau;->c(D)Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v3

    .line 116
    invoke-static {v2, v3}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v2

    .line 120
    iput-object v2, v1, Ll/y9o;->b:Ljava/lang/String;

    .line 121
    .line 122
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftStarInfo;->giftIcon:Ljava/lang/String;

    .line 123
    .line 124
    iput-object v0, v1, Ll/y9o;->a:Ljava/lang/String;

    .line 125
    .line 126
    goto :goto_0

    .line 127
    :cond_2
    const-wide/16 v4, 0x0

    .line 128
    .line 129
    cmp-long v4, v2, v4

    .line 130
    .line 131
    if-lez v4, :cond_4

    .line 132
    .line 133
    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object v4

    .line 137
    const-wide/16 v5, 0x63

    .line 138
    .line 139
    cmp-long v2, v2, v5

    .line 140
    .line 141
    if-lez v2, :cond_3

    .line 142
    .line 143
    const-string v4, "99+"

    .line 144
    .line 145
    :cond_3
    sget-object v2, Ll/zrv;->e:Landroid/app/Application;

    .line 146
    .line 147
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->Yd:I

    .line 148
    .line 149
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v2

    .line 153
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 154
    .line 155
    .line 156
    move-result-object v3

    .line 157
    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v2

    .line 161
    iput-object v2, v1, Ll/y9o;->b:Ljava/lang/String;

    .line 162
    .line 163
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftStarInfo;->giftIcon:Ljava/lang/String;

    .line 164
    .line 165
    iput-object v0, v1, Ll/y9o;->a:Ljava/lang/String;

    .line 166
    .line 167
    goto :goto_0

    .line 168
    :cond_4
    sget-object v2, Ll/zrv;->e:Landroid/app/Application;

    .line 169
    .line 170
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->Zd:I

    .line 171
    .line 172
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object v2

    .line 176
    iput-object v2, v1, Ll/y9o;->b:Ljava/lang/String;

    .line 177
    .line 178
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftStarInfo;->giftIcon:Ljava/lang/String;

    .line 179
    .line 180
    iput-object v0, v1, Ll/y9o;->a:Ljava/lang/String;

    .line 181
    .line 182
    :goto_0
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 183
    .line 184
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryView;

    .line 185
    .line 186
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryView;->m0(Ll/y9o;)V

    .line 187
    .line 188
    .line 189
    :cond_5
    return-void
.end method

.method public final U3(Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboard;)V
    .locals 1

    .line 1
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboard;->open:Z

    .line 2
    .line 3
    iput-boolean v0, p0, Ll/eao;->o:Z

    .line 4
    .line 5
    invoke-direct {p0}, Ll/eao;->T3()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ll/oo2;->Z0()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 19
    .line 20
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryView;

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryView;->o0()V

    .line 23
    .line 24
    .line 25
    iput-object p1, p0, Ll/eao;->l:Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboard;

    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    invoke-virtual {p0, p1}, Ll/eao;->V3(Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboard;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final V3(Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboard;)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Ll/eao;->o:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Ll/eao;->i:Ll/kcg0;

    .line 6
    .line 7
    invoke-static {p1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/eao;->j:Ll/kcg0;

    .line 11
    .line 12
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboard;->config:Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboardConfig;

    .line 17
    .line 18
    iget-wide v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboardConfig;->pollingIntervalInSeconds:J

    .line 19
    .line 20
    const-wide/16 v2, 0x0

    .line 21
    .line 22
    cmp-long v2, v0, v2

    .line 23
    .line 24
    if-lez v2, :cond_1

    .line 25
    .line 26
    long-to-int v0, v0

    .line 27
    invoke-virtual {p0, v0}, Ll/eao;->d4(I)V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    const/16 v0, 0x28

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Ll/eao;->d4(I)V

    .line 34
    .line 35
    .line 36
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboard;->config:Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboardConfig;

    .line 37
    .line 38
    iget-wide v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboardConfig;->scrollIntervalInSeconds:J

    .line 39
    .line 40
    const-wide/16 v2, 0x5

    .line 41
    .line 42
    cmp-long v2, v0, v2

    .line 43
    .line 44
    if-lez v2, :cond_2

    .line 45
    .line 46
    long-to-int v0, v0

    .line 47
    iput v0, p0, Ll/eao;->m:I

    .line 48
    .line 49
    :cond_2
    iput-object p1, p0, Ll/eao;->l:Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboard;

    .line 50
    .line 51
    iget-object v0, p0, Ll/eao;->k:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryState;

    .line 52
    .line 53
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryState;->close:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryState;

    .line 54
    .line 55
    if-ne v0, v1, :cond_3

    .line 56
    .line 57
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryState;->intro:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryState;

    .line 58
    .line 59
    invoke-virtual {p0, p1}, Ll/eao;->O3(Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryState;)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_3
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboard;->homeStretch:Z

    .line 64
    .line 65
    if-eqz p1, :cond_4

    .line 66
    .line 67
    iget-object p1, p0, Ll/eao;->j:Ll/kcg0;

    .line 68
    .line 69
    invoke-static {p1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 70
    .line 71
    .line 72
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryState;->playStretch:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryState;

    .line 73
    .line 74
    invoke-virtual {p0, p1}, Ll/eao;->O3(Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryState;)V

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :cond_4
    const/4 p1, 0x0

    .line 79
    iput p1, p0, Ll/eao;->q:I

    .line 80
    .line 81
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryState;->playOwn:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryState;

    .line 82
    .line 83
    invoke-virtual {p0, p1}, Ll/eao;->O3(Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryState;)V

    .line 84
    .line 85
    .line 86
    iget-object p1, p0, Ll/eao;->l:Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboard;

    .line 87
    .line 88
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboard;->current:Ljava/util/List;

    .line 89
    .line 90
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    if-nez p1, :cond_5

    .line 95
    .line 96
    invoke-virtual {p0}, Ll/eao;->c4()V

    .line 97
    .line 98
    .line 99
    :cond_5
    return-void
.end method

.method public final synthetic W3(Ljava/lang/Long;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/eao;->l:Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboard;

    .line 2
    .line 3
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboard;->homeStretch:Z

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p1, p0, Ll/eao;->j:Ll/kcg0;

    .line 8
    .line 9
    invoke-static {p1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 10
    .line 11
    .line 12
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryState;->playStretch:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryState;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ll/eao;->O3(Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryState;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryState;->playOwn:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryState;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ll/eao;->O3(Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryState;)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Ll/eao;->l:Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboard;

    .line 24
    .line 25
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboard;->current:Ljava/util/List;

    .line 26
    .line 27
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-nez p1, :cond_1

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/eao;->c4()V

    .line 34
    .line 35
    .line 36
    :cond_1
    return-void
.end method

.method public final synthetic X3(Ljava/lang/Long;)V
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryState;->playOwn:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryState;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/eao;->O3(Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryState;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic Y3(Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/eao;->a4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic Z3(Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData;->b()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iput-boolean p1, p0, Ll/eao;->p:Z

    .line 6
    .line 7
    invoke-direct {p0}, Ll/eao;->T3()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public a4()V
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
    invoke-virtual {p0}, Ll/oo2;->Z0()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const-string p0, "voice"

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const-string p0, "live"

    .line 25
    .line 26
    :goto_0
    invoke-static {v0, p0}, Ll/kbo;->l(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public b4(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/eao;->l:Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboard;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    new-instance v0, Ll/bae0$b;

    .line 10
    .line 11
    invoke-direct {v0}, Ll/bae0$b;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-nez v1, :cond_0

    .line 19
    .line 20
    const-string v1, "giftId"

    .line 21
    .line 22
    invoke-virtual {v0, v1, p1}, Ll/bae0$b;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->SchemeHandleEvent:Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;

    .line 30
    .line 31
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;->handleScheme()Ll/v3f$d;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    new-instance v1, Ll/bae0$a;

    .line 36
    .line 37
    const/16 v2, 0xc8

    .line 38
    .line 39
    invoke-direct {v1, v2}, Ll/bae0$a;-><init>(I)V

    .line 40
    .line 41
    .line 42
    iget-object v2, p0, Ll/eao;->l:Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboard;

    .line 43
    .line 44
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboard;->jumpUrl:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {v1, v2}, Ll/bae0$a;->e(Ljava/lang/String;)Ll/bae0$a;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v1, v0}, Ll/bae0$a;->d(Ll/bae0$b;)Ll/bae0$a;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0}, Ll/bae0$a;->c()Ll/bae0;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {p1, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    if-eqz p0, :cond_1

    .line 66
    .line 67
    const-string p0, "p_anchor_live_room"

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_1
    const-string p0, "p_user_live_room"

    .line 71
    .line 72
    :goto_0
    const-string p1, "e_mln_daily_rank_ent"

    .line 73
    .line 74
    invoke-static {p1, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    :cond_2
    return-void
.end method

.method public final c4()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/eao;->j:Ll/kcg0;

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
    iget v1, p0, Ll/eao;->m:I

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
    new-instance v1, Ll/bao;

    .line 38
    .line 39
    invoke-direct {v1, p0}, Ll/bao;-><init>(Ll/eao;)V

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
    iput-object v0, p0, Ll/eao;->j:Ll/kcg0;

    .line 51
    .line 52
    return-void
.end method

.method public final d4(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/eao;->i:Ll/kcg0;

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
    new-instance v0, Ll/cao;

    .line 28
    .line 29
    invoke-direct {v0, p0}, Ll/cao;-><init>(Ll/eao;)V

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
    iput-object p1, p0, Ll/eao;->i:Ll/kcg0;

    .line 41
    .line 42
    return-void
.end method

.method public n()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryState;->close:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryState;

    .line 5
    .line 6
    iput-object v0, p0, Ll/eao;->k:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryState;

    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboard;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboard;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Ll/eao;->l:Lcom/p1/mobile/putong/live/base/data/BLiveIntlGiftLeaderboard;

    .line 13
    .line 14
    iget-object v0, p0, Ll/eao;->j:Ll/kcg0;

    .line 15
    .line 16
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Ll/eao;->i:Ll/kcg0;

    .line 20
    .line 21
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/kbo;->j()Lrx/c;

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
    new-instance v1, Ll/z9o;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Ll/z9o;-><init>(Ll/eao;)V

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
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Ll/aj1;->p()Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    new-instance v1, Ll/z9o;

    .line 41
    .line 42
    invoke-direct {v1, p0}, Ll/z9o;-><init>(Ll/eao;)V

    .line 43
    .line 44
    .line 45
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Ll/eao;->a4()V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->KeyboardEvent:Lcom/tantan/live/eventbus/LiveEventBus$KeyboardEvent;

    .line 60
    .line 61
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$KeyboardEvent;->show()Ll/v3f$d;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    check-cast v0, Lrx/c;

    .line 70
    .line 71
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    new-instance v1, Ll/aao;

    .line 76
    .line 77
    invoke-direct {v1, p0}, Ll/aao;-><init>(Ll/eao;)V

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
    return-void
.end method
