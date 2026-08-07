.class public Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;
.super Lv/VScroll_Fill_BottomAligned;
.source "SourceFile"


# instance fields
.field public A:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;"
        }
    .end annotation
.end field

.field public B:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/PayMethod;",
            ">;"
        }
    .end annotation
.end field

.field public C:Z

.field public D:Ll/z20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z20<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public E:Z

.field public f:Landroid/widget/LinearLayout;

.field public g:Z

.field public h:Lcom/p1/mobile/android/app/Act;

.field public i:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public j:Ljava/lang/String;

.field public k:Ll/a30;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/a30<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public l:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ">;"
        }
    .end annotation
.end field

.field public m:Ll/l3m;

.field public n:Ll/t5m;

.field public o:Ll/i2m;

.field public p:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/a690;",
            ">;"
        }
    .end annotation
.end field

.field public q:Ll/kcg0;

.field public r:Ll/kcg0;

.field public s:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public t:Lcom/p1/mobile/putong/data/PayMethod;

.field public u:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public v:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;>;"
        }
    .end annotation
.end field

.field public w:Lcom/p1/mobile/putong/core/data/Privilege;

.field public x:Ll/l4g0;

.field public y:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public z:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 45
    invoke-direct {p0, p1}, Lv/VScroll_Fill_BottomAligned;-><init>(Landroid/content/Context;)V

    .line 46
    invoke-static {}, Ll/vnb;->q1()Z

    move-result v0

    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->g:Z

    .line 47
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->v:Lrx/subjects/a;

    .line 48
    new-instance v0, Ll/xjb0;

    invoke-direct {v0, p0}, Ll/xjb0;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;)V

    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->z:Ll/y20;

    .line 49
    new-instance v0, Ll/ikb0;

    invoke-direct {v0, p0}, Ll/ikb0;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;)V

    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->A:Ll/y20;

    .line 50
    new-instance v0, Ll/kkb0;

    invoke-direct {v0, p0}, Ll/kkb0;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;)V

    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->B:Ll/y20;

    const/4 v0, 0x0

    .line 51
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->E:Z

    .line 52
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->h:Lcom/p1/mobile/android/app/Act;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Lv/VScroll_Fill_BottomAligned;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/vnb;->q1()Z

    .line 5
    .line 6
    .line 7
    move-result p2

    .line 8
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->g:Z

    .line 9
    .line 10
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->v:Lrx/subjects/a;

    .line 15
    .line 16
    new-instance p2, Ll/xjb0;

    .line 17
    .line 18
    invoke-direct {p2, p0}, Ll/xjb0;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;)V

    .line 19
    .line 20
    .line 21
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->z:Ll/y20;

    .line 22
    .line 23
    new-instance p2, Ll/ikb0;

    .line 24
    .line 25
    invoke-direct {p2, p0}, Ll/ikb0;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;)V

    .line 26
    .line 27
    .line 28
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->A:Ll/y20;

    .line 29
    .line 30
    new-instance p2, Ll/kkb0;

    .line 31
    .line 32
    invoke-direct {p2, p0}, Ll/kkb0;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;)V

    .line 33
    .line 34
    .line 35
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->B:Ll/y20;

    .line 36
    .line 37
    const/4 p2, 0x0

    .line 38
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->E:Z

    .line 39
    .line 40
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 41
    .line 42
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->h:Lcom/p1/mobile/android/app/Act;

    .line 43
    .line 44
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 53
    invoke-direct {p0, p1, p2, p3}, Lv/VScroll_Fill_BottomAligned;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 54
    invoke-static {}, Ll/vnb;->q1()Z

    move-result p2

    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->g:Z

    .line 55
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    move-result-object p2

    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->v:Lrx/subjects/a;

    .line 56
    new-instance p2, Ll/xjb0;

    invoke-direct {p2, p0}, Ll/xjb0;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;)V

    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->z:Ll/y20;

    .line 57
    new-instance p2, Ll/ikb0;

    invoke-direct {p2, p0}, Ll/ikb0;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;)V

    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->A:Ll/y20;

    .line 58
    new-instance p2, Ll/kkb0;

    invoke-direct {p2, p0}, Ll/kkb0;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;)V

    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->B:Ll/y20;

    const/4 p2, 0x0

    .line 59
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->E:Z

    .line 60
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->h:Lcom/p1/mobile/android/app/Act;

    return-void
.end method

.method public static bridge synthetic A(Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;)Ll/i2m;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->o:Ll/i2m;

    return-object p0
.end method

.method public static bridge synthetic B(Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;)Ll/t5m;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->n:Ll/t5m;

    return-object p0
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;ZZ)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->T(ZZ)V

    return-void
.end method

.method public static synthetic h(Ljava/util/List;)Ljava/lang/Boolean;
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

