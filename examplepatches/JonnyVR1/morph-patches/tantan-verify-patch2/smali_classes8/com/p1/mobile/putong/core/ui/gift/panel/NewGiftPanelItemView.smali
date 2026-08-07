.class public Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"

# interfaces
.implements Landroid/widget/Checkable;


# instance fields
.field public d:Landroid/view/View;

.field public e:Lv/VDraweeView;

.field public f:Lv/VText;

.field public g:Landroid/widget/TextView;

.field public h:Lv/VLinear;

.field public i:Lv/VText;

.field public j:Lv/VText;

.field public k:Lv/VText;

.field public l:Lv/VText;

.field public m:Landroid/view/View;

.field public n:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

.field public o:Ll/b030;

.field public p:Z

.field public final q:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->p:Z

    .line 6
    .line 7
    const/high16 p1, 0x41500000    # 13.0f

    .line 8
    .line 9
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    int-to-float p1, p1

    .line 14
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->q:F

    .line 15
    .line 16
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 18
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->p:Z

    const/high16 p1, 0x41500000    # 13.0f

    .line 19
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    int-to-float p1, p1

    iput p1, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->q:F

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 20
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 21
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->p:Z

    const/high16 p1, 0x41500000    # 13.0f

    .line 22
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    int-to-float p1, p1

    iput p1, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->q:F

    return-void
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;Ll/b030;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->l0(Ll/b030;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Landroid/view/View;)V

    return-void
.end method

.method private k0()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->n:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;->style:Lcom/p1/mobile/putong/core/data/GiftInfoStyle;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->n:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;->style:Lcom/p1/mobile/putong/core/data/GiftInfoStyle;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/GiftInfoStyle;->tag:Lcom/p1/mobile/putong/core/data/GiftInfoTag;

    .line 20
    .line 21
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->n:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;->style:Lcom/p1/mobile/putong/core/data/GiftInfoStyle;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/GiftInfoStyle;->tag:Lcom/p1/mobile/putong/core/data/GiftInfoTag;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/GiftInfoTag;->text:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-nez p0, :cond_0

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

