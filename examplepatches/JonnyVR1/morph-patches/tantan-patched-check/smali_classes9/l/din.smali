.class public Ll/din;
.super Ll/im60;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/din$b;
    }
.end annotation


# instance fields
.field public R:Lv/VFrame;

.field public S:Lcom/tantan/library/svga/SVGAnimationView;

.field public T:Lv/VLinear;

.field public U:Lv/VText;

.field public V:Lv/VText;

.field public W:Lv/VFrame;

.field public X:Lv/VText;

.field public Y:Lv/VFrame;

.field public Z:Lv/VText;

.field public a0:Lv/VText;

.field public b0:Landroid/widget/TextView;

.field public c0:Lcom/p1/mobile/putong/core/data/Privilege;

.field public d0:Z

.field public e0:Z

.field public f0:Z

.field public g0:Z

.field public h0:Z

.field public i0:Ljava/lang/String;

.field public j0:Ll/y20;

.field public k0:Landroid/view/View$OnClickListener;

.field public l0:Landroid/view/View$OnClickListener;

.field public m0:Landroid/view/animation/Interpolator;

.field public n0:Ll/kcg0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/im60;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Ll/din;->d0:Z

    .line 6
    .line 7
    iput-boolean p1, p0, Ll/din;->e0:Z

    .line 8
    .line 9
    iput-boolean p1, p0, Ll/din;->f0:Z

    .line 10
    .line 11
    iput-boolean p1, p0, Ll/din;->g0:Z

    .line 12
    .line 13
    iput-boolean p1, p0, Ll/din;->h0:Z

    .line 14
    .line 15
    new-instance p1, Ll/whn;

    .line 16
    .line 17
    invoke-direct {p1, p0}, Ll/whn;-><init>(Ll/din;)V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Ll/din;->k0:Landroid/view/View$OnClickListener;

    .line 21
    .line 22
    new-instance p1, Ll/xhn;

    .line 23
    .line 24
    invoke-direct {p1, p0}, Ll/xhn;-><init>(Ll/din;)V

    .line 25
    .line 26
    .line 27
    iput-object p1, p0, Ll/din;->l0:Landroid/view/View$OnClickListener;

    .line 28
    .line 29
    new-instance p1, Landroid/view/animation/LinearInterpolator;

    .line 30
    .line 31
    invoke-direct {p1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 32
    .line 33
    .line 34
    iput-object p1, p0, Ll/din;->m0:Landroid/view/animation/Interpolator;

    .line 35
    .line 36
    return-void
.end method

.method public static synthetic A0(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    if-eqz p2, :cond_4

    .line 2
    .line 3
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 4
    .line 5
    if-eqz p2, :cond_4

    .line 6
    .line 7
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->affiliateProducts:Lcom/p1/mobile/putong/core/data/AffiliateProducts;

    .line 8
    .line 9
    if-nez p2, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/AffiliateProducts;->googleplay:Ljava/lang/String;

    .line 13
    .line 14
    if-nez p2, :cond_1

    .line 15
    .line 16
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_1
    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    invoke-static {p2, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 30
    .line 31
    return-object p0

    .line 32
    :cond_2
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-nez v0, :cond_3

    .line 37
    .line 38
    invoke-static {p2, p1}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->l3(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0

    .line 51
    :cond_3
    invoke-static {p0, p2}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->Q3(Ljava/lang/String;Ljava/lang/String;)Z

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    return-object p0

    .line 60
    :cond_4
    :goto_0
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 61
    .line 62
    return-object p0
.end method

.method public static synthetic B0(Ll/din;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/IntlWebPayPaymentEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/din;->Y0(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/IntlWebPayPaymentEnvelope;)V

    return-void
.end method

.method public static synthetic C0(Ll/din;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/din;->W0()V

    return-void
.end method

.method public static synthetic D0(Ll/din;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/din;->U0(Landroid/view/View;)V

    return-void
.end method

.method public static L0(Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;)Lcom/p1/mobile/putong/core/data/Merchandise;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->iapId:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->offerId:Ljava/lang/String;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const-string p0, ""

    .line 17
    .line 18
    :goto_0
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 19
    .line 20
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 21
    .line 22
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/CoreProduct;->E4()Lrx/subjects/a;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Ljava/util/List;

    .line 31
    .line 32
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-eqz v2, :cond_1

    .line 37
    .line 38
    const/4 p0, 0x0

    .line 39
    return-object p0

    .line 40
    :cond_1
    new-instance v2, Ll/vhn;

    .line 41
    .line 42
    invoke-direct {v2, v0, p0}, Ll/vhn;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-static {v1, v2}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    check-cast p0, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 50
    .line 51
    return-object p0
.end method

.method public static M0(Lcom/p1/mobile/putong/core/data/Prices;)Ljava/lang/String;
    .locals 4

    .line 1
    if-eqz p0, :cond_2

    .line 2
    .line 3
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/data/Prices;->price:D

    .line 4
    .line 5
    const-wide v2, 0x3eb0c6f7a0b5ed8dL    # 1.0E-6

    .line 6
    .line 7
    .line 8
    .line 9
    .line 10
    cmpg-double v0, v0, v2

    .line 11
    .line 12
    if-gtz v0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-static {}, Ljava/text/NumberFormat;->getNumberInstance()Ljava/text/NumberFormat;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const/4 v1, 0x2

    .line 20
    invoke-virtual {v0, v1}, Ljava/text/NumberFormat;->setMaximumFractionDigits(I)V

    .line 21
    .line 22
    .line 23
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/Prices;->price:D

    .line 24
    .line 25
    invoke-virtual {v0, v1, v2}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Prices;->currencySymbol:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-nez v1, :cond_1

    .line 36
    .line 37
    new-instance v1, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Prices;->currencySymbol:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    return-object p0

    .line 55
    :cond_1
    return-object v0

    .line 56
    :cond_2
    :goto_0
    const-string p0, ""

    .line 57
    .line 58
    return-object p0
.end method

.method public static T0(Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;)Z
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->V3(Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic v0(Ll/din;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/din;->V0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic w0(Ll/din;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/din;->X0(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic x0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic y0(IIIILandroid/view/View;Ll/dgq0;)Ll/dgq0;
    .locals 1

    .line 1
    invoke-static {}, Ll/dgq0$l;->d()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p5, v0}, Ll/dgq0;->f(I)Ll/svm;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget v0, v0, Ll/svm;->d:I

    .line 10
    .line 11
    add-int/2addr p3, v0

    .line 12
    invoke-virtual {p4, p0, p1, p2, p3}, Landroid/view/View;->setPadding(IIII)V

    .line 13
    .line 14
    .line 15
    return-object p5
.end method

.method public static synthetic z0(Ll/din;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/din;->Z0(Ljava/lang/Throwable;)V

    return-void
.end method


# virtual methods
.method public final E0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ein;->a(Ll/din;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final F0()V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/im60;->x:Lcom/p1/mobile/putong/core/ui/purchase/d;

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
    if-eqz v0, :cond_a

    .line 9
    .line 10
    iget-object v0, p0, Ll/im60;->x:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->m()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    iget-object v2, p0, Ll/im60;->x:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    :goto_0
    move-object v6, v0

    .line 25
    goto :goto_1

    .line 26
    :cond_0
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    goto :goto_0

    .line 31
    :goto_1
    invoke-static {v6}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_b

    .line 36
    .line 37
    invoke-virtual {v6}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_b

    .line 46
    .line 47
    invoke-virtual {v6}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 52
    .line 53
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->affiliateProducts:Lcom/p1/mobile/putong/core/data/AffiliateProducts;

    .line 54
    .line 55
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/data/AffiliateProducts;->getProductId()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    iget-object v3, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 60
    .line 61
    sget-object v4, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 62
    .line 63
    if-ne v3, v4, :cond_8

    .line 64
    .line 65
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->k()Z

    .line 66
    .line 67
    .line 68
    move-result v3

    .line 69
    if-nez v3, :cond_8

    .line 70
    .line 71
    iget-object v3, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 72
    .line 73
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->affiliateProducts:Lcom/p1/mobile/putong/core/data/AffiliateProducts;

    .line 74
    .line 75
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/AffiliateProducts;->googleplay:Ljava/lang/String;

    .line 76
    .line 77
    sget-object v5, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 78
    .line 79
    iget-object v5, v5, Lcom/p1/mobile/putong/core/api/c;->x0:Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;

    .line 80
    .line 81
    invoke-virtual {v5}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->E3()Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;

    .line 82
    .line 83
    .line 84
    move-result-object v5

    .line 85
    if-nez v5, :cond_3

    .line 86
    .line 87
    iget-boolean v7, p0, Ll/din;->f0:Z

    .line 88
    .line 89
    if-eqz v7, :cond_3

    .line 90
    .line 91
    sget-object v7, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 92
    .line 93
    iget-object v7, v7, Lcom/p1/mobile/putong/core/api/c;->x0:Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;

    .line 94
    .line 95
    invoke-virtual {v7, v0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->v3(Lcom/p1/mobile/putong/core/data/Merchandise;)Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;

    .line 96
    .line 97
    .line 98
    move-result-object v7

    .line 99
    if-eqz v7, :cond_3

    .line 100
    .line 101
    sget-object v8, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 102
    .line 103
    iget-object v8, v8, Lcom/p1/mobile/putong/core/api/c;->x0:Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;

    .line 104
    .line 105
    invoke-virtual {v8, v7}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->f4(Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;)Z

    .line 106
    .line 107
    .line 108
    move-result v8

    .line 109
    if-nez v8, :cond_3

    .line 110
    .line 111
    invoke-virtual {p0}, Ll/im60;->J()Z

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    if-eqz v0, :cond_1

    .line 116
    .line 117
    iget-object v0, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 118
    .line 119
    invoke-static {}, Ll/m6p;->c()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    invoke-static {v0, v1}, Ll/m6p;->k(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 127
    .line 128
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->x0:Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;

    .line 129
    .line 130
    invoke-virtual {v0, v7}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->L3(Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;)Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    if-eqz v0, :cond_2

    .line 135
    .line 136
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;->interceptToast:Ljava/lang/String;

    .line 137
    .line 138
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 139
    .line 140
    .line 141
    move-result v1

    .line 142
    if-nez v1, :cond_2

    .line 143
    .line 144
    iget-object p0, v0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;->interceptToast:Ljava/lang/String;

    .line 145
    .line 146
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    goto :goto_2

    .line 151
    :cond_2
    iget-object p0, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 152
    .line 153
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->J2:I

    .line 154
    .line 155
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    :goto_2
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 160
    .line 161
    .line 162
    return-void

    .line 163
    :cond_3
    iget-boolean v7, p0, Ll/din;->f0:Z

    .line 164
    .line 165
    if-nez v7, :cond_4

    .line 166
    .line 167
    sget-object v7, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 168
    .line 169
    iget-object v7, v7, Lcom/p1/mobile/putong/core/api/c;->x0:Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;

    .line 170
    .line 171
    invoke-virtual {v7}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->P3()Z

    .line 172
    .line 173
    .line 174
    move-result v7

    .line 175
    if-eqz v7, :cond_5

    .line 176
    .line 177
    :cond_4
    const/4 v1, 0x1

    .line 178
    :cond_5
    if-eqz v5, :cond_7

    .line 179
    .line 180
    if-eqz v1, :cond_7

    .line 181
    .line 182
    iget-object v7, v5, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->iapId:Ljava/lang/String;

    .line 183
    .line 184
    if-nez v7, :cond_6

    .line 185
    .line 186
    const-string v7, ""

    .line 187
    .line 188
    goto :goto_3

    .line 189
    :cond_6
    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object v7

    .line 193
    :goto_3
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 194
    .line 195
    .line 196
    move-result v7

    .line 197
    if-eqz v7, :cond_7

    .line 198
    .line 199
    invoke-virtual {p0}, Ll/im60;->J()Z

    .line 200
    .line 201
    .line 202
    move-result v0

    .line 203
    if-eqz v0, :cond_b

    .line 204
    .line 205
    iget-object p0, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 206
    .line 207
    invoke-static {}, Ll/m6p;->d()Ljava/lang/String;

    .line 208
    .line 209
    .line 210
    move-result-object v0

    .line 211
    invoke-static {p0, v0}, Ll/m6p;->k(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 212
    .line 213
    .line 214
    return-void

    .line 215
    :cond_7
    if-eqz v5, :cond_8

    .line 216
    .line 217
    if-eqz v1, :cond_8

    .line 218
    .line 219
    iget-object v1, v5, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->iapId:Ljava/lang/String;

    .line 220
    .line 221
    invoke-static {v1, v3}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->Q3(Ljava/lang/String;Ljava/lang/String;)Z

    .line 222
    .line 223
    .line 224
    move-result v1

    .line 225
    if-eqz v1, :cond_8

    .line 226
    .line 227
    iget-object v1, v5, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->iapId:Ljava/lang/String;

    .line 228
    .line 229
    iget-object v2, v5, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->offerId:Ljava/lang/String;

    .line 230
    .line 231
    invoke-static {v3, v1, v2}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->m3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 232
    .line 233
    .line 234
    move-result-object v2

    .line 235
    :cond_8
    invoke-virtual {p0}, Ll/im60;->J()Z

    .line 236
    .line 237
    .line 238
    move-result v1

    .line 239
    if-eqz v1, :cond_9

    .line 240
    .line 241
    iget-object v1, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 242
    .line 243
    if-ne v1, v4, :cond_9

    .line 244
    .line 245
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 246
    .line 247
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->x0:Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;

    .line 248
    .line 249
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->E3()Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;

    .line 250
    .line 251
    .line 252
    move-result-object v1

    .line 253
    if-eqz v1, :cond_9

    .line 254
    .line 255
    iget-object v3, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 256
    .line 257
    invoke-static {v3, v6, v1}, Ll/m6p;->l(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/purchase/d$a;Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;)V

    .line 258
    .line 259
    .line 260
    :cond_9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    .line 261
    .line 262
    .line 263
    move-result v3

    .line 264
    iget-object v5, p0, Ll/din;->j0:Ll/y20;

    .line 265
    .line 266
    iget-object v0, p0, Ll/im60;->x:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 267
    .line 268
    iget-boolean v7, v0, Lcom/p1/mobile/putong/core/ui/purchase/d;->k:Z

    .line 269
    .line 270
    move-object v4, v2

    .line 271
    move-object v2, p0

    .line 272
    invoke-virtual/range {v2 .. v7}, Ll/din;->b1(ZLjava/lang/String;Ll/y20;Lcom/p1/mobile/putong/core/ui/purchase/d$a;Z)V

    .line 273
    .line 274
    .line 275
    invoke-virtual {v2, v4}, Ll/din;->m1(Ljava/lang/String;)V

    .line 276
    .line 277
    .line 278
    return-void

    .line 279
    :cond_a
    move-object v2, p0

    .line 280
    iget-object p0, v2, Ll/din;->j0:Ll/y20;

    .line 281
    .line 282
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 283
    .line 284
    .line 285
    move-result p0

    .line 286
    if-eqz p0, :cond_b

    .line 287
    .line 288
    invoke-static {}, Ll/cjj;->L()Lrx/c;

    .line 289
    .line 290
    .line 291
    move-result-object p0

    .line 292
    invoke-static {}, Ll/psd0;->B()Ll/gcg0;

    .line 293
    .line 294
    .line 295
    move-result-object v0

    .line 296
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/gcg0;)Ll/kcg0;

    .line 297
    .line 298
    .line 299
    iget-object p0, v2, Ll/din;->j0:Ll/y20;

    .line 300
    .line 301
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 302
    .line 303
    .line 304
    move-result-object v0

    .line 305
    invoke-interface {p0, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 306
    .line 307
    .line 308
    :cond_b
    return-void
.end method

.method public final G0(Landroid/view/View;)V
    .locals 5

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getPaddingLeft()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    invoke-virtual {p1}, Landroid/view/View;->getPaddingTop()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-virtual {p1}, Landroid/view/View;->getPaddingRight()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    invoke-virtual {p1}, Landroid/view/View;->getPaddingBottom()I

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    new-instance v4, Ll/uhn;

    .line 21
    .line 22
    invoke-direct {v4, v0, v1, v2, v3}, Ll/uhn;-><init>(IIII)V

    .line 23
    .line 24
    .line 25
    invoke-static {p1, v4}, Ll/kkl0;->y0(Landroid/view/View;Ll/il50;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1}, Landroid/view/View;->isAttachedToWindow()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    invoke-static {p1}, Ll/kkl0;->g0(Landroid/view/View;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    new-instance v0, Ll/din$a;

    .line 39
    .line 40
    invoke-direct {v0, p0, p1}, Ll/din$a;-><init>(Ll/din;Landroid/view/View;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final H0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/din;->W:Lv/VFrame;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/din;->K0()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-object v1, p0, Ll/din;->l0:Landroid/view/View$OnClickListener;

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v1, p0, Ll/din;->k0:Landroid/view/View$OnClickListener;

    .line 13
    .line 14
    :goto_0
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/din;->R:Lv/VFrame;

    .line 18
    .line 19
    iget-object v1, p0, Ll/din;->k0:Landroid/view/View$OnClickListener;

    .line 20
    .line 21
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/din;->a0:Lv/VText;

    .line 25
    .line 26
    iget-object p0, p0, Ll/din;->k0:Landroid/view/View$OnClickListener;

    .line 27
    .line 28
    invoke-static {v0, p0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final I0(Lcom/p1/mobile/putong/core/ui/purchase/d$a;)Ljava/lang/CharSequence;
    .locals 6

    .line 1
    invoke-virtual {p0}, Ll/din;->N0()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->C2:I

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    return-object v0

    .line 20
    :cond_0
    iget-object v1, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->D2:I

    .line 23
    .line 24
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {v1, v2, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    new-instance v1, Landroid/text/SpannableStringBuilder;

    .line 33
    .line 34
    invoke-direct {v1, v0}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1}, Landroid/text/SpannableStringBuilder;->length()I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    new-instance v2, Landroid/text/style/ForegroundColorSpan;

    .line 42
    .line 43
    iget-object v3, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 44
    .line 45
    sget v4, Ll/h9c0;->G:I

    .line 46
    .line 47
    invoke-virtual {v3, v4}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    invoke-direct {v2, v3}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 52
    .line 53
    .line 54
    const/4 v3, 0x0

    .line 55
    const/16 v4, 0x21

    .line 56
    .line 57
    invoke-virtual {v1, v2, v3, v0, v4}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 58
    .line 59
    .line 60
    const/16 v0, 0xa

    .line 61
    .line 62
    invoke-virtual {v1, v0}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v1}, Landroid/text/SpannableStringBuilder;->length()I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    invoke-virtual {v1, p1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 70
    .line 71
    .line 72
    new-instance p1, Landroid/text/style/ForegroundColorSpan;

    .line 73
    .line 74
    iget-object v2, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 75
    .line 76
    sget v5, Ll/h9c0;->H:I

    .line 77
    .line 78
    invoke-virtual {v2, v5}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 79
    .line 80
    .line 81
    move-result v2

    .line 82
    invoke-direct {p1, v2}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v1}, Landroid/text/SpannableStringBuilder;->length()I

    .line 86
    .line 87
    .line 88
    move-result v2

    .line 89
    invoke-virtual {v1, p1, v0, v2, v4}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 90
    .line 91
    .line 92
    iget-object p0, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 93
    .line 94
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    iget p0, p0, Landroid/util/DisplayMetrics;->scaledDensity:F

    .line 103
    .line 104
    const/high16 p1, 0x41700000    # 15.0f

    .line 105
    .line 106
    mul-float/2addr p0, p1

    .line 107
    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    .line 108
    .line 109
    .line 110
    move-result p0

    .line 111
    const/4 p1, 0x1

    .line 112
    invoke-static {p1, p0}, Ljava/lang/Math;->max(II)I

    .line 113
    .line 114
    .line 115
    move-result p0

    .line 116
    new-instance p1, Landroid/text/style/AbsoluteSizeSpan;

    .line 117
    .line 118
    invoke-direct {p1, p0, v3}, Landroid/text/style/AbsoluteSizeSpan;-><init>(IZ)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {v1}, Landroid/text/SpannableStringBuilder;->length()I

    .line 122
    .line 123
    .line 124
    move-result p0

    .line 125
    invoke-virtual {v1, p1, v0, p0, v4}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 126
    .line 127
    .line 128
    return-object v1
.end method

.method public final J0()Ljava/lang/CharSequence;
    .locals 6

    .line 1
    invoke-virtual {p0}, Ll/din;->f1()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const-string v2, ""

    .line 10
    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    return-object v2

    .line 14
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->x0:Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;

    .line 17
    .line 18
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->E3()Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-static {v1}, Ll/din;->T0(Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;)Z

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    if-eqz v3, :cond_1

    .line 27
    .line 28
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 29
    .line 30
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->x0:Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;

    .line 31
    .line 32
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->l4(Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    if-eqz v3, :cond_1

    .line 41
    .line 42
    invoke-virtual {p0, v0}, Ll/din;->I0(Lcom/p1/mobile/putong/core/ui/purchase/d$a;)Ljava/lang/CharSequence;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0

    .line 47
    :cond_1
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->g()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result v4

    .line 55
    if-eqz v4, :cond_2

    .line 56
    .line 57
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->l()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    :cond_2
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 62
    .line 63
    .line 64
    move-result v4

    .line 65
    if-eqz v4, :cond_3

    .line 66
    .line 67
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->z()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    :cond_3
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 72
    .line 73
    .line 74
    move-result v4

    .line 75
    if-eqz v4, :cond_4

    .line 76
    .line 77
    return-object v2

    .line 78
    :cond_4
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->w()I

    .line 79
    .line 80
    .line 81
    move-result v2

    .line 82
    invoke-virtual {p0, v0}, Ll/din;->e1(Lcom/p1/mobile/putong/core/ui/purchase/d$a;)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v4

    .line 86
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    const/4 v5, 0x1

    .line 91
    if-eqz v0, :cond_6

    .line 92
    .line 93
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Merchandise;->weekly()Z

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    if-eqz v0, :cond_6

    .line 98
    .line 99
    iget-object v0, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 100
    .line 101
    if-ne v2, v5, :cond_5

    .line 102
    .line 103
    sget v5, Lcom/p1/mobile/putong/core/pay/R$string;->Q2:I

    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_5
    sget v5, Lcom/p1/mobile/putong/core/pay/R$string;->R2:I

    .line 107
    .line 108
    :goto_0
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v2

    .line 112
    filled-new-array {v2, v3}, [Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    invoke-virtual {v0, v5, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    goto :goto_1

    .line 121
    :cond_6
    iget-object v0, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 122
    .line 123
    if-ne v2, v5, :cond_7

    .line 124
    .line 125
    sget v5, Lcom/p1/mobile/putong/core/pay/R$string;->O2:I

    .line 126
    .line 127
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v2

    .line 131
    filled-new-array {v2, v3}, [Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    invoke-virtual {v0, v5, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    goto :goto_1

    .line 140
    :cond_7
    sget v5, Lcom/p1/mobile/putong/core/pay/R$string;->P2:I

    .line 141
    .line 142
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object v2

    .line 146
    filled-new-array {v2, v3}, [Ljava/lang/Object;

    .line 147
    .line 148
    .line 149
    move-result-object v2

    .line 150
    invoke-virtual {v0, v5, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    :goto_1
    if-eqz v1, :cond_8

    .line 155
    .line 156
    iget-boolean p0, p0, Ll/din;->f0:Z

    .line 157
    .line 158
    if-nez p0, :cond_8

    .line 159
    .line 160
    goto :goto_2

    .line 161
    :cond_8
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 162
    .line 163
    .line 164
    move-result p0

    .line 165
    if-eqz p0, :cond_9

    .line 166
    .line 167
    goto :goto_2

    .line 168
    :cond_9
    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object p0

    .line 172
    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object v1

    .line 176
    invoke-static {p0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 177
    .line 178
    .line 179
    move-result p0

    .line 180
    if-eqz p0, :cond_a

    .line 181
    .line 182
    :goto_2
    return-object v0

    .line 183
    :cond_a
    new-instance p0, Landroid/text/SpannableStringBuilder;

    .line 184
    .line 185
    invoke-direct {p0, v0}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 186
    .line 187
    .line 188
    const/16 v0, 0x20

    .line 189
    .line 190
    invoke-virtual {p0, v0}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    .line 191
    .line 192
    .line 193
    invoke-virtual {p0}, Landroid/text/SpannableStringBuilder;->length()I

    .line 194
    .line 195
    .line 196
    move-result v0

    .line 197
    invoke-virtual {p0, v4}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 198
    .line 199
    .line 200
    new-instance v1, Landroid/text/style/StrikethroughSpan;

    .line 201
    .line 202
    invoke-direct {v1}, Landroid/text/style/StrikethroughSpan;-><init>()V

    .line 203
    .line 204
    .line 205
    invoke-virtual {p0}, Landroid/text/SpannableStringBuilder;->length()I

    .line 206
    .line 207
    .line 208
    move-result v2

    .line 209
    const/16 v3, 0x21

    .line 210
    .line 211
    invoke-virtual {p0, v1, v0, v2, v3}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 212
    .line 213
    .line 214
    return-object p0
.end method

.method public K0()Z
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->t()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    iget-object v0, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 10
    .line 11
    sget-object v2, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_ULTRA_PREMIUM:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 12
    .line 13
    if-ne v0, v2, :cond_1

    .line 14
    .line 15
    return v1

    .line 16
    :cond_1
    iget-boolean v0, p0, Ll/din;->h0:Z

    .line 17
    .line 18
    if-eqz v0, :cond_2

    .line 19
    .line 20
    return v1

    .line 21
    :cond_2
    iget-boolean v0, p0, Ll/din;->d0:Z

    .line 22
    .line 23
    if-nez v0, :cond_4

    .line 24
    .line 25
    iget-boolean p0, p0, Ll/din;->e0:Z

    .line 26
    .line 27
    if-eqz p0, :cond_3

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_3
    return v1

    .line 31
    :cond_4
    :goto_0
    const/4 p0, 0x1

    .line 32
    return p0
.end method

.method public final N0()Ljava/lang/String;
    .locals 3

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->x0:Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->E3()Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v0, ""

    .line 10
    .line 11
    if-eqz p0, :cond_4

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->iapId:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->iapId:Ljava/lang/String;

    .line 23
    .line 24
    iget-object v2, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->offerId:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {v1, v2}, Ll/cjj;->I(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-nez v2, :cond_1

    .line 35
    .line 36
    return-object v1

    .line 37
    :cond_1
    invoke-static {p0}, Ll/din;->L0(Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;)Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-eqz v1, :cond_2

    .line 46
    .line 47
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 48
    .line 49
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-eqz v1, :cond_2

    .line 54
    .line 55
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 56
    .line 57
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->affiliateProducts:Lcom/p1/mobile/putong/core/data/AffiliateProducts;

    .line 58
    .line 59
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-eqz v1, :cond_2

    .line 64
    .line 65
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 66
    .line 67
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->affiliateProducts:Lcom/p1/mobile/putong/core/data/AffiliateProducts;

    .line 68
    .line 69
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/AffiliateProducts;->googleplay:Ljava/lang/String;

    .line 70
    .line 71
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    if-nez v2, :cond_2

    .line 76
    .line 77
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-static {v1}, Ll/cjj;->H(Ljava/lang/String;)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 86
    .line 87
    .line 88
    move-result v2

    .line 89
    if-nez v2, :cond_2

    .line 90
    .line 91
    return-object v1

    .line 92
    :cond_2
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    if-eqz v1, :cond_4

    .line 97
    .line 98
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 99
    .line 100
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    move-result v1

    .line 104
    if-eqz v1, :cond_4

    .line 105
    .line 106
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 107
    .line 108
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 109
    .line 110
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    move-result v1

    .line 114
    if-nez v1, :cond_3

    .line 115
    .line 116
    goto :goto_0

    .line 117
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 118
    .line 119
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 120
    .line 121
    invoke-static {p0}, Ll/din;->M0(Lcom/p1/mobile/putong/core/data/Prices;)Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    return-object p0

    .line 126
    :cond_4
    :goto_0
    return-object v0
.end method

.method public final O0()Ljava/lang/CharSequence;
    .locals 4

    .line 1
    iget-boolean v0, p0, Ll/din;->f0:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->x0:Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;->P3()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 16
    .line 17
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 18
    .line 19
    if-ne v0, v1, :cond_1

    .line 20
    .line 21
    iget-object v0, p0, Ll/im60;->x:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 22
    .line 23
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/din;->J0()Ljava/lang/CharSequence;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-nez v1, :cond_1

    .line 38
    .line 39
    return-object v0

    .line 40
    :cond_1
    iget-object v0, p0, Ll/din;->i0:Ljava/lang/String;

    .line 41
    .line 42
    invoke-static {}, Ll/t7a;->i()Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-eqz v1, :cond_a

    .line 47
    .line 48
    iget-object v1, p0, Ll/im60;->x:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 49
    .line 50
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-eqz v1, :cond_a

    .line 55
    .line 56
    iget-object v1, p0, Ll/im60;->x:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 57
    .line 58
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    iget-object v2, p0, Ll/im60;->x:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 67
    .line 68
    if-eqz v1, :cond_2

    .line 69
    .line 70
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    goto :goto_0

    .line 75
    :cond_2
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    :goto_0
    iget-object v2, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 80
    .line 81
    invoke-static {v2}, Ll/wib0;->w(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 82
    .line 83
    .line 84
    move-result v2

    .line 85
    if-eqz v2, :cond_5

    .line 86
    .line 87
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 88
    .line 89
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 90
    .line 91
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    if-nez v0, :cond_4

    .line 100
    .line 101
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 102
    .line 103
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 104
    .line 105
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isVIPExpired()Z

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    if-eqz v0, :cond_3

    .line 114
    .line 115
    goto :goto_1

    .line 116
    :cond_3
    iget-object p0, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 117
    .line 118
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->s3:I

    .line 119
    .line 120
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    goto :goto_3

    .line 125
    :cond_4
    :goto_1
    iget-object p0, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 126
    .line 127
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->t3:I

    .line 128
    .line 129
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    goto :goto_3

    .line 134
    :cond_5
    sget-object v2, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 135
    .line 136
    iget-object v3, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 137
    .line 138
    if-ne v2, v3, :cond_7

    .line 139
    .line 140
    iget-object v0, p0, Ll/din;->a0:Lv/VText;

    .line 141
    .line 142
    iget-object v2, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 143
    .line 144
    sget v3, Ll/h9c0;->C:I

    .line 145
    .line 146
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 147
    .line 148
    .line 149
    move-result v2

    .line 150
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 151
    .line 152
    .line 153
    invoke-static {}, Ll/joa;->g4()Z

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    iget-object p0, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 158
    .line 159
    if-eqz v0, :cond_6

    .line 160
    .line 161
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->t3:I

    .line 162
    .line 163
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object p0

    .line 167
    :goto_2
    move-object v0, p0

    .line 168
    goto :goto_3

    .line 169
    :cond_6
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->s3:I

    .line 170
    .line 171
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object p0

    .line 175
    goto :goto_2

    .line 176
    :cond_7
    invoke-static {v3}, Ll/wib0;->v(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 177
    .line 178
    .line 179
    move-result v2

    .line 180
    if-eqz v2, :cond_9

    .line 181
    .line 182
    iget-object v0, p0, Ll/din;->a0:Lv/VText;

    .line 183
    .line 184
    iget-object v2, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 185
    .line 186
    sget v3, Ll/h9c0;->C:I

    .line 187
    .line 188
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 189
    .line 190
    .line 191
    move-result v2

    .line 192
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 193
    .line 194
    .line 195
    invoke-static {}, Ll/joa;->l4()Z

    .line 196
    .line 197
    .line 198
    move-result v0

    .line 199
    iget-object p0, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 200
    .line 201
    if-eqz v0, :cond_8

    .line 202
    .line 203
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->t3:I

    .line 204
    .line 205
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object p0

    .line 209
    goto :goto_2

    .line 210
    :cond_8
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->s3:I

    .line 211
    .line 212
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object p0

    .line 216
    goto :goto_2

    .line 217
    :cond_9
    :goto_3
    new-instance p0, Ljava/lang/StringBuilder;

    .line 218
    .line 219
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 220
    .line 221
    .line 222
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->g()Ljava/lang/String;

    .line 223
    .line 224
    .line 225
    move-result-object v1

    .line 226
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 227
    .line 228
    .line 229
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 230
    .line 231
    .line 232
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 233
    .line 234
    .line 235
    move-result-object p0

    .line 236
    return-object p0

    .line 237
    :cond_a
    return-object v0
.end method

.method public final P0()Ljava/lang/CharSequence;
    .locals 6

    .line 1
    iget-object v0, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    invoke-static {v0}, Ll/wib0;->w(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 26
    .line 27
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isVIPExpired()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    iget-object p0, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 39
    .line 40
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->q9:I

    .line 41
    .line 42
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0

    .line 47
    :cond_1
    :goto_0
    iget-object p0, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 48
    .line 49
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->s9:I

    .line 50
    .line 51
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    return-object p0

    .line 56
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_BOOST:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 57
    .line 58
    iget-object v1, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 59
    .line 60
    if-ne v0, v1, :cond_3

    .line 61
    .line 62
    iget-object p0, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 63
    .line 64
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->E9:I

    .line 65
    .line 66
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    return-object p0

    .line 71
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_VIP_SUPERLIKE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 72
    .line 73
    if-ne v0, v1, :cond_4

    .line 74
    .line 75
    iget-object p0, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 76
    .line 77
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->g9:I

    .line 78
    .line 79
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    return-object p0

    .line 84
    :cond_4
    invoke-static {v1}, Ll/wib0;->s(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    if-eqz v0, :cond_7

    .line 89
    .line 90
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->Z9:I

    .line 91
    .line 92
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->A9:I

    .line 93
    .line 94
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    invoke-virtual {v2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 99
    .line 100
    .line 101
    move-result-object v2

    .line 102
    invoke-interface {v2}, Ll/r97;->B()Z

    .line 103
    .line 104
    .line 105
    move-result v2

    .line 106
    if-eqz v2, :cond_5

    .line 107
    .line 108
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->w3:I

    .line 109
    .line 110
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->v3:I

    .line 111
    .line 112
    :cond_5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    invoke-virtual {v2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 117
    .line 118
    .line 119
    move-result-object v2

    .line 120
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Bn()J

    .line 121
    .line 122
    .line 123
    move-result-wide v2

    .line 124
    const-wide/16 v4, 0x0

    .line 125
    .line 126
    cmp-long v2, v2, v4

    .line 127
    .line 128
    iget-object p0, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 129
    .line 130
    if-eqz v2, :cond_6

    .line 131
    .line 132
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    return-object p0

    .line 137
    :cond_6
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    return-object p0

    .line 142
    :cond_7
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 143
    .line 144
    iget-object v1, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 145
    .line 146
    if-ne v0, v1, :cond_9

    .line 147
    .line 148
    iget-object v0, p0, Ll/din;->a0:Lv/VText;

    .line 149
    .line 150
    iget-object v1, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 151
    .line 152
    sget v2, Ll/h9c0;->C:I

    .line 153
    .line 154
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 155
    .line 156
    .line 157
    move-result v1

    .line 158
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 159
    .line 160
    .line 161
    invoke-static {}, Ll/joa;->g4()Z

    .line 162
    .line 163
    .line 164
    move-result v0

    .line 165
    iget-object p0, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 166
    .line 167
    if-eqz v0, :cond_8

    .line 168
    .line 169
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->c7:I

    .line 170
    .line 171
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object p0

    .line 175
    return-object p0

    .line 176
    :cond_8
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->b7:I

    .line 177
    .line 178
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object p0

    .line 182
    return-object p0

    .line 183
    :cond_9
    invoke-static {v1}, Ll/wib0;->v(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 184
    .line 185
    .line 186
    move-result v0

    .line 187
    if-eqz v0, :cond_b

    .line 188
    .line 189
    iget-object v0, p0, Ll/din;->a0:Lv/VText;

    .line 190
    .line 191
    iget-object v1, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 192
    .line 193
    sget v2, Ll/h9c0;->C:I

    .line 194
    .line 195
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 196
    .line 197
    .line 198
    move-result v1

    .line 199
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 200
    .line 201
    .line 202
    invoke-static {}, Ll/joa;->l4()Z

    .line 203
    .line 204
    .line 205
    move-result v0

    .line 206
    iget-object p0, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 207
    .line 208
    if-eqz v0, :cond_a

    .line 209
    .line 210
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->T4:I

    .line 211
    .line 212
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object p0

    .line 216
    return-object p0

    .line 217
    :cond_a
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->S4:I

    .line 218
    .line 219
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 220
    .line 221
    .line 222
    move-result-object p0

    .line 223
    return-object p0

    .line 224
    :cond_b
    const/4 p0, 0x0

    .line 225
    return-object p0
.end method

.method public final Q0()Ljava/lang/String;
    .locals 5

    .line 1
    invoke-static {}, Ll/t7a;->i()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    iget-object v0, p0, Ll/im60;->x:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_3

    .line 14
    .line 15
    iget-object v0, p0, Ll/im60;->x:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    iget-object v1, p0, Ll/im60;->x:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 26
    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    goto :goto_0

    .line 34
    :cond_0
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    :goto_0
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 39
    .line 40
    iget-object v2, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 41
    .line 42
    const-string v3, "#99232323"

    .line 43
    .line 44
    if-ne v1, v2, :cond_1

    .line 45
    .line 46
    iget-object v1, p0, Ll/din;->V:Lv/VText;

    .line 47
    .line 48
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 53
    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_1
    invoke-static {v2}, Ll/wib0;->v(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    if-eqz v1, :cond_2

    .line 61
    .line 62
    iget-object v1, p0, Ll/din;->V:Lv/VText;

    .line 63
    .line 64
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 69
    .line 70
    .line 71
    :cond_2
    :goto_1
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->k()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-static {v1}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    .line 76
    .line 77
    .line 78
    move-result-wide v1

    .line 79
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->w()I

    .line 80
    .line 81
    .line 82
    move-result v3

    .line 83
    int-to-double v3, v3

    .line 84
    mul-double/2addr v1, v3

    .line 85
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->t()D

    .line 86
    .line 87
    .line 88
    move-result-wide v3

    .line 89
    sub-double/2addr v1, v3

    .line 90
    const-wide/16 v3, 0x0

    .line 91
    .line 92
    cmpl-double v3, v1, v3

    .line 93
    .line 94
    if-lez v3, :cond_3

    .line 95
    .line 96
    invoke-static {}, Ljava/text/NumberFormat;->getNumberInstance()Ljava/text/NumberFormat;

    .line 97
    .line 98
    .line 99
    move-result-object v3

    .line 100
    const/4 v4, 0x2

    .line 101
    invoke-virtual {v3, v4}, Ljava/text/NumberFormat;->setMaximumFractionDigits(I)V

    .line 102
    .line 103
    .line 104
    new-instance v4, Ljava/lang/StringBuilder;

    .line 105
    .line 106
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 107
    .line 108
    .line 109
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->h()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {v3, v1, v2}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    iget-object p0, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 128
    .line 129
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->f6:I

    .line 130
    .line 131
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    invoke-static {p0, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    return-object p0

    .line 144
    :cond_3
    const-string p0, ""

    .line 145
    .line 146
    return-object p0
.end method

.method public final R0()Ljava/lang/String;
    .locals 4

    .line 1
    invoke-static {}, Ll/t7a;->i()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    iget-object v0, p0, Ll/im60;->x:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_3

    .line 14
    .line 15
    iget-object v0, p0, Ll/im60;->x:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    iget-object v1, p0, Ll/im60;->x:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 26
    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    goto :goto_0

    .line 34
    :cond_0
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    :goto_0
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 39
    .line 40
    iget-object v2, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 41
    .line 42
    const-string v3, "#CC000000"

    .line 43
    .line 44
    if-ne v1, v2, :cond_1

    .line 45
    .line 46
    iget-object v1, p0, Ll/din;->U:Lv/VText;

    .line 47
    .line 48
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 53
    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_1
    invoke-static {v2}, Ll/wib0;->v(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    if-eqz v1, :cond_2

    .line 61
    .line 62
    iget-object v1, p0, Ll/din;->U:Lv/VText;

    .line 63
    .line 64
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 69
    .line 70
    .line 71
    :cond_2
    :goto_1
    iget-object p0, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 72
    .line 73
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->i6:I

    .line 74
    .line 75
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->g()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-static {p0, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    return-object p0

    .line 92
    :cond_3
    const-string p0, ""

    .line 93
    .line 94
    return-object p0
.end method

.method public final S0()Z
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->t()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    iget-object v0, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 10
    .line 11
    sget-object v2, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_ULTRA_PREMIUM:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 12
    .line 13
    if-ne v0, v2, :cond_1

    .line 14
    .line 15
    return v1

    .line 16
    :cond_1
    iget-boolean v0, p0, Ll/din;->d0:Z

    .line 17
    .line 18
    if-nez v0, :cond_3

    .line 19
    .line 20
    iget-boolean p0, p0, Ll/din;->e0:Z

    .line 21
    .line 22
    if-eqz p0, :cond_2

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_2
    return v1

    .line 26
    :cond_3
    :goto_0
    const/4 p0, 0x1

    .line 27
    return p0
.end method

.method public final synthetic U0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/din;->F0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic V0(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-boolean p1, p0, Ll/din;->e0:Z

    .line 2
    .line 3
    if-eqz p1, :cond_5

    .line 4
    .line 5
    iget-object p1, p0, Ll/im60;->x:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 6
    .line 7
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    const-string v0, ""

    .line 12
    .line 13
    if-eqz p1, :cond_1

    .line 14
    .line 15
    iget-object p1, p0, Ll/im60;->x:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->m()Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    iget-object v1, p0, Ll/im60;->x:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 22
    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    :goto_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-eqz v1, :cond_1

    .line 43
    .line 44
    new-instance v1, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 47
    .line 48
    .line 49
    iget p1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 50
    .line 51
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    goto :goto_1

    .line 62
    :cond_1
    const-string p1, "1"

    .line 63
    .line 64
    :goto_1
    iget-object v1, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 65
    .line 66
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/PurchaseType;->productCategory()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    const-string v2, "tttSeeWhoLikedMe"

    .line 71
    .line 72
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    if-eqz v2, :cond_2

    .line 77
    .line 78
    const-string v0, "see"

    .line 79
    .line 80
    goto :goto_2

    .line 81
    :cond_2
    const-string v2, "tttVip"

    .line 82
    .line 83
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    if-eqz v2, :cond_3

    .line 88
    .line 89
    const-string v0, "vip"

    .line 90
    .line 91
    goto :goto_2

    .line 92
    :cond_3
    const-string v2, "tttSvipGoogleplay"

    .line 93
    .line 94
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    if-eqz v1, :cond_4

    .line 99
    .line 100
    const-string v0, "svip"

    .line 101
    .line 102
    :cond_4
    :goto_2
    invoke-virtual {p0, v0, p1}, Ll/din;->n1(Ljava/lang/String;Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    return-void

    .line 106
    :cond_5
    iget-object p0, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 107
    .line 108
    const-string p1, "p_purchase_page"

    .line 109
    .line 110
    invoke-static {p0, p1}, Ll/otp0;->c(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    return-void
.end method

.method public final synthetic W0()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/din;->l1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic X0(Ljava/lang/Long;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/din;->S:Lcom/tantan/library/svga/SVGAnimationView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/tantan/library/svga/SVGAnimationView;->startAnimation()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final synthetic Y0(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/IntlWebPayPaymentEnvelope;)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/IntlWebPayPaymentEnvelope;->data:Lcom/p1/mobile/putong/core/data/IntlWebPayPaymentData;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v1, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    new-instance p0, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    const-string v0, "tantan://intlNativeRecharge?url="

    .line 19
    .line 20
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/IntlWebPayPaymentEnvelope;->data:Lcom/p1/mobile/putong/core/data/IntlWebPayPaymentData;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/IntlWebPayPaymentData;->paymentRequest:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->X1:Ll/nd9;

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/nd9;->u3()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/IntlWebPayPaymentEnvelope;->data:Lcom/p1/mobile/putong/core/data/IntlWebPayPaymentData;

    .line 43
    .line 44
    iget-boolean v5, p0, Lcom/p1/mobile/putong/core/data/IntlWebPayPaymentData;->hideNavigationBar:Z

    .line 45
    .line 46
    iget-boolean v6, p0, Lcom/p1/mobile/putong/core/data/IntlWebPayPaymentData;->hardwareAccelerated:Z

    .line 47
    .line 48
    iget-boolean v7, p0, Lcom/p1/mobile/putong/core/data/IntlWebPayPaymentData;->isUseMkWebView:Z

    .line 49
    .line 50
    move-object v3, p1

    .line 51
    invoke-static/range {v1 .. v7}, Ll/otp0;->b(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZZ)V

    .line 52
    .line 53
    .line 54
    :cond_0
    return-void
.end method

.method public final synthetic Z0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public a(Landroid/view/ViewGroup;Z)Landroid/view/View;
    .locals 2

    .line 1
    iget-object p2, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    sget v0, Ll/rec0;->U2:I

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
    invoke-virtual {p0, p1}, Ll/din;->E0(Landroid/view/View;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ll/din;->G0(Landroid/view/View;)V

    .line 18
    .line 19
    .line 20
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    invoke-virtual {p2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->B8()Ll/wyd0;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    invoke-virtual {p2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    check-cast p2, Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    .line 39
    .line 40
    .line 41
    move-result p2

    .line 42
    if-nez p2, :cond_2

    .line 43
    .line 44
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 45
    .line 46
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 47
    .line 48
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->B8()Ll/wyd0;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    check-cast v0, Ljava/lang/String;

    .line 65
    .line 66
    invoke-virtual {p2, v0}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 67
    .line 68
    .line 69
    move-result-object p2

    .line 70
    if-eqz p2, :cond_1

    .line 71
    .line 72
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 73
    .line 74
    .line 75
    move-result p2

    .line 76
    if-eqz p2, :cond_0

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_0
    iget-object p2, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 80
    .line 81
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->r:I

    .line 82
    .line 83
    invoke-virtual {p2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p2

    .line 87
    iput-object p2, p0, Ll/din;->i0:Ljava/lang/String;

    .line 88
    .line 89
    goto :goto_1

    .line 90
    :cond_1
    :goto_0
    iget-object p2, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 91
    .line 92
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->q:I

    .line 93
    .line 94
    invoke-virtual {p2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p2

    .line 98
    iput-object p2, p0, Ll/din;->i0:Ljava/lang/String;

    .line 99
    .line 100
    goto :goto_1

    .line 101
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/api/a0;->j()Lcom/p1/mobile/putong/core/api/a0;

    .line 102
    .line 103
    .line 104
    move-result-object p2

    .line 105
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/a0;->e:Ll/jxd0;

    .line 106
    .line 107
    invoke-virtual {p2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object p2

    .line 111
    check-cast p2, Ljava/lang/Boolean;

    .line 112
    .line 113
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 114
    .line 115
    .line 116
    move-result p2

    .line 117
    if-eqz p2, :cond_3

    .line 118
    .line 119
    iget-object p2, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 120
    .line 121
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->i2:I

    .line 122
    .line 123
    invoke-virtual {p2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object p2

    .line 127
    iput-object p2, p0, Ll/din;->i0:Ljava/lang/String;

    .line 128
    .line 129
    goto :goto_1

    .line 130
    :cond_3
    invoke-virtual {p0}, Ll/din;->P0()Ljava/lang/CharSequence;

    .line 131
    .line 132
    .line 133
    move-result-object p2

    .line 134
    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object p2

    .line 138
    iput-object p2, p0, Ll/din;->i0:Ljava/lang/String;

    .line 139
    .line 140
    :goto_1
    invoke-virtual {p0}, Ll/din;->p1()V

    .line 141
    .line 142
    .line 143
    iget-object p2, p0, Ll/din;->a0:Lv/VText;

    .line 144
    .line 145
    invoke-static {p2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 146
    .line 147
    .line 148
    iget-object p2, p0, Ll/din;->X:Lv/VText;

    .line 149
    .line 150
    iget-object v0, p0, Ll/din;->i0:Ljava/lang/String;

    .line 151
    .line 152
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 153
    .line 154
    .line 155
    invoke-virtual {p0}, Ll/din;->u()V

    .line 156
    .line 157
    .line 158
    iget-object p2, p0, Ll/din;->S:Lcom/tantan/library/svga/SVGAnimationView;

    .line 159
    .line 160
    sget v0, Ll/qa00;->i:I

    .line 161
    .line 162
    invoke-static {p2, v0}, Ll/qnp0;->d1(Landroid/view/View;I)V

    .line 163
    .line 164
    .line 165
    iget-object p2, p0, Ll/din;->S:Lcom/tantan/library/svga/SVGAnimationView;

    .line 166
    .line 167
    const/16 v0, 0x99

    .line 168
    .line 169
    invoke-virtual {p2, v0}, Landroid/widget/ImageView;->setAlpha(I)V

    .line 170
    .line 171
    .line 172
    iget-object p2, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 173
    .line 174
    invoke-static {p2}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 175
    .line 176
    .line 177
    move-result-object p2

    .line 178
    const-string v0, "https://auto.tancdn.com/v1/raw/051048fc-7b33-41f3-a36c-1004f82d5167.pdf"

    .line 179
    .line 180
    invoke-virtual {p2, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 181
    .line 182
    .line 183
    move-result-object p2

    .line 184
    invoke-virtual {p2, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 185
    .line 186
    .line 187
    move-result-object p2

    .line 188
    const/4 v0, 0x1

    .line 189
    invoke-virtual {p2, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 190
    .line 191
    .line 192
    move-result-object p2

    .line 193
    iget-object p0, p0, Ll/din;->S:Lcom/tantan/library/svga/SVGAnimationView;

    .line 194
    .line 195
    invoke-virtual {p2, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 196
    .line 197
    .line 198
    return-object p1
.end method

.method public final a1(Ljava/lang/String;DLjava/lang/String;ZLjava/lang/String;)V
    .locals 12

    .line 1
    if-eqz p5, :cond_0

    .line 2
    .line 3
    const-string v0, "duration_switch"

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const-string v0, "buy_button"

    .line 7
    .line 8
    :goto_0
    const-string v1, "platform"

    .line 9
    .line 10
    const-string v2, "googleplay"

    .line 11
    .line 12
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    const-string v1, "productType"

    .line 17
    .line 18
    move-object/from16 v2, p6

    .line 19
    .line 20
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 21
    .line 22
    .line 23
    move-result-object v4

    .line 24
    const-string v1, "skuID"

    .line 25
    .line 26
    invoke-static {v1, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object v5

    .line 30
    iget-object p1, p0, Ll/im60;->t:Ljava/lang/String;

    .line 31
    .line 32
    if-nez p1, :cond_1

    .line 33
    .line 34
    const-string p1, ""

    .line 35
    .line 36
    :cond_1
    const-string v1, "purchaseShowFrom"

    .line 37
    .line 38
    invoke-static {v1, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 39
    .line 40
    .line 41
    move-result-object v6

    .line 42
    iget-object p1, p0, Ll/din;->c0:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 43
    .line 44
    invoke-static {p1}, Ll/mib0;->m(Lcom/p1/mobile/putong/core/data/Privilege;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    const-string v1, "first_carousel_page"

    .line 49
    .line 50
    invoke-static {v1, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 51
    .line 52
    .line 53
    move-result-object v7

    .line 54
    const-string p1, "price"

    .line 55
    .line 56
    invoke-static {p2, p3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-static {p1, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 61
    .line 62
    .line 63
    move-result-object v8

    .line 64
    const-string p1, "click_area"

    .line 65
    .line 66
    invoke-static {p1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 67
    .line 68
    .line 69
    move-result-object v9

    .line 70
    const-string p1, "currency_code"

    .line 71
    .line 72
    move-object/from16 v0, p4

    .line 73
    .line 74
    invoke-static {p1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 75
    .line 76
    .line 77
    move-result-object v10

    .line 78
    iget-boolean p0, p0, Ll/din;->g0:Z

    .line 79
    .line 80
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    const-string p1, "if_weekly_premium_boost_get"

    .line 85
    .line 86
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 87
    .line 88
    .line 89
    move-result-object v11

    .line 90
    filled-new-array/range {v3 .. v11}, [Ll/pf60;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    const-string p1, "e_purchase_button"

    .line 95
    .line 96
    const-string v0, "p_purchase_page"

    .line 97
    .line 98
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/core/ui/purchase/d;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/im60;->b(Lcom/p1/mobile/putong/core/ui/purchase/d;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/im60;->x:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->m()Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iget-object v0, p0, Ll/im60;->x:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 11
    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    :goto_0
    invoke-virtual {p0, p1}, Ll/din;->c1(Lcom/p1/mobile/putong/core/ui/purchase/d$a;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final b1(ZLjava/lang/String;Ll/y20;Lcom/p1/mobile/putong/core/ui/purchase/d$a;Z)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;",
            "Lcom/p1/mobile/putong/core/ui/purchase/d$a;",
            "Z)V"
        }
    .end annotation

    .line 1
    const/4 v8, 0x0

    .line 2
    :try_start_0
    const-string v0, ""

    .line 3
    .line 4
    invoke-virtual {p4}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {p4}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 21
    .line 22
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/Prices;->currencyCode:Ljava/lang/String;

    .line 23
    .line 24
    iget-wide v2, v0, Lcom/p1/mobile/putong/core/data/Prices;->price:D

    .line 25
    .line 26
    invoke-virtual {p4}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->id:Ljava/lang/String;

    .line 33
    .line 34
    move-object v5, v1

    .line 35
    :goto_0
    move-wide v3, v2

    .line 36
    move-object v2, v0

    .line 37
    goto :goto_1

    .line 38
    :catchall_0
    move-exception v0

    .line 39
    goto :goto_2

    .line 40
    :cond_0
    const-wide/16 v2, 0x0

    .line 41
    .line 42
    move-object v5, v8

    .line 43
    goto :goto_0

    .line 44
    :goto_1
    invoke-virtual {p4}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->f()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v7

    .line 52
    move-object v1, p0

    .line 53
    move v6, p5

    .line 54
    invoke-virtual/range {v1 .. v7}, Ll/din;->a1(Ljava/lang/String;DLjava/lang/String;ZLjava/lang/String;)V

    .line 55
    .line 56
    .line 57
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_1

    .line 62
    .line 63
    const-string v0, "purchase_button_click"

    .line 64
    .line 65
    const-string v2, "currency"

    .line 66
    .line 67
    const-string v3, "platform"

    .line 68
    .line 69
    const-string v4, "android"

    .line 70
    .line 71
    filled-new-array {v2, v5, v3, v4}, [Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    invoke-static {v0, v2}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 76
    .line 77
    .line 78
    goto :goto_3

    .line 79
    :goto_2
    new-instance v2, Ljava/lang/IllegalStateException;

    .line 80
    .line 81
    const-string v3, "Failed to generate payment params"

    .line 82
    .line 83
    invoke-direct {v2, v3, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 84
    .line 85
    .line 86
    invoke-static {v2}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 87
    .line 88
    .line 89
    :cond_1
    :goto_3
    new-instance v6, Ll/hso;

    .line 90
    .line 91
    iget-object v0, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 92
    .line 93
    iget-object v2, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 94
    .line 95
    invoke-direct {v6, v0, v2}, Ll/hso;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 96
    .line 97
    .line 98
    iget-object v0, p0, Ll/im60;->B:Ljava/lang/Object;

    .line 99
    .line 100
    invoke-virtual {v6, v0}, Ll/hso;->u(Ljava/lang/Object;)V

    .line 101
    .line 102
    .line 103
    new-instance v0, Ll/din$b;

    .line 104
    .line 105
    iget-object v2, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 106
    .line 107
    move-object v3, v2

    .line 108
    iget-object v2, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 109
    .line 110
    move-object v5, p0

    .line 111
    move-object v4, p2

    .line 112
    move-object v1, v3

    .line 113
    move-object v3, p4

    .line 114
    invoke-direct/range {v0 .. v5}, Ll/din$b;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/ui/purchase/d$a;Ljava/lang/String;Ll/y3m;)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {v6, v0}, Ll/hso;->t(Ll/bn50;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {v6, p3}, Ll/hso;->s(Ll/y20;)V

    .line 121
    .line 122
    .line 123
    const/4 v0, 0x1

    .line 124
    invoke-virtual {v6, v0}, Ll/hso;->r(Z)V

    .line 125
    .line 126
    .line 127
    invoke-static {}, Ll/t7a;->c()Z

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    if-nez v0, :cond_3

    .line 132
    .line 133
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Xi()Z

    .line 142
    .line 143
    .line 144
    move-result v0

    .line 145
    if-eqz v0, :cond_3

    .line 146
    .line 147
    iget-object v0, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 148
    .line 149
    sget-object v2, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 150
    .line 151
    if-ne v0, v2, :cond_3

    .line 152
    .line 153
    invoke-static {}, Ll/ijj;->c()Ll/ijj;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    iget-object v0, v0, Ll/ijj;->c:Ll/wyd0;

    .line 158
    .line 159
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    check-cast v0, Ljava/lang/String;

    .line 164
    .line 165
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 166
    .line 167
    .line 168
    move-result v0

    .line 169
    if-nez v0, :cond_3

    .line 170
    .line 171
    iget-object v0, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 172
    .line 173
    instance-of v2, v0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 174
    .line 175
    if-eqz v2, :cond_2

    .line 176
    .line 177
    move-object v2, v0

    .line 178
    check-cast v2, Lcom/p1/mobile/putong/app/PutongAct;

    .line 179
    .line 180
    invoke-virtual {v2}, Lcom/p1/mobile/putong/app/PutongAct;->iap()Ll/bbm;

    .line 181
    .line 182
    .line 183
    move-result-object v2

    .line 184
    invoke-virtual {v2}, Ll/bbm;->i()Lcom/android/billingclient/api/a;

    .line 185
    .line 186
    .line 187
    move-result-object v8

    .line 188
    :cond_2
    invoke-static {v0, v8}, Ll/aso;->h(Lcom/p1/mobile/android/app/Act;Lcom/android/billingclient/api/a;)Ll/aso;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    invoke-static {}, Ll/ijj;->c()Ll/ijj;

    .line 193
    .line 194
    .line 195
    move-result-object v2

    .line 196
    iget-object v2, v2, Ll/ijj;->d:Ll/wyd0;

    .line 197
    .line 198
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 199
    .line 200
    .line 201
    move-result-object v2

    .line 202
    check-cast v2, Ljava/lang/String;

    .line 203
    .line 204
    invoke-static {}, Ll/ijj;->c()Ll/ijj;

    .line 205
    .line 206
    .line 207
    move-result-object v3

    .line 208
    iget-object v1, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 209
    .line 210
    invoke-virtual {v3, v1}, Ll/ijj;->a(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/lang/String;

    .line 211
    .line 212
    .line 213
    move-result-object v1

    .line 214
    invoke-virtual {v6, v0, p1, v2, v1}, Ll/hso;->q(Ll/aso;ZLjava/lang/String;Ljava/lang/String;)V

    .line 215
    .line 216
    .line 217
    goto :goto_4

    .line 218
    :cond_3
    iget-object v0, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 219
    .line 220
    instance-of v1, v0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 221
    .line 222
    if-eqz v1, :cond_4

    .line 223
    .line 224
    move-object v1, v0

    .line 225
    check-cast v1, Lcom/p1/mobile/putong/app/PutongAct;

    .line 226
    .line 227
    invoke-virtual {v1}, Lcom/p1/mobile/putong/app/PutongAct;->iap()Ll/bbm;

    .line 228
    .line 229
    .line 230
    move-result-object v1

    .line 231
    invoke-virtual {v1}, Ll/bbm;->i()Lcom/android/billingclient/api/a;

    .line 232
    .line 233
    .line 234
    move-result-object v8

    .line 235
    :cond_4
    invoke-static {v0, v8}, Ll/aso;->h(Lcom/p1/mobile/android/app/Act;Lcom/android/billingclient/api/a;)Ll/aso;

    .line 236
    .line 237
    .line 238
    move-result-object v0

    .line 239
    invoke-virtual {v6, v0, p1, p2}, Ll/hso;->p(Ll/aso;ZLjava/lang/String;)V

    .line 240
    .line 241
    .line 242
    :goto_4
    return-void
.end method

.method public c0(Landroid/view/View$OnClickListener;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/din;->b0:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Ll/din;->b0:Landroid/widget/TextView;

    .line 11
    .line 12
    iget-object v1, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 13
    .line 14
    invoke-static {v1}, Ll/wib0;->q(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    sget v1, Ll/h9c0;->C:I

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    sget v1, Ll/h9c0;->q:I

    .line 24
    .line 25
    :goto_0
    invoke-static {v1}, Ll/k3d0;->a(I)I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/din;->b0:Landroid/widget/TextView;

    .line 33
    .line 34
    const/4 v1, 0x1

    .line 35
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Ll/din;->b0:Landroid/widget/TextView;

    .line 39
    .line 40
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final c1(Lcom/p1/mobile/putong/core/ui/purchase/d$a;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/din;->o1()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/din;->S:Lcom/tantan/library/svga/SVGAnimationView;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGAnimationView;->stopAnimation(Z)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/din;->S:Lcom/tantan/library/svga/SVGAnimationView;

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->f()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v3, "tttVipUpgradeToPremium"

    .line 21
    .line 22
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_8

    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->f()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const-string v3, "tttSeeUpgradeToPremium"

    .line 33
    .line 34
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-nez v0, :cond_8

    .line 39
    .line 40
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->f()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    const-string v3, "tttPremiumUpgradeToUltra"

    .line 45
    .line 46
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-nez v0, :cond_8

    .line 51
    .line 52
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->f()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    const-string v3, "Promo_premiumUpgradeToUltra"

    .line 57
    .line 58
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-eqz v0, :cond_0

    .line 63
    .line 64
    goto/16 :goto_3

    .line 65
    .line 66
    :cond_0
    invoke-virtual {p0}, Ll/din;->K0()Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-eqz v0, :cond_6

    .line 71
    .line 72
    iget-object v0, p0, Ll/din;->W:Lv/VFrame;

    .line 73
    .line 74
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Ll/din;->a0:Lv/VText;

    .line 78
    .line 79
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Ll/din;->R:Lv/VFrame;

    .line 83
    .line 84
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 92
    .line 93
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 94
    .line 95
    iget-wide v0, v0, Lcom/p1/mobile/putong/core/data/Prices;->price:D

    .line 96
    .line 97
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->w()I

    .line 98
    .line 99
    .line 100
    move-result v2

    .line 101
    int-to-double v2, v2

    .line 102
    div-double/2addr v0, v2

    .line 103
    const-wide v2, 0x3feb333340000000L    # 0.8500000238418579

    .line 104
    .line 105
    .line 106
    .line 107
    .line 108
    mul-double/2addr v0, v2

    .line 109
    invoke-static {v0, v1}, Ll/a9g0;->b(D)Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 118
    .line 119
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 120
    .line 121
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Prices;->currencySymbol:Ljava/lang/String;

    .line 122
    .line 123
    filled-new-array {p1, v0}, [Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    const-string v0, "%s %s"

    .line 128
    .line 129
    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->k()Z

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    if-eqz v0, :cond_1

    .line 138
    .line 139
    iget-object v0, p0, Ll/din;->a0:Lv/VText;

    .line 140
    .line 141
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->U2:I

    .line 142
    .line 143
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 144
    .line 145
    .line 146
    goto :goto_0

    .line 147
    :cond_1
    invoke-static {}, Ll/t7a;->i()Z

    .line 148
    .line 149
    .line 150
    move-result v0

    .line 151
    iget-object v1, p0, Ll/din;->a0:Lv/VText;

    .line 152
    .line 153
    if-eqz v0, :cond_2

    .line 154
    .line 155
    invoke-virtual {p0}, Ll/din;->O0()Ljava/lang/CharSequence;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 160
    .line 161
    .line 162
    goto :goto_0

    .line 163
    :cond_2
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->R4:I

    .line 164
    .line 165
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 166
    .line 167
    .line 168
    :goto_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 169
    .line 170
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->X1:Ll/nd9;

    .line 171
    .line 172
    invoke-virtual {v0}, Ll/nd9;->o3()Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 177
    .line 178
    .line 179
    move-result v1

    .line 180
    iget-object v2, p0, Ll/din;->X:Lv/VText;

    .line 181
    .line 182
    if-eqz v1, :cond_4

    .line 183
    .line 184
    iget-boolean v0, p0, Ll/din;->e0:Z

    .line 185
    .line 186
    iget-object v1, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 187
    .line 188
    if-eqz v0, :cond_3

    .line 189
    .line 190
    sget p1, Lcom/p1/mobile/putong/core/pay/R$string;->D3:I

    .line 191
    .line 192
    invoke-virtual {v1, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object p1

    .line 196
    goto :goto_1

    .line 197
    :cond_3
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->C3:I

    .line 198
    .line 199
    const-string v3, "15%"

    .line 200
    .line 201
    filled-new-array {v3, p1}, [Ljava/lang/Object;

    .line 202
    .line 203
    .line 204
    move-result-object p1

    .line 205
    invoke-virtual {v1, v0, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object p1

    .line 209
    :goto_1
    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 210
    .line 211
    .line 212
    goto :goto_2

    .line 213
    :cond_4
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 214
    .line 215
    .line 216
    :goto_2
    iget-boolean p1, p0, Ll/din;->e0:Z

    .line 217
    .line 218
    const-string v0, "p_purchase_page"

    .line 219
    .line 220
    if-eqz p1, :cond_5

    .line 221
    .line 222
    iget-object p1, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 223
    .line 224
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/PurchaseType;->productCategory()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 225
    .line 226
    .line 227
    move-result-object p1

    .line 228
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object p1

    .line 232
    const-string v1, "productType"

    .line 233
    .line 234
    invoke-static {v1, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 235
    .line 236
    .line 237
    move-result-object p1

    .line 238
    filled-new-array {p1}, [Ll/pf60;

    .line 239
    .line 240
    .line 241
    move-result-object p1

    .line 242
    const-string v1, "e_purchase_button_web"

    .line 243
    .line 244
    invoke-static {v1, v0, p1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 245
    .line 246
    .line 247
    goto :goto_4

    .line 248
    :cond_5
    const-string p1, "e_web_purchase"

    .line 249
    .line 250
    invoke-static {p1, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 251
    .line 252
    .line 253
    goto :goto_4

    .line 254
    :cond_6
    iget-boolean p1, p0, Ll/din;->h0:Z

    .line 255
    .line 256
    if-eqz p1, :cond_7

    .line 257
    .line 258
    invoke-virtual {p0}, Ll/din;->S0()Z

    .line 259
    .line 260
    .line 261
    move-result p1

    .line 262
    if-eqz p1, :cond_7

    .line 263
    .line 264
    iget-object p1, p0, Ll/din;->W:Lv/VFrame;

    .line 265
    .line 266
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 267
    .line 268
    .line 269
    iget-object p1, p0, Ll/din;->a0:Lv/VText;

    .line 270
    .line 271
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 272
    .line 273
    .line 274
    iget-object p1, p0, Ll/din;->R:Lv/VFrame;

    .line 275
    .line 276
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 277
    .line 278
    .line 279
    invoke-virtual {p0}, Ll/din;->d1()Ljava/lang/CharSequence;

    .line 280
    .line 281
    .line 282
    move-result-object p1

    .line 283
    invoke-virtual {p0, p1}, Ll/din;->h1(Ljava/lang/CharSequence;)V

    .line 284
    .line 285
    .line 286
    goto :goto_4

    .line 287
    :cond_7
    iget-object p1, p0, Ll/din;->W:Lv/VFrame;

    .line 288
    .line 289
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 290
    .line 291
    .line 292
    iget-object p1, p0, Ll/din;->a0:Lv/VText;

    .line 293
    .line 294
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 295
    .line 296
    .line 297
    iget-object p1, p0, Ll/din;->R:Lv/VFrame;

    .line 298
    .line 299
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 300
    .line 301
    .line 302
    invoke-virtual {p0}, Ll/din;->O0()Ljava/lang/CharSequence;

    .line 303
    .line 304
    .line 305
    move-result-object p1

    .line 306
    invoke-virtual {p0, p1}, Ll/din;->h1(Ljava/lang/CharSequence;)V

    .line 307
    .line 308
    .line 309
    goto :goto_4

    .line 310
    :cond_8
    :goto_3
    iget-object p1, p0, Ll/din;->a0:Lv/VText;

    .line 311
    .line 312
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 313
    .line 314
    .line 315
    iget-object p1, p0, Ll/din;->W:Lv/VFrame;

    .line 316
    .line 317
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 318
    .line 319
    .line 320
    iget-object p1, p0, Ll/din;->R:Lv/VFrame;

    .line 321
    .line 322
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 323
    .line 324
    .line 325
    iget-object p1, p0, Ll/din;->U:Lv/VText;

    .line 326
    .line 327
    invoke-virtual {p0}, Ll/din;->R0()Ljava/lang/String;

    .line 328
    .line 329
    .line 330
    move-result-object v0

    .line 331
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 332
    .line 333
    .line 334
    iget-object p1, p0, Ll/din;->V:Lv/VText;

    .line 335
    .line 336
    invoke-virtual {p0}, Ll/din;->Q0()Ljava/lang/String;

    .line 337
    .line 338
    .line 339
    move-result-object v0

    .line 340
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 341
    .line 342
    .line 343
    iget-object p1, p0, Ll/din;->S:Lcom/tantan/library/svga/SVGAnimationView;

    .line 344
    .line 345
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 346
    .line 347
    .line 348
    invoke-virtual {p0}, Ll/din;->k1()V

    .line 349
    .line 350
    .line 351
    :goto_4
    invoke-virtual {p0}, Ll/din;->H0()V

    .line 352
    .line 353
    .line 354
    return-void
.end method

.method public final d1()Ljava/lang/CharSequence;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->k()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->U2:I

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    invoke-static {}, Ll/t7a;->i()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/din;->O0()Ljava/lang/CharSequence;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0

    .line 27
    :cond_1
    iget-object p0, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 28
    .line 29
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->R4:I

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method

.method public final e1(Lcom/p1/mobile/putong/core/ui/purchase/d$a;)Ljava/lang/String;
    .locals 7

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->j()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const-string v0, ""

    .line 17
    .line 18
    if-eqz p0, :cond_5

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 21
    .line 22
    if-eqz p0, :cond_5

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 25
    .line 26
    if-nez p0, :cond_1

    .line 27
    .line 28
    goto :goto_1

    .line 29
    :cond_1
    invoke-static {}, Ljava/text/NumberFormat;->getNumberInstance()Ljava/text/NumberFormat;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    const/4 v2, 0x2

    .line 34
    invoke-virtual {v1, v2}, Ljava/text/NumberFormat;->setMaximumFractionDigits(I)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->h()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    if-eqz v3, :cond_3

    .line 46
    .line 47
    iget-object v2, p0, Lcom/p1/mobile/putong/core/data/Prices;->currencySymbol:Ljava/lang/String;

    .line 48
    .line 49
    if-eqz v2, :cond_2

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    move-object v2, v0

    .line 53
    :cond_3
    :goto_0
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/Prices;->originalPrice:D

    .line 54
    .line 55
    const-wide/16 v5, 0x0

    .line 56
    .line 57
    cmpl-double v3, v3, v5

    .line 58
    .line 59
    if-lez v3, :cond_4

    .line 60
    .line 61
    new-instance p1, Ljava/lang/StringBuilder;

    .line 62
    .line 63
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    iget-wide v2, p0, Lcom/p1/mobile/putong/core/data/Prices;->originalPrice:D

    .line 70
    .line 71
    invoke-virtual {v1, v2, v3}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    return-object p0

    .line 83
    :cond_4
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->w()I

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/Prices;->originalUnitPrice:D

    .line 88
    .line 89
    cmpl-double v3, v3, v5

    .line 90
    .line 91
    if-lez v3, :cond_5

    .line 92
    .line 93
    if-lez p1, :cond_5

    .line 94
    .line 95
    new-instance v0, Ljava/lang/StringBuilder;

    .line 96
    .line 97
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 98
    .line 99
    .line 100
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    iget-wide v2, p0, Lcom/p1/mobile/putong/core/data/Prices;->originalUnitPrice:D

    .line 104
    .line 105
    int-to-double p0, p1

    .line 106
    mul-double/2addr v2, p0

    .line 107
    invoke-virtual {v1, v2, v3}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    return-object p0

    .line 119
    :cond_5
    :goto_1
    return-object v0
.end method

.method public final f1()Lcom/p1/mobile/putong/core/ui/purchase/d$a;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/im60;->x:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0

    .line 11
    :cond_0
    iget-object v0, p0, Ll/im60;->x:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iget-object p0, p0, Ll/im60;->x:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 22
    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0

    .line 30
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0
.end method

.method public g0(Lcom/p1/mobile/putong/core/ui/purchase/d;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->m()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    :goto_0
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/ui/purchase/d;->k:Z

    .line 17
    .line 18
    if-eqz v1, :cond_2

    .line 19
    .line 20
    iget-object v1, p0, Ll/im60;->x:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 21
    .line 22
    if-eqz v1, :cond_2

    .line 23
    .line 24
    if-eq v1, p1, :cond_2

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->f()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    const-string v2, "tttVip"

    .line 35
    .line 36
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-nez v1, :cond_1

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->f()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    const-string v2, "tttSvipGoogleplay"

    .line 51
    .line 52
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    if-nez v1, :cond_1

    .line 57
    .line 58
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->f()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    const-string v1, "tttSeeWhoLikedMe"

    .line 67
    .line 68
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-eqz v0, :cond_2

    .line 73
    .line 74
    :cond_1
    const/4 v0, 0x1

    .line 75
    goto :goto_1

    .line 76
    :cond_2
    const/4 v0, 0x0

    .line 77
    :goto_1
    invoke-super {p0, p1}, Ll/im60;->g0(Lcom/p1/mobile/putong/core/ui/purchase/d;)V

    .line 78
    .line 79
    .line 80
    if-eqz v0, :cond_3

    .line 81
    .line 82
    invoke-virtual {p0}, Ll/din;->F0()V

    .line 83
    .line 84
    .line 85
    :cond_3
    return-void
.end method

.method public g1(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/din;->f0:Z

    .line 2
    .line 3
    return-void
.end method

.method public h0(Lcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/din;->c0:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 2
    .line 3
    return-void
.end method

.method public final h1(Ljava/lang/CharSequence;)V
    .locals 1

    .line 1
    instance-of v0, p1, Landroid/text/Spanned;

    .line 2
    .line 3
    iget-object p0, p0, Ll/din;->X:Lv/VText;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Landroid/widget/TextView$BufferType;->SPANNABLE:Landroid/widget/TextView$BufferType;

    .line 8
    .line 9
    invoke-virtual {p0, p1, v0}, Lv/VText;->setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public i(Ll/y20;)V
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
    iput-object p1, p0, Ll/din;->j0:Ll/y20;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/din;->H0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public i1(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/din;->g0:Z

    .line 2
    .line 3
    return-void
.end method

.method public j1(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/din;->h0:Z

    .line 2
    .line 3
    return-void
.end method

.method public final k1()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/din;->R:Lv/VFrame;

    .line 2
    .line 3
    sget-object v1, Ll/gt0;->i:Landroid/util/Property;

    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    new-array v3, v2, [F

    .line 7
    .line 8
    fill-array-data v3, :array_0

    .line 9
    .line 10
    .line 11
    invoke-static {v0, v1, v3}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Ll/din;->R:Lv/VFrame;

    .line 16
    .line 17
    sget-object v3, Ll/gt0;->i:Landroid/util/Property;

    .line 18
    .line 19
    new-array v4, v2, [F

    .line 20
    .line 21
    fill-array-data v4, :array_1

    .line 22
    .line 23
    .line 24
    invoke-static {v1, v3, v4}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iget-object v3, p0, Ll/din;->R:Lv/VFrame;

    .line 29
    .line 30
    sget-object v4, Ll/gt0;->i:Landroid/util/Property;

    .line 31
    .line 32
    new-array v5, v2, [F

    .line 33
    .line 34
    fill-array-data v5, :array_2

    .line 35
    .line 36
    .line 37
    invoke-static {v3, v4, v5}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    iget-object v4, p0, Ll/din;->R:Lv/VFrame;

    .line 42
    .line 43
    sget-object v5, Ll/gt0;->i:Landroid/util/Property;

    .line 44
    .line 45
    new-array v2, v2, [F

    .line 46
    .line 47
    fill-array-data v2, :array_3

    .line 48
    .line 49
    .line 50
    invoke-static {v4, v5, v2}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    const-wide/16 v4, 0x1f4

    .line 55
    .line 56
    invoke-virtual {v0, v4, v5}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 57
    .line 58
    .line 59
    const-wide/16 v4, 0x14d

    .line 60
    .line 61
    invoke-virtual {v1, v4, v5}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v3, v4, v5}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v2, v4, v5}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 68
    .line 69
    .line 70
    iget-object v4, p0, Ll/din;->m0:Landroid/view/animation/Interpolator;

    .line 71
    .line 72
    invoke-virtual {v0, v4}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 73
    .line 74
    .line 75
    iget-object v4, p0, Ll/din;->m0:Landroid/view/animation/Interpolator;

    .line 76
    .line 77
    invoke-virtual {v1, v4}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 78
    .line 79
    .line 80
    iget-object v4, p0, Ll/din;->m0:Landroid/view/animation/Interpolator;

    .line 81
    .line 82
    invoke-virtual {v3, v4}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 83
    .line 84
    .line 85
    iget-object v4, p0, Ll/din;->m0:Landroid/view/animation/Interpolator;

    .line 86
    .line 87
    invoke-virtual {v2, v4}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 88
    .line 89
    .line 90
    const-wide/16 v4, -0x1

    .line 91
    .line 92
    filled-new-array {v0, v1, v3, v2}, [Landroid/animation/Animator;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    const/4 v1, 0x0

    .line 97
    const/4 v2, 0x0

    .line 98
    invoke-static {v1, v2, v4, v5, v0}, Ll/gt0;->u(ZLandroid/view/animation/Interpolator;J[Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    new-instance v1, Ll/yhn;

    .line 103
    .line 104
    invoke-direct {v1, p0}, Ll/yhn;-><init>(Ll/din;)V

    .line 105
    .line 106
    .line 107
    invoke-static {v0, v1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 112
    .line 113
    .line 114
    return-void

    .line 115
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
    .end array-data

    .line 116
    .line 117
    .line 118
    .line 119
    .line 120
    .line 121
    .line 122
    .line 123
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x3f75c28f    # 0.96f
    .end array-data

    .line 124
    .line 125
    .line 126
    .line 127
    .line 128
    .line 129
    .line 130
    .line 131
    :array_2
    .array-data 4
        0x3f75c28f    # 0.96f
        0x3f83d70a    # 1.03f
    .end array-data

    .line 132
    .line 133
    .line 134
    .line 135
    .line 136
    .line 137
    .line 138
    .line 139
    :array_3
    .array-data 4
        0x3f83d70a    # 1.03f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final l1()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/din;->n0:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    const-wide/16 v1, 0x8ca

    .line 9
    .line 10
    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 11
    .line 12
    const-wide/16 v4, 0x0

    .line 13
    .line 14
    invoke-static {v4, v5, v1, v2, v3}, Lrx/c;->interval(JJLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v1, Ll/bin;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Ll/bin;-><init>(Ll/din;)V

    .line 37
    .line 38
    .line 39
    new-instance v2, Ll/cin;

    .line 40
    .line 41
    invoke-direct {v2}, Ll/cin;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iput-object v0, p0, Ll/din;->n0:Ll/kcg0;

    .line 53
    .line 54
    return-void
.end method

.method public final m1(Ljava/lang/String;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 4
    .line 5
    const-string v2, "skuID"

    .line 6
    .line 7
    const-string v3, "showFrom"

    .line 8
    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/im60;->t:Ljava/lang/String;

    .line 12
    .line 13
    filled-new-array {v3, p0, v2, p1}, [Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string p1, "vip_purchase_click"

    .line 18
    .line 19
    invoke-static {p1, p0}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_LIKERS:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 24
    .line 25
    if-ne v0, v1, :cond_1

    .line 26
    .line 27
    iget-object p0, p0, Ll/im60;->t:Ljava/lang/String;

    .line 28
    .line 29
    filled-new-array {v3, p0, v2, p1}, [Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const-string p1, "see_purchase_click"

    .line 34
    .line 35
    invoke-static {p1, p0}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_VIP_SUPERLIKE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 40
    .line 41
    if-ne v0, v1, :cond_2

    .line 42
    .line 43
    iget-object p0, p0, Ll/im60;->t:Ljava/lang/String;

    .line 44
    .line 45
    filled-new-array {v3, p0, v2, p1}, [Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    const-string p1, "superlike_purchase_click"

    .line 50
    .line 51
    invoke-static {p1, p0}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_2
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_BOOST:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 56
    .line 57
    if-ne v0, v1, :cond_3

    .line 58
    .line 59
    iget-object p0, p0, Ll/im60;->t:Ljava/lang/String;

    .line 60
    .line 61
    filled-new-array {v3, p0, v2, p1}, [Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    const-string p1, "boost_purchase_click"

    .line 66
    .line 67
    invoke-static {p1, p0}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 68
    .line 69
    .line 70
    :cond_3
    return-void
.end method

.method public final n1(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-static {}, Ll/pzi0;->o()J

    .line 18
    .line 19
    .line 20
    move-result-wide v1

    .line 21
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const/4 v1, 0x1

    .line 29
    invoke-static {v0, v1}, Ll/niw;->f(Ljava/lang/String;Z)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const-string v1, "productType"

    .line 34
    .line 35
    invoke-static {v1, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    new-instance v2, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    const-string v3, "m"

    .line 48
    .line 49
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    const-string v3, "default_duration"

    .line 57
    .line 58
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    const-string v3, "tracker"

    .line 63
    .line 64
    invoke-static {v3, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    filled-new-array {v1, v2, v3}, [Ll/pf60;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    const-string v2, "e_purchase_button_web"

    .line 73
    .line 74
    const-string v3, "p_purchase_page"

    .line 75
    .line 76
    invoke-static {v2, v3, v1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 77
    .line 78
    .line 79
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 80
    .line 81
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->X1:Ll/nd9;

    .line 82
    .line 83
    invoke-virtual {v1}, Ll/nd9;->q3()Z

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    iget-object v2, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 88
    .line 89
    if-eqz v1, :cond_0

    .line 90
    .line 91
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->T1:I

    .line 92
    .line 93
    invoke-virtual {v2, v1}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 94
    .line 95
    .line 96
    iget-object v1, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 97
    .line 98
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 99
    .line 100
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->X1:Ll/nd9;

    .line 101
    .line 102
    invoke-virtual {v2}, Ll/nd9;->m3()Lcom/p1/mobile/putong/core/data/NativeConfig;

    .line 103
    .line 104
    .line 105
    move-result-object v3

    .line 106
    invoke-virtual {v2, v3, p1, p2}, Ll/nd9;->k3(Lcom/p1/mobile/putong/core/data/NativeConfig;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    invoke-virtual {v1, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    new-instance p2, Ll/zhn;

    .line 115
    .line 116
    invoke-direct {p2, p0, v0}, Ll/zhn;-><init>(Ll/din;Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    new-instance v0, Ll/ain;

    .line 120
    .line 121
    invoke-direct {v0, p0}, Ll/ain;-><init>(Ll/din;)V

    .line 122
    .line 123
    .line 124
    const/4 p0, 0x0

    .line 125
    invoke-static {p2, v0, p0}, Ll/psd0;->K(Ll/y20;Ll/y20;Z)Lcom/p1/mobile/android/rx/a;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 130
    .line 131
    .line 132
    return-void

    .line 133
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 134
    .line 135
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->X1:Ll/nd9;

    .line 136
    .line 137
    iget-object p0, p0, Ll/nd9;->V:Lcom/p1/mobile/putong/core/data/IntlInnerWebPayConfig;

    .line 138
    .line 139
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/IntlInnerWebPayConfig;->thirdPartConfig:Lcom/p1/mobile/putong/core/data/ThirdPartConfig;

    .line 140
    .line 141
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ThirdPartConfig;->thirdPartLandPage:Ljava/lang/String;

    .line 142
    .line 143
    invoke-static {v2, p0, p1, p2, v0}, Ll/otp0;->a(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 144
    .line 145
    .line 146
    return-void
.end method

.method public final o1()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/din;->n0:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final p1()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    iget-object v1, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 4
    .line 5
    if-eq v0, v1, :cond_0

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 10
    .line 11
    iget-object v0, v0, Ll/dkb;->S0:Ll/jxd0;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ljava/lang/Boolean;

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->X1:Ll/nd9;

    .line 28
    .line 29
    iget-boolean v1, v0, Ll/nd9;->R:Z

    .line 30
    .line 31
    if-eqz v1, :cond_0

    .line 32
    .line 33
    iget-object v0, v0, Ll/nd9;->W:Ljava/util/ArrayList;

    .line 34
    .line 35
    sget v1, Ll/uqb0;->f0:I

    .line 36
    .line 37
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_0

    .line 46
    .line 47
    const/4 v0, 0x1

    .line 48
    goto :goto_0

    .line 49
    :cond_0
    const/4 v0, 0x0

    .line 50
    :goto_0
    iput-boolean v0, p0, Ll/din;->d0:Z

    .line 51
    .line 52
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 53
    .line 54
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->X1:Ll/nd9;

    .line 55
    .line 56
    invoke-virtual {v0}, Ll/nd9;->p3()Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    iput-boolean v0, p0, Ll/din;->e0:Z

    .line 61
    .line 62
    return-void
.end method

.method public release()V
    .locals 0

    .line 1
    return-void
.end method

.method public final u()V
    .locals 3

    .line 1
    sget v0, Ll/jbc0;->t1:I

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 4
    .line 5
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    sget v2, Ll/h9c0;->g:I

    .line 10
    .line 11
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    iget-object v2, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 16
    .line 17
    invoke-static {v2}, Ll/wib0;->s(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-eqz v2, :cond_0

    .line 22
    .line 23
    sget v0, Ll/jbc0;->q1:I

    .line 24
    .line 25
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 26
    .line 27
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    sget v2, Ll/h9c0;->u0:I

    .line 32
    .line 33
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    goto :goto_0

    .line 38
    :cond_0
    iget-object v2, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 39
    .line 40
    invoke-static {v2}, Ll/wib0;->q(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    if-eqz v2, :cond_1

    .line 45
    .line 46
    sget v0, Ll/jbc0;->r1:I

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    iget-object v2, p0, Ll/im60;->r:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 50
    .line 51
    invoke-static {v2}, Ll/wib0;->v(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    if-eqz v2, :cond_2

    .line 56
    .line 57
    sget v0, Ll/jbc0;->s1:I

    .line 58
    .line 59
    const-string v1, "#CC000000"

    .line 60
    .line 61
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    :cond_2
    :goto_0
    iget-object v2, p0, Ll/din;->X:Lv/VText;

    .line 66
    .line 67
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 68
    .line 69
    .line 70
    iget-object v1, p0, Ll/din;->W:Lv/VFrame;

    .line 71
    .line 72
    iget-object v2, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 73
    .line 74
    invoke-virtual {v2, v0}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 79
    .line 80
    .line 81
    iget-object v1, p0, Ll/din;->R:Lv/VFrame;

    .line 82
    .line 83
    iget-object p0, p0, Ll/im60;->q:Lcom/p1/mobile/android/app/Act;

    .line 84
    .line 85
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-virtual {v1, p0}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 90
    .line 91
    .line 92
    return-void
.end method
