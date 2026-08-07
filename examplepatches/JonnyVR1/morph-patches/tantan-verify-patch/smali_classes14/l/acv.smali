.class public Ll/acv;
.super Ll/cyr;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/cyr<",
        "Ll/icv;",
        ">;"
    }
.end annotation


# instance fields
.field private final cardContext:Ll/hk4;

.field private guessLikePagination:Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;

.field private loadingNext:Z

.field private pagination:Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/cyr;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/hk4;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Ll/hk4;-><init>(Ll/ner;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/acv;->cardContext:Ll/hk4;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic q2(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic r2(Ll/acv;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/acv;->E2(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic s2(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic u2(Ll/acv;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/acv;->D2(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic v2(Ll/acv;Lcom/p1/mobile/putong/live/external/internal/virtualVoice/search/LiveVoiceSearchDetail;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/acv;->A2(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/search/LiveVoiceSearchDetail;)V

    return-void
.end method

.method public static synthetic w2(Ll/acv;Lcom/p1/mobile/putong/live/external/internal/virtualVoice/search/LiveVoiceSuggestDetail;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/acv;->z2(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/search/LiveVoiceSuggestDetail;)V

    return-void
.end method


# virtual methods
.method public final A2(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/search/LiveVoiceSearchDetail;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/acv;->loadingNext:Z

    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/search/LiveVoiceSearchDetail;->getCards()Ljava/util/List;

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
    iput-object v0, p0, Ll/acv;->pagination:Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;

    .line 20
    .line 21
    iget-object v0, p0, Ll/acv;->cardContext:Ll/hk4;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/search/LiveVoiceSearchDetail;->getCards()Ljava/util/List;

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
    check-cast p0, Ll/icv;

    .line 34
    .line 35
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;->hasNextPage()Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    const/4 v1, 0x1

    .line 40
    invoke-virtual {p0, v0, p1, v1}, Ll/icv;->k(Ljava/util/List;ZZ)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public B2(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/search/LiveVoiceSearchDetail;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/search/LiveVoiceSearchDetail;->getCards()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/acv;->H2()V

    .line 12
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
    iput-object v0, p0, Ll/acv;->pagination:Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;

    .line 20
    .line 21
    iget-object v0, p0, Ll/acv;->cardContext:Ll/hk4;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/search/LiveVoiceSearchDetail;->getCards()Ljava/util/List;

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
    check-cast p0, Ll/icv;

    .line 34
    .line 35
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;->hasNextPage()Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    const/4 v1, 0x1

    .line 40
    invoke-virtual {p0, v0, p1, v1}, Ll/icv;->B(Ljava/util/List;ZZ)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public C2()V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic D2(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/icv;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/icv;->A()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic E2(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Ll/acv;->loadingNext:Z

    .line 3
    .line 4
    return-void
.end method

.method public F2()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/acv;->pagination:Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;

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
    iget-boolean v0, p0, Ll/acv;->loadingNext:Z

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
    iput-boolean v0, p0, Ll/acv;->loadingNext:Z

    .line 16
    .line 17
    iget-object v0, p0, Ll/acv;->pagination:Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;->getProcessedNext()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {v0}, Lcom/p1/mobile/putong/live/external/module/api/LiveVoiceInternalSquareApi;->getNextPageSearchResult(Ljava/lang/String;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ll/ybv;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/ybv;-><init>(Ll/acv;)V

    .line 34
    .line 35
    .line 36
    new-instance v2, Ll/zbv;

    .line 37
    .line 38
    invoke-direct {v2, p0}, Ll/zbv;-><init>(Ll/acv;)V

    .line 39
    .line 40
    .line 41
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 46
    .line 47
    .line 48
    :cond_1
    :goto_0
    return-void
.end method

.method public H2()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/external/module/api/LiveVoiceInternalSquareApi;->getGuessLikeData()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/tbv;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/tbv;-><init>(Ll/acv;)V

    .line 12
    .line 13
    .line 14
    new-instance p0, Ll/vbv;

    .line 15
    .line 16
    invoke-direct {p0}, Ll/vbv;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public I2()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/acv;->guessLikePagination:Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;->hasNextPage(Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/acv;->guessLikePagination:Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;->getProcessedNext()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Lcom/p1/mobile/putong/live/external/module/api/LiveVoiceInternalSquareApi;->getGuessLikeData(Ljava/lang/String;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Ll/tbv;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/tbv;-><init>(Ll/acv;)V

    .line 26
    .line 27
    .line 28
    new-instance p0, Ll/ubv;

    .line 29
    .line 30
    invoke-direct {p0}, Ll/ubv;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    invoke-virtual {p0}, Ll/acv;->H2()V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public y2(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/live/external/module/api/LiveVoiceInternalSquareApi;->getSearchResult(Ljava/lang/String;)Lrx/c;

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
    new-instance v0, Ll/wbv;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/wbv;-><init>(Ll/acv;)V

    .line 12
    .line 13
    .line 14
    new-instance v1, Ll/xbv;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/xbv;-><init>(Ll/acv;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final z2(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/search/LiveVoiceSuggestDetail;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;->getPagination()Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Ll/acv;->guessLikePagination:Lcom/p1/mobile/putong/live/base/apibean/PaginationBean;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/search/LiveVoiceSuggestDetail;->getCards()Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 18
    .line 19
    check-cast p0, Ll/icv;

    .line 20
    .line 21
    new-instance p1, Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, p1}, Ll/icv;->z(Ljava/util/List;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    iget-object v0, p0, Ll/acv;->cardContext:Ll/hk4;

    .line 31
    .line 32
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/search/LiveVoiceSuggestDetail;->getCards()Ljava/util/List;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-static {v0, p1}, Ll/e4s;->b(Ll/hk4;Ljava/util/List;)Ljava/util/List;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 41
    .line 42
    check-cast p0, Ll/icv;

    .line 43
    .line 44
    invoke-virtual {p0, p1}, Ll/icv;->z(Ljava/util/List;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method
