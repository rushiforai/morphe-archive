.class public Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;
.super Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeRecycleView;
.source "SourceFile"

# interfaces
.implements Ll/gzo;


# instance fields
.field public e:Ll/izo;

.field public f:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;

.field public g:Ll/t5m;

.field public h:Ll/q3p;

.field public i:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/szo;",
            ">;"
        }
    .end annotation
.end field

.field public final j:Ll/x80;

.field public k:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation
.end field

.field public l:Lcom/p1/mobile/putong/core/data/ProductCategory;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 31
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 30
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeRecycleView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->i:Ljava/util/ArrayList;

    .line 10
    .line 11
    new-instance p1, Ll/x80;

    .line 12
    .line 13
    invoke-direct {p1}, Ll/x80;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->j:Ll/x80;

    .line 17
    .line 18
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 19
    .line 20
    invoke-static {p1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->k:Lrx/subjects/a;

    .line 25
    .line 26
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->init()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public static synthetic H(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;Ll/pf60;Ll/szo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->p0(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;Ll/pf60;Ll/szo;)V

    return-void
.end method

.method public static synthetic I(Ljava/util/List;Ljava/util/List;)Ll/pf60;
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

.method public static synthetic J(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;Lcom/p1/mobile/putong/data/Envelope;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->i0(Lcom/p1/mobile/putong/data/Envelope;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic K(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->q0(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;Ll/pf60;)V

    return-void
.end method

.method public static synthetic L(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->o0(Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)V

    return-void
.end method

.method public static synthetic M(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->n0(Ll/pf60;)V

    return-void
.end method

.method public static synthetic N(Ljava/util/List;)Ljava/util/List;
    .locals 2

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/j1p;

    .line 7
    .line 8
    invoke-direct {v1, v0}, Ll/j1p;-><init>(Ljava/util/List;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public static synthetic O(Ll/pf60;)Ljava/lang/Boolean;
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

.method public static synthetic P(Ljava/lang/Throwable;)Lrx/c;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/core/data/UserPrivilege;)Ljava/lang/Boolean;
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

.method public static synthetic R(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->l0(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic S(Ljava/util/List;)Ll/pf60;
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

.method public static synthetic T(Ljava/util/List;Ljava/util/List;)Ll/pf60;
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

.method public static synthetic U(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;Ll/pf60;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->j0(Ll/pf60;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic V(Ljava/util/List;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

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

.method public static synthetic W(Ljava/util/List;Lcom/p1/mobile/putong/core/data/Merchandise;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->affiliateProducts:Lcom/p1/mobile/putong/core/data/AffiliateProducts;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->C4()Lcom/p1/mobile/putong/core/data/FreeTrialData;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->C4()Lcom/p1/mobile/putong/core/data/FreeTrialData;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/FreeTrialData;->skuId:Ljava/lang/String;

    .line 30
    .line 31
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 32
    .line 33
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->affiliateProducts:Lcom/p1/mobile/putong/core/data/AffiliateProducts;

    .line 34
    .line 35
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/AffiliateProducts;->googleplay:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_0

    .line 42
    .line 43
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    :cond_0
    return-void
.end method

.method public static synthetic X(Lkotlin/Unit;)Lrx/c;
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

.method public static synthetic Y(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic Z(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->r0(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;Ll/pf60;)V

    return-void
.end method

.method public static synthetic a0(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->k0(Ll/pf60;)V

    return-void
.end method

.method public static synthetic b0(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;Ljava/util/List;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->m0(Ljava/util/List;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic c0(Ljava/util/List;)Ll/pf60;
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

.method public static synthetic d0(ZZ)V
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

.method public static synthetic e0(Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)Ljava/lang/Boolean;
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

.method public static synthetic f0(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->s0()V

    return-void
.end method

.method private g0(Ljava/util/List;)Lcom/p1/mobile/putong/core/data/Merchandise;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;)",
            "Lcom/p1/mobile/putong/core/data/Merchandise;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    return-object v0

    .line 9
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/4 p1, -0x1

    .line 14
    :cond_1
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_3

    .line 19
    .line 20
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 25
    .line 26
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-eqz v2, :cond_1

    .line 31
    .line 32
    invoke-static {v1}, Ll/v5b0;->w(Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-eqz v2, :cond_1

    .line 37
    .line 38
    if-eqz v0, :cond_2

    .line 39
    .line 40
    iget v2, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 41
    .line 42
    invoke-static {p1, v2}, Ljava/lang/Math;->max(II)I

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    if-eq p1, v2, :cond_1

    .line 47
    .line 48
    :cond_2
    iget p1, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 49
    .line 50
    move-object v0, v1

    .line 51
    goto :goto_0

    .line 52
    :cond_3
    return-object v0
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

.method private t0(Ljava/util/List;Ljava/util/List;)V
    .locals 8
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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->h:Ll/q3p;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    new-instance v2, Ll/q3p;

    .line 11
    .line 12
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->f:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->getPurchaseType()Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 15
    .line 16
    .line 17
    move-result-object v6

    .line 18
    iget-object v7, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->l:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 19
    .line 20
    move-object v4, p1

    .line 21
    move-object v5, p2

    .line 22
    invoke-direct/range {v2 .. v7}, Ll/q3p;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;Ljava/util/List;Ljava/util/List;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/ProductCategory;)V

    .line 23
    .line 24
    .line 25
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->h:Ll/q3p;

    .line 26
    .line 27
    invoke-virtual {v2}, Ll/q3p;->j()V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->h:Ll/q3p;

    .line 31
    .line 32
    iput-boolean v1, p1, Ll/q3p;->g:Z

    .line 33
    .line 34
    invoke-direct {p0, v4}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->g0(Ljava/util/List;)Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    iput-object p2, p1, Ll/q3p;->h:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 39
    .line 40
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->i:Ljava/util/ArrayList;

    .line 41
    .line 42
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->h:Ll/q3p;

    .line 43
    .line 44
    invoke-virtual {p1, v1, p2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->e:Ll/izo;

    .line 48
    .line 49
    invoke-virtual {p1, v1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemInserted(I)V

    .line 50
    .line 51
    .line 52
    new-instance p1, Ll/h1p;

    .line 53
    .line 54
    invoke-direct {p1, p0}, Ll/h1p;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0, p1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 58
    .line 59
    .line 60
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->h:Ll/q3p;

    .line 61
    .line 62
    iget-object p0, p0, Ll/q3p;->f:Lrx/subjects/b;

    .line 63
    .line 64
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 65
    .line 66
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_0
    move-object v4, p1

    .line 71
    move-object v5, p2

    .line 72
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->h:Ll/q3p;

    .line 73
    .line 74
    invoke-virtual {p1, v4, v5}, Ll/q3p;->k(Ljava/util/List;Ljava/util/List;)V

    .line 75
    .line 76
    .line 77
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->h:Ll/q3p;

    .line 78
    .line 79
    invoke-virtual {p1}, Ll/q3p;->j()V

    .line 80
    .line 81
    .line 82
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->h:Ll/q3p;

    .line 83
    .line 84
    iput-boolean v1, p1, Ll/q3p;->g:Z

    .line 85
    .line 86
    invoke-direct {p0, v4}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->g0(Ljava/util/List;)Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 87
    .line 88
    .line 89
    move-result-object p2

    .line 90
    iput-object p2, p1, Ll/q3p;->h:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 91
    .line 92
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->h:Ll/q3p;

    .line 93
    .line 94
    iget-object p0, p0, Ll/q3p;->f:Lrx/subjects/b;

    .line 95
    .line 96
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 97
    .line 98
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method private u0()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->i:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->x0()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->i:Ljava/util/ArrayList;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->h:Ll/q3p;

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
    move-result v1

    .line 31
    if-eqz v1, :cond_2

    .line 32
    .line 33
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 36
    .line 37
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/data/PurchaseType;->getPrivilegeDataForGP(Lcom/p1/mobile/putong/data/Gender;)Ljava/util/ArrayList;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-eqz v1, :cond_1

    .line 50
    .line 51
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    check-cast v1, Lcom/p1/mobile/putong/core/data/Privilege;

    .line 56
    .line 57
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->getPurchaseType()Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    invoke-static {v1, v2}, Ll/ezo;->a(Lcom/p1/mobile/putong/core/data/Privilege;Lcom/p1/mobile/putong/core/data/PurchaseType;)Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem$a;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->i:Ljava/util/ArrayList;

    .line 66
    .line 67
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->i:Ljava/util/ArrayList;

    .line 72
    .line 73
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->getPurchaseType()Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-static {v1}, Ll/ezo;->d(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ll/mcg0;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->i:Ljava/util/ArrayList;

    .line 85
    .line 86
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->f:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;

    .line 87
    .line 88
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->getPurchaseType()Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    const/4 v3, 0x0

    .line 93
    invoke-static {v1, v2, v3}, Ll/ezo;->b(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/ui/purchase/d;)Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegePolicyItem$a;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->e:Ll/izo;

    .line 101
    .line 102
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->i:Ljava/util/ArrayList;

    .line 103
    .line 104
    invoke-virtual {v0, p0}, Ll/izo;->G(Ljava/util/ArrayList;)V

    .line 105
    .line 106
    .line 107
    :cond_2
    return-void
.end method

.method private x0()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->h:Ll/q3p;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
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

.method public getPurchaseType()Lcom/p1/mobile/putong/core/data/PurchaseType;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    return-object p0
.end method

.method public h0(Ll/c5n;Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 4
    .line 5
    const-string v1, "svip"

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
    new-instance v1, Ll/s0p;

    .line 20
    .line 21
    invoke-direct {v1}, Ll/s0p;-><init>()V

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
    new-instance v1, Ll/l2p;

    .line 33
    .line 34
    invoke-direct {v1, p0}, Ll/l2p;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;)V

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
    invoke-static {}, Ll/fp60;->E()Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    new-instance v1, Ll/n2p;

    .line 49
    .line 50
    invoke-direct {v1}, Ll/n2p;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {p1, p2, v0}, Ll/lb2;->n(Ll/ner;Lrx/c;)Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    new-instance v1, Ll/q0p;

    .line 62
    .line 63
    invoke-direct {v1, p0}, Ll/q0p;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;)V

    .line 64
    .line 65
    .line 66
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 71
    .line 72
    .line 73
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 74
    .line 75
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->G2:Ll/lc9;

    .line 76
    .line 77
    iget-object v0, v0, Ll/lc9;->V:Lrx/subjects/b;

    .line 78
    .line 79
    invoke-virtual {p2, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    new-instance v1, Ll/t0p;

    .line 84
    .line 85
    invoke-direct {v1, p0, p2}, Ll/t0p;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;)V

    .line 86
    .line 87
    .line 88
    new-instance v2, Ll/v0p;

    .line 89
    .line 90
    invoke-direct {v2}, Ll/v0p;-><init>()V

    .line 91
    .line 92
    .line 93
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

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
    const/4 v1, 0x0

    .line 105
    if-eqz v0, :cond_1

    .line 106
    .line 107
    invoke-static {}, Ll/joa;->n4()Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    if-eqz v0, :cond_0

    .line 112
    .line 113
    invoke-static {}, Ll/joa;->i4()Z

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    if-nez v0, :cond_1

    .line 118
    .line 119
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->k:Lrx/subjects/a;

    .line 120
    .line 121
    new-instance v2, Ll/x0p;

    .line 122
    .line 123
    invoke-direct {v2}, Ll/x0p;-><init>()V

    .line 124
    .line 125
    .line 126
    invoke-virtual {v0, v2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    goto :goto_0

    .line 131
    :cond_1
    invoke-static {v1}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    :goto_0
    new-instance v2, Ll/z0p;

    .line 136
    .line 137
    invoke-direct {v2, p0}, Ll/z0p;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {v0, v2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    new-instance v2, Ll/b1p;

    .line 145
    .line 146
    invoke-direct {v2}, Ll/b1p;-><init>()V

    .line 147
    .line 148
    .line 149
    invoke-virtual {v0, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    new-instance v2, Ll/d1p;

    .line 154
    .line 155
    invoke-direct {v2, p0}, Ll/d1p;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;)V

    .line 156
    .line 157
    .line 158
    invoke-virtual {v0, v2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 163
    .line 164
    .line 165
    move-result-object v2

    .line 166
    invoke-virtual {v0, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    invoke-static {}, Ll/d79;->X()Z

    .line 171
    .line 172
    .line 173
    move-result v2

    .line 174
    if-eqz v2, :cond_2

    .line 175
    .line 176
    invoke-static {}, Ll/yap;->d()Ll/yap;

    .line 177
    .line 178
    .line 179
    move-result-object v1

    .line 180
    invoke-virtual {v1}, Ll/yap;->n()Lrx/c;

    .line 181
    .line 182
    .line 183
    move-result-object v1

    .line 184
    invoke-virtual {v1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 185
    .line 186
    .line 187
    move-result-object v1

    .line 188
    new-instance v2, Ll/a2p;

    .line 189
    .line 190
    invoke-direct {v2}, Ll/a2p;-><init>()V

    .line 191
    .line 192
    .line 193
    invoke-static {v0, v1, v2}, Lrx/c;->combineLatest(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 194
    .line 195
    .line 196
    move-result-object v0

    .line 197
    new-instance v1, Ll/z1p;

    .line 198
    .line 199
    invoke-direct {v1, p0}, Ll/z1p;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;)V

    .line 200
    .line 201
    .line 202
    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeRecycleView;->G(Ll/c5n;Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;Lrx/c;Ll/y20;)V

    .line 203
    .line 204
    .line 205
    return-void

    .line 206
    :cond_2
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 207
    .line 208
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 209
    .line 210
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/api/CoreProduct;->z4()Z

    .line 211
    .line 212
    .line 213
    move-result v2

    .line 214
    if-eqz v2, :cond_3

    .line 215
    .line 216
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 217
    .line 218
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 219
    .line 220
    const-string v2, "tttSvipGoogleplayFreeTrial"

    .line 221
    .line 222
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 223
    .line 224
    .line 225
    move-result-object v2

    .line 226
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/api/CoreProduct;->y5(Lcom/p1/mobile/putong/core/data/ProductCategory;)Lrx/c;

    .line 227
    .line 228
    .line 229
    move-result-object v1

    .line 230
    new-instance v2, Ll/b2p;

    .line 231
    .line 232
    invoke-direct {v2}, Ll/b2p;-><init>()V

    .line 233
    .line 234
    .line 235
    invoke-virtual {v1, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 236
    .line 237
    .line 238
    move-result-object v1

    .line 239
    new-instance v2, Ll/d2p;

    .line 240
    .line 241
    invoke-direct {v2}, Ll/d2p;-><init>()V

    .line 242
    .line 243
    .line 244
    invoke-virtual {v1, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 245
    .line 246
    .line 247
    move-result-object v1

    .line 248
    new-instance v2, Ll/f2p;

    .line 249
    .line 250
    invoke-direct {v2, p0}, Ll/f2p;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;)V

    .line 251
    .line 252
    .line 253
    invoke-virtual {v1, v2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 254
    .line 255
    .line 256
    move-result-object v1

    .line 257
    new-instance v2, Ll/h2p;

    .line 258
    .line 259
    invoke-direct {v2}, Ll/h2p;-><init>()V

    .line 260
    .line 261
    .line 262
    invoke-virtual {v1, v2}, Lrx/c;->onErrorResumeNext(Ll/qcj;)Lrx/c;

    .line 263
    .line 264
    .line 265
    move-result-object v1

    .line 266
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 267
    .line 268
    .line 269
    move-result-object v2

    .line 270
    invoke-virtual {v1, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 271
    .line 272
    .line 273
    move-result-object v1

    .line 274
    goto :goto_1

    .line 275
    :cond_3
    invoke-static {v1}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 276
    .line 277
    .line 278
    move-result-object v1

    .line 279
    :goto_1
    new-instance v2, Ll/m2p;

    .line 280
    .line 281
    invoke-direct {v2}, Ll/m2p;-><init>()V

    .line 282
    .line 283
    .line 284
    invoke-static {v0, v1, v2}, Lrx/c;->combineLatest(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 285
    .line 286
    .line 287
    move-result-object v0

    .line 288
    new-instance v1, Ll/j2p;

    .line 289
    .line 290
    invoke-direct {v1, p0}, Ll/j2p;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;)V

    .line 291
    .line 292
    .line 293
    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeRecycleView;->G(Ll/c5n;Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;Lrx/c;Ll/y20;)V

    .line 294
    .line 295
    .line 296
    return-void
.end method

.method public i()V
    .locals 1

    .line 1
    sget-object p0, Ll/wl40;->F:Lrx/subjects/b;

    .line 2
    .line 3
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic i0(Lcom/p1/mobile/putong/data/Envelope;)Lrx/c;
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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->getPurchaseType()Lcom/p1/mobile/putong/core/data/PurchaseType;

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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->l:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 29
    .line 30
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 31
    .line 32
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->getPurchaseType()Lcom/p1/mobile/putong/core/data/PurchaseType;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->l:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 51
    .line 52
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->y5(Lcom/p1/mobile/putong/core/data/ProductCategory;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    new-instance v0, Ll/o1p;

    .line 57
    .line 58
    invoke-direct {v0}, Ll/o1p;-><init>()V

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->getPurchaseType()Lcom/p1/mobile/putong/core/data/PurchaseType;

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
    new-instance p1, Ll/m1p;

    .line 83
    .line 84
    invoke-direct {p1}, Ll/m1p;-><init>()V

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

.method public final synthetic j0(Ll/pf60;)Lrx/c;
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
    new-instance p1, Ll/q1p;

    .line 24
    .line 25
    invoke-direct {p1}, Ll/q1p;-><init>()V

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
    new-instance p1, Ll/s1p;

    .line 58
    .line 59
    invoke-direct {p1}, Ll/s1p;-><init>()V

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

.method public final synthetic k0(Ll/pf60;)V
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
    invoke-direct {p0, v1, v0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->t0(Ljava/util/List;Ljava/util/List;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->h:Ll/q3p;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    iput-boolean v1, v0, Ll/q3p;->k:Z

    .line 23
    .line 24
    const/4 v1, 0x1

    .line 25
    iput-boolean v1, v0, Ll/q3p;->l:Z

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
    const-string v0, "svip"

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->h:Ll/q3p;

    .line 58
    .line 59
    iput-boolean v1, p0, Ll/q3p;->k:Z

    .line 60
    .line 61
    :cond_0
    return-void
.end method

.method public final synthetic l0(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->u0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic m0(Ljava/util/List;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0, p1}, Ll/cjj;->M(Landroid/content/Context;Ljava/util/List;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final synthetic n0(Ll/pf60;)V
    .locals 5

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
    iget-object v2, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 17
    .line 18
    check-cast v2, Ljava/util/Collection;

    .line 19
    .line 20
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-nez v2, :cond_1

    .line 25
    .line 26
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 27
    .line 28
    check-cast p1, Ljava/util/List;

    .line 29
    .line 30
    const/4 v2, 0x0

    .line 31
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    check-cast p1, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 36
    .line 37
    :goto_0
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    if-ge v2, v3, :cond_1

    .line 42
    .line 43
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    check-cast v3, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 48
    .line 49
    iget v3, v3, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 50
    .line 51
    iget v4, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 52
    .line 53
    if-ne v3, v4, :cond_0

    .line 54
    .line 55
    invoke-interface {v1, v2, p1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_1
    :goto_1
    invoke-direct {p0, v1, v0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->t0(Ljava/util/List;Ljava/util/List;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public final synthetic o0(Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->k:Lrx/subjects/a;

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

.method public final synthetic p0(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;Ll/pf60;Ll/szo;)V
    .locals 2

    .line 1
    instance-of v0, p3, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegePolicyItem$a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->i:Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-virtual {v0, p3}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->i:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {v1, p3}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->i:Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->getPurchaseType()Lcom/p1/mobile/putong/core/data/PurchaseType;

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
    invoke-static {p1, v1, p2}, Ll/ezo;->b(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/ui/purchase/d;)Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegePolicyItem$a;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p3, v0, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->e:Ll/izo;

    .line 34
    .line 35
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public final synthetic q0(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;Ll/pf60;)V
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
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->i:Ljava/util/ArrayList;

    .line 9
    .line 10
    new-instance v1, Ll/u1p;

    .line 11
    .line 12
    invoke-direct {v1, p0, p1, p2}, Ll/u1p;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;Ll/pf60;)V

    .line 13
    .line 14
    .line 15
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final synthetic r0(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;Ll/pf60;)V
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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->getPurchaseType()Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    if-ne v0, v1, :cond_0

    .line 14
    .line 15
    new-instance v0, Ll/f1p;

    .line 16
    .line 17
    invoke-direct {v0, p0, p1, p2}, Ll/f1p;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;Ll/pf60;)V

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

.method public final synthetic s0()V
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

.method public v0()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->g:Ll/t5m;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/t5m;->release()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public w0(Lcom/p1/mobile/putong/app/PutongFrag;)V
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
    new-instance v0, Ll/izo;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->g:Ll/t5m;

    .line 16
    .line 17
    invoke-direct {v0, p1, v1, p0}, Ll/izo;-><init>(Lcom/p1/mobile/putong/app/PutongFrag;Ll/t5m;Ll/gzo;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->e:Ll/izo;

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 23
    .line 24
    .line 25
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->u0()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public y(Ll/c5n;Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;)V
    .locals 3

    .line 1
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->f:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->getPurchaseType()Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-direct {v0, v1, v2}, Ll/wl40;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->g:Ll/t5m;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->j:Ll/x80;

    .line 19
    .line 20
    invoke-interface {v0, v1}, Ll/t5m;->c(Ll/x80;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->g:Ll/t5m;

    .line 24
    .line 25
    instance-of v1, v0, Ll/wl40;

    .line 26
    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    check-cast v0, Ll/wl40;

    .line 30
    .line 31
    new-instance v1, Ll/o0p;

    .line 32
    .line 33
    invoke-direct {v1}, Ll/o0p;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1}, Ll/ip0;->H(Ll/ip0$a;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->g:Ll/t5m;

    .line 40
    .line 41
    check-cast v0, Ll/wl40;

    .line 42
    .line 43
    const/4 v1, 0x0

    .line 44
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    invoke-virtual {v0, v1}, Ll/wl40;->c0(I)V

    .line 49
    .line 50
    .line 51
    :cond_0
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->w0(Lcom/p1/mobile/putong/app/PutongFrag;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/IntlPrivilegeSVipContent;->h0(Ll/c5n;Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method
