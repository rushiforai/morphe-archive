.class public Ll/p6b0;
.super Ll/g1e;
.source "SourceFile"


# instance fields
.field public A:Lv/VText;

.field public B:Lv/VText;

.field public C:Lv/VText;

.field public D:Landroid/view/View;

.field public E:Lcom/p1/mobile/android/app/Act;

.field public F:Ll/x20;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public G:Ljava/lang/String;

.field public H:Ll/l4g0;

.field public I:Lcom/p1/mobile/putong/core/data/Merchandise;

.field public J:Lcom/p1/mobile/putong/core/data/Coupon;

.field public K:Lcom/p1/mobile/putong/data/PayMethod;

.field public L:Ljava/text/DecimalFormat;

.field public M:Ljava/text/DecimalFormat;

.field public N:Ljava/text/NumberFormat;

.field public O:D

.field public P:D

.field public Q:Ll/lib0;

.field public R:D

.field public j:Lv/VImage;

.field public k:Lv/VImage;

.field public l:Lv/VText;

.field public m:Lv/VText;

.field public n:Lv/VText;

.field public o:Lv/VText;

.field public p:Lv/VText;

.field public q:Landroid/widget/LinearLayout;

.field public r:Lv/VCheckBox;

.field public s:Lv/VText;

.field public t:Landroid/widget/RelativeLayout;

.field public u:Landroid/widget/TextView;

.field public v:Lv/VText;

.field public w:Landroid/view/View;

.field public x:Lv/VText;

.field public y:Landroid/widget/LinearLayout;

.field public z:Lv/VText;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/y20;Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/Coupon;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            "Lcom/p1/mobile/putong/core/data/Coupon;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    sget v1, Ll/dgc0;->b:I

    .line 3
    .line 4
    invoke-direct {p0, p1, v0, v1}, Ll/g1e;-><init>(Landroid/content/Context;ZI)V

    .line 5
    .line 6
    .line 7
    new-instance v0, Ljava/text/DecimalFormat;

    .line 8
    .line 9
    const-string v1, "#.#"

    .line 10
    .line 11
    invoke-direct {v0, v1}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ll/p6b0;->L:Ljava/text/DecimalFormat;

    .line 15
    .line 16
    new-instance v0, Ljava/text/DecimalFormat;

    .line 17
    .line 18
    invoke-direct {v0, v1}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Ll/p6b0;->M:Ljava/text/DecimalFormat;

    .line 22
    .line 23
    new-instance v0, Ljava/text/DecimalFormat;

    .line 24
    .line 25
    const-string v1, "00"

    .line 26
    .line 27
    invoke-direct {v0, v1}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Ll/p6b0;->N:Ljava/text/NumberFormat;

    .line 31
    .line 32
    iput-object p1, p0, Ll/p6b0;->E:Lcom/p1/mobile/android/app/Act;

    .line 33
    .line 34
    new-instance p1, Ll/j6b0;

    .line 35
    .line 36
    invoke-direct {p1, p0, p2}, Ll/j6b0;-><init>(Ll/p6b0;Ll/y20;)V

    .line 37
    .line 38
    .line 39
    iput-object p1, p0, Ll/p6b0;->F:Ll/x20;

    .line 40
    .line 41
    iput-object p3, p0, Ll/p6b0;->I:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 42
    .line 43
    iput-object p4, p0, Ll/p6b0;->J:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 44
    .line 45
    iget-object p1, p3, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 46
    .line 47
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 48
    .line 49
    iget-wide p1, p1, Lcom/p1/mobile/putong/core/data/Prices;->price:D

    .line 50
    .line 51
    iput-wide p1, p0, Ll/p6b0;->P:D

    .line 52
    .line 53
    iget-object p1, p4, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 54
    .line 55
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Benefit;->localBenefit:Lcom/p1/mobile/putong/core/data/LocalBenefit;

    .line 56
    .line 57
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/LocalBenefit;->discountBenefit:Lcom/p1/mobile/putong/core/data/DiscountBenefit;

    .line 58
    .line 59
    iget p1, p1, Lcom/p1/mobile/putong/core/data/DiscountBenefit;->value:I

    .line 60
    .line 61
    int-to-double p1, p1

    .line 62
    const-wide/high16 p3, 0x4059000000000000L    # 100.0

    .line 63
    .line 64
    div-double/2addr p1, p3

    .line 65
    iput-wide p1, p0, Ll/p6b0;->O:D

    .line 66
    .line 67
    iput-object p5, p0, Ll/p6b0;->G:Ljava/lang/String;

    .line 68
    .line 69
    return-void
.end method

