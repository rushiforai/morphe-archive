.class public Ll/rgx;
.super Ll/k8x;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/k8x<",
        "Ll/ugx;",
        ">;"
    }
.end annotation


# instance fields
.field public final d:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/k8x;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 5
    .line 6
    invoke-static {p1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Ll/rgx;->d:Lrx/subjects/a;

    .line 11
    .line 12
    new-instance p1, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Ll/rgx;->e:Ljava/util/ArrayList;

    .line 18
    .line 19
    return-void
.end method

.method public static synthetic C0(Ll/rgx;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/rgx;->F0(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic D0(Ll/rgx;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/rgx;->G0(Ll/uxj0;)V

    return-void
.end method

.method private synthetic F0(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 6
    .line 7
    move-object v0, p1

    .line 8
    check-cast v0, Ll/ugx;

    .line 9
    .line 10
    iget-object v0, v0, Ll/ugx;->b:Ll/f0r;

    .line 11
    .line 12
    check-cast p1, Ll/ugx;

    .line 13
    .line 14
    invoke-virtual {p1}, Ll/ugx;->c()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {v0, p1}, Ll/f0r;->g(Ll/d0r;)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 22
    .line 23
    check-cast p0, Ll/ugx;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/ugx;->j()V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 30
    .line 31
    if-ne p1, v0, :cond_1

    .line 32
    .line 33
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 34
    .line 35
    check-cast p0, Ll/ugx;

    .line 36
    .line 37
    iget-object p0, p0, Ll/ugx;->b:Ll/f0r;

    .line 38
    .line 39
    const/4 p1, 0x0

    .line 40
    invoke-virtual {p0, p1}, Ll/f0r;->g(Ll/d0r;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_1
    sget-object v0, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 45
    .line 46
    if-ne p1, v0, :cond_2

    .line 47
    .line 48
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 49
    .line 50
    check-cast p0, Ll/ugx;

    .line 51
    .line 52
    iget-object p0, p0, Ll/ugx;->b:Ll/f0r;

    .line 53
    .line 54
    invoke-virtual {p0}, Ll/f0r;->b()V

    .line 55
    .line 56
    .line 57
    :cond_2
    return-void
.end method

.method private synthetic G0(Ll/uxj0;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p0, Ll/k8x;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-interface {p1, v0}, Ll/qhk0;->getUserById(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Ll/k8x;->c:Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 14
    .line 15
    check-cast p0, Ll/ugx;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/ugx;->r()V

    .line 18
    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public E0()Ljava/lang/Boolean;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/rgx;->e:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-le v0, v1, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Ll/rgx;->e:Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ljava/lang/String;

    .line 17
    .line 18
    iput-object v0, p0, Ll/k8x;->b:Ljava/lang/String;

    .line 19
    .line 20
    iget-object v0, p0, Ll/rgx;->e:Ljava/util/ArrayList;

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ll/rgx;->d:Lrx/subjects/a;

    .line 27
    .line 28
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 34
    .line 35
    return-object p0

    .line 36
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 37
    .line 38
    return-object p0
.end method

.method public a0()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    new-instance v1, Ll/pgx;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Ll/pgx;-><init>(Ll/rgx;)V

    .line 11
    .line 12
    .line 13
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/rgx;->d:Lrx/subjects/a;

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/qgx;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/qgx;-><init>(Ll/rgx;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public q0(Ljava/lang/String;ILjava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Ll/k8x;->q0(Ljava/lang/String;ILjava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    iput-object p3, p0, Ll/rgx;->e:Ljava/util/ArrayList;

    .line 11
    .line 12
    :cond_0
    return-void
.end method
