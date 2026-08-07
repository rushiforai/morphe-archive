.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/view/LiveGiftWallSkinSelectItemView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lv/VDraweeView;

.field public e:Lv/VDraweeView;

.field public f:Landroid/widget/TextView;

.field public g:Lv/VDraweeView;


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

.method public static synthetic h0(Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallSkin;Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallUser;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallUser;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallSkin;->namedUserId:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic i0(Ll/gos;Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallUser;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gos;->t0(Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallUser;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic j0(Ll/gos;ILcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/gos;->D0(ILcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic k0(Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallSkin;Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallCategory;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallCategory;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallSkin;->categoryId:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method


# virtual methods
.method public final l0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/oqs;->a(Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/view/LiveGiftWallSkinSelectItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public m0(ILcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;Ll/gos;)V
    .locals 7
    .param p2    # Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;->skins:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    add-int/lit8 v1, p1, -0x1

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    const/4 v3, 0x1

    .line 11
    if-le v0, v1, :cond_0

    .line 12
    .line 13
    move v0, v3

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    move v0, v2

    .line 16
    :goto_0
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;->skins:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-le v0, v1, :cond_3

    .line 26
    .line 27
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;->skins:Ljava/util/List;

    .line 28
    .line 29
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallSkin;

    .line 34
    .line 35
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/view/LiveGiftWallSkinSelectItemView;->f:Landroid/widget/TextView;

    .line 36
    .line 37
    iget-object v4, v0, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallSkin;->name:Ljava/lang/String;

    .line 38
    .line 39
    const/4 v5, 0x5

    .line 40
    invoke-static {v4, v5}, Ll/xau;->s(Ljava/lang/String;I)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 45
    .line 46
    .line 47
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/view/LiveGiftWallSkinSelectItemView;->d:Lv/VDraweeView;

    .line 48
    .line 49
    iget-object v4, v0, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallSkin;->icon:Ljava/lang/String;

    .line 50
    .line 51
    const-string v5, "context_livingAct"

    .line 52
    .line 53
    invoke-static {v5, v1, v4}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    iget-object v1, p3, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;->users:Ljava/util/List;

    .line 57
    .line 58
    new-instance v4, Ll/kqs;

    .line 59
    .line 60
    invoke-direct {v4, v0}, Ll/kqs;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallSkin;)V

    .line 61
    .line 62
    .line 63
    invoke-static {v1, v4}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallUser;

    .line 68
    .line 69
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/view/LiveGiftWallSkinSelectItemView;->e:Lv/VDraweeView;

    .line 70
    .line 71
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result v6

    .line 75
    invoke-static {v4, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 76
    .line 77
    .line 78
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result v4

    .line 82
    if-eqz v4, :cond_1

    .line 83
    .line 84
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/view/LiveGiftWallSkinSelectItemView;->e:Lv/VDraweeView;

    .line 85
    .line 86
    new-instance v6, Ll/lqs;

    .line 87
    .line 88
    invoke-direct {v6, p4, v1}, Ll/lqs;-><init>(Ll/gos;Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallUser;)V

    .line 89
    .line 90
    .line 91
    invoke-static {v4, v6}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 92
    .line 93
    .line 94
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/view/LiveGiftWallSkinSelectItemView;->e:Lv/VDraweeView;

    .line 95
    .line 96
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallUser;->avatar:Ljava/lang/String;

    .line 97
    .line 98
    invoke-static {v5, v4, v1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    :cond_1
    new-instance v1, Ll/mqs;

    .line 102
    .line 103
    invoke-direct {v1, p4, p1, p2}, Ll/mqs;-><init>(Ll/gos;ILcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallGift;)V

    .line 104
    .line 105
    .line 106
    invoke-static {p0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 107
    .line 108
    .line 109
    iget-object p1, p3, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;->categories:Ljava/util/List;

    .line 110
    .line 111
    new-instance p2, Ll/nqs;

    .line 112
    .line 113
    invoke-direct {p2, v0}, Ll/nqs;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallSkin;)V

    .line 114
    .line 115
    .line 116
    invoke-static {p1, p2}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallCategory;

    .line 121
    .line 122
    iget-boolean p2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallSkin;->isSkin:Z

    .line 123
    .line 124
    if-eqz p2, :cond_2

    .line 125
    .line 126
    if-eqz p1, :cond_2

    .line 127
    .line 128
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/view/LiveGiftWallSkinSelectItemView;->g:Lv/VDraweeView;

    .line 129
    .line 130
    invoke-static {p2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 131
    .line 132
    .line 133
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/view/LiveGiftWallSkinSelectItemView;->g:Lv/VDraweeView;

    .line 134
    .line 135
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallCategory;->icon:Ljava/lang/String;

    .line 136
    .line 137
    invoke-static {v5, p0, p1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    return-void

    .line 141
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/view/LiveGiftWallSkinSelectItemView;->g:Lv/VDraweeView;

    .line 142
    .line 143
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 144
    .line 145
    .line 146
    :cond_3
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/view/LiveGiftWallSkinSelectItemView;->l0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
