.class public Ll/lqp;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;Landroid/view/View;)V
    .locals 5

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Landroid/view/ViewGroup;

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    check-cast v2, Lv/navigationbar/VNavigationBar;

    .line 10
    .line 11
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->b:Lv/navigationbar/VNavigationBar;

    .line 12
    .line 13
    const/4 v2, 0x1

    .line 14
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    check-cast v3, Landroid/widget/FrameLayout;

    .line 19
    .line 20
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->c:Landroid/widget/FrameLayout;

    .line 21
    .line 22
    const/4 v3, 0x2

    .line 23
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    check-cast v4, Lv/VLinear;

    .line 28
    .line 29
    iput-object v4, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->d:Lv/VLinear;

    .line 30
    .line 31
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Landroid/view/ViewGroup;

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Lv/VPullDownRefreshLayout;

    .line 42
    .line 43
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->e:Lv/VPullDownRefreshLayout;

    .line 44
    .line 45
    sget v0, Ll/adc0;->wf:I

    .line 46
    .line 47
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    check-cast v0, Lv/VPullUpRecyclerView;

    .line 52
    .line 53
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->f:Lv/VPullUpRecyclerView;

    .line 54
    .line 55
    check-cast p1, Landroid/view/ViewGroup;

    .line 56
    .line 57
    const/4 v0, 0x3

    .line 58
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 59
    .line 60
    .line 61
    move-result-object v4

    .line 62
    check-cast v4, Lv/VLinear;

    .line 63
    .line 64
    iput-object v4, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->g:Lv/VLinear;

    .line 65
    .line 66
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 67
    .line 68
    .line 69
    move-result-object v4

    .line 70
    check-cast v4, Landroid/view/ViewGroup;

    .line 71
    .line 72
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    check-cast v1, Landroid/widget/ImageView;

    .line 77
    .line 78
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->h:Landroid/widget/ImageView;

    .line 79
    .line 80
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    check-cast v0, Landroid/view/ViewGroup;

    .line 85
    .line 86
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    check-cast v0, Lv/VText;

    .line 91
    .line 92
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->i:Lv/VText;

    .line 93
    .line 94
    const/4 v0, 0x4

    .line 95
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    check-cast v1, Landroid/widget/FrameLayout;

    .line 100
    .line 101
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->j:Landroid/widget/FrameLayout;

    .line 102
    .line 103
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    check-cast p1, Landroid/view/ViewGroup;

    .line 108
    .line 109
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    check-cast p1, Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundTextView;

    .line 114
    .line 115
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->k:Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundTextView;

    .line 116
    .line 117
    return-void
.end method

.method public static b(Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/kec0;->Y5:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-static {p0, p1}, Ll/lqp;->a(Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method
