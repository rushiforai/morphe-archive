.class public Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/WeekStarChampionView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Lv/VLinear;


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

.method public static synthetic h0(Ll/y20;Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftBean;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftBean;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public i0(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/WeekStarGiftTab;Landroid/view/View$OnClickListener;Ll/y20;Z)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/WeekStarGiftTab;",
            "Landroid/view/View$OnClickListener;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/WeekStarChampionView;->e:Lv/VText;

    .line 5
    .line 6
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/WeekStarGiftTab;->title:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/WeekStarChampionView;->d:Lv/VText;

    .line 12
    .line 13
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/WeekStarGiftTab;->date:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/WeekStarChampionView;->g:Lv/VLinear;

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 21
    .line 22
    .line 23
    invoke-static {}, Ll/bnl0;->y0()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    const/high16 v1, 0x42580000    # 54.0f

    .line 28
    .line 29
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    sub-int/2addr v0, v1

    .line 34
    int-to-float v0, v0

    .line 35
    const/high16 v1, 0x40800000    # 4.0f

    .line 36
    .line 37
    div-float/2addr v0, v1

    .line 38
    const/4 v1, 0x0

    .line 39
    move v2, v1

    .line 40
    :goto_0
    const/4 v3, 0x4

    .line 41
    if-ge v2, v3, :cond_2

    .line 42
    .line 43
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    invoke-static {v3}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    sget v4, Ll/yec0;->U9:I

    .line 52
    .line 53
    const/4 v5, 0x0

    .line 54
    invoke-virtual {v3, v4, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/WeekStarChampionItemView;

    .line 59
    .line 60
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    .line 61
    .line 62
    float-to-int v5, v0

    .line 63
    const/high16 v6, 0x42e60000    # 115.0f

    .line 64
    .line 65
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 66
    .line 67
    .line 68
    move-result v6

    .line 69
    invoke-direct {v4, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 70
    .line 71
    .line 72
    if-lez v2, :cond_1

    .line 73
    .line 74
    const/high16 v5, 0x41000000    # 8.0f

    .line 75
    .line 76
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 77
    .line 78
    .line 79
    move-result v5

    .line 80
    iput v5, v4, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 81
    .line 82
    :cond_1
    iget-object v5, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/WeekStarGiftTab;->gifts:Ljava/util/List;

    .line 83
    .line 84
    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v5

    .line 88
    check-cast v5, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftBean;

    .line 89
    .line 90
    new-instance v6, Ll/nwp0;

    .line 91
    .line 92
    invoke-direct {v6, p3, v5}, Ll/nwp0;-><init>(Ll/y20;Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftBean;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {v3, v6}, Lv/VLinear;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v3, v5}, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/WeekStarChampionItemView;->P(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftBean;)V

    .line 99
    .line 100
    .line 101
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/WeekStarChampionView;->g:Lv/VLinear;

    .line 102
    .line 103
    invoke-virtual {v5, v3, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 104
    .line 105
    .line 106
    add-int/lit8 v2, v2, 0x1

    .line 107
    .line 108
    goto :goto_0

    .line 109
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/WeekStarChampionView;->f:Lv/VText;

    .line 110
    .line 111
    if-eqz p4, :cond_3

    .line 112
    .line 113
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 114
    .line 115
    .line 116
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/WeekStarChampionView;->f:Lv/VText;

    .line 117
    .line 118
    const/4 p1, 0x1

    .line 119
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 120
    .line 121
    .line 122
    return-void

    .line 123
    :cond_3
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 124
    .line 125
    .line 126
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/mdc0;->k8:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lv/VText;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/WeekStarChampionView;->d:Lv/VText;

    .line 13
    .line 14
    sget v0, Ll/mdc0;->N6:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lv/VText;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/WeekStarChampionView;->e:Lv/VText;

    .line 23
    .line 24
    sget v0, Ll/mdc0;->j8:I

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lv/VText;

    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/WeekStarChampionView;->f:Lv/VText;

    .line 33
    .line 34
    sget v0, Ll/mdc0;->h8:I

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Lv/VLinear;

    .line 41
    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/WeekStarChampionView;->g:Lv/VLinear;

    .line 43
    .line 44
    return-void
.end method
