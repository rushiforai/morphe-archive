.class public Ll/bcf0;
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

.method public static a(Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;Landroid/view/View;)V
    .locals 4

    .line 1
    check-cast p1, Landroid/view/ViewGroup;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    check-cast v1, Lcom/p1/mobile/putong/live/base/view/DialogTitleBar;

    .line 9
    .line 10
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->a:Lcom/p1/mobile/putong/live/base/view/DialogTitleBar;

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, Landroid/widget/FrameLayout;

    .line 18
    .line 19
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->b:Landroid/widget/FrameLayout;

    .line 20
    .line 21
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    check-cast v2, Landroid/view/ViewGroup;

    .line 26
    .line 27
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    check-cast v2, Lv/VPager;

    .line 32
    .line 33
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->c:Lv/VPager;

    .line 34
    .line 35
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    check-cast v2, Landroid/view/ViewGroup;

    .line 40
    .line 41
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    check-cast v2, Lv/VImage;

    .line 46
    .line 47
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->d:Lv/VImage;

    .line 48
    .line 49
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    check-cast v2, Landroid/view/ViewGroup;

    .line 54
    .line 55
    const/4 v3, 0x2

    .line 56
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    check-cast v2, Lv/VImage;

    .line 61
    .line 62
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->e:Lv/VImage;

    .line 63
    .line 64
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    check-cast v2, Landroidx/recyclerview/widget/RecyclerView;

    .line 69
    .line 70
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->f:Landroidx/recyclerview/widget/RecyclerView;

    .line 71
    .line 72
    const/4 v2, 0x4

    .line 73
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    check-cast v3, Landroid/widget/FrameLayout;

    .line 78
    .line 79
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->g:Landroid/widget/FrameLayout;

    .line 80
    .line 81
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 82
    .line 83
    .line 84
    move-result-object v3

    .line 85
    check-cast v3, Landroid/view/ViewGroup;

    .line 86
    .line 87
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/MedalProgressView;

    .line 92
    .line 93
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->h:Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/MedalProgressView;

    .line 94
    .line 95
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    check-cast v0, Landroid/view/ViewGroup;

    .line 100
    .line 101
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    check-cast v0, Lv/VText;

    .line 106
    .line 107
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->i:Lv/VText;

    .line 108
    .line 109
    const/4 v0, 0x5

    .line 110
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    check-cast p1, Lv/VText;

    .line 115
    .line 116
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->j:Lv/VText;

    .line 117
    .line 118
    return-void
.end method
