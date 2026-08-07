.class public abstract Ll/ip0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/cqe0;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/ip0$a;
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/android/app/Act;

.field public final b:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public c:Landroid/widget/LinearLayout;

.field public d:Landroid/view/View;

.field public e:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;"
        }
    .end annotation
.end field

.field public f:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;"
        }
    .end annotation
.end field

.field public g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;"
        }
    .end annotation
.end field

.field public h:Lcom/p1/mobile/putong/core/ui/purchase/d;

.field public i:Lcom/p1/mobile/putong/core/ui/purchase/showcase/AbsPurchaseSectionView;

.field public j:Z

.field public k:Z

.field public l:F

.field public m:F

.field public n:Ll/eij0;

.field public o:Ll/ip0$a;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/ip0;->j:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Ll/ip0;->k:Z

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput v0, p0, Ll/ip0;->l:F

    .line 11
    .line 12
    const/high16 v0, -0x40800000    # -1.0f

    .line 13
    .line 14
    iput v0, p0, Ll/ip0;->m:F

    .line 15
    .line 16
    new-instance v0, Ll/eij0;

    .line 17
    .line 18
    invoke-direct {v0}, Ll/eij0;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Ll/ip0;->n:Ll/eij0;

    .line 22
    .line 23
    iput-object p1, p0, Ll/ip0;->a:Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    iput-object p2, p0, Ll/ip0;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 26
    .line 27
    return-void
.end method

.method public static synthetic g(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Landroid/graphics/drawable/TransitionDrawable;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Landroid/graphics/drawable/TransitionDrawable;

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    invoke-virtual {p0, v0}, Landroid/graphics/drawable/TransitionDrawable;->startTransition(I)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/core/ui/purchase/d;)V
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

