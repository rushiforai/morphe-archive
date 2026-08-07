.class public Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinPayCoolsView;
.super Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundRelativeLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinPayCoolsView$a;
    }
.end annotation


# instance fields
.field public b:Lv/AutoVDraweeView;

.field public c:Landroid/widget/TextView;

.field public d:Lv/VText;

.field public e:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundRelativeLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundRelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundRelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/android/app/Act;Ljava/util/List;Ljava/util/ArrayList;Lcom/p1/mobile/putong/core/data/H5PaymentChannels;Landroid/view/View;)V
    .locals 0

    .line 1
    new-instance p4, Ll/mk60;

    .line 2
    .line 3
    invoke-direct {p4, p0}, Ll/mk60;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p4, p1, p2, p3}, Ll/mk60;->v(Ljava/util/List;Ljava/util/ArrayList;Lcom/p1/mobile/putong/core/data/H5PaymentChannels;)V

    .line 7
    .line 8
    .line 9
    new-instance p0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    const/4 p2, 0x0

    .line 15
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    check-cast p1, Lcom/p1/mobile/putong/core/data/H5Merchandise;

    .line 20
    .line 21
    iget p1, p1, Lcom/p1/mobile/putong/core/data/H5Merchandise;->quantity:I

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string p1, ""

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const-string p1, "intl_sub_duration"

    .line 36
    .line 37
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    filled-new-array {p0}, [Ll/pf60;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    const-string p1, "e_intl_premium_sku"

    .line 46
    .line 47
    const-string p2, "p_wallet"

    .line 48
    .line 49
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinPayCoolsView;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinPayCoolsView;->d:Lv/VText;

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinPayCoolsView;Lv/AutoVDraweeView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinPayCoolsView;->b:Lv/AutoVDraweeView;

    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinPayCoolsView;Landroid/widget/TextView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinPayCoolsView;->e:Landroid/widget/TextView;

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinPayCoolsView;Landroid/widget/TextView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinPayCoolsView;->c:Landroid/widget/TextView;

    return-void
.end method


# virtual methods
.method public final f(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinPayCoolsView$a;->a(Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinPayCoolsView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public g(Lcom/p1/mobile/android/app/Act;Ljava/util/List;Ljava/util/ArrayList;Lcom/p1/mobile/putong/core/data/H5PaymentChannels;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/H5Merchandise;",
            ">;",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/data/H5PayOrderData;",
            ">;",
            "Lcom/p1/mobile/putong/core/data/H5PaymentChannels;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinPayCoolsView;->f(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 7
    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    check-cast v2, Lcom/p1/mobile/putong/core/data/H5Merchandise;

    .line 15
    .line 16
    iget v2, v2, Lcom/p1/mobile/putong/core/data/H5Merchandise;->quantity:I

    .line 17
    .line 18
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v2, ""

    .line 22
    .line 23
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const-string v3, "intl_sub_duration"

    .line 31
    .line 32
    invoke-static {v3, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    filled-new-array {v0}, [Ll/pf60;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    const-string v3, "e_intl_premium_sku"

    .line 41
    .line 42
    const-string v4, "p_wallet"

    .line 43
    .line 44
    invoke-static {v3, v4, v0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinPayCoolsView;->c:Landroid/widget/TextView;

    .line 48
    .line 49
    sget v3, Lcom/p1/mobile/putong/core/pay/R$string;->y6:I

    .line 50
    .line 51
    new-instance v4, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 54
    .line 55
    .line 56
    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v5

    .line 60
    check-cast v5, Lcom/p1/mobile/putong/core/data/H5Merchandise;

    .line 61
    .line 62
    iget v5, v5, Lcom/p1/mobile/putong/core/data/H5Merchandise;->quantity:I

    .line 63
    .line 64
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    invoke-virtual {p1, v3, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinPayCoolsView;->b:Lv/AutoVDraweeView;

    .line 86
    .line 87
    const-string v2, "https://auto.tancdn.com/v1/images/eyJpZCI6IklCNUtKQk5YVENYRkJJVkpJRDZSVFNMRDdTUVg0QzEzIiwidyI6MjQzLCJoIjoxOTgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozMzk0OTI0OTAyMzQwMTc0NzU4fQ.png"

    .line 88
    .line 89
    const/4 v3, 0x1

    .line 90
    invoke-virtual {v0, v2, v3}, Lv/AutoVDraweeView;->x(Ljava/lang/String;I)V

    .line 91
    .line 92
    .line 93
    new-instance v0, Ll/i6i0;

    .line 94
    .line 95
    invoke-direct {v0, p1, p2, p3, p4}, Ll/i6i0;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/util/List;Ljava/util/ArrayList;Lcom/p1/mobile/putong/core/data/H5PaymentChannels;)V

    .line 96
    .line 97
    .line 98
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {p0, p1, p3}, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinPayCoolsView;->h(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;)Z

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    if-nez p1, :cond_0

    .line 106
    .line 107
    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    check-cast p1, Lcom/p1/mobile/putong/core/data/H5Merchandise;

    .line 112
    .line 113
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/H5Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/H5StockKeepUnit;

    .line 114
    .line 115
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    move-result p2

    .line 119
    if-eqz p2, :cond_0

    .line 120
    .line 121
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/H5StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 122
    .line 123
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    move-result p2

    .line 127
    if-eqz p2, :cond_0

    .line 128
    .line 129
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinPayCoolsView;->e:Landroid/widget/TextView;

    .line 130
    .line 131
    new-instance p2, Ljava/lang/StringBuilder;

    .line 132
    .line 133
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 134
    .line 135
    .line 136
    iget-wide p3, p1, Lcom/p1/mobile/putong/core/data/Prices;->price:D

    .line 137
    .line 138
    double-to-int p3, p3

    .line 139
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    const-string p3, " "

    .line 143
    .line 144
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Prices;->currencyCode:Ljava/lang/String;

    .line 148
    .line 149
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 157
    .line 158
    .line 159
    :cond_0
    return-void
.end method

.method public h(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/data/H5PayOrderData;",
            ">;)Z"
        }
    .end annotation

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
    invoke-virtual {p2}, Ljava/util/ArrayList;->isEmpty()Z

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    if-nez p2, :cond_0

    .line 12
    .line 13
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinPayCoolsView;->e:Landroid/widget/TextView;

    .line 14
    .line 15
    const-string v0, "Pending"

    .line 16
    .line 17
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 18
    .line 19
    .line 20
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinPayCoolsView;->e:Landroid/widget/TextView;

    .line 21
    .line 22
    sget v0, Ll/jbc0;->U0:I

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    const/4 v0, 0x0

    .line 29
    invoke-virtual {p2, p1, v0, v0, v0}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/wallet/TanTanCoinPayCoolsView;->e:Landroid/widget/TextView;

    .line 33
    .line 34
    const/high16 p1, 0x40800000    # 4.0f

    .line 35
    .line 36
    invoke-static {p1}, Ll/bnl0;->w(F)I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 41
    .line 42
    .line 43
    const/4 p0, 0x1

    .line 44
    return p0

    .line 45
    :cond_0
    const/4 p0, 0x0

    .line 46
    return p0
.end method
