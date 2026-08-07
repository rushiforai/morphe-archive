.class public Ll/r9o;
.super Ll/k4o;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/k4o<",
        "Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/suggestedTab/IntlLiveSquareSuggestedFrag;",
        ">;"
    }
.end annotation


# instance fields
.field public n:Z


# direct methods
.method public constructor <init>(Ll/ner;Ll/nus;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/k4o;-><init>(Ll/ner;Ll/nus;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Ll/r9o;->n:Z

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic j3(Ll/r9o;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/r9o;->H3(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic k3(Ll/r9o;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/r9o;->F3(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic m3(Ll/r9o;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/r9o;->C3(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic n3(Ll/r9o;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/r9o;->D3(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic o3()Lrx/c;
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-static {v0}, Ll/t4u;->e(I)Lrx/c;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    return-object v0
.end method

.method public static synthetic p3(Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static synthetic q3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic r3(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/t4u;->b()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic s3(Ll/r9o;Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/r9o;->E3(Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic t3(Ll/r9o;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/r9o;->G3(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic u3(Ljava/util/Map;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, "guide"

    .line 2
    .line 3
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Boolean;

    .line 8
    .line 9
    return-object p0
.end method

.method public static synthetic v3(Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic w3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic x3(Ll/r9o;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/r9o;->I3(Landroid/util/Pair;)V

    return-void
.end method


# virtual methods
.method public B3()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/k2o;->k:Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

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
    iget-object p0, p0, Ll/k2o;->k:Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->name:Ljava/lang/String;

    .line 12
    .line 13
    const-string v0, "square-suggested"

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

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

.method public final synthetic C3(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/suggestedTab/IntlLiveSquareSuggestedFrag;

    .line 4
    .line 5
    const/4 p1, 0x1

    .line 6
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;->P:Z

    .line 7
    .line 8
    return-void
.end method

.method public final synthetic D3(Ljava/lang/Integer;)V
    .locals 3

    .line 1
    iget-object p1, p0, Ll/k4o;->l:Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlLiveSquareSuggestApiPlug;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlLiveSquareSuggestApiPlug;->getInfo()Ll/z8o;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/k4o;->l:Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlLiveSquareSuggestApiPlug;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlLiveSquareSuggestApiPlug;->getInfo()Ll/z8o;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object p1, p1, Ll/ubu;->a:Ljava/util/List;

    .line 16
    .line 17
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-nez p1, :cond_0

    .line 22
    .line 23
    const/4 p1, 0x1

    .line 24
    invoke-virtual {p0, p1}, Ll/k2o;->S2(Z)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Ll/k4o;->l:Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlLiveSquareSuggestApiPlug;

    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlLiveSquareSuggestApiPlug;->getInfo()Ll/z8o;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iget-object p1, p1, Ll/ubu;->a:Ljava/util/List;

    .line 34
    .line 35
    const/4 v0, 0x0

    .line 36
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 41
    .line 42
    iget-object v1, p0, Ll/k4o;->l:Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlLiveSquareSuggestApiPlug;

    .line 43
    .line 44
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlLiveSquareSuggestApiPlug;->getInfo()Ll/z8o;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    iget-object v1, v1, Ll/ubu;->a:Ljava/util/List;

    .line 49
    .line 50
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 55
    .line 56
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->recommendInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;

    .line 57
    .line 58
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;->category:Ljava/lang/String;

    .line 59
    .line 60
    const/4 v1, 0x0

    .line 61
    const-string v2, "sign-in-suggested"

    .line 62
    .line 63
    invoke-virtual {p0, p1, v2, v0, v1}, Ll/r9o;->R2(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_0
    sget p0, Lcom/p1/mobile/putong/live/base/R$string;->u0:I

    .line 68
    .line 69
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public final synthetic E3(Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;)Lkotlin/Unit;
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;->isSuccess()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/k4o;->l:Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlLiveSquareSuggestApiPlug;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlLiveSquareSuggestApiPlug;->getInfo()Ll/z8o;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast v0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/suggestedTab/IntlLiveSquareSuggestedFrag;

    .line 18
    .line 19
    iget-object v1, p0, Ll/k4o;->l:Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlLiveSquareSuggestApiPlug;

    .line 20
    .line 21
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlLiveSquareSuggestApiPlug;->getInfo()Ll/z8o;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/suggestedTab/IntlLiveSquareSuggestedFrag;->Y5(Ll/z8o;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;->getMessage()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, p1}, Ll/k4o;->a3(Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_0

    .line 36
    .line 37
    invoke-virtual {p0}, Ll/r9o;->J3()V

    .line 38
    .line 39
    .line 40
    :cond_0
    const/4 p0, 0x0

    .line 41
    return-object p0
.end method

.method public final synthetic F3(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iput-boolean p1, p0, Ll/r9o;->n:Z

    .line 6
    .line 7
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 8
    .line 9
    check-cast p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/suggestedTab/IntlLiveSquareSuggestedFrag;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/suggestedTab/IntlLiveSquareSuggestedFrag;->X5(Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic G3(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    new-instance v0, Ll/e9o;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/e9o;-><init>(Ll/r9o;Ljava/lang/Boolean;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic H3(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/suggestedTab/IntlLiveSquareSuggestedFrag;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;->I5()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public I2()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/k4o;->I2()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x3

    .line 5
    invoke-static {v0}, Ll/t4u;->e(I)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/c9o;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/c9o;-><init>(Ll/r9o;)V

    .line 16
    .line 17
    .line 18
    new-instance v2, Ll/j9o;

    .line 19
    .line 20
    invoke-direct {v2}, Ll/j9o;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    new-instance v0, Ll/k9o;

    .line 31
    .line 32
    invoke-direct {v0}, Ll/k9o;-><init>()V

    .line 33
    .line 34
    .line 35
    const/4 v1, 0x0

    .line 36
    invoke-virtual {p0, v0, v1}, Ll/cyr;->duringCreated(Ll/pcj;Z)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    new-instance v1, Ll/l9o;

    .line 41
    .line 42
    invoke-direct {v1, p0}, Ll/l9o;-><init>(Ll/r9o;)V

    .line 43
    .line 44
    .line 45
    new-instance v2, Ll/m9o;

    .line 46
    .line 47
    invoke-direct {v2}, Ll/m9o;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Ll/k4o;->l:Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlLiveSquareSuggestApiPlug;

    .line 58
    .line 59
    iget-object v1, p0, Ll/k2o;->k:Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlLiveSquareSuggestApiPlug;->setLiveSquareTab(Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Ll/k4o;->l:Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlLiveSquareSuggestApiPlug;

    .line 65
    .line 66
    new-instance v1, Ll/n9o;

    .line 67
    .line 68
    invoke-direct {v1, p0}, Ll/n9o;-><init>(Ll/r9o;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlBaseAsyncPlug;->observe(Lkotlin/jvm/functions/Function1;)V

    .line 72
    .line 73
    .line 74
    invoke-static {}, Ll/t4u;->f()Lrx/c;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    new-instance v1, Ll/o9o;

    .line 83
    .line 84
    invoke-direct {v1}, Ll/o9o;-><init>()V

    .line 85
    .line 86
    .line 87
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    new-instance v1, Ll/p9o;

    .line 92
    .line 93
    invoke-direct {v1}, Ll/p9o;-><init>()V

    .line 94
    .line 95
    .line 96
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    new-instance v1, Ll/q9o;

    .line 109
    .line 110
    invoke-direct {v1, p0}, Ll/q9o;-><init>(Ll/r9o;)V

    .line 111
    .line 112
    .line 113
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 118
    .line 119
    .line 120
    invoke-static {}, Ll/mbs;->e()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->signedIn()Lrx/c;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    new-instance v0, Ll/d9o;

    .line 129
    .line 130
    invoke-direct {v0}, Ll/d9o;-><init>()V

    .line 131
    .line 132
    .line 133
    invoke-virtual {p0, v0}, Lrx/c;->takeFirst(Ll/qcj;)Lrx/c;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    new-instance v0, Ll/i9o;

    .line 138
    .line 139
    invoke-direct {v0}, Ll/i9o;-><init>()V

    .line 140
    .line 141
    .line 142
    invoke-static {v0}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 147
    .line 148
    .line 149
    return-void
.end method

.method public final synthetic I3(Landroid/util/Pair;)V
    .locals 1

    .line 1
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget-object v0, p0, Ll/k4o;->l:Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlLiveSquareSuggestApiPlug;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlLiveSquareSuggestApiPlug;->getInfo()Ll/z8o;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    iget-object v0, p0, Ll/k4o;->l:Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlLiveSquareSuggestApiPlug;

    .line 31
    .line 32
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlLiveSquareSuggestApiPlug;->getInfo()Ll/z8o;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0, p1}, Ll/z8o;->H(Landroid/util/Pair;)V

    .line 37
    .line 38
    .line 39
    :cond_1
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 40
    .line 41
    check-cast p1, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/suggestedTab/IntlLiveSquareSuggestedFrag;

    .line 42
    .line 43
    iget-object p0, p0, Ll/k4o;->l:Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlLiveSquareSuggestApiPlug;

    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlLiveSquareSuggestApiPlug;->getInfo()Ll/z8o;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/suggestedTab/IntlLiveSquareSuggestedFrag;->Y5(Ll/z8o;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public J3()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/r9o;->B3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/r9o;->z3()Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0}, Ll/r9o;->y3()Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    new-instance v2, Ll/f9o;

    .line 16
    .line 17
    invoke-direct {v2}, Ll/f9o;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-static {v0, v1, v2}, Lrx/c;->combineLatest(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/g9o;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/g9o;-><init>(Ll/r9o;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method

.method public R2(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Ll/k2o;->R2(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast p1, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/suggestedTab/IntlLiveSquareSuggestedFrag;

    .line 7
    .line 8
    const/4 p2, 0x1

    .line 9
    iput-boolean p2, p1, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;->P:Z

    .line 10
    .line 11
    iget-object p1, p0, Ll/k4o;->m:Ll/kcg0;

    .line 12
    .line 13
    invoke-static {p1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 14
    .line 15
    .line 16
    invoke-static {p2}, Ll/t4u;->e(I)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    invoke-virtual {p1, p2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    new-instance p2, Ll/h9o;

    .line 33
    .line 34
    invoke-direct {p2, p0}, Ll/h9o;-><init>(Ll/r9o;)V

    .line 35
    .line 36
    .line 37
    invoke-static {p2}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    iput-object p1, p0, Ll/k4o;->m:Ll/kcg0;

    .line 46
    .line 47
    return-void
.end method

.method public final y3()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/k4o;->l:Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlLiveSquareSuggestApiPlug;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlLiveSquareSuggestApiPlug;->getInfo()Ll/z8o;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    iget-object v0, v0, Ll/z8o;->c:Ljava/util/List;

    .line 14
    .line 15
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x0

    .line 22
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0

    .line 27
    :cond_0
    invoke-static {}, Ll/mbs;->g()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p0}, Ll/mus;->act()Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-interface {v0, p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->i0(Lcom/p1/mobile/android/app/Act;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0
.end method

.method public final z3()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/mbs;->g()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/mus;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {v0, p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->E5(Lcom/p1/mobile/android/app/Act;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method
