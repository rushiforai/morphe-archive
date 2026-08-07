.class public Lcom/p1/mobile/putong/live/livingroom/increment/recharge/FirstRechargePaySuccessDialog;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lv/VDraweeView;

.field public e:Lv/VImage;

.field public f:Lv/VText;

.field public g:Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalFirstRechargeGiftItemView;

.field public h:Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalFirstRechargeGiftItemView;

.field public i:Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalFirstRechargeGiftItemView;


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

.method public static synthetic h0(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final i0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/xqi;->a(Lcom/p1/mobile/putong/live/livingroom/increment/recharge/FirstRechargePaySuccessDialog;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public j0(Ll/i6t;Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;Ll/x20;Ll/x20;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/FirstRechargePaySuccessDialog;->d:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 10
    .line 11
    int-to-float v1, v1

    .line 12
    const/high16 v2, 0x44160000    # 600.0f

    .line 13
    .line 14
    mul-float/2addr v1, v2

    .line 15
    const v2, 0x44688000    # 930.0f

    .line 16
    .line 17
    .line 18
    div-float/2addr v1, v2

    .line 19
    float-to-int v1, v1

    .line 20
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/FirstRechargePaySuccessDialog;->d:Lv/VDraweeView;

    .line 23
    .line 24
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/FirstRechargePaySuccessDialog;->d:Lv/VDraweeView;

    .line 28
    .line 29
    sget-object v1, Ll/zft;->u:Ljava/lang/String;

    .line 30
    .line 31
    const-string v2, "context_livingAct"

    .line 32
    .line 33
    invoke-static {v2, v0, v1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->bonus:Ljava/util/List;

    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/FirstRechargePaySuccessDialog;->e:Lv/VImage;

    .line 39
    .line 40
    new-instance v1, Ll/wqi;

    .line 41
    .line 42
    invoke-direct {v1, p3}, Ll/wqi;-><init>(Ll/x20;)V

    .line 43
    .line 44
    .line 45
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 46
    .line 47
    .line 48
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 49
    .line 50
    .line 51
    move-result p3

    .line 52
    if-nez p3, :cond_1

    .line 53
    .line 54
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 55
    .line 56
    .line 57
    move-result p3

    .line 58
    const/4 v0, 0x3

    .line 59
    if-lt p3, v0, :cond_1

    .line 60
    .line 61
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/FirstRechargePaySuccessDialog;->g:Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalFirstRechargeGiftItemView;

    .line 62
    .line 63
    const/4 v0, 0x0

    .line 64
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveBonus;

    .line 69
    .line 70
    const/4 v1, 0x1

    .line 71
    invoke-virtual {p3, p1, v0, v1, p4}, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalFirstRechargeGiftItemView;->l0(Ll/i6t;Lcom/p1/mobile/putong/live/base/data/BLiveBonus;ZLl/x20;)V

    .line 72
    .line 73
    .line 74
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/FirstRechargePaySuccessDialog;->h:Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalFirstRechargeGiftItemView;

    .line 75
    .line 76
    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveBonus;

    .line 81
    .line 82
    invoke-virtual {p3, p1, v0, v1, p4}, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalFirstRechargeGiftItemView;->l0(Ll/i6t;Lcom/p1/mobile/putong/live/base/data/BLiveBonus;ZLl/x20;)V

    .line 83
    .line 84
    .line 85
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/FirstRechargePaySuccessDialog;->i:Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalFirstRechargeGiftItemView;

    .line 86
    .line 87
    const/4 p3, 0x2

    .line 88
    invoke-interface {p2, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object p2

    .line 92
    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLiveBonus;

    .line 93
    .line 94
    invoke-virtual {p0, p1, p2, v1, p4}, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalFirstRechargeGiftItemView;->l0(Ll/i6t;Lcom/p1/mobile/putong/live/base/data/BLiveBonus;ZLl/x20;)V

    .line 95
    .line 96
    .line 97
    :cond_1
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/FirstRechargePaySuccessDialog;->i0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
