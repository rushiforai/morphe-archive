.class public Ll/w8v;
.super Ll/cyr;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/cyr<",
        "Ll/g9v;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Ll/nus;


# direct methods
.method public constructor <init>(Ll/nus;Lv/navigationbar/VNavigationBar;Z)V
    .locals 1

    .line 1
    iget-object v0, p1, Ll/nus;->b:Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseFrag;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Ll/cyr;-><init>(Ll/ner;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Ll/w8v;->a:Ll/nus;

    .line 7
    .line 8
    new-instance p1, Ll/g9v;

    .line 9
    .line 10
    invoke-direct {p1, p2, p3}, Ll/g9v;-><init>(Lv/navigationbar/VNavigationBar;Z)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ll/cyr;->C(Ll/iam;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic q2(Ljava/lang/Throwable;)Lrx/c;
    .locals 0

    .line 1
    invoke-static {}, Lrx/c;->empty()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic r2(Ll/w8v;Lcom/p1/mobile/android/app/c;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w8v;->B2(Lcom/p1/mobile/android/app/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic s2(Ll/w8v;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w8v;->C2(Landroid/util/Pair;)V

    return-void
.end method

.method public static synthetic u2(Ljava/lang/Throwable;)Lrx/c;
    .locals 0

    .line 1
    invoke-static {}, Lrx/c;->empty()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic v2(Ll/w8v;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w8v;->D2(Landroid/util/Pair;)V

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

.method private y2()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Landroid/util/Pair<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveAssert;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSquareButton;",
            ">;>;>;"
        }
    .end annotation

    .line 1
    sget-object p0, Ll/zrv;->a:Ll/wrv;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/api/VirtualVoiceRoomApiProvider;->getMyGuild(Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    new-instance v0, Ll/s8v;

    .line 15
    .line 16
    invoke-direct {v0}, Ll/s8v;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v0}, Lrx/c;->onErrorResumeNext(Ll/qcj;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/virtual/api/VirtualVoiceRoomApiProvider;->getVoiceSquareButtons()Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/t8v;

    .line 28
    .line 29
    invoke-direct {v1}, Ll/t8v;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Lrx/c;->onErrorResumeNext(Ll/qcj;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    new-instance v1, Ll/u8v;

    .line 37
    .line 38
    invoke-direct {v1}, Ll/u8v;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-static {p0, v0, v1}, Lrx/c;->zip(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0
.end method


# virtual methods
.method public A2(Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/g9v;

    .line 4
    .line 5
    iget-object p0, p0, Ll/w8v;->a:Ll/nus;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/nus;->a()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {v0, p0, p1}, Ll/g9v;->q(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic B2(Lcom/p1/mobile/android/app/c;)Lrx/c;
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/w8v;->y2()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic C2(Landroid/util/Pair;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/g9v;

    .line 4
    .line 5
    iget-object v1, p0, Ll/w8v;->a:Ll/nus;

    .line 6
    .line 7
    invoke-virtual {v1}, Ll/nus;->a()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iget-object v2, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v2, Ljava/util/List;

    .line 14
    .line 15
    invoke-virtual {v0, v1, v2}, Ll/g9v;->A(Lcom/p1/mobile/android/app/Act;Ljava/util/List;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 19
    .line 20
    check-cast p0, Ll/g9v;

    .line 21
    .line 22
    iget-object p1, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveAssert;

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Ll/g9v;->B(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveAssert;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final synthetic D2(Landroid/util/Pair;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/g9v;

    .line 4
    .line 5
    iget-object v1, p0, Ll/w8v;->a:Ll/nus;

    .line 6
    .line 7
    invoke-virtual {v1}, Ll/nus;->a()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iget-object v2, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v2, Ljava/util/List;

    .line 14
    .line 15
    invoke-virtual {v0, v1, v2}, Ll/g9v;->A(Lcom/p1/mobile/android/app/Act;Ljava/util/List;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 19
    .line 20
    check-cast p0, Ll/g9v;

    .line 21
    .line 22
    iget-object p1, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveAssert;

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Ll/g9v;->B(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveAssert;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public E2()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/w8v;->y2()Lrx/c;

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
    new-instance v1, Ll/v8v;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/v8v;-><init>(Ll/w8v;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public z2()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/cyr;->lifecycle()Lrx/c;

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
    new-instance v1, Ll/p8v;

    .line 10
    .line 11
    invoke-direct {v1}, Ll/p8v;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/q8v;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/q8v;-><init>(Ll/w8v;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/r8v;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/r8v;-><init>(Ll/w8v;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    return-void
.end method
