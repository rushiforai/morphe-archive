.class public Ll/j7v;
.super Ll/cyr;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/cyr<",
        "Ll/o7v;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ll/nus;

.field public final c:Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;

.field public final d:Ljava/lang/String;

.field public e:Ll/hk4;

.field public f:Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;

.field public g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/r6s;",
            ">;"
        }
    .end annotation
.end field

.field public h:Z

.field public i:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;Ll/nus;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/cyr;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/j7v;->g:Ljava/util/List;

    .line 10
    .line 11
    iput-object p3, p0, Ll/j7v;->a:Ljava/lang/String;

    .line 12
    .line 13
    iput-object p2, p0, Ll/j7v;->b:Ll/nus;

    .line 14
    .line 15
    iput-object p1, p0, Ll/j7v;->c:Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;

    .line 16
    .line 17
    iput-object p4, p0, Ll/j7v;->d:Ljava/lang/String;

    .line 18
    .line 19
    new-instance p2, Ll/hk4;

    .line 20
    .line 21
    invoke-direct {p2, p1}, Ll/hk4;-><init>(Ll/ner;)V

    .line 22
    .line 23
    .line 24
    iput-object p2, p0, Ll/j7v;->e:Ll/hk4;

    .line 25
    .line 26
    invoke-virtual {p2, p3}, Ll/hk4;->d(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public static synthetic A2(Ll/j7v;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/j7v;->N2(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic B2(Ll/j7v;Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/j7v;->D2(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;)V

    return-void
.end method

.method private C2(ZJ)V
    .locals 4

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast p1, Ll/o7v;

    .line 7
    .line 8
    invoke-virtual {p1}, Ll/o7v;->m()Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_1

    .line 13
    .line 14
    invoke-direct {p0}, Ll/j7v;->T2()V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_1
    const-wide/16 v0, 0x0

    .line 19
    .line 20
    cmp-long p1, p2, v0

    .line 21
    .line 22
    if-ltz p1, :cond_3

    .line 23
    .line 24
    sget-object p1, Ll/tbs;->b:Ll/vwt;

    .line 25
    .line 26
    invoke-virtual {p1}, Ll/vwt;->sb()I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    int-to-long v0, p1

    .line 31
    const-wide/16 v2, 0x3e8

    .line 32
    .line 33
    mul-long/2addr v0, v2

    .line 34
    cmp-long p1, p2, v0

    .line 35
    .line 36
    if-lez p1, :cond_2

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_2
    :goto_0
    return-void

    .line 40
    :cond_3
    :goto_1
    invoke-direct {p0}, Ll/j7v;->T2()V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method private synthetic H2(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/j7v;->c:Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;->Q4()Z

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

.method private synthetic I2(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/j7v;->h:Z

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method private synthetic K2(Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/j7v;->T2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic N2(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast p0, Ll/o7v;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/o7v;->q()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private T2()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/j7v;->a:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p0, Ll/j7v;->d:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/external/module/api/LiveVoiceInternalSquareApi;->getTabDetail(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

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
    new-instance v1, Ll/f7v;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/f7v;-><init>(Ll/j7v;)V

    .line 16
    .line 17
    .line 18
    new-instance v2, Ll/g7v;

    .line 19
    .line 20
    invoke-direct {v2, p0}, Ll/g7v;-><init>(Ll/j7v;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method private U2(Ll/xys;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/o7v;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/o7v;->s(Ll/xys;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic q2(Ll/j7v;Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/j7v;->E2(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;)V

    return-void
.end method

.method public static synthetic r2(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic s2(Ll/j7v;Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/j7v;->H2(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic u2(Ll/j7v;Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/j7v;->I2(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic v2(Ll/j7v;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/j7v;->K2(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic w2(Ll/j7v;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/j7v;->M2(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic y2(Ll/j7v;Ll/xys;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/j7v;->L2(Ll/xys;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic z2(Ll/j7v;Ll/xys;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/j7v;->U2(Ll/xys;)V

    return-void
.end method


# virtual methods
.method public final D2(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;->isRefreshWhenVisible()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iput-boolean v0, p0, Ll/j7v;->h:Z

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;->getPagination()Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Ll/j7v;->f:Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;->hasNextPage()Z

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/j7v;->b:Ll/nus;

    .line 17
    .line 18
    iget-object v0, v0, Ll/nus;->a:Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->LiveVoiceInternalWidgetEvent:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveVoiceInternalWidgetEvent;

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveVoiceInternalWidgetEvent;->bottomWidget()Ll/v3f$d;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;->getCardList()Ljava/util/List;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    if-nez v0, :cond_0

    .line 34
    .line 35
    new-instance v0, Ljava/util/ArrayList;

    .line 36
    .line 37
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;->setCardList(Ljava/util/List;)V

    .line 41
    .line 42
    .line 43
    :cond_0
    iget-object v0, p0, Ll/j7v;->g:Ljava/util/List;

    .line 44
    .line 45
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Ll/j7v;->g:Ljava/util/List;

    .line 49
    .line 50
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;->getCardList()Ljava/util/List;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Ll/j7v;->e:Ll/hk4;

    .line 58
    .line 59
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;->getCardList()Ljava/util/List;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-static {v0, v1}, Ll/e4s;->b(Ll/hk4;Ljava/util/List;)Ljava/util/List;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 68
    .line 69
    check-cast p0, Ll/o7v;

    .line 70
    .line 71
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;->hasNextPage()Z

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;->isNoMoreDataTip()Z

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    invoke-virtual {p0, v0, v1, p1}, Ll/o7v;->p(Ljava/util/List;ZZ)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public final E2(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/j7v;->i:Z

    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;->getCardList()Ljava/util/List;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;->getPagination()Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Ll/j7v;->f:Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;

    .line 20
    .line 21
    iget-object v0, p0, Ll/j7v;->e:Ll/hk4;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;->getCardList()Ljava/util/List;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-static {v0, v1}, Ll/e4s;->b(Ll/hk4;Ljava/util/List;)Ljava/util/List;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 32
    .line 33
    check-cast p0, Ll/o7v;

    .line 34
    .line 35
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;->hasNextPage()Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;->isNoMoreDataTip()Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    invoke-virtual {p0, v0, v1, p1}, Ll/o7v;->e(Ljava/util/List;ZZ)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public F2()V
    .locals 3

    .line 1
    sget-object v0, Ll/tbs;->f:Ll/j6t;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Ll/j6t;->v(Z)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/cyr;->lifecycle()Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v2, Ll/z6v;

    .line 16
    .line 17
    invoke-direct {v2}, Ll/z6v;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v2, Ll/a7v;

    .line 25
    .line 26
    invoke-direct {v2, p0}, Ll/a7v;-><init>(Ll/j7v;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v2, Ll/b7v;

    .line 34
    .line 35
    invoke-direct {v2, p0}, Ll/b7v;-><init>(Ll/j7v;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    new-instance v2, Ll/c7v;

    .line 43
    .line 44
    invoke-direct {v2, p0}, Ll/c7v;-><init>(Ll/j7v;)V

    .line 45
    .line 46
    .line 47
    invoke-static {v2}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 52
    .line 53
    .line 54
    sget-object v0, Ll/itd0;->c:Ll/itd0;

    .line 55
    .line 56
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    check-cast v0, Ll/gm3;

    .line 61
    .line 62
    invoke-virtual {v0}, Ll/gm3;->a()Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {p0, v0, v1}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    new-instance v1, Ll/d7v;

    .line 71
    .line 72
    invoke-direct {v1, p0}, Ll/d7v;-><init>(Ll/j7v;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    new-instance v1, Ll/e7v;

    .line 80
    .line 81
    invoke-direct {v1, p0}, Ll/e7v;-><init>(Ll/j7v;)V

    .line 82
    .line 83
    .line 84
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method public final synthetic L2(Ll/xys;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/xys;->g()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p0, p0, Ll/j7v;->a:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

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

.method public final synthetic M2(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/j7v;->i:Z

    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public P2()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/j7v;->f:Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;->hasNextPage(Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-boolean v0, p0, Ll/j7v;->i:Z

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 v0, 0x1

    .line 15
    iput-boolean v0, p0, Ll/j7v;->i:Z

    .line 16
    .line 17
    iget-object v0, p0, Ll/j7v;->a:Ljava/lang/String;

    .line 18
    .line 19
    iget-object v1, p0, Ll/j7v;->f:Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;

    .line 20
    .line 21
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;->getProcessedNext()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    iget-object v2, p0, Ll/j7v;->d:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {v0, v1, v2}, Lcom/p1/mobile/putong/live/external/module/api/LiveVoiceInternalSquareApi;->getNextPageTabDetail(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    new-instance v1, Ll/h7v;

    .line 36
    .line 37
    invoke-direct {v1, p0}, Ll/h7v;-><init>(Ll/j7v;)V

    .line 38
    .line 39
    .line 40
    new-instance v2, Ll/i7v;

    .line 41
    .line 42
    invoke-direct {v2, p0}, Ll/i7v;-><init>(Ll/j7v;)V

    .line 43
    .line 44
    .line 45
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 50
    .line 51
    .line 52
    :cond_1
    :goto_0
    return-void
.end method

.method public Q2(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/j7v;->b:Ll/nus;

    .line 2
    .line 3
    iget-object p0, p0, Ll/nus;->a:Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->LiveVoiceInternalWidgetEvent:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveVoiceInternalWidgetEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveVoiceInternalWidgetEvent;->scrollDirectionForWidget()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public R2(ZIJ)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p3, p4}, Ll/j7v;->C2(ZJ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public S2()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/j7v;->T2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
