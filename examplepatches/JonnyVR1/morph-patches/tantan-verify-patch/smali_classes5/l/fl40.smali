.class public Ll/fl40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/t5m;
.implements Ll/zul;


# instance fields
.field public A:I

.field public a:Landroid/widget/HorizontalScrollView;

.field public b:Landroid/widget/LinearLayout;

.field public c:Landroid/widget/FrameLayout;

.field public final d:Lcom/p1/mobile/android/app/Act;

.field public final e:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public final f:Ljava/lang/String;

.field public g:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public h:Lcom/p1/mobile/putong/core/ui/purchase/d;

.field public i:Ll/x80;

.field public j:Lcom/p1/mobile/putong/data/PayMethod;

.field public k:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;"
        }
    .end annotation
.end field

.field public l:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;"
        }
    .end annotation
.end field

.field public final m:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;"
        }
    .end annotation
.end field

.field public n:Lcom/p1/mobile/putong/core/ui/purchase/d;

.field public o:Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;

.field public p:Z

.field public q:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public final r:I

.field public s:Lcom/p1/mobile/putong/core/ui/purchase/agreement/b;

.field public t:Z

.field public u:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/CharSequence;",
            ">;"
        }
    .end annotation
.end field

.field public v:Z

.field public w:Z

.field public x:Ll/vhb0;

.field public y:Landroid/view/View;

.field public z:Z


