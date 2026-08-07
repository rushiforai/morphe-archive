.class public Ll/b6l;
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

.method public static a(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardDefaultButtons;Landroid/view/View;)V
    .locals 4

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardDefaultButtons;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardDefaultButtons;->a:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardDefaultButtons;

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
    check-cast v1, Lv/VFrame_FlipContainer;

    .line 14
    .line 15
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardDefaultButtons;->b:Lv/VFrame_FlipContainer;

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
    check-cast v1, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

    .line 28
    .line 29
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardDefaultButtons;->c:Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, Landroid/view/ViewGroup;

    .line 36
    .line 37
    const/4 v2, 0x1

    .line 38
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    check-cast v1, Lv/VText;

    .line 43
    .line 44
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardDefaultButtons;->d:Lv/VText;

    .line 45
    .line 46
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    check-cast v1, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

    .line 51
    .line 52
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardDefaultButtons;->e:Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

    .line 53
    .line 54
    const/4 v1, 0x2

    .line 55
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    check-cast v1, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

    .line 60
    .line 61
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardDefaultButtons;->f:Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

    .line 62
    .line 63
    const/4 v1, 0x3

    .line 64
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    check-cast v3, Landroid/widget/FrameLayout;

    .line 69
    .line 70
    iput-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardDefaultButtons;->g:Landroid/widget/FrameLayout;

    .line 71
    .line 72
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    check-cast v3, Landroid/view/ViewGroup;

    .line 77
    .line 78
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    check-cast v3, Lcom/tantan/library/svga/SVGAnimationView;

    .line 83
    .line 84
    iput-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardDefaultButtons;->h:Lcom/tantan/library/svga/SVGAnimationView;

    .line 85
    .line 86
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    check-cast v3, Landroid/view/ViewGroup;

    .line 91
    .line 92
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 93
    .line 94
    .line 95
    move-result-object v3

    .line 96
    check-cast v3, Lv/VFrame_FlipContainer;

    .line 97
    .line 98
    iput-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardDefaultButtons;->i:Lv/VFrame_FlipContainer;

    .line 99
    .line 100
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 101
    .line 102
    .line 103
    move-result-object v3

    .line 104
    check-cast v3, Landroid/view/ViewGroup;

    .line 105
    .line 106
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 107
    .line 108
    .line 109
    move-result-object v3

    .line 110
    check-cast v3, Landroid/view/ViewGroup;

    .line 111
    .line 112
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 113
    .line 114
    .line 115
    move-result-object v3

    .line 116
    check-cast v3, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

    .line 117
    .line 118
    iput-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardDefaultButtons;->j:Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

    .line 119
    .line 120
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    check-cast v1, Landroid/view/ViewGroup;

    .line 125
    .line 126
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    check-cast v1, Landroid/view/ViewGroup;

    .line 131
    .line 132
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 133
    .line 134
    .line 135
    move-result-object v1

    .line 136
    check-cast v1, Lv/VText;

    .line 137
    .line 138
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardDefaultButtons;->k:Lv/VText;

    .line 139
    .line 140
    const/4 v1, 0x4

    .line 141
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 142
    .line 143
    .line 144
    move-result-object v2

    .line 145
    check-cast v2, Lv/VFrame;

    .line 146
    .line 147
    iput-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardDefaultButtons;->l:Lv/VFrame;

    .line 148
    .line 149
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    check-cast p1, Landroid/view/ViewGroup;

    .line 154
    .line 155
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 156
    .line 157
    .line 158
    move-result-object p1

    .line 159
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

    .line 160
    .line 161
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardDefaultButtons;->m:Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

    .line 162
    .line 163
    return-void
.end method
