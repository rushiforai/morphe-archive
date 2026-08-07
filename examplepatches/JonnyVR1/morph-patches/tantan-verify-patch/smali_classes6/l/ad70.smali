.class public Ll/ad70;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/hd70;",
        ">;"
    }
.end annotation


# instance fields
.field public a:I

.field public b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public c:Ljava/lang/String;

.field public d:Z

.field public e:Ll/cc70;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const/16 p1, -0x400

    .line 5
    .line 6
    iput p1, p0, Ll/ad70;->a:I

    .line 7
    .line 8
    new-instance p1, Ljava/util/LinkedList;

    .line 9
    .line 10
    invoke-direct {p1}, Ljava/util/LinkedList;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Ll/ad70;->b:Ljava/util/List;

    .line 14
    .line 15
    new-instance p1, Ll/cc70;

    .line 16
    .line 17
    invoke-direct {p1}, Ll/cc70;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Ll/ad70;->e:Ll/cc70;

    .line 21
    .line 22
    return-void
.end method

.method public static synthetic A0(Ll/ad70;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ad70;->Q0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic C0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)I
    .locals 2

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 2
    .line 3
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/Followship;->userTime:D

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 6
    .line 7
    iget-wide p0, p0, Lcom/p1/mobile/putong/data/Followship;->userTime:D

    .line 8
    .line 9
    sub-double/2addr v0, p0

    .line 10
    double-to-int p0, v0

    .line 11
    return p0
.end method