.method public static synthetic i(Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->U(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;Lcom/p1/mobile/putong/core/ui/purchase/d;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->K(Lcom/p1/mobile/putong/core/ui/purchase/d;)V

    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;Ljava/util/List;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->Q(Ljava/util/List;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->S(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic m(Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->P(Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/util/List;)V

    return-void
.end method

.method public static synthetic n(Ljava/util/List;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public static synthetic o(Lcom/p1/mobile/putong/core/data/ProductCategory;)Lrx/c;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->K5()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->M(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic q(Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 4
    .line 5
    const/4 v0, 0x3

    .line 6
    if-ne p0, v0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic r(Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->R(Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/util/List;)V

    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;Lcom/p1/mobile/putong/core/ui/purchase/d;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->J(Lcom/p1/mobile/putong/core/ui/purchase/d;)V

    return-void
.end method

.method public static synthetic t(Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->N()V

    return-void
.end method

.method public static synthetic u(Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;Ljava/util/List;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->O(Ljava/util/List;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic v(Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;Lcom/google/common/base/Optional;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->H(Lcom/google/common/base/Optional;)V

    return-void
.end method

.method public static synthetic w(Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;Lcom/p1/mobile/putong/data/PayMethod;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->L(Lcom/p1/mobile/putong/data/PayMethod;)V

    return-void
.end method

.method public static synthetic x(Lcom/p1/mobile/putong/core/data/ProductCategory;)Lrx/c;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->y5(Lcom/p1/mobile/putong/core/data/ProductCategory;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic y(Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->I(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic z(Ljava/util/List;Ljava/util/List;)Ljava/util/List;
    .locals 3

    .line 1
    if-eqz p0, :cond_2

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_2

    .line 8
    .line 9
    if-eqz p1, :cond_2

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_2

    .line 16
    .line 17
    new-instance v0, Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 20
    .line 21
    .line 22
    new-instance p0, Ll/fkb0;

    .line 23
    .line 24
    invoke-direct {p0}, Ll/fkb0;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-static {p1, p0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    check-cast p0, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 32
    .line 33
    if-eqz p0, :cond_1

    .line 34
    .line 35
    const/4 p1, 0x0

    .line 36
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-ge p1, v1, :cond_1

    .line 41
    .line 42
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    if-eqz v1, :cond_0

    .line 47
    .line 48
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    check-cast v1, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 53
    .line 54
    iget v1, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 55
    .line 56
    const/4 v2, 0x3

    .line 57
    if-ne v1, v2, :cond_0

    .line 58
    .line 59
    invoke-interface {v0, p1, p0}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    return-object v0

    .line 63
    :cond_0
    add-int/lit8 p1, p1, 0x1

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_1
    return-object v0

    .line 67
    :cond_2
    return-object p0
.end method


# virtual methods
.method public final C()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->m:Ll/l3m;

    .line 2
    .line 3
    instance-of v1, v0, Ll/ihj;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    check-cast v0, Ll/ihj;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/ihj;->j()V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->n:Ll/t5m;

    .line 13
    .line 14
    instance-of v0, p0, Ll/wl40;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    check-cast p0, Ll/wl40;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/ip0;->q()Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const/4 v0, 0x0

    .line 25
    invoke-static {p0, v0}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void
.end method

.method public D(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->n:Ll/t5m;

    .line 2
    .line 3
    instance-of v0, p0, Ll/fl40;

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    check-cast p0, Ll/fl40;

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    sget-object p1, Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;->checked:Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;->unchecked:Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;

    .line 19
    .line 20
    :goto_0
    invoke-virtual {p0, p1}, Ll/fl40;->y(Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    return-void
.end method

.method public E(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->i:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    invoke-static {v0}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {v0}, Ll/r97;->f()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    const/4 p1, 0x1

    .line 24
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->E:Z

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->n:Ll/t5m;

    .line 27
    .line 28
    instance-of v0, p0, Ll/zul;

    .line 29
    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    check-cast p0, Ll/zul;

    .line 33
    .line 34
    invoke-interface {p0, p1}, Ll/zul;->g(Z)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->E:Z

    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->n:Ll/t5m;

    .line 41
    .line 42
    instance-of v0, p0, Ll/zul;

    .line 43
    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    check-cast p0, Ll/zul;

    .line 47
    .line 48
    invoke-interface {p0, p1}, Ll/zul;->g(Z)V

    .line 49
    .line 50
    .line 51
    :cond_1
    return-void
.end method

.method public final F()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->i:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/PurchaseType;->productCategory()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->h5()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    const-string v1, "svip"

    .line 22
    .line 23
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    invoke-static {v0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/bkb0;

    .line 34
    .line 35
    invoke-direct {v1}, Ll/bkb0;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    new-instance v1, Ll/ckb0;

    .line 43
    .line 44
    invoke-direct {v1, p0}, Ll/ckb0;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;)V

    .line 45
    .line 46
    .line 47
    new-instance v2, Ll/dkb0;

    .line 48
    .line 49
    invoke-direct {v2, p0}, Ll/dkb0;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;)V

    .line 50
    .line 51
    .line 52
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->r:Ll/kcg0;

    .line 61
    .line 62
    :cond_0
    return-void
.end method

.method public G()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->n:Ll/t5m;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->n:Ll/t5m;

    .line 10
    .line 11
    instance-of v0, p0, Ll/fl40;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    check-cast p0, Ll/fl40;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/fl40;->F()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public final synthetic H(Lcom/google/common/base/Optional;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Lcom/google/common/base/Optional;->isPresent()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/google/common/base/Optional;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Lcom/p1/mobile/putong/core/data/RefundDetail;

    .line 12
    .line 13
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/RefundDetail;->totalRefundAmount:D

    .line 14
    .line 15
    const-wide/16 v2, 0x0

    .line 16
    .line 17
    cmpl-double p1, v0, v2

    .line 18
    .line 19
    if-lez p1, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->o:Ll/i2m;

    .line 22
    .line 23
    instance-of p1, p0, Ll/im60;

    .line 24
    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    check-cast p0, Ll/im60;

    .line 28
    .line 29
    invoke-virtual {p0, v0, v1}, Ll/im60;->t0(D)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public final synthetic I(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->o:Ll/i2m;

    .line 2
    .line 3
    instance-of p1, p0, Ll/im60;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    check-cast p0, Ll/im60;

    .line 8
    .line 9
    const-wide/16 v0, 0x0

    .line 10
    .line 11
    invoke-virtual {p0, v0, v1}, Ll/im60;->t0(D)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final synthetic J(Lcom/p1/mobile/putong/core/ui/purchase/d;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->m:Ll/l3m;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->m:Ll/l3m;

    .line 10
    .line 11
    invoke-interface {v0, p1}, Ll/l3m;->b(Lcom/p1/mobile/putong/core/ui/purchase/d;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->o:Ll/i2m;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->o:Ll/i2m;

    .line 23
    .line 24
    invoke-interface {v0, p1}, Ll/i2m;->b(Lcom/p1/mobile/putong/core/ui/purchase/d;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->o:Ll/i2m;

    .line 28
    .line 29
    invoke-interface {p0, p1}, Ll/i2m;->f(Lcom/p1/mobile/putong/core/ui/purchase/d;)V

    .line 30
    .line 31
    .line 32
    :cond_1
    return-void
.end method

.method public final synthetic K(Lcom/p1/mobile/putong/core/ui/purchase/d;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->o:Ll/i2m;

    .line 2
    .line 3
    instance-of p1, p0, Ll/fhj;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    check-cast p0, Ll/fhj;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/fhj;->C0()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public final synthetic L(Lcom/p1/mobile/putong/data/PayMethod;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->t:Lcom/p1/mobile/putong/data/PayMethod;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->n:Ll/t5m;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->n:Ll/t5m;

    .line 12
    .line 13
    invoke-interface {p0, p1}, Ll/t5m;->e(Lcom/p1/mobile/putong/data/PayMethod;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final synthetic M(Ljava/util/List;)V
    .locals 9

    .line 1
    const-string p1, "svipPicksMembership"

    .line 2
    .line 3
    const-string v0, "picksMembership"

    .line 4
    .line 5
    const-string v1, "oDiamond"

    .line 6
    .line 7
    const-string v2, "svip"

    .line 8
    .line 9
    const-string v3, "vip"

    .line 10
    .line 11
    new-instance v4, Lorg/json/JSONObject;

    .line 12
    .line 13
    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 14
    .line 15
    .line 16
    :try_start_0
    const-string v5, "purchaseShowFrom"

    .line 17
    .line 18
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->j:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {v6}, Ll/abb0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v6

    .line 24
    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 25
    .line 26
    .line 27
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->i:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 28
    .line 29
    invoke-virtual {v5}, Lcom/p1/mobile/putong/core/data/PurchaseType;->productCategory()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 30
    .line 31
    .line 32
    move-result-object v5

    .line 33
    const-string v6, "productType"

    .line 34
    .line 35
    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->name()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v7

    .line 39
    invoke-virtual {v4, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 40
    .line 41
    .line 42
    const-string v6, "skuGroup"

    .line 43
    .line 44
    iget-object v7, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->u:Ljava/util/List;

    .line 45
    .line 46
    const-string v8, ","

    .line 47
    .line 48
    invoke-static {v7, v8}, Ll/jyb;->U(Ljava/util/Collection;Ljava/lang/String;)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v7

    .line 52
    invoke-virtual {v4, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 53
    .line 54
    .line 55
    const-string v6, "tooltips_trigger_mode"

    .line 56
    .line 57
    const-string v7, "active"

    .line 58
    .line 59
    invoke-virtual {v4, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 60
    .line 61
    .line 62
    const-string v6, "tooltips_trigger_module"

    .line 63
    .line 64
    const-string v7, "purchase_button"

    .line 65
    .line 66
    invoke-virtual {v4, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 67
    .line 68
    .line 69
    const-string v6, "tooltips_trigger_page"

    .line 70
    .line 71
    const-string v7, "anywhere"

    .line 72
    .line 73
    invoke-virtual {v4, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 74
    .line 75
    .line 76
    const-string v6, "tooltips_trigger_reason"

    .line 77
    .line 78
    const-string v7, "purchase"

    .line 79
    .line 80
    invoke-virtual {v4, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 81
    .line 82
    .line 83
    const-string v6, "tooltips_type"

    .line 84
    .line 85
    const-string v7, "alert"

    .line 86
    .line 87
    invoke-virtual {v4, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 88
    .line 89
    .line 90
    const-string v6, "tooltips_type_ui"

    .line 91
    .line 92
    const-string v7, "alert_self_definition_business_a"

    .line 93
    .line 94
    invoke-virtual {v4, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 95
    .line 96
    .line 97
    invoke-static {}, Ll/tab0;->h()Ll/tab0;

    .line 98
    .line 99
    .line 100
    move-result-object v6

    .line 101
    invoke-virtual {v6, v3}, Ll/tab0;->g(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 102
    .line 103
    .line 104
    move-result-object v6

    .line 105
    invoke-static {v6, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 106
    .line 107
    .line 108
    move-result v6

    .line 109
    if-eqz v6, :cond_0

    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_0
    move-object v2, v3

    .line 113
    :goto_0
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 114
    .line 115
    .line 116
    move-result-object v3

    .line 117
    if-ne v5, v3, :cond_1

    .line 118
    .line 119
    move-object p1, v1

    .line 120
    goto :goto_1

    .line 121
    :cond_1
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    if-ne v5, v1, :cond_2

    .line 126
    .line 127
    move-object p1, v0

    .line 128
    goto :goto_1

    .line 129
    :cond_2
    invoke-static {p1}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    if-ne v5, v0, :cond_3

    .line 134
    .line 135
    goto :goto_1

    .line 136
    :cond_3
    move-object p1, v2

    .line 137
    :goto_1
    const-string v0, "default_product"

    .line 138
    .line 139
    invoke-virtual {v4, v0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 140
    .line 141
    .line 142
    invoke-static {}, Ll/tab0;->h()Ll/tab0;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    invoke-virtual {p1, v5}, Ll/tab0;->p(Lcom/p1/mobile/putong/core/data/ProductCategory;)Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    const-string v0, "default_duration"

    .line 151
    .line 152
    invoke-virtual {v4, v0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 153
    .line 154
    .line 155
    const-string p1, "if_double_tab"

    .line 156
    .line 157
    const/4 v0, 0x1

    .line 158
    invoke-virtual {v4, p1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 159
    .line 160
    .line 161
    const-string p1, "if_discount"

    .line 162
    .line 163
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->C:Z

    .line 164
    .line 165
    invoke-virtual {v4, p1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 166
    .line 167
    .line 168
    const-string p1, "function_type"

    .line 169
    .line 170
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->w:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 171
    .line 172
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->j:Ljava/lang/String;

    .line 173
    .line 174
    invoke-static {v0, v1}, Ll/mib0;->f(Lcom/p1/mobile/putong/core/data/Privilege;Ljava/lang/String;)Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    invoke-virtual {v4, p1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 179
    .line 180
    .line 181
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 182
    .line 183
    .line 184
    move-result-object p1

    .line 185
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 186
    .line 187
    .line 188
    move-result-object p1

    .line 189
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->U()Z

    .line 190
    .line 191
    .line 192
    move-result p1

    .line 193
    if-eqz p1, :cond_4

    .line 194
    .line 195
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 196
    .line 197
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->O0:Lcom/p1/mobile/putong/core/api/CoreAutoPay;

    .line 198
    .line 199
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->w3()Z

    .line 200
    .line 201
    .line 202
    move-result p1

    .line 203
    if-eqz p1, :cond_4

    .line 204
    .line 205
    const-string p1, "yes"

    .line 206
    .line 207
    goto :goto_2

    .line 208
    :catch_0
    move-exception p1

    .line 209
    goto :goto_3

    .line 210
    :cond_4
    const-string p1, "no"

    .line 211
    .line 212
    :goto_2
    const-string v0, "no_secret_payment"

    .line 213
    .line 214
    invoke-virtual {v4, v0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 215
    .line 216
    .line 217
    const-string v0, "user_secret_staus"

    .line 218
    .line 219
    invoke-virtual {v4, v0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 220
    .line 221
    .line 222
    goto :goto_4

    .line 223
    :goto_3
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 224
    .line 225
    .line 226
    :goto_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->x:Ll/l4g0;

    .line 227
    .line 228
    invoke-virtual {p1, v4}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 229
    .line 230
    .line 231
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->x:Ll/l4g0;

    .line 232
    .line 233
    invoke-static {p0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 234
    .line 235
    .line 236
    return-void
.end method

.method public final synthetic N()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->b0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->c0()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->F()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic O(Ljava/util/List;)Lrx/c;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->h:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/cjj;->M(Landroid/content/Context;Ljava/util/List;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic P(Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->Y(Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic Q(Ljava/util/List;)Lrx/c;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->h:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/cjj;->M(Landroid/content/Context;Ljava/util/List;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic R(Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->Y(Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic S(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->s:Ll/y20;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->l:Ll/y20;

    .line 10
    .line 11
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->l:Ll/y20;

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->i:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 20
    .line 21
    invoke-interface {p1, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->s:Ll/y20;

    .line 25
    .line 26
    const/4 p1, 0x4

    .line 27
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    :cond_1
    return-void
.end method

.method public final synthetic T(ZZ)V
    .locals 0

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->i:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 4
    .line 5
    sget-object p1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 6
    .line 7
    if-ne p0, p1, :cond_0

    .line 8
    .line 9
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->R3:I

    .line 10
    .line 11
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final synthetic U(Ljava/util/List;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->n:Ll/t5m;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->z:Ll/y20;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->s:Ll/y20;

    .line 6
    .line 7
    invoke-interface {v0, p1, v1, p0}, Ll/t5m;->h(Ljava/util/List;Ll/y20;Ll/y20;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public V()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->n:Ll/t5m;

    .line 2
    .line 3
    instance-of v0, p0, Ll/fl40;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p0, Ll/fl40;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/fl40;->R()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public W()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->x:Ll/l4g0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->X()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-class v1, Lcom/p1/mobile/putong/core/ui/purchase/f;

    .line 10
    .line 11
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-static {v0, v1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->x:Ll/l4g0;

    .line 20
    .line 21
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->v:Lrx/subjects/a;

    .line 22
    .line 23
    const/4 v1, 0x1

    .line 24
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/mkb0;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/mkb0;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->m:Ll/l3m;

    .line 41
    .line 42
    instance-of v0, p0, Ll/dje0;

    .line 43
    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    check-cast p0, Ll/dje0;

    .line 47
    .line 48
    invoke-virtual {p0}, Ll/dje0;->f()V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_1
    instance-of v0, p0, Ll/t190;

    .line 53
    .line 54
    if-eqz v0, :cond_2

    .line 55
    .line 56
    check-cast p0, Ll/t190;

    .line 57
    .line 58
    invoke-virtual {p0}, Ll/t190;->k()V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_2
    instance-of v0, p0, Ll/oud0;

    .line 63
    .line 64
    if-eqz v0, :cond_3

    .line 65
    .line 66
    check-cast p0, Ll/oud0;

    .line 67
    .line 68
    invoke-virtual {p0}, Ll/oud0;->g()V

    .line 69
    .line 70
    .line 71
    :cond_3
    return-void
.end method

.method public X()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_purchase_page"

    .line 2
    .line 3
    return-object p0
.end method

.method public final Y(Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/ProductCategory;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/zry;->z(Lcom/p1/mobile/putong/core/data/ProductCategory;)Ll/jzl;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->h:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->i:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 8
    .line 9
    invoke-interface {v0, v1, v2, p1, p2}, Ll/jzl;->a(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/util/List;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    new-instance v0, Ll/ekb0;

    .line 14
    .line 15
    invoke-direct {v0}, Ll/ekb0;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-static {p2, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->C:Z

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->e0(Ljava/util/List;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final Z(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->u:Ljava/util/List;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {p1}, Ll/mib0;->j(Ljava/util/List;)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->u:Ljava/util/List;

    .line 10
    .line 11
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->v:Lrx/subjects/a;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public a0(Z)V
    .locals 3

    .line 1
    new-instance v0, Ll/lkb0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/lkb0;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;)V

    .line 4
    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->h:Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    const-wide/16 v1, 0x1f4

    .line 11
    .line 12
    invoke-static {p0, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final b0()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->h:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->i:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->j:Ljava/lang/String;

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    invoke-static {v0, v1, v2, v3, v3}, Ll/pab0;->b(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;ZZ)Ll/l3m;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->m:Ll/l3m;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->f:Landroid/widget/LinearLayout;

    .line 15
    .line 16
    iget-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->g:Z

    .line 17
    .line 18
    invoke-interface {v0, v1, v2}, Ll/l3m;->a(Landroid/view/ViewGroup;Z)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->g:Z

    .line 23
    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->m:Ll/l3m;

    .line 27
    .line 28
    instance-of v2, v1, Ll/t190;

    .line 29
    .line 30
    if-eqz v2, :cond_0

    .line 31
    .line 32
    check-cast v1, Ll/t190;

    .line 33
    .line 34
    invoke-virtual {v1}, Ll/t190;->n()V

    .line 35
    .line 36
    .line 37
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->m:Ll/l3m;

    .line 38
    .line 39
    instance-of v2, v1, Ll/ihj;

    .line 40
    .line 41
    if-eqz v2, :cond_1

    .line 42
    .line 43
    check-cast v1, Ll/ihj;

    .line 44
    .line 45
    invoke-virtual {v1}, Ll/ihj;->i()V

    .line 46
    .line 47
    .line 48
    :cond_1
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-eqz v1, :cond_2

    .line 53
    .line 54
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->f:Landroid/widget/LinearLayout;

    .line 55
    .line 56
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->m:Ll/l3m;

    .line 60
    .line 61
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->p:Ljava/util/List;

    .line 62
    .line 63
    invoke-interface {v0, p0}, Ll/l3m;->c(Ljava/util/List;)V

    .line 64
    .line 65
    .line 66
    :cond_2
    return-void
.end method

.method public final c0()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->i:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/PurchaseType;->productCategory()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {v1}, Ll/zry;->G(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 20
    .line 21
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->y5(Lcom/p1/mobile/putong/core/data/ProductCategory;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 28
    .line 29
    const-string v3, "tttSvipGoogleplayFreeTrial"

    .line 30
    .line 31
    invoke-static {v3}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/api/CoreProduct;->y5(Lcom/p1/mobile/putong/core/data/ProductCategory;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    new-instance v3, Ll/nkb0;

    .line 40
    .line 41
    invoke-direct {v3}, Ll/nkb0;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-static {v1, v2, v3}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    new-instance v2, Ll/okb0;

    .line 49
    .line 50
    invoke-direct {v2}, Ll/okb0;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v1, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    new-instance v2, Ll/pkb0;

    .line 58
    .line 59
    invoke-direct {v2, p0}, Ll/pkb0;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v1, v2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    invoke-virtual {v1, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    new-instance v2, Ll/qkb0;

    .line 75
    .line 76
    invoke-direct {v2, p0, v0}, Ll/qkb0;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;Lcom/p1/mobile/putong/core/data/ProductCategory;)V

    .line 77
    .line 78
    .line 79
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {v1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->q:Ll/kcg0;

    .line 88
    .line 89
    return-void

    .line 90
    :cond_0
    invoke-static {v0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    new-instance v2, Ll/rkb0;

    .line 95
    .line 96
    invoke-direct {v2}, Ll/rkb0;-><init>()V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v1, v2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    new-instance v2, Ll/yjb0;

    .line 104
    .line 105
    invoke-direct {v2}, Ll/yjb0;-><init>()V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v1, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    new-instance v2, Ll/zjb0;

    .line 113
    .line 114
    invoke-direct {v2, p0}, Ll/zjb0;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {v1, v2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    new-instance v2, Ll/akb0;

    .line 122
    .line 123
    invoke-direct {v2, p0, v0}, Ll/akb0;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;Lcom/p1/mobile/putong/core/data/ProductCategory;)V

    .line 124
    .line 125
    .line 126
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    invoke-virtual {v1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->q:Ll/kcg0;

    .line 135
    .line 136
    return-void
.end method

.method public final d0(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->h:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->i:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->j:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0, v1, v2}, Ll/pab0;->a(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;)Ll/i2m;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->o:Ll/i2m;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->f:Landroid/widget/LinearLayout;

    .line 14
    .line 15
    iget-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->g:Z

    .line 16
    .line 17
    invoke-interface {v0, v1, v2}, Ll/i2m;->a(Landroid/view/ViewGroup;Z)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_3

    .line 26
    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->o:Ll/i2m;

    .line 28
    .line 29
    instance-of v1, v1, Ll/fhj;

    .line 30
    .line 31
    if-eqz v1, :cond_1

    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->n:Ll/t5m;

    .line 34
    .line 35
    instance-of v2, v1, Ll/wl40;

    .line 36
    .line 37
    if-eqz v2, :cond_0

    .line 38
    .line 39
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->z:Ll/y20;

    .line 40
    .line 41
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->s:Ll/y20;

    .line 42
    .line 43
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->A:Ll/y20;

    .line 44
    .line 45
    invoke-interface {v1, p1, v2, v3, v4}, Ll/t5m;->f(Ljava/util/List;Ll/y20;Ll/y20;Ll/y20;)V

    .line 46
    .line 47
    .line 48
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->o:Ll/i2m;

    .line 49
    .line 50
    check-cast p1, Ll/fhj;

    .line 51
    .line 52
    invoke-virtual {p1}, Ll/fhj;->A0()Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-eqz p1, :cond_1

    .line 57
    .line 58
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->C()V

    .line 59
    .line 60
    .line 61
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->o:Ll/i2m;

    .line 62
    .line 63
    instance-of v1, p1, Ll/im60;

    .line 64
    .line 65
    if-eqz v1, :cond_2

    .line 66
    .line 67
    check-cast p1, Ll/im60;

    .line 68
    .line 69
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->k:Ll/a30;

    .line 70
    .line 71
    invoke-virtual {p1, v1}, Ll/im60;->k0(Ll/a30;)V

    .line 72
    .line 73
    .line 74
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->o:Ll/i2m;

    .line 75
    .line 76
    check-cast p1, Ll/im60;

    .line 77
    .line 78
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->B:Ll/y20;

    .line 79
    .line 80
    invoke-virtual {p1, v1}, Ll/im60;->n0(Ll/y20;)V

    .line 81
    .line 82
    .line 83
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->o:Ll/i2m;

    .line 84
    .line 85
    check-cast p1, Ll/im60;

    .line 86
    .line 87
    new-instance v1, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView$a;

    .line 88
    .line 89
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView$a;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p1, v1}, Ll/im60;->l0(Ll/z3m;)V

    .line 93
    .line 94
    .line 95
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->o:Ll/i2m;

    .line 96
    .line 97
    check-cast p1, Ll/im60;

    .line 98
    .line 99
    invoke-virtual {p1, p0}, Ll/im60;->p0(Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;)V

    .line 100
    .line 101
    .line 102
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->o:Ll/i2m;

    .line 103
    .line 104
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->j:Ljava/lang/String;

    .line 105
    .line 106
    invoke-interface {p1, v1}, Ll/i2m;->c(Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->o:Ll/i2m;

    .line 110
    .line 111
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->s:Ll/y20;

    .line 112
    .line 113
    invoke-interface {p1, v1}, Ll/i2m;->i(Ll/y20;)V

    .line 114
    .line 115
    .line 116
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->o:Ll/i2m;

    .line 117
    .line 118
    check-cast p1, Ll/im60;

    .line 119
    .line 120
    new-instance v1, Ll/jkb0;

    .line 121
    .line 122
    invoke-direct {v1, p0}, Ll/jkb0;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {p1, v1}, Ll/im60;->c0(Landroid/view/View$OnClickListener;)V

    .line 126
    .line 127
    .line 128
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->f:Landroid/widget/LinearLayout;

    .line 129
    .line 130
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 131
    .line 132
    .line 133
    :cond_3
    return-void
.end method

.method public final e0(Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->h:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->i:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->j:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->t:Lcom/p1/mobile/putong/data/PayMethod;

    .line 8
    .line 9
    invoke-static {v0, v1, v2, v3}, Ll/pab0;->c(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;Lcom/p1/mobile/putong/data/PayMethod;)Ll/t5m;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->n:Ll/t5m;

    .line 14
    .line 15
    instance-of v1, v0, Ll/wl40;

    .line 16
    .line 17
    const/4 v2, -0x2

    .line 18
    const/4 v3, -0x1

    .line 19
    const/4 v4, 0x0

    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    check-cast v0, Ll/wl40;

    .line 23
    .line 24
    sget v1, Ll/qa00;->i:I

    .line 25
    .line 26
    invoke-virtual {v0, v1, v4, v1, v4}, Ll/wl40;->e0(IIII)V

    .line 27
    .line 28
    .line 29
    new-instance v1, Ll/gkb0;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/gkb0;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ll/ip0;->H(Ll/ip0$a;)V

    .line 35
    .line 36
    .line 37
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 38
    .line 39
    invoke-direct {v1, v3, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 40
    .line 41
    .line 42
    sget v2, Ll/qa00;->q:I

    .line 43
    .line 44
    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 45
    .line 46
    sget v2, Ll/qa00;->h:I

    .line 47
    .line 48
    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 49
    .line 50
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->f:Landroid/widget/LinearLayout;

    .line 51
    .line 52
    invoke-virtual {v0}, Ll/ip0;->q()Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    invoke-virtual {v2, v3, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 57
    .line 58
    .line 59
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->D:Ll/z20;

    .line 60
    .line 61
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    if-eqz v1, :cond_6

    .line 66
    .line 67
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->D:Ll/z20;

    .line 68
    .line 69
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->i:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 70
    .line 71
    invoke-virtual {v0}, Ll/wl40;->p()Landroid/view/View;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-interface {v1, v2, v0}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 76
    .line 77
    .line 78
    goto/16 :goto_2

    .line 79
    .line 80
    :cond_0
    instance-of v1, v0, Ll/ip0;

    .line 81
    .line 82
    if-eqz v1, :cond_3

    .line 83
    .line 84
    check-cast v0, Ll/ip0;

    .line 85
    .line 86
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->f:Landroid/widget/LinearLayout;

    .line 87
    .line 88
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 89
    .line 90
    .line 91
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->f:Landroid/widget/LinearLayout;

    .line 92
    .line 93
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 94
    .line 95
    .line 96
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->f:Landroid/widget/LinearLayout;

    .line 97
    .line 98
    invoke-virtual {v0}, Ll/ip0;->q()Landroid/view/View;

    .line 99
    .line 100
    .line 101
    move-result-object v2

    .line 102
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v0}, Ll/ip0;->y()Z

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    if-nez v1, :cond_1

    .line 110
    .line 111
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->f:Landroid/widget/LinearLayout;

    .line 112
    .line 113
    invoke-virtual {v0}, Ll/ip0;->p()Landroid/view/View;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 118
    .line 119
    .line 120
    goto :goto_0

    .line 121
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->D:Ll/z20;

    .line 122
    .line 123
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    move-result v1

    .line 127
    if-eqz v1, :cond_2

    .line 128
    .line 129
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->D:Ll/z20;

    .line 130
    .line 131
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->i:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 132
    .line 133
    invoke-virtual {v0}, Ll/ip0;->p()Landroid/view/View;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    invoke-interface {v1, v2, v0}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 138
    .line 139
    .line 140
    :cond_2
    :goto_0
    new-instance v0, Ll/hkb0;

    .line 141
    .line 142
    invoke-direct {v0, p0, p1}, Ll/hkb0;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;Ljava/util/List;)V

    .line 143
    .line 144
    .line 145
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 146
    .line 147
    .line 148
    goto :goto_2

    .line 149
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->f:Landroid/widget/LinearLayout;

    .line 150
    .line 151
    iget-boolean v5, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->g:Z

    .line 152
    .line 153
    invoke-interface {v0, v1, v5}, Ll/t5m;->a(Landroid/view/ViewGroup;Z)Landroid/view/View;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->i:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 158
    .line 159
    invoke-static {v1}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 160
    .line 161
    .line 162
    move-result v1

    .line 163
    if-eqz v1, :cond_4

    .line 164
    .line 165
    invoke-static {}, Ll/tab0;->h()Ll/tab0;

    .line 166
    .line 167
    .line 168
    move-result-object v1

    .line 169
    invoke-virtual {v1}, Ll/tab0;->z()Z

    .line 170
    .line 171
    .line 172
    move-result v1

    .line 173
    if-eqz v1, :cond_4

    .line 174
    .line 175
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 176
    .line 177
    invoke-direct {v1, v3, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 178
    .line 179
    .line 180
    sget v2, Ll/qa00;->a:I

    .line 181
    .line 182
    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 183
    .line 184
    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 185
    .line 186
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->f:Landroid/widget/LinearLayout;

    .line 187
    .line 188
    invoke-virtual {v2, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 189
    .line 190
    .line 191
    goto :goto_1

    .line 192
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->f:Landroid/widget/LinearLayout;

    .line 193
    .line 194
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 195
    .line 196
    .line 197
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->n:Ll/t5m;

    .line 198
    .line 199
    instance-of v1, v0, Ll/fl40;

    .line 200
    .line 201
    if-eqz v1, :cond_5

    .line 202
    .line 203
    check-cast v0, Ll/fl40;

    .line 204
    .line 205
    invoke-virtual {v0}, Ll/fl40;->J()Z

    .line 206
    .line 207
    .line 208
    move-result v1

    .line 209
    if-eqz v1, :cond_5

    .line 210
    .line 211
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->D:Ll/z20;

    .line 212
    .line 213
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 214
    .line 215
    .line 216
    move-result v1

    .line 217
    if-eqz v1, :cond_5

    .line 218
    .line 219
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->D:Ll/z20;

    .line 220
    .line 221
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->i:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 222
    .line 223
    invoke-virtual {v0, v4}, Ll/fl40;->E(Z)Landroid/view/View;

    .line 224
    .line 225
    .line 226
    move-result-object v0

    .line 227
    invoke-interface {v1, v2, v0}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 228
    .line 229
    .line 230
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->n:Ll/t5m;

    .line 231
    .line 232
    check-cast v0, Ll/fl40;

    .line 233
    .line 234
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->y:Ll/y20;

    .line 235
    .line 236
    invoke-virtual {v0, v1}, Ll/fl40;->b0(Ll/y20;)V

    .line 237
    .line 238
    .line 239
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->n:Ll/t5m;

    .line 240
    .line 241
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->z:Ll/y20;

    .line 242
    .line 243
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->s:Ll/y20;

    .line 244
    .line 245
    invoke-interface {v0, p1, v1, v2}, Ll/t5m;->h(Ljava/util/List;Ll/y20;Ll/y20;)V

    .line 246
    .line 247
    .line 248
    :cond_6
    :goto_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->n:Ll/t5m;

    .line 249
    .line 250
    instance-of v1, v0, Ll/zul;

    .line 251
    .line 252
    if-eqz v1, :cond_7

    .line 253
    .line 254
    check-cast v0, Ll/zul;

    .line 255
    .line 256
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->E:Z

    .line 257
    .line 258
    invoke-interface {v0, v1}, Ll/zul;->g(Z)V

    .line 259
    .line 260
    .line 261
    :cond_7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->d0(Ljava/util/List;)V

    .line 262
    .line 263
    .line 264
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->Z(Ljava/util/List;)V

    .line 265
    .line 266
    .line 267
    return-void
.end method

.method public f0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->m:Ll/l3m;

    .line 2
    .line 3
    instance-of v1, v0, Ll/t190;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    check-cast v0, Ll/t190;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/t190;->t()V

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    instance-of v1, v0, Ll/oud0;

    .line 14
    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    check-cast v0, Ll/oud0;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/oud0;->l()V

    .line 20
    .line 21
    .line 22
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->x:Ll/l4g0;

    .line 23
    .line 24
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->x:Ll/l4g0;

    .line 31
    .line 32
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 33
    .line 34
    .line 35
    :cond_2
    return-void
.end method

.method public g0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->m:Ll/l3m;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->m:Ll/l3m;

    .line 10
    .line 11
    invoke-interface {v0}, Ll/l3m;->release()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->n:Ll/t5m;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->n:Ll/t5m;

    .line 23
    .line 24
    invoke-interface {v0}, Ll/t5m;->release()V

    .line 25
    .line 26
    .line 27
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->o:Ll/i2m;

    .line 28
    .line 29
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_2

    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->o:Ll/i2m;

    .line 36
    .line 37
    invoke-interface {v0}, Ll/i2m;->release()V

    .line 38
    .line 39
    .line 40
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->q:Ll/kcg0;

    .line 41
    .line 42
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    const/4 v1, 0x0

    .line 47
    if-eqz v0, :cond_3

    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->q:Ll/kcg0;

    .line 50
    .line 51
    invoke-interface {v0}, Ll/kcg0;->unsubscribe()V

    .line 52
    .line 53
    .line 54
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->q:Ll/kcg0;

    .line 55
    .line 56
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->r:Ll/kcg0;

    .line 57
    .line 58
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-eqz v0, :cond_4

    .line 63
    .line 64
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->r:Ll/kcg0;

    .line 65
    .line 66
    invoke-interface {v0}, Ll/kcg0;->unsubscribe()V

    .line 67
    .line 68
    .line 69
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->r:Ll/kcg0;

    .line 70
    .line 71
    :cond_4
    return-void
.end method

.method public getPurchaseType()Lcom/p1/mobile/putong/core/data/PurchaseType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->i:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    return-object p0
.end method

.method public h0(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->n:Ll/t5m;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->n:Ll/t5m;

    .line 10
    .line 11
    instance-of v0, p0, Ll/fl40;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    check-cast p0, Ll/fl40;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ll/fl40;->d0(Z)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->g0()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/fdc0;->i0:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Landroid/widget/LinearLayout;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->f:Landroid/widget/LinearLayout;

    .line 13
    .line 14
    return-void
.end method

.method public setAgreementCheckedCallback(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->y:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public setAgreementViewAction(Ll/z20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z20<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->D:Ll/z20;

    .line 2
    .line 3
    return-void
.end method

.method public setDialogStateAction(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->s:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public setFirstPrivilege(Lcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->w:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 2
    .line 3
    return-void
.end method

.method public setFrom(Ljava/lang/String;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->j:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->o:Ll/i2m;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->o:Ll/i2m;

    .line 12
    .line 13
    invoke-interface {p0, p1}, Ll/i2m;->c(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public setOnCloseClick(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->l:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public setOnPaymentSuccess(Ll/a30;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/a30<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->k:Ll/a30;

    .line 2
    .line 3
    return-void
.end method

.method public setPrivilegeDescriptions(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/a690;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->p:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public setPurchaseType(Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->i:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    return-void
.end method
