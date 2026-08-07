.class public Ll/pyj;
.super Ll/ams;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ams<",
        "Ll/ezj;",
        "Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;",
        ">;"
    }
.end annotation


# instance fields
.field public s:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ams;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic w(Ll/pyj;Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/pyj;->y(Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public A(Ljava/lang/String;)V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ams;->i:Lv/VText;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/pyj;->s:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string p0, " "

    .line 14
    .line 15
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public B(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ams;->r:Lcom/p1/mobile/putong/live/base/view/EmptyView;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/ams;->f:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 7
    .line 8
    xor-int/lit8 v1, p1, 0x1

    .line 9
    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/ams;->r:Lcom/p1/mobile/putong/live/base/view/EmptyView;

    .line 16
    .line 17
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->E9:I

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/view/EmptyView;->e(I)Lcom/p1/mobile/putong/live/base/view/EmptyView;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    sget p1, Ll/obc0;->f4:I

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/view/EmptyView;->b(I)Lcom/p1/mobile/putong/live/base/view/EmptyView;

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public final C(Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/ams;->l:Lcom/p1/mobile/putong/live/livingroom/increment/gift/suit/view/GiftSuitItemView;

    .line 2
    .line 3
    iget-object v1, p0, Ll/ams;->m:Lcom/p1/mobile/putong/live/livingroom/increment/gift/suit/view/GiftSuitItemView;

    .line 4
    .line 5
    iget-object v2, p0, Ll/ams;->n:Lcom/p1/mobile/putong/live/livingroom/increment/gift/suit/view/GiftSuitItemView;

    .line 6
    .line 7
    filled-new-array {v0, v1, v2}, [Lcom/p1/mobile/putong/live/livingroom/increment/gift/suit/view/GiftSuitItemView;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x0

    .line 12
    :goto_0
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;->setProcesses:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-ge v1, v2, :cond_2

    .line 19
    .line 20
    const/4 v2, 0x3

    .line 21
    if-le v1, v2, :cond_0

    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_0
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;->displayAttribute:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;

    .line 25
    .line 26
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-eqz v2, :cond_1

    .line 31
    .line 32
    aget-object v2, v0, v1

    .line 33
    .line 34
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->b:Ll/hj2;

    .line 35
    .line 36
    check-cast v3, Ll/ezj;

    .line 37
    .line 38
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;->displayAttribute:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;

    .line 39
    .line 40
    invoke-virtual {v2, v3, v4}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/suit/view/GiftSuitItemView;->d(Ll/ezj;Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;)V

    .line 41
    .line 42
    .line 43
    :cond_1
    aget-object v2, v0, v1

    .line 44
    .line 45
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->b:Ll/hj2;

    .line 46
    .line 47
    check-cast v3, Ll/ezj;

    .line 48
    .line 49
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;->setProcesses:Ljava/util/List;

    .line 50
    .line 51
    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v4

    .line 55
    check-cast v4, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetProcesses;

    .line 56
    .line 57
    invoke-virtual {v2, v3, v4}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/suit/view/GiftSuitItemView;->c(Ll/ezj;Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetProcesses;)V

    .line 58
    .line 59
    .line 60
    add-int/lit8 v1, v1, 0x1

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_2
    :goto_1
    return-void
.end method

.method public F0(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->F0(Z)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->b:Ll/hj2;

    .line 5
    .line 6
    check-cast p0, Ll/ezj;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    invoke-static {p0}, Ll/fzj;->b(Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public k()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public x()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ams;->f:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final synthetic y(Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->b:Ll/hj2;

    .line 2
    .line 3
    check-cast p0, Ll/ezj;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;->schemeUrl:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/ezj;->n4(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public z(Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;)V
    .locals 9

    .line 1
    invoke-virtual {p0}, Ll/ams;->v()Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Ll/bnl0;->y0()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    mul-int/lit8 v1, v1, 0x3

    .line 10
    .line 11
    div-int/lit8 v1, v1, 0x4

    .line 12
    .line 13
    invoke-static {v0, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 14
    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    invoke-virtual {p0, v0}, Ll/pyj;->B(Z)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;->displayAttribute:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;

    .line 21
    .line 22
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->b:Ll/hj2;

    .line 29
    .line 30
    check-cast v0, Ll/ezj;

    .line 31
    .line 32
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;->displayAttribute:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;

    .line 33
    .line 34
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;->safeAreaPicUrl:Ljava/lang/String;

    .line 35
    .line 36
    iget-object v2, p0, Ll/ams;->q:Landroid/view/View;

    .line 37
    .line 38
    invoke-virtual {v0, v1, v2}, Ll/ezj;->r4(Ljava/lang/String;Landroid/view/View;)V

    .line 39
    .line 40
    .line 41
    iget-object v3, p0, Ll/ams;->f:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 42
    .line 43
    const/high16 v0, 0x41c00000    # 24.0f

    .line 44
    .line 45
    invoke-static {v0}, Ll/bnl0;->w(F)I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    neg-int v7, v1

    .line 50
    invoke-static {v0}, Ll/bnl0;->w(F)I

    .line 51
    .line 52
    .line 53
    move-result v8

    .line 54
    const/4 v4, 0x0

    .line 55
    const/4 v5, 0x0

    .line 56
    const/4 v6, 0x0

    .line 57
    invoke-static/range {v3 .. v8}, Ll/qnp0;->c1(Landroid/view/View;IIIII)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->b:Ll/hj2;

    .line 61
    .line 62
    check-cast v0, Ll/ezj;

    .line 63
    .line 64
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;->displayAttribute:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;

    .line 65
    .line 66
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;->backgroundPicUrl:Ljava/lang/String;

    .line 67
    .line 68
    iget-object v2, p0, Ll/ams;->f:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 69
    .line 70
    invoke-virtual {v0, v1, v2}, Ll/ezj;->r4(Ljava/lang/String;Landroid/view/View;)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;->displayAttribute:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;

    .line 74
    .line 75
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;->questionMarkDisplayAttribute:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;

    .line 76
    .line 77
    iget-object v1, p0, Ll/ams;->g:Lv/VDraweeView;

    .line 78
    .line 79
    new-instance v2, Ll/oyj;

    .line 80
    .line 81
    invoke-direct {v2, p0, v0}, Ll/oyj;-><init>(Ll/pyj;Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;)V

    .line 82
    .line 83
    .line 84
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 85
    .line 86
    .line 87
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->b:Ll/hj2;

    .line 88
    .line 89
    check-cast v1, Ll/ezj;

    .line 90
    .line 91
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;->iconUrl:Ljava/lang/String;

    .line 92
    .line 93
    iget-object v2, p0, Ll/ams;->g:Lv/VDraweeView;

    .line 94
    .line 95
    invoke-virtual {v1, v0, v2}, Ll/ezj;->r4(Ljava/lang/String;Landroid/view/View;)V

    .line 96
    .line 97
    .line 98
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;->displayAttribute:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;

    .line 99
    .line 100
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;->tickerDisplayAttribute:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;

    .line 101
    .line 102
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;->text:Ljava/lang/String;

    .line 103
    .line 104
    iput-object v1, p0, Ll/pyj;->s:Ljava/lang/String;

    .line 105
    .line 106
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->b:Ll/hj2;

    .line 107
    .line 108
    check-cast v1, Ll/ezj;

    .line 109
    .line 110
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;->iconUrl:Ljava/lang/String;

    .line 111
    .line 112
    iget-object v3, p0, Ll/ams;->h:Lv/VDraweeView;

    .line 113
    .line 114
    invoke-virtual {v1, v2, v3}, Ll/ezj;->q4(Ljava/lang/String;Lv/VDraweeView;)V

    .line 115
    .line 116
    .line 117
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->b:Ll/hj2;

    .line 118
    .line 119
    check-cast v1, Ll/ezj;

    .line 120
    .line 121
    iget-object v2, p0, Ll/ams;->i:Lv/VText;

    .line 122
    .line 123
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;->textColor:Ljava/lang/String;

    .line 124
    .line 125
    invoke-virtual {v1, v2, v0}, Ll/ezj;->t4(Lv/VText;Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    iget-object v0, p0, Ll/ams;->k:Lv/VText;

    .line 129
    .line 130
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;->displayAttribute:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;

    .line 131
    .line 132
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;->giftSetDescDisplayAttribute:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;

    .line 133
    .line 134
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;->giftSetDescText:Ljava/lang/String;

    .line 135
    .line 136
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 137
    .line 138
    .line 139
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->b:Ll/hj2;

    .line 140
    .line 141
    check-cast v0, Ll/ezj;

    .line 142
    .line 143
    iget-object v1, p0, Ll/ams;->k:Lv/VText;

    .line 144
    .line 145
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;->displayAttribute:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;

    .line 146
    .line 147
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;->giftSetDescDisplayAttribute:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;

    .line 148
    .line 149
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;->giftSetDescTextColor:Ljava/lang/String;

    .line 150
    .line 151
    invoke-virtual {v0, v1, v2}, Ll/ezj;->t4(Lv/VText;Ljava/lang/String;)V

    .line 152
    .line 153
    .line 154
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->b:Ll/hj2;

    .line 155
    .line 156
    check-cast v0, Ll/ezj;

    .line 157
    .line 158
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;->displayAttribute:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;

    .line 159
    .line 160
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;->giftSetDescDisplayAttribute:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;

    .line 161
    .line 162
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;->giftSetDescBackgroundPicUrl:Ljava/lang/String;

    .line 163
    .line 164
    iget-object v2, p0, Ll/ams;->j:Lv/VDraweeView;

    .line 165
    .line 166
    invoke-virtual {v0, v1, v2}, Ll/ezj;->q4(Ljava/lang/String;Lv/VDraweeView;)V

    .line 167
    .line 168
    .line 169
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;->displayAttribute:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;

    .line 170
    .line 171
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttribute;->resourceDisplayAttribute:Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;

    .line 172
    .line 173
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->b:Ll/hj2;

    .line 174
    .line 175
    check-cast v1, Ll/ezj;

    .line 176
    .line 177
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;->framePicUrl:Ljava/lang/String;

    .line 178
    .line 179
    iget-object v3, p0, Ll/ams;->o:Lv/VDraweeView;

    .line 180
    .line 181
    invoke-virtual {v1, v2, v3}, Ll/ezj;->r4(Ljava/lang/String;Landroid/view/View;)V

    .line 182
    .line 183
    .line 184
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->b:Ll/hj2;

    .line 185
    .line 186
    check-cast v1, Ll/ezj;

    .line 187
    .line 188
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetDisplayAttributeItem;->resourcePicUrl:Ljava/lang/String;

    .line 189
    .line 190
    iget-object v2, p0, Ll/ams;->p:Lv/VDraweeView;

    .line 191
    .line 192
    invoke-virtual {v1, v0, v2}, Ll/ezj;->r4(Ljava/lang/String;Landroid/view/View;)V

    .line 193
    .line 194
    .line 195
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->b:Ll/hj2;

    .line 196
    .line 197
    check-cast v0, Ll/ezj;

    .line 198
    .line 199
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;->tickerLeft:I

    .line 200
    .line 201
    int-to-double v1, v1

    .line 202
    const-wide/high16 v3, 0x3ff0000000000000L    # 1.0

    .line 203
    .line 204
    mul-double/2addr v1, v3

    .line 205
    const-wide v3, 0x408f400000000000L    # 1000.0

    .line 206
    .line 207
    .line 208
    .line 209
    .line 210
    div-double/2addr v1, v3

    .line 211
    double-to-int v1, v1

    .line 212
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;->hasSuitSend()Z

    .line 213
    .line 214
    .line 215
    move-result v2

    .line 216
    invoke-virtual {v0, v1, v2}, Ll/ezj;->e4(IZ)V

    .line 217
    .line 218
    .line 219
    invoke-virtual {p0, p1}, Ll/pyj;->C(Lcom/p1/mobile/putong/live/base/data/BLiveGiftSetInfo;)V

    .line 220
    .line 221
    .line 222
    return-void
.end method