.method private synthetic A0(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/p6b0;->I:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 4
    .line 5
    const-string v0, "svip"

    .line 6
    .line 7
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    const-string v0, "\u4ec5\u652f\u6301\u652f\u4ed8\u5b9d\u8d2d\u4e70"

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p1, p0, Ll/p6b0;->I:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Merchandise;->semiAnnual()Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    invoke-static {v0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    invoke-virtual {p0}, Ll/p6b0;->L0()Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_1

    .line 32
    .line 33
    invoke-static {v0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    new-instance p1, Ll/bo60;

    .line 38
    .line 39
    iget-object v0, p0, Ll/p6b0;->E:Lcom/p1/mobile/android/app/Act;

    .line 40
    .line 41
    iget-object v1, p0, Ll/p6b0;->I:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 42
    .line 43
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 44
    .line 45
    invoke-virtual {p0, v1}, Ll/p6b0;->a0(Lcom/p1/mobile/putong/core/data/ProductCategory;)Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-direct {p1, v0, v1}, Ll/bo60;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Ll/p6b0;->K:Lcom/p1/mobile/putong/data/PayMethod;

    .line 53
    .line 54
    invoke-virtual {p1, v0}, Ll/bo60;->r(Lcom/p1/mobile/putong/data/PayMethod;)Ll/bo60;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    new-instance v0, Ll/d6b0;

    .line 59
    .line 60
    invoke-direct {v0, p0}, Ll/d6b0;-><init>(Ll/p6b0;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p1, v0}, Ll/bo60;->q(Ll/y20;)Ll/bo60;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p0}, Ll/bo60;->s()V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method private synthetic B0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p6b0;->F:Ll/x20;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/x20;->call()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic C0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p6b0;->W0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/p6b0;->f0()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private synthetic D0(Ll/y20;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p6b0;->dismiss()V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public static synthetic E(Ll/p6b0;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/p6b0;->F0(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic F(Ljava/util/List;)Ljava/lang/Boolean;
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

.method public static synthetic G(Ll/p6b0;Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/p6b0;->y0(Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z

    move-result p0

    return p0
.end method

.method public static synthetic H(Ll/p6b0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p6b0;->G0()V

    return-void
.end method

.method public static synthetic I(Ll/p6b0;Lcom/p1/mobile/putong/data/PayMethod;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/p6b0;->K0(Lcom/p1/mobile/putong/data/PayMethod;)V

    return-void
.end method

.method public static synthetic J(Ll/p6b0;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/p6b0;->I0(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic K(Ll/p6b0;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/p6b0;->x0(Ljava/util/List;)V

    return-void
.end method

.method private K0(Lcom/p1/mobile/putong/data/PayMethod;)V
    .locals 4

    .line 1
    iput-object p1, p0, Ll/p6b0;->K:Lcom/p1/mobile/putong/data/PayMethod;

    .line 2
    .line 3
    const-string v0, "alipay"

    .line 4
    .line 5
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    const/4 v0, 0x0

    .line 10
    const/4 v1, 0x0

    .line 11
    if-eqz p1, :cond_2

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->U()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 28
    .line 29
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->O0:Lcom/p1/mobile/putong/core/api/CoreAutoPay;

    .line 30
    .line 31
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->n3()Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_0

    .line 36
    .line 37
    const/4 v1, 0x1

    .line 38
    :cond_0
    iget-object p1, p0, Ll/p6b0;->u:Landroid/widget/TextView;

    .line 39
    .line 40
    if-eqz v1, :cond_1

    .line 41
    .line 42
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->h:I

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->C:I

    .line 46
    .line 47
    :goto_0
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setText(I)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Ll/p6b0;->u:Landroid/widget/TextView;

    .line 51
    .line 52
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 53
    .line 54
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    sget v3, Ll/jbc0;->f3:I

    .line 59
    .line 60
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    invoke-virtual {p1, v2, v0, v0, v0}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 65
    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_2
    iget-object p1, p0, Ll/p6b0;->K:Lcom/p1/mobile/putong/data/PayMethod;

    .line 69
    .line 70
    const-string v2, "wechat"

    .line 71
    .line 72
    invoke-static {p1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    if-eqz p1, :cond_3

    .line 77
    .line 78
    iget-object p1, p0, Ll/p6b0;->u:Landroid/widget/TextView;

    .line 79
    .line 80
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->H:I

    .line 81
    .line 82
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setText(I)V

    .line 83
    .line 84
    .line 85
    iget-object p1, p0, Ll/p6b0;->u:Landroid/widget/TextView;

    .line 86
    .line 87
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 88
    .line 89
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    sget v3, Ll/jbc0;->e3:I

    .line 94
    .line 95
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    invoke-virtual {p1, v2, v0, v0, v0}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 100
    .line 101
    .line 102
    :cond_3
    :goto_1
    iget-object p1, p0, Ll/p6b0;->z:Lv/VText;

    .line 103
    .line 104
    if-eqz v1, :cond_4

    .line 105
    .line 106
    iget-object v0, p0, Ll/p6b0;->M:Ljava/text/DecimalFormat;

    .line 107
    .line 108
    iget-wide v1, p0, Ll/p6b0;->O:D

    .line 109
    .line 110
    invoke-virtual {v0, v1, v2}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    const-string v1, "\u786e\u8ba4\u534f\u8bae\u514d\u5bc6\u4ed8\u00a5%s"

    .line 119
    .line 120
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 125
    .line 126
    .line 127
    goto :goto_2

    .line 128
    :cond_4
    iget-object v0, p0, Ll/p6b0;->M:Ljava/text/DecimalFormat;

    .line 129
    .line 130
    iget-wide v1, p0, Ll/p6b0;->O:D

    .line 131
    .line 132
    invoke-virtual {v0, v1, v2}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    const-string v1, "\u786e\u8ba4\u534f\u8bae\u5e76\u652f\u4ed8\u00a5%s"

    .line 141
    .line 142
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 147
    .line 148
    .line 149
    :goto_2
    invoke-direct {p0}, Ll/p6b0;->P0()V

    .line 150
    .line 151
    .line 152
    return-void
.end method

.method public static synthetic L(Ll/p6b0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/p6b0;->B0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic M(Ll/p6b0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p6b0;->H0()V

    return-void
.end method

.method private M0()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/p6b0;->K:Lcom/p1/mobile/putong/data/PayMethod;

    .line 2
    .line 3
    const-string v1, "wechat"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ll/xl60;->p()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    sget-object v0, Ll/lib0;->Companion:Ll/lib0$a;

    .line 18
    .line 19
    iget-object v1, p0, Ll/p6b0;->Q:Ll/lib0;

    .line 20
    .line 21
    invoke-virtual {v1}, Ll/lib0;->n()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    iget-object p0, p0, Ll/p6b0;->I:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->id:Ljava/lang/String;

    .line 30
    .line 31
    const-string v2, "wx not install"

    .line 32
    .line 33
    invoke-virtual {v0, v1, p0, v2}, Ll/lib0$a;->g(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->j3()Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-nez v0, :cond_1

    .line 50
    .line 51
    invoke-static {}, Ll/xl60;->k()Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-nez v0, :cond_1

    .line 56
    .line 57
    sget-object v0, Ll/lib0;->Companion:Ll/lib0$a;

    .line 58
    .line 59
    iget-object v1, p0, Ll/p6b0;->Q:Ll/lib0;

    .line 60
    .line 61
    invoke-virtual {v1}, Ll/lib0;->n()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    iget-object p0, p0, Ll/p6b0;->I:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 66
    .line 67
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 68
    .line 69
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->id:Ljava/lang/String;

    .line 70
    .line 71
    const-string v2, "alipay not install"

    .line 72
    .line 73
    invoke-virtual {v0, v1, p0, v2}, Ll/lib0$a;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :cond_1
    iget-object v0, p0, Ll/p6b0;->r:Lv/VCheckBox;

    .line 78
    .line 79
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-eqz v0, :cond_2

    .line 84
    .line 85
    invoke-static {}, Ll/pta;->u()Z

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    if-eqz v0, :cond_2

    .line 90
    .line 91
    iget-object v0, p0, Ll/p6b0;->r:Lv/VCheckBox;

    .line 92
    .line 93
    invoke-virtual {v0}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    if-nez v0, :cond_2

    .line 98
    .line 99
    iget-object v0, p0, Ll/p6b0;->E:Lcom/p1/mobile/android/app/Act;

    .line 100
    .line 101
    iget-object v1, p0, Ll/p6b0;->Q:Ll/lib0;

    .line 102
    .line 103
    invoke-virtual {v1}, Ll/lib0;->e()Lorg/json/JSONObject;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    new-instance v2, Ll/z5b0;

    .line 108
    .line 109
    invoke-direct {v2, p0}, Ll/z5b0;-><init>(Ll/p6b0;)V

    .line 110
    .line 111
    .line 112
    new-instance v3, Ll/a6b0;

    .line 113
    .line 114
    invoke-direct {v3, p0}, Ll/a6b0;-><init>(Ll/p6b0;)V

    .line 115
    .line 116
    .line 117
    invoke-static {v0, v1, v2, v3}, Ll/pta;->C(Lcom/p1/mobile/android/app/Act;Lorg/json/JSONObject;Ll/x20;Ll/x20;)V

    .line 118
    .line 119
    .line 120
    return-void

    .line 121
    :cond_2
    new-instance v0, Ll/wn60;

    .line 122
    .line 123
    iget-object v2, p0, Ll/p6b0;->I:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 124
    .line 125
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 126
    .line 127
    invoke-virtual {p0, v2}, Ll/p6b0;->a0(Lcom/p1/mobile/putong/core/data/ProductCategory;)Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 128
    .line 129
    .line 130
    move-result-object v2

    .line 131
    iget-object v3, p0, Ll/p6b0;->E:Lcom/p1/mobile/android/app/Act;

    .line 132
    .line 133
    const-string v4, ""

    .line 134
    .line 135
    invoke-direct {v0, v2, v3, v4, v4}, Ll/wn60;-><init>(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/Object;)V

    .line 136
    .line 137
    .line 138
    iget-object v2, p0, Ll/p6b0;->Q:Ll/lib0;

    .line 139
    .line 140
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    move-result v2

    .line 144
    if-eqz v2, :cond_3

    .line 145
    .line 146
    iget-object v2, p0, Ll/p6b0;->Q:Ll/lib0;

    .line 147
    .line 148
    invoke-virtual {v2}, Ll/lib0;->n()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v2

    .line 152
    invoke-virtual {v0, v2}, Ll/wn60;->C(Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    :cond_3
    iget-object v2, p0, Ll/p6b0;->J:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 156
    .line 157
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Coupon;->couponID:Ljava/lang/String;

    .line 158
    .line 159
    invoke-virtual {v0, v2}, Ll/wn60;->r(Ljava/lang/String;)Ll/wn60;

    .line 160
    .line 161
    .line 162
    iget-object v2, p0, Ll/p6b0;->I:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 163
    .line 164
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    .line 165
    .line 166
    .line 167
    move-result v2

    .line 168
    if-eqz v2, :cond_4

    .line 169
    .line 170
    iget-object v2, p0, Ll/p6b0;->K:Lcom/p1/mobile/putong/data/PayMethod;

    .line 171
    .line 172
    invoke-static {v2, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 173
    .line 174
    .line 175
    move-result v1

    .line 176
    iget-object v2, p0, Ll/p6b0;->I:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 177
    .line 178
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 179
    .line 180
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->id:Ljava/lang/String;

    .line 181
    .line 182
    new-instance v3, Ll/b6b0;

    .line 183
    .line 184
    invoke-direct {v3, p0}, Ll/b6b0;-><init>(Ll/p6b0;)V

    .line 185
    .line 186
    .line 187
    invoke-virtual {v0, v1, v2, v3}, Ll/wn60;->I(ZLjava/lang/String;Ll/y20;)V

    .line 188
    .line 189
    .line 190
    return-void

    .line 191
    :cond_4
    iget-object v2, p0, Ll/p6b0;->I:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 192
    .line 193
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 194
    .line 195
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->id:Ljava/lang/String;

    .line 196
    .line 197
    iget-object v3, p0, Ll/p6b0;->K:Lcom/p1/mobile/putong/data/PayMethod;

    .line 198
    .line 199
    invoke-static {v3, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 200
    .line 201
    .line 202
    move-result v1

    .line 203
    new-instance v3, Ll/c6b0;

    .line 204
    .line 205
    invoke-direct {v3, p0}, Ll/c6b0;-><init>(Ll/p6b0;)V

    .line 206
    .line 207
    .line 208
    invoke-virtual {v0, v2, v1, v3}, Ll/wn60;->o(Ljava/lang/String;ZLl/y20;)V

    .line 209
    .line 210
    .line 211
    return-void
.end method

.method public static synthetic N(Ll/p6b0;Lcom/google/common/base/Optional;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/p6b0;->v0(Lcom/google/common/base/Optional;)V

    return-void
.end method

.method private N0()V
    .locals 8

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-object v2, p0, Ll/p6b0;->J:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 6
    .line 7
    iget-wide v2, v2, Lcom/p1/mobile/putong/core/data/Coupon;->endTime:D

    .line 8
    .line 9
    long-to-double v0, v0

    .line 10
    sub-double/2addr v2, v0

    .line 11
    double-to-long v0, v2

    .line 12
    const-wide/16 v2, 0x0

    .line 13
    .line 14
    cmp-long v2, v0, v2

    .line 15
    .line 16
    const-string v3, "\u4f18\u60e0\u5373\u5c06\u7ed3\u675f %s"

    .line 17
    .line 18
    if-gtz v2, :cond_0

    .line 19
    .line 20
    const-string v0, "00:00:00"

    .line 21
    .line 22
    invoke-direct {p0, v3, v0}, Ll/p6b0;->Y(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object p0, p0, Ll/p6b0;->C:Lv/VText;

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    const-wide/32 v4, 0x5265c00

    .line 33
    .line 34
    .line 35
    cmp-long v2, v0, v4

    .line 36
    .line 37
    if-lez v2, :cond_1

    .line 38
    .line 39
    div-long/2addr v0, v4

    .line 40
    long-to-int v0, v0

    .line 41
    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 42
    .line 43
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    const-string v2, "%d\u5929"

    .line 52
    .line 53
    invoke-static {v1, v2, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    const-string v1, "\u4f18\u60e0 %s \u540e\u5230\u671f"

    .line 58
    .line 59
    invoke-direct {p0, v1, v0}, Ll/p6b0;->Y(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    iget-object p0, p0, Ll/p6b0;->C:Lv/VText;

    .line 64
    .line 65
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_1
    const-wide/32 v4, 0x36ee80

    .line 70
    .line 71
    .line 72
    div-long v6, v0, v4

    .line 73
    .line 74
    long-to-int v2, v6

    .line 75
    rem-long v4, v0, v4

    .line 76
    .line 77
    const-wide/32 v6, 0xea60

    .line 78
    .line 79
    .line 80
    div-long/2addr v4, v6

    .line 81
    long-to-int v4, v4

    .line 82
    rem-long/2addr v0, v6

    .line 83
    long-to-int v0, v0

    .line 84
    div-int/lit16 v0, v0, 0x3e8

    .line 85
    .line 86
    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 87
    .line 88
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 93
    .line 94
    .line 95
    move-result-object v4

    .line 96
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    filled-new-array {v2, v4, v0}, [Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    const-string v2, "%02d:%02d:%02d"

    .line 105
    .line 106
    invoke-static {v1, v2, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-direct {p0, v3, v0}, Ll/p6b0;->Y(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    iget-object p0, p0, Ll/p6b0;->C:Lv/VText;

    .line 115
    .line 116
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 117
    .line 118
    .line 119
    return-void
.end method

.method public static synthetic O(Ll/p6b0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/p6b0;->A0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic P(Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Merchandise;->monthly()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method private P0()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->jh()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget-object v0, p0, Ll/p6b0;->K:Lcom/p1/mobile/putong/data/PayMethod;

    .line 16
    .line 17
    const-string v1, "alipay"

    .line 18
    .line 19
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->D6()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iget-object v1, p0, Ll/p6b0;->v:Lv/VText;

    .line 38
    .line 39
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Ll/p6b0;->v:Lv/VText;

    .line 43
    .line 44
    const/4 v0, 0x1

    .line 45
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_0
    iget-object p0, p0, Ll/p6b0;->v:Lv/VText;

    .line 50
    .line 51
    const/4 v0, 0x0

    .line 52
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 53
    .line 54
    .line 55
    :cond_1
    return-void
.end method

.method public static synthetic Q(Ll/p6b0;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/p6b0;->J0(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic R(Ll/p6b0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/p6b0;->w0(Ljava/lang/Throwable;)V

    return-void
.end method

.method private R0()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/high16 v1, 0x4000000

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const/high16 v1, -0x80000000

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const/4 v1, 0x0

    .line 24
    invoke-virtual {v0, v1}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const/16 v0, 0x500

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public static synthetic S(Ll/p6b0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/p6b0;->z0(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static S0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Merchandise;Ll/y20;Ljava/lang/String;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/core/data/Merchandise;->getCouponForPromotion(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Coupon;

    .line 2
    .line 3
    .line 4
    move-result-object v3

    .line 5
    const/4 v5, 0x0

    .line 6
    const/4 v6, 0x0

    .line 7
    move-object v0, p0

    .line 8
    move-object v2, p2

    .line 9
    move-object v1, p3

    .line 10
    move-object v4, p4

    .line 11
    invoke-static/range {v0 .. v6}, Ll/p6b0;->T0(Lcom/p1/mobile/android/app/Act;Ll/y20;Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/Coupon;Ljava/lang/String;Lcom/p1/mobile/putong/data/PayMethod;Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic T(Ll/p6b0;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/p6b0;->D0(Ll/y20;)V

    return-void
.end method

.method public static T0(Lcom/p1/mobile/android/app/Act;Ll/y20;Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/Coupon;Ljava/lang/String;Lcom/p1/mobile/putong/data/PayMethod;Ljava/lang/Object;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            "Lcom/p1/mobile/putong/core/data/Coupon;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/PayMethod;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p6

    .line 5
    if-nez p6, :cond_0

    .line 6
    .line 7
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->P1:I

    .line 8
    .line 9
    invoke-static {p0}, Ll/o1j0;->C(I)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Merchandise;->yearly()Z

    .line 14
    .line 15
    .line 16
    move-result p6

    .line 17
    if-eqz p6, :cond_1

    .line 18
    .line 19
    const-string p6, "wechat"

    .line 20
    .line 21
    invoke-static {p5, p6}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result p6

    .line 25
    if-eqz p6, :cond_1

    .line 26
    .line 27
    const-string p5, "alipay"

    .line 28
    .line 29
    invoke-static {p5}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    .line 30
    .line 31
    .line 32
    move-result-object p5

    .line 33
    :cond_1
    new-instance v0, Ll/p6b0;

    .line 34
    .line 35
    move-object v1, p0

    .line 36
    move-object v2, p1

    .line 37
    move-object v3, p2

    .line 38
    move-object v4, p3

    .line 39
    move-object v5, p4

    .line 40
    invoke-direct/range {v0 .. v5}, Ll/p6b0;-><init>(Lcom/p1/mobile/android/app/Act;Ll/y20;Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/Coupon;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0}, Ll/p6b0;->show()V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, p5}, Ll/p6b0;->Q0(Lcom/p1/mobile/putong/data/PayMethod;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public static synthetic U(Ll/p6b0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/p6b0;->C0(Landroid/view/View;)V

    return-void
.end method

.method public static U0(Lcom/p1/mobile/android/app/Act;Ll/y20;Lcom/p1/mobile/putong/core/data/Merchandise;Ljava/lang/String;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    const-string v0, "lowPriceFirstTime12MSVIP"

    .line 2
    .line 3
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/core/data/Merchandise;->getCouponForPromotion(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Coupon;

    .line 4
    .line 5
    .line 6
    move-result-object v4

    .line 7
    const/4 v6, 0x0

    .line 8
    const/4 v7, 0x0

    .line 9
    move-object v1, p0

    .line 10
    move-object v2, p1

    .line 11
    move-object v3, p2

    .line 12
    move-object v5, p3

    .line 13
    invoke-static/range {v1 .. v7}, Ll/p6b0;->T0(Lcom/p1/mobile/android/app/Act;Ll/y20;Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/Coupon;Ljava/lang/String;Lcom/p1/mobile/putong/data/PayMethod;Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic V(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-ne p1, p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static synthetic W(Ll/p6b0;Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/p6b0;->E0(Ljava/lang/Long;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method private Y(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;
    .locals 5

    .line 1
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    new-instance v1, Landroid/text/SpannableStringBuilder;

    .line 14
    .line 15
    invoke-direct {v1, p1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    new-instance p1, Lv/text/CustomTypefaceSpan;

    .line 19
    .line 20
    sget-object v2, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 21
    .line 22
    iget-object p0, p0, Ll/p6b0;->E:Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    sget v3, Ll/h9c0;->l:I

    .line 25
    .line 26
    invoke-virtual {p0, v3}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    const/16 v3, 0x12

    .line 31
    .line 32
    invoke-static {v3}, Ll/qa00;->f(I)I

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    const-string v4, "sans-serif"

    .line 37
    .line 38
    invoke-direct {p1, v4, v2, p0, v3}, Lv/text/CustomTypefaceSpan;-><init>(Ljava/lang/String;Landroid/graphics/Typeface;II)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    add-int/2addr p0, v0

    .line 46
    const/16 p2, 0x21

    .line 47
    .line 48
    invoke-virtual {v1, p1, v0, p0, p2}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 49
    .line 50
    .line 51
    return-object v1
.end method

.method private g0()V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/p6b0;->I:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/16 v1, 0x12

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    const-string v3, "#33000000"

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    new-instance v0, Ljava/text/DecimalFormat;

    .line 15
    .line 16
    const-string v4, "#.##"

    .line 17
    .line 18
    invoke-direct {v0, v4}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-wide v4, p0, Ll/p6b0;->P:D

    .line 22
    .line 23
    invoke-virtual {v0, v4, v5}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 28
    .line 29
    sget v5, Lcom/p1/mobile/putong/core/pay/R$string;->G0:I

    .line 30
    .line 31
    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    iget-object v5, p0, Ll/p6b0;->I:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 36
    .line 37
    invoke-virtual {v5}, Lcom/p1/mobile/putong/core/data/Merchandise;->quantityName()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v5

    .line 41
    const-string v6, "\u4f1a\u5458\u53ca\u81ea\u52a8\u7eed\u8d39\u534f\u8bae"

    .line 42
    .line 43
    const-string v7, ""

    .line 44
    .line 45
    filled-new-array {v6, v7, v0, v5}, [Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-static {v4, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    new-instance v4, Landroid/text/SpannableStringBuilder;

    .line 54
    .line 55
    invoke-direct {v4, v0}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    new-instance v5, Ll/da5;

    .line 63
    .line 64
    sget-object v6, Ll/bn60;->b:Ljava/lang/String;

    .line 65
    .line 66
    invoke-direct {v5, v6}, Ll/da5;-><init>(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 70
    .line 71
    .line 72
    move-result v3

    .line 73
    invoke-virtual {v5, v3}, Ll/da5;->b(I)Ll/da5;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    sget-object v5, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 78
    .line 79
    sget v6, Lcom/p1/mobile/putong/core/pay/R$string;->D6:I

    .line 80
    .line 81
    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v5

    .line 85
    invoke-virtual {v3, v5}, Ll/da5;->c(Ljava/lang/String;)Ll/da5;

    .line 86
    .line 87
    .line 88
    move-result-object v3

    .line 89
    invoke-virtual {v3, v2}, Ll/da5;->d(Z)Ll/da5;

    .line 90
    .line 91
    .line 92
    move-result-object v3

    .line 93
    add-int/lit8 v5, v0, 0x9

    .line 94
    .line 95
    invoke-virtual {v4, v3, v0, v5, v1}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 96
    .line 97
    .line 98
    new-instance v3, Landroid/text/style/StyleSpan;

    .line 99
    .line 100
    invoke-direct {v3, v2}, Landroid/text/style/StyleSpan;-><init>(I)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {v4, v3, v0, v5, v1}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 104
    .line 105
    .line 106
    iget-object v0, p0, Ll/p6b0;->s:Lv/VText;

    .line 107
    .line 108
    new-instance v1, Ll/od0;

    .line 109
    .line 110
    invoke-direct {v1, v4}, Ll/od0;-><init>(Landroid/text/Spannable;)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 114
    .line 115
    .line 116
    iget-object p0, p0, Ll/p6b0;->s:Lv/VText;

    .line 117
    .line 118
    invoke-virtual {p0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 119
    .line 120
    .line 121
    return-void

    .line 122
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_NONE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 123
    .line 124
    iget-object v4, p0, Ll/p6b0;->I:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 125
    .line 126
    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 127
    .line 128
    const-string v5, "svip"

    .line 129
    .line 130
    invoke-static {v5}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 131
    .line 132
    .line 133
    move-result-object v5

    .line 134
    invoke-static {v4, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 135
    .line 136
    .line 137
    move-result v4

    .line 138
    if-eqz v4, :cond_1

    .line 139
    .line 140
    sget-object v4, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 141
    .line 142
    goto :goto_0

    .line 143
    :cond_1
    iget-object v4, p0, Ll/p6b0;->I:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 144
    .line 145
    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 146
    .line 147
    const-string v5, "tttVip"

    .line 148
    .line 149
    invoke-static {v5}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 150
    .line 151
    .line 152
    move-result-object v5

    .line 153
    invoke-static {v4, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 154
    .line 155
    .line 156
    move-result v4

    .line 157
    if-eqz v4, :cond_2

    .line 158
    .line 159
    sget-object v4, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 160
    .line 161
    goto :goto_0

    .line 162
    :cond_2
    move-object v4, v0

    .line 163
    :goto_0
    if-eq v4, v0, :cond_3

    .line 164
    .line 165
    new-instance v0, Ljava/lang/StringBuilder;

    .line 166
    .line 167
    const-string v4, "\u5f00\u901a\u524d\u9605\u8bfb"

    .line 168
    .line 169
    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 170
    .line 171
    .line 172
    const-string v4, "\u300a\u4f1a\u5458\u670d\u52a1\u534f\u8bae\u300b"

    .line 173
    .line 174
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 175
    .line 176
    .line 177
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object v4

    .line 181
    const-string v5, "\u4f1a\u5458\u670d\u52a1\u534f\u8bae"

    .line 182
    .line 183
    filled-new-array {v5}, [Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object v6

    .line 187
    invoke-static {v6}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 188
    .line 189
    .line 190
    move-result-object v6

    .line 191
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 192
    .line 193
    .line 194
    move-result v7

    .line 195
    const/4 v8, 0x3

    .line 196
    invoke-static {v8}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 197
    .line 198
    .line 199
    move-result-object v8

    .line 200
    invoke-static {v4, v6, v7, v8}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 201
    .line 202
    .line 203
    move-result-object v4

    .line 204
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->indexOf(Ljava/lang/String;)I

    .line 205
    .line 206
    .line 207
    move-result v0

    .line 208
    new-instance v5, Ll/da5;

    .line 209
    .line 210
    sget-object v6, Ll/bn60;->c:Ljava/lang/String;

    .line 211
    .line 212
    invoke-direct {v5, v6}, Ll/da5;-><init>(Ljava/lang/String;)V

    .line 213
    .line 214
    .line 215
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 216
    .line 217
    .line 218
    move-result v3

    .line 219
    invoke-virtual {v5, v3}, Ll/da5;->b(I)Ll/da5;

    .line 220
    .line 221
    .line 222
    move-result-object v3

    .line 223
    sget-object v5, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 224
    .line 225
    sget v6, Lcom/p1/mobile/putong/core/pay/R$string;->D6:I

    .line 226
    .line 227
    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 228
    .line 229
    .line 230
    move-result-object v5

    .line 231
    invoke-virtual {v3, v5}, Ll/da5;->c(Ljava/lang/String;)Ll/da5;

    .line 232
    .line 233
    .line 234
    move-result-object v3

    .line 235
    invoke-virtual {v3, v2}, Ll/da5;->d(Z)Ll/da5;

    .line 236
    .line 237
    .line 238
    move-result-object v2

    .line 239
    add-int/lit8 v3, v0, 0x6

    .line 240
    .line 241
    invoke-virtual {v4, v2, v0, v3, v1}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 242
    .line 243
    .line 244
    iget-object v0, p0, Ll/p6b0;->s:Lv/VText;

    .line 245
    .line 246
    new-instance v1, Ll/od0;

    .line 247
    .line 248
    invoke-direct {v1, v4}, Ll/od0;-><init>(Landroid/text/Spannable;)V

    .line 249
    .line 250
    .line 251
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 252
    .line 253
    .line 254
    iget-object p0, p0, Ll/p6b0;->s:Lv/VText;

    .line 255
    .line 256
    invoke-virtual {p0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 257
    .line 258
    .line 259
    :cond_3
    return-void
.end method

.method private n0()V
    .locals 2

    .line 1
    invoke-static {}, Ll/efh0;->j()Ll/efh0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/p6b0;->J:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/efh0;->l(Lcom/p1/mobile/putong/core/data/Coupon;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 16
    .line 17
    const-string v1, "svip"

    .line 18
    .line 19
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/CoreProduct;->y5(Lcom/p1/mobile/putong/core/data/ProductCategory;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {p0, v0}, Ll/g1e;->duringCreated(Lrx/c;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ll/w5b0;

    .line 32
    .line 33
    invoke-direct {v1}, Ll/w5b0;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    const/4 v1, 0x1

    .line 41
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    new-instance v1, Ll/g6b0;

    .line 46
    .line 47
    invoke-direct {v1, p0}, Ll/g6b0;-><init>(Ll/p6b0;)V

    .line 48
    .line 49
    .line 50
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 55
    .line 56
    .line 57
    :cond_0
    return-void
.end method

.method private r0()V
    .locals 4

    .line 1
    invoke-static {}, Ll/pta;->u()Z

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
    iget-object v0, p0, Ll/p6b0;->I:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Ll/p6b0;->r:Lv/VCheckBox;

    .line 17
    .line 18
    const/4 v2, 0x1

    .line 19
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/p6b0;->r:Lv/VCheckBox;

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    iget-object v0, p0, Ll/p6b0;->r:Lv/VCheckBox;

    .line 29
    .line 30
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    :goto_0
    invoke-static {}, Ll/vnb;->s1()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    iget-object v0, p0, Ll/p6b0;->j:Lv/VImage;

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/p6b0;->e0()I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Ll/p6b0;->l:Lv/VText;

    .line 49
    .line 50
    const/high16 v2, 0x43820000    # 260.0f

    .line 51
    .line 52
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    invoke-static {v0, v2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 57
    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_1
    iget-object v0, p0, Ll/p6b0;->l:Lv/VText;

    .line 61
    .line 62
    const/high16 v2, 0x43520000    # 210.0f

    .line 63
    .line 64
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    invoke-static {v0, v2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Ll/p6b0;->j:Lv/VImage;

    .line 72
    .line 73
    invoke-virtual {p0}, Ll/p6b0;->Z()I

    .line 74
    .line 75
    .line 76
    move-result v2

    .line 77
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 78
    .line 79
    .line 80
    :goto_1
    iget-object v0, p0, Ll/p6b0;->k:Lv/VImage;

    .line 81
    .line 82
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 87
    .line 88
    invoke-static {}, Ll/bnl0;->F0()I

    .line 89
    .line 90
    .line 91
    move-result v2

    .line 92
    sget v3, Ll/qa00;->g:I

    .line 93
    .line 94
    add-int/2addr v2, v3

    .line 95
    iput v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 96
    .line 97
    new-instance v0, Ll/m6b0;

    .line 98
    .line 99
    invoke-direct {v0, p0}, Ll/m6b0;-><init>(Ll/p6b0;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p0}, Ll/g1e;->x()V

    .line 106
    .line 107
    .line 108
    new-instance v0, Ll/n6b0;

    .line 109
    .line 110
    invoke-direct {v0, p0}, Ll/n6b0;-><init>(Ll/p6b0;)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {p0, v0}, Ll/g1e;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 114
    .line 115
    .line 116
    iget-object v0, p0, Ll/p6b0;->L:Ljava/text/DecimalFormat;

    .line 117
    .line 118
    sget-object v2, Ljava/math/RoundingMode;->HALF_UP:Ljava/math/RoundingMode;

    .line 119
    .line 120
    invoke-virtual {v0, v2}, Ljava/text/DecimalFormat;->setRoundingMode(Ljava/math/RoundingMode;)V

    .line 121
    .line 122
    .line 123
    iget-object v0, p0, Ll/p6b0;->t:Landroid/widget/RelativeLayout;

    .line 124
    .line 125
    new-instance v2, Ll/o6b0;

    .line 126
    .line 127
    invoke-direct {v2, p0}, Ll/o6b0;-><init>(Ll/p6b0;)V

    .line 128
    .line 129
    .line 130
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 131
    .line 132
    .line 133
    iget-object v0, p0, Ll/p6b0;->k:Lv/VImage;

    .line 134
    .line 135
    new-instance v2, Ll/x5b0;

    .line 136
    .line 137
    invoke-direct {v2, p0}, Ll/x5b0;-><init>(Ll/p6b0;)V

    .line 138
    .line 139
    .line 140
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 141
    .line 142
    .line 143
    iget-object v0, p0, Ll/p6b0;->y:Landroid/widget/LinearLayout;

    .line 144
    .line 145
    new-instance v2, Ll/y5b0;

    .line 146
    .line 147
    invoke-direct {v2, p0}, Ll/y5b0;-><init>(Ll/p6b0;)V

    .line 148
    .line 149
    .line 150
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 151
    .line 152
    .line 153
    iget-object v0, p0, Ll/p6b0;->m:Lv/VText;

    .line 154
    .line 155
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 156
    .line 157
    .line 158
    invoke-virtual {p0}, Ll/p6b0;->h0()V

    .line 159
    .line 160
    .line 161
    invoke-direct {p0}, Ll/p6b0;->N0()V

    .line 162
    .line 163
    .line 164
    invoke-direct {p0}, Ll/p6b0;->g0()V

    .line 165
    .line 166
    .line 167
    invoke-virtual {p0}, Ll/p6b0;->p0()V

    .line 168
    .line 169
    .line 170
    invoke-static {}, Ll/efh0;->j()Ll/efh0;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    iget-object v2, p0, Ll/p6b0;->J:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 175
    .line 176
    invoke-virtual {v0, v2}, Ll/efh0;->l(Lcom/p1/mobile/putong/core/data/Coupon;)Z

    .line 177
    .line 178
    .line 179
    move-result v0

    .line 180
    if-eqz v0, :cond_2

    .line 181
    .line 182
    invoke-virtual {p0}, Ll/p6b0;->o0()V

    .line 183
    .line 184
    .line 185
    return-void

    .line 186
    :cond_2
    iget-object v0, p0, Ll/p6b0;->I:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 187
    .line 188
    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    invoke-virtual {p0, v0, v1}, Ll/p6b0;->X0(Ljava/util/List;I)V

    .line 193
    .line 194
    .line 195
    return-void
.end method

.method private synthetic y0(Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    const/4 p1, 0x4

    .line 2
    if-ne p2, p1, :cond_0

    .line 3
    .line 4
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getRepeatCount()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-nez p1, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Ll/p6b0;->F:Ll/x20;

    .line 17
    .line 18
    invoke-interface {p0}, Ll/x20;->call()V

    .line 19
    .line 20
    .line 21
    :cond_0
    const/4 p0, 0x1

    .line 22
    return p0
.end method

.method private synthetic z0(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p6b0;->H:Ll/l4g0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final synthetic E0(Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    iget-object p0, p0, Ll/p6b0;->J:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 2
    .line 3
    iget-wide p0, p0, Lcom/p1/mobile/putong/core/data/Coupon;->endTime:D

    .line 4
    .line 5
    invoke-static {}, Ll/pzi0;->o()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    long-to-double v0, v0

    .line 10
    sub-double/2addr p0, v0

    .line 11
    const-wide/16 v0, 0x0

    .line 12
    .line 13
    cmpg-double p0, p0, v0

    .line 14
    .line 15
    if-gtz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public final synthetic F0(Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/p6b0;->N0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic G0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/p6b0;->r:Lv/VCheckBox;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, v1}, Ll/p6b0;->V0(Z)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/p6b0;->f0()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic H0()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/p6b0;->V0(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic I0(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p6b0;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic J0(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p6b0;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final L0()Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/p6b0;->J:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 2
    .line 3
    const-string v1, "lowPriceCallback3SVIP"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/data/Coupon;->isBelongPromotion(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Ll/p6b0;->J:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 12
    .line 13
    const-string v1, "lowPriceCustomerSVIP"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/data/Coupon;->isBelongPromotion(Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    iget-object v0, p0, Ll/p6b0;->J:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 22
    .line 23
    const-string v1, "lowPriceCallback3VIP"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/data/Coupon;->isBelongPromotion(Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    iget-object v0, p0, Ll/p6b0;->J:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 32
    .line 33
    const-string v1, "lowPriceCustomerVIP"

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/data/Coupon;->isBelongPromotion(Ljava/lang/String;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_1

    .line 40
    .line 41
    iget-object p0, p0, Ll/p6b0;->J:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 42
    .line 43
    const-string v0, "lowPriceCustomerUpliftSVIP"

    .line 44
    .line 45
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/Coupon;->isBelongPromotion(Ljava/lang/String;)Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    if-eqz p0, :cond_0

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    const/4 p0, 0x0

    .line 53
    return p0

    .line 54
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 55
    return p0
.end method

.method public final O0()V
    .locals 6

    .line 1
    invoke-static {}, Ll/efh0;->j()Ll/efh0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/p6b0;->J:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/efh0;->l(Lcom/p1/mobile/putong/core/data/Coupon;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const-string v1, "\u539f\u4ef7\u00a5%s\u5143"

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget-wide v2, p0, Ll/p6b0;->R:D

    .line 16
    .line 17
    const-wide/16 v4, 0x0

    .line 18
    .line 19
    cmpl-double v0, v2, v4

    .line 20
    .line 21
    if-lez v0, :cond_0

    .line 22
    .line 23
    iget-object v0, p0, Ll/p6b0;->L:Ljava/text/DecimalFormat;

    .line 24
    .line 25
    invoke-virtual {v0, v2, v3}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const-string v0, "-"

    .line 31
    .line 32
    :goto_0
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    goto :goto_1

    .line 41
    :cond_1
    iget-object v0, p0, Ll/p6b0;->L:Ljava/text/DecimalFormat;

    .line 42
    .line 43
    iget-wide v2, p0, Ll/p6b0;->P:D

    .line 44
    .line 45
    invoke-virtual {v0, v2, v3}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    :goto_1
    new-instance v1, Landroid/text/SpannableStringBuilder;

    .line 58
    .line 59
    invoke-direct {v1, v0}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 60
    .line 61
    .line 62
    new-instance v2, Landroid/text/style/StrikethroughSpan;

    .line 63
    .line 64
    invoke-direct {v2}, Landroid/text/style/StrikethroughSpan;-><init>()V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    const/16 v3, 0x21

    .line 72
    .line 73
    const/4 v4, 0x0

    .line 74
    invoke-virtual {v1, v2, v4, v0, v3}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 75
    .line 76
    .line 77
    iget-object p0, p0, Ll/p6b0;->x:Lv/VText;

    .line 78
    .line 79
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public Q0(Lcom/p1/mobile/putong/data/PayMethod;)V
    .locals 2

    .line 1
    iput-object p1, p0, Ll/p6b0;->K:Lcom/p1/mobile/putong/data/PayMethod;

    .line 2
    .line 3
    const-string v0, "alipay"

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    invoke-static {v0}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Ll/p6b0;->K:Lcom/p1/mobile/putong/data/PayMethod;

    .line 12
    .line 13
    :cond_0
    iget-object p1, p0, Ll/p6b0;->I:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 16
    .line 17
    const-string v1, "svip"

    .line 18
    .line 19
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    iget-object p1, p0, Ll/p6b0;->I:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 26
    .line 27
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Merchandise;->semiAnnual()Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_1

    .line 32
    .line 33
    invoke-static {v0}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    iput-object p1, p0, Ll/p6b0;->K:Lcom/p1/mobile/putong/data/PayMethod;

    .line 38
    .line 39
    :cond_1
    iget-object p1, p0, Ll/p6b0;->K:Lcom/p1/mobile/putong/data/PayMethod;

    .line 40
    .line 41
    invoke-direct {p0, p1}, Ll/p6b0;->K0(Lcom/p1/mobile/putong/data/PayMethod;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final V0(Z)V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/p6b0;->Q:Ll/lib0;

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
    iget-object v0, p0, Ll/p6b0;->I:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ll/p6b0;->a0(Lcom/p1/mobile/putong/core/data/ProductCategory;)Lcom/p1/mobile/putong/core/data/PurchaseType;

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
    if-eqz v0, :cond_1

    .line 22
    .line 23
    iget-object v1, p0, Ll/p6b0;->Q:Ll/lib0;

    .line 24
    .line 25
    iget-object v2, p0, Ll/p6b0;->I:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 26
    .line 27
    iget-object v3, p0, Ll/p6b0;->K:Lcom/p1/mobile/putong/data/PayMethod;

    .line 28
    .line 29
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->U()Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_0

    .line 42
    .line 43
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 44
    .line 45
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->O0:Lcom/p1/mobile/putong/core/api/CoreAutoPay;

    .line 46
    .line 47
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->n3()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_0

    .line 52
    .line 53
    iget-object v0, p0, Ll/p6b0;->K:Lcom/p1/mobile/putong/data/PayMethod;

    .line 54
    .line 55
    const-string v4, "alipay"

    .line 56
    .line 57
    invoke-static {v0, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_0

    .line 62
    .line 63
    const/4 v0, 0x1

    .line 64
    :goto_0
    move v5, v0

    .line 65
    goto :goto_1

    .line 66
    :cond_0
    const/4 v0, 0x0

    .line 67
    goto :goto_0

    .line 68
    :goto_1
    iget-object v0, p0, Ll/p6b0;->Q:Ll/lib0;

    .line 69
    .line 70
    invoke-virtual {v0}, Ll/lib0;->e()Lorg/json/JSONObject;

    .line 71
    .line 72
    .line 73
    move-result-object v6

    .line 74
    iget-object v0, p0, Ll/p6b0;->I:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 75
    .line 76
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 77
    .line 78
    invoke-virtual {p0, v0}, Ll/p6b0;->a0(Lcom/p1/mobile/putong/core/data/ProductCategory;)Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 79
    .line 80
    .line 81
    move-result-object v7

    .line 82
    const/4 v4, 0x1

    .line 83
    move v8, p1

    .line 84
    invoke-virtual/range {v1 .. v8}, Ll/lib0;->r(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/data/PayMethod;ZZLorg/json/JSONObject;Lcom/p1/mobile/putong/core/data/PurchaseType;Z)V

    .line 85
    .line 86
    .line 87
    :cond_1
    return-void
.end method

.method public final W0()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/p6b0;->Q:Ll/lib0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/p6b0;->I:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 4
    .line 5
    iget-object v2, p0, Ll/p6b0;->K:Lcom/p1/mobile/putong/data/PayMethod;

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 8
    .line 9
    .line 10
    move-result-object v3

    .line 11
    invoke-virtual {v3}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    invoke-interface {v3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->U()Z

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    const/4 v4, 0x1

    .line 20
    if-eqz v3, :cond_0

    .line 21
    .line 22
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 23
    .line 24
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->O0:Lcom/p1/mobile/putong/core/api/CoreAutoPay;

    .line 25
    .line 26
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->n3()Z

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    if-eqz v3, :cond_0

    .line 31
    .line 32
    iget-object v3, p0, Ll/p6b0;->K:Lcom/p1/mobile/putong/data/PayMethod;

    .line 33
    .line 34
    const-string v5, "alipay"

    .line 35
    .line 36
    invoke-static {v3, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    if-eqz v3, :cond_0

    .line 41
    .line 42
    move v3, v4

    .line 43
    goto :goto_0

    .line 44
    :cond_0
    const/4 v3, 0x0

    .line 45
    :goto_0
    invoke-virtual {v0, v1, v2, v4, v3}, Ll/lib0;->w(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/data/PayMethod;ZZ)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Ll/p6b0;->G:Ljava/lang/String;

    .line 49
    .line 50
    invoke-static {v0}, Ll/abb0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    const-string v1, "purchaseShowFrom"

    .line 55
    .line 56
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iget-object v1, p0, Ll/p6b0;->I:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 61
    .line 62
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 63
    .line 64
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    const-string v2, "productType"

    .line 69
    .line 70
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    new-instance v2, Ljava/lang/StringBuilder;

    .line 75
    .line 76
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 77
    .line 78
    .line 79
    iget-object v3, p0, Ll/p6b0;->I:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 80
    .line 81
    iget v3, v3, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 82
    .line 83
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    const-string v3, "m"

    .line 87
    .line 88
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    const-string v3, "default_duration"

    .line 96
    .line 97
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    iget-object p0, p0, Ll/p6b0;->J:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 102
    .line 103
    invoke-static {p0}, Ll/g2f;->d(Lcom/p1/mobile/putong/core/data/Coupon;)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    const-string v3, "promotion_type"

    .line 108
    .line 109
    invoke-static {v3, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    const-string v3, "page_style"

    .line 114
    .line 115
    const-string v4, "promotion"

    .line 116
    .line 117
    invoke-static {v3, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 118
    .line 119
    .line 120
    move-result-object v3

    .line 121
    filled-new-array {v0, v1, v2, p0, v3}, [Ll/pf60;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    const-string v0, "e_purchase_button"

    .line 126
    .line 127
    const-string v1, "p_purchase_page"

    .line 128
    .line 129
    invoke-static {v0, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 130
    .line 131
    .line 132
    return-void
.end method

.method public X(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/q6b0;->b(Ll/p6b0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final X0(Ljava/util/List;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;I)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/p6b0;->Q:Ll/lib0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/lib0;->D(Ljava/util/List;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final Y0(D)V
    .locals 3

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmpl-double v0, p1, v0

    .line 4
    .line 5
    if-lez v0, :cond_0

    .line 6
    .line 7
    invoke-static {p1, p2}, Ljava/lang/Math;->floor(D)D

    .line 8
    .line 9
    .line 10
    move-result-wide p1

    .line 11
    double-to-long p1, p1

    .line 12
    iget-object v0, p0, Ll/p6b0;->A:Lv/VText;

    .line 13
    .line 14
    iget-object v1, p0, Ll/p6b0;->E:Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->t1:I

    .line 17
    .line 18
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {v1, v2, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Ll/p6b0;->A:Lv/VText;

    .line 34
    .line 35
    const/4 p1, 0x1

    .line 36
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    iget-object p0, p0, Ll/p6b0;->A:Lv/VText;

    .line 41
    .line 42
    const/4 p1, 0x0

    .line 43
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final Z()I
    .locals 2

    .line 1
    iget-object v0, p0, Ll/p6b0;->J:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 2
    .line 3
    const-string v1, "lowPriceCallback3SVIP"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/data/Coupon;->isBelongPromotion(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_3

    .line 10
    .line 11
    iget-object v0, p0, Ll/p6b0;->J:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 12
    .line 13
    const-string v1, "lowPriceCustomerSVIP"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/data/Coupon;->isBelongPromotion(Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_3

    .line 20
    .line 21
    iget-object v0, p0, Ll/p6b0;->J:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 22
    .line 23
    const-string v1, "lowPriceCustomerUpliftSVIP"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/data/Coupon;->isBelongPromotion(Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_0
    iget-object v0, p0, Ll/p6b0;->J:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 33
    .line 34
    const-string v1, "lowPriceCallback3VIP"

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/data/Coupon;->isBelongPromotion(Ljava/lang/String;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-nez v0, :cond_2

    .line 41
    .line 42
    iget-object p0, p0, Ll/p6b0;->J:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 43
    .line 44
    const-string v0, "lowPriceCustomerVIP"

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/Coupon;->isBelongPromotion(Ljava/lang/String;)Z

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    if-eqz p0, :cond_1

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    sget p0, Ll/jbc0;->Z8:I

    .line 54
    .line 55
    return p0

    .line 56
    :cond_2
    :goto_0
    sget p0, Ll/jbc0;->Sa:I

    .line 57
    .line 58
    return p0

    .line 59
    :cond_3
    :goto_1
    sget p0, Ll/jbc0;->M8:I

    .line 60
    .line 61
    return p0
.end method

.method public a0(Lcom/p1/mobile/putong/core/data/ProductCategory;)Lcom/p1/mobile/putong/core/data/PurchaseType;
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    const-string p1, "tttVip"

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-nez p1, :cond_1

    .line 15
    .line 16
    const-string p1, "svip"

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-nez p0, :cond_0

    .line 23
    .line 24
    const/4 p0, 0x0

    .line 25
    return-object p0

    .line 26
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 30
    .line 31
    return-object p0
.end method

.method public b0()Ljava/lang/String;
    .locals 6

    .line 1
    iget-wide v0, p0, Ll/p6b0;->P:D

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmpg-double v4, v0, v2

    .line 6
    .line 7
    if-lez v4, :cond_2

    .line 8
    .line 9
    iget-wide v4, p0, Ll/p6b0;->O:D

    .line 10
    .line 11
    cmpg-double p0, v4, v2

    .line 12
    .line 13
    if-ltz p0, :cond_2

    .line 14
    .line 15
    cmpl-double p0, v4, v0

    .line 16
    .line 17
    if-lez p0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    div-double/2addr v4, v0

    .line 21
    const-wide/high16 v0, 0x4024000000000000L    # 10.0

    .line 22
    .line 23
    mul-double/2addr v4, v0

    .line 24
    double-to-int p0, v4

    .line 25
    int-to-double v0, p0

    .line 26
    cmpl-double v0, v4, v0

    .line 27
    .line 28
    if-nez v0, :cond_1

    .line 29
    .line 30
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0

    .line 35
    :cond_1
    new-instance p0, Ljava/text/DecimalFormat;

    .line 36
    .line 37
    const-string v0, "#.#"

    .line 38
    .line 39
    invoke-direct {p0, v0}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0, v4, v5}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0

    .line 47
    :cond_2
    :goto_0
    const-string p0, "-"

    .line 48
    .line 49
    return-object p0
.end method

.method public final c0()Lcom/p1/mobile/putong/core/ui/purchase/mediator/track/PurchaseTrackPageType;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/p6b0;->J:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 2
    .line 3
    const-string v1, "lowPriceCallback3SVIP"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/data/Coupon;->isBelongPromotion(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-object p0, p0, Ll/p6b0;->J:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 12
    .line 13
    const-string v0, "lowPriceCallback3VIP"

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/Coupon;->isBelongPromotion(Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/track/PurchaseTrackPageType;->page_discount_custom:Lcom/p1/mobile/putong/core/ui/purchase/mediator/track/PurchaseTrackPageType;

    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_1
    :goto_0
    sget-object p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/track/PurchaseTrackPageType;->page_discount_callback:Lcom/p1/mobile/putong/core/ui/purchase/mediator/track/PurchaseTrackPageType;

    .line 26
    .line 27
    return-object p0
.end method

.method public final d0()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p6b0;->I:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, "\u6708"

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Merchandise;->quantityName()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public dismiss()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    invoke-static {p0}, Ll/v5b0;->z(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final e0()I
    .locals 2

    .line 1
    iget-object v0, p0, Ll/p6b0;->J:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 2
    .line 3
    const-string v1, "lowPriceCallback3SVIP"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/data/Coupon;->isBelongPromotion(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_3

    .line 10
    .line 11
    iget-object v0, p0, Ll/p6b0;->J:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 12
    .line 13
    const-string v1, "lowPriceCustomerSVIP"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/data/Coupon;->isBelongPromotion(Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_3

    .line 20
    .line 21
    iget-object v0, p0, Ll/p6b0;->J:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 22
    .line 23
    const-string v1, "lowPriceCustomerUpliftSVIP"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/data/Coupon;->isBelongPromotion(Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_0
    iget-object v0, p0, Ll/p6b0;->J:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 33
    .line 34
    const-string v1, "lowPriceCallback3VIP"

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/data/Coupon;->isBelongPromotion(Ljava/lang/String;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-nez v0, :cond_2

    .line 41
    .line 42
    iget-object p0, p0, Ll/p6b0;->J:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 43
    .line 44
    const-string v0, "lowPriceCustomerVIP"

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/Coupon;->isBelongPromotion(Ljava/lang/String;)Z

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    if-eqz p0, :cond_1

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    sget p0, Ll/jbc0;->y8:I

    .line 54
    .line 55
    return p0

    .line 56
    :cond_2
    :goto_0
    sget p0, Ll/jbc0;->Ta:I

    .line 57
    .line 58
    return p0

    .line 59
    :cond_3
    :goto_1
    sget p0, Ll/jbc0;->N8:I

    .line 60
    .line 61
    return p0
.end method

.method public final f0()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/p6b0;->J:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 2
    .line 3
    iget-wide v0, v0, Lcom/p1/mobile/putong/core/data/Coupon;->endTime:D

    .line 4
    .line 5
    invoke-static {}, Ll/pzi0;->o()J

    .line 6
    .line 7
    .line 8
    move-result-wide v2

    .line 9
    long-to-double v2, v2

    .line 10
    sub-double/2addr v0, v2

    .line 11
    const-wide/16 v2, 0x0

    .line 12
    .line 13
    cmpg-double v0, v0, v2

    .line 14
    .line 15
    if-gtz v0, :cond_1

    .line 16
    .line 17
    const-string v0, "\u4f18\u60e0\u5238\u5df2\u5230\u671f"

    .line 18
    .line 19
    invoke-static {v0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/p6b0;->K:Lcom/p1/mobile/putong/data/PayMethod;

    .line 23
    .line 24
    const-string v1, "wechat"

    .line 25
    .line 26
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    const-string v1, "coupon expired"

    .line 31
    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    sget-object v0, Ll/lib0;->Companion:Ll/lib0$a;

    .line 35
    .line 36
    iget-object v2, p0, Ll/p6b0;->Q:Ll/lib0;

    .line 37
    .line 38
    invoke-virtual {v2}, Ll/lib0;->n()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    iget-object p0, p0, Ll/p6b0;->I:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 45
    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->id:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {v0, v2, p0, v1}, Ll/lib0$a;->g(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_0
    sget-object v0, Ll/lib0;->Companion:Ll/lib0$a;

    .line 53
    .line 54
    iget-object v2, p0, Ll/p6b0;->Q:Ll/lib0;

    .line 55
    .line 56
    invoke-virtual {v2}, Ll/lib0;->n()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    iget-object p0, p0, Ll/p6b0;->I:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 61
    .line 62
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 63
    .line 64
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->id:Ljava/lang/String;

    .line 65
    .line 66
    invoke-virtual {v0, v2, p0, v1}, Ll/lib0$a;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_1
    invoke-direct {p0}, Ll/p6b0;->M0()V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public final h0()V
    .locals 7

    .line 1
    invoke-virtual {p0}, Ll/p6b0;->O0()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/p6b0;->I:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 5
    .line 6
    invoke-static {v0}, Ll/z7a;->t0(Lcom/p1/mobile/putong/core/data/Merchandise;)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    new-instance v1, Ljava/text/DecimalFormat;

    .line 11
    .line 12
    const-string v2, "0.0"

    .line 13
    .line 14
    invoke-direct {v1, v2}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    new-instance v2, Ljava/math/BigDecimal;

    .line 18
    .line 19
    iget-wide v3, p0, Ll/p6b0;->O:D

    .line 20
    .line 21
    int-to-double v5, v0

    .line 22
    div-double/2addr v3, v5

    .line 23
    invoke-direct {v2, v3, v4}, Ljava/math/BigDecimal;-><init>(D)V

    .line 24
    .line 25
    .line 26
    const/4 v0, 0x1

    .line 27
    const/4 v3, 0x0

    .line 28
    invoke-virtual {v2, v0, v3}, Ljava/math/BigDecimal;->setScale(II)Ljava/math/BigDecimal;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Ljava/math/BigDecimal;->doubleValue()D

    .line 33
    .line 34
    .line 35
    move-result-wide v2

    .line 36
    invoke-virtual {v1, v2, v3}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget-object v1, p0, Ll/p6b0;->B:Lv/VText;

    .line 41
    .line 42
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 43
    .line 44
    sget v3, Lcom/p1/mobile/putong/core/pay/R$string;->w0:I

    .line 45
    .line 46
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v2, v3, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Ll/p6b0;->I:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 58
    .line 59
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Merchandise;->yearly()Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_0

    .line 64
    .line 65
    const-string v0, "alipay"

    .line 66
    .line 67
    invoke-static {v0}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-direct {p0, v0}, Ll/p6b0;->K0(Lcom/p1/mobile/putong/data/PayMethod;)V

    .line 72
    .line 73
    .line 74
    :cond_0
    return-void
.end method

.method public final i0()V
    .locals 3

    .line 1
    new-instance v0, Landroid/text/SpannableStringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "SVIP"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/p6b0;->d0()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v1, "\u5361"

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ll/p6b0;->b0()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 28
    .line 29
    .line 30
    const-string v1, "\u6298\u7279\u60e0"

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 33
    .line 34
    .line 35
    iget-object v1, p0, Ll/p6b0;->l:Lv/VText;

    .line 36
    .line 37
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 38
    .line 39
    .line 40
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 41
    .line 42
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 43
    .line 44
    const-string v1, "svip"

    .line 45
    .line 46
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v0, v1}, Ll/joa;->x4(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Lcom/p1/mobile/putong/core/data/UserPrivilege;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-static {v0}, Ll/nzi0;->b(Lcom/p1/mobile/putong/core/data/UserPrivilege;)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    iget-object v1, p0, Ll/p6b0;->m:Lv/VText;

    .line 59
    .line 60
    const-string v2, "SVIP\u5df2\u5931\u6548%s\u5929\uff0c\u7acb\u523b\u6062\u590d"

    .line 61
    .line 62
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-static {v2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 71
    .line 72
    .line 73
    iget-object p0, p0, Ll/p6b0;->m:Lv/VText;

    .line 74
    .line 75
    const/4 v0, 0x1

    .line 76
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public final j0()V
    .locals 4

    .line 1
    new-instance v0, Landroid/text/SpannableStringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "\u8001\u7528\u6237SVIP\u9996"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/p6b0;->d0()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ll/p6b0;->b0()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v1, "\u6298\u7279\u60e0"

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 28
    .line 29
    .line 30
    iget-object v1, p0, Ll/p6b0;->l:Lv/VText;

    .line 31
    .line 32
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 33
    .line 34
    .line 35
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 38
    .line 39
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-eqz v1, :cond_0

    .line 48
    .line 49
    iget-wide v0, v0, Lcom/p1/mobile/putong/data/User;->createdTime:D

    .line 50
    .line 51
    double-to-long v0, v0

    .line 52
    invoke-static {}, Ll/pzi0;->o()J

    .line 53
    .line 54
    .line 55
    move-result-wide v2

    .line 56
    invoke-static {v0, v1, v2, v3}, Ll/yab;->S(JJ)I

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    iget-object v1, p0, Ll/p6b0;->m:Lv/VText;

    .line 61
    .line 62
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    const-string v2, "\u611f\u8c22\u4f60\u5df2\u966a\u4f34\u63a2\u63a2%d\u5929"

    .line 71
    .line 72
    invoke-static {v2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 77
    .line 78
    .line 79
    iget-object p0, p0, Ll/p6b0;->m:Lv/VText;

    .line 80
    .line 81
    const/4 v0, 0x1

    .line 82
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 83
    .line 84
    .line 85
    :cond_0
    return-void
.end method

.method public final k0()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/p6b0;->n:Lv/VText;

    .line 2
    .line 3
    const-string v1, "\u67e5\u770b\u8c01\u559c\u6b22\u4e86\u6211"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/p6b0;->o:Lv/VText;

    .line 9
    .line 10
    const-string v1, "\u6bcf\u59293\u6b21\u95ea\u804a\u673a\u4f1a"

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 13
    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/data/PurchaseType;->getPrivilegeData(Lcom/p1/mobile/putong/data/Gender;)Ljava/util/ArrayList;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    iget-object p0, p0, Ll/p6b0;->p:Lv/VText;

    .line 27
    .line 28
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    const-string v2, "\u6bcf\u67083\u6b21\u4f18\u5148\u63a8\u8350\u7b49\u603b\u8ba1%s\u9879\u7279\u6743"

    .line 37
    .line 38
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    filled-new-array {v0}, [Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    const-string v2, "#ff7118"

    .line 55
    .line 56
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    sget-object v3, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    .line 61
    .line 62
    invoke-static {v1, v0, v2, v3}, Ll/q8g0;->f0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public final l0()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->h5()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/p6b0;->I:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 18
    .line 19
    const-string v1, "svip"

    .line 20
    .line 21
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 30
    .line 31
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->K5()Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {p0, v0}, Ll/g1e;->duringCreated(Lrx/c;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    new-instance v1, Ll/k6b0;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Ll/k6b0;-><init>(Ll/p6b0;)V

    .line 42
    .line 43
    .line 44
    new-instance v2, Ll/l6b0;

    .line 45
    .line 46
    invoke-direct {v2, p0}, Ll/l6b0;-><init>(Ll/p6b0;)V

    .line 47
    .line 48
    .line 49
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 54
    .line 55
    .line 56
    :cond_0
    return-void
.end method

.method public final m0()V
    .locals 7

    .line 1
    new-instance v0, Landroid/text/SpannableStringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "SVIP\u9996"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/p6b0;->d0()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v1, "\u9650\u65f6\u7acb\u7701"

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 21
    .line 22
    .line 23
    new-instance v1, Landroid/text/SpannableStringBuilder;

    .line 24
    .line 25
    iget-object v2, p0, Ll/p6b0;->N:Ljava/text/NumberFormat;

    .line 26
    .line 27
    iget-wide v3, p0, Ll/p6b0;->O:D

    .line 28
    .line 29
    iget-wide v5, p0, Ll/p6b0;->P:D

    .line 30
    .line 31
    div-double/2addr v3, v5

    .line 32
    const-wide/high16 v5, 0x4059000000000000L    # 100.0

    .line 33
    .line 34
    mul-double/2addr v3, v5

    .line 35
    sub-double/2addr v5, v3

    .line 36
    invoke-virtual {v2, v5, v6}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-direct {v1, v2}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 41
    .line 42
    .line 43
    new-instance v2, Landroid/text/style/ForegroundColorSpan;

    .line 44
    .line 45
    const-string v3, "#ff7118"

    .line 46
    .line 47
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    invoke-direct {v2, v3}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v1}, Landroid/text/SpannableStringBuilder;->length()I

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    const/16 v4, 0x21

    .line 59
    .line 60
    const/4 v5, 0x0

    .line 61
    invoke-virtual {v1, v2, v5, v3, v4}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 65
    .line 66
    .line 67
    const-string v1, "%"

    .line 68
    .line 69
    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 70
    .line 71
    .line 72
    const-string v1, "\uff0c\u914d\u5bf9\u6982\u7387\u7ffb\u500d"

    .line 73
    .line 74
    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 75
    .line 76
    .line 77
    iget-object p0, p0, Ll/p6b0;->l:Lv/VText;

    .line 78
    .line 79
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public final o0()V
    .locals 6

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Ll/p6b0;->m:Lv/VText;

    .line 13
    .line 14
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget-wide v2, v0, Lcom/p1/mobile/putong/data/User;->createdTime:D

    .line 19
    .line 20
    double-to-long v2, v2

    .line 21
    invoke-static {}, Ll/pzi0;->o()J

    .line 22
    .line 23
    .line 24
    move-result-wide v4

    .line 25
    invoke-static {v2, v3, v4, v5}, Ll/yab;->S(JJ)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iget-object v2, p0, Ll/p6b0;->m:Lv/VText;

    .line 30
    .line 31
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    const-string v3, "\u611f\u8c22\u4f60\u5df2\u966a\u4f34\u63a2\u63a2%d\u5929"

    .line 40
    .line 41
    invoke-static {v3, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 46
    .line 47
    .line 48
    invoke-static {}, Ll/s7a;->u()Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    iget-object p0, p0, Ll/p6b0;->m:Lv/VText;

    .line 53
    .line 54
    if-eqz v0, :cond_1

    .line 55
    .line 56
    invoke-static {p0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_1
    const/4 v0, 0x1

    .line 61
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/g1e;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x1

    .line 5
    .line 6
    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 7
    .line 8
    invoke-static {v0, v1, v2}, Lrx/c;->interval(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Lrx/c;->onBackpressureDrop()Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {}, Ll/psd0;->y()Lrx/c$d;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p0, v0}, Ll/g1e;->duringCreated(Lrx/c;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/h6b0;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/h6b0;-><init>(Ll/p6b0;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Lrx/c;->takeUntil(Ll/qcj;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    new-instance v1, Ll/i6b0;

    .line 38
    .line 39
    invoke-direct {v1, p0}, Ll/i6b0;-><init>(Ll/p6b0;)V

    .line 40
    .line 41
    .line 42
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Landroidx/appcompat/app/a;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/p6b0;->E:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-virtual {p0, p1, v0}, Ll/p6b0;->X(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iput-object p1, p0, Ll/p6b0;->D:Landroid/view/View;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ll/nu0;->setContentView(Landroid/view/View;)V

    .line 18
    .line 19
    .line 20
    invoke-direct {p0}, Ll/p6b0;->R0()V

    .line 21
    .line 22
    .line 23
    invoke-static {}, Ll/efh0;->j()Ll/efh0;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iget-object v0, p0, Ll/p6b0;->J:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Ll/efh0;->l(Lcom/p1/mobile/putong/core/data/Coupon;)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_0

    .line 34
    .line 35
    new-instance p1, Ll/beb0;

    .line 36
    .line 37
    iget-object v0, p0, Ll/p6b0;->I:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 38
    .line 39
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 40
    .line 41
    sget-object v1, Lcom/p1/mobile/putong/core/ui/purchase/mediator/track/PurchaseTrackPageType;->page_discount_12m:Lcom/p1/mobile/putong/core/ui/purchase/mediator/track/PurchaseTrackPageType;

    .line 42
    .line 43
    iget-object v2, p0, Ll/p6b0;->G:Ljava/lang/String;

    .line 44
    .line 45
    invoke-direct {p1, v0, v1, v2}, Ll/beb0;-><init>(Lcom/p1/mobile/putong/core/data/ProductCategory;Lcom/p1/mobile/putong/core/ui/purchase/mediator/track/PurchaseTrackPageType;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    iput-object p1, p0, Ll/p6b0;->Q:Ll/lib0;

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    new-instance p1, Ll/beb0;

    .line 52
    .line 53
    iget-object v0, p0, Ll/p6b0;->I:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 54
    .line 55
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 56
    .line 57
    invoke-virtual {p0}, Ll/p6b0;->c0()Lcom/p1/mobile/putong/core/ui/purchase/mediator/track/PurchaseTrackPageType;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    iget-object v2, p0, Ll/p6b0;->G:Ljava/lang/String;

    .line 62
    .line 63
    invoke-direct {p1, v0, v1, v2}, Ll/beb0;-><init>(Lcom/p1/mobile/putong/core/data/ProductCategory;Lcom/p1/mobile/putong/core/ui/purchase/mediator/track/PurchaseTrackPageType;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    iput-object p1, p0, Ll/p6b0;->Q:Ll/lib0;

    .line 67
    .line 68
    :goto_0
    iget-object p1, p0, Ll/p6b0;->Q:Ll/lib0;

    .line 69
    .line 70
    iget-object v0, p0, Ll/p6b0;->I:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 71
    .line 72
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 73
    .line 74
    invoke-virtual {p1, v0}, Ll/lib0;->v(Lcom/p1/mobile/putong/core/data/ProductCategory;)V

    .line 75
    .line 76
    .line 77
    invoke-direct {p0}, Ll/p6b0;->r0()V

    .line 78
    .line 79
    .line 80
    invoke-direct {p0}, Ll/p6b0;->n0()V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0}, Ll/p6b0;->l0()V

    .line 84
    .line 85
    .line 86
    const-string p1, "alipay"

    .line 87
    .line 88
    invoke-static {p1}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    invoke-virtual {p0, p1}, Ll/p6b0;->Q0(Lcom/p1/mobile/putong/data/PayMethod;)V

    .line 93
    .line 94
    .line 95
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 96
    .line 97
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->O0:Lcom/p1/mobile/putong/core/api/CoreAutoPay;

    .line 98
    .line 99
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->C3()Lrx/c;

    .line 100
    .line 101
    .line 102
    return-void
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/g1e;->onDismiss(Landroid/content/DialogInterface;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final p0()V
    .locals 2

    .line 1
    sget-object v0, Ll/p6b0$a;->a:[I

    .line 2
    .line 3
    iget-object v1, p0, Ll/p6b0;->I:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 6
    .line 7
    invoke-virtual {p0, v1}, Ll/p6b0;->a0(Lcom/p1/mobile/putong/core/data/ProductCategory;)Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    aget v0, v0, v1

    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    if-eq v0, v1, :cond_3

    .line 19
    .line 20
    const/4 v1, 0x2

    .line 21
    if-eq v0, v1, :cond_0

    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    invoke-static {}, Ll/s7a;->x()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    iget-object v0, p0, Ll/p6b0;->J:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 31
    .line 32
    const-string v1, "lowPriceCallback3VIP"

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/data/Coupon;->isBelongPromotion(Ljava/lang/String;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-nez v0, :cond_1

    .line 39
    .line 40
    iget-object v0, p0, Ll/p6b0;->J:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 41
    .line 42
    const-string v1, "lowPriceCustomerVIP"

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/data/Coupon;->isBelongPromotion(Ljava/lang/String;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_2

    .line 49
    .line 50
    :cond_1
    invoke-virtual {p0}, Ll/p6b0;->t0()V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0}, Ll/p6b0;->s0()V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_2
    invoke-virtual {p0}, Ll/p6b0;->u0()V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0}, Ll/p6b0;->s0()V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_3
    invoke-static {}, Ll/s7a;->x()Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-eqz v0, :cond_5

    .line 69
    .line 70
    iget-object v0, p0, Ll/p6b0;->J:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 71
    .line 72
    const-string v1, "lowPriceCallback3SVIP"

    .line 73
    .line 74
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/data/Coupon;->isBelongPromotion(Ljava/lang/String;)Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-eqz v0, :cond_4

    .line 79
    .line 80
    invoke-virtual {p0}, Ll/p6b0;->i0()V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0}, Ll/p6b0;->k0()V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :cond_4
    iget-object v0, p0, Ll/p6b0;->J:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 88
    .line 89
    const-string v1, "lowPriceCustomerSVIP"

    .line 90
    .line 91
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/data/Coupon;->isBelongPromotion(Ljava/lang/String;)Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-eqz v0, :cond_6

    .line 96
    .line 97
    invoke-virtual {p0}, Ll/p6b0;->j0()V

    .line 98
    .line 99
    .line 100
    invoke-virtual {p0}, Ll/p6b0;->k0()V

    .line 101
    .line 102
    .line 103
    return-void

    .line 104
    :cond_5
    invoke-static {}, Ll/s7a;->v()Z

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    if-eqz v0, :cond_6

    .line 109
    .line 110
    iget-object v0, p0, Ll/p6b0;->J:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 111
    .line 112
    const-string v1, "lowPriceCustomerUpliftSVIP"

    .line 113
    .line 114
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/data/Coupon;->isBelongPromotion(Ljava/lang/String;)Z

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    if-eqz v0, :cond_6

    .line 119
    .line 120
    invoke-virtual {p0}, Ll/p6b0;->q0()V

    .line 121
    .line 122
    .line 123
    invoke-virtual {p0}, Ll/p6b0;->k0()V

    .line 124
    .line 125
    .line 126
    return-void

    .line 127
    :cond_6
    invoke-virtual {p0}, Ll/p6b0;->m0()V

    .line 128
    .line 129
    .line 130
    invoke-virtual {p0}, Ll/p6b0;->k0()V

    .line 131
    .line 132
    .line 133
    return-void
.end method

.method public final q0()V
    .locals 6

    .line 1
    new-instance v0, Landroid/text/SpannableStringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/p6b0;->I:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 7
    .line 8
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Merchandise;->quantityName()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const-string v2, "SVIP%s\u5361\u9996"

    .line 17
    .line 18
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Ll/p6b0;->d0()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 30
    .line 31
    .line 32
    const-string v1, "\u7acb\u51cf"

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 35
    .line 36
    .line 37
    new-instance v1, Landroid/text/SpannableStringBuilder;

    .line 38
    .line 39
    iget-wide v2, p0, Ll/p6b0;->P:D

    .line 40
    .line 41
    iget-wide v4, p0, Ll/p6b0;->O:D

    .line 42
    .line 43
    sub-double/2addr v2, v4

    .line 44
    double-to-int v2, v2

    .line 45
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-direct {v1, v2}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 50
    .line 51
    .line 52
    new-instance v2, Landroid/text/style/ForegroundColorSpan;

    .line 53
    .line 54
    const-string v3, "#ff7118"

    .line 55
    .line 56
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    invoke-direct {v2, v3}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v1}, Landroid/text/SpannableStringBuilder;->length()I

    .line 64
    .line 65
    .line 66
    move-result v3

    .line 67
    const/16 v4, 0x21

    .line 68
    .line 69
    const/4 v5, 0x0

    .line 70
    invoke-virtual {v1, v2, v5, v3, v4}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 74
    .line 75
    .line 76
    const-string v1, "\u5143"

    .line 77
    .line 78
    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 79
    .line 80
    .line 81
    iget-object v1, p0, Ll/p6b0;->l:Lv/VText;

    .line 82
    .line 83
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Ll/p6b0;->m:Lv/VText;

    .line 87
    .line 88
    iget-object v1, p0, Ll/p6b0;->J:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 89
    .line 90
    iget-wide v2, v1, Lcom/p1/mobile/putong/core/data/Coupon;->endTime:D

    .line 91
    .line 92
    iget-wide v4, v1, Lcom/p1/mobile/putong/core/data/Coupon;->beginTime:D

    .line 93
    .line 94
    sub-double/2addr v2, v4

    .line 95
    const-wide v4, 0x4194997000000000L    # 8.64E7

    .line 96
    .line 97
    .line 98
    .line 99
    .line 100
    div-double/2addr v2, v4

    .line 101
    double-to-int v1, v2

    .line 102
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    const-string v2, "\u4ec5\u9650%s\u5929\uff0c\u8fc7\u671f\u6062\u590d\u539f\u4ef7"

    .line 111
    .line 112
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 117
    .line 118
    .line 119
    iget-object p0, p0, Ll/p6b0;->m:Lv/VText;

    .line 120
    .line 121
    const/4 v0, 0x1

    .line 122
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 123
    .line 124
    .line 125
    return-void
.end method

.method public final s0()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/p6b0;->n:Lv/VText;

    .line 2
    .line 3
    const-string v1, "\u65e0\u9650\u6b21\u53f3\u6ed1"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/p6b0;->o:Lv/VText;

    .line 9
    .line 10
    const-string v1, "\u6bcf\u59295\u4e2a\u8d85\u7ea7\u559c\u6b22"

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 13
    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/data/PurchaseType;->getPrivilegeData(Lcom/p1/mobile/putong/data/Gender;)Ljava/util/ArrayList;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object p0, p0, Ll/p6b0;->p:Lv/VText;

    .line 31
    .line 32
    const-string v1, "\u6ed1\u9519\u968f\u65f6\u53cd\u6094\u7b49\u603b\u8ba1%s\u9879\u7279\u6743"

    .line 33
    .line 34
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    filled-new-array {v0}, [Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    const-string v2, "#ff7118"

    .line 51
    .line 52
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    sget-object v3, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    .line 57
    .line 58
    invoke-static {v1, v0, v2, v3}, Ll/q8g0;->f0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public show()V
    .locals 7

    .line 1
    invoke-super {p0}, Ll/g1e;->show()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "p_purchase_page"

    .line 13
    .line 14
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p0, Ll/p6b0;->H:Ll/l4g0;

    .line 19
    .line 20
    iget-object v1, p0, Ll/p6b0;->G:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {v1}, Ll/abb0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    const-string v2, "purchaseShowFrom"

    .line 27
    .line 28
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    iget-object v2, p0, Ll/p6b0;->I:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 33
    .line 34
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 35
    .line 36
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    const-string v3, "productType"

    .line 41
    .line 42
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    new-instance v3, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 49
    .line 50
    .line 51
    iget-object v4, p0, Ll/p6b0;->I:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 52
    .line 53
    iget v4, v4, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 54
    .line 55
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    const-string v4, "m"

    .line 59
    .line 60
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v3

    .line 67
    const-string v4, "default_duration"

    .line 68
    .line 69
    invoke-static {v4, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    iget-object v4, p0, Ll/p6b0;->J:Lcom/p1/mobile/putong/core/data/Coupon;

    .line 74
    .line 75
    invoke-static {v4}, Ll/g2f;->d(Lcom/p1/mobile/putong/core/data/Coupon;)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v4

    .line 79
    const-string v5, "promotion_type"

    .line 80
    .line 81
    invoke-static {v5, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 82
    .line 83
    .line 84
    move-result-object v4

    .line 85
    const-string v5, "page_style"

    .line 86
    .line 87
    const-string v6, "promotion"

    .line 88
    .line 89
    invoke-static {v5, v6}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 90
    .line 91
    .line 92
    move-result-object v5

    .line 93
    filled-new-array {v1, v2, v3, v4, v5}, [Ll/pf60;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    invoke-virtual {v0, v1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 98
    .line 99
    .line 100
    iget-object p0, p0, Ll/p6b0;->H:Ll/l4g0;

    .line 101
    .line 102
    invoke-static {p0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 103
    .line 104
    .line 105
    const/4 p0, 0x1

    .line 106
    invoke-static {p0}, Ll/v5b0;->z(Z)V

    .line 107
    .line 108
    .line 109
    return-void
.end method

.method public final t0()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/p6b0;->b0()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/p6b0;->l:Lv/VText;

    .line 6
    .line 7
    const-string v2, "VIP\u60ca\u559c%s\u6298\u9650\u65f6\u79d2\u6740"

    .line 8
    .line 9
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/p6b0;->m:Lv/VText;

    .line 21
    .line 22
    const-string v1, "\u8001\u7528\u6237\u4e13\u4eab\u798f\u5229"

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Ll/p6b0;->m:Lv/VText;

    .line 28
    .line 29
    const/4 v0, 0x1

    .line 30
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final u0()V
    .locals 7

    .line 1
    new-instance v0, Landroid/text/SpannableStringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "VIP\u9996"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/p6b0;->d0()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v1, "\u9650\u65f6\u7acb\u7701"

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 21
    .line 22
    .line 23
    new-instance v1, Landroid/text/SpannableStringBuilder;

    .line 24
    .line 25
    iget-object v2, p0, Ll/p6b0;->N:Ljava/text/NumberFormat;

    .line 26
    .line 27
    iget-wide v3, p0, Ll/p6b0;->O:D

    .line 28
    .line 29
    iget-wide v5, p0, Ll/p6b0;->P:D

    .line 30
    .line 31
    div-double/2addr v3, v5

    .line 32
    const-wide/high16 v5, 0x4059000000000000L    # 100.0

    .line 33
    .line 34
    mul-double/2addr v3, v5

    .line 35
    sub-double/2addr v5, v3

    .line 36
    invoke-virtual {v2, v5, v6}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-direct {v1, v2}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 41
    .line 42
    .line 43
    new-instance v2, Landroid/text/style/ForegroundColorSpan;

    .line 44
    .line 45
    const-string v3, "#ff7118"

    .line 46
    .line 47
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    invoke-direct {v2, v3}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v1}, Landroid/text/SpannableStringBuilder;->length()I

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    const/16 v4, 0x21

    .line 59
    .line 60
    const/4 v5, 0x0

    .line 61
    invoke-virtual {v1, v2, v5, v3, v4}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 65
    .line 66
    .line 67
    const-string v1, "%"

    .line 68
    .line 69
    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 70
    .line 71
    .line 72
    const-string v1, "\uff0c\u914d\u5bf9\u6982\u7387\u7ffb\u500d"

    .line 73
    .line 74
    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 75
    .line 76
    .line 77
    iget-object p0, p0, Ll/p6b0;->l:Lv/VText;

    .line 78
    .line 79
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public final synthetic v0(Lcom/google/common/base/Optional;)V
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
    invoke-virtual {p0, v0, v1}, Ll/p6b0;->Y0(D)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public final synthetic w0(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    invoke-virtual {p0, v0, v1}, Ll/p6b0;->Y0(D)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic x0(Ljava/util/List;)V
    .locals 5

    .line 1
    new-instance v0, Ll/e6b0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/e6b0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 11
    .line 12
    new-instance v1, Ll/f6b0;

    .line 13
    .line 14
    invoke-direct {v1, v0}, Ll/f6b0;-><init>(Lcom/p1/mobile/putong/core/data/Merchandise;)V

    .line 15
    .line 16
    .line 17
    invoke-static {p1, v1}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    invoke-virtual {p0, p1, v1}, Ll/p6b0;->X0(Ljava/util/List;I)V

    .line 22
    .line 23
    .line 24
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-eqz p1, :cond_3

    .line 29
    .line 30
    iget-object p1, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 31
    .line 32
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 33
    .line 34
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Prices;->price:D

    .line 35
    .line 36
    const-wide/high16 v3, 0x4028000000000000L    # 12.0

    .line 37
    .line 38
    mul-double/2addr v1, v3

    .line 39
    iput-wide v1, p0, Ll/p6b0;->R:D

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/p6b0;->O0()V

    .line 42
    .line 43
    .line 44
    invoke-static {}, Ll/efh0;->j()Ll/efh0;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    iget-object v1, p0, Ll/p6b0;->I:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 49
    .line 50
    invoke-virtual {p1, v1, v0}, Ll/efh0;->i(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/Merchandise;)I

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    if-lez p1, :cond_0

    .line 55
    .line 56
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    goto :goto_0

    .line 61
    :cond_0
    const-string p1, "-"

    .line 62
    .line 63
    :goto_0
    invoke-static {}, Ll/s7a;->u()Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-eqz v0, :cond_2

    .line 68
    .line 69
    iget-object v0, p0, Ll/p6b0;->k:Lv/VImage;

    .line 70
    .line 71
    sget v1, Ll/jbc0;->c9:I

    .line 72
    .line 73
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 74
    .line 75
    .line 76
    invoke-static {}, Ll/vnb;->s1()Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    iget-object v1, p0, Ll/p6b0;->j:Lv/VImage;

    .line 81
    .line 82
    if-eqz v0, :cond_1

    .line 83
    .line 84
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 85
    .line 86
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    sget v2, Ll/jbc0;->b9:I

    .line 91
    .line 92
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-virtual {v1, v0}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 97
    .line 98
    .line 99
    goto :goto_1

    .line 100
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 101
    .line 102
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    sget v2, Ll/jbc0;->a9:I

    .line 107
    .line 108
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    invoke-virtual {v1, v0}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 113
    .line 114
    .line 115
    :goto_1
    iget-object p0, p0, Ll/p6b0;->l:Lv/VText;

    .line 116
    .line 117
    const-string v0, "618\u5927\u4fc3\uff0cSVIP\u5e74\u5361%s\u6298\u7279\u60e0"

    .line 118
    .line 119
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 128
    .line 129
    .line 130
    return-void

    .line 131
    :cond_2
    iget-object p0, p0, Ll/p6b0;->l:Lv/VText;

    .line 132
    .line 133
    const-string v0, "SVIP\u5e74\u5361\u8001\u7528\u6237%s\u6298\u7279\u60e0"

    .line 134
    .line 135
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 144
    .line 145
    .line 146
    :cond_3
    return-void
.end method
