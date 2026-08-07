.class public Ll/j090;
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

.method public static a(Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;Landroid/view/View;)V
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
    check-cast v1, Lv/VFrame;

    .line 9
    .line 10
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->b:Lv/VFrame;

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Landroid/view/ViewGroup;

    .line 17
    .line 18
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Lv/VProgressBar;

    .line 23
    .line 24
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->c:Lv/VProgressBar;

    .line 25
    .line 26
    const/4 v1, 0x1

    .line 27
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    check-cast v2, Landroid/widget/RelativeLayout;

    .line 32
    .line 33
    iput-object v2, p0, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->d:Landroid/widget/RelativeLayout;

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
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    check-cast v2, Lv/VImage;

    .line 46
    .line 47
    iput-object v2, p0, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->e:Lv/VImage;

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
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    check-cast v2, Lv/VText;

    .line 60
    .line 61
    iput-object v2, p0, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->f:Lv/VText;

    .line 62
    .line 63
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    check-cast v2, Landroid/view/ViewGroup;

    .line 68
    .line 69
    const/4 v3, 0x2

    .line 70
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    check-cast v2, Lv/VButton;

    .line 75
    .line 76
    iput-object v2, p0, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->g:Lv/VButton;

    .line 77
    .line 78
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    check-cast v2, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultCountDownView;

    .line 83
    .line 84
    iput-object v2, p0, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->h:Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultCountDownView;

    .line 85
    .line 86
    const/4 v2, 0x3

    .line 87
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    check-cast v3, Landroid/widget/FrameLayout;

    .line 92
    .line 93
    iput-object v3, p0, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->i:Landroid/widget/FrameLayout;

    .line 94
    .line 95
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 96
    .line 97
    .line 98
    move-result-object v3

    .line 99
    check-cast v3, Landroid/view/ViewGroup;

    .line 100
    .line 101
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    check-cast v0, Lv/VPullUpRecyclerView;

    .line 106
    .line 107
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->j:Lv/VPullUpRecyclerView;

    .line 108
    .line 109
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    check-cast p1, Landroid/view/ViewGroup;

    .line 114
    .line 115
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    check-cast p1, Landroid/widget/TextView;

    .line 120
    .line 121
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->k:Landroid/widget/TextView;

    .line 122
    .line 123
    return-void
.end method

.method public static b(Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/pec0;->g1:I

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
    invoke-static {p0, p1}, Ll/j090;->a(Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method
