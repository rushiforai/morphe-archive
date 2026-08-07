.class public Ll/umh;
.super Ll/ar2;
.source "SourceFile"

# interfaces
.implements Ll/omg;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/elh;",
        ">;",
        "Ll/omg;"
    }
.end annotation


# static fields
.field public static j:Ljava/lang/String; = "interaction"

.field public static k:Ljava/lang/String; = "friend"

.field public static l:I


# instance fields
.field public a:Ljava/lang/String;

.field public b:I

.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentActivity;",
            ">;"
        }
    .end annotation
.end field

.field public d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentActivity;",
            ">;"
        }
    .end annotation
.end field

.field public e:Z

.field public f:Z

.field public g:Ll/v370;

.field public h:Lcom/p1/mobile/putong/data/Links;

.field public i:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

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
    iput-object p1, p0, Ll/umh;->c:Ljava/util/List;

    .line 10
    .line 11
    new-instance p1, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Ll/umh;->d:Ljava/util/List;

    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    iput-boolean p1, p0, Ll/umh;->e:Z

    .line 20
    .line 21
    new-instance p1, Ll/v370;

    .line 22
    .line 23
    invoke-direct {p1}, Ll/v370;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object p1, p0, Ll/umh;->g:Ll/v370;

    .line 27
    .line 28
    return-void
.end method

