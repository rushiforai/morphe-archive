.class public Ll/q3p;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/szo;


# instance fields
.field public final a:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;

.field public b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;"
        }
    .end annotation
.end field

.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;"
        }
    .end annotation
.end field

.field public final d:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public e:Lcom/p1/mobile/putong/core/data/ProductCategory;

.field public f:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public g:Z

.field public h:Lcom/p1/mobile/putong/core/data/Merchandise;

.field public i:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;"
        }
    .end annotation
.end field

.field public j:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;"
        }
    .end annotation
.end field

.field public k:Z

.field public l:Z

.field public m:Ll/kcg0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;Ljava/util/List;Ljava/util/List;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/ProductCategory;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            "Lcom/p1/mobile/putong/core/data/ProductCategory;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/q3p;->f:Lrx/subjects/b;

    .line 9
    .line 10
    iput-object p1, p0, Ll/q3p;->a:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;

    .line 11
    .line 12
    iput-object p2, p0, Ll/q3p;->b:Ljava/util/List;

    .line 13
    .line 14
    iput-object p3, p0, Ll/q3p;->c:Ljava/util/List;

    .line 15
    .line 16
    iput-object p4, p0, Ll/q3p;->d:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 17
    .line 18
    iput-object p5, p0, Ll/q3p;->e:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 19
    .line 20
    return-void
.end method

