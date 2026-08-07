.class public Ll/hts;
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

.method public static a(Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardItem;Landroid/view/View;)V
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
    check-cast v1, Lv/VDraweeView;

    .line 9
    .line 10
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardItem;->d:Lv/VDraweeView;

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
    check-cast v2, Lv/VImage;

    .line 18
    .line 19
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardItem;->e:Lv/VImage;

    .line 20
    .line 21
    const/4 v2, 0x2

    .line 22
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    check-cast v3, Landroid/widget/RelativeLayout;

    .line 27
    .line 28
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardItem;->f:Landroid/widget/RelativeLayout;

    .line 29
    .line 30
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    check-cast v3, Landroid/view/ViewGroup;

    .line 35
    .line 36
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    check-cast v3, Lv/VImage;

    .line 41
    .line 42
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardItem;->g:Lv/VImage;

    .line 43
    .line 44
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    check-cast v2, Landroid/view/ViewGroup;

    .line 49
    .line 50
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    check-cast v2, Lv/VText;

    .line 55
    .line 56
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardItem;->h:Lv/VText;

    .line 57
    .line 58
    const/4 v2, 0x3

    .line 59
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    check-cast v2, Lv/VText;

    .line 64
    .line 65
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardItem;->i:Lv/VText;

    .line 66
    .line 67
    const/4 v2, 0x4

    .line 68
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    check-cast v3, Landroid/widget/LinearLayout;

    .line 73
    .line 74
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardItem;->j:Landroid/widget/LinearLayout;

    .line 75
    .line 76
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 77
    .line 78
    .line 79
    move-result-object v3

    .line 80
    check-cast v3, Landroid/view/ViewGroup;

    .line 81
    .line 82
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    check-cast v0, Lv/VDraweeView;

    .line 87
    .line 88
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardItem;->k:Lv/VDraweeView;

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
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    check-cast v0, Lv/VDraweeView;

    .line 101
    .line 102
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardItem;->l:Lv/VDraweeView;

    .line 103
    .line 104
    const/4 v0, 0x5

    .line 105
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    check-cast v0, Lv/VText;

    .line 110
    .line 111
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardItem;->m:Lv/VText;

    .line 112
    .line 113
    const/4 v0, 0x6

    .line 114
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    check-cast v0, Lv/VText;

    .line 119
    .line 120
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardItem;->n:Lv/VText;

    .line 121
    .line 122
    const/4 v0, 0x7

    .line 123
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    check-cast v0, Landroidx/constraintlayout/widget/Group;

    .line 128
    .line 129
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardItem;->o:Landroidx/constraintlayout/widget/Group;

    .line 130
    .line 131
    const/16 v0, 0x8

    .line 132
    .line 133
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    check-cast p1, Lv/VText;

    .line 138
    .line 139
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardItem;->p:Lv/VText;

    .line 140
    .line 141
    return-void
.end method
