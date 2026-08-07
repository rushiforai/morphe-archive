.class public Ll/ki3;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/oo2;",
        "Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Ll/pf2;",
            ">;"
        }
    .end annotation
.end field

.field public j:Ll/x20;


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/LinkedList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/LinkedList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/ki3;->i:Ljava/util/LinkedList;

    .line 10
    .line 11
    new-instance p1, Ll/ji3;

    .line 12
    .line 13
    invoke-direct {p1, p0}, Ll/ji3;-><init>(Ll/ki3;)V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Ll/ki3;->j:Ll/x20;

    .line 17
    .line 18
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static synthetic J3(Ll/ki3;Ll/pf2;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ki3;->R3(Ll/pf2;)V

    return-void
.end method

.method public static synthetic K3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic L3(Ll/ki3;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ki3;->T3()V

    return-void
.end method

.method public static synthetic M3(Ll/ki3;Ll/jsv;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ki3;->S3(Ll/jsv;)V

    return-void
.end method

.method public static synthetic N3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic O3(Ll/jsv;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/jsv;->a()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x4

    .line 6
    if-ne p0, v0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method private synthetic S3(Ll/jsv;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ki3;->P3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public P3()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ki3;->i:Ljava/util/LinkedList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/LinkedList;->clear()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final R3(Ll/pf2;)V
    .locals 2

    .line 1
    invoke-virtual {p1, p0}, Ll/pf2;->f(Ll/ki3;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/li3;->a(Ll/pf2;)V

    .line 5
    .line 6
    .line 7
    instance-of v0, p1, Ll/yoh0;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    move-object v0, p1

    .line 12
    check-cast v0, Ll/yoh0;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/yoh0;->t()Ll/zoh0;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/yoh0;->t()Ll/zoh0;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Ll/zoh0;->k()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    iget-object v0, p0, Ll/ki3;->i:Ljava/util/LinkedList;

    .line 31
    .line 32
    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    const/4 v0, 0x1

    .line 36
    iget-object v1, p0, Ll/ki3;->i:Ljava/util/LinkedList;

    .line 37
    .line 38
    invoke-static {p1, v0, v1}, Ll/li3;->h(Ll/pf2;ZLjava/util/LinkedList;)V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    iget-object v0, p0, Ll/ki3;->i:Ljava/util/LinkedList;

    .line 43
    .line 44
    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    const/4 v0, 0x0

    .line 48
    iget-object v1, p0, Ll/ki3;->i:Ljava/util/LinkedList;

    .line 49
    .line 50
    invoke-static {p1, v0, v1}, Ll/li3;->h(Ll/pf2;ZLjava/util/LinkedList;)V

    .line 51
    .line 52
    .line 53
    :goto_0
    invoke-virtual {p0}, Ll/ki3;->T3()V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/vp20;->l()Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Ll/gi3;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/gi3;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Ll/hi3;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Ll/hi3;-><init>(Ll/ki3;)V

    .line 28
    .line 29
    .line 30
    new-instance p0, Ll/ii3;

    .line 31
    .line 32
    invoke-direct {p0}, Ll/ii3;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

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

.method public final T3()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->s()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Ll/ki3;->i:Ljava/util/LinkedList;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 21
    .line 22
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;

    .line 23
    .line 24
    iget-object v1, p0, Ll/ki3;->i:Ljava/util/LinkedList;

    .line 25
    .line 26
    invoke-virtual {v1}, Ljava/util/LinkedList;->poll()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Ll/pf2;

    .line 31
    .line 32
    iget-object p0, p0, Ll/ki3;->j:Ll/x20;

    .line 33
    .line 34
    invoke-virtual {v0, v1, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->x(Ll/pf2;Ll/x20;)V

    .line 35
    .line 36
    .line 37
    :cond_1
    :goto_0
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/ki3;->i:Ljava/util/LinkedList;

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/util/LinkedList;->clear()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ll/aj1;->e()Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/ei3;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/ei3;-><init>(Ll/ki3;)V

    .line 23
    .line 24
    .line 25
    new-instance p0, Ll/fi3;

    .line 26
    .line 27
    invoke-direct {p0}, Ll/fi3;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 35
    .line 36
    .line 37
    return-void
.end method
