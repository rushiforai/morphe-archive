.class public Ll/pmt;
.super Ll/klt;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/klt<",
        "Ll/rnt;",
        ">;"
    }
.end annotation


# instance fields
.field public f:Ljava/lang/String;

.field public g:Ll/kcg0;


# direct methods
.method public constructor <init>(Ll/ner;Ll/imt;Lv/VRecyclerView;Lv/VText;Lv/VEditText;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/klt;-><init>(Ll/ner;Ll/imt;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Ll/pmt;->f:Ljava/lang/String;

    .line 6
    .line 7
    new-instance p1, Ll/rnt;

    .line 8
    .line 9
    invoke-direct {p1, p0, p3, p4, p5}, Ll/rnt;-><init>(Ll/pmt;Lv/VRecyclerView;Lv/VText;Lv/VEditText;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic H2(Ll/pmt;Lcom/p1/mobile/putong/live/external/page/search/base/LiveAnchorsInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pmt;->R2(Lcom/p1/mobile/putong/live/external/page/search/base/LiveAnchorsInfo;)V

    return-void
.end method

.method public static synthetic I2(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    instance-of v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->isFollowForbidden()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    sget p0, Lcom/p1/mobile/putong/live/base/R$string;->m:I

    .line 14
    .line 15
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public static synthetic K2(Lcom/p1/mobile/putong/data/Followship;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic L2(Ll/pmt;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pmt;->P2(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic M2(Ll/pmt;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/pmt;->Q2(Ljava/lang/String;)V

    return-void
.end method

.method private synthetic Q2(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/rnt;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/rnt;->p(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public L0(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/klt;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "anchor-search"

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    invoke-static {v0, p1, v1, v2}, Ll/mbs;->k0(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/klt;->D2()Lcom/tantan/live/search/eventbus/LiveSearchEventBus;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    iget-object p0, p0, Lcom/tantan/live/search/eventbus/LiveSearchEventBus;->LiveSearchHistoryEvent:Lcom/tantan/live/search/eventbus/LiveSearchEventBus$LiveSearchHistoryEvent;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/tantan/live/search/eventbus/LiveSearchEventBus$LiveSearchHistoryEvent;->addRecord()Ll/v3f$d;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0, p2}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public N2(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Ljava/lang/String;)V
    .locals 4

    .line 1
    sget-object v0, Ll/tbs;->f:Ll/j6t;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/klt;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->getBuilder()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-virtual {v2, p1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->D(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    const-string v3, "anchor-search"

    .line 16
    .line 17
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->O(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->recommendInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;

    .line 22
    .line 23
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;->category:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v2, p1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->y(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->u()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {v0, v1, p1}, Ll/j6t;->f(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)Landroid/content/Intent;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p0}, Ll/klt;->act()Lcom/p1/mobile/android/app/Act;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Ll/klt;->D2()Lcom/tantan/live/search/eventbus/LiveSearchEventBus;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    iget-object p0, p0, Lcom/tantan/live/search/eventbus/LiveSearchEventBus;->LiveSearchHistoryEvent:Lcom/tantan/live/search/eventbus/LiveSearchEventBus$LiveSearchHistoryEvent;

    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/tantan/live/search/eventbus/LiveSearchEventBus$LiveSearchHistoryEvent;->addRecord()Ll/v3f$d;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p0, p2}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public final synthetic P2(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/rnt;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/rnt;->H(Lcom/p1/mobile/putong/data/User;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic R2(Lcom/p1/mobile/putong/live/external/page/search/base/LiveAnchorsInfo;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/rnt;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/rnt;->G(Lcom/p1/mobile/putong/live/external/page/search/base/LiveAnchorsInfo;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/klt;->D2()Lcom/tantan/live/search/eventbus/LiveSearchEventBus;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    iget-object p0, p0, Lcom/tantan/live/search/eventbus/LiveSearchEventBus;->LiveSearchEvent:Lcom/tantan/live/search/eventbus/LiveSearchEventBus$LiveSearchEvent;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/tantan/live/search/eventbus/LiveSearchEventBus$LiveSearchEvent;->onSearchResult()Ll/v3f$d;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public S2(Ll/jlt;)V
    .locals 1

    .line 1
    const-string v0, "anchorSearch"

    .line 2
    .line 3
    invoke-virtual {p1, v0, v0}, Ll/jlt;->I(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance p1, Ll/nmt;

    .line 12
    .line 13
    invoke-direct {p1}, Ll/nmt;-><init>()V

    .line 14
    .line 15
    .line 16
    new-instance v0, Ll/omt;

    .line 17
    .line 18
    invoke-direct {v0}, Ll/omt;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-static {p1, v0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/itd0;->b:Ll/itd0;

    .line 5
    .line 6
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Ll/fk3;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/fk3;->l()Lrx/c;

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
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/jmt;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/jmt;-><init>(Ll/pmt;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Ll/klt;->D2()Lcom/tantan/live/search/eventbus/LiveSearchEventBus;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iget-object v0, v0, Lcom/tantan/live/search/eventbus/LiveSearchEventBus;->LiveSearchEvent:Lcom/tantan/live/search/eventbus/LiveSearchEventBus$LiveSearchEvent;

    .line 45
    .line 46
    invoke-virtual {v0}, Lcom/tantan/live/search/eventbus/LiveSearchEventBus$LiveSearchEvent;->changeText()Ll/v3f$d;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    check-cast v0, Lrx/c;

    .line 55
    .line 56
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    new-instance v1, Ll/kmt;

    .line 61
    .line 62
    invoke-direct {v1, p0}, Ll/kmt;-><init>(Ll/pmt;)V

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
    return-void
.end method

.method public T2(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 6
    .line 7
    iget p1, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 8
    .line 9
    const v0, 0xa04d

    .line 10
    .line 11
    .line 12
    if-ne p1, v0, :cond_0

    .line 13
    .line 14
    invoke-static {}, Lcom/p1/mobile/putong/live/external/page/search/base/LiveAnchorsInfo;->emptyInfo()Lcom/p1/mobile/putong/live/external/page/search/base/LiveAnchorsInfo;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 19
    .line 20
    check-cast v0, Ll/rnt;

    .line 21
    .line 22
    invoke-virtual {v0, p1}, Ll/rnt;->G(Lcom/p1/mobile/putong/live/external/page/search/base/LiveAnchorsInfo;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Ll/klt;->D2()Lcom/tantan/live/search/eventbus/LiveSearchEventBus;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    iget-object p0, p0, Lcom/tantan/live/search/eventbus/LiveSearchEventBus;->LiveSearchEvent:Lcom/tantan/live/search/eventbus/LiveSearchEventBus$LiveSearchEvent;

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/tantan/live/search/eventbus/LiveSearchEventBus$LiveSearchEvent;->onSearchResult()Ll/v3f$d;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    invoke-virtual {p0}, Ll/klt;->D2()Lcom/tantan/live/search/eventbus/LiveSearchEventBus;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    iget-object p0, p0, Lcom/tantan/live/search/eventbus/LiveSearchEventBus;->LiveSearchEvent:Lcom/tantan/live/search/eventbus/LiveSearchEventBus$LiveSearchEvent;

    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/tantan/live/search/eventbus/LiveSearchEventBus$LiveSearchEvent;->onSearchResult()Ll/v3f$d;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    const/4 p1, 0x0

    .line 50
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public U2()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pmt;->f:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ll/pmt;->V2(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public V2(Ljava/lang/CharSequence;)V
    .locals 2

    .line 1
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Ll/pmt;->f:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v1, p0, Ll/pmt;->g:Ll/kcg0;

    .line 12
    .line 13
    invoke-static {v1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ll/klt;->D2()Lcom/tantan/live/search/eventbus/LiveSearchEventBus;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iget-object v1, v1, Lcom/tantan/live/search/eventbus/LiveSearchEventBus;->LiveSearchEvent:Lcom/tantan/live/search/eventbus/LiveSearchEventBus$LiveSearchEvent;

    .line 21
    .line 22
    invoke-virtual {v1}, Lcom/tantan/live/search/eventbus/LiveSearchEventBus$LiveSearchEvent;->onTextChanged()Ll/v3f$d;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v1, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_0

    .line 34
    .line 35
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 36
    .line 37
    check-cast p0, Ll/rnt;

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/rnt;->F()V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_0
    invoke-static {v0}, Lcom/p1/mobile/putong/live/external/module/api/LiveSquareApi;->getSearchResult(Ljava/lang/String;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    new-instance v0, Ll/lmt;

    .line 52
    .line 53
    invoke-direct {v0, p0}, Ll/lmt;-><init>(Ll/pmt;)V

    .line 54
    .line 55
    .line 56
    new-instance v1, Ll/mmt;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Ll/mmt;-><init>(Ll/pmt;)V

    .line 59
    .line 60
    .line 61
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    iput-object p1, p0, Ll/pmt;->g:Ll/kcg0;

    .line 70
    .line 71
    return-void
.end method
