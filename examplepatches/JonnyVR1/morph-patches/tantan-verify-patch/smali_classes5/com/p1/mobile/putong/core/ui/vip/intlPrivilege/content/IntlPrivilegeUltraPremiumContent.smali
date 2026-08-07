.class public Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;
.super Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeRecycleView;
.source "SourceFile"

# interfaces
.implements Ll/hzo;


# instance fields
.field public e:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/a;

.field public f:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;

.field public g:Ll/t5m;

.field public h:Ll/r3p;

.field public i:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/tzo;",
            ">;"
        }
    .end annotation
.end field

.field public j:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation
.end field

.field public final k:Ll/x80;

.field public l:Lcom/p1/mobile/putong/core/data/ProductCategory;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 31
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 30
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeRecycleView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->i:Ljava/util/ArrayList;

    .line 10
    .line 11
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 12
    .line 13
    invoke-static {p1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->j:Lrx/subjects/a;

    .line 18
    .line 19
    new-instance p1, Ll/x80;

    .line 20
    .line 21
    invoke-direct {p1}, Ll/x80;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->k:Ll/x80;

    .line 25
    .line 26
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->init()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public static synthetic H(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->j0(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;Ll/pf60;)V

    return-void
.end method

.method public static synthetic I(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->l0(Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)V

    return-void
.end method

.method public static synthetic J(Lkotlin/Unit;)Lrx/c;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->G2:Ll/lc9;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/lc9;->s3()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic K(Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;->purchaseType:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    invoke-static {v0}, Ll/wib0;->w(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;->purchaseType:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 10
    .line 11
    invoke-static {v0}, Ll/wib0;->s(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;->purchaseType:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 18
    .line 19
    invoke-static {v0}, Ll/wib0;->q(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;->purchaseType:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 26
    .line 27
    invoke-static {p0}, Ll/wib0;->v(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    const/4 p0, 0x0

    .line 35
    goto :goto_1

    .line 36
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 37
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0
.end method

.method public static synthetic L(ZZ)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    sget p0, Lcom/p1/mobile/putong/core/R$string;->Ic:I

    .line 4
    .line 5
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static synthetic M(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->m0()V

    return-void
.end method

.method public static synthetic N(Ll/pf60;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Ljava/util/Collection;

    .line 4
    .line 5
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

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

.method public static synthetic O(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->g0(Ll/pf60;)V

    return-void
.end method

.method public static synthetic P(Ljava/util/List;Ljava/util/List;)Ll/pf60;
    .locals 1

    .line 1
    new-instance v0, Ll/pf60;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->h0(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic R(Ljava/util/List;Ljava/util/List;)Ll/pf60;
    .locals 1

    .line 1
    new-instance v0, Ll/pf60;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static synthetic S(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic T(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;Ll/pf60;Ll/tzo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->i0(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;Ll/pf60;Ll/tzo;)V

    return-void
.end method

.method public static synthetic U(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->k0(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;Ll/pf60;)V

    return-void
.end method

.method public static synthetic V(Lcom/p1/mobile/putong/core/data/UserPrivilege;)Ljava/lang/Boolean;
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

.method public static synthetic W(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;Lcom/p1/mobile/putong/data/Envelope;)Lrx/c;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->d0(Lcom/p1/mobile/putong/data/Envelope;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic X(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeExclusivePrivilegeView;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeExclusivePrivilegeView;->o(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Y(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;Ll/pf60;)Lrx/c;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->e0(Ll/pf60;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic Z(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->f0(Ll/pf60;)V

    return-void
.end method

.method public static synthetic a0(Ljava/util/List;)Ll/pf60;
    .locals 2

    .line 1
    new-instance v0, Ll/pf60;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method public static synthetic b0(Ljava/util/List;)Ll/pf60;
    .locals 2

    .line 1
    new-instance v0, Ll/pf60;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method private synthetic d0(Lcom/p1/mobile/putong/data/Envelope;)Lrx/c;
    .locals 1

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->G2:Ll/lc9;

    .line 4
    .line 5
    iget-object v0, p1, Ll/lc9;->R:Lcom/p1/mobile/putong/core/data/MembershipUpgradeInfo;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->getPurchaseType()Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p1, v0}, Ll/lc9;->l3(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->G2:Ll/lc9;

    .line 23
    .line 24
    invoke-virtual {p1}, Ll/lc9;->i3()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->l:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 29
    .line 30
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 31
    .line 32
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->getPurchaseType()Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/PurchaseType;->productCategory()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->y5(Lcom/p1/mobile/putong/core/data/ProductCategory;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 47
    .line 48
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 49
    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->l:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 51
    .line 52
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->y5(Lcom/p1/mobile/putong/core/data/ProductCategory;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    new-instance v0, Ll/q4p;

    .line 57
    .line 58
    invoke-direct {v0}, Ll/q4p;-><init>()V

    .line 59
    .line 60
    .line 61
    invoke-static {p1, p0, v0}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    return-object p0

    .line 66
    :cond_1
    :goto_0
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 67
    .line 68
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 69
    .line 70
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->getPurchaseType()Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/PurchaseType;->productCategory()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->y5(Lcom/p1/mobile/putong/core/data/ProductCategory;)Lrx/c;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    new-instance p1, Ll/o4p;

    .line 83
    .line 84
    invoke-direct {p1}, Ll/o4p;-><init>()V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    return-object p0
.end method

.method private synthetic e0(Ll/pf60;)Lrx/c;
    .locals 2

    .line 1
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/util/Collection;

    .line 4
    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast p1, Ljava/util/List;

    .line 18
    .line 19
    invoke-static {p0, p1}, Ll/cjj;->M(Landroid/content/Context;Ljava/util/List;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    new-instance p1, Ll/s4p;

    .line 24
    .line 25
    invoke-direct {p1}, Ll/s4p;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0

    .line 33
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iget-object v1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 38
    .line 39
    check-cast v1, Ljava/util/List;

    .line 40
    .line 41
    invoke-static {v0, v1}, Ll/cjj;->M(Landroid/content/Context;Ljava/util/List;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 50
    .line 51
    check-cast p1, Ljava/util/List;

    .line 52
    .line 53
    invoke-static {p0, p1}, Ll/cjj;->M(Landroid/content/Context;Ljava/util/List;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    new-instance p1, Ll/u4p;

    .line 58
    .line 59
    invoke-direct {p1}, Ll/u4p;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-static {v0, p0, p1}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    return-object p0
.end method

.method private synthetic f0(Ll/pf60;)V
    .locals 2

    .line 1
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    move-object v1, v0

    .line 4
    check-cast v1, Ll/pf60;

    .line 5
    .line 6
    iget-object v1, v1, Ll/pf60;->a:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v1, Ljava/util/List;

    .line 9
    .line 10
    check-cast v0, Ll/pf60;

    .line 11
    .line 12
    iget-object v0, v0, Ll/pf60;->b:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast v0, Ljava/util/List;

    .line 15
    .line 16
    invoke-direct {p0, v1, v0}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->n0(Ljava/util/List;Ljava/util/List;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->h:Ll/r3p;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    iput-boolean v1, v0, Ll/r3p;->k:Z

    .line 23
    .line 24
    const/4 v1, 0x1

    .line 25
    iput-boolean v1, v0, Ll/r3p;->l:Z

    .line 26
    .line 27
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 28
    .line 29
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_0

    .line 34
    .line 35
    invoke-static {}, Ll/yap;->d()Ll/yap;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p1}, Ll/yap;->m()Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-eqz p1, :cond_0

    .line 44
    .line 45
    invoke-static {}, Ll/yap;->d()Ll/yap;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    const-string v0, "tttUltraPremium"

    .line 50
    .line 51
    invoke-virtual {p1, v0}, Ll/yap;->h(Ljava/lang/String;)Z

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    if-eqz p1, :cond_0

    .line 56
    .line 57
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->h:Ll/r3p;

    .line 58
    .line 59
    iput-boolean v1, p0, Ll/r3p;->k:Z

    .line 60
    .line 61
    :cond_0
    return-void
.end method

.method private synthetic h0(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->o0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private init()V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setOverScrollMode(I)V

    .line 3
    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->setClipToPadding(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private n0(Ljava/util/List;Ljava/util/List;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_ULTRA_PREMIUM:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/PurchaseType;->productCategory()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {v1}, Ll/zry;->z(Lcom/p1/mobile/putong/core/data/ProductCategory;)Ll/jzl;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->f:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;

    .line 12
    .line 13
    invoke-virtual {v2}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/PurchaseType;->productCategory()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    invoke-interface {v1, v2, v0, v3, p1}, Ll/jzl;->a(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/util/List;)Ljava/util/List;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    const/4 v1, 0x2

    .line 30
    if-ne v0, v1, :cond_0

    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->g:Ll/t5m;

    .line 33
    .line 34
    check-cast v0, Ll/wl40;

    .line 35
    .line 36
    const/high16 v1, 0x423c0000    # 47.0f

    .line 37
    .line 38
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    invoke-virtual {v0, v2}, Ll/wl40;->d0(I)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->g:Ll/t5m;

    .line 46
    .line 47
    check-cast v0, Ll/wl40;

    .line 48
    .line 49
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    invoke-virtual {v0, v1}, Ll/wl40;->f0(I)V

    .line 54
    .line 55
    .line 56
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->h:Ll/r3p;

    .line 57
    .line 58
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    const/4 v1, 0x0

    .line 63
    const/4 v2, 0x0

    .line 64
    if-nez v0, :cond_1

    .line 65
    .line 66
    new-instance v3, Ll/r3p;

    .line 67
    .line 68
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->f:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;

    .line 69
    .line 70
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->getPurchaseType()Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 71
    .line 72
    .line 73
    move-result-object v7

    .line 74
    iget-object v8, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->l:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 75
    .line 76
    move-object v5, p1

    .line 77
    move-object v6, p2

    .line 78
    invoke-direct/range {v3 .. v8}, Ll/r3p;-><init>(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;Ljava/util/List;Ljava/util/List;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/ProductCategory;)V

    .line 79
    .line 80
    .line 81
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->h:Ll/r3p;

    .line 82
    .line 83
    invoke-virtual {v3}, Ll/r3p;->j()V

    .line 84
    .line 85
    .line 86
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->h:Ll/r3p;

    .line 87
    .line 88
    iput-boolean v2, p1, Ll/r3p;->g:Z

    .line 89
    .line 90
    iput-object v1, p1, Ll/r3p;->h:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 91
    .line 92
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->i:Ljava/util/ArrayList;

    .line 93
    .line 94
    invoke-virtual {p2, v2, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 95
    .line 96
    .line 97
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->e:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/a;

    .line 98
    .line 99
    invoke-virtual {p1, v2}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemInserted(I)V

    .line 100
    .line 101
    .line 102
    new-instance p1, Ll/k4p;

    .line 103
    .line 104
    invoke-direct {p1, p0}, Ll/k4p;-><init>(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {p0, p1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 108
    .line 109
    .line 110
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->h:Ll/r3p;

    .line 111
    .line 112
    iget-object p0, p0, Ll/r3p;->f:Lrx/subjects/b;

    .line 113
    .line 114
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 115
    .line 116
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 117
    .line 118
    .line 119
    return-void

    .line 120
    :cond_1
    move-object v5, p1

    .line 121
    move-object v6, p2

    .line 122
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->h:Ll/r3p;

    .line 123
    .line 124
    invoke-virtual {p1, v5, v6}, Ll/r3p;->k(Ljava/util/List;Ljava/util/List;)V

    .line 125
    .line 126
    .line 127
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->h:Ll/r3p;

    .line 128
    .line 129
    invoke-virtual {p1}, Ll/r3p;->j()V

    .line 130
    .line 131
    .line 132
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->h:Ll/r3p;

    .line 133
    .line 134
    iput-boolean v2, p0, Ll/r3p;->g:Z

    .line 135
    .line 136
    iput-object v1, p0, Ll/r3p;->h:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 137
    .line 138
    iget-object p0, p0, Ll/r3p;->f:Lrx/subjects/b;

    .line 139
    .line 140
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 141
    .line 142
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 143
    .line 144
    .line 145
    return-void
.end method

.method private o0()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->i:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->q0()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->i:Ljava/util/ArrayList;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->h:Ll/r3p;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->i:Ljava/util/ArrayList;

    .line 34
    .line 35
    new-instance v1, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/a$a;

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->getPurchaseType()Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-direct {v1, v2}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/a$a;-><init>(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->i:Ljava/util/ArrayList;

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->getPurchaseType()Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-static {v1}, Ll/fzo;->c(Lcom/p1/mobile/putong/core/data/PurchaseType;)Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeSubscriptionItem$a;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    invoke-static {}, Ll/d79;->a0()Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-nez v0, :cond_1

    .line 65
    .line 66
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->i:Ljava/util/ArrayList;

    .line 67
    .line 68
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->f:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;

    .line 69
    .line 70
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->getPurchaseType()Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    const/4 v3, 0x0

    .line 75
    invoke-static {v1, v2, v3}, Ll/fzo;->b(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/ui/purchase/d;)Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegePolicyItem$a;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->e:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/a;

    .line 83
    .line 84
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->i:Ljava/util/ArrayList;

    .line 85
    .line 86
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/a;->G(Ljava/util/ArrayList;)V

    .line 87
    .line 88
    .line 89
    :cond_2
    return-void
.end method

.method private q0()Z
    .locals 1

    .line 1
    invoke-static {}, Ll/d79;->a0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->h:Ll/r3p;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method private r0(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->e:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    const/4 v0, 0x0

    .line 7
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->i:Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-ge v0, v1, :cond_2

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->i:Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    instance-of v1, v1, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/a$a;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->findViewHolderForAdapterPosition(I)Landroidx/recyclerview/widget/RecyclerView$e0;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    if-eqz p0, :cond_2

    .line 30
    .line 31
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 32
    .line 33
    instance-of v0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeExclusivePrivilegeView;

    .line 34
    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    check-cast p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeExclusivePrivilegeView;

    .line 38
    .line 39
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeExclusivePrivilegeView;->h(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 40
    .line 41
    .line 42
    new-instance v0, Ll/v4p;

    .line 43
    .line 44
    invoke-direct {v0, p0, p1, p2}, Ll/v4p;-><init>(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeExclusivePrivilegeView;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegeExclusivePrivilegeView;->d(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/Runnable;)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_2
    :goto_1
    return-void
.end method


# virtual methods
.method public b(I)V
    .locals 0

    .line 1
    sget-object p0, Ll/wl40;->E:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public c0(Ll/d5n;Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 4
    .line 5
    const-string v1, "ultraPremium"

    .line 6
    .line 7
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ll/joa;->v3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p1, p2, v0}, Ll/lb2;->n(Ll/ner;Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/y4p;

    .line 20
    .line 21
    invoke-direct {v1}, Ll/y4p;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v1, Ll/e5p;

    .line 33
    .line 34
    invoke-direct {v1, p0}, Ll/e5p;-><init>(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;)V

    .line 35
    .line 36
    .line 37
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 42
    .line 43
    .line 44
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 45
    .line 46
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->G2:Ll/lc9;

    .line 47
    .line 48
    iget-object v0, v0, Ll/lc9;->V:Lrx/subjects/b;

    .line 49
    .line 50
    invoke-virtual {p2, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    new-instance v1, Ll/g5p;

    .line 55
    .line 56
    invoke-direct {v1, p0, p2}, Ll/g5p;-><init>(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;)V

    .line 57
    .line 58
    .line 59
    new-instance v2, Ll/i5p;

    .line 60
    .line 61
    invoke-direct {v2}, Ll/i5p;-><init>()V

    .line 62
    .line 63
    .line 64
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 69
    .line 70
    .line 71
    invoke-static {}, Ll/fp60;->E()Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    new-instance v1, Ll/k5p;

    .line 76
    .line 77
    invoke-direct {v1}, Ll/k5p;-><init>()V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-virtual {p1, p2, v0}, Ll/lb2;->n(Ll/ner;Lrx/c;)Lrx/c;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    new-instance v1, Ll/m5p;

    .line 89
    .line 90
    invoke-direct {v1, p0}, Ll/m5p;-><init>(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;)V

    .line 91
    .line 92
    .line 93
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 98
    .line 99
    .line 100
    invoke-static {}, Ll/t7a;->c()Z

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    if-eqz v0, :cond_0

    .line 105
    .line 106
    invoke-static {}, Ll/joa;->f4()Z

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    if-nez v0, :cond_0

    .line 111
    .line 112
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->j:Lrx/subjects/a;

    .line 113
    .line 114
    new-instance v1, Ll/b4p;

    .line 115
    .line 116
    invoke-direct {v1}, Ll/b4p;-><init>()V

    .line 117
    .line 118
    .line 119
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    goto :goto_0

    .line 124
    :cond_0
    const/4 v0, 0x0

    .line 125
    invoke-static {v0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    :goto_0
    new-instance v1, Ll/e4p;

    .line 130
    .line 131
    invoke-direct {v1, p0}, Ll/e4p;-><init>(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    new-instance v1, Ll/g4p;

    .line 139
    .line 140
    invoke-direct {v1}, Ll/g4p;-><init>()V

    .line 141
    .line 142
    .line 143
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    new-instance v1, Ll/i4p;

    .line 148
    .line 149
    invoke-direct {v1, p0}, Ll/i4p;-><init>(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;)V

    .line 150
    .line 151
    .line 152
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 157
    .line 158
    .line 159
    move-result-object v1

    .line 160
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    invoke-static {}, Ll/d79;->a0()Z

    .line 165
    .line 166
    .line 167
    move-result v1

    .line 168
    if-eqz v1, :cond_1

    .line 169
    .line 170
    return-void

    .line 171
    :cond_1
    invoke-static {}, Ll/d79;->X()Z

    .line 172
    .line 173
    .line 174
    move-result v1

    .line 175
    if-eqz v1, :cond_2

    .line 176
    .line 177
    invoke-static {}, Ll/yap;->d()Ll/yap;

    .line 178
    .line 179
    .line 180
    move-result-object v1

    .line 181
    invoke-virtual {v1}, Ll/yap;->n()Lrx/c;

    .line 182
    .line 183
    .line 184
    move-result-object v1

    .line 185
    invoke-virtual {v1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 186
    .line 187
    .line 188
    move-result-object v1

    .line 189
    new-instance v2, Ll/a2p;

    .line 190
    .line 191
    invoke-direct {v2}, Ll/a2p;-><init>()V

    .line 192
    .line 193
    .line 194
    invoke-static {v0, v1, v2}, Lrx/c;->combineLatest(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    new-instance v1, Ll/a5p;

    .line 199
    .line 200
    invoke-direct {v1, p0}, Ll/a5p;-><init>(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;)V

    .line 201
    .line 202
    .line 203
    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeRecycleView;->G(Ll/d5n;Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;Lrx/c;Ll/y20;)V

    .line 204
    .line 205
    .line 206
    return-void

    .line 207
    :cond_2
    new-instance v1, Ll/c5p;

    .line 208
    .line 209
    invoke-direct {v1, p0}, Ll/c5p;-><init>(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;)V

    .line 210
    .line 211
    .line 212
    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeRecycleView;->G(Ll/d5n;Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;Lrx/c;Ll/y20;)V

    .line 213
    .line 214
    .line 215
    return-void
.end method

.method public f(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 2

    .line 1
    sget-object v0, Ll/wl40;->F:Lrx/subjects/b;

    .line 2
    .line 3
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->r0(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic g0(Ll/pf60;)V
    .locals 1

    .line 1
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/util/List;

    .line 4
    .line 5
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p1, Ljava/util/List;

    .line 8
    .line 9
    invoke-direct {p0, v0, p1}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->n0(Ljava/util/List;Ljava/util/List;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public getPurchaseType()Lcom/p1/mobile/putong/core/data/PurchaseType;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_ULTRA_PREMIUM:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic i0(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;Ll/pf60;Ll/tzo;)V
    .locals 2

    .line 1
    instance-of v0, p3, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegePolicyItem$a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->i:Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-virtual {v0, p3}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->i:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {v1, p3}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->i:Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->getPurchaseType()Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iget-object p2, p2, Ll/pf60;->b:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast p2, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 25
    .line 26
    invoke-static {p1, v1, p2}, Ll/fzo;->b(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/ui/purchase/d;)Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/item/IntlPrivilegePolicyItem$a;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p3, v0, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->e:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/a;

    .line 34
    .line 35
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public final synthetic j0(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;Ll/pf60;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->isAdded()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-static {}, Ll/d79;->a0()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->i:Ljava/util/ArrayList;

    .line 15
    .line 16
    new-instance v1, Ll/w4p;

    .line 17
    .line 18
    invoke-direct {v1, p0, p1, p2}, Ll/w4p;-><init>(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;Ll/pf60;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 22
    .line 23
    .line 24
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic k0(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;Ll/pf60;)V
    .locals 2

    .line 1
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p2, Ll/pf60;->a:Ljava/lang/Object;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->getPurchaseType()Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    if-ne v0, v1, :cond_0

    .line 14
    .line 15
    new-instance v0, Ll/m4p;

    .line 16
    .line 17
    invoke-direct {v0, p0, p1, p2}, Ll/m4p;-><init>(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;Ll/pf60;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public final synthetic l0(Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->j:Lrx/subjects/a;

    .line 2
    .line 3
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic m0()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->getScrollState()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public p0(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;)V
    .locals 2

    .line 1
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 11
    .line 12
    .line 13
    new-instance v0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/a;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->g:Ll/t5m;

    .line 16
    .line 17
    invoke-direct {v0, p1, v1, p0}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/a;-><init>(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;Ll/t5m;Ll/hzo;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->e:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/a;

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 23
    .line 24
    .line 25
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->o0()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public z(Ll/d5n;Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;)V
    .locals 4

    .line 1
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->f:Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;

    .line 2
    .line 3
    new-instance v0, Ll/wl40;

    .line 4
    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->getPurchaseType()Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    const-string v3, "form_sub"

    .line 14
    .line 15
    invoke-direct {v0, v1, v2, v3}, Ll/wl40;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->g:Ll/t5m;

    .line 19
    .line 20
    sget v1, Ll/qa00;->i:I

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    invoke-virtual {v0, v1, v2, v1, v2}, Ll/wl40;->e0(IIII)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->g:Ll/t5m;

    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->k:Ll/x80;

    .line 29
    .line 30
    invoke-interface {v0, v1}, Ll/t5m;->c(Ll/x80;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->g:Ll/t5m;

    .line 34
    .line 35
    instance-of v1, v0, Ll/wl40;

    .line 36
    .line 37
    if-eqz v1, :cond_0

    .line 38
    .line 39
    check-cast v0, Ll/wl40;

    .line 40
    .line 41
    new-instance v1, Ll/z3p;

    .line 42
    .line 43
    invoke-direct {v1}, Ll/z3p;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, v1}, Ll/ip0;->H(Ll/ip0$a;)V

    .line 47
    .line 48
    .line 49
    :cond_0
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->p0(Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeUltraPremiumContent;->c0(Ll/d5n;Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method
