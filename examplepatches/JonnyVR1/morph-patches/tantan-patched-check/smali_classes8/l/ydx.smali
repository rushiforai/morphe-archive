.class public Ll/ydx;
.super Ll/k8x;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/k8x<",
        "Ll/rex;",
        ">;"
    }
.end annotation


# instance fields
.field public d:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
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

.field public f:Z

.field public g:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
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
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Ll/ydx;->f:Z

    .line 6
    .line 7
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 8
    .line 9
    invoke-static {p1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Ll/ydx;->g:Lrx/subjects/a;

    .line 14
    .line 15
    return-void
.end method

.method public static synthetic C0(Ll/ydx;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ydx;->r1()V

    return-void
.end method

.method public static synthetic D0(Ll/ydx;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ydx;->j1(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic E0(Ll/ydx;Lcom/p1/mobile/putong/core/data/Conversation;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/ydx;->p1(Lcom/p1/mobile/putong/core/data/Conversation;Ljava/lang/String;Z)V

    return-void
.end method

.method public static synthetic F0(Ll/ydx;Lcom/p1/mobile/putong/data/Counter;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ydx;->m1(Lcom/p1/mobile/putong/data/Counter;)V

    return-void
.end method

.method public static synthetic G0(Ll/ydx;Lcom/p1/mobile/putong/core/data/UserPrivilege;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ydx;->g1(Lcom/p1/mobile/putong/core/data/UserPrivilege;)V

    return-void
.end method

.method public static synthetic H0(Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 1

    .line 1
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 2
    .line 3
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->read:Ljava/lang/Boolean;

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/g;->mq(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic I0(Ll/ydx;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ydx;->h1(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic J0(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 2
    .line 3
    iget-object v0, v0, Ll/il8;->m:Ll/mm6;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Ll/wzh0;->query(Ljava/lang/String;)Lcom/tantanapp/common/data/DbObject;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 12
    .line 13
    const-string v0, "default"

    .line 14
    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 16
    .line 17
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 20
    .line 21
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/g;->mq(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static synthetic L0(Ll/ydx;Lcom/p1/mobile/putong/data/User;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ydx;->l1(Lcom/p1/mobile/putong/data/User;Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic N0(Ll/ydx;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ydx;->f1(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic O0(Ll/ydx;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ydx;->e1()V

    return-void
.end method

.method public static synthetic P0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic Q0(Ll/ydx;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ydx;->k1(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic R0(Lcom/p1/mobile/putong/data/Counter;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->e2()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    xor-int/lit8 p0, p0, 0x1

    .line 14
    .line 15
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public static synthetic S0(Ll/ydx;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ydx;->s1()V

    return-void
.end method

.method public static synthetic U0(Ll/ydx;Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ydx;->o1(Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic V0(Lcom/p1/mobile/putong/core/data/Message;)Lrx/c;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/g;->Fo()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic W0(Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->U:Ll/fy6;

    .line 4
    .line 5
    new-instance v1, Ll/pdx;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/pdx;-><init>(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/fy6;->a(Ll/x20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic X0(Ll/ydx;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ydx;->q1(Ljava/lang/String;Z)V

    return-void
.end method

.method public static synthetic Y0(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->U:Ll/fy6;

    .line 4
    .line 5
    new-instance v1, Ll/jdx;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/jdx;-><init>(Lcom/p1/mobile/putong/data/User;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/fy6;->a(Ll/x20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic a1(Ll/ydx;ZLl/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ydx;->n1(ZLl/uxj0;)V

    return-void
.end method

.method public static synthetic b1(Ll/ydx;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ydx;->i1()V

    return-void
.end method

.method public static synthetic c1(Lcom/p1/mobile/putong/core/data/UserPrivilege;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {}, Ll/joa;->F3()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method private synthetic e1()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Ll/ydx;->v1(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private synthetic f1(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->setSwipeBackEnable(Z)V

    .line 7
    .line 8
    .line 9
    invoke-static {}, Ll/toh0;->s()V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 13
    .line 14
    check-cast v0, Ll/rex;

    .line 15
    .line 16
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    iget v1, p0, Ll/k8x;->a:I

    .line 21
    .line 22
    invoke-virtual {v0, p1, v1}, Ll/rex;->s0(ZI)V

    .line 23
    .line 24
    .line 25
    iget p1, p0, Ll/k8x;->a:I

    .line 26
    .line 27
    const/16 v0, 0x2b

    .line 28
    .line 29
    if-ne p1, v0, :cond_0

    .line 30
    .line 31
    const/4 p1, 0x1

    .line 32
    iput-boolean p1, p0, Ll/ydx;->f:Z

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    new-instance v0, Ll/cdx;

    .line 39
    .line 40
    invoke-direct {v0, p0}, Ll/cdx;-><init>(Ll/ydx;)V

    .line 41
    .line 42
    .line 43
    const-wide/16 v1, 0x5dc

    .line 44
    .line 45
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 46
    .line 47
    .line 48
    :cond_0
    return-void
.end method

.method private synthetic g1(Lcom/p1/mobile/putong/core/data/UserPrivilege;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-interface {p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->pollConversation()Lrx/c;

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private synthetic h1(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 6
    .line 7
    move-object p1, p0

    .line 8
    check-cast p1, Ll/rex;

    .line 9
    .line 10
    iget-object p1, p1, Ll/rex;->L:Ll/f0r;

    .line 11
    .line 12
    check-cast p0, Ll/rex;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/rex;->h0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p1, p0}, Ll/f0r;->g(Ll/d0r;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 23
    .line 24
    if-ne p1, v0, :cond_1

    .line 25
    .line 26
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 27
    .line 28
    check-cast p0, Ll/rex;

    .line 29
    .line 30
    iget-object p0, p0, Ll/rex;->L:Ll/f0r;

    .line 31
    .line 32
    const/4 p1, 0x0

    .line 33
    invoke-virtual {p0, p1}, Ll/f0r;->g(Ll/d0r;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    sget-object v0, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 38
    .line 39
    if-ne p1, v0, :cond_2

    .line 40
    .line 41
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 42
    .line 43
    check-cast p0, Ll/rex;

    .line 44
    .line 45
    iget-object p0, p0, Ll/rex;->L:Ll/f0r;

    .line 46
    .line 47
    invoke-virtual {p0}, Ll/f0r;->b()V

    .line 48
    .line 49
    .line 50
    :cond_2
    return-void
.end method

.method private synthetic i1()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/rex;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/rex;->destroy()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic j1(Ll/uxj0;)V
    .locals 3

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Ll/k8x;->b:Ljava/lang/String;

    .line 14
    .line 15
    invoke-interface {v0, v1}, Ll/qhk0;->getUserById(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Ll/k8x;->c:Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 22
    .line 23
    check-cast v1, Ll/rex;

    .line 24
    .line 25
    iget v2, p0, Ll/k8x;->a:I

    .line 26
    .line 27
    iget-object p0, p0, Ll/ydx;->e:Ljava/util/ArrayList;

    .line 28
    .line 29
    invoke-virtual {v1, p1, v0, v2, p0}, Ll/rex;->Q0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;ILjava/util/ArrayList;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method private synthetic m1(Lcom/p1/mobile/putong/data/Counter;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->e2()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iget-object v0, p0, Ll/k8x;->b:Ljava/lang/String;

    .line 20
    .line 21
    invoke-interface {p1, v0}, Ll/qhk0;->getUserById(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ll/xdx;

    .line 30
    .line 31
    invoke-direct {v1, p0, p1}, Ll/xdx;-><init>(Ll/ydx;Lcom/p1/mobile/putong/data/User;)V

    .line 32
    .line 33
    .line 34
    invoke-static {v0, p1, v1}, Ll/yie0;->t(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/y20;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method private t1(Ljava/lang/String;ZZ)V
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object v1, p0, Ll/k8x;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    new-instance v2, Ll/idx;

    .line 16
    .line 17
    invoke-direct {v2, p0, v0, p1, p3}, Ll/idx;-><init>(Ll/ydx;Lcom/p1/mobile/putong/core/data/Conversation;Ljava/lang/String;Z)V

    .line 18
    .line 19
    .line 20
    if-eqz p2, :cond_0

    .line 21
    .line 22
    const-wide/16 v3, 0x1f4

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const-wide/16 v3, 0x1

    .line 26
    .line 27
    :goto_0
    invoke-virtual {v1, v2, v3, v4}, Lcom/p1/mobile/android/app/Act;->postDelayed(Ljava/lang/Runnable;J)V

    .line 28
    .line 29
    .line 30
    if-eqz p2, :cond_1

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 37
    .line 38
    .line 39
    :cond_1
    return-void
.end method


# virtual methods
.method public a0()V
    .locals 4

    .line 1
    new-instance v0, Ll/bdx;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/bdx;-><init>(Ll/ydx;)V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/mdx;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Ll/mdx;-><init>(Ll/ydx;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0, v1}, Ll/ar2;->creates(Ll/y20;Ll/x20;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/ydx;->g:Lrx/subjects/a;

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/qdx;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/qdx;-><init>(Ll/ydx;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    iget v0, p0, Ll/k8x;->a:I

    .line 33
    .line 34
    const/16 v1, 0x2b

    .line 35
    .line 36
    if-ne v0, v1, :cond_0

    .line 37
    .line 38
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 39
    .line 40
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/c;->n3()Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    new-instance v1, Ll/rdx;

    .line 53
    .line 54
    invoke-direct {v1}, Ll/rdx;-><init>()V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    const/4 v1, 0x1

    .line 62
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    new-instance v2, Ll/sdx;

    .line 67
    .line 68
    invoke-direct {v2, p0}, Ll/sdx;-><init>(Ll/ydx;)V

    .line 69
    .line 70
    .line 71
    new-instance v3, Ll/tdx;

    .line 72
    .line 73
    invoke-direct {v3}, Ll/tdx;-><init>()V

    .line 74
    .line 75
    .line 76
    invoke-static {v2, v3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 81
    .line 82
    .line 83
    invoke-static {}, Ll/spl0;->X()Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    if-eqz v0, :cond_1

    .line 88
    .line 89
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 90
    .line 91
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 92
    .line 93
    const-string v2, "limitedTrialSee"

    .line 94
    .line 95
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    invoke-virtual {v0, v2}, Ll/joa;->v3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Lrx/c;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    new-instance v2, Ll/udx;

    .line 104
    .line 105
    invoke-direct {v2}, Ll/udx;-><init>()V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v0, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    new-instance v1, Ll/vdx;

    .line 121
    .line 122
    invoke-direct {v1, p0}, Ll/vdx;-><init>(Ll/ydx;)V

    .line 123
    .line 124
    .line 125
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 130
    .line 131
    .line 132
    return-void

    .line 133
    :cond_0
    const/16 v1, 0x2d

    .line 134
    .line 135
    if-ne v0, v1, :cond_1

    .line 136
    .line 137
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    new-instance v1, Ll/wdx;

    .line 142
    .line 143
    invoke-direct {v1, p0}, Ll/wdx;-><init>(Ll/ydx;)V

    .line 144
    .line 145
    .line 146
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 151
    .line 152
    .line 153
    :cond_1
    return-void
.end method

.method public d1()I
    .locals 0

    .line 1
    iget p0, p0, Ll/k8x;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic k1(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/core/ui/match/b;->r(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic l1(Lcom/p1/mobile/putong/data/User;Ljava/lang/Integer;)V
    .locals 1

    .line 1
    new-instance p2, Ll/ddx;

    .line 2
    .line 3
    invoke-direct {p2, p1}, Ll/ddx;-><init>(Lcom/p1/mobile/putong/data/User;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p2}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    sget-object p2, Ll/f760;->Companion:Ll/f760$a;

    .line 10
    .line 11
    invoke-virtual {p2}, Ll/f760$a;->c()V

    .line 12
    .line 13
    .line 14
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    invoke-interface {p2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->pollConversation()Lrx/c;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    new-instance v0, Ll/edx;

    .line 26
    .line 27
    invoke-direct {v0, p0, p1}, Ll/edx;-><init>(Ll/ydx;Lcom/p1/mobile/putong/data/User;)V

    .line 28
    .line 29
    .line 30
    const-wide/16 p0, 0x3e8

    .line 31
    .line 32
    invoke-static {p2, v0, p0, p1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final synthetic n1(ZLl/uxj0;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-string p1, "\u6d88\u606f\u5df2\u53d1\u9001"

    .line 4
    .line 5
    invoke-static {p1}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic o1(Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-static {p2}, Ll/rv4;->f(Ljava/lang/Throwable;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget-object p1, Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;->CHECK:Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

    .line 12
    .line 13
    invoke-static {p0, p2, p1}, Ll/rv4;->e(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-static {p2}, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->isIllegalContent(Ljava/lang/Throwable;)Z

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    if-eqz p2, :cond_1

    .line 22
    .line 23
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 26
    .line 27
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/g;->Of(Ljava/lang/String;)Lrx/c;

    .line 30
    .line 31
    .line 32
    sget p0, Lcom/p1/mobile/putong/core/R$string;->L7:I

    .line 33
    .line 34
    invoke-static {p0}, Ll/r1j0;->f(I)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Th:I

    .line 39
    .line 40
    iget-object p2, p0, Ll/k8x;->c:Lcom/p1/mobile/putong/data/User;

    .line 41
    .line 42
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    invoke-static {p1, p2}, Ll/bfx;->f(ILcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public final synthetic p1(Lcom/p1/mobile/putong/core/data/Conversation;Ljava/lang/String;Z)V
    .locals 7

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ll/kdx;

    .line 8
    .line 9
    invoke-direct {v0, p1}, Ll/kdx;-><init>(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 10
    .line 11
    .line 12
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    new-instance v3, Lcom/p1/mobile/putong/core/data/Message;

    .line 16
    .line 17
    invoke-direct {v3}, Lcom/p1/mobile/putong/core/data/Message;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object p2, v3, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 21
    .line 22
    const-string p1, "text"

    .line 23
    .line 24
    invoke-static {p1}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iput-object p1, v3, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 29
    .line 30
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 31
    .line 32
    iget-object v1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 33
    .line 34
    iget-object v2, p0, Ll/k8x;->b:Ljava/lang/String;

    .line 35
    .line 36
    const/4 v5, 0x0

    .line 37
    const/4 v6, 0x0

    .line 38
    const/4 v4, 0x0

    .line 39
    invoke-virtual/range {v1 .. v6}, Lcom/p1/mobile/putong/core/api/g;->Fn(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Sticker;ZZ)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    new-instance p2, Ll/ldx;

    .line 44
    .line 45
    invoke-direct {p2}, Ll/ldx;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1, p2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    new-instance p2, Ll/ndx;

    .line 53
    .line 54
    invoke-direct {p2, p0, p3}, Ll/ndx;-><init>(Ll/ydx;Z)V

    .line 55
    .line 56
    .line 57
    new-instance p3, Ll/odx;

    .line 58
    .line 59
    invoke-direct {p3, p0, v3}, Ll/odx;-><init>(Ll/ydx;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 60
    .line 61
    .line 62
    invoke-static {p2, p3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 67
    .line 68
    .line 69
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
    iput-object p3, p0, Ll/ydx;->d:Ljava/util/ArrayList;

    .line 5
    .line 6
    iput-object p4, p0, Ll/ydx;->e:Ljava/util/ArrayList;

    .line 7
    .line 8
    return-void
.end method

.method public final synthetic q1(Ljava/lang/String;Z)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0}, Ll/ydx;->t1(Ljava/lang/String;ZZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic r1()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/ydx;->f:Z

    .line 3
    .line 4
    return-void
.end method

.method public final synthetic s1()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/ydx;->f:Z

    .line 3
    .line 4
    return-void
.end method

.method public u1(Ljava/lang/String;Z)V
    .locals 3

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    sget-object v0, Ll/uqb0;->Z:Ll/a4j;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Ll/a4j;->K(Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Vi:I

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->E0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Ti:I

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->D(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Si:I

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->k0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Ui:I

    .line 43
    .line 44
    new-instance v2, Ll/fdx;

    .line 45
    .line 46
    invoke-direct {v2, p0, p1, p2}, Ll/fdx;-><init>(Ll/ydx;Ljava/lang/String;Z)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 54
    .line 55
    .line 56
    new-instance p1, Ljava/util/HashSet;

    .line 57
    .line 58
    sget-object p2, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->r:Ll/xyd0;

    .line 59
    .line 60
    invoke-virtual {p2}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    check-cast p2, Ljava/util/Collection;

    .line 65
    .line 66
    invoke-direct {p1, p2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 67
    .line 68
    .line 69
    iget-object p0, p0, Ll/k8x;->b:Ljava/lang/String;

    .line 70
    .line 71
    invoke-virtual {p1, p0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    sget-object p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->r:Ll/xyd0;

    .line 75
    .line 76
    invoke-virtual {p0, p1}, Ll/dyd0;->put(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :cond_1
    const/4 v0, 0x0

    .line 81
    invoke-direct {p0, p1, p2, v0}, Ll/ydx;->t1(Ljava/lang/String;ZZ)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public v1(Z)V
    .locals 3

    .line 1
    if-nez p1, :cond_1

    .line 2
    .line 3
    iget-boolean p1, p0, Ll/ydx;->f:Z

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    return-void

    .line 9
    :cond_1
    :goto_0
    const/4 p1, 0x1

    .line 10
    iput-boolean p1, p0, Ll/ydx;->f:Z

    .line 11
    .line 12
    sget-object p1, Ll/for;->INSTANCE:Ll/for;

    .line 13
    .line 14
    invoke-virtual {p1}, Ll/for;->b()Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    const-string v0, "p_message,locked_match"

    .line 19
    .line 20
    if-eqz p1, :cond_2

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    new-instance v1, Ll/gdx;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/gdx;-><init>(Ll/ydx;)V

    .line 29
    .line 30
    .line 31
    const/4 p0, 0x0

    .line 32
    invoke-static {p1, v0, p0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/c;->G0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;Ll/x20;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_2
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->see_who_likes_me:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 41
    .line 42
    new-instance v2, Ll/hdx;

    .line 43
    .line 44
    invoke-direct {v2, p0}, Ll/hdx;-><init>(Ll/ydx;)V

    .line 45
    .line 46
    .line 47
    invoke-static {p1, v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/purchase/c;->C1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/x20;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method
