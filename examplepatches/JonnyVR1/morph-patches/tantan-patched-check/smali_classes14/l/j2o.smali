.class public Ll/j2o;
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

.method public static a(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;Landroid/view/View;)V
    .locals 2

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
    move-result-object v0

    .line 9
    check-cast v0, Lv/VPullDownRefreshLayout;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;->z:Lv/VPullDownRefreshLayout;

    .line 12
    .line 13
    sget v0, Ll/ldc0;->j:I

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Lcom/google/android/material/appbar/AppBarLayout;

    .line 20
    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;->A:Lcom/google/android/material/appbar/AppBarLayout;

    .line 22
    .line 23
    sget v0, Ll/ldc0;->w1:I

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Lv/VText;

    .line 30
    .line 31
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;->B:Lv/VText;

    .line 32
    .line 33
    sget v0, Ll/ldc0;->k1:I

    .line 34
    .line 35
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Lv/VRecyclerView;

    .line 40
    .line 41
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;->C:Lv/VRecyclerView;

    .line 42
    .line 43
    sget v0, Ll/ldc0;->C2:I

    .line 44
    .line 45
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    check-cast v0, Landroidx/core/widget/NestedScrollView;

    .line 50
    .line 51
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;->D:Landroidx/core/widget/NestedScrollView;

    .line 52
    .line 53
    sget v0, Ll/ldc0;->w0:I

    .line 54
    .line 55
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    check-cast v0, Lv/VImage;

    .line 60
    .line 61
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;->E:Lv/VImage;

    .line 62
    .line 63
    sget v0, Ll/ldc0;->Q1:I

    .line 64
    .line 65
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    check-cast v0, Lv/VText;

    .line 70
    .line 71
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;->F:Lv/VText;

    .line 72
    .line 73
    sget v0, Ll/ldc0;->B2:I

    .line 74
    .line 75
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    check-cast v0, Landroidx/core/widget/NestedScrollView;

    .line 80
    .line 81
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;->G:Landroidx/core/widget/NestedScrollView;

    .line 82
    .line 83
    sget v0, Ll/ldc0;->v0:I

    .line 84
    .line 85
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    check-cast v0, Lv/VImage;

    .line 90
    .line 91
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;->H:Lv/VImage;

    .line 92
    .line 93
    sget v0, Ll/ldc0;->h2:I

    .line 94
    .line 95
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    check-cast v0, Lv/VText;

    .line 100
    .line 101
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;->I:Lv/VText;

    .line 102
    .line 103
    sget v0, Ll/ldc0;->j2:I

    .line 104
    .line 105
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    check-cast p1, Lv/VText;

    .line 110
    .line 111
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;->J:Lv/VText;

    .line 112
    .line 113
    return-void
.end method

.method public static b(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/xec0;->U:I

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
    invoke-static {p0, p1}, Ll/j2o;->a(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method
