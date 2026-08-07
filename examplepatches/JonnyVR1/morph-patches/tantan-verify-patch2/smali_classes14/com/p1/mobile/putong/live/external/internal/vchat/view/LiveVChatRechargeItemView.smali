.class public Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Landroidx/constraintlayout/widget/Group;

.field public i:Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;


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

.method public static synthetic h0(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;Ll/z20;Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;->k0(Ll/z20;Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public getCurrentRechargeModule()Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;->i:Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTTPrice()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;->i:Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;

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
    invoke-static {p0, p1}, Ll/msu;->a(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final j0(Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;)Z
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

.method public final synthetic k0(Ll/z20;Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p1, p2, p0}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

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
    invoke-virtual {p0, p1, v0, v1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;->l0(ZLandroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

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
    invoke-virtual/range {v1 .. v6}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;->n0(ZIIII)V

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
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;->setTitleTextColor(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p4}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;->setSubTitleTextColor(I)V

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;->setTitleTextColor(I)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p5}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;->setSubTitleTextColor(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public o0(Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;Ll/z20;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;",
            "Ll/z20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;",
            "Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;->i:Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;

    .line 2
    .line 3
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;->quantity:I

    .line 4
    .line 5
    if-lez v0, :cond_0

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;->d:Lv/VText;

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
    const-wide/16 v2, 0x0

    .line 23
    .line 24
    cmpl-double v2, v0, v2

    .line 25
    .line 26
    if-lez v2, :cond_1

    .line 27
    .line 28
    sget-object v2, Ll/zrv;->e:Landroid/app/Application;

    .line 29
    .line 30
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->a2:I

    .line 31
    .line 32
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    iget-object v3, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;->f:Lv/VText;

    .line 37
    .line 38
    invoke-static {v0, v1}, Ll/a9g0;->d(D)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-static {v2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 51
    .line 52
    .line 53
    :cond_1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;->j0(Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;->g:Lv/VText;

    .line 58
    .line 59
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 60
    .line 61
    .line 62
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;->h:Landroidx/constraintlayout/widget/Group;

    .line 63
    .line 64
    xor-int/lit8 v0, v0, 0x1

    .line 65
    .line 66
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 67
    .line 68
    .line 69
    new-instance v0, Ll/lsu;

    .line 70
    .line 71
    invoke-direct {v0, p0, p2, p1}, Ll/lsu;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;Ll/z20;Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;->i0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setSubTitleTextColor(I)V
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;->f:Lv/VText;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;->d:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;->e:Lv/VText;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatRechargeItemView;->g:Lv/VText;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
