.class public Ll/uho;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/pio;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/app/PutongFrag;

.field public b:J

.field public c:Lcom/p1/mobile/putong/data/DbLinks;

.field public d:Ljava/lang/String;

.field public e:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Ll/uho;->b:J

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Ll/uho;->d:Ljava/lang/String;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Ll/uho;->e:Z

    .line 13
    .line 14
    iput-object p1, p0, Ll/uho;->a:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 15
    .line 16
    return-void
.end method

.method private b1()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->On()Lrx/c;

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
    new-instance v1, Ll/oho;

    .line 18
    .line 19
    invoke-direct {v1}, Ll/oho;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/pho;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/pho;-><init>(Ll/uho;)V

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

.method public static synthetic e0()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/joa;->v4()Lrx/c;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic f0(Ll/uho;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uho;->e1(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic g0(Ll/uho;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Relationship;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/uho;->F0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Relationship;Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic h0(Ll/uho;Landroid/content/Intent;IILcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/uho;->G0(Landroid/content/Intent;IILcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic i0(Ll/uho;Lcom/google/common/base/Optional;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uho;->J0(Lcom/google/common/base/Optional;)V

    return-void
.end method

.method public static synthetic j0(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
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

.method public static synthetic k0(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Long;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->receivedLikes:Ljava/lang/Long;

    .line 4
    .line 5
    return-object p0
.end method

.method public static synthetic l0(Ll/uho;Lcom/google/common/base/Optional;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uho;->I0(Lcom/google/common/base/Optional;)V

    return-void
.end method

.method public static synthetic m0(ZLcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->v0:Ll/l99;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, p0, p1}, Ll/l99;->F3(ZLjava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic n0(Ll/uho;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uho;->N0(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic o0(Ljava/util/List;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {}, Ll/joa;->i4()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic p0(Ll/uho;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uho;->H0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic q0(Ll/uho;Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uho;->L0(Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)V

    return-void
.end method

.method public static synthetic r0(Ll/uho;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uho;->X0(Landroid/util/Pair;)V

    return-void
.end method

.method public static synthetic s0(Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;->purchaseType:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 4
    .line 5
    if-eq p0, v0, :cond_1

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_ULTRA_PREMIUM:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 8
    .line 9
    if-eq p0, v0, :cond_1

    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_LIKERS:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 12
    .line 13
    if-ne p0, v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    goto :goto_1

    .line 18
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 19
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method


# virtual methods
.method public final A0(Ljava/util/ArrayList;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ll/svl;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/joa;->i4()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    const/4 v0, 0x4

    .line 13
    if-lt p2, v0, :cond_1

    .line 14
    .line 15
    iget-object p2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast p2, Ll/pio;

    .line 18
    .line 19
    invoke-virtual {p2, p1}, Ll/pio;->j0(Ljava/util/ArrayList;)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 23
    .line 24
    check-cast p0, Ll/pio;

    .line 25
    .line 26
    const/4 p1, 0x1

    .line 27
    invoke-virtual {p0, p1}, Ll/pio;->G(Z)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    new-instance p2, Ll/leo;

    .line 32
    .line 33
    const/4 v0, 0x0

    .line 34
    invoke-direct {p2, v0}, Ll/leo;-><init>(Lcom/p1/mobile/putong/data/User;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 41
    .line 42
    check-cast p0, Ll/pio;

    .line 43
    .line 44
    const/4 p1, 0x0

    .line 45
    invoke-virtual {p0, p1}, Ll/pio;->G(Z)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final C0(ZZZZLjava/lang/String;Lcom/p1/mobile/putong/data/User;)Z
    .locals 11

    .line 1
    move-object/from16 v6, p6

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/core/member/module/CoreMemberModule;->F()Ll/ss9;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/ss9;->b()Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object v7

    .line 15
    iget-object v1, p0, Ll/uho;->a:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 16
    .line 17
    invoke-virtual {v1}, Lcom/p1/mobile/putong/app/PutongFrag;->pageId()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v8

    .line 21
    new-instance v9, Ll/jho;

    .line 22
    .line 23
    invoke-direct {v9, p0, v6}, Ll/jho;-><init>(Ll/uho;Lcom/p1/mobile/putong/data/User;)V

    .line 24
    .line 25
    .line 26
    new-instance v10, Ll/kho;

    .line 27
    .line 28
    invoke-direct {v10, p1, v6}, Ll/kho;-><init>(ZLcom/p1/mobile/putong/data/User;)V

    .line 29
    .line 30
    .line 31
    const/4 v4, 0x0

    .line 32
    move v1, p2

    .line 33
    move v2, p3

    .line 34
    move v3, p4

    .line 35
    move-object/from16 v5, p5

    .line 36
    .line 37
    invoke-interface/range {v0 .. v10}, Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;->Ej(ZZZILjava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/z20;Ll/x20;)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    return p0
.end method

.method public final D0(IILandroid/content/Intent;)V
    .locals 10

    .line 1
    if-nez p3, :cond_0

    .line 2
    .line 3
    goto :goto_4

    .line 4
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x1

    .line 11
    const/4 v2, 0x0

    .line 12
    if-eq p2, v0, :cond_2

    .line 13
    .line 14
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-ne p2, v0, :cond_1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    move v5, v2

    .line 24
    goto :goto_1

    .line 25
    :cond_2
    :goto_0
    move v5, v1

    .line 26
    :goto_1
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-ne p2, v0, :cond_3

    .line 33
    .line 34
    move v6, v1

    .line 35
    goto :goto_2

    .line 36
    :cond_3
    move v6, v2

    .line 37
    :goto_2
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 38
    .line 39
    invoke-virtual {p2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Iq()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    invoke-virtual {p3, p2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 52
    .line 53
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 54
    .line 55
    invoke-virtual {p3, p2}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 56
    .line 57
    .line 58
    move-result-object v9

    .line 59
    invoke-static {v9}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result p2

    .line 63
    if-eqz p2, :cond_5

    .line 64
    .line 65
    invoke-virtual {v9}, Lcom/p1/mobile/putong/data/User;->hasPic()Z

    .line 66
    .line 67
    .line 68
    move-result p2

    .line 69
    if-eqz p2, :cond_5

    .line 70
    .line 71
    const/16 p2, 0x52

    .line 72
    .line 73
    if-ne p1, p2, :cond_4

    .line 74
    .line 75
    move v4, v1

    .line 76
    goto :goto_3

    .line 77
    :cond_4
    move v4, v2

    .line 78
    :goto_3
    invoke-virtual {v9}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    iget-object v8, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 83
    .line 84
    if-eqz v8, :cond_5

    .line 85
    .line 86
    const/4 v7, 0x0

    .line 87
    move-object v3, p0

    .line 88
    invoke-virtual/range {v3 .. v9}, Ll/uho;->C0(ZZZZLjava/lang/String;Lcom/p1/mobile/putong/data/User;)Z

    .line 89
    .line 90
    .line 91
    :cond_5
    :goto_4
    return-void
.end method

.method public E(Lcom/p1/mobile/putong/data/User;ZZ)V
    .locals 8

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 4
    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    :cond_0
    move-object v1, p0

    .line 12
    goto :goto_0

    .line 13
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 21
    .line 22
    iget-object v6, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 23
    .line 24
    if-nez v6, :cond_2

    .line 25
    .line 26
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 27
    .line 28
    check-cast p0, Ll/pio;

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/pio;->K()Ll/hgo;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_2
    const/4 v2, 0x0

    .line 39
    const/4 v4, 0x0

    .line 40
    move-object v1, p0

    .line 41
    move-object v7, p1

    .line 42
    move v3, p2

    .line 43
    move v5, p3

    .line 44
    invoke-virtual/range {v1 .. v7}, Ll/uho;->C0(ZZZZLjava/lang/String;Lcom/p1/mobile/putong/data/User;)Z

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    if-nez p0, :cond_3

    .line 49
    .line 50
    iget-object p0, v1, Ll/ar2;->viewModel:Ll/iam;

    .line 51
    .line 52
    check-cast p0, Ll/pio;

    .line 53
    .line 54
    invoke-virtual {p0}, Ll/pio;->K()Ll/hgo;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 59
    .line 60
    .line 61
    :cond_3
    return-void

    .line 62
    :goto_0
    iget-object p0, v1, Ll/ar2;->viewModel:Ll/iam;

    .line 63
    .line 64
    check-cast p0, Ll/pio;

    .line 65
    .line 66
    invoke-virtual {p0}, Ll/pio;->K()Ll/hgo;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public final E0(II)Z
    .locals 0

    .line 1
    const/16 p0, 0x51

    .line 2
    .line 3
    if-eq p1, p0, :cond_0

    .line 4
    .line 5
    const/16 p0, 0x52

    .line 6
    .line 7
    if-ne p1, p0, :cond_1

    .line 8
    .line 9
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eq p2, p0, :cond_2

    .line 16
    .line 17
    sget-object p0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eq p2, p0, :cond_2

    .line 24
    .line 25
    sget-object p0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eq p2, p0, :cond_2

    .line 32
    .line 33
    sget-object p0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->REMOVE:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-ne p2, p0, :cond_1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    const/4 p0, 0x0

    .line 43
    return p0

    .line 44
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 45
    return p0
.end method

.method public final synthetic F0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Relationship;Ljava/lang/Integer;)V
    .locals 7

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Relationship;->id:Ljava/lang/String;

    .line 14
    .line 15
    filled-new-array {p2}, [Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    invoke-static {p2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    .line 24
    .line 25
    .line 26
    move-result v4

    .line 27
    new-instance v5, Ljava/util/ArrayList;

    .line 28
    .line 29
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 30
    .line 31
    .line 32
    iget-object p2, p0, Ll/uho;->a:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 33
    .line 34
    invoke-virtual {p2}, Lcom/p1/mobile/putong/app/PutongFrag;->pageId()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v6

    .line 38
    invoke-interface/range {v1 .. v6}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->n8(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ILjava/util/ArrayList;Ljava/lang/String;)Landroid/content/Intent;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 43
    .line 44
    .line 45
    move-result-object p3

    .line 46
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-interface {v0, p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->hg(Lcom/p1/mobile/android/app/Act;)Lcom/p1/mobile/android/app/Act$w;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {p3, p2, p0}, Lcom/p1/mobile/android/app/Act;->startActivityWithCustomTransition(Landroid/content/Intent;Lcom/p1/mobile/android/app/Act$w;)V

    .line 63
    .line 64
    .line 65
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 66
    .line 67
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 68
    .line 69
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 70
    .line 71
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->E8(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public final synthetic G0(Landroid/content/Intent;IILcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    sget-object p4, Lcom/p1/mobile/putong/core/data/SwipeDirection;->REMOVE:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 4
    .line 5
    invoke-virtual {p4}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 6
    .line 7
    .line 8
    move-result p4

    .line 9
    if-ne p2, p4, :cond_0

    .line 10
    .line 11
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Iq()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p1, p0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->v0:Ll/l99;

    .line 28
    .line 29
    const/4 p2, 0x0

    .line 30
    invoke-virtual {p1, p2, p0}, Ll/l99;->F3(ZLjava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    invoke-virtual {p0, p3, p2, p1}, Ll/uho;->D0(IILandroid/content/Intent;)V

    .line 35
    .line 36
    .line 37
    :cond_1
    return-void
.end method

.method public final synthetic H0(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/pio;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/pio;->r()V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast p1, Ll/pio;

    .line 11
    .line 12
    invoke-static {}, Ll/joa;->i4()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    xor-int/lit8 v0, v0, 0x1

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Ll/pio;->r0(Z)V

    .line 19
    .line 20
    .line 21
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Oq()Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_0

    .line 34
    .line 35
    const-string p1, "all"

    .line 36
    .line 37
    iput-object p1, p0, Ll/uho;->d:Ljava/lang/String;

    .line 38
    .line 39
    :cond_0
    const/4 p1, 0x0

    .line 40
    invoke-virtual {p0, p1}, Ll/uho;->O0(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Ll/uho;->z0()V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final synthetic I0(Lcom/google/common/base/Optional;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/vg60;->b()Ll/vg60;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/google/common/base/Optional;->of(Ljava/lang/Object;)Lcom/google/common/base/Optional;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0, p1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, p1}, Ll/uho;->X0(Landroid/util/Pair;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic J0(Lcom/google/common/base/Optional;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/vg60;->b()Ll/vg60;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/google/common/base/Optional;->of(Ljava/lang/Object;)Lcom/google/common/base/Optional;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0, p1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, p1}, Ll/uho;->X0(Landroid/util/Pair;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic L0(Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance p1, Ll/iho;

    .line 6
    .line 7
    invoke-direct {p1}, Ll/iho;-><init>()V

    .line 8
    .line 9
    .line 10
    const-wide/16 v0, 0x3e8

    .line 11
    .line 12
    invoke-static {p0, p1, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic N0(Ljava/lang/Boolean;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/pio;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {v0, v1}, Ll/pio;->r0(Z)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-nez p1, :cond_0

    .line 17
    .line 18
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Oq()Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 33
    .line 34
    check-cast p1, Ll/pio;

    .line 35
    .line 36
    const/4 v0, 0x0

    .line 37
    invoke-virtual {p1, v0}, Ll/pio;->k0(I)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 41
    .line 42
    check-cast p1, Ll/pio;

    .line 43
    .line 44
    iget-object p1, p1, Ll/pio;->h:Landroidx/recyclerview/widget/RecyclerView;

    .line 45
    .line 46
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 50
    .line 51
    check-cast p0, Ll/pio;

    .line 52
    .line 53
    iget-object p0, p0, Ll/pio;->f:Lcom/google/android/material/appbar/AppBarLayout;

    .line 54
    .line 55
    const/4 p1, 0x1

    .line 56
    invoke-virtual {p0, p1, p1}, Lcom/google/android/material/appbar/AppBarLayout;->setExpanded(ZZ)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_0
    const/4 p1, 0x0

    .line 61
    invoke-virtual {p0, p1}, Ll/uho;->O0(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public O0(Ljava/lang/String;)V
    .locals 5

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    iput-boolean v0, p0, Ll/uho;->e:Z

    .line 5
    .line 6
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 7
    .line 8
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->v0:Ll/l99;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/l99;->n3()V

    .line 11
    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->v0:Ll/l99;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/l99;->m3()V

    .line 18
    .line 19
    .line 20
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->v0:Ll/l99;

    .line 23
    .line 24
    invoke-virtual {v0}, Ll/l99;->l3()V

    .line 25
    .line 26
    .line 27
    :cond_0
    if-nez p1, :cond_1

    .line 28
    .line 29
    const-string v0, ""

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    move-object v0, p1

    .line 33
    :goto_0
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Oq()Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    const/4 v2, 0x0

    .line 46
    if-nez v1, :cond_3

    .line 47
    .line 48
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 49
    .line 50
    check-cast v1, Ll/pio;

    .line 51
    .line 52
    invoke-virtual {v1}, Ll/pio;->J()Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;->R4()Z

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    if-eqz v1, :cond_3

    .line 61
    .line 62
    if-nez p1, :cond_2

    .line 63
    .line 64
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 65
    .line 66
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->v0:Ll/l99;

    .line 67
    .line 68
    iget-wide v3, p0, Ll/uho;->b:J

    .line 69
    .line 70
    invoke-virtual {p1, v3, v4, v2}, Ll/l99;->B3(JLjava/lang/String;)Lrx/c;

    .line 71
    .line 72
    .line 73
    :cond_2
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 74
    .line 75
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->v0:Ll/l99;

    .line 76
    .line 77
    iget-wide v3, p0, Ll/uho;->b:J

    .line 78
    .line 79
    invoke-virtual {p1, v0, v3, v4, v2}, Ll/l99;->z3(Ljava/lang/String;JLjava/lang/String;)Lrx/c;

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :cond_3
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Oq()Z

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    if-eqz p1, :cond_4

    .line 96
    .line 97
    iget-object v2, p0, Ll/uho;->d:Ljava/lang/String;

    .line 98
    .line 99
    :cond_4
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 100
    .line 101
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->v0:Ll/l99;

    .line 102
    .line 103
    iget-wide v3, p0, Ll/uho;->b:J

    .line 104
    .line 105
    invoke-virtual {p1, v0, v3, v4, v2}, Ll/l99;->C3(Ljava/lang/String;JLjava/lang/String;)Lrx/c;

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method public P0(IILandroid/content/Intent;)Z
    .locals 2

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/uho;->E0(II)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/mho;

    .line 14
    .line 15
    invoke-direct {v1}, Ll/mho;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lrx/c;->takeFirst(Ll/qcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/nho;

    .line 23
    .line 24
    invoke-direct {v1, p0, p3, p2, p1}, Ll/nho;-><init>(Ll/uho;Landroid/content/Intent;II)V

    .line 25
    .line 26
    .line 27
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    const/4 p0, 0x1

    .line 35
    return p0
.end method

.method public Q0(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/uho;->d:Ljava/lang/String;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-virtual {p0, p1}, Ll/uho;->O0(Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public R0(Ljava/lang/Boolean;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_1

    .line 6
    .line 7
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreLikers;->l0:Ll/byd0;

    .line 12
    .line 13
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Ljava/lang/Long;

    .line 18
    .line 19
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 20
    .line 21
    .line 22
    move-result-wide v0

    .line 23
    iput-wide v0, p0, Ll/uho;->b:J

    .line 24
    .line 25
    const-wide/16 v2, 0x0

    .line 26
    .line 27
    cmp-long p1, v0, v2

    .line 28
    .line 29
    if-gtz p1, :cond_0

    .line 30
    .line 31
    invoke-static {}, Ll/pzi0;->o()J

    .line 32
    .line 33
    .line 34
    move-result-wide v0

    .line 35
    iput-wide v0, p0, Ll/uho;->b:J

    .line 36
    .line 37
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 38
    .line 39
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 40
    .line 41
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreLikers;->l0:Ll/byd0;

    .line 42
    .line 43
    invoke-static {}, Ll/pzi0;->o()J

    .line 44
    .line 45
    .line 46
    move-result-wide v0

    .line 47
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {p1, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0}, Ll/uho;->u0()V

    .line 55
    .line 56
    .line 57
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 58
    .line 59
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 60
    .line 61
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {p1, v0}, Ll/dkb;->W9(Ljava/lang/String;)Lrx/c;

    .line 70
    .line 71
    .line 72
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 73
    .line 74
    check-cast p1, Ll/pio;

    .line 75
    .line 76
    invoke-static {}, Ll/joa;->i4()Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    xor-int/lit8 v0, v0, 0x1

    .line 81
    .line 82
    invoke-virtual {p1, v0}, Ll/pio;->r0(Z)V

    .line 83
    .line 84
    .line 85
    const/4 p1, 0x0

    .line 86
    invoke-virtual {p0, p1}, Ll/uho;->O0(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    :cond_1
    return-void
.end method

.method public S0(Ljava/lang/String;Ll/y20;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/joa;->i4()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 10
    .line 11
    invoke-interface {p2, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void

    .line 15
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    sget-object v4, Lcom/p1/mobile/putong/core/data/Privilege;->see_who_likes_me:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 28
    .line 29
    const/4 v5, 0x0

    .line 30
    move-object v3, p1

    .line 31
    move-object v6, p2

    .line 32
    invoke-interface/range {v1 .. v6}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Lf(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;Ll/y20;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public U0(Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/uho;->V0(Ljava/lang/String;Ll/x20;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public V0(Ljava/lang/String;Ll/x20;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/joa;->i4()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    invoke-interface {p2}, Ll/x20;->call()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void

    .line 13
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-interface {v0, p0, p2, p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->showSeeDialog(Lcom/p1/mobile/android/app/Act;Ll/x20;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public W0(Z)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-virtual {p0}, Ll/uho;->f1()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/uho;->u0()V

    .line 8
    .line 9
    .line 10
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 11
    .line 12
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 13
    .line 14
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p1, v0}, Ll/dkb;->W9(Ljava/lang/String;)Lrx/c;

    .line 23
    .line 24
    .line 25
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 28
    .line 29
    invoke-virtual {p1}, Ll/joa;->v4()Lrx/c;

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 33
    .line 34
    check-cast p1, Ll/pio;

    .line 35
    .line 36
    invoke-static {}, Ll/joa;->i4()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    xor-int/lit8 v0, v0, 0x1

    .line 41
    .line 42
    invoke-virtual {p1, v0}, Ll/pio;->r0(Z)V

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 46
    .line 47
    check-cast p0, Ll/pio;

    .line 48
    .line 49
    invoke-virtual {p0}, Ll/pio;->P()V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final X0(Landroid/util/Pair;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Pair<",
            "Lcom/google/common/base/Optional<",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;>;",
            "Lcom/google/common/base/Optional<",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;>;>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/google/common/base/Optional;

    .line 4
    .line 5
    iget-object v1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, Lcom/google/common/base/Optional;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/google/common/base/Optional;->isPresent()Z

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-eqz v2, :cond_1

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/google/common/base/Optional;->isPresent()Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-nez v2, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-virtual {v0}, Lcom/google/common/base/Optional;->get()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Ll/vg60;

    .line 27
    .line 28
    invoke-virtual {v1}, Lcom/google/common/base/Optional;->get()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    check-cast v1, Ll/vg60;

    .line 33
    .line 34
    invoke-virtual {p0, v0, v1}, Ll/uho;->t0(Ll/vg60;Ll/vg60;)Ljava/util/ArrayList;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iget-object v1, v1, Ll/vg60;->a:Ljava/util/List;

    .line 39
    .line 40
    invoke-virtual {p0, p1, v0, v1}, Ll/uho;->g1(Landroid/util/Pair;Ljava/util/ArrayList;Ljava/util/List;)V

    .line 41
    .line 42
    .line 43
    :cond_1
    :goto_0
    return-void
.end method

.method public final Y0()V
    .locals 1

    .line 1
    new-instance v0, Ll/qho;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/qho;-><init>(Ll/uho;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public Z()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/ar2;->Z()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/uho;->f1()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public a0()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/uho;->Y0()V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Ll/uho;->b1()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/uho;->c1()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ll/uho;->d1()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ll/uho;->a1()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final a1()V
    .locals 3

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Oq()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast v0, Ll/pio;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/pio;->J()Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;->R4()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->v0:Ll/l99;

    .line 32
    .line 33
    invoke-virtual {v0}, Ll/l99;->q3()Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 38
    .line 39
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->v0:Ll/l99;

    .line 40
    .line 41
    invoke-virtual {v1}, Ll/l99;->p3()Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    new-instance v2, Ll/rho;

    .line 46
    .line 47
    invoke-direct {v2}, Ll/rho;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-static {v0, v1, v2}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    new-instance v1, Ll/sho;

    .line 59
    .line 60
    invoke-direct {v1, p0}, Ll/sho;-><init>(Ll/uho;)V

    .line 61
    .line 62
    .line 63
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_0
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Oq()Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-eqz v0, :cond_1

    .line 84
    .line 85
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 86
    .line 87
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->v0:Ll/l99;

    .line 88
    .line 89
    invoke-virtual {v0}, Ll/l99;->o3()Lrx/c;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    new-instance v1, Ll/tho;

    .line 98
    .line 99
    invoke-direct {v1, p0}, Ll/tho;-><init>(Ll/uho;)V

    .line 100
    .line 101
    .line 102
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 107
    .line 108
    .line 109
    return-void

    .line 110
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 111
    .line 112
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->v0:Ll/l99;

    .line 113
    .line 114
    invoke-virtual {v0}, Ll/l99;->p3()Lrx/c;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    new-instance v1, Ll/fho;

    .line 123
    .line 124
    invoke-direct {v1, p0}, Ll/fho;-><init>(Ll/uho;)V

    .line 125
    .line 126
    .line 127
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 132
    .line 133
    .line 134
    return-void
.end method

.method public final c1()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/joa;->y3()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/gho;

    .line 14
    .line 15
    invoke-direct {v1}, Ll/gho;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const/4 v1, 0x1

    .line 27
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ll/hho;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/hho;-><init>(Ll/uho;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final d1()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->o9()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/eho;

    .line 14
    .line 15
    invoke-direct {v1}, Ll/eho;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/lho;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/lho;-><init>(Ll/uho;)V

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

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final e1(Ljava/lang/Long;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long p0, v0, v2

    .line 8
    .line 9
    if-gtz p0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 15
    .line 16
    iget-wide v0, p0, Ll/dkb;->j3:J

    .line 17
    .line 18
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 19
    .line 20
    .line 21
    move-result-wide v2

    .line 22
    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->max(JJ)J

    .line 23
    .line 24
    .line 25
    move-result-wide v0

    .line 26
    iput-wide v0, p0, Ll/dkb;->j3:J

    .line 27
    .line 28
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 37
    .line 38
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 39
    .line 40
    iget-wide v0, p1, Ll/dkb;->j3:J

    .line 41
    .line 42
    invoke-interface {p0, v0, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Rr(J)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final f1()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreLikers;->l0:Ll/byd0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/Long;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    iput-wide v0, p0, Ll/uho;->b:J

    .line 18
    .line 19
    const-wide/16 v2, 0x0

    .line 20
    .line 21
    cmp-long v0, v0, v2

    .line 22
    .line 23
    if-gtz v0, :cond_0

    .line 24
    .line 25
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 28
    .line 29
    .line 30
    move-result-wide v0

    .line 31
    iput-wide v0, p0, Ll/uho;->b:J

    .line 32
    .line 33
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreLikers;->l0:Ll/byd0;

    .line 38
    .line 39
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 40
    .line 41
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 42
    .line 43
    .line 44
    move-result-wide v0

    .line 45
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {p0, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final g1(Landroid/util/Pair;Ljava/util/ArrayList;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Pair<",
            "Lcom/google/common/base/Optional<",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;>;",
            "Lcom/google/common/base/Optional<",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;>;>;",
            "Ljava/util/ArrayList<",
            "Ll/svl;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/uho;->d:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string v0, "all"

    .line 10
    .line 11
    iget-object v1, p0, Ll/uho;->d:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 20
    .line 21
    check-cast v0, Ll/pio;

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Ll/uho;->y0(Landroid/util/Pair;)I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    invoke-virtual {v0, p1}, Ll/pio;->s0(I)V

    .line 28
    .line 29
    .line 30
    :cond_1
    invoke-virtual {p0, p2, p3}, Ll/uho;->A0(Ljava/util/ArrayList;Ljava/util/List;)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 34
    .line 35
    check-cast p1, Ll/pio;

    .line 36
    .line 37
    invoke-static {}, Ll/joa;->i4()Z

    .line 38
    .line 39
    .line 40
    move-result p3

    .line 41
    xor-int/lit8 p3, p3, 0x1

    .line 42
    .line 43
    invoke-virtual {p1, p3}, Ll/pio;->r0(Z)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 47
    .line 48
    check-cast p1, Ll/pio;

    .line 49
    .line 50
    iget-boolean p3, p0, Ll/uho;->e:Z

    .line 51
    .line 52
    invoke-virtual {p1, p2, p3}, Ll/pio;->q0(Ljava/util/List;Z)V

    .line 53
    .line 54
    .line 55
    const/4 p1, 0x0

    .line 56
    iput-boolean p1, p0, Ll/uho;->e:Z

    .line 57
    .line 58
    return-void
.end method

.method public final t0(Ll/vg60;Ll/vg60;)Ljava/util/ArrayList;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)",
            "Ljava/util/ArrayList<",
            "Ll/svl;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 7
    .line 8
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    new-instance v1, Ll/aho;

    .line 15
    .line 16
    iget-object v2, p1, Ll/vg60;->b:Lcom/p1/mobile/putong/data/DbLinks;

    .line 17
    .line 18
    iget v3, v2, Lcom/p1/mobile/putong/data/DbLinks;->total:I

    .line 19
    .line 20
    iget-object v4, p1, Ll/vg60;->a:Ljava/util/List;

    .line 21
    .line 22
    invoke-direct {v1, v3, v4, v2}, Ll/aho;-><init>(ILjava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    :cond_0
    iget-object v1, p2, Ll/vg60;->a:Ljava/util/List;

    .line 29
    .line 30
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-nez v2, :cond_3

    .line 35
    .line 36
    iget-object p1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 37
    .line 38
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-nez p1, :cond_1

    .line 43
    .line 44
    new-instance p1, Ll/zho;

    .line 45
    .line 46
    sget-object v2, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 47
    .line 48
    sget v3, Lcom/p1/mobile/putong/core/member/R$string;->W:I

    .line 49
    .line 50
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-direct {p1, v2}, Ll/zho;-><init>(Ljava/lang/CharSequence;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    :cond_1
    iget-object p1, p2, Ll/vg60;->b:Lcom/p1/mobile/putong/data/DbLinks;

    .line 61
    .line 62
    iput-object p1, p0, Ll/uho;->c:Lcom/p1/mobile/putong/data/DbLinks;

    .line 63
    .line 64
    invoke-static {}, Ll/joa;->i4()Z

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 73
    .line 74
    .line 75
    move-result p2

    .line 76
    if-eqz p2, :cond_3

    .line 77
    .line 78
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object p2

    .line 82
    check-cast p2, Lcom/p1/mobile/putong/data/User;

    .line 83
    .line 84
    if-nez p0, :cond_2

    .line 85
    .line 86
    new-instance v1, Ll/cio;

    .line 87
    .line 88
    invoke-direct {v1, p2}, Ll/cio;-><init>(Lcom/p1/mobile/putong/data/User;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_2
    new-instance v1, Ll/oeo;

    .line 96
    .line 97
    invoke-direct {v1, p2}, Ll/oeo;-><init>(Lcom/p1/mobile/putong/data/User;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_3
    return-object v0
.end method

.method public final u0()V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreLikers;->r5()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public x0()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uho;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final y0(Landroid/util/Pair;)I
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Pair<",
            "Lcom/google/common/base/Optional<",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;>;",
            "Lcom/google/common/base/Optional<",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;>;>;)I"
        }
    .end annotation

    .line 1
    iget-object p0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lcom/google/common/base/Optional;

    .line 4
    .line 5
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p1, Lcom/google/common/base/Optional;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/google/common/base/Optional;->isPresent()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/google/common/base/Optional;->isPresent()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-virtual {p0}, Lcom/google/common/base/Optional;->get()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    check-cast p0, Ll/vg60;

    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/google/common/base/Optional;->get()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    check-cast p1, Ll/vg60;

    .line 33
    .line 34
    iget-object p0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 35
    .line 36
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    iget-object p1, p1, Ll/vg60;->b:Lcom/p1/mobile/putong/data/DbLinks;

    .line 41
    .line 42
    iget p1, p1, Lcom/p1/mobile/putong/data/DbLinks;->total:I

    .line 43
    .line 44
    add-int/2addr p0, p1

    .line 45
    return p0

    .line 46
    :cond_1
    :goto_0
    const/4 p0, -0x1

    .line 47
    return p0
.end method

.method public final z0()V
    .locals 2

    .line 1
    invoke-static {}, Ll/joa;->i4()Z

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
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->X6()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->s8()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 37
    .line 38
    check-cast v0, Ll/pio;

    .line 39
    .line 40
    const/16 v1, 0xfa0

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ll/pio;->x0(I)V

    .line 43
    .line 44
    .line 45
    :cond_1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 46
    .line 47
    check-cast p0, Ll/pio;

    .line 48
    .line 49
    invoke-virtual {p0}, Ll/pio;->H()V

    .line 50
    .line 51
    .line 52
    return-void
.end method
