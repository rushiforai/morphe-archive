.class public final Ll/gbu;
.super Ll/txs;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\t\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u000b\n\u0002\u0008\u0006\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u000f\u0010\t\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008\t\u0010\nJ\u000f\u0010\u000b\u001a\u00020\u0008H\u0002\u00a2\u0006\u0004\u0008\u000b\u0010\nR\u0017\u0010\u0003\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u000c\u0010\r\u001a\u0004\u0008\u000e\u0010\u000fR\u0014\u0010\u0005\u001a\u00020\u00048\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0010\u0010\u0011R\u0017\u0010\u0017\u001a\u00020\u00128\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0013\u0010\u0014\u001a\u0004\u0008\u0015\u0010\u0016R\u0016\u0010\u001b\u001a\u00020\u00188\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0019\u0010\u001aR\u0016\u0010\u001d\u001a\u00020\u00188\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u001c\u0010\u001a\u00a8\u0006\u001e"
    }
    d2 = {
        "Ll/gbu;",
        "Ll/txs;",
        "Ll/ner;",
        "lifecycleProvider",
        "Ll/nus;",
        "homeInfo",
        "<init>",
        "(Ll/ner;Ll/nus;)V",
        "",
        "T",
        "()V",
        "U2",
        "f",
        "Ll/ner;",
        "getLifecycleProvider",
        "()Ll/ner;",
        "g",
        "Ll/nus;",
        "Ll/a1h0;",
        "h",
        "Ll/a1h0;",
        "getUtil",
        "()Ll/a1h0;",
        "util",
        "",
        "i",
        "Z",
        "showNearByFirst",
        "j",
        "isColdStart",
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
.field public final f:Ll/ner;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final g:Ll/nus;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final h:Ll/a1h0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public i:Z

.field public j:Z


# direct methods
.method public constructor <init>(Ll/ner;Ll/nus;)V
    .locals 0
    .param p1    # Ll/ner;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/nus;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-direct {p0, p1, p2}, Ll/txs;-><init>(Ll/ner;Ll/nus;)V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Ll/gbu;->f:Ll/ner;

    .line 11
    .line 12
    iput-object p2, p0, Ll/gbu;->g:Ll/nus;

    .line 13
    .line 14
    new-instance p1, Ll/a1h0;

    .line 15
    .line 16
    invoke-direct {p1}, Ll/a1h0;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Ll/gbu;->h:Ll/a1h0;

    .line 20
    .line 21
    const/4 p1, 0x1

    .line 22
    iput-boolean p1, p0, Ll/gbu;->i:Z

    .line 23
    .line 24
    iput-boolean p1, p0, Ll/gbu;->j:Z

    .line 25
    .line 26
    return-void
.end method

.method public static Q2(Ll/gbu;Lcom/p1/mobile/putong/live/external/square/LiveSquareSummaryInfo;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/square/LiveSquareSummaryInfo;->getFirstLiveSquareSummary()Lcom/p1/mobile/putong/live/base/data/BLiveSquareSummary;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/gbu;->h:Ll/a1h0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/a1h0;->b()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/square/LiveSquareSummaryInfo;->getFirstLiveSquareSummary()Lcom/p1/mobile/putong/live/base/data/BLiveSquareSummary;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSquareSummary;->role:I

    .line 23
    .line 24
    if-eq p0, p1, :cond_0

    .line 25
    .line 26
    const/4 p0, 0x1

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/4 p0, 0x0

    .line 29
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method public static R2(Ll/gbu;Ll/uwl;)V
    .locals 1

    .line 1
    instance-of v0, p1, Ll/l6t;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Ll/l6t;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/l6t;->C2(Ll/l6t;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static S2(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/Boolean;

    .line 6
    .line 7
    return-object p0
.end method

.method public static T2(Ll/gbu;Lcom/p1/mobile/putong/live/external/square/LiveSquareSummaryInfo;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/square/LiveSquareSummaryInfo;->getFirstLiveSquareSummary()Lcom/p1/mobile/putong/live/base/data/BLiveSquareSummary;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-eqz p1, :cond_3

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/gbu;->U2()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/gbu;->h:Ll/a1h0;

    .line 11
    .line 12
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSquareSummary;->role:I

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ll/a1h0;->c(I)V

    .line 15
    .line 16
    .line 17
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSquareSummary;->role:I

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    const/16 v1, 0x18

    .line 21
    .line 22
    if-ne p1, v1, :cond_0

    .line 23
    .line 24
    iget-boolean v2, p0, Ll/gbu;->i:Z

    .line 25
    .line 26
    if-eqz v2, :cond_0

    .line 27
    .line 28
    iput-boolean v0, p0, Ll/gbu;->i:Z

    .line 29
    .line 30
    :cond_0
    const/16 v2, 0xa

    .line 31
    .line 32
    if-eq p1, v2, :cond_2

    .line 33
    .line 34
    const/16 v2, 0x14

    .line 35
    .line 36
    if-eq p1, v2, :cond_1

    .line 37
    .line 38
    if-eq p1, v1, :cond_1

    .line 39
    .line 40
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    new-instance p1, Ll/x0h0;

    .line 44
    .line 45
    iget-object v1, p0, Ll/gbu;->f:Ll/ner;

    .line 46
    .line 47
    iget-object v2, p0, Ll/gbu;->g:Ll/nus;

    .line 48
    .line 49
    iget-object v3, p0, Ll/gbu;->h:Ll/a1h0;

    .line 50
    .line 51
    invoke-direct {p1, v1, v2, v3}, Ll/x0h0;-><init>(Ll/ner;Ll/nus;Ll/a1h0;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0, p1}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 55
    .line 56
    .line 57
    new-instance p1, Ll/m1h0;

    .line 58
    .line 59
    iget-object v1, p0, Ll/gbu;->f:Ll/ner;

    .line 60
    .line 61
    iget-object v2, p0, Ll/gbu;->g:Ll/nus;

    .line 62
    .line 63
    iget-object v3, p0, Ll/gbu;->h:Ll/a1h0;

    .line 64
    .line 65
    invoke-direct {p1, v1, v2, v3}, Ll/m1h0;-><init>(Ll/ner;Ll/nus;Ll/a1h0;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0, p1}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 69
    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_2
    new-instance p1, Ll/x1h0;

    .line 73
    .line 74
    iget-object v1, p0, Ll/gbu;->f:Ll/ner;

    .line 75
    .line 76
    iget-object v2, p0, Ll/gbu;->g:Ll/nus;

    .line 77
    .line 78
    invoke-direct {p1, v1, v2}, Ll/x1h0;-><init>(Ll/ner;Ll/nus;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p0, p1}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 82
    .line 83
    .line 84
    new-instance p1, Ll/m1h0;

    .line 85
    .line 86
    iget-object v1, p0, Ll/gbu;->f:Ll/ner;

    .line 87
    .line 88
    iget-object v2, p0, Ll/gbu;->g:Ll/nus;

    .line 89
    .line 90
    iget-object v3, p0, Ll/gbu;->h:Ll/a1h0;

    .line 91
    .line 92
    invoke-direct {p1, v1, v2, v3}, Ll/m1h0;-><init>(Ll/ner;Ll/nus;Ll/a1h0;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {p0, p1}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 96
    .line 97
    .line 98
    :goto_0
    iput-boolean v0, p0, Ll/gbu;->j:Z

    .line 99
    .line 100
    :cond_3
    return-void
.end method


# virtual methods
.method public T()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/ppi0;->l()Ll/ppi0;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/ppi0;->x()Z

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
    new-instance v0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeSummaryEvent;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/mus;->F2()Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 22
    .line 23
    .line 24
    invoke-direct {v0, v1}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeSummaryEvent;-><init>(Lcom/tantan/live/home/eventbus/LiveHomeEventBus;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeSummaryEvent;->summary()Ll/v3f$d;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Lrx/c;

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    new-instance v1, Ll/cbu;

    .line 42
    .line 43
    invoke-direct {v1, p0}, Ll/cbu;-><init>(Ll/gbu;)V

    .line 44
    .line 45
    .line 46
    new-instance v2, Ll/dbu;

    .line 47
    .line 48
    invoke-direct {v2, v1}, Ll/dbu;-><init>(Lkotlin/jvm/functions/Function1;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    new-instance v1, Ll/ebu;

    .line 64
    .line 65
    invoke-direct {v1, p0}, Ll/ebu;-><init>(Ll/gbu;)V

    .line 66
    .line 67
    .line 68
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public final U2()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/l6t;->b:Ljava/util/HashMap;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/HashMap;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    .line 13
    .line 14
    iget-object v1, p0, Ll/l6t;->b:Ljava/util/HashMap;

    .line 15
    .line 16
    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    new-instance v2, Ll/fbu;

    .line 24
    .line 25
    invoke-direct {v2, p0}, Ll/fbu;-><init>(Ll/gbu;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v1, v2}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 32
    .line 33
    .line 34
    :cond_1
    :goto_0
    return-void
.end method
