.class public final Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveAnchorsPlug;
.super Lcom/p1/mobile/putong/live/external/square/api/BaseAsyncPlug;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\t\n\u0002\u0010\u0008\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u000f\u0010\u0007\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u0008\u0007\u0010\u0008R\"\u0010\n\u001a\u00020\t8\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\n\u0010\u000b\u001a\u0004\u0008\u000c\u0010\r\"\u0004\u0008\u000e\u0010\u000fR\"\u0010\u0010\u001a\u00020\t8\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u0010\u0010\u000b\u001a\u0004\u0008\u0011\u0010\r\"\u0004\u0008\u0012\u0010\u000fR\"\u0010\u0014\u001a\u00020\u00138\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u0014\u0010\u0015\u001a\u0004\u0008\u0016\u0010\u0017\"\u0004\u0008\u0018\u0010\u0019R\'\u0010\u001d\u001a\u0012\u0012\u0004\u0012\u00020\u001b0\u001aj\u0008\u0012\u0004\u0012\u00020\u001b`\u001c8\u0006\u00a2\u0006\u000c\n\u0004\u0008\u001d\u0010\u001e\u001a\u0004\u0008\u001f\u0010 \u00a8\u0006!"
    }
    d2 = {
        "Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveAnchorsPlug;",
        "Lcom/p1/mobile/putong/live/external/square/api/BaseAsyncPlug;",
        "Ll/ner;",
        "lifecycleProvider",
        "<init>",
        "(Ll/ner;)V",
        "",
        "getData",
        "()V",
        "",
        "search",
        "Ljava/lang/String;",
        "getSearch",
        "()Ljava/lang/String;",
        "setSearch",
        "(Ljava/lang/String;)V",
        "source",
        "getSource",
        "setSource",
        "",
        "limit",
        "I",
        "getLimit",
        "()I",
        "setLimit",
        "(I)V",
        "Ljava/util/ArrayList;",
        "Lcom/p1/mobile/putong/live/base/data/BLiveAnchors;",
        "Lkotlin/collections/ArrayList;",
        "resultData",
        "Ljava/util/ArrayList;",
        "getResultData",
        "()Ljava/util/ArrayList;",
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


# instance fields
.field private limit:I

.field private final resultData:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveAnchors;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private search:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private source:Ljava/lang/String;
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
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/square/api/BaseAsyncPlug;-><init>(Ll/ner;)V

    .line 5
    .line 6
    .line 7
    const-string p1, ""

    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveAnchorsPlug;->search:Ljava/lang/String;

    .line 10
    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveAnchorsPlug;->source:Ljava/lang/String;

    .line 12
    .line 13
    new-instance p1, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveAnchorsPlug;->resultData:Ljava/util/ArrayList;

    .line 19
    .line 20
    return-void
.end method

.method public static f(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveAnchorsPlug;Ljava/util/List;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveAnchorsPlug;->resultData:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 7
    .line 8
    .line 9
    check-cast p1, Ljava/util/Collection;

    .line 10
    .line 11
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveAnchorsPlug;->resultData:Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 20
    .line 21
    .line 22
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/square/api/BaseAsyncPlug;->success()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static g(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveAnchors:Ljava/util/List;

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    return-object p0
.end method

.method public static h(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)Ljava/util/List;
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/util/List;

    .line 6
    .line 7
    return-object p0
.end method

.method public static i(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveAnchorsPlug;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/square/api/BaseAsyncPlug;->error(Ljava/lang/Throwable;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static j(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveAnchorsPlug;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/square/api/BaseAsyncPlug;->complete()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getData()V
    .locals 4

    .line 1
    const-string v0, "/live-anchors"

    .line 2
    .line 3
    invoke-static {v0}, Ll/zvr;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/rnl;->r(Ljava/lang/String;)Ll/rnl;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ll/rnl;->p()Ll/rnl$a;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "search"

    .line 19
    .line 20
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveAnchorsPlug;->search:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v0, v1, v2}, Ll/rnl$a;->c(Ljava/lang/String;Ljava/lang/String;)Ll/rnl$a;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const-string v1, "source"

    .line 27
    .line 28
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveAnchorsPlug;->source:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v0, v1, v2}, Ll/rnl$a;->c(Ljava/lang/String;Ljava/lang/String;)Ll/rnl$a;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iget v1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveAnchorsPlug;->limit:I

    .line 35
    .line 36
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    const-string v2, "limit"

    .line 41
    .line 42
    invoke-virtual {v0, v2, v1}, Ll/rnl$a;->c(Ljava/lang/String;Ljava/lang/String;)Ll/rnl$a;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0}, Ll/rnl$a;->d()Ll/rnl;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    const-string v1, "live-anchors"

    .line 51
    .line 52
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->buildLiveReadReqIO(Ll/rnl;Ljava/lang/String;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/square/api/BaseAsyncPlug;->duringCreated(Lrx/c;)Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    new-instance v1, Ll/bvr;

    .line 64
    .line 65
    invoke-direct {v1}, Ll/bvr;-><init>()V

    .line 66
    .line 67
    .line 68
    new-instance v2, Ll/cvr;

    .line 69
    .line 70
    invoke-direct {v2, v1}, Ll/cvr;-><init>(Lkotlin/jvm/functions/Function1;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    new-instance v1, Ll/dvr;

    .line 86
    .line 87
    invoke-direct {v1, p0}, Ll/dvr;-><init>(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveAnchorsPlug;)V

    .line 88
    .line 89
    .line 90
    new-instance v2, Ll/evr;

    .line 91
    .line 92
    invoke-direct {v2, p0}, Ll/evr;-><init>(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveAnchorsPlug;)V

    .line 93
    .line 94
    .line 95
    new-instance v3, Ll/fvr;

    .line 96
    .line 97
    invoke-direct {v3, p0}, Ll/fvr;-><init>(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveAnchorsPlug;)V

    .line 98
    .line 99
    .line 100
    invoke-static {v1, v2, v3}, Ll/dhw;->f(Ll/y20;Ll/y20;Ll/x20;)Ll/t9t;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 105
    .line 106
    .line 107
    return-void
.end method

.method public final getLimit()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveAnchorsPlug;->limit:I

    .line 2
    .line 3
    return p0
.end method

.method public final getResultData()Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveAnchors;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveAnchorsPlug;->resultData:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getSearch()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveAnchorsPlug;->search:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getSource()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveAnchorsPlug;->source:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final setLimit(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveAnchorsPlug;->limit:I

    .line 2
    .line 3
    return-void
.end method

.method public final setSearch(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveAnchorsPlug;->search:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public final setSource(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveAnchorsPlug;->source:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method