.method private o0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->e:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 8
    .line 9
    const/high16 v1, 0x41500000    # 13.0f

    .line 10
    .line 11
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 16
    .line 17
    sget v1, Ll/qa00;->K:I

    .line 18
    .line 19
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 20
    .line 21
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->f:Lv/VText;

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->g:Landroid/widget/TextView;

    .line 30
    .line 31
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->h:Lv/VLinear;

    .line 35
    .line 36
    const/4 v2, 0x1

    .line 37
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->d:Landroid/view/View;

    .line 41
    .line 42
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 43
    .line 44
    .line 45
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->k0()Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->l:Lv/VText;

    .line 50
    .line 51
    if-eqz v0, :cond_0

    .line 52
    .line 53
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_0
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method private q0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->f:Lv/VText;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->n:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->name:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->i:Lv/VText;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->n:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->name:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method private r0()V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->k0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->l:Lv/VText;

    .line 9
    .line 10
    const/4 v2, 0x1

    .line 11
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->l:Lv/VText;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Landroid/graphics/drawable/GradientDrawable;

    .line 21
    .line 22
    sget-object v3, Landroid/graphics/drawable/GradientDrawable$Orientation;->LEFT_RIGHT:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 23
    .line 24
    invoke-virtual {v0, v3}, Landroid/graphics/drawable/GradientDrawable;->setOrientation(Landroid/graphics/drawable/GradientDrawable$Orientation;)V

    .line 25
    .line 26
    .line 27
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->n:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 28
    .line 29
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 30
    .line 31
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;->style:Lcom/p1/mobile/putong/core/data/GiftInfoStyle;

    .line 32
    .line 33
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/GiftInfoStyle;->tag:Lcom/p1/mobile/putong/core/data/GiftInfoTag;

    .line 34
    .line 35
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/GiftInfoTag;->backgroundColors:Ljava/util/List;

    .line 36
    .line 37
    if-eqz v3, :cond_0

    .line 38
    .line 39
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    if-le v3, v2, :cond_0

    .line 44
    .line 45
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->n:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 46
    .line 47
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 48
    .line 49
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;->style:Lcom/p1/mobile/putong/core/data/GiftInfoStyle;

    .line 50
    .line 51
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/GiftInfoStyle;->tag:Lcom/p1/mobile/putong/core/data/GiftInfoTag;

    .line 52
    .line 53
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/GiftInfoTag;->backgroundColors:Ljava/util/List;

    .line 54
    .line 55
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    check-cast v1, Ljava/lang/String;

    .line 60
    .line 61
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->n:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 66
    .line 67
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 68
    .line 69
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;->style:Lcom/p1/mobile/putong/core/data/GiftInfoStyle;

    .line 70
    .line 71
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/GiftInfoStyle;->tag:Lcom/p1/mobile/putong/core/data/GiftInfoTag;

    .line 72
    .line 73
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/GiftInfoTag;->backgroundColors:Ljava/util/List;

    .line 74
    .line 75
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    check-cast v2, Ljava/lang/String;

    .line 80
    .line 81
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 82
    .line 83
    .line 84
    move-result v2

    .line 85
    filled-new-array {v1, v2}, [I

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColors([I)V

    .line 90
    .line 91
    .line 92
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->l:Lv/VText;

    .line 93
    .line 94
    invoke-virtual {v0}, Landroid/graphics/drawable/GradientDrawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-virtual {v1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 99
    .line 100
    .line 101
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->l:Lv/VText;

    .line 102
    .line 103
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->n:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 104
    .line 105
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 106
    .line 107
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;->style:Lcom/p1/mobile/putong/core/data/GiftInfoStyle;

    .line 108
    .line 109
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/GiftInfoStyle;->tag:Lcom/p1/mobile/putong/core/data/GiftInfoTag;

    .line 110
    .line 111
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/GiftInfoTag;->text:Ljava/lang/String;

    .line 112
    .line 113
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 114
    .line 115
    .line 116
    return-void

    .line 117
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    sget v2, Ll/ibc0;->f0:I

    .line 122
    .line 123
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->l:Lv/VText;

    .line 128
    .line 129
    invoke-virtual {v2, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 130
    .line 131
    .line 132
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->l:Lv/VText;

    .line 133
    .line 134
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 135
    .line 136
    .line 137
    return-void
.end method

.method private s0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->e:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 8
    .line 9
    sget v1, Ll/qa00;->s:I

    .line 10
    .line 11
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 12
    .line 13
    const/high16 v1, 0x42ba0000    # 93.0f

    .line 14
    .line 15
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    iput v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 20
    .line 21
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->f:Lv/VText;

    .line 28
    .line 29
    const/4 v1, 0x1

    .line 30
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->h:Lv/VLinear;

    .line 34
    .line 35
    const/4 v2, 0x0

    .line 36
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->g:Landroid/widget/TextView;

    .line 40
    .line 41
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->d:Landroid/view/View;

    .line 45
    .line 46
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 47
    .line 48
    .line 49
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->k0()Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->l:Lv/VText;

    .line 54
    .line 55
    if-eqz v0, :cond_0

    .line 56
    .line 57
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_0
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 62
    .line 63
    .line 64
    return-void
.end method


# virtual methods
.method public final i0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/rz20;->a(Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public isChecked()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->p:Z

    .line 2
    .line 3
    return p0
.end method

.method public final j0(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->o0()V

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->s0()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic l0(Ll/b030;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/b030;->v()Ll/pz20;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    invoke-virtual {p3}, Ll/pz20;->F()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p3

    .line 9
    const-string v0, "from_meet_picks"

    .line 10
    .line 11
    invoke-static {p3, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    const-string v0, "from_meet_liked"

    .line 18
    .line 19
    invoke-static {p3, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result p3

    .line 23
    if-nez p3, :cond_1

    .line 24
    .line 25
    invoke-virtual {p1}, Ll/b030;->v()Ll/pz20;

    .line 26
    .line 27
    .line 28
    move-result-object p3

    .line 29
    invoke-virtual {p3}, Ll/pz20;->G()Lcom/p1/mobile/putong/data/CoreGiftPanelName;

    .line 30
    .line 31
    .line 32
    move-result-object p3

    .line 33
    const-string v0, "note"

    .line 34
    .line 35
    invoke-static {v0}, Lcom/p1/mobile/putong/data/CoreGiftPanelName;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/CoreGiftPanelName;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    if-ne p3, v0, :cond_0

    .line 40
    .line 41
    const-string p3, "p_meet"

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    invoke-virtual {p1}, Ll/b030;->v()Ll/pz20;

    .line 45
    .line 46
    .line 47
    move-result-object p3

    .line 48
    invoke-virtual {p3}, Ll/pz20;->L()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p3

    .line 52
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->n:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 53
    .line 54
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 55
    .line 56
    const-string v0, "chat_gift_id"

    .line 57
    .line 58
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    filled-new-array {p0}, [Ll/pf60;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    const-string v0, "e_chat_gift_bar_gift_send"

    .line 67
    .line 68
    invoke-static {v0, p3, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 69
    .line 70
    .line 71
    :cond_1
    iget p0, p2, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->quota:I

    .line 72
    .line 73
    if-nez p0, :cond_2

    .line 74
    .line 75
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 76
    .line 77
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;->noQuotaToast:Ljava/lang/String;

    .line 78
    .line 79
    invoke-virtual {p1}, Ll/b030;->v()Ll/pz20;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    invoke-static {p0, p1}, Ll/o1j0;->z(Ljava/lang/String;Landroid/view/View;)V

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :cond_2
    invoke-virtual {p1, p2}, Ll/b030;->x(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V

    .line 96
    .line 97
    .line 98
    return-void
.end method

.method public m0(Ll/b030;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;ZZ)V
    .locals 2

    .line 1
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->n:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 2
    .line 3
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->o:Ll/b030;

    .line 4
    .line 5
    if-nez p4, :cond_0

    .line 6
    .line 7
    iget-object p4, p2, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 8
    .line 9
    iget-object p4, p4, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;->grayURL:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p4

    .line 15
    if-nez p4, :cond_0

    .line 16
    .line 17
    sget-object p4, Ll/uqb0;->G:Ll/fsb0;

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->e:Lv/VDraweeView;

    .line 20
    .line 21
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 22
    .line 23
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;->grayURL:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {p4, v0, v1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    sget-object p4, Ll/uqb0;->G:Ll/fsb0;

    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->e:Lv/VDraweeView;

    .line 32
    .line 33
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->url:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {p4, v0, v1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    :goto_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->q0()V

    .line 39
    .line 40
    .line 41
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->r0()V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->p0()V

    .line 45
    .line 46
    .line 47
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->k:Lv/VText;

    .line 48
    .line 49
    new-instance v0, Ll/qz20;

    .line 50
    .line 51
    invoke-direct {v0, p0, p1, p2}, Ll/qz20;-><init>(Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;Ll/b030;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V

    .line 52
    .line 53
    .line 54
    invoke-static {p4, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1, p2}, Ll/b030;->k(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V

    .line 58
    .line 59
    .line 60
    iget p1, p2, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->quota:I

    .line 61
    .line 62
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->l:Lv/VText;

    .line 63
    .line 64
    if-nez p1, :cond_1

    .line 65
    .line 66
    const p1, 0x3f19999a    # 0.6f

    .line 67
    .line 68
    .line 69
    invoke-virtual {p4, p1}, Landroid/view/View;->setAlpha(F)V

    .line 70
    .line 71
    .line 72
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->f:Lv/VText;

    .line 73
    .line 74
    const/high16 v0, 0x3f000000    # 0.5f

    .line 75
    .line 76
    invoke-virtual {p4, v0}, Landroid/view/View;->setAlpha(F)V

    .line 77
    .line 78
    .line 79
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->e:Lv/VDraweeView;

    .line 80
    .line 81
    invoke-virtual {p4, p1}, Landroid/view/View;->setAlpha(F)V

    .line 82
    .line 83
    .line 84
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->g:Landroid/widget/TextView;

    .line 85
    .line 86
    invoke-virtual {p4, p1}, Landroid/view/View;->setAlpha(F)V

    .line 87
    .line 88
    .line 89
    goto :goto_1

    .line 90
    :cond_1
    const/high16 p1, 0x3f800000    # 1.0f

    .line 91
    .line 92
    invoke-virtual {p4, p1}, Landroid/view/View;->setAlpha(F)V

    .line 93
    .line 94
    .line 95
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->f:Lv/VText;

    .line 96
    .line 97
    invoke-virtual {p4, p1}, Landroid/view/View;->setAlpha(F)V

    .line 98
    .line 99
    .line 100
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->e:Lv/VDraweeView;

    .line 101
    .line 102
    invoke-virtual {p4, p1}, Landroid/view/View;->setAlpha(F)V

    .line 103
    .line 104
    .line 105
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->g:Landroid/widget/TextView;

    .line 106
    .line 107
    invoke-virtual {p4, p1}, Landroid/view/View;->setAlpha(F)V

    .line 108
    .line 109
    .line 110
    :goto_1
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 111
    .line 112
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;->style:Lcom/p1/mobile/putong/core/data/GiftInfoStyle;

    .line 113
    .line 114
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/GiftInfoStyle;->nameColor:Ljava/lang/String;

    .line 115
    .line 116
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 117
    .line 118
    .line 119
    move-result p1

    .line 120
    if-nez p1, :cond_2

    .line 121
    .line 122
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->f:Lv/VText;

    .line 123
    .line 124
    iget-object p4, p2, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 125
    .line 126
    iget-object p4, p4, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;->style:Lcom/p1/mobile/putong/core/data/GiftInfoStyle;

    .line 127
    .line 128
    iget-object p4, p4, Lcom/p1/mobile/putong/core/data/GiftInfoStyle;->nameColor:Ljava/lang/String;

    .line 129
    .line 130
    invoke-static {p4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 131
    .line 132
    .line 133
    move-result p4

    .line 134
    invoke-virtual {p1, p4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 135
    .line 136
    .line 137
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->n0()V

    .line 138
    .line 139
    .line 140
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->setChecked(Z)V

    .line 141
    .line 142
    .line 143
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->m:Landroid/view/View;

    .line 144
    .line 145
    iget p1, p2, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->quota:I

    .line 146
    .line 147
    if-nez p1, :cond_3

    .line 148
    .line 149
    const/4 p1, 0x1

    .line 150
    goto :goto_2

    .line 151
    :cond_3
    const/4 p1, 0x0

    .line 152
    :goto_2
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 153
    .line 154
    .line 155
    return-void
.end method

.method public final n0()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->n:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;->style:Lcom/p1/mobile/putong/core/data/GiftInfoStyle;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->n:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;->style:Lcom/p1/mobile/putong/core/data/GiftInfoStyle;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/GiftInfoStyle;->backgroundColors:Ljava/util/List;

    .line 20
    .line 21
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->n:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;->style:Lcom/p1/mobile/putong/core/data/GiftInfoStyle;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/GiftInfoStyle;->backgroundColors:Ljava/util/List;

    .line 34
    .line 35
    const/4 v1, 0x0

    .line 36
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Ljava/lang/String;

    .line 41
    .line 42
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->n:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 47
    .line 48
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 49
    .line 50
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;->style:Lcom/p1/mobile/putong/core/data/GiftInfoStyle;

    .line 51
    .line 52
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/GiftInfoStyle;->backgroundColors:Ljava/util/List;

    .line 53
    .line 54
    const/4 v2, 0x1

    .line 55
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    check-cast v1, Ljava/lang/String;

    .line 60
    .line 61
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    filled-new-array {v0, v1}, [I

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    new-instance v1, Landroid/graphics/drawable/GradientDrawable;

    .line 70
    .line 71
    sget-object v2, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 72
    .line 73
    invoke-direct {v1, v2, v0}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    .line 74
    .line 75
    .line 76
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->q:F

    .line 77
    .line 78
    invoke-virtual {v1, v3}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setOrientation(Landroid/graphics/drawable/GradientDrawable$Orientation;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {v1, v0}, Landroid/graphics/drawable/GradientDrawable;->setColors([I)V

    .line 85
    .line 86
    .line 87
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->d:Landroid/view/View;

    .line 88
    .line 89
    invoke-virtual {p0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 90
    .line 91
    .line 92
    return-void

    .line 93
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    sget v1, Ll/ibc0;->e0:I

    .line 98
    .line 99
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->d:Landroid/view/View;

    .line 104
    .line 105
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->i0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final p0()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->n:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 2
    .line 3
    iget-wide v0, v0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->unitCoinPrice:D

    .line 4
    .line 5
    double-to-int v0, v0

    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->j:Lv/VText;

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    const-string v0, "\u514d\u8d39"

    .line 11
    .line 12
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->g:Landroid/widget/TextView;

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 24
    .line 25
    .line 26
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->n:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 27
    .line 28
    iget-wide v2, v2, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->unitCoinPrice:D

    .line 29
    .line 30
    double-to-int v2, v2

    .line 31
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    const-string v2, " \u63a2\u63a2\u5e01"

    .line 35
    .line 36
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->g:Landroid/widget/TextView;

    .line 47
    .line 48
    new-instance v1, Ljava/lang/StringBuilder;

    .line 49
    .line 50
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 51
    .line 52
    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->n:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 54
    .line 55
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->unitCoinPrice:D

    .line 56
    .line 57
    double-to-int p0, v3

    .line 58
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public setChecked(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->p:Z

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->p:Z

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->j0(Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public toggle()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->p:Z

    .line 2
    .line 3
    xor-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->setChecked(Z)V

    .line 6
    .line 7
    .line 8
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->p:Z

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->o:Ll/b030;

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->n:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 15
    .line 16
    invoke-virtual {v1, p0}, Ll/b030;->w(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-virtual {v1}, Ll/b030;->A()V

    .line 21
    .line 22
    .line 23
    return-void
.end method
