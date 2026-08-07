.class public Ll/k7s;
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

.method public static a(Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;Landroid/view/View;)V
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
    check-cast v2, Lv/VDraweeView;

    .line 10
    .line 11
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;->c:Lv/VDraweeView;

    .line 12
    .line 13
    const/4 v2, 0x1

    .line 14
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Landroid/view/ViewGroup;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Lv/VImage;

    .line 25
    .line 26
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;->d:Lv/VImage;

    .line 27
    .line 28
    sget v0, Ll/mdc0;->C2:I

    .line 29
    .line 30
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Lv/VDraweeView;

    .line 35
    .line 36
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;->e:Lv/VDraweeView;

    .line 37
    .line 38
    check-cast p1, Landroid/view/ViewGroup;

    .line 39
    .line 40
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    check-cast v0, Landroid/view/ViewGroup;

    .line 45
    .line 46
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Landroid/view/ViewGroup;

    .line 51
    .line 52
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    check-cast v0, Lv/VButton;

    .line 57
    .line 58
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;->f:Lv/VButton;

    .line 59
    .line 60
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    check-cast v0, Landroid/view/ViewGroup;

    .line 65
    .line 66
    const/4 v1, 0x2

    .line 67
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    check-cast v0, Lv/VText;

    .line 72
    .line 73
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;->g:Lv/VText;

    .line 74
    .line 75
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    check-cast v0, Landroid/view/ViewGroup;

    .line 80
    .line 81
    const/4 v3, 0x3

    .line 82
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    check-cast v0, Lv/VText;

    .line 87
    .line 88
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;->h:Lv/VText;

    .line 89
    .line 90
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    check-cast v0, Landroid/view/ViewGroup;

    .line 95
    .line 96
    const/4 v2, 0x4

    .line 97
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    check-cast v0, Lv/VText;

    .line 102
    .line 103
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;->i:Lv/VText;

    .line 104
    .line 105
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    check-cast p1, Lv/VButton;

    .line 110
    .line 111
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;->j:Lv/VButton;

    .line 112
    .line 113
    return-void
.end method

.method public static b(Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/yec0;->n0:I

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
    invoke-static {p0, p1}, Ll/k7s;->a(Lcom/p1/mobile/putong/live/livingroom/other/livecover/LiveCoverAct;Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method
