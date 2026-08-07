.class public Lcom/p1/mobile/putong/live/livingroom/increment/recharge/NewFirstRechargePaySuccessDialog;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Landroid/view/View;

.field public e:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public f:Lv/VText;

.field public g:Lv/VLinear;

.field public h:Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalNewFirstRechargeGiftItemView;

.field public i:Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalNewFirstRechargeGiftItemView;

.field public j:Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalNewFirstRechargeGiftItemView;

.field public k:Lv/VLinear;

.field public l:Lv/VText;

.field public m:Lv/VDraweeView;

.field public n:Lv/VLinear;

.field public o:Lv/VText;

.field public p:Lv/VText;


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
    invoke-static {p0, p1}, Ll/oz20;->a(Lcom/p1/mobile/putong/live/livingroom/increment/recharge/NewFirstRechargePaySuccessDialog;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public j0(Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;ZLl/x20;)V
    .locals 4

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;->bonus:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    const/4 v2, 0x1

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/NewFirstRechargePaySuccessDialog;->h:Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalNewFirstRechargeGiftItemView;

    .line 12
    .line 13
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    check-cast v3, Lcom/p1/mobile/putong/live/base/data/BLiveBonus;

    .line 18
    .line 19
    invoke-virtual {v0, v3, v2, v2}, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalNewFirstRechargeGiftItemView;->i0(Lcom/p1/mobile/putong/live/base/data/BLiveBonus;ZZ)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/NewFirstRechargePaySuccessDialog;->i:Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalNewFirstRechargeGiftItemView;

    .line 23
    .line 24
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    check-cast v3, Lcom/p1/mobile/putong/live/base/data/BLiveBonus;

    .line 29
    .line 30
    invoke-virtual {v0, v3, v2, v2}, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalNewFirstRechargeGiftItemView;->i0(Lcom/p1/mobile/putong/live/base/data/BLiveBonus;ZZ)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/NewFirstRechargePaySuccessDialog;->j:Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalNewFirstRechargeGiftItemView;

    .line 34
    .line 35
    const/4 v3, 0x2

    .line 36
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveBonus;

    .line 41
    .line 42
    invoke-virtual {v0, p1, v2, v2}, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalNewFirstRechargeGiftItemView;->i0(Lcom/p1/mobile/putong/live/base/data/BLiveBonus;ZZ)V

    .line 43
    .line 44
    .line 45
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/NewFirstRechargePaySuccessDialog;->k:Lv/VLinear;

    .line 46
    .line 47
    if-eqz p2, :cond_1

    .line 48
    .line 49
    move v1, v2

    .line 50
    :cond_1
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 51
    .line 52
    .line 53
    if-eqz p2, :cond_4

    .line 54
    .line 55
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/NewFirstRechargePaySuccessDialog;->m:Lv/VDraweeView;

    .line 56
    .line 57
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->url:Ljava/lang/String;

    .line 58
    .line 59
    const-string v1, "context_single_room"

    .line 60
    .line 61
    invoke-static {v1, p1, v0}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/NewFirstRechargePaySuccessDialog;->l:Lv/VText;

    .line 65
    .line 66
    if-eqz p3, :cond_2

    .line 67
    .line 68
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->M9:I

    .line 69
    .line 70
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->localName:Lcom/p1/mobile/putong/data/LangModel;

    .line 71
    .line 72
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/LangModel;->getLocalName()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-static {v0, v1}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    goto :goto_0

    .line 81
    :cond_2
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->N9:I

    .line 82
    .line 83
    invoke-static {v0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    :goto_0
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 88
    .line 89
    .line 90
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/NewFirstRechargePaySuccessDialog;->o:Lv/VText;

    .line 91
    .line 92
    if-eqz p3, :cond_3

    .line 93
    .line 94
    sget p3, Lcom/p1/mobile/putong/live/livingroom/R$string;->L9:I

    .line 95
    .line 96
    invoke-static {p3}, Ll/xau;->t(I)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p3

    .line 100
    goto :goto_1

    .line 101
    :cond_3
    sget p3, Lcom/p1/mobile/putong/live/livingroom/R$string;->Q9:I

    .line 102
    .line 103
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->localName:Lcom/p1/mobile/putong/data/LangModel;

    .line 104
    .line 105
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/LangModel;->getLocalName()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-static {p3, v0}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object p3

    .line 113
    :goto_1
    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 114
    .line 115
    .line 116
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/NewFirstRechargePaySuccessDialog;->p:Lv/VText;

    .line 117
    .line 118
    sget p3, Lcom/p1/mobile/putong/live/livingroom/R$string;->P9:I

    .line 119
    .line 120
    iget-wide v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->purchasePrice:J

    .line 121
    .line 122
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 123
    .line 124
    .line 125
    move-result-object p2

    .line 126
    invoke-static {p3, p2}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p2

    .line 130
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 131
    .line 132
    .line 133
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/NewFirstRechargePaySuccessDialog;->l:Lv/VText;

    .line 134
    .line 135
    invoke-virtual {p1}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    invoke-virtual {p1, v2}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 140
    .line 141
    .line 142
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/NewFirstRechargePaySuccessDialog;->o:Lv/VText;

    .line 143
    .line 144
    invoke-virtual {p1}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    invoke-virtual {p1, v2}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 149
    .line 150
    .line 151
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/NewFirstRechargePaySuccessDialog;->p:Lv/VText;

    .line 152
    .line 153
    invoke-virtual {p1}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 154
    .line 155
    .line 156
    move-result-object p1

    .line 157
    invoke-virtual {p1, v2}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 158
    .line 159
    .line 160
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/NewFirstRechargePaySuccessDialog;->n:Lv/VLinear;

    .line 161
    .line 162
    new-instance p1, Ll/nz20;

    .line 163
    .line 164
    invoke-direct {p1, p4}, Ll/nz20;-><init>(Ll/x20;)V

    .line 165
    .line 166
    .line 167
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 168
    .line 169
    .line 170
    :cond_4
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/NewFirstRechargePaySuccessDialog;->i0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
