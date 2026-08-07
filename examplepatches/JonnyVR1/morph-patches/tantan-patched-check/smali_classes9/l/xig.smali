.class public Ll/xig;
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

.method public static a(Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/FansWeekLeaderBoardContentView;Landroid/view/View;)V
    .locals 4

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/FansWeekLeaderBoardContentView;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/FansWeekLeaderBoardContentView;->d:Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/FansWeekLeaderBoardContentView;

    .line 5
    .line 6
    move-object v0, p1

    .line 7
    check-cast v0, Landroid/view/ViewGroup;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    check-cast v2, Landroid/widget/RadioGroup;

    .line 15
    .line 16
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/FansWeekLeaderBoardContentView;->e:Landroid/widget/RadioGroup;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    check-cast v2, Landroid/view/ViewGroup;

    .line 23
    .line 24
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    check-cast v2, Landroid/widget/RadioButton;

    .line 29
    .line 30
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/FansWeekLeaderBoardContentView;->f:Landroid/widget/RadioButton;

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    check-cast v2, Landroid/view/ViewGroup;

    .line 37
    .line 38
    const/4 v3, 0x1

    .line 39
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    check-cast v2, Landroid/widget/RadioButton;

    .line 44
    .line 45
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/FansWeekLeaderBoardContentView;->g:Landroid/widget/RadioButton;

    .line 46
    .line 47
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    check-cast v2, Lv/VImage;

    .line 52
    .line 53
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/FansWeekLeaderBoardContentView;->h:Lv/VImage;

    .line 54
    .line 55
    const/4 v2, 0x2

    .line 56
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    check-cast v0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    .line 61
    .line 62
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/FansWeekLeaderBoardContentView;->i:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    .line 63
    .line 64
    sget v0, Ll/mdc0;->W4:I

    .line 65
    .line 66
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;

    .line 71
    .line 72
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/FansWeekLeaderBoardContentView;->j:Landroidx/recyclerview/widget/RecyclerView;

    .line 73
    .line 74
    check-cast p1, Landroid/view/ViewGroup;

    .line 75
    .line 76
    const/4 v0, 0x3

    .line 77
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    check-cast v2, Landroid/widget/FrameLayout;

    .line 82
    .line 83
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/FansWeekLeaderBoardContentView;->k:Landroid/widget/FrameLayout;

    .line 84
    .line 85
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    check-cast p1, Landroid/view/ViewGroup;

    .line 90
    .line 91
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/VirtualFansBoardMeItemView;

    .line 96
    .line 97
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/FansWeekLeaderBoardContentView;->l:Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/VirtualFansBoardMeItemView;

    .line 98
    .line 99
    return-void
.end method
