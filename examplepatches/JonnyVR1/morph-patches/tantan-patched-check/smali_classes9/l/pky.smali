.class public Ll/pky;
.super Ll/bhy;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/oo2;",
        "VM:",
        "Ll/lky;",
        ">",
        "Ll/bhy<",
        "TD;TVM;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;Ll/lky;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "TD;>;TVM;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/bhy;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic W3(Ljava/lang/Throwable;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic X3(Ll/pky;Ll/uxj0;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pky;->a4(Ll/uxj0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic Y3(Ll/pky;Lcom/p1/mobile/putong/live/base/bean/LivingUsers;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pky;->b4(Lcom/p1/mobile/putong/live/base/bean/LivingUsers;)V

    return-void
.end method

.method private c4()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v1}, Ll/oo2;->n2()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Ll/oo2;->N1(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method


# virtual methods
.method public P3()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/y8s;->P3()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/pky;->init()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public S3()Ll/ely;
    .locals 3
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    new-instance v0, Ll/ely;

    .line 2
    .line 3
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 4
    .line 5
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->fa:I

    .line 6
    .line 7
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast p0, Ll/lky;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/lky;->c()Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const/4 v2, 0x0

    .line 20
    invoke-direct {v0, v1, p0, v2}, Ll/ely;-><init>(Ljava/lang/String;Landroid/view/View;I)V

    .line 21
    .line 22
    .line 23
    return-object v0
.end method

.method public T3()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public V3()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/pky;->c4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Z3()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget p0, p0, Ll/oo2;->u:I

    .line 6
    .line 7
    return p0
.end method

.method public final synthetic a4(Ll/uxj0;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/oo2;->s1()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final synthetic b4(Lcom/p1/mobile/putong/live/base/bean/LivingUsers;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/lky;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object p0, p0, Ll/oo2;->B:Ll/x7g;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/x7g;->A()Ll/cm0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {v0, p1, p0}, Ll/lky;->f(Lcom/p1/mobile/putong/live/base/bean/LivingUsers;Ll/cm0;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public init()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/lky;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Ll/lky;->d(Z)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Ll/oo2;->m2()Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/mky;

    .line 18
    .line 19
    invoke-direct {v1}, Ll/mky;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lrx/c;->onErrorReturn(Ll/qcj;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/nky;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/nky;-><init>(Ll/pky;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {p0, v0}, Ll/y8s;->N3(Lrx/c;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    new-instance v1, Ll/oky;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Ll/oky;-><init>(Ll/pky;)V

    .line 42
    .line 43
    .line 44
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 49
    .line 50
    .line 51
    return-void
.end method
