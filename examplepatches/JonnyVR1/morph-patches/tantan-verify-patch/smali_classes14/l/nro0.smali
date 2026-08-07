.class public Ll/nro0;
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

.method public static a(Lcom/p1/mobile/putong/live/external/intl/voicesquare/common/VoiceRoomSquareCommonViewModel;Landroid/view/View;)V
    .locals 4

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Landroid/widget/FrameLayout;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/voicesquare/common/VoiceRoomSquareCommonViewModel;->h:Landroid/widget/FrameLayout;

    .line 5
    .line 6
    sget v0, Ll/ldc0;->j:I

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Lcom/google/android/material/appbar/AppBarLayout;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/voicesquare/common/VoiceRoomSquareCommonViewModel;->i:Lcom/google/android/material/appbar/AppBarLayout;

    .line 15
    .line 16
    sget v0, Ll/ldc0;->w1:I

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Lv/VText;

    .line 23
    .line 24
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/voicesquare/common/VoiceRoomSquareCommonViewModel;->j:Lv/VText;

    .line 25
    .line 26
    move-object v0, p1

    .line 27
    check-cast v0, Landroid/view/ViewGroup;

    .line 28
    .line 29
    const/4 v1, 0x0

    .line 30
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    check-cast v2, Landroid/view/ViewGroup;

    .line 35
    .line 36
    const/4 v3, 0x1

    .line 37
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    check-cast v2, Landroidx/recyclerview/widget/RecyclerView;

    .line 42
    .line 43
    iput-object v2, p0, Lcom/p1/mobile/putong/live/external/intl/voicesquare/common/VoiceRoomSquareCommonViewModel;->k:Landroidx/recyclerview/widget/RecyclerView;

    .line 44
    .line 45
    sget v2, Ll/ldc0;->C2:I

    .line 46
    .line 47
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    check-cast p1, Landroidx/core/widget/NestedScrollView;

    .line 52
    .line 53
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/voicesquare/common/VoiceRoomSquareCommonViewModel;->l:Landroidx/core/widget/NestedScrollView;

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    check-cast p1, Landroid/view/ViewGroup;

    .line 60
    .line 61
    const/4 v0, 0x2

    .line 62
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    check-cast p1, Landroid/view/ViewGroup;

    .line 67
    .line 68
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    check-cast p1, Landroid/view/ViewGroup;

    .line 73
    .line 74
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    check-cast p1, Lcom/p1/mobile/putong/live/base/view/EmptyView;

    .line 79
    .line 80
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/voicesquare/common/VoiceRoomSquareCommonViewModel;->m:Lcom/p1/mobile/putong/live/base/view/EmptyView;

    .line 81
    .line 82
    return-void
.end method

.method public static b(Lcom/p1/mobile/putong/live/external/intl/voicesquare/common/VoiceRoomSquareCommonViewModel;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/xec0;->e0:I

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
    invoke-static {p0, p1}, Ll/nro0;->a(Lcom/p1/mobile/putong/live/external/intl/voicesquare/common/VoiceRoomSquareCommonViewModel;Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method
