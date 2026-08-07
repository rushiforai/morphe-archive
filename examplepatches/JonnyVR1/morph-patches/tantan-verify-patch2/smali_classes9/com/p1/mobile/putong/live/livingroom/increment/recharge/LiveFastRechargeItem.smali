.class public Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lv/VImage;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Lv/VText;

.field public j:Landroidx/constraintlayout/widget/Group;

.field public k:Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;Ll/z20;Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;->k0(Ll/z20;Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;Landroid/view/View;)V

    return-void
.end method

.method private j0(Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;)Z
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;->isCustomRecharge:Z

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    iget-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;->isCustomRechargeInput:Z

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method private synthetic k0(Ll/z20;Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p1, p2, p0}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getCurrentRechargeModule()Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;->k:Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTTPrice()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;->k:Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;->quantity:I

    .line 8
    .line 9
    return p0
.end method

.method public final i0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/kes;->a(Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public l0(ZLandroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    invoke-virtual {p0, p3}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public m0(Z)V
    .locals 7

    .line 1
    sget v0, Ll/obc0;->m7:I

    .line 2
    .line 3
    invoke-static {v0}, Ll/n3d0;->b(I)Landroid/graphics/drawable/Drawable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget v1, Ll/obc0;->n7:I

    .line 8
    .line 9
    invoke-static {v1}, Ll/n3d0;->b(I)Landroid/graphics/drawable/Drawable;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {p0, p1, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;->l0(ZLandroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 14
    .line 15
    .line 16
    sget v0, Ll/n9c0;->s0:I

    .line 17
    .line 18
    invoke-static {v0}, Ll/n3d0;->a(I)I

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    sget v0, Ll/n9c0;->U0:I

    .line 23
    .line 24
    invoke-static {v0}, Ll/n3d0;->a(I)I

    .line 25
    .line 26
    .line 27
    move-result v4

    .line 28
    sget v0, Ll/n9c0;->s0:I

    .line 29
    .line 30
    invoke-static {v0}, Ll/n3d0;->a(I)I

    .line 31
    .line 32
    .line 33
    move-result v5

    .line 34
    sget v0, Ll/n9c0;->Y0:I

    .line 35
    .line 36
    invoke-static {v0}, Ll/n3d0;->a(I)I

    .line 37
    .line 38
    .line 39
    move-result v6

    .line 40
    move-object v1, p0

    .line 41
    move v2, p1

    .line 42
    invoke-virtual/range {v1 .. v6}, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;->n0(ZIIII)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public n0(ZIIII)V
    .locals 0
    .param p2    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param
    .param p3    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param
    .param p4    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param
    .param p5    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;->setTitleTextColor(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p4}, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;->setSubTitleTextColor(I)V

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;->setTitleTextColor(I)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p5}, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;->setSubTitleTextColor(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public o0(Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;Ll/z20;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;",
            "Ll/z20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;",
            "Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;->k:Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;

    .line 2
    .line 3
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;->quantity:I

    .line 4
    .line 5
    if-lez v0, :cond_0

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;->f:Lv/VText;

    .line 8
    .line 9
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/live/base/data/BLiveStockKeepUnit;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStockKeepUnit;->prices:Lcom/p1/mobile/putong/live/base/data/BLivePrices;

    .line 19
    .line 20
    iget-wide v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePrices;->price:D

    .line 21
    .line 22
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;->g:Lv/VText;

    .line 23
    .line 24
    invoke-static {}, Ll/u8n;->a()Z

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    if-eqz v3, :cond_1

    .line 29
    .line 30
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->Ak:I

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->ne:I

    .line 34
    .line 35
    :goto_0
    invoke-static {v3}, Ll/xau;->t(I)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 40
    .line 41
    .line 42
    const-wide/16 v2, 0x0

    .line 43
    .line 44
    cmpl-double v2, v0, v2

    .line 45
    .line 46
    if-lez v2, :cond_4

    .line 47
    .line 48
    sget-object v2, Ll/zrv;->e:Landroid/app/Application;

    .line 49
    .line 50
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->a2:I

    .line 51
    .line 52
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    sget-object v3, Ll/zrv;->a:Ll/wrv;

    .line 57
    .line 58
    invoke-virtual {v3}, Ll/wrv;->H()Z

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    if-eqz v3, :cond_2

    .line 63
    .line 64
    new-instance v2, Ljava/lang/StringBuilder;

    .line 65
    .line 66
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 67
    .line 68
    .line 69
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/live/base/data/BLiveStockKeepUnit;

    .line 70
    .line 71
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveStockKeepUnit;->prices:Lcom/p1/mobile/putong/live/base/data/BLivePrices;

    .line 72
    .line 73
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLivePrices;->currencySymbol:Ljava/lang/String;

    .line 74
    .line 75
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    const-string v3, " %s"

    .line 79
    .line 80
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    :cond_2
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;->h:Lv/VText;

    .line 88
    .line 89
    sget-object v4, Ll/zrv;->a:Ll/wrv;

    .line 90
    .line 91
    invoke-virtual {v4}, Ll/wrv;->H()Z

    .line 92
    .line 93
    .line 94
    move-result v4

    .line 95
    if-eqz v4, :cond_3

    .line 96
    .line 97
    invoke-static {v0, v1}, Ll/a9g0;->e(D)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    goto :goto_1

    .line 102
    :cond_3
    invoke-static {v0, v1}, Ll/a9g0;->d(D)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    :goto_1
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-static {v2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 115
    .line 116
    .line 117
    :cond_4
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;->j0(Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;)Z

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;->i:Lv/VText;

    .line 122
    .line 123
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 124
    .line 125
    .line 126
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;->j:Landroidx/constraintlayout/widget/Group;

    .line 127
    .line 128
    xor-int/lit8 v0, v0, 0x1

    .line 129
    .line 130
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 131
    .line 132
    .line 133
    new-instance v0, Ll/jes;

    .line 134
    .line 135
    invoke-direct {v0, p0, p2, p1}, Ll/jes;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;Ll/z20;Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;)V

    .line 136
    .line 137
    .line 138
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 139
    .line 140
    .line 141
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;->i0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public p0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;->d:Lv/VImage;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public q0(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;->e:Lv/VText;

    .line 2
    .line 3
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    xor-int/lit8 v1, v1, 0x1

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;->e:Lv/VText;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public setSubTitleTextColor(I)V
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;->h:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setTitleTextColor(I)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;->f:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;->g:Lv/VText;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveFastRechargeItem;->i:Lv/VText;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
