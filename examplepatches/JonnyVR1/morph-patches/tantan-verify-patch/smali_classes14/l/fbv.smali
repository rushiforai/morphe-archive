.class public Ll/fbv;
.super Ll/cyr;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/cyr<",
        "Ll/kbv;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ll/hk4;

.field public b:Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;

.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/r6s;",
            ">;"
        }
    .end annotation
.end field

.field public d:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseFrag;Ll/hk4;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/cyr;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/fbv;->c:Ljava/util/List;

    .line 10
    .line 11
    iput-object p2, p0, Ll/fbv;->a:Ll/hk4;

    .line 12
    .line 13
    return-void
.end method

.method private synthetic B2(Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/fbv;->H2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private H2()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/fbv;->a:Ll/hk4;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/hk4;->a()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, ""

    .line 8
    .line 9
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/external/module/api/LiveVoiceInternalSquareApi;->getTabDetail(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/bbv;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/bbv;-><init>(Ll/fbv;)V

    .line 20
    .line 21
    .line 22
    new-instance v2, Ll/cbv;

    .line 23
    .line 24
    invoke-direct {v2, p0}, Ll/cbv;-><init>(Ll/fbv;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public static synthetic q2(Ll/fbv;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/fbv;->B2(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic r2(Ll/fbv;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fbv;->D2(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic s2(Ll/fbv;Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/fbv;->y2(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;)V

    return-void
.end method

.method public static synthetic u2(Ll/fbv;Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/fbv;->z2(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;)V

    return-void
.end method

.method public static synthetic v2(Ll/fbv;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fbv;->C2(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic w2(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
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

.method private y2(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;->getPagination()Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Ll/fbv;->b:Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;->hasNextPage()Z

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;->getCardList()Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    new-instance v0, Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;->setCardList(Ljava/util/List;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    iget-object v0, p0, Ll/fbv;->c:Ljava/util/List;

    .line 25
    .line 26
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/fbv;->c:Ljava/util/List;

    .line 30
    .line 31
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;->getCardList()Ljava/util/List;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ll/fbv;->a:Ll/hk4;

    .line 39
    .line 40
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;->getCardList()Ljava/util/List;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-static {v0, v1}, Ll/e4s;->b(Ll/hk4;Ljava/util/List;)Ljava/util/List;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 49
    .line 50
    check-cast p0, Ll/kbv;

    .line 51
    .line 52
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;->hasNextPage()Z

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;->isNoMoreDataTip()Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    invoke-virtual {p0, v0, v1, p1}, Ll/kbv;->p(Ljava/util/List;ZZ)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method private z2(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/fbv;->d:Z

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
    iput-object v0, p0, Ll/fbv;->b:Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;

    .line 20
    .line 21
    iget-object v0, p0, Ll/fbv;->a:Ll/hk4;

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
    check-cast p0, Ll/kbv;

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
    invoke-virtual {p0, v0, v1, p1}, Ll/kbv;->e(Ljava/util/List;ZZ)V

    .line 44
    .line 45
    .line 46
    return-void
.end method


# virtual methods
.method public A2()V
    .locals 2

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
    new-instance v1, Ll/zav;

    .line 16
    .line 17
    invoke-direct {v1}, Ll/zav;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/abv;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/abv;-><init>(Ll/fbv;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final synthetic C2(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/fbv;->d:Z

    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic D2(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast p0, Ll/kbv;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/kbv;->q()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public E2()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/fbv;->b:Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;

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
    iget-boolean v0, p0, Ll/fbv;->d:Z

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
    iput-boolean v0, p0, Ll/fbv;->d:Z

    .line 16
    .line 17
    iget-object v0, p0, Ll/fbv;->a:Ll/hk4;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/hk4;->a()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v1, p0, Ll/fbv;->b:Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;->getProcessedNext()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    const-string v2, ""

    .line 30
    .line 31
    invoke-static {v0, v1, v2}, Lcom/p1/mobile/putong/live/external/module/api/LiveVoiceInternalSquareApi;->getNextPageTabDetail(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    new-instance v1, Ll/dbv;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Ll/dbv;-><init>(Ll/fbv;)V

    .line 42
    .line 43
    .line 44
    new-instance v2, Ll/ebv;

    .line 45
    .line 46
    invoke-direct {v2, p0}, Ll/ebv;-><init>(Ll/fbv;)V

    .line 47
    .line 48
    .line 49
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 54
    .line 55
    .line 56
    :cond_1
    :goto_0
    return-void
.end method

.method public F2()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/fbv;->H2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
