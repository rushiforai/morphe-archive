.class public Ll/y3o;
.super Ll/a1u;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/a1u<",
        "Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;",
        ">;"
    }
.end annotation


# instance fields
.field public final l:Ll/h3o;


# direct methods
.method public constructor <init>(Ll/ner;Ll/nus;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/a1u;-><init>(Ll/ner;Ll/nus;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/h3o;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/mus;->act()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    invoke-direct {p1, p2}, Ll/h3o;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Ll/y3o;->l:Ll/h3o;

    .line 14
    .line 15
    return-void
.end method

.method public static synthetic U2(Ll/y3o;Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/y3o;->f3(Ljava/lang/Long;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic V2(Ll/y3o;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/y3o;->h3(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic W2(Ljava/lang/Boolean;)Ljava/lang/Boolean;
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

.method public static synthetic X2(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/t4u;->b()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Y2(Ll/y3o;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/y3o;->g3(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic Z2(Ll/y3o;Lcom/p1/mobile/putong/live/external/square/api/ModelData;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/y3o;->d3(Lcom/p1/mobile/putong/live/external/square/api/ModelData;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic a3(Ll/y3o;Lcom/p1/mobile/putong/live/external/square/api/ModelData;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/y3o;->e3(Lcom/p1/mobile/putong/live/external/square/api/ModelData;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method private synthetic d3(Lcom/p1/mobile/putong/live/external/square/api/ModelData;)Lkotlin/Unit;
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/square/api/ModelData;->isLoading()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 8
    .line 9
    check-cast v0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->E5()V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/square/api/ModelData;->isComplete()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 21
    .line 22
    check-cast v0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->C5()V

    .line 25
    .line 26
    .line 27
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/square/api/ModelData;->isError()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_5

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/a1u;->T2()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/square/api/ModelData;->getThrowable()Ljava/lang/Throwable;

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 40
    .line 41
    check-cast v0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;

    .line 42
    .line 43
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->K5()V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0, p1}, Ll/y3o;->b3(Lcom/p1/mobile/putong/live/external/square/api/ModelData;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eqz v0, :cond_3

    .line 51
    .line 52
    iget-object v0, p0, Ll/y3o;->l:Ll/h3o;

    .line 53
    .line 54
    invoke-virtual {v0}, Ll/h3o;->getInfo()Ll/p5u;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    if-eqz v0, :cond_2

    .line 59
    .line 60
    iget-object v0, p0, Ll/y3o;->l:Ll/h3o;

    .line 61
    .line 62
    invoke-virtual {v0}, Ll/h3o;->getInfo()Ll/p5u;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {v0}, Ll/p5u;->F()Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-eqz v0, :cond_4

    .line 71
    .line 72
    :cond_2
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 73
    .line 74
    check-cast p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;

    .line 75
    .line 76
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/square/api/ModelData;->getThrowable()Ljava/lang/Throwable;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->F5(Ljava/lang/Throwable;)V

    .line 81
    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_3
    invoke-virtual {p0, p1}, Ll/y3o;->c3(Lcom/p1/mobile/putong/live/external/square/api/ModelData;)Z

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    if-eqz p1, :cond_4

    .line 89
    .line 90
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 91
    .line 92
    check-cast p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;

    .line 93
    .line 94
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->D5()V

    .line 95
    .line 96
    .line 97
    :cond_4
    :goto_0
    sget-object p0, Ll/tbs;->a:Landroid/app/Application;

    .line 98
    .line 99
    sget p1, Lcom/p1/mobile/putong/live/base/R$string;->a0:I

    .line 100
    .line 101
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    :cond_5
    const/4 p0, 0x0

    .line 109
    return-object p0
.end method

.method private synthetic e3(Lcom/p1/mobile/putong/live/external/square/api/ModelData;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/square/api/ModelData;->isSuccess()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p1, p0, Ll/y3o;->l:Ll/h3o;

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/h3o;->getInfo()Ll/p5u;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast p1, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;

    .line 18
    .line 19
    iget-object p0, p0, Ll/y3o;->l:Ll/h3o;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/h3o;->getInfo()Ll/p5u;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->H5(Ll/p5u;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    const/4 p0, 0x0

    .line 29
    return-object p0
.end method

.method private synthetic f3(Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;->Q4()Z

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

.method private synthetic g3(Ljava/lang/Long;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y3o;->l:Ll/h3o;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/h3o;->updateCurrentLiveInfo()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic h3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/a1u;->T2()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public I2()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/y3o;->l:Ll/h3o;

    .line 2
    .line 3
    new-instance v1, Ll/u3o;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/u3o;-><init>(Ll/y3o;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/external/square/api/BaseAsyncPlug;->observe(Lkotlin/jvm/functions/Function1;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/y3o;->l:Ll/h3o;

    .line 12
    .line 13
    iget-object v1, p0, Ll/a1u;->k:Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ll/h3o;->setLiveSquareTab(Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/y3o;->l:Ll/h3o;

    .line 19
    .line 20
    new-instance v1, Ll/v3o;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/v3o;-><init>(Ll/y3o;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/external/square/api/BaseAsyncPlug;->observe(Lkotlin/jvm/functions/Function1;)V

    .line 26
    .line 27
    .line 28
    invoke-static {}, Ll/mbs;->e()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->signedIn()Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    new-instance v0, Ll/w3o;

    .line 37
    .line 38
    invoke-direct {v0}, Ll/w3o;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0, v0}, Lrx/c;->takeFirst(Ll/qcj;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    new-instance v0, Ll/x3o;

    .line 46
    .line 47
    invoke-direct {v0}, Ll/x3o;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-static {v0}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public b3(Lcom/p1/mobile/putong/live/external/square/api/ModelData;)Z
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-string p0, ""

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/square/api/ModelData;->getMessage()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    :goto_0
    const-string p1, "TYPE_LOAD_ALL"

    .line 11
    .line 12
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0
.end method

.method public c3(Lcom/p1/mobile/putong/live/external/square/api/ModelData;)Z
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-string p0, ""

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/square/api/ModelData;->getMessage()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    :goto_0
    const-string p1, "TYPE_LOAD_MORE"

    .line 11
    .line 12
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0
.end method

.method public i3()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y3o;->l:Ll/h3o;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/h3o;->getData()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public j3(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y3o;->l:Ll/h3o;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/h3o;->loadNextPage(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public k3()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/a1u;->f:Ll/ft5;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ft5;->c()V

    .line 4
    .line 5
    .line 6
    iget v0, p0, Ll/a1u;->g:I

    .line 7
    .line 8
    int-to-long v0, v0

    .line 9
    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 10
    .line 11
    invoke-static {v0, v1, v2}, Lrx/c;->interval(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

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
    new-instance v1, Ll/r3o;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/r3o;-><init>(Ll/y3o;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    new-instance v1, Ll/s3o;

    .line 41
    .line 42
    invoke-direct {v1, p0}, Ll/s3o;-><init>(Ll/y3o;)V

    .line 43
    .line 44
    .line 45
    new-instance v2, Ll/t3o;

    .line 46
    .line 47
    invoke-direct {v2, p0}, Ll/t3o;-><init>(Ll/y3o;)V

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
    move-result-object v0

    .line 58
    iget-object p0, p0, Ll/a1u;->f:Ll/ft5;

    .line 59
    .line 60
    invoke-virtual {p0, v0}, Ll/ft5;->a(Ll/kcg0;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/l6t;->n()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/a1u;->f:Ll/ft5;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/ft5;->c()V

    .line 7
    .line 8
    .line 9
    return-void
.end method
