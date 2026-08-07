.class public Ll/qpk;
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

.method public static a(Ll/ppk;Landroid/view/View;)V
    .locals 3

    .line 1
    sget v0, Ll/edc0;->T3:I

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/widget/FrameLayout;

    .line 8
    .line 9
    iput-object v0, p0, Ll/ppk;->a:Landroid/widget/FrameLayout;

    .line 10
    .line 11
    move-object v0, p1

    .line 12
    check-cast v0, Landroid/view/ViewGroup;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    check-cast v2, Lcom/p1/mobile/putong/core/newui/group/SwipeRefreshList;

    .line 20
    .line 21
    iput-object v2, p0, Ll/ppk;->b:Lcom/p1/mobile/putong/core/newui/group/SwipeRefreshList;

    .line 22
    .line 23
    sget v2, Ll/edc0;->c0:I

    .line 24
    .line 25
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    check-cast v2, Lv/VLinear;

    .line 30
    .line 31
    iput-object v2, p0, Ll/ppk;->c:Lv/VLinear;

    .line 32
    .line 33
    sget v2, Ll/edc0;->q4:I

    .line 34
    .line 35
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    check-cast v2, Lv/VRecyclerView;

    .line 40
    .line 41
    iput-object v2, p0, Ll/ppk;->d:Lv/VRecyclerView;

    .line 42
    .line 43
    sget v2, Ll/edc0;->b4:I

    .line 44
    .line 45
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    check-cast v2, Landroid/widget/LinearLayout;

    .line 50
    .line 51
    iput-object v2, p0, Ll/ppk;->e:Landroid/widget/LinearLayout;

    .line 52
    .line 53
    sget v2, Ll/edc0;->H:I

    .line 54
    .line 55
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    check-cast v2, Lv/VText;

    .line 60
    .line 61
    iput-object v2, p0, Ll/ppk;->f:Lv/VText;

    .line 62
    .line 63
    sget v2, Ll/edc0;->p4:I

    .line 64
    .line 65
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    check-cast p1, Lv/VRecyclerView;

    .line 70
    .line 71
    iput-object p1, p0, Ll/ppk;->g:Lv/VRecyclerView;

    .line 72
    .line 73
    const/4 p1, 0x1

    .line 74
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    check-cast v2, Lv/VRelative;

    .line 79
    .line 80
    iput-object v2, p0, Ll/ppk;->h:Lv/VRelative;

    .line 81
    .line 82
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    check-cast v2, Landroid/view/ViewGroup;

    .line 87
    .line 88
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    check-cast v1, Lv/VImage;

    .line 93
    .line 94
    iput-object v1, p0, Ll/ppk;->i:Lv/VImage;

    .line 95
    .line 96
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    check-cast v0, Landroid/view/ViewGroup;

    .line 101
    .line 102
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    check-cast p1, Lv/VText;

    .line 107
    .line 108
    iput-object p1, p0, Ll/ppk;->j:Lv/VText;

    .line 109
    .line 110
    return-void
.end method

.method public static b(Ll/ppk;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/qec0;->j:I

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
    invoke-static {p0, p1}, Ll/qpk;->a(Ll/ppk;Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method
