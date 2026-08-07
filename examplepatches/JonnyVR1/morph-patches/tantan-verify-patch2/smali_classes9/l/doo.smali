.class public Ll/doo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/frl;


# instance fields
.field public a:Landroid/widget/LinearLayout;

.field public b:Lv/VText;

.field public c:Lv/VLinear;

.field public d:Lv/VImage;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Lcom/p1/mobile/android/app/Act;

.field public h:I

.field public i:Ljava/lang/String;

.field public j:Lcom/p1/mobile/putong/core/data/PurchaseType;

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

.field public l:Lcom/p1/mobile/putong/core/ui/purchase/d;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;ILcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/doo;->g:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    iput p2, p0, Ll/doo;->h:I

    .line 7
    .line 8
    iput-object p3, p0, Ll/doo;->j:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic f(Ll/doo;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/doo;->o(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic g(Ll/doo;Ll/y20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/doo;->p(Ll/y20;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic h(Ll/doo;Ll/y20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/doo;->m(Ll/y20;)V

    return-void
.end method

.method public static synthetic i()V
    .locals 1

    .line 1
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->e8:I

    .line 2
    .line 3
    invoke-static {v0}, Ll/o1j0;->h(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic j(Ll/doo;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/doo;->n(Landroid/view/View;)V

    return-void
.end method

.method private synthetic o(Landroid/view/View;)V
    .locals 7

    .line 1
    const-string p1, "e_intl_boost_pop_ultra_btn"

    .line 2
    .line 3
    const-string v0, "p_purchase_page"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ll/doo;->g:Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    const/4 v5, 0x0

    .line 11
    sget-object v6, Lcom/p1/mobile/putong/core/data/Privilege;->full_boost:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 12
    .line 13
    const-string v2, "p_purchase_page,e_intl_boost_pop_ultra_btn,click"

    .line 14
    .line 15
    const/4 v3, 0x0

    .line 16
    const/4 v4, 0x0

    .line 17
    invoke-static/range {v1 .. v6}, Lcom/p1/mobile/putong/core/ui/purchase/c;->L0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;Ll/x20;Ll/x20;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method private synthetic p(Ll/y20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/doo;->r(Ll/y20;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private r(Ll/y20;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/doo;->l()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const-string v1, "tantancoin_purchase_click"

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    new-array v3, v2, [Ljava/lang/Object;

    .line 12
    .line 13
    invoke-static {v1, v3}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    iget v1, p0, Ll/doo;->h:I

    .line 17
    .line 18
    const/16 v3, 0xe

    .line 19
    .line 20
    if-eq v1, v3, :cond_1

    .line 21
    .line 22
    const/4 v3, 0x1

    .line 23
    if-ne v1, v3, :cond_2

    .line 24
    .line 25
    :cond_1
    const-string v1, "boost_purchase_click"

    .line 26
    .line 27
    new-array v2, v2, [Ljava/lang/Object;

    .line 28
    .line 29
    invoke-static {v1, v2}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    :cond_2
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 37
    .line 38
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->affiliateProducts:Lcom/p1/mobile/putong/core/data/AffiliateProducts;

    .line 39
    .line 40
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/AffiliateProducts;->getProductId()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v8

    .line 44
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 49
    .line 50
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 51
    .line 52
    iget-wide v0, v0, Lcom/p1/mobile/putong/core/data/Prices;->price:D

    .line 53
    .line 54
    const-string v2, "skuID"

    .line 55
    .line 56
    invoke-static {v2, v8}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    filled-new-array {v3}, [Ll/pf60;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    const-string v4, "e_purchase_intermediate_button"

    .line 65
    .line 66
    const-string v5, "p_purchase_page"

    .line 67
    .line 68
    invoke-static {v4, v5, v3}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 69
    .line 70
    .line 71
    const-string v3, "platform"

    .line 72
    .line 73
    const-string v4, "googleplay"

    .line 74
    .line 75
    invoke-static {v3, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 76
    .line 77
    .line 78
    move-result-object v3

    .line 79
    iget-object v4, p0, Ll/doo;->i:Ljava/lang/String;

    .line 80
    .line 81
    invoke-static {v4}, Ll/abb0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v4

    .line 85
    const-string v5, "purchaseShowFrom"

    .line 86
    .line 87
    invoke-static {v5, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 88
    .line 89
    .line 90
    move-result-object v4

    .line 91
    iget-object v5, p0, Ll/doo;->j:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 92
    .line 93
    invoke-virtual {v5}, Lcom/p1/mobile/putong/core/data/PurchaseType;->productCategory()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 94
    .line 95
    .line 96
    move-result-object v5

    .line 97
    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->name()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v5

    .line 101
    const-string v6, "productType"

    .line 102
    .line 103
    invoke-static {v6, v5}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 104
    .line 105
    .line 106
    move-result-object v5

    .line 107
    invoke-static {v2, v8}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    const-string v6, "price"

    .line 112
    .line 113
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-static {v6, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    filled-new-array {v3, v4, v5, v2, v0}, [Ll/pf60;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    const-string v1, "e_purchase_button"

    .line 126
    .line 127
    const-string v2, "p_purchase_intermediate_page"

    .line 128
    .line 129
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 130
    .line 131
    .line 132
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 137
    .line 138
    .line 139
    move-result-object v2

    .line 140
    iget-object v3, p0, Ll/doo;->g:Lcom/p1/mobile/android/app/Act;

    .line 141
    .line 142
    iget-object v4, p0, Ll/doo;->j:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 143
    .line 144
    new-instance v6, Ll/boo;

    .line 145
    .line 146
    invoke-direct {v6, p0, p1}, Ll/boo;-><init>(Ll/doo;Ll/y20;)V

    .line 147
    .line 148
    .line 149
    new-instance v7, Ll/coo;

    .line 150
    .line 151
    invoke-direct {v7}, Ll/coo;-><init>()V

    .line 152
    .line 153
    .line 154
    const/4 v5, 0x0

    .line 155
    invoke-interface/range {v2 .. v8}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Eo(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;ZLl/x20;Ll/x20;Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    return-void
.end method

.method private s()V
    .locals 7

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "\n"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ll/doo;->g:Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    invoke-static {}, Ll/l9n;->c()I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object v1, p0, Ll/doo;->g:Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->a8:I

    .line 28
    .line 29
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-interface {v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->xf()Z

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    if-eqz v2, :cond_0

    .line 46
    .line 47
    const-string v2, "/fep/tantan/frontend/tantan-frontend-app-pages-v2/src/pages/core/diamond-purchase-agreement/index.html?speed=true&_bid=1005375"

    .line 48
    .line 49
    invoke-static {v2}, Ll/xi5;->o(Ljava/lang/String;)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    invoke-virtual {v2}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    const-string v3, "lang"

    .line 62
    .line 63
    invoke-virtual {p0}, Ll/doo;->q()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    invoke-virtual {v2, v3, v4}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    sget v3, Ll/uqb0;->f0:I

    .line 72
    .line 73
    invoke-static {v3}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->d(I)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    const-string v4, "country"

    .line 78
    .line 79
    invoke-virtual {v2, v4, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    invoke-virtual {v2}, Landroid/net/Uri$Builder;->toString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    goto :goto_0

    .line 88
    :cond_0
    iget-object v2, p0, Ll/doo;->g:Lcom/p1/mobile/android/app/Act;

    .line 89
    .line 90
    sget v3, Lcom/p1/mobile/putong/core/pay/R$string;->c8:I

    .line 91
    .line 92
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 97
    .line 98
    .line 99
    move-result v3

    .line 100
    new-instance v4, Landroid/text/SpannableStringBuilder;

    .line 101
    .line 102
    invoke-direct {v4, v1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 103
    .line 104
    .line 105
    new-instance v1, Landroid/text/style/ForegroundColorSpan;

    .line 106
    .line 107
    iget-object v5, p0, Ll/doo;->g:Lcom/p1/mobile/android/app/Act;

    .line 108
    .line 109
    sget v6, Ll/h9c0;->l:I

    .line 110
    .line 111
    invoke-virtual {v5, v6}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 112
    .line 113
    .line 114
    move-result v5

    .line 115
    invoke-direct {v1, v5}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 116
    .line 117
    .line 118
    new-instance v5, Ll/doo$a;

    .line 119
    .line 120
    invoke-direct {v5, p0, v2}, Ll/doo$a;-><init>(Ll/doo;Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 124
    .line 125
    .line 126
    move-result v2

    .line 127
    add-int/2addr v2, v3

    .line 128
    const/16 v6, 0x21

    .line 129
    .line 130
    invoke-virtual {v4, v5, v3, v2, v6}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    add-int/2addr v0, v3

    .line 138
    invoke-virtual {v4, v1, v3, v0, v6}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 139
    .line 140
    .line 141
    iget-object v0, p0, Ll/doo;->f:Lv/VText;

    .line 142
    .line 143
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 144
    .line 145
    .line 146
    iget-object p0, p0, Ll/doo;->f:Lv/VText;

    .line 147
    .line 148
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 153
    .line 154
    .line 155
    return-void
.end method


# virtual methods
.method public a(Landroid/view/ViewGroup;Z)Landroid/view/View;
    .locals 2

    .line 1
    iget-object p2, p0, Ll/doo;->g:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    sget v0, Ll/rec0;->p:I

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
    invoke-virtual {p0, p1}, Ll/doo;->k(Landroid/view/View;)V

    .line 15
    .line 16
    .line 17
    return-object p1
.end method

.method public b(Lcom/p1/mobile/putong/core/ui/purchase/d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/doo;->l:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 2
    .line 3
    return-void
.end method

.method public c(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/doo;->i:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public d(Ll/y20;Ll/x20;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;",
            "Ll/x20;",
            ")V"
        }
    .end annotation

    .line 1
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 2
    .line 3
    invoke-virtual {p2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Vd()Z

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    if-eqz p2, :cond_4

    .line 12
    .line 13
    iget p2, p0, Ll/doo;->h:I

    .line 14
    .line 15
    const/4 v0, 0x2

    .line 16
    const-string v1, "p_purchase_page"

    .line 17
    .line 18
    const/4 v2, 0x1

    .line 19
    if-ne p2, v0, :cond_1

    .line 20
    .line 21
    const-string p2, "e_intl_superlike_pop_ultra_btn"

    .line 22
    .line 23
    invoke-static {p2, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object p2, p0, Ll/doo;->c:Lv/VLinear;

    .line 27
    .line 28
    invoke-static {p2, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    iget-object p2, p0, Ll/doo;->e:Lv/VText;

    .line 32
    .line 33
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_0

    .line 38
    .line 39
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->e6:I

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->W3:I

    .line 43
    .line 44
    :goto_0
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(I)V

    .line 45
    .line 46
    .line 47
    iget-object p2, p0, Ll/doo;->c:Lv/VLinear;

    .line 48
    .line 49
    new-instance v0, Ll/yno;

    .line 50
    .line 51
    invoke-direct {v0, p0}, Ll/yno;-><init>(Ll/doo;)V

    .line 52
    .line 53
    .line 54
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 55
    .line 56
    .line 57
    goto :goto_2

    .line 58
    :cond_1
    if-eq p2, v2, :cond_2

    .line 59
    .line 60
    const/16 v0, 0xe

    .line 61
    .line 62
    if-ne p2, v0, :cond_4

    .line 63
    .line 64
    :cond_2
    iget-object p2, p0, Ll/doo;->c:Lv/VLinear;

    .line 65
    .line 66
    invoke-static {p2, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 67
    .line 68
    .line 69
    const-string p2, "e_intl_boost_pop_ultra_btn"

    .line 70
    .line 71
    invoke-static {p2, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    iget-object p2, p0, Ll/doo;->e:Lv/VText;

    .line 75
    .line 76
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    if-eqz v0, :cond_3

    .line 81
    .line 82
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->W5:I

    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_3
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->k2:I

    .line 86
    .line 87
    :goto_1
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(I)V

    .line 88
    .line 89
    .line 90
    iget-object p2, p0, Ll/doo;->c:Lv/VLinear;

    .line 91
    .line 92
    new-instance v0, Ll/zno;

    .line 93
    .line 94
    invoke-direct {v0, p0}, Ll/zno;-><init>(Ll/doo;)V

    .line 95
    .line 96
    .line 97
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 98
    .line 99
    .line 100
    :cond_4
    :goto_2
    invoke-direct {p0}, Ll/doo;->s()V

    .line 101
    .line 102
    .line 103
    iget-object p2, p0, Ll/doo;->a:Landroid/widget/LinearLayout;

    .line 104
    .line 105
    new-instance v0, Ll/aoo;

    .line 106
    .line 107
    invoke-direct {v0, p0, p1}, Ll/aoo;-><init>(Ll/doo;Ll/y20;)V

    .line 108
    .line 109
    .line 110
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 111
    .line 112
    .line 113
    return-void
.end method

.method public e(J)V
    .locals 0

    .line 1
    return-void
.end method

.method public final k(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/eoo;->a(Ll/doo;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public l()Lcom/p1/mobile/putong/core/ui/purchase/d$a;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/doo;->l:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/doo;->l:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->m()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget-object p0, p0, Ll/doo;->l:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0

    .line 24
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0

    .line 29
    :cond_1
    const/4 p0, 0x0

    .line 30
    return-object p0
.end method

.method public final synthetic m(Ll/y20;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/doo;->j:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    const-string v1, "coin"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/fp60;->K(Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    sget v0, Lcom/p1/mobile/putong/core/pay/R$string;->d7:I

    .line 9
    .line 10
    invoke-static {v0}, Ll/o1j0;->w(I)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/doo;->k:Ll/a30;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Ll/doo;->k:Ll/a30;

    .line 22
    .line 23
    iget-object v1, p0, Ll/doo;->j:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 24
    .line 25
    iget-object v2, p0, Ll/doo;->g:Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    iget-object p0, p0, Ll/doo;->i:Ljava/lang/String;

    .line 28
    .line 29
    invoke-interface {v0, v1, v2, p0}, Ll/a30;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    const/4 p0, 0x0

    .line 33
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final synthetic n(Landroid/view/View;)V
    .locals 7

    .line 1
    const-string p1, "e_intl_superlike_pop_ultra_btn"

    .line 2
    .line 3
    const-string v0, "p_purchase_page"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ll/doo;->g:Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    const/4 v5, 0x0

    .line 11
    sget-object v6, Lcom/p1/mobile/putong/core/data/Privilege;->unlimit_free_super_like:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 12
    .line 13
    const-string v2, "p_purchase_page,e_intl_superlike_pop_ultra_btn,click"

    .line 14
    .line 15
    const/4 v3, 0x0

    .line 16
    const/4 v4, 0x0

    .line 17
    invoke-static/range {v1 .. v6}, Lcom/p1/mobile/putong/core/ui/purchase/c;->L0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;Ll/x20;Ll/x20;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public q()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object p0, p0, Ll/doo;->g:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget-object p0, p0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0

    .line 28
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string v1, "-"

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    return-object p0
.end method

.method public t(Ll/a30;)V
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
    iput-object p1, p0, Ll/doo;->k:Ll/a30;

    .line 2
    .line 3
    return-void
.end method
