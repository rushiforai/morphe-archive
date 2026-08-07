.class public Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;
.super Lcom/p1/mobile/putong/core/ui/purchase/showcase/AnimBorderSectionView;
.source "SourceFile"


# instance fields
.field public b:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Lv/VText_AutoFit;

.field public f:Lv/VText_AutoFit;

.field public g:Landroid/view/View;

.field public h:Lv/VText;

.field public i:Lv/VImage;

.field public j:Lv/VText;

.field public k:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;"
        }
    .end annotation
.end field

.field public l:Lcom/p1/mobile/putong/core/ui/purchase/d;

.field public m:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

.field public n:Z

.field public o:Ll/bmp;

.field public p:Ljava/text/NumberFormat;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/AnimBorderSectionView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->l:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->m:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->n:Z

    .line 11
    .line 12
    invoke-static {}, Ljava/text/NumberFormat;->getNumberInstance()Ljava/text/NumberFormat;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->p:Ljava/text/NumberFormat;

    .line 17
    .line 18
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 19
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/AnimBorderSectionView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 20
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->l:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 21
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->m:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    const/4 p1, 0x0

    .line 22
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->n:Z

    .line 23
    invoke-static {}, Ljava/text/NumberFormat;->getNumberInstance()Ljava/text/NumberFormat;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->p:Ljava/text/NumberFormat;

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;Ll/a30;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->k(Ll/a30;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Landroid/view/View;)V
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

