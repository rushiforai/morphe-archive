.class public Ll/oh80;
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

.method public static a(Lcom/p1/mobile/putong/core/ui/PlayerView;Landroid/view/View;)V
    .locals 6

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
    move-result-object v0

    .line 9
    check-cast v0, Landroid/view/TextureView;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/PlayerView;->a:Landroid/view/TextureView;

    .line 12
    .line 13
    sget v0, Ll/edc0;->h0:I

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Lv/VDraweeView;

    .line 20
    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/PlayerView;->b:Lv/VDraweeView;

    .line 22
    .line 23
    move-object v0, p1

    .line 24
    check-cast v0, Landroid/view/ViewGroup;

    .line 25
    .line 26
    const/4 v2, 0x2

    .line 27
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    check-cast v3, Lv/VProgressBar;

    .line 32
    .line 33
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/PlayerView;->c:Lv/VProgressBar;

    .line 34
    .line 35
    const/4 v3, 0x3

    .line 36
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v4

    .line 40
    check-cast v4, Lv/VLinear;

    .line 41
    .line 42
    iput-object v4, p0, Lcom/p1/mobile/putong/core/ui/PlayerView;->d:Lv/VLinear;

    .line 43
    .line 44
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v4

    .line 48
    check-cast v4, Landroid/view/ViewGroup;

    .line 49
    .line 50
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object v4

    .line 54
    check-cast v4, Lv/VText;

    .line 55
    .line 56
    iput-object v4, p0, Lcom/p1/mobile/putong/core/ui/PlayerView;->e:Lv/VText;

    .line 57
    .line 58
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 59
    .line 60
    .line 61
    move-result-object v4

    .line 62
    check-cast v4, Landroid/view/ViewGroup;

    .line 63
    .line 64
    const/4 v5, 0x1

    .line 65
    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 66
    .line 67
    .line 68
    move-result-object v4

    .line 69
    check-cast v4, Lv/VProgressBar;

    .line 70
    .line 71
    iput-object v4, p0, Lcom/p1/mobile/putong/core/ui/PlayerView;->f:Lv/VProgressBar;

    .line 72
    .line 73
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    check-cast v3, Landroid/view/ViewGroup;

    .line 78
    .line 79
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    check-cast v2, Lv/VText;

    .line 84
    .line 85
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/PlayerView;->g:Lv/VText;

    .line 86
    .line 87
    sget v2, Ll/edc0;->D:I

    .line 88
    .line 89
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    check-cast v2, Lv/VFrame_ColorFilter;

    .line 94
    .line 95
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/PlayerView;->h:Lv/VFrame_ColorFilter;

    .line 96
    .line 97
    sget v2, Ll/edc0;->k3:I

    .line 98
    .line 99
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    check-cast v2, Landroid/widget/ImageView;

    .line 104
    .line 105
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/PlayerView;->i:Landroid/widget/ImageView;

    .line 106
    .line 107
    sget v2, Ll/edc0;->S1:I

    .line 108
    .line 109
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 110
    .line 111
    .line 112
    move-result-object v2

    .line 113
    check-cast v2, Lv/VProgressBar;

    .line 114
    .line 115
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/PlayerView;->j:Lv/VProgressBar;

    .line 116
    .line 117
    sget v2, Ll/edc0;->U2:I

    .line 118
    .line 119
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    check-cast p1, Landroid/widget/ImageView;

    .line 124
    .line 125
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/PlayerView;->k:Landroid/widget/ImageView;

    .line 126
    .line 127
    const/4 p1, 0x5

    .line 128
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    check-cast p1, Landroid/widget/ImageView;

    .line 133
    .line 134
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/PlayerView;->l:Landroid/widget/ImageView;

    .line 135
    .line 136
    const/4 p1, 0x6

    .line 137
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    check-cast p1, Landroid/view/ViewGroup;

    .line 142
    .line 143
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    check-cast p1, Lv/VText;

    .line 148
    .line 149
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/PlayerView;->m:Lv/VText;

    .line 150
    .line 151
    const/4 p1, 0x7

    .line 152
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    check-cast p1, Landroid/widget/TextView;

    .line 157
    .line 158
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/PlayerView;->n:Landroid/widget/TextView;

    .line 159
    .line 160
    return-void
.end method

.method public static b(Lcom/p1/mobile/putong/core/ui/PlayerView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/qec0;->T5:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-static {p0, p1}, Ll/oh80;->a(Lcom/p1/mobile/putong/core/ui/PlayerView;Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method
