.class public Ll/k6u;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ll/v5u;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ll/v5u;
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->teenagerLives:Ljava/util/List;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ll/v5u;->d(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ll/v5u;->f(Lcom/p1/mobile/putong/data/Pagination;)V

    .line 11
    .line 12
    .line 13
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ll/v5u;
    .locals 2

    .line 1
    new-instance v0, Ll/v5u;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->teenagerLives:Ljava/util/List;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 8
    .line 9
    invoke-direct {v0, v1, p0}, Ll/v5u;-><init>(Ljava/util/List;Lcom/p1/mobile/putong/data/Pagination;)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method


# virtual methods
.method public c(I)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lrx/c<",
            "Ll/v5u;",
            ">;"
        }
    .end annotation

    .line 1
    const-string p0, "/teenage-lives"

    .line 2
    .line 3
    invoke-static {p0}, Ll/zvr;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/rnl;->r(Ljava/lang/String;)Ll/rnl;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/rnl;->p()Ll/rnl$a;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string v0, "limit"

    .line 16
    .line 17
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p0, v0, p1}, Ll/rnl$a;->c(Ljava/lang/String;Ljava/lang/String;)Ll/rnl$a;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Ll/rnl$a;->d()Ll/rnl;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const-string p1, "teen_mode_load_all"

    .line 29
    .line 30
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->buildLiveReadReq(Ll/rnl;Ljava/lang/String;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    new-instance p1, Ll/i6u;

    .line 35
    .line 36
    invoke-direct {p1}, Ll/i6u;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0
.end method

.method public d(Ll/v5u;)Lrx/c;
    .locals 1
    .param p1    # Ll/v5u;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/v5u;",
            ")",
            "Lrx/c<",
            "Ll/v5u;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "/teenage-lives?"

    .line 7
    .line 8
    invoke-static {v0}, Ll/zvr;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    iget-object v0, p1, Ll/v5u;->b:Lcom/p1/mobile/putong/data/Pagination;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Pagination;->links:Lcom/p1/mobile/putong/data/Links;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-static {p0}, Ll/rnl;->l(Ljava/lang/String;)Ll/rnl;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    const-string v0, "teen_mode_load_next_page"

    .line 33
    .line 34
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->buildLiveReadReq(Ll/rnl;Ljava/lang/String;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    new-instance v0, Ll/j6u;

    .line 39
    .line 40
    invoke-direct {v0, p1}, Ll/j6u;-><init>(Ll/v5u;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0
.end method
