.class public Ll/l9v;
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

.method public static a(Ll/k9v;Landroid/view/View;)V
    .locals 4

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
    check-cast v2, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 10
    .line 11
    iput-object v2, p0, Ll/k9v;->a:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

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
    iput-object v3, p0, Ll/k9v;->b:Landroid/widget/FrameLayout;

    .line 21
    .line 22
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    check-cast v3, Landroid/view/ViewGroup;

    .line 27
    .line 28
    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    check-cast v1, Lv/navigationbar/VNavigationBar;

    .line 33
    .line 34
    iput-object v1, p0, Ll/k9v;->c:Lv/navigationbar/VNavigationBar;

    .line 35
    .line 36
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Landroid/view/ViewGroup;

    .line 41
    .line 42
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Lv/VPullDownRefreshLayout;

    .line 47
    .line 48
    iput-object v0, p0, Ll/k9v;->d:Lv/VPullDownRefreshLayout;

    .line 49
    .line 50
    sget v0, Ll/ldc0;->K1:I

    .line 51
    .line 52
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    check-cast v0, Lcom/google/android/material/appbar/AppBarLayout;

    .line 57
    .line 58
    iput-object v0, p0, Ll/k9v;->e:Lcom/google/android/material/appbar/AppBarLayout;

    .line 59
    .line 60
    sget v0, Ll/ldc0;->o0:I

    .line 61
    .line 62
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    check-cast v0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;

    .line 67
    .line 68
    iput-object v0, p0, Ll/k9v;->f:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;

    .line 69
    .line 70
    sget v0, Ll/ldc0;->L1:I

    .line 71
    .line 72
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    check-cast v0, Lcom/google/android/material/tabs/TabLayout;

    .line 77
    .line 78
    iput-object v0, p0, Ll/k9v;->g:Lcom/google/android/material/tabs/TabLayout;

    .line 79
    .line 80
    sget v0, Ll/ldc0;->v2:I

    .line 81
    .line 82
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    check-cast p1, Lcom/p1/mobile/putong/live/external/view/widgets/NoSaveStateViewPager;

    .line 87
    .line 88
    iput-object p1, p0, Ll/k9v;->h:Lcom/p1/mobile/putong/live/external/view/widgets/NoSaveStateViewPager;

    .line 89
    .line 90
    return-void
.end method

.method public static b(Ll/k9v;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/xec0;->f2:I

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
    invoke-static {p0, p1}, Ll/l9v;->a(Ll/k9v;Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method