# direct methods
.method private W(Lcom/p1/mobile/putong/core/ui/purchase/showcase/AbsPurchaseSectionView;Lcom/p1/mobile/putong/core/ui/purchase/d;Z)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/fl40;->H()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->m()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    goto :goto_0

    .line 23
    :cond_1
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

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
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    goto :goto_0

    .line 38
    :cond_2
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    :goto_0
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    iget-object p0, p0, Ll/fl40;->j:Lcom/p1/mobile/putong/data/PayMethod;

    .line 51
    .line 52
    invoke-virtual {p1, p3, v0, p2, p0}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/AbsPurchaseSectionView;->b(ZZLcom/p1/mobile/putong/core/ui/purchase/d$a;Lcom/p1/mobile/putong/data/PayMethod;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method private X(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    if-ge v0, v1, :cond_1

    .line 7
    .line 8
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    check-cast v1, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 13
    .line 14
    invoke-virtual {p0, v0, p1}, Ll/fl40;->D(ILjava/util/List;)Lcom/p1/mobile/putong/core/ui/purchase/showcase/AbsPurchaseSectionView;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->l()Z

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    invoke-direct {p0, v2, v1, v3}, Ll/fl40;->W(Lcom/p1/mobile/putong/core/ui/purchase/showcase/AbsPurchaseSectionView;Lcom/p1/mobile/putong/core/ui/purchase/d;Z)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->l()Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-eqz v2, :cond_0

    .line 30
    .line 31
    iput-object v1, p0, Ll/fl40;->n:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/fl40;->b()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ll/fl40;->c0()V

    .line 37
    .line 38
    .line 39
    iget-object v1, p0, Ll/fl40;->k:Ll/y20;

    .line 40
    .line 41
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-eqz v1, :cond_0

    .line 46
    .line 47
    iget-object v1, p0, Ll/fl40;->k:Ll/y20;

    .line 48
    .line 49
    iget-object v2, p0, Ll/fl40;->n:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 50
    .line 51
    invoke-interface {v1, v2}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_1
    invoke-virtual {p0}, Ll/fl40;->H()Z

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    if-eqz p1, :cond_3

    .line 62
    .line 63
    iget-object p1, p0, Ll/fl40;->b:Landroid/widget/LinearLayout;

    .line 64
    .line 65
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-eqz p1, :cond_3

    .line 70
    .line 71
    iget-object p1, p0, Ll/fl40;->y:Landroid/view/View;

    .line 72
    .line 73
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    if-eqz p1, :cond_3

    .line 78
    .line 79
    iget-object p1, p0, Ll/fl40;->y:Landroid/view/View;

    .line 80
    .line 81
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    if-nez p1, :cond_2

    .line 86
    .line 87
    iget-object p1, p0, Ll/fl40;->b:Landroid/widget/LinearLayout;

    .line 88
    .line 89
    new-instance v0, Ll/qk40;

    .line 90
    .line 91
    invoke-direct {v0, p0}, Ll/qk40;-><init>(Ll/fl40;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 95
    .line 96
    .line 97
    return-void

    .line 98
    :cond_2
    new-instance p1, Ll/wk40;

    .line 99
    .line 100
    invoke-direct {p1, p0}, Ll/wk40;-><init>(Ll/fl40;)V

    .line 101
    .line 102
    .line 103
    invoke-static {p1}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 104
    .line 105
    .line 106
    :cond_3
    return-void
.end method

.method public static synthetic i(Ll/fl40;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/fl40;->Q(Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic j(Ll/fl40;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/fl40;->M()V

    return-void
.end method

.method public static synthetic k(Ll/fl40;Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fl40;->L(Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;)V

    return-void
.end method

.method public static synthetic l(Ll/x20;)V
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Ll/x20;->call()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic m(ILcom/p1/mobile/putong/core/ui/purchase/d;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iget v0, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 20
    .line 21
    if-ne v0, p0, :cond_0

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Merchandise;->monthType()Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    const/4 p0, 0x0

    .line 32
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0

    .line 37
    :cond_1
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 38
    .line 39
    return-object p0
.end method

.method public static synthetic n(Ll/fl40;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/fl40;->Y()V

    return-void
.end method

.method public static synthetic o(Ll/fl40;Lcom/p1/mobile/putong/core/ui/purchase/d;Ljava/util/List;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/fl40;->K(Lcom/p1/mobile/putong/core/ui/purchase/d;Ljava/util/List;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic p(ILcom/p1/mobile/putong/core/ui/purchase/d;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iget v0, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 20
    .line 21
    if-ne v0, p0, :cond_0

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Merchandise;->monthType()Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    const/4 p0, 0x0

    .line 32
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0

    .line 37
    :cond_1
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 38
    .line 39
    return-object p0
.end method

.method public static synthetic q(Lcom/p1/mobile/putong/core/ui/purchase/d;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->v(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic r()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic s(ILcom/p1/mobile/putong/core/ui/purchase/d;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

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
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget v0, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 20
    .line 21
    if-ne v0, p0, :cond_0

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Merchandise;->monthType()Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_0

    .line 36
    .line 37
    const/4 p0, 0x1

    .line 38
    goto :goto_0

    .line 39
    :cond_0
    const/4 p0, 0x0

    .line 40
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    return-object p0
.end method

.method public static synthetic t(Ll/fl40;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/fl40;->P()V

    return-void
.end method

.method public static synthetic u(Ll/fl40;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/fl40;->N()V

    return-void
.end method

.method public static synthetic v(Ll/x20;)V
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Ll/x20;->call()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic w(Ll/fl40;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/fl40;->O()V

    return-void
.end method


# virtual methods
.method public final A()Lcom/p1/mobile/putong/core/ui/purchase/showcase/AbsPurchaseSectionView;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/fl40;->e:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    invoke-static {v0}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Ll/fl40;->d:Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sget v2, Ll/rec0;->p0:I

    .line 17
    .line 18
    iget-object v3, p0, Ll/fl40;->b:Landroid/widget/LinearLayout;

    .line 19
    .line 20
    invoke-virtual {v0, v2, v3, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;

    .line 25
    .line 26
    iget-object v1, p0, Ll/fl40;->f:Ljava/lang/String;

    .line 27
    .line 28
    const-string v2, "PrivilegeODiamondContent"

    .line 29
    .line 30
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->setInVipFrag(Z)V

    .line 35
    .line 36
    .line 37
    iget-boolean p0, p0, Ll/fl40;->z:Z

    .line 38
    .line 39
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/ODiamondAllPriceSectionView;->n(Z)V

    .line 40
    .line 41
    .line 42
    return-object v0

    .line 43
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->k()Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_1

    .line 56
    .line 57
    iget-object v0, p0, Ll/fl40;->g:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 58
    .line 59
    invoke-static {v0}, Ll/wib0;->n(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_1

    .line 64
    .line 65
    iget-object v0, p0, Ll/fl40;->d:Lcom/p1/mobile/android/app/Act;

    .line 66
    .line 67
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    sget v2, Ll/rec0;->s0:I

    .line 72
    .line 73
    iget-object p0, p0, Ll/fl40;->b:Landroid/widget/LinearLayout;

    .line 74
    .line 75
    invoke-virtual {v0, v2, p0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    check-cast p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/PicksTimesPurchaseSectionView;

    .line 80
    .line 81
    return-object p0

    .line 82
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->j3()Z

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    if-eqz v0, :cond_2

    .line 95
    .line 96
    iget-object v0, p0, Ll/fl40;->j:Lcom/p1/mobile/putong/data/PayMethod;

    .line 97
    .line 98
    const-string v2, "alipay"

    .line 99
    .line 100
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    if-eqz v0, :cond_2

    .line 105
    .line 106
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 107
    .line 108
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->O0:Lcom/p1/mobile/putong/core/api/CoreAutoPay;

    .line 109
    .line 110
    iget-object v2, p0, Ll/fl40;->g:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 111
    .line 112
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->u3(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    if-eqz v0, :cond_2

    .line 117
    .line 118
    iget-object v0, p0, Ll/fl40;->d:Lcom/p1/mobile/android/app/Act;

    .line 119
    .line 120
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    sget v2, Ll/rec0;->q0:I

    .line 125
    .line 126
    iget-object p0, p0, Ll/fl40;->b:Landroid/widget/LinearLayout;

    .line 127
    .line 128
    invoke-virtual {v0, v2, p0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    check-cast p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUIPurchaseSectionViewAutoPay;

    .line 133
    .line 134
    return-object p0

    .line 135
    :cond_2
    iget-object v0, p0, Ll/fl40;->d:Lcom/p1/mobile/android/app/Act;

    .line 136
    .line 137
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    sget v2, Ll/rec0;->r0:I

    .line 142
    .line 143
    iget-object v3, p0, Ll/fl40;->b:Landroid/widget/LinearLayout;

    .line 144
    .line 145
    invoke-virtual {v0, v2, v3, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    check-cast v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;

    .line 150
    .line 151
    iget-boolean p0, p0, Ll/fl40;->z:Z

    .line 152
    .line 153
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUITotalPricePurchaseSectionView1;->o(Z)V

    .line 154
    .line 155
    .line 156
    return-object v0
.end method

.method public B(I)Lcom/p1/mobile/putong/core/ui/purchase/d;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/fl40;->m:Ljava/util/List;

    .line 2
    .line 3
    new-instance v0, Ll/dl40;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/dl40;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 13
    .line 14
    return-object p0
.end method

.method public C(I)Lcom/p1/mobile/putong/core/data/Merchandise;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/fl40;->m:Ljava/util/List;

    .line 2
    .line 3
    new-instance v0, Ll/zk40;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/zk40;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 13
    .line 14
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0

    .line 29
    :cond_0
    const/4 p0, 0x0

    .line 30
    return-object p0
.end method

.method public final D(ILjava/util/List;)Lcom/p1/mobile/putong/core/ui/purchase/showcase/AbsPurchaseSectionView;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;)",
            "Lcom/p1/mobile/putong/core/ui/purchase/showcase/AbsPurchaseSectionView;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/fl40;->b:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lt p1, v0, :cond_1

    .line 8
    .line 9
    invoke-interface {p2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/fl40;->A()Lcom/p1/mobile/putong/core/ui/purchase/showcase/AbsPurchaseSectionView;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    new-instance v2, Ll/xk40;

    .line 20
    .line 21
    invoke-direct {v2, p0, v0, p2}, Ll/xk40;-><init>(Ll/fl40;Lcom/p1/mobile/putong/core/ui/purchase/d;Ljava/util/List;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 25
    .line 26
    .line 27
    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;

    .line 28
    .line 29
    iget v0, p0, Ll/fl40;->r:I

    .line 30
    .line 31
    const/4 v2, -0x1

    .line 32
    invoke-direct {p2, v0, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 33
    .line 34
    .line 35
    if-eqz p1, :cond_0

    .line 36
    .line 37
    sget p1, Ll/qa00;->g:I

    .line 38
    .line 39
    iput p1, p2, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 40
    .line 41
    :cond_0
    iget-object p0, p0, Ll/fl40;->b:Landroid/widget/LinearLayout;

    .line 42
    .line 43
    invoke-virtual {p0, v1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 44
    .line 45
    .line 46
    return-object v1

    .line 47
    :cond_1
    iget-object p0, p0, Ll/fl40;->b:Landroid/widget/LinearLayout;

    .line 48
    .line 49
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    check-cast p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/AbsPurchaseSectionView;

    .line 54
    .line 55
    return-object p0
.end method

.method public E(Z)Landroid/view/View;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/fl40;->t:Z

    .line 2
    .line 3
    iget-object p0, p0, Ll/fl40;->s:Lcom/p1/mobile/putong/core/ui/purchase/agreement/b;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/agreement/b;->d(Z)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public F()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fl40;->s:Lcom/p1/mobile/putong/core/ui/purchase/agreement/b;

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
    iget-object v0, p0, Ll/fl40;->s:Lcom/p1/mobile/putong/core/ui/purchase/agreement/b;

    .line 10
    .line 11
    instance-of v0, v0, Lcom/p1/mobile/putong/core/ui/purchase/agreement/a;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-boolean p0, p0, Ll/fl40;->p:Z

    .line 16
    .line 17
    return p0

    .line 18
    :cond_0
    const/4 p0, 0x1

    .line 19
    return p0
.end method

.method public G(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/fl40;->w:Z

    .line 2
    .line 3
    return-void
.end method

.method public H()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fl40;->m:Ljava/util/List;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/fl40;->I(Ljava/util/List;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public I(Ljava/util/List;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;)Z"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_2

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    if-nez p1, :cond_0

    .line 28
    .line 29
    :cond_1
    const/4 p0, 0x0

    .line 30
    return p0

    .line 31
    :cond_2
    const/4 p0, 0x1

    .line 32
    return p0
.end method

.method public J()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public final synthetic K(Lcom/p1/mobile/putong/core/ui/purchase/d;Ljava/util/List;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->l()Z

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance p3, Ll/rk40;

    .line 9
    .line 10
    invoke-direct {p3}, Ll/rk40;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-static {p2, p3}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 14
    .line 15
    .line 16
    const/4 p3, 0x1

    .line 17
    invoke-virtual {p1, p3}, Lcom/p1/mobile/putong/core/ui/purchase/d;->v(Z)V

    .line 18
    .line 19
    .line 20
    invoke-direct {p0, p2}, Ll/fl40;->X(Ljava/util/List;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final synthetic L(Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fl40;->y(Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic M()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/fl40;->Y()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic N()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Ll/fl40;->d0(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic O()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Ll/fl40;->d0(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic P()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Ll/fl40;->d0(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic Q(Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/Boolean;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/fl40;->o:Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;

    .line 2
    .line 3
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    sget-object v1, Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;->checked:Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;->unchecked:Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;

    .line 13
    .line 14
    :goto_0
    iput-object v1, p0, Ll/fl40;->o:Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;

    .line 15
    .line 16
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    iput-boolean v1, p0, Ll/fl40;->p:Z

    .line 21
    .line 22
    iget-object v1, p0, Ll/fl40;->q:Ll/y20;

    .line 23
    .line 24
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_1

    .line 29
    .line 30
    iget-object v1, p0, Ll/fl40;->q:Ll/y20;

    .line 31
    .line 32
    iget-boolean v2, p0, Ll/fl40;->p:Z

    .line 33
    .line 34
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-interface {v1, v2}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    :cond_1
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 42
    .line 43
    .line 44
    move-result p2

    .line 45
    invoke-static {p2}, Ll/pta;->i(Z)V

    .line 46
    .line 47
    .line 48
    invoke-static {}, Ll/g6b;->d()Z

    .line 49
    .line 50
    .line 51
    move-result p2

    .line 52
    if-eqz p2, :cond_6

    .line 53
    .line 54
    invoke-static {p1}, Ll/wib0;->w(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 55
    .line 56
    .line 57
    move-result p2

    .line 58
    if-nez p2, :cond_4

    .line 59
    .line 60
    invoke-static {p1}, Ll/wib0;->q(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 61
    .line 62
    .line 63
    move-result p2

    .line 64
    if-eqz p2, :cond_2

    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_2
    invoke-static {p1}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 68
    .line 69
    .line 70
    move-result p2

    .line 71
    if-eqz p2, :cond_3

    .line 72
    .line 73
    iget-object p1, p0, Ll/fl40;->s:Lcom/p1/mobile/putong/core/ui/purchase/agreement/b;

    .line 74
    .line 75
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/ui/purchase/agreement/b;->c()Ljava/lang/Boolean;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    if-eqz p1, :cond_6

    .line 84
    .line 85
    iget-boolean p1, p0, Ll/fl40;->w:Z

    .line 86
    .line 87
    if-nez p1, :cond_6

    .line 88
    .line 89
    iget-object p1, p0, Ll/fl40;->o:Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;

    .line 90
    .line 91
    new-instance p2, Ll/bl40;

    .line 92
    .line 93
    invoke-direct {p2, p0}, Ll/bl40;-><init>(Ll/fl40;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p0, p1, p2}, Ll/fl40;->S(Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;Ll/x20;)V

    .line 97
    .line 98
    .line 99
    return-void

    .line 100
    :cond_3
    invoke-static {p1}, Ll/wib0;->o(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 101
    .line 102
    .line 103
    move-result p1

    .line 104
    if-eqz p1, :cond_6

    .line 105
    .line 106
    iget-object p1, p0, Ll/fl40;->s:Lcom/p1/mobile/putong/core/ui/purchase/agreement/b;

    .line 107
    .line 108
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/ui/purchase/agreement/b;->c()Ljava/lang/Boolean;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 113
    .line 114
    .line 115
    move-result p1

    .line 116
    if-eqz p1, :cond_6

    .line 117
    .line 118
    iget-boolean p1, p0, Ll/fl40;->w:Z

    .line 119
    .line 120
    if-nez p1, :cond_6

    .line 121
    .line 122
    iget-object p1, p0, Ll/fl40;->o:Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;

    .line 123
    .line 124
    new-instance p2, Ll/cl40;

    .line 125
    .line 126
    invoke-direct {p2, p0}, Ll/cl40;-><init>(Ll/fl40;)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {p0, p1, p2}, Ll/fl40;->U(Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;Ll/x20;)V

    .line 130
    .line 131
    .line 132
    return-void

    .line 133
    :cond_4
    :goto_1
    iget-object p1, p0, Ll/fl40;->s:Lcom/p1/mobile/putong/core/ui/purchase/agreement/b;

    .line 134
    .line 135
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/ui/purchase/agreement/b;->c()Ljava/lang/Boolean;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 140
    .line 141
    .line 142
    move-result p1

    .line 143
    iget-object p2, p0, Ll/fl40;->o:Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;

    .line 144
    .line 145
    if-eqz p1, :cond_5

    .line 146
    .line 147
    new-instance p1, Ll/al40;

    .line 148
    .line 149
    invoke-direct {p1, p0}, Ll/al40;-><init>(Ll/fl40;)V

    .line 150
    .line 151
    .line 152
    invoke-virtual {p0, v0, p2, p1}, Ll/fl40;->T(Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;Ll/x20;)V

    .line 153
    .line 154
    .line 155
    return-void

    .line 156
    :cond_5
    invoke-virtual {p0, p2}, Ll/fl40;->y(Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;)V

    .line 157
    .line 158
    .line 159
    :cond_6
    return-void
.end method

.method public R()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/fl40;->p:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/fl40;->s:Lcom/p1/mobile/putong/core/ui/purchase/agreement/b;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Ll/fl40;->s:Lcom/p1/mobile/putong/core/ui/purchase/agreement/b;

    .line 13
    .line 14
    instance-of v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/agreement/a;

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    check-cast p0, Lcom/p1/mobile/putong/core/ui/purchase/agreement/a;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/agreement/a;->m()V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public S(Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;Ll/x20;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;->unchecked:Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Ll/fl40;->d:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    iget-object v0, p0, Ll/fl40;->g:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 8
    .line 9
    iget-object p0, p0, Ll/fl40;->h:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 10
    .line 11
    new-instance v1, Ll/uk40;

    .line 12
    .line 13
    invoke-direct {v1, p2}, Ll/uk40;-><init>(Ll/x20;)V

    .line 14
    .line 15
    .line 16
    new-instance p2, Ll/vk40;

    .line 17
    .line 18
    invoke-direct {p2}, Ll/vk40;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-static {p1, v0, p0, v1, p2}, Ll/h7f0;->a(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/ui/purchase/d;Ll/x20;Ll/x20;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public T(Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;Ll/x20;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/fl40;->h:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 2
    .line 3
    if-eqz v0, :cond_4

    .line 4
    .line 5
    iget-object v0, p0, Ll/fl40;->l:Ljava/util/List;

    .line 6
    .line 7
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual {p0}, Ll/fl40;->b()V

    .line 15
    .line 16
    .line 17
    sget-object v0, Ll/fl40$a;->a:[I

    .line 18
    .line 19
    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    aget v0, v0, v1

    .line 24
    .line 25
    const/4 v1, 0x1

    .line 26
    if-eq v0, v1, :cond_3

    .line 27
    .line 28
    const/4 v1, 0x2

    .line 29
    if-eq v0, v1, :cond_1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;->hidden:Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;

    .line 33
    .line 34
    if-eq p1, v0, :cond_4

    .line 35
    .line 36
    sget-object p1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 37
    .line 38
    iget-object v0, p0, Ll/fl40;->g:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 39
    .line 40
    if-ne p1, v0, :cond_2

    .line 41
    .line 42
    iget-object p1, p0, Ll/fl40;->f:Ljava/lang/String;

    .line 43
    .line 44
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/purchase/e;->x(Ljava/lang/String;)Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-eqz p1, :cond_2

    .line 49
    .line 50
    invoke-virtual {p0, p2}, Ll/fl40;->y(Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_2
    iget-object p1, p0, Ll/fl40;->d:Lcom/p1/mobile/android/app/Act;

    .line 55
    .line 56
    iget-object v0, p0, Ll/fl40;->g:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 57
    .line 58
    iget-object v1, p0, Ll/fl40;->h:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 59
    .line 60
    new-instance v2, Ll/sk40;

    .line 61
    .line 62
    invoke-direct {v2, p3}, Ll/sk40;-><init>(Ll/x20;)V

    .line 63
    .line 64
    .line 65
    new-instance p3, Ll/tk40;

    .line 66
    .line 67
    invoke-direct {p3, p0, p2}, Ll/tk40;-><init>(Ll/fl40;Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;)V

    .line 68
    .line 69
    .line 70
    invoke-static {p1, v0, v1, v2, p3}, Ll/h7f0;->a(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/ui/purchase/d;Ll/x20;Ll/x20;)V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_3
    invoke-virtual {p0, p2}, Ll/fl40;->y(Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;)V

    .line 75
    .line 76
    .line 77
    :cond_4
    :goto_0
    return-void
.end method

.method public U(Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;Ll/x20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/fl40;->S(Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;Ll/x20;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final V(Lcom/p1/mobile/putong/data/PayMethod;)V
    .locals 2

    .line 1
    iput-object p1, p0, Ll/fl40;->j:Lcom/p1/mobile/putong/data/PayMethod;

    .line 2
    .line 3
    iget-object p1, p0, Ll/fl40;->l:Ljava/util/List;

    .line 4
    .line 5
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object p1, p0, Ll/fl40;->x:Ll/vhb0;

    .line 13
    .line 14
    iget-object v0, p0, Ll/fl40;->o:Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;

    .line 15
    .line 16
    iget-object v1, p0, Ll/fl40;->j:Lcom/p1/mobile/putong/data/PayMethod;

    .line 17
    .line 18
    invoke-virtual {p1, v0, v1}, Ll/vhb0;->j(Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;Lcom/p1/mobile/putong/data/PayMethod;)Ljava/util/List;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p0, p1}, Ll/fl40;->z(Ljava/util/List;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final Y()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/fl40;->y:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Ll/fl40;->b:Landroid/widget/LinearLayout;

    .line 8
    .line 9
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    iget v2, p0, Ll/fl40;->r:I

    .line 14
    .line 15
    mul-int/2addr v1, v2

    .line 16
    iget-object v2, p0, Ll/fl40;->b:Landroid/widget/LinearLayout;

    .line 17
    .line 18
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    add-int/lit8 v2, v2, -0x1

    .line 23
    .line 24
    sget v3, Ll/qa00;->g:I

    .line 25
    .line 26
    mul-int/2addr v2, v3

    .line 27
    add-int/2addr v1, v2

    .line 28
    iget v2, p0, Ll/fl40;->A:I

    .line 29
    .line 30
    mul-int/lit8 v2, v2, 0x2

    .line 31
    .line 32
    add-int/2addr v1, v2

    .line 33
    if-le v0, v1, :cond_3

    .line 34
    .line 35
    iget-object v1, p0, Ll/fl40;->b:Landroid/widget/LinearLayout;

    .line 36
    .line 37
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-gtz v1, :cond_0

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_0
    iget v1, p0, Ll/fl40;->A:I

    .line 45
    .line 46
    mul-int/lit8 v1, v1, 0x2

    .line 47
    .line 48
    iget-object v2, p0, Ll/fl40;->b:Landroid/widget/LinearLayout;

    .line 49
    .line 50
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    add-int/lit8 v2, v2, -0x1

    .line 55
    .line 56
    const/high16 v3, 0x40c00000    # 6.0f

    .line 57
    .line 58
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    mul-int/2addr v2, v3

    .line 63
    sub-int/2addr v0, v1

    .line 64
    sub-int/2addr v0, v2

    .line 65
    iget-object v1, p0, Ll/fl40;->b:Landroid/widget/LinearLayout;

    .line 66
    .line 67
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    div-int/2addr v0, v1

    .line 72
    const/4 v1, 0x0

    .line 73
    :goto_0
    iget-object v2, p0, Ll/fl40;->b:Landroid/widget/LinearLayout;

    .line 74
    .line 75
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    if-ge v1, v2, :cond_2

    .line 80
    .line 81
    iget-object v2, p0, Ll/fl40;->b:Landroid/widget/LinearLayout;

    .line 82
    .line 83
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    .line 88
    .line 89
    const/4 v4, -0x1

    .line 90
    invoke-direct {v3, v0, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 91
    .line 92
    .line 93
    if-eqz v1, :cond_1

    .line 94
    .line 95
    sget v4, Ll/qa00;->g:I

    .line 96
    .line 97
    iput v4, v3, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 98
    .line 99
    :cond_1
    invoke-virtual {v2, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 100
    .line 101
    .line 102
    add-int/lit8 v1, v1, 0x1

    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_2
    iget-object p0, p0, Ll/fl40;->y:Landroid/view/View;

    .line 106
    .line 107
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 108
    .line 109
    .line 110
    :cond_3
    :goto_1
    return-void
.end method

.method public Z(ILl/x20;)Z
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    move v2, v1

    .line 4
    :goto_0
    iget-object v3, p0, Ll/fl40;->m:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 7
    .line 8
    .line 9
    move-result v3

    .line 10
    iget-object v4, p0, Ll/fl40;->m:Ljava/util/List;

    .line 11
    .line 12
    const/4 v5, 0x1

    .line 13
    if-ge v1, v3, :cond_3

    .line 14
    .line 15
    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    check-cast v3, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 20
    .line 21
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 22
    .line 23
    .line 24
    move-result-object v4

    .line 25
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v4

    .line 29
    if-eqz v4, :cond_1

    .line 30
    .line 31
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    iget v6, v4, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 40
    .line 41
    if-ne v6, p1, :cond_0

    .line 42
    .line 43
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/data/Merchandise;->monthType()Z

    .line 44
    .line 45
    .line 46
    move-result v4

    .line 47
    if-eqz v4, :cond_0

    .line 48
    .line 49
    invoke-virtual {v3, v5}, Lcom/p1/mobile/putong/core/ui/purchase/d;->v(Z)V

    .line 50
    .line 51
    .line 52
    move v2, v1

    .line 53
    goto :goto_1

    .line 54
    :cond_0
    invoke-virtual {v3, v0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->v(Z)V

    .line 55
    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_1
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 59
    .line 60
    .line 61
    move-result-object v4

    .line 62
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v4

    .line 66
    if-eqz v4, :cond_2

    .line 67
    .line 68
    invoke-virtual {v3, v0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->v(Z)V

    .line 69
    .line 70
    .line 71
    :cond_2
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_3
    invoke-direct {p0, v4}, Ll/fl40;->X(Ljava/util/List;)V

    .line 75
    .line 76
    .line 77
    iget-object p1, p0, Ll/fl40;->a:Landroid/widget/HorizontalScrollView;

    .line 78
    .line 79
    const/high16 v1, 0x42d40000    # 106.0f

    .line 80
    .line 81
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    mul-int/2addr v1, v2

    .line 86
    sget v2, Ll/qa00;->g:I

    .line 87
    .line 88
    add-int/2addr v1, v2

    .line 89
    invoke-virtual {p1, v1, v0}, Landroid/widget/HorizontalScrollView;->smoothScrollTo(II)V

    .line 90
    .line 91
    .line 92
    iget-object p0, p0, Ll/fl40;->d:Lcom/p1/mobile/android/app/Act;

    .line 93
    .line 94
    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    new-instance p1, Ll/bri0;

    .line 98
    .line 99
    invoke-direct {p1, p2}, Ll/bri0;-><init>(Ll/x20;)V

    .line 100
    .line 101
    .line 102
    const-wide/16 v0, 0x1f4

    .line 103
    .line 104
    invoke-static {p0, p1, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 105
    .line 106
    .line 107
    return v5
.end method

.method public a(Landroid/view/ViewGroup;Z)Landroid/view/View;
    .locals 2

    .line 1
    iget-object p2, p0, Ll/fl40;->d:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    sget v0, Ll/rec0;->u2:I

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p0, p1}, Ll/fl40;->x(Landroid/view/View;)V

    .line 15
    .line 16
    .line 17
    iget-object p2, p0, Ll/fl40;->b:Landroid/widget/LinearLayout;

    .line 18
    .line 19
    iget v0, p0, Ll/fl40;->A:I

    .line 20
    .line 21
    invoke-virtual {p2, v0, v1, v0, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Ll/fl40;->J()Z

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    iget-object v0, p0, Ll/fl40;->c:Landroid/widget/FrameLayout;

    .line 29
    .line 30
    if-nez p2, :cond_0

    .line 31
    .line 32
    invoke-virtual {p0, v1}, Ll/fl40;->E(Z)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    invoke-virtual {v0, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    check-cast p2, Landroid/widget/LinearLayout$LayoutParams;

    .line 45
    .line 46
    sget v0, Ll/qa00;->g:I

    .line 47
    .line 48
    iput v0, p2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 49
    .line 50
    iget-object v0, p0, Ll/fl40;->c:Landroid/widget/FrameLayout;

    .line 51
    .line 52
    invoke-virtual {v0, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 53
    .line 54
    .line 55
    :goto_0
    iput-object p1, p0, Ll/fl40;->y:Landroid/view/View;

    .line 56
    .line 57
    return-object p1
.end method

.method public a0(ILl/x20;)Z
    .locals 7

    .line 1
    iget-object v0, p0, Ll/fl40;->m:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/el40;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Ll/el40;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    const/4 v1, 0x0

    .line 19
    if-eqz v0, :cond_4

    .line 20
    .line 21
    const/4 v0, -0x1

    .line 22
    move v2, v1

    .line 23
    :goto_0
    iget-object v3, p0, Ll/fl40;->m:Ljava/util/List;

    .line 24
    .line 25
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    iget-object v4, p0, Ll/fl40;->m:Ljava/util/List;

    .line 30
    .line 31
    const/4 v5, 0x1

    .line 32
    if-ge v2, v3, :cond_3

    .line 33
    .line 34
    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    check-cast v3, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 39
    .line 40
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    if-eqz v4, :cond_1

    .line 49
    .line 50
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 51
    .line 52
    .line 53
    move-result-object v4

    .line 54
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 55
    .line 56
    .line 57
    move-result-object v4

    .line 58
    iget v6, v4, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 59
    .line 60
    if-ne v6, p1, :cond_0

    .line 61
    .line 62
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/data/Merchandise;->monthType()Z

    .line 63
    .line 64
    .line 65
    move-result v4

    .line 66
    if-eqz v4, :cond_0

    .line 67
    .line 68
    invoke-virtual {v3, v5}, Lcom/p1/mobile/putong/core/ui/purchase/d;->v(Z)V

    .line 69
    .line 70
    .line 71
    move v0, v2

    .line 72
    goto :goto_1

    .line 73
    :cond_0
    invoke-virtual {v3, v1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->v(Z)V

    .line 74
    .line 75
    .line 76
    goto :goto_1

    .line 77
    :cond_1
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 78
    .line 79
    .line 80
    move-result-object v4

    .line 81
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v4

    .line 85
    if-eqz v4, :cond_2

    .line 86
    .line 87
    invoke-virtual {v3, v1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->v(Z)V

    .line 88
    .line 89
    .line 90
    :cond_2
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_3
    invoke-direct {p0, v4}, Ll/fl40;->X(Ljava/util/List;)V

    .line 94
    .line 95
    .line 96
    iget-object p1, p0, Ll/fl40;->a:Landroid/widget/HorizontalScrollView;

    .line 97
    .line 98
    const/high16 v2, 0x42d40000    # 106.0f

    .line 99
    .line 100
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 101
    .line 102
    .line 103
    move-result v2

    .line 104
    mul-int/2addr v2, v0

    .line 105
    sget v0, Ll/qa00;->g:I

    .line 106
    .line 107
    add-int/2addr v2, v0

    .line 108
    invoke-virtual {p1, v2, v1}, Landroid/widget/HorizontalScrollView;->smoothScrollTo(II)V

    .line 109
    .line 110
    .line 111
    iget-object p0, p0, Ll/fl40;->d:Lcom/p1/mobile/android/app/Act;

    .line 112
    .line 113
    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    new-instance p1, Ll/bri0;

    .line 117
    .line 118
    invoke-direct {p1, p2}, Ll/bri0;-><init>(Ll/x20;)V

    .line 119
    .line 120
    .line 121
    const-wide/16 v0, 0x1f4

    .line 122
    .line 123
    invoke-static {p0, p1, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 124
    .line 125
    .line 126
    return v5

    .line 127
    :cond_4
    invoke-static {}, Ll/pta;->w()V

    .line 128
    .line 129
    .line 130
    return v1
.end method

.method public b()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fl40;->n:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v1, p0, Ll/fl40;->i:Ll/x80;

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iput-object v0, p0, Ll/fl40;->h:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 11
    .line 12
    iget-object v0, p0, Ll/fl40;->e:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 13
    .line 14
    iput-object v0, p0, Ll/fl40;->g:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/fl40;->c0()V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_1
    :goto_0
    iput-object v0, p0, Ll/fl40;->h:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 21
    .line 22
    iget-object v0, p0, Ll/fl40;->e:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 23
    .line 24
    iput-object v0, p0, Ll/fl40;->g:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 25
    .line 26
    return-void
.end method

.method public b0(Ll/y20;)V
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
    iput-object p1, p0, Ll/fl40;->q:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public c(Ll/x80;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fl40;->i:Ll/x80;

    .line 2
    .line 3
    return-void
.end method

.method public final c0()V
    .locals 12

    .line 1
    iget-object v0, p0, Ll/fl40;->g:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    iget-object v1, p0, Ll/fl40;->h:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->m()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iget-object v2, p0, Ll/fl40;->h:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    :goto_0
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    const/4 v3, 0x0

    .line 31
    const/4 v4, 0x1

    .line 32
    const-string v5, "wechat"

    .line 33
    .line 34
    if-nez v2, :cond_3

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/fl40;->H()Z

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    if-eqz v2, :cond_1

    .line 41
    .line 42
    iget-object v2, p0, Ll/fl40;->j:Lcom/p1/mobile/putong/data/PayMethod;

    .line 43
    .line 44
    const-string v6, "jingdong"

    .line 45
    .line 46
    invoke-static {v2, v6}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    if-nez v2, :cond_1

    .line 51
    .line 52
    iget-object v2, p0, Ll/fl40;->j:Lcom/p1/mobile/putong/data/PayMethod;

    .line 53
    .line 54
    invoke-static {v2, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    if-nez v2, :cond_3

    .line 59
    .line 60
    iget-object v2, p0, Ll/fl40;->o:Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;

    .line 61
    .line 62
    sget-object v6, Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;->hidden:Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;

    .line 63
    .line 64
    if-eq v2, v6, :cond_1

    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_1
    iget-boolean v1, p0, Ll/fl40;->z:Z

    .line 68
    .line 69
    iget-boolean v2, p0, Ll/fl40;->t:Z

    .line 70
    .line 71
    if-eqz v1, :cond_2

    .line 72
    .line 73
    invoke-static {v0, v2}, Ll/bn60;->E(Lcom/p1/mobile/putong/core/data/PurchaseType;Z)Ljava/lang/CharSequence;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    goto/16 :goto_2

    .line 78
    .line 79
    :cond_2
    invoke-static {v0, v2}, Ll/bn60;->m(Lcom/p1/mobile/putong/core/data/PurchaseType;Z)Ljava/lang/CharSequence;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    goto/16 :goto_2

    .line 84
    .line 85
    :cond_3
    :goto_1
    invoke-static {v0}, Ll/wib0;->o(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 86
    .line 87
    .line 88
    move-result v2

    .line 89
    if-eqz v2, :cond_5

    .line 90
    .line 91
    iget-object v2, p0, Ll/fl40;->f:Ljava/lang/String;

    .line 92
    .line 93
    const-string v5, "PrivilegePlatinumContent"

    .line 94
    .line 95
    invoke-static {v2, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 96
    .line 97
    .line 98
    move-result v2

    .line 99
    if-eqz v2, :cond_4

    .line 100
    .line 101
    invoke-static {v4}, Ll/bn60;->R(Z)I

    .line 102
    .line 103
    .line 104
    move-result v2

    .line 105
    invoke-static {v1, v2}, Ll/bn60;->C(Lcom/p1/mobile/putong/core/data/Merchandise;I)Ljava/lang/CharSequence;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    goto/16 :goto_2

    .line 110
    .line 111
    :cond_4
    invoke-static {v3}, Ll/bn60;->R(Z)I

    .line 112
    .line 113
    .line 114
    move-result v2

    .line 115
    invoke-static {v1, v2}, Ll/bn60;->C(Lcom/p1/mobile/putong/core/data/Merchandise;I)Ljava/lang/CharSequence;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    goto/16 :goto_2

    .line 120
    .line 121
    :cond_5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 122
    .line 123
    .line 124
    move-result-object v2

    .line 125
    invoke-virtual {v2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 126
    .line 127
    .line 128
    move-result-object v2

    .line 129
    invoke-interface {v2}, Ll/r97;->f()Z

    .line 130
    .line 131
    .line 132
    move-result v2

    .line 133
    if-eqz v2, :cond_8

    .line 134
    .line 135
    invoke-static {v0}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 136
    .line 137
    .line 138
    move-result v2

    .line 139
    if-eqz v2, :cond_8

    .line 140
    .line 141
    iget-boolean v2, p0, Ll/fl40;->z:Z

    .line 142
    .line 143
    if-eqz v2, :cond_6

    .line 144
    .line 145
    invoke-static {v1}, Ll/bn60;->B(Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/CharSequence;

    .line 146
    .line 147
    .line 148
    move-result-object v1

    .line 149
    goto/16 :goto_2

    .line 150
    .line 151
    :cond_6
    iget-object v2, p0, Ll/fl40;->f:Ljava/lang/String;

    .line 152
    .line 153
    const-string v5, "PrivilegeODiamondContent"

    .line 154
    .line 155
    invoke-static {v2, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 156
    .line 157
    .line 158
    move-result v2

    .line 159
    if-eqz v2, :cond_7

    .line 160
    .line 161
    invoke-static {v4}, Ll/bn60;->Q(Z)I

    .line 162
    .line 163
    .line 164
    move-result v2

    .line 165
    invoke-static {v1, v2}, Ll/bn60;->A(Lcom/p1/mobile/putong/core/data/Merchandise;I)Ljava/lang/CharSequence;

    .line 166
    .line 167
    .line 168
    move-result-object v1

    .line 169
    goto/16 :goto_2

    .line 170
    .line 171
    :cond_7
    invoke-static {v3}, Ll/bn60;->Q(Z)I

    .line 172
    .line 173
    .line 174
    move-result v2

    .line 175
    invoke-static {v1, v2}, Ll/bn60;->A(Lcom/p1/mobile/putong/core/data/Merchandise;I)Ljava/lang/CharSequence;

    .line 176
    .line 177
    .line 178
    move-result-object v1

    .line 179
    goto/16 :goto_2

    .line 180
    .line 181
    :cond_8
    invoke-static {v0}, Ll/wib0;->q(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 182
    .line 183
    .line 184
    move-result v2

    .line 185
    const-string v6, "lowPriceCustomerUpliftSVIP"

    .line 186
    .line 187
    const-string v7, "lowPriceCustomerSVIP"

    .line 188
    .line 189
    const-string v8, "svip"

    .line 190
    .line 191
    if-eqz v2, :cond_15

    .line 192
    .line 193
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Merchandise;->monthly()Z

    .line 194
    .line 195
    .line 196
    move-result v2

    .line 197
    if-eqz v2, :cond_a

    .line 198
    .line 199
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    .line 200
    .line 201
    .line 202
    move-result v2

    .line 203
    if-eqz v2, :cond_a

    .line 204
    .line 205
    invoke-static {v1}, Ll/v5b0;->k(Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    .line 206
    .line 207
    .line 208
    move-result v2

    .line 209
    if-eqz v2, :cond_a

    .line 210
    .line 211
    iget-boolean v2, p0, Ll/fl40;->v:Z

    .line 212
    .line 213
    iget-object v5, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 214
    .line 215
    const-string v6, "#.#"

    .line 216
    .line 217
    if-eqz v2, :cond_9

    .line 218
    .line 219
    iget-object v2, v5, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 220
    .line 221
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Prices;->currencySymbol:Ljava/lang/String;

    .line 222
    .line 223
    new-instance v5, Ljava/text/DecimalFormat;

    .line 224
    .line 225
    invoke-direct {v5, v6}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 226
    .line 227
    .line 228
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 229
    .line 230
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 231
    .line 232
    iget-wide v6, v1, Lcom/p1/mobile/putong/core/data/Prices;->price:D

    .line 233
    .line 234
    invoke-virtual {v5, v6, v7}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object v1

    .line 238
    invoke-static {v2, v1}, Ll/bn60;->y(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 239
    .line 240
    .line 241
    move-result-object v1

    .line 242
    goto/16 :goto_2

    .line 243
    .line 244
    :cond_9
    iget-object v2, v5, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 245
    .line 246
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Prices;->currencySymbol:Ljava/lang/String;

    .line 247
    .line 248
    new-instance v5, Ljava/text/DecimalFormat;

    .line 249
    .line 250
    invoke-direct {v5, v6}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 251
    .line 252
    .line 253
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 254
    .line 255
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 256
    .line 257
    iget-wide v6, v1, Lcom/p1/mobile/putong/core/data/Prices;->price:D

    .line 258
    .line 259
    invoke-virtual {v5, v6, v7}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 260
    .line 261
    .line 262
    move-result-object v1

    .line 263
    invoke-static {v2, v1}, Ll/bn60;->L(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 264
    .line 265
    .line 266
    move-result-object v1

    .line 267
    goto/16 :goto_2

    .line 268
    .line 269
    :cond_a
    invoke-static {v8}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 270
    .line 271
    .line 272
    move-result-object v2

    .line 273
    invoke-static {v1, v2, v7}, Ll/v5b0;->p(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/lang/String;)Z

    .line 274
    .line 275
    .line 276
    move-result v2

    .line 277
    if-eqz v2, :cond_e

    .line 278
    .line 279
    iget-object v2, p0, Ll/fl40;->j:Lcom/p1/mobile/putong/data/PayMethod;

    .line 280
    .line 281
    invoke-static {v2, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 282
    .line 283
    .line 284
    move-result v2

    .line 285
    iget-boolean v5, p0, Ll/fl40;->v:Z

    .line 286
    .line 287
    if-eqz v2, :cond_c

    .line 288
    .line 289
    iget-boolean v2, p0, Ll/fl40;->t:Z

    .line 290
    .line 291
    if-eqz v5, :cond_b

    .line 292
    .line 293
    invoke-static {v1, v0, v2}, Ll/bn60;->u(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/PurchaseType;Z)Ljava/lang/CharSequence;

    .line 294
    .line 295
    .line 296
    move-result-object v1

    .line 297
    goto/16 :goto_2

    .line 298
    .line 299
    :cond_b
    invoke-static {v1, v0, v2}, Ll/bn60;->I(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/PurchaseType;Z)Ljava/lang/CharSequence;

    .line 300
    .line 301
    .line 302
    move-result-object v1

    .line 303
    goto/16 :goto_2

    .line 304
    .line 305
    :cond_c
    iget-boolean v2, p0, Ll/fl40;->t:Z

    .line 306
    .line 307
    if-eqz v5, :cond_d

    .line 308
    .line 309
    invoke-static {v1, v0, v2}, Ll/bn60;->t(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/PurchaseType;Z)Ljava/lang/CharSequence;

    .line 310
    .line 311
    .line 312
    move-result-object v1

    .line 313
    goto/16 :goto_2

    .line 314
    .line 315
    :cond_d
    invoke-static {v1, v0, v2}, Ll/bn60;->H(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/PurchaseType;Z)Ljava/lang/CharSequence;

    .line 316
    .line 317
    .line 318
    move-result-object v1

    .line 319
    goto/16 :goto_2

    .line 320
    .line 321
    :cond_e
    invoke-static {v8}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 322
    .line 323
    .line 324
    move-result-object v2

    .line 325
    invoke-static {v1, v2, v6}, Ll/v5b0;->p(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/lang/String;)Z

    .line 326
    .line 327
    .line 328
    move-result v2

    .line 329
    if-eqz v2, :cond_12

    .line 330
    .line 331
    iget-object v2, p0, Ll/fl40;->j:Lcom/p1/mobile/putong/data/PayMethod;

    .line 332
    .line 333
    invoke-static {v2, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 334
    .line 335
    .line 336
    move-result v2

    .line 337
    iget-boolean v5, p0, Ll/fl40;->v:Z

    .line 338
    .line 339
    if-eqz v2, :cond_10

    .line 340
    .line 341
    iget-boolean v2, p0, Ll/fl40;->t:Z

    .line 342
    .line 343
    if-eqz v5, :cond_f

    .line 344
    .line 345
    invoke-static {v1, v0, v2}, Ll/bn60;->u(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/PurchaseType;Z)Ljava/lang/CharSequence;

    .line 346
    .line 347
    .line 348
    move-result-object v1

    .line 349
    goto/16 :goto_2

    .line 350
    .line 351
    :cond_f
    invoke-static {v1, v0, v2}, Ll/bn60;->I(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/PurchaseType;Z)Ljava/lang/CharSequence;

    .line 352
    .line 353
    .line 354
    move-result-object v1

    .line 355
    goto/16 :goto_2

    .line 356
    .line 357
    :cond_10
    iget-boolean v2, p0, Ll/fl40;->t:Z

    .line 358
    .line 359
    if-eqz v5, :cond_11

    .line 360
    .line 361
    invoke-static {v1, v0, v2}, Ll/bn60;->t(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/PurchaseType;Z)Ljava/lang/CharSequence;

    .line 362
    .line 363
    .line 364
    move-result-object v1

    .line 365
    goto/16 :goto_2

    .line 366
    .line 367
    :cond_11
    invoke-static {v1, v0, v2}, Ll/bn60;->H(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/PurchaseType;Z)Ljava/lang/CharSequence;

    .line 368
    .line 369
    .line 370
    move-result-object v1

    .line 371
    goto/16 :goto_2

    .line 372
    .line 373
    :cond_12
    iget-boolean v2, p0, Ll/fl40;->v:Z

    .line 374
    .line 375
    if-eqz v2, :cond_13

    .line 376
    .line 377
    invoke-static {v8, v1}, Ll/v5b0;->v(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    .line 378
    .line 379
    .line 380
    move-result v2

    .line 381
    if-eqz v2, :cond_13

    .line 382
    .line 383
    iget-boolean v2, p0, Ll/fl40;->t:Z

    .line 384
    .line 385
    invoke-static {v1, v0, v2}, Ll/bn60;->t(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/PurchaseType;Z)Ljava/lang/CharSequence;

    .line 386
    .line 387
    .line 388
    move-result-object v1

    .line 389
    goto/16 :goto_2

    .line 390
    .line 391
    :cond_13
    iget-boolean v1, p0, Ll/fl40;->v:Z

    .line 392
    .line 393
    iget-boolean v2, p0, Ll/fl40;->t:Z

    .line 394
    .line 395
    if-eqz v1, :cond_14

    .line 396
    .line 397
    invoke-static {v0, v2}, Ll/bn60;->x(Lcom/p1/mobile/putong/core/data/PurchaseType;Z)Ljava/lang/CharSequence;

    .line 398
    .line 399
    .line 400
    move-result-object v1

    .line 401
    goto/16 :goto_2

    .line 402
    .line 403
    :cond_14
    invoke-static {v0, v2}, Ll/bn60;->G(Lcom/p1/mobile/putong/core/data/PurchaseType;Z)Ljava/lang/CharSequence;

    .line 404
    .line 405
    .line 406
    move-result-object v1

    .line 407
    goto/16 :goto_2

    .line 408
    .line 409
    :cond_15
    invoke-static {v0}, Ll/wib0;->w(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 410
    .line 411
    .line 412
    move-result v2

    .line 413
    if-eqz v2, :cond_1c

    .line 414
    .line 415
    invoke-static {}, Ll/tqi;->c()Z

    .line 416
    .line 417
    .line 418
    move-result v2

    .line 419
    const-string v5, "tttVip"

    .line 420
    .line 421
    if-eqz v2, :cond_17

    .line 422
    .line 423
    invoke-static {v5}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 424
    .line 425
    .line 426
    move-result-object v2

    .line 427
    const-string v6, "lowPrice3Month"

    .line 428
    .line 429
    invoke-static {v1, v2, v6}, Ll/v5b0;->p(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/lang/String;)Z

    .line 430
    .line 431
    .line 432
    move-result v2

    .line 433
    if-eqz v2, :cond_17

    .line 434
    .line 435
    iget-boolean v2, p0, Ll/fl40;->v:Z

    .line 436
    .line 437
    if-eqz v2, :cond_16

    .line 438
    .line 439
    iget-object v2, p0, Ll/fl40;->d:Lcom/p1/mobile/android/app/Act;

    .line 440
    .line 441
    invoke-static {v2, v1, v0}, Ll/bn60;->s(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/lang/CharSequence;

    .line 442
    .line 443
    .line 444
    move-result-object v1

    .line 445
    goto/16 :goto_2

    .line 446
    .line 447
    :cond_16
    iget-boolean v2, p0, Ll/fl40;->t:Z

    .line 448
    .line 449
    invoke-static {v1, v0, v2}, Ll/bn60;->H(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/PurchaseType;Z)Ljava/lang/CharSequence;

    .line 450
    .line 451
    .line 452
    move-result-object v1

    .line 453
    goto/16 :goto_2

    .line 454
    .line 455
    :cond_17
    invoke-static {}, Ll/tqi;->c()Z

    .line 456
    .line 457
    .line 458
    move-result v2

    .line 459
    if-eqz v2, :cond_1a

    .line 460
    .line 461
    invoke-static {v5}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 462
    .line 463
    .line 464
    move-result-object v2

    .line 465
    const-string v6, "lowPriceCustomerVIP"

    .line 466
    .line 467
    invoke-static {v1, v2, v6}, Ll/v5b0;->p(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/lang/String;)Z

    .line 468
    .line 469
    .line 470
    move-result v2

    .line 471
    if-nez v2, :cond_18

    .line 472
    .line 473
    iget-boolean v2, p0, Ll/fl40;->v:Z

    .line 474
    .line 475
    if-eqz v2, :cond_1a

    .line 476
    .line 477
    invoke-static {v5, v1}, Ll/v5b0;->v(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    .line 478
    .line 479
    .line 480
    move-result v2

    .line 481
    if-eqz v2, :cond_1a

    .line 482
    .line 483
    :cond_18
    iget-boolean v2, p0, Ll/fl40;->v:Z

    .line 484
    .line 485
    iget-boolean v5, p0, Ll/fl40;->t:Z

    .line 486
    .line 487
    if-eqz v2, :cond_19

    .line 488
    .line 489
    invoke-static {v1, v0, v5}, Ll/bn60;->t(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/PurchaseType;Z)Ljava/lang/CharSequence;

    .line 490
    .line 491
    .line 492
    move-result-object v1

    .line 493
    goto/16 :goto_2

    .line 494
    .line 495
    :cond_19
    invoke-static {v1, v0, v5}, Ll/bn60;->H(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/PurchaseType;Z)Ljava/lang/CharSequence;

    .line 496
    .line 497
    .line 498
    move-result-object v1

    .line 499
    goto/16 :goto_2

    .line 500
    .line 501
    :cond_1a
    iget-boolean v1, p0, Ll/fl40;->v:Z

    .line 502
    .line 503
    iget-boolean v2, p0, Ll/fl40;->t:Z

    .line 504
    .line 505
    if-eqz v1, :cond_1b

    .line 506
    .line 507
    invoke-static {v0, v2}, Ll/bn60;->x(Lcom/p1/mobile/putong/core/data/PurchaseType;Z)Ljava/lang/CharSequence;

    .line 508
    .line 509
    .line 510
    move-result-object v1

    .line 511
    goto/16 :goto_2

    .line 512
    .line 513
    :cond_1b
    invoke-static {v0, v2}, Ll/bn60;->G(Lcom/p1/mobile/putong/core/data/PurchaseType;Z)Ljava/lang/CharSequence;

    .line 514
    .line 515
    .line 516
    move-result-object v1

    .line 517
    goto :goto_2

    .line 518
    :cond_1c
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 519
    .line 520
    .line 521
    move-result-object v2

    .line 522
    invoke-virtual {v2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 523
    .line 524
    .line 525
    move-result-object v2

    .line 526
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->k()Z

    .line 527
    .line 528
    .line 529
    move-result v2

    .line 530
    if-eqz v2, :cond_20

    .line 531
    .line 532
    sget-object v2, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_SVIP_PICKS_MEMBERSHIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 533
    .line 534
    if-ne v2, v0, :cond_20

    .line 535
    .line 536
    const-string v2, "svipPicksMembership"

    .line 537
    .line 538
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 539
    .line 540
    .line 541
    move-result-object v2

    .line 542
    const-string v5, "lowPriceSVIPPicks"

    .line 543
    .line 544
    invoke-static {v1, v2, v5}, Ll/v5b0;->p(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/lang/String;)Z

    .line 545
    .line 546
    .line 547
    move-result v2

    .line 548
    if-eqz v2, :cond_1d

    .line 549
    .line 550
    iget-boolean v2, p0, Ll/fl40;->t:Z

    .line 551
    .line 552
    invoke-static {v1, v0, v2}, Ll/bn60;->H(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/PurchaseType;Z)Ljava/lang/CharSequence;

    .line 553
    .line 554
    .line 555
    move-result-object v1

    .line 556
    goto :goto_2

    .line 557
    :cond_1d
    invoke-static {v8}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 558
    .line 559
    .line 560
    move-result-object v2

    .line 561
    invoke-static {v1, v2, v7}, Ll/v5b0;->p(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/lang/String;)Z

    .line 562
    .line 563
    .line 564
    move-result v2

    .line 565
    if-eqz v2, :cond_1e

    .line 566
    .line 567
    iget-boolean v2, p0, Ll/fl40;->t:Z

    .line 568
    .line 569
    invoke-static {v1, v0, v2}, Ll/bn60;->H(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/PurchaseType;Z)Ljava/lang/CharSequence;

    .line 570
    .line 571
    .line 572
    move-result-object v1

    .line 573
    goto :goto_2

    .line 574
    :cond_1e
    invoke-static {v8}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 575
    .line 576
    .line 577
    move-result-object v2

    .line 578
    invoke-static {v1, v2, v6}, Ll/v5b0;->p(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/lang/String;)Z

    .line 579
    .line 580
    .line 581
    move-result v2

    .line 582
    iget-boolean v5, p0, Ll/fl40;->t:Z

    .line 583
    .line 584
    if-eqz v2, :cond_1f

    .line 585
    .line 586
    invoke-static {v1, v0, v5}, Ll/bn60;->H(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/PurchaseType;Z)Ljava/lang/CharSequence;

    .line 587
    .line 588
    .line 589
    move-result-object v1

    .line 590
    goto :goto_2

    .line 591
    :cond_1f
    invoke-static {v0, v5}, Ll/bn60;->G(Lcom/p1/mobile/putong/core/data/PurchaseType;Z)Ljava/lang/CharSequence;

    .line 592
    .line 593
    .line 594
    move-result-object v1

    .line 595
    goto :goto_2

    .line 596
    :cond_20
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 597
    .line 598
    .line 599
    move-result-object v1

    .line 600
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 601
    .line 602
    .line 603
    move-result-object v1

    .line 604
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->k()Z

    .line 605
    .line 606
    .line 607
    move-result v1

    .line 608
    if-eqz v1, :cond_21

    .line 609
    .line 610
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_PICKS_MEMBERSHIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 611
    .line 612
    if-ne v1, v0, :cond_21

    .line 613
    .line 614
    iget-boolean v1, p0, Ll/fl40;->t:Z

    .line 615
    .line 616
    invoke-static {v0, v1}, Ll/bn60;->G(Lcom/p1/mobile/putong/core/data/PurchaseType;Z)Ljava/lang/CharSequence;

    .line 617
    .line 618
    .line 619
    move-result-object v1

    .line 620
    goto :goto_2

    .line 621
    :cond_21
    const-string v1, ""

    .line 622
    .line 623
    :goto_2
    iget-object v2, p0, Ll/fl40;->s:Lcom/p1/mobile/putong/core/ui/purchase/agreement/b;

    .line 624
    .line 625
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 626
    .line 627
    .line 628
    move-result v2

    .line 629
    if-eqz v2, :cond_23

    .line 630
    .line 631
    iget-object v2, p0, Ll/fl40;->s:Lcom/p1/mobile/putong/core/ui/purchase/agreement/b;

    .line 632
    .line 633
    invoke-interface {v2, v1}, Lcom/p1/mobile/putong/core/ui/purchase/agreement/b;->b(Ljava/lang/CharSequence;)V

    .line 634
    .line 635
    .line 636
    iget-object v2, p0, Ll/fl40;->s:Lcom/p1/mobile/putong/core/ui/purchase/agreement/b;

    .line 637
    .line 638
    instance-of v5, v2, Lcom/p1/mobile/putong/core/ui/purchase/agreement/a;

    .line 639
    .line 640
    if-eqz v5, :cond_23

    .line 641
    .line 642
    check-cast v2, Lcom/p1/mobile/putong/core/ui/purchase/agreement/a;

    .line 643
    .line 644
    new-instance v5, Ll/yk40;

    .line 645
    .line 646
    invoke-direct {v5, p0, v0}, Ll/yk40;-><init>(Ll/fl40;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 647
    .line 648
    .line 649
    invoke-virtual {v2, v5}, Lcom/p1/mobile/putong/core/ui/purchase/agreement/a;->n(Ll/y20;)V

    .line 650
    .line 651
    .line 652
    iget-object v0, p0, Ll/fl40;->s:Lcom/p1/mobile/putong/core/ui/purchase/agreement/b;

    .line 653
    .line 654
    move-object v5, v0

    .line 655
    check-cast v5, Lcom/p1/mobile/putong/core/ui/purchase/agreement/a;

    .line 656
    .line 657
    iget-object v6, p0, Ll/fl40;->h:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 658
    .line 659
    iget-object v7, p0, Ll/fl40;->g:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 660
    .line 661
    iget-boolean v8, p0, Ll/fl40;->p:Z

    .line 662
    .line 663
    iget-boolean v9, p0, Ll/fl40;->t:Z

    .line 664
    .line 665
    invoke-virtual {p0}, Ll/fl40;->H()Z

    .line 666
    .line 667
    .line 668
    move-result v0

    .line 669
    if-eqz v0, :cond_22

    .line 670
    .line 671
    iget-object v0, p0, Ll/fl40;->o:Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;

    .line 672
    .line 673
    sget-object v2, Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;->hidden:Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;

    .line 674
    .line 675
    if-eq v0, v2, :cond_22

    .line 676
    .line 677
    move v10, v4

    .line 678
    goto :goto_3

    .line 679
    :cond_22
    move v10, v3

    .line 680
    :goto_3
    iget-object v11, p0, Ll/fl40;->j:Lcom/p1/mobile/putong/data/PayMethod;

    .line 681
    .line 682
    invoke-virtual/range {v5 .. v11}, Lcom/p1/mobile/putong/core/ui/purchase/agreement/a;->o(Lcom/p1/mobile/putong/core/ui/purchase/d;Lcom/p1/mobile/putong/core/data/PurchaseType;ZZZLcom/p1/mobile/putong/data/PayMethod;)V

    .line 683
    .line 684
    .line 685
    :cond_23
    iget-object v0, p0, Ll/fl40;->u:Ll/y20;

    .line 686
    .line 687
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 688
    .line 689
    .line 690
    move-result v0

    .line 691
    if-eqz v0, :cond_24

    .line 692
    .line 693
    iget-object p0, p0, Ll/fl40;->u:Ll/y20;

    .line 694
    .line 695
    invoke-interface {p0, v1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 696
    .line 697
    .line 698
    :cond_24
    return-void
.end method

.method public d0(Z)V
    .locals 1

    .line 1
    iput-boolean p1, p0, Ll/fl40;->p:Z

    .line 2
    .line 3
    iget-object p1, p0, Ll/fl40;->s:Lcom/p1/mobile/putong/core/ui/purchase/agreement/b;

    .line 4
    .line 5
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Ll/fl40;->s:Lcom/p1/mobile/putong/core/ui/purchase/agreement/b;

    .line 12
    .line 13
    instance-of v0, p1, Lcom/p1/mobile/putong/core/ui/purchase/agreement/a;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    check-cast p1, Lcom/p1/mobile/putong/core/ui/purchase/agreement/a;

    .line 18
    .line 19
    iget-boolean p0, p0, Ll/fl40;->p:Z

    .line 20
    .line 21
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/purchase/agreement/a;->h(Z)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public e(Lcom/p1/mobile/putong/data/PayMethod;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fl40;->j:Lcom/p1/mobile/putong/data/PayMethod;

    .line 2
    .line 3
    if-eq v0, p1, :cond_1

    .line 4
    .line 5
    iput-object p1, p0, Ll/fl40;->j:Lcom/p1/mobile/putong/data/PayMethod;

    .line 6
    .line 7
    invoke-static {}, Ll/g6b;->d()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/fl40;->e:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 14
    .line 15
    invoke-static {v0}, Ll/wib0;->q(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Ll/fl40;->j:Lcom/p1/mobile/putong/data/PayMethod;

    .line 22
    .line 23
    const-string v1, "wechat"

    .line 24
    .line 25
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    sget-object v0, Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;->checked:Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;

    .line 32
    .line 33
    iput-object v0, p0, Ll/fl40;->o:Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;

    .line 34
    .line 35
    :cond_0
    invoke-virtual {p0, p1}, Ll/fl40;->V(Lcom/p1/mobile/putong/data/PayMethod;)V

    .line 36
    .line 37
    .line 38
    :cond_1
    return-void
.end method

.method public g(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fl40;->l:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_2

    .line 10
    :cond_0
    if-eqz p1, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Ll/fl40;->o:Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;

    .line 13
    .line 14
    sget-object v1, Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;->hidden:Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;

    .line 15
    .line 16
    if-eq v0, v1, :cond_1

    .line 17
    .line 18
    iput-object v1, p0, Ll/fl40;->o:Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;

    .line 19
    .line 20
    goto :goto_1

    .line 21
    :cond_1
    if-nez p1, :cond_5

    .line 22
    .line 23
    iget-object p1, p0, Ll/fl40;->o:Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;

    .line 24
    .line 25
    sget-object v0, Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;->checked:Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;

    .line 26
    .line 27
    if-eq p1, v0, :cond_5

    .line 28
    .line 29
    iget-object p1, p0, Ll/fl40;->e:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 30
    .line 31
    invoke-static {p1}, Ll/g6b;->e(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_4

    .line 36
    .line 37
    iget-object p1, p0, Ll/fl40;->l:Ljava/util/List;

    .line 38
    .line 39
    invoke-virtual {p0, p1}, Ll/fl40;->I(Ljava/util/List;)Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-eqz p1, :cond_4

    .line 44
    .line 45
    iget-object p1, p0, Ll/fl40;->b:Landroid/widget/LinearLayout;

    .line 46
    .line 47
    if-eqz p1, :cond_3

    .line 48
    .line 49
    iget-object p1, p0, Ll/fl40;->s:Lcom/p1/mobile/putong/core/ui/purchase/agreement/b;

    .line 50
    .line 51
    if-eqz p1, :cond_3

    .line 52
    .line 53
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/ui/purchase/agreement/b;->a()Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    if-nez p1, :cond_2

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_2
    iget-object p1, p0, Ll/fl40;->s:Lcom/p1/mobile/putong/core/ui/purchase/agreement/b;

    .line 61
    .line 62
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/ui/purchase/agreement/b;->a()Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    :goto_0
    iget-object p1, p0, Ll/fl40;->o:Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;

    .line 67
    .line 68
    if-eq v0, p1, :cond_5

    .line 69
    .line 70
    iput-object v0, p0, Ll/fl40;->o:Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;

    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_3
    iput-object v0, p0, Ll/fl40;->o:Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;

    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_4
    iget-object p1, p0, Ll/fl40;->b:Landroid/widget/LinearLayout;

    .line 77
    .line 78
    if-eqz p1, :cond_5

    .line 79
    .line 80
    iput-object v0, p0, Ll/fl40;->o:Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;

    .line 81
    .line 82
    :goto_1
    iget-object p1, p0, Ll/fl40;->x:Ll/vhb0;

    .line 83
    .line 84
    iget-object v0, p0, Ll/fl40;->o:Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;

    .line 85
    .line 86
    iget-object v1, p0, Ll/fl40;->j:Lcom/p1/mobile/putong/data/PayMethod;

    .line 87
    .line 88
    invoke-virtual {p1, v0, v1}, Ll/vhb0;->j(Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;Lcom/p1/mobile/putong/data/PayMethod;)Ljava/util/List;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    invoke-virtual {p0, p1}, Ll/fl40;->z(Ljava/util/List;)V

    .line 93
    .line 94
    .line 95
    :cond_5
    :goto_2
    return-void
.end method

.method public h(Ljava/util/List;Ll/y20;Ll/y20;)V
    .locals 7
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
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Ll/fl40;->k:Ll/y20;

    .line 2
    .line 3
    iput-object p1, p0, Ll/fl40;->l:Ljava/util/List;

    .line 4
    .line 5
    iget-object p2, p0, Ll/fl40;->e:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 6
    .line 7
    invoke-static {p2}, Ll/g6b;->e(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ll/fl40;->I(Ljava/util/List;)Z

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    if-eqz p2, :cond_0

    .line 18
    .line 19
    new-instance p2, Ll/vhb0;

    .line 20
    .line 21
    iget-object p3, p0, Ll/fl40;->e:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 22
    .line 23
    new-instance v0, Ll/tkq0;

    .line 24
    .line 25
    invoke-direct {v0, p3, p1}, Ll/tkq0;-><init>(Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/util/List;)V

    .line 26
    .line 27
    .line 28
    new-instance v1, Ll/di0;

    .line 29
    .line 30
    iget-object v2, p0, Ll/fl40;->e:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 31
    .line 32
    invoke-direct {v1, v2, p1}, Ll/di0;-><init>(Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/util/List;)V

    .line 33
    .line 34
    .line 35
    new-instance v2, Ll/ai0;

    .line 36
    .line 37
    iget-object v3, p0, Ll/fl40;->e:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 38
    .line 39
    invoke-direct {v2, v3, p1}, Ll/ai0;-><init>(Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/util/List;)V

    .line 40
    .line 41
    .line 42
    new-instance v3, Ll/ti0;

    .line 43
    .line 44
    iget-object v4, p0, Ll/fl40;->e:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 45
    .line 46
    invoke-direct {v3, v4, p1}, Ll/ti0;-><init>(Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/util/List;)V

    .line 47
    .line 48
    .line 49
    new-instance v4, Ll/j550;

    .line 50
    .line 51
    iget-object v5, p0, Ll/fl40;->e:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 52
    .line 53
    invoke-direct {v4, v5, p1}, Ll/j550;-><init>(Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/util/List;)V

    .line 54
    .line 55
    .line 56
    const/4 v5, 0x5

    .line 57
    new-array v5, v5, [Ll/m5;

    .line 58
    .line 59
    const/4 v6, 0x0

    .line 60
    aput-object v0, v5, v6

    .line 61
    .line 62
    const/4 v0, 0x1

    .line 63
    aput-object v1, v5, v0

    .line 64
    .line 65
    const/4 v0, 0x2

    .line 66
    aput-object v2, v5, v0

    .line 67
    .line 68
    const/4 v0, 0x3

    .line 69
    aput-object v3, v5, v0

    .line 70
    .line 71
    const/4 v0, 0x4

    .line 72
    aput-object v4, v5, v0

    .line 73
    .line 74
    invoke-static {v5}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-direct {p2, p3, p1, v0}, Ll/vhb0;-><init>(Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/util/List;Ljava/util/List;)V

    .line 79
    .line 80
    .line 81
    iput-object p2, p0, Ll/fl40;->x:Ll/vhb0;

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_0
    new-instance p2, Ll/vhb0;

    .line 85
    .line 86
    iget-object p3, p0, Ll/fl40;->e:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 87
    .line 88
    invoke-direct {p2, p3, p1}, Ll/vhb0;-><init>(Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/util/List;)V

    .line 89
    .line 90
    .line 91
    iput-object p2, p0, Ll/fl40;->x:Ll/vhb0;

    .line 92
    .line 93
    :goto_0
    iget-object p1, p0, Ll/fl40;->x:Ll/vhb0;

    .line 94
    .line 95
    iget-object p2, p0, Ll/fl40;->o:Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;

    .line 96
    .line 97
    iget-object p3, p0, Ll/fl40;->j:Lcom/p1/mobile/putong/data/PayMethod;

    .line 98
    .line 99
    invoke-virtual {p1, p2, p3}, Ll/vhb0;->j(Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;Lcom/p1/mobile/putong/data/PayMethod;)Ljava/util/List;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    invoke-virtual {p0, p1}, Ll/fl40;->z(Ljava/util/List;)V

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method public release()V
    .locals 0

    .line 1
    return-void
.end method

.method public final x(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/gl40;->a(Ll/fl40;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public y(Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/fl40;->l:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;->checked:Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;

    .line 11
    .line 12
    if-ne p1, v0, :cond_1

    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    goto :goto_0

    .line 16
    :cond_1
    const/4 v0, 0x0

    .line 17
    :goto_0
    invoke-virtual {p0}, Ll/fl40;->H()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_2

    .line 22
    .line 23
    iget-object v1, p0, Ll/fl40;->l:Ljava/util/List;

    .line 24
    .line 25
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-eqz v2, :cond_2

    .line 34
    .line 35
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    check-cast v2, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 40
    .line 41
    invoke-virtual {v2, v0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->w(Z)V

    .line 42
    .line 43
    .line 44
    new-instance v3, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    const-string v4, "changeAutoRenew:"

    .line 47
    .line 48
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/ui/purchase/d;->p(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_2
    iget-object v0, p0, Ll/fl40;->x:Ll/vhb0;

    .line 63
    .line 64
    iget-object v1, p0, Ll/fl40;->j:Lcom/p1/mobile/putong/data/PayMethod;

    .line 65
    .line 66
    invoke-virtual {v0, p1, v1}, Ll/vhb0;->j(Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;Lcom/p1/mobile/putong/data/PayMethod;)Ljava/util/List;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-virtual {p0, p1}, Ll/fl40;->z(Ljava/util/List;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public final z(Ljava/util/List;)V
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
    iget-object v0, p0, Ll/fl40;->b:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/fl40;->m:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/fl40;->m:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Ll/fl40;->m:Ljava/util/List;

    .line 17
    .line 18
    invoke-direct {p0, p1}, Ll/fl40;->X(Ljava/util/List;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
