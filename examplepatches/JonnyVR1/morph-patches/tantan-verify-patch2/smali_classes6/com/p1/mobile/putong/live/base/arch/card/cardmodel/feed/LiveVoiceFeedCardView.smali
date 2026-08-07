.class public Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveVoiceFeedCardView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field private attributeTextView:Landroid/widget/TextView;

.field private avatarNumberView:Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveAvatarNumberViewNew;

.field private cardData:Ll/mes;

.field private staticBgView:Lv/VDraweeView;

.field private subTitleIcon:Lv/VDraweeView;

.field private subTitleView:Landroid/widget/TextView;

.field private titleView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public a(Ll/mes;Ll/ner;Ll/ft5;)V
    .locals 4

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveVoiceFeedCardView;->cardData:Ll/mes;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveVoiceFeedCardView;->staticBgView:Lv/VDraweeView;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveVoiceFeedCardView;->subTitleIcon:Lv/VDraweeView;

    .line 10
    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveVoiceFeedCardView;->attributeTextView:Landroid/widget/TextView;

    .line 15
    .line 16
    invoke-virtual {p1}, Ll/mes;->k()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-static {v0, v2}, Ll/vl4;->d(Landroid/widget/TextView;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveVoiceFeedCardView;->subTitleView:Landroid/widget/TextView;

    .line 24
    .line 25
    invoke-virtual {p1}, Ll/mes;->g()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-static {v0, v2}, Ll/vl4;->d(Landroid/widget/TextView;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1}, Ll/mes;->i()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {p1}, Ll/mes;->j()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveVoiceFeedCardView;->titleView:Landroid/widget/TextView;

    .line 41
    .line 42
    invoke-static {v0, v2, p3, v3, p2}, Ll/vl4;->f(Ljava/lang/String;Ljava/lang/String;Ll/ft5;Landroid/widget/TextView;Ll/ner;)V

    .line 43
    .line 44
    .line 45
    iget-object p2, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveVoiceFeedCardView;->avatarNumberView:Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveAvatarNumberViewNew;

    .line 46
    .line 47
    invoke-virtual {p1}, Ll/mes;->d()Ljava/util/ArrayList;

    .line 48
    .line 49
    .line 50
    move-result-object p3

    .line 51
    new-instance v0, Ll/i6v;

    .line 52
    .line 53
    invoke-direct {v0}, Ll/i6v;-><init>()V

    .line 54
    .line 55
    .line 56
    invoke-static {p3, v0}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 57
    .line 58
    .line 59
    move-result-object p3

    .line 60
    invoke-virtual {p2, p3}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveAvatarNumberViewNew;->setImageData(Ljava/util/List;)V

    .line 61
    .line 62
    .line 63
    iget-object p2, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveVoiceFeedCardView;->avatarNumberView:Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveAvatarNumberViewNew;

    .line 64
    .line 65
    invoke-virtual {p1}, Ll/mes;->c()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p3

    .line 69
    invoke-virtual {p2, p3}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveAvatarNumberViewNew;->setNumberView(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    iget-object p2, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveVoiceFeedCardView;->avatarNumberView:Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveAvatarNumberViewNew;

    .line 73
    .line 74
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveAvatarNumberViewNew;->getNumberView()Landroid/widget/TextView;

    .line 75
    .line 76
    .line 77
    move-result-object p2

    .line 78
    sget p3, Ll/mbc0;->y:I

    .line 79
    .line 80
    invoke-virtual {p2, p3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 81
    .line 82
    .line 83
    iget-object p2, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveVoiceFeedCardView;->avatarNumberView:Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveAvatarNumberViewNew;

    .line 84
    .line 85
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveAvatarNumberViewNew;->getNumberView()Landroid/widget/TextView;

    .line 86
    .line 87
    .line 88
    move-result-object p2

    .line 89
    invoke-static {v1}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 90
    .line 91
    .line 92
    move-result-object p3

    .line 93
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p1}, Ll/mes;->h()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p2

    .line 100
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 101
    .line 102
    .line 103
    move-result p2

    .line 104
    const-string p3, "context_square"

    .line 105
    .line 106
    const/4 v0, 0x1

    .line 107
    if-nez p2, :cond_0

    .line 108
    .line 109
    iget-object p2, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveVoiceFeedCardView;->subTitleIcon:Lv/VDraweeView;

    .line 110
    .line 111
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 112
    .line 113
    .line 114
    iget-object p2, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveVoiceFeedCardView;->subTitleIcon:Lv/VDraweeView;

    .line 115
    .line 116
    invoke-virtual {p1}, Ll/mes;->h()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    sget v2, Ll/qa00;->m:I

    .line 121
    .line 122
    invoke-static {p3, p2, v1, v2, v2}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 123
    .line 124
    .line 125
    :cond_0
    invoke-virtual {p1}, Ll/mes;->a()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object p2

    .line 129
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 130
    .line 131
    .line 132
    move-result p2

    .line 133
    if-nez p2, :cond_1

    .line 134
    .line 135
    iget-object p2, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveVoiceFeedCardView;->staticBgView:Lv/VDraweeView;

    .line 136
    .line 137
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 138
    .line 139
    .line 140
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveVoiceFeedCardView;->staticBgView:Lv/VDraweeView;

    .line 141
    .line 142
    invoke-virtual {p1}, Ll/mes;->a()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    sget p2, Ll/qa00;->V:I

    .line 147
    .line 148
    sget v0, Ll/qa00;->X:I

    .line 149
    .line 150
    invoke-static {p3, p0, p1, p2, v0}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 151
    .line 152
    .line 153
    :cond_1
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/jdc0;->i:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Landroid/widget/TextView;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveVoiceFeedCardView;->attributeTextView:Landroid/widget/TextView;

    .line 13
    .line 14
    sget v0, Ll/jdc0;->Z0:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Landroid/widget/TextView;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveVoiceFeedCardView;->titleView:Landroid/widget/TextView;

    .line 23
    .line 24
    sget v0, Ll/jdc0;->o:I

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveAvatarNumberViewNew;

    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveVoiceFeedCardView;->avatarNumberView:Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveAvatarNumberViewNew;

    .line 33
    .line 34
    sget v0, Ll/jdc0;->r:I

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Lv/VDraweeView;

    .line 41
    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveVoiceFeedCardView;->staticBgView:Lv/VDraweeView;

    .line 43
    .line 44
    sget v0, Ll/jdc0;->M0:I

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Lv/VDraweeView;

    .line 51
    .line 52
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveVoiceFeedCardView;->subTitleIcon:Lv/VDraweeView;

    .line 53
    .line 54
    sget v0, Ll/jdc0;->L0:I

    .line 55
    .line 56
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    check-cast v0, Landroid/widget/TextView;

    .line 61
    .line 62
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/LiveVoiceFeedCardView;->subTitleView:Landroid/widget/TextView;

    .line 63
    .line 64
    invoke-static {}, Ll/bnl0;->y0()I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    sget v1, Ll/qa00;->q:I

    .line 69
    .line 70
    sub-int/2addr v0, v1

    .line 71
    div-int/lit8 v0, v0, 0x2

    .line 72
    .line 73
    int-to-float v0, v0

    .line 74
    const/high16 v1, 0x43480000    # 200.0f

    .line 75
    .line 76
    mul-float/2addr v0, v1

    .line 77
    const/high16 v1, 0x43300000    # 176.0f

    .line 78
    .line 79
    div-float/2addr v0, v1

    .line 80
    float-to-int v0, v0

    .line 81
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    iput v0, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 86
    .line 87
    invoke-virtual {p0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 88
    .line 89
    .line 90
    sget v0, Ll/qa00;->i:I

    .line 91
    .line 92
    invoke-static {p0, v0}, Ll/qnp0;->d1(Landroid/view/View;I)V

    .line 93
    .line 94
    .line 95
    return-void
.end method
