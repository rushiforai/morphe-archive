.class public final Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlNearbyLiveListPlug;
.super Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlBaseAsyncPlug;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000D\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u0008\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0008\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0015\u0010\u0008\u001a\u0008\u0012\u0004\u0012\u00020\u00070\u0006H\u0002\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u000f\u0010\u000b\u001a\u00020\nH\u0016\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\r\u0010\r\u001a\u00020\n\u00a2\u0006\u0004\u0008\r\u0010\u000cR\u0014\u0010\u000f\u001a\u00020\u000e8\u0002X\u0082D\u00a2\u0006\u0006\n\u0004\u0008\u000f\u0010\u0010R$\u0010\u0011\u001a\u0004\u0018\u00010\u00078\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u0011\u0010\u0012\u001a\u0004\u0008\u0013\u0010\u0014\"\u0004\u0008\u0015\u0010\u0016R\u001b\u0010\u001c\u001a\u00020\u00178BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u0018\u0010\u0019\u001a\u0004\u0008\u001a\u0010\u001bR\"\u0010\u001e\u001a\u00020\u001d8\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u001e\u0010\u001f\u001a\u0004\u0008 \u0010!\"\u0004\u0008\"\u0010#R$\u0010%\u001a\u0004\u0018\u00010$8\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008%\u0010&\u001a\u0004\u0008\'\u0010(\"\u0004\u0008)\u0010*R\u0016\u0010+\u001a\u0004\u0018\u00010\u000e8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008+\u0010\u0010\u00a8\u0006,"
    }
    d2 = {
        "Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlNearbyLiveListPlug;",
        "Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlBaseAsyncPlug;",
        "Ll/ner;",
        "lifecycleProvider",
        "<init>",
        "(Ll/ner;)V",
        "Lrx/c;",
        "Ll/z8o;",
        "loadLiveListObs",
        "()Lrx/c;",
        "",
        "getData",
        "()V",
        "loadMore",
        "",
        "sourceTabName",
        "Ljava/lang/String;",
        "liveInfo",
        "Ll/z8o;",
        "getLiveInfo",
        "()Ll/z8o;",
        "setLiveInfo",
        "(Ll/z8o;)V",
        "Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;",
        "taskQueue$delegate",
        "Lkotlin/Lazy;",
        "getTaskQueue",
        "()Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;",
        "taskQueue",
        "",
        "limit",
        "I",
        "getLimit",
        "()I",
        "setLimit",
        "(I)V",
        "Lcom/p1/mobile/putong/data/Pagination;",
        "pagination",
        "Lcom/p1/mobile/putong/data/Pagination;",
        "getPagination",
        "()Lcom/p1/mobile/putong/data/Pagination;",
        "setPagination",
        "(Lcom/p1/mobile/putong/data/Pagination;)V",
        "extraQueryList",
        "external_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# instance fields
.field private final extraQueryList:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private limit:I

.field private liveInfo:Ll/z8o;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private pagination:Lcom/p1/mobile/putong/data/Pagination;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private final sourceTabName:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final taskQueue$delegate:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0
    .param p1    # Ll/ner;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlBaseAsyncPlug;-><init>(Ll/ner;)V

    .line 5
    .line 6
    .line 7
    const-string p1, "square-nearby"

    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlNearbyLiveListPlug;->sourceTabName:Ljava/lang/String;

    .line 10
    .line 11
    new-instance p1, Ll/uno;

    .line 12
    .line 13
    invoke-direct {p1}, Ll/uno;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-static {p1}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlNearbyLiveListPlug;->taskQueue$delegate:Lkotlin/Lazy;

    .line 21
    .line 22
    sget p1, Ll/y6u;->a:I

    .line 23
    .line 24
    iput p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlNearbyLiveListPlug;->limit:I

    .line 25
    .line 26
    invoke-static {}, Ll/mqr;->l()Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    const-string p1, "liveTabSource=live-independent-tab-nearby"

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const/4 p1, 0x0

    .line 36
    :goto_0
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlNearbyLiveListPlug;->extraQueryList:Ljava/lang/String;

    .line 37
    .line 38
    return-void
.end method

.method public static f(Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlNearbyLiveListPlug;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlBaseAsyncPlug;->complete()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static g(Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlNearbyLiveListPlug;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlBaseAsyncPlug;->error(Ljava/lang/Throwable;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private final getTaskQueue()Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlNearbyLiveListPlug;->taskQueue$delegate:Lkotlin/Lazy;

    .line 2
    .line 3
    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;

    .line 8
    .line 9
    return-object p0
.end method

.method public static h()Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;

    .line 2
    .line 3
    const-string v1, "LiveSquareNearBy"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public static i(Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlNearbyLiveListPlug;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlBaseAsyncPlug;->error(Ljava/lang/Throwable;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static j(Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlNearbyLiveListPlug;Ll/z8o;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/ubu;->r()Lcom/p1/mobile/putong/data/Pagination;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlNearbyLiveListPlug;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlNearbyLiveListPlug;->liveInfo:Ll/z8o;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlNearbyLiveListPlug;->liveInfo:Ll/z8o;

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual {v0, p1}, Ll/ubu;->w(Ll/ubu;)V

    .line 15
    .line 16
    .line 17
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlBaseAsyncPlug;->success()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static k(Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlNearbyLiveListPlug;Ll/z8o;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/ubu;->r()Lcom/p1/mobile/putong/data/Pagination;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlNearbyLiveListPlug;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlNearbyLiveListPlug;->liveInfo:Ll/z8o;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlBaseAsyncPlug;->success()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static l(Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlNearbyLiveListPlug;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlBaseAsyncPlug;->complete()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final loadLiveListObs()Lrx/c;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/z8o;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlNearbyLiveListPlug;->sourceTabName:Ljava/lang/String;

    .line 2
    .line 3
    iget v3, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlNearbyLiveListPlug;->limit:I

    .line 4
    .line 5
    iget-object v6, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlNearbyLiveListPlug;->extraQueryList:Ljava/lang/String;

    .line 6
    .line 7
    sget-object p0, Ll/fdn;->Companion:Ll/fdn$a;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/fdn$a;->v()Z

    .line 10
    .line 11
    .line 12
    move-result v7

    .line 13
    const-string v0, "suggested"

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    const/4 v4, 0x0

    .line 17
    const/4 v5, 0x0

    .line 18
    invoke-static/range {v0 .. v7}, Lcom/p1/mobile/putong/live/external/intl/module/api/IntlLiveNormalApi;->getLiveListV2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;ZLjava/lang/String;Z)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 23
    .line 24
    .line 25
    return-object p0
.end method


# virtual methods
.method public getData()V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlNearbyLiveListPlug;->getTaskQueue()Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlNearbyLiveListPlug;->loadLiveListObs()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const/16 v2, 0x64

    .line 10
    .line 11
    const-string v3, "loadingLiveList"

    .line 12
    .line 13
    invoke-virtual {v0, v3, v1, v2}, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;->f(Ljava/lang/String;Lrx/c;I)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlBaseAsyncPlug;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v1, Ll/rno;

    .line 33
    .line 34
    invoke-direct {v1, p0}, Ll/rno;-><init>(Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlNearbyLiveListPlug;)V

    .line 35
    .line 36
    .line 37
    new-instance v2, Ll/sno;

    .line 38
    .line 39
    invoke-direct {v2, p0}, Ll/sno;-><init>(Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlNearbyLiveListPlug;)V

    .line 40
    .line 41
    .line 42
    new-instance v3, Ll/tno;

    .line 43
    .line 44
    invoke-direct {v3, p0}, Ll/tno;-><init>(Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlNearbyLiveListPlug;)V

    .line 45
    .line 46
    .line 47
    invoke-static {v1, v2, v3}, Ll/dhw;->f(Ll/y20;Ll/y20;Ll/x20;)Ll/t9t;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public final getLimit()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlNearbyLiveListPlug;->limit:I

    .line 2
    .line 3
    return p0
.end method

.method public final getLiveInfo()Ll/z8o;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlNearbyLiveListPlug;->liveInfo:Ll/z8o;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getPagination()Lcom/p1/mobile/putong/data/Pagination;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlNearbyLiveListPlug;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 2
    .line 3
    return-object p0
.end method

.method public final loadMore()V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlNearbyLiveListPlug;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Pagination;->links:Lcom/p1/mobile/putong/data/Links;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlNearbyLiveListPlug;->getTaskQueue()Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlNearbyLiveListPlug;->sourceTabName:Ljava/lang/String;

    .line 24
    .line 25
    sget v4, Ll/y6u;->a:I

    .line 26
    .line 27
    iget-object v5, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlNearbyLiveListPlug;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 28
    .line 29
    iget-object v6, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlNearbyLiveListPlug;->extraQueryList:Ljava/lang/String;

    .line 30
    .line 31
    sget-object v1, Ll/fdn;->Companion:Ll/fdn$a;

    .line 32
    .line 33
    invoke-virtual {v1}, Ll/fdn$a;->v()Z

    .line 34
    .line 35
    .line 36
    move-result v7

    .line 37
    const-string v1, "suggested"

    .line 38
    .line 39
    const-string v3, ""

    .line 40
    .line 41
    invoke-static/range {v1 .. v7}, Lcom/p1/mobile/putong/live/external/intl/module/api/IntlLiveNormalApi;->getNextLiveListV2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILcom/p1/mobile/putong/data/Pagination;Ljava/lang/String;Z)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    const-string v2, "loadNextLives"

    .line 46
    .line 47
    invoke-virtual {v0, v2, v1}, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;->e(Ljava/lang/String;Lrx/c;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlBaseAsyncPlug;->duringCreated(Lrx/c;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    new-instance v1, Ll/vno;

    .line 67
    .line 68
    invoke-direct {v1, p0}, Ll/vno;-><init>(Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlNearbyLiveListPlug;)V

    .line 69
    .line 70
    .line 71
    new-instance v2, Ll/wno;

    .line 72
    .line 73
    invoke-direct {v2, p0}, Ll/wno;-><init>(Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlNearbyLiveListPlug;)V

    .line 74
    .line 75
    .line 76
    new-instance v3, Ll/xno;

    .line 77
    .line 78
    invoke-direct {v3, p0}, Ll/xno;-><init>(Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlNearbyLiveListPlug;)V

    .line 79
    .line 80
    .line 81
    invoke-static {v1, v2, v3}, Ll/dhw;->f(Ll/y20;Ll/y20;Ll/x20;)Ll/t9t;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 86
    .line 87
    .line 88
    :cond_1
    :goto_0
    return-void
.end method

.method public final setLimit(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlNearbyLiveListPlug;->limit:I

    .line 2
    .line 3
    return-void
.end method

.method public final setLiveInfo(Ll/z8o;)V
    .locals 0
    .param p1    # Ll/z8o;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlNearbyLiveListPlug;->liveInfo:Ll/z8o;

    .line 2
    .line 3
    return-void
.end method

.method public final setPagination(Lcom/p1/mobile/putong/data/Pagination;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/data/Pagination;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlNearbyLiveListPlug;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 2
    .line 3
    return-void
.end method