.method public static synthetic a(Ll/q3p;Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeShowcaseWrapper;Lcom/p1/mobile/putong/core/ui/purchase/d;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/q3p;->f(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeShowcaseWrapper;Lcom/p1/mobile/putong/core/ui/purchase/d;)V

    return-void
.end method

.method public static synthetic b(Ll/q3p;Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeShowcaseWrapper;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/q3p;->h(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeShowcaseWrapper;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic c(Ll/q3p;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/q3p;->i()V

    return-void
.end method

.method public static synthetic d(Ll/q3p;Lcom/p1/mobile/putong/core/ui/purchase/d;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/q3p;->g(Lcom/p1/mobile/putong/core/ui/purchase/d;)V

    return-void
.end method


# virtual methods
.method public e(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeShowcaseWrapper;)V
    .locals 7

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeShowcaseWrapper;->c()Ll/t5m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Ll/wl40;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeShowcaseWrapper;->c()Ll/t5m;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    move-object v1, v0

    .line 14
    check-cast v1, Ll/wl40;

    .line 15
    .line 16
    iget-object v2, p0, Ll/q3p;->i:Ljava/util/List;

    .line 17
    .line 18
    new-instance v3, Ll/i3p;

    .line 19
    .line 20
    invoke-direct {v3, p0, p1}, Ll/i3p;-><init>(Ll/q3p;Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeShowcaseWrapper;)V

    .line 21
    .line 22
    .line 23
    new-instance v5, Ll/k3p;

    .line 24
    .line 25
    invoke-direct {v5, p0}, Ll/k3p;-><init>(Ll/q3p;)V

    .line 26
    .line 27
    .line 28
    iget-object v6, p0, Ll/q3p;->j:Ljava/util/List;

    .line 29
    .line 30
    const/4 v4, 0x0

    .line 31
    invoke-virtual/range {v1 .. v6}, Ll/wl40;->X(Ljava/util/List;Ll/y20;Ll/y20;Ll/y20;Ljava/util/List;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    iget-object v0, p0, Ll/q3p;->m:Ll/kcg0;

    .line 35
    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    invoke-interface {v0}, Ll/kcg0;->isUnsubscribed()Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_2

    .line 43
    .line 44
    :cond_1
    iget-object v0, p0, Ll/q3p;->a:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;

    .line 45
    .line 46
    iget-object v1, p0, Ll/q3p;->f:Lrx/subjects/b;

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    new-instance v1, Ll/m3p;

    .line 53
    .line 54
    invoke-direct {v1, p0, p1}, Ll/m3p;-><init>(Ll/q3p;Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeShowcaseWrapper;)V

    .line 55
    .line 56
    .line 57
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    iput-object v0, p0, Ll/q3p;->m:Ll/kcg0;

    .line 66
    .line 67
    :cond_2
    iget-boolean v0, p0, Ll/q3p;->k:Z

    .line 68
    .line 69
    if-eqz v0, :cond_3

    .line 70
    .line 71
    const/4 v0, 0x1

    .line 72
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeShowcaseWrapper;->setPromotionVisible(Z)V

    .line 73
    .line 74
    .line 75
    iget-boolean v0, p0, Ll/q3p;->l:Z

    .line 76
    .line 77
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeShowcaseWrapper;->setPromotionTheme(Z)V

    .line 78
    .line 79
    .line 80
    new-instance v0, Ll/o3p;

    .line 81
    .line 82
    invoke-direct {v0, p0}, Ll/o3p;-><init>(Ll/q3p;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeShowcaseWrapper;->setPromotionListener(Ll/x20;)V

    .line 86
    .line 87
    .line 88
    invoke-static {}, Ll/yap;->j()V

    .line 89
    .line 90
    .line 91
    return-void

    .line 92
    :cond_3
    const/4 p0, 0x0

    .line 93
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeShowcaseWrapper;->setPromotionVisible(Z)V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public final synthetic f(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeShowcaseWrapper;Lcom/p1/mobile/putong/core/ui/purchase/d;)V
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
    iget-object v0, p0, Ll/q3p;->a:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;

    .line 8
    .line 9
    iget-object v1, p0, Ll/q3p;->d:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 10
    .line 11
    invoke-virtual {v0, v1, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;->U4(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/ui/purchase/d;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    goto :goto_0

    .line 25
    :cond_1
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    :goto_0
    if-eqz v0, :cond_2

    .line 30
    .line 31
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeShowcaseWrapper;->c()Ll/t5m;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    check-cast p1, Ll/wl40;

    .line 36
    .line 37
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 38
    .line 39
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->G2:Ll/lc9;

    .line 40
    .line 41
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->f()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v1, v0}, Ll/lc9;->k3(Lcom/p1/mobile/putong/core/data/ProductCategory;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    invoke-virtual {p1, v0}, Ll/wl40;->g0(Z)V

    .line 50
    .line 51
    .line 52
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 53
    .line 54
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->G2:Ll/lc9;

    .line 55
    .line 56
    iget-object p1, p1, Ll/lc9;->V:Lrx/subjects/b;

    .line 57
    .line 58
    iget-object p0, p0, Ll/q3p;->d:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 59
    .line 60
    invoke-static {p0, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p1, p0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 65
    .line 66
    .line 67
    :cond_2
    return-void
.end method

.method public final synthetic g(Lcom/p1/mobile/putong/core/ui/purchase/d;)V
    .locals 2

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
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->G2:Ll/lc9;

    .line 10
    .line 11
    iget-object v0, v0, Ll/lc9;->V:Lrx/subjects/b;

    .line 12
    .line 13
    iget-object v1, p0, Ll/q3p;->d:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 14
    .line 15
    invoke-static {v1, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {v0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Ll/q3p;->a:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;->T4()V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public getItemType()I
    .locals 0

    .line 1
    const/4 p0, 0x4

    .line 2
    return p0
.end method

.method public final synthetic h(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeShowcaseWrapper;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/q3p;->j()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/q3p;->e(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeShowcaseWrapper;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic i()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q3p;->a:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/yap;->e(Lcom/p1/mobile/android/app/Act;)V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Ll/yap;->i()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public j()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/q3p;->d:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/PurchaseType;->productCategory()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/zry;->z(Lcom/p1/mobile/putong/core/data/ProductCategory;)Ll/jzl;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Ll/q3p;->a:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;

    .line 12
    .line 13
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget-object v2, p0, Ll/q3p;->d:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 18
    .line 19
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/data/PurchaseType;->productCategory()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    iget-object v4, p0, Ll/q3p;->b:Ljava/util/List;

    .line 24
    .line 25
    invoke-interface {v0, v1, v2, v3, v4}, Ll/jzl;->a(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/util/List;)Ljava/util/List;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Ll/q3p;->i:Ljava/util/List;

    .line 30
    .line 31
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->G2:Ll/lc9;

    .line 34
    .line 35
    iget-object v0, v0, Ll/lc9;->R:Lcom/p1/mobile/putong/core/data/MembershipUpgradeInfo;

    .line 36
    .line 37
    new-instance v1, Ljava/util/ArrayList;

    .line 38
    .line 39
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 40
    .line 41
    .line 42
    iput-object v1, p0, Ll/q3p;->j:Ljava/util/List;

    .line 43
    .line 44
    iget-object v1, p0, Ll/q3p;->c:Ljava/util/List;

    .line 45
    .line 46
    if-eqz v1, :cond_8

    .line 47
    .line 48
    if-eqz v0, :cond_8

    .line 49
    .line 50
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 51
    .line 52
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->G2:Ll/lc9;

    .line 53
    .line 54
    invoke-virtual {v1}, Ll/lc9;->i3()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    iget-object v2, p0, Ll/q3p;->e:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 59
    .line 60
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    if-eqz v1, :cond_8

    .line 65
    .line 66
    iget-object v1, p0, Ll/q3p;->e:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 67
    .line 68
    invoke-static {v1}, Ll/zry;->z(Lcom/p1/mobile/putong/core/data/ProductCategory;)Ll/jzl;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    iget-object v2, p0, Ll/q3p;->a:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;

    .line 73
    .line 74
    invoke-virtual {v2}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    iget-object v3, p0, Ll/q3p;->d:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 79
    .line 80
    iget-object v4, p0, Ll/q3p;->e:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 81
    .line 82
    iget-object v5, p0, Ll/q3p;->c:Ljava/util/List;

    .line 83
    .line 84
    invoke-interface {v1, v2, v3, v4, v5}, Ll/jzl;->a(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/util/List;)Ljava/util/List;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MembershipUpgradeInfo;->duration:Ljava/util/List;

    .line 89
    .line 90
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 95
    .line 96
    .line 97
    move-result v2

    .line 98
    if-eqz v2, :cond_3

    .line 99
    .line 100
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v2

    .line 104
    check-cast v2, Lcom/p1/mobile/putong/core/data/MembershipUpgradeDurationInfo;

    .line 105
    .line 106
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 107
    .line 108
    .line 109
    move-result-object v3

    .line 110
    :cond_1
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 111
    .line 112
    .line 113
    move-result v4

    .line 114
    if-eqz v4, :cond_0

    .line 115
    .line 116
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object v4

    .line 120
    check-cast v4, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 121
    .line 122
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 123
    .line 124
    .line 125
    move-result-object v5

    .line 126
    if-eqz v5, :cond_2

    .line 127
    .line 128
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 129
    .line 130
    .line 131
    move-result-object v5

    .line 132
    goto :goto_1

    .line 133
    :cond_2
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 134
    .line 135
    .line 136
    move-result-object v5

    .line 137
    :goto_1
    invoke-virtual {v5}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->w()I

    .line 138
    .line 139
    .line 140
    move-result v5

    .line 141
    iget v6, v2, Lcom/p1/mobile/putong/core/data/MembershipUpgradeDurationInfo;->count:I

    .line 142
    .line 143
    if-ne v5, v6, :cond_1

    .line 144
    .line 145
    iget-object v5, p0, Ll/q3p;->j:Ljava/util/List;

    .line 146
    .line 147
    invoke-interface {v5, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 148
    .line 149
    .line 150
    goto :goto_0

    .line 151
    :cond_3
    iget-object v0, p0, Ll/q3p;->j:Ljava/util/List;

    .line 152
    .line 153
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    const/4 v1, 0x0

    .line 158
    if-nez v0, :cond_6

    .line 159
    .line 160
    iget-object v0, p0, Ll/q3p;->i:Ljava/util/List;

    .line 161
    .line 162
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    check-cast v0, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 167
    .line 168
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    iget-object v2, p0, Ll/q3p;->i:Ljava/util/List;

    .line 173
    .line 174
    if-eqz v0, :cond_4

    .line 175
    .line 176
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 177
    .line 178
    .line 179
    move-result-object v0

    .line 180
    check-cast v0, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 181
    .line 182
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    goto :goto_2

    .line 187
    :cond_4
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 188
    .line 189
    .line 190
    move-result-object v0

    .line 191
    check-cast v0, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 192
    .line 193
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 194
    .line 195
    .line 196
    move-result-object v0

    .line 197
    :goto_2
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->k()Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object v0

    .line 201
    iget-object v2, p0, Ll/q3p;->j:Ljava/util/List;

    .line 202
    .line 203
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 204
    .line 205
    .line 206
    move-result-object v2

    .line 207
    :goto_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 208
    .line 209
    .line 210
    move-result v3

    .line 211
    if-eqz v3, :cond_6

    .line 212
    .line 213
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 214
    .line 215
    .line 216
    move-result-object v3

    .line 217
    check-cast v3, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 218
    .line 219
    invoke-virtual {v3, v1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->v(Z)V

    .line 220
    .line 221
    .line 222
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 223
    .line 224
    .line 225
    move-result-object v4

    .line 226
    if-nez v4, :cond_5

    .line 227
    .line 228
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 229
    .line 230
    .line 231
    move-result-object v3

    .line 232
    invoke-virtual {v3, v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->V(Ljava/lang/String;)V

    .line 233
    .line 234
    .line 235
    goto :goto_3

    .line 236
    :cond_5
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 237
    .line 238
    .line 239
    move-result-object v3

    .line 240
    invoke-virtual {v3, v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->V(Ljava/lang/String;)V

    .line 241
    .line 242
    .line 243
    goto :goto_3

    .line 244
    :cond_6
    iget-object v0, p0, Ll/q3p;->j:Ljava/util/List;

    .line 245
    .line 246
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 247
    .line 248
    .line 249
    move-result v0

    .line 250
    if-nez v0, :cond_8

    .line 251
    .line 252
    iget-object v0, p0, Ll/q3p;->i:Ljava/util/List;

    .line 253
    .line 254
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 255
    .line 256
    .line 257
    move-result-object v0

    .line 258
    check-cast v0, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 259
    .line 260
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->c()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 261
    .line 262
    .line 263
    move-result-object v0

    .line 264
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 265
    .line 266
    const-string v2, "tttSvipGoogleplayFreeTrial"

    .line 267
    .line 268
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 269
    .line 270
    .line 271
    move-result v0

    .line 272
    if-nez v0, :cond_8

    .line 273
    .line 274
    iget-object v0, p0, Ll/q3p;->i:Ljava/util/List;

    .line 275
    .line 276
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 277
    .line 278
    .line 279
    move-result-object v0

    .line 280
    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 281
    .line 282
    .line 283
    move-result v2

    .line 284
    if-eqz v2, :cond_7

    .line 285
    .line 286
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 287
    .line 288
    .line 289
    move-result-object v2

    .line 290
    check-cast v2, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 291
    .line 292
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->v(Z)V

    .line 293
    .line 294
    .line 295
    goto :goto_4

    .line 296
    :cond_7
    iget-object v0, p0, Ll/q3p;->j:Ljava/util/List;

    .line 297
    .line 298
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 299
    .line 300
    .line 301
    move-result-object v0

    .line 302
    check-cast v0, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 303
    .line 304
    const/4 v2, 0x1

    .line 305
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->v(Z)V

    .line 306
    .line 307
    .line 308
    iget-object v0, p0, Ll/q3p;->a:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;

    .line 309
    .line 310
    iget-object v2, p0, Ll/q3p;->d:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 311
    .line 312
    iget-object p0, p0, Ll/q3p;->j:Ljava/util/List;

    .line 313
    .line 314
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 315
    .line 316
    .line 317
    move-result-object p0

    .line 318
    check-cast p0, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 319
    .line 320
    invoke-virtual {v0, v2, p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;->U4(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/ui/purchase/d;)V

    .line 321
    .line 322
    .line 323
    :cond_8
    return-void
.end method

.method public k(Ljava/util/List;Ljava/util/List;)V
    .locals 0
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
    iput-object p1, p0, Ll/q3p;->b:Ljava/util/List;

    .line 2
    .line 3
    iput-object p2, p0, Ll/q3p;->c:Ljava/util/List;

    .line 4
    .line 5
    return-void
.end method
