.class public Ll/wl40;
.super Ll/ip0;
.source "SourceFile"


# static fields
.field public static E:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static F:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public A:Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeTip;

.field public B:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;"
        }
    .end annotation
.end field

.field public C:Z

.field public D:Z

.field public p:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public q:Ljava/lang/String;

.field public r:Ll/kcg0;

.field public s:I

.field public t:I

.field public u:I

.field public v:I

.field public w:Ll/kcg0;

.field public x:Ll/kcg0;

.field public y:Landroid/view/View;

.field public z:Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Ll/wl40;->E:Lrx/subjects/a;

    .line 6
    .line 7
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sput-object v0, Ll/wl40;->F:Lrx/subjects/b;

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 21
    invoke-direct {p0, p1, p2}, Ll/ip0;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    const/4 p1, -0x1

    .line 22
    iput p1, p0, Ll/wl40;->s:I

    .line 23
    iput p1, p0, Ll/wl40;->t:I

    .line 24
    iput p1, p0, Ll/wl40;->u:I

    .line 25
    iput p1, p0, Ll/wl40;->v:I

    const/4 p1, 0x0

    .line 26
    iput-boolean p1, p0, Ll/wl40;->D:Z

    .line 27
    iput-object p2, p0, Ll/wl40;->p:Lcom/p1/mobile/putong/core/data/PurchaseType;

    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/ip0;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, -0x1

    .line 5
    iput p1, p0, Ll/wl40;->s:I

    .line 6
    .line 7
    iput p1, p0, Ll/wl40;->t:I

    .line 8
    .line 9
    iput p1, p0, Ll/wl40;->u:I

    .line 10
    .line 11
    iput p1, p0, Ll/wl40;->v:I

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    iput-boolean p1, p0, Ll/wl40;->D:Z

    .line 15
    .line 16
    iput-object p2, p0, Ll/wl40;->p:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 17
    .line 18
    iput-object p3, p0, Ll/wl40;->q:Ljava/lang/String;

    .line 19
    .line 20
    return-void
.end method

