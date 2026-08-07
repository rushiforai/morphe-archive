.class public Ll/xur;
.super Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder<",
        "Ll/avr;",
        ">;"
    }
.end annotation


# instance fields
.field public k:Landroid/widget/LinearLayout;

.field public l:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public m:Landroid/widget/TextView;

.field public n:Landroid/widget/TextView;

.field public o:Landroid/widget/TextView;

.field public p:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/avr;)V
    .locals 2
    .param p2    # Ll/avr;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sget v0, Ll/yec0;->e:I

    .line 2
    .line 3
    invoke-static {}, Ll/qag0;->g()Ll/rq2;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {p0, v0, p1, p2, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;-><init>(ILcom/p1/mobile/android/app/Act;Ll/y8s;Ll/rq2;)V

    .line 8
    .line 9
    .line 10
    const/4 p1, 0x1

    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->B(Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic F(Ll/xur;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/xur;->J(Landroid/view/View;)V

    return-void
.end method

.method private synthetic J(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p1, Ll/avr;

    .line 4
    .line 5
    iget-object p0, p0, Ll/xur;->p:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->getScheme()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p1, p0}, Ll/avr;->T3(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private r()V
    .locals 14

    .line 1
    iget-object v0, p0, Ll/xur;->o:Landroid/widget/TextView;

    new-instance v1, Ll/wur;

    invoke-direct {v1, p0}, Ll/wur;-><init>(Ll/xur;)V

    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 2
    iget-object v0, p0, Ll/xur;->m:Landroid/widget/TextView;

    iget-object v1, p0, Ll/xur;->p:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->getTitle()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 3
    iget-object v0, p0, Ll/xur;->n:Landroid/widget/TextView;

    iget-object v1, p0, Ll/xur;->p:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->getSubTitle()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    iget-object v0, p0, Ll/xur;->p:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->getGiftsList()Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    move-result v0

    if-nez v0, :cond_6

    const/high16 v0, 0x42a80000    # 84.0f

    .line 5
    invoke-static {v0}, Ll/qa00;->d(F)I

    move-result v0

    .line 6
    iget-object v1, p0, Ll/xur;->p:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;->getGiftsList()Ljava/util/List;

    move-result-object v1

    .line 7
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x4

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 8
    iget-object v4, p0, Ll/xur;->l:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {v4}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 9
    new-array v4, v2, [I

    .line 10
    iget-object v5, p0, Ll/xur;->l:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {v5}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v5

    .line 11
    new-instance v6, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v6, v0, v0}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    const/4 v7, 0x0

    move v8, v7

    :goto_0
    const/4 v9, 0x1

    if-ge v8, v2, :cond_1

    .line 12
    sget v10, Ll/yec0;->d:I

    const/4 v11, 0x0

    invoke-virtual {v5, v10, v11}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v10

    .line 13
    invoke-static {}, Ll/kkl0;->i()I

    move-result v11

    aput v11, v4, v8

    .line 14
    invoke-virtual {v10, v11}, Landroid/view/View;->setId(I)V

    .line 15
    sget v11, Ll/mdc0;->g2:I

    .line 16
    invoke-virtual {v10, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v11

    check-cast v11, Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 17
    invoke-interface {v1, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$AnchorGift;

    invoke-virtual {v12}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$AnchorGift;->getImage()Ljava/lang/String;

    move-result-object v12

    .line 18
    const-string v13, "context_single_room"

    invoke-static {v13, v11, v12}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 19
    invoke-interface {v1, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$AnchorGift;

    invoke-virtual {v11}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$AnchorGift;->getDay()Ljava/lang/String;

    move-result-object v11

    .line 20
    invoke-static {v11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v12

    if-eqz v12, :cond_0

    .line 21
    sget v9, Ll/mdc0;->a1:I

    invoke-virtual {v10, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    invoke-static {v9, v7}, Ll/bnl0;->M(Landroid/view/View;Z)V

    goto :goto_1

    .line 22
    :cond_0
    sget v12, Ll/mdc0;->a1:I

    invoke-virtual {v10, v12}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    invoke-static {v12, v9}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    sget v9, Ll/mdc0;->a1:I

    invoke-virtual {v10, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/TextView;

    invoke-virtual {v9, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 24
    :goto_1
    iget-object v9, p0, Ll/xur;->l:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {v9, v10, v6}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 25
    :cond_1
    iget-object v1, p0, Ll/xur;->l:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    const/4 v5, 0x2

    if-lt v2, v5, :cond_2

    move v6, v5

    goto :goto_2

    :cond_2
    move v6, v9

    :goto_2
    mul-int/2addr v6, v0

    .line 26
    iput v6, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 27
    div-int/lit8 v6, v2, 0x2

    rem-int/lit8 v8, v2, 0x2

    add-int/2addr v6, v8

    mul-int/2addr v6, v0

    iput v6, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 28
    new-instance v1, Landroidx/constraintlayout/widget/a;

    invoke-direct {v1}, Landroidx/constraintlayout/widget/a;-><init>()V

    const/4 v6, 0x7

    const/4 v8, 0x6

    const/4 v10, 0x3

    if-eq v2, v9, :cond_5

    if-eq v2, v5, :cond_4

    const/high16 v11, 0x3f000000    # 0.5f

    const/4 v12, -0x2

    if-eq v2, v10, :cond_3

    .line 29
    aget v2, v4, v7

    invoke-virtual {v1, v2, v0}, Landroidx/constraintlayout/widget/a;->j(II)V

    .line 30
    aget v2, v4, v7

    invoke-virtual {v1, v2, v0}, Landroidx/constraintlayout/widget/a;->g(II)V

    .line 31
    aget v2, v4, v9

    invoke-virtual {v1, v2, v0}, Landroidx/constraintlayout/widget/a;->j(II)V

    .line 32
    aget v2, v4, v9

    invoke-virtual {v1, v2, v0}, Landroidx/constraintlayout/widget/a;->g(II)V

    .line 33
    aget v2, v4, v5

    invoke-virtual {v1, v2, v0}, Landroidx/constraintlayout/widget/a;->j(II)V

    .line 34
    aget v2, v4, v5

    invoke-virtual {v1, v2, v0}, Landroidx/constraintlayout/widget/a;->g(II)V

    .line 35
    aget v2, v4, v10

    invoke-virtual {v1, v2, v0}, Landroidx/constraintlayout/widget/a;->j(II)V

    .line 36
    aget v2, v4, v10

    invoke-virtual {v1, v2, v0}, Landroidx/constraintlayout/widget/a;->g(II)V

    .line 37
    invoke-static {}, Ll/kkl0;->i()I

    move-result v0

    .line 38
    new-instance v2, Landroidx/constraintlayout/widget/Guideline;

    iget-object v13, p0, Ll/xur;->l:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {v13}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v13

    invoke-direct {v2, v13}, Landroidx/constraintlayout/widget/Guideline;-><init>(Landroid/content/Context;)V

    .line 39
    invoke-virtual {v2, v0}, Landroid/view/View;->setId(I)V

    .line 40
    new-instance v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    invoke-direct {v13, v12, v12}, Landroidx/constraintlayout/widget/ConstraintLayout$a;-><init>(II)V

    .line 41
    iput v7, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->S:I

    .line 42
    invoke-virtual {v2, v13}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 43
    invoke-virtual {v2, v11}, Landroidx/constraintlayout/widget/Guideline;->setGuidelinePercent(F)V

    .line 44
    iget-object v11, p0, Ll/xur;->l:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {v11, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 45
    aget v2, v4, v7

    invoke-virtual {v1, v2, v8, v7, v8}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 46
    aget v2, v4, v7

    aget v11, v4, v9

    invoke-virtual {v1, v2, v6, v11, v8}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 47
    aget v2, v4, v7

    invoke-virtual {v1, v2, v10, v7, v10}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 48
    aget v2, v4, v7

    invoke-virtual {v1, v2, v3, v0, v10}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 49
    aget v2, v4, v9

    aget v11, v4, v7

    invoke-virtual {v1, v2, v8, v11, v6}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 50
    aget v2, v4, v9

    invoke-virtual {v1, v2, v6, v7, v6}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 51
    aget v2, v4, v9

    invoke-virtual {v1, v2, v10, v7, v10}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 52
    aget v2, v4, v9

    invoke-virtual {v1, v2, v3, v0, v10}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 53
    aget v2, v4, v5

    invoke-virtual {v1, v2, v8, v7, v8}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 54
    aget v2, v4, v5

    aget v9, v4, v10

    invoke-virtual {v1, v2, v6, v9, v8}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 55
    aget v2, v4, v5

    invoke-virtual {v1, v2, v10, v0, v3}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 56
    aget v2, v4, v5

    invoke-virtual {v1, v2, v3, v7, v3}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 57
    aget v2, v4, v10

    aget v5, v4, v5

    invoke-virtual {v1, v2, v8, v5, v6}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 58
    aget v2, v4, v10

    invoke-virtual {v1, v2, v6, v7, v6}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 59
    aget v2, v4, v10

    invoke-virtual {v1, v2, v10, v0, v3}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 60
    aget v0, v4, v10

    invoke-virtual {v1, v0, v3, v7, v3}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 61
    iget-object p0, p0, Ll/xur;->l:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {v1, p0}, Landroidx/constraintlayout/widget/a;->a(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    return-void

    .line 62
    :cond_3
    aget v2, v4, v7

    invoke-virtual {v1, v2, v0}, Landroidx/constraintlayout/widget/a;->j(II)V

    .line 63
    aget v2, v4, v7

    invoke-virtual {v1, v2, v0}, Landroidx/constraintlayout/widget/a;->g(II)V

    .line 64
    aget v2, v4, v9

    invoke-virtual {v1, v2, v0}, Landroidx/constraintlayout/widget/a;->j(II)V

    .line 65
    aget v2, v4, v9

    invoke-virtual {v1, v2, v0}, Landroidx/constraintlayout/widget/a;->g(II)V

    .line 66
    aget v2, v4, v5

    invoke-virtual {v1, v2, v0}, Landroidx/constraintlayout/widget/a;->j(II)V

    .line 67
    aget v2, v4, v5

    invoke-virtual {v1, v2, v0}, Landroidx/constraintlayout/widget/a;->g(II)V

    .line 68
    invoke-static {}, Ll/kkl0;->i()I

    move-result v0

    .line 69
    new-instance v2, Landroidx/constraintlayout/widget/Guideline;

    iget-object v13, p0, Ll/xur;->l:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {v13}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v13

    invoke-direct {v2, v13}, Landroidx/constraintlayout/widget/Guideline;-><init>(Landroid/content/Context;)V

    .line 70
    invoke-virtual {v2, v0}, Landroid/view/View;->setId(I)V

    .line 71
    new-instance v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    invoke-direct {v13, v12, v12}, Landroidx/constraintlayout/widget/ConstraintLayout$a;-><init>(II)V

    .line 72
    iput v7, v13, Landroidx/constraintlayout/widget/ConstraintLayout$a;->S:I

    .line 73
    invoke-virtual {v2, v13}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 74
    invoke-virtual {v2, v11}, Landroidx/constraintlayout/widget/Guideline;->setGuidelinePercent(F)V

    .line 75
    iget-object v11, p0, Ll/xur;->l:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {v11, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 76
    aget v2, v4, v7

    invoke-virtual {v1, v2, v8, v7, v8}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 77
    aget v2, v4, v7

    invoke-virtual {v1, v2, v6, v7, v6}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 78
    aget v2, v4, v7

    invoke-virtual {v1, v2, v10, v7, v10}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 79
    aget v2, v4, v7

    invoke-virtual {v1, v2, v3, v0, v10}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 80
    aget v2, v4, v9

    invoke-virtual {v1, v2, v8, v7, v8}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 81
    aget v2, v4, v9

    aget v11, v4, v5

    invoke-virtual {v1, v2, v6, v11, v8}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 82
    aget v2, v4, v9

    invoke-virtual {v1, v2, v10, v0, v3}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 83
    aget v2, v4, v9

    invoke-virtual {v1, v2, v3, v7, v3}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 84
    aget v2, v4, v5

    aget v9, v4, v9

    invoke-virtual {v1, v2, v8, v9, v6}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 85
    aget v2, v4, v5

    invoke-virtual {v1, v2, v6, v7, v6}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 86
    aget v2, v4, v5

    invoke-virtual {v1, v2, v10, v0, v3}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 87
    aget v0, v4, v5

    invoke-virtual {v1, v0, v3, v7, v3}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 88
    iget-object p0, p0, Ll/xur;->l:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {v1, p0}, Landroidx/constraintlayout/widget/a;->a(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    return-void

    .line 89
    :cond_4
    aget v2, v4, v7

    invoke-virtual {v1, v2, v0}, Landroidx/constraintlayout/widget/a;->j(II)V

    .line 90
    aget v2, v4, v7

    invoke-virtual {v1, v2, v0}, Landroidx/constraintlayout/widget/a;->g(II)V

    .line 91
    aget v2, v4, v9

    invoke-virtual {v1, v2, v0}, Landroidx/constraintlayout/widget/a;->j(II)V

    .line 92
    aget v2, v4, v9

    invoke-virtual {v1, v2, v0}, Landroidx/constraintlayout/widget/a;->g(II)V

    .line 93
    aget v0, v4, v7

    invoke-virtual {v1, v0, v8, v7, v8}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 94
    aget v0, v4, v7

    invoke-virtual {v1, v0, v10, v7, v10}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 95
    aget v0, v4, v7

    invoke-virtual {v1, v0, v3, v7, v3}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 96
    aget v0, v4, v7

    aget v2, v4, v9

    invoke-virtual {v1, v0, v6, v2, v8}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 97
    aget v0, v4, v9

    invoke-virtual {v1, v0, v6, v7, v6}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 98
    aget v0, v4, v9

    invoke-virtual {v1, v0, v10, v7, v10}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 99
    aget v0, v4, v9

    invoke-virtual {v1, v0, v3, v7, v3}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 100
    aget v0, v4, v9

    aget v2, v4, v7

    invoke-virtual {v1, v0, v8, v2, v6}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 101
    iget-object p0, p0, Ll/xur;->l:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {v1, p0}, Landroidx/constraintlayout/widget/a;->a(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    return-void

    .line 102
    :cond_5
    aget v2, v4, v7

    invoke-virtual {v1, v2, v0}, Landroidx/constraintlayout/widget/a;->j(II)V

    .line 103
    aget v2, v4, v7

    invoke-virtual {v1, v2, v0}, Landroidx/constraintlayout/widget/a;->g(II)V

    .line 104
    aget v0, v4, v7

    invoke-virtual {v1, v0, v8, v7, v8}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 105
    aget v0, v4, v7

    invoke-virtual {v1, v0, v6, v7, v6}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 106
    aget v0, v4, v7

    invoke-virtual {v1, v0, v10, v7, v10}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 107
    aget v0, v4, v7

    invoke-virtual {v1, v0, v3, v7, v3}, Landroidx/constraintlayout/widget/a;->e(IIII)V

    .line 108
    iget-object p0, p0, Ll/xur;->l:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {v1, p0}, Landroidx/constraintlayout/widget/a;->a(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    :cond_6
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/xur;->k:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final G(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/yur;->a(Ll/xur;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public H(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/yur;->b(Ll/xur;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public I(Ll/avr;)V
    .locals 0

    .line 1
    return-void
.end method

.method public K(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xur;->p:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->E()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ll/xur;->r()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/avr;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/xur;->I(Ll/avr;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/xur;->H(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public m(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->m(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/xur;->G(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public bridge synthetic n(Ll/y8s;)V
    .locals 0

    .line 1
    check-cast p1, Ll/avr;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/xur;->I(Ll/avr;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public w()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->w()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
