.class public Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceGiftWallGiftItem;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceCardGiftIconView;

.field public e:Lv/VDraweeView;

.field public f:Lv/VDraweeView;

.field public g:Lv/VDraweeView;

.field public h:Lv/VText;

.field public i:Lv/VText;


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


# virtual methods
.method public h0(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftBean;Lcom/p1/mobile/android/app/Act;)V
    .locals 4

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceGiftWallGiftItem;->d:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceCardGiftIconView;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftBean;->icon:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p2, v0}, Ll/izs;->y(Lv/VDraweeView;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p2, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftBean;->top1ContributorUser:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserBean;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    const/4 v1, 0x1

    .line 12
    if-eqz p2, :cond_0

    .line 13
    .line 14
    iget-object p2, p2, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserBean;->avatar:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    if-nez p2, :cond_0

    .line 21
    .line 22
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceGiftWallGiftItem;->e:Lv/VDraweeView;

    .line 23
    .line 24
    iget-object v2, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftBean;->top1ContributorUser:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserBean;

    .line 25
    .line 26
    iget-object v2, v2, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserBean;->avatar:Ljava/lang/String;

    .line 27
    .line 28
    invoke-static {p2, v2}, Ll/izs;->y(Lv/VDraweeView;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceGiftWallGiftItem;->e:Lv/VDraweeView;

    .line 32
    .line 33
    invoke-static {p2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceGiftWallGiftItem;->d:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceCardGiftIconView;

    .line 37
    .line 38
    invoke-virtual {p2, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceCardGiftIconView;->setClear(Z)V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceGiftWallGiftItem;->e:Lv/VDraweeView;

    .line 43
    .line 44
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 45
    .line 46
    .line 47
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceGiftWallGiftItem;->d:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceCardGiftIconView;

    .line 48
    .line 49
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceCardGiftIconView;->setClear(Z)V

    .line 50
    .line 51
    .line 52
    :goto_0
    iget-object p2, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftBean;->label:Ljava/lang/String;

    .line 53
    .line 54
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 55
    .line 56
    .line 57
    move-result p2

    .line 58
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceGiftWallGiftItem;->f:Lv/VDraweeView;

    .line 59
    .line 60
    if-nez p2, :cond_1

    .line 61
    .line 62
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 63
    .line 64
    .line 65
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceGiftWallGiftItem;->f:Lv/VDraweeView;

    .line 66
    .line 67
    iget-object v2, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftBean;->label:Ljava/lang/String;

    .line 68
    .line 69
    const-string v3, "context_single_room"

    .line 70
    .line 71
    invoke-static {v3, p2, v2}, Ll/izs;->o(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    goto :goto_1

    .line 75
    :cond_1
    invoke-static {v2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 76
    .line 77
    .line 78
    :goto_1
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceGiftWallGiftItem;->h:Lv/VText;

    .line 79
    .line 80
    iget-object v2, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftBean;->name:Ljava/lang/String;

    .line 81
    .line 82
    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 83
    .line 84
    .line 85
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceGiftWallGiftItem;->d:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceCardGiftIconView;

    .line 86
    .line 87
    iget-boolean v2, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftBean;->isOwned:Z

    .line 88
    .line 89
    xor-int/2addr v2, v1

    .line 90
    invoke-static {p2, v2}, Ll/n3d0;->i(Lv/VDraweeView;Z)V

    .line 91
    .line 92
    .line 93
    iget-object p2, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftBean;->bgImage:Ljava/lang/String;

    .line 94
    .line 95
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 96
    .line 97
    .line 98
    move-result p2

    .line 99
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceGiftWallGiftItem;->g:Lv/VDraweeView;

    .line 100
    .line 101
    if-eqz p2, :cond_2

    .line 102
    .line 103
    invoke-static {v2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 104
    .line 105
    .line 106
    goto :goto_2

    .line 107
    :cond_2
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 108
    .line 109
    .line 110
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceGiftWallGiftItem;->g:Lv/VDraweeView;

    .line 111
    .line 112
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftBean;->bgImage:Ljava/lang/String;

    .line 113
    .line 114
    invoke-static {p2, v0}, Ll/izs;->y(Lv/VDraweeView;Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    :goto_2
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceGiftWallGiftItem;->i:Lv/VText;

    .line 118
    .line 119
    new-instance p2, Ljava/lang/StringBuilder;

    .line 120
    .line 121
    const-string v0, "\u00d7"

    .line 122
    .line 123
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    iget p1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftBean;->receivedCount:I

    .line 127
    .line 128
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 136
    .line 137
    .line 138
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    const-string v0, "#0DD9D9D9"

    .line 5
    .line 6
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/16 v1, 0x10

    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/fc2;->i(II)Landroid/graphics/drawable/GradientDrawable;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 17
    .line 18
    .line 19
    sget v0, Ll/mdc0;->d2:I

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceCardGiftIconView;

    .line 26
    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceGiftWallGiftItem;->d:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceCardGiftIconView;

    .line 28
    .line 29
    sget v0, Ll/mdc0;->K0:I

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Lv/VDraweeView;

    .line 36
    .line 37
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceGiftWallGiftItem;->e:Lv/VDraweeView;

    .line 38
    .line 39
    sget v0, Ll/mdc0;->Y2:I

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    check-cast v0, Lv/VDraweeView;

    .line 46
    .line 47
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceGiftWallGiftItem;->f:Lv/VDraweeView;

    .line 48
    .line 49
    sget v0, Ll/mdc0;->l2:I

    .line 50
    .line 51
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    check-cast v0, Lv/VText;

    .line 56
    .line 57
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceGiftWallGiftItem;->h:Lv/VText;

    .line 58
    .line 59
    sget v0, Ll/mdc0;->I:I

    .line 60
    .line 61
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    check-cast v0, Lv/VDraweeView;

    .line 66
    .line 67
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceGiftWallGiftItem;->g:Lv/VDraweeView;

    .line 68
    .line 69
    sget v0, Ll/mdc0;->Z1:I

    .line 70
    .line 71
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    check-cast v0, Lv/VText;

    .line 76
    .line 77
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceGiftWallGiftItem;->i:Lv/VText;

    .line 78
    .line 79
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceGiftWallGiftItem;->d:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceCardGiftIconView;

    .line 80
    .line 81
    const/high16 v0, 0x41100000    # 9.0f

    .line 82
    .line 83
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    const/4 v1, 0x4

    .line 88
    invoke-virtual {p0, v1, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceCardGiftIconView;->u(II)V

    .line 89
    .line 90
    .line 91
    return-void
.end method