.method public static synthetic M(Ll/wl40;Ljava/lang/Boolean;Lcom/p1/mobile/putong/core/ui/purchase/d;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/wl40;->W(Ljava/lang/Boolean;Lcom/p1/mobile/putong/core/ui/purchase/d;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic N(Ll/wl40;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wl40;->U(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic O(Ll/wl40;Lkotlin/Unit;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wl40;->T(Lkotlin/Unit;)V

    return-void
.end method

.method public static synthetic P(Ll/wl40;Ljava/util/List;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/wl40;->V(Ljava/util/List;Ljava/lang/Integer;)V

    return-void
.end method

.method private Y()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wl40;->w:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/ip0;->a:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    sget-object v1, Ll/wl40;->E:Lrx/subjects/a;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/vl40;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/vl40;-><init>(Ll/wl40;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Ll/wl40;->w:Ll/kcg0;

    .line 28
    .line 29
    return-void
.end method

.method private Z(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/t7a;->c()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Xi()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 22
    .line 23
    iget-object v1, p0, Ll/wl40;->p:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 24
    .line 25
    if-ne v0, v1, :cond_0

    .line 26
    .line 27
    iget-object v0, p0, Ll/wl40;->r:Ll/kcg0;

    .line 28
    .line 29
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/ip0;->a:Lcom/p1/mobile/android/app/Act;

    .line 33
    .line 34
    invoke-static {}, Ll/ijj;->c()Ll/ijj;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    iget-object v1, v1, Ll/ijj;->b:Lrx/subjects/a;

    .line 39
    .line 40
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-virtual {v1, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    new-instance v1, Ll/ul40;

    .line 53
    .line 54
    invoke-direct {v1, p0, p1}, Ll/ul40;-><init>(Ll/wl40;Ljava/util/List;)V

    .line 55
    .line 56
    .line 57
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {v0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    iput-object p1, p0, Ll/wl40;->r:Ll/kcg0;

    .line 66
    .line 67
    :cond_0
    return-void
.end method

.method private b0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wl40;->B:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/wl40;->A:Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeTip;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v1, p0, Ll/wl40;->B:Ljava/util/List;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeTip;->Q(Ljava/util/List;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-boolean v0, p0, Ll/wl40;->C:Z

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/wl40;->g0(Z)V

    .line 21
    .line 22
    .line 23
    return-void
.end method


# virtual methods
.method public C(Lcom/p1/mobile/putong/core/ui/purchase/d;)V
    .locals 0

    .line 1
    return-void
.end method

.method public D()V
    .locals 0

    .line 1
    return-void
.end method

.method public E(Lcom/p1/mobile/putong/core/ui/purchase/d;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/ip0;->E(Lcom/p1/mobile/putong/core/ui/purchase/d;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/wl40;->z:Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    iget-object p1, p0, Ll/wl40;->B:Ljava/util/List;

    .line 9
    .line 10
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-nez p1, :cond_0

    .line 15
    .line 16
    iget-boolean p1, p0, Ll/wl40;->C:Z

    .line 17
    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    const/4 p1, 0x0

    .line 21
    iput-boolean p1, p0, Ll/wl40;->C:Z

    .line 22
    .line 23
    iget-object p0, p0, Ll/wl40;->z:Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->l(Z)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public F(Lcom/p1/mobile/putong/core/ui/purchase/showcase/AbsPurchaseSectionView;Lcom/p1/mobile/putong/core/ui/purchase/d;Z)V
    .locals 1

    .line 1
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->m()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    :goto_0
    if-eqz p0, :cond_1

    .line 17
    .line 18
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->m()Z

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    const/4 v0, 0x0

    .line 23
    invoke-virtual {p1, p3, p2, p0, v0}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/AbsPurchaseSectionView;->b(ZZLcom/p1/mobile/putong/core/ui/purchase/d$a;Lcom/p1/mobile/putong/data/PayMethod;)V

    .line 24
    .line 25
    .line 26
    :cond_1
    return-void
.end method

.method public final Q()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wl40;->x:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/ip0;->a:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    sget-object v1, Ll/wl40;->F:Lrx/subjects/b;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/sl40;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/sl40;-><init>(Ll/wl40;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Ll/wl40;->x:Ll/kcg0;

    .line 28
    .line 29
    return-void
.end method

.method public R(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/wl40;->z:Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/ip0;->a:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget v1, Ll/rec0;->m0:I

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    check-cast p1, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;

    .line 19
    .line 20
    iput-object p1, p0, Ll/wl40;->z:Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;

    .line 21
    .line 22
    :cond_0
    iget-object p0, p0, Ll/wl40;->z:Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;

    .line 23
    .line 24
    return-object p0
.end method

.method public S(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/wl40;->A:Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeTip;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/ip0;->a:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget v1, Ll/rec0;->n0:I

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    check-cast p1, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeTip;

    .line 19
    .line 20
    iput-object p1, p0, Ll/wl40;->A:Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeTip;

    .line 21
    .line 22
    :cond_0
    iget-object p0, p0, Ll/wl40;->A:Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeTip;

    .line 23
    .line 24
    return-object p0
.end method

.method public final synthetic T(Lkotlin/Unit;)V
    .locals 4

    .line 1
    iget-object p1, p0, Ll/wl40;->B:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_4

    .line 8
    .line 9
    iget-object p1, p0, Ll/wl40;->z:Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;

    .line 10
    .line 11
    if-eqz p1, :cond_4

    .line 12
    .line 13
    iget-boolean p1, p0, Ll/wl40;->C:Z

    .line 14
    .line 15
    if-nez p1, :cond_4

    .line 16
    .line 17
    iget-object p1, p0, Ll/ip0;->g:Ljava/util/List;

    .line 18
    .line 19
    if-eqz p1, :cond_4

    .line 20
    .line 21
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    const/4 v1, 0x0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->v(Z)V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    iget-object p1, p0, Ll/wl40;->B:Ljava/util/List;

    .line 43
    .line 44
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    check-cast p1, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 49
    .line 50
    iget-object v0, p0, Ll/wl40;->B:Ljava/util/List;

    .line 51
    .line 52
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    if-eqz v2, :cond_2

    .line 61
    .line 62
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    check-cast v2, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 67
    .line 68
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->l()Z

    .line 69
    .line 70
    .line 71
    move-result v3

    .line 72
    if-eqz v3, :cond_1

    .line 73
    .line 74
    move-object p1, v2

    .line 75
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 76
    .line 77
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->G2:Ll/lc9;

    .line 78
    .line 79
    iget-object v0, v0, Ll/lc9;->V:Lrx/subjects/b;

    .line 80
    .line 81
    iget-object v2, p0, Ll/wl40;->p:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 82
    .line 83
    invoke-static {v2, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    invoke-virtual {v0, v2}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 88
    .line 89
    .line 90
    iget-object v0, p0, Ll/ip0;->e:Ll/y20;

    .line 91
    .line 92
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    if-eqz v0, :cond_3

    .line 97
    .line 98
    iget-object v0, p0, Ll/ip0;->e:Ll/y20;

    .line 99
    .line 100
    invoke-interface {v0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 101
    .line 102
    .line 103
    :cond_3
    const/4 p1, 0x1

    .line 104
    iput-boolean p1, p0, Ll/wl40;->C:Z

    .line 105
    .line 106
    invoke-virtual {p0, v1}, Ll/ip0;->m(Z)V

    .line 107
    .line 108
    .line 109
    iget-object p0, p0, Ll/wl40;->z:Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;

    .line 110
    .line 111
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->l(Z)V

    .line 112
    .line 113
    .line 114
    :cond_4
    return-void
.end method

.method public final synthetic U(Ljava/lang/Integer;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ip0;->g:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

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
    if-le v0, v1, :cond_2

    .line 14
    .line 15
    iget-object v0, p0, Ll/ip0;->g:Ljava/util/List;

    .line 16
    .line 17
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    check-cast p1, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 26
    .line 27
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->m()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    goto :goto_0

    .line 38
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    :goto_0
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-eqz v1, :cond_1

    .line 47
    .line 48
    const-string v1, ""

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->e0(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->l()Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_2

    .line 58
    .line 59
    invoke-virtual {p0, p1}, Ll/ip0;->L(Lcom/p1/mobile/putong/core/ui/purchase/d;)V

    .line 60
    .line 61
    .line 62
    :cond_2
    return-void
.end method

.method public final synthetic V(Ljava/util/List;Ljava/lang/Integer;)V
    .locals 6

    .line 1
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    const/4 v0, 0x0

    .line 6
    const/4 v1, 0x0

    .line 7
    move v2, v1

    .line 8
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result v3

    .line 12
    if-ge v2, v3, :cond_3

    .line 13
    .line 14
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    check-cast v3, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 19
    .line 20
    const/4 v4, 0x1

    .line 21
    if-ne v2, p2, :cond_0

    .line 22
    .line 23
    move v5, v4

    .line 24
    goto :goto_1

    .line 25
    :cond_0
    move v5, v1

    .line 26
    :goto_1
    invoke-virtual {v3, v5}, Lcom/p1/mobile/putong/core/ui/purchase/d;->v(Z)V

    .line 27
    .line 28
    .line 29
    if-ne v2, p2, :cond_1

    .line 30
    .line 31
    goto :goto_2

    .line 32
    :cond_1
    move v4, v1

    .line 33
    :goto_2
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/core/ui/purchase/d;->q(Z)V

    .line 34
    .line 35
    .line 36
    if-ne v2, p2, :cond_2

    .line 37
    .line 38
    move-object v0, v3

    .line 39
    :cond_2
    add-int/lit8 v2, v2, 0x1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_3
    if-eqz v0, :cond_4

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Ll/ip0;->L(Lcom/p1/mobile/putong/core/ui/purchase/d;)V

    .line 45
    .line 46
    .line 47
    :cond_4
    return-void
.end method

.method public final synthetic W(Ljava/lang/Boolean;Lcom/p1/mobile/putong/core/ui/purchase/d;Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p1, p0, Ll/ip0;->e:Ll/y20;

    .line 8
    .line 9
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_1

    .line 14
    .line 15
    iget-object p0, p0, Ll/ip0;->e:Ll/y20;

    .line 16
    .line 17
    invoke-interface {p0, p2}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    iget-boolean p1, p0, Ll/wl40;->C:Z

    .line 22
    .line 23
    if-eqz p1, :cond_2

    .line 24
    .line 25
    iget-object p1, p0, Ll/ip0;->f:Ll/y20;

    .line 26
    .line 27
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_1

    .line 32
    .line 33
    iget-object p0, p0, Ll/ip0;->f:Ll/y20;

    .line 34
    .line 35
    invoke-interface {p0, p2}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    :cond_1
    return-void

    .line 39
    :cond_2
    iget-object p1, p0, Ll/ip0;->g:Ljava/util/List;

    .line 40
    .line 41
    const/4 p3, 0x0

    .line 42
    if-eqz p1, :cond_3

    .line 43
    .line 44
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_3

    .line 53
    .line 54
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    check-cast v0, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 59
    .line 60
    invoke-virtual {v0, p3}, Lcom/p1/mobile/putong/core/ui/purchase/d;->v(Z)V

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_3
    iget-object p1, p0, Ll/ip0;->e:Ll/y20;

    .line 65
    .line 66
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    if-eqz p1, :cond_4

    .line 71
    .line 72
    iget-object p1, p0, Ll/ip0;->e:Ll/y20;

    .line 73
    .line 74
    invoke-interface {p1, p2}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 75
    .line 76
    .line 77
    :cond_4
    const/4 p1, 0x1

    .line 78
    iput-boolean p1, p0, Ll/wl40;->C:Z

    .line 79
    .line 80
    invoke-virtual {p0, p3}, Ll/ip0;->m(Z)V

    .line 81
    .line 82
    .line 83
    iget-object p0, p0, Ll/wl40;->z:Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;

    .line 84
    .line 85
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->l(Z)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public X(Ljava/util/List;Ll/y20;Ll/y20;Ll/y20;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Ll/ip0;->f(Ljava/util/List;Ll/y20;Ll/y20;Ll/y20;)V

    .line 2
    .line 3
    .line 4
    iput-object p5, p0, Ll/wl40;->B:Ljava/util/List;

    .line 5
    .line 6
    invoke-static {p5}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 7
    .line 8
    .line 9
    move-result p2

    .line 10
    const/4 p3, 0x0

    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    iput-boolean p3, p0, Ll/wl40;->C:Z

    .line 14
    .line 15
    :cond_0
    iget-boolean p2, p0, Ll/wl40;->D:Z

    .line 16
    .line 17
    if-nez p2, :cond_2

    .line 18
    .line 19
    const/4 p2, 0x1

    .line 20
    iput-boolean p2, p0, Ll/wl40;->D:Z

    .line 21
    .line 22
    invoke-static {p5}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 23
    .line 24
    .line 25
    move-result p4

    .line 26
    if-nez p4, :cond_2

    .line 27
    .line 28
    invoke-interface {p1, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p4

    .line 32
    check-cast p4, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 33
    .line 34
    invoke-virtual {p4}, Lcom/p1/mobile/putong/core/ui/purchase/d;->c()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 35
    .line 36
    .line 37
    move-result-object p4

    .line 38
    iget-object p4, p4, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 39
    .line 40
    const-string v0, "tttSvipGoogleplayFreeTrial"

    .line 41
    .line 42
    invoke-static {p4, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 43
    .line 44
    .line 45
    move-result p4

    .line 46
    if-nez p4, :cond_2

    .line 47
    .line 48
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 49
    .line 50
    .line 51
    move-result-object p4

    .line 52
    :goto_0
    invoke-interface {p4}, Ljava/util/Iterator;->hasNext()Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-eqz v0, :cond_1

    .line 57
    .line 58
    invoke-interface {p4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    check-cast v0, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 63
    .line 64
    invoke-virtual {v0, p3}, Lcom/p1/mobile/putong/core/ui/purchase/d;->v(Z)V

    .line 65
    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_1
    iput-boolean p2, p0, Ll/wl40;->C:Z

    .line 69
    .line 70
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 71
    .line 72
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->G2:Ll/lc9;

    .line 73
    .line 74
    iget-object p2, p2, Ll/lc9;->V:Lrx/subjects/b;

    .line 75
    .line 76
    iget-object p4, p0, Ll/wl40;->p:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 77
    .line 78
    invoke-interface {p5, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object p3

    .line 82
    check-cast p3, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 83
    .line 84
    invoke-static {p4, p3}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 85
    .line 86
    .line 87
    move-result-object p3

    .line 88
    invoke-virtual {p2, p3}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 89
    .line 90
    .line 91
    :cond_2
    invoke-direct {p0, p1}, Ll/wl40;->Z(Ljava/util/List;)V

    .line 92
    .line 93
    .line 94
    invoke-direct {p0}, Ll/wl40;->Y()V

    .line 95
    .line 96
    .line 97
    invoke-virtual {p0}, Ll/wl40;->a0()V

    .line 98
    .line 99
    .line 100
    invoke-direct {p0}, Ll/wl40;->b0()V

    .line 101
    .line 102
    .line 103
    invoke-virtual {p0}, Ll/wl40;->Q()V

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method public a(Landroid/view/ViewGroup;Z)Landroid/view/View;
    .locals 2

    .line 1
    new-instance p1, Landroid/widget/LinearLayout;

    .line 2
    .line 3
    iget-object p2, p0, Ll/ip0;->a:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-direct {p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;

    .line 9
    .line 10
    const/4 v0, -0x1

    .line 11
    const/4 v1, -0x2

    .line 12
    invoke-direct {p2, v0, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 16
    .line 17
    .line 18
    const/4 p2, 0x0

    .line 19
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 23
    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, p1}, Ll/wl40;->R(Landroid/view/ViewGroup;)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {p0, v0}, Ll/ip0;->B(Landroid/view/View;)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Ll/ip0;->q()Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {p0, v0}, Ll/ip0;->B(Landroid/view/View;)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0, p1}, Ll/wl40;->S(Landroid/view/ViewGroup;)Landroid/view/View;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {p0, v0}, Ll/ip0;->B(Landroid/view/View;)Landroid/view/View;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Ll/wl40;->z:Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;

    .line 63
    .line 64
    invoke-static {v0, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0, p2}, Ll/wl40;->g0(Z)V

    .line 68
    .line 69
    .line 70
    return-object p1
.end method

.method public final a0()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/wl40;->z:Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Ll/wl40;->B:Ljava/util/List;

    .line 7
    .line 8
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iget-object v1, p0, Ll/wl40;->z:Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    const/4 p0, 0x0

    .line 17
    invoke-static {v1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_1
    const/4 v0, 0x1

    .line 22
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/wl40;->z:Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;

    .line 26
    .line 27
    iget-object v1, p0, Ll/wl40;->p:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 28
    .line 29
    iget-boolean v2, p0, Ll/wl40;->C:Z

    .line 30
    .line 31
    iget-object v3, p0, Ll/wl40;->B:Ljava/util/List;

    .line 32
    .line 33
    new-instance v4, Ll/tl40;

    .line 34
    .line 35
    invoke-direct {v4, p0}, Ll/tl40;-><init>(Ll/wl40;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->m(Lcom/p1/mobile/putong/core/data/PurchaseType;ZLjava/util/List;Ll/a30;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public b()V
    .locals 0

    .line 1
    return-void
.end method

.method public c(Ll/x80;)V
    .locals 0

    .line 1
    return-void
.end method

.method public c0(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/wl40;->v:I

    .line 2
    .line 3
    return-void
.end method

.method public d()Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public d0(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/wl40;->t:I

    .line 2
    .line 3
    return-void
.end method

.method public e(Lcom/p1/mobile/putong/data/PayMethod;)V
    .locals 0

    .line 1
    return-void
.end method

.method public e0(IIII)V
    .locals 0

    .line 1
    iput p1, p0, Ll/wl40;->t:I

    .line 2
    .line 3
    iput p2, p0, Ll/wl40;->s:I

    .line 4
    .line 5
    iput p3, p0, Ll/wl40;->u:I

    .line 6
    .line 7
    iput p4, p0, Ll/wl40;->v:I

    .line 8
    .line 9
    return-void
.end method

.method public f(Ljava/util/List;Ll/y20;Ll/y20;Ll/y20;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v5, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move-object v2, p2

    .line 5
    move-object v3, p3

    .line 6
    move-object v4, p4

    .line 7
    invoke-virtual/range {v0 .. v5}, Ll/wl40;->X(Ljava/util/List;Ll/y20;Ll/y20;Ll/y20;Ljava/util/List;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public f0(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/wl40;->u:I

    .line 2
    .line 3
    return-void
.end method

.method public g0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wl40;->A:Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeTip;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public o(Lcom/p1/mobile/putong/core/ui/purchase/d;Landroid/view/ViewGroup;)Lcom/p1/mobile/putong/core/ui/purchase/showcase/AbsPurchaseSectionView;
    .locals 2

    .line 1
    iget-object p1, p0, Ll/ip0;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    sget v0, Ll/rec0;->l0:I

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    check-cast p1, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseSectionView;

    .line 15
    .line 16
    iget-object p0, p0, Ll/wl40;->q:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/AbsPurchaseSectionView;->setFrom(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-object p1
.end method

.method public p()Landroid/view/View;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wl40;->y:Landroid/view/View;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/d8n;

    .line 6
    .line 7
    iget-object v1, p0, Ll/ip0;->a:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ll/d8n;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0}, Ll/d8n;->b()Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Ll/ip0;->B(Landroid/view/View;)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Ll/wl40;->y:Landroid/view/View;

    .line 21
    .line 22
    :cond_0
    iget-object p0, p0, Ll/wl40;->y:Landroid/view/View;

    .line 23
    .line 24
    return-object p0
.end method

.method public r()I
    .locals 0

    .line 1
    iget p0, p0, Ll/wl40;->v:I

    .line 2
    .line 3
    return p0
.end method

.method public release()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/ip0;->release()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/wl40;->r:Ll/kcg0;

    .line 5
    .line 6
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/wl40;->w:Ll/kcg0;

    .line 10
    .line 11
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/wl40;->x:Ll/kcg0;

    .line 15
    .line 16
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public s()I
    .locals 2

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
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->qq()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/wl40;->q:Ljava/lang/String;

    .line 16
    .line 17
    const-string v1, "form_sub"

    .line 18
    .line 19
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    sget p0, Ll/qa00;->i:I

    .line 26
    .line 27
    return p0

    .line 28
    :cond_0
    invoke-super {p0}, Ll/ip0;->s()I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    return p0
.end method

.method public t()I
    .locals 2

    .line 1
    iget v0, p0, Ll/wl40;->t:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-eq v0, v1, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    invoke-super {p0}, Ll/ip0;->t()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public v()I
    .locals 2

    .line 1
    iget v0, p0, Ll/wl40;->u:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-eq v0, v1, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    invoke-super {p0}, Ll/ip0;->v()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public w()I
    .locals 1

    .line 1
    iget v0, p0, Ll/wl40;->s:I

    .line 2
    .line 3
    if-ltz v0, :cond_0

    .line 4
    .line 5
    return v0

    .line 6
    :cond_0
    invoke-super {p0}, Ll/ip0;->w()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method