.method public static synthetic j(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Landroid/graphics/drawable/TransitionDrawable;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Landroid/graphics/drawable/TransitionDrawable;

    .line 14
    .line 15
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/16 p0, 0xc8

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    :goto_0
    invoke-virtual {v0, p0}, Landroid/graphics/drawable/TransitionDrawable;->reverseTransition(I)V

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void
.end method

.method public static synthetic k(Ll/ip0;Lcom/p1/mobile/putong/core/ui/purchase/d;Ljava/util/List;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/ip0;->A(Lcom/p1/mobile/putong/core/ui/purchase/d;Ljava/util/List;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic l(Ll/ip0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ip0;->z()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final synthetic A(Lcom/p1/mobile/putong/core/ui/purchase/d;Ljava/util/List;Landroid/view/View;)V
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
    iget-object p3, p0, Ll/ip0;->f:Ll/y20;

    .line 8
    .line 9
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p3

    .line 13
    if-eqz p3, :cond_0

    .line 14
    .line 15
    iget-object p3, p0, Ll/ip0;->f:Ll/y20;

    .line 16
    .line 17
    invoke-interface {p3, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->l()Z

    .line 21
    .line 22
    .line 23
    move-result p3

    .line 24
    if-nez p3, :cond_2

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->f()Z

    .line 27
    .line 28
    .line 29
    move-result p3

    .line 30
    if-nez p3, :cond_1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    new-instance p3, Ll/gp0;

    .line 34
    .line 35
    invoke-direct {p3}, Ll/gp0;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-static {p2, p3}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 39
    .line 40
    .line 41
    const/4 p2, 0x1

    .line 42
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->v(Z)V

    .line 43
    .line 44
    .line 45
    iput-boolean p2, p1, Lcom/p1/mobile/putong/core/ui/purchase/d;->k:Z

    .line 46
    .line 47
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->m()Z

    .line 48
    .line 49
    .line 50
    move-result p2

    .line 51
    invoke-virtual {p0}, Ll/ip0;->D()V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0, p1}, Ll/ip0;->E(Lcom/p1/mobile/putong/core/ui/purchase/d;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->m()Z

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    xor-int/2addr p1, p2

    .line 62
    invoke-virtual {p0, p1}, Ll/ip0;->m(Z)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_2
    :goto_0
    iget-object p2, p0, Ll/ip0;->o:Ll/ip0$a;

    .line 67
    .line 68
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result p2

    .line 72
    if-eqz p2, :cond_3

    .line 73
    .line 74
    iget-object p0, p0, Ll/ip0;->o:Ll/ip0$a;

    .line 75
    .line 76
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->l()Z

    .line 77
    .line 78
    .line 79
    move-result p2

    .line 80
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->f()Z

    .line 81
    .line 82
    .line 83
    move-result p1

    .line 84
    invoke-interface {p0, p2, p1}, Ll/ip0$a;->a(ZZ)V

    .line 85
    .line 86
    .line 87
    :cond_3
    return-void
.end method

.method public B(Landroid/view/View;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Landroid/view/ViewGroup;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-object p1
.end method

.method public abstract C(Lcom/p1/mobile/putong/core/ui/purchase/d;)V
.end method

.method public abstract D()V
.end method

.method public E(Lcom/p1/mobile/putong/core/ui/purchase/d;)V
    .locals 0

    .line 1
    return-void
.end method

.method public abstract F(Lcom/p1/mobile/putong/core/ui/purchase/showcase/AbsPurchaseSectionView;Lcom/p1/mobile/putong/core/ui/purchase/d;Z)V
.end method

.method public G(Ljava/util/List;)V
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
    const/4 v0, 0x0

    .line 2
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    if-ge v0, v1, :cond_4

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
    invoke-virtual {p0, v0, p1}, Ll/ip0;->u(ILjava/util/List;)Ll/pf60;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    iget-object v3, v2, Ll/pf60;->a:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast v3, Lcom/p1/mobile/putong/core/ui/purchase/showcase/AbsPurchaseSectionView;

    .line 21
    .line 22
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->l()Z

    .line 23
    .line 24
    .line 25
    move-result v4

    .line 26
    invoke-virtual {p0, v3, v1, v4}, Ll/ip0;->F(Lcom/p1/mobile/putong/core/ui/purchase/showcase/AbsPurchaseSectionView;Lcom/p1/mobile/putong/core/ui/purchase/d;Z)V

    .line 27
    .line 28
    .line 29
    iget-object v2, v2, Ll/pf60;->b:Ljava/lang/Object;

    .line 30
    .line 31
    if-eqz v2, :cond_0

    .line 32
    .line 33
    iget-object v4, p0, Ll/ip0;->c:Landroid/widget/LinearLayout;

    .line 34
    .line 35
    check-cast v2, Landroid/view/ViewGroup$LayoutParams;

    .line 36
    .line 37
    invoke-virtual {v4, v3, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 38
    .line 39
    .line 40
    :cond_0
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->l()Z

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    if-eqz v2, :cond_3

    .line 45
    .line 46
    iget-boolean v2, p0, Ll/ip0;->j:Z

    .line 47
    .line 48
    if-nez v2, :cond_1

    .line 49
    .line 50
    invoke-virtual {p0, v3}, Ll/ip0;->I(Lcom/p1/mobile/putong/core/ui/purchase/showcase/AbsPurchaseSectionView;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0, v1}, Ll/ip0;->C(Lcom/p1/mobile/putong/core/ui/purchase/d;)V

    .line 54
    .line 55
    .line 56
    const/4 v2, 0x1

    .line 57
    iput-boolean v2, p0, Ll/ip0;->j:Z

    .line 58
    .line 59
    :cond_1
    iput-object v1, p0, Ll/ip0;->h:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 60
    .line 61
    iget-object v2, p0, Ll/ip0;->e:Ll/y20;

    .line 62
    .line 63
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    if-eqz v2, :cond_2

    .line 68
    .line 69
    iget-object v2, p0, Ll/ip0;->e:Ll/y20;

    .line 70
    .line 71
    invoke-interface {v2, v1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 72
    .line 73
    .line 74
    :cond_2
    invoke-interface {p0}, Ll/t5m;->b()V

    .line 75
    .line 76
    .line 77
    :cond_3
    add-int/lit8 v0, v0, 0x1

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_4
    return-void
.end method

.method public H(Ll/ip0$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ip0;->o:Ll/ip0$a;

    .line 2
    .line 3
    return-void
.end method

.method public final I(Lcom/p1/mobile/putong/core/ui/purchase/showcase/AbsPurchaseSectionView;)V
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/core/ui/purchase/showcase/AnimBorderSectionView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/core/ui/purchase/showcase/AnimBorderSectionView;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/AnimBorderSectionView;->getAnimBackgroundList()Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance p1, Ll/ep0;

    .line 12
    .line 13
    invoke-direct {p1}, Ll/ep0;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-static {p0, p1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public final J(Landroid/view/View;)V
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/core/ui/purchase/showcase/AnimBorderSectionView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/core/ui/purchase/showcase/AnimBorderSectionView;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/AnimBorderSectionView;->getAnimBackgroundList()Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance p1, Ll/hp0;

    .line 12
    .line 13
    invoke-direct {p1}, Ll/hp0;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-static {p0, p1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public final K()V
    .locals 9

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x0

    .line 3
    :goto_0
    iget-object v2, p0, Ll/ip0;->g:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-ge v1, v2, :cond_6

    .line 10
    .line 11
    iget-object v2, p0, Ll/ip0;->g:Ljava/util/List;

    .line 12
    .line 13
    invoke-virtual {p0, v1, v2}, Ll/ip0;->u(ILjava/util/List;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    iget-object v2, v2, Ll/pf60;->a:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast v2, Lcom/p1/mobile/putong/core/ui/purchase/showcase/AbsPurchaseSectionView;

    .line 20
    .line 21
    instance-of v3, v2, Lcom/p1/mobile/putong/core/ui/purchase/showcase/AnimBorderSectionView;

    .line 22
    .line 23
    if-eqz v3, :cond_5

    .line 24
    .line 25
    iget-object v3, p0, Ll/ip0;->g:Ljava/util/List;

    .line 26
    .line 27
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    check-cast v3, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 32
    .line 33
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/purchase/d;->l()Z

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    check-cast v4, Landroid/widget/LinearLayout$LayoutParams;

    .line 42
    .line 43
    iget v5, p0, Ll/ip0;->l:F

    .line 44
    .line 45
    const/4 v6, 0x0

    .line 46
    cmpg-float v7, v5, v6

    .line 47
    .line 48
    const v8, 0x3f9624dd    # 1.173f

    .line 49
    .line 50
    .line 51
    if-gtz v7, :cond_1

    .line 52
    .line 53
    if-eqz v3, :cond_0

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_0
    const/high16 v8, 0x3f800000    # 1.0f

    .line 57
    .line 58
    :goto_1
    iput v8, v4, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 59
    .line 60
    goto :goto_2

    .line 61
    :cond_1
    iget v7, p0, Ll/ip0;->m:F

    .line 62
    .line 63
    cmpg-float v6, v7, v6

    .line 64
    .line 65
    if-gtz v6, :cond_3

    .line 66
    .line 67
    if-eqz v3, :cond_2

    .line 68
    .line 69
    mul-float/2addr v5, v8

    .line 70
    :cond_2
    float-to-int v5, v5

    .line 71
    iput v5, v4, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 72
    .line 73
    goto :goto_2

    .line 74
    :cond_3
    if-eqz v3, :cond_4

    .line 75
    .line 76
    move v5, v7

    .line 77
    :cond_4
    float-to-int v5, v5

    .line 78
    iput v5, v4, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 79
    .line 80
    :goto_2
    invoke-virtual {v2, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 81
    .line 82
    .line 83
    if-eqz v3, :cond_5

    .line 84
    .line 85
    move-object v0, v2

    .line 86
    :cond_5
    add-int/lit8 v1, v1, 0x1

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_6
    invoke-virtual {p0, v0}, Ll/ip0;->J(Landroid/view/View;)V

    .line 90
    .line 91
    .line 92
    iget-object v1, p0, Ll/ip0;->i:Lcom/p1/mobile/putong/core/ui/purchase/showcase/AbsPurchaseSectionView;

    .line 93
    .line 94
    invoke-virtual {p0, v1}, Ll/ip0;->J(Landroid/view/View;)V

    .line 95
    .line 96
    .line 97
    iput-object v0, p0, Ll/ip0;->i:Lcom/p1/mobile/putong/core/ui/purchase/showcase/AbsPurchaseSectionView;

    .line 98
    .line 99
    iget-object v0, p0, Ll/ip0;->g:Ljava/util/List;

    .line 100
    .line 101
    invoke-virtual {p0, v0}, Ll/ip0;->G(Ljava/util/List;)V

    .line 102
    .line 103
    .line 104
    return-void
.end method

.method public L(Lcom/p1/mobile/putong/core/ui/purchase/d;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->m()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->m()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    xor-int/2addr p1, v0

    .line 10
    invoke-virtual {p0, p1}, Ll/ip0;->m(Z)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ll/ip0;->D()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public a(Landroid/view/ViewGroup;Z)Landroid/view/View;
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ip0;->y()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Ll/cqe0;->d()Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent;

    .line 8
    .line 9
    .line 10
    const/4 p1, 0x0

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
    new-instance p1, Landroid/widget/LinearLayout;

    .line 18
    .line 19
    iget-object p2, p0, Ll/ip0;->a:Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    invoke-direct {p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 22
    .line 23
    .line 24
    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;

    .line 25
    .line 26
    const/high16 v0, 0x43320000    # 178.0f

    .line 27
    .line 28
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    const/4 v1, -0x1

    .line 33
    invoke-direct {p2, v1, v0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 37
    .line 38
    .line 39
    const/4 p2, 0x0

    .line 40
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 41
    .line 42
    .line 43
    const/4 p2, 0x1

    .line 44
    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0}, Ll/ip0;->q()Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    invoke-virtual {p0, p2}, Ll/ip0;->B(Landroid/view/View;)Landroid/view/View;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0}, Ll/ip0;->p()Landroid/view/View;

    .line 59
    .line 60
    .line 61
    move-result-object p2

    .line 62
    invoke-virtual {p0, p2}, Ll/ip0;->B(Landroid/view/View;)Landroid/view/View;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 67
    .line 68
    .line 69
    return-object p1

    .line 70
    :cond_0
    invoke-virtual {p0}, Ll/ip0;->q()Landroid/view/View;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    return-object p0
.end method

.method public f(Ljava/util/List;Ll/y20;Ll/y20;Ll/y20;)V
    .locals 0
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
    iput-object p2, p0, Ll/ip0;->e:Ll/y20;

    .line 2
    .line 3
    iput-object p1, p0, Ll/ip0;->g:Ljava/util/List;

    .line 4
    .line 5
    iput-object p4, p0, Ll/ip0;->f:Ll/y20;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ip0;->n()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public h(Ljava/util/List;Ll/y20;Ll/y20;)V
    .locals 0
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
    iput-object p2, p0, Ll/ip0;->e:Ll/y20;

    .line 2
    .line 3
    iput-object p1, p0, Ll/ip0;->g:Ljava/util/List;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ip0;->n()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public m(Z)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ip0;->x()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/ip0;->c:Landroid/widget/LinearLayout;

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    new-instance p1, Ll/fp0;

    .line 9
    .line 10
    invoke-direct {p1, p0}, Ll/fp0;-><init>(Ll/ip0;)V

    .line 11
    .line 12
    .line 13
    invoke-static {v0, p1}, Ll/bnl0;->b0(Landroid/view/View;Ll/pcj;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-static {v0}, Ll/zhj0;->b(Landroid/view/ViewGroup;)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Ll/ip0;->c:Landroid/widget/LinearLayout;

    .line 21
    .line 22
    iget-object v0, p0, Ll/ip0;->n:Ll/eij0;

    .line 23
    .line 24
    invoke-static {p1, v0}, Ll/zhj0;->a(Landroid/view/ViewGroup;Ll/ygj0;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ll/ip0;->K()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public n()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/ip0;->j:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/ip0;->c:Landroid/widget/LinearLayout;

    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-lez v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/ip0;->y()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-nez v1, :cond_0

    .line 17
    .line 18
    iget-object v1, p0, Ll/ip0;->d:Landroid/view/View;

    .line 19
    .line 20
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    const/high16 v1, 0x42100000    # 36.0f

    .line 27
    .line 28
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    sub-int/2addr v0, v1

    .line 33
    int-to-float v0, v0

    .line 34
    const v1, 0x404b126f    # 3.173f

    .line 35
    .line 36
    .line 37
    div-float/2addr v0, v1

    .line 38
    iput v0, p0, Ll/ip0;->l:F

    .line 39
    .line 40
    :cond_0
    iget-object v0, p0, Ll/ip0;->c:Landroid/widget/LinearLayout;

    .line 41
    .line 42
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Ll/ip0;->g:Ljava/util/List;

    .line 46
    .line 47
    invoke-virtual {p0, v0}, Ll/ip0;->G(Ljava/util/List;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public abstract o(Lcom/p1/mobile/putong/core/ui/purchase/d;Landroid/view/ViewGroup;)Lcom/p1/mobile/putong/core/ui/purchase/showcase/AbsPurchaseSectionView;
.end method

.method public p()Landroid/view/View;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ip0;->d:Landroid/view/View;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    invoke-interface {p0}, Ll/cqe0;->d()Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent;

    .line 7
    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    throw p0
.end method

.method public q()Landroid/view/View;
    .locals 5

    .line 1
    iget-object v0, p0, Ll/ip0;->c:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    new-instance v0, Landroid/widget/LinearLayout;

    .line 6
    .line 7
    iget-object v1, p0, Ll/ip0;->a:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/ip0;->c:Landroid/widget/LinearLayout;

    .line 13
    .line 14
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 15
    .line 16
    const/4 v1, -0x2

    .line 17
    const/4 v2, -0x1

    .line 18
    invoke-direct {v0, v2, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 19
    .line 20
    .line 21
    sget v1, Ll/qa00;->g:I

    .line 22
    .line 23
    sget v3, Ll/qa00;->f:I

    .line 24
    .line 25
    const/4 v4, 0x0

    .line 26
    invoke-virtual {v0, v4, v4, v4, v3}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 27
    .line 28
    .line 29
    iget-object v3, p0, Ll/ip0;->c:Landroid/widget/LinearLayout;

    .line 30
    .line 31
    invoke-virtual {v3, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Ll/ip0;->c:Landroid/widget/LinearLayout;

    .line 35
    .line 36
    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/ip0;->c:Landroid/widget/LinearLayout;

    .line 40
    .line 41
    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Ll/ip0;->c:Landroid/widget/LinearLayout;

    .line 45
    .line 46
    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Ll/ip0;->r()I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eq v0, v2, :cond_0

    .line 54
    .line 55
    invoke-virtual {p0}, Ll/ip0;->r()I

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    :cond_0
    iget-object v0, p0, Ll/ip0;->c:Landroid/widget/LinearLayout;

    .line 60
    .line 61
    invoke-virtual {p0}, Ll/ip0;->t()I

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    invoke-virtual {p0}, Ll/ip0;->w()I

    .line 66
    .line 67
    .line 68
    move-result v3

    .line 69
    invoke-virtual {p0}, Ll/ip0;->v()I

    .line 70
    .line 71
    .line 72
    move-result v4

    .line 73
    invoke-virtual {v0, v2, v3, v4, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 74
    .line 75
    .line 76
    :cond_1
    iget-object p0, p0, Ll/ip0;->c:Landroid/widget/LinearLayout;

    .line 77
    .line 78
    return-object p0
.end method

.method public r()I
    .locals 0

    .line 1
    const/4 p0, -0x1

    .line 2
    return p0
.end method

.method public release()V
    .locals 0

    .line 1
    return-void
.end method

.method public s()I
    .locals 0

    .line 1
    sget p0, Ll/qa00;->g:I

    .line 2
    .line 3
    return p0
.end method

.method public t()I
    .locals 0

    .line 1
    sget p0, Ll/qa00;->j:I

    .line 2
    .line 3
    return p0
.end method

.method public final u(ILjava/util/List;)Ll/pf60;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;)",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/core/ui/purchase/showcase/AbsPurchaseSectionView;",
            "Landroid/widget/LinearLayout$LayoutParams;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ip0;->c:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lt p1, v0, :cond_6

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
    iget-object v1, p0, Ll/ip0;->c:Landroid/widget/LinearLayout;

    .line 16
    .line 17
    invoke-virtual {p0, v0, v1}, Ll/ip0;->o(Lcom/p1/mobile/putong/core/ui/purchase/d;Landroid/view/ViewGroup;)Lcom/p1/mobile/putong/core/ui/purchase/showcase/AbsPurchaseSectionView;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    new-instance v2, Ll/dp0;

    .line 22
    .line 23
    invoke-direct {v2, p0, v0, p2}, Ll/dp0;-><init>(Ll/ip0;Lcom/p1/mobile/putong/core/ui/purchase/d;Ljava/util/List;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 27
    .line 28
    .line 29
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    const/4 v2, 0x1

    .line 34
    if-le p2, v2, :cond_5

    .line 35
    .line 36
    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;

    .line 37
    .line 38
    const/4 v2, 0x0

    .line 39
    const/4 v3, -0x2

    .line 40
    invoke-direct {p2, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 41
    .line 42
    .line 43
    const v2, 0x800003

    .line 44
    .line 45
    .line 46
    iput v2, p2, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 47
    .line 48
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->l()Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    const/4 v2, 0x0

    .line 53
    if-eqz v0, :cond_2

    .line 54
    .line 55
    iput-object v1, p0, Ll/ip0;->i:Lcom/p1/mobile/putong/core/ui/purchase/showcase/AbsPurchaseSectionView;

    .line 56
    .line 57
    iget v0, p0, Ll/ip0;->l:F

    .line 58
    .line 59
    cmpl-float v3, v0, v2

    .line 60
    .line 61
    const v4, 0x3f9624dd    # 1.173f

    .line 62
    .line 63
    .line 64
    if-lez v3, :cond_1

    .line 65
    .line 66
    iget v3, p0, Ll/ip0;->m:F

    .line 67
    .line 68
    cmpg-float v2, v3, v2

    .line 69
    .line 70
    if-gtz v2, :cond_0

    .line 71
    .line 72
    mul-float/2addr v0, v4

    .line 73
    float-to-int v0, v0

    .line 74
    iput v0, p2, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_0
    float-to-int v0, v3

    .line 78
    iput v0, p2, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_1
    iput v4, p2, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_2
    iget v0, p0, Ll/ip0;->l:F

    .line 85
    .line 86
    cmpl-float v2, v0, v2

    .line 87
    .line 88
    if-lez v2, :cond_3

    .line 89
    .line 90
    float-to-int v0, v0

    .line 91
    iput v0, p2, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_3
    const/high16 v0, 0x3f800000    # 1.0f

    .line 95
    .line 96
    iput v0, p2, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 97
    .line 98
    :goto_0
    if-eqz p1, :cond_4

    .line 99
    .line 100
    invoke-virtual {p0}, Ll/ip0;->s()I

    .line 101
    .line 102
    .line 103
    move-result p0

    .line 104
    iput p0, p2, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 105
    .line 106
    :cond_4
    invoke-static {v1, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    return-object p0

    .line 111
    :cond_5
    new-instance p0, Landroid/widget/LinearLayout$LayoutParams;

    .line 112
    .line 113
    const/4 p1, -0x1

    .line 114
    invoke-direct {p0, p1, p1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 115
    .line 116
    .line 117
    invoke-static {v1, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    return-object p0

    .line 122
    :cond_6
    iget-object p0, p0, Ll/ip0;->c:Landroid/widget/LinearLayout;

    .line 123
    .line 124
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    check-cast p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/AbsPurchaseSectionView;

    .line 129
    .line 130
    const/4 p1, 0x0

    .line 131
    invoke-static {p0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    return-object p0
.end method

.method public v()I
    .locals 0

    .line 1
    sget p0, Ll/qa00;->j:I

    .line 2
    .line 3
    return p0
.end method

.method public w()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public final x()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/ip0;->k:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Ll/ip0;->k:Z

    .line 7
    .line 8
    iget-object v0, p0, Ll/ip0;->n:Ll/eij0;

    .line 9
    .line 10
    new-instance v1, Ll/bs4;

    .line 11
    .line 12
    invoke-direct {v1}, Ll/bs4;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ll/eij0;->f(Ll/ygj0;)Ll/eij0;

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/ip0;->n:Ll/eij0;

    .line 19
    .line 20
    new-instance v1, Lcom/google/android/material/internal/TextScale;

    .line 21
    .line 22
    invoke-direct {v1}, Lcom/google/android/material/internal/TextScale;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ll/eij0;->f(Ll/ygj0;)Ll/eij0;

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/ip0;->n:Ll/eij0;

    .line 29
    .line 30
    new-instance v1, Ll/lri0;

    .line 31
    .line 32
    invoke-direct {v1}, Ll/lri0;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ll/eij0;->f(Ll/ygj0;)Ll/eij0;

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Ll/ip0;->n:Ll/eij0;

    .line 39
    .line 40
    const-wide/16 v0, 0xc8

    .line 41
    .line 42
    invoke-virtual {p0, v0, v1}, Ll/eij0;->r(J)Ll/eij0;

    .line 43
    .line 44
    .line 45
    :cond_0
    return-void
.end method

.method public y()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public final synthetic z()Ljava/lang/Boolean;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ip0;->c:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-static {v0}, Ll/zhj0;->b(Landroid/view/ViewGroup;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/ip0;->c:Landroid/widget/LinearLayout;

    .line 7
    .line 8
    iget-object v1, p0, Ll/ip0;->n:Ll/eij0;

    .line 9
    .line 10
    invoke-static {v0, v1}, Ll/zhj0;->a(Landroid/view/ViewGroup;Ll/ygj0;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ll/ip0;->K()V

    .line 14
    .line 15
    .line 16
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 17
    .line 18
    return-object p0
.end method