.method public static synthetic D0(Lcom/p1/mobile/putong/data/Counter;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Counter;->followships:Lcom/p1/mobile/putong/data/CounterFollowShips;

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/data/CounterFollowShips;->unreadFollowers:I

    .line 4
    .line 5
    if-lez p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/jka;->pd()Lrx/c;

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method private synthetic G0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/hd70;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/hd70;->r()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic H0()Lrx/c;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ad70;->c:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "fans"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Ll/ad70;->c:Ljava/lang/String;

    .line 12
    .line 13
    const-string v1, "activities_fans"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object p0, p0, Ll/ad70;->e:Ll/cc70;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/cc70;->c()Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0

    .line 29
    :cond_1
    :goto_0
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/jka;->c7()Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method

.method private synthetic I0(Ll/pf60;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/hd70;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Ll/hd70;->d(Z)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/ad70;->X0(Ll/pf60;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private synthetic J0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/hd70;

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-virtual {p0, p1}, Ll/hd70;->d(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic e0(Ll/ad70;)Lrx/c;
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ad70;->H0()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic f0(Ll/ad70;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ad70;->S0(Ll/pf60;)V

    return-void
.end method

.method public static synthetic g0(Ll/ad70;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ad70;->O0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic h0(Ll/ad70;Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ad70;->R0(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic i0(Ll/ad70;Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ad70;->U0(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic j0(Ll/ad70;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ad70;->P0(Ll/pf60;)V

    return-void
.end method

.method public static synthetic k0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic l0(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 18
    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public static synthetic m0(Ll/ad70;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ad70;->V0(Ll/pf60;)V

    return-void
.end method

.method public static synthetic n0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic o0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)I
    .locals 4

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 2
    .line 3
    const-wide/16 v0, 0x0

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    move-wide v2, v0

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    iget-wide v2, p1, Lcom/p1/mobile/putong/data/Followship;->userTime:D

    .line 10
    .line 11
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 12
    .line 13
    if-nez p0, :cond_1

    .line 14
    .line 15
    goto :goto_1

    .line 16
    :cond_1
    iget-wide v0, p0, Lcom/p1/mobile/putong/data/Followship;->userTime:D

    .line 17
    .line 18
    :goto_1
    sub-double/2addr v2, v0

    .line 19
    double-to-int p0, v2

    .line 20
    return p0
.end method

.method public static synthetic p0(Ll/ad70;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ad70;->L0(Ll/pf60;)V

    return-void
.end method

.method public static synthetic q0(Ll/ad70;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ad70;->J0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic r0()Lrx/c;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-object v0, v0, Ll/jka;->Q0:Lrx/subjects/b;

    .line 4
    .line 5
    return-object v0
.end method

.method public static synthetic s0(Ll/pf60;Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static synthetic t0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)I
    .locals 2

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 2
    .line 3
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/Followship;->otherUserTime:D

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 6
    .line 7
    iget-wide p0, p0, Lcom/p1/mobile/putong/data/Followship;->otherUserTime:D

    .line 8
    .line 9
    sub-double/2addr v0, p0

    .line 10
    double-to-int p0, v0

    .line 11
    return p0
.end method

.method public static synthetic u0(Ll/ad70;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ad70;->N0(Ll/pf60;)V

    return-void
.end method

.method public static synthetic x0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)I
    .locals 2

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 2
    .line 3
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/Followship;->otherUserTime:D

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 6
    .line 7
    iget-wide p0, p0, Lcom/p1/mobile/putong/data/Followship;->otherUserTime:D

    .line 8
    .line 9
    sub-double/2addr v0, p0

    .line 10
    double-to-int p0, v0

    .line 11
    return p0
.end method

.method public static synthetic y0(Ll/ad70;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ad70;->G0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic z0(Ll/ad70;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ad70;->I0(Ll/pf60;)V

    return-void
.end method


# virtual methods
.method public E0(Lcom/p1/mobile/putong/data/Links;)Z
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

.method public F0(Ljava/lang/String;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ad70;->c:Ljava/lang/String;

    .line 2
    .line 3
    iput-boolean p2, p0, Ll/ad70;->d:Z

    .line 4
    .line 5
    return-void
.end method

.method public final synthetic L0(Ll/pf60;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ad70;->b:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/jc70;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Ll/jc70;-><init>(Ll/pf60;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, -0x1

    .line 13
    if-eq v0, v1, :cond_2

    .line 14
    .line 15
    iget-object v1, p0, Ll/ad70;->c:Ljava/lang/String;

    .line 16
    .line 17
    const-string v2, "fans"

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-nez v1, :cond_1

    .line 24
    .line 25
    iget-object v1, p0, Ll/ad70;->c:Ljava/lang/String;

    .line 26
    .line 27
    const-string v2, "activities_fans"

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-nez v1, :cond_1

    .line 34
    .line 35
    iget-object v1, p0, Ll/ad70;->c:Ljava/lang/String;

    .line 36
    .line 37
    const-string v2, "following"

    .line 38
    .line 39
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-eqz v1, :cond_0

    .line 44
    .line 45
    iget-object v1, p0, Ll/ad70;->b:Ljava/util/List;

    .line 46
    .line 47
    sget-object v2, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 48
    .line 49
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 50
    .line 51
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 52
    .line 53
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {v2, p1}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-interface {v1, v0, p1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_0
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 64
    .line 65
    check-cast p1, Ljava/lang/Boolean;

    .line 66
    .line 67
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    if-nez p1, :cond_2

    .line 72
    .line 73
    iget-object p1, p0, Ll/ad70;->b:Ljava/util/List;

    .line 74
    .line 75
    invoke-interface {p1, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_1
    iget-object v1, p0, Ll/ad70;->b:Ljava/util/List;

    .line 80
    .line 81
    sget-object v2, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 82
    .line 83
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 84
    .line 85
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 86
    .line 87
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 88
    .line 89
    invoke-virtual {v2, p1}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-interface {v1, v0, p1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    :cond_2
    :goto_0
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 97
    .line 98
    check-cast p1, Ll/hd70;

    .line 99
    .line 100
    iget-object p0, p0, Ll/ad70;->b:Ljava/util/List;

    .line 101
    .line 102
    invoke-virtual {p1, p0}, Ll/hd70;->c(Ljava/util/List;)V

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public final synthetic N0(Ll/pf60;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/hd70;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Ll/hd70;->d(Z)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/ad70;->X0(Ll/pf60;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic O0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/hd70;

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-virtual {p0, p1}, Ll/hd70;->d(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic P0(Ll/pf60;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/hd70;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Ll/hd70;->d(Z)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/ad70;->X0(Ll/pf60;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic Q0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/hd70;

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-virtual {p0, p1}, Ll/hd70;->d(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic R0(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ad70;->b:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public final synthetic S0(Ll/pf60;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v0, Lcom/p1/mobile/putong/data/Links;

    .line 10
    .line 11
    sput-object v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->I:Lcom/p1/mobile/putong/data/Links;

    .line 12
    .line 13
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Ll/ad70;->b:Ljava/util/List;

    .line 22
    .line 23
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 24
    .line 25
    check-cast p1, Ljava/util/Collection;

    .line 26
    .line 27
    new-instance v1, Ll/nc70;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/nc70;-><init>(Ll/ad70;)V

    .line 30
    .line 31
    .line 32
    invoke-static {p1, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Ll/ad70;->b:Ljava/util/List;

    .line 40
    .line 41
    new-instance v0, Ll/pc70;

    .line 42
    .line 43
    invoke-direct {v0}, Ll/pc70;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-static {p1, v0}, Ll/jyb;->I(Ljava/util/List;Ljava/util/Comparator;)V

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 50
    .line 51
    check-cast p1, Ll/hd70;

    .line 52
    .line 53
    iget-object p0, p0, Ll/ad70;->b:Ljava/util/List;

    .line 54
    .line 55
    invoke-virtual {p1, p0}, Ll/hd70;->c(Ljava/util/List;)V

    .line 56
    .line 57
    .line 58
    :cond_0
    return-void
.end method

.method public final synthetic U0(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ad70;->b:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public final synthetic V0(Ll/pf60;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v0, Lcom/p1/mobile/putong/data/Links;

    .line 10
    .line 11
    sput-object v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->I:Lcom/p1/mobile/putong/data/Links;

    .line 12
    .line 13
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Ll/ad70;->b:Ljava/util/List;

    .line 22
    .line 23
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 24
    .line 25
    check-cast p1, Ljava/util/Collection;

    .line 26
    .line 27
    new-instance v1, Ll/qc70;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/qc70;-><init>(Ll/ad70;)V

    .line 30
    .line 31
    .line 32
    invoke-static {p1, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Ll/ad70;->b:Ljava/util/List;

    .line 40
    .line 41
    new-instance v0, Ll/rc70;

    .line 42
    .line 43
    invoke-direct {v0}, Ll/rc70;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-static {p1, v0}, Ll/jyb;->I(Ljava/util/List;Ljava/util/Comparator;)V

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 50
    .line 51
    check-cast p1, Ll/hd70;

    .line 52
    .line 53
    iget-object p0, p0, Ll/ad70;->b:Ljava/util/List;

    .line 54
    .line 55
    invoke-virtual {p1, p0}, Ll/hd70;->c(Ljava/util/List;)V

    .line 56
    .line 57
    .line 58
    :cond_0
    return-void
.end method

.method public W0()V
    .locals 3

    .line 1
    const-string v0, "fans"

    .line 2
    .line 3
    iget-object v1, p0, Ll/ad70;->c:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    const-string v0, "activities_fans"

    .line 12
    .line 13
    iget-object v1, p0, Ll/ad70;->c:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object v0, p0, Ll/ad70;->e:Ll/cc70;

    .line 23
    .line 24
    invoke-virtual {v0}, Ll/cc70;->c()Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v1, Ll/yc70;

    .line 33
    .line 34
    invoke-direct {v1, p0}, Ll/yc70;-><init>(Ll/ad70;)V

    .line 35
    .line 36
    .line 37
    new-instance v2, Ll/zc70;

    .line 38
    .line 39
    invoke-direct {v2, p0}, Ll/zc70;-><init>(Ll/ad70;)V

    .line 40
    .line 41
    .line 42
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_1
    :goto_0
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 51
    .line 52
    invoke-virtual {v0}, Ll/jka;->c7()Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    new-instance v1, Ll/wc70;

    .line 61
    .line 62
    invoke-direct {v1, p0}, Ll/wc70;-><init>(Ll/ad70;)V

    .line 63
    .line 64
    .line 65
    new-instance v2, Ll/xc70;

    .line 66
    .line 67
    invoke-direct {v2, p0}, Ll/xc70;-><init>(Ll/ad70;)V

    .line 68
    .line 69
    .line 70
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public final X0(Ll/pf60;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/data/Links;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ad70;->b:Ljava/util/List;

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
    sput-object v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->I:Lcom/p1/mobile/putong/data/Links;

    .line 11
    .line 12
    iget-object v0, p0, Ll/ad70;->b:Ljava/util/List;

    .line 13
    .line 14
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast p1, Ljava/util/Collection;

    .line 17
    .line 18
    new-instance v1, Ll/kc70;

    .line 19
    .line 20
    invoke-direct {v1}, Ll/kc70;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-static {p1, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Ll/ad70;->c:Ljava/lang/String;

    .line 31
    .line 32
    const-string v0, "fans"

    .line 33
    .line 34
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-nez p1, :cond_1

    .line 39
    .line 40
    iget-object p1, p0, Ll/ad70;->c:Ljava/lang/String;

    .line 41
    .line 42
    const-string v0, "activities_fans"

    .line 43
    .line 44
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-eqz p1, :cond_0

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    iget-object p1, p0, Ll/ad70;->b:Ljava/util/List;

    .line 52
    .line 53
    new-instance v0, Ll/mc70;

    .line 54
    .line 55
    invoke-direct {v0}, Ll/mc70;-><init>()V

    .line 56
    .line 57
    .line 58
    invoke-static {p1, v0}, Ll/jyb;->I(Ljava/util/List;Ljava/util/Comparator;)V

    .line 59
    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_1
    :goto_0
    iget-object p1, p0, Ll/ad70;->b:Ljava/util/List;

    .line 63
    .line 64
    new-instance v0, Ll/lc70;

    .line 65
    .line 66
    invoke-direct {v0}, Ll/lc70;-><init>()V

    .line 67
    .line 68
    .line 69
    invoke-static {p1, v0}, Ll/jyb;->I(Ljava/util/List;Ljava/util/Comparator;)V

    .line 70
    .line 71
    .line 72
    :goto_1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 73
    .line 74
    check-cast p1, Ll/hd70;

    .line 75
    .line 76
    iget-object v0, p0, Ll/ad70;->b:Ljava/util/List;

    .line 77
    .line 78
    invoke-virtual {p1, v0}, Ll/hd70;->c(Ljava/util/List;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p0}, Ll/ad70;->Y0()V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public Y0()V
    .locals 2

    .line 1
    const-string v0, "fans"

    .line 2
    .line 3
    iget-object v1, p0, Ll/ad70;->c:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    const-string v0, "following"

    .line 12
    .line 13
    iget-object p0, p0, Ll/ad70;->c:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    return-void

    .line 23
    :cond_1
    :goto_0
    sget-object p0, Ll/uqb0;->b0:Ll/sre0;

    .line 24
    .line 25
    iget-object p0, p0, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 26
    .line 27
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {p0}, Ll/mrb0;->M(Ljava/lang/String;)Lrx/c;

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public a0()V
    .locals 3

    .line 1
    new-instance v0, Ll/dc70;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/dc70;-><init>(Ll/ad70;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 7
    .line 8
    .line 9
    new-instance v0, Ll/oc70;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/oc70;-><init>(Ll/ad70;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Ll/pcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/sc70;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/sc70;-><init>(Ll/ad70;)V

    .line 21
    .line 22
    .line 23
    new-instance v2, Ll/tc70;

    .line 24
    .line 25
    invoke-direct {v2, p0}, Ll/tc70;-><init>(Ll/ad70;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    new-instance v0, Ll/uc70;

    .line 36
    .line 37
    invoke-direct {v0}, Ll/uc70;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Ll/pcj;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    new-instance v1, Ll/vc70;

    .line 45
    .line 46
    invoke-direct {v1, p0}, Ll/vc70;-><init>(Ll/ad70;)V

    .line 47
    .line 48
    .line 49
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public a1()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/ad70;->d:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/jka;->pd()Lrx/c;

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-static {}, Ll/mrb0;->j()Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    new-instance v0, Ll/ec70;

    .line 20
    .line 21
    invoke-direct {v0}, Ll/ec70;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ad70;->b:Ljava/util/List;

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
    iget-object p1, p0, Ll/ad70;->b:Ljava/util/List;

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
    sget-object p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->I:Lcom/p1/mobile/putong/data/Links;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Ll/ad70;->E0(Lcom/p1/mobile/putong/data/Links;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_2

    .line 26
    .line 27
    iget-object p1, p0, Ll/ad70;->c:Ljava/lang/String;

    .line 28
    .line 29
    const-string v0, "fans"

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-nez p1, :cond_1

    .line 36
    .line 37
    iget-object p1, p0, Ll/ad70;->c:Ljava/lang/String;

    .line 38
    .line 39
    const-string v0, "activities_fans"

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-eqz p1, :cond_0

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    iget-object p1, p0, Ll/ad70;->e:Ll/cc70;

    .line 49
    .line 50
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->I:Lcom/p1/mobile/putong/data/Links;

    .line 51
    .line 52
    invoke-virtual {p1, v0}, Ll/cc70;->b(Lcom/p1/mobile/putong/data/Links;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    new-instance v0, Ll/hc70;

    .line 61
    .line 62
    invoke-direct {v0, p0}, Ll/hc70;-><init>(Ll/ad70;)V

    .line 63
    .line 64
    .line 65
    new-instance p0, Ll/ic70;

    .line 66
    .line 67
    invoke-direct {p0}, Ll/ic70;-><init>()V

    .line 68
    .line 69
    .line 70
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :cond_1
    :goto_0
    iget-object p1, p0, Ll/ad70;->e:Ll/cc70;

    .line 79
    .line 80
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->I:Lcom/p1/mobile/putong/data/Links;

    .line 81
    .line 82
    invoke-virtual {p1, v0}, Ll/cc70;->a(Lcom/p1/mobile/putong/data/Links;)Lrx/c;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    new-instance v0, Ll/fc70;

    .line 91
    .line 92
    invoke-direct {v0, p0}, Ll/fc70;-><init>(Ll/ad70;)V

    .line 93
    .line 94
    .line 95
    new-instance p0, Ll/gc70;

    .line 96
    .line 97
    invoke-direct {p0}, Ll/gc70;-><init>()V

    .line 98
    .line 99
    .line 100
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 105
    .line 106
    .line 107
    :cond_2
    return-void
.end method
