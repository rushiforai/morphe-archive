.class public Ll/h6u;
.super Ll/a1u;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/a1u<",
        "Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/teenmodeTab/LiveSquareTeenModeFrag;",
        ">;"
    }
.end annotation


# instance fields
.field public l:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/v5u;",
            ">;"
        }
    .end annotation
.end field

.field public final m:Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;

.field public n:Ll/k6u;


# direct methods
.method public constructor <init>(Ll/ner;Ll/nus;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/a1u;-><init>(Ll/ner;Ll/nus;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Ll/h6u;->l:Lrx/subjects/a;

    .line 9
    .line 10
    new-instance p1, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;

    .line 11
    .line 12
    const-string p2, "LiveSquareSuggest"

    .line 13
    .line 14
    invoke-direct {p1, p2}, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Ll/h6u;->m:Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;

    .line 18
    .line 19
    new-instance p1, Ll/k6u;

    .line 20
    .line 21
    invoke-direct {p1}, Ll/k6u;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Ll/h6u;->n:Ll/k6u;

    .line 25
    .line 26
    return-void
.end method

.method public static synthetic U2(Ll/h6u;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/h6u;->j3(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic V2(Ll/h6u;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/h6u;->n3(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic W2(Ll/h6u;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/h6u;->h3()V

    return-void
.end method

.method public static synthetic X2(Ll/h6u;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/h6u;->g3()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic Y2(Ll/h6u;Ll/v5u;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/h6u;->e3(Ll/v5u;)V

    return-void
.end method

.method public static synthetic Z2(Ll/h6u;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/h6u;->f3(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic a3(Ll/h6u;Ll/v5u;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/h6u;->i3(Ll/v5u;)V

    return-void
.end method

.method public static synthetic b3(Ll/v5u;)Ljava/lang/Boolean;
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

.method public static synthetic c3(Ll/h6u;Ll/v5u;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/h6u;->m3(Ll/v5u;)V

    return-void
.end method

.method public static synthetic d3(Ll/h6u;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/h6u;->k3()V

    return-void
.end method

.method private synthetic f3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public I2()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/h6u;->l:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/c;->asObservable()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/c6u;

    .line 20
    .line 21
    invoke-direct {v1}, Ll/c6u;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/d6u;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/d6u;-><init>(Ll/h6u;)V

    .line 31
    .line 32
    .line 33
    new-instance v2, Ll/e6u;

    .line 34
    .line 35
    invoke-direct {v2, p0}, Ll/e6u;-><init>(Ll/h6u;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final synthetic e3(Ll/v5u;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/teenmodeTab/LiveSquareTeenModeFrag;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/teenmodeTab/LiveSquareTeenModeFrag;->K5(Ll/v5u;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic g3()Lrx/c;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/h6u;->m:Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;

    .line 2
    .line 3
    iget-object p0, p0, Ll/h6u;->n:Ll/k6u;

    .line 4
    .line 5
    sget v1, Ll/y6u;->a:I

    .line 6
    .line 7
    invoke-virtual {p0, v1}, Ll/k6u;->c(I)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/16 v1, 0x64

    .line 12
    .line 13
    const-string v2, "TeenModeLoadSuggestInfo"

    .line 14
    .line 15
    invoke-virtual {v0, v2, p0, v1}, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;->f(Ljava/lang/String;Lrx/c;I)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public final synthetic h3()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/teenmodeTab/LiveSquareTeenModeFrag;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/teenmodeTab/LiveSquareTeenModeFrag;->I5()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic i3(Ll/v5u;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h6u;->l:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic j3(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/teenmodeTab/LiveSquareTeenModeFrag;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/LiveSquareBaseListFrag;->v5()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/h6u;->l:Lrx/subjects/a;

    .line 9
    .line 10
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Ll/v5u;

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/v5u;->b()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    :cond_0
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 25
    .line 26
    check-cast p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/teenmodeTab/LiveSquareTeenModeFrag;

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/teenmodeTab/LiveSquareTeenModeFrag;->J5(Ljava/lang/Throwable;)V

    .line 29
    .line 30
    .line 31
    :cond_1
    sget-object p0, Ll/tbs;->a:Landroid/app/Application;

    .line 32
    .line 33
    sget p1, Lcom/p1/mobile/putong/live/base/R$string;->a0:I

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public final synthetic k3()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/teenmodeTab/LiveSquareTeenModeFrag;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/teenmodeTab/LiveSquareTeenModeFrag;->G5()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic m3(Ll/v5u;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p1, v0}, Ll/v5u;->e(Z)V

    .line 3
    .line 4
    .line 5
    iget-object p0, p0, Ll/h6u;->l:Lrx/subjects/a;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/l6t;->n()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/h6u;->m:Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;->d()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic n3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/teenmodeTab/LiveSquareTeenModeFrag;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/teenmodeTab/LiveSquareTeenModeFrag;->H5()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public o3()V
    .locals 4

    .line 1
    new-instance v0, Ll/x5u;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/x5u;-><init>(Ll/h6u;)V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {p0, v0, v1}, Ll/cyr;->duringCreated(Ll/pcj;Z)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/y5u;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/y5u;-><init>(Ll/h6u;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lrx/c;->doOnSubscribe(Ll/x20;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/z5u;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/z5u;-><init>(Ll/h6u;)V

    .line 23
    .line 24
    .line 25
    new-instance v2, Ll/a6u;

    .line 26
    .line 27
    invoke-direct {v2, p0}, Ll/a6u;-><init>(Ll/h6u;)V

    .line 28
    .line 29
    .line 30
    new-instance v3, Ll/b6u;

    .line 31
    .line 32
    invoke-direct {v3, p0}, Ll/b6u;-><init>(Ll/h6u;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v1, v2, v3}, Ll/dhw;->f(Ll/y20;Ll/y20;Ll/x20;)Ll/t9t;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public p3()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/h6u;->l:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/v5u;

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/v5u;->a()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object v1, p0, Ll/h6u;->m:Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;

    .line 19
    .line 20
    iget-object v2, p0, Ll/h6u;->n:Ll/k6u;

    .line 21
    .line 22
    invoke-virtual {v2, v0}, Ll/k6u;->d(Ll/v5u;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const-string v2, "TeenModeLoadNextPage"

    .line 27
    .line 28
    invoke-virtual {v1, v2, v0}, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;->e(Ljava/lang/String;Lrx/c;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    new-instance v1, Ll/f6u;

    .line 37
    .line 38
    invoke-direct {v1, p0}, Ll/f6u;-><init>(Ll/h6u;)V

    .line 39
    .line 40
    .line 41
    new-instance v2, Ll/g6u;

    .line 42
    .line 43
    invoke-direct {v2, p0}, Ll/g6u;-><init>(Ll/h6u;)V

    .line 44
    .line 45
    .line 46
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 51
    .line 52
    .line 53
    :cond_1
    :goto_0
    return-void
.end method

.method public q3(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    .line 1
    sget-object v0, Ll/tbs;->f:Ll/j6t;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/mus;->act()Lcom/p1/mobile/android/app/Act;

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
    const/4 v3, 0x1

    .line 12
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->C(Z)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-virtual {v2, p1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->D(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->O(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p1, v3}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->P(Z)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p1, p3}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->y(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->u()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {v0, v1, p1}, Ll/j6t;->f(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)Landroid/content/Intent;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p0}, Ll/mus;->act()Lcom/p1/mobile/android/app/Act;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method
