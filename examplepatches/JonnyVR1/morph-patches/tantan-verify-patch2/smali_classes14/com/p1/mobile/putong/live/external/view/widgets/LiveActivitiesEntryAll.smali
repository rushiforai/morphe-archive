.class public Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAnimBackground;

.field public b:Landroid/widget/FrameLayout;

.field public c:Landroid/widget/FrameLayout;

.field public d:Landroid/view/View;

.field public e:Landroid/widget/FrameLayout;

.field public f:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public g:Lv/VDraweeView;

.field public h:Landroid/widget/LinearLayout;

.field public i:Lv/VMarqueeText;

.field public j:Lv/VText;

.field public k:Lv/VFrame;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/hrr;->a(Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b(II)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;->d:Landroid/view/View;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x5

    .line 8
    if-eq p1, v0, :cond_0

    .line 9
    .line 10
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;->b:Landroid/widget/FrameLayout;

    .line 11
    .line 12
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;->h:Landroid/widget/LinearLayout;

    .line 16
    .line 17
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    check-cast p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 22
    .line 23
    if-eq p2, v0, :cond_1

    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;->g:Lv/VDraweeView;

    .line 26
    .line 27
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;->f:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 31
    .line 32
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    const/high16 v0, 0x42aa0000    # 85.0f

    .line 36
    .line 37
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    iput v0, p1, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    const/high16 v0, 0x42e80000    # 116.0f

    .line 45
    .line 46
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    iput v0, p1, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 51
    .line 52
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;->h:Landroid/widget/LinearLayout;

    .line 53
    .line 54
    invoke-virtual {v0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 55
    .line 56
    .line 57
    const/4 p1, 0x2

    .line 58
    const/4 v0, 0x1

    .line 59
    if-ne p2, p1, :cond_3

    .line 60
    .line 61
    invoke-static {}, Ll/mbs;->h()Z

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;->h:Landroid/widget/LinearLayout;

    .line 66
    .line 67
    if-eqz p1, :cond_2

    .line 68
    .line 69
    const/high16 p1, 0x42200000    # 40.0f

    .line 70
    .line 71
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    invoke-static {p2, p1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 76
    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_2
    const/high16 p1, 0x42300000    # 44.0f

    .line 80
    .line 81
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    invoke-static {p2, p1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 86
    .line 87
    .line 88
    goto :goto_1

    .line 89
    :cond_3
    if-eqz p2, :cond_4

    .line 90
    .line 91
    if-ne p2, v0, :cond_5

    .line 92
    .line 93
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;->h:Landroid/widget/LinearLayout;

    .line 94
    .line 95
    const/high16 p2, 0x425c0000    # 55.0f

    .line 96
    .line 97
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 98
    .line 99
    .line 100
    move-result p2

    .line 101
    invoke-static {p1, p2}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 102
    .line 103
    .line 104
    :cond_5
    :goto_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;->k:Lv/VFrame;

    .line 105
    .line 106
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 107
    .line 108
    .line 109
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;->j:Lv/VText;

    .line 110
    .line 111
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 112
    .line 113
    .line 114
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;->i:Lv/VMarqueeText;

    .line 115
    .line 116
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 117
    .line 118
    .line 119
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;->i:Lv/VMarqueeText;

    .line 120
    .line 121
    const/high16 p1, 0x41600000    # 14.0f

    .line 122
    .line 123
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextSize(F)V

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
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/mbs;->h()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;->i:Lv/VMarqueeText;

    .line 14
    .line 15
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method
