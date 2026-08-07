.class public Ll/os;
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

.method public static a(Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;Landroid/view/View;)V
    .locals 4

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->a:Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;

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
    check-cast v1, Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 14
    .line 15
    iput-object v1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Landroid/view/ViewGroup;

    .line 22
    .line 23
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    iput-object v1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->c:Landroid/view/View;

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    check-cast v1, Landroid/view/ViewGroup;

    .line 34
    .line 35
    const/4 v2, 0x1

    .line 36
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    check-cast v1, Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar;

    .line 41
    .line 42
    iput-object v1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->d:Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar;

    .line 43
    .line 44
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    check-cast v1, Landroid/view/ViewGroup;

    .line 49
    .line 50
    const/4 v3, 0x2

    .line 51
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    check-cast v1, Lv/VText;

    .line 56
    .line 57
    iput-object v1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->e:Lv/VText;

    .line 58
    .line 59
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    check-cast v1, Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 64
    .line 65
    iput-object v1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->f:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 66
    .line 67
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    check-cast v1, Landroid/view/ViewGroup;

    .line 72
    .line 73
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    check-cast v0, Lv/VImage;

    .line 78
    .line 79
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->g:Lv/VImage;

    .line 80
    .line 81
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    check-cast v0, Landroid/view/ViewGroup;

    .line 86
    .line 87
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    check-cast v0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar;

    .line 92
    .line 93
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->h:Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar;

    .line 94
    .line 95
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    check-cast p1, Landroid/view/ViewGroup;

    .line 100
    .line 101
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    check-cast p1, Lv/VText;

    .line 106
    .line 107
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->i:Lv/VText;

    .line 108
    .line 109
    return-void
.end method
