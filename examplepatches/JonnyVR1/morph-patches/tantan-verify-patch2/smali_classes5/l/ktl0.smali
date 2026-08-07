.class public Ll/ktl0;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/eul0;",
        ">;"
    }
.end annotation


# static fields
.field public static c:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public a:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            "Lcom/p1/mobile/putong/core/ui/purchase/d$a;",
            ">;"
        }
    .end annotation
.end field

.field public b:Ll/kcg0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/ktl0;->c:Ljava/util/ArrayList;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/ktl0;->a:Ljava/util/HashMap;

    .line 10
    .line 11
    return-void
.end method

.method private synthetic A0(Lcom/p1/mobile/android/app/c;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 8
    .line 9
    const-wide/16 v0, 0x0

    .line 10
    .line 11
    sget-object v2, Lcom/p1/mobile/putong/core/api/CoreLikers$LikersTriggerBy;->my_privilege_liker:Lcom/p1/mobile/putong/core/api/CoreLikers$LikersTriggerBy;

    .line 12
    .line 13
    invoke-virtual {p1, v0, v1, v2}, Lcom/p1/mobile/putong/core/api/CoreLikers;->e7(JLcom/p1/mobile/putong/core/api/CoreLikers$LikersTriggerBy;)Lrx/c;

    .line 14
    .line 15
    .line 16
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 17
    .line 18
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 19
    .line 20
    invoke-virtual {p1}, Ll/joa;->v4()Lrx/c;

    .line 21
    .line 22
    .line 23
    invoke-direct {p0}, Ll/ktl0;->H0()V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 27
    .line 28
    check-cast p0, Ll/eul0;

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/eul0;->b0()V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method private synthetic E0(JLjava/lang/Long;)V
    .locals 6

    .line 1
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 4
    .line 5
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/api/CoreProduct;->Q4()Z

    .line 6
    .line 7
    .line 8
    move-result p3

    .line 9
    if-eqz p3, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast p0, Ll/eul0;

    .line 14
    .line 15
    const/4 v4, 0x1

    .line 16
    const/4 v5, 0x1

    .line 17
    const/4 v2, 0x1

    .line 18
    const/4 v3, 0x1

    .line 19
    move-wide v0, p1

    .line 20
    invoke-static/range {v0 .. v5}, Ll/fmk0;->a(JZZZZ)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p0, p1}, Ll/eul0;->L0(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    iget-object p1, p0, Ll/ktl0;->b:Ll/kcg0;

    .line 29
    .line 30
    invoke-static {p1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 34
    .line 35
    check-cast p0, Ll/eul0;

    .line 36
    .line 37
    invoke-virtual {p0}, Ll/eul0;->e0()V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method private synthetic F0(Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)Lrx/c;
    .locals 3

    .line 1
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;->fromSign:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {p1}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    new-instance v0, Ll/zsl0;

    .line 15
    .line 16
    invoke-direct {v0}, Ll/zsl0;-><init>()V

    .line 17
    .line 18
    .line 19
    const-wide/16 v1, 0x3e8

    .line 20
    .line 21
    invoke-static {p0, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 22
    .line 23
    .line 24
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/joa;->y3()Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    const/4 v0, 0x1

    .line 37
    invoke-virtual {p0, v0}, Lrx/c;->skip(I)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p0, v0}, Lrx/c;->take(I)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    new-instance v0, Ll/atl0;

    .line 46
    .line 47
    invoke-direct {v0, p1}, Ll/atl0;-><init>(Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    return-object p0
.end method

.method private synthetic G0(Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-object v1, p0, Ll/ar2;->lifecycleProviderImpl:Ll/ner;

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    if-eqz p1, :cond_1

    .line 11
    .line 12
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;->purchaseType:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 13
    .line 14
    if-eqz p1, :cond_1

    .line 15
    .line 16
    check-cast v0, Ll/eul0;

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ll/eul0;->M0(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 22
    .line 23
    check-cast p0, Ll/eul0;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/eul0;->J0()V

    .line 26
    .line 27
    .line 28
    :cond_2
    :goto_0
    return-void
.end method

.method private H0()V
    .locals 2

    .line 1
    invoke-static {}, Ll/d79;->X()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/yap;->d()Ll/yap;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {v0, p0, v1}, Ll/yap;->g(Ll/ner;Ll/x20;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public static I0()V
    .locals 1

    .line 1
    sget-object v0, Ll/ktl0;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private static J0()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_3

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    invoke-static {}, Ll/rbb0;->q()Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-nez v1, :cond_0

    .line 26
    .line 27
    const/4 v1, 0x1

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    const/4 v1, 0x0

    .line 30
    :goto_0
    if-eqz v1, :cond_1

    .line 31
    .line 32
    invoke-static {}, Ll/ktl0;->t0()Ljava/util/ArrayList;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    sget-object v3, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 37
    .line 38
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    if-eqz v2, :cond_1

    .line 43
    .line 44
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isSVIP()Z

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    if-nez v2, :cond_1

    .line 49
    .line 50
    invoke-static {}, Ll/ktl0;->t0()Ljava/util/ArrayList;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_1
    invoke-static {}, Ll/d79;->T()Z

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    if-eqz v2, :cond_3

    .line 63
    .line 64
    if-eqz v1, :cond_2

    .line 65
    .line 66
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isSVIP()Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-eqz v0, :cond_3

    .line 71
    .line 72
    :cond_2
    invoke-static {}, Ll/ktl0;->t0()Ljava/util/ArrayList;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 77
    .line 78
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-nez v0, :cond_3

    .line 83
    .line 84
    invoke-static {}, Ll/ktl0;->t0()Ljava/util/ArrayList;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    :cond_3
    return-void
.end method

.method public static synthetic e0(Ll/ktl0;IILandroid/content/Intent;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/ktl0;->z0(IILandroid/content/Intent;)Z

    move-result p0

    return p0
.end method

.method public static synthetic f0(Lcom/p1/mobile/putong/core/data/UserPrivilege;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {}, Ll/joa;->M3()Z

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

.method public static synthetic g0(Ll/ktl0;JLjava/lang/Long;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/ktl0;->E0(JLjava/lang/Long;)V

    return-void
.end method

.method public static synthetic h0(Ll/ktl0;Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ktl0;->G0(Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)V

    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;Ljava/util/List;)Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic j0(Ll/ktl0;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ktl0;->C0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic k0(Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;->purchaseType:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 4
    .line 5
    if-eq p0, v0, :cond_1

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 8
    .line 9
    if-eq p0, v0, :cond_1

    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_LIKERS:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 12
    .line 13
    if-eq p0, v0, :cond_1

    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_ULTRA_PREMIUM:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 16
    .line 17
    if-ne p0, v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    goto :goto_1

    .line 22
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 23
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public static synthetic l0(Ll/ktl0;Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)Lrx/c;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ktl0;->F0(Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic m0(Ll/ktl0;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ktl0;->D0(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic n0(Ljava/lang/Boolean;Lcom/p1/mobile/putong/core/data/UserPrivilege;Ljava/lang/Boolean;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic o0(Ll/ktl0;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ktl0;->A0(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic p0()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ll/dkb;->W9(Ljava/lang/String;)Lrx/c;

    .line 14
    .line 15
    .line 16
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/joa;->v4()Lrx/c;

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static q0()I
    .locals 2

    .line 1
    invoke-static {}, Ll/ktl0;->u0()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/ktl0;->c:Ljava/util/ArrayList;

    .line 5
    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    return v0
.end method

.method public static s0(Lcom/p1/mobile/putong/core/data/PurchaseType;)I
    .locals 1

    .line 1
    invoke-static {}, Ll/ktl0;->u0()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/ktl0;->c:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    sget-object v0, Ll/ktl0;->c:Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    sget-object v0, Ll/ktl0;->c:Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    return p0

    .line 28
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 29
    return p0
.end method

.method public static t0()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/ktl0;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object v0
.end method

.method public static u0()V
    .locals 2

    .line 1
    sget-object v0, Ll/ktl0;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    sget-object v0, Ll/ktl0;->c:Ljava/util/ArrayList;

    .line 7
    .line 8
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    sget-object v0, Ll/ktl0;->c:Ljava/util/ArrayList;

    .line 14
    .line 15
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_LIKERS:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    invoke-static {}, Ll/ktl0;->J0()V

    .line 21
    .line 22
    .line 23
    invoke-static {}, Ll/d79;->V()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    sget-object v0, Ll/ktl0;->c:Ljava/util/ArrayList;

    .line 30
    .line 31
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_ULTRA_PREMIUM:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method private synthetic z0(IILandroid/content/Intent;)Z
    .locals 1

    .line 1
    const/16 p2, 0x3f4

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-ne p1, p2, :cond_3

    .line 5
    .line 6
    if-eqz p3, :cond_3

    .line 7
    .line 8
    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    goto :goto_1

    .line 15
    :cond_0
    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    const-string p2, "result_type"

    .line 20
    .line 21
    invoke-virtual {p1, p2}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    const/4 p3, 0x1

    .line 26
    if-ne p2, p3, :cond_1

    .line 27
    .line 28
    const-string p2, "result_string"

    .line 29
    .line 30
    invoke-virtual {p1, p2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    goto :goto_0

    .line 35
    :cond_1
    const-string p1, ""

    .line 36
    .line 37
    :goto_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    if-eqz p2, :cond_2

    .line 42
    .line 43
    const-string p0, "\u4e8c\u7ef4\u7801\u4fe1\u606f\u6709\u8bef\uff0c\u8bf7\u91cd\u8bd5"

    .line 44
    .line 45
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    return v0

    .line 49
    :cond_2
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-static {p0, p1}, Ll/hl3;->N(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    :cond_3
    :goto_1
    return v0
.end method


# virtual methods
.method public final synthetic C0(Ll/uxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/eul0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/eul0;->J0()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic D0(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/eul0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/eul0;->J0()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public L0(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/ui/purchase/d$a;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ktl0;->a:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public r0(Lcom/p1/mobile/putong/core/data/PurchaseType;)Lcom/p1/mobile/putong/core/ui/purchase/d$a;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ktl0;->a:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 8
    .line 9
    return-object p0
.end method

.method public x0()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/ar2;->lifecycleProviderImpl:Ll/ner;

    .line 2
    .line 3
    instance-of v1, v0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    check-cast v0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;

    .line 8
    .line 9
    new-instance v1, Ll/ysl0;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/ysl0;-><init>(Ll/ktl0;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Frag;->t4(Lcom/p1/mobile/android/app/a$a;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/ctl0;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/ctl0;-><init>(Ll/ktl0;)V

    .line 24
    .line 25
    .line 26
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/ktl0;->a:Ljava/util/HashMap;

    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 36
    .line 37
    .line 38
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 39
    .line 40
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->Q4()Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_1

    .line 47
    .line 48
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 49
    .line 50
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 51
    .line 52
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->C4()Lcom/p1/mobile/putong/core/data/FreeTrialData;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iget-wide v0, v0, Lcom/p1/mobile/putong/core/data/FreeTrialData;->endTime:J

    .line 57
    .line 58
    const-wide/16 v2, 0x3e8

    .line 59
    .line 60
    mul-long/2addr v0, v2

    .line 61
    const-wide/16 v2, 0x1

    .line 62
    .line 63
    sget-object v4, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 64
    .line 65
    const-wide/16 v5, 0x0

    .line 66
    .line 67
    invoke-static {v5, v6, v2, v3, v4}, Lrx/c;->interval(JJLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    invoke-virtual {p0, v2}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    invoke-virtual {v2}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 80
    .line 81
    .line 82
    move-result-object v3

    .line 83
    invoke-virtual {v2, v3}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    new-instance v3, Ll/dtl0;

    .line 88
    .line 89
    invoke-direct {v3, p0, v0, v1}, Ll/dtl0;-><init>(Ll/ktl0;J)V

    .line 90
    .line 91
    .line 92
    invoke-static {v3}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-virtual {v2, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    iput-object v0, p0, Ll/ktl0;->b:Ll/kcg0;

    .line 101
    .line 102
    :cond_1
    invoke-static {}, Ll/fp60;->E()Lrx/c;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    new-instance v1, Ll/etl0;

    .line 107
    .line 108
    invoke-direct {v1}, Ll/etl0;-><init>()V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    new-instance v1, Ll/ftl0;

    .line 116
    .line 117
    invoke-direct {v1, p0}, Ll/ftl0;-><init>(Ll/ktl0;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {v0, v1}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    new-instance v1, Ll/gtl0;

    .line 137
    .line 138
    invoke-direct {v1, p0}, Ll/gtl0;-><init>(Ll/ktl0;)V

    .line 139
    .line 140
    .line 141
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 142
    .line 143
    .line 144
    move-result-object v1

    .line 145
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 146
    .line 147
    .line 148
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 149
    .line 150
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 151
    .line 152
    invoke-virtual {v0}, Ll/dkb;->o9()Lrx/c;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    new-instance v1, Ll/uy30;

    .line 157
    .line 158
    invoke-direct {v1}, Ll/uy30;-><init>()V

    .line 159
    .line 160
    .line 161
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 166
    .line 167
    .line 168
    move-result-object v0

    .line 169
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 170
    .line 171
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 172
    .line 173
    const-string v2, "seeWhoLikedMe"

    .line 174
    .line 175
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 176
    .line 177
    .line 178
    move-result-object v2

    .line 179
    invoke-virtual {v1, v2}, Ll/joa;->v3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Lrx/c;

    .line 180
    .line 181
    .line 182
    move-result-object v1

    .line 183
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 184
    .line 185
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 186
    .line 187
    const-string v3, "svip"

    .line 188
    .line 189
    invoke-static {v3}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 190
    .line 191
    .line 192
    move-result-object v3

    .line 193
    invoke-virtual {v2, v3}, Ll/joa;->v3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Lrx/c;

    .line 194
    .line 195
    .line 196
    move-result-object v2

    .line 197
    new-instance v3, Ll/htl0;

    .line 198
    .line 199
    invoke-direct {v3}, Ll/htl0;-><init>()V

    .line 200
    .line 201
    .line 202
    invoke-virtual {v2, v3}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 203
    .line 204
    .line 205
    move-result-object v2

    .line 206
    invoke-virtual {v2}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 207
    .line 208
    .line 209
    move-result-object v2

    .line 210
    new-instance v3, Ll/itl0;

    .line 211
    .line 212
    invoke-direct {v3}, Ll/itl0;-><init>()V

    .line 213
    .line 214
    .line 215
    invoke-static {v0, v1, v2, v3}, Lrx/c;->combineLatest(Lrx/c;Lrx/c;Lrx/c;Ll/scj;)Lrx/c;

    .line 216
    .line 217
    .line 218
    move-result-object v0

    .line 219
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 220
    .line 221
    .line 222
    move-result-object v0

    .line 223
    new-instance v1, Ll/jtl0;

    .line 224
    .line 225
    invoke-direct {v1, p0}, Ll/jtl0;-><init>(Ll/ktl0;)V

    .line 226
    .line 227
    .line 228
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 229
    .line 230
    .line 231
    move-result-object v1

    .line 232
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 233
    .line 234
    .line 235
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 236
    .line 237
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 238
    .line 239
    invoke-virtual {v0}, Ll/dkb;->o9()Lrx/c;

    .line 240
    .line 241
    .line 242
    move-result-object v0

    .line 243
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 244
    .line 245
    .line 246
    move-result-object v0

    .line 247
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 248
    .line 249
    .line 250
    move-result-object v0

    .line 251
    new-instance v1, Ll/btl0;

    .line 252
    .line 253
    invoke-direct {v1, p0}, Ll/btl0;-><init>(Ll/ktl0;)V

    .line 254
    .line 255
    .line 256
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 257
    .line 258
    .line 259
    move-result-object p0

    .line 260
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 261
    .line 262
    .line 263
    sget-object p0, Ll/ubp;->INSTANCE:Ll/ubp;

    .line 264
    .line 265
    invoke-virtual {p0}, Ll/ubp;->t()Z

    .line 266
    .line 267
    .line 268
    move-result p0

    .line 269
    if-eqz p0, :cond_2

    .line 270
    .line 271
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 272
    .line 273
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->H2:Ll/cb9;

    .line 274
    .line 275
    invoke-virtual {p0}, Ll/cb9;->j3()V

    .line 276
    .line 277
    .line 278
    :cond_2
    return-void
.end method

.method public y0()V
    .locals 2

    .line 1
    sget-object v0, Ll/ktl0;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-ltz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast p0, Ll/eul0;

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ll/eul0;->l0(I)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method
