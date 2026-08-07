.class public Ll/a550;
.super Ll/k8x;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/k8x<",
        "Ll/d550;",
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

.field public f:Lrx/subjects/a;
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
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 5
    .line 6
    invoke-static {p1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Ll/a550;->f:Lrx/subjects/a;

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic C0(Ll/a550;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/a550;->H0()V

    return-void
.end method

.method public static synthetic D0(Ll/a550;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/a550;->I0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic E0(Ll/a550;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/a550;->G0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic F0(Ll/a550;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/a550;->J0()V

    return-void
.end method

.method private synthetic G0(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->setSwipeBackEnable(Z)V

    .line 7
    .line 8
    .line 9
    invoke-static {}, Ll/toh0;->s()V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 13
    .line 14
    check-cast p0, Ll/d550;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/d550;->r()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method private synthetic H0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/d550;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/d550;->destroy()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic I0(Ll/uxj0;)V
    .locals 2

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
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 22
    .line 23
    check-cast p0, Ll/d550;

    .line 24
    .line 25
    invoke-virtual {p0, p1, v0}, Ll/d550;->B(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method


# virtual methods
.method public final synthetic J0()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/a550;->f:Lrx/subjects/a;

    .line 2
    .line 3
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public L0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/a550;->d:Ljava/util/ArrayList;

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
    iget-object v0, p0, Ll/a550;->d:Ljava/util/ArrayList;

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
    iget-object v0, p0, Ll/a550;->d:Ljava/util/ArrayList;

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/a550;->e:Ljava/util/ArrayList;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Ll/a550;->f:Lrx/subjects/a;

    .line 32
    .line 33
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 34
    .line 35
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public N0()V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v1, v0, [Ll/sfj0$a;

    .line 3
    .line 4
    const-string v2, "e_match_chat"

    .line 5
    .line 6
    const-string v3, "p_successful_match_view"

    .line 7
    .line 8
    invoke-static {v2, v3, v1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Ll/a550;->d:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    const/4 v2, 0x2

    .line 18
    const/4 v3, 0x1

    .line 19
    if-le v1, v3, :cond_0

    .line 20
    .line 21
    iget-object v1, p0, Ll/a550;->d:Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Ljava/lang/String;

    .line 28
    .line 29
    iput-object v1, p0, Ll/k8x;->b:Ljava/lang/String;

    .line 30
    .line 31
    iget-object v1, p0, Ll/a550;->d:Ljava/util/ArrayList;

    .line 32
    .line 33
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    iget-object v1, p0, Ll/a550;->e:Ljava/util/ArrayList;

    .line 37
    .line 38
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 42
    .line 43
    check-cast v1, Ll/d550;

    .line 44
    .line 45
    invoke-virtual {v1}, Ll/d550;->x()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    iget-object v4, p0, Ll/k8x;->b:Ljava/lang/String;

    .line 54
    .line 55
    invoke-static {v3, v4, v0, v0, v2}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l2(Landroid/content/Context;Ljava/lang/String;ZZI)Landroid/content/Intent;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    new-instance v1, Ll/z450;

    .line 67
    .line 68
    invoke-direct {v1, p0}, Ll/z450;-><init>(Ll/a550;)V

    .line 69
    .line 70
    .line 71
    const-wide/16 v2, 0x258

    .line 72
    .line 73
    invoke-static {v0, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 82
    .line 83
    .line 84
    move-result-object v3

    .line 85
    iget-object v4, p0, Ll/k8x;->b:Ljava/lang/String;

    .line 86
    .line 87
    invoke-static {v3, v4, v0, v0, v2}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l2(Landroid/content/Context;Ljava/lang/String;ZZI)Landroid/content/Intent;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finishWithoutCustomAnimation()V

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method public a0()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/g;->Fo()Lrx/c;

    .line 6
    .line 7
    .line 8
    new-instance v0, Ll/w450;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Ll/w450;-><init>(Ll/a550;)V

    .line 11
    .line 12
    .line 13
    new-instance v1, Ll/x450;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/x450;-><init>(Ll/a550;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v0, v1}, Ll/ar2;->creates(Ll/y20;Ll/x20;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/a550;->f:Lrx/subjects/a;

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/y450;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/y450;-><init>(Ll/a550;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

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

.method public destroy()V
    .locals 0

    .line 1
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
    iput-object p3, p0, Ll/a550;->d:Ljava/util/ArrayList;

    .line 5
    .line 6
    iput-object p4, p0, Ll/a550;->e:Ljava/util/ArrayList;

    .line 7
    .line 8
    return-void
.end method
