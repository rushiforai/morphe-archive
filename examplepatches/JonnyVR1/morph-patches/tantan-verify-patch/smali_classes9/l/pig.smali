.class public Ll/pig;
.super Ll/nhg;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ll/oo2;",
        ">",
        "Ll/nhg<",
        "TT;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/common/fans/FansView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "TT;>;",
            "Lcom/p1/mobile/putong/live/livingroom/common/fans/FansView;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ll/nhg;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/common/fans/FansView;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d4(Landroidx/recyclerview/widget/RecyclerView$u;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0, v0}, Landroidx/recyclerview/widget/RecyclerView$u;->m(II)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic e4(Ll/pig;Ll/jsv;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pig;->g4(Ll/jsv;)V

    return-void
.end method

.method public static synthetic f4(Ll/pig;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pig;->h4(Ljava/lang/Throwable;)V

    return-void
.end method


# virtual methods
.method public a4(Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Ll/v91;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Ll/v91;

    .line 14
    .line 15
    invoke-interface {p0}, Ll/v91;->b()Ll/bjt;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RecyclerViewPoolType;->FANS:Lcom/p1/mobile/putong/live/livingroom/archi/frag/RecyclerViewPoolType;

    .line 20
    .line 21
    new-instance v1, Ll/oig;

    .line 22
    .line 23
    invoke-direct {v1}, Ll/oig;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, v0, p1, v1}, Ll/bjt;->b(Lcom/p1/mobile/putong/live/livingroom/archi/frag/RecyclerViewPoolType;Landroidx/recyclerview/widget/RecyclerView;Ll/y20;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public final synthetic g4(Ll/jsv;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/nhg;->reset()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0}, Ll/vp20;->o()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p1, v0, p0}, Ll/oo2;->M1(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final synthetic h4(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/nhg;->reset()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0}, Ll/vp20;->o()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p1, v0, p0}, Ll/oo2;->M1(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public init()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/nhg;->init()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/vp20;->u()Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Ll/mig;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/mig;-><init>(Ll/pig;)V

    .line 19
    .line 20
    .line 21
    new-instance v2, Ll/nig;

    .line 22
    .line 23
    invoke-direct {v2, p0}, Ll/nig;-><init>(Ll/pig;)V

    .line 24
    .line 25
    .line 26
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 31
    .line 32
    .line 33
    return-void
.end method