.method public static synthetic e(Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;Ll/a30;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/util/List;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->j(Ll/a30;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/util/List;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;Ll/a30;Lcom/p1/mobile/putong/core/ui/purchase/d;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->i(Ll/a30;Lcom/p1/mobile/putong/core/ui/purchase/d;Ljava/lang/Boolean;)V

    return-void
.end method

.method private h()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->qq()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method


# virtual methods
.method public a(ZZLcom/p1/mobile/putong/core/ui/purchase/d$a;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final g(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ql40;->a(Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public getAnimBackgroundList()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->j:Lv/VText;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->g:Landroid/view/View;

    .line 6
    .line 7
    const/4 v2, 0x3

    .line 8
    new-array v2, v2, [Landroid/view/View;

    .line 9
    .line 10
    const/4 v3, 0x0

    .line 11
    aput-object v0, v2, v3

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    aput-object v1, v2, v0

    .line 15
    .line 16
    const/4 v0, 0x2

    .line 17
    aput-object p0, v2, v0

    .line 18
    .line 19
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public final synthetic i(Ll/a30;Lcom/p1/mobile/putong/core/ui/purchase/d;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->o:Ll/bmp;

    .line 2
    .line 3
    invoke-virtual {p3}, Ll/bmp;->j()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->l:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 7
    .line 8
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 9
    .line 10
    .line 11
    move-result-object p3

    .line 12
    if-eqz p3, :cond_0

    .line 13
    .line 14
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 15
    .line 16
    .line 17
    move-result-object p3

    .line 18
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->m:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 22
    .line 23
    .line 24
    move-result-object p3

    .line 25
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->m:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 26
    .line 27
    :goto_0
    iget-boolean p3, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->n:Z

    .line 28
    .line 29
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->l(Z)V

    .line 30
    .line 31
    .line 32
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->n:Z

    .line 33
    .line 34
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    sget-object p3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 39
    .line 40
    invoke-interface {p1, p0, p2, p3}, Ll/a30;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final synthetic j(Ll/a30;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/util/List;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-boolean p4, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->n:Z

    .line 2
    .line 3
    if-nez p4, :cond_0

    .line 4
    .line 5
    invoke-static {p4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->l:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 10
    .line 11
    sget-object p3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-interface {p1, p2, p0, p3}, Ll/a30;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    new-instance p4, Ll/bmp$f;

    .line 18
    .line 19
    invoke-static {}, Ll/w20;->d()Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-direct {p4, v0}, Ll/bmp$f;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 24
    .line 25
    .line 26
    const-string v0, "p_knowmyself_purchase,e_knowmyself_test,click"

    .line 27
    .line 28
    invoke-virtual {p4, v0}, Ll/bmp$f;->c(Ljava/lang/String;)Ll/bmp$f;

    .line 29
    .line 30
    .line 31
    move-result-object p4

    .line 32
    invoke-virtual {p4, p2}, Ll/bmp$f;->f(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ll/bmp$f;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    const/4 p4, 0x1

    .line 37
    invoke-virtual {p2, p4}, Ll/bmp$f;->d(Z)Ll/bmp$f;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    invoke-virtual {p2, p3}, Ll/bmp$f;->e(Ljava/util/List;)Ll/bmp$f;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    new-instance p3, Ll/pl40;

    .line 46
    .line 47
    invoke-direct {p3, p0, p1}, Ll/pl40;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;Ll/a30;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p2, p3}, Ll/bmp$f;->b(Ll/z20;)Ll/bmp$f;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p1}, Ll/bmp$f;->g()Ll/bmp;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->o:Ll/bmp;

    .line 59
    .line 60
    return-void
.end method

.method public final synthetic k(Ll/a30;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->n:Z

    .line 2
    .line 3
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->l:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 8
    .line 9
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 10
    .line 11
    invoke-interface {p1, p2, p0, v0}, Ll/a30;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public l(Z)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p1

    .line 4
    .line 5
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->m:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 6
    .line 7
    if-nez v2, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->j:Lv/VText;

    .line 11
    .line 12
    const/4 v3, 0x0

    .line 13
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->k:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    const/4 v4, 0x1

    .line 23
    if-eq v2, v4, :cond_1

    .line 24
    .line 25
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->g:Landroid/view/View;

    .line 26
    .line 27
    invoke-static {v2, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    :cond_1
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->c:Lv/VText;

    .line 31
    .line 32
    invoke-virtual {v2}, Landroid/widget/TextView;->getTypeface()Landroid/graphics/Typeface;

    .line 33
    .line 34
    .line 35
    move-result-object v5

    .line 36
    invoke-virtual {v2, v5, v4}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 37
    .line 38
    .line 39
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->d:Lv/VText;

    .line 40
    .line 41
    iget-object v5, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->c:Lv/VText;

    .line 42
    .line 43
    invoke-virtual {v5}, Landroid/widget/TextView;->getTypeface()Landroid/graphics/Typeface;

    .line 44
    .line 45
    .line 46
    move-result-object v5

    .line 47
    invoke-virtual {v2, v5, v4}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 48
    .line 49
    .line 50
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->e:Lv/VText_AutoFit;

    .line 51
    .line 52
    iget-object v5, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->f:Lv/VText_AutoFit;

    .line 53
    .line 54
    invoke-virtual {v5}, Landroid/widget/TextView;->getTypeface()Landroid/graphics/Typeface;

    .line 55
    .line 56
    .line 57
    move-result-object v5

    .line 58
    invoke-virtual {v2, v5, v4}, Lv/VText_AutoFit;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 59
    .line 60
    .line 61
    const/4 v2, 0x2

    .line 62
    const-string v5, "tttPremiumUpgradeToUltra"

    .line 63
    .line 64
    const-string v6, "tttUltraPremium"

    .line 65
    .line 66
    const-string v7, "Promo_premiumUpgradeToUltra"

    .line 67
    .line 68
    const/4 v8, -0x1

    .line 69
    const-string v9, "#F9E7FF"

    .line 70
    .line 71
    const-string v10, "#3D2747"

    .line 72
    .line 73
    const-string v11, "#80FFE7AA"

    .line 74
    .line 75
    const-string v12, "#663D2747"

    .line 76
    .line 77
    const-string v13, "#66000000"

    .line 78
    .line 79
    const-string v14, "#000000"

    .line 80
    .line 81
    if-eqz v1, :cond_7

    .line 82
    .line 83
    iget-object v15, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->j:Lv/VText;

    .line 84
    .line 85
    invoke-static {v15, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 86
    .line 87
    .line 88
    iget-object v15, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->k:Ljava/util/List;

    .line 89
    .line 90
    invoke-interface {v15}, Ljava/util/List;->size()I

    .line 91
    .line 92
    .line 93
    move-result v15

    .line 94
    if-eq v15, v4, :cond_2

    .line 95
    .line 96
    iget-object v15, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->g:Landroid/view/View;

    .line 97
    .line 98
    invoke-static {v15, v4}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 99
    .line 100
    .line 101
    :cond_2
    iget-object v15, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->h:Lv/VText;

    .line 102
    .line 103
    invoke-virtual {v15}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 104
    .line 105
    .line 106
    move-result-object v15

    .line 107
    check-cast v15, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 108
    .line 109
    sget v4, Ll/fdc0;->K0:I

    .line 110
    .line 111
    iput v4, v15, Landroidx/constraintlayout/widget/ConstraintLayout$a;->h:I

    .line 112
    .line 113
    iput v3, v15, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 114
    .line 115
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->h:Lv/VText;

    .line 116
    .line 117
    invoke-virtual {v4, v15}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 118
    .line 119
    .line 120
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->i:Lv/VImage;

    .line 121
    .line 122
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 123
    .line 124
    .line 125
    move-result-object v4

    .line 126
    check-cast v4, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 127
    .line 128
    sget v15, Ll/fdc0;->K0:I

    .line 129
    .line 130
    iput v15, v4, Landroidx/constraintlayout/widget/ConstraintLayout$a;->h:I

    .line 131
    .line 132
    iput v3, v4, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 133
    .line 134
    iget-object v15, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->i:Lv/VImage;

    .line 135
    .line 136
    invoke-virtual {v15, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 137
    .line 138
    .line 139
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->m:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 140
    .line 141
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->f()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 142
    .line 143
    .line 144
    move-result-object v4

    .line 145
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object v4

    .line 149
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 150
    .line 151
    .line 152
    invoke-virtual {v4}, Ljava/lang/String;->hashCode()I

    .line 153
    .line 154
    .line 155
    move-result v15

    .line 156
    sparse-switch v15, :sswitch_data_0

    .line 157
    .line 158
    .line 159
    :goto_0
    move v4, v8

    .line 160
    goto :goto_1

    .line 161
    :sswitch_0
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 162
    .line 163
    .line 164
    move-result v4

    .line 165
    if-nez v4, :cond_3

    .line 166
    .line 167
    goto :goto_0

    .line 168
    :cond_3
    move v4, v2

    .line 169
    goto :goto_1

    .line 170
    :sswitch_1
    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 171
    .line 172
    .line 173
    move-result v4

    .line 174
    if-nez v4, :cond_4

    .line 175
    .line 176
    goto :goto_0

    .line 177
    :cond_4
    const/4 v4, 0x1

    .line 178
    goto :goto_1

    .line 179
    :sswitch_2
    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 180
    .line 181
    .line 182
    move-result v4

    .line 183
    if-nez v4, :cond_5

    .line 184
    .line 185
    goto :goto_0

    .line 186
    :cond_5
    move v4, v3

    .line 187
    :goto_1
    packed-switch v4, :pswitch_data_0

    .line 188
    .line 189
    .line 190
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->h()Z

    .line 191
    .line 192
    .line 193
    move-result v4

    .line 194
    if-eqz v4, :cond_6

    .line 195
    .line 196
    invoke-static {v14}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 197
    .line 198
    .line 199
    move-result v4

    .line 200
    invoke-static {v14}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 201
    .line 202
    .line 203
    move-result v9

    .line 204
    invoke-static {v14}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 205
    .line 206
    .line 207
    move-result v10

    .line 208
    invoke-static {v13}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 209
    .line 210
    .line 211
    move-result v11

    .line 212
    invoke-static {v14}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 213
    .line 214
    .line 215
    move-result v12

    .line 216
    goto :goto_2

    .line 217
    :cond_6
    invoke-static {v14}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 218
    .line 219
    .line 220
    move-result v4

    .line 221
    const-string v9, "#FFE7AA"

    .line 222
    .line 223
    invoke-static {v9}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 224
    .line 225
    .line 226
    move-result v10

    .line 227
    invoke-static {v9}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 228
    .line 229
    .line 230
    move-result v9

    .line 231
    invoke-static {v11}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 232
    .line 233
    .line 234
    move-result v11

    .line 235
    move v12, v10

    .line 236
    move v10, v9

    .line 237
    move v9, v12

    .line 238
    :goto_2
    sget v13, Ll/jbc0;->H2:I

    .line 239
    .line 240
    goto :goto_3

    .line 241
    :pswitch_0
    invoke-static {v9}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 242
    .line 243
    .line 244
    move-result v4

    .line 245
    invoke-static {v10}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 246
    .line 247
    .line 248
    move-result v9

    .line 249
    invoke-static {v10}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 250
    .line 251
    .line 252
    move-result v10

    .line 253
    invoke-static {v12}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 254
    .line 255
    .line 256
    move-result v11

    .line 257
    sget v13, Ll/jbc0;->P2:I

    .line 258
    .line 259
    move v12, v9

    .line 260
    :goto_3
    iget-object v14, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->c:Lv/VText;

    .line 261
    .line 262
    invoke-virtual {v14, v9}, Landroid/widget/TextView;->setTextColor(I)V

    .line 263
    .line 264
    .line 265
    iget-object v9, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->d:Lv/VText;

    .line 266
    .line 267
    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setTextColor(I)V

    .line 268
    .line 269
    .line 270
    iget-object v9, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->f:Lv/VText_AutoFit;

    .line 271
    .line 272
    invoke-virtual {v9, v11}, Landroid/widget/TextView;->setTextColor(I)V

    .line 273
    .line 274
    .line 275
    iget-object v9, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->e:Lv/VText_AutoFit;

    .line 276
    .line 277
    invoke-virtual {v9, v12}, Landroid/widget/TextView;->setTextColor(I)V

    .line 278
    .line 279
    .line 280
    iget-object v9, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->j:Lv/VText;

    .line 281
    .line 282
    invoke-virtual {v9, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 283
    .line 284
    .line 285
    iget-object v9, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->h:Lv/VText;

    .line 286
    .line 287
    invoke-virtual {v9, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 288
    .line 289
    .line 290
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->i:Lv/VImage;

    .line 291
    .line 292
    invoke-virtual {v4, v13}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 293
    .line 294
    .line 295
    goto/16 :goto_7

    .line 296
    .line 297
    :cond_7
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->h:Lv/VText;

    .line 298
    .line 299
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 300
    .line 301
    .line 302
    move-result-object v4

    .line 303
    check-cast v4, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 304
    .line 305
    iput v8, v4, Landroidx/constraintlayout/widget/ConstraintLayout$a;->h:I

    .line 306
    .line 307
    sget v15, Ll/qa00;->m:I

    .line 308
    .line 309
    iput v15, v4, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 310
    .line 311
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->h:Lv/VText;

    .line 312
    .line 313
    invoke-virtual {v3, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 314
    .line 315
    .line 316
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->i:Lv/VImage;

    .line 317
    .line 318
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 319
    .line 320
    .line 321
    move-result-object v3

    .line 322
    check-cast v3, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 323
    .line 324
    iput v8, v3, Landroidx/constraintlayout/widget/ConstraintLayout$a;->h:I

    .line 325
    .line 326
    iput v15, v3, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 327
    .line 328
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->i:Lv/VImage;

    .line 329
    .line 330
    invoke-virtual {v4, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 331
    .line 332
    .line 333
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->m:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 334
    .line 335
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->f()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 336
    .line 337
    .line 338
    move-result-object v3

    .line 339
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 340
    .line 341
    .line 342
    move-result-object v3

    .line 343
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 344
    .line 345
    .line 346
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 347
    .line 348
    .line 349
    move-result v4

    .line 350
    sparse-switch v4, :sswitch_data_1

    .line 351
    .line 352
    .line 353
    :goto_4
    move v3, v8

    .line 354
    goto :goto_5

    .line 355
    :sswitch_3
    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 356
    .line 357
    .line 358
    move-result v3

    .line 359
    if-nez v3, :cond_8

    .line 360
    .line 361
    goto :goto_4

    .line 362
    :cond_8
    move v3, v2

    .line 363
    goto :goto_5

    .line 364
    :sswitch_4
    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 365
    .line 366
    .line 367
    move-result v3

    .line 368
    if-nez v3, :cond_9

    .line 369
    .line 370
    goto :goto_4

    .line 371
    :cond_9
    const/4 v3, 0x1

    .line 372
    goto :goto_5

    .line 373
    :sswitch_5
    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 374
    .line 375
    .line 376
    move-result v3

    .line 377
    if-nez v3, :cond_a

    .line 378
    .line 379
    goto :goto_4

    .line 380
    :cond_a
    const/4 v3, 0x0

    .line 381
    :goto_5
    packed-switch v3, :pswitch_data_1

    .line 382
    .line 383
    .line 384
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->h()Z

    .line 385
    .line 386
    .line 387
    move-result v3

    .line 388
    if-eqz v3, :cond_b

    .line 389
    .line 390
    invoke-static {v13}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 391
    .line 392
    .line 393
    move-result v3

    .line 394
    invoke-static {v13}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 395
    .line 396
    .line 397
    move-result v4

    .line 398
    invoke-static {v13}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 399
    .line 400
    .line 401
    move-result v9

    .line 402
    invoke-static {v13}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 403
    .line 404
    .line 405
    move-result v10

    .line 406
    invoke-static {v14}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 407
    .line 408
    .line 409
    move-result v11

    .line 410
    sget v12, Ll/jbc0;->H2:I

    .line 411
    .line 412
    goto :goto_6

    .line 413
    :cond_b
    invoke-static {v11}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 414
    .line 415
    .line 416
    move-result v3

    .line 417
    const-string v4, "#99FFE7AA"

    .line 418
    .line 419
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 420
    .line 421
    .line 422
    move-result v4

    .line 423
    invoke-static {v11}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 424
    .line 425
    .line 426
    move-result v9

    .line 427
    const-string v10, "#66EDD7A3"

    .line 428
    .line 429
    invoke-static {v10}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 430
    .line 431
    .line 432
    move-result v10

    .line 433
    const-string v11, "#F5C663"

    .line 434
    .line 435
    invoke-static {v11}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 436
    .line 437
    .line 438
    move-result v11

    .line 439
    sget v12, Ll/jbc0;->I2:I

    .line 440
    .line 441
    goto :goto_6

    .line 442
    :pswitch_1
    invoke-static {v9}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 443
    .line 444
    .line 445
    move-result v3

    .line 446
    invoke-static {v12}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 447
    .line 448
    .line 449
    move-result v4

    .line 450
    invoke-static {v12}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 451
    .line 452
    .line 453
    move-result v9

    .line 454
    invoke-static {v12}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 455
    .line 456
    .line 457
    move-result v11

    .line 458
    invoke-static {v10}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 459
    .line 460
    .line 461
    move-result v10

    .line 462
    sget v12, Ll/jbc0;->Q2:I

    .line 463
    .line 464
    move/from16 v16, v11

    .line 465
    .line 466
    move v11, v10

    .line 467
    move/from16 v10, v16

    .line 468
    .line 469
    :goto_6
    iget-object v13, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->c:Lv/VText;

    .line 470
    .line 471
    invoke-virtual {v13, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 472
    .line 473
    .line 474
    iget-object v13, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->d:Lv/VText;

    .line 475
    .line 476
    invoke-virtual {v13, v9}, Landroid/widget/TextView;->setTextColor(I)V

    .line 477
    .line 478
    .line 479
    iget-object v9, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->f:Lv/VText_AutoFit;

    .line 480
    .line 481
    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setTextColor(I)V

    .line 482
    .line 483
    .line 484
    iget-object v9, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->e:Lv/VText_AutoFit;

    .line 485
    .line 486
    invoke-virtual {v9, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 487
    .line 488
    .line 489
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->j:Lv/VText;

    .line 490
    .line 491
    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 492
    .line 493
    .line 494
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->h:Lv/VText;

    .line 495
    .line 496
    invoke-virtual {v3, v11}, Landroid/widget/TextView;->setTextColor(I)V

    .line 497
    .line 498
    .line 499
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->i:Lv/VImage;

    .line 500
    .line 501
    invoke-virtual {v3, v12}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 502
    .line 503
    .line 504
    :goto_7
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->m:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 505
    .line 506
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->f()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 507
    .line 508
    .line 509
    move-result-object v3

    .line 510
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 511
    .line 512
    .line 513
    move-result-object v3

    .line 514
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 515
    .line 516
    .line 517
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 518
    .line 519
    .line 520
    move-result v4

    .line 521
    sparse-switch v4, :sswitch_data_2

    .line 522
    .line 523
    .line 524
    :goto_8
    move v3, v8

    .line 525
    goto :goto_9

    .line 526
    :sswitch_6
    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 527
    .line 528
    .line 529
    move-result v3

    .line 530
    if-nez v3, :cond_c

    .line 531
    .line 532
    goto :goto_8

    .line 533
    :cond_c
    move v3, v2

    .line 534
    goto :goto_9

    .line 535
    :sswitch_7
    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 536
    .line 537
    .line 538
    move-result v3

    .line 539
    if-nez v3, :cond_d

    .line 540
    .line 541
    goto :goto_8

    .line 542
    :cond_d
    const/4 v3, 0x1

    .line 543
    goto :goto_9

    .line 544
    :sswitch_8
    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 545
    .line 546
    .line 547
    move-result v3

    .line 548
    if-nez v3, :cond_e

    .line 549
    .line 550
    goto :goto_8

    .line 551
    :cond_e
    const/4 v3, 0x0

    .line 552
    :goto_9
    packed-switch v3, :pswitch_data_2

    .line 553
    .line 554
    .line 555
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->h()Z

    .line 556
    .line 557
    .line 558
    move-result v3

    .line 559
    if-eqz v3, :cond_f

    .line 560
    .line 561
    sget v3, Ll/jbc0;->d2:I

    .line 562
    .line 563
    sget v4, Ll/jbc0;->L1:I

    .line 564
    .line 565
    sget v8, Ll/jbc0;->U1:I

    .line 566
    .line 567
    goto :goto_a

    .line 568
    :cond_f
    sget v3, Ll/jbc0;->c2:I

    .line 569
    .line 570
    sget v4, Ll/jbc0;->K1:I

    .line 571
    .line 572
    sget v8, Ll/jbc0;->S1:I

    .line 573
    .line 574
    goto :goto_a

    .line 575
    :pswitch_2
    sget v3, Ll/jbc0;->f2:I

    .line 576
    .line 577
    sget v4, Ll/jbc0;->N1:I

    .line 578
    .line 579
    sget v8, Ll/jbc0;->W1:I

    .line 580
    .line 581
    :goto_a
    iget-object v9, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 582
    .line 583
    invoke-virtual {v9, v4}, Landroid/view/View;->setBackgroundResource(I)V

    .line 584
    .line 585
    .line 586
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->j:Lv/VText;

    .line 587
    .line 588
    invoke-virtual {v4, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 589
    .line 590
    .line 591
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->c:Lv/VText;

    .line 592
    .line 593
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->m:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 594
    .line 595
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->w()I

    .line 596
    .line 597
    .line 598
    move-result v4

    .line 599
    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 600
    .line 601
    .line 602
    move-result-object v4

    .line 603
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 604
    .line 605
    .line 606
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->d:Lv/VText;

    .line 607
    .line 608
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->m:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 609
    .line 610
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->x()Ljava/lang/String;

    .line 611
    .line 612
    .line 613
    move-result-object v4

    .line 614
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 615
    .line 616
    .line 617
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->p:Ljava/text/NumberFormat;

    .line 618
    .line 619
    invoke-virtual {v3, v2}, Ljava/text/NumberFormat;->setMaximumFractionDigits(I)V

    .line 620
    .line 621
    .line 622
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->f:Lv/VText_AutoFit;

    .line 623
    .line 624
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->m:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 625
    .line 626
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->h()Ljava/lang/String;

    .line 627
    .line 628
    .line 629
    move-result-object v3

    .line 630
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->p:Ljava/text/NumberFormat;

    .line 631
    .line 632
    iget-object v9, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->m:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 633
    .line 634
    invoke-virtual {v9}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->k()Ljava/lang/String;

    .line 635
    .line 636
    .line 637
    move-result-object v9

    .line 638
    invoke-static {v9}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    .line 639
    .line 640
    .line 641
    move-result-wide v9

    .line 642
    iget-object v11, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->m:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 643
    .line 644
    invoke-virtual {v11}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->w()I

    .line 645
    .line 646
    .line 647
    move-result v11

    .line 648
    int-to-double v11, v11

    .line 649
    mul-double/2addr v9, v11

    .line 650
    invoke-virtual {v4, v9, v10}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 651
    .line 652
    .line 653
    move-result-object v4

    .line 654
    filled-new-array {v3, v4}, [Ljava/lang/Object;

    .line 655
    .line 656
    .line 657
    move-result-object v3

    .line 658
    const-string v4, "%s %s"

    .line 659
    .line 660
    invoke-static {v4, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 661
    .line 662
    .line 663
    move-result-object v3

    .line 664
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 665
    .line 666
    .line 667
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->f:Lv/VText_AutoFit;

    .line 668
    .line 669
    invoke-virtual {v2}, Landroid/widget/TextView;->getPaintFlags()I

    .line 670
    .line 671
    .line 672
    move-result v3

    .line 673
    or-int/lit8 v3, v3, 0x10

    .line 674
    .line 675
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setPaintFlags(I)V

    .line 676
    .line 677
    .line 678
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->e:Lv/VText_AutoFit;

    .line 679
    .line 680
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->m:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 681
    .line 682
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->g()Ljava/lang/String;

    .line 683
    .line 684
    .line 685
    move-result-object v3

    .line 686
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 687
    .line 688
    .line 689
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->g:Landroid/view/View;

    .line 690
    .line 691
    invoke-virtual {v2, v8}, Landroid/view/View;->setBackgroundResource(I)V

    .line 692
    .line 693
    .line 694
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->m:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 695
    .line 696
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->f()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 697
    .line 698
    .line 699
    move-result-object v2

    .line 700
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 701
    .line 702
    .line 703
    move-result-object v2

    .line 704
    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 705
    .line 706
    .line 707
    move-result v3

    .line 708
    if-nez v3, :cond_10

    .line 709
    .line 710
    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 711
    .line 712
    .line 713
    move-result v3

    .line 714
    if-nez v3, :cond_10

    .line 715
    .line 716
    invoke-virtual {v7, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 717
    .line 718
    .line 719
    move-result v2

    .line 720
    if-eqz v2, :cond_11

    .line 721
    .line 722
    :cond_10
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 723
    .line 724
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->G2:Ll/lc9;

    .line 725
    .line 726
    invoke-virtual {v2}, Ll/lc9;->j3()Z

    .line 727
    .line 728
    .line 729
    move-result v2

    .line 730
    if-eqz v2, :cond_11

    .line 731
    .line 732
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->j:Lv/VText;

    .line 733
    .line 734
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 735
    .line 736
    .line 737
    move-result-object v3

    .line 738
    sget v4, Lcom/p1/mobile/putong/core/pay/R$string;->B3:I

    .line 739
    .line 740
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 741
    .line 742
    .line 743
    move-result-object v3

    .line 744
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 745
    .line 746
    .line 747
    goto :goto_b

    .line 748
    :cond_11
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->j:Lv/VText;

    .line 749
    .line 750
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 751
    .line 752
    .line 753
    move-result-object v3

    .line 754
    sget v4, Lcom/p1/mobile/putong/core/pay/R$string;->j6:I

    .line 755
    .line 756
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 757
    .line 758
    .line 759
    move-result-object v3

    .line 760
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 761
    .line 762
    .line 763
    :goto_b
    iget-boolean v2, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->n:Z

    .line 764
    .line 765
    if-eq v1, v2, :cond_12

    .line 766
    .line 767
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->n()V

    .line 768
    .line 769
    .line 770
    :cond_12
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->n:Z

    .line 771
    .line 772
    return-void

    .line 773
    :sswitch_data_0
    .sparse-switch
        -0x4d8d88e4 -> :sswitch_2
        -0x19ee22e1 -> :sswitch_1
        0x724158d8 -> :sswitch_0
    .end sparse-switch

    .line 774
    .line 775
    .line 776
    .line 777
    .line 778
    .line 779
    .line 780
    .line 781
    .line 782
    .line 783
    .line 784
    .line 785
    .line 786
    .line 787
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch

    .line 788
    .line 789
    .line 790
    .line 791
    .line 792
    .line 793
    .line 794
    .line 795
    .line 796
    .line 797
    :sswitch_data_1
    .sparse-switch
        -0x4d8d88e4 -> :sswitch_5
        -0x19ee22e1 -> :sswitch_4
        0x724158d8 -> :sswitch_3
    .end sparse-switch

    .line 798
    .line 799
    .line 800
    .line 801
    .line 802
    .line 803
    .line 804
    .line 805
    .line 806
    .line 807
    .line 808
    .line 809
    .line 810
    .line 811
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_1
        :pswitch_1
        :pswitch_1
    .end packed-switch

    .line 812
    .line 813
    .line 814
    .line 815
    .line 816
    .line 817
    .line 818
    .line 819
    .line 820
    .line 821
    :sswitch_data_2
    .sparse-switch
        -0x4d8d88e4 -> :sswitch_8
        -0x19ee22e1 -> :sswitch_7
        0x724158d8 -> :sswitch_6
    .end sparse-switch

    .line 822
    .line 823
    .line 824
    .line 825
    .line 826
    .line 827
    .line 828
    .line 829
    .line 830
    .line 831
    .line 832
    .line 833
    .line 834
    .line 835
    :pswitch_data_2
    .packed-switch 0x0
        :pswitch_2
        :pswitch_2
        :pswitch_2
    .end packed-switch
.end method

.method public m(Lcom/p1/mobile/putong/core/data/PurchaseType;ZLjava/util/List;Ll/a30;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            "Z",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;",
            "Ll/a30<",
            "Ljava/lang/Boolean;",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->j:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->k:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    if-eqz v2, :cond_2

    .line 18
    .line 19
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    check-cast v2, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 24
    .line 25
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->l()Z

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    if-eqz v3, :cond_0

    .line 30
    .line 31
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->l:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 32
    .line 33
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    if-eqz v3, :cond_1

    .line 38
    .line 39
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->m:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->m:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->m:Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 54
    .line 55
    if-nez v0, :cond_3

    .line 56
    .line 57
    return-void

    .line 58
    :cond_3
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->h:Lv/VText;

    .line 63
    .line 64
    const/4 v3, 0x1

    .line 65
    if-ne v0, v3, :cond_4

    .line 66
    .line 67
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 68
    .line 69
    .line 70
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->i:Lv/VImage;

    .line 71
    .line 72
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 73
    .line 74
    .line 75
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->g:Landroid/view/View;

    .line 76
    .line 77
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 78
    .line 79
    .line 80
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->f:Lv/VText_AutoFit;

    .line 81
    .line 82
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    check-cast p1, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 87
    .line 88
    const/high16 p3, 0x41a80000    # 21.0f

    .line 89
    .line 90
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 91
    .line 92
    .line 93
    move-result p3

    .line 94
    iput p3, p1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 95
    .line 96
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->f:Lv/VText_AutoFit;

    .line 97
    .line 98
    invoke-virtual {p3, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 99
    .line 100
    .line 101
    goto :goto_1

    .line 102
    :cond_4
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 103
    .line 104
    .line 105
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->i:Lv/VImage;

    .line 106
    .line 107
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 108
    .line 109
    .line 110
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->g:Landroid/view/View;

    .line 111
    .line 112
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 113
    .line 114
    .line 115
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->f:Lv/VText_AutoFit;

    .line 116
    .line 117
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 122
    .line 123
    const/high16 v1, 0x424c0000    # 51.0f

    .line 124
    .line 125
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 130
    .line 131
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->f:Lv/VText_AutoFit;

    .line 132
    .line 133
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 134
    .line 135
    .line 136
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->g:Landroid/view/View;

    .line 137
    .line 138
    new-instance v1, Ll/ml40;

    .line 139
    .line 140
    invoke-direct {v1, p0, p4, p1, p3}, Ll/ml40;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;Ll/a30;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/util/List;)V

    .line 141
    .line 142
    .line 143
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 144
    .line 145
    .line 146
    :goto_1
    new-instance p1, Ll/nl40;

    .line 147
    .line 148
    invoke-direct {p1, p0, p4}, Ll/nl40;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;Ll/a30;)V

    .line 149
    .line 150
    .line 151
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 152
    .line 153
    .line 154
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->l(Z)V

    .line 155
    .line 156
    .line 157
    return-void
.end method

.method public final n()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->getAnimBackgroundList()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ll/ol40;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/ol40;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/purchase/showcase/NewUiGPPurchaseUpgradeSectionView;->g(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
