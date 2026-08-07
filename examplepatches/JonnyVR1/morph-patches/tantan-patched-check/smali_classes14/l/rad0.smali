.class public Ll/rad0;
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

.method public static a(Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipDialogContentView;Landroid/view/View;)V
    .locals 3

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipDialogContentView;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipDialogContentView;->d:Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipDialogContentView;

    .line 5
    .line 6
    check-cast p1, Landroid/view/ViewGroup;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipDialogContentView;->e:Landroid/view/View;

    .line 14
    .line 15
    const/4 v1, 0x2

    .line 16
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Lcom/p1/mobile/putong/live/base/view/DialogTitleBar;

    .line 21
    .line 22
    iput-object v1, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipDialogContentView;->f:Lcom/p1/mobile/putong/live/base/view/DialogTitleBar;

    .line 23
    .line 24
    const/4 v1, 0x3

    .line 25
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, Landroidx/recyclerview/widget/RecyclerView;

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipDialogContentView;->g:Landroidx/recyclerview/widget/RecyclerView;

    .line 32
    .line 33
    const/4 v1, 0x4

    .line 34
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    check-cast v2, Landroid/widget/FrameLayout;

    .line 39
    .line 40
    iput-object v2, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipDialogContentView;->h:Landroid/widget/FrameLayout;

    .line 41
    .line 42
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    check-cast v1, Landroid/view/ViewGroup;

    .line 47
    .line 48
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    check-cast v0, Lv/VButton;

    .line 53
    .line 54
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipDialogContentView;->i:Lv/VButton;

    .line 55
    .line 56
    const/4 v0, 0x5

    .line 57
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    check-cast v0, Lv/VImage;

    .line 62
    .line 63
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipDialogContentView;->j:Lv/VImage;

    .line 64
    .line 65
    const/4 v0, 0x6

    .line 66
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    check-cast v0, Lv/VText;

    .line 71
    .line 72
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipDialogContentView;->k:Lv/VText;

    .line 73
    .line 74
    const/4 v0, 0x7

    .line 75
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    check-cast v0, Lv/VText;

    .line 80
    .line 81
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipDialogContentView;->l:Lv/VText;

    .line 82
    .line 83
    const/16 v0, 0x8

    .line 84
    .line 85
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    check-cast p1, Landroidx/constraintlayout/widget/Group;

    .line 90
    .line 91
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipDialogContentView;->m:Landroidx/constraintlayout/widget/Group;

    .line 92
    .line 93
    return-void
.end method