.method public static synthetic A0(Ll/umh;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/umh;->I1(Ll/pf60;)V

    return-void
.end method

.method public static synthetic C0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic D0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic E0(Ll/y20;Ll/uxj0;)V
    .locals 0

    .line 1
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic F0(Lcom/p1/mobile/putong/data/Counter;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Counter;->activities:Lcom/p1/mobile/putong/data/CounterActivities;

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/data/CounterActivities;->unread:I

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic G0(Ll/umh;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/umh;->E1(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic H0(Ll/y20;Ll/uxj0;)V
    .locals 0

    .line 1
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic I0(Ll/y20;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic J0(Ll/umh;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/umh;->m1(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic L0(Ll/umh;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/umh;->n1(Lcom/p1/mobile/putong/feed/data/Moment;)V

    return-void
.end method

.method public static synthetic N0(Ll/umh;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/umh;->B1(Ll/pf60;)V

    return-void
.end method

.method public static synthetic O0(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/MomentActivity;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->reference:Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;->id:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    xor-int/lit8 p0, p0, 0x1

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static synthetic P0(Ll/umh;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/umh;->v1(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic Q0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method private Q1(Ll/pf60;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/data/Links;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentActivity;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/umh;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v0, Lcom/p1/mobile/putong/data/Links;

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ll/umh;->g1(Lcom/p1/mobile/putong/data/Links;)Lcom/p1/mobile/putong/data/Links;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Ll/umh;->h:Lcom/p1/mobile/putong/data/Links;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/umh;->h1()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Ll/umh;->c:Ljava/util/List;

    .line 23
    .line 24
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 25
    .line 26
    check-cast p1, Ljava/util/Collection;

    .line 27
    .line 28
    new-instance v1, Ll/olh;

    .line 29
    .line 30
    invoke-direct {v1}, Ll/olh;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-static {p1, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    const-string v0, "activities"

    .line 42
    .line 43
    iget-object v1, p0, Ll/umh;->a:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_1

    .line 50
    .line 51
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 52
    .line 53
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_1

    .line 58
    .line 59
    iget-object v0, p0, Ll/umh;->c:Ljava/util/List;

    .line 60
    .line 61
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 62
    .line 63
    check-cast p1, Ljava/util/Collection;

    .line 64
    .line 65
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 66
    .line 67
    .line 68
    :cond_1
    :goto_0
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 69
    .line 70
    check-cast p1, Ll/elh;

    .line 71
    .line 72
    iget-object v0, p0, Ll/umh;->c:Ljava/util/List;

    .line 73
    .line 74
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-lez v0, :cond_2

    .line 79
    .line 80
    const/4 v0, 0x1

    .line 81
    goto :goto_1

    .line 82
    :cond_2
    const/4 v0, 0x0

    .line 83
    :goto_1
    invoke-virtual {p1, v0}, Ll/elh;->I(Z)V

    .line 84
    .line 85
    .line 86
    iget-object p1, p0, Ll/umh;->c:Ljava/util/List;

    .line 87
    .line 88
    iput-object p1, p0, Ll/umh;->d:Ljava/util/List;

    .line 89
    .line 90
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 91
    .line 92
    check-cast p0, Ll/elh;

    .line 93
    .line 94
    invoke-virtual {p0, p1}, Ll/elh;->x(Ljava/util/List;)V

    .line 95
    .line 96
    .line 97
    return-void
.end method

.method public static synthetic R0(Ll/umh;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/umh;->p1(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic S0(Ll/umh;Lcom/p1/mobile/putong/feed/data/MomentActivity;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/umh;->x1(Lcom/p1/mobile/putong/feed/data/MomentActivity;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic U0(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/MomentActivity;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic V0(Ll/umh;Lcom/p1/mobile/putong/feed/data/MomentActivity;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/umh;->z1(Lcom/p1/mobile/putong/feed/data/MomentActivity;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic W0(Ll/umh;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/umh;->o1(Ll/pf60;)V

    return-void
.end method

.method public static synthetic X0(Ll/umh;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/umh;->q1()V

    return-void
.end method

.method public static synthetic Y0(Ll/umh;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/umh;->j1(Ll/pf60;)V

    return-void
.end method

.method public static synthetic e0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method private e1(Lcom/p1/mobile/putong/data/Links;)Z
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0

    .line 14
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 15
    return p0
.end method

.method public static synthetic f0(Ll/umh;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/umh;->N1(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic g0(Ll/umh;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/umh;->L1(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic h0(Ll/umh;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/umh;->D1(Ll/bkj0;)V

    return-void
.end method

.method public static synthetic i0(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/MomentActivity;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic j0(Ll/umh;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/umh;->r1(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic k0(Ll/umh;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/umh;->k1(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic l0(Ll/umh;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/umh;->F1(Ll/uxj0;)V

    return-void
.end method

.method private synthetic l1(Ll/pf60;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/elh;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/elh;->E()V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0, p1}, Ll/umh;->Q1(Ll/pf60;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic m0(Lcom/p1/mobile/putong/feed/data/MomentActivity;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->action:Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    .line 2
    .line 3
    const-string v0, "like"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method private synthetic m1(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/elh;

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-virtual {p0, p1}, Ll/elh;->F(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic n0(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/MomentActivity;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->reference:Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    xor-int/lit8 p0, p0, 0x1

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic o0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic p0(Ll/umh;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/umh;->l1(Ll/pf60;)V

    return-void
.end method

.method private synthetic p1(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    instance-of v0, p1, Ll/h570;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p1, Ll/h570;

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/h570;->r()V

    .line 10
    .line 11
    .line 12
    :cond_0
    invoke-virtual {p0}, Ll/umh;->getData()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic q0(Ll/umh;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/umh;->s1(Ll/pf60;)V

    return-void
.end method

.method private synthetic q1()V
    .locals 2

    .line 1
    const-string v0, "activities"

    .line 2
    .line 3
    iget-object v1, p0, Ll/umh;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const/4 v0, -0x1

    .line 16
    invoke-virtual {p0, v0}, Landroid/app/Activity;->setResult(I)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public static synthetic r0(Ll/umh;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/umh;->J1(Ljava/lang/Throwable;)V

    return-void
.end method

.method private synthetic r1(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-boolean p1, p0, Ll/umh;->e:Z

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast p1, Ll/elh;

    .line 12
    .line 13
    invoke-virtual {p1}, Ll/elh;->i()V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 17
    .line 18
    check-cast p0, Ll/elh;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/elh;->v()V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public static synthetic s0(Ll/umh;Ljava/lang/String;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/umh;->i1(Ljava/lang/String;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic t0(Ll/y20;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic t1(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/elh;

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-virtual {p0, p1}, Ll/elh;->F(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic u0(Ll/umh;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/umh;->t1(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic x0(Ll/umh;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/umh;->C1(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic y0(Ll/umh;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/umh;->u1(Ll/pf60;)V

    return-void
.end method

.method public static synthetic z0(Ll/umh;Lcom/p1/mobile/putong/feed/data/MomentActivity;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/umh;->H1(Lcom/p1/mobile/putong/feed/data/MomentActivity;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final synthetic B1(Ll/pf60;)V
    .locals 3

    .line 1
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/data/Links;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ll/umh;->g1(Lcom/p1/mobile/putong/data/Links;)Lcom/p1/mobile/putong/data/Links;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Ll/umh;->h:Lcom/p1/mobile/putong/data/Links;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    new-array v1, v0, [Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 13
    .line 14
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ll/umh;->h1()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 24
    .line 25
    check-cast p1, Ljava/util/Collection;

    .line 26
    .line 27
    new-instance v1, Ll/plh;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/plh;-><init>(Ll/umh;)V

    .line 30
    .line 31
    .line 32
    invoke-static {p1, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    iget-object v1, p0, Ll/umh;->c:Ljava/util/List;

    .line 37
    .line 38
    invoke-interface {v1, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    const-string v1, "activities"

    .line 43
    .line 44
    iget-object v2, p0, Ll/umh;->a:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-eqz v1, :cond_1

    .line 51
    .line 52
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 53
    .line 54
    check-cast p1, Ljava/util/Collection;

    .line 55
    .line 56
    new-instance v1, Ll/rlh;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Ll/rlh;-><init>(Ll/umh;)V

    .line 59
    .line 60
    .line 61
    invoke-static {p1, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    iget-object v1, p0, Ll/umh;->c:Ljava/util/List;

    .line 66
    .line 67
    invoke-interface {v1, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 68
    .line 69
    .line 70
    :cond_1
    :goto_0
    iget-object p1, p0, Ll/umh;->c:Ljava/util/List;

    .line 71
    .line 72
    iput-object p1, p0, Ll/umh;->d:Ljava/util/List;

    .line 73
    .line 74
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 75
    .line 76
    check-cast v1, Ll/elh;

    .line 77
    .line 78
    invoke-virtual {v1, p1}, Ll/elh;->x(Ljava/util/List;)V

    .line 79
    .line 80
    .line 81
    iput-boolean v0, p0, Ll/umh;->i:Z

    .line 82
    .line 83
    return-void
.end method

.method public final synthetic C1(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Ll/umh;->i:Z

    .line 3
    .line 4
    return-void
.end method

.method public final synthetic D1(Ll/bkj0;)V
    .locals 1

    .line 1
    iget-object v0, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/lang/Integer;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-virtual {p0, v0}, Ll/umh;->U1(I)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 13
    .line 14
    check-cast p0, Ll/elh;

    .line 15
    .line 16
    iget-object v0, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 17
    .line 18
    check-cast v0, Ljava/util/List;

    .line 19
    .line 20
    iget-object p1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 21
    .line 22
    check-cast p1, Ljava/lang/Integer;

    .line 23
    .line 24
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    invoke-virtual {p0, v0, p1}, Ll/elh;->y(Ljava/util/List;I)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final synthetic E1(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/umh;->d1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic F1(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/umh;->d1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public G3(Ljava/lang/String;)V
    .locals 2

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
    iget-object v0, p0, Ll/umh;->g:Ll/v370;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Ll/v370;->u(Ljava/lang/String;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/kmh;

    .line 19
    .line 20
    invoke-direct {v1, p0, p1}, Ll/kmh;-><init>(Ll/umh;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    new-instance p0, Ll/lmh;

    .line 24
    .line 25
    invoke-direct {p0}, Ll/lmh;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final synthetic H1(Lcom/p1/mobile/putong/feed/data/MomentActivity;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/umh;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final synthetic I1(Ll/pf60;)V
    .locals 2

    .line 1
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/data/Links;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ll/umh;->g1(Lcom/p1/mobile/putong/data/Links;)Lcom/p1/mobile/putong/data/Links;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Ll/umh;->h:Lcom/p1/mobile/putong/data/Links;

    .line 10
    .line 11
    iget-object v0, p0, Ll/umh;->c:Ljava/util/List;

    .line 12
    .line 13
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast p1, Ljava/util/Collection;

    .line 16
    .line 17
    new-instance v1, Ll/amh;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/amh;-><init>(Ll/umh;)V

    .line 20
    .line 21
    .line 22
    invoke-static {p1, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Ll/umh;->c:Ljava/util/List;

    .line 30
    .line 31
    iput-object p1, p0, Ll/umh;->d:Ljava/util/List;

    .line 32
    .line 33
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 34
    .line 35
    check-cast v0, Ll/elh;

    .line 36
    .line 37
    invoke-virtual {v0, p1}, Ll/elh;->x(Ljava/util/List;)V

    .line 38
    .line 39
    .line 40
    const/4 p1, 0x0

    .line 41
    iput-boolean p1, p0, Ll/umh;->i:Z

    .line 42
    .line 43
    return-void
.end method

.method public final synthetic J1(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Ll/umh;->i:Z

    .line 3
    .line 4
    return-void
.end method

.method public final synthetic L1(Ljava/lang/Integer;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {v0}, Ll/umg;->d(I)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-virtual {p0}, Ll/umh;->c1()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    invoke-static {v1, v2}, Ll/umg;->c(II)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    invoke-static {p1}, Ll/umg;->b(I)Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-eqz p1, :cond_3

    .line 35
    .line 36
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 37
    .line 38
    check-cast p0, Ll/elh;

    .line 39
    .line 40
    invoke-virtual {p0}, Ll/elh;->B()V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_1
    :goto_0
    if-eqz v0, :cond_2

    .line 45
    .line 46
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 47
    .line 48
    check-cast p1, Ll/elh;

    .line 49
    .line 50
    invoke-virtual {p1}, Ll/elh;->A()V

    .line 51
    .line 52
    .line 53
    :cond_2
    if-eqz v1, :cond_3

    .line 54
    .line 55
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 56
    .line 57
    check-cast p1, Ll/elh;

    .line 58
    .line 59
    invoke-virtual {p0}, Ll/umh;->c1()I

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    invoke-virtual {p1, p0}, Ll/elh;->C(I)V

    .line 64
    .line 65
    .line 66
    :cond_3
    return-void
.end method

.method public L3()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/umh;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-lez v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Ll/umh;->d:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-lez v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Ll/umh;->d:Ljava/util/List;

    .line 19
    .line 20
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 25
    .line 26
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 27
    .line 28
    iget-object v2, p0, Ll/umh;->d:Ljava/util/List;

    .line 29
    .line 30
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    check-cast v2, Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 35
    .line 36
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-nez v0, :cond_0

    .line 43
    .line 44
    const/4 v1, 0x1

    .line 45
    :cond_0
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 46
    .line 47
    check-cast p0, Ll/elh;

    .line 48
    .line 49
    invoke-virtual {p0, v1}, Ll/elh;->G(Z)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public M1(Ljava/lang/String;I)V
    .locals 2

    .line 1
    const-string v0, "activities"

    .line 2
    .line 3
    iget-object v1, p0, Ll/umh;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/umh;->g:Ll/v370;

    .line 12
    .line 13
    sget-object v1, Ll/umh;->j:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1, p1, p2}, Ll/v370;->x(Ljava/lang/String;Ljava/lang/String;I)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    new-instance p2, Ll/hmh;

    .line 24
    .line 25
    invoke-direct {p2, p0}, Ll/hmh;-><init>(Ll/umh;)V

    .line 26
    .line 27
    .line 28
    new-instance p0, Ll/imh;

    .line 29
    .line 30
    invoke-direct {p0}, Ll/imh;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-static {p2, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method

.method public final synthetic N1(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/umh;->c:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/jmh;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Ll/jmh;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 13
    .line 14
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    const/4 v0, 0x1

    .line 21
    iput-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->read:Z

    .line 22
    .line 23
    iget-object p1, p0, Ll/umh;->c:Ljava/util/List;

    .line 24
    .line 25
    iput-object p1, p0, Ll/umh;->d:Ljava/util/List;

    .line 26
    .line 27
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 28
    .line 29
    check-cast p0, Ll/elh;

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Ll/elh;->x(Ljava/util/List;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public O1()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/umh;->h1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Ll/umh;->g:Ll/v370;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v1}, Ll/v370;->K()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/flh;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/flh;-><init>(Ll/umh;)V

    .line 20
    .line 21
    .line 22
    new-instance v2, Ll/qlh;

    .line 23
    .line 24
    invoke-direct {v2, p0}, Ll/qlh;-><init>(Ll/umh;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    iget v0, p0, Ll/umh;->b:I

    .line 36
    .line 37
    const/4 v2, 0x2

    .line 38
    if-ne v0, v2, :cond_1

    .line 39
    .line 40
    sget-object v0, Ll/umh;->k:Ljava/lang/String;

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    sget-object v0, Ll/umh;->j:Ljava/lang/String;

    .line 44
    .line 45
    :goto_0
    invoke-virtual {v1, v0}, Ll/v370;->F(Ljava/lang/String;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    new-instance v1, Ll/bmh;

    .line 54
    .line 55
    invoke-direct {v1, p0}, Ll/bmh;-><init>(Ll/umh;)V

    .line 56
    .line 57
    .line 58
    new-instance v2, Ll/mmh;

    .line 59
    .line 60
    invoke-direct {v2, p0}, Ll/mmh;-><init>(Ll/umh;)V

    .line 61
    .line 62
    .line 63
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0}, Ll/umh;->P1()V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public P1()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/umh;->g:Ll/v370;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/v370;->H()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/ylh;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/ylh;-><init>(Ll/umh;)V

    .line 14
    .line 15
    .line 16
    new-instance p0, Ll/zlh;

    .line 17
    .line 18
    invoke-direct {p0}, Ll/zlh;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public R1()V
    .locals 3

    .line 1
    const-string v0, "activities"

    .line 2
    .line 3
    iget-object v1, p0, Ll/umh;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Ll/umh;->c:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iget-object v1, p0, Ll/umh;->g:Ll/v370;

    .line 18
    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Ll/umh;->c:Ljava/util/List;

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 29
    .line 30
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 31
    .line 32
    sget-object v2, Ll/umh;->j:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {v1, v0, v2}, Ll/v370;->v(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    new-instance v1, Ll/hlh;

    .line 43
    .line 44
    invoke-direct {v1, p0}, Ll/hlh;-><init>(Ll/umh;)V

    .line 45
    .line 46
    .line 47
    new-instance p0, Ll/ilh;

    .line 48
    .line 49
    invoke-direct {p0}, Ll/ilh;-><init>()V

    .line 50
    .line 51
    .line 52
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_0
    const-string v0, ""

    .line 61
    .line 62
    sget-object v2, Ll/umh;->j:Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {v1, v0, v2}, Ll/v370;->v(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    new-instance v1, Ll/jlh;

    .line 73
    .line 74
    invoke-direct {v1, p0}, Ll/jlh;-><init>(Ll/umh;)V

    .line 75
    .line 76
    .line 77
    new-instance p0, Ll/klh;

    .line 78
    .line 79
    invoke-direct {p0}, Ll/klh;-><init>()V

    .line 80
    .line 81
    .line 82
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 87
    .line 88
    .line 89
    :cond_1
    return-void
.end method

.method public S1(Ll/y20;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "activities"

    .line 2
    .line 3
    iget-object v1, p0, Ll/umh;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Ll/umh;->c:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iget-object v1, p0, Ll/umh;->g:Ll/v370;

    .line 18
    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Ll/umh;->c:Ljava/util/List;

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 29
    .line 30
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 31
    .line 32
    sget-object v2, Ll/umh;->j:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {v1, v0, v2}, Ll/v370;->v(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    new-instance v0, Ll/dmh;

    .line 43
    .line 44
    invoke-direct {v0, p1}, Ll/dmh;-><init>(Ll/y20;)V

    .line 45
    .line 46
    .line 47
    new-instance v1, Ll/emh;

    .line 48
    .line 49
    invoke-direct {v1, p1}, Ll/emh;-><init>(Ll/y20;)V

    .line 50
    .line 51
    .line 52
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_0
    const-string v0, ""

    .line 61
    .line 62
    sget-object v2, Ll/umh;->j:Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {v1, v0, v2}, Ll/v370;->v(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    new-instance v0, Ll/fmh;

    .line 73
    .line 74
    invoke-direct {v0, p1}, Ll/fmh;-><init>(Ll/y20;)V

    .line 75
    .line 76
    .line 77
    new-instance v1, Ll/gmh;

    .line 78
    .line 79
    invoke-direct {v1, p1}, Ll/gmh;-><init>(Ll/y20;)V

    .line 80
    .line 81
    .line 82
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 87
    .line 88
    .line 89
    :cond_1
    return-void
.end method

.method public T0(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/umh;->h1()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumActivitiesAct;->j:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->setFrom(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    const-string p0, "activities"

    .line 14
    .line 15
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->setFrom(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final T1()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/umh;->i:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Ll/umh;->i:Z

    .line 8
    .line 9
    iget-object v0, p0, Ll/umh;->g:Ll/v370;

    .line 10
    .line 11
    iget-object v1, p0, Ll/umh;->h:Lcom/p1/mobile/putong/data/Links;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ll/v370;->J(Lcom/p1/mobile/putong/data/Links;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/mlh;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/mlh;-><init>(Ll/umh;)V

    .line 24
    .line 25
    .line 26
    new-instance v2, Ll/nlh;

    .line 27
    .line 28
    invoke-direct {v2, p0}, Ll/nlh;-><init>(Ll/umh;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

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

.method public final U1(I)V
    .locals 0

    .line 1
    sput p1, Ll/umh;->l:I

    .line 2
    .line 3
    return-void
.end method

.method public V1()V
    .locals 2

    .line 1
    invoke-static {}, Ll/cmg;->p()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/mrb0;->j()Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/omh;

    .line 20
    .line 21
    invoke-direct {v1}, Ll/omh;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/pmh;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/pmh;-><init>(Ll/umh;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method

.method public a0()V
    .locals 2

    .line 1
    new-instance v0, Ll/qmh;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/qmh;-><init>(Ll/umh;)V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/rmh;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Ll/rmh;-><init>(Ll/umh;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0, v1}, Ll/ar2;->creates(Ll/y20;Ll/x20;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/smh;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/smh;-><init>(Ll/umh;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final a1(Ll/pf60;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/data/Links;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentActivity;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/elh;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/elh;->E()V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0, p1}, Ll/umh;->Q1(Ll/pf60;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast p1, Ll/elh;

    .line 14
    .line 15
    iget-boolean p0, p0, Ll/umh;->e:Z

    .line 16
    .line 17
    invoke-virtual {p1, p0}, Ll/elh;->w(Z)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public b1(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/umh;->c:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/llh;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Ll/llh;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Ll/umh;->c:Ljava/util/List;

    .line 13
    .line 14
    iput-object p1, p0, Ll/umh;->d:Ljava/util/List;

    .line 15
    .line 16
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 17
    .line 18
    check-cast p0, Ll/elh;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ll/elh;->x(Ljava/util/List;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final c1()I
    .locals 0

    .line 1
    sget p0, Ll/umh;->l:I

    .line 2
    .line 3
    return p0
.end method

.method public d0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/elh;

    .line 4
    .line 5
    iget-object v1, p0, Ll/umh;->h:Lcom/p1/mobile/putong/data/Links;

    .line 6
    .line 7
    invoke-direct {p0, v1}, Ll/umh;->e1(Lcom/p1/mobile/putong/data/Links;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-virtual {v0, p0}, Ll/elh;->H(Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public d1()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/elh;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/elh;->n()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/umh;->c:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 25
    .line 26
    const/4 v2, 0x1

    .line 27
    iput-boolean v2, v1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->read:Z

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    iget-object v0, p0, Ll/umh;->c:Ljava/util/List;

    .line 31
    .line 32
    iput-object v0, p0, Ll/umh;->d:Ljava/util/List;

    .line 33
    .line 34
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 35
    .line 36
    check-cast p0, Ll/elh;

    .line 37
    .line 38
    invoke-virtual {p0, v0}, Ll/elh;->x(Ljava/util/List;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/umh;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    add-int/lit8 v0, v0, -0x4

    .line 8
    .line 9
    if-lt p1, v0, :cond_2

    .line 10
    .line 11
    iget-object p1, p0, Ll/umh;->d:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-lez p1, :cond_2

    .line 18
    .line 19
    iget-object p1, p0, Ll/umh;->h:Lcom/p1/mobile/putong/data/Links;

    .line 20
    .line 21
    invoke-direct {p0, p1}, Ll/umh;->e1(Lcom/p1/mobile/putong/data/Links;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_2

    .line 26
    .line 27
    invoke-static {}, Ll/cmg;->W()Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_0

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/umh;->h1()Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-eqz p1, :cond_0

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/umh;->T1()V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_0
    iget-boolean p1, p0, Ll/umh;->i:Z

    .line 44
    .line 45
    if-eqz p1, :cond_1

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    const/4 p1, 0x1

    .line 49
    iput-boolean p1, p0, Ll/umh;->i:Z

    .line 50
    .line 51
    iget-object p1, p0, Ll/umh;->g:Ll/v370;

    .line 52
    .line 53
    iget-object v0, p0, Ll/umh;->h:Lcom/p1/mobile/putong/data/Links;

    .line 54
    .line 55
    invoke-virtual {p1, v0}, Ll/v370;->E(Lcom/p1/mobile/putong/data/Links;)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    new-instance v0, Ll/tmh;

    .line 64
    .line 65
    invoke-direct {v0, p0}, Ll/tmh;-><init>(Ll/umh;)V

    .line 66
    .line 67
    .line 68
    new-instance v1, Ll/glh;

    .line 69
    .line 70
    invoke-direct {v1, p0}, Ll/glh;-><init>(Ll/umh;)V

    .line 71
    .line 72
    .line 73
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 78
    .line 79
    .line 80
    :cond_2
    :goto_0
    return-void
.end method

.method public f1(Ljava/lang/String;ZZ)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/umh;->a:Ljava/lang/String;

    .line 2
    .line 3
    iput-boolean p2, p0, Ll/umh;->f:Z

    .line 4
    .line 5
    iput-boolean p3, p0, Ll/umh;->e:Z

    .line 6
    .line 7
    return-void
.end method

.method public g1(Lcom/p1/mobile/putong/data/Links;)Lcom/p1/mobile/putong/data/Links;
    .locals 2

    .line 1
    invoke-static {}, Ll/cmg;->j0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_2

    .line 14
    .line 15
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 16
    .line 17
    const-string v1, "filter"

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 29
    .line 30
    .line 31
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string v1, "&filter="

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    iget p0, p0, Ll/umh;->b:I

    .line 42
    .line 43
    const/4 v1, 0x2

    .line 44
    if-ne p0, v1, :cond_1

    .line 45
    .line 46
    sget-object p0, Ll/umh;->k:Ljava/lang/String;

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    sget-object p0, Ll/umh;->j:Ljava/lang/String;

    .line 50
    .line 51
    :goto_0
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 59
    .line 60
    :cond_2
    :goto_1
    return-object p1
.end method

.method public getData()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/umh;->h1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Ll/umh;->g:Ll/v370;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v1}, Ll/v370;->K()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/slh;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/slh;-><init>(Ll/umh;)V

    .line 20
    .line 21
    .line 22
    new-instance v2, Ll/tlh;

    .line 23
    .line 24
    invoke-direct {v2, p0}, Ll/tlh;-><init>(Ll/umh;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    iget-boolean v0, p0, Ll/umh;->f:Z

    .line 35
    .line 36
    if-eqz v0, :cond_2

    .line 37
    .line 38
    invoke-static {}, Ll/cmg;->W()Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-nez v0, :cond_2

    .line 43
    .line 44
    iget-object v0, p0, Ll/umh;->g:Ll/v370;

    .line 45
    .line 46
    invoke-virtual {v0}, Ll/v370;->L()Lrx/c;

    .line 47
    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_0
    iget v0, p0, Ll/umh;->b:I

    .line 51
    .line 52
    const/4 v2, 0x2

    .line 53
    if-ne v0, v2, :cond_1

    .line 54
    .line 55
    sget-object v0, Ll/umh;->k:Ljava/lang/String;

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_1
    sget-object v0, Ll/umh;->j:Ljava/lang/String;

    .line 59
    .line 60
    :goto_0
    invoke-virtual {v1, v0}, Ll/v370;->F(Ljava/lang/String;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    new-instance v1, Ll/ulh;

    .line 69
    .line 70
    invoke-direct {v1, p0}, Ll/ulh;-><init>(Ll/umh;)V

    .line 71
    .line 72
    .line 73
    new-instance v2, Ll/vlh;

    .line 74
    .line 75
    invoke-direct {v2, p0}, Ll/vlh;-><init>(Ll/umh;)V

    .line 76
    .line 77
    .line 78
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0}, Ll/umh;->P1()V

    .line 86
    .line 87
    .line 88
    :cond_2
    :goto_1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 89
    .line 90
    iget-object v0, v0, Ll/jka;->p0:Lrx/subjects/b;

    .line 91
    .line 92
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    new-instance v1, Ll/wlh;

    .line 97
    .line 98
    invoke-direct {v1, p0}, Ll/wlh;-><init>(Ll/umh;)V

    .line 99
    .line 100
    .line 101
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 106
    .line 107
    .line 108
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 109
    .line 110
    iget-object v0, v0, Ll/jka;->Q0:Lrx/subjects/b;

    .line 111
    .line 112
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    new-instance v1, Ll/xlh;

    .line 117
    .line 118
    invoke-direct {v1, p0}, Ll/xlh;-><init>(Ll/umh;)V

    .line 119
    .line 120
    .line 121
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 126
    .line 127
    .line 128
    return-void
.end method

.method public getFrom()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/umh;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public h1()Z
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumActivitiesAct;->j:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Ll/umh;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public final synthetic i1(Ljava/lang/String;Ll/uxj0;)V
    .locals 1

    .line 1
    iget-object p2, p0, Ll/umh;->c:Ljava/util/List;

    .line 2
    .line 3
    new-instance v0, Ll/nmh;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/nmh;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p2, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 13
    .line 14
    iget-object p2, p0, Ll/umh;->c:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {p2, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Ll/umh;->c:Ljava/util/List;

    .line 20
    .line 21
    iput-object p1, p0, Ll/umh;->d:Ljava/util/List;

    .line 22
    .line 23
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 24
    .line 25
    check-cast p0, Ll/elh;

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Ll/elh;->x(Ljava/util/List;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final synthetic j1(Ll/pf60;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/elh;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/elh;->E()V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0, p1}, Ll/umh;->Q1(Ll/pf60;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic k1(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/elh;

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-virtual {p0, p1}, Ll/elh;->F(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic n1(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/umh;->e:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/umh;->c:Ljava/util/List;

    .line 5
    .line 6
    new-instance v1, Ll/cmh;

    .line 7
    .line 8
    invoke-direct {v1, p1}, Ll/cmh;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 9
    .line 10
    .line 11
    invoke-static {v0, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iput-object p1, p0, Ll/umh;->c:Ljava/util/List;

    .line 16
    .line 17
    iput-object p1, p0, Ll/umh;->d:Ljava/util/List;

    .line 18
    .line 19
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 20
    .line 21
    check-cast p0, Ll/elh;

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Ll/elh;->x(Ljava/util/List;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final synthetic o1(Ll/pf60;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/umh;->c:Ljava/util/List;

    .line 2
    .line 3
    iput-object p1, p0, Ll/umh;->d:Ljava/util/List;

    .line 4
    .line 5
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast p0, Ll/elh;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/elh;->x(Ljava/util/List;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic s1(Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/umh;->a1(Ll/pf60;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic u1(Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/umh;->a1(Ll/pf60;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic v1(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/elh;

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-virtual {p0, p1}, Ll/elh;->F(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic x1(Lcom/p1/mobile/putong/feed/data/MomentActivity;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->action:Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    .line 2
    .line 3
    const-string v1, "like"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/umh;->c:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public final synthetic z1(Lcom/p1/mobile/putong/feed/data/MomentActivity;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/umh;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method
